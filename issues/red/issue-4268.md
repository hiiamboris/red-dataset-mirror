
#4268: [View] `to-image` doesn't capture individual faces
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[GUI] [type.task.wish]
<https://github.com/red/red/issues/4268>

**Describe the bug**

At least on W7, `to-image` cannot capture most faces:
Given `window: view [face: ...]` - `to-image window` works fine, but `to-image face` doesn't

So far the faces that are imprinted this way are:
`window` `base` `progress` `slider` `panel` `tab-panel` `group-box` `calendar` (and probably `camera`, given there were issues specifically targeting it)

All other faces produce an empty (of OS panel background color) image:
`text` `button` `check` `radio` `field` `area` `text-list` `drop-list` `drop-down` 

`rich-text` and `scroller` just crash - see #4269 

**To reproduce**
```
bad: [] good: []
check: func [face word][
	i1: to-image face
	i2: make image! reduce [i1/size system/view/metrics/colors/panel]
	append either i1 = i2 [bad][good] word
]
check v: view/no-wait [] 'window
unview/only v
foreach w [
	base
	text
	button
	check
	radio
	field
	area
	text-list
	drop-list
	drop-down
	progress
	slider
	camera
	panel
	tab-panel
	group-box
	calendar
	; rich-text         ;) this one crashes
	; scroller          ;) this one too
][
	v: view/no-wait compose [f: (w) "text" blue]
	wait 0.1
	check f w
	unview/only v
]
print ["Doesn't work for:" bad]
print ["OK for:" good]
```

**Expected behavior**

`to-image` should be able to capture all supported faces

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 29-Jan-2020/15:29:32+03:00
```



