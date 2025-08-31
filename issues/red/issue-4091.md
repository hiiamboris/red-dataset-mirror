
#4091: FIND with two hashes is picky
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4091>

**Describe the bug**
```
>> h: make hash! [1 2 3 4]
== make hash! [1 2 3 4]
>> find h [3]
== make hash! [3 4]
>> find h [3 4]
== make hash! [3 4]

>> find h make hash! [3]
== none
>> find h make hash! [3 4]
== none
```

**Expected behavior**
```
>> h: make hash! [1 2 3 4]
== make hash! [1 2 3 4]
>> find h [3]
== make hash! [3 4]
>> find h [3 4]
== make hash! [3 4]

>> find h make hash! [3]
== make hash! [3 4]
>> find h make hash! [3 4]
== make hash! [3 4]
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Oct-2019/19:41:56+03:00 commit #2976655
```



