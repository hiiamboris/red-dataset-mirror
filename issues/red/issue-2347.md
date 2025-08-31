
#2347: Draw text is displayed without 1-2 last symbols
================================================================================
Issue is closed, was reported by ifgem and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2347>

```
view [
	image draw [
		text 0x0 "123456789"
		text 0x30 "12"
		text 0x60 "123"
	]
]
```
[![Снимок1.png](https://s16.postimg.org/ahoydv6md/image.png)](https://postimg.org/image/ylfq25p35/)


Comments:
--------------------------------------------------------------------------------

On 2016-11-24T14:30:03Z, dockimbel, commented:
<https://github.com/red/red/issues/2347#issuecomment-262788862>

    Good finding!

--------------------------------------------------------------------------------

On 2016-11-25T05:43:56Z, dockimbel, commented:
<https://github.com/red/red/issues/2347#issuecomment-262884794>

    @qtxie `status.built` should be used when code need to be changed, and `status.resolved` for tickets solved without code change.

