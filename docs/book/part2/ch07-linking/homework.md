# 家庭作业

## 练习题 7.6

{% tabs %}
{% tab title="练习题 7.6" %}
这道题是关于图 7-5 的 m.o 模块和下面的 swap.c 函数版本的，该函数计算自己被调用的次数：

```c
extern int buf[];

int *bufp0 = &buf[0];
static int *bufp1;

static void incr()
{
    static int count=0;

    count++;
}

void swap()
{
    int temp;

    incr();
    bufp1 = &buf[1];
    temp = *bufp0;
    *bufp0 = *bufp1;
    *bufp1 = temp;
}
```

对于每个 swap.o 中定义和引用的符号，请指出它是否在模块 swap.o 的 .symtab 节中有符号表条目。如果是这样，请指出定义该符号的模块（swap.o 或 m.o）、符号类型（局部、全局或外部）以及它在模块中所处的节（.text、.data 或 .bss）。

| 符号 | swap.o .symtab 条目？ | 符号类型 | 定义符号的模块 | 节 |
| :--- | :--- | :--- | :--- | :--- |
| buf |  |  |  |  |
| bufp0 |  |  |  |  |
| bufp1 |  |  |  |  |
| swap |  |  |  |  |
| temp |  |  |  |  |
| incr |  |  |  |  |
| count |  |  |  |  |
{% endtab %}
{% endtabs %}

## 练习题 7.7

{% tabs %}
{% tab title="练习题 7.7" %}
不改变任何变量名字，修改 7.6.1 节中的 bar5.c，使得 foo5.c 输出 x 和 y 的正确值（也就是整数 15213 和 15212 的十六进制表示）。
{% endtab %}
{% endtabs %}

## 练习题 7.8

{% tabs %}
{% tab title="练习题 7.8" %}
在此题中，REF\(x,i\) → DEF\(x,k\) 表示链接器将任意对模块 i 中符号 x 的引用与模块 k 中符号 x 的定义相关联。在下面每个例子中，用这种符号来说明链接器是如何解析在每个模块中有多重定义的引用的。如果出现链接时错误（规则 1），写“错误”。如果链接器从定义中任意选择一个（规则 3），那么写“未知”。

A.

\(a\) REF\(main.1\) → DEF\(\_\_\_\_.\_\_\)

\(b\) REF\(main.2\) → DEF\(\_\_\_\_.\_\_\)

```c
/* Module 1 */    |     /* Module 2 */
int main()        |     static int main=1[
{                 |     int p2()
}                 |     {
                  |     }
```

B.

\(a\) REF\(x.1\) → DEF\(\_\_\_\_.\_\_\)

\(b\) REF\(x.2\) → DEF\(\_\_\_\_.\_\_\)

```c
/* Module 1 */    |     /* Module 2 */
int x;            |     double x;
void main()       |     int p2()
{                 |     {
}                 |     }
```

C.

\(a\) REF\(x.1\) → DEF\(\_\_\_\_.\_\_\)

\(b\) REF\(x.2\) → DEF\(\_\_\_\_.\_\_\)

```c
/* Module 1 */    |     /* Module 2 */
int x=1;          |     double x=1.0;
void main()       |     int p2()
{                 |     {
}                 |     }
```
{% endtab %}
{% endtabs %}

## 练习题 7.9

{% tabs %}
{% tab title="练习题 7.9 " %}
考虑下面的程序，它由两个目标模块组成：

```c
/* foo6.c */
void p2(void);

int main()
{
    p2();
    return 0;
}
```

```c
/* bar6.c */
#include <stdio.h>
char main;
void p2()
{
    printf("0x%x\n", main);
}
```

当在 x86-64Linux 系统中编译和执行这个程序时，即使函数 p2 不初始化变量 main，它也能打印字符串 “0x48\n” 并正常终止。你能解释这一点吗？
{% endtab %}
{% endtabs %}

## 练习题 7.10

{% tabs %}
{% tab title="练习题 7.10" %}
a 和 b 表示当前路径中的目标模块或静态库，而 a → b 表示 a 依赖于 b，也就是说 a 引用了一个 b 定义的符号。对于下面的每个场景，给出使得静态链接器能够解析所有符号引用的最小的命令行（即含有最少数量的目标文件和库参数的命令）。

A. p.o → libx.a → p.o

B. p.o → libx.a → liby.a 和 liby.a → libx.a

C. p.o → libx.a → liby.a → libz.a 和 liby.a → libx.a → libz.a
{% endtab %}
{% endtabs %}

## 练习题 7.11

{% tabs %}
{% tab title="练习题 7.11" %}
图 7-14 中的程序头部表明数据段占用了内存中 0x230 个字节。然而，其中只有开始的 0x228 字节来自可执行文件的节。是什么引起了这种差异？
{% endtab %}
{% endtabs %}

## 练习题 7.12

{% tabs %}
{% tab title="练习题 7.12" %}
考虑目标文件 m.o 中对函数 swap 的调用（作业题 7.6）。

```c
  9: e8 00 00 00 00      callq e <main+0xe>     swap()
```

具有如下重定位条目：

```c
r.offset = 0xa
r.symbol = swap
r.type   = R_X86_64_PC32
r.addend = -4
```

A. 假设链接器将 m.o 中的 .text 重定位到地址 0x4004e0，把 swap 重定位到地址 0x4004f8。那么 callq 指令中对 swap 的重定位引用的值应该是什么？

B. 假设链接器将 m.o 中的 .text 重定位到地址 0x4004d0，把 swap 重定位到地址 0x400500。那么 callq 指令中对 swap 的重定位引用的值应该是什么？
{% endtab %}
{% endtabs %}

## 练习题 7.13

{% tabs %}
{% tab title="练习题 7.13" %}
完成下面的任务将帮助你更熟悉处理目标文件的各种工具。

A. 在你的系统上，lib.c 和 libm.a 的版本中包含多少目标文件？

B. **gcc -Og** 产生的可执行代码与 **gcc -Og -g** 产生的不同吗？

C. 在你的系统上，GCC 驱动程序使用的是什么共享库？
{% endtab %}
{% endtabs %}

