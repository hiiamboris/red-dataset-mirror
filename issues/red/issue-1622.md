
#1622: text not displayed in draw without font
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1622>

`img` displays no text in either of these 2 examples:

```
img: draw make image! [100x100 255.255.255] [pen blue box 10x10 20x20 pen red text 20x20 "Hello, World!"]
```

```
img: draw make image! [100x100 0.0.0] [pen blue box 10x10 20x20 pen red text 20x20 "Hello, World!"]
```



