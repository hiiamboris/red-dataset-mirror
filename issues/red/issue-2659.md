
#2659: Programming error and strange decision in comparing pairs
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2659>

```
		if TYPE_OF(right) <> TYPE_PAIR [
			return either op = COMP_STRICT_EQUAL [1][RETURN_COMPARE_OTHER]
		]

```
`RETURN_COMPARE_OTHER` is a macro for `[return -2]`. Thus there is one `return` too many.
Also, why is `COMP_STRICT_EQUAL` made an exception??? 


