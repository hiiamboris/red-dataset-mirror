
#3661: Screen grabbing isn't DPI aware yet
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3661>

**Describe the bug**
Can't take screenshots when scaling is enabled.
[to image! passes the screen size in virtual units to the BitBlt that expects pixels, resulting in screenshot being cut to only a part of the screen](https://github.com/red/red/blob/5ffef49367450a8edac1651ce0b4aee7bbad9819/modules/view/backends/windows/gui.reds#L2463)

**To reproduce**
Set the font scaling to non-100% in your OS, then grab the screen with:
`? (i: to-image s: system/view/screens/1 draw i/size [scale 0.5 0.5 image i])`
and see how output is only a part of the real screen (80% for 125% scaling, 66% for 150% scaling etc)

**Expected behavior**
`i: to-image s: system/view/screens/1`
`i/size` should be equal to the real pixel dimensions of the screen

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 7-Dec-2018/8:41:53+03:00 commit #1bdbdc2
```



