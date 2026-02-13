# 家庭作业

## 练习题 8.9

{% tabs %}
{% tab title="练习题 8.9" %}
考虑四个具有如下开始和结束时间的进程：

| 进程 | 开始时间 | 结束时间 |
| :---: | :---: | :---: |
| A | 5 | 7 |
| B | 2 | 4 |
| C | 3 | 6 |
| D | 1 | 8 |

对于每对进程，指明它们是否是并发地运行的：

| 进程对 | 并发地？ |
| :---: | :---: |
| AB |  |
| AC |  |
| AD |  |
| BC |  |
| BD |  |
| CD |  |
{% endtab %}
{% endtabs %}

## 练习题 8.10

{% tabs %}
{% tab title="练习题 8.10" %}
在这一章里，我们介绍了一些具有不寻常的调用和返回行为的函数：setjmp、longjmp、execve 和 fork。找到下列行为中和每个函数相匹配的一种：

A. 调用一次，返回两次。

B. 调用一次，从不返回。

C. 调用一次，返回一次或者多次。
{% endtab %}
{% endtabs %}

## 练习题 8.11

{% tabs %}
{% tab title="练习题 8.11" %}
这个程序会输出多少个 “hello” 输出行？

{% code title="code/ecf/forkprob1.c" %}
```c
#include "csapp.h"

int main()
{
    int i;

    for (i = 0; i < 2; i++)
        Fork();
    printf("hello");
    exit(0);
}
```
{% endcode %}
{% endtab %}
{% endtabs %}

## 练习题 8.12

{% tabs %}
{% tab title="练习题 8.12" %}
这个程序会输出多少个 “hello” 输出行？

{% code title="code/ecf/forkprob4.c" %}
```c
#include "csapp.h"

void doit()
{
    Fork();
    Fork();
    printf("hello\n");
    return;
}

int main()
{
    doit ();
    printf("hello\n");
    exit(0);
}
```
{% endcode %}
{% endtab %}
{% endtabs %}

## 练习题 8.13

{% tabs %}
{% tab title="练习题 8.13" %}
下面程序的一种可能的输出是什么？

{% code title="code/ecf/forkprob3.c" %}
```c
#include "csapp.h"

int main() 
{
    int x = 3;

    if (Fork() != 0)
        print! ("x=%d\n", ++x);

    printf("x=%d\n", --x);
    exit(0);
}
```
{% endcode %}
{% endtab %}
{% endtabs %}

## 练习题 8.14

{% tabs %}
{% tab title="练习题 8.14" %}
这个程序会输出多少个 “hello” 输出行？

{% code title="code/ecf/forkprob5.c" %}
```c
#include "csapp.h"

void doit()
{
    if (Fork() == 0) {
        Fork();
        printf("hello\n");
        exit(0);
    }
    return;
}

int main()
{
    doit();
    printf("hello\n");
    exit(0);
}
```
{% endcode %}
{% endtab %}
{% endtabs %}

## 练习题 8.15

{% tabs %}
{% tab title="练习题 8.15" %}
这个程序会输出多少个 “hello” 输出行？

{% code title="code/ecf/forkprob6.c" %}
```c
#include "csapp.h"

void doit()
{
    if (Fork() == 0) {
        Fork();
        printf("hello\n");
        return;
    }
    return;
}

int main()
{
    doit();
    printf("hello\n");
    exit(0);
}
```
{% endcode %}
{% endtab %}
{% endtabs %}

## 练习题 8.16

{% tabs %}
{% tab title="练习题 8.16" %}
下面这个程序的输出是什么？

{% code title="code/ecf/forkprob7.c" %}
```c
#include "csapp.h"
int counter = 1;

int main()
{
    if (fork() == 0) {
        counter--;
        exit(0);
    }
    else {
        Wait(NULL);
        printf("counter = %d\n", ++counter);
    }
    exit(0);
}
```
{% endcode %}
{% endtab %}
{% endtabs %}

## 练习题 8.17

{% tabs %}
{% tab title="练习题 8.17" %}
列举练习题 8.4 中程序所有可能的输出。
{% endtab %}
{% endtabs %}

## 练习题 8.18

{% tabs %}
{% tab title="练习题 8.18" %}
考虑下面的程序：

