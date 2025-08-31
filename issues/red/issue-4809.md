
#4809: [Regression] Console truncates the 1st debug output
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4809>

**Describe the bug**

Given `1.red`:
```
Red []
x: []
loop 3 [? x]
```
Output of `gui-console 1.red` is:
```
X is a block! valu...

X is a block! value.  length: 0  []

X is a block! value.  length: 0  []
```

**Expected behavior**
```
X is a block! value.  length: 0  []
X is a block! value.  length: 0  []
X is a block! value.  length: 0  []
```

**Platform version**
```
Red 0.6.4 for Windows built 20-Jan-2021/10:52:38
```



