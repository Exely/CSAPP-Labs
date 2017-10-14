
rtarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000400c48 <_init>:
  400c48:	48 83 ec 08          	sub    $0x8,%rsp
  400c4c:	e8 6b 02 00 00       	callq  400ebc <call_gmon_start>
  400c51:	48 83 c4 08          	add    $0x8,%rsp
  400c55:	c3                   	retq   

Disassembly of section .plt:

0000000000400c60 <strcasecmp@plt-0x10>:
  400c60:	ff 35 8a 43 20 00    	pushq  0x20438a(%rip)        # 604ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
  400c66:	ff 25 8c 43 20 00    	jmpq   *0x20438c(%rip)        # 604ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
  400c6c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400c70 <strcasecmp@plt>:
  400c70:	ff 25 8a 43 20 00    	jmpq   *0x20438a(%rip)        # 605000 <_GLOBAL_OFFSET_TABLE_+0x18>
  400c76:	68 00 00 00 00       	pushq  $0x0
  400c7b:	e9 e0 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400c80 <__errno_location@plt>:
  400c80:	ff 25 82 43 20 00    	jmpq   *0x204382(%rip)        # 605008 <_GLOBAL_OFFSET_TABLE_+0x20>
  400c86:	68 01 00 00 00       	pushq  $0x1
  400c8b:	e9 d0 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400c90 <srandom@plt>:
  400c90:	ff 25 7a 43 20 00    	jmpq   *0x20437a(%rip)        # 605010 <_GLOBAL_OFFSET_TABLE_+0x28>
  400c96:	68 02 00 00 00       	pushq  $0x2
  400c9b:	e9 c0 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400ca0 <strncmp@plt>:
  400ca0:	ff 25 72 43 20 00    	jmpq   *0x204372(%rip)        # 605018 <_GLOBAL_OFFSET_TABLE_+0x30>
  400ca6:	68 03 00 00 00       	pushq  $0x3
  400cab:	e9 b0 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400cb0 <strcpy@plt>:
  400cb0:	ff 25 6a 43 20 00    	jmpq   *0x20436a(%rip)        # 605020 <_GLOBAL_OFFSET_TABLE_+0x38>
  400cb6:	68 04 00 00 00       	pushq  $0x4
  400cbb:	e9 a0 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400cc0 <puts@plt>:
  400cc0:	ff 25 62 43 20 00    	jmpq   *0x204362(%rip)        # 605028 <_GLOBAL_OFFSET_TABLE_+0x40>
  400cc6:	68 05 00 00 00       	pushq  $0x5
  400ccb:	e9 90 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400cd0 <write@plt>:
  400cd0:	ff 25 5a 43 20 00    	jmpq   *0x20435a(%rip)        # 605030 <_GLOBAL_OFFSET_TABLE_+0x48>
  400cd6:	68 06 00 00 00       	pushq  $0x6
  400cdb:	e9 80 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400ce0 <__stack_chk_fail@plt>:
  400ce0:	ff 25 52 43 20 00    	jmpq   *0x204352(%rip)        # 605038 <_GLOBAL_OFFSET_TABLE_+0x50>
  400ce6:	68 07 00 00 00       	pushq  $0x7
  400ceb:	e9 70 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400cf0 <mmap@plt>:
  400cf0:	ff 25 4a 43 20 00    	jmpq   *0x20434a(%rip)        # 605040 <_GLOBAL_OFFSET_TABLE_+0x58>
  400cf6:	68 08 00 00 00       	pushq  $0x8
  400cfb:	e9 60 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d00 <memset@plt>:
  400d00:	ff 25 42 43 20 00    	jmpq   *0x204342(%rip)        # 605048 <_GLOBAL_OFFSET_TABLE_+0x60>
  400d06:	68 09 00 00 00       	pushq  $0x9
  400d0b:	e9 50 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d10 <alarm@plt>:
  400d10:	ff 25 3a 43 20 00    	jmpq   *0x20433a(%rip)        # 605050 <_GLOBAL_OFFSET_TABLE_+0x68>
  400d16:	68 0a 00 00 00       	pushq  $0xa
  400d1b:	e9 40 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d20 <close@plt>:
  400d20:	ff 25 32 43 20 00    	jmpq   *0x204332(%rip)        # 605058 <_GLOBAL_OFFSET_TABLE_+0x70>
  400d26:	68 0b 00 00 00       	pushq  $0xb
  400d2b:	e9 30 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d30 <read@plt>:
  400d30:	ff 25 2a 43 20 00    	jmpq   *0x20432a(%rip)        # 605060 <_GLOBAL_OFFSET_TABLE_+0x78>
  400d36:	68 0c 00 00 00       	pushq  $0xc
  400d3b:	e9 20 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d40 <__libc_start_main@plt>:
  400d40:	ff 25 22 43 20 00    	jmpq   *0x204322(%rip)        # 605068 <_GLOBAL_OFFSET_TABLE_+0x80>
  400d46:	68 0d 00 00 00       	pushq  $0xd
  400d4b:	e9 10 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d50 <signal@plt>:
  400d50:	ff 25 1a 43 20 00    	jmpq   *0x20431a(%rip)        # 605070 <_GLOBAL_OFFSET_TABLE_+0x88>
  400d56:	68 0e 00 00 00       	pushq  $0xe
  400d5b:	e9 00 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d60 <gethostbyname@plt>:
  400d60:	ff 25 12 43 20 00    	jmpq   *0x204312(%rip)        # 605078 <_GLOBAL_OFFSET_TABLE_+0x90>
  400d66:	68 0f 00 00 00       	pushq  $0xf
  400d6b:	e9 f0 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d70 <__memmove_chk@plt>:
  400d70:	ff 25 0a 43 20 00    	jmpq   *0x20430a(%rip)        # 605080 <_GLOBAL_OFFSET_TABLE_+0x98>
  400d76:	68 10 00 00 00       	pushq  $0x10
  400d7b:	e9 e0 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d80 <strtol@plt>:
  400d80:	ff 25 02 43 20 00    	jmpq   *0x204302(%rip)        # 605088 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400d86:	68 11 00 00 00       	pushq  $0x11
  400d8b:	e9 d0 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d90 <memcpy@plt>:
  400d90:	ff 25 fa 42 20 00    	jmpq   *0x2042fa(%rip)        # 605090 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400d96:	68 12 00 00 00       	pushq  $0x12
  400d9b:	e9 c0 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400da0 <time@plt>:
  400da0:	ff 25 f2 42 20 00    	jmpq   *0x2042f2(%rip)        # 605098 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400da6:	68 13 00 00 00       	pushq  $0x13
  400dab:	e9 b0 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400db0 <random@plt>:
  400db0:	ff 25 ea 42 20 00    	jmpq   *0x2042ea(%rip)        # 6050a0 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400db6:	68 14 00 00 00       	pushq  $0x14
  400dbb:	e9 a0 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400dc0 <_IO_getc@plt>:
  400dc0:	ff 25 e2 42 20 00    	jmpq   *0x2042e2(%rip)        # 6050a8 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400dc6:	68 15 00 00 00       	pushq  $0x15
  400dcb:	e9 90 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400dd0 <__isoc99_sscanf@plt>:
  400dd0:	ff 25 da 42 20 00    	jmpq   *0x2042da(%rip)        # 6050b0 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400dd6:	68 16 00 00 00       	pushq  $0x16
  400ddb:	e9 80 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400de0 <munmap@plt>:
  400de0:	ff 25 d2 42 20 00    	jmpq   *0x2042d2(%rip)        # 6050b8 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400de6:	68 17 00 00 00       	pushq  $0x17
  400deb:	e9 70 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400df0 <__printf_chk@plt>:
  400df0:	ff 25 ca 42 20 00    	jmpq   *0x2042ca(%rip)        # 6050c0 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400df6:	68 18 00 00 00       	pushq  $0x18
  400dfb:	e9 60 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e00 <fopen@plt>:
  400e00:	ff 25 c2 42 20 00    	jmpq   *0x2042c2(%rip)        # 6050c8 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400e06:	68 19 00 00 00       	pushq  $0x19
  400e0b:	e9 50 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e10 <getopt@plt>:
  400e10:	ff 25 ba 42 20 00    	jmpq   *0x2042ba(%rip)        # 6050d0 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400e16:	68 1a 00 00 00       	pushq  $0x1a
  400e1b:	e9 40 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e20 <strtoul@plt>:
  400e20:	ff 25 b2 42 20 00    	jmpq   *0x2042b2(%rip)        # 6050d8 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400e26:	68 1b 00 00 00       	pushq  $0x1b
  400e2b:	e9 30 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e30 <gethostname@plt>:
  400e30:	ff 25 aa 42 20 00    	jmpq   *0x2042aa(%rip)        # 6050e0 <_GLOBAL_OFFSET_TABLE_+0xf8>
  400e36:	68 1c 00 00 00       	pushq  $0x1c
  400e3b:	e9 20 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e40 <exit@plt>:
  400e40:	ff 25 a2 42 20 00    	jmpq   *0x2042a2(%rip)        # 6050e8 <_GLOBAL_OFFSET_TABLE_+0x100>
  400e46:	68 1d 00 00 00       	pushq  $0x1d
  400e4b:	e9 10 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e50 <connect@plt>:
  400e50:	ff 25 9a 42 20 00    	jmpq   *0x20429a(%rip)        # 6050f0 <_GLOBAL_OFFSET_TABLE_+0x108>
  400e56:	68 1e 00 00 00       	pushq  $0x1e
  400e5b:	e9 00 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e60 <__fprintf_chk@plt>:
  400e60:	ff 25 92 42 20 00    	jmpq   *0x204292(%rip)        # 6050f8 <_GLOBAL_OFFSET_TABLE_+0x110>
  400e66:	68 1f 00 00 00       	pushq  $0x1f
  400e6b:	e9 f0 fd ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e70 <__sprintf_chk@plt>:
  400e70:	ff 25 8a 42 20 00    	jmpq   *0x20428a(%rip)        # 605100 <_GLOBAL_OFFSET_TABLE_+0x118>
  400e76:	68 20 00 00 00       	pushq  $0x20
  400e7b:	e9 e0 fd ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e80 <socket@plt>:
  400e80:	ff 25 82 42 20 00    	jmpq   *0x204282(%rip)        # 605108 <_GLOBAL_OFFSET_TABLE_+0x120>
  400e86:	68 21 00 00 00       	pushq  $0x21
  400e8b:	e9 d0 fd ff ff       	jmpq   400c60 <_init+0x18>

Disassembly of section .text:

0000000000400e90 <_start>:
  400e90:	31 ed                	xor    %ebp,%ebp
  400e92:	49 89 d1             	mov    %rdx,%r9
  400e95:	5e                   	pop    %rsi
  400e96:	48 89 e2             	mov    %rsp,%rdx
  400e99:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400e9d:	50                   	push   %rax
  400e9e:	54                   	push   %rsp
  400e9f:	49 c7 c0 90 2e 40 00 	mov    $0x402e90,%r8
  400ea6:	48 c7 c1 00 2e 40 00 	mov    $0x402e00,%rcx
  400ead:	48 c7 c7 ad 11 40 00 	mov    $0x4011ad,%rdi
  400eb4:	e8 87 fe ff ff       	callq  400d40 <__libc_start_main@plt>
  400eb9:	f4                   	hlt    
  400eba:	90                   	nop
  400ebb:	90                   	nop

0000000000400ebc <call_gmon_start>:
  400ebc:	48 83 ec 08          	sub    $0x8,%rsp
  400ec0:	48 8b 05 19 41 20 00 	mov    0x204119(%rip),%rax        # 604fe0 <_DYNAMIC+0x1d0>
  400ec7:	48 85 c0             	test   %rax,%rax
  400eca:	74 02                	je     400ece <call_gmon_start+0x12>
  400ecc:	ff d0                	callq  *%rax
  400ece:	48 83 c4 08          	add    $0x8,%rsp
  400ed2:	c3                   	retq   
  400ed3:	90                   	nop
  400ed4:	90                   	nop
  400ed5:	90                   	nop
  400ed6:	90                   	nop
  400ed7:	90                   	nop
  400ed8:	90                   	nop
  400ed9:	90                   	nop
  400eda:	90                   	nop
  400edb:	90                   	nop
  400edc:	90                   	nop
  400edd:	90                   	nop
  400ede:	90                   	nop
  400edf:	90                   	nop

0000000000400ee0 <deregister_tm_clones>:
  400ee0:	b8 97 54 60 00       	mov    $0x605497,%eax
  400ee5:	55                   	push   %rbp
  400ee6:	48 2d 90 54 60 00    	sub    $0x605490,%rax
  400eec:	48 83 f8 0e          	cmp    $0xe,%rax
  400ef0:	48 89 e5             	mov    %rsp,%rbp
  400ef3:	77 02                	ja     400ef7 <deregister_tm_clones+0x17>
  400ef5:	5d                   	pop    %rbp
  400ef6:	c3                   	retq   
  400ef7:	b8 00 00 00 00       	mov    $0x0,%eax
  400efc:	48 85 c0             	test   %rax,%rax
  400eff:	74 f4                	je     400ef5 <deregister_tm_clones+0x15>
  400f01:	5d                   	pop    %rbp
  400f02:	bf 90 54 60 00       	mov    $0x605490,%edi
  400f07:	ff e0                	jmpq   *%rax
  400f09:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400f10 <register_tm_clones>:
  400f10:	b8 90 54 60 00       	mov    $0x605490,%eax
  400f15:	55                   	push   %rbp
  400f16:	48 2d 90 54 60 00    	sub    $0x605490,%rax
  400f1c:	48 c1 f8 03          	sar    $0x3,%rax
  400f20:	48 89 e5             	mov    %rsp,%rbp
  400f23:	48 89 c2             	mov    %rax,%rdx
  400f26:	48 c1 ea 3f          	shr    $0x3f,%rdx
  400f2a:	48 01 d0             	add    %rdx,%rax
  400f2d:	48 d1 f8             	sar    %rax
  400f30:	75 02                	jne    400f34 <register_tm_clones+0x24>
  400f32:	5d                   	pop    %rbp
  400f33:	c3                   	retq   
  400f34:	ba 00 00 00 00       	mov    $0x0,%edx
  400f39:	48 85 d2             	test   %rdx,%rdx
  400f3c:	74 f4                	je     400f32 <register_tm_clones+0x22>
  400f3e:	5d                   	pop    %rbp
  400f3f:	48 89 c6             	mov    %rax,%rsi
  400f42:	bf 90 54 60 00       	mov    $0x605490,%edi
  400f47:	ff e2                	jmpq   *%rdx
  400f49:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400f50 <__do_global_dtors_aux>:
  400f50:	80 3d 61 45 20 00 00 	cmpb   $0x0,0x204561(%rip)        # 6054b8 <completed.6976>
  400f57:	75 11                	jne    400f6a <__do_global_dtors_aux+0x1a>
  400f59:	55                   	push   %rbp
  400f5a:	48 89 e5             	mov    %rsp,%rbp
  400f5d:	e8 7e ff ff ff       	callq  400ee0 <deregister_tm_clones>
  400f62:	5d                   	pop    %rbp
  400f63:	c6 05 4e 45 20 00 01 	movb   $0x1,0x20454e(%rip)        # 6054b8 <completed.6976>
  400f6a:	f3 c3                	repz retq 
  400f6c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400f70 <frame_dummy>:
  400f70:	48 83 3d 90 3e 20 00 	cmpq   $0x0,0x203e90(%rip)        # 604e08 <__JCR_END__>
  400f77:	00 
  400f78:	74 1e                	je     400f98 <frame_dummy+0x28>
  400f7a:	b8 00 00 00 00       	mov    $0x0,%eax
  400f7f:	48 85 c0             	test   %rax,%rax
  400f82:	74 14                	je     400f98 <frame_dummy+0x28>
  400f84:	55                   	push   %rbp
  400f85:	bf 08 4e 60 00       	mov    $0x604e08,%edi
  400f8a:	48 89 e5             	mov    %rsp,%rbp
  400f8d:	ff d0                	callq  *%rax
  400f8f:	5d                   	pop    %rbp
  400f90:	e9 7b ff ff ff       	jmpq   400f10 <register_tm_clones>
  400f95:	0f 1f 00             	nopl   (%rax)
  400f98:	e9 73 ff ff ff       	jmpq   400f10 <register_tm_clones>
  400f9d:	90                   	nop
  400f9e:	90                   	nop
  400f9f:	90                   	nop

