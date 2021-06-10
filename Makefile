pdf:
	Rscript --quiet rscripts/_render.R "bookdown::pdf_book"

gitbook:
	Rscript --quiet rscripts/_render.R "bookdown::gitbook"

all:
	Rscript --quiet rscripts/_render.R
