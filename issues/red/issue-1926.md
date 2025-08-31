
#1926: `take/part` returns raw element when `length` is 1
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1926>

```
red>> take/part [a b c d] 2
== [a b]
red>> take/part [a b c d] 1
== a
```

Expected:

```
red>> take/part [a b c d] 2
== [a b]
red>> take/part [a b c d] 1
== [a]
```



