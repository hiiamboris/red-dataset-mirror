
#4784: [Regression] Events no longer display errors
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4784>

It was working in Dec 04, 2020 build, not anymore

**Describe the bug**
```
Red [needs: view]

view [
	base rate 1 on-time [
		print "IN"
		this is an error obviously
		print "OUT"
	]
]
```
Output:
```
IN
IN
IN
IN
...
```
Two bugs here:
(1) No error output (from any actor)
(2) `on-time` is triggered twice

**Expected behavior**
```
IN
*** Script Error: is does not allow word! for its 'field argument
*** Where: is
*** Stack: view do-events do-actor do-safe 
IN
*** Script Error: is does not allow word! for its 'field argument
*** Where: is
*** Stack: view do-events do-actor do-safe 
```
(1) errors are shown
(2) only single `on-time` event

**Platform version**
```
Red 0.6.4 for Windows built 20-Dec-2020/21:04:56+03:00 commit #7a6d9a9
```



