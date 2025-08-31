
#1475: `logic? true` return false
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/1475>

`logic?` function doesn't work, always return `false`.

```
red>> type? true
== logic!
red>> logic? true
== false
red>> logic? false
== false
```



