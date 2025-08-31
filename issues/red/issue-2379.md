
#2379: A new font object is created for each face
================================================================================
Issue is open, was reported by qtxie and has 6 comment(s).
[GUI]
<https://github.com/red/red/issues/2379>

* Red Version: 0.6.1 and the Latest
* OS: Windows 7 64bit
* Test script:
```
fnt: make font! [name: "Arial" size: 24 color: red]
view [
    b: base 300x300 font fnt "TEST" draw [font fnt text 0x0 "TEST"] []
    button "Test" [
        fnt/size: 12
        probe b/font/size  ; <<< this is different than fnt/size
    ]
]
```


Comments:
--------------------------------------------------------------------------------

On 2016-12-26T06:57:20Z, endo64, commented:
<https://github.com/red/red/issues/2379#issuecomment-269173023>

    I think it is a design choice as VID merge other font settings into the given one:
    
    ```
    fnt: make font! [name: "Arial" size: 24 color: red]
    ;text size will be 12 instead of 24 but fnt/size is still 24
    view [t: text "Test" font fnt font-size 12]
    ```

--------------------------------------------------------------------------------

On 2017-01-05T13:06:21Z, DideC, commented:
<https://github.com/red/red/issues/2379#issuecomment-270639699>

    Rebol handle cloning of font or para objects only if needed (while changed) to reduce memory consumption.
    See `source set-font` or `source set-para` in a Rebol/view REPL.

--------------------------------------------------------------------------------

On 2020-07-17T11:52:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/2379#issuecomment-660066229>

    See https://github.com/red/red/issues/4373 as well

