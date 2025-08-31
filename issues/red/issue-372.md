
#372: SWITCH can't occur at end of file
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/372>

```
Red []

switch/default 1 [
1 []
][]
```

-= Red Compiler =- 
Compiling /home/kaj/Red/SQLite/examples/test.red ...
**\* Compilation Error: expected a block for SWITCH-DEFAULT instead of none! value 
**\* near: []



Comments:
--------------------------------------------------------------------------------

On 2013-01-07T20:51:51Z, dockimbel, commented:
<https://github.com/red/red/issues/372#issuecomment-11971051>

    It's probably the third of fourth time I am fixing this...It seems to be turning into a never-ending bug! :-)

