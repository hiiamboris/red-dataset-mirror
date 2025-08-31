
#2936: calling `layout` with `/flags` refinement results in error
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2936>

```Red
layout/flags [] 'some-valid-flag
```
```Red
*** Script Error: cannot set none in path none
*** Where: eval-set-path
*** Stack: view layout eval-set-path
```


