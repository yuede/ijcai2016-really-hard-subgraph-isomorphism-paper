# vim: set et ft=gnuplot sw=4 :

set terminal tikz color size 4in,2.8in font '\tiny'
set output "gen-graph-induced-2d-kappa.tex"

load "puor.pal"

unset xlabel
unset ylabel
set xrange [0:1]
set noxtics
set yrange [0:1]
set noytics
set size square
set cbtics out scale 0.5 nomirror offset -1

set multiplot layout 2,3 scale 1, 1

unset colorbox
set notitle

load "ylgnbu.pal"

set palette positive
set format cb '$10^{%.0f}$'
unset colorbox
set cbrange [2:8]

set label 1 at screen 0.01, graph 0.5 center 'Difficulty (Glasgow)' rotate by 90

set label 2 at graph 0.5, screen 1 center "$G(10,x){\\hookrightarrow}G(150,y)$"
plot "ps10-ts150.induced.average-nodes.plot" u ($2/100):($1/100):(log10($3+1)) matrix w image notitle

unset label 1

set cbtics 0.5
set label 2 at graph 0.5, screen 1 center "$G(20,x){\\hookrightarrow}G(150,y)$"
plot "ps20-ts150.induced.average-nodes.plot" u ($2/100):($1/100):(log10($3+1)) matrix w image notitle

set colorbox user origin screen 0.98, graph 0 size character 1, graph 1

set label 2 at graph 0.5, screen 1 center "$G(30,x){\\hookrightarrow}G(150,y)$"
set cbtics 2 add ('${\le}10^{2}$' 2) add ('${\ge}10^{8}$' 8)
plot "ps30-ts150.induced.average-nodes.plot" u ($2/100):($1/100):(log10($3+1)) matrix w image notitle

unset label 2

load "ylgnbuwl.pal"

set palette negative
unset format cb
unset colorbox
set cbrange [0:3]

set label 1 at screen 0.01, graph 0.5 center 'Constrainedness' rotate by 90

plot "ps10-ts150.induced.kappa.plot" u ($1/100):($2/100):3 matrix w image notitle

unset label 1

plot "ps20-ts150.induced.kappa.plot" u ($1/100):($2/100):3 matrix w image notitle

set colorbox user origin screen 0.98, graph 0 size character 1, graph 1

set cbtics 1 add ('$\ge4$' 4)
plot "ps30-ts150.induced.kappa.plot" u ($1/100):($2/100):3 matrix w image notitle

