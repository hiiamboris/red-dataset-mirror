
#4494: strange literal form of cyclic HASH!
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4494>

**Describe the bug**
`hash!` is an `any-list!` value, and thus can contain a cyclic reference to itself. The `mold`ed form of this reference does not match `hash!` literal form, however.

**To reproduce**
```red
>> append/only h: make hash! [] h
== make hash! [make hash! make hash! [...]]
```

This doubling comes from an interplay of these two lines:

https://github.com/red/red/blob/5a6dd57ed825dee9c96b430e43622be4eea9a53e/runtime/datatypes/common.reds#L456
https://github.com/red/red/blob/5a6dd57ed825dee9c96b430e43622be4eea9a53e/runtime/datatypes/hash.reds#L87

**Expected behavior**
```red
>> append/only h: make hash! [] h
== make hash! [make hash! [...]]
```

**Platform version**
`master` 5a6dd57e



