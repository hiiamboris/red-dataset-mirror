
#1671: Drag&drop problems
================================================================================
Issue is closed, was reported by rebolek and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1671>

See this code:

```
Red [
    Needs: 'View
]

system/view/auto-sync?: no

extend styles [
    cbase: [
        template: [
            type: 'base size: 100x50 color: red
            options: [drag-on: 'down]
            actors: object [
                on-drag-start: func [f e] [f/color: yellow show f]
                on-drag: func [f e] [print "drag"]
                on-drop: func [f e] [f/color: red show f]
            ]
        ]
    ]
]

view [cbase "base"]
```

This code shows two problems (on some systems, confirmed by me (W7 VM) and @Pekr (W10), @dockimbel can’t replicate it (W7)):

1) `on-drag` doesn’t work - "drag" is not printed
2) the face disappears on `on-drop`.



Comments:
--------------------------------------------------------------------------------

On 2016-03-14T10:27:53Z, dockimbel, commented:
<https://github.com/red/red/issues/1671#issuecomment-196243961>

    @rebolek Can you confirm that this issue is fixed now?

--------------------------------------------------------------------------------

On 2016-03-14T10:37:25Z, pekr, commented:
<https://github.com/red/red/issues/1671#issuecomment-196248144>

    Windows 10, prints "drag" here, when dragged. The face also does not disappear, so hopefully fixed.

--------------------------------------------------------------------------------

On 2016-03-14T11:02:16Z, dockimbel, commented:
<https://github.com/red/red/issues/1671#issuecomment-196260271>

    Ok, thanks.

