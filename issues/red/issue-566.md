
#566: COLLECT INTO does INSERT instead of insert/only
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/566>

```
Red []

b: next [0 9]
probe parse [1 [2]] [collect into b [keep integer! keep block!]]
probe head b
```

true
[0 1 2 9]

This is less useful, and inconsistent with regular COLLECT.

Perhaps there should be a keep/only? There is in R3's non-PARSE KEEP. However, I think it should be the default for nested COLLECTs.



Comments:
--------------------------------------------------------------------------------

On 2013-11-18T11:47:29Z, dockimbel, commented:
<https://github.com/red/red/issues/566#issuecomment-28692096>

    Agreed that /only by default is more useful.

