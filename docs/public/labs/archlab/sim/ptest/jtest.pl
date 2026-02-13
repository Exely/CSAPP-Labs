#!/usr/bin/perl 
#!/usr/local/bin/perl 
# Test jump instructions

use Getopt::Std;
use lib ".";
use tester;

cmdline();

@vals = (32, 64);

@instr = ("jmp", "jle", "jl", "je", "jne", "jge", "jg", "call");

# Create set of forward tests
foreach $t (@instr) {
    foreach $va (@vals) {
	foreach $vb (@vals) {
	    $tname = "jf-$t-$va-$vb";
	    open (YFILE, ">$tname.ys") || die "Can't write to $tname.ys\n";
	    print YFILE <<STUFF;
	      irmovq stack, %rsp
	      irmovq \$1, %rsi
	      irmovq \$2, %rdi
	      irmovq \$4, %rbp
	      irmovq \$$va, %rax
	      irmovq \$$vb, %rdx
	      subq %rdx,%rax
	      $t target
	      addq %rsi,%rax
	      addq %rdi,%rax
	      addq %rbp,%rax
              halt
target:
	      addq %rsi,%rdx
	      addq %rdi,%rdx
	      addq %rbp,%rdx
              nop
              nop
	      halt
.pos 0x100
stack:
STUFF
	    close YFILE;
	    &run_test($tname);
	}
    }
}

# Create set of backward tests
foreach $t (@instr) {
    foreach $va (@vals) {
	foreach $vb (@vals) {
	    $tname = "jb-$t-$va-$vb";
	    open (YFILE, ">$tname.ys") || die "Can't write to $tname.ys\n";
	    print YFILE <<STUFF;
	      irmovq stack, %rsp
	      irmovq \$1, %rsi
	      irmovq \$2, %rdi
	      irmovq \$4, %rbp
	      irmovq \$$va, %rax
	      irmovq \$$vb, %rdx
	      jmp skip
	      halt
target:
	      addq %rsi,%rdx
	      addq %rdi,%rdx
	      addq %rbp,%rdx
              nop
              nop
	      halt
skip:
	      subq %rdx,%rax
	      $t target
	      addq %rsi,%rax
	      addq %rdi,%rax
	      addq %rbp,%rax
              halt
.pos 0x100
stack:
STUFF
	    close YFILE;
	    &run_test($tname);
	}
    }
}


if ($testiaddq) {
    # Create set of forward tests using iaddq
    foreach $t (@instr) {
	foreach $va (@vals) {
	    foreach $vb (@vals) {
		$tname = "ji-$t-$va-$vb";
		open (YFILE, ">$tname.ys") || die "Can't write to $tname.ys\n";
	      print YFILE <<STUFF;
	      irmovq stack, %rsp
	      irmovq \$1, %rsi
	      irmovq \$2, %rdi
	      irmovq \$4, %rbp
	      irmovq \$$va, %rax
	      iaddq \$-$vb,%rax
	      $t target
	      addq %rsi,%rax
	      addq %rdi,%rax
	      addq %rbp,%rax
              halt
target:
	      addq %rsi,%rdx
	      addq %rdi,%rdx
	      addq %rbp,%rdx
              nop
              nop
	      halt
.pos 0x100
stack:
STUFF
                close YFILE;
		&run_test($tname);
	    }
	}
    }
}

&test_stat();


