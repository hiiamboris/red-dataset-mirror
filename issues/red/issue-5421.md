
#5421: Selecting an out-of-range index in a list widget causes an internal error
================================================================================
Issue is closed, was reported by dockimbel and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5421>

```
>> view [dl: drop-list data ["a"] button "set 2" [dl/selected: 2]]
*** Script Error: copy does not allow none! for its value argument
*** Where: copy
*** Near : all [word = 'selected selected block? data ] 
*** Stack: view do-events do-actor do-safe 
```

This is a regression.


Comments:
--------------------------------------------------------------------------------

On 2023-11-16T19:39:36Z, greggirwin, commented:
<https://github.com/red/red/issues/5421#issuecomment-1815195477>

    https://github.com/red/red/commit/49d484d44425a426464d3d28b9f58d3427e0fd41#commitcomment-132770836

--------------------------------------------------------------------------------

On 2023-11-23T15:16:27Z, dockimbel, commented:
<https://github.com/red/red/issues/5421#issuecomment-1824599673>

    Fixed by https://github.com/red/red/commit/f57cc85acc52a5dcc37f850261f10c55d7976b1b.

