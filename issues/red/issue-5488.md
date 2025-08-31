
#5488: VID actors syntax errors are not caught
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[GUI]
<https://github.com/red/red/issues/5488>

**Describe the bug**

I believe it took @luce80 quite an effort to reduce unexpected VID behavior to this little snippet:
```
system/view/VID/styles/my-style: [
	template: [
		type: 'base
		actors: [
			1 + 1
			ON-CREATE: func [face][]
		]
	]
]
view [my-style on-time []]
```
Which when run outputs:
```
*** Script Error: ON-CREATE: needs a value
*** Where: ON-CREATE
*** Near : ON-CREATE:
*** Stack: view layout fetch-options context 
```
Assumption source: https://github.com/red/red/blob/5521b51d11a2410b70dea905a7890317383e6fbd/modules/view/VID.red#L482-L484

Root issue: https://github.com/red/REP/issues/132

**Expected behavior**

Either no assumptions on object source code, or explicit declaration of the format and a runtime check with helpful error message. 

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5120 date: 13-Feb-2024/12:12:43 commit: #f519e8a6d1a6203acd3e808654417b35d23e6dc1 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


