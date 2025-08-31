
#5109: [GTK] no `wheel` event at all?
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [GUI] [GUI.GTK]
<https://github.com/red/red/issues/5109>

**Describe the bug**
```
view [text-list data repeat x 30 [append [] form x] focus on-wheel [probe event/picked]]
```
shows a text-list, allows to scroll it (I'm using touchpad), but `on-wheel` never fires

Same for `base`, `area`, likely other faces

**To reproduce**

Try wheel-scrolling the above face

**Expected behavior**

`on-wheel` event generated

**Platform version**
```
Red 0.6.4 for Linux built 15-Mar-2022/17:14:51+03:00  commit #af98e79
```



Comments:
--------------------------------------------------------------------------------

On 2022-08-12T03:37:24Z, qtxie, commented:
<https://github.com/red/red/issues/5109#issuecomment-1212698176>

    I get this event for `base` and `area`, but not for `text-list`.

--------------------------------------------------------------------------------

On 2022-08-12T07:55:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/5109#issuecomment-1212834828>

    What code are you using to get it for `base` and `area`?

--------------------------------------------------------------------------------

On 2022-08-12T08:25:36Z, qtxie, commented:
<https://github.com/red/red/issues/5109#issuecomment-1212859575>

    > What code are you using to get it for `base` and `area`?
    
    ```
    view [area "jfdklkkjf" on-wheel [probe event/picked]]
    view [base "jfdklkkjf" on-wheel [probe event/picked]]
    ```

--------------------------------------------------------------------------------

On 2022-08-12T08:46:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/5109#issuecomment-1212877230>

    Confirmed, in latest build it works. After the fix? In an older build no wheel events for any face.

