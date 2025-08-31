
#1706: `While [false][]` return UNSET in interpreter while return `FALSE` in compiler
================================================================================
Issue is open, was reported by qtxie and has 16 comment(s).
[status.reviewed] [type.review] [type.compiler]
<https://github.com/red/red/issues/1706>

In interpreter.

```
red>> type? while [false][0]
== unset!
```

When compiling this codes.

```
Red []
probe type? while [false][0]            ;-- will print `logic!`
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-29T09:58:46Z, dockimbel, commented:
<https://github.com/red/red/issues/1706#issuecomment-229312382>

    We need to decide on the return value for all iterators and then implement it for both compiler and interpreter.

--------------------------------------------------------------------------------

On 2020-07-17T19:48:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/1706#issuecomment-660306764>

    Status report.
    Current state of things is:
    
    | Code | Interpreted | Compiled |
    | :-- | :-- | :-- |
    | `[forever [break/return 'ok]]         ` | `ok    (word)  ` | `true  (logic)  ` |
    | `[until [yes]]                        ` | `true  (logic) ` | `true  (logic)  ` |
    | `[until [break/return 'ok]]           ` | `ok    (word)  ` | `func [][until [break/return 'ok]] (function)` - JUNK RESULT #4579 |
    | `[loop -1 ['ok]]                      ` | `none  (none)  ` | `none  (none)   ` |
    | `[loop 0 ['ok]]                       ` | `none  (none)  ` | `none  (none)   ` |
    | `[loop 1 ['ok]]                       ` | `ok    (word)  ` | `ok    (word)   ` |
    | `[loop 1 [break/return 'ok]]          ` | `ok    (word)  ` | `1     (integer)` |
    | `[repeat x -1 ['ok]]                  ` | `none  (none)  ` | `-1    (integer)` |
    | `[repeat x 0 ['ok]]                   ` | `none  (none)  ` | `0     (integer)` |
    | `[repeat x 1 ['ok]]                   ` | `ok    (word)  ` | `ok    (word)   ` |
    | `[repeat x 1 [break/return 'ok]]      ` | `ok    (word)  ` | `1     (integer)` |
    | `[foreach x [1] ['ok]]                ` | `ok    (word)  ` | `[]    (block)  ` |
    | `[foreach x [] ['ok]]                 ` | `unset (unset) ` | `[]    (block)  ` |
    | `[foreach x [1] [break/return 'ok]]   ` | `ok    (word)  ` | `[]    (block)  ` |
    | `[s: [1] forall s ['ok]]              ` | `ok    (word)  ` | `[1]   (block)  ` |
    | `[s: [] forall s ['ok]]               ` | `false    (logic)  ` | `[]    (block)  ` |
    | `[s: [1] forall s [break/return 'ok]] ` | `ok    (word)  ` | CRASH #4578 |
    | `[while [take [1]] ['ok]]             ` | `unset (unset) ` #2873 | `none  (none)   ` |
    | `[while [take []] ['ok]]              ` | `unset (unset) ` | `none  (none)   ` |
    | `[while [take [1]] [break/return 'ok]]` | `unset (unset) ` | `1     (integer)` |
    | `[remove-each x [1] ['ok]]            ` | `unset (unset) ` #2126 | `0          (integer)` |
    | `[remove-each x [] ['ok]]             ` | `unset (unset) `  | `0          (integer)` |
    | `[remove-each x [] [break/return 'ok]]` | `unset (unset) ` | `0          (integer)` |
    | `[for-each x [1] ['ok]]               ` | `ok    (word)  ` | |
    | `[for-each x [] ['ok]]                ` | `unset (unset) ` | |
    | `[for-each x 0 ['ok]]                 ` | `unset (unset) ` | |
    | `[map-each x [1] ['ok]]               ` | `[ok]  (block) ` | |
    | `[map-each x "1" ['ok]]               ` | `[ok]  (block) ` | |
    | `[map-each/self x "1" ['ok]]          ` | `"ok"  (string)` | |
    | `[map-each x [] ['ok]]                ` | `[]    (block) ` | |
    | `[map-each/self x "" ['ok]]           ` | `""    (string)` | |
    | `[map-each x [1] [break/return 'ok]]  ` | `[1]   (block) ` | |
    
    
    Snippet to test it with:
    ```
    Red []
    
    ; #include %for-each.red
    ; #include %map-each.red
    
    #macro ['meh set b block!] func [s e] [
    	compose/deep/only [
    		prin [pad mold (b) 40 "=> "]
    		f: does (b)
    		set/any 'r f
    		print [pad mold :r 10 "(" type? :r ")"]
    	]
    ]
    
    meh [forever [break/return 'ok]]	;) only returns with `break` (unset) or `break/return` (any type)
    meh [until [yes]]	;) never returns `false`/`none`/`unset` without `break` or `break/return`
    meh [until [break/return 'ok]]
    meh [loop -1 ['ok]]
    meh [loop  0 ['ok]]
    meh [loop  1 ['ok]]
    meh [loop  1 [break/return 'ok]]
    meh [repeat x -1 ['ok]]
    meh [repeat x  0 ['ok]]
    meh [repeat x  1 ['ok]]
    meh [repeat x  1 [break/return 'ok]]
    meh [foreach x [1] ['ok]]
    meh [foreach x []  ['ok]]
    meh [foreach x [1] [break/return 'ok]]
    meh [s: [1] forall s ['ok]]
    meh [s: []  forall s ['ok]]
    meh [s: [1] forall s [break/return 'ok]]
    meh [while [take [1]] ['ok]]
    meh [while [take []]  ['ok]]
    meh [while [take [1]] [break/return 'ok]]
    meh [remove-each x [1] ['ok]]
    meh [remove-each x []  ['ok]]
    meh [remove-each x []  [break/return 'ok]]
    ;) custom loops
    ; meh [for-each x [1] ['ok]]
    ; meh [for-each x []  ['ok]]
    ; meh [for-each x 0   ['ok]]
    ; meh [map-each x [1] ['ok]]
    ; meh [map-each x "1" ['ok]]
    ; meh [map-each/self x "1" ['ok]]
    ; meh [map-each x []  ['ok]]
    ; meh [map-each/self x "" ['ok]]
    ; meh [map-each x [1] [break/return 'ok]]		;) break not supported because it's a function right now
    ```
    OK, so compiled situation is just grave. Not a single loop that's return value actually works. Interpreted loops are mostly consistent with the exception of `foreach` (unset), `forall` (false), `while` and `remove-each` (always unset).

--------------------------------------------------------------------------------

On 2020-07-17T19:59:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/1706#issuecomment-660311373>

    I haven't found any explanation of why Rebol chose that `loop 0 [1]` (and other non-evaluated loops) returns `none` rather than `unset`. I have however found numerous examples of relying on loops returning last result of their body evaluation. And that makes `none` more helpful than `unset` as we can chain loops into `if`s like `unless result: loop n [stuff] [handle empty case]`. 
    
    So, both for that and for backward compatibility with Rebol I suggest we return `none` from:
    `loop n []`, n <= 0
    `repeat i n []`, n <= 0
    `foreach x s []`, empty? s
    `forall s []`, empty? s
    `while [false][]`
    
    And I suggest also:
    `remove-each s []` returns s, regardless of it's empty or not
    `while [yes] [body]` returns last result of evaluation of it's body

--------------------------------------------------------------------------------

On 2020-07-17T23:27:47Z, greggirwin, commented:
<https://github.com/red/red/issues/1706#issuecomment-660379452>

    @hiiamboris thanks for the detailed analysis. :+1:
    
    Agreed on returning `none` consistently where the body is not processed.
    
    Another edge case to note:
    ```
    >> until []
    *** Script Error: block did not return a value
    *** Where: until
    *** Stack:  
    >> while [][]
    *** Script Error: block did not return a value
    *** Where: while
    *** Stack:  
    ```
    
    +1 on `while` returning last evaluation and `remove-each` returning the series.
    
    It's not hard to work around wanting the number of items removed, as I noted in the past:
    ```
    remove-each-and-count: function [
    	"Like remove-each, but returns both modified series and count of removed items." 
        'word [word! block!] "Word or block of words to set each time" 
        data [series!] "The series to traverse (modified)" 
        body [block!] "Block to evaluate (return TRUE to remove)"
    ][
    	orig-ct: length? data
    	remove-each :word data body
    	reduce [data  orig-ct - length? data]
    ]
    remove-each-and-count v [1 2 3 4 5] [odd? v]
    remove-each-and-count v [1 2 3 4 5 6 7 8 9 10] [odd? v]
    ```
    
    

--------------------------------------------------------------------------------

On 2020-07-17T23:31:56Z, greggirwin, commented:
<https://github.com/red/red/issues/1706#issuecomment-660380350>

    On compiled vs interpreted, we should address this now rather than later. As elsewhere, when we find problematic patterns, here `break` and loop return values, see what we can put in place so they don't show up in other places in the future. 
    
    @dockimbel @qtxie thoughts?

--------------------------------------------------------------------------------

On 2021-01-24T22:51:58Z, endo64, commented:
<https://github.com/red/red/issues/1706#issuecomment-766453776>

    We might change this issue's title to something like "Inconsistent return values of iterators".

--------------------------------------------------------------------------------

On 2021-06-01T13:30:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/1706#issuecomment-852126255>

    Looks like apart from the table above there are also quite unexpected differences:
    ```
    Red []
    i: repeat i 2 [i]
    ?? i
    o: object [i: repeat i 2 [i]]
    ?? o
    ```
    Compiled:
    ```
    i: 2
    o: make object! [
        i: unset                    ;) WTH?
    ]
    ```

--------------------------------------------------------------------------------

On 2022-01-23T20:42:41Z, greggirwin, commented:
<https://github.com/red/red/issues/1706#issuecomment-1019563242>

    I just hit `while` returning `unset!` porting an old R2 script. 

