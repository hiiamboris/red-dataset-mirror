
#3380: foreach should complain about the empty block of words
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3380>

Since it's a probable indication of a coder's mistake? Otherwise one would use `forever`?

### Steps to reproduce the problem
`foreach [] [1] []`

### Expected behavior
R3:
```
>> foreach [] [1] []
** Script error: invalid argument: []
** Where: foreach
** Near: foreach [] [1] []
```

### Actual behavior
it deadlocks

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 688 date: 5-May-2018/11:50:50 commit: #9ce2aacce1509943ac11efa3b13457e8a66f03b4 ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


