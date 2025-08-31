
#2471: write regression on Linux
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2471>

`write` does write but returns an error:
```
  write %test "string"
*** Access Error: cannot open: %test
*** Where: write
  read %test
;   "string"
```


