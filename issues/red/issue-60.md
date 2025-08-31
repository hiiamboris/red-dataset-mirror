
#60: problem with exit
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/60>

```
f: func [return: [integer!]][if true [exit]]
```

Inspecting the compiler, the local variable ret is not always set on return from comp-exit. But then again, this may have nothing to do with it....



Comments:
--------------------------------------------------------------------------------

On 2011-06-01T13:23:49Z, dockimbel, commented:
<https://github.com/red/red/issues/60#issuecomment-1274267>

    A compilation error will be raised now in such case.
    Tested OK.

