# Construit le PDF du rapport LaTex

LATEX_BUILDER=pdflatex
BUILD_FLAGS=-interaction nonstopmode

all: buildTitle build show

buildTitle : title.tex
	$(LATEX_BUILDER) $(BUILD_FLAGS) $< > /dev/null
	$(LATEX_BUILDER) $(BUILD_FLAGS) $< > /dev/null

build: rapport.tex
	$(LATEX_BUILDER) $(BUILD_FLAGS) $< > /dev/null
	$(LATEX_BUILDER) $(BUILD_FLAGS) $< > /dev/null

show: rapport.pdf
	if test "${DESKTOP_SESSION}" = "kde-plasma"; then \
		okular $< &> /dev/null & \
	else \
		evince $< &> /dev/null & \
	fi
