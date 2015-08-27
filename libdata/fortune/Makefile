
all: check-strfile \
    perlis-epigrams.dat dijkstra.dat programming.dat \
    security-maxims.dat math.dat misc.dat

check-strfile:
	@type strfile >/dev/null 2>&1 || \
	    { echo You need to: sudo apt-get install fortune-mod; exit 1; }

perlis-epigrams.dat: perlis-epigrams
	strfile perlis-epigrams

dijkstra.dat: dijkstra
	strfile dijkstra

programming.dat: programming
	strfile programming

security-maxims.dat: security-maxims
	strfile security-maxims

misc.dat: misc
	strfile misc
