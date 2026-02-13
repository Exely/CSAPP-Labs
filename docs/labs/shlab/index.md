# Shell Lab

Unix Shell 实验。

## 实验概述

Shell Lab 要求学生实现一个简单的 Unix shell 程序（命令行解释器），支持：

- 运行前台和后台作业
- 作业控制（jobs, fg, bg 命令）
- 信号处理（SIGINT, SIGTSTP, SIGCHLD）
- I/O 重定向
- 管道

通过这个实验，学生将：
- 深入理解进程控制和信号处理
- 学习如何使用系统调用（fork, execve, waitpid, kill, sigaction 等）
- 掌握进程组和作业控制的概念
- 理解信号的异步特性和竞争条件

## 📄 实验文档

- [实验说明文档 (PDF)](/labs/shlab/shlab.pdf)
- [README](/labs/shlab/README)

## 💻 实验文件

### 主要文件

- **tsh.c** - 需要实现的 shell 程序（框架代码）[查看](/labs/shlab/tsh.c)
- **Makefile** - 编译配置文件 [查看](/labs/shlab/Makefile)

### 测试文件

- **sdriver.pl** - Shell 驱动程序（用于测试）[查看](/labs/shlab/sdriver.pl)
- **trace01.txt - trace16.txt** - 测试用例文件

### 辅助程序

- **myint.c** - 测试程序（捕获 SIGINT）[查看](/labs/shlab/myint.c)
- **myspin.c** - 测试程序（长时间运行）[查看](/labs/shlab/myspin.c)
- **mysplit.c** - 测试程序（创建子进程）[查看](/labs/shlab/mysplit.c)
- **mystop.c** - 测试程序（捕获 SIGTSTP）[查看](/labs/shlab/mystop.c)

## 🚀 快速开始

```bash
# 编译 shell
make

# 运行 shell
./tsh

# 运行测试用例
make test01
make test02
# ... 或运行所有测试
make rtest

# 使用测试驱动程序
./sdriver.pl -t trace01.txt -s ./tsh -a "-p"
```

## 🔑 关键功能

### 需要实现的函数
- `eval()` - 解析并执行命令
- `builtin_cmd()` - 处理内置命令
- `do_bgfg()` - 实现 bg 和 fg 命令
- `waitfg()` - 等待前台作业完成
- `sigchld_handler()` - SIGCHLD 信号处理器
- `sigint_handler()` - SIGINT 信号处理器（Ctrl-C）
- `sigtstp_handler()` - SIGTSTP 信号处理器（Ctrl-Z）

### 内置命令
- `quit` - 退出 shell
- `jobs` - 列出后台作业
- `bg <job>` - 在后台继续运行作业
- `fg <job>` - 在前台继续运行作业

## 💡 实现提示

### 信号处理
- 使用 `sigprocmask()` 阻塞信号防止竞争
- 在 fork 之前阻塞 SIGCHLD
- 正确处理信号的异步性

### 进程管理
- 使用 `setpgid()` 设置进程组
- 使用 `waitpid()` 回收子进程
- 正确区分前台和后台作业

### 错误处理
- 检查所有系统调用的返回值
- 使用提供的错误处理函数
- 处理各种异常情况

## ⚠️ 常见陷阱

1. **竞争条件**: fork 和 addjob 之间的竞争
2. **信号处理**: 不可重入函数的使用
3. **进程组**: 未正确设置进程组 ID
4. **僵尸进程**: 未回收所有子进程

## 📦 下载全部文件

- [查看 GitHub 目录](https://github.com/rwangrwang31/CSAPP-Labs/tree/main/labs/shlab)
- 下载整个仓库后在 `labs/shlab/` 目录中查找
