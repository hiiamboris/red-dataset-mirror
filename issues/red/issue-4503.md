
#4503: [View] Auto-sync: off may lead to inconsistent tree state
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[GUI]
<https://github.com/red/red/issues/4503>

Could be related to https://github.com/red/red/issues/4465 but looks different to me

**Describe the bug**

Here's a mess. It's an extract from a big layout. For some reason the bug to appear requires 2 layers of auto-sync: off - one normal, one in reactive update:
```
do-unseen: function [code][
    old: system/view/auto-sync?
    system/view/auto-sync?: no
	do code
    system/view/auto-sync?: old
]

v: view/no-wait/options [c: panel blue [] 100x400] [size: 200x400]
resize-y: does [do-unseen [c/size/y: 300 * length? c/pane]]
react [[c/size/x] resize-y]
append c/pane reduce [make-face 'base]
do-unseen [c/size/x: 100]
show v
? c/size
halt
```

| real output | expected output |
| --- | --- |
| ![](https://i.gyazo.com/d919525b375b6a9b71d442b6d6250f3a.png) | ![](https://i.gyazo.com/a5171b57f027960d26bde920004a7350.png) |

As you can see it tells me that panel `c` has a size of 100x300 and should be visible. But no amount of `show c` or `show v` makes it so.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



