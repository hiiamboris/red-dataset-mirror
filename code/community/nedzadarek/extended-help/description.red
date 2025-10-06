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

description: func ['path /return-as-map] [
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
    element: select hierarchy key
    
    print rejoin element/(<div class="description">)
]
