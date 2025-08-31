
#73: Multiple castings not effectively forbidden, and non-existing types allowed.
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/73>

The following program compiles OK:

```
p: as [pointer! [integer!]] as integer! null
```

What is worse,

```
p: as [pointer! [integer!]] as nonsense! null
```

compiles also!



Comments:
--------------------------------------------------------------------------------

On 2011-06-04T10:21:05Z, dockimbel, commented:
<https://github.com/red/red/issues/73#issuecomment-1301259>

    Added fix for both cases:
    - catching multiple casting case on assignement 
    - raising a compilation error on invalid type casting
    
    Tested OK.

