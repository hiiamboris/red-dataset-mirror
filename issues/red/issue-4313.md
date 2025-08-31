
#4313: GUI console prints NL at head when one is at tail.
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4313>

**Describe the bug**
```
>> prin "A^/"

A
>> prin "A^/^/"

A

>>
```

Don't know if it's related to #2986 or #2679, but the trailing newline is the cause.

**To reproduce**

Call `prin` with a string that has a newline at the end. GUI console only. CLI console is fine.

**Expected behavior**
```
>> prin "A^/"
A

>> prin "A^/^/"
A

```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 26-Feb-2020/12:45:17-07:00 commit #3a61def
```



