
#296: Inconsistency in pointer type syntax
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/296>

I see in the compiler:

```
pointer-syntax: ['integer! | 'byte! | 'float32! | 'float64! | 'float!]
```

The `float64!` synonym is allowed, but the `int32!` and `uint8!` synonyms are not.



Comments:
--------------------------------------------------------------------------------

On 2012-11-08T12:05:12Z, dockimbel, commented:
<https://github.com/red/red/issues/296#issuecomment-10185521>

    ìnt32!`and`uint8!` are not part of the official Red/System specification anymore, see #283.

--------------------------------------------------------------------------------

On 2012-11-08T12:55:07Z, meijeru, commented:
<https://github.com/red/red/issues/296#issuecomment-10186906>

    I must be getting old, did not remember my earlier issue. Sorry!

--------------------------------------------------------------------------------

On 2012-11-08T15:40:53Z, dockimbel, commented:
<https://github.com/red/red/issues/296#issuecomment-10192320>

    No problem! :-)

