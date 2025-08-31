
#4777: [Regression] `--catch` option won't show GUI console prompt anymore
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4777>

**Describe the bug**
```
Red [file: %1.red]
```
`red --catch 1.red` silently stays in the process list doing nothing (same as in https://github.com/red/red/issues/4776)

**Expected behavior**

Prompt shown after script finishes.

**Platform version**
```
Red 0.6.4 for Windows built 20-Dec-2020/21:04:56+03:00 commit #7a6d9a9
```



Comments:
--------------------------------------------------------------------------------

On 2020-12-21T17:45:26Z, greggirwin, commented:
<https://github.com/red/red/issues/4777#issuecomment-749106485>

    Thanks @hiiamboris. I thought this one had been reported. It's my daily pain. :^)

