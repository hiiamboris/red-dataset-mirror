
#409: Doc-string plus refinement corrupts argument passing
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/409>

```
Red []

g: func [
    b [block!]
][
    probe b
    probe do b
]
f: func ["!"
    x
    /r
][
    g [x]
]
f "!"
```

[x]
false



