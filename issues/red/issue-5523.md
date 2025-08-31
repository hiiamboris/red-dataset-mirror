
#5523: Parse: thru any vs. thru some
================================================================================
Issue is closed, was reported by gor77 and has 0 comment(s).
<https://github.com/red/red/issues/5523>

These first two seem to be ok: 

```
parse [1 bye bye] [some word!]
; == false 
; (ok, because it can't pass the beginning integer)
```

```
parse [1 bye bye] [thru some word!]
; == true
; (ok, because thru passes the beginning integer) 
```



But what about this one:

```
parse [1 bye bye] [thru any word!]
; == false

```
`Any `should be more inclusive than `some`.  



