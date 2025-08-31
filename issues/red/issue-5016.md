
#5016: [Compiler] Cannot have anonymous context within another
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug] [type.compiler]
<https://github.com/red/red/issues/5016>

**Describe the bug**

This code:
```
Red []
; a: context [b: context []]		;) Works!
a: context [context []]			;) Crashes!
?? a
```
Crashes the compiler (`-c`):
```
Compiling D:\devel\red\red-src\red\environment\bug1.red ...
...using libRedRT built on 23-Dec-2021/16:42:04
*** Red Compiler Internal Error: Script Error : Invalid path value: context
*** Where: comp-context
*** Near:  [objects/a/context: make object! [
]]
```

**Expected behavior**

As interpreted.

**Platform version**
```
Red 0.6.4 for Windows built 22-Dec-2021/17:36:36+03:00  commit #328c904
```



