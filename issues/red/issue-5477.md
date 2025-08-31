
#5477: A CRASH happens when using IN to access a member of an ERROR!.
================================================================================
Issue is closed, was reported by luce80 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5477>

**Describe the bug**
A crash happens when using `in` to access a member of an `error!`.

**To reproduce**
```
in try [1 / 0] 'id
```
**Expected behavior**
No crash.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5092 date: 24-Jan-2024/4:14:00 commit: #10dc97b01cda5bb347f2ca5741da7a82f02b37a4 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------
```


