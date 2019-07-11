#!/usr/bin/perl

use IPC::Open2;
use IO::Handle;

$in = new IO::Handle;
$out = new IO::Handle;
$data = new IO::Handle;
open $data, "batch0.tab";

$command = $ARGV[0];

$pid = open2($in, $out, "$command -a -S");
print $out "!\n";
<$in>;

while (<$data>) {
  chop;
  ($mis, $cor) = split /\t/;
  die ":$mis:  :$cor:" if $mis !~ /^[a-zA-Z\']+ ?[a-zA-Z\']+$/;
  die ":$mis:  :$cor:" if $cor !~ /^[a-zA-Z\']+ ?[a-zA-Z\']+$/;
  print $out "$cor\n";
  $res = <$in>;
  chop $res;
  if ($res) {
    print "$mis\t$cor\t-1\t-1\n";
    $res = <$in>;
  } else {
    print $out "$mis\n";
    $res = <$in>;
    chop $res;
    if (!$res) {
      print "$mis\t$cor\t-1\t-1\n";
    } else {
      ($info, $list) = split /: /, $res;
      ($key, undef, $num, undef) = split / /, $info;
      @list = split /, /, $list;
      for ($i = 0; $list[$i] && $list[$i] ne $cor; $i++) {}
      if ($list[$i]) {$i++}
      else {$i = 0;}
      print "$mis\t$cor\t$i\t$num\n";
      $res = <$in>;
    }
  }
}

