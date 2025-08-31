
#1462: text face cannot be dragged
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1462>

`text` is currently the only type of face which cannot be dragged when its `options` are set to `[drag-on: 'down]`.



Comments:
--------------------------------------------------------------------------------

On 2016-01-15T11:26:15Z, dockimbel, commented:
<https://github.com/red/red/issues/1462#issuecomment-171937815>

    `text` is supposed to be a static widget. For moving texts, you should rather use a `base` face.

