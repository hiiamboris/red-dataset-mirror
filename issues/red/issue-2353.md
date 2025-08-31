
#2353: Premature quitting on `return` usage
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2353>

When `return` is used from interpreted code inside a compiled function, it can result in the program stopping with no message.

```
red>> preprocessor/count-args spec-of :append
<exit back to system shell>
```

`count-args` function source code:
```
count-args: func [spec [block!] /local total][
	total: 0	
	parse spec [
		any [
			[word! | lit-word! | get-word!] (total: total + 1)
			| refinement! (return total)
			| skip
		]
	]
	total
]
```


