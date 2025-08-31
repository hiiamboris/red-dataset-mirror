
#5007: Issues in paths cannot be compiled
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.bug] [type.compiler]
<https://github.com/red/red/issues/5007>

**Describe the bug**

File:
```
Red []
a: [#bcd 123]
probe a/#bcd = 123
```
Compilation (encapping):
```
>red -r -e bug.red
...
*** Syntax Error: Missing #"]" character
*** in file: D:\devel\red\unicode\bug.red
*** line: 4
*** at: ""
```
Interpreted:
```
true
```

**Expected behavior**

1. Successful compilation
2. issue to work in the middle of the path as `a/#bcd/e` (currently it thinks `#bcd/e` is the issue and errors out) both in interpreter and compiler

**Platform version**
```
Red 0.6.4 for Windows built 6-Dec-2021/19:27:05+03:00  commit #252d78d
```



Comments:
--------------------------------------------------------------------------------

On 2023-09-17T19:26:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/5007#issuecomment-1722548435>

    Found a workaround for this:
    1. Inline includes into the file
    2. Save it as binary
    3. Include the binary into compiled file with a command to evaluate it

