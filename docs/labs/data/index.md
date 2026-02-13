# Data Lab

位运算、补码和浮点数实验。

## 实验概述

Data Lab 要求学生实现简单的逻辑函数、二进制补码和浮点数函数，但需要遵守严格的编码规则：
- 只能使用指定的操作符
- 操作符数量有限制
- 不能使用控制流语句（if、while、for等）
- 不能使用宏、类型转换等

这个实验可以加深对数据在计算机中表示方式的理解。

## 📝 相关笔记

[Data Lab 笔记](/notes/datalab) - 详细的解题思路和知识点总结

## 📄 实验文档

- [实验说明文档 (PDF)](/labs/data/datalab.pdf){target="_blank"}
- <a href="/labs/data/README" target="_blank">README</a>

## 💻 实验文件

### 主要文件

- **bits.c** - 需要完成的函数实现文件 <a href="/labs/data/bits.c" target="_blank">查看</a> | <a href="/labs/data/bits.c" download>下载</a>
- **bits.h** - 函数声明头文件 <a href="/labs/data/bits.h" target="_blank">查看</a>
- **btest.c** - 测试程序源代码 <a href="/labs/data/btest.c" target="_blank">查看</a>

### 工具和脚本

- **dlc** - 数据实验编译器（检查代码规范）<a href="/labs/data/dlc" download>下载</a>
- **driver.pl** - 自动评分脚本 <a href="/labs/data/driver.pl" target="_blank">查看</a>
- **Makefile** - 编译配置文件 <a href="/labs/data/Makefile" target="_blank">查看</a>

### 辅助文件

- **fshow.c** - 浮点数显示工具 <a href="/labs/data/fshow.c" target="_blank">查看</a>
- **ishow.c** - 整数显示工具 <a href="/labs/data/ishow.c" target="_blank">查看</a>
- **tests.c** - 测试用例 <a href="/labs/data/tests.c" target="_blank">查看</a>

## 🚀 快速开始

```bash
# 编译测试程序
make

# 运行测试
./btest

# 使用 dlc 检查代码规范
./dlc bits.c

# 运行自动评分
./driver.pl
```

## 📦 下载全部文件

你可以通过以下方式获取所有实验文件：

- [查看 GitHub 目录](https://github.com/rwangrwang31/CSAPP-Labs/tree/main/labs/data)
- 下载整个仓库后在 `labs/data/` 目录中查找
