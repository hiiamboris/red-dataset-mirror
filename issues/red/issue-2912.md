
#2912: RUNTIME: access violation with invalid hex color provided to `backdrop` in `view` block
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2912>

```Red
view [backdrop #violate!]
```
```Red
*** Runtime Error 1: access violation
*** at: 0042535Dh
```


