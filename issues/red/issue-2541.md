
#2541: Func in func with refinement compiler issue
================================================================================
Issue is open, was reported by greggirwin and has 2 comment(s).
[status.deferred] [type.compiler]
<https://github.com/red/red/issues/2541>

```
fn-outer: function [][
	fn-inner: func [/no-name][
		print no-name
	]
	fn-inner
	;fn-inner/no-name
]

fn-outer
```
- Fine interpreted. GUI/CLI console shows correct result whether `/no-name` is used or not.
- Produces no output when compiled and `/no-name` is not used.
- Produces the following error when compiled and `/no-name` is used (uncomment line).
```
*** Script Error: path none is not valid for function! type
*** Where: fn-outer
*** Stack: fn-outer
```


Comments:
--------------------------------------------------------------------------------

On 2020-08-19T15:47:21Z, 9214, commented:
<https://github.com/red/red/issues/2541#issuecomment-676507030>

    https://github.com/red/red/issues/2485.

