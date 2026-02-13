# 常见问题

## gcc not found

原因：机器没有安装 gcc。

方法：运行下列命令：

运行：

```c
sudo apt-get install build-essential
```

**参考链接：**

* C compiler not found, Ubuntu - Stack Overflow
  * [https://stackoverflow.com/questions/22557029/c-compiler-not-found-ubuntu](https://stackoverflow.com/questions/22557029/c-compiler-not-found-ubuntu)

## fatal error: bits/libc-header-start.h: No such file or directory

原因：64 位机器的 gcc 只有 64 位的库，用 `-m32` 参数便会出错。

方法 1：删除 `-m32` 参数。但是这会导致许多依赖 32 位特性的代码错误。

方法 2**（推荐）**：安装 32 位的库：

```c
sudo apt-get install gcc-multilib
```

**参考链接：**

* c - "fatal error: bits/libc-header-start.h: No such file or directory" while compiling HTK - Stack Overflow
  * [https://stackoverflow.com/questions/54082459/fatal-error-bits-libc-header-start-h-no-such-file-or-directory-while-compili](https://stackoverflow.com/questions/54082459/fatal-error-bits-libc-header-start-h-no-such-file-or-directory-while-compili)
* 32 bit - Trouble compiling a 32 bit binary on a 64 bit machine - Ask Ubuntu
  * [https://askubuntu.com/questions/91909/trouble-compiling-a-32-bit-binary-on-a-64-bit-machine](https://askubuntu.com/questions/91909/trouble-compiling-a-32-bit-binary-on-a-64-bit-machine)

## 每次修改完代码，在 btest 前一定要重新 make

建议写成：

```c
make && ./btest
```

