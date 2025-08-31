
#3270: Panel face with set text facet fills with black
================================================================================
Issue is closed, was reported by DVL333 and has 22 comment(s).
[GUI]
<https://github.com/red/red/issues/3270>

### Expected behavior
Panel face with set text facet is transparent.
### Actual behavior
Panel face with set text facet fills with black.
### Steps to reproduce the problem
```
pnl: make face! [type: 'panel size: 80x80 offset: 10x10 text: "Panel"]
repend p: [] [pnl]
view make face! [type: 'window size: 100x100 pane: p]
```
### Red version and build date, operating system with version.
Windows7 Ultimate 64bit, Red for Windows version 0.6.3 built 19-Mar-2018/3:02:17+03:00


Comments:
--------------------------------------------------------------------------------

On 2018-03-22T12:22:01Z, 9214, commented:
<https://github.com/red/red/issues/3270#issuecomment-375284997>

    Can't reproduce on W10.

--------------------------------------------------------------------------------

On 2018-03-22T22:01:50Z, DVL333, commented:
<https://github.com/red/red/issues/3270#issuecomment-375472063>

    2 9214
    Yes, on W10 it works well. Problem is on W7 - background of the panel becomes black regardless of its font color.

--------------------------------------------------------------------------------

On 2018-12-30T16:32:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/3270#issuecomment-450571840>

    On my W7 it's not black: it just displays what was underneath the window at the time of it's creation (the same thing that happens when no painting occurs in response to WM_PAINT).
    Interestingly, this works well: `g: view/no-wait [at 10x10 panel 80x80 "Panel"]`
    But this does not: `view/no-wait f: make face! [type: 'window size: 100x100 pane: p parent: system/view/screens/1]`
    Although I can't find any difference between `? f` and `? g` outputs. So it must be related to how View constructs the window face in the first place.

--------------------------------------------------------------------------------

On 2019-10-11T17:34:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/3270#issuecomment-541155830>

    FYI. The cause of the issue is that [`layout` func at L721](https://github.com/red/red/blob/1d4f76601ae1ebfc459e79292820088205008c6f/modules/view/VID.red#L721) assigns a default color to panel when none is given. 
    `make-face` and `make face!` are more low-level and do not do that, so the panel color remains `none` and it's background is not drawn. Or more specifically, it wasn't drawn because setting a text facet of the panel triggered [`base` rendering code](https://github.com/red/red/blob/1d4f76601ae1ebfc459e79292820088205008c6f/modules/view/backends/windows/base.reds#L100), which (when color is none) does not (by design) render a background.

--------------------------------------------------------------------------------

On 2020-03-12T16:20:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/3270#issuecomment-598279127>

    We have removed "text" support from panel in one of the commits (panel is not meant for text display). But I'm not sure if current behavior is the desired one.
    
    Expectation `Panel face with set text facet is transparent` will unlikely be fulfilled, due to GDI limitations. But should we make panels of OS default color, or derive that color it's parent face (other panel or window)?
    
    Currently it behaves like this, at least on W7:
    `view [backdrop white size 100x100 panel 80x80]`
    ![](https://i.gyazo.com/f7cdcfbcf27707048aca6e29f65bbd4c.png)
    
    If any transparency is present in the panel's color, it does not draw itself over the window's background, but rather over the underlying window:
    `view [backdrop white size 100x100 panel #FF00FFE0 80x80]`
    ![](https://i.gyazo.com/f8949a3e5dfa336e454d40afa35a0cf3.png)
    Should we, for this case, redraw the window first and panel after?
    
    I suggest we reopen this issue until it's fixed properly.
    
    `Red 0.6.4 for Windows built 10-Mar-2020/16:22:26+03:00`

--------------------------------------------------------------------------------

On 2020-03-12T16:29:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/3270#issuecomment-598283689>

    In the first image above, black color is the OS default one btw.

--------------------------------------------------------------------------------

On 2020-03-12T21:13:54Z, greggirwin, commented:
<https://github.com/red/red/issues/3270#issuecomment-598421073>

    @qtxie, please review and reopen if necessary.

--------------------------------------------------------------------------------

On 2020-03-12T23:28:29Z, qtxie, commented:
<https://github.com/red/red/issues/3270#issuecomment-598476266>

    ```
    view [backdrop white size 100x100 panel #FF00FFE0 80x80]
    ```
    I got this one my Windows 7 VM.
    
    ![image](https://user-images.githubusercontent.com/1673525/76576146-37449880-64fc-11ea-92ba-6b858fef919c.png)
    And this on Win10.
    
    ![image](https://user-images.githubusercontent.com/1673525/76576213-6824cd80-64fc-11ea-9f86-dd1f9845d369.png)
    
    The color is correct on Win10. On Win7 it's too light.

--------------------------------------------------------------------------------

On 2020-03-13T11:03:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/3270#issuecomment-598668028>

    @qtxie Notice the `E0` alpha in my color (almost transparent). So your W7 does better than W10.
    Question then is, do you have a white desktop color or it's only my W7 that's drawing on top of the underlying windows? Could it be the Aero mode that makes the difference?

--------------------------------------------------------------------------------

On 2020-03-14T01:29:08Z, qtxie, commented:
<https://github.com/red/red/issues/3270#issuecomment-598993185>

    Hmm, I thought Red use the same color format as the Web. #FF00FFE0 in CSS is the same color as on Win10.
    I use a fresh installed Win7, all default settings, Aero mode enabled.

--------------------------------------------------------------------------------

On 2020-03-14T12:56:58Z, loziniak, commented:
<https://github.com/red/red/issues/3270#issuecomment-599056195>

    It's actually different. ["#ff0000 is equivalent to #ff0000ff"](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value) vs ["R.G.B.A where A = 0 indicates full opacity"](https://doc.red-lang.org/en/view.html#_base)

