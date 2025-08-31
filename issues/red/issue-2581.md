
#2581: [gui][draw] Draw on image doesn't trigger update
================================================================================
Issue is closed, was reported by maximvl and has 4 comment(s).
[status.tested] [type.bug] [status.resolved] [GUI]
<https://github.com/red/red/issues/2581>

If you run this code and click button - image will not change:
```
view [img: image 100x100 button "click" on-click [
    draw img/image [ fill-pen black box 0x0 50x50 ]
    show img
    ]
]
```

However if just one byte is reassigned it will work:
```
view [img: image 100x100 button "click" on-click [
    draw img/image [ fill-pen black box 0x0 50x50 ]
    img/image/1: img/image/1
    show img
    ]
]
```

I guess `draw` changes image in the way that `img` doesn't know it was changed, so update doesn't do anything.


Comments:
--------------------------------------------------------------------------------

On 2017-04-20T09:11:42Z, DideC, commented:
<https://github.com/red/red/issues/2581#issuecomment-295645217>

    I also encounter that issue during the development of my heart animation. But forgot to make an issue about :-(

--------------------------------------------------------------------------------

On 2017-06-16T11:34:15Z, qtxie, commented:
<https://github.com/red/red/issues/2581#issuecomment-309003463>

    Fixed in the latest version.

