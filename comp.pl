#!/usr/bin/perl

open A, $ARGV[0];
open B, $ARGV[1];

while (1) 
{
    ($a_miss, $cor, $a_pos, $a_num) = split /\t/,<A> || last;
    ($b_miss, $cor, $b_pos, $b_num) = split /\t/,<B> || last;
    $line = "$a_miss\t$cor\t$a_pos\t$b_pos\n";
    if ($a_miss ne $b_miss) {die "$a_miss != $b_miss";}
    print "B: $line" if ($a_pos == 0 && $b_pos != 0);
    print "A: $line" if ($a_pos != 0 && $b_pos == 0);
}
