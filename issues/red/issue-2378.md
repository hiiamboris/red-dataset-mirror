
#2378: Changing a font property gives error if font only used in a draw block
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2378>

* Red Version: 0.6.1 and the Latest
* OS: Windows 7 64bit
* Test script:
```
fnt: make font! [name: "Arial" size: 24]
view [
    b: base 300x300 draw [font fnt text 0x0 "TEST"]
    button "Test" [
        fnt/size: 12    ;error
    ]
]
```


