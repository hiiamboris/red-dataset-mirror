
#919: Compiler doesn't bind SET code to object!
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/919>

```
Red []

o: context [
    a: 0
    set 'f does [a: 1]
]
f
?? o
```

o: make object! [
    a: 0
]



