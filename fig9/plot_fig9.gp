reset
set terminal epslatex size 6,4 color colortext 12 standalone  
set output "fig9.tex"
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
set ylabel "$P_C^N(|q|;h)$" offset 0.2,0
set key top left
set yrange [0:]
set xrange [0:]

#fit 4d:
f(x)=a+b*x+c*x**2
fit f(x) "Data/N5V4L9C.tot" u ($1**2):2:3 via a,b,c
f1(x)=a1+b1*x+c1*x**2
fit f1(x) "Data/N5V4L5C.tot" u ($1**2):2:3 via a1,b1,c1


plot "Data/Pq_JK_h00h10_L5.dat" u 1:2:3 w yerror lw 10 t "$L=5, \\mathrm{4D}$",\
"Data/Pq_JK_h00h00_L5.dat" u 1:($2*f1($1**2)) w l lw 4 t "$L=5,\\mathrm{T.}$",\
"Data/Pq_JK_h00h10_L9.dat" u 1:2:3 w yerror lw 10 t "$L=9, \\mathrm{4D}$",\
"Data/Pq_JK_h00h00_L9.dat" u 1:($2*f($1**2)) w l lw 4 t "$L=9,\\mathrm{T.}$"


#Inset
set origin .66, .52
set size .30,.45
unset xlabel
unset ylabel
unset key
set key at -0.03,1.7
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
set yrange [0:1.85]

g(x)=a+b*x+c*x**2
fit g(x) "Data/N5V4L12C.tot" u ($1**2):2:3 via a,b,c
g1(x)=a1+b1*x+c1*x**2
fit g1(x) "Data/N5V4L8C.tot" u ($1**2):2:3 via a1,b1,c1



plot "Data/PdQ_N2e8.dat" u 1:3  w l lw 12 t "\\scriptsize $N=256,\\mathrm{B.}$",\
"Data/PdQ_N2e8.dat" u 1:($2*g1($1**2)) w l lw 4 t "\\scriptsize $N=256, \\mathrm{T.} $",\
"Data/PdQ_N2e12.dat" u 1:3 w l lw 12 t "\\scriptsize $N=4096, \\mathrm{B.}$",\
"Data/PdQ_N2e12.dat" u 1:($2*g($1**2))  w l lw 4 t "\\scriptsize $N=4096, \\mathrm{T.}$" 
unset multiplot 

