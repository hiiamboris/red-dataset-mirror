
#2417: `attempt` stops propagation of `break`
================================================================================
Issue is closed, was reported by maximvl and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2417>

```
red>> forever [ print "1" break ]
1
red>> forever [ attempt [ print "1" break ] ]
1
*** Throw Error: no loop to break
*** Where: break
```

In second case `break` is expected to break a loop, not to raise an error.


Comments:
--------------------------------------------------------------------------------

On 2017-02-13T10:26:57Z, dockimbel, commented:
<https://github.com/red/red/issues/2417#issuecomment-279348017>

    BREAK and CONTINUE exceptions have been relaxed to allow crossing function borders up to the first wrapping loop.

