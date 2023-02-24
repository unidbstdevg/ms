# vim: ft=gnuplot commentstring=#\ %s
set terminal jpeg size 800,600 linewidth 3
set output 'out/graph1.jpg'

set ytics
set ylabel "gauss"

set y2tics
set y2label "integral"


plot "out/gauss" with lines axes x1y1, \
     "out/integral" with lines axes x1y2
