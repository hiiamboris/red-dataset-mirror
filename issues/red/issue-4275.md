
#4275: [View] Wheels behavior is inconsistent between Windows versions
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.review] [GUI] [GUI.Win7]
<https://github.com/red/red/issues/4275>

[January 31, 2020 3:48 PM](https://gitter.im/red/red/gui-branch?at=5e342230bfe65274eacda089)

**Describe the bug**

This code:
`view [base on-wheel [print event/picked]]`
Produces wheel events on W10, but not on W7 (not unless base has `focus` that is).

**Expected behavior**

Consistent behavior across platforms

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 13-Jan-2020/17:41:02+03:00 commit #938744f
```



Comments:
--------------------------------------------------------------------------------

On 2020-04-04T11:02:32Z, qtxie, commented:
<https://github.com/red/red/issues/4275#issuecomment-609011839>

    W7 won't send wheel events to unfocused window. I use [wizmouse](https://antibody-software.com/web/software/software/wizmouse-makes-your-mouse-wheel-work-on-the-window-under-the-mouse/) to solve it. Though we should be able to simulate the same behavior on W7 in the backend.

--------------------------------------------------------------------------------

On 2020-06-30T12:51:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/4275#issuecomment-651770479>

    I just checked - on W8.1 it's buggy too. Although I don't have a wheel - just using a two-finger gesture on touchpad. With explicit `focus` I get wheel events, without - nothing.
    I wonder what's different on W10? Does one have to keep the mouse pointer over the base for it to produce events, or it just gets focused somehow by default? What if another face has focus? Will it still drop wheel events to the base instead of the focused face?

--------------------------------------------------------------------------------

On 2020-07-01T20:53:37Z, greggirwin, commented:
<https://github.com/red/red/issues/4275#issuecomment-652641229>

    I will only note that Win8 is a much lower priority than 7 and 10. Maybe a non-priority. :^\

