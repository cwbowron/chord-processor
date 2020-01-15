SRCS=$(wildcard *.cwb)
PDFS=$(SRCS:.cwb=.pdf)
RACKET=$(shell brew --prefix racket)/bin/racket
export TEXINPUTS := ${TEXINPUTS}:tex/:

default: all

%.tex: %.cwb ./chord-processor.rkt
	${RACKET} ./chord-processor.rkt $*.cwb

%.pdf: %.tex tex/chords-full.cls tex/chords-condensed.cls tex/chords-common.cls
	latexmk -pdf $*.tex 
	latexmk -c $*.tex 

all:  $(PDFS)
