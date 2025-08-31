
#5296: [View] CRASH in image copy
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [type.bug] [test.written] [GUI]
<https://github.com/red/red/issues/5296>

**Describe the bug**
```
>> im: make image! 50x50
>> copy/part skip im 1x1 skip im 10x10

*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/platform/image-wic.reds
*** at line: 535
***
***   stack: red/OS-image/lock-bitmap 049E01DCh false
***   stack: red/image/serialize 049E01DCh 049E01ECh false false false 049E01ECh 175 1
***   stack: red/image/mold 049E01DCh 049E01ECh false false false 049E01ECh 191 0
***   stack: red/actions/mold 049E01DCh 049E01ECh false false false 049E01ECh 191 0
***   stack: red/actions/mold* -1 -1 -1 1
***   stack: ctx||603~do-command 04B20BF4h
***   stack: ctx||603~eval-command 04B20BF4h
***   stack: ctx||603~run 04B20BF4h
***   stack: ctx||603~launch 04B20BF4h
***   stack: ctx||622~launch 04B20600h
```

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4629 date: 28-Jan-2023/11:28:13 commit: #ec0c31279023590e285fb2e1869380670ee0239f ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-03-20T03:11:14Z, qtxie, commented:
<https://github.com/red/red/issues/5296#issuecomment-1475548957>

    Related issue: #5181 #4808

