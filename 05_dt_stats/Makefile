all: out/graph_orig.jpg out/graph_moving_average.jpg
	feh $?

out:
	mkdir -p out

out/graph_orig.jpg: dt_stats_words.csv plot/_lin_trend.gpi plot/orig.gpi | out
	gnuplot plot/orig.gpi

out/graph_moving_average.jpg: dt_stats_words.csv plot/_lin_trend.gpi plot/moving_average.gpi src/utils.cl src/moving_average.cl | out
	paste -d, \
		<(cut dt_stats_words.csv -d',' -f1) \
		<(cut dt_stats_words.csv -d',' -f2 | sbcl --script src/moving_average.cl) \
		> out/moving_average.csv
	gnuplot plot/moving_average.gpi
