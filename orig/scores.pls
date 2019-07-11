#proc areadef
  yrange: 0 14
  xrange: 0 100

#proc getdata
data:
    "Aspell .20" 58.4 19.7 3.5 1.2 0.0 0.0
    "Aspell .21" 58.0 18.6 3.1 1.0 0.2 0.0
    "Aspell .22 - .24" 55.5 21.5 4.1 3.9 0.6 0.2
    "Aspell .25 - .28" 56.2 21.9 2.7 2.3 0.0 0.0
    "Aspell .29.0 / Normal" 59.0 26.6 4.3 3.7 0.2 0.2
    "Aspell .29.1 - .30 / Normal" 59.0 26.6 4.3 2.7 0.2 0.0
    "Aspell Dmetaph / Normal" 59.2 26.8 5.5 2.1 0.2 0.0
    "Aspell .29 - .30 / Fast" 59.0 22.9 3.1 2.1 0.2 0.0
    "Aspell Dmetaph / Fast" 58.6 24.0 3.9 1.4 0.2 0.0
    "Aspell .29 -.30 / Bad Spellers" 59.6 23.2 4.5 7.2 2.0 1.6
    "Aspell Dmetaph / Bad Spellers" 59.8 23.2 6.4 6.2 1.4 1.2
    "Ispell 3.1.20 w/ -S option" 39.3 12.9 2.0 0.6 0.0 0.0
    "Word 97" 57.2 11.9 1.6 0.0 0.0 0.0

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
