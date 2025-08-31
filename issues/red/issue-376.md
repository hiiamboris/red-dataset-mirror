
#376: ROUTINE doc-string breaks argument
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/376>

```
Red []

f: routine [
    "Test."
    n [integer!]
][
]
f 0
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



