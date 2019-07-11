#!/usr/bin/perl

sub dfile {0};

die "Usage: ./proc-res.pl <dir>" unless $ARGV[0];
$dir = $ARGV[0];

@data = (
  ['aspell-.20.res', 'Aspell', 'Aspell .20'],
  ['aspell-.21.res', 'Aspell', 'Aspell .21'],
  ['aspell-.24.res', 'Aspell', 'Aspell .22 - .24'],
  ['aspell-.28.res', 'Aspell', 'Aspell .25 - .28'],
  ['aspell-.29-normal.res', 'Aspell', 'Aspell .29.0 / Normal'],
  ['aspell-.29.1-normal.res', 'Aspell', 'Aspell .29.1 - .30 / Normal'],
  ['aspell-dmetaph-normal.res', 'Aspell', 'Aspell Dmetaph / Normal'],
  ['aspell-.29-fast.res', 'Aspell', 'Aspell .29 - .30 / Fast'],
  ['aspell-dmetaph-fast.res', 'Aspell', 'Aspell Dmetaph / Fast'],
  ['aspell-.29-bad.res', 'Aspell', 'Aspell .29 -.30 / Bad Spellers'],
  ['aspell-dmetaph-bad.res', 'Aspell', 'Aspell Dmetaph / Bad Spellers'],
  ['ispell.res', 'Ispell', 'Ispell 3.1.20 w/ -S option'],
  ['word.res'  ,'Word 97', 'Word 97'],
);

for $num (0.. $#data) {
  open IN, $data[$num][dfile] || die;
  $i = 0;
  while (<IN>) {
    chop;
    @d = split /\t/;
    $table[$i]{correct}    = $d[0];
    $table[$i]{misspelled} = $d[1];
    $table[$i]{data}[$num]{pos} = $d[2];
    $table[$i]{data}[$num]{num} = $d[3];
    $i++;
  }
}

foreach $i (0 .. $#data) {
  $sugnums[$i] = [];
}

TABLE_LOOP:
foreach $row (@table) {
  foreach $i (@{$row->{data}}) {
    next TABLE_LOOP if $i->{pos} == -1;
  }
  $num++;
  foreach $i (0 .. $#data) {
    $tally[$i][$row->{data}[$i]{pos}]++;
    push @{$sugnums[$i]}, $row->{data}[$i]{num};
  }
}

