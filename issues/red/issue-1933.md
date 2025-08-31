
#1933: DRAW ignores PEN when IMAGE has background color set
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.tested] [type.bug] [status.resolved] [GUI]
<https://github.com/red/red/issues/1933>

This text is rendered correctly:

```
f: make font! [size: 12 name: "Segoe UI"]
view [image 200x100 draw [font f pen red text 20x0 "Nazdar!"]]
```

However when I set image's background color, text is rendered in black:

```
f: make font! [size: 12 name: "Segoe UI"]
view [image 200x100 200.200.200 draw [font f pen red text 20x0 "Nazdar!"]
```



