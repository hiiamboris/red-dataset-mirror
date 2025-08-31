
#2070: Image position is wrong when `no-title` flag is used
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/2070>

Image faces are not positioned correctly when the title bar is not displayed:

```
img: make image! 48x48
img/rgb: red

view/flags [
    below
    text "This text should be visible"
    image img
    button "quit" [unview]
][no-title]
```

If the flag is removed, the image has the expected position. In both cases, the image's offset is the same.



