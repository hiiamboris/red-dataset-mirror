
#3165: Cannot drag face when display is scaled (Win10)
================================================================================
Issue is closed, was reported by endo64 and has 14 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/3165>

Transparent faces filled by a `draw` box cannot dragged if Windows 10 display scaled (display setting `scale` > 100%)

```
view [
	base loose with [color: none] draw [
		fill-pen   white
		box        10x10 82x82
	]
]
```

If 82x82 changed to 81x81 then it can be dragged.

### Expected behavior

Base face should be draggable by mouse.

### Actual behavior

Face cannot be dragged.

### Steps to reproduce the problem

On Windows 10
Right click on desktop, select `Display Settings`
Change `Scale and Layout` setting to `125%`
Execute the above script and try to click & drag the face.

### Red version and build date, operating system with version.

Red 0.6.3 Build date: 21-Dec-2017/23:39:43+03:00
Windows 10 (x64)



Comments:
--------------------------------------------------------------------------------

On 2017-12-24T20:44:13Z, endo64, commented:
<https://github.com/red/red/issues/3165#issuecomment-353802442>

    If the `box` is rounded then it works: `box 10x10 82x82 1`

--------------------------------------------------------------------------------

On 2017-12-28T09:20:14Z, qtxie, commented:
<https://github.com/red/red/issues/3165#issuecomment-354257020>

    I can reproduce it on Win10, but no problems on Win7. 

--------------------------------------------------------------------------------

On 2019-01-16T22:27:10Z, endo64, commented:
<https://github.com/red/red/issues/3165#issuecomment-454968128>

    Can someone please test and confirm that this works now.
    I tested on `Red 0.6.4 for Windows built 11-Jan-2019/5:18:27+03:00 commit #5e37a10`
    @greggirwin Then we can close this issue.

--------------------------------------------------------------------------------

On 2019-01-17T03:52:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/3165#issuecomment-455033241>

    No, it's still buggy on W7 x64.
    `Red 0.6.4 for Windows built 11-Jan-2019/5:18:27+03:00 commit #5e37a10`
    
    This is 80x80, draggable, all ok:
    ![](https://i.gyazo.com/8365590ac0c6e9c391933dfceb3d93d9.png)
    
    But this is what I get from 82x82 and 125% scaling factor:
    ![](https://i.gyazo.com/a531100770247edb2da26b36a3ce9897.png)
    It's still draggable but I have to aim at the thin white line to do so. `draw` bug?

--------------------------------------------------------------------------------

On 2019-01-17T09:41:31Z, endo64, commented:
<https://github.com/red/red/issues/3165#issuecomment-455106834>

    @hiiamboris Thanks for testing.
    It is funny a year ago @qtxie said `I can reproduce it on Win10, but no problems on Win7.` now it is the opposite :)

--------------------------------------------------------------------------------

On 2019-01-18T06:41:19Z, greggirwin, commented:
<https://github.com/red/red/issues/3165#issuecomment-455443632>

    If developing software was easy, everyone would do it. 

--------------------------------------------------------------------------------

On 2019-10-09T16:30:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/3165#issuecomment-540080741>

    It's an MS GDI+ bug. The one we know already (it craps with alpha=0). We just didn't know it also happens in this scenario.
    
    When scaling is set to 125%, the bug seems to appear when:
    - both box corners are at coordinates (4N+2), which makes them appear at half a pixel. Whatever happens there internally in GDI+, it makes the box transparent. (Just a thought: maybe they have some float-to-byte casting, where the alpha value transcends from high 255.99999s into 256.00000001 something, and becomes 0)
    - box color should be fully opaque (alpha = 0)
    
    Anyway. We can only work around this as long as we're using GDI+.
    
    To test:
    ```
    repeat x 10 [view compose/deep [box 200x200 loose draw [fill-pen white box 10x10 (161 + x * 1x1) ]]]
    ```
    Every 4th box drawn is transparent

