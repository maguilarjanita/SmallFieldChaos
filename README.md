# Figures of "Small field chaos in spin glasses: universal predictions from the ultrametric tree and comparison with numerical simulations"

The scripts and the data needed to reproduce the figures on the article "Small field chaos in spin glasses: universal predictions from the ultrametric tree and comparison with numerical simulations" (https://arxiv.org/abs/2403.08503) are provided.

Each directory corresponds to one figure. Inside each directory you can find:

1. A gnuplot (.gp) script of the figure.
2. A directory "Data" with all the needed data for the figure.
3. A .pdf with the produced figure.

For running the scripts you need the Version 5.2 of Gnuplot and the pdflatex compiler. Inside the directory of any figure you can simply do

sh genera_fig1.sh

The corresponding fig1.pdf will be produced in that directory.