
ctarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000400c48 <_init>:
  400c48:	48 83 ec 08          	sub    $0x8,%rsp
  400c4c:	e8 6b 02 00 00       	callq  400ebc <call_gmon_start>
  400c51:	48 83 c4 08          	add    $0x8,%rsp
  400c55:	c3                   	retq   

Disassembly of section .plt:

0000000000400c60 <strcasecmp@plt-0x10>:
  400c60:	ff 35 8a 33 20 00    	pushq  0x20338a(%rip)        # 603ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
  400c66:	ff 25 8c 33 20 00    	jmpq   *0x20338c(%rip)        # 603ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
  400c6c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400c70 <strcasecmp@plt>:
  400c70:	ff 25 8a 33 20 00    	jmpq   *0x20338a(%rip)        # 604000 <_GLOBAL_OFFSET_TABLE_+0x18>
  400c76:	68 00 00 00 00       	pushq  $0x0
  400c7b:	e9 e0 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400c80 <__errno_location@plt>:
  400c80:	ff 25 82 33 20 00    	jmpq   *0x203382(%rip)        # 604008 <_GLOBAL_OFFSET_TABLE_+0x20>
  400c86:	68 01 00 00 00       	pushq  $0x1
  400c8b:	e9 d0 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400c90 <srandom@plt>:
  400c90:	ff 25 7a 33 20 00    	jmpq   *0x20337a(%rip)        # 604010 <_GLOBAL_OFFSET_TABLE_+0x28>
  400c96:	68 02 00 00 00       	pushq  $0x2
  400c9b:	e9 c0 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400ca0 <strncmp@plt>:
  400ca0:	ff 25 72 33 20 00    	jmpq   *0x203372(%rip)        # 604018 <_GLOBAL_OFFSET_TABLE_+0x30>
  400ca6:	68 03 00 00 00       	pushq  $0x3
  400cab:	e9 b0 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400cb0 <strcpy@plt>:
  400cb0:	ff 25 6a 33 20 00    	jmpq   *0x20336a(%rip)        # 604020 <_GLOBAL_OFFSET_TABLE_+0x38>
  400cb6:	68 04 00 00 00       	pushq  $0x4
  400cbb:	e9 a0 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400cc0 <puts@plt>:
  400cc0:	ff 25 62 33 20 00    	jmpq   *0x203362(%rip)        # 604028 <_GLOBAL_OFFSET_TABLE_+0x40>
  400cc6:	68 05 00 00 00       	pushq  $0x5
  400ccb:	e9 90 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400cd0 <write@plt>:
  400cd0:	ff 25 5a 33 20 00    	jmpq   *0x20335a(%rip)        # 604030 <_GLOBAL_OFFSET_TABLE_+0x48>
  400cd6:	68 06 00 00 00       	pushq  $0x6
  400cdb:	e9 80 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400ce0 <__stack_chk_fail@plt>:
  400ce0:	ff 25 52 33 20 00    	jmpq   *0x203352(%rip)        # 604038 <_GLOBAL_OFFSET_TABLE_+0x50>
  400ce6:	68 07 00 00 00       	pushq  $0x7
  400ceb:	e9 70 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400cf0 <mmap@plt>:
  400cf0:	ff 25 4a 33 20 00    	jmpq   *0x20334a(%rip)        # 604040 <_GLOBAL_OFFSET_TABLE_+0x58>
  400cf6:	68 08 00 00 00       	pushq  $0x8
  400cfb:	e9 60 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d00 <memset@plt>:
  400d00:	ff 25 42 33 20 00    	jmpq   *0x203342(%rip)        # 604048 <_GLOBAL_OFFSET_TABLE_+0x60>
  400d06:	68 09 00 00 00       	pushq  $0x9
  400d0b:	e9 50 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d10 <alarm@plt>:
  400d10:	ff 25 3a 33 20 00    	jmpq   *0x20333a(%rip)        # 604050 <_GLOBAL_OFFSET_TABLE_+0x68>
  400d16:	68 0a 00 00 00       	pushq  $0xa
  400d1b:	e9 40 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d20 <close@plt>:
  400d20:	ff 25 32 33 20 00    	jmpq   *0x203332(%rip)        # 604058 <_GLOBAL_OFFSET_TABLE_+0x70>
  400d26:	68 0b 00 00 00       	pushq  $0xb
  400d2b:	e9 30 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d30 <read@plt>:
  400d30:	ff 25 2a 33 20 00    	jmpq   *0x20332a(%rip)        # 604060 <_GLOBAL_OFFSET_TABLE_+0x78>
  400d36:	68 0c 00 00 00       	pushq  $0xc
  400d3b:	e9 20 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d40 <__libc_start_main@plt>:
  400d40:	ff 25 22 33 20 00    	jmpq   *0x203322(%rip)        # 604068 <_GLOBAL_OFFSET_TABLE_+0x80>
  400d46:	68 0d 00 00 00       	pushq  $0xd
  400d4b:	e9 10 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d50 <signal@plt>:
  400d50:	ff 25 1a 33 20 00    	jmpq   *0x20331a(%rip)        # 604070 <_GLOBAL_OFFSET_TABLE_+0x88>
  400d56:	68 0e 00 00 00       	pushq  $0xe
  400d5b:	e9 00 ff ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d60 <gethostbyname@plt>:
  400d60:	ff 25 12 33 20 00    	jmpq   *0x203312(%rip)        # 604078 <_GLOBAL_OFFSET_TABLE_+0x90>
  400d66:	68 0f 00 00 00       	pushq  $0xf
  400d6b:	e9 f0 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d70 <__memmove_chk@plt>:
  400d70:	ff 25 0a 33 20 00    	jmpq   *0x20330a(%rip)        # 604080 <_GLOBAL_OFFSET_TABLE_+0x98>
  400d76:	68 10 00 00 00       	pushq  $0x10
  400d7b:	e9 e0 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d80 <strtol@plt>:
  400d80:	ff 25 02 33 20 00    	jmpq   *0x203302(%rip)        # 604088 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400d86:	68 11 00 00 00       	pushq  $0x11
  400d8b:	e9 d0 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400d90 <memcpy@plt>:
  400d90:	ff 25 fa 32 20 00    	jmpq   *0x2032fa(%rip)        # 604090 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400d96:	68 12 00 00 00       	pushq  $0x12
  400d9b:	e9 c0 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400da0 <time@plt>:
  400da0:	ff 25 f2 32 20 00    	jmpq   *0x2032f2(%rip)        # 604098 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400da6:	68 13 00 00 00       	pushq  $0x13
  400dab:	e9 b0 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400db0 <random@plt>:
  400db0:	ff 25 ea 32 20 00    	jmpq   *0x2032ea(%rip)        # 6040a0 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400db6:	68 14 00 00 00       	pushq  $0x14
  400dbb:	e9 a0 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400dc0 <_IO_getc@plt>:
  400dc0:	ff 25 e2 32 20 00    	jmpq   *0x2032e2(%rip)        # 6040a8 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400dc6:	68 15 00 00 00       	pushq  $0x15
  400dcb:	e9 90 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400dd0 <__isoc99_sscanf@plt>:
  400dd0:	ff 25 da 32 20 00    	jmpq   *0x2032da(%rip)        # 6040b0 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400dd6:	68 16 00 00 00       	pushq  $0x16
  400ddb:	e9 80 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400de0 <munmap@plt>:
  400de0:	ff 25 d2 32 20 00    	jmpq   *0x2032d2(%rip)        # 6040b8 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400de6:	68 17 00 00 00       	pushq  $0x17
  400deb:	e9 70 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400df0 <__printf_chk@plt>:
  400df0:	ff 25 ca 32 20 00    	jmpq   *0x2032ca(%rip)        # 6040c0 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400df6:	68 18 00 00 00       	pushq  $0x18
  400dfb:	e9 60 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e00 <fopen@plt>:
  400e00:	ff 25 c2 32 20 00    	jmpq   *0x2032c2(%rip)        # 6040c8 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400e06:	68 19 00 00 00       	pushq  $0x19
  400e0b:	e9 50 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e10 <getopt@plt>:
  400e10:	ff 25 ba 32 20 00    	jmpq   *0x2032ba(%rip)        # 6040d0 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400e16:	68 1a 00 00 00       	pushq  $0x1a
  400e1b:	e9 40 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e20 <strtoul@plt>:
  400e20:	ff 25 b2 32 20 00    	jmpq   *0x2032b2(%rip)        # 6040d8 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400e26:	68 1b 00 00 00       	pushq  $0x1b
  400e2b:	e9 30 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e30 <gethostname@plt>:
  400e30:	ff 25 aa 32 20 00    	jmpq   *0x2032aa(%rip)        # 6040e0 <_GLOBAL_OFFSET_TABLE_+0xf8>
  400e36:	68 1c 00 00 00       	pushq  $0x1c
  400e3b:	e9 20 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e40 <exit@plt>:
  400e40:	ff 25 a2 32 20 00    	jmpq   *0x2032a2(%rip)        # 6040e8 <_GLOBAL_OFFSET_TABLE_+0x100>
  400e46:	68 1d 00 00 00       	pushq  $0x1d
  400e4b:	e9 10 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e50 <connect@plt>:
  400e50:	ff 25 9a 32 20 00    	jmpq   *0x20329a(%rip)        # 6040f0 <_GLOBAL_OFFSET_TABLE_+0x108>
  400e56:	68 1e 00 00 00       	pushq  $0x1e
  400e5b:	e9 00 fe ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e60 <__fprintf_chk@plt>:
  400e60:	ff 25 92 32 20 00    	jmpq   *0x203292(%rip)        # 6040f8 <_GLOBAL_OFFSET_TABLE_+0x110>
  400e66:	68 1f 00 00 00       	pushq  $0x1f
  400e6b:	e9 f0 fd ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e70 <__sprintf_chk@plt>:
  400e70:	ff 25 8a 32 20 00    	jmpq   *0x20328a(%rip)        # 604100 <_GLOBAL_OFFSET_TABLE_+0x118>
  400e76:	68 20 00 00 00       	pushq  $0x20
  400e7b:	e9 e0 fd ff ff       	jmpq   400c60 <_init+0x18>

0000000000400e80 <socket@plt>:
  400e80:	ff 25 82 32 20 00    	jmpq   *0x203282(%rip)        # 604108 <_GLOBAL_OFFSET_TABLE_+0x120>
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
  400e9f:	49 c7 c0 70 2d 40 00 	mov    $0x402d70,%r8
  400ea6:	48 c7 c1 e0 2c 40 00 	mov    $0x402ce0,%rcx
  400ead:	48 c7 c7 ad 11 40 00 	mov    $0x4011ad,%rdi
  400eb4:	e8 87 fe ff ff       	callq  400d40 <__libc_start_main@plt>
  400eb9:	f4                   	hlt    
  400eba:	90                   	nop
  400ebb:	90                   	nop

