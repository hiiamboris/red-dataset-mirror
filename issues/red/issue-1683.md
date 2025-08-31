
#1683: "face is not in the specified context" when two custom faces are used
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1683>

I want to make custom face and use it in layout. When I use just one instance of that face, everything’s fine. However, when I want to use that face again, I got _face is not in the specified context_ error. Try this code:

```
Red [
    Needs: 'View
]

extend styles [
    custom: [
        template: [
            type: 'base size: 10x50 color: red
            options: [drag-on: 'down]
            actors: object [
                on-create: func [face] [
                    print type? face
                ]
            ]
        ]
    ]
]

view [custom custom]
```



