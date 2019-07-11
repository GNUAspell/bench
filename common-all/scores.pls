#proc areadef
  yrange: 0 11
  xrange: 0 100

#proc getdata
data:
    "Aspell .31 / Normal" 83.9 13.7 1.0 0.5 0.1 0.0
    "Aspell .33 / Normal" 81.2 15.4 1.5 0.6 0.2 0.1
    "Aspell 0.50 / Normal" 81.5 15.3 1.4 0.8 0.1 0.0
    "Aspell 0.60 / Normal" 73.3 22.0 1.4 0.6 0.2 0.0
    "Aspell 0.60 / Slow" 74.0 22.5 1.6 0.8 0.2 0.0
    "Aspell 0.60.6 / Normal" 73.8 22.4 1.5 0.7 0.2 0.0
    "Aspell 0.60.6 / Slow" 74.0 22.6 1.6 0.8 0.2 0.0
    "Hunspell 1.1.12" 80.5 16.0 0.7 0.0 0.0 0.0
    "Hunspell w/ Phonetic Lookup" 79.9 16.7 0.8 0.0 0.0 0.0
    "Ispell 3.1.20 w/ -S option" 77.0 7.7 0.3 0.1 0.0 0.0

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
