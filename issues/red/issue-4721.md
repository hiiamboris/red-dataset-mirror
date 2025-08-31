
#4721: clipboard-test.red (image-io-1) fails in interpreter on W10
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4721>

**Describe the bug**

For whatever reason the first line returns `false` in the console:
```
>> write-clipboard make image! 0x0
== false
>> write-clipboard make image! 1x1
== true
>> about/debug
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 3341 date: 11-Nov-2020/2:05:03 commit: #738c45d5ca412950325d2e00e0c08392777ad603 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19041 ]
--------------------------------------------
```

Compiled script:
```
Red []
probe write-clipboard make image! 0x0
probe read-clipboard
```
prints:
```
true
none
```
(which is the expected result)



