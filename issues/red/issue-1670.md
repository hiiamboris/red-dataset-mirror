
#1670: Unsafe Draw error handling when called from event loop
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1670>

Following code shows that Draw error handling is unsafe:

```
view/options [size 500x500][draw: [spline 10x10 250x150 closed]]
```



