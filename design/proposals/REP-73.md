
#73: WISH: Resizing to be stopped when reactor returns 'stop 
================================================================================
Issue is open, was reported by ralfwenske and has 2 comment(s).
<https://github.com/red/REP/issues/73>

Following code demonstrates (and can be used for testing) what this wish is about:
```
Red []

do-resize: function [face [object!] size [pair! none!] d1 d2 d3 d4][
    clear d3/text d3/text: form size 
    if (face/type = 'window) and (object? face/extra) and (size <> none)  [
        d1/text: copy form mins: to-pair select face/extra/options 'min-size
        d2/text: copy form maxs: to-pair select face/extra/options 'max-size
        maxsx: min maxs/x (max mins/x size/x)
        maxsy: min maxs/y (max mins/y size/y)
        if (face/size/x <> maxsx) or (face/size/y <> maxsy) [
            face/size: as-pair maxsx maxsy
            clear d4/text d4/text: copy rejoin [face/size " LIMIT!!!!"]
            return false    ;;;; could return 'stop ?
        ]
        d4/text: copy rejoin [face/size ""]
    ]
]

win: layout [
    title "TEST RESIZE LIMITS"
    size 600x400 
    panel 780x480 red [
        panel 480x280 yellow [
            style txt: text 200x80 font-name "Courier" font-size 16
            below
            txt "Min"
            txt "Max"
            txt "Size"
            txt "Result"
            return
            display1: txt "*"
            display2: txt  "*"
            display3: txt "*"
            display4: txt "*"
        ]
    ]
] react [do-resize win win/size display1 display2 display3 display4]

win/extra: context [
    options: [
        min-size 500x300 
        max-size 800x500
    ]
]
view/flags win ['resize]
```


Comments:
--------------------------------------------------------------------------------

On 2020-05-09T10:08:54Z, hiiamboris, commented:
<https://github.com/red/REP/issues/73#issuecomment-626142099>

    So to rephrase, @ralfwenske wants to put constraints on window size, and current View doesn't seem able to do this:
    ```
    system/view/capturing?
    view/flags [size 400x300 on-detect [if event/type = 'resizing ['stop]]] 'resize
    ```
    The window still gets resized.

