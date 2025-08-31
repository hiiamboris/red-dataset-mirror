
#5409: Stack overflows make `parse` behavior undefined
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5409>

**Describe the bug**

Took me a while to realize my code recurses from just looking at this weird error message:
```
*** Script Error: | has no value
*** Where: parse
*** Near : (long parse rule)
*** Stack: f
```

**To reproduce**

Run this code:
```
Red []

f: function [block [block!] /local w] [
	?? block
	parse block rule: [
		change set w word! (
			attempt [if block? get/any w [f get/any w]]
		)
	|	skip
	]
	block
]


r1: [r2]
r2: [r1]
f r1
?? r1
```
It prints:
```
(200 similar lines)
block: [r2]
block: [r1]
block: [r2]
*** Script Error: | has no value
*** Where: parse
*** Near : parse block rule: [change set w word! (attempt ) ]
*** Stack: f
```
If I remove `| skip` then it instead prints:
```
block: [r2]
block: [r1]
block: [r2]
*** Script Error: PARSE - unexpected end of rule after: change
*** Where: parse
*** Near : parse block rule: [change set w word! (attempt )]
*** Stack: f
```
So `change` somehow jumped over a value and tried to evaluate `|`.
Removal of `attempt` wrapping rightfully complains:
```
*** Internal Error: stack overflow
*** Where: get
*** Near : (if block? get/any w [f get/any w])
*** Stack: f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f
 f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f
 f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f
 f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f block?
```
I also saw crashes but it's harder to reproduce.

**Expected behavior**

Parse should either handle such cases or report stack overflow it can't handle.

**Platform version**
```
Red 0.6.4 for Windows built 16-Oct-2023/10:48:01+03:00  commit #6a055f5
```



Comments:
--------------------------------------------------------------------------------

On 2023-10-21T18:37:22Z, dockimbel, commented:
<https://github.com/red/red/issues/5409#issuecomment-1773889197>

    > So change somehow jumped over a value and tried to evaluate |.
    
    Actually, your usage of `change` is incorrect as it requires 2 arguments and you provide only 1. That it's why it tries to fetch `|` for as second argument and rightfully fails. See: https://github.com/red/docs/blob/master/en/parse.adoc#3103-change
    
    If I add an extra value, it works without any error:
    
    ```
        parse block rule: [
            change set w word! (
                attempt [if block? get/any w [f get/any w]]
            ) 1
        |   skip
        ]
    ```

--------------------------------------------------------------------------------

On 2023-10-21T18:44:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/5409#issuecomment-1773891539>

    You are clearly mistaken. `set w word!` is one argument, `(attempt ...)` is another.

--------------------------------------------------------------------------------

On 2023-10-21T22:32:10Z, dockimbel, commented:
<https://github.com/red/red/issues/5409#issuecomment-1773937130>

    You're right, I overlooked it in your code and in the docs (the `<expression> : paren! expression` part).

--------------------------------------------------------------------------------

On 2023-10-26T16:22:14Z, dockimbel, commented:
<https://github.com/red/red/issues/5409#issuecomment-1781445477>

    The issue is caused by a memory corruption occuring in the internal Parse rules stack when it gets relocated after a buffer extension. That creates a confusing situation as Parse is recursively called hundred of times in the above code, and the `p` pointer is not updated to the new memory location, causing havoc when the recursion returns.

