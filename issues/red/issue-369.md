
#369: ROUTINE can't be used inside any conditional
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/369>

```
Red []

f: routine [
    return:     [integer!]
][
    0
]
if yes [print f]
```

Compiling to native code... 

**\* Compilation Error: variable has to be initialized at root level 
**\* at line: 122 
**\* near: [
    integer/box f 
    stack/unwind 
    natives/print\* 
    stack/unwind
]