0000000000400ebc <call_gmon_start>:
  400ebc:	48 83 ec 08          	sub    $0x8,%rsp
  400ec0:	48 8b 05 19 31 20 00 	mov    0x203119(%rip),%rax        # 603fe0 <_DYNAMIC+0x1d0>
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
  400ee0:	b8 97 44 60 00       	mov    $0x604497,%eax
  400ee5:	55                   	push   %rbp
  400ee6:	48 2d 90 44 60 00    	sub    $0x604490,%rax
  400eec:	48 83 f8 0e          	cmp    $0xe,%rax
  400ef0:	48 89 e5             	mov    %rsp,%rbp
  400ef3:	77 02                	ja     400ef7 <deregister_tm_clones+0x17>
  400ef5:	5d                   	pop    %rbp
  400ef6:	c3                   	retq   
  400ef7:	b8 00 00 00 00       	mov    $0x0,%eax
  400efc:	48 85 c0             	test   %rax,%rax
  400eff:	74 f4                	je     400ef5 <deregister_tm_clones+0x15>
  400f01:	5d                   	pop    %rbp
  400f02:	bf 90 44 60 00       	mov    $0x604490,%edi
  400f07:	ff e0                	jmpq   *%rax
  400f09:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400f10 <register_tm_clones>:
  400f10:	b8 90 44 60 00       	mov    $0x604490,%eax
  400f15:	55                   	push   %rbp
  400f16:	48 2d 90 44 60 00    	sub    $0x604490,%rax
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
  400f42:	bf 90 44 60 00       	mov    $0x604490,%edi
  400f47:	ff e2                	jmpq   *%rdx
  400f49:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400f50 <__do_global_dtors_aux>:
  400f50:	80 3d 61 35 20 00 00 	cmpb   $0x0,0x203561(%rip)        # 6044b8 <completed.6976>
  400f57:	75 11                	jne    400f6a <__do_global_dtors_aux+0x1a>
  400f59:	55                   	push   %rbp
  400f5a:	48 89 e5             	mov    %rsp,%rbp
  400f5d:	e8 7e ff ff ff       	callq  400ee0 <deregister_tm_clones>
  400f62:	5d                   	pop    %rbp
  400f63:	c6 05 4e 35 20 00 01 	movb   $0x1,0x20354e(%rip)        # 6044b8 <completed.6976>
  400f6a:	f3 c3                	repz retq 
  400f6c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400f70 <frame_dummy>:
  400f70:	48 83 3d 90 2e 20 00 	cmpq   $0x0,0x202e90(%rip)        # 603e08 <__JCR_END__>
  400f77:	00 
  400f78:	74 1e                	je     400f98 <frame_dummy+0x28>
  400f7a:	b8 00 00 00 00       	mov    $0x0,%eax
  400f7f:	48 85 c0             	test   %rax,%rax
  400f82:	74 14                	je     400f98 <frame_dummy+0x28>
  400f84:	55                   	push   %rbp
  400f85:	bf 08 3e 60 00       	mov    $0x603e08,%edi
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
  400fa7:	83 3d 3a 35 20 00 00 	cmpl   $0x0,0x20353a(%rip)        # 6044e8 <is_checker>
  400fae:	74 3e                	je     400fee <usage+0x4e>
  400fb0:	be 88 2d 40 00       	mov    $0x402d88,%esi
  400fb5:	bf 01 00 00 00       	mov    $0x1,%edi
  400fba:	b8 00 00 00 00       	mov    $0x0,%eax
  400fbf:	e8 2c fe ff ff       	callq  400df0 <__printf_chk@plt>
  400fc4:	bf c0 2d 40 00       	mov    $0x402dc0,%edi
  400fc9:	e8 f2 fc ff ff       	callq  400cc0 <puts@plt>
  400fce:	bf 38 2f 40 00       	mov    $0x402f38,%edi
  400fd3:	e8 e8 fc ff ff       	callq  400cc0 <puts@plt>
  400fd8:	bf e8 2d 40 00       	mov    $0x402de8,%edi
  400fdd:	e8 de fc ff ff       	callq  400cc0 <puts@plt>
  400fe2:	bf 52 2f 40 00       	mov    $0x402f52,%edi
  400fe7:	e8 d4 fc ff ff       	callq  400cc0 <puts@plt>
  400fec:	eb 32                	jmp    401020 <usage+0x80>
  400fee:	be 6e 2f 40 00       	mov    $0x402f6e,%esi
  400ff3:	bf 01 00 00 00       	mov    $0x1,%edi
  400ff8:	b8 00 00 00 00       	mov    $0x0,%eax
  400ffd:	e8 ee fd ff ff       	callq  400df0 <__printf_chk@plt>
  401002:	bf 10 2e 40 00       	mov    $0x402e10,%edi
  401007:	e8 b4 fc ff ff       	callq  400cc0 <puts@plt>
  40100c:	bf 38 2e 40 00       	mov    $0x402e38,%edi
  401011:	e8 aa fc ff ff       	callq  400cc0 <puts@plt>
  401016:	bf 8c 2f 40 00       	mov    $0x402f8c,%edi
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
  401048:	89 3d 8a 34 20 00    	mov    %edi,0x20348a(%rip)        # 6044d8 <check_level>
  40104e:	8b 3d f4 30 20 00    	mov    0x2030f4(%rip),%edi        # 604148 <target_id>
  401054:	e8 65 1c 00 00       	callq  402cbe <gencookie>
  401059:	89 05 85 34 20 00    	mov    %eax,0x203485(%rip)        # 6044e4 <cookie>
  40105f:	89 c7                	mov    %eax,%edi
  401061:	e8 58 1c 00 00       	callq  402cbe <gencookie>
  401066:	89 05 74 34 20 00    	mov    %eax,0x203474(%rip)        # 6044e0 <authkey>
  40106c:	8b 05 d6 30 20 00    	mov    0x2030d6(%rip),%eax        # 604148 <target_id>
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
  4010b7:	48 89 05 c2 33 20 00 	mov    %rax,0x2033c2(%rip)        # 604480 <buf_offset>
  4010be:	c6 05 43 40 20 00 63 	movb   $0x63,0x204043(%rip)        # 605108 <target_prefix>
  4010c5:	83 3d bc 33 20 00 00 	cmpl   $0x0,0x2033bc(%rip)        # 604488 <notify>
  4010cc:	0f 84 b9 00 00 00    	je     40118b <initialize_target+0x161>
  4010d2:	83 3d 0f 34 20 00 00 	cmpl   $0x0,0x20340f(%rip)        # 6044e8 <is_checker>
  4010d9:	0f 85 ac 00 00 00    	jne    40118b <initialize_target+0x161>
  4010df:	be 00 01 00 00       	mov    $0x100,%esi
  4010e4:	48 89 e7             	mov    %rsp,%rdi
  4010e7:	e8 44 fd ff ff       	callq  400e30 <gethostname@plt>
  4010ec:	bb 00 00 00 00       	mov    $0x0,%ebx
  4010f1:	85 c0                	test   %eax,%eax
  4010f3:	74 23                	je     401118 <initialize_target+0xee>
  4010f5:	bf 68 2e 40 00       	mov    $0x402e68,%edi
  4010fa:	e8 c1 fb ff ff       	callq  400cc0 <puts@plt>
  4010ff:	bf 08 00 00 00       	mov    $0x8,%edi
  401104:	e8 37 fd ff ff       	callq  400e40 <exit@plt>
  401109:	48 89 e6             	mov    %rsp,%rsi
  40110c:	e8 5f fb ff ff       	callq  400c70 <strcasecmp@plt>
  401111:	85 c0                	test   %eax,%eax
  401113:	74 1a                	je     40112f <initialize_target+0x105>
  401115:	83 c3 01             	add    $0x1,%ebx
  401118:	48 63 c3             	movslq %ebx,%rax
  40111b:	48 8b 3c c5 60 41 60 	mov    0x604160(,%rax,8),%rdi
  401122:	00 
  401123:	48 85 ff             	test   %rdi,%rdi
  401126:	75 e1                	jne    401109 <initialize_target+0xdf>
  401128:	b8 00 00 00 00       	mov    $0x0,%eax
  40112d:	eb 05                	jmp    401134 <initialize_target+0x10a>
  40112f:	b8 01 00 00 00       	mov    $0x1,%eax
  401134:	85 c0                	test   %eax,%eax
  401136:	75 1c                	jne    401154 <initialize_target+0x12a>
  401138:	48 89 e2             	mov    %rsp,%rdx
  40113b:	be a0 2e 40 00       	mov    $0x402ea0,%esi
  401140:	bf 01 00 00 00       	mov    $0x1,%edi
  401145:	e8 a6 fc ff ff       	callq  400df0 <__printf_chk@plt>
  40114a:	bf 08 00 00 00       	mov    $0x8,%edi
  40114f:	e8 ec fc ff ff       	callq  400e40 <exit@plt>
  401154:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  40115b:	00 
  40115c:	e8 c3 18 00 00       	callq  402a24 <init_driver>
  401161:	85 c0                	test   %eax,%eax
  401163:	79 26                	jns    40118b <initialize_target+0x161>
  401165:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
  40116c:	00 
  40116d:	be e0 2e 40 00       	mov    $0x402ee0,%esi
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
  4011bb:	be c5 1d 40 00       	mov    $0x401dc5,%esi
  4011c0:	bf 0b 00 00 00       	mov    $0xb,%edi
  4011c5:	e8 86 fb ff ff       	callq  400d50 <signal@plt>
  4011ca:	be 77 1d 40 00       	mov    $0x401d77,%esi
  4011cf:	bf 07 00 00 00       	mov    $0x7,%edi
  4011d4:	e8 77 fb ff ff       	callq  400d50 <signal@plt>
  4011d9:	be 13 1e 40 00       	mov    $0x401e13,%esi
  4011de:	bf 04 00 00 00       	mov    $0x4,%edi
  4011e3:	e8 68 fb ff ff       	callq  400d50 <signal@plt>
  4011e8:	bd a5 2f 40 00       	mov    $0x402fa5,%ebp
  4011ed:	83 3d f4 32 20 00 00 	cmpl   $0x0,0x2032f4(%rip)        # 6044e8 <is_checker>
  4011f4:	74 1e                	je     401214 <main+0x67>
  4011f6:	be 61 1e 40 00       	mov    $0x401e61,%esi
  4011fb:	bf 0e 00 00 00       	mov    $0xe,%edi
  401200:	e8 4b fb ff ff       	callq  400d50 <signal@plt>
  401205:	bf 05 00 00 00       	mov    $0x5,%edi
  40120a:	e8 01 fb ff ff       	callq  400d10 <alarm@plt>
  40120f:	bd aa 2f 40 00       	mov    $0x402faa,%ebp
  401214:	48 8b 05 85 32 20 00 	mov    0x203285(%rip),%rax        # 6044a0 <stdin@@GLIBC_2.2.5>
  40121b:	48 89 05 ae 32 20 00 	mov    %rax,0x2032ae(%rip)        # 6044d0 <infile>
  401222:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  401228:	41 be 00 00 00 00    	mov    $0x0,%r14d
  40122e:	e9 c6 00 00 00       	jmpq   4012f9 <main+0x14c>
  401233:	83 e8 61             	sub    $0x61,%eax
  401236:	3c 10                	cmp    $0x10,%al
  401238:	0f 87 9c 00 00 00    	ja     4012da <main+0x12d>
  40123e:	0f b6 c0             	movzbl %al,%eax
  401241:	ff 24 c5 f0 2f 40 00 	jmpq   *0x402ff0(,%rax,8)
  401248:	48 8b 3b             	mov    (%rbx),%rdi
  40124b:	e8 50 fd ff ff       	callq  400fa0 <usage>
  401250:	be 6d 32 40 00       	mov    $0x40326d,%esi
  401255:	48 8b 3d 4c 32 20 00 	mov    0x20324c(%rip),%rdi        # 6044a8 <optarg@@GLIBC_2.2.5>
  40125c:	e8 9f fb ff ff       	callq  400e00 <fopen@plt>
  401261:	48 89 05 68 32 20 00 	mov    %rax,0x203268(%rip)        # 6044d0 <infile>
  401268:	48 85 c0             	test   %rax,%rax
  40126b:	0f 85 88 00 00 00    	jne    4012f9 <main+0x14c>
  401271:	48 8b 0d 30 32 20 00 	mov    0x203230(%rip),%rcx        # 6044a8 <optarg@@GLIBC_2.2.5>
  401278:	ba b2 2f 40 00       	mov    $0x402fb2,%edx
  40127d:	be 01 00 00 00       	mov    $0x1,%esi
  401282:	48 8b 3d 27 32 20 00 	mov    0x203227(%rip),%rdi        # 6044b0 <stderr@@GLIBC_2.2.5>
  401289:	e8 d2 fb ff ff       	callq  400e60 <__fprintf_chk@plt>
  40128e:	b8 01 00 00 00       	mov    $0x1,%eax
  401293:	e9 e4 00 00 00       	jmpq   40137c <main+0x1cf>
  401298:	ba 10 00 00 00       	mov    $0x10,%edx
  40129d:	be 00 00 00 00       	mov    $0x0,%esi
  4012a2:	48 8b 3d ff 31 20 00 	mov    0x2031ff(%rip),%rdi        # 6044a8 <optarg@@GLIBC_2.2.5>
  4012a9:	e8 72 fb ff ff       	callq  400e20 <strtoul@plt>
  4012ae:	41 89 c6             	mov    %eax,%r14d
  4012b1:	eb 46                	jmp    4012f9 <main+0x14c>
  4012b3:	ba 0a 00 00 00       	mov    $0xa,%edx
  4012b8:	be 00 00 00 00       	mov    $0x0,%esi
  4012bd:	48 8b 3d e4 31 20 00 	mov    0x2031e4(%rip),%rdi        # 6044a8 <optarg@@GLIBC_2.2.5>
  4012c4:	e8 b7 fa ff ff       	callq  400d80 <strtol@plt>
  4012c9:	41 89 c5             	mov    %eax,%r13d
  4012cc:	eb 2b                	jmp    4012f9 <main+0x14c>
  4012ce:	c7 05 b0 31 20 00 00 	movl   $0x0,0x2031b0(%rip)        # 604488 <notify>
  4012d5:	00 00 00 
  4012d8:	eb 1f                	jmp    4012f9 <main+0x14c>
  4012da:	0f be d2             	movsbl %dl,%edx
  4012dd:	be cf 2f 40 00       	mov    $0x402fcf,%esi
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
  401311:	be 00 00 00 00       	mov    $0x0,%esi
  401316:	44 89 ef             	mov    %r13d,%edi
  401319:	e8 0c fd ff ff       	callq  40102a <initialize_target>
  40131e:	83 3d c3 31 20 00 00 	cmpl   $0x0,0x2031c3(%rip)        # 6044e8 <is_checker>
  401325:	74 2a                	je     401351 <main+0x1a4>
  401327:	44 3b 35 b2 31 20 00 	cmp    0x2031b2(%rip),%r14d        # 6044e0 <authkey>
  40132e:	74 21                	je     401351 <main+0x1a4>
  401330:	44 89 f2             	mov    %r14d,%edx
  401333:	be 08 2f 40 00       	mov    $0x402f08,%esi
  401338:	bf 01 00 00 00       	mov    $0x1,%edi
  40133d:	b8 00 00 00 00       	mov    $0x0,%eax
  401342:	e8 a9 fa ff ff       	callq  400df0 <__printf_chk@plt>
  401347:	b8 00 00 00 00       	mov    $0x0,%eax
  40134c:	e8 ba 06 00 00       	callq  401a0b <check_fail>
  401351:	8b 15 8d 31 20 00    	mov    0x20318d(%rip),%edx        # 6044e4 <cookie>
  401357:	be e2 2f 40 00       	mov    $0x402fe2,%esi
  40135c:	bf 01 00 00 00       	mov    $0x1,%edi
  401361:	b8 00 00 00 00       	mov    $0x0,%eax
  401366:	e8 85 fa ff ff       	callq  400df0 <__printf_chk@plt>
  40136b:	48 8b 3d 0e 31 20 00 	mov    0x20310e(%rip),%rdi        # 604480 <buf_offset>
  401372:	e8 ea 0b 00 00       	callq  401f61 <stable_launch>
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
  4017af:	e8 8c 02 00 00       	callq  401a40 <Gets>
  4017b4:	b8 01 00 00 00       	mov    $0x1,%eax
  4017b9:	48 83 c4 28          	add    $0x28,%rsp
  4017bd:	c3                   	retq   
  4017be:	90                   	nop
  4017bf:	90                   	nop

