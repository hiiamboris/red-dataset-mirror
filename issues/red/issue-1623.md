
#1623: draw's default text color is black instead of pen color, etc
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1623>

In each of the following images, the text is black instead of the `pen` color like the `box` (`[white white blue blue]`, as it would be in Rebol):

```
fnt: make font! [
    name: "Comic Sans MS"
]

img1: draw make image! [100x100 255.255.255] [box 10x10 20x20 font fnt text 20x20 "Hello, World!"]
img2: draw make image! [100x100 0.0.0] [box 10x10 20x20 font fnt text 20x20 "Hello, World!"]
img3: draw make image! [100x100 255.255.255] [pen blue box 10x10 20x20 font fnt text 20x20 "Hello, World!"]
img4: draw make image! [100x100 0.0.0] [pen blue box 10x10 20x20 font fnt text 20x20 "Hello, World!"]
```

Perhaps instead of `0.0.0`, the default `font!/color` should be `none`. Then, whenever it is `none`, the appropriate default color for a font can be supplied by its context. Then in the context of `draw`, the text can be set with the pen color unless it was specified by the font.
Currently, setting the font color to `none` as below, makes the text not display at all:

```
fnt: make font! [
    name: "Comic Sans MS"
    color: none
]
```



