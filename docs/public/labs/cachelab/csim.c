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