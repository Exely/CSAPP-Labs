# Bomb Lab

拆除二进制炸弹实验。

## 实验概述

Bomb Lab 要求学生通过反汇编和调试工具来"拆除"一个二进制炸弹。炸弹是一个可执行程序，包含多个阶段（phases），每个阶段都需要输入正确的字符串才能通过。输入错误会导致"爆炸"。

这个实验可以：
- 大大提升阅读汇编代码的能力
- 熟练使用 GDB 等调试工具
- 理解函数调用、栈帧、寄存器使用等概念

## 📝 相关笔记

[Bomb Lab 笔记](/notes/bomb) - 详细的拆弹过程和汇编分析

## 📄 实验文档

- [实验说明文档 (PDF)](/labs/bomb/bomblab.pdf)
- [README](/labs/bomb/README)

## 💻 实验文件

### 主要文件

- **bomb** - 炸弹可执行文件 [下载](/labs/bomb/bomb)
- **bomb.c** - 炸弹源代码（框架代码）[查看](/labs/bomb/bomb.c)

### 答案文件（参考）

- **result.txt** - 拆弹答案 [查看](/labs/bomb/result.txt)

## 🚀 快速开始

```bash
# 运行炸弹（交互式）
./bomb

# 使用答案文件运行
./bomb result.txt

# 使用 GDB 调试
gdb bomb

# 反汇编查看代码
objdump -d bomb > bomb.asm
```

## 🔍 调试技巧

1. 使用 `objdump -d bomb` 反汇编查看所有函数
2. 使用 GDB 设置断点：`break phase_1`
3. 单步执行并查看寄存器：`si`, `info registers`
4. 查看内存内容：`x/s $rdi`（查看字符串）
5. 查看函数调用栈：`backtrace`

## 📦 下载全部文件

- [查看 GitHub 目录](https://github.com/rwangrwang31/CSAPP-Labs/tree/main/labs/bomb)
- 下载整个仓库后在 `labs/bomb/` 目录中查找
