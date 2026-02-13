# Malloc Lab

动态内存分配器实验。

## 实验概述

Malloc Lab 要求学生实现自己的动态内存分配器，提供类似标准 C 库的 `malloc`、`free` 和 `realloc` 功能。

学生需要：
- 实现显式或隐式空闲链表
- 选择合适的放置策略（首次适配、最佳适配等）
- 实现合并策略（立即合并、延迟合并）
- 平衡空间利用率和吞吐量

通过这个实验，学生将：
- 深入理解动态内存管理
- 学习数据结构和算法在系统编程中的应用
- 掌握内存对齐和指针操作
- 理解空间利用率和性能的权衡

## 📄 实验文档

- [实验说明文档 (PDF)](/labs/malloclab/malloclab.pdf)
- <a href="/labs/malloclab/README" target="_blank">README</a>

## 💻 实验文件

### 主要文件

- **mm.c** - 需要实现的内存分配器（学生文件）<a href="/labs/malloclab/mm.c" target="_blank">查看</a>
- **mm.h** - 内存分配器接口 <a href="/labs/malloclab/mm.h" target="_blank">查看</a>
- **mdriver.c** - 测试驱动程序源代码 <a href="/labs/malloclab/mdriver.c" target="_blank">查看</a>

### 支持文件

- **memlib.c/h** - 模拟内存系统 [查看源码](/labs/malloclab/memlib.c)
- **config.h** - 配置参数 <a href="/labs/malloclab/config.h" target="_blank">查看</a>
- **Makefile** - 编译配置文件 <a href="/labs/malloclab/Makefile" target="_blank">查看</a>

### 计时工具

- **clock.c/h** - 时钟函数 [查看源码](/labs/malloclab/clock.c)
- **fcyc.c/h** - 周期计数器 [查看源码](/labs/malloclab/fcyc.c)
- **ftimer.c/h** - 计时器 [查看源码](/labs/malloclab/ftimer.c)
- **fsecs.c/h** - 秒计时 [查看源码](/labs/malloclab/fsecs.c)

## 🚀 快速开始

```bash
# 编译分配器
make

# 运行测试（默认测试集）
./mdriver

# 详细输出
./mdriver -v

# 使用特定 trace 文件测试
./mdriver -f traces/short1-bal.rep

# 检查堆一致性
./mdriver -c
```

## 🔑 需要实现的函数

### 核心函数
- `mm_init()` - 初始化分配器
- `mm_malloc(size)` - 分配一个大小为 size 字节的块
- `mm_free(ptr)` - 释放指针 ptr 指向的块
- `mm_realloc(ptr, size)` - 重新分配块的大小

### 可选辅助函数
- `extend_heap()` - 扩展堆
- `coalesce()` - 合并空闲块
- `find_fit()` - 查找合适的空闲块
- `place()` - 在空闲块中放置请求的块

## 🏗️ 实现方法

### 隐式空闲链表
- 简单实现
- 低空间开销
- 分配时间较长

### 显式空闲链表
- 更快的分配
- 需要额外的指针空间
- 推荐方法

### 分离空闲链表
- 最佳性能
- 复杂度高
- 高级实现

## 💡 优化技巧

### 提高利用率
- 实现边界标记
- 即时合并空闲块
- 最小块大小优化
- 分割策略优化

### 提高吞吐量
- 使用显式空闲链表
- 优化搜索算法
- 减少外部碎片
- 实现快速适配策略

## 📊 性能评分

评分基于两个指标：
1. **空间利用率** - 已分配的有效载荷占总堆大小的比例
2. **吞吐量** - 每秒完成的操作数（ops/sec）

总分 = 权重利用率 + 权重吞吐量

## ⚠️ 注意事项

- 块必须对齐到 8 字节边界
- 不能修改 `mm.h`、`mdriver.c`、`memlib.*` 等文件
- 不能使用标准库的 malloc 相关函数
- 实现必须是线程安全的（高级要求）

## 📦 下载全部文件

- [查看 GitHub 目录](https://github.com/rwangrwang31/CSAPP-Labs/tree/main/labs/malloclab)
- 下载整个仓库后在 `labs/malloclab/` 目录中查找
