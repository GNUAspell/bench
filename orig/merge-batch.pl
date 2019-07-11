#!/usr/bin/perl

while (<>) {
  next if /^personal_repl/;
  /^(\S+):?\s+(\S+ ?\S*)\n/ or die;
  push repl,"$1\t$2\n";
}

foreach (sort @repl) {
  next if $prev eq $_;
  print;
  $prev = $_;
}
