
#3809: [View] Selection mechanism inconsistencies
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[GUI]
<https://github.com/red/red/issues/3809>

**Describe the bug**

For a **text-list** and **drop-list**/**drop-down** on-select event is triggered with:
- `face/selected` referring to a **previously** chosen item, and
- `event/picked` containing the **current** selection:

`view [text-list data ["A" "B" "C"] on-select [print [event/picked face/selected]]]`

It's actually wrong, because the item in the control is **already** selected at the time the event code kicked in, and this code can't call any other code that relies on `face/selected` value until it overrides it with `set-quiet 'face/selected event/picked` (and that's extra work and an extra source of bugs)

`on-change` can be used instead of `on-select` to call any code that relies on `selected`, so it's not a real problem. Problem is that the native control selects the item regardless of the `selected` value or whether you return 'stop from `on-select` actor.

For a **window, panel, group-box**, on-select event is triggered with:
- `face/selected` already changed to the **new value** and
- `event/picked` is **always `1`**

`view [panel [field field] on-select [print [event/picked index? find face/pane face/selected]]]`

For **tab-panel** it's even more ridiculous:

- when one of the tabs is clicked: `face/selected + 1 = event/picked` and these **always** refer to the **previously** selected item (with no way to know the new choice). Note that `event/picked` here is **always `>= 2`**
`view [tab-panel 200x100 ["A" [field] "B" [field field] "C" [field]] on-select [print [event/picked face/selected]]]`
  (I tried to save `event/picked` from `on-detect` with `event/type = 'select` and then return `'stop` from `on-detect` with `event/type = 'change` to stop the user from selecting certain tabs, but it doesn't work - tab change still happens)

- when a face on one of the tabs is clicked, the **same** `on-select` event is called with `face/selected` containing the proper tab index and `event/picked` **always `1`**
`view [tab-panel 200x100 ["A" [field] "B" [field field] "C" [field]] on-select [print [event/picked attempt [pnl: face/pane/(face/selected) index? find pnl/pane pnl/selected]]]]` (here, considering #3808 I'm looking for panel/selected rather than window/selected)

**Expected behavior**

1. There should be some consistency: if `picked` is the new choice and `selected` is the old choice, it should be everywhere
2. For explained reasons, I would prefer `selected` facet to contain the *actual* data at the time of its actor execution, or native control not select the item until `selected` facet changes
3. Tab-panel's `on-select` probably shouldn't be called when a face on it's panel is selected (that's what it's panels' own `on-select` actors are for)
4. Tab-panel's `event/picked` should contain some meaningful data

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 5-Mar-2019/0:09:36+03:00 commit #53b5b37
```