0000000000400fa0 <usage>:
  400fa0:	48 83 ec 08          	sub    $0x8,%rsp
  400fa4:	48 89 fa             	mov    %rdi,%rdx
  400fa7:	83 3d 3a 45 20 00 00 	cmpl   $0x0,0x20453a(%rip)        # 6054e8 <is_checker>
  400fae:	74 3e                	je     400fee <usage+0x4e>
  400fb0:	be a8 2e 40 00       	mov    $0x402ea8,%esi
  400fb5:	bf 01 00 00 00       	mov    $0x1,%edi
  400fba:	b8 00 00 00 00       	mov    $0x0,%eax
  400fbf:	e8 2c fe ff ff       	callq  400df0 <__printf_chk@plt>
  400fc4:	bf e0 2e 40 00       	mov    $0x402ee0,%edi
  400fc9:	e8 f2 fc ff ff       	callq  400cc0 <puts@plt>
  400fce:	bf 58 30 40 00       	mov    $0x403058,%edi
  400fd3:	e8 e8 fc ff ff       	callq  400cc0 <puts@plt>
  400fd8:	bf 08 2f 40 00       	mov    $0x402f08,%edi
  400fdd:	e8 de fc ff ff       	callq  400cc0 <puts@plt>
  400fe2:	bf 72 30 40 00       	mov    $0x403072,%edi
  400fe7:	e8 d4 fc ff ff       	callq  400cc0 <puts@plt>
  400fec:	eb 32                	jmp    401020 <usage+0x80>
  400fee:	be 8e 30 40 00       	mov    $0x40308e,%esi
  400ff3:	bf 01 00 00 00       	mov    $0x1,%edi
  400ff8:	b8 00 00 00 00       	mov    $0x0,%eax
  400ffd:	e8 ee fd ff ff       	callq  400df0 <__printf_chk@plt>
  401002:	bf 30 2f 40 00       	mov    $0x402f30,%edi
  401007:	e8 b4 fc ff ff       	callq  400cc0 <puts@plt>
  40100c:	bf 58 2f 40 00       	mov    $0x402f58,%edi
  401011:	e8 aa fc ff ff       	callq  400cc0 <puts@plt>
  401016:	bf ac 30 40 00       	mov    $0x4030ac,%edi
  40101b:	e8 a0 fc ff ff       	callq  400cc0 <puts@plt>
  401020:	bf 00 00 00 00       	mov    $0x0,%edi
  401025:	e8 16 fe ff ff       	callq  400e40 <exit@plt>

000000000040102a <initialize_target>:
  40102a:	55                   	push   %rbp
  40102b:	53                   	push   %rbx
  40102c:	48 81 ec 18 21 00 00 	sub    $0x2118,%rsp
  401033:	89 f5                	mov    %esi,%ebp
  401035:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40103c:	00 00 
  40103e:	48 89 84 24 08 21 00 	mov    %rax,0x2108(%rsp)
  401045:	00 
  401046:	31 c0                	xor    %eax,%eax
  401048:	89 3d 8a 44 20 00    	mov    %edi,0x20448a(%rip)        # 6054d8 <check_level>
  40104e:	8b 3d f4 40 20 00    	mov    0x2040f4(%rip),%edi        # 605148 <target_id>
  401054:	e8 85 1d 00 00       	callq  402dde <gencookie>
  401059:	89 05 85 44 20 00    	mov    %eax,0x204485(%rip)        # 6054e4 <cookie>
  40105f:	89 c7                	mov    %eax,%edi
  401061:	e8 78 1d 00 00       	callq  402dde <gencookie>
  401066:	89 05 74 44 20 00    	mov    %eax,0x204474(%rip)        # 6054e0 <authkey>
  40106c:	8b 05 d6 40 20 00    	mov    0x2040d6(%rip),%eax        # 605148 <target_id>
  401072:	8d 78 01             	lea    0x1(%rax),%edi
  401075:	e8 16 fc ff ff       	callq  400c90 <srandom@plt>
  40107a:	e8 31 fd ff ff       	callq  400db0 <random@plt>
  40107f:	89 c7                	mov    %eax,%edi
  401081:	e8 02 03 00 00       	callq  401388 <scramble>
  401086:	89 c3                	mov    %eax,%ebx
  401088:	ba 00 00 00 00       	mov    $0x0,%edx
  40108d:	85 ed                	test   %ebp,%ebp
  40108f:	74 18                	je     4010a9 <initialize_target+0x7f>
  401091:	bf 00 00 00 00       	mov    $0x0,%edi
  401096:	e8 05 fd ff ff       	callq  400da0 <time@plt>
  40109b:	89 c7                	mov    %eax,%edi
  40109d:	e8 ee fb ff ff       	callq  400c90 <srandom@plt>
  4010a2:	e8 09 fd ff ff       	callq  400db0 <random@plt>
  4010a7:	89 c2                	mov    %eax,%edx
  4010a9:	01 da                	add    %ebx,%edx
  4010ab:	0f b7 d2             	movzwl %dx,%edx
  4010ae:	8d 04 d5 00 01 00 00 	lea    0x100(,%rdx,8),%eax
  4010b5:	89 c0                	mov    %eax,%eax
  4010b7:	48 89 05 c2 43 20 00 	mov    %rax,0x2043c2(%rip)        # 605480 <buf_offset>
  4010be:	c6 05 43 50 20 00 72 	movb   $0x72,0x205043(%rip)        # 606108 <target_prefix>
  4010c5:	83 3d bc 43 20 00 00 	cmpl   $0x0,0x2043bc(%rip)        # 605488 <notify>
  4010cc:	0f 84 b9 00 00 00    	je     40118b <initialize_target+0x161>
  4010d2:	83 3d 0f 44 20 00 00 	cmpl   $0x0,0x20440f(%rip)        # 6054e8 <is_checker>
  4010d9:	0f 85 ac 00 00 00    	jne    40118b <initialize_target+0x161>
  4010df:	be 00 01 00 00       	mov    $0x100,%esi
  4010e4:	48 89 e7             	mov    %rsp,%rdi
  4010e7:	e8 44 fd ff ff       	callq  400e30 <gethostname@plt>
  4010ec:	bb 00 00 00 00       	mov    $0x0,%ebx
  4010f1:	85 c0                	test   %eax,%eax
  4010f3:	74 23                	je     401118 <initialize_target+0xee>
  4010f5:	bf 88 2f 40 00       	mov    $0x402f88,%edi
  4010fa:	e8 c1 fb ff ff       	callq  400cc0 <puts@plt>
  4010ff:	bf 08 00 00 00       	mov    $0x8,%edi
  401104:	e8 37 fd ff ff       	callq  400e40 <exit@plt>
  401109:	48 89 e6             	mov    %rsp,%rsi
  40110c:	e8 5f fb ff ff       	callq  400c70 <strcasecmp@plt>
  401111:	85 c0                	test   %eax,%eax
  401113:	74 1a                	je     40112f <initialize_target+0x105>
  401115:	83 c3 01             	add    $0x1,%ebx
  401118:	48 63 c3             	movslq %ebx,%rax
  40111b:	48 8b 3c c5 60 51 60 	mov    0x605160(,%rax,8),%rdi
  401122:	00 
  401123:	48 85 ff             	test   %rdi,%rdi
  401126:	75 e1                	jne    401109 <initialize_target+0xdf>
  401128:	b8 00 00 00 00       	mov    $0x0,%eax
  40112d:	eb 05                	jmp    401134 <initialize_target+0x10a>
  40112f:	b8 01 00 00 00       	mov    $0x1,%eax
  401134:	85 c0                	test   %eax,%eax
  401136:	75 1c                	jne    401154 <initialize_target+0x12a>
  401138:	48 89 e2             	mov    %rsp,%rdx
  40113b:	be c0 2f 40 00       	mov    $0x402fc0,%esi
  401140:	bf 01 00 00 00       	mov    $0x1,%edi
  401145:	e8 a6 fc ff ff       	callq  400df0 <__printf_chk@plt>
  40114a:	bf 08 00 00 00       	mov    $0x8,%edi
  40114f:	e8 ec fc ff ff       	callq  400e40 <exit@plt>
  401154:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  40115b:	00 
  40115c:	e8 e3 19 00 00       	callq  402b44 <init_driver>
  401161:	85 c0                	test   %eax,%eax
  401163:	79 26                	jns    40118b <initialize_target+0x161>
  401165:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
  40116c:	00 
  40116d:	be 00 30 40 00       	mov    $0x403000,%esi
  401172:	bf 01 00 00 00       	mov    $0x1,%edi
  401177:	b8 00 00 00 00       	mov    $0x0,%eax
  40117c:	e8 6f fc ff ff       	callq  400df0 <__printf_chk@plt>
  401181:	bf 08 00 00 00       	mov    $0x8,%edi
  401186:	e8 b5 fc ff ff       	callq  400e40 <exit@plt>
  40118b:	48 8b 84 24 08 21 00 	mov    0x2108(%rsp),%rax
  401192:	00 
  401193:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40119a:	00 00 
  40119c:	74 05                	je     4011a3 <initialize_target+0x179>
  40119e:	e8 3d fb ff ff       	callq  400ce0 <__stack_chk_fail@plt>
  4011a3:	48 81 c4 18 21 00 00 	add    $0x2118,%rsp
  4011aa:	5b                   	pop    %rbx
  4011ab:	5d                   	pop    %rbp
  4011ac:	c3                   	retq   

00000000004011ad <main>:
  4011ad:	41 56                	push   %r14
  4011af:	41 55                	push   %r13
  4011b1:	41 54                	push   %r12
  4011b3:	55                   	push   %rbp
  4011b4:	53                   	push   %rbx
  4011b5:	41 89 fc             	mov    %edi,%r12d
  4011b8:	48 89 f3             	mov    %rsi,%rbx
  4011bb:	be e5 1e 40 00       	mov    $0x401ee5,%esi
  4011c0:	bf 0b 00 00 00       	mov    $0xb,%edi
  4011c5:	e8 86 fb ff ff       	callq  400d50 <signal@plt>
  4011ca:	be 97 1e 40 00       	mov    $0x401e97,%esi
  4011cf:	bf 07 00 00 00       	mov    $0x7,%edi
  4011d4:	e8 77 fb ff ff       	callq  400d50 <signal@plt>
  4011d9:	be 33 1f 40 00       	mov    $0x401f33,%esi
  4011de:	bf 04 00 00 00       	mov    $0x4,%edi
  4011e3:	e8 68 fb ff ff       	callq  400d50 <signal@plt>
  4011e8:	bd c5 30 40 00       	mov    $0x4030c5,%ebp
  4011ed:	83 3d f4 42 20 00 00 	cmpl   $0x0,0x2042f4(%rip)        # 6054e8 <is_checker>
  4011f4:	74 1e                	je     401214 <main+0x67>
  4011f6:	be 81 1f 40 00       	mov    $0x401f81,%esi
  4011fb:	bf 0e 00 00 00       	mov    $0xe,%edi
  401200:	e8 4b fb ff ff       	callq  400d50 <signal@plt>
  401205:	bf 05 00 00 00       	mov    $0x5,%edi
  40120a:	e8 01 fb ff ff       	callq  400d10 <alarm@plt>
  40120f:	bd ca 30 40 00       	mov    $0x4030ca,%ebp
  401214:	48 8b 05 85 42 20 00 	mov    0x204285(%rip),%rax        # 6054a0 <stdin@@GLIBC_2.2.5>
  40121b:	48 89 05 ae 42 20 00 	mov    %rax,0x2042ae(%rip)        # 6054d0 <infile>
  401222:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  401228:	41 be 00 00 00 00    	mov    $0x0,%r14d
  40122e:	e9 c6 00 00 00       	jmpq   4012f9 <main+0x14c>
  401233:	83 e8 61             	sub    $0x61,%eax
  401236:	3c 10                	cmp    $0x10,%al
  401238:	0f 87 9c 00 00 00    	ja     4012da <main+0x12d>
  40123e:	0f b6 c0             	movzbl %al,%eax
  401241:	ff 24 c5 10 31 40 00 	jmpq   *0x403110(,%rax,8)
  401248:	48 8b 3b             	mov    (%rbx),%rdi
  40124b:	e8 50 fd ff ff       	callq  400fa0 <usage>
  401250:	be 8d 33 40 00       	mov    $0x40338d,%esi
  401255:	48 8b 3d 4c 42 20 00 	mov    0x20424c(%rip),%rdi        # 6054a8 <optarg@@GLIBC_2.2.5>
  40125c:	e8 9f fb ff ff       	callq  400e00 <fopen@plt>
  401261:	48 89 05 68 42 20 00 	mov    %rax,0x204268(%rip)        # 6054d0 <infile>
  401268:	48 85 c0             	test   %rax,%rax
  40126b:	0f 85 88 00 00 00    	jne    4012f9 <main+0x14c>
  401271:	48 8b 0d 30 42 20 00 	mov    0x204230(%rip),%rcx        # 6054a8 <optarg@@GLIBC_2.2.5>
  401278:	ba d2 30 40 00       	mov    $0x4030d2,%edx
  40127d:	be 01 00 00 00       	mov    $0x1,%esi
  401282:	48 8b 3d 27 42 20 00 	mov    0x204227(%rip),%rdi        # 6054b0 <stderr@@GLIBC_2.2.5>
  401289:	e8 d2 fb ff ff       	callq  400e60 <__fprintf_chk@plt>
  40128e:	b8 01 00 00 00       	mov    $0x1,%eax
  401293:	e9 e4 00 00 00       	jmpq   40137c <main+0x1cf>
  401298:	ba 10 00 00 00       	mov    $0x10,%edx
  40129d:	be 00 00 00 00       	mov    $0x0,%esi
  4012a2:	48 8b 3d ff 41 20 00 	mov    0x2041ff(%rip),%rdi        # 6054a8 <optarg@@GLIBC_2.2.5>
  4012a9:	e8 72 fb ff ff       	callq  400e20 <strtoul@plt>
  4012ae:	41 89 c6             	mov    %eax,%r14d
  4012b1:	eb 46                	jmp    4012f9 <main+0x14c>
  4012b3:	ba 0a 00 00 00       	mov    $0xa,%edx
  4012b8:	be 00 00 00 00       	mov    $0x0,%esi
  4012bd:	48 8b 3d e4 41 20 00 	mov    0x2041e4(%rip),%rdi        # 6054a8 <optarg@@GLIBC_2.2.5>
  4012c4:	e8 b7 fa ff ff       	callq  400d80 <strtol@plt>
  4012c9:	41 89 c5             	mov    %eax,%r13d
  4012cc:	eb 2b                	jmp    4012f9 <main+0x14c>
  4012ce:	c7 05 b0 41 20 00 00 	movl   $0x0,0x2041b0(%rip)        # 605488 <notify>
  4012d5:	00 00 00 
  4012d8:	eb 1f                	jmp    4012f9 <main+0x14c>
  4012da:	0f be d2             	movsbl %dl,%edx
  4012dd:	be ef 30 40 00       	mov    $0x4030ef,%esi
  4012e2:	bf 01 00 00 00       	mov    $0x1,%edi
  4012e7:	b8 00 00 00 00       	mov    $0x0,%eax
  4012ec:	e8 ff fa ff ff       	callq  400df0 <__printf_chk@plt>
  4012f1:	48 8b 3b             	mov    (%rbx),%rdi
  4012f4:	e8 a7 fc ff ff       	callq  400fa0 <usage>
  4012f9:	48 89 ea             	mov    %rbp,%rdx
  4012fc:	48 89 de             	mov    %rbx,%rsi
  4012ff:	44 89 e7             	mov    %r12d,%edi
  401302:	e8 09 fb ff ff       	callq  400e10 <getopt@plt>
  401307:	89 c2                	mov    %eax,%edx
  401309:	3c ff                	cmp    $0xff,%al
  40130b:	0f 85 22 ff ff ff    	jne    401233 <main+0x86>
  401311:	be 01 00 00 00       	mov    $0x1,%esi
  401316:	44 89 ef             	mov    %r13d,%edi
  401319:	e8 0c fd ff ff       	callq  40102a <initialize_target>
  40131e:	83 3d c3 41 20 00 00 	cmpl   $0x0,0x2041c3(%rip)        # 6054e8 <is_checker>
  401325:	74 2a                	je     401351 <main+0x1a4>
  401327:	44 3b 35 b2 41 20 00 	cmp    0x2041b2(%rip),%r14d        # 6054e0 <authkey>
  40132e:	74 21                	je     401351 <main+0x1a4>
  401330:	44 89 f2             	mov    %r14d,%edx
  401333:	be 28 30 40 00       	mov    $0x403028,%esi
  401338:	bf 01 00 00 00       	mov    $0x1,%edi
  40133d:	b8 00 00 00 00       	mov    $0x0,%eax
  401342:	e8 a9 fa ff ff       	callq  400df0 <__printf_chk@plt>
  401347:	b8 00 00 00 00       	mov    $0x0,%eax
  40134c:	e8 da 07 00 00       	callq  401b2b <check_fail>
  401351:	8b 15 8d 41 20 00    	mov    0x20418d(%rip),%edx        # 6054e4 <cookie>
  401357:	be 02 31 40 00       	mov    $0x403102,%esi
  40135c:	bf 01 00 00 00       	mov    $0x1,%edi
  401361:	b8 00 00 00 00       	mov    $0x0,%eax
  401366:	e8 85 fa ff ff       	callq  400df0 <__printf_chk@plt>
  40136b:	48 8b 3d 0e 41 20 00 	mov    0x20410e(%rip),%rdi        # 605480 <buf_offset>
  401372:	e8 5d 0c 00 00       	callq  401fd4 <launch>
  401377:	b8 00 00 00 00       	mov    $0x0,%eax
  40137c:	5b                   	pop    %rbx
  40137d:	5d                   	pop    %rbp
  40137e:	41 5c                	pop    %r12
  401380:	41 5d                	pop    %r13
  401382:	41 5e                	pop    %r14
  401384:	c3                   	retq   
  401385:	90                   	nop
  401386:	90                   	nop
  401387:	90                   	nop

