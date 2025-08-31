
#2566: Conversion matrices allow make series! any-float!, but compiler disallows percent!
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [type.documentation]
<https://github.com/red/red/issues/2566>

E.g. `make block! 20.0` is allowed and interpreted like `make block!  20`, but `make block! 200%` is not interpreted as `make block! 2` but is an error. 


Comments:
--------------------------------------------------------------------------------

On 2017-07-28T16:39:36Z, dockimbel, commented:
<https://github.com/red/red/issues/2566#issuecomment-318702808>

    `make <series> <percent!>` makes no sense, so it is disallowed.

