
#5084: [Regression] CRASH and stack CORRUPTION in Draw
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[type.bug] [status.resolved] [GUI]
<https://github.com/red/red/issues/5084>

Regressed between `red-22jul21-3c8d386e1.exe` and `red-02sep21-579b9d3d7.exe`

**Describe the bug**
```
view [
    box 0.0.0.254 900x600 draw b: [] all-over
    on-over [if event/down? [probe append b 'xyz]] 
]
```
1. Run this in console
2. Push LMB down and move

Output:
```
*** Script Error: invalid Draw dialect input at: [xyz]
*** Where: ???
*** Near : no
[...]
*** Script Error: invalid Draw dialect input at: [xyz xyz]
*** Where: ???
*** Near : no
result

*** Runtime Error 1: access violation
*** in file: U.
*** at line: 1818845542
***
```

**Expected behavior**

Just an error printed.

Also, more realistic test should draw something:
```
view [
    im: box 0.0.0.254 900x600 draw [] all-over 
        on-over [if event/down? [append face/draw event/offset]] 
        on-down [append face/draw reduce ['line-width 3 'line event/offset]]
]
```
<img src=https://i.gyazo.com/1f638117b7bef8b8cab68be241bfbfe2.gif width=200></img>

**Platform version**
```
Red 0.6.4 for Windows built 17-Feb-2022/14:39:17+03:00  commit #c976906
```



Comments:
--------------------------------------------------------------------------------

On 2022-08-29T02:37:04Z, qtxie, commented:
<https://github.com/red/red/issues/5084#issuecomment-1229681235>

    Tried in gui-console on both Linux and Windows, no crashes anymore. Using commit: 3d581ece32afbc6e1ecd75dde53be775850bc6b5

--------------------------------------------------------------------------------

On 2022-08-29T07:09:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/5084#issuecomment-1229868600>

    Yes, must be recent object fixes.

