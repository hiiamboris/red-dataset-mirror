
#406: Can't assign name of local
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/406>

```
Red []

f: func [
    /local y
][
    x: 'y
]
```

Compiling to native code... 

**\* Compilation Error: argument type mismatch on calling: red/word/push 
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
**\* near: [~y 
    word/set 
    stack/unwind 
    stack/unwind-last
]



Comments:
--------------------------------------------------------------------------------

On 2013-02-07T22:06:34Z, dockimbel, commented:
<https://github.com/red/red/issues/406#issuecomment-13263346>

    Fixed in `lex-scope` branch.

