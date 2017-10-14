#!/usr/bin/perl 
#!/usr/local/bin/perl 
# Test single instructions in pipeline

use Getopt::Std;
use lib ".";
require tester;

cmdline();

@vals = (0x100, 0x020, 0x004);

@instr = ("rrmovq", "addq", "subq", "andq", "xorq");
@regs = ("rdx", "rbx", "rsp");

foreach $t (@instr) {
    foreach $ra (@regs) {
	foreach $rb (@regs) {
	    $tname = "op-$t-$ra-$rb";
	    open (YFILE, ">$tname.ys") || die "Can't write to $tname.ys\n";
	    print YFILE <<STUFF;
	      irmovq \$$vals[0], %$ra
	      irmovq \$$vals[1], %$rb
	      nop
	      nop
	      nop
	      $t %$ra,%$rb
	      nop
	      nop
	      halt
STUFF
	    close YFILE;
	    run_test($tname);
	}
    }
}

if ($testiaddq) {
    foreach $ra (@regs) {
	foreach $val (@vals) {
	    $tname = "op-iaddq-$val-$ra";
	    open (YFILE, ">$tname.ys") || die "Can't write to $tname.ys\n";
	    print YFILE <<STUFF;
	    irmovq \$$val, %$ra
	    nop
	    nop
	    nop
            iaddq \$-32, %$ra
	    nop
	    nop
	    halt
STUFF
            close YFILE;
	    run_test($tname);
	}
    }
}

@instr = ("pushq", "popq");
@regs = ("rdx", "rsp");

foreach $t (@instr) {
    foreach $ra (@regs) {
	$tname = "op-$t-$ra";
	open (YFILE, ">$tname.ys") || die "Can't write to $tname.ys\n";
	print YFILE <<STUFF;
        irmovq \$0x200,%rsp
	irmovq \$$vals[1], %rax
	nop
	nop
        nop
        rmmovq %rax, 0(%rsp)
	irmovq \$$vals[2], %rax
	nop
        nop
        nop
	rmmovq %rax, -4(%rsp)
	irmovq \$$vals[0], %rdx
	nop
        nop
        nop
	$t %$ra
	nop
	nop
        halt
STUFF
	close YFILE;
	&run_test($tname);
    }
}

&test_stat();
