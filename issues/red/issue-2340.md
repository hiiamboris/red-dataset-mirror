
#2340: TYPE_ANY_BLOCK and ANY_BLOCK? as defined in macros.reds are missing hash!
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2340>

TYPE_ANY_LIST *does* include hash!
I don't know if this is on purpose, but in any case, the following gives an error:
```
red>> as hash! [1 2]
*** Script Error: cannot coerce hash! to block!
*** Where: as
```

It is true that one can always do `make/to hash! [1 2]` and even use `to-hash` but for the other members of `any-block!` there is the additional facility of `as`, so why not for `hash!` ?



Comments:
--------------------------------------------------------------------------------

On 2016-11-18T12:05:09Z, qtxie, commented:
<https://github.com/red/red/issues/2340#issuecomment-261516862>

    What I understand is that hash! is a hashtable, we just put a layer on it to make it _feel like_ a series.

--------------------------------------------------------------------------------

On 2016-11-18T12:27:34Z, meijeru, commented:
<https://github.com/red/red/issues/2340#issuecomment-261520627>

    But in `%environment/scalars.red`, `any-block!` is defined as containing `hash!` so one should include it in order not to confuse. The `#defines` in the `.reds` code should be compatible with the definitions in the `.red` code.   

--------------------------------------------------------------------------------

On 2016-11-18T15:25:47Z, dockimbel, commented:
<https://github.com/red/red/issues/2340#issuecomment-261558523>

    @qtxie It's the opposite, `hash!` is a block with a hidden hashtable, that's how users should see it. All the API and semantics of hash are identical with the ones of block. 
    
    @meijeru `as hash!` cannot work, because coercion (or type casting) only flips the bits encoding the type, which requires an identical implementation for the types to be compatible. Hash! and block! have different implementations, so can't be transformed that way, they require conversion using `to`.

--------------------------------------------------------------------------------

On 2016-11-18T15:45:59Z, dockimbel, commented:
<https://github.com/red/red/issues/2340#issuecomment-261563847>

    I have added TYPE_HASH where due.

