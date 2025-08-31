
#2944: WISH: spec-of <routine> should show locals 
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/2944>

In %environment/routines/reds:
```
set-current-dir: routine [path [string!] /local dir [red-file!]][
...
]
```
But:
```
>> spec-of :set-current-dir
== [path [string!]]
```
Where have the locals gone?


Comments:
--------------------------------------------------------------------------------

On 2017-07-31T06:55:59Z, dockimbel, commented:
<https://github.com/red/red/issues/2944#issuecomment-318984343>

    The locals are part of Red/System realm, they are part of the interface with Red.

