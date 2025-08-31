
#2798: [View] When a button has the focus, pressing enter key should trigger a Click event.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.wish] [GUI]
<https://github.com/red/red/issues/2798>

```Red
view [ 
    field 100 
    button "OK" [ print "A" ] focus 
]
```
This bug is both on macOS and Windows.


