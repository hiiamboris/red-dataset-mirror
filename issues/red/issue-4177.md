
#4177: FIND hash! block! is linear
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [type.task.wish]
<https://github.com/red/red/issues/4177>

**Describe the bug**

`find hash item` search is O(1)
`find hash [item]` search is O(n)

**To reproduce**
```
b: collect [repeat i 100000 [keep i]]
h: make hash! b
loop 100000 [find h random 100000]           ;) completes in a fraction of a second
loop 10000 [find h reduce [random 100000]]   ;) takes 15+ seconds
```

**Expected behavior**

`find hash [item]` and `find hash [item1 .. itemN]` should be fast O(1) lookups (like in R2)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Nov-2019/10:17:45+03:00 commit #b2aafe6
```



