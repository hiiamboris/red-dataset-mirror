
#5640: TEXT-LIST isn't updated on APPEND, needs show
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/5640>

**Describe the bug**
Text-list style is not updated after reading a dir and appending its content on the `/data container

**To reproduce**

Try this script, select a directory, when the list is filled, hit CLEAR. Now click to "Append" and select another directory and nothing happens. You need to hit "SHOW" to see the content.

```
if temp: request-dir [
	temp: read temp
	view [
		l: text-list data temp
		button "Clear" [
			clear head l/data 
		]
		button "append" [
			if temp: request-dir [
				append l/data read temp
			]
		]
		button "show" [
			show l
		]
	]
]
```
Similar result using this script from GREGG

```
d-1: ["A"] append d-1 read %/C/Users/Gregg/Desktop/notes/
d-2: ["B"] append d-2 read %"/C/Users/Gregg/Desktop/Time Wasters/"

	temp: d-1
	view [
		l: text-list data temp
		button "Clear" [
			clear head l/data 
		]
		button "append" [
			append l/data d-2
		]
		button "show" [
			show l
		]
	]
```
In his version, only the non FILE element is displayed and then everything after you hit SHOW.


Discussion [here](https://matrix.to/#/!ARPBrpwJJYziTJYuJj:gitter.im/$ehYAZ2Ab9ew10pRQM4_SoQBLIyUuoKgs1VRNnQvKxDM?via=gitter.im&via=matrix.org&via=tchncs.de)

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 75 date: 13-Jul-2025/13:27:17 commit: #31205e5c6189648cfa852e73c71be1afc18445d0 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 26100 ]
--------------------------------------------
```



Comments:
--------------------------------------------------------------------------------

On 2025-08-19T12:46:29Z, dockimbel, commented:
<https://github.com/red/red/issues/5640#issuecomment-3200617365>

    The text-list is not updated as it supports only `string!` value and ignored all other types. I will extend it to accept `any-string!`.

