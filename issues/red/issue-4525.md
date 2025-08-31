
#4525: [Compiler] Doesn't understand redefined functions
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4525>

**Describe the bug**

Sometimes it's useful to hijack a common function:
```
Red []

; declared elsewhere
f: does []

; redefined by the user
g: :f
f: does [print "F" g]

f
```
It works when interpreted:
```
F
```
But compiler thinks that `g: :f` means they are the same thing, and calls `f` recursively, until stack overflow.

**To reproduce**

Compile & run the provided script.

**Expected behavior**

As interpreted.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



