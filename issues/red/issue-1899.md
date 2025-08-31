
#1899: WISH: be able to indicate Safety? and Idempotency? notes in function spec block
================================================================================
Issue is closed, was reported by JenniferLee520 and has 4 comment(s).
<https://github.com/red/red/issues/1899>

I would like to indicate or to know a function is safe/Idempotent or not. 

``` Red
my-func: function [ a b /safe /Idempotent  ] [ ... ]
```



Comments:
--------------------------------------------------------------------------------

On 2016-05-12T17:06:02Z, dockimbel, commented:
<https://github.com/red/red/issues/1899#issuecomment-218821742>

    Put it in a docstring inside the spec block? You can use a special syntax/convention to make it parsable in case you need that:
    
    ```
    my-func: function ["#safe #idempotent" a b ] [ ... ]
    ```

--------------------------------------------------------------------------------

On 2016-05-13T01:18:23Z, JenniferLee520, commented:
<https://github.com/red/red/issues/1899#issuecomment-218928911>

    Thanks. That's a good idea. this Ticket can be closed.

