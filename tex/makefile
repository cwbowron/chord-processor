SRCS=$(wildcard *.tex)
PDFS=$(SRCS:.tex=.pdf)

default: all

%.pdf:	%.tex chords-full.cls chords-condensed.cls chords-common.cls
	latexmk -pdf $*.tex 
	latexmk -c $*.tex 

%.png:	%.pdf
	convert -density 600 -antialias -alpha remove -background white $*.pdf $*.png
	# cp $**.png "/Users/cwbowron/Amazon Drive/Documents/uke/"

all:  $(PDFS)
