#!/usr/bin/perl
#!/usr/local/bin/perl

# 
# benchmark.pl - Run test of pipeline on ncopy for different block sizes 
#                and determine CPE (cycles per element)
#
use Getopt::Std;

#
# Configuration
#
$blocklen = 64;
$yas = "../misc/yas";
$pipe = "./psim";
$gendriver = "./gen-driver.pl";
$fname = "bdriver";
$verbose = 1;

## Grading criteria
$totalpoints = 60;
# What CPE is required to get full credit?
$fullcpe = 7.5;
# What CPE is required to get nonzero credit:
$threshcpe = 10.5;



#
# usage - Print the help message and terminate
#
sub usage {
    print STDERR "Usage: $0 [-hq] [-n N] -f FILE\n";
    print STDERR "   -h      Print help message\n";
    print STDERR "   -q      Quiet mode (default verbose)\n";
    print STDERR "   -n N    Set max number of elements up to 64 (default $blocklen)\n";
    print STDERR "   -f FILE Input .ys file is FILE\n";
    die "\n";
}

getopts('hqn:f:');

if ($opt_h) {
    usage();
}

if ($opt_q) {
    $verbose = 0;
}

if ($opt_n) {
    $blocklen = $opt_n;
    if ($blocklen < 0 || $blocklen > 64) {
	print STDERR "n must be between 0 and 64\n";
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

$tcpe = 0;
for ($i = 0; $i <= $blocklen; $i++) {
    !(system "$gendriver -n $i -f $ncopy.ys > $fname$i.ys") ||
	die "Couldn't generate driver file $fname$i.ys\n";
    !(system "$yas $fname$i.ys") ||
	die "Couldn't assemble file $fname$i.ys\n";
    $stat = `$pipe -v 0 $fname$i.yo` ||
	die "Couldn't simulate file $fname$i.yo\n";
    !(system "rm $fname$i.ys $fname$i.yo") ||
	die "Couldn't remove files $fname$i.ys and/or $fname$i.yo\n";
    chomp $stat;
    $stat =~ s/[ ]*CPI:[ ]*//;
    $stat =~ s/ cycles.*//;
    if ($i > 0) {
      $cpe = $stat/$i;
      if ($verbose) {
	printf "%d\t%d\t%.2f\n", $i, $stat, $cpe;
      }
      $tcpe += $cpe;
    } else {
      if ($verbose) {
	printf "%d\t%d\n", $i, $stat;
      }
    }
      
}

$acpe = $tcpe/$blocklen;
printf "Average CPE\t%.2f\n", $acpe;

## Compute Score
$score = 0;
if ($acpe <= $fullcpe) {
    $score = $totalpoints;
} elsif ($acpe <= $threshcpe) {
    $score = $totalpoints * ($threshcpe - $acpe)/($threshcpe - $fullcpe);
}
printf "Score\t%.1f/%.1f\n", $score, $totalpoints;

