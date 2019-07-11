#proc areadef
  yrange: 0 11
  xrange: 0 100

#proc getdata
data:
    "Aspell .31 / Normal" 56.0 31.1 5.4 2.7 0.4 0.0
    "Aspell .33 / Normal" 52.9 28.7 8.5 3.3 0.9 0.3
    "Aspell 0.50 / Normal" 53.9 28.8 7.6 4.2 0.4 0.1
    "Aspell 0.60 / Normal" 49.3 24.8 7.6 3.4 1.1 0.0
    "Aspell 0.60 / Slow" 53.2 27.7 8.7 4.3 1.1 0.0
    "Aspell 0.60.6 / Normal" 52.1 26.6 8.2 3.9 1.1 0.0
    "Aspell 0.60.6 / Slow" 53.3 27.9 8.9 4.3 1.1 0.0
    "Hunspell 1.1.12" 54.3 26.2 3.6 0.1 0.0 0.0
    "Hunspell w/ Phonetic Lookup" 55.4 26.8 3.9 0.1 0.0 0.0
    "Ispell 3.1.20 w/ -S option" 9.9 6.0 1.9 0.6 0.0 0.0

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
