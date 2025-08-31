
#2161: Resizing a window by dragging its border will not trigger reactions whose source is the 'size facet of the 'window face.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 8 comment(s).
[GUI] [type.task.wish]
<https://github.com/red/red/issues/2161>

Try this on Red Console

``` Red
view win: make face! [
    type: 'window 
    size: 200x200 
    flags: [resize] 
    pane: reduce [ 
        make face! [
            type: 'text 
            text: "resizing window should make this area resized as well." 
            offset: 10x10 
            size: 180x180 
            react/link func [ w f ] [ f/size: w/size - 10x10] [win win/pane/1] 
            color: red 
        ] 
    ] 
]
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-08T22:32:50Z, qtxie, commented:
<https://github.com/red/red/issues/2161#issuecomment-238398393>

    Cannot run this code in console.
    
    ```
    *** Script Error: win has no value
    *** Where: reduce
    ```

--------------------------------------------------------------------------------

On 2016-12-12T06:32:46Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2161#issuecomment-266353290>

    ```Red
    Red []
    
    win: make face! [
        type: 'window 
        size: 200x200 
        flags: [resize] 
        pane: reduce [ 
            make face! [
                type: 'text 
                text: "resizing window should make this pink area resized as well." 
                offset: 10x10 
                size: 180x180 
                color: pink 
            ] 
        ] 
    ]
    
    react/link func [ f w ] [ f/size: w/size - 20x20] [win/pane/1 win ] 
    
    view win
    ```

--------------------------------------------------------------------------------

On 2019-05-22T11:08:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/2161#issuecomment-494757665>

    [The snippet above](https://github.com/red/red/issues/2161#issuecomment-266353290) works on W7 built 20-May-2019. Is this issue still relevant?

--------------------------------------------------------------------------------

On 2020-07-17T12:13:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/2161#issuecomment-660073846>

    Closing for being fixed at some point then.

