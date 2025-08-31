
#3610: FIND is returning FALSE instead of NONE when used on BITSET
================================================================================
Issue is closed, was reported by Oldes and has 28 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/3610>

**Describe the bug**

Find (according its doc-string) is supposed to return `none` if no result found.
But when used on `bitset`, it returns `false` instead.

**To Reproduce**
```
>> find charset [#"A" #"B" #"C"] #"a"
== false
>> find [#"A" #"B" #"C"] #"a"
== none
```

**Expected behavior**
in both cases there should be `none`




Comments:
--------------------------------------------------------------------------------

On 2018-11-24T18:34:38Z, Oldes, commented:
<https://github.com/red/red/issues/3610#issuecomment-441387102>

    Btw... should be FIND on `bitset` case-sensitive when used without `/case` refinement?
    Isn't this more appropriate?
    ```
    >> find charset [#"A" #"B" #"C"] #"a"
    == true
    >> find/case charset [#"A" #"B" #"C"] #"a"
    == none
    ```

--------------------------------------------------------------------------------

On 2018-11-24T18:37:38Z, 9214, commented:
<https://github.com/red/red/issues/3610#issuecomment-441387273>

    Btisets are not series, so I believe this is an expected behavior.

--------------------------------------------------------------------------------

On 2018-11-24T18:44:41Z, Oldes, commented:
<https://github.com/red/red/issues/3610#issuecomment-441387663>

    Ok... in R2 the `find` on `bitset` was also case-sensitive even without `/case`, so I can live with it... but anyway. Still am not sure, if `none` would not be better than `false`. It would be easy fix on this line: https://github.com/red/red/blob/master/runtime/datatypes/bitset.reds#L875

--------------------------------------------------------------------------------

On 2018-11-24T18:46:43Z, Oldes, commented:
<https://github.com/red/red/issues/3610#issuecomment-441387781>

    The `PICK` is also not consistent for the same line of code:
    ```
    >> pick charset [#"A" #"B" #"C"] #"x"
    == false
    >> pick "abc" 4
    == none
    ```

--------------------------------------------------------------------------------

On 2018-11-24T21:18:31Z, meijeru, commented:
<https://github.com/red/red/issues/3610#issuecomment-441396379>

    @9214 @Oldes I agree `find` should return `none` but `pick` gets individual components of the bitset and these are `true/false` -- they are also `false` if they are "outside"  the bitset.

--------------------------------------------------------------------------------

On 2018-11-25T08:34:01Z, endo64, commented:
<https://github.com/red/red/issues/3610#issuecomment-441424165>

    FIND & PICK on `bitset!` return `true` if the char is in the `bitset!` as `bitset!`s are not series. So returning `false` doesn't look wrong to me as it state it didn't find. This behavior is only for bitsets.
    
    I would update the doc-strings of `find` and `pick` but we have a limited space for doc-strings and cannot cover all special cases, for example `poke` on bitsets.
    

--------------------------------------------------------------------------------

On 2018-11-25T09:54:02Z, meijeru, commented:
<https://github.com/red/red/issues/3610#issuecomment-441428273>

    I still prefer `find` to have uniformity in its result when unsuccessful.

--------------------------------------------------------------------------------

On 2018-11-25T19:26:21Z, greggirwin, commented:
<https://github.com/red/red/issues/3610#issuecomment-441465413>

    This has to be thought about more, as it's not just bitsets in the mix, but typesets, maps, and objects. Only series values return the series position. Typesets return true/false, maps and objects return true/none. And none always returns none, which leads to the question of chaining with logic results of any kind. 

--------------------------------------------------------------------------------

