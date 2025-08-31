
#3686: `find/tail` doesn't work with block
================================================================================
Issue is closed, was reported by toomasv and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/3686>

**Describe the bug**

`find/tail` with block returns at second element of match.

**To reproduce**

```
>> find/tail [a b c d e f][c d e]
== [d e f]
```

**Expected behavior**

Should return series after match:

```
>> find/tail [a b c d e f][c d e]
== [f]
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 26-Dec-2018/8:24:03+02:00 commit #7369fa2
```



