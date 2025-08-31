
#1527: Changing TAB-PANEL's offset does not change tab's content offset
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1527>

Check this code for an example:

```
Red [
    Needs: 'View
]

win: layout [
    below
    button "Move tab" [
        t/offset/x: t/offset/x + 100
        show win
    ]
    t: tab-panel 200x100 ["Tab 1" [text "panel to hide"]]
]
view win
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-03T03:22:10Z, dockimbel, commented:
<https://github.com/red/red/issues/1527#issuecomment-178979807>

    Fixed by fix for #1559.

