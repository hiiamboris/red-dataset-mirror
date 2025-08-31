
#1872: Crash when more then one face in a hierarchy have type 'window
================================================================================
Issue is closed, was reported by Zamlox and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1872>

Following sequence of code will crash console (it should give an error instead):

```
face: make face! [type: 'window size: 120x120]
root: make face! [type: 'window size: 120x120]
root/pane: face
view root
```



