
#2302: [macOS] When mouse is pressed, moving the mouse won't make OVER events be sent to the face.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.tested] [type.bug] [status.resolved] [GUI]
<https://github.com/red/red/issues/2302>

Try the following code on macOS:

```Red
view [ size 100x100 base 30x30 red all-over on-over [ print event/offset ] ]
```



