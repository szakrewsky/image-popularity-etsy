BIBTEX=bibtex
LATEX=latex
DVIPS=dvips -P pdf -G0 -f 
DVIPDF=dvipdf
INDEX=makeindex
PDFLATEX=pdflatex


DOC=icpr2016-etsy
TEXFILES=$(DOC).tex
FIGS=./figures/*
IMGS=./figures/*.eps
OTHER= *.sty	*.bib	*.cls *.bst 

BIB_FILE=./ref.bib
DIST_FILES=Makefile $(TEXFILES) $(FIGS) $(IMGS) $(OTHER) 
TAR_FILE=$(DOC).tar.gz 
TAR_BASE=$(DOC)



###############################################################
# some implicit rules

# %.pdf : %.dvi
#    $(DVIPDF) $< $@
#
# %.dvi : $(TEXFILES) $(BIB_FILE)
#    $(LATEX) $<
#    $(LATEX) $<
#    $(BIBTEX) $*
#    $(LATEX) $<
#    $(LATEX) $<

###############################################################

all: pdf 	

# convert the ps to a pdf   
pdf: 	$(DOC).tex
	$(PDFLATEX) $(DOC).tex
	$(BIBTEX) $(DOC)
	$(PDFLATEX) $(DOC).tex
	$(PDFLATEX) $(DOC).tex

clean: 
		rm -f $(DOC).dvi $(DOC).log $(DOC).aux $(DOC).bbl $(DOC).blg $(DOC).pdf $(DOC).ps *~


dist:  
		rm -f $(TAR_FILE)
		tar -zcf $(TAR_FILE) $(DIST_FILES)

tarfile:  
		rm -f $(TAR_FILE).tar
		tar -zcf $(TAR_FILE) $(DIST_FILES)

