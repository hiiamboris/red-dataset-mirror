
#4776: [Regression] `ask` won't show GUI console
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4776>

**Describe the bug**

```
Red [file: %1.red]
ask "what"
```
`red 1.red` ~~quits silently~~ silently stays in the process list doing nothing

**Expected behavior**

Input line shown

**Platform version**
```
Red 0.6.4 for Windows built 20-Dec-2020/21:04:56+03:00 commit #7a6d9a9
```



