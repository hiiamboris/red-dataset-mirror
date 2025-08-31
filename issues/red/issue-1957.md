
#1957: REFLECT not defined on string! vector! binary! and hash!
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1957>

The `reflect` action is defined on `series!` values (for the `owned` property only). This is then inherited for values of type `block!`, `paren!`, `any-path!`. Question: why is it not defined on values of type `string!`, `vector!`, `binary!` and possibly `hash!`?



Comments:
--------------------------------------------------------------------------------

On 2018-08-21T19:31:01Z, meijeru, commented:
<https://github.com/red/red/issues/1957#issuecomment-414794304>

    As per the comments on the above-referenced commit (6f06015), this could have been inherited also by `vector! binary!` and `hash!`.

