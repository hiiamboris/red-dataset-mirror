
#5039: set-word! triggers an error in shape command
================================================================================
Issue is closed, was reported by GalenIvanov and has 0 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/5039>

`set-word!` values in Draw blocks are used to mark positions in the block intended for changing. 
When I place a `set-word!` in a block following `shape` command, before a keyword however, Red triggers an error.

To reproduce

```
draw-block: [
    fill-pen 80.80.150 box 0x0 600x400
    fill-pen 220.220.235
	shape [
	    start: move -10x250
	    curv  120x200 300x270 500x300 700x320
		line 700x510 -10x410 -10x350
	]
]	
view [base 600x400 draw draw-block]
```
```
*** Script Error: invalid Draw dialect input at: [start: move -10x250 curv 120x200 300x270 500x300 700x320 line 700x510 -10x410 -10x350]
*** Where: ???
```
Expected behavior

`set-word!` in `shape` command should not be different from the rest commands in a Draw block.

Red 0.6.4 for Windows built 23-Sep-2021/2:45:23+02:00  commit #7e5737e
tested also on latest Red 0.6.4 for Windows built 14-Jan-2022/19:43:17+02:00  commit #92feb0c


