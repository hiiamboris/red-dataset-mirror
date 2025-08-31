
#5433: [Regression, D2D] `caret-to-offset` has 0.5px shift
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5433>

**Describe the bug**

In `red-view-11aug23-baa93a6dc.exe`:
```
>> caret-to-offset rtd-layout [" abc"] 1
== (0, 0)
>> caret-to-offset rtd-layout [" abc"] 2
== (3.287109, 0)
```

Since `red-view-18aug23-4fc17a45c.exe`:
```
>> caret-to-offset rtd-layout [" abc"] 1
== (0.5, 0.5)
>> caret-to-offset rtd-layout [" abc"] 2
== (3.787109, 0.5)
```

**To reproduce**

```
caret-to-offset rtd-layout [" abc"] 1
caret-to-offset rtd-layout [" abc"] 2
```

**Expected behavior**

No weird offsets.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5059 date: 22-Nov-2023/12:37:39 commit: #41efbaa8526dcc816811264cd2dca9341fda3bf7 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-11-22T17:40:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/5433#issuecomment-1823212949>

    Somewhat related https://github.com/red/red/issues/5353

