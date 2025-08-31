
#1559: changing tab-panel's facets doesn't affect contents
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1559>

Changing a `tab-panel`'s facets while the window is open doesn't affect its contents:

```
view [
    button [f/visible?: false]
    f: tab-panel [
        "English" [text "Hello, World!"]
        "Greek" [text "Χαῖρε, κόσμε!"]
    ]
]
```

When clicking the button from the above code, the contents remain visible:
![visible contents](https://cloud.githubusercontent.com/assets/7657453/12643130/f2943284-c605-11e5-8749-1bb1bea5391a.png)

Another example:

```
view [
    button [f/offset: 20x20 f/size: 200x200]
    f: tab-panel [
        "English" [text "Hello, World!"]
        "Greek" [text "Χαῖρε, κόσμε!"]
    ]
]
```

![left behind contents](https://cloud.githubusercontent.com/assets/7657453/12643134/01af71ca-c606-11e5-9e2c-613b5bc8da83.png)



