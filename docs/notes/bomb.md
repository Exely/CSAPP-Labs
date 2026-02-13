# Bomb Lab 笔记

这个 lab 给了一个名为 [bomb](../labs/bomb/bomb) 的程序文件，还有一个名为 [bomb.c](../labs/bomb/bomb.c) 的文件是题目要求和 bomb 实现的代码框架，无法编译。题目要求是运行 bomb 后输入六个 phase ，输入正确 bomb 程序才能继续运行，输入错误就会 bomb!   
这里将结果保存在了 [result.txt](../labs/bomb/result.txt) 中，看源码可知可用 `unix> ./bomb result.txt` 来运行程序；   
题目做法就是运用反编译得到该程序的汇编代码，然后通过分析汇编代码，看程序的实现，同时结合 `gdb` 调试，通过打断点、查看内存结果推测应该输入的 phase 。   
反编译使用 `unix> objdump -d > obj.txt` ，这里 `obj.txt` 保存了汇编代码；   
`gdb` 调试常用的指令有：

- `unix> gdb bomb` 运行 gdb 调试 bomb
- `(gdb) run result.txt` 以参数 result.txt 调试 bomb
- `break *0x40133f` 在 0x40133f 处设置断点
- `print /d $rsi` 以十进制输出寄存器 rsi 的值
- `print (char *) 0xbfff890` 输出以 0xbfff890 为首地址的字符串

