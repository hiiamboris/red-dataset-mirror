Red [
    File:    %parse-markup.red
    Title:   "Parse HTML or XML"
    Author:  "Gabriele Santilli"
    License: {}
]

parse-markup: context [
    compiled-rules: #include %compiled-rules.red

    parse-markup: function [
        "Parse XML, XHTML or HTML text"
        html [string!]
    ] [
        compiled-rules/_parse html
    ]
]

parse-markup: :parse-markup/parse-markup
