
#5320: Empty /part insertion is broken on binary
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.bug]
<https://github.com/red/red/issues/5320>

**Describe the bug**
```
>> append/part #{} s: #{1234} next s
== #{12}
>> append/part #{} s: #{1234} 0   ;) bug!
== #{1234}
>> append/part #{} s: #{1234} s   ;) bug!
== #{1234}
```

**Expected behavior**

Nothing inserted when empty part.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4667 date: 9-Apr-2023/3:24:34 commit: #d36108eeffeafbf14839b5a9cadc9a0acd87f34a ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-05-18T21:48:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/5320#issuecomment-1553701470>

    Root issue of this and https://github.com/red/red/issues/5319 and https://github.com/red/red/issues/4106 is lack of abstraction in /part handling in particular. See https://github.com/red/REP/issues/97

