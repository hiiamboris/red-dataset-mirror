
#947: Compiler crash on expression with paths on local object
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/947>

```
Red []

f: func [
    o [object!]
][
    if o/a [o/a]
]
```

Compiling to native code...
**\* Compilation Error: argument type mismatch on calling: red/stack/push 
**\* expected: [struct! [
        header [integer!] 
        data1 [integer!] 
        data2 [integer!] 
        data3 [integer!]
    ]], found: [struct! [
        header [integer!] 
        ctx [pointer! [integer!]] 
        symbol [integer!] 
        index [integer!]
    ]] 
**\* in function: exec/f_~path397
**\* at line: 1 
**\* near: [
    either stack/func? [stack/push-call path395 0 as integer! :f_~path396] [
        stack/mark-native ~eval-path 
        stack/push stack/arguments - 1 
        word/push ~a 
        actions/eval-path\* false 
        stack/unwind-no-cb 2 
        either stack/func? [stack/push-call path395 1 as integer! :f_~path396] [
            copy-cell stack/arguments + 1 stack/arguments 
            stack/keep 
            f_~path396
        ]
    ] 
    stack/check-call
]



Comments:
--------------------------------------------------------------------------------

On 2014-10-08T16:12:43Z, dockimbel, commented:
<https://github.com/red/red/issues/947#issuecomment-58383447>

    Support for compiled objects in functions is buggy. I am going through all the cases to make all the fixes, so no need to open new tickets for that topic until my next commit in objects branch that should hopefully fix all those issues.

--------------------------------------------------------------------------------

On 2014-10-16T16:29:49Z, dockimbel, commented:
<https://github.com/red/red/issues/947#issuecomment-59390094>

    I leave it open until you confirm that this effectively fixes the issue in your code and does not create other regressions.