00000000004017c0 <touch1>:
  4017c0:	48 83 ec 08          	sub    $0x8,%rsp
  4017c4:	c7 05 0e 2d 20 00 01 	movl   $0x1,0x202d0e(%rip)        # 6044dc <vlevel>
  4017cb:	00 00 00 
  4017ce:	bf c5 30 40 00       	mov    $0x4030c5,%edi
  4017d3:	e8 e8 f4 ff ff       	callq  400cc0 <puts@plt>
  4017d8:	bf 01 00 00 00       	mov    $0x1,%edi
  4017dd:	e8 ab 04 00 00       	callq  401c8d <validate>
  4017e2:	bf 00 00 00 00       	mov    $0x0,%edi
  4017e7:	e8 54 f6 ff ff       	callq  400e40 <exit@plt>

00000000004017ec <touch2>:
  4017ec:	48 83 ec 08          	sub    $0x8,%rsp
  4017f0:	89 fa                	mov    %edi,%edx
  4017f2:	c7 05 e0 2c 20 00 02 	movl   $0x2,0x202ce0(%rip)        # 6044dc <vlevel>
  4017f9:	00 00 00 
  4017fc:	3b 3d e2 2c 20 00    	cmp    0x202ce2(%rip),%edi        # 6044e4 <cookie>
  401802:	75 20                	jne    401824 <touch2+0x38>
  401804:	be e8 30 40 00       	mov    $0x4030e8,%esi
  401809:	bf 01 00 00 00       	mov    $0x1,%edi
  40180e:	b8 00 00 00 00       	mov    $0x0,%eax
  401813:	e8 d8 f5 ff ff       	callq  400df0 <__printf_chk@plt>
  401818:	bf 02 00 00 00       	mov    $0x2,%edi
  40181d:	e8 6b 04 00 00       	callq  401c8d <validate>
  401822:	eb 1e                	jmp    401842 <touch2+0x56>
  401824:	be 10 31 40 00       	mov    $0x403110,%esi
  401829:	bf 01 00 00 00       	mov    $0x1,%edi
  40182e:	b8 00 00 00 00       	mov    $0x0,%eax
  401833:	e8 b8 f5 ff ff       	callq  400df0 <__printf_chk@plt>
  401838:	bf 02 00 00 00       	mov    $0x2,%edi
  40183d:	e8 0d 05 00 00       	callq  401d4f <fail>
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
  4018a6:	b9 e2 30 40 00       	mov    $0x4030e2,%ecx
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
  4018fe:	c7 05 d4 2b 20 00 03 	movl   $0x3,0x202bd4(%rip)        # 6044dc <vlevel>
  401905:	00 00 00 
  401908:	48 89 fe             	mov    %rdi,%rsi
  40190b:	8b 3d d3 2b 20 00    	mov    0x202bd3(%rip),%edi        # 6044e4 <cookie>
  401911:	e8 36 ff ff ff       	callq  40184c <hexmatch>
  401916:	85 c0                	test   %eax,%eax
  401918:	74 23                	je     40193d <touch3+0x43>
  40191a:	48 89 da             	mov    %rbx,%rdx
  40191d:	be 38 31 40 00       	mov    $0x403138,%esi
  401922:	bf 01 00 00 00       	mov    $0x1,%edi
  401927:	b8 00 00 00 00       	mov    $0x0,%eax
  40192c:	e8 bf f4 ff ff       	callq  400df0 <__printf_chk@plt>
  401931:	bf 03 00 00 00       	mov    $0x3,%edi
  401936:	e8 52 03 00 00       	callq  401c8d <validate>
  40193b:	eb 21                	jmp    40195e <touch3+0x64>
  40193d:	48 89 da             	mov    %rbx,%rdx
  401940:	be 60 31 40 00       	mov    $0x403160,%esi
  401945:	bf 01 00 00 00       	mov    $0x1,%edi
  40194a:	b8 00 00 00 00       	mov    $0x0,%eax
  40194f:	e8 9c f4 ff ff       	callq  400df0 <__printf_chk@plt>
  401954:	bf 03 00 00 00       	mov    $0x3,%edi
  401959:	e8 f1 03 00 00       	callq  401d4f <fail>
  40195e:	bf 00 00 00 00       	mov    $0x0,%edi
  401963:	e8 d8 f4 ff ff       	callq  400e40 <exit@plt>

0000000000401968 <test>:
  401968:	48 83 ec 08          	sub    $0x8,%rsp
  40196c:	b8 00 00 00 00       	mov    $0x0,%eax
  401971:	e8 32 fe ff ff       	callq  4017a8 <getbuf>
  401976:	89 c2                	mov    %eax,%edx
  401978:	be 88 31 40 00       	mov    $0x403188,%esi
  40197d:	bf 01 00 00 00       	mov    $0x1,%edi
  401982:	b8 00 00 00 00       	mov    $0x0,%eax
  401987:	e8 64 f4 ff ff       	callq  400df0 <__printf_chk@plt>
  40198c:	48 83 c4 08          	add    $0x8,%rsp
  401990:	c3                   	retq   
  401991:	90                   	nop
  401992:	90                   	nop
  401993:	90                   	nop
  401994:	90                   	nop
  401995:	90                   	nop
  401996:	90                   	nop
  401997:	90                   	nop
  401998:	90                   	nop
  401999:	90                   	nop
  40199a:	90                   	nop
  40199b:	90                   	nop
  40199c:	90                   	nop
  40199d:	90                   	nop
  40199e:	90                   	nop
  40199f:	90                   	nop

00000000004019a0 <save_char>:
  4019a0:	8b 05 5e 37 20 00    	mov    0x20375e(%rip),%eax        # 605104 <gets_cnt>
  4019a6:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  4019ab:	7f 49                	jg     4019f6 <save_char+0x56>
  4019ad:	8d 14 40             	lea    (%rax,%rax,2),%edx
  4019b0:	89 f9                	mov    %edi,%ecx
  4019b2:	c1 e9 04             	shr    $0x4,%ecx
  4019b5:	48 63 c9             	movslq %ecx,%rcx
  4019b8:	0f b6 b1 b0 34 40 00 	movzbl 0x4034b0(%rcx),%esi
  4019bf:	48 63 ca             	movslq %edx,%rcx
  4019c2:	40 88 b1 00 45 60 00 	mov    %sil,0x604500(%rcx)
  4019c9:	8d 4a 01             	lea    0x1(%rdx),%ecx
  4019cc:	83 e7 0f             	and    $0xf,%edi
  4019cf:	0f b6 b7 b0 34 40 00 	movzbl 0x4034b0(%rdi),%esi
  4019d6:	48 63 c9             	movslq %ecx,%rcx
  4019d9:	40 88 b1 00 45 60 00 	mov    %sil,0x604500(%rcx)
  4019e0:	83 c2 02             	add    $0x2,%edx
  4019e3:	48 63 d2             	movslq %edx,%rdx
  4019e6:	c6 82 00 45 60 00 20 	movb   $0x20,0x604500(%rdx)
  4019ed:	83 c0 01             	add    $0x1,%eax
  4019f0:	89 05 0e 37 20 00    	mov    %eax,0x20370e(%rip)        # 605104 <gets_cnt>
  4019f6:	f3 c3                	repz retq 

00000000004019f8 <save_term>:
  4019f8:	8b 05 06 37 20 00    	mov    0x203706(%rip),%eax        # 605104 <gets_cnt>
  4019fe:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401a01:	48 98                	cltq   
  401a03:	c6 80 00 45 60 00 00 	movb   $0x0,0x604500(%rax)
  401a0a:	c3                   	retq   

0000000000401a0b <check_fail>:
  401a0b:	48 83 ec 08          	sub    $0x8,%rsp
  401a0f:	0f be 15 f2 36 20 00 	movsbl 0x2036f2(%rip),%edx        # 605108 <target_prefix>
  401a16:	41 b8 00 45 60 00    	mov    $0x604500,%r8d
  401a1c:	8b 0d b6 2a 20 00    	mov    0x202ab6(%rip),%ecx        # 6044d8 <check_level>
  401a22:	be ab 31 40 00       	mov    $0x4031ab,%esi
  401a27:	bf 01 00 00 00       	mov    $0x1,%edi
  401a2c:	b8 00 00 00 00       	mov    $0x0,%eax
  401a31:	e8 ba f3 ff ff       	callq  400df0 <__printf_chk@plt>
  401a36:	bf 01 00 00 00       	mov    $0x1,%edi
  401a3b:	e8 00 f4 ff ff       	callq  400e40 <exit@plt>

0000000000401a40 <Gets>:
  401a40:	41 54                	push   %r12
  401a42:	55                   	push   %rbp
  401a43:	53                   	push   %rbx
  401a44:	49 89 fc             	mov    %rdi,%r12
  401a47:	c7 05 b3 36 20 00 00 	movl   $0x0,0x2036b3(%rip)        # 605104 <gets_cnt>
  401a4e:	00 00 00 
  401a51:	48 89 fb             	mov    %rdi,%rbx
  401a54:	eb 11                	jmp    401a67 <Gets+0x27>
  401a56:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401a5a:	88 03                	mov    %al,(%rbx)
  401a5c:	0f b6 f8             	movzbl %al,%edi
  401a5f:	e8 3c ff ff ff       	callq  4019a0 <save_char>
  401a64:	48 89 eb             	mov    %rbp,%rbx
  401a67:	48 8b 3d 62 2a 20 00 	mov    0x202a62(%rip),%rdi        # 6044d0 <infile>
  401a6e:	e8 4d f3 ff ff       	callq  400dc0 <_IO_getc@plt>
  401a73:	83 f8 ff             	cmp    $0xffffffff,%eax
  401a76:	74 05                	je     401a7d <Gets+0x3d>
  401a78:	83 f8 0a             	cmp    $0xa,%eax
  401a7b:	75 d9                	jne    401a56 <Gets+0x16>
  401a7d:	c6 03 00             	movb   $0x0,(%rbx)
  401a80:	b8 00 00 00 00       	mov    $0x0,%eax
  401a85:	e8 6e ff ff ff       	callq  4019f8 <save_term>
  401a8a:	4c 89 e0             	mov    %r12,%rax
  401a8d:	5b                   	pop    %rbx
  401a8e:	5d                   	pop    %rbp
  401a8f:	41 5c                	pop    %r12
  401a91:	c3                   	retq   

