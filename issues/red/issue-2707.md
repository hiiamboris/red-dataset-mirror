
#2707: CONTINUE results in infinite loops in FORALL
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2707>

```
things: [1 2 3]
forall things [if 2 < first things [break] print things continue]
```
This loop should finish when end of `things` series is reached.


