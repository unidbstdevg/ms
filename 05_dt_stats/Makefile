all: out/graph_orig.jpg out/graph_moving_average.jpg out/graph_improved_moving_average.jpg out/graph_exp_smooth.jpg
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

out/graph_improved_moving_average.jpg: dt_stats_words.csv plot/_lin_trend.gpi plot/improved_moving_average.gpi src/utils.cl src/improved_moving_average.cl | out
	paste -d, \
		<(cut dt_stats_words.csv -d',' -f1) \
		<(cut dt_stats_words.csv -d',' -f2 | sbcl --script src/improved_moving_average.cl) \
		> out/improved_moving_average.csv
	gnuplot plot/improved_moving_average.gpi


out/graph_exp_smooth.jpg: dt_stats_words.csv plot/_lin_trend.gpi plot/exp_smooth.gpi src/utils.cl src/exp_smooth.cl | out
	paste -d, \
		<(cut dt_stats_words.csv -d',' -f1) \
		<(cut dt_stats_words.csv -d',' -f2 | sbcl --script src/exp_smooth.cl) \
		> out/exp_smooth.csv
	gnuplot plot/exp_smooth.gpi
