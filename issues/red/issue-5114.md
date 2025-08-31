
#5114: Time machine invented! (limited edition available to Windows users only)
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5114>

**Describe the bug**

Travel is only possible below 1ms interval:
```
>> loop 100000 [t: dt [loop 1000 []] if t < 0 [probe t]]
-0:00:00.0001423
-0:00:00.0004906
-0:00:00.000496
-0:00:00.0002614
-0:00:00.0002522
-0:00:00.000193
-0:00:00.0001922
-0:00:00.0001845
-0:00:00.0008752
-0:00:00.0007614
-0:00:00.0006072
-0:00:00.0009339
...
```
Bug is in negative remainder handling in platform-get-time on Windows.

**Expected behavior**

Nonnegative time deltas.

**Platform version**
```
Red 0.6.4 for Windows built 11-Mar-2022/2:40:53+03:00  commit #27f71f9
```



