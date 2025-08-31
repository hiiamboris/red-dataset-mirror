
#3728: [View] `focus` and `unfocus` events mostly aren't working
================================================================================
Issue is open, was reported by hiiamboris and has 16 comment(s).
[type.wish] [status.reviewed] [GUI]
<https://github.com/red/red/issues/3728>

**Describe the bug**

On W7 out of 16 face types tested:
`on-focus` is only triggered for `area` and `field` faces
`on-unfocus` - only for `area`, `field`, `text-list`, `drop-list`, `drop-down` faces

**To reproduce**
```
types: [base text button check radio field return area text-list drop-list drop-down progress slider return camera panel tab-panel group-box]
view collect [
	foreach t types [
		if 'return = t [keep 'return continue]
		keep compose/deep [(t) all-over (form t)
			on-focus [print (rejoin [t " FOCUSED"])]
			on-unfocus [print (rejoin [t " unFOCUSED"])]
			on-over [set-focus face]
		]
	]
]
```
Go over each face with the pointer and see how it focuses itself but the event is never triggered.

**Expected behavior**

Should work for all 16 face types.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 9-Jan-2019/5:46:16+03:00 commit #acf3492
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-14T21:26:04Z, endo64, commented:
<https://github.com/red/red/issues/3728#issuecomment-454167391>

    On Win10 here are the results:
    ```
    base        no event triggered
    text        no event triggered
    button      no event triggered
    check       no event triggered
    radio       no event triggered
    field       focus/unfocus
    area        focus/unfocus
    text-list   unfocus only (one time, happens when I over it)
    drop-list   no event triggered
    drop-down   unfocus only (happens continuously when I move over it)
    progress    no event triggered
    slider      no event triggered
    camera      no event triggered
    panel       no event triggered
    tab-panel   no event triggered
    group-box   no event triggered
    ```

--------------------------------------------------------------------------------

On 2019-01-15T01:38:19Z, qtxie, commented:
<https://github.com/red/red/issues/3728#issuecomment-454235327>

    This is a limitation of the native controls. Needs to check more to see how to get `focus` and `unfocus` events for all the controls.

--------------------------------------------------------------------------------

On 2019-01-17T06:29:49Z, dockimbel, commented:
<https://github.com/red/red/issues/3728#issuecomment-455057885>

    @hiiamboris Focusing was not intended to work so far for anything else than `field` and `area` (though, `drop-down` could have been added to that list).
    
    Once we add tab-navigation, we can have a look at extending it for all the other widgets (when allowed by the OS).

--------------------------------------------------------------------------------

On 2019-01-17T06:54:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/3728#issuecomment-455062574>

    I don't see why OS can't support it. Just call SetFocus on face's hWnd upon selected facet change, and catch WM_SETFOCUS messages in the WindowProc. Probably the same on other platforms. No?

--------------------------------------------------------------------------------

On 2019-01-17T08:04:39Z, dockimbel, commented:
<https://github.com/red/red/issues/3728#issuecomment-455078145>

    > Probably the same on other platforms. No?
    
    IIRC, it doesn't work the same on macOS, you can't set the focus on any widget. @qtxie can you confirm?

--------------------------------------------------------------------------------

On 2019-01-17T14:10:37Z, qtxie, commented:
<https://github.com/red/red/issues/3728#issuecomment-455184605>

    @hiiamboris The WM_SETFOCUS message is a [nonqueued message](https://docs.microsoft.com/en-us/windows/desktop/winmsg/about-messages-and-message-queues#nonqueued-messages). It is sent directly to the control. We try to avoid having a WindowProc for every control, that's why some widgets don't  have those events.
    @qtxie Should be possible. Just no easy way.

--------------------------------------------------------------------------------

On 2020-07-17T19:49:03Z, greggirwin, commented:
<https://github.com/red/red/issues/3728#issuecomment-660306856>

    Good find. I can see it being tricky if the main wndproc has to dispatch some things separately, but it does that already. Just glanced at the code, and saw that e.g. combos use command messages; CBN_KILLFOCUS vs WM_KILLFOCUS, the latter of which doesn't use lparam, and some other messages find the child window from that. Since it may take some time to figure out, @hiiamboris think on it and related tab order solutions, and ping @qtxie with thoughts. If you see a solution, run it by him.

--------------------------------------------------------------------------------

On 2023-04-25T21:51:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/3728#issuecomment-1522466089>

    Related focus and /selected issues:  #5308 #5307 https://github.com/red/red/issues/3808 https://github.com/red/red/issues/4818 https://github.com/red/red/issues/5275 https://github.com/red/red/issues/3809 https://github.com/red/red/issues/2820 and possibly https://github.com/red/red/issues/4330
    
    ATM it's nigh impossible to reliably track the focus in View. I need to know in Spaces when focus leaves the host base, to hide the focus decoration. But base doesn't receive unfocus event and many other faces won't even receive focus event, so this doesn't work. I could replace set-focus to inject tracking and add a global event func to track window/selected after each of mouse click events, but that is unreliable because panels steal /selected to themselves. Total mess.

