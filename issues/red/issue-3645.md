
#3645: Interpreted path with get-word selector fails on paren! values
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3645>

```
Red []

do [
    c: [a: 1 b: 2 (y 5) 6]
    y: quote (y 5)
    probe c/:y
]
```
outputs `(y 5)` instead of `6`.