0000000000401388 <scramble>:
  401388:	b8 00 00 00 00       	mov    $0x0,%eax
  40138d:	eb 11                	jmp    4013a0 <scramble+0x18>
  40138f:	69 c8 7f 79 00 00    	imul   $0x797f,%eax,%ecx
  401395:	01 f9                	add    %edi,%ecx
  401397:	89 c2                	mov    %eax,%edx
  401399:	89 4c 94 c8          	mov    %ecx,-0x38(%rsp,%rdx,4)
  40139d:	83 c0 01             	add    $0x1,%eax
  4013a0:	83 f8 09             	cmp    $0x9,%eax
  4013a3:	76 ea                	jbe    40138f <scramble+0x7>
  4013a5:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4013a9:	69 c0 44 a6 00 00    	imul   $0xa644,%eax,%eax
  4013af:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4013b3:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  4013b7:	69 c0 d5 50 00 00    	imul   $0x50d5,%eax,%eax
  4013bd:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4013c1:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4013c5:	69 c0 00 3a 00 00    	imul   $0x3a00,%eax,%eax
  4013cb:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4013cf:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4013d3:	69 c0 29 9f 00 00    	imul   $0x9f29,%eax,%eax
  4013d9:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4013dd:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4013e1:	69 c0 96 16 00 00    	imul   $0x1696,%eax,%eax
  4013e7:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4013eb:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4013ef:	69 c0 4d 29 00 00    	imul   $0x294d,%eax,%eax
  4013f5:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4013f9:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4013fd:	69 c0 7d c8 00 00    	imul   $0xc87d,%eax,%eax
  401403:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401407:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  40140b:	69 c0 7e 90 00 00    	imul   $0x907e,%eax,%eax
  401411:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401415:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  401419:	69 c0 5f c3 00 00    	imul   $0xc35f,%eax,%eax
  40141f:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  401423:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401427:	69 c0 32 43 00 00    	imul   $0x4332,%eax,%eax
  40142d:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401431:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401435:	69 c0 d9 3f 00 00    	imul   $0x3fd9,%eax,%eax
  40143b:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  40143f:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  401443:	69 c0 d7 49 00 00    	imul   $0x49d7,%eax,%eax
  401449:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  40144d:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  401451:	69 c0 7a 8c 00 00    	imul   $0x8c7a,%eax,%eax
  401457:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  40145b:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  40145f:	69 c0 f8 0e 00 00    	imul   $0xef8,%eax,%eax
  401465:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401469:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  40146d:	69 c0 2d 12 00 00    	imul   $0x122d,%eax,%eax
  401473:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401477:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40147b:	69 c0 16 c6 00 00    	imul   $0xc616,%eax,%eax
  401481:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401485:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401489:	69 c0 41 48 00 00    	imul   $0x4841,%eax,%eax
  40148f:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401493:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401497:	69 c0 44 92 00 00    	imul   $0x9244,%eax,%eax
  40149d:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4014a1:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4014a5:	69 c0 19 5f 00 00    	imul   $0x5f19,%eax,%eax
  4014ab:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4014af:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4014b3:	69 c0 8d 3a 00 00    	imul   $0x3a8d,%eax,%eax
  4014b9:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4014bd:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4014c1:	69 c0 30 4a 00 00    	imul   $0x4a30,%eax,%eax
  4014c7:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4014cb:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4014cf:	69 c0 74 f2 00 00    	imul   $0xf274,%eax,%eax
  4014d5:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4014d9:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4014dd:	69 c0 04 82 00 00    	imul   $0x8204,%eax,%eax
  4014e3:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4014e7:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4014eb:	69 c0 82 d5 00 00    	imul   $0xd582,%eax,%eax
  4014f1:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4014f5:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4014f9:	69 c0 cc 01 00 00    	imul   $0x1cc,%eax,%eax
  4014ff:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401503:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401507:	69 c0 77 0d 00 00    	imul   $0xd77,%eax,%eax
  40150d:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401511:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401515:	69 c0 50 d8 00 00    	imul   $0xd850,%eax,%eax
  40151b:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  40151f:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401523:	69 c0 45 02 00 00    	imul   $0x245,%eax,%eax
  401529:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  40152d:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401531:	69 c0 5c b6 00 00    	imul   $0xb65c,%eax,%eax
  401537:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  40153b:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40153f:	69 c0 62 b1 00 00    	imul   $0xb162,%eax,%eax
  401545:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401549:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  40154d:	69 c0 2f b8 00 00    	imul   $0xb82f,%eax,%eax
  401553:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  401557:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  40155b:	69 c0 fc 80 00 00    	imul   $0x80fc,%eax,%eax
  401561:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401565:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401569:	69 c0 65 8e 00 00    	imul   $0x8e65,%eax,%eax
  40156f:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401573:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  401577:	69 c0 b2 82 00 00    	imul   $0x82b2,%eax,%eax
  40157d:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  401581:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401585:	69 c0 ad 44 00 00    	imul   $0x44ad,%eax,%eax
  40158b:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  40158f:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401593:	69 c0 2e 63 00 00    	imul   $0x632e,%eax,%eax
  401599:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  40159d:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  4015a1:	69 c0 19 21 00 00    	imul   $0x2119,%eax,%eax
  4015a7:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  4015ab:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4015af:	69 c0 8a a1 00 00    	imul   $0xa18a,%eax,%eax
  4015b5:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4015b9:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4015bd:	69 c0 95 d8 00 00    	imul   $0xd895,%eax,%eax
  4015c3:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4015c7:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4015cb:	69 c0 81 e8 00 00    	imul   $0xe881,%eax,%eax
  4015d1:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4015d5:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4015d9:	69 c0 c1 8f 00 00    	imul   $0x8fc1,%eax,%eax
  4015df:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4015e3:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4015e7:	69 c0 07 1c 00 00    	imul   $0x1c07,%eax,%eax
  4015ed:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4015f1:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  4015f5:	69 c0 47 4d 00 00    	imul   $0x4d47,%eax,%eax
  4015fb:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  4015ff:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  401603:	69 c0 dd cc 00 00    	imul   $0xccdd,%eax,%eax
  401609:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  40160d:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401611:	69 c0 89 2f 00 00    	imul   $0x2f89,%eax,%eax
  401617:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  40161b:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  40161f:	69 c0 2d cc 00 00    	imul   $0xcc2d,%eax,%eax
  401625:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  401629:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  40162d:	69 c0 b8 f5 00 00    	imul   $0xf5b8,%eax,%eax
  401633:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  401637:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  40163b:	69 c0 29 e8 00 00    	imul   $0xe829,%eax,%eax
  401641:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401645:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401649:	69 c0 69 60 00 00    	imul   $0x6069,%eax,%eax
  40164f:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401653:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401657:	69 c0 9c 71 00 00    	imul   $0x719c,%eax,%eax
  40165d:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401661:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401665:	69 c0 1a 28 00 00    	imul   $0x281a,%eax,%eax
  40166b:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40166f:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401673:	69 c0 f3 33 00 00    	imul   $0x33f3,%eax,%eax
  401679:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  40167d:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401681:	69 c0 6c 2a 00 00    	imul   $0x2a6c,%eax,%eax
  401687:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  40168b:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  40168f:	69 c0 51 ec 00 00    	imul   $0xec51,%eax,%eax
  401695:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401699:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  40169d:	69 c0 8a 4c 00 00    	imul   $0x4c8a,%eax,%eax
  4016a3:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4016a7:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4016ab:	69 c0 63 dd 00 00    	imul   $0xdd63,%eax,%eax
  4016b1:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4016b5:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4016b9:	69 c0 ca ca 00 00    	imul   $0xcaca,%eax,%eax
  4016bf:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4016c3:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4016c7:	69 c0 5d 44 00 00    	imul   $0x445d,%eax,%eax
  4016cd:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4016d1:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4016d5:	69 c0 b7 17 00 00    	imul   $0x17b7,%eax,%eax
  4016db:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4016df:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4016e3:	69 c0 b5 1b 00 00    	imul   $0x1bb5,%eax,%eax
  4016e9:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4016ed:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4016f1:	69 c0 7a 8f 00 00    	imul   $0x8f7a,%eax,%eax
  4016f7:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4016fb:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4016ff:	69 c0 f9 2e 00 00    	imul   $0x2ef9,%eax,%eax
  401705:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401709:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  40170d:	69 c0 0c 35 00 00    	imul   $0x350c,%eax,%eax
  401713:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401717:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  40171b:	69 c0 50 09 00 00    	imul   $0x950,%eax,%eax
  401721:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  401725:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401729:	69 c0 fd 81 00 00    	imul   $0x81fd,%eax,%eax
  40172f:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401733:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  401737:	69 c0 8c 3a 00 00    	imul   $0x3a8c,%eax,%eax
  40173d:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  401741:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401745:	69 c0 b6 4f 00 00    	imul   $0x4fb6,%eax,%eax
  40174b:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  40174f:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  401753:	69 c0 4a f3 00 00    	imul   $0xf34a,%eax,%eax
  401759:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  40175d:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  401761:	69 c0 fd 43 00 00    	imul   $0x43fd,%eax,%eax
  401767:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  40176b:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  40176f:	69 c0 24 7d 00 00    	imul   $0x7d24,%eax,%eax
  401775:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401779:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  40177d:	69 c0 6d b4 00 00    	imul   $0xb46d,%eax,%eax
  401783:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401787:	ba 00 00 00 00       	mov    $0x0,%edx
  40178c:	b8 00 00 00 00       	mov    $0x0,%eax
  401791:	eb 0b                	jmp    40179e <scramble+0x416>
  401793:	89 d1                	mov    %edx,%ecx
  401795:	8b 4c 8c c8          	mov    -0x38(%rsp,%rcx,4),%ecx
  401799:	01 c8                	add    %ecx,%eax
  40179b:	83 c2 01             	add    $0x1,%edx
  40179e:	83 fa 09             	cmp    $0x9,%edx
  4017a1:	76 f0                	jbe    401793 <scramble+0x40b>
  4017a3:	f3 c3                	repz retq 
  4017a5:	90                   	nop
  4017a6:	90                   	nop
  4017a7:	90                   	nop

00000000004017a8 <getbuf>:
  4017a8:	48 83 ec 28          	sub    $0x28,%rsp
  4017ac:	48 89 e7             	mov    %rsp,%rdi
  4017af:	e8 ac 03 00 00       	callq  401b60 <Gets>
  4017b4:	b8 01 00 00 00       	mov    $0x1,%eax
  4017b9:	48 83 c4 28          	add    $0x28,%rsp
  4017bd:	c3                   	retq   
  4017be:	90                   	nop
  4017bf:	90                   	nop

00000000004017c0 <touch1>:
  4017c0:	48 83 ec 08          	sub    $0x8,%rsp
  4017c4:	c7 05 0e 3d 20 00 01 	movl   $0x1,0x203d0e(%rip)        # 6054dc <vlevel>
  4017cb:	00 00 00 
  4017ce:	bf e5 31 40 00       	mov    $0x4031e5,%edi
  4017d3:	e8 e8 f4 ff ff       	callq  400cc0 <puts@plt>
  4017d8:	bf 01 00 00 00       	mov    $0x1,%edi
  4017dd:	e8 cb 05 00 00       	callq  401dad <validate>
  4017e2:	bf 00 00 00 00       	mov    $0x0,%edi
  4017e7:	e8 54 f6 ff ff       	callq  400e40 <exit@plt>

00000000004017ec <touch2>:
  4017ec:	48 83 ec 08          	sub    $0x8,%rsp
  4017f0:	89 fa                	mov    %edi,%edx
  4017f2:	c7 05 e0 3c 20 00 02 	movl   $0x2,0x203ce0(%rip)        # 6054dc <vlevel>
  4017f9:	00 00 00 
  4017fc:	3b 3d e2 3c 20 00    	cmp    0x203ce2(%rip),%edi        # 6054e4 <cookie>
  401802:	75 20                	jne    401824 <touch2+0x38>
  401804:	be 08 32 40 00       	mov    $0x403208,%esi
  401809:	bf 01 00 00 00       	mov    $0x1,%edi
  40180e:	b8 00 00 00 00       	mov    $0x0,%eax
  401813:	e8 d8 f5 ff ff       	callq  400df0 <__printf_chk@plt>
  401818:	bf 02 00 00 00       	mov    $0x2,%edi
  40181d:	e8 8b 05 00 00       	callq  401dad <validate>
  401822:	eb 1e                	jmp    401842 <touch2+0x56>
  401824:	be 30 32 40 00       	mov    $0x403230,%esi
  401829:	bf 01 00 00 00       	mov    $0x1,%edi
  40182e:	b8 00 00 00 00       	mov    $0x0,%eax
  401833:	e8 b8 f5 ff ff       	callq  400df0 <__printf_chk@plt>
  401838:	bf 02 00 00 00       	mov    $0x2,%edi
  40183d:	e8 2d 06 00 00       	callq  401e6f <fail>
  401842:	bf 00 00 00 00       	mov    $0x0,%edi
  401847:	e8 f4 f5 ff ff       	callq  400e40 <exit@plt>

000000000040184c <hexmatch>:
  40184c:	41 54                	push   %r12
  40184e:	55                   	push   %rbp
  40184f:	53                   	push   %rbx
  401850:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
  401854:	41 89 fc             	mov    %edi,%r12d
  401857:	48 89 f5             	mov    %rsi,%rbp
  40185a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401861:	00 00 
  401863:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  401868:	31 c0                	xor    %eax,%eax
  40186a:	e8 41 f5 ff ff       	callq  400db0 <random@plt>
  40186f:	48 89 c1             	mov    %rax,%rcx
  401872:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  401879:	0a d7 a3 
  40187c:	48 f7 ea             	imul   %rdx
  40187f:	48 01 ca             	add    %rcx,%rdx
  401882:	48 c1 fa 06          	sar    $0x6,%rdx
  401886:	48 89 c8             	mov    %rcx,%rax
  401889:	48 c1 f8 3f          	sar    $0x3f,%rax
  40188d:	48 29 c2             	sub    %rax,%rdx
  401890:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  401894:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401898:	48 c1 e0 02          	shl    $0x2,%rax
  40189c:	48 29 c1             	sub    %rax,%rcx
  40189f:	48 8d 1c 0c          	lea    (%rsp,%rcx,1),%rbx
  4018a3:	45 89 e0             	mov    %r12d,%r8d
  4018a6:	b9 02 32 40 00       	mov    $0x403202,%ecx
  4018ab:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  4018b2:	be 01 00 00 00       	mov    $0x1,%esi
  4018b7:	48 89 df             	mov    %rbx,%rdi
  4018ba:	b8 00 00 00 00       	mov    $0x0,%eax
  4018bf:	e8 ac f5 ff ff       	callq  400e70 <__sprintf_chk@plt>
  4018c4:	ba 09 00 00 00       	mov    $0x9,%edx
  4018c9:	48 89 de             	mov    %rbx,%rsi
  4018cc:	48 89 ef             	mov    %rbp,%rdi
  4018cf:	e8 cc f3 ff ff       	callq  400ca0 <strncmp@plt>
  4018d4:	85 c0                	test   %eax,%eax
  4018d6:	0f 94 c0             	sete   %al
  4018d9:	0f b6 c0             	movzbl %al,%eax
  4018dc:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
  4018e1:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  4018e8:	00 00 
  4018ea:	74 05                	je     4018f1 <hexmatch+0xa5>
  4018ec:	e8 ef f3 ff ff       	callq  400ce0 <__stack_chk_fail@plt>
  4018f1:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
  4018f5:	5b                   	pop    %rbx
  4018f6:	5d                   	pop    %rbp
  4018f7:	41 5c                	pop    %r12
  4018f9:	c3                   	retq   

