# Attack Lab

缓冲区溢出攻击实验。

## 实验概述

Attack Lab 要求学生对两个易受攻击的程序进行一系列缓冲区溢出攻击。通过这个实验，学生将：

- 理解栈的结构和函数调用机制
- 学习缓冲区溢出漏洞的原理
- 掌握代码注入攻击（Code Injection）
- 掌握面向返回编程攻击（ROP - Return-Oriented Programming）
- 了解栈随机化、栈不可执行等防御机制

## 📝 相关笔记

[Attack Lab 笔记](/notes/attack) - 详细的攻击方法和原理分析

## 📄 实验文档

- [实验说明文档 (PDF)](/labs/attack/attacklab.pdf)
- [README](/labs/attack/README.txt)

## 💻 实验文件

### 目标程序

- **ctarget** - 代码注入攻击目标程序 <a href="/labs/attack/ctarget" download>下载</a>
- **rtarget** - ROP 攻击目标程序 <a href="/labs/attack/rtarget" download>下载</a>

### 工具

- **hex2raw** - 将十六进制字符串转换为字节序列 <a href="/labs/attack/hex2raw" download>下载</a>

### 参考文件

- **farm.c** - ROP gadgets 源代码 <a href="/labs/attack/farm.c" target="_blank">查看</a>
- **cookie.txt** - 你的唯一标识符 <a href="/labs/attack/cookie.txt" target="_blank">查看</a>

### 答案文件（参考）

- **result1.txt** - Phase 1 答案 <a href="/labs/attack/result1.txt" target="_blank">查看</a>
- **result2.txt** - Phase 2 答案 <a href="/labs/attack/result2.txt" target="_blank">查看</a>
- **result3.txt** - Phase 3 答案 <a href="/labs/attack/result3.txt" target="_blank">查看</a>
- **result4.txt** - Phase 4 答案 <a href="/labs/attack/result4.txt" target="_blank">查看</a>
- **result5.txt** - Phase 5 答案 <a href="/labs/attack/result5.txt" target="_blank">查看</a>

## 🚀 快速开始

```bash
# 运行代码注入攻击
./hex2raw < result1.txt | ./ctarget -q

# 运行 ROP 攻击
./hex2raw < result4.txt | ./rtarget -q

# 使用 GDB 调试
gdb ctarget

# 反汇编查看代码
objdump -d ctarget > ctarget.asm
objdump -d rtarget > rtarget.asm
```

## 🔍 攻击技巧

### Code Injection (CI) 攻击
1. 找到缓冲区溢出点
2. 确定返回地址的位置
3. 构造攻击代码（shellcode）
4. 将返回地址修改为攻击代码的地址

### ROP 攻击
1. 在程序中寻找 gadgets（以 `ret` 结尾的指令序列）
2. 链接多个 gadgets 完成目标操作
3. 在栈上构造 gadget 链
4. 利用 `ret` 指令在 gadgets 间跳转

## 📦 下载全部文件

- [查看 GitHub 目录](https://github.com/rwangrwang31/CSAPP-Labs/tree/main/labs/attack)
- 下载整个仓库后在 `labs/attack/` 目录中查找
