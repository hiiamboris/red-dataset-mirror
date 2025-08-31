
#3449: compile lexer reads percent! as an issue!
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3449>

### Steps to reproduce the problem
Compile the snippet with with `-c` or `-c -e` or `-r -e`:
```
Red []
probe -10%
probe type? -10%
probe -10% * 0.1
```
### Expected behavior
```
-10%
percent!
-1%
```
### Actual behavior
```
#-10%-
issue!
*** Script Error: * does not allow issue! for its value1 argument
*** Where: *
*** Stack:
```
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 750 date: 12-Jun-2018/15:07:14 commit: #e62b63d51cdc5d5f6033eb3fa366fd94be0b2deb ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```


