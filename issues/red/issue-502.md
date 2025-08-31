
#502: CASE doesn't support non-block in compiler
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.wish] [test.written]
<https://github.com/red/red/issues/502>

```
case [yes 1 no 2]
```

-= Red Compiler =- 
**\* Compilation Error: expected a block for CASE instead of integer! value 
**\* near: [1 no 2]

red>> case [yes 1 no 2]
== 1



