
#1590: find/part not working after skipping the series
================================================================================
Issue is closed, was reported by xqlab and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1590>

```
red>> str: "1.1.1"
== "1.1.1"
red>> find/part str "1." 2
== "1.1.1"
red>> str: skip str 2
== "1.1"
red>> find/part str "1." 2
== none
red>> find str "1."
== "1.1"
red>>
```



