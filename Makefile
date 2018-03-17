# Makefile for UCASThesis
# $Id$

include config.mk

ifeq ($(MAKE),)
    override MAKE = make
endif

ifeq ($(TEXI2DVI),)
    override TEXI2DVI = texi2dvi
endif

PACKAGE=ucasthesis
SOURCES=$(PACKAGE).ins $(PACKAGE).dtx 
THESISCONTENTS=$(THESISMAIN).tex data/*.tex $(EPS) $(EPSGEN)
EPS=$(wildcard figures/*.eps)
EPSGEN=
# xelatex can directly use jpg file
ifneq ($(METHOD),xelatex)
EPSGEN+=$(addsuffix .eps,$(basename $(wildcard figures/*.jpg)))
endif
EPSGEN+=$(addsuffix .eps,$(basename $(wildcard figures/*.fig)))
BIBFILE=ref/*.bib
SPINECONTENTS=$(SPINEMAIN).tex
CLSFILES=dtx-style.sty $(PACKAGE).cls $(PACKAGE).cfg

.PHONY: all clean distclean dist thesis spine doc cls

all: doc thesis spine

###### generate cls/cfg
cls: $(CLSFILES)

$(CLSFILES): $(SOURCES)
	latex $(PACKAGE).ins

###### for doc

doc: $(PACKAGE).pdf


$(PACKAGE).pdf: $(CLSFILES)
	xelatex $(PACKAGE).dtx
	makeindex -s gind.ist -o $(PACKAGE).ind $(PACKAGE).idx
	makeindex -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo
	xelatex $(PACKAGE).dtx
	xelatex $(PACKAGE).dtx

###### for thesis

thesis: $(THESISMAIN).pdf

$(THESISMAIN).pdf: $(CLSFILES) $(THESISCONTENTS)
	xelatex $(THESISMAIN).tex
	biber $(THESISMAIN)
	xelatex $(THESISMAIN).tex
	xelatex $(THESISMAIN).tex

figures/%.eps: figures/%.jpg
	convert $^ -compress none eps2:$@
figures/%.eps: figures/%.fig
	fig2dev -L eps $^ $@

###### for spine
spine: $(SPINEMAIN).pdf

$(SPINEMAIN).pdf: $(CLSFILES) $(SPINECONTENTS)
	xelatex $(SPINEMAIN).tex

clean: 
	-@rm -f \
		*~ \
		*.aux \
		*.bak \
		*.bbl \
		*.blg \
		*.dvi \
		*.glo \
		*.gls \
		*.idx \
		*.ilg \
		*.ind \
		*.ist \
		*.log \
		*.out \
		*.ps \
		*.thm \
		*.toc \
		*.lof \
		*.lot \
		*.loe \
		*.bcf \
		*.xml \
		*.fls \
		*.fdb_latexmk \
		data/*.aux \
		$(EPSGEN) \
		dtx-style.sty
