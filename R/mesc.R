#' @title Draft different templates using this function
#' @importFrom rmarkdown draft
#' @param filename A character string specifying the filenames you like to create
#' @param template The template to use. If it is thesis, the filename will be used as index.Rmd
#' @param create_dir A logical value specifying where to create directory or not
#' @return An R Markdown output format.
#' @examples \dontrun{
#' nmbutemplates::create("thesis")
#' }
#' @rdname create
#' @export

create <- function(filename, template, create_dir = TRUE) {
  rmarkdown::draft(file = filename, template = template, 
                   package = "nmbutemplates", create_dir = create_dir, 
                   edit = FALSE)
  if (template %in% c("thesis")) {
    ext <- tools::file_ext(filename)
    file.rename(filename, paste0("index.", ext))
  }
}