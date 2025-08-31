
#5410: [GTK] Overlapping colors rendering differs from Windows
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[GUI.GTK]
<https://github.com/red/red/issues/5410>

**Describe the bug**

On Windows translucent color is applied any number of times it's listed in the /data facet, while on GTK new values override the old ones:

| Windows | GTK |
|-|-|
| ![https://i.gyazo.com/e4818d469d4bedfbf1bea951fce3196b.png](https://i.gyazo.com/e4818d469d4bedfbf1bea951fce3196b.png) | ![https://i.gyazo.com/9321932eea373a240f939d954ad5b59b.png](https://i.gyazo.com/9321932eea373a240f939d954ad5b59b.png) |

**To reproduce**

`view [rich-text 120x30 "lorem ipsum" data [1x11 backdrop 200.0.0.200 1x5 backdrop 200.0.0.200]]`

**Expected behavior**

Consistent behavior. Windows one seems more useful, as it's easier to obtain GTK behavior based on Windows one than the other way around (latter requires not only segment exclusion but also color blending).

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5031 date: 17-Oct-2023/22:48:48 commit: #c9f4194ce33d7d1b7057855508f16887ef2324db ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------

-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 5021 date: 10-Oct-2023/16:32:02 commit: #2a2ce39323f1832a00f599b54724e4e182e64cf5 ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.90 build: "#1 SMP Fri Jan 27 02:56:13 UTC 2023" ]
--------------------------------------------
```


