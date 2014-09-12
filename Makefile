main.pdf:

LATEX = pdflatex -interaction=nonstopmode
BIBTEX = bibtex -min-crossrefs=1000
RERUN = ! egrep -q '(^LaTeX Warning:|\(natbib\)).* Rerun'
UNDEFINED = ! egrep -q '^(LaTeX|Package natbib) Warning:.* undefined'

FIGPNG = $(wildcard *.png */*.png)
FIGSVG = $(wildcard *.svg */*.svg)
FIGGENPDF = $(patsubst %.svg,%.pdf,$(FIGSVG))

include */Makefrag

main.pdf: *.tex */*.tex *.sty *.bib $(FIGPNG) $(FIGGENPDF)
	$(LATEX)  main.tex || (rm -f main.pdf && false)
	$(BIBTEX) main.aux || (rm -f main.pdf && false)
	$(LATEX)  main.tex || (rm -f main.pdf && false)
	$(LATEX)  main.tex || (rm -f main.pdf && false)
	$(LATEX)  main.tex || (rm -f main.pdf && false)
	$(RERUN) main.log
	$(UNDEFINED) main.log

%.pdf: %.svg
	inkscape -T -z -A $@ $<

IGNORE = \
	 *.aux \
	 */*.aux \
	 main.aux \
	 main.bbl \
	 main.blg \
	 main.brf \
	 main.lof \
	 main.log \
	 main.lot \
	 main.pdf \
	 main.out \
	 main.toc \
	 $(FIGGENPDF)

.PHONY: clean
clean:
	rm -f $(IGNORE)

.PHONY: .gitignore
.gitignore:
	echo .gitignore $(IGNORE) | sed 's/ /\n/g' > .gitignore

# The following target is useful for debugging Makefiles; it
# prints the value of a make variable.
print-%:
	@echo $* = $($*)
