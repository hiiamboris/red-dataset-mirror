
#1869: Base doesn't get focus when field have the focus
================================================================================
Issue is closed, was reported by qtxie and has 16 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/1869>

```
view [
    base "base"
         on-key  [probe event/key]
         on-down [event/window/selected: face]
    field "ok"
]
```

Click the field first, then click the base, the base does not get the focus.



Comments:
--------------------------------------------------------------------------------

On 2019-01-06T01:05:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/1869#issuecomment-451706236>

    There's a regression here. The provide code will no longer give focus to the base (except on double-click).
    Moreover, `field` also steals focus from other faces as well:
    try `view [field area "X" on-down [set-focus face] on-key-down [probe event/key]]`
    or `view [field button "X" on-down [set-focus face] on-key-down [probe event/key]]`.
    
    W7, Red 0.6.4 for Windows built 5-Jan-2019/4:37:59+03:00 commit #1c0642e

--------------------------------------------------------------------------------

On 2019-01-06T02:49:26Z, greggirwin, commented:
<https://github.com/red/red/issues/1869#issuecomment-451710537>

    @qtxie is this a regression, or newly intended behavior?

--------------------------------------------------------------------------------

On 2019-01-06T08:58:15Z, qtxie, commented:
<https://github.com/red/red/issues/1869#issuecomment-451726048>

    @greggirwin Looks like a regression.

--------------------------------------------------------------------------------

On 2019-01-06T09:21:44Z, qtxie, commented:
<https://github.com/red/red/issues/1869#issuecomment-451727340>

    It works if I remove `set-focus`.
    ```
    view [field area "X" on-down [face] on-key-down [probe event/key]]
    ```

--------------------------------------------------------------------------------

On 2019-03-08T12:55:21Z, Oldes, commented:
<https://github.com/red/red/issues/1869#issuecomment-470918884>

    @qtxie if I run your last code snippet, I think that it should be possible to click anywhere outside the `field` or `area` to lost focus to them.
    
    I think it would be fine to just add `SetFocus hWnd` at this line: https://github.com/red/red/blob/53b5b37b3fd37a2a4b88452b2cc90a7e89c5f428/modules/view/backends/windows/events.reds#L1333
    
    Btw... you are catching just the left mouse button?

--------------------------------------------------------------------------------

On 2019-03-08T19:34:27Z, greggirwin, commented:
<https://github.com/red/red/issues/1869#issuecomment-471049362>

    @Oldes, on Windows, that's not the standard behavior. Not saying we can't do it, but maybe we should check other platforms to see what they do.

--------------------------------------------------------------------------------

On 2020-07-17T16:13:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/1869#issuecomment-660196011>

    I think it magically fixed itself one day ☻
    Can't reproduce on W7.
    Anyone still having the issue?

--------------------------------------------------------------------------------

On 2020-07-17T18:06:03Z, greggirwin, commented:
<https://github.com/red/red/issues/1869#issuecomment-660261076>

    Seems fine here on Win10. 

