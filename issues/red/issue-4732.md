
#4732: Regression: PARSE `collect/into` won't accept a binary anymore
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4732>

**Describe the bug**

Previously:
```
>> i: #{aabbcc} o: #{} parse i [collect into o any keep skip] o
== #{AABBCC}
>> about
Red 0.6.4 for Windows built 17-Aug-2020/6:17:33+03:00 commit #0084083
```
Now:
```
>> i: #{aabbcc} o: #{} parse i [collect into o any keep skip] o
*** Script Error: PARSE - COLLECT INTO/AFTER expects a series! of compatible datatype
*** Where: parse
*** Stack:

>> i: #{aabbcc} o: "" parse i [collect into o any keep skip] o
== "170187204"
>> ;much useful wow
>> about
Red 0.6.4 for Windows built 11-Nov-2020/5:05:03+03:00 commit #738c45d
```



Comments:
--------------------------------------------------------------------------------

On 2020-11-20T02:57:17Z, 9214, commented:
<https://github.com/red/red/issues/4732#issuecomment-730813243>

    https://github.com/red/red/pull/4354.

