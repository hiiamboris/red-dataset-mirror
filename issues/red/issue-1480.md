
#1480: In VID, it does not seem possible to set the (background) color of the window itself
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1480>

The keyword `color` is not accepted at the highest level of the VID dialect block, nor is a `tuple!` literal.



Comments:
--------------------------------------------------------------------------------

On 2016-02-02T02:41:06Z, dockimbel, commented:
<https://github.com/red/red/issues/1480#issuecomment-178323912>

    Use `backdrop <value>` where the argument can be a color or an image. Should work for a panel and a window (though the `image` facet support for windows is not implemented yet <-- @qtxie).

