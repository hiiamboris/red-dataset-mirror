
#4084: `parse/trace` fails on 2 integer! rule
================================================================================
Issue is closed, was reported by toomasv and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4084>

**Describe the bug**
When given 2-integer iteration rule where input length? > 2 and rule is to match type or skip, it fails with `/trace`, but succeeds without it.

**To reproduce**
```
>>  parse/trace "aaa" [1 3 skip] func [e m r i s][true]
== false
>>  parse/trace "aaa" [1 3 "a"] func [e m r i s][true]
== true
>> parse "aaa" [1 3 skip]
== true
```
```
>> parse/trace [a a a][0 3 word!] func [e m r i s][true]
== false
>> parse [a a a][0 3 word!]
== true
>> parse/trace [a a a][0 3 'a] func [e m r i s][true]
== true
>> parse/trace [a a][0 3 word!] func [e m r i s][true]
== true
>> parse/trace [a a a][3 word!] func [e m r i s][true]
== true
```

**Expected behavior**
`parse/trace` respects upper limit in 2-integer iteration rule as in
```
>> parse/trace [a a a][0 3 word!] func [e m r i s][true]
== true
```

**Additional notes**
@endo64 commented: Given
```
parse/trace [a a a] [1 3 word!] func [e m r i s][
    print [
       "event:" e newline 
       "match:" m newline 
       "rule:" mold r newline 
       "input:" mold i newline 
       "stack:" mold s newline
    ] true
]
```
> In the output, last input should be empty, but it is not (is it input: [a] so it fails)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 11-Oct-2019/20:22:47+03:00 commit #1bd366c
```



