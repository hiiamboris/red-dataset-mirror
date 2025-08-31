
#294: system/alias and system/words not treated consistently
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [Red/System]
<https://github.com/red/red/issues/294>

Both `system/alias` and `system/words` are caught by the compiler and translated into the appropriate accesses (see `system-reflexion?`). However, only `alias` is defined as a field of the `system` structure, while `word` is not.



Comments:
--------------------------------------------------------------------------------

On 2012-11-06T22:12:19Z, dockimbel, commented:
<https://github.com/red/red/issues/294#issuecomment-10129998>

    You are nitpicking :-), but as it is only a single line to add, I will add it. Remember that Red/System current implementation does not need to be perfect as it will be replaced next year by an (almost totally) different implementation.

