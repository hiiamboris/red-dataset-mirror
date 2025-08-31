
#96: WISH: /compare and /all for set operations
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
<https://github.com/red/REP/issues/96>

See #94 for background, but this will be useful in any case.

Akin to `sort`:
```
>> b: [1 6 1 2 3 9 0 9]
== [1 6 1 2 3 9 0 9]
>> sort/skip copy b 2
== [0 9 1 6 1 2 3 9]
>> sort/skip/all copy b 2
== [0 9 1 2 1 6 3 9]
>> sort/skip/compare copy b 2 2
== [1 2 1 6 3 9 0 9]
```

Subjects are: `union`, `difference`, `exclude`, `intersect`, `unique`. All of them currently support /skip, but only compare the 1st column of the data:
```
>> unique/skip b 2
== [1 6 3 9 0 9]
```
By supporting `/all` we could compare the whole row, by supporting `/compare` we could compare a specific column, like:
```
>> unique/skip/all b 2
== [1 6 1 2 3 9 0 9]       ;) no equal rows
>> unique/skip/compare b 2
== [1 6 1 2 3 9]
```


Comments:
--------------------------------------------------------------------------------

On 2021-01-25T19:33:59Z, greggirwin, commented:
<https://github.com/red/REP/issues/96#issuecomment-767062174>

    1) Does this make sense for anything other than blocks in practical use? i.e. string, bitset, typeset. (Ah, I see you note this in #94)
    
    2) `block/do-set-op` is already ~150 LOC. It may not take much to add these features, but the interface to the func changes too, for all affected types. Adding two more variables to the equation means that many more testing permutations. Just noting things that add cost.
    
    Will post more thoughts in #94.
    
    Here are some old mezz level set ops I did back in 2013 or so, before the natives were available, if we want to experiment:
    ```
    exclude: function [
    	;"Returns a unique copy of series1, excluding all values found in series2."
    	"Returns the unique difference (NOT, COMPLEMENT) of two sets."
    	series1 [series!]
    	series2 [series!]
    ;	/case "Perform a case-sensitive search"
    ;	/skip "Treat the series as fixed size records"
    ;		size [integer!]
    ][
        res: unique series1
        foreach val unique series2 [remove find/only res val]
        res
    ]
    ;exclude [a b c] [a b d]
    ;exclude [a b d] [a b c]
    
    
    intersect: function [
    	"Returns the unique intersection (AND) of two sets."
    	series1 [series!]
    	series2 [series!]
    ;	/case "Perform a case-sensitive search"
    ;	/skip "Treat the series as fixed size records"
    ;		size [integer!]
    ][
        series1: unique series1
        res: make series1 length? series1
        foreach val unique series2 [
            if find/only series1 val [append/only res val]
        ]
        res
    ]
    ;intersect  [a b c] [a b d]
    
    series-difference: function [
    	"Returns the unique symmetric difference (XOR) between two sets."
    	series1 [series!]
    	series2 [series!]
    ;	/case "Perform a case-sensitive search"
    ;	/skip "Treat the series as fixed size records"
    ;		size [integer!]
    ][
        res: make series1 length? series1
        series1: unique series1
        series2: unique series2
        foreach val series1 [
            if not find/only series2 val [append/only res val]
        ]
        foreach val series2 [
            if not find/only series1 val [append/only res val]
        ]
        unique res
    ]
    ; series-difference [a b a c] [a b b d]
    
    ; NATIVE UNION available now.
    union: function [
    	"Returns the unique union (OR) of two sets."
    	series1 [series!]
    	series2 [series!]
    ;	/case "Perform a case-sensitive search"
    ;	/skip "Treat the series as fixed size records"
    ;		size [integer!]
    ][
        unique append copy series1 series2
    ]
    ;union [a b c] [a b d]
    
    unique: function [
    	"Returns a copy of the series with duplicate values removed."
    	series [series!]
    ;	/case "Perform a case-sensitive search"
    ;	/skip "Treat the series as fixed size records"
    ;		size [integer!]
    ][
        res: make series length? series
        foreach val series [
            if not find/only res val [append/only res val]
        ]
        res
    ]
    ```

--------------------------------------------------------------------------------

On 2021-01-25T20:18:06Z, hiiamboris, commented:
<https://github.com/red/REP/issues/96#issuecomment-767086764>

    Primary use I think is blocks, mixed data types. Then maybe vectors. On string/binary types even /skip is not needed IMO. If you're collecting n-grams you're likely collecting them as block of strings, not as a single concatenated string. But spawning blocks inside other blocks is often inconvenient, that's why we use /skip in the first place.

--------------------------------------------------------------------------------

On 2024-09-10T15:11:09Z, endo64, commented:
<https://github.com/red/REP/issues/96#issuecomment-2341205468>

    I would love this to be implemented.

