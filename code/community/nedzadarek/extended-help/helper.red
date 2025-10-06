Red[
    author: {Nędza Darek}
    version: 0.0.1
    license: {
        - point to this gist/github
        - no warranties
        - use/modify everywhere
    }
]
sort-path: function [path] [
    head insert to-path sort to-block next path  first path
]