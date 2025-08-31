
#5415: `to money! <string>` parses extra characters as part of number
================================================================================
Issue is closed, was reported by ALANVF and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5415>

**Describe the bug**
When converting `any-string!` to `money!` via `to money!`, extra characters before the number part are interpreted as "digits" and severely affect the output.

**To reproduce**
Steps to reproduce the behavior:
1. Open repl
2. Enter any non-digit character before a number
3. Now you have a weird number

**Expected behavior**
A parsing error, ideally.

**Screenshots**
![image](https://github.com/red/red/assets/16247881/dd85175b-270b-487f-9cf1-a25535353288)

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5016 date: 7-Oct-2023/12:51:08 commit: #0c725159d597ab8ee6bb8b42fd7d020e892fa351 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19042 ]
--------------------------------------------
```


