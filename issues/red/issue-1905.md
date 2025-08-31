
#1905: MOVE action isn't correct in some cases
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/1905>

```
red>> x: [a b c 4 d e f]
== [a b c 4 d e f]
red>> move/part x skip x 3 2
== [a b e f]
red>> x
== [c 4 c a b e f]
```



