
#1916: Some fonts are not displayed in DRAW dialect
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.tested] [type.bug] [status.resolved] [GUI]
<https://github.com/red/red/issues/1916>

Some fonts cannot be displayed in DRAW dialect, sometimes this can be overridden by changing `pen`, but the behaviour is hard to predict. See following example:

```
f1: make font! [size: 12 name: "Arial"]
f2: make font! [size: 12 name: "Arial" style: 'bold]
f3: make font! [size: 12 name: "Verdana"]
f4: make font! [size: 12 name: "Verdana" style: 'bold]
view [image 100x100 draw [pen black font f1 text 0x0 "One" font f2 text 0x20 "Two" font f3 text 0x40 "Three" font f4 text 0x60 "Four"]]
```

I can see only **Two** on my system. However, if I change pen for the last text, it becomes visible, but in white color, not in grey:

```
view [image 100x100 draw [pen black font f1 text 0x0 "One" font f2 text 0x20 "Two" font f3 text 0x40 "Three" pen gray font f4 text 0x60 "Four"]]
```



