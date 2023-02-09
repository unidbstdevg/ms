_:
	@echo "Usage: make {1|2}"

1:
	(python 1.py | column -t) && gnuplot plot1.gp && feh -F out/graph1.jpg

2:
	(python 2.py | column -t) && gnuplot plot2.gp && feh -F out/graph2.jpg
