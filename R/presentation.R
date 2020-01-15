##' Templates for RMarkdown-based Beamer PDF presentations supporting
##' the \sQuote{Metropolis} style by Matthias Vogelgesang and others,
##' the \sQuote{IQSS} style by Ista Zahn and Gary King,
##' and the \sQuote{NMBU} style by Rob J Hyndman.
##'
##' Note that not all options and customizations available at the LaTeX
##' level are implemented or supported yet.  A number of styling options
##' could be exposed by setting YAML meta-data in the header for either
##' style. This needs more testing and documentation.
##'
##' @title Binb is not Beamer - PDF Presentation Themes
##'
##' @param toc A logical variable defaulting to \code{FALSE}.
##' @param slide_level A numeric variable defaulting to two for
##' \sQuote{Metropolis} and \sQuote{NMBU}, and three for \sQuote{IQSS}.
##' @param incremental A logical variable defaulting to \code{FALSE}.
##' @param fig_width A numeric variable defaulting to ten.
##' @param fig_height A numeric variable defaulting to seven.
##' @param fig_crop A logical variable defaulting to \code{TRUE}.
##' @param fig_caption A logical variable defaulting to \code{TRUE}.
##' @param dev A character variable defaulting to \dQuote{pdf}.
##' @param df_print A character variable defaulting to \dQuote{default}.
##' @param fonttheme A character variable defaulting to \dQuote{default}.
##' @param colortheme For the \sQuote{NMBU} theme only. A character variable defaulting to \dQuote{NMBU}.
##' @param highlight A character variable defaulting to \dQuote{tango}.
##' @param keep_tex A logical variable defaulting to \code{FALSE}.
##' @param latex_engine A character variable defaulting to \dQuote{xelatex}.
##' @param citation_package An optional character variable with possible value
##' \dQuote{none}, \dQuote{natbib} (the default), or \dQuote{biblatex}.
##' @param includes An optional character variable defaulting to \code{NULL}.
##' @param md_extensions An optional character variable defaulting to \code{NULL}.
##' @param pandoc_args An optional character variable defaulting to \code{NULL}.
##'
##' @section IQSS Details: We currently set \code{slide_level} to three to use
##' the same appearance as the LaTeX demo. This means section and sub-section headers
##' use one and two hash marks, new slides use three, and \dQuote{box} environments
##' start with four. More commonly, Beamer theme use two and work without subsections.
##'
##' @return RMarkdown content processed is returned for use by the
##' \code{\link[rmarkdown]{render}} function but the function is invoked
##' for it side effect of creating the pdf file.
##'
##' @author Raju Rimal
##'
##' @examples
##' \dontrun{
##' library(rmarkdown)
##' draft("myslides.Rmd", template="nmbu_eng", package="nmbutemplates", edit=FALSE)
##' setwd("myslides")       ## template creates a new subdir
##' render("myslides.Rmd")
##' }
#' @rdname presentation
#' @export

nmbu_eng <- function(toc = FALSE,
                   slide_level = 2,
                   incremental = FALSE,
                   fig_width = 8,
                   fig_height = 5,
                   fig_crop = TRUE,
                   fig_caption = TRUE,
                   dev = 'pdf',
                   df_print = "default",
                   fonttheme = "default",
                   colortheme = "nmbu",
                   highlight = "tango",
                   keep_tex = FALSE,
                   latex_engine = "pdflatex",
                   citation_package = c("none", "natbib", "biblatex"),
                   includes = NULL,
                   md_extensions = NULL,
                   pandoc_args = NULL) {
  
  fcolortheme <- paste0("beamercolortheme", colortheme, ".sty")
  for (f in c("beamerfontthemeNMBU.sty", fcolortheme,
              "beamerthemeNMBU.sty", "titlepage.png", "figs/"))
    if (!file.exists(f))
      file.copy(system.file("rmarkdown", "templates", "presentation", "skeleton",
                            f, package="nmbutemplates"),
                ".", recursive=TRUE)
  
  template <- system.file("rmarkdown", "templates", "presentation",
                          "resources", "template.tex",
                          package="nmbutemplates")
  
  rmarkdown::beamer_presentation(template = template,
                                 toc = toc,
                                 slide_level = slide_level,
                                 incremental = incremental,
                                 fig_width = fig_width,
                                 fig_height = fig_height,
                                 fig_crop = fig_crop,
                                 fig_caption = fig_caption,
                                 dev = dev,
                                 df_print = df_print,
                                 theme = "NMBU",
                                 colortheme = colortheme,
                                 fonttheme = fonttheme,
                                 highlight = highlight,
                                 keep_tex = keep_tex,
                                 latex_engine = latex_engine,
                                 citation_package = citation_package,
                                 includes = includes,
                                 md_extensions = md_extensions,
                                 pandoc_args = pandoc_args)
  
}
