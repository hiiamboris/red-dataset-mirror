
#2390: `to-error` doesn't work at all
================================================================================
Issue is closed, was reported by maximvl and has 2 comment(s).
<https://github.com/red/red/issues/2390>

`to-error` raises exception that `to` cannot accept `error!` as value:
```
red>> to-error 5
*** Script Error: to does not allow error! for its type argument
*** Where: to
red>> source to-error
to-error: func ["Convert to error! value" value][to error! :value]
red>> 
```
I suggest either to allow `error!` argument to `to` or remove `to-error` shortcut.


Comments:
--------------------------------------------------------------------------------

On 2016-12-31T15:25:48Z, maximvl, commented:
<https://github.com/red/red/issues/2390#issuecomment-269869647>

    Closing this as duplicate of #2389 

