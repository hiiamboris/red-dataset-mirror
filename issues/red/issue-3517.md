
#3517: Poking an element of an image is partially bounds-checked
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3517>

### Expected behavior
Using an out-of-bounds index to set a component of an image should give an error
### Actual behavior
```
>> i: make image! 2x2
== make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]
>> i/size
== 2x2
>> length? i
== 4
>> i/5: #{00000000}
== #{00000000}
>> poke i 5 #{00000000}
== #{00000000}
>> i/(2x3): #{00000000}
*** Script Error: value out of range: 2x3
*** Where: set-path
*** Stack:  
>> i/(3x2): #{00000000}
== #{00000000}
```
### Steps to reproduce the problem
Execute above code
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 845 date: 20-Aug-2018/0:39:55 commit: #318673b7ae1c33b5852087f80905f2293ce5bd3f ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
```


Comments:
--------------------------------------------------------------------------------

On 2018-08-22T20:48:20Z, greggirwin, commented:
<https://github.com/red/red/issues/3517#issuecomment-415174496>

    Same issue as #3516 (off by one at image end)?

