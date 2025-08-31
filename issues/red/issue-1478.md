
#1478: DRAW dialect accepts blocks of DRAW dialect for gathering related instructions
================================================================================
Issue is closed, was reported by JerryTsai and has 4 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/1478>

```
draw: [  
    [ fill-pen white box 0x0 40x40 ]
    [ fill-pen red box 10x10 20x20 ]
]
```



Comments:
--------------------------------------------------------------------------------

On 2015-12-03T13:54:05Z, meijeru, commented:
<https://github.com/red/red/issues/1478#issuecomment-161646044>

    If this is only a matter of presentation, the newlines will be sufficient. At least, how I understand the DRAW dialect, leaving out the block brackets would not change the semantics.

--------------------------------------------------------------------------------

On 2015-12-08T06:57:02Z, dockimbel, commented:
<https://github.com/red/red/issues/1478#issuecomment-162794423>

    @meijeru It is about grouping Draw commands, so it becomes easier to insert/remove them.

