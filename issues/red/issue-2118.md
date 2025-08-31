
#2118: Throw unexpected error when clear a face/pane in VID
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2118>

```
Red [Needs: 'View]
view [
    gbox: group-box []
    button "OK" [probe gbox/pane clear gbox/pane]
]
```

Get this error: 

```
[]
*** Script Error: path none is not valid for none! type
*** Where: eval-set-path
```



