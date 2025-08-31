
#209: faster-floats corrupts casts
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/209>

```
print [as-float32 0.0  lf]
```

**\* Runtime Error 9: float invalid operation
**\* at: 0804848Ch

```
print [0.0  lf]
print-wide [0.0  1.0  lf]
print [as-float32 0.0  lf]
```

0
0 1 
1



