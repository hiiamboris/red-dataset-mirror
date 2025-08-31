
#2733: [VID] the optional argument for BELOW and ACROSS is not working
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2733>

According to https://doc.red-lang.org/en/vid.html , BELOW and ACROSS have a optional argument, including RIGHT, MIDDLE, CENTER, BOTTOM. They are not working now.

```Red
view [ BELOW CENTER BOX 10x10 red BOX 20x20 blue ]
```




