
#545: Red shared library broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/545>

This happens in the `objects` branch:

```
Red []

#system-global [
    e: does []
    #export [e]
]
```

Compiling to native code...
**\* Compilation Error: invalid struct member value in: exec/ctx78/value 
**\* in function: exec/f_quit
**\* at line: 1 
**\* near: (exec/ctx78/value)



