SRCDIR   := src
BUILDDIR := build

SRCEXT   := tex

TEXSRCS := $(shell find $(SRCDIR) -maxdepth 1 -type f -name \*.$(SRCEXT))
TEXBUILDDIRS = $(SRCDIR)/build
PDFDOCS = $(shell find $(TEXBUILDDIRS) -type f -name \*.pdf)
PDFDOCSDIR := pdf

RM = rm -rf

all: thesis presentation

thesis: $(SRCDIR)/thesis-jackson_cole.tex
	@echo "Compiling: $<"
	@latexmk -pdf -outdir=build -pdflatex="pdflatex" -cd $<
	@make movepdfs
	@$(RM) $(TEXBUILDDIRS)


presentation: $(SRCDIR)/thesis_presentation-jackson_cole.tex
	@echo "Compiling: $<"
	@latexmk -pdf -outdir=build -xelatex -cd $<
	@make movepdfs
	@$(RM) $(TEXBUILDDIRS)

movepdfs: $(PDFDOCS)
	@mkdir -p $(PDFDOCSDIR)
	@mv $< $(PDFDOCSDIR)
