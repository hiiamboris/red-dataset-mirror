
#5091: Compiler crashes if `case` if not followed by a block
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [Red/System] [type.compiler]
<https://github.com/red/red/issues/5091>

**Describe the bug**
```
Red [] #system [case]
```
compiles with:
```
Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : fetch-into expected code argument of t
ype: block paren
*** Where: comp-case
*** Near:  [fetch-into cases [
append/only list comp-block-chunked/only/test 'case
cases: pc
]
clear find/last
]
```
which apart from hinting that it's `case` related, doesn't give any clue on where to look for the error

Originally error crawled in from a local colliding with R/S construct, something like this but in more complex code:
```
r: routine [case [logic!]] [probe case]
r yes
```

**Expected behavior**

1. Not "Internal" error
2. More helpful location of bug source
3. Error if local name shadows R/S construct name

**Platform version**
```
Red 0.6.4 for Windows built 22-Feb-2022/5:26:32+03:00  commit #8126da7
```



