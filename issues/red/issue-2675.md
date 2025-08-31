
#2675: char! pair!  or tuple!  value + a vector is a NO-OP
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.deferred] [status.built] [type.review]
<https://github.com/red/red/issues/2675>

These operations are allowed, but they have no effect; the result is the vector value unchanged. The converse (adding a vector to a char! value etc.) is explicitly forbidden.


Comments:
--------------------------------------------------------------------------------

On 2017-06-07T08:29:15Z, dockimbel, commented:
<https://github.com/red/red/issues/2675#issuecomment-306727044>

    Those operations are not yet implemented. A suitable error is now displayed if such operations are attempted.

