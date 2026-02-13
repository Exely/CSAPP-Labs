# Architecture Lab (Y86-64) 笔记

这个 lab 涉及了 Y86-64 的实现。题目难度不大，做题的主要困难在实验环境安装和测试，做之前要仔细阅读[文档](../labs/archlab/archlab.pdf)。    
首先建立实验环境，解压 `sim` 包，这里是所使用的工具，需要 `make` ，刚开始我总是出错，后来从网上找到如下解决方法：
修改Makefile文件（ [sim](../labs/archlab/sim/) 目录下），注释掉（因为 ubuntu 没有安装相关库，这样模拟器就不支持 GUI 界面了）：

```Makefile
#GUIMODE=-DHAS_GUI
#TKLIBS=-L/usr/lib -ltk -ltcl
#TKINC=-isystem /usr/include
```

然后

```
unix> make clean;make
```

如果仍出错，可能是没装相关的依赖软件，安装 `flex` 和 `bison` 试试。   
这次 lab 分了三个部分： Part A 、B 、C   
Part A 要求将 C 代码翻译成 Y86-64 ，Part B 要求实现 SEQ 命令，这两部分都为 Part C 做铺垫，Part C 要求修改 PIPE 和 Y86-64 实现程序的优化。     

参考资料：        
[Seterplus/CSAPP](https://github.com/Seterplus/CSAPP/tree/master/archlab/sim/misc)    
[CSAPP：Architecture Lab - IT閱讀](http://www.itread01.com/articles/1476034219.html)        
[csapp archlab 模拟器安装](http://blog.csdn.net/zjs_one/article/details/52787019)    
[深入理解计算机系统：体系结构实验](https://sine-x.com/csapp-archlab/)   

## Part A

要求将 C 代码翻译成 Y86-64，工作目录在 `../sim/misc` 中，第一题题解在 [sum.ys](../labs/archlab/sim/misc/sum.ys) 中，是 Y86-64 形式的汇编代码，使用 `make sum.yo` 或 `./yas sum.ys` 编译，使用 `./yis sum.yo` 查看模拟器运行结果。

### 第一题

第一题要求写个计算链表和的函数，给了该函数的 C 代码。   
可以考虑将题目的 C 代码用 `gcc` 和 `objdump` 翻译成汇编代码，然后再将汇编翻译成 Y86-64 ；这里程序较简单，可以直接写出代码。     
下面详细讲解第一题的题解。（这份题解参考了不少资料）   
首先是指令的开头：

```
# Execution begins at address 0
.pos 0
irmovq stack, %rsp
# Set up stack pointer
```

设置栈指针，栈的位置在最后一行设置了：

```
# Stack starts here and grows to lower addresses
.pos 0x200
stack:
```

然后调用 `main` ，结束：

```
        call main
# Execute main program
        halt
# Terminate program
```

这是整个代码的框架；

```
# Sample linked list
        .align 8
  ele1:
        .quad 0x00a
        .quad ele2
  ele2:
        .quad 0x0b0
        .quad ele3
  ele3:
        .quad 0xc00
        .quad 0
```

上面定义了链表，并赋了初值；

```
main:
        irmovq ele1,%rdi # 传参数值
        call sumlist     # 调用函数
        ret

```

这是 `main` 的定义，其中调用了 `sumlist` 函数，该函数定义为如下：

```
sumlist:
        xorq    %rax,%rax     # 设置 sum 初值为 0，long val = 0
# sum = 0 
        andq    %rdi , %rdi   # 判断 ls （就是链表指针，最初为传入值，链表的首地址）是否为 0
        je  end               # ls 为 0 时直接返回
loop:   mrmovq  (%rdi) , %rcx # 循环： 保存 ls->val
        addq    %rcx , %rax   # 给 sum 累加值,就是 val += ls->val
        irmovq  $8 , %rbx     # 保存 8
        addq    %rbx , %rdi   # 链表指针加 8 ，就是 &(ls->next)
        mrmovq (%rdi),  %rdi  # ls=ls->next
        andq    %rdi , %rdi   # 判断 ls 是否为 0
        jne loop              # ls 不为 0 时循环
end:
        ret                   # 返回

```

可以看到题解就是直接翻译了 C 代码，运行测试，模拟器得到了结果： 

```
Stopped in 31 steps at PC = 0x13.  Status 'HLT', CC Z=1 S=0 O=0
Changes to registers:
%rax:	0x0000000000000000	0x0000000000000cba
%rcx:	0x0000000000000000	0x0000000000000c00
%rbx:	0x0000000000000000	0x0000000000000008
%rsp:	0x0000000000000000	0x0000000000000200

Changes to memory:
0x01f0:	0x0000000000000000	0x000000000000005b
0x01f8:	0x0000000000000000	0x0000000000000013
```

### 第二题

这题要求实现第一题的递归版本，题解在 [rsum.ys](../labs/archlab/sim/misc/rsum.ys) 中，同样直接翻译 C 代码，但是要实现递归时一定要注意分清哪些变量应该是 `调用者保存的` ！     
下面是递归版本的 `rsumlist` 函数的实现：

```
rsumlist:
        pushq   %rcx          # val： 是调用者保存的寄存器
        andq    %rdi , %rdi   # 判断条件
        je  end               # 直接返回
        mrmovq  (%rdi) , %rcx # ls->val
        irmovq  $8 , %rbx     
        addq    %rbx , %rdi
        mrmovq  (%rdi),  %rdi # ls->next
        call    rsumlist      # 递归
        addq    %rcx , %rax   # return val+rest;
end:
        popq    %rcx
        ret
```

测试得到 sum 和第一题相同。

### 第三题

实现一个将源数组（src）复制到目标数组（dest）的函数，并计算原数组中所有项的异或（Xor）值，这题的题解保存在 [copy_block.ys](../labs/archlab/sim/misc/copy_block.ys) 中，和前两题一样，直接翻译原函数。   
这里调用函数时要分别传入三个值，实现 main 如下：

```
main:
        irmovq src , %rdi
        irmovq dest , %rsi
        irmovq $3 , %rdx
        call   copyblock
        ret
```

调用的函数实现如下：

```
copyblock:
        xorq    %rax , %rax    # long result = 0;
loop:                          # 循环
        andq    %rdx , %rdx    # len
        jle     end            # 判断 len 是否 > 0
        mrmovq  (%rdi) , %rcx  # long val = *src;
        irmovq  $8 , %rbx      
        addq    %rbx , %rdi    # src++;
        rmmovq  %rcx , (%rsi)  # *dest = val;
        addq    %rbx , %rsi    # dest++;
        xorq    %rcx , %rax    # result ˆ= val;
        irmovq  $1 , %rbx      
        subq    %rbx , %rdx    # len--;
        jmp     loop
end:
        ret
```

测试得到结果：

```
Stopped in 45 steps at PC = 0x13.  Status 'HLT', CC Z=1 S=0 O=0
Changes to registers:
%rax:	0x0000000000000000	0x0000000000000cba
%rcx:	0x0000000000000000	0x0000000000000c00
%rbx:	0x0000000000000000	0x0000000000000001
%rsp:	0x0000000000000000	0x0000000000000200
%rsi:	0x0000000000000000	0x0000000000000048
%rdi:	0x0000000000000000	0x0000000000000030

Changes to memory:
0x0030:	0x0000000000000111	0x000000000000000a
0x0038:	0x0000000000000222	0x00000000000000b0
0x0040:	0x0000000000000333	0x0000000000000c00
0x01f0:	0x0000000000000000	0x000000000000006f
0x01f8:	0x0000000000000000	0x0000000000000013
```

## Part B

工作目录在 `sim/seq` 中，要求将 SEQ 扩展以支持 `iaddq` 指令(该指令在书上家庭作业的 4.51 和 4.52 说明了，第二版书在 4.48 和 4.50 上，我这里的文档只要求实现 `iaddq` ，参考资料里是二版的题，还实现了 `leave` 指令），该指令要求一步实现将常数值添加到目的寄存器。做法就是修改目录下的 [seq-full.hcl](../labs/archlab/sim/seq/seq-full.hcl) ，它实现了一个和书上一样的 SEQ 。    
参考书上 `OP1` 和 `mrmovl` 的实现，可以写出 `iaddq` 的实现步骤如下：     
iaddq A , rB

```
icode:ifun <-- M1[PC] # 取指
rA:rB <-- M1[PC+1]    
valC <-- M8[PC+2]  
valP <-- PC+10

valB <-- R[rB]        # 译码

valE <-- valB + valC  # 执行

R[rB] <-- valE        # 写回
PC <-- valP           # 更新 PC
```

然后根据实现修改 hcl 代码：

```
# 取指
# 指令是否有效？
bool instr_valid = icode in
        { INOP, IHALT, IRRMOVQ, IIRMOVQ, IRMMOVQ, IMRMOVQ, IOPQ, IJXX, ICALL, IRET, IPUSHQ, IPOPQ,IIADDQ };

# Does fetched instruction require a regid byte?
bool need_regids =
        icode in { IRRMOVQ, IOPQ, IPUSHQ, IPOPQ, IIRMOVQ, IRMMOVQ, IMRMOVQ, IIADDQ };

# Does fetched instruction require a constant word?
bool need_valC =
        icode in { IIRMOVQ, IRMMOVQ, IMRMOVQ, IJXX, ICALL, IIADDQ };

# 译码和写回，指定读入和写入
## What register should be used as the B source?
word srcB = [
        icode in { IOPQ, IRMMOVQ, IMRMOVQ ，IIADDQ } : rB;
        icode in { IPUSHQ, IPOPQ, ICALL, IRET } : RRSP;
        1 : RNONE;  # Don't need register
];

## What register should be used as the E destination?
word dstE = [
        icode in { IRRMOVQ } && Cnd : rB;
        icode in { IIRMOVQ, IOPQ，IIADDQ } : rB;
        icode in { IPUSHQ, IPOPQ, ICALL, IRET } : RRSP;
        1 : RNONE;  # Don't write any register
];

# 执行
## Select input A to ALU
word aluA = [
        icode in { IRRMOVQ, IOPQ } : valA;
        icode in { IIRMOVQ, IRMMOVQ, IMRMOVQ, IIADDQ } : valC;
        icode in { ICALL, IPUSHQ } : -8;
        icode in { IRET, IPOPQ } : 8;
        # Other instructions don't need ALU
];

## Select input B to ALU
word aluB = [
        icode in { IRMMOVQ, IMRMOVQ, IOPQ, ICALL, IPUSHQ, IRET, IPOPQ, IIADDQ } : valB;
        icode in { IRRMOVQ, IIRMOVQ } : 0;
        # Other instructions don't need ALU
];

## Should the condition codes be updated?
bool set_cc = icode in { IOPQ, IIADDQ };

```

完成后 `make` ，注意如果无法使用 gui 界面修改 `Makefile` ，注释掉相关内容，使用官方文档所给的命令 `unix> ./ssim -t ../y86-code/asumi.yo` 在命令行下测试得到 `ISA Check Succeeds` ，再用 `unix> (cd ../y86-code; make testssim)` 和 `unix> (cd ../ptest; make SIM=../seq/ssim)` 测试均成功。

## Part C

这部分工作目录在 `sim/pipe` 下，题目给定了 ncopy 函数的 C 代码，这个函数和 Part A 的第三题差不多，将 src 数组复制到 dest 数组，并返回数组中的正数的总数。题目还给定了这个函数的 Y86-64 代码，并在文件 `pipe-full.hcl` 中实现了一个包含 `IIADDQ` 常量的 PIPE 。题目要求修改 [ncopy.ys](../labs/archlab/sim/pipe/ncopy.ys)和 [pipe-full.hcl](../labs/archlab/sim/pipe/pipe-full.hcl) ，使得 `ncopy.ys` 运行得尽可能快。             
这题的测试命令比较多，按需要参考官方文档：       
使用 `unix> make VERSION=full` 重建测试环境；      
然后使用 `unix> ./psim -t sdriver.yo` 和 `unix> ./psim -t ldriver.yo` 在命令行下模拟运行和测试 PIPE 是否正确，同时得到 CPI ；       
使用 `unix> ./correctness.pl` 测试 `ncopy.ys` 代码是否正确；             
使用 `unix> ./benchmark.pl` 自动测试得到平均 CPE 。          
最初用给定的代码测试得到 CPI ( cycles per instruction ) 为 1.14 ，平均 CPE 约为 15.18 。这里要拿满分平均 CPE 应在 7.5 以下。         
首先和 Part B 一样实现 `iaddq` 指令，此时平均 CPE 降为 13.70 ，将减法改为 `iaddq` 得到 CPE 为 12.70 由于 `iaddq` 会更新状态码，可以利用它减少一个比较指令，得到 CPE 为 11.70 。   
考虑将循环展开，这里展开八次，CPE 降为 8.81（这里有个问题，使用 %r15 寄存器会出现错误，不知道什么原因），最终优化的函数保存在 `ncopy.ys` 中，通过了所有的测试，得分为 33.9/60.0 。得分有点低，说明还有很大的优化空间，进一步优化的尝试参见附[1]。    

## 小结

这个 lab 难度不大，但是上手不易，开始看到文档内容那么多，一度想放弃。上手要看懂文档，准备好安装环境，还要熟悉很多测试命令，可以参考他人经验快速上手。熟悉后，题目和之前几个 lab 相比就简单多了，这里难题主要在 Part C ，Part C 还很开放，要得高分不容易，还很耗时间。         
通过这个 lab ，可以熟悉 Y86-64 指令集，对 SEQ 和 PIPE 的实现方式也能有更深的理解。

### 附：     

[1]可以很容易看出，循环展开之后的余项可能有八位之多，对性能造成了较大的影响，可以进一步将余项循环展开四次。这里我写了一个四次展开的版本，保存在 [4ncopy.ys](../labs/archlab/sim/pipe/4ncopy.ys) 中，也保存了一份八次展开的版本在  [8ncopy.ys](../labs/archlab/sim/pipe/8ncopy.ys) 中，这两个版本都通过了测试，将八次展开和四次展开综合起来，就得到一个优化版本，保存在 [mncopy.ys](../labs/archlab/sim/pipe/mncopy.ys) 中，但是这个版本只能部分通过测试，这个 bug 太玄学了。。经过近两小时的挣扎，我最终放弃治疗，有时间再看吧。