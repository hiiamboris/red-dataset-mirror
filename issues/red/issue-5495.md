
#5495: Inside part of TAB-PANELs do not resize.
================================================================================
Issue is closed, was reported by luce80 and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5495>

**Describe the bug**
In Red v.7mar2024 the resizing of inside of tab panels have been broken :( , it worked in Red v.17feb2024.

**To reproduce**
```
win: layout [
	tb: tab-panel 150x150 red [
		"A" [b1: button "test1"]
		"B" [b2: button "test2"]
	]
]
react compose [
	tb/size: win/size - (win/size - tb/size)
	b1/size: win/size - (win/size - b1/size)
	b2/size: win/size - (win/size - b2/size)
]
view/flags win 'resize
```
Possibly a regression from #5492 

**Expected behavior**
Also inside part of tab panels should resize during resizing.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 31 date: 6-Mar-2024/23:20:18 commit: #5a39a7a326a605bb98f6f8a09e19ce8164940986 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------```


Comments:
--------------------------------------------------------------------------------

On 2024-03-16T19:31:49Z, dockimbel, commented:
<https://github.com/red/red/issues/5495#issuecomment-2002100207>

    Regression caused by the [fix](https://github.com/red/red/commit/899e918939d9aefe9b5dd6e3abfa7a73500db45d) to #5491.

--------------------------------------------------------------------------------

On 2024-03-16T20:37:30Z, dockimbel, commented:
<https://github.com/red/red/issues/5495#issuecomment-2002123005>

    Note: the fix also preserves the precision when a point value is used for `/size` facet.

