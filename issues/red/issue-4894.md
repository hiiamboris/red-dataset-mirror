
#4894: Documenting return: in function/func spec may cause errors
================================================================================
Issue is open, was reported by zwortex and has 2 comment(s).
[type.bug]
<https://github.com/red/red/issues/4894>

**Before submitting**
https://gitter.im/red/bugs?at=60965c2d93ac573bba8f5e71

**Describe the bug**
```
;; illustration (provided by @oldes):
f: function [return: [string!] ][s: copy "res" return s] ;= OK
f: function [return: [string!] "a"][return "s"] ;= OK
f: function [return: [string!] "a"][s: copy "res" return s] ;= ERROR
f: function [return: [string!] "a"]["a"] ;= OK
f: function [return: [string!] "a"][a: "a"] ;= ERROR

;; the same with func works fine
f: func [return: [string!] ][s: copy "res" return s] 
f: func [return: [string!] "a"][return "s"] 
f: func [return: [string!] "a"][s: copy "res" return s] 
f: func [return: [string!] "a"]["a"] 
f: func [return: [string!] "a"][a: "a"] 

;; in addition documentation of return without the block of types 
;; provokes an error, but works fine with regular arguments
f: function [ v "a" ] [ v ] ; OK
f: function [ return: "a" ][ 1 ] ; ERROR

;; func is alike in that regard
f: func [ v "a" ] [ v ] ;= OK
f: func [ return: "a" ][ 1 ] ;= ERROR
```

**Expected behavior**
Documentation of return: should be possible in both function and func.
It should also be possible to document return: like other arguments without providing the block of types.

**Platform version**
Red 0.6.4 for Windows built 24-Apr-2021/19:27:28



Comments:
--------------------------------------------------------------------------------

On 2021-05-08T14:13:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/4894#issuecomment-835379864>

    Which again brings us back to https://github.com/red/red/pull/4347 and shows us the harm of enforcing the order

