
#2738: Crash when doing many to-image
================================================================================
Issue is closed, was reported by luce80 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2738>

The following code will give access violation:

```
Red [Needs: View]

many-to-image: function [
	][
	index: 1
	while [index < 9 ] [
		index: index + 1
		i1: to-image button-test ; *** Runtime Error 1: access violation
	]
	image
]
view [
	button-test: button "abcd"

	do [many-to-image ]
]
```


Comments:
--------------------------------------------------------------------------------

On 2017-06-10T08:24:02Z, qtxie, commented:
<https://github.com/red/red/issues/2738#issuecomment-307551125>

    The button will not be snapshotted to an image, because `do [many-to-image]` will run before the window has been created. 
    But it should not crash anyway.

