#!/bin/bash

pdflatex -interaction nonstopmode rapport.tex
okular rapport.pdf &> /dev/null &
