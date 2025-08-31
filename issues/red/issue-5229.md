
#5229: Extra mold in user error output
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/5229>

**Describe the bug**

Normal errors output their message plainly:
```
>> print try [1 / 0]
*** Math Error: attempt to divide by zero
```
But user errors output it after molding, which only hurts readability:
```
>> print make error! "^-error message"
*** User Error: "^-error message"
```

**Expected behavior**
```
*** User Error: 	error message
```

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4532 date: 6-Oct-2022/6:24:41 commit: #0657e2239680d6071a4f22f467031deeb0fd9f2d ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


