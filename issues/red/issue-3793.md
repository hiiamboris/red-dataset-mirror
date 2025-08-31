
#3793: [View] Unstoppable wheel!!
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3793>

**Describe the bug**

`wheel` event cannot be stopped from being processed by native controls

**To reproduce**
```
system/view/capturing?: yes    ;-- this was the last hope
view [
	; try with any of the following:
	; area 100x20 "a^/b^/c^/d^/e" focus
	; drop-list 100x20 data ["a" "b" "c" "d" "e" "f"] focus
	; drop-down 100x20 data ["a" "b" "c" "d" "e" "f"] focus
	text-list 100x20 data ["a" "b" "c" "d" "e" "f"] focus
		on-wheel [print "ROLLED OVER"]
		on-detect [probe event/type]
	do [
		insert-event-func
			func [_ ev] [if ev/type = 'wheel ['stop]]
	]
]
```
The code above stops `on-wheel` actors from being fired. Now run it and scroll the mouse wheel: it still scrolls each of the controls.

**Expected behavior**

A stop is a stop. It's very annoying to have `wheel` event processed somewhere (and acted upon) and at the same time see that OS also processes it.
There should be a (preferably simple) way to tell the View that the event is handled already, stopping it from further affecting the GUI.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 30-Jan-2019/9:03:13+03:00 commit #25ef631
```



Comments:
--------------------------------------------------------------------------------

On 2019-02-26T20:24:54Z, greggirwin, commented:
<https://github.com/red/red/issues/3793#issuecomment-467599238>

    Confirmed. Good catch.

