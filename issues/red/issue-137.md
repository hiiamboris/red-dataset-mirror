
#137: Compatibility of function arguments
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/137>

I have to come back to #133: I am worried about the program line in `compare-func-specs`:

```
if pos: find f-type /local [f-type: clear copy pos] ;-- remove locals
```

It looks to me that it does not do what it should. The result of `clear` is an empty block.



