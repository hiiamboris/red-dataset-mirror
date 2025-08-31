
#5429: Tabbing has no effect when window got the focus
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/5429>

**Describe the bug**

When no face is focused and window gets the Tab key event, it's best to set focus to the first focusable face in that window.

Currently it's not handled.

**To reproduce**

1. `view [field field]`
2. Press Tab - it won't focus anything

Also an interplay with bug https://github.com/red/red/issues/5308:
1. `view [button "x" field]`
2. Click on the button
3. Click on any other window
4. Activate the window (1) again
5. Press Tab - it won't focus anything despite button was focused by a click

**Expected behavior**

Focus first (on Tab) or last (on Shift-Tab) focusable.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5055 date: 20-Nov-2023/4:01:50 commit: #5092db2fb82528f1b72bf2220c81a1627dff0ab5 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-11-21T19:33:37Z, greggirwin, commented:
<https://github.com/red/red/issues/5429#issuecomment-1821560780>

    I have to say, even with the new issues that have come up for tabbing, it's a game-changer and a great feature.

