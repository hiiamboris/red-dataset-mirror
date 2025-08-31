
#2680: offset? allows comparison of arbitrarily different series
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
<https://github.com/red/red/issues/2680>

All `offset?` does is `subtract index? series2 index? series1`. It would make more sense to check that
`(head series2) = (head series1)` because now we can do the following:
```

>> s1: next next "abcdefg"
>> s2: at [1 2 3 4 5 6 7 8] 5
>> offset? s1 s2
== 2  ;; what does it mean??? 
```



Comments:
--------------------------------------------------------------------------------

On 2017-05-12T15:10:49Z, dockimbel, commented:
<https://github.com/red/red/issues/2680#issuecomment-301103502>

    Adding extra checking would slow down performances for normal usages, and would prevent usages we don't think about, but which could come handy in some algorithms.
    
    Less is more. ;-)

--------------------------------------------------------------------------------

On 2017-05-12T15:30:05Z, meijeru, commented:
<https://github.com/red/red/issues/2680#issuecomment-301108781>

    OK but it could lead to strange results by accident. Anyhow, I will close.

