SHELL := /bin/sh

.PHONY: all
all: analiza.pdf
.INTERMEDIATE: analiza.dvi

%.dvi %.out.ps: %.tex
	latex -file-line-error -interaction batchmode $^
	@-$(RM) -f $*.log $*.aux $*.out $*.toc

%.ps: %.dvi %.out.ps
	dvips -o $@ $*.dvi

%.pdf: %.ps
	ps2pdf -dPDFSETTINGS=/printer -dEmbedAllFonts=true -dSubsetFonts=true -dMaxSubsetPct=100 $^ $@
