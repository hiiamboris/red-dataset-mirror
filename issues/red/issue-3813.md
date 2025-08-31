
#3813: [Draw] ignores matrix commands on rich-text surface
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.wish] [GUI]
<https://github.com/red/red/issues/3813>

**Describe the bug**

Matrix transformations inside Draw are ignored, not only for the text output but also for every other graphic command:
```
view compose/deep [
   rich-text 100x100 draw [
      pen blue
      clip 0x0 50x50
      translate 10x10
      rotate 10 0x0
      scale 2 2
      box 0x0 60x20
      text 0x0 (rtd-layout [{XXXXXXXXXXXXXXXX}])
   ]
]
```
![](https://i.gyazo.com/062ff23e0198ea958124b1931adf9b03.png)

**Expected behavior**

Look at GDI+ result:
![](https://i.gyazo.com/c466e160a296bcb2dd303e60bad25f72.png)
```
view [
   box 100x100 draw [
      pen blue
      clip 0x0 50x50
      translate 10x10
      rotate 10 0x0
      scale 2 2
      box 0x0 60x20
      text 0x0 {XXXXXXXXXXXXXXXX}
   ]
]
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 5-Mar-2019/0:09:36+03:00 commit #53b5b37
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-12T11:25:58Z, qtxie, commented:
<https://github.com/red/red/issues/3813#issuecomment-471961713>

    The supported drawing commands in rich-text face is limited for now as it uses Direct2D only. 

