
#2766: routine argument without type specified sometimes leads to compilation error
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.resolved]
<https://github.com/red/red/issues/2766>

This occurs notably when the routine is not invoked within the program. A use case for that would be the definition of an `op` as derived from a routine: in that case the routine itself is never explicitly invoked.

The semantics should of course always be: no type => any-type.


Comments:
--------------------------------------------------------------------------------

On 2017-10-10T10:44:10Z, dockimbel, commented:
<https://github.com/red/red/issues/2766#issuecomment-335433713>

    Any-type! is now enforced by the compiler if no type is provided by the user.

