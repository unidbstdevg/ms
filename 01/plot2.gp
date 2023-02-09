# vim: ft=gnuplot commentstring=#\ %s
set terminal jpeg size 800,600 linewidth 3
set output 'out/graph2.jpg'

# set yrange [0:1]
set xtics (10, 100, 500, 1000, 2000, 3000, 4000, 5000)

plot "out/diff_5" with lines
