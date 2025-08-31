
#241: WITH can't find #enum values from CONTEXT
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/241>

```
c: context [
    #enum e! [i]
]

with c [
    f: function [
        return: [e!]
    ][
        i
    ]
]
```

**\* Compilation Error: undefined symbol: i 
**\* in file: %/users/administrator/Red/Red-SQLite/examples/test.reds 
**\* in function: f
**\* at line: 11 
**\* near: [
    i
]



