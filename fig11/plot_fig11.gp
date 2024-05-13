set terminal cairolatex color colortext standalone
set output "fig11.tex"

set multiplot
TOP=0.99
RIGHT=0.97
LEFT=0.13
BOTTOM=0.12

set tmargin at screen TOP
set bmargin at screen BOTTOM
set lmargin at screen LEFT
set rmargin at screen RIGHT

set xlabel font ",16"
set ylabel font ",16"
set xlabel "$q$" offset 0,0.5
set ylabel "$R_A^N(|q|;h)$" offset 0.2,0
#set title "$h=10$" offset 0,-0.9
set key top right
set key spacing 1.5
#set log 
set yrange [0.75:1.45]
set xrange [0:0.55]

set style fill transparent solid 0.3 noborder

p "data/RA_L5_h10_suavizado7.dat" u 1:($2-2*$3) w l lw 3 lc 1 t "$L=5$",\
"data/RA_L5_h10_suavizado7.dat" u 1:($2+2*$3) w l lw 3 lc 1 not,\
"data/RA_L5_h10_suavizado7.dat" u 1:($2-2*$3):($2+2*$3) w filledcurves lc 1 not,\
"data/RA_L7_h10_suavizado7.dat" u 1:($2-2*$3) w l lw 3 lc 2 t "$L=7$",\
"data/RA_L7_h10_suavizado7.dat" u 1:($2+2*$3) w l lw 3 lc 2 not,\
"data/RA_L7_h10_suavizado7.dat" u 1:($2-2*$3):($2+2*$3) w filledcurves lc 2 not,\
"data/RA_L9_h10_suavizado7.dat" u 1:($2-2*$3) w l lw 3 lc 3 t "$L=9$",\
"data/RA_L9_h10_suavizado7.dat" u 1:($2+2*$3) w l lw 3 lc 3 not,\
"data/RA_L9_h10_suavizado7.dat" u 1:($2-2*$3):($2+2*$3) w filledcurves lc 3 not,\


set origin 0.2,0.62
set size .3,.35
clear
unset xlabel
unset ylabel

set xtics 0.4
set xtics offset 0,0.43
set ytics 0.04

#set key font ",10"
set key spacing 0.8
set key at 0.5, 1.09
set key samplen 1

set format y "\\scriptsize %g"
set format x "\\scriptsize %g"

set bmargin 0.3
set tmargin 0.1
set lmargin 1
set rmargin 0.1

set yrange [0.93:1.10]
set xrange [0:0.8]

p "data/RA_N8_h4_suavizado7.dat" u 1:($2-2*$3) w l lw 2 lc 1 t "\\tiny $N=\\hphantom{1}256$",\
"data/RA_N8_h4_suavizado7.dat" u 1:($2+2*$3) w l lw 2 lc 1 not,\
"data/RA_N8_h4_suavizado7.dat" u 1:($2-2*$3):($2+2*$3) w filledcurves lc 1 not,\
"data/RA_N10_h4_suavizado7.dat" u 1:($2-2*$3) w l lw 2 lc 2 t "\\tiny $N=1024$",\
"data/RA_N10_h4_suavizado7.dat" u 1:($2+2*$3) w l lw 2 lc 2 not,\
"data/RA_N10_h4_suavizado7.dat" u 1:($2-2*$3):($2+2*$3) w filledcurves lc 2 not,\
"data/RA_N12_h4_suavizado7.dat" u 1:($2-2*$3) w l lw 2 lc 3 t "\\tiny $N=4096$",\
"data/RA_N12_h4_suavizado7.dat" u 1:($2+2*$3) w l lw 2 lc 3 not,\
"data/RA_N12_h4_suavizado7.dat" u 1:($2-2*$3):($2+2*$3) w filledcurves lc 3 not

unset multiplot

pause -1