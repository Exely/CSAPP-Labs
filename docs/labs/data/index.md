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

- [实验说明文档 (PDF)](/labs/data/datalab.pdf)
- [README](/labs/data/README)

## 💻 实验文件

### 主要文件

- **bits.c** - 需要完成的函数实现文件 [查看](/labs/data/bits.c) | [下载](/labs/data/bits.c)
- **bits.h** - 函数声明头文件 [查看](/labs/data/bits.h)
- **btest.c** - 测试程序源代码 [查看](/labs/data/btest.c)

### 工具和脚本

- **dlc** - 数据实验编译器（检查代码规范）[下载](/labs/data/dlc)
- **driver.pl** - 自动评分脚本 [查看](/labs/data/driver.pl)
- **Makefile** - 编译配置文件 [查看](/labs/data/Makefile)

### 辅助文件

- **fshow.c** - 浮点数显示工具 [查看](/labs/data/fshow.c)
- **ishow.c** - 整数显示工具 [查看](/labs/data/ishow.c)
- **tests.c** - 测试用例 [查看](/labs/data/tests.c)

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