0000000000401a92 <notify_server>:
  401a92:	53                   	push   %rbx
  401a93:	48 81 ec 30 40 00 00 	sub    $0x4030,%rsp
  401a9a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401aa1:	00 00 
  401aa3:	48 89 84 24 28 40 00 	mov    %rax,0x4028(%rsp)
  401aaa:	00 
  401aab:	31 c0                	xor    %eax,%eax
  401aad:	83 3d 34 2a 20 00 00 	cmpl   $0x0,0x202a34(%rip)        # 6044e8 <is_checker>
  401ab4:	0f 85 b2 01 00 00    	jne    401c6c <notify_server+0x1da>
  401aba:	8b 05 44 36 20 00    	mov    0x203644(%rip),%eax        # 605104 <gets_cnt>
  401ac0:	83 c0 64             	add    $0x64,%eax
  401ac3:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401ac8:	7e 1e                	jle    401ae8 <notify_server+0x56>
  401aca:	be e0 32 40 00       	mov    $0x4032e0,%esi
  401acf:	bf 01 00 00 00       	mov    $0x1,%edi
  401ad4:	b8 00 00 00 00       	mov    $0x0,%eax
  401ad9:	e8 12 f3 ff ff       	callq  400df0 <__printf_chk@plt>
  401ade:	bf 01 00 00 00       	mov    $0x1,%edi
  401ae3:	e8 58 f3 ff ff       	callq  400e40 <exit@plt>
  401ae8:	89 fb                	mov    %edi,%ebx
  401aea:	0f be 15 17 36 20 00 	movsbl 0x203617(%rip),%edx        # 605108 <target_prefix>
  401af1:	83 3d 90 29 20 00 00 	cmpl   $0x0,0x202990(%rip)        # 604488 <notify>
  401af8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401afd:	0f 45 05 dc 29 20 00 	cmovne 0x2029dc(%rip),%eax        # 6044e0 <authkey>
  401b04:	85 ff                	test   %edi,%edi
  401b06:	b9 c6 31 40 00       	mov    $0x4031c6,%ecx
  401b0b:	41 b9 c1 31 40 00    	mov    $0x4031c1,%r9d
  401b11:	4c 0f 44 c9          	cmove  %rcx,%r9
  401b15:	48 c7 44 24 18 00 45 	movq   $0x604500,0x18(%rsp)
  401b1c:	60 00 
  401b1e:	89 74 24 10          	mov    %esi,0x10(%rsp)
  401b22:	89 54 24 08          	mov    %edx,0x8(%rsp)
  401b26:	89 04 24             	mov    %eax,(%rsp)
  401b29:	44 8b 05 18 26 20 00 	mov    0x202618(%rip),%r8d        # 604148 <target_id>
  401b30:	b9 cb 31 40 00       	mov    $0x4031cb,%ecx
  401b35:	ba 00 20 00 00       	mov    $0x2000,%edx
  401b3a:	be 01 00 00 00       	mov    $0x1,%esi
  401b3f:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  401b44:	b8 00 00 00 00       	mov    $0x0,%eax
  401b49:	e8 22 f3 ff ff       	callq  400e70 <__sprintf_chk@plt>
  401b4e:	83 3d 33 29 20 00 00 	cmpl   $0x0,0x202933(%rip)        # 604488 <notify>
  401b55:	0f 84 83 00 00 00    	je     401bde <notify_server+0x14c>
  401b5b:	85 db                	test   %ebx,%ebx
  401b5d:	74 70                	je     401bcf <notify_server+0x13d>
  401b5f:	4c 8d 8c 24 20 20 00 	lea    0x2020(%rsp),%r9
  401b66:	00 
  401b67:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401b6d:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  401b72:	48 8b 15 d7 25 20 00 	mov    0x2025d7(%rip),%rdx        # 604150 <lab>
  401b79:	48 8b 35 d8 25 20 00 	mov    0x2025d8(%rip),%rsi        # 604158 <course>
  401b80:	48 8b 3d b9 25 20 00 	mov    0x2025b9(%rip),%rdi        # 604140 <user_id>
  401b87:	e8 8b 10 00 00       	callq  402c17 <driver_post>
  401b8c:	85 c0                	test   %eax,%eax
  401b8e:	79 26                	jns    401bb6 <notify_server+0x124>
  401b90:	48 8d 94 24 20 20 00 	lea    0x2020(%rsp),%rdx
  401b97:	00 
  401b98:	be e7 31 40 00       	mov    $0x4031e7,%esi
  401b9d:	bf 01 00 00 00       	mov    $0x1,%edi
  401ba2:	b8 00 00 00 00       	mov    $0x0,%eax
  401ba7:	e8 44 f2 ff ff       	callq  400df0 <__printf_chk@plt>
  401bac:	bf 01 00 00 00       	mov    $0x1,%edi
  401bb1:	e8 8a f2 ff ff       	callq  400e40 <exit@plt>
  401bb6:	bf 10 33 40 00       	mov    $0x403310,%edi
  401bbb:	e8 00 f1 ff ff       	callq  400cc0 <puts@plt>
  401bc0:	bf f3 31 40 00       	mov    $0x4031f3,%edi
  401bc5:	e8 f6 f0 ff ff       	callq  400cc0 <puts@plt>
  401bca:	e9 9d 00 00 00       	jmpq   401c6c <notify_server+0x1da>
  401bcf:	bf fd 31 40 00       	mov    $0x4031fd,%edi
  401bd4:	e8 e7 f0 ff ff       	callq  400cc0 <puts@plt>
  401bd9:	e9 8e 00 00 00       	jmpq   401c6c <notify_server+0x1da>
  401bde:	85 db                	test   %ebx,%ebx
  401be0:	b8 c6 31 40 00       	mov    $0x4031c6,%eax
  401be5:	ba c1 31 40 00       	mov    $0x4031c1,%edx
  401bea:	48 0f 44 d0          	cmove  %rax,%rdx
  401bee:	be 48 33 40 00       	mov    $0x403348,%esi
  401bf3:	bf 01 00 00 00       	mov    $0x1,%edi
  401bf8:	b8 00 00 00 00       	mov    $0x0,%eax
  401bfd:	e8 ee f1 ff ff       	callq  400df0 <__printf_chk@plt>
  401c02:	48 8b 15 37 25 20 00 	mov    0x202537(%rip),%rdx        # 604140 <user_id>
  401c09:	be 04 32 40 00       	mov    $0x403204,%esi
  401c0e:	bf 01 00 00 00       	mov    $0x1,%edi
  401c13:	b8 00 00 00 00       	mov    $0x0,%eax
  401c18:	e8 d3 f1 ff ff       	callq  400df0 <__printf_chk@plt>
  401c1d:	48 8b 15 34 25 20 00 	mov    0x202534(%rip),%rdx        # 604158 <course>
  401c24:	be 11 32 40 00       	mov    $0x403211,%esi
  401c29:	bf 01 00 00 00       	mov    $0x1,%edi
  401c2e:	b8 00 00 00 00       	mov    $0x0,%eax
  401c33:	e8 b8 f1 ff ff       	callq  400df0 <__printf_chk@plt>
  401c38:	48 8b 15 11 25 20 00 	mov    0x202511(%rip),%rdx        # 604150 <lab>
  401c3f:	be 1d 32 40 00       	mov    $0x40321d,%esi
  401c44:	bf 01 00 00 00       	mov    $0x1,%edi
  401c49:	b8 00 00 00 00       	mov    $0x0,%eax
  401c4e:	e8 9d f1 ff ff       	callq  400df0 <__printf_chk@plt>
  401c53:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
  401c58:	be 26 32 40 00       	mov    $0x403226,%esi
  401c5d:	bf 01 00 00 00       	mov    $0x1,%edi
  401c62:	b8 00 00 00 00       	mov    $0x0,%eax
  401c67:	e8 84 f1 ff ff       	callq  400df0 <__printf_chk@plt>
  401c6c:	48 8b 84 24 28 40 00 	mov    0x4028(%rsp),%rax
  401c73:	00 
  401c74:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401c7b:	00 00 
  401c7d:	74 05                	je     401c84 <notify_server+0x1f2>
  401c7f:	e8 5c f0 ff ff       	callq  400ce0 <__stack_chk_fail@plt>
  401c84:	48 81 c4 30 40 00 00 	add    $0x4030,%rsp
  401c8b:	5b                   	pop    %rbx
  401c8c:	c3                   	retq   

0000000000401c8d <validate>:
  401c8d:	53                   	push   %rbx
  401c8e:	89 fb                	mov    %edi,%ebx
  401c90:	83 3d 51 28 20 00 00 	cmpl   $0x0,0x202851(%rip)        # 6044e8 <is_checker>
  401c97:	74 6b                	je     401d04 <validate+0x77>
  401c99:	39 3d 3d 28 20 00    	cmp    %edi,0x20283d(%rip)        # 6044dc <vlevel>
  401c9f:	74 14                	je     401cb5 <validate+0x28>
  401ca1:	bf 32 32 40 00       	mov    $0x403232,%edi
  401ca6:	e8 15 f0 ff ff       	callq  400cc0 <puts@plt>
  401cab:	b8 00 00 00 00       	mov    $0x0,%eax
  401cb0:	e8 56 fd ff ff       	callq  401a0b <check_fail>
  401cb5:	8b 15 1d 28 20 00    	mov    0x20281d(%rip),%edx        # 6044d8 <check_level>
  401cbb:	39 fa                	cmp    %edi,%edx
  401cbd:	74 20                	je     401cdf <validate+0x52>
  401cbf:	89 f9                	mov    %edi,%ecx
  401cc1:	be 70 33 40 00       	mov    $0x403370,%esi
  401cc6:	bf 01 00 00 00       	mov    $0x1,%edi
  401ccb:	b8 00 00 00 00       	mov    $0x0,%eax
  401cd0:	e8 1b f1 ff ff       	callq  400df0 <__printf_chk@plt>
  401cd5:	b8 00 00 00 00       	mov    $0x0,%eax
  401cda:	e8 2c fd ff ff       	callq  401a0b <check_fail>
  401cdf:	0f be 15 22 34 20 00 	movsbl 0x203422(%rip),%edx        # 605108 <target_prefix>
  401ce6:	41 b8 00 45 60 00    	mov    $0x604500,%r8d
  401cec:	89 f9                	mov    %edi,%ecx
  401cee:	be 50 32 40 00       	mov    $0x403250,%esi
  401cf3:	bf 01 00 00 00       	mov    $0x1,%edi
  401cf8:	b8 00 00 00 00       	mov    $0x0,%eax
  401cfd:	e8 ee f0 ff ff       	callq  400df0 <__printf_chk@plt>
  401d02:	eb 49                	jmp    401d4d <validate+0xc0>
  401d04:	39 3d d2 27 20 00    	cmp    %edi,0x2027d2(%rip)        # 6044dc <vlevel>
  401d0a:	74 18                	je     401d24 <validate+0x97>
  401d0c:	bf 32 32 40 00       	mov    $0x403232,%edi
  401d11:	e8 aa ef ff ff       	callq  400cc0 <puts@plt>
  401d16:	89 de                	mov    %ebx,%esi
  401d18:	bf 00 00 00 00       	mov    $0x0,%edi
  401d1d:	e8 70 fd ff ff       	callq  401a92 <notify_server>
  401d22:	eb 29                	jmp    401d4d <validate+0xc0>
  401d24:	0f be 0d dd 33 20 00 	movsbl 0x2033dd(%rip),%ecx        # 605108 <target_prefix>
  401d2b:	89 fa                	mov    %edi,%edx
  401d2d:	be 98 33 40 00       	mov    $0x403398,%esi
  401d32:	bf 01 00 00 00       	mov    $0x1,%edi
  401d37:	b8 00 00 00 00       	mov    $0x0,%eax
  401d3c:	e8 af f0 ff ff       	callq  400df0 <__printf_chk@plt>
  401d41:	89 de                	mov    %ebx,%esi
  401d43:	bf 01 00 00 00       	mov    $0x1,%edi
  401d48:	e8 45 fd ff ff       	callq  401a92 <notify_server>
  401d4d:	5b                   	pop    %rbx
  401d4e:	c3                   	retq   

0000000000401d4f <fail>:
  401d4f:	48 83 ec 08          	sub    $0x8,%rsp
  401d53:	83 3d 8e 27 20 00 00 	cmpl   $0x0,0x20278e(%rip)        # 6044e8 <is_checker>
  401d5a:	74 0a                	je     401d66 <fail+0x17>
  401d5c:	b8 00 00 00 00       	mov    $0x0,%eax
  401d61:	e8 a5 fc ff ff       	callq  401a0b <check_fail>
  401d66:	89 fe                	mov    %edi,%esi
  401d68:	bf 00 00 00 00       	mov    $0x0,%edi
  401d6d:	e8 20 fd ff ff       	callq  401a92 <notify_server>
  401d72:	48 83 c4 08          	add    $0x8,%rsp
  401d76:	c3                   	retq   

0000000000401d77 <bushandler>:
  401d77:	48 83 ec 08          	sub    $0x8,%rsp
  401d7b:	83 3d 66 27 20 00 00 	cmpl   $0x0,0x202766(%rip)        # 6044e8 <is_checker>
  401d82:	74 14                	je     401d98 <bushandler+0x21>
  401d84:	bf 65 32 40 00       	mov    $0x403265,%edi
  401d89:	e8 32 ef ff ff       	callq  400cc0 <puts@plt>
  401d8e:	b8 00 00 00 00       	mov    $0x0,%eax
  401d93:	e8 73 fc ff ff       	callq  401a0b <check_fail>
  401d98:	bf d0 33 40 00       	mov    $0x4033d0,%edi
  401d9d:	e8 1e ef ff ff       	callq  400cc0 <puts@plt>
  401da2:	bf 6f 32 40 00       	mov    $0x40326f,%edi
  401da7:	e8 14 ef ff ff       	callq  400cc0 <puts@plt>
  401dac:	be 00 00 00 00       	mov    $0x0,%esi
  401db1:	bf 00 00 00 00       	mov    $0x0,%edi
  401db6:	e8 d7 fc ff ff       	callq  401a92 <notify_server>
  401dbb:	bf 01 00 00 00       	mov    $0x1,%edi
  401dc0:	e8 7b f0 ff ff       	callq  400e40 <exit@plt>

0000000000401dc5 <seghandler>:
  401dc5:	48 83 ec 08          	sub    $0x8,%rsp
  401dc9:	83 3d 18 27 20 00 00 	cmpl   $0x0,0x202718(%rip)        # 6044e8 <is_checker>
  401dd0:	74 14                	je     401de6 <seghandler+0x21>
  401dd2:	bf 85 32 40 00       	mov    $0x403285,%edi
  401dd7:	e8 e4 ee ff ff       	callq  400cc0 <puts@plt>
  401ddc:	b8 00 00 00 00       	mov    $0x0,%eax
  401de1:	e8 25 fc ff ff       	callq  401a0b <check_fail>
  401de6:	bf f0 33 40 00       	mov    $0x4033f0,%edi
  401deb:	e8 d0 ee ff ff       	callq  400cc0 <puts@plt>
  401df0:	bf 6f 32 40 00       	mov    $0x40326f,%edi
  401df5:	e8 c6 ee ff ff       	callq  400cc0 <puts@plt>
  401dfa:	be 00 00 00 00       	mov    $0x0,%esi
  401dff:	bf 00 00 00 00       	mov    $0x0,%edi
  401e04:	e8 89 fc ff ff       	callq  401a92 <notify_server>
  401e09:	bf 01 00 00 00       	mov    $0x1,%edi
  401e0e:	e8 2d f0 ff ff       	callq  400e40 <exit@plt>

