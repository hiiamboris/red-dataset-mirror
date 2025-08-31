
#4598: compiler ignores function calls in some cases
================================================================================
Issue is open, was reported by 9214 and has 0 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4598>

**Describe the bug**
If setting a word to a function follows a pattern other than `<word>: <function>`, such as `<word>: <word>: <function>` or `set [<word>] <function>`, then compiler does not call functions during evaluation of respective words.

**To reproduce**
The following snippet:
```red
Red []

foo: does [1]
set [bar:] does [2]
baz: qux: does [3]

probe reduce [foo bar baz qux]
```

Interpreted:
```red
[1 2 3 3]
```
Compiled:
```red
[1 func [][2] func [][3] 3]
```

**Expected behavior**
Compiled behavior matches interpreted one.

**Platform version**
02776dc, W10.


