
#5174: [Compiler] Internal error on empty filename
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5174>

**Describe the bug**

```
D:\gear>redc.exe -c ""
*** Driver Internal Error: Script Error : Out of range or past end
*** Where: load-filename
*** Near:  [unless any [
all [
#"%" = first filename
attempt [result: load filename]
file? result
]
attempt [result: to-rebol-file filename]
] [
fail-cmd ["Invalid filename:" filename]
]
result
]
```

**Expected behavior**

Error message for humans

**Platform version**
```
red-toolchain-12aug22-1f3694334.exe
```



