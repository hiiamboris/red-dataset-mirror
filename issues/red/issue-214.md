
#214: Compilation error
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
<https://github.com/red/red/issues/214>

I compiled the following skeleton program:

```
Red/System []
f: func [
    res [pointer! [integer!]]
    return: [integer!]
    /local
        res0            ; start of result
][
    res0: res
    ; do something with res0
    res - res0
]
```

and got the following error, which is not justified, I think:

```
-= Red/System Compiler =-
Compiling tests/bug.reds ...
*** Compilation Error: wrong return type in function: f
*** expected: [integer!], found: [pointer! [integer!]]
*** in file: %tests/bug.reds
*** in function: f
*** at line: 10
*** near: [-
    res res0
]
```



Comments:
--------------------------------------------------------------------------------

On 2012-03-17T16:20:46Z, meijeru, commented:
<https://github.com/red/red/issues/214#issuecomment-4555081>

    Sorry, this was a misunderstanding.

