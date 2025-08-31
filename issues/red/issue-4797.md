
#4797: Styles named after a block variable nuke VID parser
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/4797>

**Describe the bug**
```
b: []
view [
    style b: button 100
    b "1" b "2" b "3"
]
```
Outputs:
```
*** Script Error: VID - invalid syntax at: ["2" b "3"]
*** Where: do
*** Stack: view layout cause-error 
```
Set `b:` to anything but a block and no errors.
Go figure.

**Expected behavior**

A layout shown.

**Platform version**
```
Red 0.6.4 for Windows built 20-Dec-2020/21:04:56+03:00 commit #7a6d9a9
```



