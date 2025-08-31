
#2699: exp function with percent! argument gives wrong result
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/2699>

`exp`  has a `number!` argument, thus `percent!` should be allowed.
```
>> exp 100%
== 1.0    ;; <--- should be e = 2.718281828459045
```
I think that all mathematical actions could be usefully reviewed for checking for TYPE_PERCENT in addition to TYPE_FLOAT


Comments:
--------------------------------------------------------------------------------

On 2017-05-20T13:45:37Z, meijeru, commented:
<https://github.com/red/red/issues/2699#issuecomment-302874172>

    In this case, it seems to be `argument-as-float` in `%runtime/natives.reds`

--------------------------------------------------------------------------------

On 2017-05-24T17:14:49Z, greggirwin, commented:
<https://github.com/red/red/issues/2699#issuecomment-303791082>

    Does it make sense to support percent values with `exp`, or should the type spec be changed instead? 

--------------------------------------------------------------------------------

On 2017-07-29T09:00:53Z, dockimbel, commented:
<https://github.com/red/red/issues/2699#issuecomment-318815314>

    We should not support percent! for trigonometric functions.

--------------------------------------------------------------------------------

On 2017-07-29T17:52:16Z, greggirwin, commented:
<https://github.com/red/red/issues/2699#issuecomment-318847223>

    See also: https://github.com/red/red/issues/2586

--------------------------------------------------------------------------------

On 2022-09-16T17:56:08Z, dockimbel, commented:
<https://github.com/red/red/issues/2699#issuecomment-1249647120>

    Fixed by the fix for #2586.