{% code title="code/ecf/forkprob2.c" %}
```c
#include "csapp.h"

void end(void)
{
    printf("2"); fflush(stdout);
}

int main()
{
    if (Fork() == 0)
        atexit(end);
    if (Fork() == 0) {
        printf("0"); fflush(stdout);
    }
    else {
        printf("1"); fflush(stdout);
    }
    exit(0);
}
```
{% endcode %}

判断下面哪个输出是可能的。注意：atexit 函数以一个指向函数的指针为输入，并将它添加到函数列表中（初始为空），当 exit 函数被调用时，会调用该列表中的函数。

A. 112002

B. 211020

C. 102120

D. 122001

E. 100212
{% endtab %}
{% endtabs %}

## 练习题 8.19

{% tabs %}
{% tab title="练习题 8.19" %}
下面的函数会打印多少行输出？用一个 n 的函数给出答案。假设$$\small n \geqslant 1$$。

{% code title="code/ecf/forkprob8.c" %}
```c
void foo(int n)
{
    int i;

    for (i = 0; i < n; i++)
        Fork();
    printf("hello\n");
    exit(0);
}
```
{% endcode %}
{% endtab %}
{% endtabs %}

练习题 8.20

{% tabs %}
{% tab title="练习题 8.20" %}
使用 execve 编写一个叫做 myls 的程序，该程序的行为和 /bin/ls 程序的一样。你的程序应该接受相同的命令行参数，解释同样的环境变量，并产生相同的输岀。

Is 程序从 COLUMNS 环境变量中获得屏幕的宽度。如果没有设置 COLUMNS，那么 ls 会假设屏幕宽 80 列。因此，你可以通过把 COLUMNS 环境设置得小于 80，来检查你对环境变量的处理：

```text
linux> setenv COLUMNS 40
linux> ./myls
.
. // Output is 40 columns wide
.
linux> unsetenv COLUMNS
linux> ./myls
.
. // Output is now 80 columns wide
.
```
{% endtab %}
{% endtabs %}

练习题 8.21

{% tabs %}
{% tab title="练习题 8.21" %}
下面的程序可能的输岀序列是什么？

{% code title="code/ecf/waitprob3.c" %}
```c
int main()
{
    if (fork() == 0) {
        printf("a"); fflush(stdout);
        exit(0);
    }
    else {
        printf("b"); fflush(stdout);
        waitpid(-1, NULL, 0);
    }
    printf("c"); fflush(stdout);
    exit(0);
}
```
{% endcode %}
{% endtab %}
{% endtabs %}

练习题 8.22

{% tabs %}
{% tab title="练习题 8.22" %}
编写 Unix system 函数的你自己的版本

```c
int mysystem(char* command);
```

mysystem 函数通过调用 “/bin/sh-ccommand” 来执行 command，然后在 command 完成后返回。如果 command（通过调用 exit 函数或者执行一条 return 语句）正常退出，那么 mysystem 返回 command 退出状态。例如，如果 command 通过调用 exit\(8\) 终止，那么 mysystem 返回值 8。否则，如果 command 是异常终止的，那么 mysystem 就返回 shell 返回的状态。
{% endtab %}
{% endtabs %}

练习题 8.23

{% tabs %}
{% tab title="练习题 8.23" %}
你的一个同事想要使用信号来让一个父进程对发生在子进程中的事件计数。其想法是每次发生一个事件时，通过向父进程发送一个信号来通知它，并且让父进程的信号处理程序对一个全局变量 counter 加一，在子进程终止之后，父进程就可以检查这个变量。然而，当他在系统上运行图 8-45 中的测试程序时，发现当父进程调用 printf 时，counter 的值总是 2，即使子进程向父进程发送了 5 个信号也是如此。他很困惑，向你寻求帮助。你能解释这个程序有什么错误吗？

{% code title="code/ecf/counterprob.c" %}
```c
#include "csapp.h"

int counter = 0;

void handler(int sig)
{
    counter++;
    sleep(1); /* Do some work in the handler */
    return;
}

int main()
{
    int i;

    Signal(SIGUSR2, handler);

    if (Fork() == 0) { /* Child */
        for (i = 0; i < 5; i++) {
            Kill(getppid(), SIGUSR2);
            printf("sent SIGUSR2 to parent\n");
        }
        exit(0);
    }
    
    Wait(NULL);
    printf("counter=%d\n", counter);
    exit(0);
}
```
{% endcode %}