On 2018-11-25T19:38:08Z, greggirwin, commented:
<https://github.com/red/red/issues/3610#issuecomment-441466356>

    Consistency is always nice, but not always best. It's tricky, too, because it's not about making any single function consistent across types, but in making things more consistent and useful across the language. Red's design makes this a different design process than most langs.
    
    If `false` is never returned, and `none` is the only "not found" result, you can't chain into `pick` calls using the result. That may not be a *very* common idiom, but I know I've used it as least occasionally in the past.
    
    With a series, and finding any type of value in it, the value could be anywhere. Same for a typeset (though that's a gray area IMO) or word in a map/object. But a specific bit can only be *in* one position. So returning its position doesn't add any info, in that sense. Maybe there's a good use for that though. Most often, with bits, you're testing their state, so logic is a natural fit there.
    
    You can't iterate over maps or objects, and logic makes the most sense here to me, because otherwise we have to return the position against an implicit `words-of`. If you need that, you can be explicit. Returning `none` for those types, instead of `false` is not as easy. Another option would be to return the word itself, and perhaps bind it in the case of objects. But, as with bitset positions, that doesn't add any new information for maps. 

--------------------------------------------------------------------------------

On 2018-11-25T21:54:18Z, Oldes, commented:
<https://github.com/red/red/issues/3610#issuecomment-441477153>

    Ah dear @greggirwin , I didn't wanted to put you into such a deep thoughts. I was just comparing Rebol and Red and noticed, that in Rebol the result is `none` and in Red it is `false`. So I checked the doc-string, and noticed, that it names very clearly, that returned value is `NONE`:
    ```
    Returns the series where a value is found, or NONE.
    ```
    So I made an issue :o) I don't think it is so important (as both values are _falsy_) you should not sleep because of it! Maybe it would be just fine to change the doc-string a little bit. 

--------------------------------------------------------------------------------

On 2018-11-25T21:58:43Z, Oldes, commented:
<https://github.com/red/red/issues/3610#issuecomment-441477442>

    Or one can just replace `false-value` to `none-value` in the above mentioned line and have result compatible with Rebol.

--------------------------------------------------------------------------------

On 2018-11-25T22:11:14Z, greggirwin, commented:
<https://github.com/red/red/issues/3610#issuecomment-441478288>

    It's a really good question. *This* isn't going to cause me to lose sleep. Plenty of other things do that. ;^)

--------------------------------------------------------------------------------

On 2018-11-25T22:11:47Z, greggirwin, commented:
<https://github.com/red/red/issues/3610#issuecomment-441478321>

    And, with luck, these things will make it into historical docs, so we can refer to them later.

--------------------------------------------------------------------------------

On 2019-09-09T18:07:15Z, dockimbel, commented:
<https://github.com/red/red/issues/3610#issuecomment-529599040>

    > I still prefer find to have uniformity in its result when unsuccessful.
    
    Bitsets behave like virtual arrays of infinite size. You can read/write any entry in a bitset. Therefore, strictly speaking, the result from `find` can never be unsuccessful, by definition:
    ```
    >> b: make bitset! 1
    == make bitset! #{00}
    >> b/20
    == false
    >> b/20: true
    == true
    >> b
    == make bitset! #{000008}
    >> b/20
    == true
    >> b/100000
    == false
    >> b/100000: true
    == true
    >> b
    == make bitset! #{000008000000000000000000000000000000000000000000000000000000000...
    >> length? b
    == 100008
    ```
    This is even more apparent with complemented bitsets:
    ```
    >> b: complement b
    == make bitset! [not #{0000080000000000000000000000000000000000000000000000000000...
    >> find b 200000000
    == true
    >> length? b
    == 100008
    ```
    Given that rationale, the current returned values from `find` are correct, and `none` cannot be returned, because `find` always succeeds.
    
    For the none-transparency argument, the output of `find` on a bitset is not chainable as it does not return a position or an expression to evaluate with the usual none-transparent functions: `remove`, `clear`, `find`, `reduce`, `compose`, ...
    
    Moreover, there is already `pick` to check the value of a given key in a bitset (using an arity of 2).
    
    Though, for sake of compatibility with Rebol (if that notion still makes sense), and given that the implementation of `find` on bitset is just a thin wrapper over `pick` action, we can return `true/none` instead of `true/false` for the (probably rare) cases where that could be helpful. The alternative would be to remove `find` action from bitset, but given the cheap price, I would rather keep it, to provide an alternative querying interface.

