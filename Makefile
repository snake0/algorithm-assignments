i=5
THESIS$i = Assignment$i

# TEX, BIB, TEST dir
TEX_DIR = tex
BIB_DIR = bib

# Option for latexmk
LATEXMK_OPT_BASE = -xelatex -gg -silent
LATEXMK_OPT = $(LATEXMK_OPT_BASE) -f
LATEXMK_OPT_PVC = $(LATEXMK_OPT_BASE) -pvc

all: $(THESIS$i).pdf

.PHONY : all cleanall pvc view wordcount git zip
# *.bib elegantpaper.cls elegantpaper.cfg 

$i : $(THESIS$i).pdf

$(THESIS$i).pdf : $(THESIS$i).tex Makefile
	-pdflatex $(LATEXMK_OPT) $(THESIS$i)

clean :
	-@latexmk -c -silent 2> /dev/null
	-@rm -f $(TEX_DIR)/*.aux 2> /dev/null || true

cleanall :
	-@latexmk -C -silent 2> /dev/null
	-@rm -f $(TEX_DIR)/*.aux 2> /dev/null || true

push :
	-@git add .
	-@git commit -am "make push"
	-@git push
