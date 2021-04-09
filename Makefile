THESIS1 = Assignment1
THESIS2 = Assignment2
# TEX, BIB, TEST dir
TEX_DIR = tex
BIB_DIR = bib

# Option for latexmk
LATEXMK_OPT_BASE = -xelatex -gg -silent
LATEXMK_OPT = $(LATEXMK_OPT_BASE) -f
LATEXMK_OPT_PVC = $(LATEXMK_OPT_BASE) -pvc

all: $(THESIS1).pdf $(THESIS2).pdf

.PHONY : all cleanall pvc view wordcount git zip
# *.bib elegantpaper.cls elegantpaper.cfg 

1 : $(THESIS1).pdf

2 : $(THESIS2).pdf

$(THESIS1).pdf : $(THESIS1).tex Makefile
	-pdflatex $(LATEXMK_OPT) $(THESIS1)

$(THESIS2).pdf : $(THESIS2).tex Makefile
	-pdflatex $(LATEXMK_OPT) $(THESIS2)

clean :
	-@latexmk -c -silent 2> /dev/null
	-@rm -f $(TEX_DIR)/*.aux 2> /dev/null || true

cleanall :
	-@latexmk -C -silent 2> /dev/null
	-@rm -f $(TEX_DIR)/*.aux 2> /dev/null || true

push :
	-git add .
	-git commit -am "make push"
	-git push