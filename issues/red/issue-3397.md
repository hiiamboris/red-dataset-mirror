
#3397: `put` key/value to a map! not successful after `clear` this map! 
================================================================================
Issue is closed, was reported by bitbegin and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3397>

### Expected behavior
```
>> a: #() 
== #()
>> put a 'b 1 
== 1
>> a 
== #(
b: 1 ) 
>> clear a 
== #()
>> put a "b" 1 
== 1
>> a 
== #(
"b" 1 ) 
>> clear a 
== #()
>> put a 'b 1 
== 1
>> a 
== #(
b: 1 ) 
>>
```
### Actual behavior
```
>> a: #() 
== #()
>> put a 'b 1 
== 1
>> a 
== #(
b: 1 ) 
>> clear a 
== #()
>> put a "b" 1 
== 1
>> a 
== #(
"b" 1 ) 
>> clear a 
== #()
>> put a 'b 1 
== 1
>> a 
== #()
>>
```
### Steps to reproduce the problem

see `Actual behavior`

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 716 date: 21-May-2018/10:00:21 commit: #9e5803bb48f6cb39eed40b7af22e4c8853dafd2f ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```