> 图 8-45 家庭作业 8.23 中引用的计数器程序
{% endtab %}
{% endtabs %}

练习题 8.24

{% tabs %}
{% tab title="练习题 8.24" %}
修改图 8-18 中的程序，以满足下面两个条件：

1）每个子进程在试图写一个只读文本段中的位置时会异常终止。

2）父进程打印和下面所示相同（除了 PID）的输出：

```text
child 12255 terminated by signal 11: Segmentation fault
child 12254 terminated by signal 11: Segmentation fault
```

提示：请参考 psignal\(3\) 的 man 页。
{% endtab %}
{% endtabs %}

练习题 8.25

{% tabs %}
{% tab title="练习题 8.25" %}
编写 fgets 函数的一个版本，叫做 tfgets，它 5 秒钟后会超时。tfgets 函数接收和 fgets 相同的输入。如果用户在 5 秒内不键入一个输入行，tfgets 返回 NULL。否则，它返回一个指向输入行的指针。
{% endtab %}
{% endtabs %}

练习题 8.26

{% tabs %}
{% tab title="练习题 8.26" %}
以图 8-23 中的示例作为开始点，编写一个支持作业控制的 shell 程序。shell 必须具有以下特性：

* 用户输入的命令行由一个 name、零个或者多个参数组成，它们都由一个或者多个空格分隔开。如果 name 是一个内置命令，那么 shell 就立即处理它，并等待下一个命令行。否则，shell 就假设 name 是一个可执行文件，在一个初始的子进程（作业）的上下文中加载并运行它。作业的进程组 ID 与子进程的 PID 相同。
* 每个作业是由一个进程 ID（PID）或者一个作业 ID（JID）来标识的，它是由一个 shell 分配的任意的小正整数。JID 在命令行上用前缀 “%” 来表示。比如，“％5” 表示 JID 5，而 “5” 表示 PID 5。
* 如果命令行以 & 来结束，那么 shell 就在后台运行这个作业。否则，shell 就在前台运行这个作业。
* 输入 Ctrl+C（Ctrl+Z），使得内核发送一个 SIGINT（SIGTSTP）信号给 shell，shell 再转发给前台进程组中的每个进程。✦
* 内置命令 jobs 列出所有的后台作业。
* 内置命令 bg job 通过发送一个 SIGCONT 信号重启 job，然后在后台运行它。job 参数可以是一个 PID，也可以是一个 JID。
* 内置命令 fg job 通过发送一个 SIGCONT 信号重启 job，然后在前台运行它。
* shell 回收它所有的僵死子进程。如果任何作业因为收到一个未捕获的信号而终止，那么 shell 就输出一条消息到终端，消息中包含该作业的 PID 和对该信号的描述。

{% hint style="info" %}
✦：注意这是对真实的 shell 工作方式的简化。真实的 shell 里，内核响应 Ctrl+C（Ctrl+Z），把 SIGINT（SIGTSTP）直接发送给终端前台进程组中的每个进程。shell 用 tcsetpgrp 函数管理这个进程组的成员，用 tcsetattr 函数管理终端的属性，这两个函数都超出了本书讲述的范围。可以参考【62】获得详细信息。
{% endhint %}

图 8-46 展示了一个 shell 会话示例。

```bash
linux> ./shell                              # Run your shell program

>bogus
bogus: Command not found.                   # Execve can’t find executable

>foo 10
Job 5035 terminated by signal: Interrupt    # User types Ctrl+C

>foo 100 &
[1] 5036 foo 100 &

>foo 200 &
[2] 5037 foo 200 &

>jobs
[1] 5036 Running foo 100 &
[2] 5037 Running foo 200 &

>fg %1
Job [1] 5036 stopped by signal: Stopped     # User types Ctrl+Z

>jobs
[1] 5036 Stopped foo 100 &
[2] 5037 Running foo 200 &

>bg 5035
5035: No such process

>bg 5036
[1] 5036 foo 100 &

>/bin/kill 5036
Job 5036 terminated by signal: Terminated

> fg %2                                     # Wait for fg job to finish

>quit

linux>                                      # Back to the Unix shell
```

> 图 8-46 家庭作业 8.26 的 shell 会话示例
{% endtab %}
{% endtabs %}

