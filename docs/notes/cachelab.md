# Cache Lab 笔记

这个 lab 分为 Part A 和 Part B ，Part A 要求根据 [traces](../labs/cachelab/traces/) 目录下的 trace 文件，写一个模拟缓存的程序，仅需要修改 [csim.c](../labs/cachelab/csim.c) ；Part B 要求优化矩阵转置函数，减少缓存不命中数，仅需修改 [trans.c](../labs/cachelab/trans.c)，具体要求认真阅读文档。    
参考资料：       
[马天猫的CS学习之旅](https://zhuanlan.zhihu.com/deeplearningcat)    
[blocking](http://csapp.cs.cmu.edu/public/waside/waside-blocking.pdf)


## Part A

在 [csim.c](../labs/cachelab/csim.c) 中写个缓存模拟器，要求没有警告和错误，实现和参考的模拟器一样的功能，实现 `Usage: ./csim [-hv] -s <num> -E <num> -b <num> -t <file>` 。这里的 -t 的参数是 trace 文件，trace 文件包含四种与缓存相关的操作， “I” 是一个指令加载，不会访问模拟的缓存， “L” 是一个数据加载，会访问一次缓存， “S” 是数据存储，和加载一样会访问一次缓存， “M” 是数据修改，相当于一次加载和一次缓存，也就是相当于两次加载。因而可以通过实现加载函数来处理这些操作。     
可以使用一个结构数组 cache[] 来表示缓存，包含 s 个组，每组 E 行，结构数组的每一项都包含一个 tag ，一个有效位和一个访问计数。首先可以使用 `getopt` 函数实现命令行参数的处理，具体 `man 3 getopt` ,然后读取 trace 文件，通过 `fgets` 函数读取每一行，分析出每一行的操作，保存每行的 address 和 size 两个数值，根据 address 和 size 得到偏置位 offset 和 组号 setindex, 标记位 tag，然后按照操作类型调用 Load() 函数。
Load 函数根据所得到组号 setindex , 标记位 tag, 与 cache 数组中的块比较，如果存在该 tag 块就 hit ，如果不命中就 miss ，然后在 cache 数组中添加该 tag ；如果 cache 行满了，就选择一行置换，这里要求使用 LRU (least-recently used) 置换方法。     
这里还实现了 `-h` 和 `-v` 参数，和参考的模拟器有点不同，但不影响结果，代码如下：

```C
#include "cachelab.h"
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

/* 用宏表示的数组的索引，m 行 n 列 */
#define IDX(m, n, E) m *E + n
#define MAXSIZE 30
char input[MAXSIZE]; /* 保存每行的字符串 */
int hit_count = 0, miss_count = 0, eviction_count = 0;
int debug = 0; /* 参数 v 的标记*/

/* 一个缓存行的结构 */
struct sCache {
  int vaild; /* 有效位 */
  int tag;   /* 标记位 */
  int count; /* 最近访问的计数 */
};
typedef struct sCache Cache;

/* Cache last_eviction; */

/* 将 16 进制转为 10 进制数 */
int hextodec(char c);
/* 反转二进制的 b 位，可以不需要 */
/* int converse(int n, int b); */
/* 缓存加载 */
void Load(int count, unsigned int setindex, unsigned int tag,
          unsigned int offset, unsigned int size, double s_pow, unsigned int E,
          double b_pow, Cache *cache);

int main(int argc, char *argv[]) {
  const char *str = "Usage: ./csim [-hv] -s <num> -E <num> -b <num> -t "
                    "<file>\nOptions:\n  -h Print this help message.\n  -v "
                    "Optional verbose flag.\n  -s <num> Number of set index "
                    "bits.\n  -E <num> Number of lines per set.\n  -b <num> "
                    "Number of block offset bits.\n  -t <file> Trace file.\n\n"
                    "Examples :\n linux> ./csim -s 4 -E 1 -b 4 -t "
                    "traces/yi.trace\n linux>  ./csim -v -s 8 -E 2 "
                    "-b 4 -t traces/yi.trace\n ";
  int opt = 0;                      /* 保存参数 */
  unsigned int s = 0, E = 0, b = 0; /* 组的位数 每组行数 和 块数目的位数 */
  double s_pow = 0, b_pow = 0; /* 组数 块数 */
  char *t = "";                /* trace 文件 */
  /*last_eviction.offset = 0;
    last_eviction.tag = -1;
    last_eviction.count = 0;*/

  /* getopt: 每次检查一个命令行参数 */
  while ((opt = getopt(argc, argv, "hvs:E:-b:-t:")) != -1) {
    switch (opt) {
    case 's':
      s = atoi(optarg);
      s_pow = 1 << s; /* 组数 */
      break;
    case 'E':
      E = atoi(optarg); /* 每组行数 */
      break;
    case 'b':
      b = atoi(optarg);
      b_pow = 1 << b; /* 每行块数 */
      break;
    case 't':
      t = optarg; /* trace 文件 */
      break;
    case 'v':
      debug = 1; /* v 标记 */
      break;
    case 'h':
      printf("%s", str); /* help 信息 */
      return 0;
      break;
    default: /* '?' */
      fprintf(stderr, "Usage: %s [-hv] -s <num> -E <num> -b <num> -t <file>\n",
              argv[0]);
      exit(EXIT_FAILURE);
    }
  }

  Cache *cache = (Cache *)malloc(16 * s_pow * E); /* 表示缓存的结构数组 */
  /* bug:
   Cache *cache = (Cache *)malloc(sizeof(Cache) * s * E); */
  for (int i = 0; i < s_pow * E; i++) { /* 初始化 */
    cache[i].vaild = 0;
    cache[i].tag = 0;
    cache[i].count = 0;
  }
  FILE *fp = fopen(t, "r"); /* 打开 trace 文件 */
  int count = 0;            /* 可以当作时间的计数，用于每次访问缓存时更新缓存行的计数 */

  /* 分析 trace 文件的每一行 */
  while (fgets(input, MAXSIZE, fp)) {
    int op = 0; /* 需要访问缓存的次数 */
    unsigned int offset = 0, tag = 0,
                 setindex = 0; /* 缓存行的块索引，tag 标记，组号 */
    char c;
    int cflag = 0;                      /* 是否有逗号的标记 */
    unsigned int address = 0, size = 0; /* 访问缓存的地址和大小 */
    count++;                            /* 计数 */

    for (int i = 0; (c = input[i]) && (c != '\n'); i++) {
      if (c == ' ') { /* 跳过空格 */
        continue;
      } else if (c == 'I') {
        op = 0; /* I 时不访问缓存 */
      } else if (c == 'L') {
        op = 1; /* L 时访问缓存一次 */
      } else if (c == 'S') {
        op = 1; /* S 时访问缓存一次 */
      } else if (c == 'M') {
        op = 2; /* M 时访问缓存两次 */
      } else if (c == ',') {
        cflag = 1; /* 有逗号 */
      } else {
        if (cflag) {          /* 是否有逗号？ */
          size = hextodec(c); /* 有逗号时接下来的字符为 size */
        } else {
          address =
              16 * address + hextodec(c); /* 无逗号时接下来的字符为 address */
        }
      }
    }

    /* 从 address 取出 offset */
    for (int i = 0; i < b; i++) {
      offset = offset * 2 + address % 2;
      address >>= 1;
    }
    /* offset = converse(offset, b); */
    /* 从 address 取出 setindex */
    for (int i = 0; i < s; i++) {
      setindex = setindex * 2 + address % 2;
      address >>= 1;
    }
    // setindex = converse(setindex, s);
    /* 从 address 取出 tag */
    tag = address;

    /* 根据次数访问缓存 */
    if (debug && op != 0) {
      printf("\n%s", input);
    }
    if (op == 1) {
      Load(count, setindex, tag, offset, size, s_pow, E, b_pow, cache);
    }
    /* 为 M 时访问两次缓存，第一次调用加载函数，第二次直接 hit */
    if (op == 2) {
      Load(count, setindex, tag, offset, size, s_pow, E, b_pow, cache);
      hit_count++;
      if (debug) {
        printf(" hit");
      }
    }
    /*
    if (debug) {
      printf("%d %d %d\n", tag, setindex, offset);
    }
    */
  }

  free(cache);
  fclose(fp);
  // optind 记录处理的参数总数
  if (optind > argc) {
    fprintf(stderr, "Expected argument after options\n");
    exit(EXIT_FAILURE);
  }

  if (debug) {
    printf("\n");
  }
  printSummary(hit_count, miss_count, eviction_count);
  return 0;
}

/* 将 16 进制转为 10 进制数 */
int hextodec(char c) {
  if (c >= '0' && c <= '9') {
    return c - '0';
  }
  if (c >= 'A' && c <= 'F') {
    return c - 'A' + 10;
  }
  if (c >= 'a' && c <= 'f') {
    return c - 'a' + 10;
  }
  return 0;
}

/* 反转二进制的 b 位，可以不需要
int converse(int n, int b) {
  int res = 0;
  while (b--) {
    res = res * 2 + n % 2;
    n >>= 1;
  }
  return res;
}
*/

/* 缓存加载 */
void Load(int count, unsigned int setindex, unsigned int tag,
          unsigned int offset, unsigned int size, double s_pow, unsigned int E,
          double b_pow, Cache *cache) {

  /* 根据所得到组号 set , 标记位 tag, 与 cache 数组中的 tag 比较，如果存在该 tag
   * 的缓存行就 hit */
  for (int i = 0; i < E; i++) {
    if (cache[IDX(setindex, i, E)].vaild &&
        tag == cache[IDX(setindex, i, E)].tag) {
      /* bug:
      // cache[IDX(setindex, i, E)].count = 1;
      // cache[IDX(setindex, i, E)].count = 1;
      // if (tag == last_eviction.tag) {
      //  cache[IDX(setindex, i, E)].count = last_eviction.count + count;
      //} else {*/
      cache[IDX(setindex, i, E)].count = count;
      //}
      hit_count++;
      if (debug) {
        printf(" hit");
      }
      return;
    }
  }

  /* 缓存不命中 选择一个空闲的缓存行保存 tag */
  miss_count++;
  if (debug) {
    printf(" miss");
  }
  for (int i = 0; i < E; i++) {
    if (!cache[IDX(setindex, i, E)].vaild) {
      cache[IDX(setindex, i, E)].tag = tag;
      cache[IDX(setindex, i, E)].count = count;
      cache[IDX(setindex, i, E)].vaild = 1;
      return;
    }
  }

  /* 缓存行已满，应淘汰一行，这里要求使用 LRU 算法，通过循环找出最早访问的那块*/
  int mix_index = 0, mix_count = 1000000000;
  for (int i = 0; i < E; i++) {
    if (cache[IDX(setindex, i, E)].count < mix_count) {
      mix_count = cache[IDX(setindex, i, E)].count;
      mix_index = i;
    }
  }

  eviction_count++;
  if (debug) {
    printf(" eviction");
  }

  /*last_eviction.offset = cache[IDX(setindex, mix_index, E)].valid;
   last_eviction.tag = cache[IDX(setindex, mix_index, E)].tag;
   last_eviction.count = cache[IDX(setindex, mix_index, E)].count;*/
  cache[IDX(setindex, mix_index, E)].tag = tag;
  cache[IDX(setindex, mix_index, E)].count = count;
  cache[IDX(setindex, mix_index, E)].vaild = 1;

  return;
}
```

使用 `unix> make && ./test-csim` 或 `unix> make && ./driver.py` 测试得到 Part A 27分满分，测试全部通过。（但这里有一个问题，如果访问缓存的地址超出了缓存行的范围怎么办，这个 lab 不做要求）

## Part B

Part B 要求优化矩阵转置函数，减少缓存 miss 情况，将 miss 数降至可得分的值，仅需修改 [trans.c](../labs/cachelab/trans.c) 。所给的 Cache 包含 32 组，每组 1 行，每行 32 块，共 1024 字节。需要安装 `valgrind` 工具，使用 `unix> make && ./test-trans` 或 `unix> make && ./driver.py` 测试，这里将使用如下三个矩阵作为测试得分点：

- 32 × 32: 得满分要求 miss < 300
- 64 × 64: 得满分要求 miss < 1300
- 61 × 67: 得满分要求 miss < 2000

做法采用分块的方法，参见网络旁注 [blocking](http://csapp.cs.cmu.edu/public/waside/waside-blocking.pdf) ，通过分块可以提高时间局部性和空间局部性。     
对于 32×32 的矩阵，直接分块 8×8 ，注意对角线上的块 A、B 缓存时会发生冲突。在分块内进行转置。对于 61×67 的不规则的矩阵，由于对 miss 要求不高，尝试分块 16×16 可以得到满分。对于 64×64 的矩阵，分块 4×4 ，miss 降到 1699 ，未能达到满分，正在做。代码如下：

```C
void transpose_submit(int M, int N, int A[N][M], int B[M][N]) {
  int i, j, ii, jj, a1, a2, a3, a4, a5, a6, a7, a0;
  if (M == 32) {

    for (i = 0; i < N; i += 8) {
      for (j = 0; j < M; j += 8) {
        for (ii = i; ii < i + 8; ii++) {
          jj = j;
          a0 = A[ii][jj];
          a1 = A[ii][jj + 1];
          a2 = A[ii][jj + 2];
          a3 = A[ii][jj + 3];
          a4 = A[ii][jj + 4];
          a5 = A[ii][jj + 5];
          a6 = A[ii][jj + 6];
          a7 = A[ii][jj + 7];
          B[jj][ii] = a0;
          B[jj + 1][ii] = a1;
          B[jj + 2][ii] = a2;
          B[jj + 3][ii] = a3;
          B[jj + 4][ii] = a4;
          B[jj + 5][ii] = a5;
          B[jj + 6][ii] = a6;
          B[jj + 7][ii] = a7;
        }
      }
    }
  } else if (M == 64) {
    for (i = 0; i < N; i += 4) {
      for (j = 0; j < M; j += 4) {
        for (ii = i; ii < i + 4; ii++) {
          jj = j;
          a0 = A[ii][jj];
          a1 = A[ii][jj + 1];
          a2 = A[ii][jj + 2];
          a3 = A[ii][jj + 3];
          B[jj][ii] = a0;
          B[jj + 1][ii] = a1;
          B[jj + 2][ii] = a2;
          B[jj + 3][ii] = a3;
        }
      }
    }
  } else {
    for (i = 0; i < N; i += 16) {
      for (j = 0; j < M; j += 16) {
        for (ii = i; ii < i + 16 && ii < N; ii++) {
          for (jj = j; jj < j + 16 && jj < M; jj++) {
            a0 = A[ii][jj];
            B[jj][ii] = a0;
          }
        }
      }
    }
  }
}
```