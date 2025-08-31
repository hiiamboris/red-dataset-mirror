
#3751: black color rich-text with fill-pen does not draw correctly
================================================================================
Issue is closed, was reported by koba-yu and has 2 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3751>

**Describe the bug**
a black font rich-text is not drawn only when it is used with fill-pen box that is neither black nor white.

**To reproduce**
Run the code below;

```red
view/no-wait compose/deep [rich-text draw [
		fill-pen 246.248.250
		box 10x10 100x100
		text 10x10 (rtd-layout [black "test"])
	]
]
```

As additional information, all of the codes below draw texts correctly.

```red
view/no-wait compose/deep [rich-text draw [
		text 10x10 (rtd-layout [black "test"])
	]
]

view/no-wait compose/deep [rich-text draw [
		fill-pen 0.0.0
		box 10x10 100x100
		text 10x10 (rtd-layout [white "test"])
	]
]

view/no-wait compose/deep [rich-text draw [
		fill-pen 246.248.250
		box 10x10 100x100
		text 10x10 (rtd-layout [red "test"])
	]
]

view/no-wait compose/deep [rich-text draw [
        fill-pen 246.248.250
        box 10x10 100x100
        text 10x10 (rtd-layout [0.0.1 "test"])
    ]
]

view/no-wait compose/deep [rich-text draw [
        fill-pen 246.248.250
        box 10x10 100x100
        fill-pen black
        text 10x10 (rtd-layout ["test"])
    ]
]
```

Therefore it seems fille-pen that is not black or white, with black rich-text, can not be drawn.

**Expected behavior**
The text "test" should be rendered with black color

**Screenshots**
This is the screenshot of the issue.

![not-drawn-correctly](https://user-images.githubusercontent.com/15072685/51429777-76a78a00-1c55-11e9-8ae6-912e1cc2a71a.JPG)

This is one of the example codes that draws correctly.

![drawn-correctly](https://user-images.githubusercontent.com/15072685/51429792-b2daea80-1c55-11e9-97ad-25a3d1aabe60.JPG)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 19-Jan-2019/21:54:56+09:00 commit #4880ddb
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-22T19:02:38Z, greggirwin, commented:
<https://github.com/red/red/issues/3751#issuecomment-456521924>

    Confirmed on Win10. Thanks for the detailed report and screenshots @koba-yu.

