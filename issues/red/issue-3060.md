
#3060: Parse: modified input series in a paren expression messes up ending detection
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3060>

```
parse z: [] [x: (insert x 'a) y: 'a]
== false
```
Should be `true`.


