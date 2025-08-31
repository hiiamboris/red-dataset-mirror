
#52: dereferenced pointer not accepted as integer argument in function call
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/52>

I was curious if the type of a dererenced pointer is indeed integer. Apparently there is still some bug...

```
f: func [i[integer!]][] p: pointer [integer!] f p/value
```

error:

```
-= Red/System Compiler =-
*** Compilation Error: argument type mismatch on calling: f
*** expected: [integer!], found: [pointer!]
```



Comments:
--------------------------------------------------------------------------------

On 2011-05-24T11:16:17Z, dockimbel, commented:
<https://github.com/red/red/issues/52#issuecomment-1227513>

    Tested OK.

--------------------------------------------------------------------------------

On 2011-05-24T17:36:03Z, dockimbel, commented:
<https://github.com/red/red/issues/52#issuecomment-1229909>

    Just an additional comment about the code example: p/value will crash the compiled program at runtime as 'p is initialized at 0.

