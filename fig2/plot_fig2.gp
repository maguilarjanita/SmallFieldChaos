reset
set terminal epslatex size 6,4 color colortext 12 standalone  
set output "fig2.tex"

TOP=0.98
RIGHT=0.98
LEFT=0.08
BOTTOM=0.12

set tmargin at screen TOP
set bmargin at screen BOTTOM
set lmargin at screen LEFT
set rmargin at screen RIGHT

#fits1:
r(x)=(a+b*x+c*x*x+d*x**5)/(1+x)
fit r(x) "<grep 'F 4' Data/N5V4L12S.tot" u 10:(log($15)):($16/$15) via a,b,c,d


#fits2:
g(x)=a2+b2*x+c2*x**2
fit g(x) "<grep 'F 4' Data/N5V4L12C.tot" u ($10**2):15:16 via a2,b2,c2

set xlabel font ",16"
set ylabel font ",16"
set xlabel "$q$" offset 0,0.5
set ylabel "" offset 0.2,0
set key top left
set key spacing 1.5
set yrange [0:]

plot "Data/PdQ_N2e12_h00.dat" u 1:2 w l lw 6 lc  rgb '#737373'  dashtype 0  t "$P^N(q)$",\
"Data/PdQ_N2e12_hh.dat" u 1:2 w l lw 18 lc 1 t "$P^N(q;h)$",\
"Data/PdQ_N2e12_h00.dat" u 1:($2*exp(r($1))) w l lw 6 lc 2 t "$P^N(q;h), \\mathrm{T.}$" ,\
"Data/PdQ_N2e12_h0.dat" u 1:2 w l lw 18 lc 3 t "$P_C^N(q;h)$",\
"Data/PdQ_N2e12_h00.dat" u 1:($2*g($1**2))  w l lw 6 lc 4 t "$P_C^N(q;h), \\mathrm{T.}$"
