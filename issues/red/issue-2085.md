
#2085: Runtime crash on using an unset word in an object's spec block expression
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2085>

The following code will crash when run:

```
Red []
d: make reactor! [x: is [y + 1] y: is [x + 3]]
```



Comments:
--------------------------------------------------------------------------------

On 2016-07-21T10:01:28Z, rebolek, commented:
<https://github.com/red/red/issues/2085#issuecomment-234210588>

    This bug should be reopened as it currently hangs console.

