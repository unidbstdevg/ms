# vim: ft=gnuplot commentstring=#\ %s
set terminal jpeg size 800,600 linewidth 3
set output 'out/graph1.jpg'

set style line 1 lc rgb 'green' pt 7
set style line 2 lc rgb 'red' pt 7

plot "out/goods" with p ls 1, \
     "out/bads" with p ls 2
