
#5208: [View] Crash when setting `visible?` flag
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5208>

**Describe the bug**
```
view [
	p: panel 200x200 [box 100x100 blue box 100x100 red]
	rate 70 on-time [
		append clear p/pane layout/only compose [
			box 100x100 (random white) box 100x100 (random white)
		]
		p/visible?: true
	]     
]
```
Crashes Red in a second (some console builds take up to 5-10 seconds, but eventually do crash):
```
*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/modules/view/backends/windows/gui.reds
*** at line: 144
***
***   stack: gui/get-face-values 052D167Ah
***   stack: gui/BaseWndProc 052D167Ah 15 0 0
```

**Expected behavior**

No crash

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4457 date: 11-Sep-2022/8:20:11 commit: #85fa7e7830ce1083bc56bee5e2b3db1d9b8d9489 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2022-09-12T21:58:26Z, dockimbel, commented:
<https://github.com/red/red/issues/5208#issuecomment-1244561186>

    Seems to be a recent regression: https://gitter.im/red/bugs?at=631f81f03a42316d33e95f75

