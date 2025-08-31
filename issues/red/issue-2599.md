
#2599: Z-order is not recalculated on face removal/insertion in a pane.
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2599>

```
win: layout [
    across
    b1: base"Loose" green 100x100 loose
    b2: base "Put back" red 100x100 [remove find win/pane b1 insert win/pane b1 b1/offset: b2/offset - 110x0]
    b3: base "On top" blue 100x100 [remove find win/pane b1 insert tail win/pane b1] 
    b4: base "Deeper" olive 100x100 [idx: idx - 1 remove find win/pane b1 insert at win/pane idx b1]
    b5: base "Dump" water 100x100 [print idx dump-face win] 
    return
    at 120x120     b6: base orange 200x200
    at 150x150     b7: base aqua 200x200
    at 180x180     b8: base gold 200x200
] idx: length? win/pane view win
```


