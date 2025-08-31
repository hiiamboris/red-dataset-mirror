
#1467: In VID, return seems to ignore spacing
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.resolved]
<https://github.com/red/red/issues/1467>

Try the following layout, part of the implementation of the 4x4 tile game:

```
[
 across space 0x0
 style piece: button 60x60
 origin 0x0 piece "1" piece "2" piece "3" piece "4" return
 piece "5" piece "6" piece "7" piece "8"
]
```

Piece 5 is not aligned under piece 1, as I would expect from reading the source code.



Comments:
--------------------------------------------------------------------------------

On 2016-01-15T11:16:12Z, dockimbel, commented:
<https://github.com/red/red/issues/1467#issuecomment-171936324>

    Works correctly with latest version.

