
#4998: `function` emits /local local
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4998>

**Describe the bug**
```
>> f: function [/local x] [local: 1]
== func [/local x][local: 1]
>> f: function [] [local: 1]
*** Script Error: duplicate variable specified: local
*** Where: function
*** Stack: f  
```
Affects both interpreter and compiler

**Expected behavior**
```
>> f: function [] [local: 1]
== func [/local][local: 1]
```

**Platform version**
```
Red 0.6.4 for Windows built 6-Nov-2021/19:36:18+03:00  commit #30e5312
```



