
#3368: insert/append dup argument should be an integer
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
<https://github.com/red/red/issues/3368>

### Steps to reproduce the problem
`insert/dup "world" "order" 30%`
`append/dup "world" "order" 30%`
### Expected behavior
an error
### Actual behavior
either 
```
>> append/dup "world" "order" 30%
*** Internal Error: not enough memory
*** Where: append
*** Stack: 
```
or it's trying to calculate the meaning of life
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 688 date: 5-May-2018/11:50:50 commit: #9ce2aacce1509943ac11efa3b13457e8a66f03b4 ]
PLATFORM: [ name: "Windows 7 Service Pack 1" OS: 'Windows arch: 'x86-64 version: 6.1.1 build: 7601 ]
--------------------------------------------
```
https://gitter.im/red/bugs?at=5ae3762462316e050508e893


