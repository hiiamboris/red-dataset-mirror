
#1413: PARSE accepts anything as rules
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1413>

Unlike Rebol, Red's PARSE doesn't check if rules exist, it accepts anything:

```
 red>> parse "something" [Why not Zoidberg?]
== false
```

vs:

```
>> parse "something" [Why not Zoidberg?]
** Script error: PARSE - invalid rule or usage of rule: Why
** Where: parse
** Near: parse "something" [Why not Zoidberg?]
```



