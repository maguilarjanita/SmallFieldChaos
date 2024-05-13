set terminal epslatex size 7.2,5 color colortext 12 standalone
set output "fig13.tex"

set tmargin at screen 0.95
set bmargin at screen 0.12
set lmargin at screen 0.12
set rmargin at screen 0.95

set logscale x
set xrange [0.01:]
set yrange [0:1]

set ylabel '\Large Prob($R_{<,J^o}^N(-q_\mathrm{EA};h)<R$)'
set xlabel '\Large R'

set multiplot
set key at 0.97, 0.18

plot  "Data/h2th.dat" u ($2/$1):($0/2560)  w l dt 2 lw 4 lc 1 t '$h=2$(T.)',\
"Data/h2sim.dat" u ($2/$1):($0/2560) ls 5 lc 1 t '$h=2$\hphantom{(T.)}',\
"Data/h4th.dat" u ($2/$1):($0/2560)  w l dt 2 lw 4  lc 2 t '$h=4$(T.)',\
"Data/h4sim.dat" u ($2/$1):($0/2560) ls 5 lc 2 t '$h=4\hphantom{(T.)}$'

set key at 0.033,0.83

unset xtics
unset ytics
unset ylabel
unset xlabel
p "Data/h6th.dat" u ($2/$1):($0/2560)  w l dt 2 lw 4 lc 3 t '$h=6$(T.)\hphantom{0}',\
"Data/h6sim.dat" u ($2/$1):($0/2560) ls 5 lc 3 t '$h=6$\hphantom{(T.)}\hphantom{0}',\
"Data/h10th.dat" u ($2/$1):($0/2560)  w l dt 2 lw 4 lc 4 t '$h=10$(T.)',\
"Data/h10sim.dat" u ($2/$1):($0/2560) ls 5 lc 4 t '$h=10$\hphantom{(T.)}'
unset multiplot
