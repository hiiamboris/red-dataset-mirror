
#699: Parse does not match integer range loop on bitset
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/699>

The following parse case returns FALSE instead of TRUE:

```
letter: charset "ABCDEF"
probe parse "FFh" [2 8 letter #"h"]
```



