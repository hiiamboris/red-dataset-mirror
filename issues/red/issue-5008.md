
#5008: `drop-down` does not update its text property
================================================================================
Issue is open, was reported by toomasv and has 16 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5008>

`drop-down` does not update its text property.

**To reproduce**
Enter `view [drop-down focus on-key [probe face/text]]` in console and add few characters. 

At least up to April 12th this worked. In May 17 build it doesn't work any more.

**Expected behavior**
`drop-down` should update its text property when text is changed.

**Platform version**
```
Red 0.6.4 for Windows built 1-Dec-2021/3:14:20+02:00  commit #81b7e69
```



Comments:
--------------------------------------------------------------------------------

On 2022-08-13T19:00:48Z, hiiamboris, commented:
<https://github.com/red/red/issues/5008#issuecomment-1214207229>

    `on-change` works in the original snippet in `Red 0.6.4 for Windows built 12-Aug-2022/11:29:58`
    However this doesn't:
    ```
    view [drop-down data ["a"] select 1 rate 1 on-time [probe face/text]]
    ```
    Prints `none` while displaying `"a"`

--------------------------------------------------------------------------------

On 2022-08-15T12:11:12Z, dockimbel, commented:
<https://github.com/red/red/issues/5008#issuecomment-1214942309>

    > drop-down does not update its text property.
    
    Actually it does, but after the `key` event. You should use `key-up` event in this case, if you want the `/text` facet fully updated.

--------------------------------------------------------------------------------

On 2022-08-16T11:50:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/5008#issuecomment-1216530102>

    [reminder for myself once I get to write regression tests for this issue](https://github.com/red/red/commit/19ebddde32e20ade110f54e55b3c599062fd02d6#commitcomment-81213457)

--------------------------------------------------------------------------------

On 2023-10-31T17:40:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/5008#issuecomment-1787685294>

    It's still not working:
    ![](https://i.gyazo.com/baa372205095bffa0303d0d23dfea4a7.gif)
    
    Try `view [drop-down data ["a" "b" "c"] select 2 with [text: none] rate 1 on-time [probe face/text]]`: initial text displayed and text reported differ, re-selecting item 2 doesn't affect it.
    
    Try `view [drop-down data ["a" "b" "c"] select 1 with [text: "c"] rate 1 on-time [probe face/text]]`: selecting item 1 changes displayed text but not reported one.

--------------------------------------------------------------------------------

On 2023-11-01T07:42:53Z, qtxie, commented:
<https://github.com/red/red/issues/5008#issuecomment-1788542818>

    > Try view [drop-down data ["a" "b" "c"] select 2 with [text: none] rate 1 on-time [probe face/text]]: initial text displayed and text reported differ, re-selecting item 2 doesn't affect it.
    
    It is the intended result.
    https://github.com/red/red/blob/master/modules/view/backends/windows/events.reds#L815

--------------------------------------------------------------------------------

On 2023-11-01T07:46:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/5008#issuecomment-1788545841>

    Obviously intent was to avoid event if current text and selected item text were the same, not the way it really works.

--------------------------------------------------------------------------------

On 2023-11-01T07:55:18Z, qtxie, commented:
<https://github.com/red/red/issues/5008#issuecomment-1788554426>

    But the `face/text` is updated in VID, not in the backend code.

--------------------------------------------------------------------------------

On 2023-11-01T07:58:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/5008#issuecomment-1788557369>

    Does it matter? The ground truth is that text displayed to the user should always be equal to /text facet. Otherwise the design is broken.

