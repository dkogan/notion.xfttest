#!/usr/bin/perl

# from: action	called	timestamp
# to:   action	called	caller	timestamp
# where: action is 'e' or 'x'

use strict;
use warnings;

my @stack = ('main');

while (<STDIN> =~ /(\w)\t([^\t]*)\t(.*)/) {
  my ($action, $called, $timestamp) = ($1, $2, $3);
  my $caller;
  if ($action eq "e") {
    $caller = $stack[-1];
    push(@stack, $called);
  }
  elsif ($action eq "x") {
    $caller = pop(@stack);
    $caller = $stack[-1];
  }
  print "$action\t$called\t$caller\t$timestamp\n";
}
