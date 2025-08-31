
#162: as-logic byte! from struct! reads integer instead of byte
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/162>

```
s: declare struct! [
    a   [byte!]
    b   [byte!]
]
s/a: as-byte 0
s/b: as-byte 1
print as-logic s/a
```

true



