
#2828: [VID] "below right" and "below center"
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2828>

In the following code, the button is not aligned to the right. There is a gap. This bug is on macOS only. 
```Red
view [ below RIGHT field 100 button "OK" ]
```

In the following code, the button is not aligned to the center if you watch it very carefully. This bug is on macOS and Windows. 
```Red
view [ below CENTER field 100 button "OK" ]
```



