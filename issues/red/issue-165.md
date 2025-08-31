
#165: Local type inference fails in complex expression after casting reimplementation
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/165>

```
s!: alias struct! [
    pixels          [pointer! [byte!]]
    pitch           [integer!]
]
plot: function [  ; Draw a pixel.
    surface         [s!]
    /local
        buffer8
;       buffer8     [pointer! [byte!]]
][
    buffer8: surface/pixels +
        surface/pitch +
        (x * 2)
]
```

**\* Compilation Error: attempt to change type of variable: buffer8
**\* from: [integer!]
**\*   to: [pointer! [byte!]]



