
#4409: Extract on vector values
================================================================================
Issue is open, was reported by endo64 and has 4 comment(s).
[type.wish]
<https://github.com/red/red/issues/4409>

**Describe the bug**
`extract` mezzanine doesn't work correctly on `vector!` values.

**To reproduce**
Steps to reproduce the behavior:
```
>> v: make vector! [1 2 3 4 5 6]
== make vector! [1 2 3 4 5 6]
>> extract v 2
== make vector! [0 0 0 1 3 5]
>> extract v 5
== make vector! [0 1 6]
>> extract v 20
== make vector! [1]
>> extract v 1
== make vector! [0 0 0 0 0 0 1 2 3 4 5 6]
```

**Expected behavior**
It should work just as it is for other `series!`

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 17-Apr-2020/17:57:18+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-04-22T10:58:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/4409#issuecomment-617706773>

    This is where the `make` distinction comes into play:
    ```
    >> make block! 10
    == []
    >> make vector! 10
    == make vector! [0 0 0 0 0 0 0 0 0 0]
    ```
    I would rather like vectors to follow the other series behavior in this case, otherwise one has to additionally `clear` the vector to empty it.
    
    Also this `make series (length? series) / width]` within `extract` should be:
    `make series (width - 1 + length? series) / width]`, else it risks doubling the size when the last item will be added, when the division is not exact. Or in the new division paradigm:
    `to integer! round/ceiling (length? series) / width`

--------------------------------------------------------------------------------

On 2020-04-22T11:27:39Z, endo64, commented:
<https://github.com/red/red/issues/4409#issuecomment-617719453>

    For empty vector `make vector! 0  ; == make vector! []` can be used. But I see your point. 

