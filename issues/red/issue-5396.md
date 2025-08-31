
#5396: [GTK, Draw] `arc` interrupts the shape
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI.GTK]
<https://github.com/red/red/issues/5396>

**Describe the bug**

Code:
```
view [box draw [fill-pen pink shape [arc 80x0 100 100 0 line 80x80 arc 0x80 100 100 0 close]]]
```
| W10 | GTK |
|-|-|
| ![](https://i.gyazo.com/0341d5757a4923c3266c8a1e71bdd9e3.png) | ![](https://i.gyazo.com/e846d8ae447edd309c1f42c6126206a9.png) |

**Expected behavior**

As W10

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5010 date: 3-Oct-2023/12:44:34 commit: #b95ac42030c7ba7259a7e831c553f0ecca245a38 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------

-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 4805 date: 18-Jul-2023/19:56:01 commit: #af3d35a2f444b3d02058226effd63714eb4bf2bc ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.90 build: "#1 SMP Fri Jan 27 02:56:13 UTC 2023" ]
--------------------------------------------
````


