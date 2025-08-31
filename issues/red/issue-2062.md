
#2062: `layout` can't handle delayed face size or offset computation
================================================================================
Issue is open, was reported by DideC and has 0 comment(s).
[status.reviewed] [type.review] [GUI]
<https://github.com/red/red/issues/2062>

Red compute the size of the window by accounting the offset and size at each face creation. If the `face/size` is modified later in the dialect, it's not taken in account.

```
a: "text of the area in the window"
view layout [
    b: area 100x100
    do [
        b/text: a
        b/size: 8x8 + size-text b b/text          ; compute a new size for the face
    ]
]
```

Rebol VID `layout` function use the `span?` function to compute the size of the window after all VID instructions were interpreted. So it can handle this edge cases.



