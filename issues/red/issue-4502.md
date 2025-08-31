
#4502: SORT randomly arranges images
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4502>

**Describe the bug**

As a result, an algorithm that sorts sub-blocks - never completes.
See:
```
>> a: make image! 1x2
== make image! [1x2 #{FFFFFFFFFFFF}]
>> b: make image! 2x1
== make image! [2x1 #{FFFFFFFFFFFF}]
>> s: reduce [a b]
== [make image! [1x2 #{FFFFFFFFFFFF}] make image! [2x1 #{FFFFFFFFFFFF}]]
>> sort s
== [make image! [2x1 #{FFFFFFFFFFFF}] make image! [1x2 #{FFFFFFFFFFFF}]]
>> sort s
== [make image! [1x2 #{FFFFFFFFFFFF}] make image! [2x1 #{FFFFFFFFFFFF}]]
>> sort s
== [make image! [2x1 #{FFFFFFFFFFFF}] make image! [1x2 #{FFFFFFFFFFFF}]]
```
It just shuffles `a` and `b` around

**To reproduce**
```
a: make image! 1x2
b: make image! 2x1
s: reduce [a b]
sort s
sort s
sort s
```

**Expected behavior**

Should take size first using rules for pairs; then image contents.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



