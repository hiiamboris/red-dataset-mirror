
#398: FORALL breaks within function
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/398>

```
Red []

f: func [
    b [block!]
][
    forall b [
    ]
]
```

Compiling to native code... 

**\* Compilation Error: argument type mismatch on calling: red/word/get 
**\* expected: [struct! [
        header [integer!] 
        ctx [red/red-context!] 
        symbol [integer!] 
        index [integer!]
    ]], found: [struct! [
        header [integer!] 
        data1 [integer!] 
        data2 [integer!] 
        data3 [integer!]
    ]] 
**\* in function: exec/f_f
**\* at line: 122 
**\* near: [~b 
    word/push ~b 
    stack/mark-native ~forall 
    while [natives/forall-loop] [
        stack/reset 
        unset/push-last 
        natives/forall-next
    ]
]



Comments:
--------------------------------------------------------------------------------

On 2013-02-08T23:22:32Z, dockimbel, commented:
<https://github.com/red/red/issues/398#issuecomment-13319755>

    Fixed in `lex-scope` branch.

