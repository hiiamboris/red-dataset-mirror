
#2384: to-tuple on floats
================================================================================
Issue is closed, was reported by maximvl and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2384>

`to-tuple` allows floats, but converts them into zeros:
```
red>> to-tuple [1.0 2 3.5]
== 0.2.0
```
In same time other types raise exception:
```
red>> to-tuple [1 a 2]
*** Script Error: cannot MAKE/TO tuple! from: [1 a 2]
*** Where: to
```

I suggest to raise exception on `float!` values too.


Comments:
--------------------------------------------------------------------------------

On 2017-02-15T08:23:12Z, dockimbel, commented:
<https://github.com/red/red/issues/2384#issuecomment-279946186>

    Actually, supporting float values (rounding them to integers) would be helpful when, e.g., calculating RGB/A color values and getting float values as result of the calculation (often the case).
    
    The above results are caused by a missing type checking, giving corrupted results.

--------------------------------------------------------------------------------

On 2017-02-15T09:32:20Z, dockimbel, commented:
<https://github.com/red/red/issues/2384#issuecomment-279961070>

    Now `float!` and `char!` values are supported too in the spec block.

