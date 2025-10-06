save-it: function ['>file [word! file! string! unset!] /default >default-file-name][

    unless default [
        >default-file-name: %index.html
    ]
    
    if (unset? (get/any '>file)) [
        >file: request-file/file >default-file-name
    ]

    if ((form >file) = "?") [
        >file: request-file/file >default-file-name
    ]

    if ((form >file) = "it") [
        >file: request-file/file >default-file-name
    ]    


    if ((form >file) = ".") [
        >file: >default-file-name
    ] 

    unless none? >file [
        write >file system/words/it
        print ["saved to" >file]
    ]
    
]

system/lexer/pre-load: func [src part][
    parse src [
        any [
            s: [
                ["save^/" | "save" end]      (new: "save-it ?")
                | ["save-it^/" | "save-it" end]       (new: "save-it ?")
                |["save it^/" | "save it" end]       (new: "save-it ?")
                | ["save to^/" | "save to" end]       (new: "save-it")
            ] e: (s: change/part s new e) :s
            | skip
        ]
    ]
]