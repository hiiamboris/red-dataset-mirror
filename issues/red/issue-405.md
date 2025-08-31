
#405: REPEAT variable can't be made local
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/405>

This is a very recent regression.

```
Red []

f: func [
    /local i
][
    repeat i 10 [
    ]
]
```

Compiling to native code... 

**\* Compilation Error: argument type mismatch on calling: red/_context/set-integer 
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
**\* near: [~i r1 
    r1 <= rlim1
]



Comments:
--------------------------------------------------------------------------------

On 2013-02-09T23:25:58Z, dockimbel, commented:
<https://github.com/red/red/issues/405#issuecomment-13340950>

    Fixed in `lex-scope` branch.

