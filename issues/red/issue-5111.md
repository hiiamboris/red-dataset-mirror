
#5111: [Draw] Block corruption on error
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5111>

**Describe the bug**
```
>> b: [1]
== [1]
>> draw 1x1 b
*** Script Error: invalid Draw dialect input at: [1]
*** Where: draw-image
*** Near : b
*** Stack: draw  

>> b
== [...]
>> copy/deep b
*** Internal Error: circular reference not allowed
*** Where: copy
*** Near : b
*** Stack:  

>> b
== [1]
>> copy/deep b
== [1]
```

**To reproduce**

Any error-generating token leads to this.

**Platform version**
```
Red 0.6.4 for Windows built 11-Mar-2022/2:40:53+03:00  commit #27f71f9
```



Comments:
--------------------------------------------------------------------------------

On 2022-03-23T15:21:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/5111#issuecomment-1076484339>

    a bit similar to https://github.com/red/red/issues/4838

--------------------------------------------------------------------------------

On 2022-03-24T02:47:29Z, qtxie, commented:
<https://github.com/red/red/issues/5111#issuecomment-1077012809>

    And `copy/deep` cures it. 😃 

