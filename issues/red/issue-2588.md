
#2588: Reverse range in make bitset! is ignored without error message 
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2588>

```
>> charset [12 - 1]
== make bitset! #{0008}  ;; not interpreted as 1 - 12, the 1 is simply ignored
>> charset [12 - 13]
== make bitset! #{000C}
```



