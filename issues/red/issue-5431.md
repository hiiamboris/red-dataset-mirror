
#5431: [Regression] `make-face` mistreats template's `init` now
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5431>

**Describe the bug**

Caused by https://github.com/red/red/commit/52f43975f765619fa0bf7f8cc169611535daaba6
```
>> make-face 'image 
*** Script Error: image has no value
*** Where: unless
*** Near : unless image [image: make image! size]
*** Stack: make-face
```

**Expected behavior**

`image` face object created

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5055 date: 20-Nov-2023/4:01:50 commit: #5092db2fb82528f1b72bf2220c81a1627dff0ab5 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


