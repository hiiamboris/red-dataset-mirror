
#5251: [Parse] `opt` fails to evaluate paren-expression
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5251>

**Describe the bug**

Silently skips it, no error:
```
>> parse [1] [opt (print "here")]
== false
```

**Expected behavior**
```
>> parse [1] [opt (print "here")]
here
== false
```

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4599 date: 26-Nov-2022/12:23:25 commit: #3b59a3ffc877eb6a5d6bb3a4d2e0b6d41cf6ca0d ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


