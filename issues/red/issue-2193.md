
#2193: SWITCH only allows single value before block to eval
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2193>

```
switch/default type?/word 'a [
        word! block!     [print "word|block"]
        function!        [print 'function]
    ][print 'else]
```



