
#2313: [macOS] Setting font color will change the default drawing pen color.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.tested] [type.bug] [status.resolved] [GUI]
<https://github.com/red/red/issues/2313>

Try the following code. The circle should be black, but it's red now. It's the same color of text.
```Red
view [ base 400x100 white font-color red "setting font color will change the default pen color on macOS" draw [ circle 10x10 10 ] ]
```


