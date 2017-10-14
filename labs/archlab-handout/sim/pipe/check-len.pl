#!/usr/bin/perl

# Check length of ncopy function in .yo file
# Assumes that function starts with label "ncopy:"
# and finishes with label "End:"

$startpos = -1;
$endpos = -1;

while (<>) {
  $line = $_;
  if ($line =~ /(0x[0-9a-fA-F]+):.* ncopy:/) {
    $startpos = hex($1);
  }
  if ($line =~ /(0x[0-9a-fA-F]+):.* End:/) {
    $endpos = hex($1);
  }
}

if ($startpos >= 0 && $endpos > $startpos) {
  $len = $endpos - $startpos;
  print "ncopy length = $len bytes\n";
} else {
  print "Couldn't determine ncopy length\n";
}
