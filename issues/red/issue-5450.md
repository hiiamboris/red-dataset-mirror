
#5450: Compiler treats get-words as words in file path inside contexts
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written] [type.compiler]
<https://github.com/red/red/issues/5450>

**Describe the bug**

Simple test:
```
Red []

context [
	wrong: "correct"
	path: %/a/b/c
	probe path/:wrong
	probe path/(wrong)
	probe do [path/:wrong]
]
```
Output when compiled:
```
%/a/b/c/wrong
%/a/b/c/correct
%/a/b/c/correct
```

**Expected behavior**
```
%/a/b/c/correct
%/a/b/c/correct
%/a/b/c/correct
```

**Platform version**
`Red 0.6.4 for Windows built 22-Nov-2023/17:24:25+03:00  commit #34f26df`


Comments:
--------------------------------------------------------------------------------

On 2024-01-16T16:58:30Z, dockimbel, commented:
<https://github.com/red/red/issues/5450#issuecomment-1894143753>

    That issue applies to `url!` values too (same internal code path).

