
#377: ROUTINE can't use argument inside WITH
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/377>

```
Red []

#system-global [
    c: context [
    ]
]
f: routine [
    a       [integer!]
][
    with c [a]
]
```

Compiling to native code... 

**\* Compilation Error: return type missing in function: red/stack/unwind 
**\* at line: 122 
**\* near: [
    stack/reset 
    stack/mark-native ~set 
    word/push ~f137 _function/push 
    blk138 blk139
]



Comments:
--------------------------------------------------------------------------------

On 2013-01-10T12:15:10Z, dockimbel, commented:
<https://github.com/red/red/issues/377#issuecomment-12091941>

    It works and compile fine now, probably fixed by the commit for #373.

