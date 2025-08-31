
#1158: foreach with multiple indexes behaves strangely on vectors
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1158>

Compare:

```
b: [1 2 3 4 5 6 7 8 9]
foreach [b1 b2 b3] b [print [b1 b2 b3]]
```

gives

```
1 2 3
4 5 6
7 8 9
```

as expected.

But:

```
v: make vector! [1 2 3 4 5 6 7 8 9]
foreach [v1 v2 v3] v [print [v1 v2 V3]]
```

gives

```
1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9
4 5 6 7 8 9 4 5 6 7 8 9 4 5 6 7 8 9
7 8 9 7 8 9 7 8 9
```



