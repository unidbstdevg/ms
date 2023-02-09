# vim: ft=gnuplot commentstring=#\ %s
set terminal jpeg size 800,600 linewidth 3
set output 'out/graph1.jpg'

# set yrange [0:1]
set xtics (10, 100, 500, 1000, 2000, 3000, 4000, 5000)

plot "out/1" with lines, \
     "out/2" with lines, \
     "out/3" with lines, \
     "out/4" with lines, \
     "out/5" with lines, \
     "out/6" with lines
