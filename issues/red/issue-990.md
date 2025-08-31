
#990: SWITCH local object! path! broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/990>

```
Red []

f: func [
    o [object!]
][
    switch probe type?/word o/x [
        integer! [
            print "?"
        ]
    ]
]

f object [
    x: 0
]
```

integer!



