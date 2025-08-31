
#5530: [View] `base` transparency support depends on init conditions
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5530>

**Describe the bug**

These 2 bases should work equivalently, but the second one has no transparency support in it:

![](https://i.gyazo.com/0c6dbcc679c76d165040bbbb74104c43.gif)

**To reproduce**
```
i: 0 view [
	base glass rate 33 on-time [face/color: (i: i + 1 % 33) / 33 * glass + white]
	base white rate 33 on-time [face/color: (i: i + 1 % 33) / 33 * glass + white]
]
```

**Expected behavior**

Both support transparency

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 175 date: 1-Jul-2024/17:21:21 commit: #bbecb7eb6c23ef1040208187fb0fe160a4223c7f ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```



Comments:
--------------------------------------------------------------------------------

On 2024-08-09T10:38:02Z, dockimbel, commented:
<https://github.com/red/red/issues/5530#issuecomment-2277658925>

    IIRC, it's a (Windows) backend limitation (transparency requires a different graphic object), but @qtxie should provide a more accurate explanation.

