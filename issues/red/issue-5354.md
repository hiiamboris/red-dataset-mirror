
#5354: [GTK] CRASH on big face creation
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI.GTK]
<https://github.com/red/red/issues/5354>

**Describe the bug**
```
>> view [base 100000x100000]

(red:664): Gdk-WARNING **: 14:22:03.846: Native Windows wider than 65535 pixels are not supported

(red:664): Gdk-WARNING **: 14:22:03.846: Native Windows taller than 65535 pixels are not supported

(red:664): Gdk-CRITICAL **: 14:22:03.855: ../../../../../gdk/wayland/gdkdisplay-wayland.c:1399: Unable to create Cairo image surface: invalid value (typically too big) for the size of the i
nput (surface, pattern, etc.)

*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```

**Expected behavior**

A runtime error or successfully created face.

**Platform version**
```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 4805 date: 18-Jul-2023/19:56:01 commit: #af3d35a2f444b3d02058226effd63714eb4bf2bc ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.90 build: "#1 SMP Fri Jan 27 02:56:13 UTC 2023" ]
--------------------------------------------
```


