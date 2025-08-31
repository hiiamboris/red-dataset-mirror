
#3859: RANDOM/ONLY applied to BINARY! value returns a CHAR!
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3859>

**Describe the bug**
`random/only <binary>` returns a `char!` value rather than an `integer!` in 0 - 255 range.

**To reproduce**
```red
>> random/only #{AA}
== #"ª"
```

Above happens because [this](https://github.com/red/red/blob/master/runtime/datatypes/series.reds#L122) switch block falls thru to default clause and ignores `TYPE_BINARY` case.

**Expected behavior**
I expect it to behave the same as in Rebol:
```red
>> random/only #{AA}
== 170
```

**Platform version (please complete the following information)**
Latest.



