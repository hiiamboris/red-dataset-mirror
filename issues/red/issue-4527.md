
#4527: [Compiler] Messes stack up when `return:` or any refinement follows `/local`
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [test.written] [type.compiler]
<https://github.com/red/red/issues/4527>

**Describe the bug**

This is the order of arguments used [in reactivity](https://github.com/red/red/blob/2ffb93280b95c5f8b173abbe4973e0d3430a7580/environment/reactivity.red#L246) so should be valid.

1) Compile this & run:
```
Red []

f: function [b [block!] /local i return: [default!]] [
	c: clear []
	?? c
	foreach x c [1]
]

f [a/b]
```
Output:
```
c: c                                                                  
*** Script Error: foreach does not allow unset for its series argument
*** Where: foreach                                                    
*** Stack:                                                            
```
`c: c` always behaves like this - shows itself (should be `c: []`)
The error message varies. While reducing the code I was also getting 
`*** Script Error: parse does not allow object for its rules argument` and 
`*** Script Error: foreach does not allow word for its series argument` (note `word` here, not `unset`)

So I suspect stack corruption.

---
2) Another variant: refinement after /local (this originates from a mistake of using `func` with `/extern` and getting random results):
```
Red []
f: function [/local a /ref b] [
	print [b type? b]
]
f
```
Interpreted:
```
none none
```
Compiled:
```
... block
```


**Expected behavior**

1) It works if I swap `/local` and `return:`:
```
c: []
```

2) As interpreted.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2020-09-24T03:33:05Z, bitbegin, commented:
<https://github.com/red/red/issues/4527#issuecomment-698090564>

    #4641

