
#3366: Compiled object keep using memory
================================================================================
Issue is closed, was reported by qtxie and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3366>

### Expected behavior
Memory usage is stable.
### Actual behavior
Memory usage is increasing.
### Steps to reproduce the problem
Compiles the following code and run.
```
Red [Needs: View]
w: layout [size 200x200]
caret: make face! [
    type: 'base offset: 1x1 size: 1x17 rate: 30
]
caret/actors: object [
    on-time: func [face [object!] event [event!]][
        face/color: 0.0.0
    ]
]
append w/pane caret
view w
```
### Red and platform version
```
Red 0.6.3 for Windows 7 64bit built 5-May-2018/19:45:17+08:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-05-07T17:32:19Z, greggirwin, commented:
<https://github.com/red/red/issues/3366#issuecomment-387141647>

    Confirmed that the leak occurs when compiled on Win10 as well. Running from the REPL is fine. Only compiled is the issue.

--------------------------------------------------------------------------------

On 2018-08-16T09:53:03Z, qtxie, commented:
<https://github.com/red/red/issues/3366#issuecomment-413489897>

    Should be fixed in simple-gc branch.

