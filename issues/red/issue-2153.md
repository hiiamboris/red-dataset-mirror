
#2153: Parens aren't allowed in function's argument block.
================================================================================
Issue is closed, was reported by ifgem and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2153>

**Red:**

```
test: func [a b (wow)] [] =>
*** Script Error: invalid function definition: (wow)
*** Where: func
```

**Rebol:**

```
test: func [a b (wow)] []
spec-of :test => [a b (wow)]
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-05T08:07:53Z, meijeru, commented:
<https://github.com/red/red/issues/2153#issuecomment-237783592>

    Who is wrong here: Rebol or Red???

--------------------------------------------------------------------------------

On 2016-08-05T08:30:04Z, dockimbel, commented:
<https://github.com/red/red/issues/2153#issuecomment-237787810>

    Functions in Red do not allow paren! value in spec blocks. Rebol2's behavior is bogus, Rebol3 correctly reports an error, as Red does.

