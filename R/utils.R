find_resource <- function(template, file = 'template.tex') {
  res <- system.file(
    "rmarkdown", "templates", template, "resources", file, package = "nmbutemplates"
  )
  if (res == "") stop(
    "Couldn't find template file ", template, "/resources/", file, call. = FALSE
  )
  res
}

parse_custom_block <- function(text_input, show = TRUE) {
  x <- text_input
  env_idx <- grep(":::", x)
  if (length(env_idx) %% 2) stop("Non closing custom block exists")
  env_pair <- lapply(seq(1, length(env_idx), 2), function(y){
    c(env_idx[y], env_idx[y+1])
  })
  if (show) {
    env_names <- trimws(gsub("::: (.+)", "\\1", x[sapply(env_pair, "[[", 1)]))
    for (idx in 1:length(env_pair)) {
      ix <- env_pair[[idx]]
      ename <- env_names[idx]
      x[ix[1]] <- gsub("::: (.+)", paste0("\\\\begin{", ename, "}"), x[ix[1]])
      x[ix[2]] <- gsub(":::", paste0("\\\\end{", ename, "}"), x[ix[2]])
    }
  } else {
    idx <- unlist(lapply(env_pair, function(x) seq(x[1], x[2])))
    x <- x[-idx]
  }
  return(x)
}
