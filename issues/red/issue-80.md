
#80: The pseudo-type function![...] has been generalized to apply to local variables and return type
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/80>

Everywhere in a function's spec-block one can have the `function![...]` now. Is this a conscious design decision? At first sight, it does no harm.



Comments:
--------------------------------------------------------------------------------

On 2011-06-08T19:06:02Z, dockimbel, commented:
<https://github.com/red/red/issues/80#issuecomment-1329047>

    This is an implementation side-effect that need to be fixed.

--------------------------------------------------------------------------------

On 2011-06-08T20:17:59Z, dockimbel, commented:
<https://github.com/red/red/issues/80#issuecomment-1329549>

    `function! [...]` is no only allowed in imports and syscalls definitions.
    
    Tested OK.

