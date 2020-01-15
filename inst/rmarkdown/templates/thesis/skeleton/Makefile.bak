DIR="docs"

all: gitbook pdf epub

gitbook:
	Rscript -e 'bookdown::render_book(".", "bookdown::gitbook", quiet=TRUE)'

pdf:
	Rscript -e 'bookdown::render_book(".", "bookdown::pdf_book", quiet=TRUE)'

epub:
	Rscript -e 'bookdown::render_book(".", "bookdown::epub_book", quiet=TRUE)'

clean:
	rm -f Thesis*.* && rm -rf _bookdown_files

cleanall:
	make clean && rm -rf $(DIR)

