
#3460: DRAW/TRANSPARENT returns a TUPLE! rather than an IMAGE!
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
<https://github.com/red/red/issues/3460>

### Expected behavior
`draw/transparent` returns an image with transparent background.
### Actual behavior
`draw/transparent` returns a `255.255.255.0` `tuple!`. 
### Steps to reproduce the problem
```red
draw/transparent 0x0 []
```
### Red and platform version
```
Red 0.6.3 for Windows built 5-Jul-2018/20:38:08+05:00 commit #963ec55
```


