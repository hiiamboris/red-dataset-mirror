
#1746: Following script will crash the console: red-28mar16-d01229b
================================================================================
Issue is closed, was reported by Zamlox and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1746>

```
Red []

system/view/auto-sync?: no

h-scroll: make object! [
    origin: 0x0
    length: 200
    left:   20x20
    rect:   20x20
    right:  20x20
    middle: func [
        /x
        /y
    ][
        if x [return length - left/x - right/x]
        if y [return left/y]
        as-pair length - left/x - right/x left/y
    ]
    body: func [
        face-obj [object!]
    ][
        origin: as-pair 0 face-obj/size/y - left/y
        length: face-obj/size/x
        compose/deep [
            across origin (origin) space 0x0
            base (left) blue
            base (middle) red
            base (right) blue
            at (as-pair origin/x + left/x origin/y) base (rect) black loose 
                on-drag [
                    ;probe face/offset
                    face/offset/y: origin/y
                    all [face/offset/x < (left/x) face/offset/x: (left/x)]
                    all [face/offset/x > (middle/x) face/offset/x: (middle/x)]
                ]
        ]
    ]
]
h-scroll-2: make h-scroll []

scroll-panel: layout/only [
    below space 0x0
    panel 200x200
    panel 100x100
]
disp: layout [
    backdrop white
    size 500x500
]

h-scroll-face:      layout/only h-scroll/body scroll-panel/1
h-scroll-face-2:    layout/only h-scroll-2/body scroll-panel/2
scroll-panel/1/pane: h-scroll-face 
scroll-panel/2/pane: h-scroll-face-2
disp/pane: scroll-panel
view disp
```



Comments:
--------------------------------------------------------------------------------

On 2016-03-28T23:49:53Z, qtxie, commented:
<https://github.com/red/red/issues/1746#issuecomment-202630823>

    Reduce to this code:
    
    ```
    Red []
    
    system/view/auto-sync?: no
    
    h-scroll: make object! [
        middle: func [][]                         ;-- comment this line, then works
        body: func [arg][
            compose/deep [(arg)]
        ]
    ]
    h-scroll-2: make h-scroll []                  ;-- comment this line, then works
    h-scroll/body 1
    ```
    
    It looks like `make object! []` does something wrong.

--------------------------------------------------------------------------------

On 2016-03-29T07:22:20Z, Zamlox, commented:
<https://github.com/red/red/issues/1746#issuecomment-202752510>

    If I comment out those lines, it works, but not as intended. The intention is to create as many 'h-scroll' objects and attach them to any face. The root cause of crash must be found and fixed.

--------------------------------------------------------------------------------

On 2016-03-29T08:20:44Z, Zamlox, commented:
<https://github.com/red/red/issues/1746#issuecomment-202774612>

    after some tests I think it might have something to do with 'compose/deep'. Also if I try to avoid using 'compose/deep' but use 'append/only' will also crash console. Working with nested blocks has some issues in this specific situation.

--------------------------------------------------------------------------------

On 2016-03-29T08:23:31Z, dockimbel, commented:
<https://github.com/red/red/issues/1746#issuecomment-202775228>

    Looks like an internal interpreter issue, investigating it right now...

--------------------------------------------------------------------------------

On 2016-03-30T16:15:21Z, dockimbel, commented:
<https://github.com/red/red/issues/1746#issuecomment-203508858>

    The crash was caused by an interpreter internal cache corruption.

