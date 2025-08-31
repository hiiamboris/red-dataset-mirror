
#956: Compiler crash on nested expression with local object and path
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/956>

```
Red []

f: function [
    o [object!]
][
    if o/a [
        all [o]
    ]
]
```

Compiling to native code...
**\* Compilation Error: undefined symbol: pos 
**\* in function: exec/f_f
**\* at line: 1 
**\* near: [pos 
    either logic/false? [stack/reset none/push-last] [
        stack/reset 
        stack/mark-native exec/~all 
        stack/top: stack/arguments 
        stack/push ~o 
        either stack/func? [stack/push-call path394 0 as integer! :f_~path395] [
            stack/mark-native exec/~eval-path 
            stack/push stack/arguments - 1 
            word/push exec/~a 
            actions/eval-path\* false 
            stack/unwind-no-cb 2 
            either stack/func? [stack/push-call path394 1 as integer! :f_~path395] [
                copy-cell stack/arguments + 1 stack/arguments 
                stack/keep 
                f_~path395
            ]
        ] 
        stack/check-call 
        if logic/false? [stack/reset none/push-last] 
        stack/unwind
    ] 
    stack/unwind 
    stack/unwind-last 
    ctx/values:
]



Comments:
--------------------------------------------------------------------------------

On 2014-10-17T16:45:55Z, dockimbel, commented:
<https://github.com/red/red/issues/956#issuecomment-59541127>

    Fixed by commit [052cd5ed](https://github.com/red/red/commit/dab222eb982a855d1cf9cadbda013e7e052cd5ed).

