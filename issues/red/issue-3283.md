
#3283: Crash when calling a function in object with ON-DEEP-CHANGE*
================================================================================
Issue is closed, was reported by rebolek and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3283>

I have following code:
```
circular!: object [
	size: 5
	list: []

	init: func [
		siz
	] [
		size: siz
		clear list
		insert/dup list 0 1 + size
	]

	on-deep-change*: function [owner word target action new index part][
		switch action [
			insert [
				remove target
			]
		]
	]
]
```

### Expected behavior

When I create new buffer and try to init it, I expect it to work:

```
b: make circular! []
b/init 20
```


### Actual behavior

It crashes on `size: siz` line.
It's probably related to https://github.com/red/red/issues/3156 because when you try running the code on https://github.com/red/red/commit/bca86785936b0750b994702daa15734361237f1f , it works. 

### Steps to reproduce the problem

See above

### Red version and build date, operating system with version.

Red build from 5f9c4283 (later versions do not work on Linux at all) on Linux.


Comments:
--------------------------------------------------------------------------------

On 2018-03-26T16:22:07Z, 9214, commented:
<https://github.com/red/red/issues/3283#issuecomment-376225328>

    :beer: :bear:  -- Mommy? Where's my mommy?

--------------------------------------------------------------------------------

On 2018-03-26T16:46:10Z, dockimbel, commented:
<https://github.com/red/red/issues/3283#issuecomment-376233022>

    It works fine when compiled, it's an interpreter-specific issue.

--------------------------------------------------------------------------------

On 2018-03-28T12:51:43Z, dockimbel, commented:
<https://github.com/red/red/issues/3283#issuecomment-376875113>

    There were two causes for the crash(es) here:
    1. Some part of the runtime library expected that `on-change*` handler be defined when `on-deep-change*` handler was present.
    2. The `on-deep-change*` event was triggered a little bit too early for `insert` action, so modifying the series during such event messed up the series state internally.

--------------------------------------------------------------------------------

On 2018-03-28T13:30:19Z, rebolek, commented:
<https://github.com/red/red/issues/3283#issuecomment-376887138>

    Thanks for fix and explanation what went wrong!

