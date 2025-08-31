
#2381: [macOS] Setting the size of a window will crash 
================================================================================
Issue is closed, was reported by JenniferLee520 and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2381>

click the "bigger" button to see the crash
```Red
Red []

view win: make face! [
    type: 'window
    offset: 50x50
    size: 100x100
    pane: reduce [
        make face! [
            type: 'button
            offset: 0x0
            size: 100x30
            text: "bigger"
            actors: object [
                on-down: func [ face [object!] event [event!] ] [
                    face/parent/size: face/parent/size + 100x100
                ]                
            ]
        ]
    ]
]
```


Comments:
--------------------------------------------------------------------------------

On 2016-12-27T23:09:59Z, endo64, commented:
<https://github.com/red/red/issues/2381#issuecomment-269395940>

    What platform you are on?
    It works as expected on Win10 x64.

--------------------------------------------------------------------------------

On 2016-12-28T02:02:09Z, qtxie, commented:
<https://github.com/red/red/issues/2381#issuecomment-269412648>

    @endo64 It's on macOS.

--------------------------------------------------------------------------------

On 2016-12-28T04:06:25Z, qtxie, commented:
<https://github.com/red/red/issues/2381#issuecomment-269422518>

    Implemented in commit:  d197e05

