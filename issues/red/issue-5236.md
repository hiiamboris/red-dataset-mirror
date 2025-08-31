
#5236: [View] CRASH when assigning the pane
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5236>

**Describe the bug**

Run this:
```
view [
	ppp: panel 300x400 []
	on-created [
		loop 100 [ppp/pane: layout/only [button "abc"]]
	]
]
```
Result:
```
root: 5035/7726, runs: 0, mem: 3253100 => 2523076, mark: 2.0ms, sweep: 1.0ms
root: 5035/7726, runs: 1, mem: 5413400 => 2525864, mark: 2.0ms, sweep: 1.0ms

*** Runtime Error 98: assertion failed
*** in file: /d/devel/red/red-src/master/runtime/datatypes/symbol.reds
*** at line: 107
***
***   stack: red/symbol/resolve 1701277281
***   stack: gui/process-custom-draw 0 17233632
***   stack: gui/WndProc 02701ACEh 78 0 17233632
```

**Expected behavior**

No crashes

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4559 date: 31-Oct-2022/7:53:59 commit: #4a12602b221e0d636b41614d7f91a25f9996a683 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2022-11-08T09:04:29Z, meijeru, commented:
<https://github.com/red/red/issues/5236#issuecomment-1306863385>

    Why is this not closed?

