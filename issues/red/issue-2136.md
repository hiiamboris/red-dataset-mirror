
#2136: insert/dup bug if target series is not empty
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2136>

```
red>> blk: copy []
== []
red>> insert/dup blk 0 3
== []
red>> blk
== [0 0 0]
red>> insert/dup blk 1 2
== [0 0 0]
red>> blk
== [1 0 0 0 0]
```

The value only appears once, at the head, while (count - 1) items from the head of the series are duplicated.



