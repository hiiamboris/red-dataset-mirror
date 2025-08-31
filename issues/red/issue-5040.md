
#5040: Compiler accepts function redefinition but not inside context
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.compiler]
<https://github.com/red/red/issues/5040>

**Describe the bug**
```
Red []

lsh1: :shift-left
probe lsh1 1 2

context [
	lsh2: :shift-left
	probe lsh2 1 2
]
```
Output:
```
4
routine ["Shift bits to the left" data [integer!] bits [integer!]][natives/shift* no 1 -1]
```

**Expected behavior**
```
4
4
```

**Platform version**
```
Red 0.6.4 for Windows built 14-Jan-2022/17:48:17+03:00  commit #4923e32
```



Comments:
--------------------------------------------------------------------------------

On 2022-01-19T15:38:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/5040#issuecomment-1016591403>

    Related: https://github.com/red/red/issues/4598

