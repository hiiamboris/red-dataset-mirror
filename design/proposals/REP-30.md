
#30: WISH: AS should work among any-object! types
================================================================================
Issue is open, was reported by meijeru and has 0 comment(s).
<https://github.com/red/REP/issues/30>

The typeset `any-object!` comprises `object!`, `error!` and `port!`. Since values of these types are similarly stored, the application of `as` should be easy to implement. This enhancement would be consistent with the approach that `as` works between all types from a given typeset (so far `any-string!` and `any-block!`) that are similarly stored, so that `as` just has to change the type number.


