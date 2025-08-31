
#5502: Words fail to stay local in blocks evaluated with loop block evaluators: foreach
================================================================================
Issue is closed, was reported by TimeSeriesLord and has 6 comment(s).
[status.duplicate]
<https://github.com/red/red/issues/5502>

**The Bug**
Words fail to stay local in blocks evaluated with loop block evaluators: foreach

**Bug in Action**

The words that hold the foreach values should be local to the block. Words with the same names in the global context should not be mutated (side effect).


```
>> ;; previously defined
>> time
== 7:43:07
>> ?? time
time: func [][now/time]

>> title
*** Script Error: title has no value
*** Where: catch
*** Near : title
*** Stack:  

>> price
*** Script Error: price has no value
*** Where: catch
*** Near : price
*** Stack:  

>> movies: [
[         8:30 "Contact"      $4.95
[        10:15 "Ghostbusters" $3.25
[        12:45 "Matrix"       $4.25
[    ]
== [
    8:30:00 "Contact" $4.95 
    10:15:00 "Ghostbusters" $3.25 
    12:45:00 "Matrix"...
    

>> foreach [time title price] movies [
[        print ["watch" title "at" time "for" price]
[    ]
watch Contact at 8:30:00 for $4.95
watch Ghostbusters at 10:15:00 for $3.25
watch Matrix at 12:45:00 for $4.25

>> ;; broke the time code
>> time
== 12:45:00
>> ?? time
time: 12:45:00

>> title
== "Matrix"
>> price
== $4.25

```
**Expected behavior**

```
time: func [][now/time]
>> movies: [
[         8:30 "Contact"      $4.95
[        10:15 "Ghostbusters" $3.25
[        12:45 "Matrix"       $4.25
[    ]
== [
    8:30 "Contact" $4.95 
    10:15 "Ghostbusters" $3.25 
    12:45 "Matrix" $4.25
]
>> 
>> foreach [time title price] movies [
[        print ["watch" title "at" time "for" price]
[    ]
watch Contact at 8:30 for $4.95
watch Ghostbusters at 10:15 for $3.25
watch Matrix at 12:45 for $4.25
>> time
== 7:53:32
>> ?? time
time: func [][now/time]
>> title
** Script Error: title has no value
** Near: title
>> price
** Script Error: price has no value
** Near: price


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

On 2024-05-05T13:22:23Z, gurzgri, commented:
<https://github.com/red/red/issues/5502#issuecomment-2094808829>

    By design: https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol#local-contexts-for-loops

--------------------------------------------------------------------------------

On 2024-05-05T15:57:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/5502#issuecomment-2094859871>

    https://github.com/red/red/issues/972

--------------------------------------------------------------------------------

On 2024-05-05T15:58:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/5502#issuecomment-2094860017>

    Please use the search :)

