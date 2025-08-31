
#1610: parse does not accept file! in rule  as type any-string!
================================================================================
Issue is closed, was reported by xqlab and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1610>

```
red>> parse %123 [%123]
== false  
red>> parse %123 ["123"]
== true 
```

Rebol2 gives true in both cases.



