
#69: alias definition allowed inside conditional statement
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/69>

In analogy with the function definition case, one should perhaps disallow this too. In any case, the program

```
either true [str!: alias struct! [i [integer!]]][str!: alias struct! [b [byte!]]] s: struct str! s/i: 0
```

compiles alright, but changing `s/i: 0` into `s/b: #"A"` gives a crash.



Comments:
--------------------------------------------------------------------------------

On 2011-06-02T21:33:16Z, dockimbel, commented:
<https://github.com/red/red/issues/69#issuecomment-1285066>

    A proper compilation error will now be raised if ALIAS is not used at root level (global context or function context).
    Tested OK.

