
#1500: show does not seem to update window if only the draw block is modified
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/1500>

See this code:

```
view [canvas: base 300x300 draw [line-cap round line-width 10 pen red
    line 10x10 130x190 80x40 150x100]
    return
    button "Change" [p: find canvas/draw 'red remove p insert p 'blue show canvas]
    button "Stop" [quit]
]
```

The idea is that the drawing becomes blue when the button is clicked. Nothing happens however. The draw block IS changed, I checked that. But `show` seems to do nothing. Is this a bug, a feature, or a programming error?

Incidentally, the `remove/insert` is needed because `change` is not (yet) implemented.



Comments:
--------------------------------------------------------------------------------

On 2015-12-11T05:01:57Z, dockimbel, commented:
<https://github.com/red/red/issues/1500#issuecomment-163840139>

    Looks like a bug.

--------------------------------------------------------------------------------

On 2016-02-04T14:03:48Z, qtxie, commented:
<https://github.com/red/red/issues/1500#issuecomment-179853218>

    Fixed in latest version.