00000000004018fa <touch3>:
  4018fa:	53                   	push   %rbx
  4018fb:	48 89 fb             	mov    %rdi,%rbx
  4018fe:	c7 05 d4 3b 20 00 03 	movl   $0x3,0x203bd4(%rip)        # 6054dc <vlevel>
  401905:	00 00 00 
  401908:	48 89 fe             	mov    %rdi,%rsi
  40190b:	8b 3d d3 3b 20 00    	mov    0x203bd3(%rip),%edi        # 6054e4 <cookie>
  401911:	e8 36 ff ff ff       	callq  40184c <hexmatch>
  401916:	85 c0                	test   %eax,%eax
  401918:	74 23                	je     40193d <touch3+0x43>
  40191a:	48 89 da             	mov    %rbx,%rdx
  40191d:	be 58 32 40 00       	mov    $0x403258,%esi
  401922:	bf 01 00 00 00       	mov    $0x1,%edi
  401927:	b8 00 00 00 00       	mov    $0x0,%eax
  40192c:	e8 bf f4 ff ff       	callq  400df0 <__printf_chk@plt>
  401931:	bf 03 00 00 00       	mov    $0x3,%edi
  401936:	e8 72 04 00 00       	callq  401dad <validate>
  40193b:	eb 21                	jmp    40195e <touch3+0x64>
  40193d:	48 89 da             	mov    %rbx,%rdx
  401940:	be 80 32 40 00       	mov    $0x403280,%esi
  401945:	bf 01 00 00 00       	mov    $0x1,%edi
  40194a:	b8 00 00 00 00       	mov    $0x0,%eax
  40194f:	e8 9c f4 ff ff       	callq  400df0 <__printf_chk@plt>
  401954:	bf 03 00 00 00       	mov    $0x3,%edi
  401959:	e8 11 05 00 00       	callq  401e6f <fail>
  40195e:	bf 00 00 00 00       	mov    $0x0,%edi
  401963:	e8 d8 f4 ff ff       	callq  400e40 <exit@plt>

0000000000401968 <test>:
  401968:	48 83 ec 08          	sub    $0x8,%rsp
  40196c:	b8 00 00 00 00       	mov    $0x0,%eax
  401971:	e8 32 fe ff ff       	callq  4017a8 <getbuf>
  401976:	89 c2                	mov    %eax,%edx
  401978:	be a8 32 40 00       	mov    $0x4032a8,%esi
  40197d:	bf 01 00 00 00       	mov    $0x1,%edi
  401982:	b8 00 00 00 00       	mov    $0x0,%eax
  401987:	e8 64 f4 ff ff       	callq  400df0 <__printf_chk@plt>
  40198c:	48 83 c4 08          	add    $0x8,%rsp
  401990:	c3                   	retq   
  401991:	90                   	nop
  401992:	90                   	nop
  401993:	90                   	nop

0000000000401994 <start_farm>:
  401994:	b8 01 00 00 00       	mov    $0x1,%eax
  401999:	c3                   	retq   

000000000040199a <getval_142>:
  40199a:	b8 fb 78 90 90       	mov    $0x909078fb,%eax
  40199f:	c3                   	retq   

00000000004019a0 <addval_273>:
  4019a0:	8d 87 48 89 c7 c3    	lea    -0x3c3876b8(%rdi),%eax
  4019a6:	c3                   	retq   

00000000004019a7 <addval_219>:
  4019a7:	8d 87 51 73 58 90    	lea    -0x6fa78caf(%rdi),%eax
  4019ad:	c3                   	retq   

00000000004019ae <setval_237>:
  4019ae:	c7 07 48 89 c7 c7    	movl   $0xc7c78948,(%rdi)
  4019b4:	c3                   	retq   

00000000004019b5 <setval_424>:
  4019b5:	c7 07 54 c2 58 92    	movl   $0x9258c254,(%rdi)
  4019bb:	c3                   	retq   

00000000004019bc <setval_470>:
  4019bc:	c7 07 63 48 8d c7    	movl   $0xc78d4863,(%rdi)
  4019c2:	c3                   	retq   

00000000004019c3 <setval_426>:
  4019c3:	c7 07 48 89 c7 90    	movl   $0x90c78948,(%rdi)
  4019c9:	c3                   	retq   

00000000004019ca <getval_280>:
  4019ca:	b8 29 58 90 c3       	mov    $0xc3905829,%eax
  4019cf:	c3                   	retq   

00000000004019d0 <mid_farm>:
  4019d0:	b8 01 00 00 00       	mov    $0x1,%eax
  4019d5:	c3                   	retq   

00000000004019d6 <add_xy>:
  4019d6:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  4019da:	c3                   	retq   

00000000004019db <getval_481>:
  4019db:	b8 5c 89 c2 90       	mov    $0x90c2895c,%eax
  4019e0:	c3                   	retq   

00000000004019e1 <setval_296>:
  4019e1:	c7 07 99 d1 90 90    	movl   $0x9090d199,(%rdi)
  4019e7:	c3                   	retq   

00000000004019e8 <addval_113>:
  4019e8:	8d 87 89 ce 78 c9    	lea    -0x36873177(%rdi),%eax
  4019ee:	c3                   	retq   

00000000004019ef <addval_490>:
  4019ef:	8d 87 8d d1 20 db    	lea    -0x24df2e73(%rdi),%eax
  4019f5:	c3                   	retq   

00000000004019f6 <getval_226>:
  4019f6:	b8 89 d1 48 c0       	mov    $0xc048d189,%eax
  4019fb:	c3                   	retq   

00000000004019fc <setval_384>:
  4019fc:	c7 07 81 d1 84 c0    	movl   $0xc084d181,(%rdi)
  401a02:	c3                   	retq   

0000000000401a03 <addval_190>:
  401a03:	8d 87 41 48 89 e0    	lea    -0x1f76b7bf(%rdi),%eax
  401a09:	c3                   	retq   

0000000000401a0a <setval_276>:
  401a0a:	c7 07 88 c2 08 c9    	movl   $0xc908c288,(%rdi)
  401a10:	c3                   	retq   

0000000000401a11 <addval_436>:
  401a11:	8d 87 89 ce 90 90    	lea    -0x6f6f3177(%rdi),%eax
  401a17:	c3                   	retq   

0000000000401a18 <getval_345>:
  401a18:	b8 48 89 e0 c1       	mov    $0xc1e08948,%eax
  401a1d:	c3                   	retq   

0000000000401a1e <addval_479>:
  401a1e:	8d 87 89 c2 00 c9    	lea    -0x36ff3d77(%rdi),%eax
  401a24:	c3                   	retq   

0000000000401a25 <addval_187>:
  401a25:	8d 87 89 ce 38 c0    	lea    -0x3fc73177(%rdi),%eax
  401a2b:	c3                   	retq   

0000000000401a2c <setval_248>:
  401a2c:	c7 07 81 ce 08 db    	movl   $0xdb08ce81,(%rdi)
  401a32:	c3                   	retq   

0000000000401a33 <getval_159>:
  401a33:	b8 89 d1 38 c9       	mov    $0xc938d189,%eax
  401a38:	c3                   	retq   

0000000000401a39 <addval_110>:
  401a39:	8d 87 c8 89 e0 c3    	lea    -0x3c1f7638(%rdi),%eax
  401a3f:	c3                   	retq   

0000000000401a40 <addval_487>:
  401a40:	8d 87 89 c2 84 c0    	lea    -0x3f7b3d77(%rdi),%eax
  401a46:	c3                   	retq   

0000000000401a47 <addval_201>:
  401a47:	8d 87 48 89 e0 c7    	lea    -0x381f76b8(%rdi),%eax
  401a4d:	c3                   	retq   

0000000000401a4e <getval_272>:
  401a4e:	b8 99 d1 08 d2       	mov    $0xd208d199,%eax
  401a53:	c3                   	retq   

0000000000401a54 <getval_155>:
  401a54:	b8 89 c2 c4 c9       	mov    $0xc9c4c289,%eax
  401a59:	c3                   	retq   

0000000000401a5a <setval_299>:
  401a5a:	c7 07 48 89 e0 91    	movl   $0x91e08948,(%rdi)
  401a60:	c3                   	retq   

0000000000401a61 <addval_404>:
  401a61:	8d 87 89 ce 92 c3    	lea    -0x3c6d3177(%rdi),%eax
  401a67:	c3                   	retq   

0000000000401a68 <getval_311>:
  401a68:	b8 89 d1 08 db       	mov    $0xdb08d189,%eax
  401a6d:	c3                   	retq   

0000000000401a6e <setval_167>:
  401a6e:	c7 07 89 d1 91 c3    	movl   $0xc391d189,(%rdi)
  401a74:	c3                   	retq   

0000000000401a75 <setval_328>:
  401a75:	c7 07 81 c2 38 d2    	movl   $0xd238c281,(%rdi)
  401a7b:	c3                   	retq   

0000000000401a7c <setval_450>:
  401a7c:	c7 07 09 ce 08 c9    	movl   $0xc908ce09,(%rdi)
  401a82:	c3                   	retq   

0000000000401a83 <addval_358>:
  401a83:	8d 87 08 89 e0 90    	lea    -0x6f1f76f8(%rdi),%eax
  401a89:	c3                   	retq   

0000000000401a8a <addval_124>:
  401a8a:	8d 87 89 c2 c7 3c    	lea    0x3cc7c289(%rdi),%eax
  401a90:	c3                   	retq   

0000000000401a91 <getval_169>:
  401a91:	b8 88 ce 20 c0       	mov    $0xc020ce88,%eax
  401a96:	c3                   	retq   

0000000000401a97 <setval_181>:
  401a97:	c7 07 48 89 e0 c2    	movl   $0xc2e08948,(%rdi)
  401a9d:	c3                   	retq   

0000000000401a9e <addval_184>:
  401a9e:	8d 87 89 c2 60 d2    	lea    -0x2d9f3d77(%rdi),%eax
  401aa4:	c3                   	retq   

0000000000401aa5 <getval_472>:
  401aa5:	b8 8d ce 20 d2       	mov    $0xd220ce8d,%eax
  401aaa:	c3                   	retq   

0000000000401aab <setval_350>:
  401aab:	c7 07 48 89 e0 90    	movl   $0x90e08948,(%rdi)
  401ab1:	c3                   	retq   

0000000000401ab2 <end_farm>:
  401ab2:	b8 01 00 00 00       	mov    $0x1,%eax
  401ab7:	c3                   	retq   
  401ab8:	90                   	nop
  401ab9:	90                   	nop
  401aba:	90                   	nop
  401abb:	90                   	nop
  401abc:	90                   	nop
  401abd:	90                   	nop
  401abe:	90                   	nop
  401abf:	90                   	nop

0000000000401ac0 <save_char>:
  401ac0:	8b 05 3e 46 20 00    	mov    0x20463e(%rip),%eax        # 606104 <gets_cnt>
  401ac6:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401acb:	7f 49                	jg     401b16 <save_char+0x56>
  401acd:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401ad0:	89 f9                	mov    %edi,%ecx
  401ad2:	c1 e9 04             	shr    $0x4,%ecx
  401ad5:	48 63 c9             	movslq %ecx,%rcx
  401ad8:	0f b6 b1 d0 35 40 00 	movzbl 0x4035d0(%rcx),%esi
  401adf:	48 63 ca             	movslq %edx,%rcx
  401ae2:	40 88 b1 00 55 60 00 	mov    %sil,0x605500(%rcx)
  401ae9:	8d 4a 01             	lea    0x1(%rdx),%ecx
  401aec:	83 e7 0f             	and    $0xf,%edi
  401aef:	0f b6 b7 d0 35 40 00 	movzbl 0x4035d0(%rdi),%esi
  401af6:	48 63 c9             	movslq %ecx,%rcx
  401af9:	40 88 b1 00 55 60 00 	mov    %sil,0x605500(%rcx)
  401b00:	83 c2 02             	add    $0x2,%edx
  401b03:	48 63 d2             	movslq %edx,%rdx
  401b06:	c6 82 00 55 60 00 20 	movb   $0x20,0x605500(%rdx)
  401b0d:	83 c0 01             	add    $0x1,%eax
  401b10:	89 05 ee 45 20 00    	mov    %eax,0x2045ee(%rip)        # 606104 <gets_cnt>
  401b16:	f3 c3                	repz retq 

0000000000401b18 <save_term>:
  401b18:	8b 05 e6 45 20 00    	mov    0x2045e6(%rip),%eax        # 606104 <gets_cnt>
  401b1e:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401b21:	48 98                	cltq   
  401b23:	c6 80 00 55 60 00 00 	movb   $0x0,0x605500(%rax)
  401b2a:	c3                   	retq   

0000000000401b2b <check_fail>:
  401b2b:	48 83 ec 08          	sub    $0x8,%rsp
  401b2f:	0f be 15 d2 45 20 00 	movsbl 0x2045d2(%rip),%edx        # 606108 <target_prefix>
  401b36:	41 b8 00 55 60 00    	mov    $0x605500,%r8d
  401b3c:	8b 0d 96 39 20 00    	mov    0x203996(%rip),%ecx        # 6054d8 <check_level>
  401b42:	be cb 32 40 00       	mov    $0x4032cb,%esi
  401b47:	bf 01 00 00 00       	mov    $0x1,%edi
  401b4c:	b8 00 00 00 00       	mov    $0x0,%eax
  401b51:	e8 9a f2 ff ff       	callq  400df0 <__printf_chk@plt>
  401b56:	bf 01 00 00 00       	mov    $0x1,%edi
  401b5b:	e8 e0 f2 ff ff       	callq  400e40 <exit@plt>

0000000000401b60 <Gets>:
  401b60:	41 54                	push   %r12
  401b62:	55                   	push   %rbp
  401b63:	53                   	push   %rbx
  401b64:	49 89 fc             	mov    %rdi,%r12
  401b67:	c7 05 93 45 20 00 00 	movl   $0x0,0x204593(%rip)        # 606104 <gets_cnt>
  401b6e:	00 00 00 
  401b71:	48 89 fb             	mov    %rdi,%rbx
  401b74:	eb 11                	jmp    401b87 <Gets+0x27>
  401b76:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401b7a:	88 03                	mov    %al,(%rbx)
  401b7c:	0f b6 f8             	movzbl %al,%edi
  401b7f:	e8 3c ff ff ff       	callq  401ac0 <save_char>
  401b84:	48 89 eb             	mov    %rbp,%rbx
  401b87:	48 8b 3d 42 39 20 00 	mov    0x203942(%rip),%rdi        # 6054d0 <infile>
  401b8e:	e8 2d f2 ff ff       	callq  400dc0 <_IO_getc@plt>
  401b93:	83 f8 ff             	cmp    $0xffffffff,%eax
  401b96:	74 05                	je     401b9d <Gets+0x3d>
  401b98:	83 f8 0a             	cmp    $0xa,%eax
  401b9b:	75 d9                	jne    401b76 <Gets+0x16>
  401b9d:	c6 03 00             	movb   $0x0,(%rbx)
  401ba0:	b8 00 00 00 00       	mov    $0x0,%eax
  401ba5:	e8 6e ff ff ff       	callq  401b18 <save_term>
  401baa:	4c 89 e0             	mov    %r12,%rax
  401bad:	5b                   	pop    %rbx
  401bae:	5d                   	pop    %rbp
  401baf:	41 5c                	pop    %r12
  401bb1:	c3                   	retq   

