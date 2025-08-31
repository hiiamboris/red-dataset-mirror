
#4365: `mold/flat` has no effect on binary values
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.wish] [test.written]
<https://github.com/red/red/issues/4365>

**Describe the bug**

```
>> print mold/flat append/dup #{} "x" 100
#{
7878787878787878787878787878787878787878787878787878787878787878
7878787878787878787878787878787878787878787878787878787878787878
7878787878787878787878787878787878787878787878787878787878787878
78787878
}
```

**Expected behavior**
```
>> print mold/flat append/dup #{} "x" 100
#{7878787878787878787878787878787878787878787878787878787878787878787878787878787878878787878787878787878787878787878787878787878787878787878787878787878787878787878787878787878787878787878787878787878}
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Feb-2020/6:07:00+03:00 commit #bf15211
```



