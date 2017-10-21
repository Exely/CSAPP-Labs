#!/usr/bin/perl 
#!/usr/local/bin/perl 
# Test for pipeline hazards

use Getopt::Std;
use lib ".";
use tester;

cmdline();

# Destination Instructions
@dest =
(
 # Having %rax as destination
 "1:rrmovq %rcx,%rax",
 "1:irmovq \$0x101,%rax",
 "1:mrmovq 0(%rbp),%rax",
 "1:addq   %rax,%rax",
 "1:popq   %rax",
 "1:cmovne %rcx,%rax", # Not taken
 "1:cmove  %rcx,%rax", # Taken
 # Instructions having %rbp as destination
 "2:rrmovq %rax,%rbp",
 "2:irmovq \$0x100,%rbp",
 "2:mrmovq 4(%rbp),%rbp",
 "2:addq   %rax,%rbp",
 "2:popq   %rbp",
 "2:cmovne %rax,%rbp", # Not taken
 "2:cmove  %rax,%rbp", # Taken
 # Instructions having %rsp as destination
 "3:rrmovq %rbp,%rsp",
 "3:irmovq \$0x104,%rsp",
 "3:mrmovq 4(%rbp),%rsp",
 "3:addq   %rax,%rsp",
 "3:popq   %rbp",
 "3:pushq  %rax",
 "3:pushq  %rsp",
 "3:popq   %rsp",
 "1:cmovne %rbp,%rsp", # Not taken
 "1:cmove  %rbp,%rsp"  # Taken
 );

if ($testiaddq) {
    @dest = (@dest,
	     "1:iaddq \$0x201,%rax",
	     "2:iaddq \$0x4,%rbp",
	     "3:iaddq \$0x4,%rsp",);
}

if ($testleave) {
    @dest = (@dest,  "2:leave", "3:leave");
}

@src = 
(
 # Instructions having %rax as source
 "1:rrmovq %rax,%rbp",
 "1:rmmovq %rax,0(%rbp)",
 "1:rmmovq %rbp,0(%rax)",
 "1:mrmovq 4(%rax),%rbp",
 "1:addq   %rax,%rbp",
 "1:addq   %rbp,%rax",
 "1:addq   %rax,%rax",
 "1:pushq  %rax",
 # Instructions having %rbp as source
 "2:rrmovq %rbp,%rbp",
 "2:rmmovq %rbp,4(%rbp)",
 "2:rmmovq %rax,0(%rbp)",
 "2:mrmovq 8(%rbp),%rax",
 "2:addq   %rbp,%rax",
 "2:addq   %rax,%rbp",
 "2:addq   %rbp,%rbp",
 "2:pushq  %rbp",
 # Instructions having %rsp as source
 "3:rrmovq %rsp,%rbp",
 "3:rmmovq %rsp,4(%rbp)",
 "3:rmmovq %rax,-4(%rsp)",
 "3:mrmovq 4(%rsp),%rax",
 "3:addq   %rsp,%rax",
 "3:addq   %rax,%rsp",
 "3:addq   %rsp,%rsp",
 "3:pushq  %rsp",
 "3:ret"
 );

if ($testiaddq) {
    @src = (@src,
	    "1:iaddq \$0x301,%rax",
	    "2:iaddq \$0x8,%rbp",
	    "3:iaddq \$0x8,%rsp");
}

# Generate test with 4 instructions inserted
sub gen_test 
{
    local ($i1, $i2, $i3, $i4) = @_;
    print YFILE <<STUFF;
    # Preamble.  Initialize memory and registers
    irmovq \$0xf5,%rax
    irmovq \$0,%rbp
    rmmovq %rax,0xe0(%rbp)
    irmovq \$0xf7,%rax
    rmmovq %rax,0xe8(%rbp)
    irmovq \$0xfb,%rax
    rmmovq %rax,0xf0(%rbp)
    irmovq \$0xff,%rax
    rmmovq %rax,0xf8(%rbp)
    irmovq \$0x100,%rbp
    irmovq \$0x10c,%rsp
    xorq %rax,%rax      # Set Z condition code
    irmovq \$0x80,%rax
    # Test 4 instruction sequence
    $i1
    $i2
    $i3
    $i4
    # Put in another instruction
    rrmovq %rsp,%rbp
    # Complete
    halt

.pos 0x08
     .quad pos01
     .quad pos02
     .quad pos03
     .quad pos04
     .quad pos05
     .quad pos06
pos01:
     halt
pos02:
     halt
pos03:
     halt
pos04:
     halt
pos05:
     halt
pos06:
     halt
     halt
     halt
     halt
     halt
     halt
     halt
     halt
     halt
     halt
     halt
     halt
     halt
     halt
     halt

.pos 0x100
    .quad pos11
    .quad pos12
    .quad pos13
    .quad pos14
    .quad pos15
    .quad pos16
pos11:
    halt
pos12:
    halt
pos13:
    halt
pos14:
    halt
pos15:
    halt
pos16:
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt

.pos 0x180
    .quad pos21
    .quad pos22
    .quad pos23
    .quad pos24
    .quad pos25
    .quad pos26
pos21:
    halt
pos22:
    halt
pos23:
    halt
pos24:
    halt
pos25:
    halt
pos26:
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
    halt
STUFF
}

# Generate pairwise tests
$di = 0;
$si = 0;
foreach $dline (@dest) {
    foreach $sline (@src) {
	($dtype, $d) = split /:/, $dline;
	($stype, $s) = split /:/, $sline;
	if ($dtype == $stype) {
	    # Two instructions with 2 nops between them
	    $tname = "hnn-$di-$si";
	    open (YFILE, ">$tname.ys") || die "Can't write to $tname.ys\n";
	    &gen_test($d, "nop", "nop", $s);
	    close  YFILE;
	    &run_test($tname);

	    # Two instructions with nop between them
	    $tname = "hn-$di-$si";
	    open (YFILE, ">$tname.ys") || die "Can't write to $tname.ys\n";
	    &gen_test($d, "nop", "", $s);
	    close  YFILE;
	    &run_test($tname);

	    # Two instructions in succession
	    $tname = "h-$di-$si";
	    open (YFILE, ">$tname.ys") || die "Can't write to $tname.ys\n";
	    &gen_test($d, "", "", $s);
	    close  YFILE;
	    &run_test($tname);
	}
	$si++;
    }
    $si = 0;
    $di++;
}

&test_stat();
