
#5548: Linux GUI Red not drawing curves
================================================================================
Issue is closed, was reported by temperfugit and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI] [GUI.GTK]
<https://github.com/red/red/issues/5548>

**Describe the bug**

I'm writing a program that connects dots (drawn as circles) with lines or curves.  On Windows, everything is rendered correctly.  On Linux, only the circles are rendered, not the curves or lines.

**To reproduce**

Paste this code into a Red GUI Console:

view [
base white 400x400 draw [pen blue fill-pen blue circle (41, 93) 3 circle (33, 188) 3 circle (255, 239) 3 circle (309, 101) 3 circle (41, 93) 3 pen black curve (41, 93) (19.43058, 112.2435) (15.81347, 164.4523) (33, 188) curve (33, 188) (59.56561, 224.3982) (209.6085, 262.9785) (255, 239) curve (255, 239) (291.6119, 219.6594) (326.9957, 128.23) (309, 101) curve (309, 101) (284.7939, 64.37274) (77.17208, 60.72843) (41, 93)]
]

There are no lines in this example but I also noticed lines aren't being properly rendered in Linux.

**Expected behavior**

Blue circles connected with black curves should be rendered (and are on Windows), but for me on Linux, only the circles are drawn.

**Platform version**

-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 193 date: 7-Oct-2024/22:10:21 commit: #adf4bdc79bab2c87fa7f9e35485ad2b35226c0eb ]
PLATFORM: [ name: "Linux Mint 21.1" OS: 'Linux arch: 'x86_64 version: 5.15.0 build: "#101-Ubuntu SMP Tue Nov 14 13:30:08 UTC 2023" ]
--------------------------------------------


