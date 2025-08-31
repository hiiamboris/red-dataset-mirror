
#5308: [View] Buttons do not report their focus
================================================================================
Issue is open, was reported by hiiamboris and has 16 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5308>

**Describe the bug**

All button styles (button, radio, check, toggle) get focused on clicks but this focus is undetectable:
![](https://i.gyazo.com/a0fcba998b886a4369e50dfaf2ecd38d.gif)

**To reproduce**

1. run this:
```
actor: func [face event] [?? event/window/selected] 
view [below toggle "a" :actor radio "b" :actor radio "c" :actor check "d" :actor button "e" :actor]
```
2. click on any buttons
3. observe focus frame being drawn and buttons reacting to keyboard input
4. observe that `window/selected` is not set

**Expected behavior**

`window/selected` being set to focused control

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4667 date: 9-Apr-2023/3:24:34 commit: #d36108eeffeafbf14839b5a9cadc9a0acd87f34a ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-04-27T20:39:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/5308#issuecomment-1526407592>

    Relevant Mac issue https://github.com/red/red/issues/2820

--------------------------------------------------------------------------------

On 2023-11-21T17:12:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/5308#issuecomment-1821329793>

    This also seems part of the same issue:
    ![](https://i.gyazo.com/22837dd4b60a6a49a7a122bb1d44ff09.gif)
    
    Open 2 windows:
    ```
    view/no-wait/options [button "a" [print "a"] field "b"] [offset: 600x100]
    view/no-wait/options [button "c" [print "c"] field "d"] [offset: 600x170]
    ```
    When any button is focused by a click, and then window gets deactivated and activated again, then focus jumps back to the other widget where it was before the button.

--------------------------------------------------------------------------------

On 2023-11-22T14:28:51Z, dockimbel, commented:
<https://github.com/red/red/issues/5308#issuecomment-1822878897>

    That last issue seems to have been fixed by https://github.com/red/red/commit/34f26dff0dfc467b9df7862f59c5220c5f508110. Can you confirm?
    
    However, the original issue is still there, `window/selected` still returns `none`.

--------------------------------------------------------------------------------

On 2023-11-22T14:36:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/5308#issuecomment-1822891836>

    The fix is unrelated, and I can reproduce the latter issue as well.

--------------------------------------------------------------------------------

On 2023-11-22T19:05:29Z, dockimbel, commented:
<https://github.com/red/red/issues/5308#issuecomment-1823333253>

    @hiiamboris @qtxie Please check if this issue exists on non-Windows platforms too.

--------------------------------------------------------------------------------

On 2023-11-22T19:07:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/5308#issuecomment-1823337791>

    I confirm it's the same on GTK.

--------------------------------------------------------------------------------

On 2023-11-22T19:09:11Z, dockimbel, commented:
<https://github.com/red/red/issues/5308#issuecomment-1823340843>

    I'll let @qtxie fix it on GTK.

--------------------------------------------------------------------------------

On 2023-11-22T19:14:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/5308#issuecomment-1823352643>

    Reopening then until fully fixed.

