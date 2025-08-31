
#3821: [CRASH] rich-text is crashed when using a string for text in it's draw command.
================================================================================
Issue is closed, was reported by BeardPower and has 0 comment(s).
[status.built] [type.wish]
<https://github.com/red/red/issues/3821>

**Describe the bug**
Using text inside draw of rich-text results in a crash.

According to the [documentation,](https://doc.red-lang.org/en/rtd.html#_multi_box_mode) it should allow it:
Draw extension text <pos> <text> <pos> : a pair! value indicating the upper left corner of the text-box. <text> : a string, or a rich-text face object with a rich-text description in single-box

**To reproduce**
view [rich-text draw [text 100x100 "Hello, world!"]]

**Expected behavior**
Drawing the string "Hello, world!".

**Platform version (please complete the following information)**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 193 date: 14-Mar-2019/17:49:29 commit: #43b26838b4a39cd20e06a9b6c2f5c2b873e058b7 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```



