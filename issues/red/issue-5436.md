
#5436: [GTK, Regression] Pair `face/offset` is converted into point2D which is then ignored
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI.GTK]
<https://github.com/red/red/issues/5436>

**Describe the bug**

This code worked in older builds on Linux:
```
Red [needs: view]

view [
    panel white [] on-created [
		append face/pane make make-face 'text [offset: 20x40 text: "abc"]
		?? face/pane/1/offset
    ]
]
```
Face appears at 0x0 offset.

**Expected behavior**

Should be at 20x40

**Screenshots**

![](https://link.storjshare.io/raw/jxfnjjold7d4xtoupll4mp7ychkq/img/UQ74y4b.png)

**Platform version**
```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 5021 date: 10-Oct-2023/16:32:02 commit: #2a2ce39323f1832a00f599b54724e4e182e64cf5 ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.90 build: "#1 SMP Fri Jan 27 02:56:13 UTC 2023" ]
--------------------------------------------
```


