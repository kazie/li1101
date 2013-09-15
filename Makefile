LATEX=xelatex
BIBTEX=bibtex
FILENAME=Information

.PHONY: default pdf draft distclean clean

default: pdf

pdf: forced

Information.pdf: Information.tex Information.bib
	$(LATEX) Information
	$(BIBTEX) Information
	$(LATEX) Information

forced: 
	$(LATEX) Information
	$(BIBTEX) Information
	$(LATEX) Information


draft: pdf
	cp Information.pdf Information-`git reflog | head -1 | cut -d " " -f1`.pdf

distclean: clean
	rm -f Information.pdf Information-*.pdf

clean:
	rm -f *.aux *.bbl *-blx.bib *.blg *.lof *.log *.lot *.out *.toc
