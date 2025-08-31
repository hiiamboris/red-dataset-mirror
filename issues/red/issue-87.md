
#87: Value of pseudo-type function![...] can be cast to byte! and logic!
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/87>

This seems to be in contradiction with the (sensible) condition that the target type for "address" values should be 4 bytes large.



Comments:
--------------------------------------------------------------------------------

On 2011-06-09T14:49:54Z, dockimbel, commented:
<https://github.com/red/red/issues/87#issuecomment-1334687>

    Good catch, the type casting matrix in the specification needs to be extended to take function! into account.

--------------------------------------------------------------------------------

On 2011-06-20T18:13:51Z, dockimbel, commented:
<https://github.com/red/red/issues/87#issuecomment-1404581>

    Tested OK.

