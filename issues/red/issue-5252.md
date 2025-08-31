
#5252: [View] Tab-panel is supposed to autosize its inner panels, doesn't
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5252>

discussed here: :point_up: [December 8, 2022 12:49 PM](https://gitter.im/red/red/gui-branch?at=6391b3368bdea01368a72e44)

**Describe the bug**

```
view/flags [
	tab-panel ["1" [
		at 0x0 panel blue [] react [face/size: face/parent/size]
	]] react [face/size: face/parent/size - 20]
] 'resize
```
Explicit relations:
- window/size -> tab-panel/size
- tab-panel's internal panel/size -> blue panel/size

Implicitly there should also be:
- tab-panel/size -> tab-panel's internal panel/size

But that doesn't work.

**To reproduce**

Run the code above

**Expected behavior**

Should work like this:
<img width=300 src=https://i.gyazo.com/b8f21f8dbd60663b7d99833e3360722c.gif />

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4610 date: 7-Dec-2022/11:23:15 commit: #864cd973f53298228f242f5653843cbd61b7cbe0 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


