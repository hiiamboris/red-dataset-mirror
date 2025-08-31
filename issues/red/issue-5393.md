
#5393: Regression: GUI console's initial size is broken
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5393>

**Describe the bug**

I see this when I start the GUI console:
![](https://i.gyazo.com/8402d42155e40bb02b9880f77c2ae17f.png)
Apparently a result of https://github.com/red/red/compare/13130f78f0bd...007e2092c3b9 or parent commit.

It fixes itself when I resize it by hand, but not when using Win+Up, Win+Right, etc. shortcuts.

**Expected behavior**

Proper console window.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5002 date: 30-Sep-2023/3:37:28 commit: #007e2092c3b94b6ffbe6d165ba076a4e80286c74 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


