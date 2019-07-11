#!/usr/bin/perl

use strict;
use warnings;
no warnings 'uninitialized';

use IPC::Open2;
use IO::Handle;
use POSIX qw(clock CLOCKS_PER_SEC);

my $in = new IO::Handle;
my $out = new IO::Handle;
my $data = new IO::Handle;
open $data, "batch0.tab";

die "Usage: $0 <command> <output-base>\n" unless @ARGV == 2;

my $command = $ARGV[0];
my $base = $ARGV[1];

open R, ">$base.res";

my $pid = open2($in, $out, "/usr/bin/time $command -a -S 2> $base.time");
print $out "!\n";
<$in>;

while (<$data>) {
  chop;
  my ($mis, $cor) = split /\t/;
  die ":$mis:  :$cor:" if $mis !~ /^[a-zA-Z\']+ ?[a-zA-Z\']+$/;
  die ":$mis:  :$cor:" if $cor !~ /^[a-zA-Z\']+ ?[a-zA-Z\']+$/;
  print $out "$cor\n";
  my $res = <$in>;
  chop $res;
  if ($res) {
    print R "$mis\t$cor\t-1\t-1\n";
    $res = <$in>;
  } else {
    print $out "$mis\n";
    $res = <$in>;
    chop $res;
    if (!$res) {
      print R "$mis\t$cor\t-1\t-1\n";
    } else {
      my ($info, $list) = split /: /, $res;
      my ($key, undef, $num, undef) = split / /, $info;
      my @list = split /, /, $list;
      my $i;
      for ($i = 0; $list[$i] && $list[$i] ne $cor; $i++) {}
      if ($list[$i]) {$i++}
      else {$i = 0;}
      print R "$mis\t$cor\t$i\t$num\n";
      $res = <$in>;
    }
  }
}

close $out;
close R;



