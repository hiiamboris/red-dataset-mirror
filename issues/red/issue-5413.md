
#5413: [Compiler] Inserts unwanted newlines into data
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [type.compiler]
<https://github.com/red/red/issues/5413>

**Describe the bug**

Breaks new-line-aware logic.

Interpreted:
```
[word (
    paren
)]
```
Compiled:
```
[word
(
    paren
)]
```

**To reproduce**

Run this compiled and interpreted:
```
Red []
probe [word (
	paren
)]
```

**Expected behavior**

As interpreted.

**Platform version**
```
Red 0.6.4 for Windows built 18-Oct-2023/1:48:48+03:00  commit #c9f4194
```


