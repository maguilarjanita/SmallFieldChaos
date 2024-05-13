reset
set terminal epslatex size 6,4 color colortext 12 standalone  
set output "fig1.tex"

set multiplot

TOP=0.98
RIGHT=0.98
LEFT=0.12
BOTTOM=0.12

set tmargin at screen TOP
set bmargin at screen BOTTOM
set lmargin at screen LEFT
set rmargin at screen RIGHT

set xlabel font ",16"
set ylabel font ",16"
set xlabel "$q$" offset 0,0.5
set ylabel "$P(|q|)$" offset 0.2,0
set key top right
set yrange [0:2.2]

plot [0:1] "Data/Pq_JK_h00h00_L5.dat" u 1:2:3 w yerror t "$L=5$",\
"Data/Pq_JK_h00h00_L6.dat" u 1:2:3 w yerror t "$L=6$",\
"Data/Pq_JK_h00h00_L7.dat" u 1:2:3 w yerror t "$L=7$" ,\
"Data/Pq_JK_h00h00_L8.dat" u 1:2:3 w yerror t "$L=8$",\
"Data/Pq_JK_h00h00_L9.dat" u 1:2:3 w yerror t "$L=9$"


#Inset
set origin .16, .54
set size .30,.43
unset xlabel
unset ylabel
unset key
set key top left
set key font ",14"
set key spacing 1.5 
set bmargin 0.5
set tmargin 0.5
set lmargin 0.1
set rmargin 0.5
set ytics offset 0.4,0
set xtics offset 0,0.3
set format y '\scriptsize %g'
set ytics (0,0.5,1,1.5,2,2.5)
set format x '\scriptsize %g'
set xtics (0,0.2,0.4,0.6,0.8,1)
set yrange [0:2.6]

plot [0:1] "Data/Pq_h0_N2e8.ave" u  1:2:3 w yerrorlines t "\\scriptsize\$N=\\hphantom{1}256$",\
"Data/Pq_h0_N2e10.ave" u 1:2:3 w yerror t "\\\scriptsize$N=1024$",\
"Data/Pq_h0_N2e12.ave" u 1:2:3 w yerror t "\\scriptsize\$N=4096$"

unset multiplot
