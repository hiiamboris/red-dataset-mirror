
#1715: Console's multiline editing does not cope well with comments
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1715>

Following code should be parsed as an empty block, but errors out instead:

```
red>> [
[    ;[
[    ;]
*** Syntax error: missing #"]" at "{[^^/;[^^/;]}"
*** Where: do
red>> ]
```



