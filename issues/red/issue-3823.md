
#3823: [View] `event` gets corrupted inside an actor by another `view []`
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3823>

**Describe the bug**

Try this:
```
view [
  base cyan on-down [
    probe event/offset
    view [base purple rate 3 on-time [unview]]
    probe event/offset
  ]
]
```
Click on the base and see another window appearing then disappearing.
Output is like this:
```
35x42    ;) event at the actor entry was correct
0x0      ;) after view invocation it is corrupted
```

**Expected behavior**

`event` should be preserved until the actor finishes.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 13-Mar-2019/6:42:17+03:00 commit #0af69a5
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-27T17:06:11Z, greggirwin, commented:
<https://github.com/red/red/issues/3823#issuecomment-477257733>

    Confirmed on Win10.

--------------------------------------------------------------------------------

On 2019-05-23T08:29:53Z, qtxie, commented:
<https://github.com/red/red/issues/3823#issuecomment-495119744>

    No corruption in the latest version anymore.

--------------------------------------------------------------------------------

On 2019-05-23T17:24:48Z, greggirwin, commented:
<https://github.com/red/red/issues/3823#issuecomment-495309880>

    Looks good on Win10 here now.

