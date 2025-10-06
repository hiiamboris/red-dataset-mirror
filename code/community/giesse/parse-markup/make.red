Red [
    File:    %make.red
    Title:   "Generate compiled-rules.red"
    Author:  "Gabriele Santilli"
    License: {}
]

print "Building new compiled-rules.red..."

forever [
    cfg: either exists? %.config.red [load %.config.red] [make map! []]
    if all [cfg/topaz-parse exists? cfg/topaz-parse/parse-compiler.red] [
        unless error? try [
            do cfg/topaz-parse/parse-compiler.red
        ] [
            break
        ]
    ]
    cfg/topaz-parse: to file! ask "Path to topaz-parse? "
    save %.config.red cfg
]

rules: context rules: [
    html-rule: [
        collect some [
            comment | declaration | cdata | proc | script-style
            |
            end-tag | start-empty-tag | text
        ]
    ]

    ; this is a "clever" way to define a bunch of functions that all look the same, eg.
    ; as-comment: func [txt] [reduce ['comment txt]]
    ; (and by clever I mean confusing, therefore you can just skip over this section and trust me that it works)
    as-comment: as-declaration: as-text: as-xml-proc: as-whitespace: none

    parse rules [
        to quote as-comment:
        some [
            set fn set-word! (
                set fn func [txt] compose/deep [reduce [(to lit-word! skip form fn 3) txt]]
            )
        ]
    ]
    ; end "clever" section

    comment: [
        keep as-comment load copy [
            "<![" thru "]>" ; MS HTML
            |
            "<!--" thru "-->"
        ]
    ]
    ; Doctype declarations are parsed with a simplified rule that could possibly break in some documents;
    ; we don't expect it to break with the usual declarations found in HTML documents though. Note that the
    ; contents of the declaration is simply ignored (ie. we don't really adjust the parsing based on the
    ; doctype).
    declaration: [
        keep as-declaration load copy [
            "<!doctype" space-char thru #">"
        ]
    ]
    cdata: [
        "<![CDATA[" keep as-text copy to "]]>" 3 skip
    ]
    ; XML processing instructions are simply passed on literally (this also catches the XML declaration)
    proc: [
        "<?XML:NAMESPACE PREFIX = 0 />" ; MS HTML, we ignore it altogether
        |
        keep as-xml-proc load copy ["<?" name thru "?>"]
    ]

    nm: attrs: none
    start-empty-tag: [
        #"<"
        nm: copy [name opt [#":" name]]
        any space-char
        attrs: to-map collect any [attribute | some garbage] ; ignore any garbage
        [
            "/>" (append nm #"/")
            |
            #">"
            |
            ; someone made a typo... and we have to make it work anyway!
            ahead #"<"
        ]
        keep (to tag! nm) keep (attrs)
        |
        keep as-text copy #"<"
    ]
    attribute: [
        keep [copy [name #":" name] | to-word copy name] [
            any space-char [
                #"=" any space-char keep decode-entities attr-value
                |
                keep (true)
            ]
        ]
        any space-char
    ]
    attr-value: [
        {"} also copy to {"} skip
        |
        #"'" also copy to #"'" skip
        |
        ; a lot of HTML out there is broken
        also copy some broken-value-chars ahead #">"
        |
        copy any value-chars
    ]

    end-tag: [
        #"<" keep also to-tag copy [#"/" name opt [#":" name]] [any space-char #">"]
        keep (none)
    ]

    ; Script and style elements need to be parsed separately, because they're special
    ; in HTML 3.2 and 4.0/4.1, and the CDATA syntax of XHTML is not well supported by
    ; browsers. We are trying to parse three cases here: the style or script text
    ; is escaped with "/* <![CDATA[ */" and "/* ]]> */" (XHTML way with comments
    ; to make it work with browsers), it is hidden into a comment (not valid in
    ; XHTML but common practice in HTML), or it is just left unescaped (invalid in XHTML
    ; but valid in HTML). In the first case we try to remove the extra "/*" and "*/"
    ; from the text; in the second case we try to remove the common "//" comment before
    ; the closing "-->"; in the third case we just take everything up to </script> or
    ; </style>.
    script-style: [
        #"<"
        nm: copy ["script" | "style"]
        any space-char
        attrs: to-map collect any attribute
        #">"
        keep (to tag! nm) keep (attrs)
        (nm: append copy </> nm)
        [
            any space-char "/*" any space-char "<![CDATA[" any space-char "*/" any space-char
            keep as-text clean-script-text copy to "]]>" 3 skip any space-char "*/" any space-char
            |
            any space-char "<!--"
            keep as-text clean-script-text copy to "-->" 3 skip any space-char
            |
            keep as-text copy to nm
        ]
        keep nm keep (none)
    ]

    clean-script-text: function [text] [
        trim/tail text
        if find ["/*" "//"] pos: skip tail text -2 [
            clear pos
            trim/tail text
        ]
        text
    ]

    text: [
        some [
            keep as-whitespace copy some space-char
            |
            keep as-text decode-entities copy some text-char
        ]
    ]

    decode-entities: function [text] [
        output: copy ""
        txt: none
        parse text [
            any [
                mk1: to #"&" mk2: (append/part output mk1 mk2)
                #"&" [
                    copy txt name #";" (append output any [select/case named-entities txt ""])
                    |
                    #"x" copy txt some hexdigit #";" (append output to char! to integer! debase/base txt 16)
                    |
                    #"#" copy txt some digit #";" (append output to char! to integer! txt)
                    |
                    (append output #"&")
                ]
                |
                ; copy to end
                (append output mk1)
                to end
            ]
        ]
        output
    ]

    ; this might be out of date, will need to be updated
    ; be careful when editing, eg. the char after "nbsp" is not just a space :)
    named-entities: #(
        "quot" #"^""
        "amp" #"&"
        "lt" #"<"
        "gt" #">"
        "nbsp" #" "
        "iexcl" #"¡"
        "cent" #"¢"
        "pound" #"£"
        "curren" #"¤"
        "yen" #"¥"
        "brvbar" #"¦"
        "sect" #"§"
        "uml" #"¨"
        "copy" #"©"
        "ordf" #"ª"
        "laquo" #"«"
        "not" #"¬"
        "shy" #"­"
        "reg" #"®"
        "macr" #"¯"
        "deg" #"°"
        "plusmn" #"±"
        "sup2" #"²"
        "sup3" #"³"
        "acute" #"´"
        "micro" #"µ"
        "para" #"¶"
        "middot" #"·"
        "cedil" #"¸"
        "sup1" #"¹"
        "ordm" #"º"
        "raquo" #"»"
        "frac14" #"¼"
        "frac12" #"½"
        "frac34" #"¾"
        "iquest" #"¿"
        "Agrave" #"À"
        "Aacute" #"Á"
        "Acirc" #"Â"
        "Atilde" #"Ã"
        "Auml" #"Ä"
        "Aring" #"Å"
        "AElig" #"Æ"
        "Ccedil" #"Ç"
        "Egrave" #"È"
        "Eacute" #"É"
        "Ecirc" #"Ê"
        "Euml" #"Ë"
        "Igrave" #"Ì"
        "Iacute" #"Í"
        "Icirc" #"Î"
        "Iuml" #"Ï"
        "ETH" #"Ð"
        "Ntilde" #"Ñ"
        "Ograve" #"Ò"
        "Oacute" #"Ó"
        "Ocirc" #"Ô"
        "Otilde" #"Õ"
        "Ouml" #"Ö"
        "times" #"×"
        "Oslash" #"Ø"
        "Ugrave" #"Ù"
        "Uacute" #"Ú"
        "Ucirc" #"Û"
        "Uuml" #"Ü"
        "Yacute" #"Ý"
        "THORN" #"Þ"
        "szlig" #"ß"
        "agrave" #"à"
        "aacute" #"á"
        "acirc" #"â"
        "atilde" #"ã"
        "auml" #"ä"
        "aring" #"å"
        "aelig" #"æ"
        "ccedil" #"ç"
        "egrave" #"è"
        "eacute" #"é"
        "ecirc" #"ê"
        "euml" #"ë"
        "igrave" #"ì"
        "iacute" #"í"
        "icirc" #"î"
        "iuml" #"ï"
        "eth" #"ð"
        "ntilde" #"ñ"
        "ograve" #"ò"
        "oacute" #"ó"
        "ocirc" #"ô"
        "otilde" #"õ"
        "ouml" #"ö"
        "divide" #"÷"
        "oslash" #"ø"
        "ugrave" #"ù"
        "uacute" #"ú"
        "ucirc" #"û"
        "uuml" #"ü"
        "yacute" #"ý"
        "thorn" #"þ"
        "yuml" #"ÿ"
        "fnof" #"ƒ"
        "Alpha" #"Α"
        "Beta" #"Β"
        "Gamma" #"Γ"
        "Delta" #"Δ"
        "Epsilon" #"Ε"
        "Zeta" #"Ζ"
        "Eta" #"Η"
        "Theta" #"Θ"
        "Iota" #"Ι"
        "Kappa" #"Κ"
        "Lambda" #"Λ"
        "Mu" #"Μ"
        "Nu" #"Ν"
        "Xi" #"Ξ"
        "Omicron" #"Ο"
        "Pi" #"Π"
        "Rho" #"Ρ"
        "Sigma" #"Σ"
        "Tau" #"Τ"
        "Upsilon" #"Υ"
        "Phi" #"Φ"
        "Chi" #"Χ"
        "Psi" #"Ψ"
        "Omega" #"Ω"
        "alpha" #"α"
        "beta" #"β"
        "gamma" #"γ"
        "delta" #"δ"
        "epsilon" #"ε"
        "zeta" #"ζ"
        "eta" #"η"
        "theta" #"θ"
        "iota" #"ι"
        "kappa" #"κ"
        "lambda" #"λ"
        "mu" #"μ"
        "nu" #"ν"
        "xi" #"ξ"
        "omicron" #"ο"
        "pi" #"π"
        "rho" #"ρ"
        "sigmaf" #"ς"
        "sigma" #"σ"
        "tau" #"τ"
        "upsilon" #"υ"
        "phi" #"φ"
        "chi" #"χ"
        "psi" #"ψ"
        "omega" #"ω"
        "thetasym" #"ϑ"
        "upsih" #"ϒ"
        "piv" #"ϖ"
        "bull" #"•"
        "hellip" #"…"
        "prime" #"′"
        "Prime" #"″"
        "oline" #"‾"
        "frasl" #"⁄"
        "weierp" #"℘"
        "image" #"ℑ"
        "real" #"ℜ"
        "trade" #"™"
        "alefsym" #"ℵ"
        "larr" #"←"
        "uarr" #"↑"
        "rarr" #"→"
        "darr" #"↓"
        "harr" #"↔"
        "crarr" #"↵"
        "lArr" #"⇐"
        "uArr" #"⇑"
        "rArr" #"⇒"
        "dArr" #"⇓"
        "hArr" #"⇔"
        "forall" #"∀"
        "part" #"∂"
        "exist" #"∃"
        "empty" #"∅"
        "nabla" #"∇"
        "isin" #"∈"
        "notin" #"∉"
        "ni" #"∋"
        "prod" #"∏"
        "sum" #"∑"
        "minus" #"−"
        "lowast" #"∗"
        "radic" #"√"
        "prop" #"∝"
        "infin" #"∞"
        "ang" #"∠"
        "and" #"∧"
        "or" #"∨"
        "cap" #"∩"
        "cup" #"∪"
        "int" #"∫"
        "there4" #"∴"
        "sim" #"∼"
        "cong" #"≅"
        "asymp" #"≈"
        "ne" #"≠"
        "equiv" #"≡"
        "le" #"≤"
        "ge" #"≥"
        "sub" #"⊂"
        "sup" #"⊃"
        "nsub" #"⊄"
        "sube" #"⊆"
        "supe" #"⊇"
        "oplus" #"⊕"
        "otimes" #"⊗"
        "perp" #"⊥"
        "sdot" #"⋅"
        "lceil" #"⌈"
        "rceil" #"⌉"
        "lfloor" #"⌊"
        "rfloor" #"⌋"
        "lang" #"〈"
        "rang" #"〉"
        "loz" #"◊"
        "spades" #"♠"
        "clubs" #"♣"
        "hearts" #"♥"
        "diams" #"♦"
        "OElig" #"Œ"
        "oelig" #"œ"
        "Scaron" #"Š"
        "scaron" #"š"
        "Yuml" #"Ÿ"
        "circ" #"ˆ"
        "tilde" #"˜"
        "ensp" #" "
        "emsp" #" "
        "thinsp" #" "
        "zwnj" #"‌"
        "zwj" #"‍"
        "lrm" #"‎"
        "rlm" #"‏"
        "ndash" #"–"
        "mdash" #"—"
        "lsquo" #"‘"
        "rsquo" #"’"
        "sbquo" #"‚"
        "ldquo" #"“"
        "rdquo" #"”"
        "bdquo" #"„"
        "dagger" #"†"
        "Dagger" #"‡"
        "permil" #"‰"
        "lsaquo" #"‹"
        "rsaquo" #"›"
        "euro" #"€"
    )

    name: [letter* any letter+]

    letter: charset [#"A"- #"Z" #"a" - #"z"]
    digit: charset "1234567890"
    hexdigit: charset "1234567890abcdefABCDEF"
    letter*: append copy letter #"_"
    letter+: union union letter digit charset ".-_"
    value-chars: union letter+ charset "/:@%#?,+&=;" ; very relaxed
    broken-value-chars: append copy value-chars #" "
    garbage: exclude union value-chars charset {"'} charset "/"
    text-char: complement charset "< ^/^-"
    space-char: charset " ^/^-"
]

compiled-rules: compile-parse-rules/with in rules 'html-rule rules
write %compiled-rules.red append "Red []^/" mold/all compiled-rules

print "All done!"