foreach $i (0 .. $#data) {
  $t = $tally[$i];
  $total[$i] = {};
  $T = $total[$i]; 

  @{$sugnums[$i]} = sort {$a <=> $b} @{$sugnums[$i]};

  $T->{notfound} = $t->[0];
  $T->{1} = $t->[1];
  foreach $j (  2 .. 5  )  { $T->{"2-5"}    += $t->[$j];}
  $T->{"-5"} =  $T->{1} + $T->{"2-5"};
  foreach $j (  6 .. 10 )  { $T->{"6-10"}   += $t->[$j];}
  $T->{"-10"} =  $T->{"-5"} + $T->{"6-10"};
  foreach $j ( 11 .. 25 )  { $T->{"11-25"}  += $t->[$j];}
  $T->{"-25"} =  $T->{"-10"} + $T->{"11-25"};
  foreach $j ( 26 .. 50)   { $T->{"26-50"}  += $t->[$j];}
  $T->{"-50"} =  $T->{"-25"} + $T->{"26-50"};
  $T->{"51+"} = 0;
  foreach $j (51 .. $#$t) { $T->{"50+"}   += $t->[$j];}
  foreach $j (1 .. $#$t) {
    push @{$T->{res_num_list}}, ;
    $T->{found} += $t->[$j];
    $T->{wtotal} += (0.50**$j)*$t->[$j]*(1/0.50);
  }
  $T->{score} = sprintf("%2.1f" , $T->{found}/$num * 100);
  $T->{wscore} = sprintf("%2.1f" , $T->{wtotal}/$num * 100);
  $T->{accuracy} = sprintf("%.3f", $T->{wtotal}/$T->{found});
}

sub table_sort {
  $a->[0] cmp $b->[0] ||
    $a->[1] cmp $b->[1];
}

sub per {sprintf("%2.1f", $_[0]/$num * 100) }

chdir $dir;
open H, ">index.html";
open S, ">scores.pls";
open N, ">sugnums.pls";

$num_data = $#data + 2;

print S <<"---";
#proc areadef
  yrange: 0 $num_data
  xrange: 0 100

#proc getdata
data:
---

print N <<"---";
#proc areadef
  yrange: 0 $num_data
  xrange: 0 1000

#proc xaxis
  stubs incremental 10
  grid: color=rgb(.90,.90,.90)

#proc getdata
data:
---

print H <<'---';
<html>
<head>
<title>Spell Checker Test Kernel Results</title>
</head>
<body>
<h1>Spell Checker Test Kernel Results</h1>

<hr>
---

print H <<"---";
<h3>Scores</h3>
<table border=1>
<tr><td width=20%>
<th width=10%>&nbsp;Score&nbsp;
<th width=10%>Total Not Found<th width=10%>Total Found
    <th width=8.35%>First<th width=8.33%>1 - 5<th width=8.33%>1 - 10<th width=8.33%>1 - 25<th width=8.33%>1 - 50<th width=8.33%>Any</th>
---

foreach $i (0 .. $#data) {
  $t = $tally[$i];
  $T = $total[$i];
  print H <<"---";
<tr>
  <td><b><a href="$data[$i][0]">$data[$i][2]</a></b>
  <td align=right><b>$T->{score}</b>
  <td align=right>$T->{notfound}  
  <td align=right>$T->{found}
  <td align=right>@{[per($T->{"1"})]}
  <td align=right>@{[per($T->{"-5"})]}
  <td align=right>@{[per($T->{"-10"})]}
  <td align=right>@{[per($T->{"-25"})]}
  <td align=right>@{[per($T->{"-50"})]}
  <td align=right>@{[per($T->{found})]}
---
  print S "    \"$data[$i][2]\"";
  print S " ", per($T->{"1"});
  print S " ", per($T->{"2-5"});
  print S " ", per($T->{"6-10"});
  print S " ", per($T->{"11-25"});
  print S " ", per($T->{"26-50"});
  print S " ", per($T->{"50+"});
  print S "\n";

  print N "  \"$data[$i][2]\" @{$sugnums[$i]}\n"
}

print H <<"---";
</table>
<i><b>Note:</b> Only Data in which the correct spelling was found in all three
dictionaries was counted.</i>
<p>
The Score is: <b><i>(Total Found)/(Total)*100</i></b><Br>
First is: <b><i>(Total Found First On List)/(Total)*100</i></b>,
1-5 is: <b><i>(Total Found 1st - 5th)/(Total)*100</i></b>, etc...
<p>

Dmetaph is Aspell .30.1 which uses the Double Metaphone algorithm.
Please see my <a
href="http://aspell.sourceforge.net/metaphone/">Metaphone
page</a> for more information.  To see which words Aspell with the
Double Metaphone algorithm got and Aspell .30.1 did not, and vice versa,
please see <a href="dmetaph-diff.txt">this</a> file.

<p>
<img src="scores.gif"><br>
<i><font size = -1>Graph created with <a href="http://www.sgpr.net/">Ploticus</a></font></i>
<p>
<hr>
<h3>Number of Results Returned</h3>
<table border=1>
<tr>
<td width=30%>
<th width=10%>Min</th>
<th width=10%>5%</th>
<th width=10%>25%</th>
<th width=10%>50%</th>
<th width=10%>75%</th>
<th width=10%>95%</th>
<th width=10%>Max</th>
---

foreach $i (0 .. $#data) {
  $T = $sugnums[$i];
  $num = $#{$T};
  print H <<"---";
<tr>
  <td><a href="$data[$i][0]">$data[$i][2]</a>
  <td align=right>$T->[$num * 0.00]
  <td align=right>$T->[$num * 0.05]
  <td align=right>$T->[$num * 0.25]
  <td align=right>$T->[$num * 0.50]
  <td align=right>$T->[$num * 0.75]
  <td align=right>$T->[$num * 0.95]
  <td align=right>$T->[$num * 1.00]
---
}

print H <<"---";
</table>
<hr>
<h2>The Raw Data</h2>
<ul>
<li><a href="batch0.tab">Test Data</a>
<li><a href="data.tar.gz">Results, Scripts and Raw Data</a>
</ul>
<hr>
<p align=center>
<a href="http://aspell.sourceforge.net/">Back to Aspell</a>
</p>
</body>
</html>
---

print S <<"---";

#proc xaxis
  stubs incremental 10
  grid: color=rgb(.90,.90,.90)

#proc bars
  legendlabel: First
  horizontalbars: yes
  outline: no
  color: limegreen
  lenfield: 2
  barwidth: 0.20

#proc yaxis
  tics: none
  axisline: none
  stubs: datafields=1
  stubdetails: size=13 style=B align=L adjust=.2,0

#proc bars
  legendlabel: 2 - 5
  horizontalbars: yes
  outline: no
  color: skyblue
  stackfields: 2
  lenfield: 3
  barwidth: 0.20

#proc bars
  legendlabel: 6 - 10 
  horizontalbars: yes
  outline: no
  color: brightblue
  stackfields: 2 3
  lenfield: 4
  barwidth: 0.20

#proc bars
  legendlabel: 11 - 25
  horizontalbars: yes
  outline: no
  color lightpurple
  stackfields: 2 3 4
  lenfield: 5
  barwidth: 0.20

#proc bars
  legendlabel: 26 - 50
  horizontalbars: yes
  outline: no
  color: red
  stackfields: 2 3 4 5
  lenfield: 6
  barwidth: 0.20

#proc bars
  legendlabel: 51+
  horizontalbars: yes
  outline: no
  color: black
  stackfields: 2 3 4 5 6
  lenfield: 7
  barwidth: 0.20


#proc legend
  location: min+.05 min-0.5
  format: singleline
  textdetails: size=13 style=B
  sep .6
---

close S;
close N;

system ("pl scores.pls -gif -o scores.gif -scale .80");

__END__


open OUT, ">maketar.sh";

print OUT "rm -r -f results/\n";
print OUT "mkdir results\n";

foreach $row (@data) {
  print OUT "cp $$row[0] results/\n";
}

print OUT "tar cfvz results.tar.gz results/\n";
print OUT "rm -r -f results/\n";

print <<"---";


<p><hr><p>
The <b>Pos</b> columne is the locaton in the suggestion list in which the correct spelling
was found. 
The <b>Num</b> columne is the total number of suggestions that the spell checker came up with.
A <b>-1</b> means that the correct spelling was not found in the spell checker's dictionary.

<table border=1>
<tr><td><td><th colspan=2>Aspell<th colspan=2>Ispell<th colspan=2>Word 97
<tr><th>Misspelled Word<th>Correct Word<th>Pos<th>Num<th>Pos<th>Num<th>Pos<th>Num
---
foreach $col (sort table_sort @table) {
  print "<tr>";
  foreach $i (@$col[0..$#$col-1]) {
    print "<td>$i";
  }
  print "\n";
}
print "</table>\n";


