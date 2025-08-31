
#108: Wrong error condition/message with nested structures
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/108>

I accidentally made a mistake in spelling a field name

```
str!: alias struct! [i [integer!]] p: struct [val [str!]] p/va/i: 1
*** Compiler Internal Error: Script Error : Cannot use path on none! value
*** Where: resolve-type
*** Near:  [unless base-type? type/1 [
    type: select aliased-types type/1
```



