
#395: SWITCH does not match word! values
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/395>

The following code does not print "ok" while it should:

```
Red []
switch 'yes [yes [print "ok"]]
```



Comments:
--------------------------------------------------------------------------------

On 2013-01-24T22:05:54Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/395#issuecomment-12676389>

    I think this is a new regression that broke my code that worked. "switch type?/word x" doesn't work anymore, either.

