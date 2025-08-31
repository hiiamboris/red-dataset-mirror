
#5601: [View] Faces stay connected to the screen after destruction
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5601>

**Describe the bug**

Extracted from https://github.com/red/red/issues/5578
```
>> view [b: base rate 99 on-time [unview]] ? b/parent/type ? b/parent/parent/type
B/PARENT/TYPE is a word! value: window

B/PARENT/PARENT/TYPE is a word! value: screen
```

**Expected behavior**

Closed window should not be connected to the screen.

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 514 date: 14-Mar-2025/16:49:57 commit: #eb868ae2d2d22e34217b29ed48f774cc2c457dca ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```




