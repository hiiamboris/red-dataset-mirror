
#1574: Changing TEXT-LIST's SELECTED from TAB-PANEL stops updating it’s own SELECTED
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1574>

Consider this code:

```
Red [Needs: 'View]

view [
    l: text-list data ["one" "two" "three"]
    t: tab-panel ["one" [] "two" []"three" []] on-change [
        print ["picked:" event/picked "selected:" face/selected]
        l/selected: event/picked
        show l
    ]
]
```

There’s a TEXT-LIST with list of panels contained in TAB-PANEL. Changing panel also changes selected item in the list. However, if you look at the console output, you can see that `face/selected` for TAB-PANEL does not change (it’s still 1). If you comment the line `l/selected: event/picked`, `face/selected` is properly updated on each change.



