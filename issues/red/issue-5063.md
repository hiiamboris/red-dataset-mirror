
#5063: Console quits from on-time event (crash?)
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5063>

**To reproduce**

Enter this into (any) console:
```
>> append/only b: [] b  view [base rate 60 on-time [face/draw: b]]
*** Internal Error: circular reference not allowed
*** Where: body
*** Near : none
*** Stack:
```
Console quits after printing the error.

**Expected behavior**

Should not quit.

**Platform version**
```
Red 0.6.4 for Windows built 25-Jan-2022/14:48:41+03:00  commit #dbbe6e0
```



