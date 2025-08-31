
#392: Multi-line paren! broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/392>

```
Red []

a: (
    1
)
```

-= Red Compiler =- 
**\* Red Compiler Internal Error: Script Error : new-line expected block argument of type: block 
**\* Where: add-line-markers 
**\* Near:  [new-line pos yes]



