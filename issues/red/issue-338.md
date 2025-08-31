
#338: Can't use pointer index defined in context
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/338>

```
Red/System []

a: as pointer! [integer!] allocate 10 * size? integer!

c: context [
    i: 1
    a/i: i
]
```

**\* Compilation Error: undefined pointer index variable 
**\* at line: 7 
**\* near: [
    a/i: i
]



