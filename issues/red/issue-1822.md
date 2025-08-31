
#1822: `show` not updating face with changes to draw facet
================================================================================
Issue is closed, was reported by mydoghasworms and has 8 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/1822>

`show` is not updating a face where the draw facet has been changed.

Sample code:

```
Red [needs: 'view]
l: layout [
  tf: panel white 200x200 draw [box 20x20 30x30]
  return
  button "Test" [append tf/draw [box 40x40 50x50] probe tf/draw show tf]
]
view l
```

After pressing the button in the example, the draw facet is update, but following `show`, nothing changes.

(I would have expected that a change to the draw facet automatically results in an update, but even after `show` this does not happen).



Comments:
--------------------------------------------------------------------------------

On 2016-04-18T13:23:08Z, dockimbel, commented:
<https://github.com/red/red/issues/1822#issuecomment-211376971>

    If you replace `panel` with `base`, it works fine. I don't think we support drawing on panels bakground yet. @qtxie Can this be easily supported?

--------------------------------------------------------------------------------

On 2016-04-18T14:29:00Z, qtxie, commented:
<https://github.com/red/red/issues/1822#issuecomment-211404157>

    If we support drawing on panels, so what is the difference between `panel` and `base` face?
    `panel` is just a container in my opinion. `base` is for drawing, so it can be a base of making custom control, also can be used as a canvas.

--------------------------------------------------------------------------------

On 2016-04-19T04:18:21Z, mydoghasworms, commented:
<https://github.com/red/red/issues/1822#issuecomment-211722878>

    Sorry, my bad.
    After your comments, I see now in the documentation that it says that `base` is to be used for custom graphic implementation. So unless there is a use case for drawing on anything else like a panel, I guess you may as well close this issue.

--------------------------------------------------------------------------------

On 2016-04-19T05:24:58Z, dockimbel, commented:
<https://github.com/red/red/issues/1822#issuecomment-211732762>

    @qtxie Actually, I would be glad if we could define a Panel from a Base face, though, we would have rendering issues I guess, so we can keep them separated for now.

