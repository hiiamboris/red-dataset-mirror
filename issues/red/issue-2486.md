
#2486: molded handle! value cannot be loaded
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.deferred]
<https://github.com/red/red/issues/2486>

`mold/all` on a handle! value produces `"#[handle! <integer>]"`. Generally, molded values are intended to be loadable, this one is not.


Comments:
--------------------------------------------------------------------------------

On 2017-03-21T07:03:34Z, dockimbel, commented:
<https://github.com/red/red/issues/2486#issuecomment-287993439>

    Contruction syntax is not supported yet. Only a few basic types have some support or partial support. Do not use unsupported cases.

