
#2512: `empty?`  and `tail?` returns false while length is 0 for `past-end` state
================================================================================
Issue is closed, was reported by Oldes and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2512>

```
>> p: skip s: "hello" 5
== ""
>> clear s
== ""
>> index? p
== 6
>> length? p
== 0
>> empty? p
== false
>> tail? p
== false
```