0000000000401e13 <illegalhandler>:
  401e13:	48 83 ec 08          	sub    $0x8,%rsp
  401e17:	83 3d ca 26 20 00 00 	cmpl   $0x0,0x2026ca(%rip)        # 6044e8 <is_checker>
  401e1e:	74 14                	je     401e34 <illegalhandler+0x21>
  401e20:	bf 98 32 40 00       	mov    $0x403298,%edi
  401e25:	e8 96 ee ff ff       	callq  400cc0 <puts@plt>
  401e2a:	b8 00 00 00 00       	mov    $0x0,%eax
  401e2f:	e8 d7 fb ff ff       	callq  401a0b <check_fail>
  401e34:	bf 18 34 40 00       	mov    $0x403418,%edi
  401e39:	e8 82 ee ff ff       	callq  400cc0 <puts@plt>
  401e3e:	bf 6f 32 40 00       	mov    $0x40326f,%edi
  401e43:	e8 78 ee ff ff       	callq  400cc0 <puts@plt>
  401e48:	be 00 00 00 00       	mov    $0x0,%esi
  401e4d:	bf 00 00 00 00       	mov    $0x0,%edi
  401e52:	e8 3b fc ff ff       	callq  401a92 <notify_server>
  401e57:	bf 01 00 00 00       	mov    $0x1,%edi
  401e5c:	e8 df ef ff ff       	callq  400e40 <exit@plt>

0000000000401e61 <sigalrmhandler>:
  401e61:	48 83 ec 08          	sub    $0x8,%rsp
  401e65:	83 3d 7c 26 20 00 00 	cmpl   $0x0,0x20267c(%rip)        # 6044e8 <is_checker>
  401e6c:	74 14                	je     401e82 <sigalrmhandler+0x21>
  401e6e:	bf ac 32 40 00       	mov    $0x4032ac,%edi
  401e73:	e8 48 ee ff ff       	callq  400cc0 <puts@plt>
  401e78:	b8 00 00 00 00       	mov    $0x0,%eax
  401e7d:	e8 89 fb ff ff       	callq  401a0b <check_fail>
  401e82:	ba 05 00 00 00       	mov    $0x5,%edx
  401e87:	be 48 34 40 00       	mov    $0x403448,%esi
  401e8c:	bf 01 00 00 00       	mov    $0x1,%edi
  401e91:	b8 00 00 00 00       	mov    $0x0,%eax
  401e96:	e8 55 ef ff ff       	callq  400df0 <__printf_chk@plt>
  401e9b:	be 00 00 00 00       	mov    $0x0,%esi
  401ea0:	bf 00 00 00 00       	mov    $0x0,%edi
  401ea5:	e8 e8 fb ff ff       	callq  401a92 <notify_server>
  401eaa:	bf 01 00 00 00       	mov    $0x1,%edi
  401eaf:	e8 8c ef ff ff       	callq  400e40 <exit@plt>

0000000000401eb4 <launch>:
  401eb4:	55                   	push   %rbp
  401eb5:	48 89 e5             	mov    %rsp,%rbp
  401eb8:	48 83 ec 10          	sub    $0x10,%rsp
  401ebc:	48 89 fa             	mov    %rdi,%rdx
  401ebf:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401ec6:	00 00 
  401ec8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401ecc:	31 c0                	xor    %eax,%eax
  401ece:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  401ed2:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  401ed6:	48 29 c4             	sub    %rax,%rsp
  401ed9:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  401ede:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  401ee2:	be f4 00 00 00       	mov    $0xf4,%esi
  401ee7:	e8 14 ee ff ff       	callq  400d00 <memset@plt>
  401eec:	48 8b 05 ad 25 20 00 	mov    0x2025ad(%rip),%rax        # 6044a0 <stdin@@GLIBC_2.2.5>
  401ef3:	48 39 05 d6 25 20 00 	cmp    %rax,0x2025d6(%rip)        # 6044d0 <infile>
  401efa:	75 14                	jne    401f10 <launch+0x5c>
  401efc:	be b4 32 40 00       	mov    $0x4032b4,%esi
  401f01:	bf 01 00 00 00       	mov    $0x1,%edi
  401f06:	b8 00 00 00 00       	mov    $0x0,%eax
  401f0b:	e8 e0 ee ff ff       	callq  400df0 <__printf_chk@plt>
  401f10:	c7 05 c2 25 20 00 00 	movl   $0x0,0x2025c2(%rip)        # 6044dc <vlevel>
  401f17:	00 00 00 
  401f1a:	b8 00 00 00 00       	mov    $0x0,%eax
  401f1f:	e8 44 fa ff ff       	callq  401968 <test>
  401f24:	83 3d bd 25 20 00 00 	cmpl   $0x0,0x2025bd(%rip)        # 6044e8 <is_checker>
  401f2b:	74 14                	je     401f41 <launch+0x8d>
  401f2d:	bf c1 32 40 00       	mov    $0x4032c1,%edi
  401f32:	e8 89 ed ff ff       	callq  400cc0 <puts@plt>
  401f37:	b8 00 00 00 00       	mov    $0x0,%eax
  401f3c:	e8 ca fa ff ff       	callq  401a0b <check_fail>
  401f41:	bf cc 32 40 00       	mov    $0x4032cc,%edi
  401f46:	e8 75 ed ff ff       	callq  400cc0 <puts@plt>
  401f4b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401f4f:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401f56:	00 00 
  401f58:	74 05                	je     401f5f <launch+0xab>
  401f5a:	e8 81 ed ff ff       	callq  400ce0 <__stack_chk_fail@plt>
  401f5f:	c9                   	leaveq 
  401f60:	c3                   	retq   

0000000000401f61 <stable_launch>:
  401f61:	53                   	push   %rbx
  401f62:	48 89 3d 5f 25 20 00 	mov    %rdi,0x20255f(%rip)        # 6044c8 <global_offset>
  401f69:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  401f6f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401f75:	b9 32 01 00 00       	mov    $0x132,%ecx
  401f7a:	ba 07 00 00 00       	mov    $0x7,%edx
  401f7f:	be 00 00 10 00       	mov    $0x100000,%esi
  401f84:	bf 00 60 58 55       	mov    $0x55586000,%edi
  401f89:	e8 62 ed ff ff       	callq  400cf0 <mmap@plt>
  401f8e:	48 89 c3             	mov    %rax,%rbx
  401f91:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  401f97:	74 37                	je     401fd0 <stable_launch+0x6f>
  401f99:	be 00 00 10 00       	mov    $0x100000,%esi
  401f9e:	48 89 c7             	mov    %rax,%rdi
  401fa1:	e8 3a ee ff ff       	callq  400de0 <munmap@plt>
  401fa6:	b9 00 60 58 55       	mov    $0x55586000,%ecx
  401fab:	ba 80 34 40 00       	mov    $0x403480,%edx
  401fb0:	be 01 00 00 00       	mov    $0x1,%esi
  401fb5:	48 8b 3d f4 24 20 00 	mov    0x2024f4(%rip),%rdi        # 6044b0 <stderr@@GLIBC_2.2.5>
  401fbc:	b8 00 00 00 00       	mov    $0x0,%eax
  401fc1:	e8 9a ee ff ff       	callq  400e60 <__fprintf_chk@plt>
  401fc6:	bf 01 00 00 00       	mov    $0x1,%edi
  401fcb:	e8 70 ee ff ff       	callq  400e40 <exit@plt>
  401fd0:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  401fd7:	48 89 15 32 31 20 00 	mov    %rdx,0x203132(%rip)        # 605110 <stack_top>
  401fde:	48 89 e0             	mov    %rsp,%rax
  401fe1:	48 89 d4             	mov    %rdx,%rsp
  401fe4:	48 89 c2             	mov    %rax,%rdx
  401fe7:	48 89 15 d2 24 20 00 	mov    %rdx,0x2024d2(%rip)        # 6044c0 <global_save_stack>
  401fee:	48 8b 3d d3 24 20 00 	mov    0x2024d3(%rip),%rdi        # 6044c8 <global_offset>
  401ff5:	e8 ba fe ff ff       	callq  401eb4 <launch>
  401ffa:	48 8b 05 bf 24 20 00 	mov    0x2024bf(%rip),%rax        # 6044c0 <global_save_stack>
  402001:	48 89 c4             	mov    %rax,%rsp
  402004:	be 00 00 10 00       	mov    $0x100000,%esi
  402009:	48 89 df             	mov    %rbx,%rdi
  40200c:	e8 cf ed ff ff       	callq  400de0 <munmap@plt>
  402011:	5b                   	pop    %rbx
  402012:	c3                   	retq   
  402013:	90                   	nop
  402014:	90                   	nop
  402015:	90                   	nop
  402016:	90                   	nop
  402017:	90                   	nop
  402018:	90                   	nop
  402019:	90                   	nop
  40201a:	90                   	nop
  40201b:	90                   	nop
  40201c:	90                   	nop
  40201d:	90                   	nop
  40201e:	90                   	nop
  40201f:	90                   	nop

0000000000402020 <rio_readinitb>:
  402020:	89 37                	mov    %esi,(%rdi)
  402022:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  402029:	48 8d 47 10          	lea    0x10(%rdi),%rax
  40202d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  402031:	c3                   	retq   

0000000000402032 <sigalrm_handler>:
  402032:	48 83 ec 08          	sub    $0x8,%rsp
  402036:	b9 00 00 00 00       	mov    $0x0,%ecx
  40203b:	ba c0 34 40 00       	mov    $0x4034c0,%edx
  402040:	be 01 00 00 00       	mov    $0x1,%esi
  402045:	48 8b 3d 64 24 20 00 	mov    0x202464(%rip),%rdi        # 6044b0 <stderr@@GLIBC_2.2.5>
  40204c:	b8 00 00 00 00       	mov    $0x0,%eax
  402051:	e8 0a ee ff ff       	callq  400e60 <__fprintf_chk@plt>
  402056:	bf 01 00 00 00       	mov    $0x1,%edi
  40205b:	e8 e0 ed ff ff       	callq  400e40 <exit@plt>

0000000000402060 <rio_writen>:
  402060:	41 55                	push   %r13
  402062:	41 54                	push   %r12
  402064:	55                   	push   %rbp
  402065:	53                   	push   %rbx
  402066:	48 83 ec 08          	sub    $0x8,%rsp
  40206a:	41 89 fc             	mov    %edi,%r12d
  40206d:	48 89 f5             	mov    %rsi,%rbp
  402070:	49 89 d5             	mov    %rdx,%r13
  402073:	48 89 d3             	mov    %rdx,%rbx
  402076:	eb 28                	jmp    4020a0 <rio_writen+0x40>
  402078:	48 89 da             	mov    %rbx,%rdx
  40207b:	48 89 ee             	mov    %rbp,%rsi
  40207e:	44 89 e7             	mov    %r12d,%edi
  402081:	e8 4a ec ff ff       	callq  400cd0 <write@plt>
  402086:	48 85 c0             	test   %rax,%rax
  402089:	7f 0f                	jg     40209a <rio_writen+0x3a>
  40208b:	e8 f0 eb ff ff       	callq  400c80 <__errno_location@plt>
  402090:	83 38 04             	cmpl   $0x4,(%rax)
  402093:	75 15                	jne    4020aa <rio_writen+0x4a>
  402095:	b8 00 00 00 00       	mov    $0x0,%eax
  40209a:	48 29 c3             	sub    %rax,%rbx
  40209d:	48 01 c5             	add    %rax,%rbp
  4020a0:	48 85 db             	test   %rbx,%rbx
  4020a3:	75 d3                	jne    402078 <rio_writen+0x18>
  4020a5:	4c 89 e8             	mov    %r13,%rax
  4020a8:	eb 07                	jmp    4020b1 <rio_writen+0x51>
  4020aa:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4020b1:	48 83 c4 08          	add    $0x8,%rsp
  4020b5:	5b                   	pop    %rbx
  4020b6:	5d                   	pop    %rbp
  4020b7:	41 5c                	pop    %r12
  4020b9:	41 5d                	pop    %r13
  4020bb:	c3                   	retq   

00000000004020bc <rio_read>:
  4020bc:	41 55                	push   %r13
  4020be:	41 54                	push   %r12
  4020c0:	55                   	push   %rbp
  4020c1:	53                   	push   %rbx
  4020c2:	48 83 ec 08          	sub    $0x8,%rsp
  4020c6:	48 89 fb             	mov    %rdi,%rbx
  4020c9:	49 89 f5             	mov    %rsi,%r13
  4020cc:	49 89 d4             	mov    %rdx,%r12
  4020cf:	48 8d 6f 10          	lea    0x10(%rdi),%rbp
  4020d3:	eb 2a                	jmp    4020ff <rio_read+0x43>
  4020d5:	8b 3b                	mov    (%rbx),%edi
  4020d7:	ba 00 20 00 00       	mov    $0x2000,%edx
  4020dc:	48 89 ee             	mov    %rbp,%rsi
  4020df:	e8 4c ec ff ff       	callq  400d30 <read@plt>
  4020e4:	89 43 04             	mov    %eax,0x4(%rbx)
  4020e7:	85 c0                	test   %eax,%eax
  4020e9:	79 0c                	jns    4020f7 <rio_read+0x3b>
  4020eb:	e8 90 eb ff ff       	callq  400c80 <__errno_location@plt>
  4020f0:	83 38 04             	cmpl   $0x4,(%rax)
  4020f3:	74 0a                	je     4020ff <rio_read+0x43>
  4020f5:	eb 37                	jmp    40212e <rio_read+0x72>
  4020f7:	85 c0                	test   %eax,%eax
  4020f9:	74 3c                	je     402137 <rio_read+0x7b>
  4020fb:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  4020ff:	8b 43 04             	mov    0x4(%rbx),%eax
  402102:	85 c0                	test   %eax,%eax
  402104:	7e cf                	jle    4020d5 <rio_read+0x19>
  402106:	89 c2                	mov    %eax,%edx
  402108:	4c 39 e2             	cmp    %r12,%rdx
  40210b:	44 0f 42 e0          	cmovb  %eax,%r12d
  40210f:	49 63 ec             	movslq %r12d,%rbp
  402112:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  402116:	48 89 ea             	mov    %rbp,%rdx
  402119:	4c 89 ef             	mov    %r13,%rdi
  40211c:	e8 6f ec ff ff       	callq  400d90 <memcpy@plt>
  402121:	48 01 6b 08          	add    %rbp,0x8(%rbx)
  402125:	44 29 63 04          	sub    %r12d,0x4(%rbx)
  402129:	48 89 e8             	mov    %rbp,%rax
  40212c:	eb 0e                	jmp    40213c <rio_read+0x80>
  40212e:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402135:	eb 05                	jmp    40213c <rio_read+0x80>
  402137:	b8 00 00 00 00       	mov    $0x0,%eax
  40213c:	48 83 c4 08          	add    $0x8,%rsp
  402140:	5b                   	pop    %rbx
  402141:	5d                   	pop    %rbp
  402142:	41 5c                	pop    %r12
  402144:	41 5d                	pop    %r13
  402146:	c3                   	retq   

