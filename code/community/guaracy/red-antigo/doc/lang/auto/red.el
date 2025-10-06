(TeX-add-style-hook
 "red"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt" "a4paper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("xcolor" "dvipsnames") ("inputenc" "utf8x") ("babel" "brazil") ("graphicx" "pdftex") ("hyperref" "colorlinks=true" "linkcolor=blue")))
   (add-to-list 'LaTeX-verbatim-environments-local "minted")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (TeX-run-style-hooks
    "latex2e"
    "highlight"
    "article"
    "art12"
    "xcolor"
    "inputenc"
    "babel"
    "graphicx"
    "hyperref"
    "minted"
    "fancyhdr"
    "draftwatermark"
    "framed"
    "color")
   (TeX-add-symbols
    '("codigo" 1)
    '("incss" 1)
    '("inchf" 2)
    "Red")
   (LaTeX-add-labels
    "listing:3"
    "ssec:path"
    "sec:func")
   (LaTeX-add-color-definecolors
    "bg"
    "shadecolor")))

