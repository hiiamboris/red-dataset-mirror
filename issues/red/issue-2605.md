
#2605: move crash if arguments are a mix of any-string! and any-block! values
================================================================================
Issue is closed, was reported by DideC and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2605>

This simply crash the console :
```
a: [1 2 3]
b: "abc"
move a b
```
There might be some type checking missing to error out in this kind of cases.