0000000000402147 <rio_readlineb>:
  402147:	41 55                	push   %r13
  402149:	41 54                	push   %r12
  40214b:	55                   	push   %rbp
  40214c:	53                   	push   %rbx
  40214d:	48 83 ec 18          	sub    $0x18,%rsp
  402151:	49 89 fd             	mov    %rdi,%r13
  402154:	48 89 f5             	mov    %rsi,%rbp
  402157:	49 89 d4             	mov    %rdx,%r12
  40215a:	bb 01 00 00 00       	mov    $0x1,%ebx
  40215f:	eb 3c                	jmp    40219d <rio_readlineb+0x56>
  402161:	ba 01 00 00 00       	mov    $0x1,%edx
  402166:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
  40216b:	4c 89 ef             	mov    %r13,%rdi
  40216e:	e8 49 ff ff ff       	callq  4020bc <rio_read>
  402173:	83 f8 01             	cmp    $0x1,%eax
  402176:	75 12                	jne    40218a <rio_readlineb+0x43>
  402178:	48 8d 55 01          	lea    0x1(%rbp),%rdx
  40217c:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
  402181:	88 45 00             	mov    %al,0x0(%rbp)
  402184:	3c 0a                	cmp    $0xa,%al
  402186:	75 0e                	jne    402196 <rio_readlineb+0x4f>
  402188:	eb 1a                	jmp    4021a4 <rio_readlineb+0x5d>
  40218a:	85 c0                	test   %eax,%eax
  40218c:	75 22                	jne    4021b0 <rio_readlineb+0x69>
  40218e:	48 83 fb 01          	cmp    $0x1,%rbx
  402192:	75 13                	jne    4021a7 <rio_readlineb+0x60>
  402194:	eb 23                	jmp    4021b9 <rio_readlineb+0x72>
  402196:	48 83 c3 01          	add    $0x1,%rbx
  40219a:	48 89 d5             	mov    %rdx,%rbp
  40219d:	4c 39 e3             	cmp    %r12,%rbx
  4021a0:	72 bf                	jb     402161 <rio_readlineb+0x1a>
  4021a2:	eb 03                	jmp    4021a7 <rio_readlineb+0x60>
  4021a4:	48 89 d5             	mov    %rdx,%rbp
  4021a7:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  4021ab:	48 89 d8             	mov    %rbx,%rax
  4021ae:	eb 0e                	jmp    4021be <rio_readlineb+0x77>
  4021b0:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4021b7:	eb 05                	jmp    4021be <rio_readlineb+0x77>
  4021b9:	b8 00 00 00 00       	mov    $0x0,%eax
  4021be:	48 83 c4 18          	add    $0x18,%rsp
  4021c2:	5b                   	pop    %rbx
  4021c3:	5d                   	pop    %rbp
  4021c4:	41 5c                	pop    %r12
  4021c6:	41 5d                	pop    %r13
  4021c8:	c3                   	retq   

00000000004021c9 <urlencode>:
  4021c9:	41 54                	push   %r12
  4021cb:	55                   	push   %rbp
  4021cc:	53                   	push   %rbx
  4021cd:	48 83 ec 10          	sub    $0x10,%rsp
  4021d1:	48 89 fb             	mov    %rdi,%rbx
  4021d4:	48 89 f5             	mov    %rsi,%rbp
  4021d7:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4021de:	00 00 
  4021e0:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4021e5:	31 c0                	xor    %eax,%eax
  4021e7:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4021ee:	f2 ae                	repnz scas %es:(%rdi),%al
  4021f0:	48 f7 d1             	not    %rcx
  4021f3:	8d 41 ff             	lea    -0x1(%rcx),%eax
  4021f6:	e9 aa 00 00 00       	jmpq   4022a5 <urlencode+0xdc>
  4021fb:	44 0f b6 03          	movzbl (%rbx),%r8d
  4021ff:	41 80 f8 2a          	cmp    $0x2a,%r8b
  402203:	0f 94 c2             	sete   %dl
  402206:	41 80 f8 2d          	cmp    $0x2d,%r8b
  40220a:	0f 94 c0             	sete   %al
  40220d:	08 c2                	or     %al,%dl
  40220f:	75 24                	jne    402235 <urlencode+0x6c>
  402211:	41 80 f8 2e          	cmp    $0x2e,%r8b
  402215:	74 1e                	je     402235 <urlencode+0x6c>
  402217:	41 80 f8 5f          	cmp    $0x5f,%r8b
  40221b:	74 18                	je     402235 <urlencode+0x6c>
  40221d:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  402221:	3c 09                	cmp    $0x9,%al
  402223:	76 10                	jbe    402235 <urlencode+0x6c>
  402225:	41 8d 40 bf          	lea    -0x41(%r8),%eax
  402229:	3c 19                	cmp    $0x19,%al
  40222b:	76 08                	jbe    402235 <urlencode+0x6c>
  40222d:	41 8d 40 9f          	lea    -0x61(%r8),%eax
  402231:	3c 19                	cmp    $0x19,%al
  402233:	77 0a                	ja     40223f <urlencode+0x76>
  402235:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  402239:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  40223d:	eb 5f                	jmp    40229e <urlencode+0xd5>
  40223f:	41 80 f8 20          	cmp    $0x20,%r8b
  402243:	75 0a                	jne    40224f <urlencode+0x86>
  402245:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  402249:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  40224d:	eb 4f                	jmp    40229e <urlencode+0xd5>
  40224f:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  402253:	3c 5f                	cmp    $0x5f,%al
  402255:	0f 96 c2             	setbe  %dl
  402258:	41 80 f8 09          	cmp    $0x9,%r8b
  40225c:	0f 94 c0             	sete   %al
  40225f:	08 c2                	or     %al,%dl
  402261:	74 50                	je     4022b3 <urlencode+0xea>
  402263:	45 0f b6 c0          	movzbl %r8b,%r8d
  402267:	b9 58 35 40 00       	mov    $0x403558,%ecx
  40226c:	ba 08 00 00 00       	mov    $0x8,%edx
  402271:	be 01 00 00 00       	mov    $0x1,%esi
  402276:	48 89 e7             	mov    %rsp,%rdi
  402279:	b8 00 00 00 00       	mov    $0x0,%eax
  40227e:	e8 ed eb ff ff       	callq  400e70 <__sprintf_chk@plt>
  402283:	0f b6 04 24          	movzbl (%rsp),%eax
  402287:	88 45 00             	mov    %al,0x0(%rbp)
  40228a:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  40228f:	88 45 01             	mov    %al,0x1(%rbp)
  402292:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  402297:	88 45 02             	mov    %al,0x2(%rbp)
  40229a:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  40229e:	48 83 c3 01          	add    $0x1,%rbx
  4022a2:	44 89 e0             	mov    %r12d,%eax
  4022a5:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  4022a9:	85 c0                	test   %eax,%eax
  4022ab:	0f 85 4a ff ff ff    	jne    4021fb <urlencode+0x32>
  4022b1:	eb 05                	jmp    4022b8 <urlencode+0xef>
  4022b3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4022b8:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  4022bd:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  4022c4:	00 00 
  4022c6:	74 05                	je     4022cd <urlencode+0x104>
  4022c8:	e8 13 ea ff ff       	callq  400ce0 <__stack_chk_fail@plt>
  4022cd:	48 83 c4 10          	add    $0x10,%rsp
  4022d1:	5b                   	pop    %rbx
  4022d2:	5d                   	pop    %rbp
  4022d3:	41 5c                	pop    %r12
  4022d5:	c3                   	retq   

