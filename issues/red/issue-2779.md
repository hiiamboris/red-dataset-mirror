
#2779: [macOS VID] Wrong sizing with H1~H5 in VID makes some characters not shown.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2779>

In the following code, "Testing" will not shown. I guess it's because of wrong size of base.
```Red
view [ H1 "H1 Testing" ]
```
This bug is only on macOS.


