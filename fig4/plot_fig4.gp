set terminal epslatex size 6,4 color colortext 12 standalone  
set output "fig4.tex"

set multiplot

TOP=0.98
RIGHT=0.97
LEFT=0.11
BOTTOM=0.12

#4D EA
qea5=0.625
qea7=0.568
qea9=0.53

#BETHE
qea8=0.767
qea10=0.72
qea12=0.704

set tmargin at screen TOP
set bmargin at screen BOTTOM
set lmargin at screen LEFT
set rmargin at screen RIGHT

set xlabel font ",16"
set ylabel font ",16"
set xlabel "$q^2/q_{\\mathrm{EA}}^2(L)$" offset 0,0.5
set ylabel "$R^N_C(|q|;h)$" offset 0.2,0
#set key b l 
set key at 0.25, 0.9 
set key spacing 1.5
set yrange [0.4:2.6]

plot "Data/chaos_h00h10_L5.dat" u (($1*$1)/(qea5*qea5)):2:3 w yerror lc 3 lw 4 t "$L=5$",\
"Data/N5V4L5C.tot" u ($1**2/(qea5*qea5)):2 w l lc 3 lw 5 t "",\
"Data/chaos_h00h10_L7.dat" u (($1*$1)/(qea7*qea7)):2:3 w yerror lc 2 lw 4 t "$L=7$",\
"Data/N5V4L7C.tot" u ($1**2/(qea7*qea7)):2 w l lc 2 lw 5 t "",\
"Data/chaos_h00h10_L9.dat" u (($1*$1)/(qea9*qea9)):2:3 w yerror lw 4 lc 1 t "$L=9$",\
"Data/N5V4L9C.tot" u ($1**2/(qea9*qea9)):2 w l lc 1 lw 5 t ""


set origin .62, .45
set size .34,.50
clear
unset xlabel
unset ylabel
unset key 
unset title

set key at 0.9,1.9 
set key font ",10"
set key spacing 2.5
set xtics .2
set ytics .5
se xtics font ",8"
set bmargin 0.5
set tmargin 0.5
set lmargin 0.5
set rmargin 0.5
set xrange [0:1]
set yrange [:2]
p 'Data/R_h4_N2e8_disc.ave' u ($1**2/(qea8*qea8)):2:3 w yerror ls 3 t "$N=256\\hphantom{1}$",\
"Data/N5V4L8C.tot" u ($1**2/(qea8*qea8)):2 w l  ls 3  lw 3 t '',\
'Data/R_h4_N2e10_disc.ave' u ($1**2/(qea10*qea10)):2:3 w yerror ls 2 t '$N=1024$', \
"Data/N5V4L10C.tot" u ($1**2/(qea10*qea10)):2 w l  ls 2  lw 3 t '',\
'Data/R_h4_N2e12_disc.ave' u ($1**2/(qea12*qea12)):2:3 w yerror  ls 1 t '$N=4096$',\
"Data/N5V4L12C.tot" u ($1**2/(qea12*qea12)):2 w l ls 1 lw 3 t ''

unset multiplot

