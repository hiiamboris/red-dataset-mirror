
#4985: Unexpected behavior of to path! vector
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4985>

**Before submitting**

I'm using vectors as deep paths into data, but have to convert them to paths for output, otherwise it's impossible to read. But:

```
>> to path! make vector! [1 2]
== make vector! [1 2]
>> to lit-path! make vector! [1 2]
== 'make vector! [1 2]
>> to get-path! make vector! [1 2]
== :make vector! [1 2]
>> to set-path! make vector! [1 2]
== make vector! [1 2]:
```
I don't find this behavior useful, and I find it surprising.

**Expected behavior**

I'd like `to path! vector` to work similar to `to block! vector`:
```
>> to block! make vector! [1 2]
== [1 2]
```

**Platform version**
```
Red 0.6.4 for Windows built 7-Oct-2021/14:56:13+03:00  commit #7218fb4
```



