
#5445: [Preprocessor] #local directive disables processing too far
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5445>

**Describe the bug**

After `#local []` block is closed preprocessing should resume immediately but it ignores next 2 tokens.

This prints `LOCAL` and `GLOBAL`:
```
#local [#do [print "LOCAL"]]
1 2
#do [print "GLOBAL"]
```
This only prints `LOCAL`:
```
#local [#do [print "LOCAL"]]
1 
#do [print "GLOBAL"]
```

**To reproduce**

Run this file from console:
```
Red []
#local [#do [print "LOCAL"]]
#do [print "GLOBAL"]
```

**Expected behavior**
```
LOCAL
GLOBAL
```
printed

**Platform version**
`Red 0.6.4 for Windows built 22-Nov-2023/17:24:25+03:00  commit #34f26df`


