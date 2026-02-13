# Performance Lab

程序性能优化实验。

## 实验概述

Performance Lab 要求学生优化两个计算密集型函数的性能：
- **rotate**: 图像旋转函数
- **smooth**: 图像平滑函数

通过应用各种优化技术（如循环展开、分块、消除不必要的内存引用等），学生需要显著提高这些函数的性能。

这个实验可以帮助学生：
- 理解现代处理器的性能特性
- 掌握程序优化技术
- 学习如何测量和分析程序性能
- 了解缓存、流水线等对性能的影响

**注意**: 这个实验在 CMU 已被 Cache Lab 取代，但仍是很好的性能优化入门练习。

## 📝 相关笔记

[Performance Lab 笔记](/notes/perflab) - 详细的优化思路和技巧

## 📄 实验文档

- [实验说明文档 (PDF)](/labs/perflab/perflab.pdf)
- <a href="/labs/perflab/README" target="_blank">README</a>

## 💻 实验文件

### 主要文件

- **kernels.c** - 需要优化的函数实现 <a href="/labs/perflab/kernels.c" target="_blank">查看</a>
- **driver.c** - 性能测试驱动程序 <a href="/labs/perflab/driver.c" target="_blank">查看</a>
- **driver** - 测试程序（已编译）<a href="/labs/perflab/driver" download>下载</a>

### 工具和库

- **clock.c/h** - 计时工具 [查看源码](/labs/perflab/clock.c)
- **fcyc.c/h** - 周期计数工具 [查看源码](/labs/perflab/fcyc.c)
- **config.h** - 配置文件 <a href="/labs/perflab/config.h" target="_blank">查看</a>
- **defs.h** - 定义文件 <a href="/labs/perflab/defs.h" target="_blank">查看</a>

### 编译文件

- **Makefile** - 编译配置文件 <a href="/labs/perflab/Makefile" target="_blank">查看</a>

## 🚀 快速开始

```bash
# 编译程序
make clean
make

# 运行性能测试
./driver

# 查看详细输出
./driver -v
```

## 🎯 优化技巧

### 通用优化
- 消除不必要的函数调用
- 减少内存访问
- 利用局部性原理
- 循环展开

### Rotate 函数优化
- 分块访问以提高缓存命中率
- 优化访问模式减少缓存不命中
- 利用寄存器存储临时变量

### Smooth 函数优化
- 处理边界条件以减少条件判断
- 循环分块优化缓存使用
- 减少冗余计算

## 📊 性能评分

性能评分基于 CPE（Cycles Per Element）：
- 较低的 CPE 表示更好的性能
- 需要达到特定的性能阈值才能获得满分
- 使用 `-O2` 编译优化

## 📦 下载全部文件

- [查看 GitHub 目录](https://github.com/rwangrwang31/CSAPP-Labs/tree/main/labs/perflab)
- 下载整个仓库后在 `labs/perflab/` 目录中查找
