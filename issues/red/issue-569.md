
#569: PARSE KEEP COPY x 1 SKIP returns char!
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/569>

```
Red []

size: 1
probe parse "1" [collect [keep copy value size skip]]
?? value
size: 2
probe parse "12" [collect [keep copy value size skip]]
?? value
```

[#"1"]
value: "1"
["12"]
value: "12"

This is inconvenient and unexpected, because KEEP is defined as `KEEP <rule>` and the VALUE returned by the rule is a string.



Comments:
--------------------------------------------------------------------------------

On 2013-11-19T09:46:43Z, dockimbel, commented:
<https://github.com/red/red/issues/569#issuecomment-28777115>

    The PARSE stack handling needs some more changes to be able to detect COPY accurately when used as a sub-rule of KEEP.

