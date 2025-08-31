
#150: Assignment spoils as-integer byte! from struct! cast
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/150>

Even though #146 works now, assignment seems to revert it:

```
s!: alias struct! [
    a   [byte!]
    b   [byte!]
    c   [byte!]
    d   [byte!]
]
t: declare s!
t/a: as-byte 1
t/b: as-byte 1
t/c: as-byte 0
t/d: as-byte 0
h: as-integer t/a
print-hex h
```

804AD01



Comments:
--------------------------------------------------------------------------------

On 2011-08-24T12:48:34Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/150#issuecomment-1889371>

    This bug is back after the casting reimplementation.

