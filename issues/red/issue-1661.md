
#1661: When a face is the reaction source of 2 or more faces, trying to remove a reaction relation will cause some unpredictable result.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/1661>

When an face is the reaction source of 2 or more faces, trying to remove a reaction relation will cause some unpredictable result, because the reaction table only index the reaction source, and removing a reaction only need to indicate the source. We have no way to indicate which relation should be removed.



Comments:
--------------------------------------------------------------------------------

On 2016-06-28T11:37:39Z, dockimbel, commented:
<https://github.com/red/red/issues/1661#issuecomment-229024561>

    The reactive API has been improved and now supports more accurate removal of a given reaction. See http://doc.red-lang.org/reactivity.html

