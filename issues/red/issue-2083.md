
#2083: broken chain reactor
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2083>

```
red>> a: make reactor! [x: 1 y: is [x + 1] z: is [y + 1]]
== make object! [
    x: 1
    y: 2
    z: 3
]
red>> a/x: 4
== 4
red>> a
== make object! [
    x: 4
    y: 5
    z: 3
]
red>> a/z
== 3
```

Expected `6`.



Comments:
--------------------------------------------------------------------------------

On 2016-06-30T08:48:27Z, dockimbel, commented:
<https://github.com/red/red/issues/2083#issuecomment-229599850>

    I forgot to implement events triggering in the SET native when applied to object. IS function is relying on it, though REACT is not affected by that. Will implement it today.

