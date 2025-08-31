
#4609: compiler malforms some TUPLE! literals
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4609>

**Describe the bug**
Discovered while working on https://github.com/red/red/pull/4608: some `tuple!` values are not stored by the compiler properly and get malformed.

**To reproduce**
```red
Red [] probe [2.3.4.5.6 1.2.3.4.5.6]
```

Interpreted:
```red
[2.3.4.5.6 1.2.3.4.5.6]
```

Compiled:
```red
[2.3.4.5.3 1.2.3.4.3.4]
```

**Expected behavior**
Compiled behavior matches interpreted one.

**Platform version**
3d5490f, W10.



