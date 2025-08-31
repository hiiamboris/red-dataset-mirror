
#3615: [Crash] on some invalid parse usage
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3615>

**Describe the bug**
```
>> x: 1 parse "1" [collect into x [] collect []]

*** Runtime Error 1: access violation
*** at: 00424A83h
```
Shouldn't crash like that. Also shouldn't crash if `x` was never declared (it does now).

**Expected behavior**
Let's modify it slightly:
```
>> x: 1 parse "1" [collect into x [fail] collect []]
== false

>> x: 1 parse "1" [collect into x [keep "1"] collect []]
*** Script Error: PARSE - COLLECT INTO/AFTER expects a series! argument
*** Where: parse
*** Stack:
```
1st is debatable, but OK. 2nd is what one would expect.

**Platform version(please complete the following information):**
```
Red 0.6.4 for Windows built 26-Nov-2018/19:49:34+03:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-11T15:17:44Z, dockimbel, commented:
<https://github.com/red/red/issues/3615#issuecomment-446239050>

    Good catch! :+1:

