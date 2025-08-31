
#1821: TO/THRU rules are missing an extra iteration at end of input
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1821>

The following code

```
parse "f^Mt" [any [s: to [CR | end] e: (?? s ?? e) skip]]
```

gives

```
s: "f^Mt"
e: "^Mt"
```

instead of

```
s: "f^Mt"
e: "^Mt"
s: "t"
e: ""
```



