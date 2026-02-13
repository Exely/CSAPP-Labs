# Data Lab 笔记

这一个 lab 主要涉及了位运算，补码和浮点数等内容。完成 lab 不仅要实现函数的功能，还要求仅用规定的操作符，操作符数目也在限定范围内，这一点比较坑，因为这样代码可读性不高，当然难度也大了。所有题目都限定在32位系统中。     
题目列表在 [bits.c](../labs/data/bits.c) 中，完成解答可以用 lab 自带的 dlc 检查操作符是否合法，可以 `make btest` 检查解答是否正确，具体可以参见 [README](../labs/data/README)    
参考资料：       
[马天猫的CS学习之旅](https://zhuanlan.zhihu.com/deeplearningcat)

## 1.位操作

1.bitAnd

```C
/* 
 * bitAnd - x&y using only ~ and | 
 *   Example: bitAnd(6, 5) = 4
 *   Legal ops: ~ |
 *   Max ops: 8
 *   Rating: 1
 */
int bitAnd(int x, int y) {
  return ~((~x)|(~y));
}
```

第一题要求只用非运算 ~ 和或运算 | 实现和 & 运算，可以使用
[德摩根定律](https://zh.wikipedia.org/wiki/%E5%BE%B7%E6%91%A9%E6%A0%B9%E5%AE%9A%E5%BE%8B)       

2.getByte

```C
/* 
 * getByte - Extract byte n from word x
 *   Bytes numbered from 0 (LSB) to 3 (MSB)
 *   Examples: getByte(0x12345678,1) = 0x56
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2
 */
int getByte(int x, int n) {
  int mask=0xff;
  return (x>>(n<<3))&mask;
}
```

第二题是从 x 中提取出第 i 个字节（i=0,1，2,3），方法就是将那个字节移位至最低位，然后用屏蔽码 `0xff` 提取就可以了；       

3.logicalShift
```C
/* 
 * logicalShift - shift x to the right by n, using a logical shift
 *   Can assume that 0 <= n <= 31
 *   Examples: logicalShift(0x87654321,4) = 0x08765432
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3 
 */
int logicalShift(int x, int n) {
  int mask=((0x1<<(32+~n))+~0)|(0x1<<(32+~n));
  return (x>>n)&mask;
/*  int c=((0x1<<31>>31)^0x1)<<31;
  return ((x>>n)^(c>>n)); it's wrong.
*/
/*return ~((~x)>>n); it's wrong.
*/ 
}
```

第三题要求实现逻辑右移，对于有符号的 `int` ，C 语言默认的移位方式是算术右移，就是右移时在高位扩展符号位，这里我们需要扩展的符号位都设置为 0 ,可以构造一个屏蔽码屏蔽 `x>>n` 中的非扩展的位，用 & 实现目的。   
但这里要注意 C 语言对移位位数超出自身长度的行为是未定义的，因此在这里构造屏蔽码时不能使得移位位数超过了32或是小于0，我这段代码为了避免这种情况的发生，将屏蔽码分了最高位和其他位两部分构造，直接使用 `((0x1<<(33+~n))+~0)` 构造的屏蔽码在 n=0 将会无法确定。    
这里 `32+~n` 表示了 31-n ，可以由补码的运算性质 `-x=~x+1` 得到，同时这里我在注释里写了两个我最初写的 bug 。      

4.bitCount

```C
/*
 * bitCount - returns count of number of 1's in word
 *   Examples: bitCount(5) = 2, bitCount(7) = 3
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 40
 *   Rating: 4
 */
int bitCount(int x) {
  int _mask1=(0x55)|((0x55)<<8);
  int _mask2=(0x33)|((0x33)<<8);
  int _mask3=(0x0f)|((0x0f)<<8);
  int mask1=(_mask1)|(_mask1<<16);
  int mask2=(_mask2)|(_mask2<<16);
  int mask3=(_mask3)|(_mask3<<16);
  int mask4=(0xff)|(0xff<<16);
  int mask5=(0xff)|(0xff<<8);
  int ans=(x&mask1)+((x>>1)&mask1);
  ans=(ans&mask2)+((ans>>2)&mask2);
  ans=(ans&mask3)+((ans>>4)&mask3);
  ans=(ans&mask4)+((ans>>8)&mask4);
  ans=(ans&mask5)+((ans>>16)&mask5);
  return ans;
}
```

这题好难T_T，应该是这个 lab 里最难的了吧；     
题目意思就是要统计一个32位的 `int` 里的 `1` 的个数，但是只能使用40个操作符，直接扫一遍字的话操作符就大大超过规定数了；    
这里构造了五个常数，分别是 `0x55555555，0x33333333，0x0f0f0f0f，0x00ff00ff，0x0000ffff`，就是分别间隔了1个0,2个0,4个0,8个0和16个0,利用这五个常数就能依次计算出五个值，第一个值每两位的值为 x 的对应的两个位的和（即这两位中 `1` 的数目），第二个值每四位是第一个值对应的四位中两个两位的和（即原 x 中 `1`的数目），依次类推最后一个值就是结果了；    
怎么理解呢，可以看到这里构造的五个常数的间隔可以刚好使得只提取 n 位，移位之后再提取相邻 n 位（n=1,2,4,8,16），并且（考虑最大值可知）这两个 n 位加和后不会超出 n 位，使得 x 中的 `1` 一步步加和成最终的结果，可以举一个例子，若要求 1001 中 `1` 的数目，用`(1001&0101)+((1001>>1)&0101)`,就能将每相邻一位加和成一个两位，成 0101，再用`(0101&0011)+((0101>>2)&0011)`，就将每两位加和了，得到 0010 ,就是最终的结果。      

5.bang

```C
/* 
 * bang - Compute !x without using !
 *   Examples: bang(3) = 0, bang(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4 
 */
int bang(int x) {
  x=(x>>16)|x;
  x=(x>>8)|x;
  x=(x>>4)|x;
  x=(x>>2)|x;
  x=(x>>1)|x;
  return ~x&0x1;
}
```

这题要求仅用规定的操作符来实现！运算，对 0 运算就得到 1,对非 0 就得到 0；也就是如果 x 的位中含有 1 就返回 0 ,这里运用移位后取或将 x 中的位一步步「折叠」 到了第一位上，然后判断第一位就可以了，这种「折叠」的方法很有趣，值得一看：）  

## 2.补码

6.tmin

```C
/* 
 * tmin - return minimum two's complement integer 
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 *   Rating: 1
 */
int tmin(void) {
  return 0x1<<31;/*tmin==~tmax*/
}
```

这题返回补码最小值，注意到 `tmin==~tmax`，补码负数表示部分和正数是不对称的，最小值的绝对值是最大值的绝对值加1。    

7.fitsBits

```C
/* 
 * fitsBits - return 1 if x can be represented as an 
 *  n-bit, two's complement integer.
 *   1 <= n <= 32
 *   Examples: fitsBits(5,3) = 0, fitsBits(-4,3) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int fitsBits(int x, int n) {
  int c=33+~n;
  int t=(x<<c)>>c;
  return !(x^t);
}
```

这题题目意思是判断 x 能否用一个 n 位的补码表示，能的话就返回 1,开始我没看懂题目…举个例子，101 是不能用 3 位补码表示的，因为 3 位最高位是符号位，最大只能表示 011,注意到这里 x 是32位的，不能直接右移的；   
要用 n 位的补码表示，x 只能是两种情况： `00…0|0|(n-1)位` 或是 `11…1|1|(n-1)位` ，这样 32 位的补码才会与 n 位的补码值相同，这里的方法就是将 x 左移（32-n）再右移回去，这样就能得到那两种情况的值，再判断这样操作之后是否与原来的 x 相等，就解决问题了；    
这里由补码性质，`33+~n` 等于 `32-n` 。      

8.divpwr2

```C
/* 
 * divpwr2 - Compute x/(2^n), for 0 <= n <= 30
 *  Round toward zero
 *   Examples: divpwr2(15,1) = 7, divpwr2(-33,4) = -2
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int divpwr2(int x, int n) {
  int bias=(x>>31)&((0x1<<n)+~0);
  return (x+bias)>>n;
}
```

这题计算 x/(2^n) ，注意不能直接右移，直接右移是向下舍入的，题目要求是向零舍入，也就是正数向下舍入，负数向上舍入，这里参照 CS:APP 书上的做法，给负数加上一个偏正的因子 `(0x1<<n)+~0)` ，判断负数直接看符号位。    

9.negate

```C
/* 
 * negate - return -x 
 *   Example: negate(1) = -1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
int negate(int x) {
  return ~x+1;
}
```

这题求 -x ，直接利用补码的性质 `-x=~x+1` 就可以了。   

10.isPositive

```C
/* 
 * isPositive - return 1 if x > 0, return 0 otherwise 
 *   Example: isPositive(-1) = 0.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 3
 */
int isPositive(int x) {
  return !(!(x))&!((x>>31)&(0x1));
}
```

这里判断是否是正数，直接判断符号位，但是注意要排除 0 的情况！   

11.isLessOrEqual

```C
/* 
 * isLessOrEqual - if x <= y  then return 1, else return 0 
 *   Example: isLessOrEqual(4,5) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isLessOrEqual(int x, int y) {
  int val=!!((x+~y)>>31);
  x=x>>31;
  y=y>>31;
  return (!!x|!y)&((!!x&!y)|(val));
}
```

这题比较两个数的大小，要求判断第一个数是否小于等于第二个数，这里考虑做减法然后判断符号，注意要考虑溢出的情况，这里 `((x+~y))` 表示了 `x-y-1` ，若其结果为负，则 x <= y ;    
这里先判断 x 与 y 的符号，如果 x 为负，y 为正直接返回 1 ,如果 x 为正，y 为正，直接返回 0；然后就是全正数和全负数的减法，这样不会溢出。   

12.ilog2

```C
/*
 * ilog2 - return floor(log base 2 of x), where x > 0
 *   Example: ilog2(16) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 90
 *   Rating: 4
 */
int ilog2(int x) {
  int ans=0;
  ans=(!!(x>>(16)))<<4;
  ans=ans+((!!(x>>(8+ans)))<<3);
  ans=ans+((!!(x>>(4+ans)))<<2);
  ans=ans+((!!(x>>(2+ans)))<<1);
  ans=ans+((!!(x>>(1+ans)))<<0);
  return ans;
}
```

这题求 x 以 2 为底的对数，解法有点难想到，注意到 32 位数的对数最大也不会超过 32,可以写成是 `16*a+8*b+4*c+2*d+e` 这里 a，b，c，d，e 都是 0 或 1，然后通过向右移 16 位就可以判断符号就可以得到 a ，右移 16*a+8 位可得到 b，以此类推得到其他位。   

## 3.浮点数

以下三题是关于浮点数的，可以使用任何操作符和分支语句。   

13.float_neg

```C
/* 
 * float_neg - Return bit-level equivalent of expression -f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representations of
 *   single-precision floating point values.
 *   When argument is NaN, return argument.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 10
 *   Rating: 2
 */
unsigned float_neg(unsigned uf) {
  int c=0x00ffffff;
  if(((uf<<1)^(0xffffffff))<c){
    return uf;
  }else{
    return uf^(0x80000000);
  }
}
```

这题计算 -f ，f 是浮点数，这里直接改浮点数的符号位，但是注意要单独考虑 NaN 的结果。      

14.float_i2f

```C
/* 
 * float_i2f - Return bit-level equivalent of expression (float) x
 *   Result is returned as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point values.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned float_i2f(int x) {
  int n=0xffffffff;
  int e=0; /* exp */
  int tmp=0;
  int tmp2=0;
  int cp=0;
  int cp2=0;
  int sign=x&0x80000000; /* 0x80000000 or 0x0 */

  if(x==0x80000000){
      return 0xcf000000;
    }
  if(x==0){
    return 0;
  }
  if(sign){
      x=-x;
  }

  x=x&0x7fffffff; /* remove sign */
  tmp=x;
  while(tmp){
    tmp=tmp>>1;
    n++;
  }

  x=x-(0x1<<n); /* remove highest bit */
  if(n<24){
    x=x<<(23-n);
  }else{
    tmp2=x>>(n-23);
    cp2=0x1<<(n-24);
    cp=x&((cp2<<1)-1);
    if(cp<cp2){
      x=tmp2;
    }else{
      if(tmp2==0x7fffff){
        x=0;
        n++;
      }else{
        if(cp==cp2){
          x=((tmp2)&0x1)+tmp2;
        }else{
          x=tmp2+1;
         }
       }
     }
   }
  e=(127+n)<<23;
  return sign|e|x;
}
```

这题是将整型转化为浮点数的格式，坑点很多，耗时长。。   
整体思路就是依次计算符号位，阶码值和小数字段，符号位可以直接移位提取，阶码值就是除了符号位外最高位的位数减 1 再加上偏差 127，小数字段可以移位（负数可以化为正数操作）获得，但这问题没这么简单，有很多坑点：   
1.特殊值 0 化为浮点数后是非规格化的，单独考虑；   
2.特殊值 0x80000000 是 2 的整数倍，小数部分用移位的话因为舍入问题会溢出，单独考虑；   
3.要仔细考虑移位过程，左移还是右移能得到 23 位的小数部分；   
4.注意舍入问题，这里需要仔仔细细地考虑清楚，默认使用向偶数舍入，就是舍去部分小于中间值舍弃，大于中间值进位，为中间值如 100 就向偶数舍入：就是看前一位，进位或舍弃总使得前一位为 0；   
5.最后就是操作数目限制在 30 位，我最开始写完的代码有 42 个操作符，应该是算法太麻烦了。。写完最后要一步步简化操作符数目，控制中 30 以内，这里我为了减少操作符数目，写了些可读性很不高的表达式，还用了不少变量如 cp，cp2，简化这些耗了我很多时间。

15.float_twice

```C
/* 
 * float_twice - Return bit-level equivalent of expression 2*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned float_twice(unsigned uf) {
  int tmp=uf;
  int sign=((uf>>31)<<31); /* 0x80000000 or 0x0 */
  int exp=uf&0x7f800000;
  int f=uf&0x7fffff;
  tmp=tmp&0x7fffffff; /* remove sign */
  if((tmp>>23)==0x0){
    tmp=tmp<<1|sign;
    return tmp;
  } else if((tmp>>23)==0xff){
    return uf;
  }  else{
    if((exp>>23)+1==0xff){
      return sign|0x7f800000;
    }else{
      return sign|(((exp>>23)+1)<<23)|f;
    }
  }
  return tmp;
}
```

这题计算浮点数的两倍，无穷大和 NaN 时直接返回，然后分规格化和非规格化两种讨论：    
规格化的情况，阶码值直接加 1 ，但是有个特殊情况就是加一后阶码为 255 时，应返回无穷大；   
非规格化的情况，排除符号位左移一位就可以了，因为这时阶码值为 0 ,两倍就相当于小数字段左移一位，不用担心溢出的情况，溢出时阶码值加 1,小数字段左移一位，相当于整体左移了。

## 小结

整个 lab 总体难度较大，我参考着 Google 花了一周的晚上才完成，真是太菜了。。还是要多学习，提高姿势水平。


 