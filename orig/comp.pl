#!/usr/bin/perl

open ORIG,"aspell-.29-bad.res";
open META,"aspell-dmetaph-bad.res";

while (1) 
{
    (  $miss, $cor, $o_pos, $o_num) = split /\t/,<ORIG> || last;
    ($m_miss, $cor, $m_pos, $m_num) = split /\t/,<META> || last;
    $line = "$miss\t$cor\t$o_pos\t$m_pos\n";
    if ($miss ne $m_miss) {die "$miss != $m_miss";}
    print "NEW : $line" if ($o_pos == 0 && $m_pos != 0);
    print "ORIG: $line" if ($o_pos != 0 && $m_pos == 0);
}
