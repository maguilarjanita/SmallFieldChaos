reset
set terminal epslatex size 6,4 color colortext 12 standalone
set output "fig6.tex"


temp=0.759325717500207
beta=1/1.421
q5=0.625
q7=0.568
q9=0.53
q8=0.767
q10=0.72
q12=0.704


set multiplot

TOP=0.99
RIGHT=0.97
LEFT=0.1
BOTTOM=0.12

set tmargin at screen TOP
set bmargin at screen BOTTOM
set lmargin at screen LEFT
set rmargin at screen RIGHT


############# Primer Plot ##################

set ylabel '$Tm(h)/h$' offset 1.1,0
set xlabel "$h$" offset 0,0.5

set xrange [0:10.1]
set yrange [0.54:1.05]

#set key b l
set key at 2.3, 0.65
set key spacing 1.5

plot "Data/N5V4L5G.tot" u 1:(($2/$1+(1-q5)*beta)/beta)  w l lc 3 lw 5 t "",\
"Data/N5V4L7G.tot" u 1:(($2/$1+(1-q7)*beta)/beta) w l lc 2 lw 5 t "",\
"Data/N5V4L9G.tot" u 1:(($2/$1+(1-q9)*beta)/beta) w l lc 1  lw 5 t "",\
"Data/mag_vs_h_L5.dat" u 1:($2*1.421*sqrt(5**4)/$1):($3*1.421*sqrt(5**4)/$1) w yerror lc 3 pt 1 lw 3 t "$L=5$",\
"Data/mag_vs_h_L7.dat" u 1:($2*1.421*sqrt(7**4)/$1):($3*1.421*sqrt(7**4)/$1) w yerror lc 2 pt 1 lw 3 t "$L=7$",\
"Data/mag_vs_h_L9.dat" u 1:($2*1.421*sqrt(9**4)/$1):($3*1.421*sqrt(9**4)/$1) w yerror lc 1 pt 1 lw 3 t "$L=9$"

############# Segundo Plot ##################

set origin 0.55,0.47
set size 0.40,0.50
clear
unset key
unset xlabel
unset ylabel

set xrange [0:10.1]
set yrange [0.35:1]

set bmargin 0.5
set tmargin 0.5
set lmargin 1
set rmargin 0.1
set key at 9.5, 0.95

p 'Data/mag.ave' ev :::0::0 u 3:($4/$3*sqrt($2)*temp):($5/$3*sqrt($2)*temp) w yerror ls 3 lw 3 t '$N=256$', \
'Data/N5V4L12G.tot' u 1:($2/$1*temp+1-q12) w l ls 3 lw 3 t '',\
'Data/mag.ave' ev :::1::1 u 3:($4/$3*sqrt($2)*temp):($5/$3*sqrt($2)*temp)  w yerror ls 2 lw 3 t '$N=1024$', \
'Data/N5V4L10G.tot' u 1:($2/$1*temp+1-q10) w l ls 2 lw 3 t '',\
'Data/mag.ave' ev :::2::2 u 3:($4/$3*sqrt($2)*temp):($5/$3*sqrt($2)*temp) w yerror  ls 1 lw 3 t '$N=4096$', \
'Data/N5V4L8G.tot' u 1:($2/$1*temp+1-q8) w l ls 1 lw 3 t ''




unset multiplot