0000000000401bb2 <notify_server>:
  401bb2:	53                   	push   %rbx
  401bb3:	48 81 ec 30 40 00 00 	sub    $0x4030,%rsp
  401bba:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401bc1:	00 00 
  401bc3:	48 89 84 24 28 40 00 	mov    %rax,0x4028(%rsp)
  401bca:	00 
  401bcb:	31 c0                	xor    %eax,%eax
  401bcd:	83 3d 14 39 20 00 00 	cmpl   $0x0,0x203914(%rip)        # 6054e8 <is_checker>
  401bd4:	0f 85 b2 01 00 00    	jne    401d8c <notify_server+0x1da>
  401bda:	8b 05 24 45 20 00    	mov    0x204524(%rip),%eax        # 606104 <gets_cnt>
  401be0:	83 c0 64             	add    $0x64,%eax
  401be3:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401be8:	7e 1e                	jle    401c08 <notify_server+0x56>
  401bea:	be 00 34 40 00       	mov    $0x403400,%esi
  401bef:	bf 01 00 00 00       	mov    $0x1,%edi
  401bf4:	b8 00 00 00 00       	mov    $0x0,%eax
  401bf9:	e8 f2 f1 ff ff       	callq  400df0 <__printf_chk@plt>
  401bfe:	bf 01 00 00 00       	mov    $0x1,%edi
  401c03:	e8 38 f2 ff ff       	callq  400e40 <exit@plt>
  401c08:	89 fb                	mov    %edi,%ebx
  401c0a:	0f be 15 f7 44 20 00 	movsbl 0x2044f7(%rip),%edx        # 606108 <target_prefix>
  401c11:	83 3d 70 38 20 00 00 	cmpl   $0x0,0x203870(%rip)        # 605488 <notify>
  401c18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401c1d:	0f 45 05 bc 38 20 00 	cmovne 0x2038bc(%rip),%eax        # 6054e0 <authkey>
  401c24:	85 ff                	test   %edi,%edi
  401c26:	b9 e6 32 40 00       	mov    $0x4032e6,%ecx
  401c2b:	41 b9 e1 32 40 00    	mov    $0x4032e1,%r9d
  401c31:	4c 0f 44 c9          	cmove  %rcx,%r9
  401c35:	48 c7 44 24 18 00 55 	movq   $0x605500,0x18(%rsp)
  401c3c:	60 00 
  401c3e:	89 74 24 10          	mov    %esi,0x10(%rsp)
  401c42:	89 54 24 08          	mov    %edx,0x8(%rsp)
  401c46:	89 04 24             	mov    %eax,(%rsp)
  401c49:	44 8b 05 f8 34 20 00 	mov    0x2034f8(%rip),%r8d        # 605148 <target_id>
  401c50:	b9 eb 32 40 00       	mov    $0x4032eb,%ecx
  401c55:	ba 00 20 00 00       	mov    $0x2000,%edx
  401c5a:	be 01 00 00 00       	mov    $0x1,%esi
  401c5f:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  401c64:	b8 00 00 00 00       	mov    $0x0,%eax
  401c69:	e8 02 f2 ff ff       	callq  400e70 <__sprintf_chk@plt>
  401c6e:	83 3d 13 38 20 00 00 	cmpl   $0x0,0x203813(%rip)        # 605488 <notify>
  401c75:	0f 84 83 00 00 00    	je     401cfe <notify_server+0x14c>
  401c7b:	85 db                	test   %ebx,%ebx
  401c7d:	74 70                	je     401cef <notify_server+0x13d>
  401c7f:	4c 8d 8c 24 20 20 00 	lea    0x2020(%rsp),%r9
  401c86:	00 
  401c87:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401c8d:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  401c92:	48 8b 15 b7 34 20 00 	mov    0x2034b7(%rip),%rdx        # 605150 <lab>
  401c99:	48 8b 35 b8 34 20 00 	mov    0x2034b8(%rip),%rsi        # 605158 <course>
  401ca0:	48 8b 3d 99 34 20 00 	mov    0x203499(%rip),%rdi        # 605140 <user_id>
  401ca7:	e8 8b 10 00 00       	callq  402d37 <driver_post>
  401cac:	85 c0                	test   %eax,%eax
  401cae:	79 26                	jns    401cd6 <notify_server+0x124>
  401cb0:	48 8d 94 24 20 20 00 	lea    0x2020(%rsp),%rdx
  401cb7:	00 
  401cb8:	be 07 33 40 00       	mov    $0x403307,%esi
  401cbd:	bf 01 00 00 00       	mov    $0x1,%edi
  401cc2:	b8 00 00 00 00       	mov    $0x0,%eax
  401cc7:	e8 24 f1 ff ff       	callq  400df0 <__printf_chk@plt>
  401ccc:	bf 01 00 00 00       	mov    $0x1,%edi
  401cd1:	e8 6a f1 ff ff       	callq  400e40 <exit@plt>
  401cd6:	bf 30 34 40 00       	mov    $0x403430,%edi
  401cdb:	e8 e0 ef ff ff       	callq  400cc0 <puts@plt>
  401ce0:	bf 13 33 40 00       	mov    $0x403313,%edi
  401ce5:	e8 d6 ef ff ff       	callq  400cc0 <puts@plt>
  401cea:	e9 9d 00 00 00       	jmpq   401d8c <notify_server+0x1da>
  401cef:	bf 1d 33 40 00       	mov    $0x40331d,%edi
  401cf4:	e8 c7 ef ff ff       	callq  400cc0 <puts@plt>
  401cf9:	e9 8e 00 00 00       	jmpq   401d8c <notify_server+0x1da>
  401cfe:	85 db                	test   %ebx,%ebx
  401d00:	b8 e6 32 40 00       	mov    $0x4032e6,%eax
  401d05:	ba e1 32 40 00       	mov    $0x4032e1,%edx
  401d0a:	48 0f 44 d0          	cmove  %rax,%rdx
  401d0e:	be 68 34 40 00       	mov    $0x403468,%esi
  401d13:	bf 01 00 00 00       	mov    $0x1,%edi
  401d18:	b8 00 00 00 00       	mov    $0x0,%eax
  401d1d:	e8 ce f0 ff ff       	callq  400df0 <__printf_chk@plt>
  401d22:	48 8b 15 17 34 20 00 	mov    0x203417(%rip),%rdx        # 605140 <user_id>
  401d29:	be 24 33 40 00       	mov    $0x403324,%esi
  401d2e:	bf 01 00 00 00       	mov    $0x1,%edi
  401d33:	b8 00 00 00 00       	mov    $0x0,%eax
  401d38:	e8 b3 f0 ff ff       	callq  400df0 <__printf_chk@plt>
  401d3d:	48 8b 15 14 34 20 00 	mov    0x203414(%rip),%rdx        # 605158 <course>
  401d44:	be 31 33 40 00       	mov    $0x403331,%esi
  401d49:	bf 01 00 00 00       	mov    $0x1,%edi
  401d4e:	b8 00 00 00 00       	mov    $0x0,%eax
  401d53:	e8 98 f0 ff ff       	callq  400df0 <__printf_chk@plt>
  401d58:	48 8b 15 f1 33 20 00 	mov    0x2033f1(%rip),%rdx        # 605150 <lab>
  401d5f:	be 3d 33 40 00       	mov    $0x40333d,%esi
  401d64:	bf 01 00 00 00       	mov    $0x1,%edi
  401d69:	b8 00 00 00 00       	mov    $0x0,%eax
  401d6e:	e8 7d f0 ff ff       	callq  400df0 <__printf_chk@plt>
  401d73:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
  401d78:	be 46 33 40 00       	mov    $0x403346,%esi
  401d7d:	bf 01 00 00 00       	mov    $0x1,%edi
  401d82:	b8 00 00 00 00       	mov    $0x0,%eax
  401d87:	e8 64 f0 ff ff       	callq  400df0 <__printf_chk@plt>
  401d8c:	48 8b 84 24 28 40 00 	mov    0x4028(%rsp),%rax
  401d93:	00 
  401d94:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401d9b:	00 00 
  401d9d:	74 05                	je     401da4 <notify_server+0x1f2>
  401d9f:	e8 3c ef ff ff       	callq  400ce0 <__stack_chk_fail@plt>
  401da4:	48 81 c4 30 40 00 00 	add    $0x4030,%rsp
  401dab:	5b                   	pop    %rbx
  401dac:	c3                   	retq   

0000000000401dad <validate>:
  401dad:	53                   	push   %rbx
  401dae:	89 fb                	mov    %edi,%ebx
  401db0:	83 3d 31 37 20 00 00 	cmpl   $0x0,0x203731(%rip)        # 6054e8 <is_checker>
  401db7:	74 6b                	je     401e24 <validate+0x77>
  401db9:	39 3d 1d 37 20 00    	cmp    %edi,0x20371d(%rip)        # 6054dc <vlevel>
  401dbf:	74 14                	je     401dd5 <validate+0x28>
  401dc1:	bf 52 33 40 00       	mov    $0x403352,%edi
  401dc6:	e8 f5 ee ff ff       	callq  400cc0 <puts@plt>
  401dcb:	b8 00 00 00 00       	mov    $0x0,%eax
  401dd0:	e8 56 fd ff ff       	callq  401b2b <check_fail>
  401dd5:	8b 15 fd 36 20 00    	mov    0x2036fd(%rip),%edx        # 6054d8 <check_level>
  401ddb:	39 fa                	cmp    %edi,%edx
  401ddd:	74 20                	je     401dff <validate+0x52>
  401ddf:	89 f9                	mov    %edi,%ecx
  401de1:	be 90 34 40 00       	mov    $0x403490,%esi
  401de6:	bf 01 00 00 00       	mov    $0x1,%edi
  401deb:	b8 00 00 00 00       	mov    $0x0,%eax
  401df0:	e8 fb ef ff ff       	callq  400df0 <__printf_chk@plt>
  401df5:	b8 00 00 00 00       	mov    $0x0,%eax
  401dfa:	e8 2c fd ff ff       	callq  401b2b <check_fail>
  401dff:	0f be 15 02 43 20 00 	movsbl 0x204302(%rip),%edx        # 606108 <target_prefix>
  401e06:	41 b8 00 55 60 00    	mov    $0x605500,%r8d
  401e0c:	89 f9                	mov    %edi,%ecx
  401e0e:	be 70 33 40 00       	mov    $0x403370,%esi
  401e13:	bf 01 00 00 00       	mov    $0x1,%edi
  401e18:	b8 00 00 00 00       	mov    $0x0,%eax
  401e1d:	e8 ce ef ff ff       	callq  400df0 <__printf_chk@plt>
  401e22:	eb 49                	jmp    401e6d <validate+0xc0>
  401e24:	39 3d b2 36 20 00    	cmp    %edi,0x2036b2(%rip)        # 6054dc <vlevel>
  401e2a:	74 18                	je     401e44 <validate+0x97>
  401e2c:	bf 52 33 40 00       	mov    $0x403352,%edi
  401e31:	e8 8a ee ff ff       	callq  400cc0 <puts@plt>
  401e36:	89 de                	mov    %ebx,%esi
  401e38:	bf 00 00 00 00       	mov    $0x0,%edi
  401e3d:	e8 70 fd ff ff       	callq  401bb2 <notify_server>
  401e42:	eb 29                	jmp    401e6d <validate+0xc0>
  401e44:	0f be 0d bd 42 20 00 	movsbl 0x2042bd(%rip),%ecx        # 606108 <target_prefix>
  401e4b:	89 fa                	mov    %edi,%edx
  401e4d:	be b8 34 40 00       	mov    $0x4034b8,%esi
  401e52:	bf 01 00 00 00       	mov    $0x1,%edi
  401e57:	b8 00 00 00 00       	mov    $0x0,%eax
  401e5c:	e8 8f ef ff ff       	callq  400df0 <__printf_chk@plt>
  401e61:	89 de                	mov    %ebx,%esi
  401e63:	bf 01 00 00 00       	mov    $0x1,%edi
  401e68:	e8 45 fd ff ff       	callq  401bb2 <notify_server>
  401e6d:	5b                   	pop    %rbx
  401e6e:	c3                   	retq   

0000000000401e6f <fail>:
  401e6f:	48 83 ec 08          	sub    $0x8,%rsp
  401e73:	83 3d 6e 36 20 00 00 	cmpl   $0x0,0x20366e(%rip)        # 6054e8 <is_checker>
  401e7a:	74 0a                	je     401e86 <fail+0x17>
  401e7c:	b8 00 00 00 00       	mov    $0x0,%eax
  401e81:	e8 a5 fc ff ff       	callq  401b2b <check_fail>
  401e86:	89 fe                	mov    %edi,%esi
  401e88:	bf 00 00 00 00       	mov    $0x0,%edi
  401e8d:	e8 20 fd ff ff       	callq  401bb2 <notify_server>
  401e92:	48 83 c4 08          	add    $0x8,%rsp
  401e96:	c3                   	retq   

0000000000401e97 <bushandler>:
  401e97:	48 83 ec 08          	sub    $0x8,%rsp
  401e9b:	83 3d 46 36 20 00 00 	cmpl   $0x0,0x203646(%rip)        # 6054e8 <is_checker>
  401ea2:	74 14                	je     401eb8 <bushandler+0x21>
  401ea4:	bf 85 33 40 00       	mov    $0x403385,%edi
  401ea9:	e8 12 ee ff ff       	callq  400cc0 <puts@plt>
  401eae:	b8 00 00 00 00       	mov    $0x0,%eax
  401eb3:	e8 73 fc ff ff       	callq  401b2b <check_fail>
  401eb8:	bf f0 34 40 00       	mov    $0x4034f0,%edi
  401ebd:	e8 fe ed ff ff       	callq  400cc0 <puts@plt>
  401ec2:	bf 8f 33 40 00       	mov    $0x40338f,%edi
  401ec7:	e8 f4 ed ff ff       	callq  400cc0 <puts@plt>
  401ecc:	be 00 00 00 00       	mov    $0x0,%esi
  401ed1:	bf 00 00 00 00       	mov    $0x0,%edi
  401ed6:	e8 d7 fc ff ff       	callq  401bb2 <notify_server>
  401edb:	bf 01 00 00 00       	mov    $0x1,%edi
  401ee0:	e8 5b ef ff ff       	callq  400e40 <exit@plt>

0000000000401ee5 <seghandler>:
  401ee5:	48 83 ec 08          	sub    $0x8,%rsp
  401ee9:	83 3d f8 35 20 00 00 	cmpl   $0x0,0x2035f8(%rip)        # 6054e8 <is_checker>
  401ef0:	74 14                	je     401f06 <seghandler+0x21>
  401ef2:	bf a5 33 40 00       	mov    $0x4033a5,%edi
  401ef7:	e8 c4 ed ff ff       	callq  400cc0 <puts@plt>
  401efc:	b8 00 00 00 00       	mov    $0x0,%eax
  401f01:	e8 25 fc ff ff       	callq  401b2b <check_fail>
  401f06:	bf 10 35 40 00       	mov    $0x403510,%edi
  401f0b:	e8 b0 ed ff ff       	callq  400cc0 <puts@plt>
  401f10:	bf 8f 33 40 00       	mov    $0x40338f,%edi
  401f15:	e8 a6 ed ff ff       	callq  400cc0 <puts@plt>
  401f1a:	be 00 00 00 00       	mov    $0x0,%esi
  401f1f:	bf 00 00 00 00       	mov    $0x0,%edi
  401f24:	e8 89 fc ff ff       	callq  401bb2 <notify_server>
  401f29:	bf 01 00 00 00       	mov    $0x1,%edi
  401f2e:	e8 0d ef ff ff       	callq  400e40 <exit@plt>

0000000000401f33 <illegalhandler>:
  401f33:	48 83 ec 08          	sub    $0x8,%rsp
  401f37:	83 3d aa 35 20 00 00 	cmpl   $0x0,0x2035aa(%rip)        # 6054e8 <is_checker>
  401f3e:	74 14                	je     401f54 <illegalhandler+0x21>
  401f40:	bf b8 33 40 00       	mov    $0x4033b8,%edi
  401f45:	e8 76 ed ff ff       	callq  400cc0 <puts@plt>
  401f4a:	b8 00 00 00 00       	mov    $0x0,%eax
  401f4f:	e8 d7 fb ff ff       	callq  401b2b <check_fail>
  401f54:	bf 38 35 40 00       	mov    $0x403538,%edi
  401f59:	e8 62 ed ff ff       	callq  400cc0 <puts@plt>
  401f5e:	bf 8f 33 40 00       	mov    $0x40338f,%edi
  401f63:	e8 58 ed ff ff       	callq  400cc0 <puts@plt>
  401f68:	be 00 00 00 00       	mov    $0x0,%esi
  401f6d:	bf 00 00 00 00       	mov    $0x0,%edi
  401f72:	e8 3b fc ff ff       	callq  401bb2 <notify_server>
  401f77:	bf 01 00 00 00       	mov    $0x1,%edi
  401f7c:	e8 bf ee ff ff       	callq  400e40 <exit@plt>

0000000000401f81 <sigalrmhandler>:
  401f81:	48 83 ec 08          	sub    $0x8,%rsp
  401f85:	83 3d 5c 35 20 00 00 	cmpl   $0x0,0x20355c(%rip)        # 6054e8 <is_checker>
  401f8c:	74 14                	je     401fa2 <sigalrmhandler+0x21>
  401f8e:	bf cc 33 40 00       	mov    $0x4033cc,%edi
  401f93:	e8 28 ed ff ff       	callq  400cc0 <puts@plt>
  401f98:	b8 00 00 00 00       	mov    $0x0,%eax
  401f9d:	e8 89 fb ff ff       	callq  401b2b <check_fail>
  401fa2:	ba 05 00 00 00       	mov    $0x5,%edx
  401fa7:	be 68 35 40 00       	mov    $0x403568,%esi
  401fac:	bf 01 00 00 00       	mov    $0x1,%edi
  401fb1:	b8 00 00 00 00       	mov    $0x0,%eax
  401fb6:	e8 35 ee ff ff       	callq  400df0 <__printf_chk@plt>
  401fbb:	be 00 00 00 00       	mov    $0x0,%esi
  401fc0:	bf 00 00 00 00       	mov    $0x0,%edi
  401fc5:	e8 e8 fb ff ff       	callq  401bb2 <notify_server>
  401fca:	bf 01 00 00 00       	mov    $0x1,%edi
  401fcf:	e8 6c ee ff ff       	callq  400e40 <exit@plt>

