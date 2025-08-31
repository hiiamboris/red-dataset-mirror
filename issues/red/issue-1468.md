
#1468: face/selected does not get set in drop-list or drop-down
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1468>

I tried viewing the following layout:

```
[drop-list data ["a" 1 "b" 2 "c" 3] on-change [probe face/selected]]
```

and the result is always `none`. What should it be?



Comments:
--------------------------------------------------------------------------------

On 2016-01-15T12:03:14Z, meijeru, commented:
<https://github.com/red/red/issues/1468#issuecomment-171944353>

    Sorry to nag, but I don't see the commit that solved this. 

--------------------------------------------------------------------------------

On 2016-02-02T14:30:01Z, dockimbel, commented:
<https://github.com/red/red/issues/1468#issuecomment-178598759>

    Seems to be working fine with the latest version. Let me know if it doesn't work for you.

