
#983: Crash on SWITCH local object! path!
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/983>

```
Red []

f: func [
    o
][
    switch probe o/x [
        0 [
        ]
    ]
]

f object [
    x: 0
]
```

0

**\* Script error: action 42 not defined for type: 7



