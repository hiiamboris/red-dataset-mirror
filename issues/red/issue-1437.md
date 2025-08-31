
#1437: most faces ignore font color
================================================================================
Issue is open, was reported by WiseGenius and has 8 comment(s).
[status.reviewed] [type.review] [GUI]
<https://github.com/red/red/issues/1437>

Only the following acknowledge the `color` of their `font`:
- `draw` text.
- `'base` face text.
- `'button` face text.

Although they are affected by their `font`'s `name`, `size` and `style`, the following faces display their text as black regardless of their `font`'s `color`:
- `'text`
- `'field`
- `'area`
- `'text-list`
- `'drop-list`
- `'drop-down`
- `'check`
- `'radio`
- `'tab-panel`



Comments:
--------------------------------------------------------------------------------

On 2015-11-17T03:33:34Z, WiseGenius, commented:
<https://github.com/red/red/issues/1437#issuecomment-157257673>

    `'tab-panel` is the only face left from the previous list which still does not display the correct color, either when set with `font` in VID, or setting the face's `font` directly.
    
    `'group-box` ignores all font instruction.
    
    Setting `font-color` in a VID block is ignored by all faces.

--------------------------------------------------------------------------------

On 2015-11-18T02:04:18Z, qtxie, commented:
<https://github.com/red/red/issues/1437#issuecomment-157573086>

    `'drop-list` is also not perfect when setting font color.

--------------------------------------------------------------------------------

On 2015-11-18T09:36:27Z, WiseGenius, commented:
<https://github.com/red/red/issues/1437#issuecomment-157657127>

    Also, `base` is the only type of face whose text is affected by the opacity of its `font` `color`.

--------------------------------------------------------------------------------

On 2015-11-18T09:56:38Z, WiseGenius, commented:
<https://github.com/red/red/issues/1437#issuecomment-157662000>

    @qtxie It seems `drop-list`'s text color is displayed correctly on Windows XP but remains black on Windows 7. _(That is, when displaying the currently selected option in the main area. The color of the items in the dropped list seem to display the correct color on both OSes.)_

