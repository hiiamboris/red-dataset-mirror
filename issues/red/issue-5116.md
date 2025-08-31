
#5116: Stack overflow in `find` on hash
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/5116>

**To reproduce**

Likely some stack/reset is missing:
```
>> bs: make hash! append/dup [] [1 2 3] 10000
== make hash! [1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1...
>> find bs [3 4]
*** Internal Error: stack overflow
*** Where: find
*** Near : [3 4]
*** Stack:  
```
It also takes ~1-2 seconds, whereas on block it is instantaneous.

**Expected behavior**

`none`, and should not be much slower than a block

**Platform version**
```
Red 0.6.4 for Windows built 4-Apr-2022/15:09:55+03:00  commit #28dad01
```



