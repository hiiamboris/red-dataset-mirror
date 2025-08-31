
#80: WISH: control the flow of event-funcs using commands, not return values
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
<https://github.com/red/REP/issues/80>

I was playing with an alternate reactivity implementation and it happened it just wouldn't see some events. I spent 3+ hours to locate the bug:
https://github.com/red/red/blob/a34a784f8ae5a74a30ce539e335d633b1609046a/modules/view/view.red#L1205-L1206
```
    ]
]
```
(why doesn't GitHub insert the snippet linked above automatically?)

Last event function should have returned `none` as all other event funcs inside `view.red` do. But it was forgotten. 
`reactivity/check` is no better - it returns whatever the code may yield (I think it's `none` from `unless` or `unset` from `while` - latter [being buggy btw](https://github.com/red/red/issues/4496) so it's a miracle it worked so far):
https://github.com/red/red/blob/a34a784f8ae5a74a30ce539e335d633b1609046a/environment/reactivity.red#L144-L145
```
    ]
]
```

Since it's obvious these bugs will happen again and again (I remember myself tripping a few times on this), I propose we bind the body of the event functions (inside `insert-event-func`) to a context with commands that would control whether it should stop or not. E.g. `context [stop: does [throw/name 1 'stop-events]]`. And then catch these exceptions from withing the `system/view/awake` or what will be the best place.

Such event functions will not have to watch their return types anymore, will normally pass execution from one onto another, but a call to `stop` will abort further event processing.




