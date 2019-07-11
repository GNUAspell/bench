#!/usr/bin/perl

open DATA, "batch0.tab";

while (<DATA>) {
  chop;
  ($mis, $cor) = split /\t/;
  print "$mis,$cor\r\n";
}
