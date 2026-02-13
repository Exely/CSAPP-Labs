---
layout: home

hero:
  name: "CSAPP Labs"
  text: "深入理解计算机系统"
  tagline: "第三版配套实验解答和笔记"
  actions:
    - theme: brand
      text: 开始阅读
      link: /notes/datalab
    - theme: alt
      text: 查看 Labs
      link: /labs/
    - theme: alt
      text: GitHub
      link: https://github.com/rwangrwang31/CSAPP-Labs

features:
  - icon: 💻
    title: Data Lab
    details: 涉及位运算、补码和浮点数等内容，都是C语言程序设计题
    link: /notes/datalab
  - icon: 💣
    title: Bomb Lab
    details: 拆除二进制炸弹，可以大大提升看汇编代码的能力
    link: /notes/bomb
  - icon: 🎯
    title: Attack Lab
    details: 主要涉及栈随机化、不可执行等栈保护方法和栈溢出、ROP攻击等内容
    link: /notes/attack
  - icon: 🏗️
    title: Architecture Lab
    details: 涉及Y86-64指令集，SEQ和PIPE的实现方式，以及程序优化等内容
    link: /notes/archlab
  - icon: ⚡
    title: Performance Lab
    details: 基于书上第五、六章对程序进行优化，主要用了循环分块消除缓存不命中等方法
    link: /notes/perflab
  - icon: 🗄️
    title: Cache Lab
    details: Part A要求写一个缓存模拟器，Part B要求优化矩阵转置函数，减少缓存不命中数
    link: /notes/cachelab
---

## 项目简介

这个项目是我对《深入理解计算机系统》第三版配套实验的解答和我写的笔记。

实验文件在目录 [labs](/labs/) 下，来源于 [CMU Lab Assignments](http://csapp.cs.cmu.edu/3e/labs.html)。

## 目录结构

### 📚 [笔记](/notes/)

包含各个实验的详细笔记和解题思路：

- **[Data Lab](/notes/datalab)** - 位运算、补码和浮点数
- **[Bomb Lab](/notes/bomb)** - 拆除二进制炸弹，提升汇编代码阅读能力
- **[Attack Lab](/notes/attack)** - 栈保护、栈溢出和ROP攻击
- **[Architecture Lab](/notes/archlab)** - Y86-64指令集和流水线实现
- **[Performance Lab](/notes/perflab)** - 程序优化技术
- **[Cache Lab](/notes/cachelab)** - 缓存模拟器和矩阵转置优化

### 🔬 [实验文件](/labs/)

包含所有的lab文件，以及CMU给的参考文档，也包含我写的解答文件。

实验环境：Ubuntu 16.04 amd-64

其中 `source` 目录保存了所有lab的原始文件。

## 参考资源

### 官方资源
- [CMU 15-213: Introduction to Computer Systems](http://www.cs.cmu.edu/~213/)
- [Lab Assignments](http://csapp.cs.cmu.edu/3e/labs.html)
- [CSAPP 官方网站](http://csapp.cs.cmu.edu/)
- 《深入理解计算机系统》第三版（Computer Systems: A Programmer's Perspective, 3/E）

### 相关学习资源
- [CSAPP 学习笔记 by Hansimov](https://hansimov.gitbook.io/csapp/) - 非常详细的 CSAPP 学习笔记和实验指南
- [CSAPP 课程视频（中文字幕）](https://www.bilibili.com/video/BV1iW411d7hd/)
- [深入理解计算机系统（CSAPP）学习指南](https://github.com/topics/csapp)
