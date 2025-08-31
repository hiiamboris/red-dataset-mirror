
#2561: Parse collect+keep grabs null with `to end` on string
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/2561>

```
>> parse "" [collect [keep to end]]
== [#"^@"]
```


