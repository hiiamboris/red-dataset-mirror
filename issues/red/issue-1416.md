
#1416: copy/part with negative part value
================================================================================
Issue is closed, was reported by Oldes and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1416>

This crashes in Red:

```
red>> a: "1234" b: skip a 2 copy/part b a
```

This is not compatible with Rebol:

```
>> a: skip "1234" 2 copy/part a -2
== "12"
```

```
red>> a: skip "1234" 2 copy/part a -2
== ""
```



