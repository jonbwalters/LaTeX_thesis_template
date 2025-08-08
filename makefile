document = thesis

bib = bib.bib
engine = pdflatex

sections = tex/*.tex

$(document).pdf : $(document).tex $(bib) $(figs) $(sections) $(data) LA_Tech.cls | build/tex build
	latexmk -$(engine) -halt-on-error -silent -file-line-error -output-directory=build -shell-escape ./$(document).tex \
	&& texlogfilter build/$(document).log \
	&& cp build/$(document).pdf $(document).pdf \
	|| texlogfilter --no-ref --no-box build/$(document).log

build : 
	mkdir build

build/tex : | build
	mkdir build/tex

.DEFAULT_GOAL := $(document).pdf

.PHONY : list clean cleanbib remake quick

quick:
	$(engine) -halt-on-error -file-line-error -interaction=batchmode -output-directory=build -shell-escape ./$(document).tex \
	&& texlogfilter --no-box build/$(document).log \
	&& cp build/$(document).pdf $(document).pdf \
	&& touch $(document).tex \
	|| texlogfilter --no-ref --no-box build/$(document).log

remake:
	make clean
	make
	
clean:
	rm -f ./build/tex/*
	rm -df $(document).pdf ./build/*

cleanbib:
	biber --cache | rm -rf

list :
	@echo $(VPATH)
	@echo $(sections)
	@echo $(build)
	@echo $(bib)
	@echo $(figs)
	@echo $(data)