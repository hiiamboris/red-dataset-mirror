
#5081: [View] Some label texts cannot be used
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5081>

**Describe the bug**
```
view [text ";" text " " text "^/" text "^@" text "^Z"]
```
All five text faces fail to init with a message:
```
*** Script Error: invalid argument: none
*** Where: find
*** Near : new attempt/safer [load new]
*** Stack: view layout 
```
No window is shown.

**Expected behavior**

Visible text shown, invisible ignored. Five text faces.

**Platform version**
```
Red 0.6.4 for Windows built 25-Jan-2022/14:48:41+03:00  commit #dbbe6e0
```



