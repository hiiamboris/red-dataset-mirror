
#1558: changing tab-panel's facets crashes
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1558>

Changing a `tab-panel`'s facets while a window is closed, makes it crash the next time it is viewed:

```
l: layout [
    f: tab-panel [
        "English" [text "Hello, World!"]
        "Greek" [text "Χαῖρε, κόσμε!"]
    ]
]
view l
f/visible?: false
view l
```

When it reaches the last `view l` line:

```
*** Runtime Error 1: access violation
*** at: 0046E742h
```

Changing other facets in (such as `offset`, `size`, etc.) in this way also causes this crash.

However, if changing the facets while the window is open, it's fine. Clicking the button from the following code doesn't crash:

```
view [
    button [f/visible?: false f/offset: 20x20 f/size: 200x200]
    f: tab-panel [
        "English" [text "Hello, World!"]
        "Greek" [text "Χαῖρε, κόσμε!"]
    ]
]
```

No other faces are affected in this way.



