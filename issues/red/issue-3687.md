
#3687: FIND fails when using combinations of /SKIP and /LAST or /REVERSE
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/3687>

```
find/skip/last [c d e 8 7 b c d e f 6 4] [c d e] 3
== none
```
Correct result should be: `[c d e f 6 4]`


