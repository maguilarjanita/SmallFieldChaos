reset
set terminal epslatex size 6,4 color colortext 12 standalone  
set output "fig10.tex"

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
set ylabel "$P^N(q;h)$" offset 0.2,0
set key top left
set yrange [0:]


#fits1:
r(x)=(a+b*x+c*x*x+d*x**5)/(1+x)
r1(x)=(a1+b1*x+c1*x*x+d1*x**5)/(1+x)
fit r(x) "Data/N5V4L9S.tot" u 1:(log($2)):($3/$2) via a,b,c,d
fit r1(x) "Data/N5V4L5S.tot" u 1:(log($2)):($3/2) via a1,b1,c1,d1


plot "Data/Pq_JK_h10h10_L5.dat" u 1:2:3 w yerror lw 10 t "$L=5, \\mathrm{4D}$",\
"Data/Pq_JK_h00h00_L5.dat" u 1:($2*exp(r1($1))) w l lw 4 t "$L=5,\\mathrm{T.}$",\
"Data/Pq_JK_h10h10_L9.dat" u 1:2:3 w yerror lw 10 t "$L=9, \\mathrm{4D}$",\
"Data/Pq_JK_h00h00_L9.dat" u 1:($2*exp(r($1))) w l lw 4 t "$L=9,\\mathrm{T.}$"




#Inset
set origin .20, .24
set size .37,.53
unset xlabel
unset ylabel
unset key
set key at -0.9,4.5
set key font ",14"
set key spacing 1.5 
set bmargin 0.5
set tmargin 0.5
set lmargin 0.1
set rmargin 0.5
set ytics offset 0.4,0
set xtics offset 0,0.3
set format y '\scriptsize %g'
set ytics (0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5)
set format x '\scriptsize %g'
set xtics (-1,-0.8,-0.6,-0.4,-0.2,0,0.2,0.4,0.6,0.8,1)
set yrange [0:5]


#fits2:
r(x)=(a+b*x+c*x*x+d*x**5)/(1+x)
r1(x)=(a1+b1*x+c1*x*x+d1*x**5)/(1+x)
fit r(x) "Data/N5V4L12S.tot" u 1:(log($2)):($3/$2) via a,b,c,d
fit r1(x) "Data/N5V4L8S.tot" u 1:(log($2)):($3/$2) via a1,b1,c1,d1

plot "Data/PdQ_N2e8.dat" u 1:3 w l lw 12 t "\\scriptsize$N=256,\\mathrm{B.} \\hphantom{6}$",\
"Data/PdQ_N2e8.dat" u 1:($2*exp(r1($1))) w l lw 4 t "\\scriptsize$N=256, \\mathrm{T.} \\hphantom{6}$",\
"Data/PdQ_N2e12.dat" u 1:3 w l lw 12 t "\\scriptsize $N=4096, \\mathrm{B.}$",\
"Data/PdQ_N2e12.dat" u 1:($2*exp(r($1))) w l lw 4 t "\\scriptsize$N=4096, \\mathrm{T.}$" 
unset multiplot