0000000000401fd4 <launch>:
  401fd4:	55                   	push   %rbp
  401fd5:	48 89 e5             	mov    %rsp,%rbp
  401fd8:	48 83 ec 10          	sub    $0x10,%rsp
  401fdc:	48 89 fa             	mov    %rdi,%rdx
  401fdf:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401fe6:	00 00 
  401fe8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401fec:	31 c0                	xor    %eax,%eax
  401fee:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  401ff2:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  401ff6:	48 29 c4             	sub    %rax,%rsp
  401ff9:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  401ffe:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  402002:	be f4 00 00 00       	mov    $0xf4,%esi
  402007:	e8 f4 ec ff ff       	callq  400d00 <memset@plt>
  40200c:	48 8b 05 8d 34 20 00 	mov    0x20348d(%rip),%rax        # 6054a0 <stdin@@GLIBC_2.2.5>
  402013:	48 39 05 b6 34 20 00 	cmp    %rax,0x2034b6(%rip)        # 6054d0 <infile>
  40201a:	75 14                	jne    402030 <launch+0x5c>
  40201c:	be d4 33 40 00       	mov    $0x4033d4,%esi
  402021:	bf 01 00 00 00       	mov    $0x1,%edi
  402026:	b8 00 00 00 00       	mov    $0x0,%eax
  40202b:	e8 c0 ed ff ff       	callq  400df0 <__printf_chk@plt>
  402030:	c7 05 a2 34 20 00 00 	movl   $0x0,0x2034a2(%rip)        # 6054dc <vlevel>
  402037:	00 00 00 
  40203a:	b8 00 00 00 00       	mov    $0x0,%eax
  40203f:	e8 24 f9 ff ff       	callq  401968 <test>
  402044:	83 3d 9d 34 20 00 00 	cmpl   $0x0,0x20349d(%rip)        # 6054e8 <is_checker>
  40204b:	74 14                	je     402061 <launch+0x8d>
  40204d:	bf e1 33 40 00       	mov    $0x4033e1,%edi
  402052:	e8 69 ec ff ff       	callq  400cc0 <puts@plt>
  402057:	b8 00 00 00 00       	mov    $0x0,%eax
  40205c:	e8 ca fa ff ff       	callq  401b2b <check_fail>
  402061:	bf ec 33 40 00       	mov    $0x4033ec,%edi
  402066:	e8 55 ec ff ff       	callq  400cc0 <puts@plt>
  40206b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40206f:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  402076:	00 00 
  402078:	74 05                	je     40207f <launch+0xab>
  40207a:	e8 61 ec ff ff       	callq  400ce0 <__stack_chk_fail@plt>
  40207f:	c9                   	leaveq 
  402080:	c3                   	retq   

0000000000402081 <stable_launch>:
  402081:	53                   	push   %rbx
  402082:	48 89 3d 3f 34 20 00 	mov    %rdi,0x20343f(%rip)        # 6054c8 <global_offset>
  402089:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  40208f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  402095:	b9 32 01 00 00       	mov    $0x132,%ecx
  40209a:	ba 07 00 00 00       	mov    $0x7,%edx
  40209f:	be 00 00 10 00       	mov    $0x100000,%esi
  4020a4:	bf 00 60 58 55       	mov    $0x55586000,%edi
  4020a9:	e8 42 ec ff ff       	callq  400cf0 <mmap@plt>
  4020ae:	48 89 c3             	mov    %rax,%rbx
  4020b1:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  4020b7:	74 37                	je     4020f0 <stable_launch+0x6f>
  4020b9:	be 00 00 10 00       	mov    $0x100000,%esi
  4020be:	48 89 c7             	mov    %rax,%rdi
  4020c1:	e8 1a ed ff ff       	callq  400de0 <munmap@plt>
  4020c6:	b9 00 60 58 55       	mov    $0x55586000,%ecx
  4020cb:	ba a0 35 40 00       	mov    $0x4035a0,%edx
  4020d0:	be 01 00 00 00       	mov    $0x1,%esi
  4020d5:	48 8b 3d d4 33 20 00 	mov    0x2033d4(%rip),%rdi        # 6054b0 <stderr@@GLIBC_2.2.5>
  4020dc:	b8 00 00 00 00       	mov    $0x0,%eax
  4020e1:	e8 7a ed ff ff       	callq  400e60 <__fprintf_chk@plt>
  4020e6:	bf 01 00 00 00       	mov    $0x1,%edi
  4020eb:	e8 50 ed ff ff       	callq  400e40 <exit@plt>
  4020f0:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  4020f7:	48 89 15 12 40 20 00 	mov    %rdx,0x204012(%rip)        # 606110 <stack_top>
  4020fe:	48 89 e0             	mov    %rsp,%rax
  402101:	48 89 d4             	mov    %rdx,%rsp
  402104:	48 89 c2             	mov    %rax,%rdx
  402107:	48 89 15 b2 33 20 00 	mov    %rdx,0x2033b2(%rip)        # 6054c0 <global_save_stack>
  40210e:	48 8b 3d b3 33 20 00 	mov    0x2033b3(%rip),%rdi        # 6054c8 <global_offset>
  402115:	e8 ba fe ff ff       	callq  401fd4 <launch>
  40211a:	48 8b 05 9f 33 20 00 	mov    0x20339f(%rip),%rax        # 6054c0 <global_save_stack>
  402121:	48 89 c4             	mov    %rax,%rsp
  402124:	be 00 00 10 00       	mov    $0x100000,%esi
  402129:	48 89 df             	mov    %rbx,%rdi
  40212c:	e8 af ec ff ff       	callq  400de0 <munmap@plt>
  402131:	5b                   	pop    %rbx
  402132:	c3                   	retq   
  402133:	90                   	nop
  402134:	90                   	nop
  402135:	90                   	nop
  402136:	90                   	nop
  402137:	90                   	nop
  402138:	90                   	nop
  402139:	90                   	nop
  40213a:	90                   	nop
  40213b:	90                   	nop
  40213c:	90                   	nop
  40213d:	90                   	nop
  40213e:	90                   	nop
  40213f:	90                   	nop

0000000000402140 <rio_readinitb>:
  402140:	89 37                	mov    %esi,(%rdi)
  402142:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  402149:	48 8d 47 10          	lea    0x10(%rdi),%rax
  40214d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  402151:	c3                   	retq   

0000000000402152 <sigalrm_handler>:
  402152:	48 83 ec 08          	sub    $0x8,%rsp
  402156:	b9 00 00 00 00       	mov    $0x0,%ecx
  40215b:	ba e0 35 40 00       	mov    $0x4035e0,%edx
  402160:	be 01 00 00 00       	mov    $0x1,%esi
  402165:	48 8b 3d 44 33 20 00 	mov    0x203344(%rip),%rdi        # 6054b0 <stderr@@GLIBC_2.2.5>
  40216c:	b8 00 00 00 00       	mov    $0x0,%eax
  402171:	e8 ea ec ff ff       	callq  400e60 <__fprintf_chk@plt>
  402176:	bf 01 00 00 00       	mov    $0x1,%edi
  40217b:	e8 c0 ec ff ff       	callq  400e40 <exit@plt>

0000000000402180 <rio_writen>:
  402180:	41 55                	push   %r13
  402182:	41 54                	push   %r12
  402184:	55                   	push   %rbp
  402185:	53                   	push   %rbx
  402186:	48 83 ec 08          	sub    $0x8,%rsp
  40218a:	41 89 fc             	mov    %edi,%r12d
  40218d:	48 89 f5             	mov    %rsi,%rbp
  402190:	49 89 d5             	mov    %rdx,%r13
  402193:	48 89 d3             	mov    %rdx,%rbx
  402196:	eb 28                	jmp    4021c0 <rio_writen+0x40>
  402198:	48 89 da             	mov    %rbx,%rdx
  40219b:	48 89 ee             	mov    %rbp,%rsi
  40219e:	44 89 e7             	mov    %r12d,%edi
  4021a1:	e8 2a eb ff ff       	callq  400cd0 <write@plt>
  4021a6:	48 85 c0             	test   %rax,%rax
  4021a9:	7f 0f                	jg     4021ba <rio_writen+0x3a>
  4021ab:	e8 d0 ea ff ff       	callq  400c80 <__errno_location@plt>
  4021b0:	83 38 04             	cmpl   $0x4,(%rax)
  4021b3:	75 15                	jne    4021ca <rio_writen+0x4a>
  4021b5:	b8 00 00 00 00       	mov    $0x0,%eax
  4021ba:	48 29 c3             	sub    %rax,%rbx
  4021bd:	48 01 c5             	add    %rax,%rbp
  4021c0:	48 85 db             	test   %rbx,%rbx
  4021c3:	75 d3                	jne    402198 <rio_writen+0x18>
  4021c5:	4c 89 e8             	mov    %r13,%rax
  4021c8:	eb 07                	jmp    4021d1 <rio_writen+0x51>
  4021ca:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4021d1:	48 83 c4 08          	add    $0x8,%rsp
  4021d5:	5b                   	pop    %rbx
  4021d6:	5d                   	pop    %rbp
  4021d7:	41 5c                	pop    %r12
  4021d9:	41 5d                	pop    %r13
  4021db:	c3                   	retq   

00000000004021dc <rio_read>:
  4021dc:	41 55                	push   %r13
  4021de:	41 54                	push   %r12
  4021e0:	55                   	push   %rbp
  4021e1:	53                   	push   %rbx
  4021e2:	48 83 ec 08          	sub    $0x8,%rsp
  4021e6:	48 89 fb             	mov    %rdi,%rbx
  4021e9:	49 89 f5             	mov    %rsi,%r13
  4021ec:	49 89 d4             	mov    %rdx,%r12
  4021ef:	48 8d 6f 10          	lea    0x10(%rdi),%rbp
  4021f3:	eb 2a                	jmp    40221f <rio_read+0x43>
  4021f5:	8b 3b                	mov    (%rbx),%edi
  4021f7:	ba 00 20 00 00       	mov    $0x2000,%edx
  4021fc:	48 89 ee             	mov    %rbp,%rsi
  4021ff:	e8 2c eb ff ff       	callq  400d30 <read@plt>
  402204:	89 43 04             	mov    %eax,0x4(%rbx)
  402207:	85 c0                	test   %eax,%eax
  402209:	79 0c                	jns    402217 <rio_read+0x3b>
  40220b:	e8 70 ea ff ff       	callq  400c80 <__errno_location@plt>
  402210:	83 38 04             	cmpl   $0x4,(%rax)
  402213:	74 0a                	je     40221f <rio_read+0x43>
  402215:	eb 37                	jmp    40224e <rio_read+0x72>
  402217:	85 c0                	test   %eax,%eax
  402219:	74 3c                	je     402257 <rio_read+0x7b>
  40221b:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  40221f:	8b 43 04             	mov    0x4(%rbx),%eax
  402222:	85 c0                	test   %eax,%eax
  402224:	7e cf                	jle    4021f5 <rio_read+0x19>
  402226:	89 c2                	mov    %eax,%edx
  402228:	4c 39 e2             	cmp    %r12,%rdx
  40222b:	44 0f 42 e0          	cmovb  %eax,%r12d
  40222f:	49 63 ec             	movslq %r12d,%rbp
  402232:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  402236:	48 89 ea             	mov    %rbp,%rdx
  402239:	4c 89 ef             	mov    %r13,%rdi
  40223c:	e8 4f eb ff ff       	callq  400d90 <memcpy@plt>
  402241:	48 01 6b 08          	add    %rbp,0x8(%rbx)
  402245:	44 29 63 04          	sub    %r12d,0x4(%rbx)
  402249:	48 89 e8             	mov    %rbp,%rax
  40224c:	eb 0e                	jmp    40225c <rio_read+0x80>
  40224e:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402255:	eb 05                	jmp    40225c <rio_read+0x80>
  402257:	b8 00 00 00 00       	mov    $0x0,%eax
  40225c:	48 83 c4 08          	add    $0x8,%rsp
  402260:	5b                   	pop    %rbx
  402261:	5d                   	pop    %rbp
  402262:	41 5c                	pop    %r12
  402264:	41 5d                	pop    %r13
  402266:	c3                   	retq   

0000000000402267 <rio_readlineb>:
  402267:	41 55                	push   %r13
  402269:	41 54                	push   %r12
  40226b:	55                   	push   %rbp
  40226c:	53                   	push   %rbx
  40226d:	48 83 ec 18          	sub    $0x18,%rsp
  402271:	49 89 fd             	mov    %rdi,%r13
  402274:	48 89 f5             	mov    %rsi,%rbp
  402277:	49 89 d4             	mov    %rdx,%r12
  40227a:	bb 01 00 00 00       	mov    $0x1,%ebx
  40227f:	eb 3c                	jmp    4022bd <rio_readlineb+0x56>
  402281:	ba 01 00 00 00       	mov    $0x1,%edx
  402286:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
  40228b:	4c 89 ef             	mov    %r13,%rdi
  40228e:	e8 49 ff ff ff       	callq  4021dc <rio_read>
  402293:	83 f8 01             	cmp    $0x1,%eax
  402296:	75 12                	jne    4022aa <rio_readlineb+0x43>
  402298:	48 8d 55 01          	lea    0x1(%rbp),%rdx
  40229c:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
  4022a1:	88 45 00             	mov    %al,0x0(%rbp)
  4022a4:	3c 0a                	cmp    $0xa,%al
  4022a6:	75 0e                	jne    4022b6 <rio_readlineb+0x4f>
  4022a8:	eb 1a                	jmp    4022c4 <rio_readlineb+0x5d>
  4022aa:	85 c0                	test   %eax,%eax
  4022ac:	75 22                	jne    4022d0 <rio_readlineb+0x69>
  4022ae:	48 83 fb 01          	cmp    $0x1,%rbx
  4022b2:	75 13                	jne    4022c7 <rio_readlineb+0x60>
  4022b4:	eb 23                	jmp    4022d9 <rio_readlineb+0x72>
  4022b6:	48 83 c3 01          	add    $0x1,%rbx
  4022ba:	48 89 d5             	mov    %rdx,%rbp
  4022bd:	4c 39 e3             	cmp    %r12,%rbx
  4022c0:	72 bf                	jb     402281 <rio_readlineb+0x1a>
  4022c2:	eb 03                	jmp    4022c7 <rio_readlineb+0x60>
  4022c4:	48 89 d5             	mov    %rdx,%rbp
  4022c7:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  4022cb:	48 89 d8             	mov    %rbx,%rax
  4022ce:	eb 0e                	jmp    4022de <rio_readlineb+0x77>
  4022d0:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4022d7:	eb 05                	jmp    4022de <rio_readlineb+0x77>
  4022d9:	b8 00 00 00 00       	mov    $0x0,%eax
  4022de:	48 83 c4 18          	add    $0x18,%rsp
  4022e2:	5b                   	pop    %rbx
  4022e3:	5d                   	pop    %rbp
  4022e4:	41 5c                	pop    %r12
  4022e6:	41 5d                	pop    %r13
  4022e8:	c3                   	retq   

00000000004022e9 <urlencode>:
  4022e9:	41 54                	push   %r12
  4022eb:	55                   	push   %rbp
  4022ec:	53                   	push   %rbx
  4022ed:	48 83 ec 10          	sub    $0x10,%rsp
  4022f1:	48 89 fb             	mov    %rdi,%rbx
  4022f4:	48 89 f5             	mov    %rsi,%rbp
  4022f7:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4022fe:	00 00 
  402300:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  402305:	31 c0                	xor    %eax,%eax
  402307:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40230e:	f2 ae                	repnz scas %es:(%rdi),%al
  402310:	48 f7 d1             	not    %rcx
  402313:	8d 41 ff             	lea    -0x1(%rcx),%eax
  402316:	e9 aa 00 00 00       	jmpq   4023c5 <urlencode+0xdc>
  40231b:	44 0f b6 03          	movzbl (%rbx),%r8d
  40231f:	41 80 f8 2a          	cmp    $0x2a,%r8b
  402323:	0f 94 c2             	sete   %dl
  402326:	41 80 f8 2d          	cmp    $0x2d,%r8b
  40232a:	0f 94 c0             	sete   %al
  40232d:	08 c2                	or     %al,%dl
  40232f:	75 24                	jne    402355 <urlencode+0x6c>
  402331:	41 80 f8 2e          	cmp    $0x2e,%r8b
  402335:	74 1e                	je     402355 <urlencode+0x6c>
  402337:	41 80 f8 5f          	cmp    $0x5f,%r8b
  40233b:	74 18                	je     402355 <urlencode+0x6c>
  40233d:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  402341:	3c 09                	cmp    $0x9,%al
  402343:	76 10                	jbe    402355 <urlencode+0x6c>
  402345:	41 8d 40 bf          	lea    -0x41(%r8),%eax
  402349:	3c 19                	cmp    $0x19,%al
  40234b:	76 08                	jbe    402355 <urlencode+0x6c>
  40234d:	41 8d 40 9f          	lea    -0x61(%r8),%eax
  402351:	3c 19                	cmp    $0x19,%al
  402353:	77 0a                	ja     40235f <urlencode+0x76>
  402355:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  402359:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  40235d:	eb 5f                	jmp    4023be <urlencode+0xd5>
  40235f:	41 80 f8 20          	cmp    $0x20,%r8b
  402363:	75 0a                	jne    40236f <urlencode+0x86>
  402365:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  402369:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  40236d:	eb 4f                	jmp    4023be <urlencode+0xd5>
  40236f:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  402373:	3c 5f                	cmp    $0x5f,%al
  402375:	0f 96 c2             	setbe  %dl
  402378:	41 80 f8 09          	cmp    $0x9,%r8b
  40237c:	0f 94 c0             	sete   %al
  40237f:	08 c2                	or     %al,%dl
  402381:	74 50                	je     4023d3 <urlencode+0xea>
  402383:	45 0f b6 c0          	movzbl %r8b,%r8d
  402387:	b9 78 36 40 00       	mov    $0x403678,%ecx
  40238c:	ba 08 00 00 00       	mov    $0x8,%edx
  402391:	be 01 00 00 00       	mov    $0x1,%esi
  402396:	48 89 e7             	mov    %rsp,%rdi
  402399:	b8 00 00 00 00       	mov    $0x0,%eax
  40239e:	e8 cd ea ff ff       	callq  400e70 <__sprintf_chk@plt>
  4023a3:	0f b6 04 24          	movzbl (%rsp),%eax
  4023a7:	88 45 00             	mov    %al,0x0(%rbp)
  4023aa:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  4023af:	88 45 01             	mov    %al,0x1(%rbp)
  4023b2:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  4023b7:	88 45 02             	mov    %al,0x2(%rbp)
  4023ba:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  4023be:	48 83 c3 01          	add    $0x1,%rbx
  4023c2:	44 89 e0             	mov    %r12d,%eax
  4023c5:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  4023c9:	85 c0                	test   %eax,%eax
  4023cb:	0f 85 4a ff ff ff    	jne    40231b <urlencode+0x32>
  4023d1:	eb 05                	jmp    4023d8 <urlencode+0xef>
  4023d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4023d8:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  4023dd:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  4023e4:	00 00 
  4023e6:	74 05                	je     4023ed <urlencode+0x104>
  4023e8:	e8 f3 e8 ff ff       	callq  400ce0 <__stack_chk_fail@plt>
  4023ed:	48 83 c4 10          	add    $0x10,%rsp
  4023f1:	5b                   	pop    %rbx
  4023f2:	5d                   	pop    %rbp
  4023f3:	41 5c                	pop    %r12
  4023f5:	c3                   	retq   

