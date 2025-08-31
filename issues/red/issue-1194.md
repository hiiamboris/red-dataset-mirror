
#1194: RETURN_NONE does EXIT, and RETURN_UNSET does not
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1194>

In `%runtime/natives.reds` these two `#defines` perform similar functions. As it happens, `RETURN_UNSET` is always used as last statement in the execution flow in a function, thus `exit` is not required,. But this is clearly accidental, and could give a problem if `RETURN_UNSET` were used in another position in the exectution flow.



Comments:
--------------------------------------------------------------------------------

On 2015-05-31T14:21:41Z, dockimbel, commented:
<https://github.com/red/red/issues/1194#issuecomment-107194756>

    RETURN_UNSET definition is removed, as it is used once only.

