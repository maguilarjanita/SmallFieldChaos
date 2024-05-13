set terminal epslatex size 4.3, 7 color colortext 14 standalone  
set output "fig12.tex"
TOP=0.965
RIGHT=0.98
LEFT=0.20
BOTTOM=0.07
VMID= (TOP + BOTTOM)/2

set multiplot layout 2,1

############# Primer Plot ##################

unset xlabel
set ylabel "$ R^N_C(|q_{\\mathrm{EA}}|;h)$" offset 0.9,0

set x2tics offset 0,-0.3
set format x ""


set xrange [0:10.1]
set x2range [0:10.1]
set yrange [0.01:1]



set tmargin at screen TOP
set bmargin at screen VMID
set lmargin at screen LEFT
set rmargin at screen RIGHT



set key b l 
set key spacing 1.5
#####################CHAOS###################################
plot 'data/atQea8_1.dat' u 1:2:3 w e ls 1 t "$N=256\\hphantom{1}$", \
"data/N5V4L8C.tot" u 1:2 w l ls 1 t '',\
'data/atQea10_1.dat'  u 1:2:3 w e ls 2 t '$N=1024$', \
"data/N5V4L10C.tot" u 1:2 w l ls 2 t '',\
'data/atQea12_1.dat'  u 1:2:3 w e ls 3 t '$N=4096$', \
"data/N5V4L12C.tot" u 1:2 w l ls 3 t '',\
"data/N5V4L5C.tot" u 1:2 w l ls 4 t "",\
"data/Rqea_chaos_L5.dat" u 1:2:3 w yerror ls 4 t "$L=5$",\
"data/N5V4L9C.tot" u 1:2 w l ls 7 t "",\
"data/Rqea_chaos_L9.dat" u 1:2:3 w yerror ls 7 t "$L=9$"

############# Segundo Plot ##################

set xlabel "$h$" offset 0,0.5

unset x2tics
set format x "%.0f"
set format y '$10^{%T}$'
set log y

set tmargin at screen VMID
set bmargin at screen BOTTOM
set lmargin at screen LEFT
set rmargin at screen RIGHT

set xlabel font ",16"
set ylabel font ",16"
set xlabel "$h$" offset 0,0.5
set ylabel "$R^N(-q_{\\mathrm{EA}};h)$" offset 0.9,0
#set title "$h=10$" offset 0,-0.9
set key spacing 1.5
set log y
set yrange [.000001:1.6]
set xrange [0:10.1]

plot 'data/atQea8_2.dat'u 1:2:3 w e ls 1 t "$N=256\\hphantom{1}$", \
"data/N5V4L8S_sel.tot" u 1:2 w l ls 1 t '',\
'data/atQea10_2.dat' u 1:2:3 w e ls 2 t '$N=1024$',\
"data/N5V4L10S_sel.tot" u 1:2 w l ls 2 t '',\
'data/atQea12_2.dat' u 1:2:3 w e ls 3 t '$N=4096$',\
"data/N5V4L12S_sel.tot" u 1:2 w l ls 3 t '',\
"data/N5V4L5S_sel.tot" u 1:2 w l ls 4 t "",\
"data/Rmqea_nochaos_all_L5.dat" u 1:2:3 w yerror ls 4 t "$L=5$",\
"data/N5V4L9S_sel.tot" u 1:2 w l ls 7 t "",\
"data/Rmqea_nochaos_all_L9.dat" u 1:2:3 w yerror ls 7 t "$L=9$" 


