
#4240: [View] Panel content intermediate redraws stick out of the panel
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[GUI] [GUI.Win7]
<https://github.com/red/red/issues/4240>

**Describe the bug**

One of the nastiest sources of flickering on W7: panel, when shrunk & moved, seems to be drawn twice - once after it's moved and once after it's resized.

**To reproduce**
```
Red []
view [
	backdrop brown
    space 0x0 
    sp: base 20x300 loose magenta draw [rotate 90 pen yello text 0x-20 "DRAG ME"]
        on-down [system/view/auto-sync?: off] 
        on-up [system/view/auto-sync?: on] 
        on-drag [
            face/offset/y: 10
            pr/offset/x: face/offset/x + 20 
            pr/size/x: face/parent/size/x - face/offset/x - 30 
            show [pr sp]
        ] 
    pr: panel [
        at 0x0 box 300x300 cyan react [
            face/size/x: face/parent/size/x
        ]
    ]
]
```
Drag the bar fast horizontally. Observe how the cyan content of the panel is drawn over brown window border (where panel never technically stretches to).

**Expected behavior**

I expect panel to apply it's size & offset in one go, to eliminate extra flicker

**Screenshots**

The behavior is visually very torn, but the tearing itself can't be caught by screen grabber. However, it's easy to catch it in a finished invalid state:
![](https://i.gyazo.com/b96bdb2735fd2d41d2888ff61b74a18b.jpg)

There are also screenshots like this:
![](https://i.gyazo.com/7080251075bd15a81d4814d037f29a1a.jpg)
To eliminate this issue perhaps one should not call EndPaint until the whole window with all of it's children is drawn. Just a guess though ;)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Dec-2019/1:01:27+03:00
```



