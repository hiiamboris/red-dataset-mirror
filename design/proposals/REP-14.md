
#14: WISH: index? and context? could be allowed on refinement! and possibly issue!
================================================================================
Issue is open, was reported by meijeru and has 2 comment(s).
[Wish]
<https://github.com/red/REP/issues/14>

This issue is based on Red issue red/red#2618, now closed and partially superseded.

`index?` is currently allowed on `any-word!` values and yields the index in the context. There is no reason
why it should not be allowed on `refinement!` and possibly `issue!` values. The latter is dependent on the final determination of the nature of `issue!`, of course.

The same wish goes for `context?`.


Comments:
--------------------------------------------------------------------------------

On 2018-08-21T18:48:06Z, meijeru, commented:
<https://github.com/red/REP/issues/14#issuecomment-414781882>

    I realize now that refinements and issues do not have a context (are not bindable) and therefore this request is moot. If @dockimbel confirms that this will also be the case in future, this Wish may be closed.

