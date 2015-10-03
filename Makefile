# Construit le PDF du rapport LaTex

PDF_VIEWER=evince
LATEX_BUILDER=pdflatex
BUILD_FLAGS=-interaction nonstopmode

all: build show

build: rapport.tex
	$(LATEX_BUILDER) $(BUILD_FLAGS) $<

show: rapport.pdf
	$(PDF_VIEWER) $< &> /dev/null &
