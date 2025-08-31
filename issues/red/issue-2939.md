
#2939: Change/part will crash when called with past-end arguments
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2939>

```
a: "ABC"
b: next a
c: next b
change/part a b c
change/part a b c
```


