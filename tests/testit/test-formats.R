test_format <- function(name, os_skip = NULL) {

  # don't run on CRAN due to complicated dependencies (Pandoc/LaTeX packages)
  if (!identical(Sys.getenv("NOT_CRAN"), "true")) return()
  # skip on OS if requested
  if (!is.null(os_skip)) return()

  # work in a temp directory
  dir <- tempfile()
  dir.create(dir)
  oldwd <- setwd(dir)
  on.exit(setwd(oldwd), add = TRUE)

  # create a draft of the format
  testdoc <- paste0(name, ".Rmd")
  if (name %in% c("thesis")) testdoc <- "index.Rmd"
  nmbutemplates::create(testdoc, name, create_dir = FALSE)

  message('Rendering the ', name, ' format...')
  output_file <- rmarkdown::render(testdoc, quiet = TRUE)
  assert(paste(name, "format works"), {
    file.exists(output_file)
  })
}

test_format("exam_question")
test_format("thesis")
