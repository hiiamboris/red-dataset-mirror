
#4848: done event interferes with face interaction
================================================================================
Issue is closed, was reported by snotbubble and has 2 comment(s).
<https://github.com/red/red/issues/4848>

**Describe the bug**
use of `on-down ['done]` to prevent panel mouse events being propagated to contained faces is also blocking face interaction.

**To reproduce**
1. Run this:
```
Red [ needs 'view ]
view [
	panel 120x500 with [ extra: [name: "panel_1" id: 1 ] ] on-down [ print "panel selected: " probe face/extra/name ] [
		below
		field 80x30 "edit" on-down ['done]
		drop-list 80x30 data [ "one" "two" ] select 1 on-down ['done]
		drop-down 80x30 data [ "one" "two" ] select 1 on-down ['done]
		check 80x30 "check" on-down ['done]
		area 100x100 "edit text^/here" on-down ['done]
		text-list 100x100 data [ "one" "two" ] select 1 on-down ['done]
		button 80x30 "button" on-down ['done] [ face/text: "pressed" ]
	] 
]
```
2. Attempt to interact with faces, everything is blocked except drop-list and drop-down.

**Expected behavior**
Interaction should work as normal.

**Platform version**
Ubuntu 20.04.2 LTS x86_64
```
Red 0.6.4 for Linux built 2-Mar-2021/23:01:01+11:00 commit #6de9b93
```



Comments:
--------------------------------------------------------------------------------

On 2021-03-08T08:55:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/4848#issuecomment-792591403>

    On W10 doesn't block anything (probably because it's not possible to)

