
#84: Check on variable initialization is not only done at highest statement level 
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/84>

Compiling

```
if false [s: 1] print form s
```

one gets the result `1`, and no complaint about lack of initialization. I would submit that initialization should be checked only with assignments that occur as direct (first-level) elements of a program or function body. 



Comments:
--------------------------------------------------------------------------------

On 2011-06-20T17:07:17Z, dockimbel, commented:
<https://github.com/red/red/issues/84#issuecomment-1404109>

    Such code will now raise a compilation error.
    
    Tested OK.

