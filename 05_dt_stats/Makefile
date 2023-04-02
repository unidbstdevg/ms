all: out/graph_orig.jpg
	feh $?

out:
	mkdir -p out

out/graph_orig.jpg: dt_stats_words.csv plot/_lin_trend.gpi plot/orig.gpi | out
	gnuplot plot/orig.gpi
