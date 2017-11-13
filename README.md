# CS:APP Labs

这个项目是《CS:APP》第三版的相关实验解答和笔记，实验的所有 lab 已经上传在 [labs](./labs/) 下，来源是 [Lab Assignments](http://csapp.cs.cmu.edu/3e/labs.html).

## 目录：

### [labs](./labs/)

 包含所有的 lab 文件，以及 CMU 给的参考文档，也包含我写的解答文件，我的实验环境是 Ubuntu 16.04 amd-64，其中 [source](./labs/source/) 保存了所有 lab 的原文件；

### [notes](./notes/)

 是我写的笔记，正在更新：

- [Data Lab 笔记](./notes/datalab.md)

涉及了位运算，补码和浮点数等内容，都是 C 语言程序设计题。

- [Bomb Lab 笔记](./notes/bomb.md)

拆除二进制炸弹，可以大大提升看汇编代码的能力。

- [Attack Lab 笔记](./notes/attack.md)

 这个 lab 主要涉及了栈随机化，不可执行等栈保护的方法和使栈溢出、 ROP 攻击等内容。

- [Architecture Lab (Y86-64) 笔记](./notes/archlab.md)

 Architecture Lab ，涉及了 Y86-64 指令集，和 SEQ 和 PIPE 的实现方式，以及程序优化等内容，可以熟悉汇编和硬件语言 HCL 。

- [Performance Lab 笔记](./notes/perflab.md)

这个 lab 在 CMU 已经被 Cache Lab 取代了，考虑到 Cache Lab 比较难，可以先做这个 lab 练练手，虽然这个也有难度。基于书上第五、六章对程序进行优化，主要用了循环分块消除缓存不命中和消除分支预测错误等方法。   

因为重装了系统，以下实验环境改为：Ubuntu 17.10 amd-64

- [Cache Lab 笔记](./notes/cachelab.md)

Part A 要求写一个缓存模拟器，Part B 要求优化矩阵转置函数，减少缓存不命中数。这个 lab 可以加深对缓存的理解。已写完 Part A 。
