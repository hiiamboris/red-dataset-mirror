
#5366: Compound scalars in blocks don't trigger reactions
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5366>

```
obj: object [
    z: [1x2]
    on-change*: func [w n o][print "set" ?? w]
    on-deep-change*: func [o w t a n i p][print "deep" ?? w]
]

obj/z/1/y: 5
;== 5
```

This used to work up until this [commit](https://github.com/red/red/commit/675f2e999757738d919e1b67d148b9d6e7a1ae0c#) from Nov, 10th 2022.

This issue causes checkboxes to not update in the [ballots](https://github.com/red/code/blob/master/Showcase/ballots/ballots.red) demo.


Comments:
--------------------------------------------------------------------------------

On 2023-08-16T19:39:07Z, dockimbel, commented:
<https://github.com/red/red/issues/5366#issuecomment-1681171908>

    The fix is not correct. It should trigger `on-deep-change` instead of `on-change` in such case.

