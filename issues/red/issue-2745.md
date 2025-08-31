
#2745: [DRAW] draw text using pen color
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.wish] [GUI]
<https://github.com/red/red/issues/2745>

According to the document

> If no font is selected or if the font color is set to none, then the pen color is used instead.

but in the following example, it's not like that. The text is still in black color, not red.

```Red
view [ box white 100x100 draw [ pen red text 10x10 "OK" ] ]
```



