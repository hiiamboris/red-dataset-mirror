
#3331: compiler: make op! won't accept a path!, only word!
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.wish] [type.compiler]
<https://github.com/red/red/issues/3331>

```
-=== Red Compiler 0.6.3 ===-

Compiling D:\usr\redjunk\ticket14.red ...
...using libRedRT built on 12-Apr-2018/7:40:01
*** Red Compiler Internal Error: Script Error : Expected one of: word! - not: path!
*** Where: repend
*** Near:  [proto: get-prefix-func to word! pos/4]
```
### Steps to reproduce the problem
red -c on this (fails on the last line):
```
Red []

f: func [x y] [x + y]
c: context [f: get bind 'f 'system]

op1: make op! :f
op2: make op! :c/f
```
### Red and platform version
```
>> any [attempt[about/debug] about]
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 595 date: 6-Apr-2018/13:49:30 commit: #f53f9073931e1acc7ee00e9ddad4615e14326a68 ]
PLATFORM: [ name: "Windows 7" OS: 'Windows arch: 'x86-64 version: 6.1.0 build: 7601 ]
--------------------------------------------
```


