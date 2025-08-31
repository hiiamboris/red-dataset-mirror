
#3363: POWER integer! to float! promotion logic is... illogical
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3363>

All these resulting numbers fit into a 32-bit signed integer, however `power` (and `**`) promotes them on occasion. 
```
>> power 2 16
== 65536.0
>> power 2 15
== 32768
>> power 3 15
== 14348907
>> power 16 4
== 65536.0
>> power 7 7
== 823543
>> power 7 8
== 5764801.0
>> power 11 7
== 19487171
>> power 11 8
== 214358881.0
>> power 23 4
== 279841.0
>> power 23 3
== 12167
>> power 1 100
== 1
>> power 215 2
== 46225
>> power 216 2
== 46656.0
```
Should instead return integers as long as they're < 2**31.
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 680 date: 30-Apr-2018/14:20:17 commit: #afadb4f3346f679d38e6015f1b1ac5d2fc0152af ]
PLATFORM: [ name: "Windows 7" OS: 'Windows arch: 'x86-64 version: 6.1.0 build: 7601 ]
--------------------------------------------
```
:point_up: [May 2, 2018 8:05 PM](https://gitter.im/red/help?at=5ae9eff0db299d4004c76956)
We've identified the possible cause & fix there.