更多指令可以参考 [gdb 指令](http://csapp.cs.cmu.edu/2e/docs/gdbnotes-x86-64.pdf)   
参考资料：        
[马天猫的CS学习之旅](https://zhuanlan.zhihu.com/deeplearningcat)    
分析汇编代码可以看出：   
`0000000000400ee0 <phase_1>:`在346行，phase_2 等函数紧跟其后    
`0000000000400da0 <main>:`在264行   
`000000000040131b <string_length>:`在688行     
`0000000000401338 <strings_not_equal>:`在701行   
`000000000040145c <read_six_numbers>:`在804行 

## phase1

phase1 函数将一个地址存入了 `%rsi`，然后调用了 `string_not_equal` 函数，而在该调用函数中又调用了 `string_length` 函数比较两端字符串的长度；

```
  401338:       41 54                   push   %r12
  40133a:       55                      push   %rbp
  40133b:       53                      push   %rbx
  40133c:       48 89 fb                mov    %rdi,%rbx
  40133f:       48 89 f5                mov    %rsi,%rbp
  i01342:       e8 d4 ff ff ff          callq  40131b <string_length>
  401347:       41 89 c4                mov    %eax,%r12d
  40134a:       48 89 ef                mov    %rbp,%rdi
  40134d:       e8 c9 ff ff ff          callq  40131b <string_length>
  401352:       ba 01 00 00 00          mov    $0x1,%edx
  401357:       41 39 c4                cmp    %eax,%r12d

```

上段代码将存储了地址的 `%rdi` 和 `%rsi` 的值先后传到了 `string_length` 中， `%rdi` 即为原函数的第一个参数，即 `input` ，是输入的 phase 的首地址， `%rsi` 为设定的地址，是设定的 phase 的地址；上面的函数判断两个 phase 是否相同，不相同就 bomb! 因而将这个设定的 phase 打印出来就是结果了，设置一个断点，用 `print (char *) 0x402400` 打印出结果就得到了长度为 52 的答案了；   
关于 `string_length` 函数：

```
000000000040131b <string_length>:
  40131b:       80 3f 00                cmpb   $0x0,(%rdi)
  40131e:       74 12                   je     401332 <string_length+0x17>
  401320:       48 89 fa                mov    %rdi,%rdx
  401323:       48 83 c2 01             add    $0x1,%rdx
  401327:       89 d0                   mov    %edx,%eax
  401329:       29 f8                   sub    %edi,%eax
  40132b:       80 3a 00                cmpb   $0x0,(%rdx)
  40132e:       75 f3                   jne    401323 <string_length+0x8>
  401330:       f3 c3                   repz retq
  401332:       b8 00 00 00 00          mov    $0x0,%eax
  401337:       c3                      retq
```

该函数以 `%rdi` 为初始位置，通过循环不断比较 0 与该位置的值得到长度，返回到 `%eax`，打印出一个 `%eax` 得到 52 ，即为设定的长度；

## phase2

 ```
  400f17:       8b 43 fc                mov    -0x4(%rbx),%eax
  400f1a:       01 c0                   add    %eax,%eax
  400f1c:       39 03                   cmp    %eax,(%rbx)
  400f1e:       74 05                   je     400f25 <phase_2+0x29>
  400f20:       e8 15 05 00 00          callq  40143a <explode_bomb>
  400f25:       48 83 c3 04             add    $0x4,%rbx
  400f29:       48 39 eb                cmp    %rbp,%rbx
  400f2c:       75 e9                   jne    400f17 <phase_2+0x1b>
  ```

`phase_2` 调用了 `<read_six_numbers>` 函数，来读取六个数字，将读取的数字存储在栈中，利用了上面的循环来判断数字是否符合设定；   
上面的循环判断输入的后一项是否等于前一项的两倍，不相等就 bomb ，因而这打印出六个数的一个初始值就可以得到所有结果；   
注意这里

```
  400f0a:       83 3c 24 01             cmpl   $0x1,(%rsp)
  400f0e:       74 20                   je     400f30 <phase_2+0x34>
```

要求了 `(%rsp)` 的值必须为 1 ，而它就是栈顶，也就是第一个输入的数，所以 `1 2 4 8 16 32` 就是本题的答案了。

## phase3

这题输入两个数，判断是否符合；   
这题运用了一个间接跳转：

```
  400f75:       ff 24 c5 70 24 40 00    jmpq   *0x402470(,%rax,8)
```

以输入第一个数为索引，要求第一个数不超过 7 ，然后计算跳转地址，跳转后会设定第二个数的值，输入的第二个数与设定值不同就 bomb ；这里我没有看懂跳转后的地址，但通过不断打断点尝试，发现当第一个数为 0 时，跳转到了：

```
400f7c:       b8 cf 00 00 00          mov    $0xcf,%eax
400f81:       eb 3b                   jmp    400fbe <phase_3+0x7b>
```

这里将第二个数设置为 0xcf ，即 `0 207` 是符合的答案，这题答案不唯一。

## phase4

这题输入两个数字，存入栈中；

```
  401051:       83 7c 24 0c 00          cmpl   $0x0,0xc(%rsp)
  401056:       74 05                   je     40105d <phase_4+0x51>
```

从这里看出第二个数为 0 ，第一个数由调用的 `func4` 函数判断，返回值不为 0 时 bomb!

```
0000000000400fce <func4>:
  400fce:       48 83 ec 08             sub    $0x8,%rsp
  400fd2:       89 d0                   mov    %edx,%eax
  400fd4:       29 f0                   sub    %esi,%eax
  400fd6:       89 c1                   mov    %eax,%ecx
  400fd8:       c1 e9 1f                shr    $0x1f,%ecx
  400fdb:       01 c8                   add    %ecx,%eax
  400fdd:       d1 f8                   sar    %eax
  400fdf:       8d 0c 30                lea    (%rax,%rsi,1),%ecx
  400fe2:       39 f9                   cmp    %edi,%ecx
  400fe4:       7e 0c                   jle    400ff2 <func4+0x24>
  400fe6:       8d 51 ff                lea    -0x1(%rcx),%edx
  400fe9:       e8 e0 ff ff ff          callq  400fce <func4>
```

`func4` 函数在 `%ecx` 中利用了一个递归分别存入 7 , 3 , 1 ，并使用跳转使得，第一个数小于7时不断递归且 `%ecx`小于等于第一个数，而跳转后即在下面的代码中会要求 `%ecx` 大于等于第一个数，否则递归，递归过程会设置eax使得其不为 0 ，所以只有当第一数等于 `%ecx` 时即 1 ， 3 , 7 时才能使最后返回值为 0 ；

```
  400ff7:       39 f9                   cmp    %edi,%ecx
  400ff9:       7d 0c                   jge    401007 <func4+0x39> 
  400ff2:       b8 00 00 00 00          mov    $0x0,%eax  
  40104d:       85 c0                   test   %eax,%eax
  40104f:       75 07                   jne    401058 <phase_4+0x4c>
```

本题答案不唯一，可以为 `1 0` 或 `3 0` 或 `7 0` 。

## phase5

这题中 `mov    %fs:0x28,%rax` 为设定的 canary 值，可以忽视；这题通过对输入的 phase 进行一些运算操作，得到一个新的 phase ，判断完长度后将它的地址和设定的 phase 的地址传入 `strings_not_equal` 比较；

```
  4010b3:       be 5e 24 40 00          mov    $0x40245e,%esi
  4010b8:       48 8d 7c 24 10          lea    0x10(%rsp),%rdi
  4010bd:       e8 76 02 00 00          callq  401338 <strings_not_equal>
```

这里看出设定的 phase 的地址是 0x40245e ，直接打印出句子 `flyers` ；   
然后根据这个设定的 phase 得出操作前的 phase ；

```
  40108b:       0f b6 0c 03             movzbl (%rbx,%rax,1),%ecx
  40108f:       88 0c 24                mov    %cl,(%rsp)
  401092:       48 8b 14 24             mov    (%rsp),%rdx
  401096:       83 e2 0f                and    $0xf,%edx
  401099:       0f b6 92 b0 24 40 00    movzbl 0x4024b0(%rdx),%edx
  4010a0:       88 54 04 10             mov    %dl,0x10(%rsp,%rax,1)
  4010a4:       48 83 c0 01             add    $0x1,%rax
  4010a8:       48 83 f8 06             cmp    $0x6,%rax
  4010ac:       75 dd                   jne    40108b <phase_5+0x29>
```

上面的循环将输入的 phase，即一个数组 `input[n]` 的每个值做 `&0xf` 运算存到了 `%edx` 中，即提取出一个四位，然后以这个四位为偏移量访问内存中一段，将 `0x4024b0(%rdx)` 的值的 `%dl ` 存到栈上的数组 `0x10(%rsp,%rax,1)` 里，这个数组就是了新的 phase ；    
打印访问的内存，有：   

```
(gdb) p (char *) 0x4024b0 
$1 = 0x4024b0 <array> "maduiersnfotvbylSo you think you can stop the bomb with ctrl-c, do you?"
```

设定的 phase 就对应着地址偏移 `9,15,14,5,6,7` 位，而注意到 9 的  ASCII 码就是 0x39 ，提取出的四位正好是 9 ,经过上面的操作就可以得到一个字母 `f`，将其他偏移量对应于 ASCII 码就能得到结果 9?>567 ，就是答案了。

## phase6

这个函数代码比较长，分几段理解：    

#### 1.读入六个数的数组；   

#### 2.一个双重循环； 

```
  401114:       4c 89 ed                mov    %r13,%rbp
  401117:       41 8b 45 00             mov    0x0(%r13),%eax
  40111b:       83 e8 01                sub    $0x1,%eax
  40111e:       83 f8 05                cmp    $0x5,%eax
  401121:       76 05                   jbe    401128 <phase_6+0x34>
  401123:       e8 12 03 00 00          callq  40143a <explode_bomb>
  401128:       41 83 c4 01             add    $0x1,%r12d
  40112c:       41 83 fc 06             cmp    $0x6,%r12d
  401130:       74 21                   je     401153 <phase_6+0x5f>
  401132:       44 89 e3                mov    %r12d,%ebx
  401135:       48 63 c3                movslq %ebx,%rax
  401138:       8b 04 84                mov    (%rsp,%rax,4),%eax
  40113b:       39 45 00                cmp    %eax,0x0(%rbp)
  40113e:       75 05                   jne    401145 <phase_6+0x51>
  401140:       e8 f5 02 00 00          callq  40143a <explode_bomb>
  401145:       83 c3 01                add    $0x1,%ebx
  401148:       83 fb 05                cmp    $0x5,%ebx
  40114b:       7e e8                   jle    401135 <phase_6+0x41>
  40114d:       49 83 c5 04             add    $0x4,%r13
  401151:       eb c1                   jmp    401114 <phase_6+0x20>
```

这里外层的循环要求六个数都小于等于 6 ，由于这里 `jbe` 是对无符号数操作，另外数为 0 时在循环判断条件处会溢出，所以这六个数都应为正数，即 1-6 范围，嵌套的内循环要求六个数两两不等，否则 bomb!  

#### 3.对数组操作的循环

```
  401153:       48 8d 74 24 18          lea    0x18(%rsp),%rsi
  401158:       4c 89 f0                mov    %r14,%rax
  40115b:       b9 07 00 00 00          mov    $0x7,%ecx
  401160:       89 ca                   mov    %ecx,%edx
  401162:       2b 10                   sub    (%rax),%edx
  401164:       89 10                   mov    %edx,(%rax)
  401166:       48 83 c0 04             add    $0x4,%rax
  40116a:       48 39 f0                cmp    %rsi,%rax
  40116d:       75 f1                   jne    401160 <phase_6+0x6c>
```

这个循环使得读入的数组的每一项 `a[i]` 都变为 `7-a[i]` ；注意这是 16 进制， 0x18 就是输入的数组的边界；   

#### 4.利用一个链表提取出操作后数组的顺序   

```
  40116f:       be 00 00 00 00          mov    $0x0,%esi
  401174:       eb 21                   jmp    401197 <phase_6+0xa3>
  401176:       48 8b 52 08             mov    0x8(%rdx),%rdx
  40117a:       83 c0 01                add    $0x1,%eax
  40117d:       39 c8                   cmp    %ecx,%eax
  40117f:       75 f5                   jne    401176 <phase_6+0x82>
  401181:       eb 05                   jmp    401188 <phase_6+0x94>
  401183:       ba d0 32 60 00          mov    $0x6032d0,%edx
  401188:       48 89 54 74 20          mov    %rdx,0x20(%rsp,%rsi,2)
  40118d:       48 83 c6 04             add    $0x4,%rsi
  401191:       48 83 fe 18             cmp    $0x18,%rsi
  401195:       74 14                   je     4011ab <phase_6+0xb7>
  401197:       8b 0c 34                mov    (%rsp,%rsi,1),%ecx
  40119a:       83 f9 01                cmp    $0x1,%ecx
  40119d:       7e e4                   jle    401183 <phase_6+0x8f>
  40119f:       b8 01 00 00 00          mov    $0x1,%eax
  4011a4:       ba d0 32 60 00          mov    $0x6032d0,%edx
  4011a9:       eb cb                   jmp    401176 <phase_6+0x82>
```

这里的操作，有点类似于桶排序，而这里的桶是内存中的一个链表，这个链表有六个地址，`0x6032d0，0x6032e0， 0x6032f0,0x603300，0x603310，0x603320`，并且相邻的两地址有关系 `*(0x6032e0+8)=0x6032f0` 成立，以此类推，画个图就是个链表了，头结点是 `0x6032d0`；上面这个循环按六个数的顺序将这六个地址依次存入了栈的不同位置，使得 `0x6032d0` 对应于 1 （同时若是对应于操作后数组的 a[i] ，该地址就存入栈上初地址偏移的 i 位），`0x6032e0` 就对应于 2 以此类推，这样栈上各个地址所存入的偏移量就对应着中操作后数组的数，链表在栈上的顺序就对应着操作后数组中数的顺序。  

#### 5.根据栈上链表的顺序修改链表

```
  4011ab:       48 8b 5c 24 20          mov    0x20(%rsp),%rbx
  4011b0:       48 8d 44 24 28          lea    0x28(%rsp),%rax
  4011b5:       48 8d 74 24 50          lea    0x50(%rsp),%rsi
  4011ba:       48 89 d9                mov    %rbx,%rcx
  4011bd:       48 8b 10                mov    (%rax),%rdx
  4011c0:       48 89 51 08             mov    %rdx,0x8(%rcx)
  4011c4:       48 83 c0 08             add    $0x8,%rax
  4011c8:       48 39 f0                cmp    %rsi,%rax
  4011cb:       74 05                   je     4011d2 <phase_6+0xde>
  4011cd:       48 89 d1                mov    %rdx,%rcx
  4011d0:       eb eb                   jmp    4011bd <phase_6+0xc9>
```

这个循环把前一个栈中的地址加 0x8 取值后设为后一个栈中的地址，`movq   $0x0,0x8(%rdx)` 把最后一个地址加0x8取值后设为 0 ，就是将栈上存入的第一个地址设为了链表的头结点，栈上下一个地址就设为了下一个结点，最后一个结点设为空，这样链表的结构就跟据栈上的存入情况改变了，链表节点的顺序就是操作后数组的顺序。   

#### 6.遍历链表

```
  011da:       bd 05 00 00 00          mov    $0x5,%ebp
  4011df:       48 8b 43 08             mov    0x8(%rbx),%rax
  4011e3:       8b 00                   mov    (%rax),%eax
  4011e5:       39 03                   cmp    %eax,(%rbx)
  4011e7:       7d 05                   jge    4011ee <phase_6+0xfa>
  4011e9:       e8 4c 02 00 00          callq  40143a <explode_bomb>
  4011ee:       48 8b 5b 08             mov    0x8(%rbx),%rbx
  4011f2:       83 ed 01                sub    $0x1,%ebp
  4011f5:       75 e8                   jne    4011df <phase_6+0xeb>
```

这里遍历了一遍链表，判断下一结点取得的值是否会小于等于这一结点取得的值时，不满足的话就 bomb ，因此输入的数组的顺序经过一些操作后应使得修改后的链表的值满足从大到小的顺序，打印下这几个地址取得的值，有：

```
(gdb) p /d *0x6032d0
$26 = 332
(gdb) p /d *0x6032e0
$27 = 168
(gdb) p /d *0x6032f0
$28 = 924
(gdb) p /d *0x603300
$29 = 691
(gdb) p /d *0x603310
$30 = 477
(gdb) p /d *0x603320
$31 = 443
```

从大到小排序是：   
0x6032f0，对应操作后的数组的 3 对应输入数组的 4 ；   
0x603300，对应操作后的数组的 4 对应输入数组的 3 ；    
0x603310，对应操作后的数组的 5 对应输入数组的 2 ；    
0x603320，对应操作后的数组的 6 对应输入数组的 1 ；   
0x6032d0，对应操作后的数组的 1 对应输入数组的 6 ；    
0x6032e0，对应操作后的数组的 2 对应输入数组的 5 ；   
所以原输入数组为 `4 3 2 1 6 5`   

## 小结

通过这个 lab ，我学到了用 `gdb` 调试的方法，同时也对汇编知识更加熟悉了，做这个 lab 最重要的是要耐心和细心。