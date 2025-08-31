
#4789: [Windows] `over` events don't capture the pointer after double-click 
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4789>

**Describe the bug**
![](https://i.gyazo.com/99c2cf3f5223ba396f429ac2c99f2f7c.gif)
What happens here:
- I click and drag the mouse around - see how events are captured by the base even outside it's bounds
- I then double click, and repeat the step above - outside events are not captured anymore ):

**To reproduce**
```
view [
	base white "DOUBLE CLICK ME^/ THEN CLICK AND DRAG AWAY"
	all-over on-over [t/text: form event/offset]
	return t: text
]
```

**Expected behavior**

Double-click should not interfere with proper event processing. Until mouse button is up, outside events should go into the face.

**Platform version**
```
Red 0.6.4 for Windows built 20-Dec-2020/21:04:56+03:00 commit #7a6d9a9
```



