SHELL := /bin/sh

.PHONY: all
all: analiza.pdf mostly-clean

analiza.pdf: obrot_bryly.pdf_tex

analiza.pdf: %.pdf: %.tex
# run twice for hyperref
	pdflatex -interaction batchmode $<
	pdflatex -interaction batchmode $<

%.pdf %.pdf_tex: %.svg
	inkscape -D -z --file=$*.svg --export-pdf=$*.pdf --export-latex
	sed -i '/makebox/d; /page=2/d' $*.pdf_tex

.PHONY: mostly-clean
mostly-clean:
	@-$(RM) -f *.log
	@-$(RM) -f *.aux
	@-$(RM) -f *.out
	@-$(RM) -f *.toc

.PHONY: clean
clean: mostly-clean
	@-$(RM) -f *.pdf
