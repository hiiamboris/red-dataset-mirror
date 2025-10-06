Red[
    author: {Nędza Darek}
    version: 0.0.1
    license: {
        - point to this gist/github
        - no warranties
        - use/modify everywhere
    }
]

opening-tag?: function [value] [
    all [
        
        tag? value
        value/1 <> #"/"
    ]
]
closing-tag?: function [value][
    all [
        tag? value
        value/1 = #"/"
    ]
]
excluded-tag?: function [value][
    excluded-tags: ["meta" "br" "link"]

    foreach excluded-tag excluded-tags [
        if find/match value excluded-tag [
            return true
        ]
    ]
    return false
]
load-html: function [source [string!]][
    html-elements: copy []
    position: source
    last-added: none
    while [not tail? source] [
        element: try [load/next source 'position]
        either tag? element [
            last-added: 'tag
            ;probe element
            append html-elements element
            source: position
        ][
            if 'other = last-added [
                append (last html-elements) source/1
            ]
            if 'tag = last-added [
                append html-elements to-string source/1
            ]
            last-added: 'other    
            source: next source
        ]
    ]
    hierarchy: copy []
    hierarchy-path: make path! [hierarchy]
    foreach element html-elements [
        case [
            excluded-tag? element [
                append (reduce hierarchy-path) element
                append/only (reduce hierarchy-path) copy []
            ]
            opening-tag? element [
                append (reduce hierarchy-path) element
                append/only (reduce hierarchy-path) copy []
                append hierarchy-path element
            ]
            closing-tag? element [
                remove back tail hierarchy-path
            ]
            string? element [
                append (reduce hierarchy-path) element
            ]
        ]
    ]
    
    return hierarchy
]
