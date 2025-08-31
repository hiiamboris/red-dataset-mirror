
#946: Compiler crash on path on local object
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/946>

```
Red []

f: function [
    a [object!]
][
    a/b
]
```

Compiling to native code...
**\* Compilation Error: argument type mismatch on calling: red/word/get 
**\* expected: [struct! [
        header [integer!] 
        ctx [pointer! [integer!]] 
        symbol [integer!] 
        index [integer!]
    ]], found: [struct! [
        header [integer!] 
        data1 [integer!] 
        data2 [integer!] 
        data3 [integer!]
    ]] 
**\* in function: exec/f_f
**\* at line: 1 
**\* near: [~a 
    either stack/func? [stack/push-call path394 0 as integer! :f_~path395] [
        stack/mark-native ~eval-path 
        stack/push stack/arguments - 1 
        word/push ~b 
        actions/eval-path\* false 
        stack/unwind-no-cb 2 
        either stack/func? [stack/push-call path394 1 as integer! :f_~path395] [
            copy-cell stack/arguments + 1 stack/arguments 
            stack/keep 
            f_~path395
        ]
    ] 
    stack/check-call 
    stack/unwind-last 
    ctx/values:
]



