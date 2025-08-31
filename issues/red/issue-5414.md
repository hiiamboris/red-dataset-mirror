
#5414: [Regression] Window size is not always up to date anymore
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5414>

**Describe the bug**

It seems the fix for https://github.com/red/red/issues/5393 was incomplete, as the same issue now exists for every window:

Maximization of the window, as well as Win+Left, Win+Right, Win+Up, Win+Down hotkeys do affect the visible size, but not affect the /size and /offset facets of the window face.

**To reproduce**

Run this code:
```
w: view/options/no-wait [] [flags: 'resize] react [print [w/offset w/size]] do-events
```
Try any of the mentioned above resizing operations.
Events do happen, but output with all of them does not reflect any changes at all:
```
(590, 310) 100x100
(590, 310) 100x100
(590, 310) 100x100
(590, 310) 100x100
(590, 310) 100x100
(590, 310) 100x100
(590, 310) 100x100
(590, 310) 100x100
(590, 310) 100x100
(590, 310) 100x100
(590, 310) 100x100
(590, 310) 100x100
(590, 310) 100x100
(590, 310) 100x100
(590, 310) 100x100
(590, 310) 100x100
(590, 310) 100x100
```

**Expected behavior**

In the older `red+view-master-2023-09-27-5d48fb9.exe` console:
```
(590, 310) 117x100
(590, 310) 117x100
(640, 0) 117x100
(640, 0) 625x642
(640, 0) 625x642
(640, 0) 625x302
(640, 0) 625x302
(-7.333333, -7.333333) 625x302
(-7.333333, -7.333333) 1280x657
(-7.333333, -7.333333) 1280x657
(-7.333333, -7.333333) 640x657
(-7.333333, -7.333333) 640x657
(-7.333333, -7.333333) 640x657
(-7.333333, -7.333333) 640x657
(-7.333333, -7.333333) 640x657
(0, 0) 640x657
(0, 0) 625x642
(0, 0) 625x642
(0, 340) 625x642
(0, 340) 625x302
```

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5035 date: 27-Oct-2023/7:22:30 commit: #d13526fb24e8cc4c36c7be7955d3644b97ca80c5 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```



