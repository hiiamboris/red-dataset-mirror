
#5501: Words fail to stay local in blocks evaluated with loop block evaluator: repeat
================================================================================
Issue is closed, was reported by TimeSeriesLord and has 6 comment(s).
[status.duplicate]
<https://github.com/red/red/issues/5501>

**The Bug**
Words fail to stay local in blocks evaluated with loop block evaluators: repeat

**Bug in Action**

The value of count should be local to the block argument to repeat. After repeat evaluation, count should have any previous set value.

```
>> count
*** Script Error: count has no value
*** Where: catch
*** Near : count
*** Stack:  

>> repeat count 3 [print ["count:" count]]
count: 1
count: 2
count: 3

>> count
== 3

```
**Expected behavior**

```
>> repeat count 3 [print count]
1
2
3

>> count
** Script Error: count has no value
** Near: count

>> count: "this is a test"
== "this is a test"
>> repeat count 3 [print count]
1
2
3
>> count                       
== "this is a test"

```

**Screenshots**
none

**Platform version**

-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 38 date: 6-Apr-2024/0:45:40 commit: #36adc615a99a9b5678b7b323dac572ef1c0543ea ]
PLATFORM: [ name: "Debian GNU/Linux 12 (bookworm)" OS: 'Linux arch: 'x86_64 version: 6.1.42 build: {#1 SMP PREEMPT_DYNAMIC Mon Jul 31 18:30:05 EEST 2023} ]
--------------------------------------------


Comments:
--------------------------------------------------------------------------------

On 2024-05-05T13:22:25Z, gurzgri, commented:
<https://github.com/red/red/issues/5501#issuecomment-2094808847>

    By design: https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol#local-contexts-for-loops

--------------------------------------------------------------------------------

On 2024-05-05T13:59:47Z, gurzgri, commented:
<https://github.com/red/red/issues/5501#issuecomment-2094820279>

    But note that within a function defined with `function`, the iterator word(s) of `foreach`, `repeat` and [others](https://github.com/red/red/blob/36adc615a99a9b5678b7b323dac572ef1c0543ea/encapper/compiler.r#L103) get collected and, like set-words, are added to the local words of the function. So they don't leak into global context.

--------------------------------------------------------------------------------

On 2024-05-05T15:32:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/5501#issuecomment-2094852442>

    https://github.com/red/red/issues/972

