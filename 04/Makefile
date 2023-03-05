all: 1 2 3 4

prep:
	mkdir -p out/

%: prep %.cl plot%.gpi
	sbcl --script $@.cl > out/$@
	gnuplot plot$@.gpi
	feh -F out/graph$@.jpg
