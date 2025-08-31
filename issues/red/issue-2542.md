
#2542: Inner func capture compiler issue
================================================================================
Issue is open, was reported by greggirwin and has 0 comment(s).
[status.deferred] [type.compiler]
<https://github.com/red/red/issues/2542>

When it comes time to add support for inner funcs, here's a test case. 
```
Red []

; Fine interpreted, doesn't print anything when compiled
ctx: context [
	var: 1
	fn: function [value][
		inner-fn: function [v][
			print ['var var]
			print ['v v]
		]
		inner-fn value
	]
]

ctx/fn 'a

; It works fine compiled if we don't capture the inner func. If
; we capture it with /local, it fails again.
ctx-2: context [
	var: 2
	fn: func [value][
		inner-fn: func [v][
			print ['var var]
			print ['v v]
		]
		inner-fn value
	]
]

ctx-2/fn 'b

halt
```


