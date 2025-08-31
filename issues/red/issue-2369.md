
#2369: String comparison in Red/System leads to compiler internal error
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2369>

The program:
```
	s: "abc"
	if s = "def" [print "hoopla"]
```
The result:
```
*** Red/System Compiler Internal Error: Script Error : emit-comparison-op expected b argument of type: word 
*** Where: emit-integer-operation 
*** Near:  [emit-comparison-op name a b args] 
```



Comments:
--------------------------------------------------------------------------------

On 2016-12-16T11:10:21Z, meijeru, commented:
<https://github.com/red/red/issues/2369#issuecomment-267571854>

    This leads to the question: How does one compare strings in Red/System???

--------------------------------------------------------------------------------

On 2017-02-16T08:28:12Z, dockimbel, commented:
<https://github.com/red/red/issues/2369#issuecomment-280265371>

    For comparing c-strings, `equal-string?` function is provided in the R/S runtime.

