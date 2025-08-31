
#5319: FIND overshoots on series /part
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug]
<https://github.com/red/red/issues/5319>

**Describe the bug**
```
>> find/part s: [1] [1] 0    ;) fine!
== none
>> find/part s: [1] [1] s    ;) bug!
== [1]
>> find/part s: [1 2] [1 2] 1    ;) fine!
== none
>> find/part s: [1 2] [1 2] next s    ;) bug!
== [1 2]
```

**Expected behavior**

Integer `part` being equivalent to `skip series part`.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4667 date: 9-Apr-2023/3:24:34 commit: #d36108eeffeafbf14839b5a9cadc9a0acd87f34a ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


