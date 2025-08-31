
#1917: IF value-in-block is always TRUE
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
<https://github.com/red/red/issues/1917>

When checking for value in block! that is FALSE, IF treats it as TRUE:

```
red>> x: [false]
== [false]
red>> if x/1 [print "bug"]
bug
red>> if first x [print "bug"]
bug
red>> if :x/1 [print "bug"]
bug
red>> if pick x 1 [print "bug"]
bug
```