00000000004023f6 <submitr>:
  4023f6:	41 57                	push   %r15
  4023f8:	41 56                	push   %r14
  4023fa:	41 55                	push   %r13
  4023fc:	41 54                	push   %r12
  4023fe:	55                   	push   %rbp
  4023ff:	53                   	push   %rbx
  402400:	48 81 ec 68 a0 00 00 	sub    $0xa068,%rsp
  402407:	49 89 fc             	mov    %rdi,%r12
  40240a:	89 74 24 14          	mov    %esi,0x14(%rsp)
  40240e:	49 89 d7             	mov    %rdx,%r15
  402411:	49 89 ce             	mov    %rcx,%r14
  402414:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  402419:	4d 89 cd             	mov    %r9,%r13
  40241c:	48 8b 9c 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbx
  402423:	00 
  402424:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40242b:	00 00 
  40242d:	48 89 84 24 58 a0 00 	mov    %rax,0xa058(%rsp)
  402434:	00 
  402435:	31 c0                	xor    %eax,%eax
  402437:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
  40243e:	00 
  40243f:	ba 00 00 00 00       	mov    $0x0,%edx
  402444:	be 01 00 00 00       	mov    $0x1,%esi
  402449:	bf 02 00 00 00       	mov    $0x2,%edi
  40244e:	e8 2d ea ff ff       	callq  400e80 <socket@plt>
  402453:	89 c5                	mov    %eax,%ebp
  402455:	85 c0                	test   %eax,%eax
  402457:	79 4e                	jns    4024a7 <submitr+0xb1>
  402459:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402460:	3a 20 43 
  402463:	48 89 03             	mov    %rax,(%rbx)
  402466:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40246d:	20 75 6e 
  402470:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402474:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40247b:	74 6f 20 
  40247e:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402482:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402489:	65 20 73 
  40248c:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402490:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  402497:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  40249d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4024a2:	e9 4a 06 00 00       	jmpq   402af1 <submitr+0x6fb>
  4024a7:	4c 89 e7             	mov    %r12,%rdi
  4024aa:	e8 b1 e8 ff ff       	callq  400d60 <gethostbyname@plt>
  4024af:	48 85 c0             	test   %rax,%rax
  4024b2:	75 67                	jne    40251b <submitr+0x125>
  4024b4:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  4024bb:	3a 20 44 
  4024be:	48 89 03             	mov    %rax,(%rbx)
  4024c1:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  4024c8:	20 75 6e 
  4024cb:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4024cf:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4024d6:	74 6f 20 
  4024d9:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4024dd:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4024e4:	76 65 20 
  4024e7:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4024eb:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4024f2:	72 20 61 
  4024f5:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4024f9:	c7 43 28 64 64 72 65 	movl   $0x65726464,0x28(%rbx)
  402500:	66 c7 43 2c 73 73    	movw   $0x7373,0x2c(%rbx)
  402506:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  40250a:	89 ef                	mov    %ebp,%edi
  40250c:	e8 0f e8 ff ff       	callq  400d20 <close@plt>
  402511:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402516:	e9 d6 05 00 00       	jmpq   402af1 <submitr+0x6fb>
  40251b:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
  402522:	00 00 
  402524:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
  40252b:	00 00 
  40252d:	66 c7 44 24 30 02 00 	movw   $0x2,0x30(%rsp)
  402534:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402538:	48 8b 40 18          	mov    0x18(%rax),%rax
  40253c:	48 8b 30             	mov    (%rax),%rsi
  40253f:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402544:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
  402549:	e8 22 e8 ff ff       	callq  400d70 <__memmove_chk@plt>
  40254e:	0f b7 44 24 14       	movzwl 0x14(%rsp),%eax
  402553:	66 c1 c8 08          	ror    $0x8,%ax
  402557:	66 89 44 24 32       	mov    %ax,0x32(%rsp)
  40255c:	ba 10 00 00 00       	mov    $0x10,%edx
  402561:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  402566:	89 ef                	mov    %ebp,%edi
  402568:	e8 e3 e8 ff ff       	callq  400e50 <connect@plt>
  40256d:	85 c0                	test   %eax,%eax
  40256f:	79 59                	jns    4025ca <submitr+0x1d4>
  402571:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402578:	3a 20 55 
  40257b:	48 89 03             	mov    %rax,(%rbx)
  40257e:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402585:	20 74 6f 
  402588:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40258c:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402593:	65 63 74 
  402596:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40259a:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  4025a1:	68 65 20 
  4025a4:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4025a8:	c7 43 20 73 65 72 76 	movl   $0x76726573,0x20(%rbx)
  4025af:	66 c7 43 24 65 72    	movw   $0x7265,0x24(%rbx)
  4025b5:	c6 43 26 00          	movb   $0x0,0x26(%rbx)
  4025b9:	89 ef                	mov    %ebp,%edi
  4025bb:	e8 60 e7 ff ff       	callq  400d20 <close@plt>
  4025c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025c5:	e9 27 05 00 00       	jmpq   402af1 <submitr+0x6fb>
  4025ca:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  4025d1:	4c 89 ef             	mov    %r13,%rdi
  4025d4:	b8 00 00 00 00       	mov    $0x0,%eax
  4025d9:	48 89 d1             	mov    %rdx,%rcx
  4025dc:	f2 ae                	repnz scas %es:(%rdi),%al
  4025de:	48 f7 d1             	not    %rcx
  4025e1:	48 89 ce             	mov    %rcx,%rsi
  4025e4:	4c 89 ff             	mov    %r15,%rdi
  4025e7:	48 89 d1             	mov    %rdx,%rcx
  4025ea:	f2 ae                	repnz scas %es:(%rdi),%al
  4025ec:	48 f7 d1             	not    %rcx
  4025ef:	49 89 c8             	mov    %rcx,%r8
  4025f2:	4c 89 f7             	mov    %r14,%rdi
  4025f5:	48 89 d1             	mov    %rdx,%rcx
  4025f8:	f2 ae                	repnz scas %es:(%rdi),%al
  4025fa:	49 29 c8             	sub    %rcx,%r8
  4025fd:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  402602:	48 89 d1             	mov    %rdx,%rcx
  402605:	f2 ae                	repnz scas %es:(%rdi),%al
  402607:	49 29 c8             	sub    %rcx,%r8
  40260a:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
  40260f:	49 8d 44 00 7b       	lea    0x7b(%r8,%rax,1),%rax
  402614:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  40261a:	76 72                	jbe    40268e <submitr+0x298>
  40261c:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402623:	3a 20 52 
  402626:	48 89 03             	mov    %rax,(%rbx)
  402629:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  402630:	20 73 74 
  402633:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402637:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  40263e:	74 6f 6f 
  402641:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402645:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  40264c:	65 2e 20 
  40264f:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402653:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  40265a:	61 73 65 
  40265d:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402661:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  402668:	49 54 52 
  40266b:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40266f:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  402676:	55 46 00 
  402679:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40267d:	89 ef                	mov    %ebp,%edi
  40267f:	e8 9c e6 ff ff       	callq  400d20 <close@plt>
  402684:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402689:	e9 63 04 00 00       	jmpq   402af1 <submitr+0x6fb>
  40268e:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402695:	00 
  402696:	b9 00 04 00 00       	mov    $0x400,%ecx
  40269b:	b8 00 00 00 00       	mov    $0x0,%eax
  4026a0:	48 89 f7             	mov    %rsi,%rdi
  4026a3:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  4026a6:	4c 89 ef             	mov    %r13,%rdi
  4026a9:	e8 3b fc ff ff       	callq  4022e9 <urlencode>
  4026ae:	85 c0                	test   %eax,%eax
  4026b0:	0f 89 8a 00 00 00    	jns    402740 <submitr+0x34a>
  4026b6:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4026bd:	3a 20 52 
  4026c0:	48 89 03             	mov    %rax,(%rbx)
  4026c3:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4026ca:	20 73 74 
  4026cd:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4026d1:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  4026d8:	63 6f 6e 
  4026db:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4026df:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  4026e6:	20 61 6e 
  4026e9:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4026ed:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  4026f4:	67 61 6c 
  4026f7:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4026fb:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  402702:	6e 70 72 
  402705:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402709:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  402710:	6c 65 20 
  402713:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402717:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  40271e:	63 74 65 
  402721:	48 89 43 38          	mov    %rax,0x38(%rbx)
  402725:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  40272b:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  40272f:	89 ef                	mov    %ebp,%edi
  402731:	e8 ea e5 ff ff       	callq  400d20 <close@plt>
  402736:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40273b:	e9 b1 03 00 00       	jmpq   402af1 <submitr+0x6fb>
  402740:	4c 89 64 24 08       	mov    %r12,0x8(%rsp)
  402745:	48 8d 84 24 40 20 00 	lea    0x2040(%rsp),%rax
  40274c:	00 
  40274d:	48 89 04 24          	mov    %rax,(%rsp)
  402751:	4d 89 f9             	mov    %r15,%r9
  402754:	4d 89 f0             	mov    %r14,%r8
  402757:	b9 08 36 40 00       	mov    $0x403608,%ecx
  40275c:	ba 00 20 00 00       	mov    $0x2000,%edx
  402761:	be 01 00 00 00       	mov    $0x1,%esi
  402766:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  40276b:	b8 00 00 00 00       	mov    $0x0,%eax
  402770:	e8 fb e6 ff ff       	callq  400e70 <__sprintf_chk@plt>
  402775:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  40277a:	b8 00 00 00 00       	mov    $0x0,%eax
  40277f:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  402786:	f2 ae                	repnz scas %es:(%rdi),%al
  402788:	48 f7 d1             	not    %rcx
  40278b:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  40278f:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  402794:	89 ef                	mov    %ebp,%edi
  402796:	e8 e5 f9 ff ff       	callq  402180 <rio_writen>
  40279b:	48 85 c0             	test   %rax,%rax
  40279e:	79 6e                	jns    40280e <submitr+0x418>
  4027a0:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4027a7:	3a 20 43 
  4027aa:	48 89 03             	mov    %rax,(%rbx)
  4027ad:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4027b4:	20 75 6e 
  4027b7:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4027bb:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4027c2:	74 6f 20 
  4027c5:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4027c9:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  4027d0:	20 74 6f 
  4027d3:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4027d7:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  4027de:	72 65 73 
  4027e1:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4027e5:	48 b8 75 6c 74 20 73 	movabs $0x7672657320746c75,%rax
  4027ec:	65 72 76 
  4027ef:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4027f3:	66 c7 43 30 65 72    	movw   $0x7265,0x30(%rbx)
  4027f9:	c6 43 32 00          	movb   $0x0,0x32(%rbx)
  4027fd:	89 ef                	mov    %ebp,%edi
  4027ff:	e8 1c e5 ff ff       	callq  400d20 <close@plt>
  402804:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402809:	e9 e3 02 00 00       	jmpq   402af1 <submitr+0x6fb>
  40280e:	89 ee                	mov    %ebp,%esi
  402810:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  402817:	00 
  402818:	e8 23 f9 ff ff       	callq  402140 <rio_readinitb>
  40281d:	ba 00 20 00 00       	mov    $0x2000,%edx
  402822:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  402827:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  40282e:	00 
  40282f:	e8 33 fa ff ff       	callq  402267 <rio_readlineb>
  402834:	48 85 c0             	test   %rax,%rax
  402837:	7f 7d                	jg     4028b6 <submitr+0x4c0>
  402839:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402840:	3a 20 43 
  402843:	48 89 03             	mov    %rax,(%rbx)
  402846:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40284d:	20 75 6e 
  402850:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402854:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40285b:	74 6f 20 
  40285e:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402862:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  402869:	66 69 72 
  40286c:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402870:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402877:	61 64 65 
  40287a:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40287e:	48 b8 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rax
  402885:	6d 20 72 
  402888:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40288c:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  402893:	20 73 65 
  402896:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40289a:	c7 43 38 72 76 65 72 	movl   $0x72657672,0x38(%rbx)
  4028a1:	c6 43 3c 00          	movb   $0x0,0x3c(%rbx)
  4028a5:	89 ef                	mov    %ebp,%edi
  4028a7:	e8 74 e4 ff ff       	callq  400d20 <close@plt>
  4028ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4028b1:	e9 3b 02 00 00       	jmpq   402af1 <submitr+0x6fb>
  4028b6:	4c 8d 84 24 40 60 00 	lea    0x6040(%rsp),%r8
  4028bd:	00 
  4028be:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
  4028c3:	48 8d 94 24 40 40 00 	lea    0x4040(%rsp),%rdx
  4028ca:	00 
  4028cb:	be 7f 36 40 00       	mov    $0x40367f,%esi
  4028d0:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  4028d5:	b8 00 00 00 00       	mov    $0x0,%eax
  4028da:	e8 f1 e4 ff ff       	callq  400dd0 <__isoc99_sscanf@plt>
  4028df:	e9 95 00 00 00       	jmpq   402979 <submitr+0x583>
  4028e4:	ba 00 20 00 00       	mov    $0x2000,%edx
  4028e9:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  4028ee:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  4028f5:	00 
  4028f6:	e8 6c f9 ff ff       	callq  402267 <rio_readlineb>
  4028fb:	48 85 c0             	test   %rax,%rax
  4028fe:	7f 79                	jg     402979 <submitr+0x583>
  402900:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402907:	3a 20 43 
  40290a:	48 89 03             	mov    %rax,(%rbx)
  40290d:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402914:	20 75 6e 
  402917:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40291b:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402922:	74 6f 20 
  402925:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402929:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  402930:	68 65 61 
  402933:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402937:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  40293e:	66 72 6f 
  402941:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402945:	48 b8 6d 20 74 68 65 	movabs $0x657220656874206d,%rax
  40294c:	20 72 65 
  40294f:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402953:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  40295a:	73 65 72 
  40295d:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402961:	c7 43 38 76 65 72 00 	movl   $0x726576,0x38(%rbx)
  402968:	89 ef                	mov    %ebp,%edi
  40296a:	e8 b1 e3 ff ff       	callq  400d20 <close@plt>
  40296f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402974:	e9 78 01 00 00       	jmpq   402af1 <submitr+0x6fb>
  402979:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
  40297e:	83 e8 0d             	sub    $0xd,%eax
  402981:	75 0f                	jne    402992 <submitr+0x59c>
  402983:	0f b6 44 24 41       	movzbl 0x41(%rsp),%eax
  402988:	83 e8 0a             	sub    $0xa,%eax
  40298b:	75 05                	jne    402992 <submitr+0x59c>
  40298d:	0f b6 44 24 42       	movzbl 0x42(%rsp),%eax
  402992:	85 c0                	test   %eax,%eax
  402994:	0f 85 4a ff ff ff    	jne    4028e4 <submitr+0x4ee>
  40299a:	ba 00 20 00 00       	mov    $0x2000,%edx
  40299f:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  4029a4:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  4029ab:	00 
  4029ac:	e8 b6 f8 ff ff       	callq  402267 <rio_readlineb>
  4029b1:	48 85 c0             	test   %rax,%rax
  4029b4:	0f 8f 83 00 00 00    	jg     402a3d <submitr+0x647>
  4029ba:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4029c1:	3a 20 43 
  4029c4:	48 89 03             	mov    %rax,(%rbx)
  4029c7:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4029ce:	20 75 6e 
  4029d1:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4029d5:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4029dc:	74 6f 20 
  4029df:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4029e3:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  4029ea:	73 74 61 
  4029ed:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4029f1:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  4029f8:	65 73 73 
  4029fb:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4029ff:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  402a06:	72 6f 6d 
  402a09:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402a0d:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  402a14:	6c 74 20 
  402a17:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402a1b:	c7 43 38 73 65 72 76 	movl   $0x76726573,0x38(%rbx)
  402a22:	66 c7 43 3c 65 72    	movw   $0x7265,0x3c(%rbx)
  402a28:	c6 43 3e 00          	movb   $0x0,0x3e(%rbx)
  402a2c:	89 ef                	mov    %ebp,%edi
  402a2e:	e8 ed e2 ff ff       	callq  400d20 <close@plt>
  402a33:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a38:	e9 b4 00 00 00       	jmpq   402af1 <submitr+0x6fb>
  402a3d:	44 8b 44 24 2c       	mov    0x2c(%rsp),%r8d
  402a42:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  402a49:	74 34                	je     402a7f <submitr+0x689>
  402a4b:	4c 8d 8c 24 40 60 00 	lea    0x6040(%rsp),%r9
  402a52:	00 
  402a53:	b9 48 36 40 00       	mov    $0x403648,%ecx
  402a58:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  402a5f:	be 01 00 00 00       	mov    $0x1,%esi
  402a64:	48 89 df             	mov    %rbx,%rdi
  402a67:	b8 00 00 00 00       	mov    $0x0,%eax
  402a6c:	e8 ff e3 ff ff       	callq  400e70 <__sprintf_chk@plt>
  402a71:	89 ef                	mov    %ebp,%edi
  402a73:	e8 a8 e2 ff ff       	callq  400d20 <close@plt>
  402a78:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a7d:	eb 72                	jmp    402af1 <submitr+0x6fb>
  402a7f:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  402a84:	48 89 df             	mov    %rbx,%rdi
  402a87:	e8 24 e2 ff ff       	callq  400cb0 <strcpy@plt>
  402a8c:	89 ef                	mov    %ebp,%edi
  402a8e:	e8 8d e2 ff ff       	callq  400d20 <close@plt>
  402a93:	0f b6 13             	movzbl (%rbx),%edx
  402a96:	83 ea 4f             	sub    $0x4f,%edx
  402a99:	89 d1                	mov    %edx,%ecx
  402a9b:	85 d2                	test   %edx,%edx
  402a9d:	75 16                	jne    402ab5 <submitr+0x6bf>
  402a9f:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  402aa3:	83 e9 4b             	sub    $0x4b,%ecx
  402aa6:	75 0d                	jne    402ab5 <submitr+0x6bf>
  402aa8:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  402aac:	83 e9 0a             	sub    $0xa,%ecx
  402aaf:	75 04                	jne    402ab5 <submitr+0x6bf>
  402ab1:	0f b6 4b 03          	movzbl 0x3(%rbx),%ecx
  402ab5:	b8 00 00 00 00       	mov    $0x0,%eax
  402aba:	85 c9                	test   %ecx,%ecx
  402abc:	74 33                	je     402af1 <submitr+0x6fb>
  402abe:	bf 90 36 40 00       	mov    $0x403690,%edi
  402ac3:	b9 05 00 00 00       	mov    $0x5,%ecx
  402ac8:	48 89 de             	mov    %rbx,%rsi
  402acb:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402acd:	40 0f 97 c6          	seta   %sil
  402ad1:	0f 92 c1             	setb   %cl
  402ad4:	40 38 ce             	cmp    %cl,%sil
  402ad7:	74 18                	je     402af1 <submitr+0x6fb>
  402ad9:	85 d2                	test   %edx,%edx
  402adb:	75 0d                	jne    402aea <submitr+0x6f4>
  402add:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
  402ae1:	83 ea 4b             	sub    $0x4b,%edx
  402ae4:	75 04                	jne    402aea <submitr+0x6f4>
  402ae6:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  402aea:	83 fa 01             	cmp    $0x1,%edx
  402aed:	19 c0                	sbb    %eax,%eax
  402aef:	f7 d0                	not    %eax
  402af1:	48 8b 9c 24 58 a0 00 	mov    0xa058(%rsp),%rbx
  402af8:	00 
  402af9:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  402b00:	00 00 
  402b02:	74 05                	je     402b09 <submitr+0x713>
  402b04:	e8 d7 e1 ff ff       	callq  400ce0 <__stack_chk_fail@plt>
  402b09:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
  402b10:	5b                   	pop    %rbx
  402b11:	5d                   	pop    %rbp
  402b12:	41 5c                	pop    %r12
  402b14:	41 5d                	pop    %r13
  402b16:	41 5e                	pop    %r14
  402b18:	41 5f                	pop    %r15
  402b1a:	c3                   	retq   

