
#4162: [View] `box` in a `panel` is not clipped on W7
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.bug] [GUI] [GUI.Win7]
<https://github.com/red/red/issues/4162>

**Describe the bug**

I can draw over other windows ☺
![](https://i.gyazo.com/a7a142fab58f7aa6707d7fa8d8f31ace.gif)

https://github.com/red/red/issues/1451 related: fixed within a window but not within a panel in a window

**To reproduce**

`view/options [at -400x-400 panel 1100x1100 [at 350x350 box loose 300x300 #ff00ff50]] [size: 200x200]`

**Expected behavior**

box should be contained within the main window


**Platform version (please complete the following information)**
```
>> about
Red 0.6.4 for Windows built 27-Nov-2019/10:17:45+03:00 commit #b2aafe6
```



Comments:
--------------------------------------------------------------------------------

On 2019-12-05T16:35:16Z, DideC, commented:
<https://github.com/red/red/issues/4162#issuecomment-562208370>

    That's cool. Don't correct it ;-)

--------------------------------------------------------------------------------

On 2019-12-05T19:56:57Z, greggirwin, commented:
<https://github.com/red/red/issues/4162#issuecomment-562291566>

    There's an interesting old hack to reference here. In Windows (not sure on new versions), if you opened a menu or dropdown, they could extend beyond the window borders, because they were created as children of the desktop window, not their parent. 

