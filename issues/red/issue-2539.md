
#2539: Interpreter has problem with /extern function definition if lit-word is used too
================================================================================
Issue is closed, was reported by Oldes and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2539>

This code:
```
buffer: copy ""
test: function [
	'word [any-type!]
	/extern buffer
][]
```
compiles fine, but fails in console (interpreted):
```
*** Script Error: invalid /extern value: 'word
*** Where: function
```


Comments:
--------------------------------------------------------------------------------

On 2017-04-04T05:17:07Z, dockimbel, commented:
<https://github.com/red/red/issues/2539#issuecomment-291395784>

    Good catch! Could you please submit the fix as a PR?

--------------------------------------------------------------------------------

On 2017-04-04T14:46:24Z, dockimbel, commented:
<https://github.com/red/red/issues/2539#issuecomment-291523070>

    Fixed by PR #2540.

