
#2325: make series! <float> is not implemented according to conversion table
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2325>

```
red>> make string! 1.0
== "1.0"
```
The specification table says: "New string with truncated any-float slots preallocated"
This deviation is observed for `any-string!`, `any-list`, `any-path`, `binary!`, `map!` and `vector!`



