
#1999: Test "fc-12" in float-test.reds is failing
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System] [test.written]
<https://github.com/red/red/issues/1999>

In test "fc-12", the "actual" result is 2.0 when it should be -2.0

```
fcfoo: func [a [float!] return: [float!]][a]
fcptr: declare struct! [a [float!]]
fcptr/a: 3.0 
...
--test-- "fc-12"
--assert fcptr/a - (fcfoo 5.0) = -2.0            ;-- reg(path!)/reg(block!)
```



