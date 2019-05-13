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
#' @param
#'   ... Arguments passed to \code{rmarkdown::\link{pdf_document}()}.
#' @return An R Markdown output format.
#' @examples \dontrun{
#' rmarkdown::draft("STAT50.Rmd", template = "exam_question", package = "nmbutemplates")
#' }
#' @rdname exam_question
#' @export
exam_question <- function(...) {
  pdf_document_format("exam_question", ...)
}