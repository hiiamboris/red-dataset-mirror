
#5241: Rounding error in rich-text metrics?
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5241>

**Describe the bug**

Sometimes `size-text` and `caret-to-offset` report equal height:
```
>> r: rtd-layout ["abc"] ()
>> size-text r
== 19x16
>> caret-to-offset/lower r 3
== 19x16
```
But sometimes caret sticks out of the line:
```
>> r: rtd-layout [font 30 ["abc"]] ()
>> size-text r
== 61x52
>> caret-to-offset/lower r 3
== 61x53       ;) ????
```

**Expected behavior**

Equal /y for last line of text.

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4565 date: 7-Nov-2022/8:01:41 commit: #134698f686c200e24d420f28866c8aa03a8557c0 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


