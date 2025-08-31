
#2889: Radial gradient not positioned correctly on Windows
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2889>

```
 view [
    base 500x500 draw [
    pen off
    fill-pen radial 250x250 0 400 red green blue yellow purple cyan silver orange box 0x0 
    500x500
    ]
 ]
```
The gradient is not centered once displayed, but it should be.


