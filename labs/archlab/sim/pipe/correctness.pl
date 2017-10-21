#!/usr/bin/perl
#!/usr/local/bin/perl

#
# correctness.pl - Test ncopy assembly code for correctness
#
use Getopt::Std;

#
# Configuration
#
$blocklen = 64;
$over = 3;
$yas = "../misc/yas";
$yis = "../misc/yis";
$pipe = "./psim";
$gendriver = "./gen-driver.pl";
$fname = "cdriver";
$verbose = 1;
# Maximum allowable code length
$bytelim = 1000;

#
# usage - Print the help message and terminate
#
sub usage {
    print STDERR "Usage: $0 [-hqp] [-n N] -f FILE\n";
    print STDERR "   -h      Print help message\n";
    print STDERR "   -q      Quiet mode (default verbose)\n";
    print STDERR "   -p      Run program on pipeline simulator (default ISA sim)\n";
    print STDERR "   -n N    Set max number of elements up to 64 (default $blocklen)\n";
    print STDERR "   -f FILE Input .ys file is FILE\n";
    print STDERR "   -b blim set byte limit for function\n";
    die "\n";
}

getopts('hqpn:f:b:');

if ($opt_h) {
    usage();
}

if ($opt_q) {
    $verbose = 0;
}

if ($opt_b) {
    $bytelim = $opt_b;
}

$usepipe = 0;
if ($opt_p) {
    $usepipe = 1;
    print "Simulating with pipeline simulator psim\n";
} else {
    print "Simulating with instruction set simulator yis\n";
}


if ($opt_n) {
    $blocklen = $opt_n;
    if ($blocklen < 0) {
	print STDERR "n must be >= 0\n";
	die "\n";
    }
}

# Filename is required
if (!$opt_f) {
    $ncopy = "ncopy";
} else {
    $ncopy = $opt_f;
    # Strip off .ys
    $ncopy =~ s/\.ys//;
}

if ($verbose) {
    print "\t$ncopy\n";
}

$goodcnt = 0;

for ($i = 0; $i <= $blocklen+$over; $i++) {
    $len = $i;
    if ($i > $blocklen) {
	# Try some larger values
	$len = $blocklen * ($i - $blocklen + 1);
    }
    !(system "$gendriver -rc -n $len -f $ncopy.ys -b $bytelim > $fname$len.ys") ||
	die "Couldn't generate driver file $fname$len.ys\n";
    !(system "$yas $fname$len.ys") ||
	die "Couldn't assemble file $fname$len.ys\n";
    if ($usepipe) {
	!(system "$pipe -v 1 $fname$len.yo > $fname$len.pipe") ||
	    die "Couldn't simulate file $fname$len.yo with pipeline simulator\n";
	$stat = `grep "rax:" $fname$len.pipe`;
	!(system "rm $fname$len.ys $fname$len.yo $fname$len.pipe") ||
	    die "Couldn't remove files $fname$len.ys and/or $fname$len.yo and/or $fname$len.pipe\n";
	chomp $stat;
    } else {
	!(system "$yis $fname$len.yo > $fname$len.yis") ||
	    die "Couldn't simulate file $fname$len.yo with instruction set simulator\n";
	$stat = `grep rax $fname$len.yis`;
	!(system "rm $fname$len.ys $fname$len.yo $fname$len.yis") ||
	    die "Couldn't remove files $fname$len.ys and/or $fname$len.yo and/or $fname$len.yis\n";
	chomp $stat;
    }
    $result = "failed";
    if ($stat =~ "zzzz") {
	$result = "Couldn't run checking code";
    }
    if ($stat =~ "aaaa") {
	$result = "OK";
	$goodcnt ++;
    }
    if ($stat =~ "bbbb") {
	$result = "Bad count";
    }
    if ($stat =~ "cccc") {
	$result = "Program too long";
	printf "%d\t%s\n", $len, $result;
	last;
    }
    if ($stat =~ "dddd") {
	$result = "Incorrect copying";
    }
    if ($stat =~ "eeee") {
	$result = "Corruption before or after destination";
    }
    if ($verbose) {
	printf "%d\t%s\n", $len, $result;
    }
}

$bp1 = $blocklen+$over+1;
printf "$goodcnt/$bp1 pass correctness test\n";



