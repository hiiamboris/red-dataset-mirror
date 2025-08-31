
#1636: Except BASE, all kinds of faces pass mouse events directly to their parent's actor without translating the offset first.
================================================================================
Issue is open, was reported by JenniferLee520 and has 4 comment(s).
[type.review] [GUI] [type.design]
<https://github.com/red/red/issues/1636>

When bubbling, Except BASE, all kinds of faces pass mouse events directly to their parent's actor without translating the offset first. Which cause the parent gets the mouse events with children's relative coordinates.

For example, when you click on the center of the red panel (code below), its' coordinates are 50x50, which is relative to the red panel. but to its parent, it should be 150x150. Still, the event that the parent get is 50x50. Wrong!

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
                type: 'panel 
                offset:  100x100
                size: 100x100
                color: red
            ]           
        ]
        canvas/actors: object [
            on-down: function [ f [object!] e [event!] ] [
                print e/offset
            ]
        ]

    ]
]
```



Comments:
--------------------------------------------------------------------------------

On 2019-05-10T17:15:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/1636#issuecomment-491363918>

    This can be worked around using the `event/face` info:
    ```
    translate: func [ofs from into] [while [all [not same? from into  'window <> from/type]] [ofs: ofs + from/offset from: from/parent] ofs]
    view [size 800x500 below canvas: panel 400x400 [at 100x100 panel 100x100 red []] on-down [probe translate event/offset event/face face]]
    ;) shows the proper offset on clicks
    ```
    
    It should be decided thus if the current event passing model should be changed or left alone (with some docs clarification, esp. that `event/face <> face` in the general case)

--------------------------------------------------------------------------------

On 2020-10-14T03:08:27Z, bitbegin, commented:
<https://github.com/red/red/issues/1636#issuecomment-708127356>

    if the `event!` is a object!, when we bubble/capture events to parent, use `make event!` with calculated offset and handle. 
    
    we can also add `event/stage`/`event/origin-face` for more informations

