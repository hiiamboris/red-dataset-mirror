
#1054: Context corrupted after throwing an error
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1054>

```
red>> book: object [list-fields: does [words-of self]]

red>> print a
*** Script error: a has no value
*** Where: print

red>> print words-of book
*** Script error: a has no value
*** Where: print
```



