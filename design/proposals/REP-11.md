
#11: WISH: refinement /hide on ASK and INPUT
================================================================================
Issue is open, was reported by meijeru and has 2 comment(s).
[Wish]
<https://github.com/red/REP/issues/11>

This is based on Red issue red/red#1994, now closed.
It is in analogy with R3 (where the implementation is defective, though). The effect is to replace the echo'ed characters by * or similar. Typical application: input of passwords.

Comment on #1994 was:
The current implementations of `ask` and `input` are temporary until we get proper I/O support in 0.7.0, so I doubt we'll implement this feature before 0.7.0.


Comments:
--------------------------------------------------------------------------------

On 2018-10-23T20:14:34Z, meijeru, commented:
<https://github.com/red/REP/issues/11#issuecomment-432401949>

    A related wish is to have this effect on input fields in GUI. That has been implemented now by commit 08dabaa.

