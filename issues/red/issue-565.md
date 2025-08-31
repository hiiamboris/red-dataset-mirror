
#565: Nested COLLECT INTO crashes
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/565>

```
Red []

b: []
parse [1] [collect into b [collect [keep integer!]]]
```

**\* Runtime Error 1: access violation
**\* at: 08056E46h



