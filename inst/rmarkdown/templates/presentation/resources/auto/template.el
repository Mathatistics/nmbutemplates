(TeX-add-style-hook
 "template"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("$documentclass$" "$if(fontsize)$$fontsize$" "$else$11pt" "$endif$$if(lang)$$babel-lang$" "$endif$$if(handout)$handout" "$endif$$if(colorlinks)$dvipsnames" "$endif$$if(beamer)$ignorenonframetext" "$endif$$for(classoption)$$classoption$$sep$" "$endfor$")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("$fontfamily$" "$for(fontfamilyoptions)$$fontfamilyoptions$$sep$" "$endfor$") ("fontenc" "$if(fontenc)$$fontenc$$else$T1$endif$") ("inputenc" "utf8") ("babel" "shorthands=off" "$for(babel-otherlangs)$$babel-otherlangs$" "$endfor$main=$babel-lang$") ("natbib" "round") ("biblatex" "$if(biblio-style)$style=$biblio-style$" "$endif$$for(biblatexoptions)$$biblatexoptions$$sep$" "$endfor$") ("ulem" "normalem") ("bidi" "RTLdocument")))
   (add-to-list 'LaTeX-verbatim-environments-local "code")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "SaveVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "VerbatimOut")
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb*")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "latex2e"
    "$documentclass$"
    "$documentclass$10"
    "pgfpages"
    "$fontfamily$"
    "lmodern"
    "amssymb"
    "amsmath"
    "ifxetex"
    "ifluatex"
    "fixltx2e"
    "fontenc"
    "inputenc"
    "eurosym"
    "mathspec"
    "fontspec"
    "xeCJK"
    "microtype"
    "babel"
    "polyglossia"
    "natbib"
    "biblatex"
    "fancyvrb"
    "listings"
    "longtable"
    "booktabs"
    "caption"
    "graphicx"
    "grffile"
    "ulem"
    "bidi")
   (TeX-add-symbols
    '("LR" 1)
    '("RL" 1)
    "euro"
    "tightlist"
    "maxwidth"
    "maxheight"
    "insertpartnumber"
    "partname"
    "insertsectionnumber"
    "sectionname"
    "insertsubsectionnumber"
    "subsectionname")
   (LaTeX-add-environments
    "cslreferences"
    "RTL"
    "LTR")
   (LaTeX-add-bibliographies
    "$for(bibliography)$$bibliography$$sep$"
    "$endfor$")
   (LaTeX-add-lengths
    "cslhangindent"))
 :latex)

