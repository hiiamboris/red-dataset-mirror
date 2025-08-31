
#4898: [Regression, Draw] Memory corruption when reusing a font
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4898>

**Describe the bug**
```
fnt: make font! []
view [base data make image! 100x100 rate 3 on-time [print "⚡" face/draw: [font fnt]]]
```
This crashes after 2 lightnings:
```
⚡
⚡

*** Runtime Error 1: access violation
*** in file: �1
*** at line: 1818845542
***
```

With no image it's less crashy but random:
```
fnt: make font! []
view [base rate 3 on-time [print "⚡" face/draw: [font fnt]]]
```
Gui console output stops after 4 lightnings, but (it's a debug console) CLI output from it continues:
```
⚡
⚡
⚡
⚡
*** Script Error: value out of range: 4
*** Where: poke
*** Stack: view do-events do-actor do-safe error? do-actor do-safe 
⚡
⚡
⚡
⚡
⚡
```
While CLI console still crashes like in the 1st snippet.

**Expected behavior**

Just lightnings printed.

**Platform version**
```
Red 0.6.4 for Windows built 11-May-2021/19:00:20
```



Comments:
--------------------------------------------------------------------------------

On 2021-05-12T03:15:12Z, qtxie, commented:
<https://github.com/red/red/issues/4898#issuecomment-839400830>

    Emoji with colors is back. 😀

