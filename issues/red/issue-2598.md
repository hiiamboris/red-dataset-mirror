
#2598: `eval-set-path` error on inserting a tab panel
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2598>

```
Red [Needs: 'View]

detail-tab: first layout/only [panel [text "hello"]]

toggle-detail: function [state [logic!]][
    either state [
        insert at tabs/data 2 "Detail"
        insert at tabs/pane 2 detail-tab
    ][
        remove at tabs/data 2
        detail-tab: tabs/pane/2
        remove at tabs/pane 2
    ]
]

view [
    tabs: tab-panel [
        "General" [check "Detail" [toggle-detail face/data]]
        "Tags"      []
    ]
]
```


Comments:
--------------------------------------------------------------------------------

On 2017-04-19T05:56:41Z, dockimbel, commented:
<https://github.com/red/red/issues/2598#issuecomment-295107697>

    `detail-tab` is captured as a local word in `toggle-detail`, so using `func` constructor instead of `function` is the correct fix. Though, the View engine should be more robust when inserting `none` values in panes.

