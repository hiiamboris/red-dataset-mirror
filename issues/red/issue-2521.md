
#2521: trim is not defined for all types in its function header
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2521>

The function header says the argument can be `[series! object! error! map!]`. In reality, trim is defined ONLY for `string!` `block!` and `hash!`.


Comments:
--------------------------------------------------------------------------------

On 2017-06-19T07:01:07Z, dockimbel, commented:
<https://github.com/red/red/issues/2521#issuecomment-309355427>

    That was left for future implementation.

