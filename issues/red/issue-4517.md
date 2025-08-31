
#4517: [Compiler] Calls function literals accessed by get-paths
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [test.written] [type.compiler]
<https://github.com/red/red/issues/4517>

**Describe the bug**

Very dangerous stuff! ☻

**To reproduce**
```
Red []

print-it: function [b] [
	?? b
	b: reduce b
	?? b
	f: :b/1
	print [:f]
	print [:b/1]
]

print-it [does [print "CALLED"]]
```
Interpreted:
```
b: [does [print "CALLED"]]  
b: [func [][print "CALLED"]]
?function?                  
?function?                  
```
Compiled:
```
b: [does [print "CALLED"]]  
b: [func [][print "CALLED"]]
?function?                  
CALLED                      
```

**Expected behavior**

Should respect get-paths and not call them.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2020-07-31T17:34:43Z, 9214, commented:
<https://github.com/red/red/issues/4517#issuecomment-667245244>

    Looks related to https://github.com/red/red/issues/4451. `:b/1` is stored in Redbin, but either encoder (likely) or decoder messes up and it ends up being a `path!`, not a `get-path!`. When `print` calls `reduce` internally and traverses thru values in a block, there's already `path!` in it.

