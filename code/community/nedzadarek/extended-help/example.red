Red[
    author: {Nędza Darek}
    version: 0.0.1
    license: {
        - point to this gist/github
        - no warranties
        - use/modify everywhere
    }
]

do %read_file.red
do %load_html.red
do %helper.red

example: func ['path /return-as-map] [
    unless word? path [path: sort-path path]
    _html-source: read-html :path
    hierarchy: load-html _html-source
    hierarchy: try [
        h1: hierarchy/(<html>)
        h2: h1/(<body>)
    ]
    if error? hierarchy [do hierarchy]
    
    
    key: copy <section id=>
    append key {"}
    append key path
    append key {"}
    v: select hierarchy key
    m: copy #()
    ; at the moment just assume that there is only one example-output pair
    m/code: trim first select v <code>
    m/output: trim first select v <samp>
    
    either return-as-map [
        return m
    ] [
        print {############# Code: #############}
        print m/code
        print {############ Output: ############}
        print m/output
        exit
    ]    
]
; >> extended-help-ctx/language: 'en 
; == en
; >> example a-an
; ############# Code: #############
; a-an "foo"
; ############ Output: ############
; "a"
; >> extended-help-ctx/language: 'pl
; == pl
; >> example/return-as-map a-an
; == #(
    ; code: {a-an "foo" || PL}
    ; output: {"a"}
; )