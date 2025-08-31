
#1594: Cannot call a function with unset! value
================================================================================
Issue is closed, was reported by endo64 and has 2 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1594>

Functions that can take unset! parameters cannot be called from Red/Console.

```
red>> g: does []
red>> f: function [x [unset!]] ['ok]
red>> f g
== ok
red>> f
*** Script error: f is missing its x argument
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-05T04:49:58Z, dockimbel, commented:
<https://github.com/red/red/issues/1594#issuecomment-180197313>

    In Red, if you want to be able to do that, you need to use a quoted word and `[any-type!]` type spec:
    
    ```
    red>> g: does []
    == func [][]
    red>> f: function ['x [any-type!]] ['ok]
    == func ['x [any-type!]]['ok]
    red>> f g
    == ok
    red>> f
    == ok
    ```

