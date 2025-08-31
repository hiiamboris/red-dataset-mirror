
#959: Compiler crash on method assigning local object path to member of named context
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/959>

```
Red []

c: context [
    x: none

    f: func [
        o [object!]
    ][
        x: o/a
    ]
]
```

Compiling to native code...
**\* Compilation Error: undefined symbol: octx 
**\* in function: exec/f_~path398
**\* at line: 1 
**\* near: [octx 0 stack/unwind-last]



Comments:
--------------------------------------------------------------------------------

On 2014-10-18T23:54:57Z, PeterWAWood, commented:
<https://github.com/red/red/issues/959#issuecomment-59634231>

    I wrote a test for this case. I don't get a compiler error with the latest commit but the test fails under the compiler.
    
    It passes under the interpreter.

--------------------------------------------------------------------------------

On 2014-10-19T00:07:40Z, PeterWAWood, commented:
<https://github.com/red/red/issues/959#issuecomment-59634505>

    I wasn't actually using the latest commit. I've now updated and get the compiler error. It seems that it must have been introduced with the latest commit.
    
    It still passes in the interpreter.

