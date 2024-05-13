#!/bin/bash

#First, generate .tex's
gnuplot plot_fig10.gp

#Then, generate .pdf's
pdflatex fig10.tex

#Finally, erase non-essential files
#You can comment any of these lines with # to preserve a specific file
rm *.aux 2>/dev/null
rm *~ 2>/dev/null
rm *-inc.eps 2>/dev/null
rm *-inc-eps-converted-to.pdf 2>/dev/null
rm *.log 2>/dev/null
rm *.tex 2>/dev/null
