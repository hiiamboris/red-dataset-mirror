
#53: residual problem in type-casting
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/53>

Compiling the following program

```
f: func [i [integer!]][]
i: as integer! #"A"
f i
```

results in

```
*** Compilation Error: argument type mismatch on calling: f
*** expected: [integer!], found: [byte!]
```

Compiling a very similar program

```
f: func [i [integer!]][]
f as integer! #"A"
```

gives no error



Comments:
--------------------------------------------------------------------------------

On 2011-05-24T17:37:27Z, dockimbel, commented:
<https://github.com/red/red/issues/53#issuecomment-1229918>

    Tested OK.

