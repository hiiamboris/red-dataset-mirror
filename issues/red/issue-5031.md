
#5031: Compiler hangs on empty macros
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.compiler]
<https://github.com/red/red/issues/5031>

**Describe the bug**

Try to compile this:
```
Red []
#macro [] func [s e] [s]
probe 1 + 2
```
It never finishes.

**Expected behavior**

Some kind of error during compilation.

**Platform version**
```
Red 0.6.4 for Windows built 22-Dec-2021/17:36:36+03:00  commit #328c904
```



