
#4431: [Compiler] Redbin encoder does not preserve new-line flags in ANY-STRING! values
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[type.bug]
<https://github.com/red/red/issues/4431>

**Describe the bug**
`any-string!` values lose their new-line flags when encoded into Redbin payload during compilation.

**To reproduce**
Compile the code snippet below:

```red
Red []

probe [
    a
    :b c:
    'd /e #f
	
    "a"
    @b %c
    <d> e@f
]
```

Output:
```red
[
    a
    :b c:
    'd /e #f "a" @b %c <d> e@f
]
```

**Expected behavior**
```red
[
    a
    :b c:
    'd /e #f
    "a"
    @b %c
    <d> e@f
]
```

**Platform version**
```
Red 0.6.4 for Windows built 7-May-2020/6:07:31+02:00 commit #c149a36
```


