
#3764: Empty binary with prefix notation throws an error
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3764>

**Describe the bug**

When trying to use empty binary with prefix notation - `2#{}`, `64#{}`, ..., Red throws an error:

```
>> 2#{}
*** Syntax Error: invalid integer! at "2#{}"
*** Where: do
*** Stack: load 
>> 64#{}
*** Syntax Error: invalid integer! at "64#{}"
*** Where: do
*** Stack: load
```

@greggirwin reports slightly different error:

```
>> 2#{}
*** Syntax Error: invalid type at "2#{}"
*** Where: do
*** Stack: load
```

According to @hiiamboris `2#{ }` (added space) works.
**To reproduce**

See above.

**Expected behavior**

It's not very useful, but it's valid and should work.

**Platform version (please complete the following information)**
```
>> about
Red 0.6.4 for Linux built 25-Jan-2019/12:19:17+01:00
```



