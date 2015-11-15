# vim: set et ft=gnuplot sw=4 :

set terminal tikz color size 3.3in,2.6in font '\scriptsize'
set output "gen-graph-phase-transition.tex"

load "moreland.pal"
set palette negative

set xrange [0:1]
set xlabel "Pattern density"
set ylabel "Search nodes"
set logscale y
set format y '$10^{%T}$'
set key above
set border 3
set grid
set xtics nomirror
set ytics nomirror

plot \
    "<sed -e '1~25!d' ps20-ts150.non-induced.slice.plot" u ($4==0?$1:NaN):($5) w p notitle lc '#b40426' pt 2 ps 0.7, \
    "<sed -e '1~25!d' ps20-ts150.non-induced.slice.plot" u ($4==1?$1:NaN):($5) w p notitle lc '#3b4cc0' pt 1 ps 0.7, \
    "ps20-ts150.non-induced.slice-averages.plot" u 1:3 w l ti 'Mean search' lc '#333333' lw 3, \
    "ps20-ts150.non-induced.slice-averages.plot" u 1:4 w l axes x1y2 ti 'Proportion SAT' lc '#ffb948' lw 3, \
    "" u (NaN):(NaN) w p pt 1 lc '#3b4cc0' ti "Satisfiable", \
    "" u (NaN):(NaN) w p pt 2 lc '#b40426' ti "Unsatisfiable"

