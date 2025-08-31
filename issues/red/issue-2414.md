
#2414: Macro error: invalid specification on empty /local in callback function
================================================================================
Issue is closed, was reported by ifgem and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2414>

```
#macro [set times integer! set body block!] func [
	[manual] start end /local
] [
	change/part start
		compose/only [
			loop (times) (body)
		]
	end

	end
]
```


