
#3656: access violation on setting PANE facet to non-SERIES! value
================================================================================
Issue is closed, was reported by 9214 and has 16 comment(s).
[status.deferred]
<https://github.com/red/red/issues/3656>

**Describe the bug**
Title.

**To Reproduce**
```red
view [button [face/pane: 'boom]]
```
Clicking on the button results in:
```
*** Runtime Error 1: access violation
*** at: 004CE8B5h
```

**Expected behavior**
Meaningful error message or poka-yoke disregard of a change.

**Platform version (please complete the following information):**
```
Red 0.6.4 for Windows built 11-Dec-2018/7:46:27+05:00 commit #02c277d
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-12T20:31:17Z, greggirwin, commented:
<https://github.com/red/red/issues/3656#issuecomment-446733211>

    Confirmed.

--------------------------------------------------------------------------------

On 2018-12-13T11:49:42Z, dockimbel, commented:
<https://github.com/red/red/issues/3656#issuecomment-446941243>

    As a side-note, they are many ways to crash face objects currently, as the backends implement very little type-checking on facets for now. So I would consider such issues as low priority for now, until we get closer to 1.0.

--------------------------------------------------------------------------------

On 2018-12-15T19:53:45Z, endo64, commented:
<https://github.com/red/red/issues/3656#issuecomment-447593636>

    @dockimbel Should we add a milestone (ex. 0.9.x) to this and these kind of issues to not examine them again. Later we can fine tune the milestones, like we did with 0.6.4 and 0.6.5.

--------------------------------------------------------------------------------

On 2019-08-20T11:47:37Z, dockimbel, commented:
<https://github.com/red/red/issues/3656#issuecomment-522977433>

    @endo64 I have at least one 0.9.x milestone planned for searching for all the ways to crash the runtime code and fixing them. I also have one for cleaning up and polishing all the language features, so that we can get a solid 1.0 design-wise too.

--------------------------------------------------------------------------------

On 2020-03-08T13:02:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/3656#issuecomment-596203400>

    FYI the provided snippet doesn't crash for me on W7. Tried multiple builds down to 0.6.1.
    ![](https://i.gyazo.com/da3dff41494ed2389808ced22423d8e1.png)

--------------------------------------------------------------------------------

On 2020-03-08T13:05:50Z, 9214, commented:
<https://github.com/red/red/issues/3656#issuecomment-596203707>

    @hiiamboris that's cool, but you should really click that button.

--------------------------------------------------------------------------------

On 2020-03-08T13:09:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/3656#issuecomment-596204098>

    I did ☻ Nevermind, I see that the console crashes *after I click it and then close the window*

--------------------------------------------------------------------------------

On 2020-06-27T20:27:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/3656#issuecomment-650619274>

    It doesn't crash now, yet there's still an issue with this:
    ```
    >> view [button [face/pane: 'boom]]        ;) ....then click the button
    *** Script Error: foreach does not allow word for its series argument
    *** Where: foreach
    *** Stack: view do-events do-actor do-safe show 
    ```
    Should such internal errors pop out?

