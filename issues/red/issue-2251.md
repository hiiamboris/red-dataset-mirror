
#2251: Wrong error message when passing bad value for a refinement
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/2251>

```
red>> f: func [x /a /b val [string!]][]
== func [x /a /b val [string!]][]
red>> f/a/b 1 none
*** Script Error: f does not allow none! for its /a argument
*** Where: f
```

It’s `/b` that does not allow `none!`, not `/a`.



Comments:
--------------------------------------------------------------------------------

On 2017-02-18T11:21:04Z, dockimbel, commented:
<https://github.com/red/red/issues/2251#issuecomment-280839264>

    Fixed by a recent commit.

