## Installation

You can install and use **nmbutemplates** from GitHub as follows:

```r
if (!library(remotes)) install.packages("remotes")
remotes::install_github("mathatistics/nmbutemplates")
```
## Overview
To get started with create exam question just draft a skeleton using following code in a project created for the purpose:

```r
rmarkdown::draft(file = "stat123.Rmd", template = "exam_question", package = "nmbutemplates", create_dir = FALSE)
```

This will open up a dialogue box with the `stat123.Rmd` file. You can open this file from your project folder and render it with Rmarkdown. You will get a rendered PDF file.

