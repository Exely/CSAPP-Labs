# Performance Lab 笔记

* 注意：这个 lab 在 CMU 已经被 Cache Lab 取代了。

 这个 lab 要求优化两个关于图像处理的函数，使之运行得尽可能快，仅需要修改 [kernels.c](../labs/perflab/kernels.c) 里的 `rotate` 和 `smooth` 函数（还有填写团队信息等）。然后使用 `unix> make driver ; ./driver ` 运行测试，最初的函数测试得到结果如下：

```txt
  Rotate: 6.3 (rotate: Current working version)
  Smooth: 13.2 (naive_smooth: Naive baseline implementation)
```

参考资料：   
[PerformanceLab实验报告](http://blog.duskdragon.com/2017/07/20/%E6%B7%B1%E5%85%A5%E7%90%86%E8%A7%A3%E8%AE%A1%E7%AE%97%E6%9C%BA%E7%B3%BB%E7%BB%9FPerformanceLab%E5%AE%9E%E9%AA%8C%E6%8A%A5%E5%91%8A/)

## 1. rotate

最初为 rotate 函数为：

```C
void naive_rotate(int dim, pixel *src, pixel *dst) 
{
    int i, j;

    for (i = 0; i < dim; i++)
    for (j = 0; j < dim; j++)
        dst[RIDX(dim-1-j, i, dim)] = src[RIDX(i, j, dim)];
}
```

这里用了一个宏 `#define RIDX(i,j,n) ((i)*(n)+(j))` ，可以看出，这里限制函数性能的主要因素在访存上，经过尝试循环展开发现性能并没有提升= = 。可以采用[分块](http://csapp.cs.cmu.edu/public/waside/waside-blocking.pdf)技术，直接将矩阵分为一块八行八列，性能提升明显。代码如下：

```C
void rotate(int dim, pixel *src, pixel *dst)
{
    int i, j, a, b;
    int sdim = dim - 1;
    for (i = 0; i < dim; i += 8)
    {
        for (j = 0; j < dim; j += 8)
        {
            for (a = i; a < i + 8; a++)
            {
                for (b = j; b < j + 8; b++)
                {
                    dst[RIDX(sdim - b, a, dim)] = src[RIDX(a, b, dim)];
                }
            }
        }
    }
}
```

## 2. smooth

最初的 smooth 函数为：

```C
void naive_smooth(int dim, pixel *src, pixel *dst)
{
    int i, j;

    for (i = 0; i < dim; i++)
        for (j = 0; j < dim; j++)
            dst[RIDX(i, j, dim)] = avg(dim, i, j, src);
}
```

这个函数就是将图像光滑处理，每一个新的像素点的 RGB 值是最初附近最多九块的值的平均。     
尝试减少过程调用后发现性能并没有什么变化，这里限制性能的主要因素是分支预测错误的罚时，因为在循环内部预测错误了很多次。可以考虑先将边界条件计算完，按先计算四个角的值，再计算四条边的值，再计算非边界的点的值的顺序，这样可以避免大量的分支预测，还可以有良好的局部性，而且逻辑还很清楚！    
还有些细节，将判断第一行的循环移到判断非边界点的循环之前，可以改善一点缓存不命中的情况。优化后为如下代码，当然这里还可以进一步优化。参考资料里将宏替换为一个临时变量，代码可读性大大下降=_=

```C
void smooth(int dim, pixel *src, pixel *dst)
{
    int i, j;

    pixel current_pixel;
    pixel *pcurrent_pixel = &current_pixel;

    i = 0;
    j = 0;
    pcurrent_pixel->red =
        (unsigned short)(((int)(src[RIDX(0, 0, dim)].red + src[RIDX(0, 1, dim)].red +
                                src[RIDX(1, 0, dim)].red + src[RIDX(1, 1, dim)].red)) /
                         4);
    pcurrent_pixel->green =
        (unsigned short)(((int)(src[RIDX(0, 0, dim)].green + src[RIDX(0, 1, dim)].green +
                                src[RIDX(1, 0, dim)].green + src[RIDX(1, 1, dim)].green)) /
                         4);
    pcurrent_pixel->blue =
        (unsigned short)(((int)(src[RIDX(0, 0, dim)].blue + src[RIDX(0, 1, dim)].blue +
                                src[RIDX(1, 0, dim)].blue + src[RIDX(1, 1, dim)].blue)) /
                         4);
    dst[RIDX(0, 0, dim)] = current_pixel;

    i = 0;
    j = dim - 1;
    pcurrent_pixel->red =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].red + src[RIDX(i + 1, j, dim)].red +
                                src[RIDX(i, j - 1, dim)].red + src[RIDX(i + 1, j - 1, dim)].red)) /
                         4);
    pcurrent_pixel->green =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].green + src[RIDX(i + 1, j, dim)].green +
                                src[RIDX(i, j - 1, dim)].green + src[RIDX(i + 1, j - 1, dim)].green)) /
                         4);
    pcurrent_pixel->blue =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].blue + src[RIDX(i + 1, j, dim)].blue +
                                src[RIDX(i, j - 1, dim)].blue + src[RIDX(i + 1, j - 1, dim)].blue)) /
                         4);
    dst[RIDX(i, j, dim)] = current_pixel;

    i = dim - 1;
    j = 0;
    pcurrent_pixel->red =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].red + src[RIDX(i - 1, j, dim)].red +
                                src[RIDX(i, j + 1, dim)].red + src[RIDX(i - 1, j + 1, dim)].red)) /
                         4);
    pcurrent_pixel->green =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].green + src[RIDX(i - 1, j, dim)].green +
                                src[RIDX(i, j + 1, dim)].green + src[RIDX(i - 1, j + 1, dim)].green)) /
                         4);
    pcurrent_pixel->blue =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].blue + src[RIDX(i - 1, j, dim)].blue +
                                src[RIDX(i, j + 1, dim)].blue + src[RIDX(i - 1, j + 1, dim)].blue)) /
                         4);
    dst[RIDX(i, j, dim)] = current_pixel;

    i = dim - 1;
    j = dim - 1;
    pcurrent_pixel->red =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].red + src[RIDX(i - 1, j, dim)].red +
                                src[RIDX(i, j - 1, dim)].red + src[RIDX(i - 1, j - 1, dim)].red)) /
                         4);
    pcurrent_pixel->green =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].green + src[RIDX(i - 1, j, dim)].green +
                                src[RIDX(i, j - 1, dim)].green + src[RIDX(i - 1, j - 1, dim)].green)) /
                         4);
    pcurrent_pixel->blue =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].blue + src[RIDX(i - 1, j, dim)].blue +
                                src[RIDX(i, j - 1, dim)].blue + src[RIDX(i - 1, j - 1, dim)].blue)) /
                         4);
    dst[RIDX(i, j, dim)] = current_pixel;

    j = 0;
    for (i = 1; i < dim - 1; i++)
    {
        pcurrent_pixel->red =
            (unsigned short)(((int)(src[RIDX(i - 1, j, dim)].red + src[RIDX(i - 1, j + 1, dim)].red +
                                    src[RIDX(i, j, dim)].red + src[RIDX(i, j + 1, dim)].red +
                                    src[RIDX(i + 1, j, dim)].red + src[RIDX(i + 1, j + 1, dim)].red)) /
                             6);
        pcurrent_pixel->green =
            (unsigned short)(((int)(src[RIDX(i - 1, j, dim)].green + src[RIDX(i - 1, j + 1, dim)].green +
                                    src[RIDX(i, j, dim)].green + src[RIDX(i, j + 1, dim)].green +
                                    src[RIDX(i + 1, j, dim)].green + src[RIDX(i + 1, j + 1, dim)].green)) /
                             6);
        pcurrent_pixel->blue =
            (unsigned short)(((int)(src[RIDX(i - 1, j, dim)].blue + src[RIDX(i - 1, j + 1, dim)].blue +
                                    src[RIDX(i, j, dim)].blue + src[RIDX(i, j + 1, dim)].blue +
                                    src[RIDX(i + 1, j, dim)].blue + src[RIDX(i + 1, j + 1, dim)].blue)) /
                             6);
        dst[RIDX(i, j, dim)] = current_pixel;
    }

    i = dim - 1;
    for (j = 1; j < dim - 1; j++)
    {
        pcurrent_pixel->red =
            (unsigned short)(((int)(src[RIDX(i, j, dim)].red + src[RIDX(i - 1, j, dim)].red +
                                    src[RIDX(i, j - 1, dim)].red + src[RIDX(i - 1, j - 1, dim)].red +
                                    src[RIDX(i, j + 1, dim)].red + src[RIDX(i - 1, j + 1, dim)].red)) /
                             6);
        pcurrent_pixel->green =
            (unsigned short)(((int)(src[RIDX(i, j, dim)].green + src[RIDX(i - 1, j, dim)].green +
                                    src[RIDX(i, j - 1, dim)].green + src[RIDX(i - 1, j - 1, dim)].green +
                                    src[RIDX(i, j + 1, dim)].green + src[RIDX(i - 1, j + 1, dim)].green)) /
                             6);
        pcurrent_pixel->blue =
            (unsigned short)(((int)(src[RIDX(i, j, dim)].blue + src[RIDX(i - 1, j, dim)].blue +
                                    src[RIDX(i, j - 1, dim)].blue + src[RIDX(i - 1, j - 1, dim)].blue +
                                    src[RIDX(i, j + 1, dim)].blue + src[RIDX(i - 1, j + 1, dim)].blue)) /
                             6);
        dst[RIDX(i, j, dim)] = current_pixel;
    }

    j = dim - 1;
    for (i = 1; i < dim - 1; i++)
    {
        pcurrent_pixel->red =
            (unsigned short)(((int)(src[RIDX(i - 1, j, dim)].red + src[RIDX(i - 1, j - 1, dim)].red +
                                    src[RIDX(i, j, dim)].red + src[RIDX(i, j - 1, dim)].red +
                                    src[RIDX(i + 1, j, dim)].red + src[RIDX(i + 1, j - 1, dim)].red)) /
                             6);
        pcurrent_pixel->green =
            (unsigned short)(((int)(src[RIDX(i - 1, j, dim)].green + src[RIDX(i - 1, j - 1, dim)].green +
                                    src[RIDX(i, j, dim)].green + src[RIDX(i, j - 1, dim)].green +
                                    src[RIDX(i + 1, j, dim)].green + src[RIDX(i + 1, j - 1, dim)].green)) /
                             6);
        pcurrent_pixel->blue =
            (unsigned short)(((int)(src[RIDX(i - 1, j, dim)].blue + src[RIDX(i - 1, j - 1, dim)].blue +
                                    src[RIDX(i, j, dim)].blue + src[RIDX(i, j - 1, dim)].blue +
                                    src[RIDX(i + 1, j, dim)].blue + src[RIDX(i + 1, j - 1, dim)].blue)) /
                             6);
        dst[RIDX(i, j, dim)] = current_pixel;
    }

    i = 0;
    for (j = 1; j < dim - 1; j++)
    {
        pcurrent_pixel->red =
            (unsigned short)(((int)(src[RIDX(i, j, dim)].red + src[RIDX(i + 1, j, dim)].red +
                                    src[RIDX(i, j - 1, dim)].red + src[RIDX(i + 1, j - 1, dim)].red +
                                    src[RIDX(i, j + 1, dim)].red + src[RIDX(i + 1, j + 1, dim)].red)) /
                             6);
        pcurrent_pixel->green =
            (unsigned short)(((int)(src[RIDX(i, j, dim)].green + src[RIDX(i + 1, j, dim)].green +
                                    src[RIDX(i, j - 1, dim)].green + src[RIDX(i + 1, j - 1, dim)].green +
                                    src[RIDX(i, j + 1, dim)].green + src[RIDX(i + 1, j + 1, dim)].green)) /
                             6);
        pcurrent_pixel->blue =
            (unsigned short)(((int)(src[RIDX(i, j, dim)].blue + src[RIDX(i + 1, j, dim)].blue +
                                    src[RIDX(i, j - 1, dim)].blue + src[RIDX(i + 1, j - 1, dim)].blue +
                                    src[RIDX(i, j + 1, dim)].blue + src[RIDX(i + 1, j + 1, dim)].blue)) /
                             6);
        dst[RIDX(i, j, dim)] = current_pixel;
    }


    for (i = 1; i < dim - 1; i++)
    {
        for (j = 1; j < dim - 1; j++)
        {
            pcurrent_pixel->red =
                (unsigned short)(((int)(src[RIDX(i + 1, j, dim)].red + src[RIDX(i + 1, j - 1, dim)].red +
                                        src[RIDX(i, j, dim)].red + src[RIDX(i - 1, j, dim)].red +
                                        src[RIDX(i, j - 1, dim)].red + src[RIDX(i - 1, j - 1, dim)].red +
                                        src[RIDX(i, j + 1, dim)].red + src[RIDX(i - 1, j + 1, dim)].red +
                                        src[RIDX(i + 1, j + 1, dim)].red)) /
                                 9);
            pcurrent_pixel->green =
                (unsigned short)(((int)(src[RIDX(i + 1, j, dim)].green + src[RIDX(i + 1, j - 1, dim)].green +
                                        src[RIDX(i, j, dim)].green + src[RIDX(i - 1, j, dim)].green +
                                        src[RIDX(i, j - 1, dim)].green + src[RIDX(i - 1, j - 1, dim)].green +
                                        src[RIDX(i, j + 1, dim)].green + src[RIDX(i - 1, j + 1, dim)].green +
                                        src[RIDX(i + 1, j + 1, dim)].green)) /
                                 9);
            pcurrent_pixel->blue =
                (unsigned short)(((int)(src[RIDX(i + 1, j, dim)].blue + src[RIDX(i + 1, j - 1, dim)].blue +
                                        src[RIDX(i, j, dim)].blue + src[RIDX(i - 1, j, dim)].blue +
                                        src[RIDX(i, j - 1, dim)].blue + src[RIDX(i - 1, j - 1, dim)].blue +
                                        src[RIDX(i, j + 1, dim)].blue + src[RIDX(i - 1, j + 1, dim)].blue +
                                        src[RIDX(i + 1, j + 1, dim)].blue)) /
                                 9);
            dst[RIDX(i, j, dim)] = current_pixel;
        }
    }
}
```

最终测试结果为：

```txt
Summary of Your Best Scores:
  Rotate: 10.4 (rotate: Current working version)
  Smooth: 42.2 (smooth: Current working version)
```

性能有很大的改善。

## 小结

这次 lab 的题目都很开放，一点都没有做的动力= = ，想要更好的优化效果就花时间去做吧！优化第一个函数用了循环分块的方法，这我不是很懂，书上好像也没找到相关内容，还是要多学习！