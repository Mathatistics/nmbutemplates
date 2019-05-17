#--- NOTE to contributors ------------------------------------------------------
# Please order these format functions alphabetically.
#-------------------------------------------------------------------------------

#' R Markdown output formats NMBU
#'
#' Most article formats are based on \code{rmarkdown::pdf_document()}, with a
#' custom Pandoc LaTeX template and different default values for other arguments
#' (e.g., \code{keep_tex = TRUE}).
#'
#' @section Details: You can find more details about each output format below.
#' @name nmbutemplates
#' @rdname nmbutemplates
NULL

#' @title Exam Question Template
#' @section \code{exam_question}: Format for creating Exam Questions adapted from older exam formats.
#' @importFrom rmarkdown output_format knitr_options pandoc_options
#' @param show_answer Flag to show or hide answer
#' @param
#'   ... Arguments passed to \code{rmarkdown::\link{pdf_document}()}.
#' @return An R Markdown output format.
#' @examples \dontrun{
#' rmarkdown::draft("STAT50.Rmd", template = "exam_question", package = "nmbutemplates")
#' }
#' @rdname exam_question
#' @export

exam_question <- function(..., show_answer = FALSE) {
  
  template <- find_resource("exam_question")
  base <- rmarkdown::pdf_document(template = template, ...)
  
  base$pandoc$to <- "latex"
  base$pandoc$ext <- ".tex"
  
  ## Take the answers and wrap around with answer environment
  ## This function can also handle other environemnt
  ## Would be nice to incorporate HTML output as well
  pre <- base$pre_processor
  base$pre_processor <- function(metadata, input_file, runtime, ...) {
    con <- file(input_file); on.exit(close.connection(con))
    x <- xfun::read_utf8(input_file, con)
    x <- parse_custom_block(x, show_answer)
    xfun::write_utf8(x, con)
  }
  
  ## The manually preprocessed text need to be proparly parsed before 
  ## submitting to LaTeX.
  post <- base$post_processor
  base$post_processor <- function(metadata, input, output, clean, verbose) {
    if (is.function(post)) output = post(metadata, input, output, clean, verbose)
    f <- xfun::with_ext(output, '.tex')
    x <- xfun::read_utf8(f)
    x <- gsub('\\\\textbackslash ', '\\\\', x)
    x <- gsub('\\\\\\{', '{', x)
    x <- gsub('\\\\\\}', '}', x)
    xfun::write_utf8(x, f)
    tinytex::latexmk(
      f, base$pandoc$latex_engine,
      if ('--biblatex' %in% base$pandoc$args) 'biber' else 'bibtex'
    )
  }
  
  return(base)
}