00000000004022d6 <submitr>:
  4022d6:	41 57                	push   %r15
  4022d8:	41 56                	push   %r14
  4022da:	41 55                	push   %r13
  4022dc:	41 54                	push   %r12
  4022de:	55                   	push   %rbp
  4022df:	53                   	push   %rbx
  4022e0:	48 81 ec 68 a0 00 00 	sub    $0xa068,%rsp
  4022e7:	49 89 fc             	mov    %rdi,%r12
  4022ea:	89 74 24 14          	mov    %esi,0x14(%rsp)
  4022ee:	49 89 d7             	mov    %rdx,%r15
  4022f1:	49 89 ce             	mov    %rcx,%r14
  4022f4:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  4022f9:	4d 89 cd             	mov    %r9,%r13
  4022fc:	48 8b 9c 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbx
  402303:	00 
  402304:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40230b:	00 00 
  40230d:	48 89 84 24 58 a0 00 	mov    %rax,0xa058(%rsp)
  402314:	00 
  402315:	31 c0                	xor    %eax,%eax
  402317:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
  40231e:	00 
  40231f:	ba 00 00 00 00       	mov    $0x0,%edx
  402324:	be 01 00 00 00       	mov    $0x1,%esi
  402329:	bf 02 00 00 00       	mov    $0x2,%edi
  40232e:	e8 4d eb ff ff       	callq  400e80 <socket@plt>
  402333:	89 c5                	mov    %eax,%ebp
  402335:	85 c0                	test   %eax,%eax
  402337:	79 4e                	jns    402387 <submitr+0xb1>
  402339:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402340:	3a 20 43 
  402343:	48 89 03             	mov    %rax,(%rbx)
  402346:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40234d:	20 75 6e 
  402350:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402354:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40235b:	74 6f 20 
  40235e:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402362:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402369:	65 20 73 
  40236c:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402370:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  402377:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  40237d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402382:	e9 4a 06 00 00       	jmpq   4029d1 <submitr+0x6fb>
  402387:	4c 89 e7             	mov    %r12,%rdi
  40238a:	e8 d1 e9 ff ff       	callq  400d60 <gethostbyname@plt>
  40238f:	48 85 c0             	test   %rax,%rax
  402392:	75 67                	jne    4023fb <submitr+0x125>
  402394:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  40239b:	3a 20 44 
  40239e:	48 89 03             	mov    %rax,(%rbx)
  4023a1:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  4023a8:	20 75 6e 
  4023ab:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4023af:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4023b6:	74 6f 20 
  4023b9:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4023bd:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4023c4:	76 65 20 
  4023c7:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4023cb:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4023d2:	72 20 61 
  4023d5:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4023d9:	c7 43 28 64 64 72 65 	movl   $0x65726464,0x28(%rbx)
  4023e0:	66 c7 43 2c 73 73    	movw   $0x7373,0x2c(%rbx)
  4023e6:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  4023ea:	89 ef                	mov    %ebp,%edi
  4023ec:	e8 2f e9 ff ff       	callq  400d20 <close@plt>
  4023f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4023f6:	e9 d6 05 00 00       	jmpq   4029d1 <submitr+0x6fb>
  4023fb:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
  402402:	00 00 
  402404:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
  40240b:	00 00 
  40240d:	66 c7 44 24 30 02 00 	movw   $0x2,0x30(%rsp)
  402414:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402418:	48 8b 40 18          	mov    0x18(%rax),%rax
  40241c:	48 8b 30             	mov    (%rax),%rsi
  40241f:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402424:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
  402429:	e8 42 e9 ff ff       	callq  400d70 <__memmove_chk@plt>
  40242e:	0f b7 44 24 14       	movzwl 0x14(%rsp),%eax
  402433:	66 c1 c8 08          	ror    $0x8,%ax
  402437:	66 89 44 24 32       	mov    %ax,0x32(%rsp)
  40243c:	ba 10 00 00 00       	mov    $0x10,%edx
  402441:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  402446:	89 ef                	mov    %ebp,%edi
  402448:	e8 03 ea ff ff       	callq  400e50 <connect@plt>
  40244d:	85 c0                	test   %eax,%eax
  40244f:	79 59                	jns    4024aa <submitr+0x1d4>
  402451:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402458:	3a 20 55 
  40245b:	48 89 03             	mov    %rax,(%rbx)
  40245e:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402465:	20 74 6f 
  402468:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40246c:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402473:	65 63 74 
  402476:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40247a:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  402481:	68 65 20 
  402484:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402488:	c7 43 20 73 65 72 76 	movl   $0x76726573,0x20(%rbx)
  40248f:	66 c7 43 24 65 72    	movw   $0x7265,0x24(%rbx)
  402495:	c6 43 26 00          	movb   $0x0,0x26(%rbx)
  402499:	89 ef                	mov    %ebp,%edi
  40249b:	e8 80 e8 ff ff       	callq  400d20 <close@plt>
  4024a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4024a5:	e9 27 05 00 00       	jmpq   4029d1 <submitr+0x6fb>
  4024aa:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  4024b1:	4c 89 ef             	mov    %r13,%rdi
  4024b4:	b8 00 00 00 00       	mov    $0x0,%eax
  4024b9:	48 89 d1             	mov    %rdx,%rcx
  4024bc:	f2 ae                	repnz scas %es:(%rdi),%al
  4024be:	48 f7 d1             	not    %rcx
  4024c1:	48 89 ce             	mov    %rcx,%rsi
  4024c4:	4c 89 ff             	mov    %r15,%rdi
  4024c7:	48 89 d1             	mov    %rdx,%rcx
  4024ca:	f2 ae                	repnz scas %es:(%rdi),%al
  4024cc:	48 f7 d1             	not    %rcx
  4024cf:	49 89 c8             	mov    %rcx,%r8
  4024d2:	4c 89 f7             	mov    %r14,%rdi
  4024d5:	48 89 d1             	mov    %rdx,%rcx
  4024d8:	f2 ae                	repnz scas %es:(%rdi),%al
  4024da:	49 29 c8             	sub    %rcx,%r8
  4024dd:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  4024e2:	48 89 d1             	mov    %rdx,%rcx
  4024e5:	f2 ae                	repnz scas %es:(%rdi),%al
  4024e7:	49 29 c8             	sub    %rcx,%r8
  4024ea:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
  4024ef:	49 8d 44 00 7b       	lea    0x7b(%r8,%rax,1),%rax
  4024f4:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  4024fa:	76 72                	jbe    40256e <submitr+0x298>
  4024fc:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402503:	3a 20 52 
  402506:	48 89 03             	mov    %rax,(%rbx)
  402509:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  402510:	20 73 74 
  402513:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402517:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  40251e:	74 6f 6f 
  402521:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402525:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  40252c:	65 2e 20 
  40252f:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402533:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  40253a:	61 73 65 
  40253d:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402541:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  402548:	49 54 52 
  40254b:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40254f:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  402556:	55 46 00 
  402559:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40255d:	89 ef                	mov    %ebp,%edi
  40255f:	e8 bc e7 ff ff       	callq  400d20 <close@plt>
  402564:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402569:	e9 63 04 00 00       	jmpq   4029d1 <submitr+0x6fb>
  40256e:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402575:	00 
  402576:	b9 00 04 00 00       	mov    $0x400,%ecx
  40257b:	b8 00 00 00 00       	mov    $0x0,%eax
  402580:	48 89 f7             	mov    %rsi,%rdi
  402583:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  402586:	4c 89 ef             	mov    %r13,%rdi
  402589:	e8 3b fc ff ff       	callq  4021c9 <urlencode>
  40258e:	85 c0                	test   %eax,%eax
  402590:	0f 89 8a 00 00 00    	jns    402620 <submitr+0x34a>
  402596:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  40259d:	3a 20 52 
  4025a0:	48 89 03             	mov    %rax,(%rbx)
  4025a3:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4025aa:	20 73 74 
  4025ad:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4025b1:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  4025b8:	63 6f 6e 
  4025bb:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4025bf:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  4025c6:	20 61 6e 
  4025c9:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4025cd:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  4025d4:	67 61 6c 
  4025d7:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4025db:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  4025e2:	6e 70 72 
  4025e5:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4025e9:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  4025f0:	6c 65 20 
  4025f3:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4025f7:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  4025fe:	63 74 65 
  402601:	48 89 43 38          	mov    %rax,0x38(%rbx)
  402605:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  40260b:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  40260f:	89 ef                	mov    %ebp,%edi
  402611:	e8 0a e7 ff ff       	callq  400d20 <close@plt>
  402616:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40261b:	e9 b1 03 00 00       	jmpq   4029d1 <submitr+0x6fb>
  402620:	4c 89 64 24 08       	mov    %r12,0x8(%rsp)
  402625:	48 8d 84 24 40 20 00 	lea    0x2040(%rsp),%rax
  40262c:	00 
  40262d:	48 89 04 24          	mov    %rax,(%rsp)
  402631:	4d 89 f9             	mov    %r15,%r9
  402634:	4d 89 f0             	mov    %r14,%r8
  402637:	b9 e8 34 40 00       	mov    $0x4034e8,%ecx
  40263c:	ba 00 20 00 00       	mov    $0x2000,%edx
  402641:	be 01 00 00 00       	mov    $0x1,%esi
  402646:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  40264b:	b8 00 00 00 00       	mov    $0x0,%eax
  402650:	e8 1b e8 ff ff       	callq  400e70 <__sprintf_chk@plt>
  402655:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  40265a:	b8 00 00 00 00       	mov    $0x0,%eax
  40265f:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  402666:	f2 ae                	repnz scas %es:(%rdi),%al
  402668:	48 f7 d1             	not    %rcx
  40266b:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  40266f:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  402674:	89 ef                	mov    %ebp,%edi
  402676:	e8 e5 f9 ff ff       	callq  402060 <rio_writen>
  40267b:	48 85 c0             	test   %rax,%rax
  40267e:	79 6e                	jns    4026ee <submitr+0x418>
  402680:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402687:	3a 20 43 
  40268a:	48 89 03             	mov    %rax,(%rbx)
  40268d:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402694:	20 75 6e 
  402697:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40269b:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4026a2:	74 6f 20 
  4026a5:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4026a9:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  4026b0:	20 74 6f 
  4026b3:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4026b7:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  4026be:	72 65 73 
  4026c1:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4026c5:	48 b8 75 6c 74 20 73 	movabs $0x7672657320746c75,%rax
  4026cc:	65 72 76 
  4026cf:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4026d3:	66 c7 43 30 65 72    	movw   $0x7265,0x30(%rbx)
  4026d9:	c6 43 32 00          	movb   $0x0,0x32(%rbx)
  4026dd:	89 ef                	mov    %ebp,%edi
  4026df:	e8 3c e6 ff ff       	callq  400d20 <close@plt>
  4026e4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4026e9:	e9 e3 02 00 00       	jmpq   4029d1 <submitr+0x6fb>
  4026ee:	89 ee                	mov    %ebp,%esi
  4026f0:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  4026f7:	00 
  4026f8:	e8 23 f9 ff ff       	callq  402020 <rio_readinitb>
  4026fd:	ba 00 20 00 00       	mov    $0x2000,%edx
  402702:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  402707:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  40270e:	00 
  40270f:	e8 33 fa ff ff       	callq  402147 <rio_readlineb>
  402714:	48 85 c0             	test   %rax,%rax
  402717:	7f 7d                	jg     402796 <submitr+0x4c0>
  402719:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402720:	3a 20 43 
  402723:	48 89 03             	mov    %rax,(%rbx)
  402726:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40272d:	20 75 6e 
  402730:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402734:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40273b:	74 6f 20 
  40273e:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402742:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  402749:	66 69 72 
  40274c:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402750:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402757:	61 64 65 
  40275a:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40275e:	48 b8 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rax
  402765:	6d 20 72 
  402768:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40276c:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  402773:	20 73 65 
  402776:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40277a:	c7 43 38 72 76 65 72 	movl   $0x72657672,0x38(%rbx)
  402781:	c6 43 3c 00          	movb   $0x0,0x3c(%rbx)
  402785:	89 ef                	mov    %ebp,%edi
  402787:	e8 94 e5 ff ff       	callq  400d20 <close@plt>
  40278c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402791:	e9 3b 02 00 00       	jmpq   4029d1 <submitr+0x6fb>
  402796:	4c 8d 84 24 40 60 00 	lea    0x6040(%rsp),%r8
  40279d:	00 
  40279e:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
  4027a3:	48 8d 94 24 40 40 00 	lea    0x4040(%rsp),%rdx
  4027aa:	00 
  4027ab:	be 5f 35 40 00       	mov    $0x40355f,%esi
  4027b0:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  4027b5:	b8 00 00 00 00       	mov    $0x0,%eax
  4027ba:	e8 11 e6 ff ff       	callq  400dd0 <__isoc99_sscanf@plt>
  4027bf:	e9 95 00 00 00       	jmpq   402859 <submitr+0x583>
  4027c4:	ba 00 20 00 00       	mov    $0x2000,%edx
  4027c9:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  4027ce:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  4027d5:	00 
  4027d6:	e8 6c f9 ff ff       	callq  402147 <rio_readlineb>
  4027db:	48 85 c0             	test   %rax,%rax
  4027de:	7f 79                	jg     402859 <submitr+0x583>
  4027e0:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4027e7:	3a 20 43 
  4027ea:	48 89 03             	mov    %rax,(%rbx)
  4027ed:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4027f4:	20 75 6e 
  4027f7:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4027fb:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402802:	74 6f 20 
  402805:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402809:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  402810:	68 65 61 
  402813:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402817:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  40281e:	66 72 6f 
  402821:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402825:	48 b8 6d 20 74 68 65 	movabs $0x657220656874206d,%rax
  40282c:	20 72 65 
  40282f:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402833:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  40283a:	73 65 72 
  40283d:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402841:	c7 43 38 76 65 72 00 	movl   $0x726576,0x38(%rbx)
  402848:	89 ef                	mov    %ebp,%edi
  40284a:	e8 d1 e4 ff ff       	callq  400d20 <close@plt>
  40284f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402854:	e9 78 01 00 00       	jmpq   4029d1 <submitr+0x6fb>
  402859:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
  40285e:	83 e8 0d             	sub    $0xd,%eax
  402861:	75 0f                	jne    402872 <submitr+0x59c>
  402863:	0f b6 44 24 41       	movzbl 0x41(%rsp),%eax
  402868:	83 e8 0a             	sub    $0xa,%eax
  40286b:	75 05                	jne    402872 <submitr+0x59c>
  40286d:	0f b6 44 24 42       	movzbl 0x42(%rsp),%eax
  402872:	85 c0                	test   %eax,%eax
  402874:	0f 85 4a ff ff ff    	jne    4027c4 <submitr+0x4ee>
  40287a:	ba 00 20 00 00       	mov    $0x2000,%edx
  40287f:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  402884:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  40288b:	00 
  40288c:	e8 b6 f8 ff ff       	callq  402147 <rio_readlineb>
  402891:	48 85 c0             	test   %rax,%rax
  402894:	0f 8f 83 00 00 00    	jg     40291d <submitr+0x647>
  40289a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4028a1:	3a 20 43 
  4028a4:	48 89 03             	mov    %rax,(%rbx)
  4028a7:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4028ae:	20 75 6e 
  4028b1:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4028b5:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4028bc:	74 6f 20 
  4028bf:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4028c3:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  4028ca:	73 74 61 
  4028cd:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4028d1:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  4028d8:	65 73 73 
  4028db:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4028df:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  4028e6:	72 6f 6d 
  4028e9:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4028ed:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  4028f4:	6c 74 20 
  4028f7:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4028fb:	c7 43 38 73 65 72 76 	movl   $0x76726573,0x38(%rbx)
  402902:	66 c7 43 3c 65 72    	movw   $0x7265,0x3c(%rbx)
  402908:	c6 43 3e 00          	movb   $0x0,0x3e(%rbx)
  40290c:	89 ef                	mov    %ebp,%edi
  40290e:	e8 0d e4 ff ff       	callq  400d20 <close@plt>
  402913:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402918:	e9 b4 00 00 00       	jmpq   4029d1 <submitr+0x6fb>
  40291d:	44 8b 44 24 2c       	mov    0x2c(%rsp),%r8d
  402922:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  402929:	74 34                	je     40295f <submitr+0x689>
  40292b:	4c 8d 8c 24 40 60 00 	lea    0x6040(%rsp),%r9
  402932:	00 
  402933:	b9 28 35 40 00       	mov    $0x403528,%ecx
  402938:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  40293f:	be 01 00 00 00       	mov    $0x1,%esi
  402944:	48 89 df             	mov    %rbx,%rdi
  402947:	b8 00 00 00 00       	mov    $0x0,%eax
  40294c:	e8 1f e5 ff ff       	callq  400e70 <__sprintf_chk@plt>
  402951:	89 ef                	mov    %ebp,%edi
  402953:	e8 c8 e3 ff ff       	callq  400d20 <close@plt>
  402958:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40295d:	eb 72                	jmp    4029d1 <submitr+0x6fb>
  40295f:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  402964:	48 89 df             	mov    %rbx,%rdi
  402967:	e8 44 e3 ff ff       	callq  400cb0 <strcpy@plt>
  40296c:	89 ef                	mov    %ebp,%edi
  40296e:	e8 ad e3 ff ff       	callq  400d20 <close@plt>
  402973:	0f b6 13             	movzbl (%rbx),%edx
  402976:	83 ea 4f             	sub    $0x4f,%edx
  402979:	89 d1                	mov    %edx,%ecx
  40297b:	85 d2                	test   %edx,%edx
  40297d:	75 16                	jne    402995 <submitr+0x6bf>
  40297f:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  402983:	83 e9 4b             	sub    $0x4b,%ecx
  402986:	75 0d                	jne    402995 <submitr+0x6bf>
  402988:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  40298c:	83 e9 0a             	sub    $0xa,%ecx
  40298f:	75 04                	jne    402995 <submitr+0x6bf>
  402991:	0f b6 4b 03          	movzbl 0x3(%rbx),%ecx
  402995:	b8 00 00 00 00       	mov    $0x0,%eax
  40299a:	85 c9                	test   %ecx,%ecx
  40299c:	74 33                	je     4029d1 <submitr+0x6fb>
  40299e:	bf 70 35 40 00       	mov    $0x403570,%edi
  4029a3:	b9 05 00 00 00       	mov    $0x5,%ecx
  4029a8:	48 89 de             	mov    %rbx,%rsi
  4029ab:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  4029ad:	40 0f 97 c6          	seta   %sil
  4029b1:	0f 92 c1             	setb   %cl
  4029b4:	40 38 ce             	cmp    %cl,%sil
  4029b7:	74 18                	je     4029d1 <submitr+0x6fb>
  4029b9:	85 d2                	test   %edx,%edx
  4029bb:	75 0d                	jne    4029ca <submitr+0x6f4>
  4029bd:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
  4029c1:	83 ea 4b             	sub    $0x4b,%edx
  4029c4:	75 04                	jne    4029ca <submitr+0x6f4>
  4029c6:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  4029ca:	83 fa 01             	cmp    $0x1,%edx
  4029cd:	19 c0                	sbb    %eax,%eax
  4029cf:	f7 d0                	not    %eax
  4029d1:	48 8b 9c 24 58 a0 00 	mov    0xa058(%rsp),%rbx
  4029d8:	00 
  4029d9:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  4029e0:	00 00 
  4029e2:	74 05                	je     4029e9 <submitr+0x713>
  4029e4:	e8 f7 e2 ff ff       	callq  400ce0 <__stack_chk_fail@plt>
  4029e9:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
  4029f0:	5b                   	pop    %rbx
  4029f1:	5d                   	pop    %rbp
  4029f2:	41 5c                	pop    %r12
  4029f4:	41 5d                	pop    %r13
  4029f6:	41 5e                	pop    %r14
  4029f8:	41 5f                	pop    %r15
  4029fa:	c3                   	retq   

