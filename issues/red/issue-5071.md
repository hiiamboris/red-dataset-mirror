
#5071: Compiler crash when `construct` is called with indirect block
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written] [type.compiler]
<https://github.com/red/red/issues/5071>

**Describe the bug**

Compile this:
```
Red []
b: []
construct b
```
Output:
```
*** Red Compiler Internal Error: Script Error : Expected one of: word! - not: block!
*** Where: comp-context
*** Near:  [name: to word! original: any]
```
I had to comment parts of my code until I found what actually angered the compiler :D

**Expected behavior**

Compiles.

**Platform version**
```
Red 0.6.4 for Windows built 25-Jan-2022/14:48:41+03:00  commit #dbbe6e0
```



