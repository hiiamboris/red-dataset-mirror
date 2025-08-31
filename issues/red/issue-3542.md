
#3542: The rich-text face is not updated when changing its text facet
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3542>

### Steps to reproduce the problem
Run the following code in the red console.
```
view [t: rich-text "Simple example here" 
    with [data: compose [1x6 bold 16x7 250.0.0]] 
    on-over [
        change/part at face/text 16 pick ["away" "over"] event/away? tail face/text 
]]
```
### Red and platform version
```
Red 0.6.3 for Windows built 20-Sep-2018/8:48:24+08:00
```


