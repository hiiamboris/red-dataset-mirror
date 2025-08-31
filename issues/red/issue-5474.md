
#5474: Using wrap VID keyword resets para values.
================================================================================
Issue is closed, was reported by luce80 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5474>

**Describe the bug**
Using `wrap` VID keyword resets `para` values:
It seems also that it does not "fire" reactions on the `para` object.

**To reproduce**
```
view [
	style my-base: base para [scroll: (0, 0)]
	my-base 100x100 on-create [?? face/para/scroll]
	my-base 100x100 wrap on-create [?? face/para/scroll]
]
```


**Expected behavior**
`para` object should stay unaltered and should `react` to changes also when `wrap` VID keyword is used.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5092 date: 24-Jan-2024/4:14:00 commit: #10dc97b01cda5bb347f2ca5741da7a82f02b37a4 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------
```


