
#391: FUNCTION doesn't allow SETting arguments
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/391>

```
Red []

f: function [
    a
][
    a: 1
]
```

-= Red Compiler =- 
**\* Compilation Error: duplicate word definition: a 
**\* near: [
    f: function [
        a /local 
        a
    ] [
        a: 1
    ] 
]



