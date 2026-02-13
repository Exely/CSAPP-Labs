# Cache Lab

缓存模拟器和矩阵转置优化实验。

## 实验概述

Cache Lab 包含两个部分：

**Part A: 缓存模拟器** - 编写一个 C 程序来模拟缓存的行为，支持不同的缓存配置（组数、每组的行数、块大小）。

**Part B: 矩阵转置优化** - 优化矩阵转置函数，通过最小化缓存不命中来提高性能。

这个实验可以：
- 深入理解缓存的工作原理
- 学习如何编写缓存友好的代码
- 掌握分块优化技术
- 理解缓存参数对性能的影响

## 📝 相关笔记

[Cache Lab 笔记](/notes/cachelab) - 详细的实现思路和优化技巧

## 📄 实验文档

- [实验说明文档 (PDF)](/labs/cachelab/cachelab.pdf)
- [README](/labs/cachelab/README)

## 💻 实验文件

### Part A: 缓存模拟器

- **csim.c** - 缓存模拟器源代码（需要完成）[查看](/labs/cachelab/csim.c)
- **csim-ref** - 参考实现（用于对比）[下载](/labs/cachelab/csim-ref)
- **test-csim** - 测试程序 [下载](/labs/cachelab/test-csim)

### Part B: 矩阵转置

- **trans.c** - 矩阵转置函数（需要优化）[查看](/labs/cachelab/trans.c)
- **test-trans.c** - 测试程序源代码 [查看](/labs/cachelab/test-trans.c)
- **test-trans** - 测试程序 [下载](/labs/cachelab/test-trans)

### 支持文件

- **cachelab.c/h** - 实验框架代码 [查看源码](/labs/cachelab/cachelab.c) | [查看头文件](/labs/cachelab/cachelab.h)
- **driver.py** - 自动评分脚本 [查看](/labs/cachelab/driver.py)
- **Makefile** - 编译配置文件 [查看](/labs/cachelab/Makefile)

### 测试文件

实验包含多个 trace 文件用于测试缓存模拟器（*.trace 文件）

## 🚀 快速开始

### Part A: 缓存模拟器

```bash
# 编译缓存模拟器
make clean
make

# 运行测试
./test-csim

# 手动测试（示例）
./csim -v -s 4 -E 1 -b 4 -t traces/yi.trace

# 参数说明：
# -s: 组索引位数（S = 2^s 组）
# -E: 每组的行数
# -b: 块偏移位数（B = 2^b 字节/块）
# -t: trace 文件路径
# -v: 详细输出
```

### Part B: 矩阵转置

```bash
# 测试矩阵转置
./test-trans -M 32 -N 32  # 测试 32x32
./test-trans -M 64 -N 64  # 测试 64x64
./test-trans -M 61 -N 67  # 测试不规则大小

# 运行完整评分
./driver.py
```

## 🔍 Part A: 实现提示

1. 使用合适的数据结构表示缓存
2. 实现 LRU（最近最少使用）替换策略
3. 正确处理命中、不命中和驱逐
4. 解析 trace 文件格式：
   - `L` - 数据加载
   - `S` - 数据存储
   - `M` - 数据修改（加载+存储）

## 🎯 Part B: 优化技巧

### 32×32 矩阵
- 使用 8×8 分块
- 充分利用缓存行

### 64×64 矩阵
- 使用更小的分块（4×4 或 8×8）
- 注意缓存冲突
- 利用局部变量减少内存访问

### 通用技巧
- 最小化缓存不命中
- 分块大小要适配缓存容量
- 注意缓存行对齐
- 利用临时变量

## 📊 评分标准

**Part A**: 正确性（命中、不命中、驱逐计数）

**Part B**: 缓存不命中次数（越少越好）
- 32×32: 不命中数 < 300
- 64×64: 不命中数 < 1300
- 61×67: 不命中数 < 2000

## 📦 下载全部文件

- [查看 GitHub 目录](https://github.com/rwangrwang31/CSAPP-Labs/tree/main/labs/cachelab)
- 下载整个仓库后在 `labs/cachelab/` 目录中查找
