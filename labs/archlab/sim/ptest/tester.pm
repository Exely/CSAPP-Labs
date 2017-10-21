# Configuration information for processor tests.

# Common declarations for testing code

# Where's the assembler?
$yas = "../misc/yas";

# Which simulator is being tested?
$sim = "../pipe/psim";

# By default, don't test iaddq instruction.
$testiaddq = 0;

# Where should result files be placed?
$outputdir = ".";

# Generate performance targets?
$gen_perf = 0;
# Check performance targets?
$check_perf = 0;

# File with performance targets
$perf_file = "";

# Should this be a test of a Verilog implementation?
$test_vlog = 0;

# What model should be used for Verilog?
$vmodel = "pipe-std";

# What program does the Verilog testing
$vtest = "../verilog/test-sim.pl";

$tcount = 0;
$ecount = 0;
$pecount = 0;

sub run_test
{
    local ($tname) = @_;
##    print("Running test $tname\n");
    if ($test_vlog) {
	&run_vlog_test($tname);
    } else {
	&run_sim_test($tname);
    }
}

sub run_sim_test
{
    local ($tname) = @_;
    system "$yas $tname.ys" || die "Can't open file $tname.ys\n";
    local $result = `$sim -v 0 -t $tname.yo`;
    if (!($result =~ "Succeed")) {
	print "Test $tname failed\n";
	$ecount++;
	if (!($outputdir eq ".")) {
	  system "mv $tname.ys $outputdir";
	}
    } else {
	system "rm $tname.ys";
    }
    if ($gen_perf) {
	$_ = $result;
	m#CPI:[^0-9]*([0-9]+)[^0-9]*([0-9]+)#;
	$cycles = $1;
	$instructions = $2;
	print "$tname:$cycles:$instructions\n";
    }
    if ($check_perf) {
	$_ = $result;
	m#CPI:[^0-9]*([0-9]+)[^0-9]*([0-9]+)#;
	$tcycles = $1;
	$tinstructions = $2;
	$p = `grep $tname $perf_file` || die "Couldn't open file $perf_file\n";
	chomp $p;
	($pname, $pcycles, $pinstructions) = split /:/, $p;
	if ($tcycles != $pcycles) {
	    $pecount++;
	    print "Test $tname.\tMeasured cycles=$tcycles != Target cycles=$pcycles\n";
	}
    }
    $tcount++;
    system "rm $tname.yo";
}

sub run_vlog_test
{
    local ($tname) = @_;
    local $proc;
    local $version;
    local $dir;
    local $flags = "";
    if ($vmodel =~ /(pipe|seq|seq\+)-(.*)/) {
      $proc = $1;
      $version = $2;
      if ($proc =~ "seq") {
	$dir = "seq";
      } else {
	$dir = "pipe";
      }
      $flags = "-p ../verilog/components/$proc-proc.v -H ../$dir/$proc-$version.hcl";
    }
    print "Running '$vtest -a $tname $flags'\n";
    local $result = `$vtest -a $tname $flags`;
    if (!($result =~ "Results match")) {
	print "Test $tname failed\n";
	$ecount++;
	if (!($outputdir eq ".")) {
	  system "mv $tname.ys $outputdir";
	}
    } else {
	system "rm $tname.ys";
    }
    $tcount++;
}

sub test_stat
{
    if ($ecount == 0) {
	print "  All $tcount ISA Checks Succeed\n";
    } else {
	print "  $ecount/$tcount ISA Checks Failed\n";
    }
    if ($check_perf) {
	if ($pecount == 0) {
	    print "  All $tcount Performance Checks Succeed\n";
	} else {
	    print "   $pecount/$tcount Performance Checks Failed\n";
	}
    }
}

sub cmdline {
    # parse command line arguments
    getopts('his:Pp:d:Vm:');

    if ($opt_h) {
        print STDERR "Usage $argv[0] [-h] [-i] [-s <sim>] [-P] [-p <pfile>]\n";
        print STDERR "   -h       print Help message\n";
        print STDERR "   -i       test iaddq instruction\n";
        print STDERR "   -s <sim> Specify simulator\n";
        print STDERR "   -d <dir> Specify directory for counterexamples\n";
        print STDERR "   -P Generate performance data\n";
        print STDERR "   -p <version> Check using performance file <pfile>\n";
        print STDERR "   -V       test Verilog implementation\n";
        print STDERR "   -m <model> Model for Verilog\n";
        die "\n";
    }

    if ($opt_i) {
	$testiaddq = 1;
    }

    if ($opt_d) {
      $outputdir = $opt_d;
    }

    if ($opt_P) {
	$gen_perf = 1;
    }

    if ($opt_p) {
	$check_perf = 1;
	$perf_file = $opt_p;
    }

    if ($opt_s) {
	$sim = $opt_s;
    }
    if ($opt_V) {
	$test_vlog = 1;
	if ($opt_m) {
	  $vmodel = $opt_m;
	}
    } else {
	print "Simulating with $sim\n";
    }
}

# Perl gives error messages without the following line !?!
$junk = 1;





