
#3152: [Wish] support explicitly setting the radio button data to false 
================================================================================
Issue is closed, was reported by BeardPower and has 6 comment(s).
[status.built] [status.tested] [type.wish] [GUI]
<https://github.com/red/red/issues/3152>

### Expected behavior

The radio button should also support explicitly setting its data to false.
From the documentation: data | true: checked; false: unchecked (default).

`view [radio false]`

It should create a radio button just like `view [radio true]`, but with the radio button unchecked.

### Actual behavior

`view [radio false]`

*** Script Error: VID - invalid syntax at: [false]
*** Where: do
*** Stack: view layout cause-error 

### Steps to reproduce the problem

Just create a radio button with its data explicitly set to false:

`view [radio false]`

### Red version and build date, operating system with version.

Red for Windows version 0.6.3 built 11-Dec-2017/15:42:34+01:00


Comments:
--------------------------------------------------------------------------------

On 2017-12-21T08:57:36Z, rebolek, commented:
<https://github.com/red/red/issues/3152#issuecomment-353295137>

    According to https://doc.red-lang.org/en/view.html#_radio `radio` should support `false`, so IMO it's bug, not a wish, but that's just a detail.

--------------------------------------------------------------------------------

On 2017-12-21T21:10:32Z, BeardPower, commented:
<https://github.com/red/red/issues/3152#issuecomment-353458565>

    @dockimbel asked me to tag it as wish.

--------------------------------------------------------------------------------

On 2017-12-22T04:19:40Z, dockimbel, commented:
<https://github.com/red/red/issues/3152#issuecomment-353518624>

    I think the doc went a bit further than the implementation, as `false` is the default value, the code is not accepting it. Though, when dynamically constructing a VID block, reducing an expression could lead to a `false`, so it would be convenient to support it.

