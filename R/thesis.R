#' @title Thesis for Masters and PhD Thesis
#' @section \code{thesis}: Format for creating masters and phd thesis
#' @importFrom rmarkdown output_format knitr_options pandoc_options
#' @importFrom bookdown pdf_book
#' @param
#'   ... Arguments passed to \code{rmarkdown::\link{pdf_document}()}.
#' @return An R Markdown output format.
#' @examples \dontrun{
#' rmarkdown::draft("index.Rmd", template = "thesis", package = "nmbutemplates")
#' }
#' @rdname thesis
#' @export

thesis <- function(...) {
  template <- find_resource("thesis")
  base <- bookdown::pdf_book(template = template, ...)
  return(base)
}
