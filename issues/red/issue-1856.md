
#1856: Without ALL-OVER flag, the face still got overwhelming OVER events while being dragged.
================================================================================
Issue is open, was reported by JenniferLee520 and has 14 comment(s).
[status.deferred] [type.review] [GUI]
<https://github.com/red/red/issues/1856>

According to the reply to issue 1832, without setting ALL-OVER flag, a face get OVER events only when mouse is entering it or leaving it, and the AWAY? flag of the OVER event is how we know entering or leaving.

In my code, I want the face to change to bright color and to show a triangle as decoration while mouse enters, and back to normal when mouse leaves. I also want the triangle to disappear and the face to keep the bright color while the face is being dragged. But the overwhelming OVER events keep setting the triangle visible, which is not my intention.

``` Red
red []

triangle: make face! [
    type: 'base
    offset: 10x10
    size: 20x20
    color: none
    visible?: false
    draw: [ fill-pen red pen red triangle 0x0 19x9 0x19]
]

visual-obj: make face! [
    type: 'base
    color: gray
    offset: 50x50
    size: 100x80
    options: [ drag-on: down]
    pane: reduce [ triangle ]
    actors: object [
        on-drag-start: func [ face [object!] event [event!] /local new-line new-face ] [
            face/pane/1/visible?: false
        ]
        on-drop: func [ face event ] [
            face/pane/1/visible?: true
        ]
        on-over: func [ face event ] [ 
            either event/away? [
                face/color: gray
                face/pane/1/visible?: false
            ] [
                face/color: green
                face/pane/1/visible?: true
            ] 
        ]
    ]
]

view [
    canvas: base 500x400 white "the red triangle should disappear, while dragging the rectangle."   
    do [
        canvas/pane: reduce [ visual-obj]
    ]
]
```



Comments:
--------------------------------------------------------------------------------

On 2016-04-26T17:03:38Z, JenniferLee520, commented:
<https://github.com/red/red/issues/1856#issuecomment-214812477>

    I still think that Mouse-Enter, Mouse-Exit, and Mouse-Over should be 3 different Event Types. Mixing them together doesn't bring us any good.

--------------------------------------------------------------------------------

On 2016-04-26T17:20:06Z, JenniferLee520, commented:
<https://github.com/red/red/issues/1856#issuecomment-214817193>

    options: [ drag-on: down ] implies flags: [ all-over ], it's not what I expected.

--------------------------------------------------------------------------------

On 2016-04-27T09:44:33Z, dockimbel, commented:
<https://github.com/red/red/issues/1856#issuecomment-215031517>

    You can easily solve that case without having to change anything in the View engine:
    
    ```
    Red []
    
    triangle: make face! [
        type: 'base
        offset: 10x10
        size: 20x20
        color: none
        visible?: false
        draw: [ fill-pen red pen red triangle 0x0 19x9 0x19]
    ]
    
    visual-obj: make face! [
        type: 'base
        color: gray
        offset: 50x50
        size: 100x80
        options: [ drag-on: down]
        pane: reduce [ triangle ]
        actors: object [
            allow?: yes
            on-drag-start: func [ face [object!] event [event!] /local new-line new-face ] [
                face/pane/1/visible?: allow?: false
            ]
            on-drop: func [ face event ] [
                face/pane/1/visible?: allow?: true
            ]
            on-over: func [ face event ] [ 
                if allow? [
                    face/color: get pick [gray green] event/away?
                    face/pane/1/visible?: not event/away?
                ]
            ]
        ]
    ]
    
    view [
        canvas: base 500x400 white "the red triangle should disappear, while dragging the rectangle."   
        do [
            canvas/pane: reduce [ visual-obj]
        ]
    ]
    ```
    
    Though, I agree that dragging should avoid relying on `all-over` events in the future. Anyway, they are some issues with current dragging support (like easily loosing the dragged face when the face is small and moves are fast) which require a change in the implementation.

--------------------------------------------------------------------------------

On 2019-05-13T18:44:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/1856#issuecomment-491939849>

    For whatever reason the `view` part of this code doesn't work anymore. A rewrite can be:
    `view [canvas: base 500x400 white "the red triangle should disappear, while dragging the rectangle." on-create [face/pane: reduce [visual-obj]]]`

--------------------------------------------------------------------------------

On 2019-05-13T21:10:18Z, greggirwin, commented:
<https://github.com/red/red/issues/1856#issuecomment-491988103>

    So a fully working example is:
    ```
    Red []
    
    triangle: make face! [
        type: 'base
        offset: 10x10
        size: 20x20
        color: none
        visible?: false
        draw: [ fill-pen red pen red triangle 0x0 19x9 0x19]
    ]
    
    visual-obj: make face! [
        type: 'base
        color: gray
        offset: 50x50
        size: 100x80
        options: [ drag-on: down]
        pane: reduce [ triangle ]
        actors: object [
            allow?: yes
            on-drag-start: func [ face [object!] event [event!] /local new-line new-face ] [
                face/pane/1/visible?: allow?: false
            ]
            on-drop: func [ face event ] [
                face/pane/1/visible?: allow?: true
            ]
            on-over: func [ face event ] [ 
                if allow? [
                    face/color: get pick [gray green] event/away?
                    face/pane/1/visible?: not event/away?
                ]
            ]
        ]
    ]
    view [
        canvas: base 500x400 white "the red triangle should disappear, while dragging the rectangle." on-create [face/pane: reduce [visual-obj]]
    ]
    ```
    And we can close this issue?

--------------------------------------------------------------------------------

On 2019-05-13T22:33:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/1856#issuecomment-492011079>

    I believe we're waiting for a "change in the implementation" as @dockimbel planned.

--------------------------------------------------------------------------------

On 2019-05-14T02:18:03Z, greggirwin, commented:
<https://github.com/red/red/issues/1856#issuecomment-492052651>

    OK, I skimmed and missed those comments. Thanks for catching me.

