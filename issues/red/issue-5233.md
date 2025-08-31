
#5233: quote does not allow unset! for its :value argument
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5233>

**Describe the bug**
```
>> do reduce ['quote ()]
*** Script Error: quote does not allow unset! for its :value argument
*** Where: quote
*** Near : quote unset
*** Stack: quote  
```

**Expected behavior**

Should return unset

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4532 date: 6-Oct-2022/6:24:41 commit: #0657e2239680d6071a4f22f467031deeb0fd9f2d ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


