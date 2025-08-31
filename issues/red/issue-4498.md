
#4498: Unstoppable foreach-face
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
<https://github.com/red/red/issues/4498>

From https://github.com/red/REP/issues/78

**Describe the bug**

When it descended into a pane, no `break`, `return` or anything can make it stop.

**To reproduce**
```
v: view/no-wait [
	text "A"
	panel [text "B"] "X"
	panel [text "C"] "Y"
]

foreach-face v [
	print face/text
	if face/text = "B" [print "STOPPING..." break]
]
```
Outputs:
```
A
X
B
STOPPING...
Y
C
```

**Expected behavior**
```
A
X
B
STOPPING...
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2020-07-09T20:14:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/4498#issuecomment-656329338>

    Duplicate of https://github.com/red/red/issues/3991

