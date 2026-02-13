# Labs

本目录包含《深入理解计算机系统》第三版的所有实验文件。

## 实验环境

- **操作系统**: Ubuntu 16.04 amd-64
- **来源**: [CMU Lab Assignments](http://csapp.cs.cmu.edu/3e/labs.html)

## 实验列表

### 1. [Data Lab](./data/)
位运算、补码和浮点数实验。完成lab不仅要实现函数的功能，还要求仅用规定的操作符，操作符数目也在限定范围内。

- 📝 [实验笔记](/notes/datalab)
- 📂 实验文件位于 `labs/data/` 目录

### 2. [Bomb Lab](./bomb/)
拆除二进制炸弹实验，可以大大提升看汇编代码的能力。

- 📝 [实验笔记](/notes/bomb)
- 📂 实验文件位于 `labs/bomb/` 目录

### 3. [Attack Lab](./attack/)
这个lab主要涉及了栈随机化、不可执行等栈保护的方法和使栈溢出、ROP攻击等内容。

- 📝 [实验笔记](/notes/attack)
- 📂 实验文件位于 `labs/attack/` 目录

### 4. [Architecture Lab (Y86-64)](./archlab/)
涉及Y86-64指令集，SEQ和PIPE的实现方式，以及程序优化等内容，可以熟悉汇编和硬件语言HCL。

- 📝 [实验笔记](/notes/archlab)
- 📂 实验文件位于 `labs/archlab/` 目录

### 5. [Performance Lab](./perflab/)
这个lab在CMU已经被Cache Lab取代了，考虑到Cache Lab比较难，可以先做这个lab练练手。基于书上第五、六章对程序进行优化，主要用了循环分块消除缓存不命中和消除分支预测错误等方法。

- 📝 [实验笔记](/notes/perflab)
- 📂 实验文件位于 `labs/perflab/` 目录

### 6. [Cache Lab](./cachelab/)
Part A要求写一个缓存模拟器，Part B要求优化矩阵转置函数，减少缓存不命中数。这个lab可以加深对缓存的理解。

- 📝 [实验笔记](/notes/cachelab)
- 📂 实验文件位于 `labs/cachelab/` 目录

### 7. [Shell Lab](./shlab/)
Shell实验，实现一个简单的Unix shell程序，支持作业控制。

- 📂 实验文件位于 `labs/shlab/` 目录

### 8. [Malloc Lab](./malloclab/)
动态内存分配器实验，实现malloc、free、realloc等函数。

- 📂 实验文件位于 `labs/malloclab/` 目录

### 9. [Proxy Lab](./proxylab/)
代理服务器实验，实现一个支持并发的Web代理服务器。

- 📂 实验文件位于 `labs/proxylab/` 目录

## 源文件

`source` 目录保存了所有lab的原始文件，可以作为参考或重新开始实验。

## 使用说明

1. 每个实验目录中都包含了README文件，详细说明了实验要求和使用方法
2. 建议先阅读对应的实验笔记，了解实验的背景知识和解题思路
3. 实验文件可以直接在Linux环境下编译运行
4. 部分实验需要特定的工具链和库，请参考各实验的README

## 参考资源

- [CMU 15-213 课程主页](http://www.cs.cmu.edu/~213/)
- [CSAPP 官方网站](http://csapp.cs.cmu.edu/)
- [实验下载页面](http://csapp.cs.cmu.edu/3e/labs.html)
