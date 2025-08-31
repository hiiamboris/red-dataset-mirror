
#1190: Unused code in %block.reds?
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/1190>

I wonder if the function `append*` in `%block.reds` is needed. It looks as if the `append` action is handled differently, via `insert`. 



Comments:
--------------------------------------------------------------------------------

On 2015-05-31T13:50:58Z, dockimbel, commented:
<https://github.com/red/red/issues/1190#issuecomment-107187388>

    It is used in %runtime/natives.reds at line 754.

--------------------------------------------------------------------------------

On 2015-05-31T14:19:13Z, meijeru, commented:
<https://github.com/red/red/issues/1190#issuecomment-107194096>

    Why not use actions/append\* there?

--------------------------------------------------------------------------------

On 2015-06-02T05:48:51Z, dockimbel, commented:
<https://github.com/red/red/issues/1190#issuecomment-107816273>

    Because it is optimized for the general case (no `/into` option), `block/append*` is way more faster than `actions/append*`.

