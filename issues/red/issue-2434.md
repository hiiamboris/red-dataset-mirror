
#2434: event/ctrl? always returns true for on-wheel event
================================================================================
Issue is closed, was reported by endo64 and has 4 comment(s).
[status.dismissed] [status.reviewed] [GUI]
<https://github.com/red/red/issues/2434>

event/ctrl? always returns true for on-wheel event.
event/shift? works correctly.

```
b: make face! [
	type:		'base
	color:		red
	size:		100x100
	offset:		0x0
	options:	[drag-on: 'down]
	actors: object [
		on-wheel: function [face event] [
			probe event/ctrl?	;always prints "true"
		]
	]
]
view make face! [
	type: 'window
	size: 200x200
	pane: reduce [b]
]

```


Comments:
--------------------------------------------------------------------------------

On 2017-02-11T21:20:01Z, endo64, commented:
<https://github.com/red/red/issues/2434#issuecomment-279176517>

    I found that this problem occurs only if I use laptop's touch pad, swipe with two fingers (zoom in/out). It doesn't occur with a real mouse's scroll.

--------------------------------------------------------------------------------

On 2017-02-12T02:52:10Z, qtxie, commented:
<https://github.com/red/red/issues/2434#issuecomment-279192813>

    @endo64 How about use the `zoom` event?: https://doc.red-lang.org/en/view.html#_event_names

