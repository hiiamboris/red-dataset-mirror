# Issue #5646: Redbin decode fails when map key has been removed
<https://github.com/red/red/issues/5646>

**Describe the bug**
The redbin decode fails when trying to decode a map that has had a key removed.

**To reproduce**
```
>> do bind [decode encode remove/key m: #[1 2] 1 {}] system/codecs/redbin
*** Script Error: REDBIN - invalid record at index 53
*** Where: decode
*** Near : decode encode remove/key m: #[] 1 ""
*** Stack: context view do-events do-actor do-safe error? run 
```

**Expected behavior**
redbin `decode` should return an empty map
```
>> do bind [decode encode remove/key m: #[1 2] 1 {}] system/codecs/redbin
== #[]
```


**Platform version**
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 0 date: 19-Mar-2025/13:09:25 commit: #6942c7a021253150c3e3cf90428305892340db03 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------



<no comments>
