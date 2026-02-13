# Architecture Lab (Y86-64)

Y86-64 处理器架构实验。

## 实验概述

Architecture Lab 要求学生在 Y86-64 处理器架构的模拟器上工作，完成以下任务：

- **Part A**: 编写和模拟 Y86-64 程序
- **Part B**: 扩展 SEQ 处理器以支持 `iaddq` 指令
- **Part C**: 优化流水线处理器（PIPE）的性能

通过这个实验，学生将：
- 熟悉 Y86-64 指令集架构
- 理解处理器的顺序实现（SEQ）和流水线实现（PIPE）
- 学习硬件控制语言（HCL）
- 掌握程序优化技术

## 📝 相关笔记

[Architecture Lab 笔记](/notes/archlab) - 详细的实验指南和优化技巧

## 📄 实验文档

- [实验说明文档 (PDF)](/labs/archlab/archlab.pdf)
- [模拟器指南 (PDF)](/labs/archlab/simguide.pdf)
- [README](/labs/archlab/README)

## 💻 实验文件

### 模拟器

- **sim.tar** - Y86-64 模拟器源代码包 [下载](/labs/archlab/sim.tar)
- **sim/** - 模拟器目录（已解压）

### 主要文件

- **Makefile** - 编译配置文件 [查看](/labs/archlab/Makefile)

## 🚀 快速开始

```bash
# 解压模拟器（如果需要）
tar -xvf sim.tar

# 进入模拟器目录
cd sim

# 编译模拟器
make clean
make

# 运行 Y86-64 程序
./yis asum.yo

# 测试 SEQ 实现
cd seq
make
./ssim -t ../y86-code/asumi.yo

# 测试 PIPE 实现
cd pipe
make
./psim -t ../y86-code/asumi.yo
```

## 🏗️ 实验部分

### Part A: Y86-64 编程
编写三个 Y86-64 程序：
- `sum.ys` - 链表求和
- `rsum.ys` - 递归链表求和
- `copy.ys` - 数组复制

### Part B: 扩展 SEQ
在 `seq-full.hcl` 中添加 `iaddq` 指令的支持。

### Part C: 优化 PIPE
优化 `ncopy.ys` 程序，使其在流水线处理器上运行得更快。技巧包括：
- 循环展开
- 减少数据冒险
- 优化分支预测

## 📦 下载全部文件

- [查看 GitHub 目录](https://github.com/rwangrwang31/CSAPP-Labs/tree/main/labs/archlab)
- 下载整个仓库后在 `labs/archlab/` 目录中查找
