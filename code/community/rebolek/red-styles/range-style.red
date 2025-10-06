Red[
    Title: "Range style"
    Author: "Boleslav Březovský"
    Note: {
Range styles provides slider to set range. You can resize the slider by dragging
edges or move the slider by dragging it between edges.
Slider range is available in `face/data` as a block! of two values, low and high
limit in range of 0.0 - 1.0.
}
]

range-style: [
    style range: base 1400x50 all-over
        extra context [
            drag?: no
            active: none
            edges: 0x1400
            offset: 8x8
            old-offset: 0x0
            draw-drag: func [
                position 
                height
                offset
                /local placement
            ][
                collect [
                    repeat i 3 [
                        placement: i - 1 * 4 + position
                        keep compose [line (as-pair placement offset) (as-pair placement height - offset)]    
                    ]
                ]
            ]
            redraw: func [face /local edges][
                edges: probe face/extra/edges
                face/draw: compose [
                    ; background
                    line-width 2
                    pen 20.20.20
                    fill-pen 80.80.80
                    box (face/extra/offset) (face/size - face/extra/offset) 8
                    ; range
                    pen 20.20.20
                    fill-pen 200.200.200
                    box (as-pair edges/1 0) (as-pair edges/2 face/size/y) 6
                    ; draggers
                ]
                append face/draw face/extra/draw-drag edges/1 + 6 face/size/y 2
                append face/draw face/extra/draw-drag edges/2 - 14 face/size/y 2
            ]
        ]
        on-create [
;            face/color: none ; FIXME: does not work, at least on Wine
            face/extra/redraw face
        ]
        on-down [
            ; start dragging
            face/extra/drag?: yes
            ; choose proper edge
            tolerance: 15
            offset: event/offset/x
            edges: face/extra/edges
            face/extra/active: case [
                tolerance > absolute offset - edges/1 ['left]
                tolerance > absolute offset - edges/2 ['right]
                all [
                    offset > (edges/1 + tolerance)
                    offset < (edges/2 + tolerance)
                ][
                    face/extra/old-offset: event/offset
                    'bar
                ]
            ]
        ]
        on-up [
            face/extra/drag?: no
            face/extra/active: none
        ]
        on-over [
            if face/extra/drag? [
                min-size: 40
                switch face/extra/active [
                    left [face/extra/edges/1: max 0 min event/offset/x face/extra/edges/2 - min-size]
                    right [face/extra/edges/2: min face/size/x max event/offset/x face/extra/edges/1 + min-size]
                    bar [
                        diff: event/offset/x - face/extra/old-offset/x
                        face/extra/old-offset: event/offset
                        if all [
                            (t1: face/extra/edges/1 + diff) >= 0
                            (t2: face/extra/edges/2 + diff) <= face/size/x    
                        ][
                            face/extra/edges: reduce [t1 t2]
                        ]
                    ]
                ]
                face/extra/redraw face
            ]
            face/data: reduce [
                face/extra/edges/1 / to float! face/size/x
                face/extra/edges/2 / to float! face/size/x
            ]
        ]
]