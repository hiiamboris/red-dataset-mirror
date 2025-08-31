
#77: WISH: finer control over reactive relations triggered by pairs
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
<https://github.com/red/REP/issues/77>

I find it often a case where a reaction should be only placed on `x` or `y` coordinate of face's `offset`, `size` or custom pair dimension.

However, reactivity does not provide this flexibility: place a reaction on `/x` and it will be triggered by a change in `/y`. (Not just reactivity, `on-deep-change` does not provide this info either)

Not only this produces unneeded reactions, but also prevents one from creating flexible resize scenarios, e.g. what if I want to set `/y` to a default, but only if it wasn't explicitly set to another value?
```
default: 10
r: deep-reactor [
    s: 1x1
    react [
        [self/s/x]                          ;) s/x serves as a reaction source
        triggered-by-SX: yes                ;) NO WAY TO KNOW THIS!!
        if triggered-by-SX [s/y: default]   ;) otherwise I wanna leave s/y as is - how?
        ?? s
    ]
]
r/s/x: 2
r/s/y: 3
```
Output:
```
s: 1x10
s: 2x10
s: 2x10        ;) I want 2x3 here
```



Comments:
--------------------------------------------------------------------------------

On 2022-11-25T17:56:09Z, dockimbel, commented:
<https://github.com/red/REP/issues/77#issuecomment-1327751918>

    After the changes made by `on-deep-fixes` branch, pair individual component setting will trigger a `on-change` reaction (and no more `on-deep-change`). That was necessary as the deep change handler is really meant for series.  OTOH, the value change handler spec does not allow to pass the information about which component was changed. So I think that the `on-change` spec should be extended to pass the value's component name, when applicable.

--------------------------------------------------------------------------------

On 2022-11-25T18:00:48Z, hiiamboris, commented:
<https://github.com/red/REP/issues/77#issuecomment-1327756182>

    Like `on-change [subject [word! path!] old [any-type!] new [any-type!]]` ?

--------------------------------------------------------------------------------

On 2022-11-25T18:06:24Z, dockimbel, commented:
<https://github.com/red/REP/issues/77#issuecomment-1327759921>

    That's one option, another one is just to add an extra `field [word! none!]` argument.

