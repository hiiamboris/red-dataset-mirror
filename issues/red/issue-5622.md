
#5622: [View] GUI console caret is borked after `unview`
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5622>

**Describe the bug**

Since the multi monitor feature introduction, the GUI console caret needs manual reset after every window closed:

<img width=300 src=https://link.storjshare.io/raw/jwtiabvp6myahg3zzf3q5zoii7la/gif/shared/GIF%2023-06-2025%2016-49-56.gif />

**To reproduce**
1. Open and close a window in GUI console
2. Watch the caret misbehaving

**Expected behavior**

Caret should stay where the input is going to.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 73 date: 18-Jun-2025/9:52:24 commit: #3d9dd1fe542723763562536199caf4f25cad6488 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------
```


