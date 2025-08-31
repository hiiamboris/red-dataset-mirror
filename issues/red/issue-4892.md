
#4892: Unselecting an item in a text-list is hard
================================================================================
Issue is open, was reported by zwortex and has 6 comment(s).
[GUI]
<https://github.com/red/red/issues/4892>

**Before submitting**
https://gitter.im/red/help?at=6094427793ac573bba8a5b4e

**Describe the bug**
In the following code, on-down event is used to set the selected facet to none. It works somehow but not nicely : sometimes a single click is enough to unselect an element, but most often you need to double click.

To reproduce : run the following code, select a row in the list then click on it again to unselect. Try various times with different elements to see how it goes.

```
view/no-wait [
    text-list data [ "1" "2" ]
        on-down [ print [ "Down" "face/selected:" face/selected "event/picked:" event/picked ] 
            if face/selected == event/picked [
                face/selected: none
            ]
        ]
        on-select [ print [ "Select" "face/selected:" face/selected "event/picked:" event/picked ] ]
        on-change [ print [ "Change" "face/selected:" face/selected "event/picked:" event/picked ] ]
        on-dbl-click [ print [ "Dbl click" "face/selected:" face/selected "event/picked:" event/picked ] ]
        on-focus [ print "Focus" ]
        on-unfocus [ print "Unfocus" ]
]
```

Note that returning 'done or 'stop does not help, and intervening in on-select is too late as it is not sent at all.

**Expected behavior**
Unselection made easy. As it is possible to select an item without coding. It should be possible to unselect without the need to code either. Therefore clicking on a selected item should unselect the selected item.

**Platform version**
Red 0.6.4 for Windows built 24-Apr-2021/19:27:28
OS: Windows 10 x64 / 20H2 


Comments:
--------------------------------------------------------------------------------

On 2021-05-06T20:20:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/4892#issuecomment-833833229>

    Deselecting without code will likely be a nonstandard thing to ask. `selected: none` should work though.

--------------------------------------------------------------------------------

On 2021-05-06T20:22:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/4892#issuecomment-833834542>

    The only thing that works for me in the above code is double-clicking - it unselects. Just slow single clicks do not. W10.

--------------------------------------------------------------------------------

On 2021-05-17T11:24:29Z, zwortex, commented:
<https://github.com/red/red/issues/4892#issuecomment-842244981>

    I have made unselect works in the following way :
    - on-down is used to capture event/picked and face/selected and to modify face/selected so as to make sure the event will propagate further to on-select/on-change,
    - on-select is ignored as it is merely announcing what will be done anyway in on-change
    - on-change is used to perform the intended operation : either select or unselect
    - on-dbl-click is used to reverse the change in case of dbl-click (dbl-click comes after on-select/on-change)
    Even if a workaround is possible. I'd rather have things reviewed. Basically if the selection is performed by the widget, it should allow un-selecting the line as well. Have also the ability to cancel a selection rather than reverse it back.
    
    ```
    view/no-wait [
        text-list data [ "1" "2" ]
            on-down [ print [ "Down" "face/selected:" face/selected "event/picked:" event/picked ]
                ;if face/selected == event/picked [
                ;    face/selected: none
                ;]
                face/extra: compose [ selected: (face/selected) picked: (event/picked) ]
                face/selected: either event/picked [none][1]; make sure the event propagates
                print ["Down on" event/picked]
            ]
            on-select [
                print [ "Select" "face/selected:" face/selected "event/picked:" event/picked ]
                print "Event ignored"
            ]
            on-change [
                print [ "Change" "face/selected:" face/selected "event/picked:" event/picked ]
                either any [
                    not face/extra/picked ; selection of no line
                    face/extra/picked == face/extra/selected ; same line selected
                ][
                    face/selected: none
                    print ["Unselect"]
                ][
                    face/selected: face/extra/picked
                    print ["Select" face/selected]
                ]
            ]
            on-dbl-click [
                print [ "Dbl click" "face/selected:" face/selected "event/picked:" event/picked ]
                either not face/extra/picked [
                    face/selected: none
                    print ["Double click ignored"]
                ][
                    face/selected: face/extra/picked
                    print ["Double click on" face/selected]
                ]
            ]
            on-focus [ print "Focus" ]
            on-unfocus [ print "Unfocus" ]
    ] 
    ```

