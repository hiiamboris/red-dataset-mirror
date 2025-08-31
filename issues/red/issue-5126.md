
#5126: Trash in `none` cell prevents it from being hashed
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[type.bug]
<https://github.com/red/red/issues/5126>

**Describe the bug**
```
fails: 0
loop 1000 [
	h: make hash! reduce [none 1 2]
	; v: none
	v: all []
	unless find h v [fails: fails + 1]
]
?? fails
```
Outputs `fails: 1000`
But if `v: none` is uncommented, outputs `fails: 0`

I've spent whole day trying to nail this down.
Hash uses murmur on the middle 2 bytes of the slot's content of `none` cell, but programmatically created `none` values only guarantee a valid header, rest is filled with trash.

Same default clause in hash is used also for: unset, handle, event, port, error, op, action, native. `unset` and `handle` won't work 100%, rest should be reviewed.

**Expected behavior**

Reliable hashing of all supported datatypes.
Since new datatypes will be added eventually, I propose using default clause only to report an error that datatype is not supported, and including every currently known datatype literally into the switch. This way we'll have less chances of running into the same bug again.

**Platform version**
```
Red 0.6.4 for Windows built 15-Apr-2022/11:42:52+03:00  commit #502097e
```



Comments:
--------------------------------------------------------------------------------

On 2022-04-25T03:50:27Z, greggirwin, commented:
<https://github.com/red/red/issues/5126#issuecomment-1108045687>

    Thanks for finding and fixing that @hiiamboris !

