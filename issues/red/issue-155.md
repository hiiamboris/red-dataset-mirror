
#155: Pointer arithmetic: a consequence
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/155>

The rules for pointer arithmetic, combined with the rules for type-casting, have the following consequence, which is something of a gotcha:

```
p: declare pointer! [integer!]
print p + 1 - p ; gives 4 instead of 1
```

Seen otherwise, it is a way of discovering the size of an integer :-) 



Comments:
--------------------------------------------------------------------------------

On 2011-08-16T13:47:32Z, dockimbel, commented:
<https://github.com/red/red/issues/155#issuecomment-1816331>

    This is the intended behavior. I understand that it could look odd if taken out of context, but in Red/System, it is correct. Pointers have specific arithmetic rules described in the specification.

