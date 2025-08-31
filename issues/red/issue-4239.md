
#4239: [View] Transparent box turned loose doesn't honor it's parent's offset
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.bug] [GUI] [GUI.Win7]
<https://github.com/red/red/issues/4239>

**Describe the bug**

Related to https://github.com/red/red/issues/4162 (about clipping)

But this is about offsets:
![](https://i.gyazo.com/792f1cfc16ba7fb2f38ab0df3108892d.gif) 

**To reproduce**
```
Red []
view/tight [
    sp: base magenta 20x300 loose draw [rotate 90 pen yello text 0x-20 "DRAG ME"]
        on-drag [
			face/offset/y: 0
            pr/size/x: face/parent/size/x - face/offset/x - 20 
            pr/offset/x: face/offset/x + 20 
        ] 
    pr: panel [
        at 0x0 box 300x300 #00FFFF01 react [
            face/size/x: face/parent/size/x
        ]
    ]
]
```

**Expected behavior**

The cyan box is within a panel: when a panel moves, the box should also move with it

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Dec-2019/1:01:27+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-01-14T16:08:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/4239#issuecomment-574248401>

    I can't see the link I added or edit my own issue (hello MS, thanks for your hard work on breaking GH).
    So in case it doesn't show the gif, here it is: https://i.gyazo.com/792f1cfc16ba7fb2f38ab0df3108892d.gif

--------------------------------------------------------------------------------

On 2020-01-14T16:16:08Z, dockimbel, commented:
<https://github.com/red/red/issues/4239#issuecomment-574252137>

    This seems like a Win7-specific issue.

