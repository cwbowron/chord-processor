SRCS=$(wildcard *.tex)
PDFS=$(SRCS:.tex=.pdf)

default: all

%.pdf:	%.tex chords-full.cls chords-condensed.cls chords-common.cls
	latexmk -pdf $*.tex 
	latexmk -c $*.tex 

all:  $(PDFS)
