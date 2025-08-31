
#1939: Parse / change should return error for unset! values
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1939>

Following line should return `Script error: a has no value` error when `a` is unset!

```
red>> parse blk: [1][change integer! a]
== true
red>> blk
== [unset]
```



