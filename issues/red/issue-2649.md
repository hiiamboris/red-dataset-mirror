
#2649: Two unset! values are not the same
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2649>

`same? () do [ ]` yields `false` even though both `( )` and `do [ ]` yields the unset value.
If this is intended, it should be documented. Note that two `none` values are testing positive for `same?`


Comments:
--------------------------------------------------------------------------------

On 2017-05-05T05:15:49Z, dockimbel, commented:
<https://github.com/red/red/issues/2649#issuecomment-299376887>

    ```
    >> same? () ()
    == false
    ```
    Obviously a bug.

