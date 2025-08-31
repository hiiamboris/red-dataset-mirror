
#1931: Events on IMAGE are not triggered on transparent parts
================================================================================
Issue is closed, was reported by rebolek and has 6 comment(s).
[status.resolved] [type.alien] [GUI]
<https://github.com/red/red/issues/1931>

I’m not sure if it’s a bug or feature, but to me it looks more like bug or something that should be optional.

```
view [image 200x100 draw [line 0x0 200x100] on-over [print "over"]]
```

When running above code and moving mouse over the window, you can see **over** printed only when the pointer is directly over the line.



Comments:
--------------------------------------------------------------------------------

On 2016-05-25T06:59:09Z, iArnold, commented:
<https://github.com/red/red/issues/1931#issuecomment-221489436>

    For me this could well be a welcome feature, perfect for round or irregular shaped controls. 
    Always on and off by option only.

--------------------------------------------------------------------------------

On 2019-05-13T19:29:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/1931#issuecomment-491954736>

    Looks intentional to me on Windows (CWP_SKIPTRANSPARENT flag on):
    https://github.com/red/red/blob/973dcd6556aa14e636a9834d6763db65053b4778/modules/view/backends/windows/gui.reds#L254
    
    I have modified the original snippet (as it is no longer actual because the image is white by default):
    `view [image 200x100 glass draw [pen blue line 0x0 200x100] on-create [face/image/argb: glass] on-over [print "over"]]`
    
    I have also encountered a situation where I would like to draw a transparent window above everything that will catch the mouse input. Although the workaround is easy: make it with Alpha=254.
    
    On MacOS (VM) works totally different: the modified snippet won't show any `over` events at all after /argb is set. Weird.

--------------------------------------------------------------------------------

On 2022-09-14T09:12:11Z, qtxie, commented:
<https://github.com/red/red/issues/1931#issuecomment-1246472009>

    This is a feature. See issue #1833

