
#51: WISH: BODY-OF on ACTION! and NATIVE! values
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[Wish:Acccepted]
<https://github.com/red/REP/issues/51>

A direct follow-up to https://github.com/red/red/issues/3359: I wish `body-of` (ditto `reflect ... 'body`) applied to `action!`s and `native!`s yielded their respective IDs, the way `second` in Rebol2 does.
```rebol
>> second :find
== 53
```
The rationale is simple — while one can use IDs to re-create actions and natives (as indicated in the linked issue above), obtaining these IDs requires manual inspection of runtime tables ([this](https://github.com/red/red/blob/7d01c85e84c208e6b64544bde295e90733eb21c0/runtime/macros.reds#L70) and [this](https://github.com/red/red/blob/7d01c85e84c208e6b64544bde295e90733eb21c0/runtime/macros.reds#L148)).


Comments:
--------------------------------------------------------------------------------

On 2019-08-29T20:30:02Z, dockimbel, commented:
<https://github.com/red/REP/issues/51#issuecomment-526349024>

    Agreed.

