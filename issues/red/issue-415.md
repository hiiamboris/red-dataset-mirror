
#415: Compile crash on nested functions
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/415>

```
Red []

f: func [
][
    g: func [
    ][
    ]
]
```

-= Red Compiler =- 
**\* Red Compiler Internal Error: Script Error : Out of range or past end 
**\* Where: comp-func-body 
**\* Near:  [ctx-values: append to path! last]



Comments:
--------------------------------------------------------------------------------

On 2013-02-18T15:14:47Z, dockimbel, commented:
<https://github.com/red/red/issues/415#issuecomment-13726190>

    The `g` function is constructed at runtime, so it needs the interpreter for that. Support for runtime function construction in interpreter is pending.

--------------------------------------------------------------------------------

On 2013-02-18T18:26:27Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/415#issuecomment-13735693>

    Couldn't it be constructed at compile time?

--------------------------------------------------------------------------------

On 2013-02-18T19:11:18Z, dockimbel, commented:
<https://github.com/red/red/issues/415#issuecomment-13737722>

    It seems I'm becoming a bit lazy. :-) Yes, such case could be statically compiled (as literal blocks are used both for spec and body arguments to `func`), but I need to check if that can be done now or it is needs to wait for objects/contexts to be implemented first.

--------------------------------------------------------------------------------

On 2013-02-18T19:23:58Z, dockimbel, commented:
<https://github.com/red/red/issues/415#issuecomment-13738338>

    Ok, it was just a simple bug, it seems that the current compiler handling of functions contexts if enough to support such constructions.

