
#5149: Modifying hashed series will hide them from search
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug] [type.design]
<https://github.com/red/red/issues/5149>

**Describe the bug**

I just realized this while thinking about the hash issues:
```
>> h: make hash! reduce [1 s: "abcdef" 2]
>> find h s
== make hash! ["abcdef" 2]
>> head insert s 'x
== "xabcdef"
>> find h s
== none
>> h
== make hash! [1 "xabcdef" 2]
```
Perhaps hash should somehow detect that underlying series was changed, and update the hashes of slots occupied by that series. Tricky. And another problem will be to avoid the performance loss if every deep change will require an action from hash table.

**Expected behavior**

`find` should keep working obviously

**Platform version**
```
Red 0.6.4 for Windows built 1-Jun-2022/7:18:47+03:00  commit #c619918
```



