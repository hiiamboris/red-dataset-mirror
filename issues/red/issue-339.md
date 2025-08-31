
#339: Red documentation: where are "typesets" currently defined?
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/339>

I am trying to formulate some docstrings for actions, but I am stuck at finding out where `number!` is defined, and what it means. I suspect it means `[integer! char!]` analogous to `number! = [byte! integer!]` in Red/System. But - as I said - I have not found this definition in the sources. Where should I look?



Comments:
--------------------------------------------------------------------------------

On 2012-12-12T22:03:35Z, dockimbel, commented:
<https://github.com/red/red/issues/339#issuecomment-11311830>

    `Number!` is not defined yet as typesets support has not been yet implemented. It should be more like: `number! = [integer! real! decimal!]` (`real!` or `float!` for floating point numbers, `decimal!` for BCD numbers).

--------------------------------------------------------------------------------

On 2012-12-12T23:03:22Z, meijeru, commented:
<https://github.com/red/red/issues/339#issuecomment-11314241>

    But currently, `add` is defined for `number!` arguments and the implementation of `add` recognizes integers and chars, not floats.

--------------------------------------------------------------------------------

On 2012-12-12T23:07:02Z, dockimbel, commented:
<https://github.com/red/red/issues/339#issuecomment-11314363>

    Good point, I would need to add `char!` to math operators specification block.
    
    FYI, the argument type-checking is not yet implemented, so those datatypes are not yet verified at compile-time nor at run-time. I am waiting for typeset! and error! datatypes to be implemented first to implement the type checker.

--------------------------------------------------------------------------------

On 2012-12-13T10:10:55Z, meijeru, commented:
<https://github.com/red/red/issues/339#issuecomment-11329103>

    My promise to provide some docstrings for actions and natives (which are mostly polymorphic) might have to wait until typesets are there, then.

