set terminal epslatex size 6,4 color colortext 12 standalone  
set output "fig5.tex"

set multiplot
TOP=0.99
RIGHT=0.97
LEFT=0.13
BOTTOM=0.12

set tmargin at screen TOP
set bmargin at screen BOTTOM
set lmargin at screen LEFT
set rmargin at screen RIGHT

#4D EA
qea5=0.625
qea7=0.568
qea9=0.53

#BETHE
qea8=0.767
qea10=0.72
qea12=0.704

set xlabel font ",16"
set ylabel font ",16"
set xlabel "$q/q_{\\mathrm{EA}}(L)$" offset 0,0.5
set ylabel "$R^N(q;h)$" offset 0.2,0

set key at -0.3,2.1
set key spacing 1.5
set log y
set yrange [.005:3]

pl "Data/N5V4L5S.tot" u ($1/qea5):2:3  w l lw 5 lc 3 t "",\
"Data/N5V4L7S.tot" u ($1/qea7):2:3 w l lw 5 lc 2 t "",\
"Data/N5V4L9S.tot" u ($1/qea9):2:3 w l lw 5 lc 1 t "",\
"Data/nochaos_h10h10_L5.dat" u ($1/qea5):2:3 w yerror lc 3 lw 4 t "$L=5$",\
"Data/nochaos_h10h10_L7.dat" u ($1/qea7):2:3 w yerror lc 2 lw 4 t "$L=7$",\
"Data/nochaos_h10h10_L9.dat" u ($1/qea9):2:3 w yerror lc 1 lw 4 t "$L=9$"

set origin 0.47,0.2
set size .47,.55
clear
unset xlabel
unset ylabel
set key font ",10"
set key spacing 2.5

set bmargin 0.5
set tmargin 1
set lmargin 1
set rmargin 0.1
set key at 0.79, 0.029
set yrange [:2.1]
set xrange [-1:1]

p 'Data/R_h4_N2e8_disc.ave' u ($1/qea8):2:3 w yerror ls 3 t "$N=256\\hphantom{1}$", \
"Data/N5V4L8S.tot" u ($1/qea8):2 w l ls 3 lw 3 t '',\
'Data/R_h4_N2e10_disc.ave' u  ($1/qea10):2:3 w yerror ls 2 t '$N=1024$', \
"Data/N5V4L10S.tot" u ($1/qea10):2 w l ls 2 lw 3 t '',\
 'Data/R_h4_N2e12_disc.ave' u  ($1/qea10):2:3w yerror  ls 1 t '$N=4096$', \
"Data/N5V4L12S.tot" u ($1/qea12):2 w l ls 1 lw 3 t ''

unset multiplot
