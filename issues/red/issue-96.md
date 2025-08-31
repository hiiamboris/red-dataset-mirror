
#96: null is not null
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/96>

The variable `null` is defined as `pointer [integer!]`. Currently this means that `0 <> as-integer null`. In order to have a real _null_ pointer, one should define `null: as [pointer! [integer!]] 0`, I think. 



Comments:
--------------------------------------------------------------------------------

On 2011-06-14T11:35:35Z, dockimbel, commented:
<https://github.com/red/red/issues/96#issuecomment-1365378>

    `null` handling is a pending issue that is probably best solved by turning it back to a keyword (needs some time to dig this further).

--------------------------------------------------------------------------------

On 2011-06-14T16:54:26Z, meijeru, commented:
<https://github.com/red/red/issues/96#issuecomment-1367423>

    It depends whether you want to give `null` the same status as `true` and `false`. Null pointers play a big role in certain algorithms (e.g.linked lists) but ideally, the null pointer should be polymorphic (valid for any pointer/struct type). Since that is not possible in Red/System, I could envisage a built-in polymorphic function `null?`, which basically tests `0 = as-integer x` (this could even be a `#define`), and make the null value for any type by `as <type> 0`

--------------------------------------------------------------------------------

On 2011-06-19T20:29:03Z, meijeru, commented:
<https://github.com/red/red/issues/96#issuecomment-1398796>

    Great to see that you could make `null` a polymorphic constant (or parameterless function, or whatever). But since you require the two operands of `=` and `<>` to have the same type, I suspect that you cannot test `p = null`, or am I mistaken? 

--------------------------------------------------------------------------------

On 2011-06-19T20:57:12Z, dockimbel, commented:
<https://github.com/red/red/issues/96#issuecomment-1398894>

    `=` and `<>` are polymorphic as well, so type compatibility is resolve dynamically. See the new test file for `null`: [null-test.reds](https://github.com/dockimbel/Red/blob/master/red-system/tests/source/units/null-test.reds)

--------------------------------------------------------------------------------

On 2011-06-19T21:16:46Z, dockimbel, commented:
<https://github.com/red/red/issues/96#issuecomment-1399057>

    By the way, type casting on `null` is not possible anymore (would raise a compiler error). I will document it in the specification. I think it is safer that way, but I have not explored all possible use cases. Do you think it is an issue?

--------------------------------------------------------------------------------

On 2011-06-19T21:21:50Z, meijeru, commented:
<https://github.com/red/red/issues/96#issuecomment-1399073>

    Off-hand I would say the current approach covers every need (assignment and [in]equality test).

