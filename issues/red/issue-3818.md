
#3818: [View] menu instantly disappears when shown
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[type.review] [GUI]
<https://github.com/red/red/issues/3818>

**Describe the bug**

This code should show a menu when right-clicked on a base:
```
Red [needs: view]
view [panel [base with [menu: ["a" a]] on-menu [probe event/picked]]]
```
It works in GUI console.

When ran as `red --cli ...` or from any (CLI/GUI) custom-built console (with rebol from sources) the menu is shown and then instantly disappears. I can barely notice that it was shown at all. Same behavior for any face.

Removing `panel` fixes it.

**Screenshots**
![](https://i.gyazo.com/b75a163c2a8b439d150dde388e5d04d7.gif)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 13-Mar-2019/6:42:17+03:00 commit #0af69a5
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-14T16:07:15Z, qtxie, commented:
<https://github.com/red/red/issues/3818#issuecomment-472938077>

    It works well on Win10.

--------------------------------------------------------------------------------

On 2019-03-15T22:52:55Z, endo64, commented:
<https://github.com/red/red/issues/3818#issuecomment-473465652>

    Works for me too (Win10), @hiiamboris Are you on Win7 or Win8.1?

--------------------------------------------------------------------------------

On 2019-03-15T23:00:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/3818#issuecomment-473466957>

    W7

--------------------------------------------------------------------------------

On 2020-02-26T20:57:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/3818#issuecomment-591639981>

    I'm closing this as the *only way* I can reproduce it is when I start `red` from ConEmu. It does some hijacking of system calls so I suspect it's the cause.

