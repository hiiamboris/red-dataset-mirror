
#394: SWITCH messes up function parameters
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/394>

```
Red []

f: function [
    a [integer!]
    b [integer!]
][
    print a
    print b
]
x: 1
f x switch/default yes [
    yes [x: 2]
][
    x: 2
]

f: function [
    a [block!]
    b [block!]
][
    print a/1
    print b/1
]
x: [1 2]
f x switch/default yes [
    yes [x: next x]
][
    x: next x
]
```

2
unset
2

**\* Script error: action 38 not defined for type: 2



