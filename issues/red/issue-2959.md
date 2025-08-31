
#2959: Improvement of REDUCE (#2947) should also apply to COMPOSE
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.resolved]
<https://github.com/red/red/issues/2959>

```
>> reduce :now
== make native! ...
>> compose :now
== 2-Aug-2017/21:54:11+02:00
```



Comments:
--------------------------------------------------------------------------------

On 2019-08-19T20:45:20Z, dockimbel, commented:
<https://github.com/red/red/issues/2959#issuecomment-522746648>

    Currently:
    ```
    >> compose :now
    *** Script Error: compose does not allow native! for its value argument
    *** Where: compose
    *** Stack:
    ```
    which I think is fine, as `compose` is not meant to be a pass-thru like `reduce`.

