
#2990: save handles function values incorrectly
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2990>

`save` applies `mold/only` in order to yield a string that can be `load`ed back. For a function value, it applies `mold/only` also to spec and body, and this omits the outer brackets of both, so that `load` cannot handle it. 
```
>> f: func [ ][ ]
== func [ ][ ]
>> save %file.red :f
>> read %file.red
== "func"  ;; was "func " before trimming - the two blocks have disappeared
>> mold :f
== "func [ ][ ]"  ;; mold without /only will work
```



Comments:
--------------------------------------------------------------------------------

On 2017-09-14T06:49:47Z, dockimbel, commented:
<https://github.com/red/red/issues/2990#issuecomment-329389972>

    The issue is in `mold/only` when applied to a `function!` value:
    ```
    >> mold/only func [][]
    == "func "
    ```
    Only the outer brackets should be removed by `/only`, not the nested ones.

