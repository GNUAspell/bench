
while (<>) {
  chop; chop;
  @data = split /\s*,\s*/;
  print "$data[0]\t$data[1]\t$data[2]\t$data[3]\n";
}
