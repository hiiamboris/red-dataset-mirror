
#88: Struct can have zero fields
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/88>

The expression `struct [ ]` is currently completely legal. Is there any employ for such values?



Comments:
--------------------------------------------------------------------------------

On 2011-06-09T19:14:07Z, dockimbel, commented:
<https://github.com/red/red/issues/88#issuecomment-1336496>

    No, it is a bug.

--------------------------------------------------------------------------------

On 2011-06-09T20:13:41Z, dockimbel, commented:
<https://github.com/red/red/issues/88#issuecomment-1336879>

    An `invalid struct syntax` compilation error is now raised for empty struct definitions.
    
    Tested OK.

