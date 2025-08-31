
#2219: Runtime crash on making image! with size bigger than 10^9
================================================================================
Issue is closed, was reported by ifgem and has 0 comment(s).
[status.tested] [status.resolved] [type.review]
<https://github.com/red/red/issues/2219>

```
make image! 1000000x1000
make image! 1000000000x1
*** Runtime Error 1: access violation
*** at: 0041C433h
```



