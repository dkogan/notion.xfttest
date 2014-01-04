#!/usr/bin/perl

# from: action	called	timestamp
# to:   action	called called:0	caller called:0	timestamp
# where: action is 'e' or 'x'

use strict;
use warnings;

my @stack = ('main');

while (<STDIN> =~ /(\w)\t([^\t]*)\t([^\t]*)\t(.*)/) {
  my ($action, $called, $caller, $timestamp) = ($1, $2, $3, $4);

  if ($caller !~ / /) {
    $caller = "$caller $caller:0"
  }
  if ($called !~ / /) {
    $called = "$called $called:0"
  }

  print "$action\t$called\t$caller\t$timestamp\n";
}
