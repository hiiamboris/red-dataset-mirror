
#396: FUNCTION breaks on multiple assignments
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/396>

```
Red []

f: function [
][
    x: 1
    x: 1
]
```

-= Red Compiler =- 
**\* Compilation Error: duplicate word definition: x 
**\* near: [f: function [/local x x] [x: 1 x: 1]]



