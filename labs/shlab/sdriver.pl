#!/usr/bin/perl
#!/usr/local/bin/perl
use Getopt::Std;
use FileHandle;
use IPC::Open2;

#######################################################################
# sdriver.pl - Shell driver
#
# Copyright (c) 2002, R. Bryant and D. O'Hallaron, All rights reserved.
# May not be used, modified, or copied without permission.
#
# The driver runs a student's shell program as a child, sends 
# commands and signals to the child as directed by a trace file,
# and captures and displays the output produced by the child.
#
# Tracefile format:
# 
# The tracefile consists of text lines that are either blank lines,
# comment lines, driver commands, or shell commands. Blank lines are
# ignored. Comment lines begin with "#" and are echo'd without change 
# to stdout. Driver commands are intepreted  by the driver and are not 
# passed to the child shell. All other lines are shell commands and
# are passed without modification to the shell, which reads them on
# stdin. Output produced by the child on stdout/stderr is read by 
# the parent and printed on its stdout.
#
# Driver commands:
#     TSTP        Send a SIGTSTP signal to the child
#     INT         Send a SIGINT signal to the child 
#     QUIT        Send a SIGQUIT signal to the child
#     KILL        Send a SIGKILL signal to the child
#     CLOSE       Close Writer (sends EOF signal to child)
#     WAIT        Wait() for child to terminate
#     SLEEP <n>   Sleep for <n> seconds
# 
######################################################################

#
# usage - print help message and terminate
#
sub usage 
{
    printf STDERR "$_[0]\n";
    printf STDERR "Usage: $0 [-hv] -t <trace> -s <shellprog> -a <args>\n";
    printf STDERR "Options:\n";
    printf STDERR "  -h            Print this message\n";
    printf STDERR "  -v            Be more verbose\n";
    printf STDERR "  -t <trace>    Trace file\n";
    printf STDERR "  -s <shell>    Shell program to test\n";
    printf STDERR "  -a <args>     Shell arguments\n";
    printf STDERR "  -g            Generate output for autograder\n";
    die "\n" ;
}

# Parse the command line arguments
getopts('hgvt:s:a:');
if ($opt_h) {
    usage();
}
if (!$opt_t) {
    usage("Missing required -t argument");
}
if (!$opt_s) {
    usage("Missing required -s argument");
}
$verbose = $opt_v;
$infile = $opt_t;
$shellprog = $opt_s;
$shellargs = $opt_a;
$grade = $opt_g;

# Make sure the input script exists and is readable
-e $infile
    or die "$0: ERROR: $infile not found\n";
-r $infile
    or die "$0: ERROR: $infile is not readable\n";

# Make sure the shell program exists and is executable
-e $shellprog
    or die "$0: ERROR: $shellprog not found\n";
-x $shellprog
    or die "$0: ERROR: $shellprog is not executable\n";


# Open the input script
open INFILE, $infile
    or die "$0: ERROR: Couldn't open input file $infile: $!\n";

# 
# Fork a child, run the shell in it, and connect the parent
# and child with a pair of unidirectional pipes: 
#     parent:Writer -> child:stdin
#     child:stdout  -> parent:Reader
#
$pid = open2(\*Reader, \*Writer, "$shellprog $shellargs");
Writer->autoflush();

# The autograder will want to know the child shell's pid
if ($grade) {
    print ("pid=$pid\n");
}

# 
# Parent reads a trace file, sends commands to the child shell. 
#
while (<INFILE>) {
    $line = $_;
    chomp($line);

    # Comment line
    if ($line =~ /^#/) {  
	print "$line\n";
    }

    # Blank line
    elsif ($line =~ /^\s*$/) { 
	if ($verbose) {
	    print "$0: Ignoring blank line\n";
	}
    }

    # Send SIGTSTP (ctrl-z)
    elsif ($line =~ /TSTP/) {
	if ($verbose) {
	    print "$0: Sending SIGTSTP signal to process $pid\n";
	}
	kill 'TSTP', $pid;
    }

    # Send SIGINT (ctrl-c)
    elsif ($line =~ /INT/) {
	if ($verbose) {
	    print "$0: Sending SIGINT signal to process $pid\n";
	}
	kill 'INT', $pid;
    }

    # Send SIGQUIT (whenever we need graceful termination)
    elsif ($line =~ /QUIT/) {
	if ($verbose) {
	    print "$0: Sending SIGQUIT signal to process $pid\n";
	}
	kill 'QUIT', $pid;
    }

    # Send SIGKILL 
    elsif ($line =~ /KILL/) {
	if ($verbose) {
	    print "$0: Sending SIGKILL signal to process $pid\n";
	}
	kill 'KILL', $pid;
    }

    # Close pipe (sends EOF notification to child)
    elsif ($line =~ /CLOSE/) {
	if ($verbose) {
	    print "$0: Closing output end of pipe to child $pid\n";
	}
	close Writer;
    }

    # Wait for child to terminate
    elsif ($line =~ /WAIT/) {
	if ($verbose) {
	    print "$0: Waiting for child $pid\n";
	}
	wait;
	if ($verbose) {
	    print "$0: Child $pid reaped\n";
	}
    }

    # Sleep
    elsif ($line =~ /SLEEP (\d+)/) {
	if ($verbose) {
	    print "$0: Sleeping $1 secs\n";
	}
	sleep $1;
    }

    # Unknown input
    else {
	if ($verbose) {
	    print "$0: Sending :$line: to child $pid\n";
	}
	print Writer "$line\n";
    }
}

# 
# Parent echoes the output produced by the child.
#
close Writer;
if ($verbose) {
    print "$0: Reading data from child $pid\n";
}
while ($line = <Reader>) {
    print $line;
}
close Reader;

# Finally, parent reaps child
wait;

if ($verbose) {
    print "$0: Shell terminated\n";
}

exit;
