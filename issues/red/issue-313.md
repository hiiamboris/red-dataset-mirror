
#313: Red refinement handling not complete
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/313>

I compiled `'f: func[/a /b][ ] f f/a f/b f/a/b`  just to see the Red/System code. When both refinements are absent, two values `false` are pushed on the stack. When one refinement is present, only one value `true` is pushed, and NOT a value `false` to account for the other refinement.  When both refinements are present, two values `true` are pushed.



Comments:
--------------------------------------------------------------------------------

On 2012-11-22T21:20:20Z, dockimbel, commented:
<https://github.com/red/red/issues/313#issuecomment-10645262>

    Good catch!

--------------------------------------------------------------------------------

On 2012-11-22T21:51:39Z, dockimbel, commented:
<https://github.com/red/red/issues/313#issuecomment-10645793>

    Indeed, "not complete" is accurate in this case, as there was many leftovers from older implementation with some unfinished parts. Thanks for digging that up.

