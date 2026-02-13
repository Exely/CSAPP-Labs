# 实验 3：Attack Lab

## 实验附件

* README
  * [http://csapp.cs.cmu.edu/3e/README-attacklab](http://csapp.cs.cmu.edu/3e/README-attacklab)
* Writeup
  * [http://csapp.cs.cmu.edu/3e/attacklab.pdf](http://csapp.cs.cmu.edu/3e/attacklab.pdf)
* 版本历史
  * [http://csapp.cs.cmu.edu/3e/attacklab-release.html](http://csapp.cs.cmu.edu/3e/attacklab-release.html)
* 自学材料
  * [http://csapp.cs.cmu.edu/3e/target1.tar](http://csapp.cs.cmu.edu/3e/target1.tar)
* 解答（需使用教师账户登录）
  * [http://csapp.cs.cmu.edu/im/labs/target1-sol.tar](http://csapp.cs.cmu.edu/im/labs/target1-sol.tar)

## 实验简介

> 注：该实验是 32 位 Buffer Lab 的 64 位后继版本。

给学生一对唯一的自定义生成的 x86-64 二进制可执行文件，称为目标（targets），它们包含缓冲区溢出错误。一个目标存在代码注入攻击漏洞。另一个存在面向返回的编程（ROP，return-oriented programming）攻击漏洞。要求学生基于代码注入或 ROP，开发漏洞利用，修改目标的行为。该实验教学生堆栈的规则，以及编写有缓冲区溢出漏洞的代码的危险。

如果你是自学的学生，自学讲义里有两个 Ubuntu 12.4 目标，你可以自己试试。你需要用 “-q” 选项运行目标，这样它们就不会试图和不存在的打分服务器通信。如果你是一个拥有 CS:APP 账号的讲师，那么你可以下载解答。

