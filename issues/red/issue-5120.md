
#5120: Hash becomes invalid after `poke`
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5120>

**Describe the bug**
```
>> h: make hash! [1 2 3 4 5]
== make hash! [1 2 3 4 5]
>> h/1: 10
== 10
>> find h 10
== none
>> poke h 2 20
== 20
>> find h 20
== none
>> h
== make hash! [10 20 3 4 5]
```

**Expected behavior**

Should find new values

**Platform version**
```
Red 0.6.4 for Windows built 4-Apr-2022/15:09:55+03:00  commit #28dad01
```



Comments:
--------------------------------------------------------------------------------

On 2022-04-13T02:02:43Z, qtxie, commented:
<https://github.com/red/red/issues/5120#issuecomment-1097473823>

    I didn't find the code that handle it in the runtime code. 😅 

