
#348: WITH not CONTEXT aware :-)
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/348>

```
Red/System []

c1: context [
    c2: context [
        x: 0
    ]

    with c2 [
        x: 1
    ]
]
```

**\* Compilation Error: undefined context c2 
**\* at line: 8 
**\* near: [
    with c2 [
        x: 1
    ]
]



