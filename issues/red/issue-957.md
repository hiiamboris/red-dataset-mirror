
#957: Compiler crash on SWITCH local object! path! SWITCH
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/957>

```
Red []

f: function [
    o [object!]
][
    switch o/a [
        0 [
            switch 0 [
                0 [
                ]
            ]
        ]
    ]
]
```

Compiling to native code...
**\* Compilation Error: undefined symbol: pos 
**\* in function: exec/f_f
**\* at line: 1 
**\* near: [pos 
    integer/push 2 
    actions/select\* -1 0 -1 -1
]



Comments:
--------------------------------------------------------------------------------

On 2014-10-17T03:00:04Z, dockimbel, commented:
<https://github.com/red/red/issues/957#issuecomment-59460403>

    Thanks, I knew I have missed some other special cases where object paths are used.

