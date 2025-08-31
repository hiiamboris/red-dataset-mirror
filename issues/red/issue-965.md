
#965: Compiler crash on IF local object! paths
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/965>

```
Red []

f: func [
    o [object!]
][
    if yes [
        append o/a o/b
    ]
]
```

Compiling to native code...
**\* Compilation Error: invalid path value 
**\* in function: exec/f_~path397
**\* at line: 1 
**\* near: [1x1 [
        stack/reset 
        stack/top: stack/arguments 
        word/get-local ctx326 0 
        either stack/func? [stack/push-call path394 0 as integer! :f_~path395 null] [
            stack/mark-native ~eval-path 
            stack/push stack/arguments - 1 
            word/push ~b 
            actions/eval-path\* false 
            stack/unwind-no-cb 2 
            either stack/func? [stack/push-call path394 1 as integer! :f_~path395 null] [
                copy-cell stack/arguments + 1 stack/arguments 
                stack/keep 
                f_~path395 null
            ]
        ] 
        stack/check-call
    ] 
    stack/unwind-last
]