0000000000402b1b <init_timeout>:
  402b1b:	53                   	push   %rbx
  402b1c:	89 fb                	mov    %edi,%ebx
  402b1e:	85 ff                	test   %edi,%edi
  402b20:	74 20                	je     402b42 <init_timeout+0x27>
  402b22:	85 ff                	test   %edi,%edi
  402b24:	b8 00 00 00 00       	mov    $0x0,%eax
  402b29:	0f 48 d8             	cmovs  %eax,%ebx
  402b2c:	be 52 21 40 00       	mov    $0x402152,%esi
  402b31:	bf 0e 00 00 00       	mov    $0xe,%edi
  402b36:	e8 15 e2 ff ff       	callq  400d50 <signal@plt>
  402b3b:	89 df                	mov    %ebx,%edi
  402b3d:	e8 ce e1 ff ff       	callq  400d10 <alarm@plt>
  402b42:	5b                   	pop    %rbx
  402b43:	c3                   	retq   

0000000000402b44 <init_driver>:
  402b44:	55                   	push   %rbp
  402b45:	53                   	push   %rbx
  402b46:	48 83 ec 28          	sub    $0x28,%rsp
  402b4a:	48 89 fd             	mov    %rdi,%rbp
  402b4d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402b54:	00 00 
  402b56:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402b5b:	31 c0                	xor    %eax,%eax
  402b5d:	be 01 00 00 00       	mov    $0x1,%esi
  402b62:	bf 0d 00 00 00       	mov    $0xd,%edi
  402b67:	e8 e4 e1 ff ff       	callq  400d50 <signal@plt>
  402b6c:	be 01 00 00 00       	mov    $0x1,%esi
  402b71:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402b76:	e8 d5 e1 ff ff       	callq  400d50 <signal@plt>
  402b7b:	be 01 00 00 00       	mov    $0x1,%esi
  402b80:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402b85:	e8 c6 e1 ff ff       	callq  400d50 <signal@plt>
  402b8a:	ba 00 00 00 00       	mov    $0x0,%edx
  402b8f:	be 01 00 00 00       	mov    $0x1,%esi
  402b94:	bf 02 00 00 00       	mov    $0x2,%edi
  402b99:	e8 e2 e2 ff ff       	callq  400e80 <socket@plt>
  402b9e:	89 c3                	mov    %eax,%ebx
  402ba0:	85 c0                	test   %eax,%eax
  402ba2:	79 4f                	jns    402bf3 <init_driver+0xaf>
  402ba4:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402bab:	3a 20 43 
  402bae:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402bb2:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402bb9:	20 75 6e 
  402bbc:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402bc0:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402bc7:	74 6f 20 
  402bca:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402bce:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402bd5:	65 20 73 
  402bd8:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402bdc:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402be3:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402be9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402bee:	e9 28 01 00 00       	jmpq   402d1b <init_driver+0x1d7>
  402bf3:	bf 95 36 40 00       	mov    $0x403695,%edi
  402bf8:	e8 63 e1 ff ff       	callq  400d60 <gethostbyname@plt>
  402bfd:	48 85 c0             	test   %rax,%rax
  402c00:	75 68                	jne    402c6a <init_driver+0x126>
  402c02:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402c09:	3a 20 44 
  402c0c:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402c10:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402c17:	20 75 6e 
  402c1a:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402c1e:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402c25:	74 6f 20 
  402c28:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402c2c:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402c33:	76 65 20 
  402c36:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402c3a:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402c41:	72 20 61 
  402c44:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402c48:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402c4f:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402c55:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402c59:	89 df                	mov    %ebx,%edi
  402c5b:	e8 c0 e0 ff ff       	callq  400d20 <close@plt>
  402c60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402c65:	e9 b1 00 00 00       	jmpq   402d1b <init_driver+0x1d7>
  402c6a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402c71:	00 
  402c72:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402c79:	00 00 
  402c7b:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402c81:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402c85:	48 8b 40 18          	mov    0x18(%rax),%rax
  402c89:	48 8b 30             	mov    (%rax),%rsi
  402c8c:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402c91:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402c96:	e8 d5 e0 ff ff       	callq  400d70 <__memmove_chk@plt>
  402c9b:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
  402ca2:	ba 10 00 00 00       	mov    $0x10,%edx
  402ca7:	48 89 e6             	mov    %rsp,%rsi
  402caa:	89 df                	mov    %ebx,%edi
  402cac:	e8 9f e1 ff ff       	callq  400e50 <connect@plt>
  402cb1:	85 c0                	test   %eax,%eax
  402cb3:	79 50                	jns    402d05 <init_driver+0x1c1>
  402cb5:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402cbc:	3a 20 55 
  402cbf:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402cc3:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402cca:	20 74 6f 
  402ccd:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402cd1:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402cd8:	65 63 74 
  402cdb:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402cdf:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402ce6:	65 72 76 
  402ce9:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402ced:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402cf3:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402cf7:	89 df                	mov    %ebx,%edi
  402cf9:	e8 22 e0 ff ff       	callq  400d20 <close@plt>
  402cfe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402d03:	eb 16                	jmp    402d1b <init_driver+0x1d7>
  402d05:	89 df                	mov    %ebx,%edi
  402d07:	e8 14 e0 ff ff       	callq  400d20 <close@plt>
  402d0c:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402d12:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402d16:	b8 00 00 00 00       	mov    $0x0,%eax
  402d1b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  402d20:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402d27:	00 00 
  402d29:	74 05                	je     402d30 <init_driver+0x1ec>
  402d2b:	e8 b0 df ff ff       	callq  400ce0 <__stack_chk_fail@plt>
  402d30:	48 83 c4 28          	add    $0x28,%rsp
  402d34:	5b                   	pop    %rbx
  402d35:	5d                   	pop    %rbp
  402d36:	c3                   	retq   

0000000000402d37 <driver_post>:
  402d37:	53                   	push   %rbx
  402d38:	48 83 ec 10          	sub    $0x10,%rsp
  402d3c:	4c 89 cb             	mov    %r9,%rbx
  402d3f:	45 85 c0             	test   %r8d,%r8d
  402d42:	74 27                	je     402d6b <driver_post+0x34>
  402d44:	48 89 ca             	mov    %rcx,%rdx
  402d47:	be ad 36 40 00       	mov    $0x4036ad,%esi
  402d4c:	bf 01 00 00 00       	mov    $0x1,%edi
  402d51:	b8 00 00 00 00       	mov    $0x0,%eax
  402d56:	e8 95 e0 ff ff       	callq  400df0 <__printf_chk@plt>
  402d5b:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402d60:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402d64:	b8 00 00 00 00       	mov    $0x0,%eax
  402d69:	eb 39                	jmp    402da4 <driver_post+0x6d>
  402d6b:	48 85 ff             	test   %rdi,%rdi
  402d6e:	74 26                	je     402d96 <driver_post+0x5f>
  402d70:	80 3f 00             	cmpb   $0x0,(%rdi)
  402d73:	74 21                	je     402d96 <driver_post+0x5f>
  402d75:	4c 89 0c 24          	mov    %r9,(%rsp)
  402d79:	49 89 c9             	mov    %rcx,%r9
  402d7c:	49 89 d0             	mov    %rdx,%r8
  402d7f:	48 89 f9             	mov    %rdi,%rcx
  402d82:	48 89 f2             	mov    %rsi,%rdx
  402d85:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
  402d8a:	bf 95 36 40 00       	mov    $0x403695,%edi
  402d8f:	e8 62 f6 ff ff       	callq  4023f6 <submitr>
  402d94:	eb 0e                	jmp    402da4 <driver_post+0x6d>
  402d96:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402d9b:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402d9f:	b8 00 00 00 00       	mov    $0x0,%eax
  402da4:	48 83 c4 10          	add    $0x10,%rsp
  402da8:	5b                   	pop    %rbx
  402da9:	c3                   	retq   
  402daa:	90                   	nop
  402dab:	90                   	nop

0000000000402dac <check>:
  402dac:	89 fa                	mov    %edi,%edx
  402dae:	c1 ea 1c             	shr    $0x1c,%edx
  402db1:	b8 00 00 00 00       	mov    $0x0,%eax
  402db6:	b9 00 00 00 00       	mov    $0x0,%ecx
  402dbb:	85 d2                	test   %edx,%edx
  402dbd:	75 0d                	jne    402dcc <check+0x20>
  402dbf:	eb 1b                	jmp    402ddc <check+0x30>
  402dc1:	89 f8                	mov    %edi,%eax
  402dc3:	d3 e8                	shr    %cl,%eax
  402dc5:	3c 0a                	cmp    $0xa,%al
  402dc7:	74 0e                	je     402dd7 <check+0x2b>
  402dc9:	83 c1 08             	add    $0x8,%ecx
  402dcc:	83 f9 1f             	cmp    $0x1f,%ecx
  402dcf:	7e f0                	jle    402dc1 <check+0x15>
  402dd1:	b8 01 00 00 00       	mov    $0x1,%eax
  402dd6:	c3                   	retq   
  402dd7:	b8 00 00 00 00       	mov    $0x0,%eax
  402ddc:	f3 c3                	repz retq 

0000000000402dde <gencookie>:
  402dde:	53                   	push   %rbx
  402ddf:	83 c7 01             	add    $0x1,%edi
  402de2:	e8 a9 de ff ff       	callq  400c90 <srandom@plt>
  402de7:	e8 c4 df ff ff       	callq  400db0 <random@plt>
  402dec:	89 c3                	mov    %eax,%ebx
  402dee:	89 c7                	mov    %eax,%edi
  402df0:	e8 b7 ff ff ff       	callq  402dac <check>
  402df5:	85 c0                	test   %eax,%eax
  402df7:	74 ee                	je     402de7 <gencookie+0x9>
  402df9:	89 d8                	mov    %ebx,%eax
  402dfb:	5b                   	pop    %rbx
  402dfc:	c3                   	retq   
  402dfd:	90                   	nop
  402dfe:	90                   	nop
  402dff:	90                   	nop

0000000000402e00 <__libc_csu_init>:
  402e00:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  402e05:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  402e0a:	48 8d 2d ef 1f 20 00 	lea    0x201fef(%rip),%rbp        # 604e00 <__init_array_end>
  402e11:	4c 8d 25 e0 1f 20 00 	lea    0x201fe0(%rip),%r12        # 604df8 <__frame_dummy_init_array_entry>
  402e18:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  402e1d:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  402e22:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  402e27:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  402e2c:	48 83 ec 38          	sub    $0x38,%rsp
  402e30:	4c 29 e5             	sub    %r12,%rbp
  402e33:	41 89 fd             	mov    %edi,%r13d
  402e36:	49 89 f6             	mov    %rsi,%r14
  402e39:	48 c1 fd 03          	sar    $0x3,%rbp
  402e3d:	49 89 d7             	mov    %rdx,%r15
  402e40:	e8 03 de ff ff       	callq  400c48 <_init>
  402e45:	48 85 ed             	test   %rbp,%rbp
  402e48:	74 1c                	je     402e66 <__libc_csu_init+0x66>
  402e4a:	31 db                	xor    %ebx,%ebx
  402e4c:	0f 1f 40 00          	nopl   0x0(%rax)
  402e50:	4c 89 fa             	mov    %r15,%rdx
  402e53:	4c 89 f6             	mov    %r14,%rsi
  402e56:	44 89 ef             	mov    %r13d,%edi
  402e59:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  402e5d:	48 83 c3 01          	add    $0x1,%rbx
  402e61:	48 39 eb             	cmp    %rbp,%rbx
  402e64:	75 ea                	jne    402e50 <__libc_csu_init+0x50>
  402e66:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  402e6b:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  402e70:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  402e75:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  402e7a:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  402e7f:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  402e84:	48 83 c4 38          	add    $0x38,%rsp
  402e88:	c3                   	retq   
  402e89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000402e90 <__libc_csu_fini>:
  402e90:	f3 c3                	repz retq 
  402e92:	90                   	nop
  402e93:	90                   	nop

Disassembly of section .fini:

0000000000402e94 <_fini>:
  402e94:	48 83 ec 08          	sub    $0x8,%rsp
  402e98:	48 83 c4 08          	add    $0x8,%rsp
  402e9c:	c3                   	retq   
