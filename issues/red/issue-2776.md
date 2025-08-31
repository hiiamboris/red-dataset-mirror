
#2776: char + percent is forbidden, but vector of char + percent is allowed
================================================================================
Issue is open, was reported by meijeru and has 2 comment(s).
[type.review]
<https://github.com/red/red/issues/2776>

Since the latest streamlining of the math-ops, the `char!`  elements of a `vector!` value can have a `percent!`  value added to them. But individual `char!` values cannot have this. That seems an omission.


Comments:
--------------------------------------------------------------------------------

On 2017-06-10T10:17:46Z, meijeru, commented:
<https://github.com/red/red/issues/2776#issuecomment-307556198>

    OR, you forbid vector of char  + percent, just to stay consistent...

