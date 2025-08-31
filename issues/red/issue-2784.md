
#2784: [macOS View] "Strike-through" font style not working on 'Base
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2784>

It works on button, but not works on base. 
```Red
f: make font! [ style: 'strike ]
view [ base font f "OK" ]
```
This bug is only on macOS.


