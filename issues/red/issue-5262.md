
#5262: CRASH from `cause-error ... 'code`
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5262>

**Describe the bug**
```
>> cause-error 'script 'code []

*** Runtime Error 98: assertion failed
*** in file: /d/devel/red/red-src/master/runtime/datatypes/block.reds
*** at line: 179
***
***   stack: red/block/clone 0552D060h false false
***   stack: red/error/form 054B8B68h 04B101BCh 04B1019Ch 2147483629
***   stack: red/actions/form 054B8B68h 04B101BCh 04B1019Ch 2147483647
***   stack: red/block/form 04B101ACh 04B101BCh 04B1019Ch 2147483647
***   stack: red/actions/form 04B101ACh 04B101BCh 04B1019Ch 2147483647
***   stack: red/actions/form* -1
***   stack: red/natives/do-print true true
***   stack: red/natives/print* true
***   stack: ctx||603~do-command 01260C10h
***   stack: ctx||603~eval-command 01260C10h
***   stack: ctx||603~run 01260C10h
***   stack: ctx||603~launch 01260C10h
***   stack: ctx||622~launch 0126061Ch
```

**Expected behavior**

Error that `code` shouldn't be used.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4612 date: 9-Dec-2022/7:12:47 commit: #ce6e33c1dc44fc32bdaeb7f804ac93d98b9af863 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


