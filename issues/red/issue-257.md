
#257: DECLARE in CONTEXT breaks type
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/257>

```
s!: alias struct! [a [integer!]]
c: context [
    a: declare s!
]
```

**\* Compilation Error: unknown type: none 
**\* near: []



