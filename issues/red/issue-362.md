
#362: ROUTINE can't marshal input and output at the same time
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/362>

```
Red []

f: routine [
    s           [string!]
    return:     [integer!]
][
    0
]
f ""
```

-= Red Compiler =- 
**\* Red Compiler Internal Error: Script Error : red-string! has no value 
**\* Where: emit-routine 
**\* Near:  [append/only output append to path!]



