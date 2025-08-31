
#2149: Field will interfere drag-and-drop.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2149>

``` Red
Red [
    needs: 'view
]

view [
    below
    ; field 250x40 white   ; <==== uncomment this line and run the code again to see the bug
    container1: base 300x450 red    
    return
    container2: base 300x500 black  
    do [
        container2/pane: []
        container1/pane: reduce [
            make face! [
                type: 'base
                offset: 10x10
                size: 250x40
                color: cyan
                text: "drag me between black and red area"
                options: [drag-on: 'down]
                actors: object [
                    on-drag-start: func [ face [object!] event [event!] ] [
                        move (find face/parent/pane face) (tail face/parent/parent/pane)
                    ]
                    on-drop: func [ face [object!] event [event!] ] [
                        either face/offset/x > (container2/offset/x - 10 ) [
                            face/offset: face/offset - container2/offset        
                            move (find face/parent/pane face) (tail container2/pane)
                        ] [
                            face/offset: face/offset - container1/offset        
                            move (find face/parent/pane face) (tail tail container1/pane)
                        ]
                    ]
                ]
            ]
        ]
    ]
]
```

 Uncomment the line with Field and run the code again to see the bug



Comments:
--------------------------------------------------------------------------------

On 2016-08-04T06:55:27Z, qtxie, commented:
<https://github.com/red/red/issues/2149#issuecomment-237468632>

    `move` cause this problem.

--------------------------------------------------------------------------------

On 2017-03-02T17:18:23Z, dockimbel, commented:
<https://github.com/red/red/issues/2149#issuecomment-283718110>

    @JenniferLee520 It seems to run fine with the latest version. Could you confirm that the bug has disappeared?

--------------------------------------------------------------------------------

On 2017-03-02T20:47:32Z, JerryTsai, commented:
<https://github.com/red/red/issues/2149#issuecomment-283775178>

    can close it then.

