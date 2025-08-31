
#1086: Parse iteration rules do not exit consistently
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1086>

```
red>> count: 0 parse "123" [some [(count: count + 1) skip]] count
== 3

red>> count: 0 parse "aaab" [some [(count: count + 1) "a"] "b"] count
== 4
```



