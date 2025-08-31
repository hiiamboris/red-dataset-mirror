
#3353: REPLACE on text-list data corrupts the display
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3353>

```
view [tl: text-list data ["a 1" "b 1"] button [replace tl/data/1 "1" "456"]]
```

### Expected behavior
After hitting the button, the text-list should display:
```
a 456
b 1
```
### Actual behavior
The text-list wrongly displays:
```
a 1
b 1
456
```
### Steps to reproduce the problem
Run above code from the console and hit the button.

### Red and platform version
```
Red 0.6.3 for Windows built 27-Apr-2018/19:16:52+08:00
```


