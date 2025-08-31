
#5257: `rtd-layout` should accept empty input
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[GUI]
<https://github.com/red/red/issues/5257>

**Describe the bug**

When generating rich-text input programmatically, this empty string requirement becomes an annoyance:
```
>> rtd-layout [""]
== make object! [...

>> rtd-layout []
*** Script Error: RTD - invalid syntax at: []
*** Where: do
*** Near : rtd-layout []
*** Stack: rtd-layout cause-error
```

**Expected behavior**

`rtd-layout []` should work the same as `rtd-layout [""]`

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4612 date: 9-Dec-2022/7:12:47 commit: #ce6e33c1dc44fc32bdaeb7f804ac93d98b9af863 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


