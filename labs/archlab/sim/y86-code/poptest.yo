                            | # Test of Pop semantics for Y86-64
0x000: 30f40001000000000000 | 	irmovq $0x100,%rsp  # Initialize stack pointer
0x00a: 30f0cdab000000000000 | 	irmovq $0xABCD,%rax 
0x014: a00f                 | 	pushq  %rax         # Put known value on stack
0x016: b04f                 | 	popq   %rsp         # Either get 0xABCD, or 0xfc
0x018: 00                   | 	halt
