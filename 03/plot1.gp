# vim: ft=gnuplot commentstring=#\ %s
set terminal jpeg size 800,600 linewidth 3
set output 'out/graph1.jpg'

plot "out/gauss" with lines, \
     "out/integral" with lines
