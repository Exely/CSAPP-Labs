# 家庭作业

## 练习题 10.6

{% tabs %}
{% tab title="练习题 10.6" %}
下面程序的输出是什么？

```c
#include "csapp.h"

int main()
{
    int fd1, fd2;

    fd1 = Open("foo.txt", O_RDONLY, 0);
    fd2 = Open("bar.txt", O_RDONLY, 0);
    Close(fd2);
    fd2 = Open("baz.txt", O_RDONLY, 0);
    printf("fd2 = %d\n", fd2);
    exit(0);
}
```
{% endtab %}
{% endtabs %}

## 练习题 10.7

{% tabs %}
{% tab title="练习题 10.7" %}
修改图 10-5 中所示的 cpfile 程序，使得它用 RIO 函数从标准输入复制到标准输出，一次 MAX-BUF 个字节。
{% endtab %}
{% endtabs %}

## 练习题 10.8

{% tabs %}
{% tab title="练习题 10.8" %}
编写图 10-10 中的 statcheck 程序的一个版本，叫做 fstatcheck，它从命令行上取得一个描述符数字而不是文件名。
{% endtab %}
{% endtabs %}

## 练习题 10.9

{% tabs %}
{% tab title="练习题 10.9" %}
考虑下面对作业题 10.8 中的 fstatcheck 程序的调用：

```bash
linux> fstatcheck 3 < foo.txt
```

你可能会预想这个对 fstatcheck 的调用将提取和显示文件 foo.txt 的元数据。然而，当我们在系统上运行它时，它将失败，返回“坏的文件描述符”。根据这种情况，填写出 shell 在 fork 和 execve 调用之间必须执行的伪代码：

```c
if (Fork() == 0) { /* child */
    /* What code is the shell executing right here? */
    Execve("fstatcheck", argv, envp);
}
```
{% endtab %}
{% endtabs %}

## 练习题 10.10

{% tabs %}
{% tab title="练习题 10.10" %}
修改图 10-5 中的 cpfile 程序，使得它有一个可选的命令行参数 infile。如果给定了 infile，那么复制 infile 到标准输出，否则像以前那样复制标准输入到标准输出。一个要求是对于两种情况，你的解答都必须使用原来的复制循环（第 9 ~ 11 行）。只允许你插入代码，而不允许更改任何已经存在的代码。
{% endtab %}
{% endtabs %}



