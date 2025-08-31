
#2742: [VID] using BELOW and ACROSS in the same face
================================================================================
Issue is closed, was reported by JenniferLee520 and has 4 comment(s).
<https://github.com/red/red/issues/2742>

```Red
view [ 
    across 
        box red 20x20 
        box blue 40x40 
    below 
        box cyan 30x30 
        box green 60x60 
]
```
Shouldn't VID forbid one face having 2 flow directions? or we just keep it coding convention for programmers. 


Comments:
--------------------------------------------------------------------------------

On 2017-06-03T07:21:28Z, dockimbel, commented:
<https://github.com/red/red/issues/2742#issuecomment-305957809>

    Which face has 2 flow directions? If you mean the window face, VID allows to change the direction flow in panels/windows at any time.

--------------------------------------------------------------------------------

On 2017-06-03T08:39:47Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2742#issuecomment-305961190>

    In that case, this ticket can be closed.

