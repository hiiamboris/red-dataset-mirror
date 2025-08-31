
#2734: [VID] Setting ORIGIN after one or more faces have been located should cause error.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.dismissed] [GUI]
<https://github.com/red/red/issues/2734>

```Red
view [ 
   box red 20x40 
   origin 0x0   ; <=== should cause error
   box blue 40x20 
]
```


Comments:
--------------------------------------------------------------------------------

On 2025-01-10T18:38:51Z, dockimbel, commented:
<https://github.com/red/red/issues/2734#issuecomment-2583540708>

    After #5541, `origin` command has been officially allowed in-between widgets.

