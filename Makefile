# Construit le PDF du rapport LaTex

PDF_VIEWER=evince
LATEX_BUILDER=pdflatex
BUILD_FLAGS=-interaction nonstopmode

all: buildTitle build show

buildTitle : title.tex
	$(LATEX_BUILDER) $(BUILD_FLAGS) $<

build: rapport.tex
	$(LATEX_BUILDER) $(BUILD_FLAGS) $<

show: rapport.pdf
	$(PDF_VIEWER) $< &> /dev/null &
