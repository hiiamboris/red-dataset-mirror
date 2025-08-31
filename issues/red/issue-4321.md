
#4321: [VID] Shared state in LAYOUT causes stack overflows
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written] [GUI]
<https://github.com/red/red/issues/4321>

See https://github.com/red/red/issues/3580#issuecomment-596235887

**Describe the bug**
Title

**To reproduce**
```
view [
	base react [
		face/text		;) define a reactive source
		layout []		;) restart process-reactors
	]
]
```
Output:
```
*** Internal Error: stack overflow
*** Where: do
*** Stack: view layout  
```

**Expected behavior**

No errors.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 4-Feb-2020/20:36:01+03:00
```



