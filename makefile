SRCDIR   := src
BUILDDIR := build

SRCEXT   := tex

TEXSRCS := $(shell find $(SRCDIR) -maxdepth 1 -type f -name \*.$(SRCEXT))
TEXBUILDDIRS = $(SRCDIR)/build
PDFDOCS = $(shell find $(TEXBUILDDIRS) -type f -name \*.pdf)
PDFDOCSDIR := pdf

RM = rm -rf


docs: $(TEXSRCS)
	@echo "Compiling: $(TEXSRCS)"
	@latexmk -pdf -outdir=build -xelatex -cd $(TEXSRCS)
	@make movepdfs
	@$(RM) $(TEXBUILDDIRS)

movepdfs: $(PDFDOCS)
	@mkdir -p $(PDFDOCSDIR)
	@mv $< $(PDFDOCSDIR)
