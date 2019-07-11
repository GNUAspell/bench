#proc areadef
  yrange: 0 12
  xrange: 0 100

#proc getdata
data:
    "Aspell .31 / Normal" 59.6 26.0 4.5 2.8 0.2 0.0
    "Aspell .33 / Normal" 57.0 23.9 7.1 3.0 0.4 0.2
    "Aspell 0.50 / Normal" 57.2 23.9 7.3 3.0 0.2 0.2
    "Aspell 0.60 / Normal" 53.1 26.6 6.5 2.2 0.6 0.0
    "Aspell 0.60 / Slow" 53.3 27.4 8.3 3.4 0.6 0.0
    "Aspell 0.60.6 / Normal" 53.3 26.8 6.7 2.2 0.6 0.0
    "Aspell 0.60.6 / Slow" 53.3 27.2 8.3 3.4 0.6 0.0
    "Hunspell 1.1.12" 55.2 22.9 2.6 1.0 0.0 0.0
    "Hunspell w/ Phonetic Lookup" 56.0 26.0 3.2 0.4 0.0 0.0
    "Ispell 3.1.20 w/ -S option" 38.3 13.6 2.0 0.8 0.0 0.0
    "Word 97" 59.0 11.8 1.4 0.0 0.0 0.0

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

#proc yaxis
  tics: none
  axisline: none
  stubs: datafields=1
  stubdetails: size=13 style=B align=L adjust=.2,0

#proc legend
  location: min+.05 min-0.5
  format: singleline
  textdetails: size=13 style=B
  sep .6
