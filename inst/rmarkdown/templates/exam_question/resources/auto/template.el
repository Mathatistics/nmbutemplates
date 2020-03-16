(TeX-add-style-hook
 "template"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("xcolor" "dvipsnames" "svgnames") ("$fontfamily$" "$for(fontfamilyoptions)$$fontfamilyoptions$$sep$" "$endfor$") ("fontenc" "$if(fontenc)$$fontenc$$else$T1$endif$") ("inputenc" "utf8") ("luatexja-preset" "$for(luatexjapresetoptions)$$luatexjapresetoptions$$sep$" "$endfor$") ("luatexja-fontspec" "$for(luatexjafontspecoptions)$$luatexjafontspecoptions$$sep$" "$endfor$") ("microtype" "$for(microtypeoptions)$$microtypeoptions$$sep$" "$endfor$") ("geometry" "$for(geometry)$$geometry$$sep$" "$endfor$") ("babel" "shorthands=off" "$for(babel-otherlangs)$$babel-otherlangs$" "$endfor$main=$babel-lang$") ("natbib" "$natbiboptions$") ("biblatex" "$if(biblio-style)$style=$biblio-style$" "$endif$$for(biblatexoptions)$$biblatexoptions$$sep$" "$endfor$")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "amssymb"
    "amsmath"
    "xfrac"
    "xcolor"
    "$fontfamily$"
    "lmodern"
    "setspace"
    "ifxetex"
    "ifluatex"
    "fontenc"
    "inputenc"
    "textcomp"
    "mathspec"
    "unicode-math"
    "xeCJK"
    "luatexja-preset"
    "luatexja-fontspec"
    "upquote"
    "microtype"
    "parskip"
    "xurl"
    "bookmark"
    "hyperref"
    "geometry"
    "listings"
    "longtable"
    "booktabs"
    "etoolbox"
    "footnotehyper"
    "footnote"
    "graphicx"
    "grffile"
    "polyglossia"
    "babel"
    "bidi"
    "natbib"
    "biblatex"
    "tabularx"
    "lastpage"
    "environ"
    "fancyhdr")
   (TeX-add-symbols
    '("subtitle" 1)
    '("LR" 1)
    '("RL" 1)
    '("passthrough" 1)
    "tightlist"
    "maxwidth"
    "maxheight"
    "oldparagraph"
    "oldsubparagraph")
   (LaTeX-add-environments
    '("hidden")
    "RTL"
    "LTR"
    "answer")
   (LaTeX-add-bibliographies
    "$for(bibliography)$$bibliography$$sep$"
    "$endfor$")
   (LaTeX-add-array-newcolumntypes
    "Y"))
 :latex)

