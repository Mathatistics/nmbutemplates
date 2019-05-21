DIR="docs"

all: gitbook pdf

pdf:
	Rscript -e 'bookdown::render_book(".", "bookdown::pdf_book", quiet=TRUE)'

# gitbook:
# 	Rscript -e 'bookdown::render_book(".", "bookdown::gitbook", quiet=TRUE)'
# 
# epub:
# 	Rscript -e 'bookdown::render_book(".", "bookdown::epub_book", quiet=TRUE)'
# 
clean:
  rm -f Thesis*.* && rm -rf _bookdown_files

cleanall:
	make clean && rm -rf $(DIR)

