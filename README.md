# CSAPP-Labs

这个项目是我对《深入理解计算机系统》第三版配套实验的解答和我写的笔记，实验文件在目录[labs](./labs/)下，来源[Lab Assignments](http://csapp.cs.cmu.edu/3e/labs.html)。

## 目录：

### [labs](./labs/)

 包含所有的lab文件，以及CMU给的参考文档，也包含我写的解答文件，我的实验环境是 Ubuntu 16.04 amd-64，其中[source](./labs/source/)保存了所有lab的原文件；

### [notes](./notes/)

 是我写的笔记：

- [Data Lab 笔记](./notes/datalab.md)

涉及了位运算，补码和浮点数等内容，都是`C`语言程序设计题。

- [Bomb Lab 笔记](./notes/bomb.md)

拆除二进制炸弹，可以大大提升看汇编代码的能力。

- [Attack Lab 笔记](./notes/attack.md)

 这个lab主要涉及了栈随机化，不可执行等栈保护的方法和使栈溢出、ROP攻击等内容。

- [Architecture Lab (Y86-64) 笔记](./notes/archlab.md)

 Architecture Lab，涉及了`Y86-64`指令集，和SEQ和PIPE的实现方式，以及程序优化等内容，可以熟悉汇编和硬件语言`HCL`。

- [Performance Lab 笔记](./notes/perflab.md)

这个lab在CMU已经被Cache Lab取代了，考虑到Cache Lab比较难，可以先做这个lab练练手。基于书上第五、六章对程序进行优化，主要用了循环分块消除缓存不命中和消除分支预测错误等方法。   

- [Cache Lab 笔记](./notes/cachelab.md)

Part A要求写一个缓存模拟器，Part B要求优化矩阵转置函数，减少缓存不命中数。这个lab可以加深对缓存的理解。已写完Part A。
