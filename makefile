document = thesis

bib = bib.bib
engine = pdflatex

sections = tex/*.tex

$(document).pdf : $(document).tex $(bib) $(figs) $(sections) $(data) LA_Tech.cls | build build/tex
	latexmk -f -g -$(engine) -halt-on-error -silent -file-line-error -output-directory=build -shell-escape ./$(document).tex && cp build/$(document).pdf $(document).pdf

build : 
	mkdir build

build/tex : build
	mkdir build/tex

.DEFAULT_GOAL := $(document).pdf

.PHONY : list clean cleanbib remake

remake:
	make clean
	make
	
clean:
	rm -f $(document).pdf $(build)/*

cleanbib:
	biber --cache | rm -rf

list :
	@echo $(VPATH)	
	@echo $(build)
	@echo $(bib)
	@echo $(figs)
	@echo $(data)