## --- NOTE to contributors ------------------------------------------------------
## Please order these format functions alphabetically.
## -------------------------------------------------------------------------------

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
#' @importFrom rmarkdown pdf_document
#' @importFrom rmarkdown output_format knitr_options pandoc_options
#' @param show_answer Flag to show or hide answer
#' @param keep_tex Flag to keep or remove tex file
#' @param
#'   ... Arguments passed to \code{rmarkdown::\link{pdf_document}()}.
#' @return An R Markdown output format.
#' @examples \dontrun{
#' rmarkdown::draft("STAT50.Rmd", template = "exam_question", package = "nmbutemplates")
#' }
#' @rdname exam_question
#' @export

exam_question <- function(show_answer = NULL, keep_tex = TRUE, ...) {
  pkg_resource <- function(...) {
    system.file(..., package = "nmbutemplates")
  }
  exam_template <- pkg_resource("rmarkdown/templates/exam_question/resources/template.tex")
  base_format <- pdf_document(template = exam_template, keep_tex = keep_tex, ...)
  base_format$pandoc$to <- "latex"
  base_format$pandoc$ext <- ".tex"
  base_format$post_processor <- function(metadata, input, output, clean, verbose, ...) {
    if (!is.null(show_answer)) {
      metadata$show_answer <- show_answer
    }
    f <- xfun::with_ext(output, '.tex')
    x <- xfun::read_utf8(f)
    fenced_line <- which(grepl(":::", x))
    for (i in seq(1, length(fenced_line), 2)) {
      env_i <- gsub("[ :]*", "", x[fenced_line[i]])
      if (!metadata$show_answer) env_i <- "hidden"
      x[fenced_line[i]] <- gsub("( *?)::: (.+?)[ ]*$", 
                                paste0("\\1\\\\begin{", env_i,"}"), 
                                x[fenced_line[i]])
      x[fenced_line[i+1]] <- gsub("(.*?):::[ ]*$", 
                                  paste0("\\1\\\\end{", env_i, "}"), 
                                  x[fenced_line[i+1]])
    }
    xfun::write_utf8(x, f)
    tinytex::latexmk(f)
  }
  
  return(base_format)
}
