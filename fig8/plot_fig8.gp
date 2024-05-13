reset
set terminal epslatex size 6,4 color colortext 12 standalone  
set output "fig8.tex"

TOP=0.98
RIGHT=0.98
LEFT=0.12
BOTTOM=0.12

set tmargin at screen TOP
set bmargin at screen BOTTOM
set lmargin at screen LEFT
set rmargin at screen RIGHT

#fits1:
r(x)=(a+b*x+c*x*x+d*x**5)/(1+x)
fit r(x) "Data/N5V4L12S.tot" u 1:(log($2)):($3/$2) via a,b,c,d

set xlabel font ",16"
set ylabel font ",16"
set xlabel "$q$" offset 0,0.5
set ylabel "$R^N(q;h)$" offset 0.2,0
set key top left
set key spacing 1.5
set xrange [-0.8:0.8]

plot "Data/N5V4L12S.tot" u 1:2:3 w yerror lw 5 t "$R^N(q;h)$", exp(r(x)) t "$\\mathrm{exp}(r(q))$" lw 4