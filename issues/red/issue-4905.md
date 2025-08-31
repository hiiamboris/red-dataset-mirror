
#4905: Memory leaks when image draw function is used along with image/rgb accessor (Windows 10)
================================================================================
Issue is closed, was reported by GalenIvanov and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4905>

**Describe the bug**
When processing the image! binary data, obtained with `image/rgb`, then updating `image/rgb:`, followed by `draw image block`, memory starts to leak. Observed on Windows 10, when system became unsresponsive, confirmed with Task manager. 


**To reproduce**
```
Red[needs: view]
img: make image! [500x500 0.0.0]
update-img: does[
   bin: img/rgb
   ; do something with the image rgb data 
   img/rgb: bin
   draw img compose[pen white circle 250x250 100]
]
view compose/deep[
    base 500x500 draw[image (img)]
	rate 10 on-time [update-img]
]
```

**Expected behavior**
No memory leaks.

**Platform version**
Red 0.6.4 for Windows built 17-May-2021/4:53:49+03:00  commit #ad14e24


Comments:
--------------------------------------------------------------------------------

On 2021-05-18T18:21:07Z, GalenIvanov, commented:
<https://github.com/red/red/issues/4905#issuecomment-843419778>

    The code above does not couse any memory leaks on an old Red build - Red 0.6.4 for Windows built 27-Sep-2019/19:46:20+03:00 commit #d0e6692 runing on Windows 8.1. However, increasing the image size to 1200x800 leads to memory leaks too. While experimenting with intermediate image sizes like 800x800 I found that sometimes `draw` did not draw the circle, but there were no memory leaks.
    
    The same code leads to memory leaks with Red 0.6.4 for Windows built 17-May-2021/4:53:49+03:00  commit #ad14e24 on the same Windows 8.1 machine for all image sizes.

