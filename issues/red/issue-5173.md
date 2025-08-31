
#5173: [View, Regression] `size-text` doesn't take width into account anymore
================================================================================
Issue is closed, was reported by hiiamboris and has 20 comment(s).
[status.dismissed] [type.review] [GUI]
<https://github.com/red/red/issues/5173>

**Describe the bug**
```
>> r: rtd-layout ["abcdefghijkl"]
>> r/size: 50x50
>> size-text r
== 64x16    ;) single line wider than 50 px!
```

**Expected behavior**

Multi-line formatting (e.g. `50x32`). Was working in `Red 0.6.4 for Windows built 27-Jun-2022/11:51:28+03:00  commit #ed73e33`

**Platform version**
```
Red 0.6.4 for Windows built 11-Aug-2022/12:30:09 a20de412227b7f411f5082422c34ae2966ff47f7
```



Comments:
--------------------------------------------------------------------------------

On 2022-08-11T13:12:57Z, dockimbel, commented:
<https://github.com/red/red/issues/5173#issuecomment-1211971913>

    I think I'll really remove that "priority.high" label, as it's abused too much.

--------------------------------------------------------------------------------

On 2022-08-11T13:15:40Z, dockimbel, commented:
<https://github.com/red/red/issues/5173#issuecomment-1211975164>

    That code works as expected after the [recent fix](https://github.com/red/red/commit/2cfd1b0fe3f8418dbc57d2f81e7dc8cc3ee43914) making the text not auto-wrap by default. If you want to force it to fit inside the face size limits, you need to set the `para/wrap?` property to `true`.
    
    ```
    >> r: rtd-layout ["abcdefghijkl"]
    >> r/para: make para! [wrap?: yes]
    >> r/size: 50x50
    >> size-text r
    == 50x32
    ```

--------------------------------------------------------------------------------

On 2022-08-11T13:47:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/5173#issuecomment-1212014640>

    Great, yet another object to spawn.

--------------------------------------------------------------------------------

On 2022-08-11T14:47:32Z, qtxie, commented:
<https://github.com/red/red/issues/5173#issuecomment-1212090276>

    Well, if wrapping is expected in most of the cases. We should make it default.

--------------------------------------------------------------------------------

On 2022-08-11T14:57:40Z, dockimbel, commented:
<https://github.com/red/red/issues/5173#issuecomment-1212107695>

    @qtxie That's fine with me as the default as long as the user can control it using `para`.

--------------------------------------------------------------------------------

On 2022-08-11T14:58:44Z, dockimbel, commented:
<https://github.com/red/red/issues/5173#issuecomment-1212109320>

    > Great, yet another object to spawn.
    
    That depends on the use-case.

--------------------------------------------------------------------------------

On 2022-08-11T15:24:33Z, dockimbel, commented:
<https://github.com/red/red/issues/5173#issuecomment-1212141868>

    The non-wrapping default creates trouble in the GUI console input line too. When the input line is too long, it does not wrap but goes out of the window.

--------------------------------------------------------------------------------

On 2022-08-11T16:04:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/5173#issuecomment-1212189375>

    Actually, I'm fine with this, just created a shared para object.
    
    Although IMO it's a design issue that there are two separate levers that have to be pulled in order to turn wrapping on: `size/x` and `para/wrap?`. One (`size/x`) should be enough (in "reducing complexity" mindset). Not saying we should dive into View issues & designs right now, but as a food for thought, for after 1.0.
    
    P.S. `priority.high` was because this is the only text metric that works. If it's broken, it's a blocker.

--------------------------------------------------------------------------------

On 2022-08-11T22:40:59Z, qtxie, commented:
<https://github.com/red/red/issues/5173#issuecomment-1212565165>

    OK. I'll revert to auto-wrap by default as it was the default mode since a long time and there are several apps rely on it.
    
    > One (size/x) should be enough
    
    What if I don't want it to wrap even with a small `size/x`. `size` is for setting the bounding box, not for controlling the wrapping. `size` do affects it as well as `font-size`, `font style`.

--------------------------------------------------------------------------------

On 2022-08-12T07:47:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/5173#issuecomment-1212829537>

    > What if I don't want it to wrap
    
    Set size to `none`. Of course it will be a problem for a visible rich-text face and I understand the design. But it still seems superfluous a bit. And see https://github.com/red/REP/issues/124 for much more excessive parts of the design.

