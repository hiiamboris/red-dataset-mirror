
#918: Can't compile set-path! on local object! with global namesake
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/918>

```
Red []

f: func [o [object!]] [
    o/a: 1
]
o: object [a: 0]
```

Compiling to native code...
**\* Compilation Error: argument type mismatch on calling: red/object/unchanged?
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
**\* near: [~o 330 [word/set-in ctx328 0] [
        stack/mark-native ~poke
        stack/mark-native ~find
        stack/push ~o
        word/push ~a
        actions/find\* -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
        stack/unwind
        integer/push 2
        stack/push stack/arguments - 1
        actions/poke*
        stack/unwind
    ]
    stack/unwind-last
    ctx/values: as pointer!
]



