
#2264: WISH: round should be allowed on pairs
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2264>

I am writing a drawing program and to implement "snap to grid" I need to resort to the cumbersome

```
snapped-point: as-pair round/to point/x grid-size round/to point/y grid-size
```

where I would have liked to write

```
snapped-point: round/to point grid-size
```



Comments:
--------------------------------------------------------------------------------

On 2016-10-09T10:50:42Z, dockimbel, commented:
<https://github.com/red/red/issues/2264#issuecomment-252479313>

    Pair! only holds integer values for now, so applying `round` on a pair value would have no effect.

--------------------------------------------------------------------------------

On 2016-10-10T07:37:20Z, meijeru, commented:
<https://github.com/red/red/issues/2264#issuecomment-252552165>

    But `round/to` definitely _would_ have, and this is what the example is about. I believe this to be a realistic example.

--------------------------------------------------------------------------------

On 2016-10-10T07:52:37Z, dockimbel, commented:
<https://github.com/red/red/issues/2264#issuecomment-252554367>

    Indeed, I overlooked it.

