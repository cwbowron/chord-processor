SRCS=$(wildcard *.cwb)
PDFS=$(SRCS:.cwb=.pdf)
racket="/Applications/Racket v6.8/bin/racket"

TEXINPUTS := ${TEXINPUTS}:cls/:
export TEXINPUTS

default: all

%.tex:	%.cwb ./chord-processor.rkt
	${racket} ./chord-processor.rkt $*.cwb

%.pdf:	%.tex cls/chords-full.cls cls/chords-condensed.cls cls/chords-common.cls
	latexmk -pdf $*.tex 
	latexmk -c $*.tex 

all:  $(PDFS)