00000000004029fb <init_timeout>:
  4029fb:	53                   	push   %rbx
  4029fc:	89 fb                	mov    %edi,%ebx
  4029fe:	85 ff                	test   %edi,%edi
  402a00:	74 20                	je     402a22 <init_timeout+0x27>
  402a02:	85 ff                	test   %edi,%edi
  402a04:	b8 00 00 00 00       	mov    $0x0,%eax
  402a09:	0f 48 d8             	cmovs  %eax,%ebx
  402a0c:	be 32 20 40 00       	mov    $0x402032,%esi
  402a11:	bf 0e 00 00 00       	mov    $0xe,%edi
  402a16:	e8 35 e3 ff ff       	callq  400d50 <signal@plt>
  402a1b:	89 df                	mov    %ebx,%edi
  402a1d:	e8 ee e2 ff ff       	callq  400d10 <alarm@plt>
  402a22:	5b                   	pop    %rbx
  402a23:	c3                   	retq   

0000000000402a24 <init_driver>:
  402a24:	55                   	push   %rbp
  402a25:	53                   	push   %rbx
  402a26:	48 83 ec 28          	sub    $0x28,%rsp
  402a2a:	48 89 fd             	mov    %rdi,%rbp
  402a2d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402a34:	00 00 
  402a36:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402a3b:	31 c0                	xor    %eax,%eax
  402a3d:	be 01 00 00 00       	mov    $0x1,%esi
  402a42:	bf 0d 00 00 00       	mov    $0xd,%edi
  402a47:	e8 04 e3 ff ff       	callq  400d50 <signal@plt>
  402a4c:	be 01 00 00 00       	mov    $0x1,%esi
  402a51:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402a56:	e8 f5 e2 ff ff       	callq  400d50 <signal@plt>
  402a5b:	be 01 00 00 00       	mov    $0x1,%esi
  402a60:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402a65:	e8 e6 e2 ff ff       	callq  400d50 <signal@plt>
  402a6a:	ba 00 00 00 00       	mov    $0x0,%edx
  402a6f:	be 01 00 00 00       	mov    $0x1,%esi
  402a74:	bf 02 00 00 00       	mov    $0x2,%edi
  402a79:	e8 02 e4 ff ff       	callq  400e80 <socket@plt>
  402a7e:	89 c3                	mov    %eax,%ebx
  402a80:	85 c0                	test   %eax,%eax
  402a82:	79 4f                	jns    402ad3 <init_driver+0xaf>
  402a84:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402a8b:	3a 20 43 
  402a8e:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402a92:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402a99:	20 75 6e 
  402a9c:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402aa0:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402aa7:	74 6f 20 
  402aaa:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402aae:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402ab5:	65 20 73 
  402ab8:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402abc:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402ac3:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402ac9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ace:	e9 28 01 00 00       	jmpq   402bfb <init_driver+0x1d7>
  402ad3:	bf 75 35 40 00       	mov    $0x403575,%edi
  402ad8:	e8 83 e2 ff ff       	callq  400d60 <gethostbyname@plt>
  402add:	48 85 c0             	test   %rax,%rax
  402ae0:	75 68                	jne    402b4a <init_driver+0x126>
  402ae2:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402ae9:	3a 20 44 
  402aec:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402af0:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402af7:	20 75 6e 
  402afa:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402afe:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402b05:	74 6f 20 
  402b08:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402b0c:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402b13:	76 65 20 
  402b16:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402b1a:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402b21:	72 20 61 
  402b24:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402b28:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402b2f:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402b35:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402b39:	89 df                	mov    %ebx,%edi
  402b3b:	e8 e0 e1 ff ff       	callq  400d20 <close@plt>
  402b40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b45:	e9 b1 00 00 00       	jmpq   402bfb <init_driver+0x1d7>
  402b4a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402b51:	00 
  402b52:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402b59:	00 00 
  402b5b:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402b61:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402b65:	48 8b 40 18          	mov    0x18(%rax),%rax
  402b69:	48 8b 30             	mov    (%rax),%rsi
  402b6c:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402b71:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402b76:	e8 f5 e1 ff ff       	callq  400d70 <__memmove_chk@plt>
  402b7b:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
  402b82:	ba 10 00 00 00       	mov    $0x10,%edx
  402b87:	48 89 e6             	mov    %rsp,%rsi
  402b8a:	89 df                	mov    %ebx,%edi
  402b8c:	e8 bf e2 ff ff       	callq  400e50 <connect@plt>
  402b91:	85 c0                	test   %eax,%eax
  402b93:	79 50                	jns    402be5 <init_driver+0x1c1>
  402b95:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402b9c:	3a 20 55 
  402b9f:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402ba3:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402baa:	20 74 6f 
  402bad:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402bb1:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402bb8:	65 63 74 
  402bbb:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402bbf:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402bc6:	65 72 76 
  402bc9:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402bcd:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402bd3:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402bd7:	89 df                	mov    %ebx,%edi
  402bd9:	e8 42 e1 ff ff       	callq  400d20 <close@plt>
  402bde:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402be3:	eb 16                	jmp    402bfb <init_driver+0x1d7>
  402be5:	89 df                	mov    %ebx,%edi
  402be7:	e8 34 e1 ff ff       	callq  400d20 <close@plt>
  402bec:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402bf2:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402bf6:	b8 00 00 00 00       	mov    $0x0,%eax
  402bfb:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  402c00:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402c07:	00 00 
  402c09:	74 05                	je     402c10 <init_driver+0x1ec>
  402c0b:	e8 d0 e0 ff ff       	callq  400ce0 <__stack_chk_fail@plt>
  402c10:	48 83 c4 28          	add    $0x28,%rsp
  402c14:	5b                   	pop    %rbx
  402c15:	5d                   	pop    %rbp
  402c16:	c3                   	retq   

0000000000402c17 <driver_post>:
  402c17:	53                   	push   %rbx
  402c18:	48 83 ec 10          	sub    $0x10,%rsp
  402c1c:	4c 89 cb             	mov    %r9,%rbx
  402c1f:	45 85 c0             	test   %r8d,%r8d
  402c22:	74 27                	je     402c4b <driver_post+0x34>
  402c24:	48 89 ca             	mov    %rcx,%rdx
  402c27:	be 8d 35 40 00       	mov    $0x40358d,%esi
  402c2c:	bf 01 00 00 00       	mov    $0x1,%edi
  402c31:	b8 00 00 00 00       	mov    $0x0,%eax
  402c36:	e8 b5 e1 ff ff       	callq  400df0 <__printf_chk@plt>
  402c3b:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402c40:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402c44:	b8 00 00 00 00       	mov    $0x0,%eax
  402c49:	eb 39                	jmp    402c84 <driver_post+0x6d>
  402c4b:	48 85 ff             	test   %rdi,%rdi
  402c4e:	74 26                	je     402c76 <driver_post+0x5f>
  402c50:	80 3f 00             	cmpb   $0x0,(%rdi)
  402c53:	74 21                	je     402c76 <driver_post+0x5f>
  402c55:	4c 89 0c 24          	mov    %r9,(%rsp)
  402c59:	49 89 c9             	mov    %rcx,%r9
  402c5c:	49 89 d0             	mov    %rdx,%r8
  402c5f:	48 89 f9             	mov    %rdi,%rcx
  402c62:	48 89 f2             	mov    %rsi,%rdx
  402c65:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
  402c6a:	bf 75 35 40 00       	mov    $0x403575,%edi
  402c6f:	e8 62 f6 ff ff       	callq  4022d6 <submitr>
  402c74:	eb 0e                	jmp    402c84 <driver_post+0x6d>
  402c76:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402c7b:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402c7f:	b8 00 00 00 00       	mov    $0x0,%eax
  402c84:	48 83 c4 10          	add    $0x10,%rsp
  402c88:	5b                   	pop    %rbx
  402c89:	c3                   	retq   
  402c8a:	90                   	nop
  402c8b:	90                   	nop

0000000000402c8c <check>:
  402c8c:	89 fa                	mov    %edi,%edx
  402c8e:	c1 ea 1c             	shr    $0x1c,%edx
  402c91:	b8 00 00 00 00       	mov    $0x0,%eax
  402c96:	b9 00 00 00 00       	mov    $0x0,%ecx
  402c9b:	85 d2                	test   %edx,%edx
  402c9d:	75 0d                	jne    402cac <check+0x20>
  402c9f:	eb 1b                	jmp    402cbc <check+0x30>
  402ca1:	89 f8                	mov    %edi,%eax
  402ca3:	d3 e8                	shr    %cl,%eax
  402ca5:	3c 0a                	cmp    $0xa,%al
  402ca7:	74 0e                	je     402cb7 <check+0x2b>
  402ca9:	83 c1 08             	add    $0x8,%ecx
  402cac:	83 f9 1f             	cmp    $0x1f,%ecx
  402caf:	7e f0                	jle    402ca1 <check+0x15>
  402cb1:	b8 01 00 00 00       	mov    $0x1,%eax
  402cb6:	c3                   	retq   
  402cb7:	b8 00 00 00 00       	mov    $0x0,%eax
  402cbc:	f3 c3                	repz retq 

0000000000402cbe <gencookie>:
  402cbe:	53                   	push   %rbx
  402cbf:	83 c7 01             	add    $0x1,%edi
  402cc2:	e8 c9 df ff ff       	callq  400c90 <srandom@plt>
  402cc7:	e8 e4 e0 ff ff       	callq  400db0 <random@plt>
  402ccc:	89 c3                	mov    %eax,%ebx
  402cce:	89 c7                	mov    %eax,%edi
  402cd0:	e8 b7 ff ff ff       	callq  402c8c <check>
  402cd5:	85 c0                	test   %eax,%eax
  402cd7:	74 ee                	je     402cc7 <gencookie+0x9>
  402cd9:	89 d8                	mov    %ebx,%eax
  402cdb:	5b                   	pop    %rbx
  402cdc:	c3                   	retq   
  402cdd:	90                   	nop
  402cde:	90                   	nop
  402cdf:	90                   	nop

0000000000402ce0 <__libc_csu_init>:
  402ce0:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  402ce5:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  402cea:	48 8d 2d 0f 11 20 00 	lea    0x20110f(%rip),%rbp        # 603e00 <__init_array_end>
  402cf1:	4c 8d 25 00 11 20 00 	lea    0x201100(%rip),%r12        # 603df8 <__frame_dummy_init_array_entry>
  402cf8:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  402cfd:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  402d02:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  402d07:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  402d0c:	48 83 ec 38          	sub    $0x38,%rsp
  402d10:	4c 29 e5             	sub    %r12,%rbp
  402d13:	41 89 fd             	mov    %edi,%r13d
  402d16:	49 89 f6             	mov    %rsi,%r14
  402d19:	48 c1 fd 03          	sar    $0x3,%rbp
  402d1d:	49 89 d7             	mov    %rdx,%r15
  402d20:	e8 23 df ff ff       	callq  400c48 <_init>
  402d25:	48 85 ed             	test   %rbp,%rbp
  402d28:	74 1c                	je     402d46 <__libc_csu_init+0x66>
  402d2a:	31 db                	xor    %ebx,%ebx
  402d2c:	0f 1f 40 00          	nopl   0x0(%rax)
  402d30:	4c 89 fa             	mov    %r15,%rdx
  402d33:	4c 89 f6             	mov    %r14,%rsi
  402d36:	44 89 ef             	mov    %r13d,%edi
  402d39:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  402d3d:	48 83 c3 01          	add    $0x1,%rbx
  402d41:	48 39 eb             	cmp    %rbp,%rbx
  402d44:	75 ea                	jne    402d30 <__libc_csu_init+0x50>
  402d46:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  402d4b:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  402d50:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  402d55:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  402d5a:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  402d5f:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  402d64:	48 83 c4 38          	add    $0x38,%rsp
  402d68:	c3                   	retq   
  402d69:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000402d70 <__libc_csu_fini>:
  402d70:	f3 c3                	repz retq 
  402d72:	90                   	nop
  402d73:	90                   	nop

Disassembly of section .fini:

0000000000402d74 <_fini>:
  402d74:	48 83 ec 08          	sub    $0x8,%rsp
  402d78:	48 83 c4 08          	add    $0x8,%rsp
  402d7c:	c3                   	retq   
