# README（学生版）

> **CS:APP Data Lab**
>
> 给学生的指导

你的目标是修改你的 bits.c 副本，以便它通过 btest 中的所有测试，并且不违反任何代码准则。

## 0. 文件

| 文件名 | 说明 |
| :--- | :--- |
| Makefile | 构建 btest、fshow 和 ishow |
| README | 本文件 |
| bits.c | 你将要修改和提交的文件 |
| bits.h | 头文件 |
| btest.c | btest 主程序 |
| btest.h | 用于构建 btest |
| decl.c | 用于构建 btest |
| tests.c | 用于构建 btest |
| tests-header.c | 用于构建 btest |
| dlc\* | 规则检查编译器的二进制文件（data lab 编译器） |
| driver.pl\* | 使用 btest 和 dlc 来为 bits.c 自动评分的驱动程序 |
| Driverhdrs.pm | 头文件，用于可选的“击败教授”比赛 |
| fshow.c | 实用代码，用于检查浮点表示 |
| ishow.c | 实用代码，用于检查整数表示 |

## 1. 修改 bits.c 并检查它是否符合 dlc **的要求**

**重要：在你开始之前，请仔细阅读 bits.c 文件中的说明。说明中给出了代码规则，如果你想获得全部分数，你需要遵守它们。**

使用 dlc 编译器（**./dlc**）自动检查 **bits.c** 版本是否符合编码准则：

如果代码没有问题，dlc 将以静默方式返回。否则，它会打印消息，标记出问题。使用 **-e** 参数运行 dlc：

```bash
unix> ./dlc -e bits.c
```

可让 dlc 打印每个函数使用的运算符数目。

一旦有了合法解答，你就可以使用 **./btest** 程序测试它的正确性。

## 2. 使用 btest 测试

此目录中的 Makefile 使用附加代码编译 bits.c 版本，以创建名为 btest 的程序（或测试工具）。

要编译并运行 btest 程序，请键入：

```c
unix> make btest
unix> ./btest [optional cmd line args]
```

每次更改 bits.c 程序时，都需要重新编译 btest。当从一个平台迁移到另一个平台时，你会想删除旧版本 btest 并生成一个新版本。使用以下命令：

```c
unix> make clean
unix> make btest
```

Btest 通过在每个函数上运行数百万个测试用例来测试代码的正确性。它测试了大范围的边缘用例，比如整数谜题的 Tmin（最小有符号数） 和 0，浮点谜题的 0，无限大（inf），以及非规范化和规范化数字之间的边界。当 btest 检测到某个函数中的错误时，它会打印出失败的测试、不正确的结果和预期的结果，然后终止对该函数的测试。

以下是 btest 的命令行选项：

```c
  unix> ./btest -h
  用法: ./btest [-hg] [-r <n>] [-f <name> [-1|-2|-3 <val>]*] [-T <time limit>]
    -1 <val>   指定第一个函数参数
    -2 <val>   指定第二个函数参数
    -3 <val>   指定第三个函数参数
    -f <name>  只测试指定名称的函数
    -g         格式化输出评分，不包含错误信息
    -h         打印该信息
    -r <n>     给所有问题统一的权重 n
    -T <lim>   设置超时限制为 lim
```

样例：

测试所有功能的正确性并打印出错误消息：

```c
unix> ./btest
```

以紧凑的形式测试所有函数，不含错误消息：

```c
unix> ./btest -g
```

测试函数 foo 的正确性：

```c
unix> ./btest -f foo
```

使用特定参数测试函数 foo 的正确性：

```c
unix> ./btest -f foo -1 27 -2 0xf
```

btest 不会检查你的代码是否符合代码准则，需使用 dlc。

## 3. 帮助程序

我们提供了 ishow 和 fshow 程序，分别帮助你破译整数和浮点表示。每个都以一个十进制或十六进制数作为参数。要构建它们，请键入：

```c
unix> make
```

用法样例：

```c
unix> ./ishow 0x27
Hex = 0x00000027,   Signed = 39,    Unsigned = 39

unix> ./ishow 27
Hex = 0x0000001b,   Signed = 27,    Unsigned = 27

unix> ./fshow 0x15213243
Floating point value 3.255334057e-26
Bit Representation 0x15213243, sign = 0, exponent = 0x2a, fraction = 0x213243
Normalized.  +1.2593463659 X 2^(-85)

linux> ./fshow 15213243
Floating point value 2.131829405e-38
Bit Representation 0x00e822bb, sign = 0, exponent = 0x01, fraction = 0x6822bb
Normalized.  +1.8135598898 X 2^(-126)
```

