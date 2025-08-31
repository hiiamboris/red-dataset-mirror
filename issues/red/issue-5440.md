
#5440: [View] Platform discrepancy in `offset: none`
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[GUI]
<https://github.com/red/red/issues/5440>

**Describe the bug**

View allows faces to have `offset: none` (produces no error), however:
- on Windows this shows the face at `0x0` but keeps `offset = none`
- on GTK this replaces `offset` with `(0,0)`

Windows behavior only leads to additional errors. I for example forgot to update `template/init` for new developments and `offset` was uninitialized, but I discovered that much further in the code that is using `offset`, not immediately after `view`.

**To reproduce**

Run this:
```
view [
    panel [] on-created [
		append face/pane f: make-face 'field
		react [?? f/offset]
    ]
]
```
Observe that the face is displayed at 0x0, and f/offset reported as still `none`, which is a gotcha for a lot of code:
![](https://link.storjshare.io/raw/jxfnjjold7d4xtoupll4mp7ychkq/img/AeNycbY.png)

**Expected behavior**

Either as on GTK, or an error.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5060 date: 22-Nov-2023/14:24:25 commit: #34f26dff0dfc467b9df7862f59c5220c5f508110 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 5063 date: 23-Nov-2023/9:52:23 commit: #e286183ea4239f00b96e850476dfa1e9dd635df6 ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.90 build: "#1 SMP Fri Jan 27 02:56:13 UTC 2023" ]
--------------------------------------------
```


