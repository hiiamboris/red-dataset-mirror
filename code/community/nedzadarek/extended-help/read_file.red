Red[
    author: {Nędza Darek}
    version: 0.0.1
    license: {
        - point to this gist/github
        - no warranties
        - use/modify everywhere
    }
]


read-html: function ['path] [
    function-name: either word? path [path] [path/1]
    read to-file compose [
        documentation
        /
        (extended-help-ctx/language)
        /
        (function-name)
        /
        (to-string reduce [function-name ".html"] )
    ]
]
; probe read-html a-an