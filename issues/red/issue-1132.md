
#1132: Math ops on pairs do not work with prefix actions
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/1132>

This is because the action specs have not been updated. Example:

```
red>> help add
USAGE:
    add value1  value2
DESCRIPTION:
     Returns the sum of the two values.
     add is of type: action!
ARGUMENTS:
     value1  [number! char!]
     value2  [number! char!]
```



