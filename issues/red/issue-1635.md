
#1635: The children of BASE face cannot show up.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 14 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1635>

In the following code, BASE (a red cicle ) has an AREA as its child.I can move the BASE by draging the border of the circle. But if I drag the center of the circle, it won't move. So the AREA is there, just doesn't show up. 

``` Red
Red [
    Needs:   'View
]

view [ 
    size 800x500
    below 
    canvas: panel 400x400
    do [
        canvas/pane: reduce [
            make face! [
                type: 'BASE 
                offset:  0x0
                size: 100x100
                draw: [ fill-pen red circle 50x50 50 ]
                options: [ drag-on: down]
                pane: reduce [ 
                    make face! [ 
                        type: 'area
                        offset:  25x25
                        size: 50x50

                    ]
                ]
            ]           
        ]
    ]
]
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-18T10:13:24Z, JerryTsai, commented:
<https://github.com/red/red/issues/1635#issuecomment-185638356>

    This bug is a real pain to me. I hope it can be fixed soon. Thanks

--------------------------------------------------------------------------------

On 2016-02-20T15:41:44Z, WiseGenius, commented:
<https://github.com/red/red/issues/1635#issuecomment-186631181>

    For me, this code currently crashes with:
    
    ```
    *** Error: CreateWindowEx failed!
    
    *** Runtime Error 1: access violation
    *** at: 00472841h
    ```
    
    Exactly the same on Windows XP and Windows 7.

--------------------------------------------------------------------------------

On 2016-02-21T02:42:49Z, qtxie, commented:
<https://github.com/red/red/issues/1635#issuecomment-186724976>

    @WiseGenius Could you please add some code snippet which trigger the crash?

--------------------------------------------------------------------------------

On 2016-02-21T06:25:33Z, dockimbel, commented:
<https://github.com/red/red/issues/1635#issuecomment-186757677>

    The above code crashes here if I try to drag the red disk.

--------------------------------------------------------------------------------

On 2016-02-21T07:03:36Z, qtxie, commented:
<https://github.com/red/red/issues/1635#issuecomment-186762473>

    Yes. It crashes when I compiling in debug mode.

--------------------------------------------------------------------------------

On 2016-02-21T09:02:28Z, WiseGenius, commented:
<https://github.com/red/red/issues/1635#issuecomment-186778174>

    Using the latest sources:
    
    ##### Test A
    
    ```
    view [ 
        size 800x500
        below 
        canvas: panel 400x400
        do [
            canvas/pane: reduce [
            ]
        ]
    ]
    ```
    
    The above works as expected.
    
    ##### Test B
    
    ```
    view [ 
        size 800x500
        below 
        canvas: panel 400x400
        do [
            canvas/pane: reduce [
                make face! [
                ]
            ]
        ]
    ]
    ```
    
    Windows XP:
    
    ```
    gui/find-class failed
    
    *** Runtime Error 1: access violation
    *** at: 00474267h
    ```
    
    Windows 7:
    
    ```
    gui/find-class failed
    
    *** Runtime Error 1: access violation
    *** at: 00474273h
    ```
    
    ##### Test C
    
    ```
    view [ 
        size 800x500
        below 
        canvas: panel 400x400
        do [
            canvas/pane: reduce [
                make face! [
                    type: 'BASE 
                    offset:  0x0
                    size: 100x100
                    draw: [ fill-pen red circle 50x50 50 ]
                    options: [ drag-on: down]
                    pane: reduce [ 
                    ]
                ]
            ]
        ]
    ]
    ```
    
    The above works as expected.
    
    ##### Test D
    
    ```
    view [ 
        size 800x500
        below 
        canvas: panel 400x400
        do [
            canvas/pane: reduce [
                make face! [
                    type: 'BASE 
                    offset:  0x0
                    size: 100x100
                    draw: [ fill-pen red circle 50x50 50 ]
                    options: [ drag-on: down]
                    pane: reduce [ 
                        make face! [ 
                        ]
                    ]
                ]
            ]
        ]
    ]
    ```
    
    Windows XP:
    
    ```
    gui/find-class failed
    
    *** Runtime Error 1: access violation
    *** at: 00474267h
    ```
    
    Windows 7:
    
    ```
    gui/find-class failed
    
    *** Runtime Error 1: access violation
    *** at: 00474273h
    ```
    
    ##### Test E (original)
    
    ```
    view [ 
        size 800x500
        below 
        canvas: panel 400x400
        do [
            canvas/pane: reduce [
                make face! [
                    type: 'BASE 
                    offset:  0x0
                    size: 100x100
                    draw: [ fill-pen red circle 50x50 50 ]
                    options: [ drag-on: down]
                    pane: reduce [ 
                        make face! [ 
                            type: 'area
                            offset:  25x25
                            size: 50x50
                        ]
                    ]
                ]
            ]
        ]
    ]
    ```
    
    Both Windows XP and Windows 7:
    
    ```
    *** Error: CreateWindowEx failed!
    
    *** Runtime Error 1: access violation
    *** at: 00472AEAh
    ```
    
    ##### Test F
    
    ```
    view [ 
        size 800x500
        below 
        canvas: panel 400x400
        do [
            canvas/pane: reduce [
                         make face! [ 
                            type: 'area
                            offset:  25x25
                            size: 50x50
                        ]
            ]
        ]
    ]
    ```
    
    The above works as expected.

--------------------------------------------------------------------------------

On 2019-07-12T16:05:05Z, Oldes, commented:
<https://github.com/red/red/issues/1635#issuecomment-510942341>

    I get:
    ```
    *** Script Error: path face/parent/type is not valid for none! type
    *** Where: find
    *** Stack: view layout foreach-face foreach-face  
    ```
    when I try above code with current Red version (0.6.4).

