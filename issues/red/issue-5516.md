
#5516: [View] `alt` flag is unreliable
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/5516>

**Describe the bug**

It seems that `alt` flag gets reported on key events and `click`, but not on `down`, `up` or `over` events. Which quite complicates the Alt+click detection.

**To reproduce**

Try `view [base all-over on-down [?? event/flags]]`: produces just `[down]` output. Similarly `on-up`, `on-over`.

**Expected behavior**

Reliable `alt` flag

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 167 date: 19-Jun-2024/9:28:23 commit: #5195586f4fbba248092a11893476d76717e4491e ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```
Not limited to Windows: I get the same problem on GTK.


Comments:
--------------------------------------------------------------------------------

On 2024-06-29T12:23:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/5516#issuecomment-2198139639>

    That worked for Windows, but not GTK.

