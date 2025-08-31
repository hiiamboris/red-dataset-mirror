
#2844: Compiled set-path in global context can store a wrong value
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2844>

Happens for object set-path when the code is at root level:
```
Red []
s: object [v: none]
s/v: load "0.6.2"
probe s/v
```
displays:
```
#{}
```


