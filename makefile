SRCS=$(wildcard *.cwb)
PDFS=$(SRCS:.cwb=.pdf)
racket="/Applications/Racket v6.8/bin/racket"

TEXINPUTS := ${TEXINPUTS}:tex/:
export TEXINPUTS

default: all

%.tex:	%.cwb ./chord-processor.rkt
	${racket} ./chord-processor.rkt $*.cwb

%.pdf:	%.tex tex/chords-full.cls tex/chords-condensed.cls tex/chords-common.cls
	latexmk -pdf $*.tex 
	latexmk -c $*.tex 

all:  $(PDFS)
