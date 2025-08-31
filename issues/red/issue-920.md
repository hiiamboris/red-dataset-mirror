
#920: set-path! on parameter object in compiled function doesn't work
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/920>

```
Red []

f: func [o [object!]] [
    o/a: 1
]
f object [a: 0]
```

**\* Script error: action 31 not defined for type: 19

```
o: object [a: 0]
f o
```

**\* Script error: action 39 not defined for type: 4



