
#4202: [Compiler] Cannot use `return` from within `catch`
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4202>

Possibly related: https://github.com/red/red/issues/4053

**Describe the bug**
```
Red []
f: does [
    print "1"
    catch [return "2"]
    print "3"
]
print f
```
Compiles, but crashes when run:
```
1

*** Runtime Error 95: no CATCH for THROW
*** at: 00408A91h
```

**Expected behavior**
```
1
2
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 12-Dec-2019/11:14:17+03:00 commit #61d4d36
```



