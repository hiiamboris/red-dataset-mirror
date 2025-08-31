
#250: Pointer arithmetic on cast incorrect
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/250>

```
s!: alias struct! [value [integer!]]
s: declare s!
p: as byte-ptr! ""
print [
    s lf
    s + 1  lf
    p lf
    p + 1  lf
    (as s! p) + 1  lf
]
```

0804A4EC
0804A4F0
0804A4F4
0804A4F5
0804A4F5



