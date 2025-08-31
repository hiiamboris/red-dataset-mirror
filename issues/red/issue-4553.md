
#4553: [View] Rich-text has no transparency support
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.wish] [GUI] [GUI.Win7]
<https://github.com/red/red/issues/4553>

**Describe the bug**

```
view [
	backdrop #113
	rich-text 255.255.255.0   data [cyan "TEXT"] 100x100 draw [pen magenta circle 50x50 50]
	rich-text 255.255.255.1   data [cyan "TEXT"] 100x100 draw [pen magenta circle 50x50 50]
	rich-text 255.255.255.200 data [cyan "TEXT"] 100x100 draw [pen magenta circle 50x50 50]
]
```
![](https://i.gyazo.com/b7499b0b36670c57aee305ef8f2928c9.png)

As can be seen, any hint at transparency effectively hides the rich-text face.

**Expected behavior**

2nd face almost opaque, 3rd face partly translucent.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Jun-2020/20:24:25+03:00 commit #4d864b1
```



