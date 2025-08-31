
#3665: typeset for INDEX argument of PICK action is too wide
================================================================================
Issue is open, was reported by 9214 and has 20 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/3665>

**Describe the bug**
```red
>> ? pick
...
ARGUMENTS:
     series       [series! bitset! pair! tuple! date! time!] 
     index        [scalar! any-string! any-word! block! logic! time!] 
...
```

`index` argument has a typeset `[scalar! any-string! any-word! block! logic! time!]`. However, any value other than `integer!`, `char!` or `logic!` defaults to zero:
https://github.com/red/red/blob/640c00ed5792602d43c06f828860df478ef800b9/runtime/actions.reds#L121
 Same goes for `poke`, and perhaps other actions.

**To reproduce**
```red
>> pick [a b c] now/time
== none
>> pick [a b c] 'datatype! ; I'd expect ANY-WORD! values to coerce to their index in a context
== none
>> pick [a b c] 0.5 ; Stan Kelly-Bootle FTW
== none
>> pick [a b c] 1%
== none
>> pick [a b c] [3 1 2 1] ; each value in a block may serve as an index for "multi-pick" selection
== none ; could be [c a b a]
```

**Expected behavior**
Either typeset should be narrowed only to supported datatypes (`integer!`, `char!` and `logic!`), or semantics for all specified datatypes should be established (and, eventually, implemented).

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 11-Dec-2018/7:46:27+05:00 commit #02c277d
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-16T13:51:17Z, toomasv, commented:
<https://github.com/red/red/issues/3665#issuecomment-447645041>

    `pair!` is good for picking points from image

--------------------------------------------------------------------------------

On 2018-12-16T17:03:55Z, greggirwin, commented:
<https://github.com/red/red/issues/3665#issuecomment-447659002>

    It looks like those new types slipped into the pick spec back in May 2015, probably as other type support was added, and them being there didn't break anything, so it's gone unnoticed.

--------------------------------------------------------------------------------

On 2018-12-18T14:08:22Z, dockimbel, commented:
<https://github.com/red/red/issues/3665#issuecomment-448232427>

    Floats should be allowed as indexes as in Rebol, they are truncated to integer indexes.
    Percent are treated like float / 100 pretty much everywhere else.
    
    For the rest of the unusual types for indexes, it might have been a copy/paste error. Try removing them, then run all the unit tests, if it passes, submit a PR.
    

--------------------------------------------------------------------------------

On 2019-01-06T12:28:24Z, meijeru, commented:
<https://github.com/red/red/issues/3665#issuecomment-451737860>

    Refer to the paragraph  in the specs document, section 5.6.1:
    Values of type `integer!` are permitted as index for all _sequences_ (i.e. values with types in `series!` and `bitset!`). Additionally, for programming convenience, values of `series!` types may be indexed by `logic!` values, where `true` yields the first component and `false` the second component. Also, for `pick`, bitsets admit indexing by characters, strings and blocks (interpreted as in `<bitset-spec>`, see section 5.3.5), with the result being `true` if the component(s) with the corresponding Unicode Code Point number(s) is/are all true. For `poke`, the bitset component(s) thus indexed will (all) be set to the given value (true or false). In this connection if should be noted that, although the components of a value of type `bitset!` are of type `logic!`, with `poke` it is allowed to use values of any other type, where `0` and `none` set the bit to `false`, and all other values (including `0.0` and `0%`) set the bit to `true`. Finally, images may also be indexed by pairs as coordinates, with the index being computed in accordance with the row-oriented storage of the pixels.

--------------------------------------------------------------------------------

On 2019-08-15T01:59:39Z, greggirwin, commented:
<https://github.com/red/red/issues/3665#issuecomment-521485703>

    @9214, would you like to follow up on this? I vote to keep `block!` as a multi-pick option, unless someone sees an issue with that.

--------------------------------------------------------------------------------

On 2019-08-15T09:02:59Z, 9214, commented:
<https://github.com/red/red/issues/3665#issuecomment-521569915>

    @greggirwin if you mean "specify semantics for each datatype", then:
    * `scalar!`
        * `char!` - coerce to UCP integer
        * `integer!` - use as-is
        * `float!` - truncate to integer
        * `pair!` - only `image!`-specific
        * `percent!` - truncate as float / 100
        * `tuple!` - exclude
        * `time!` - exclude
        * `date!` - exclude
    * `any-string!` - use `index? <any-string!>`
    * `any-word!` - either exclude or use `index? <any-word!>`
    * `block!` - multi-pick for block that contains atomic values supported by `pick`, but then it's not consistent with `any-string!` choice
    * `logic!` - ternary operator
    * `time!` - exclude

--------------------------------------------------------------------------------

On 2019-11-24T16:27:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/3665#issuecomment-557904495>

    > `any-string! - use index? <any-string!>`
    
    I don't see what would be the point of such a feature.
    
    Besides, strings and blocks are there for bitsets:
    ```
    >> pick charset "abcdef" "aBc"
    == false
    >> pick charset "abcdef" "abc"
    == true
    >> pick charset "abcdef" [#"a" #"B" #"c"]
    == false
    >> pick charset "abcdef" [#"a" #"b" #"c"]
    == true
    >> pick make bitset! [10 - 20] [10 11 21]
    == false
    >> pick make bitset! [10 - 20] [10 11 20]
    == true
    ```
    Either this or multi-picking, not both please ;)
    
    Some more info on the issue: :point_up: [October 25, 2019 11:49 PM](https://gitter.im/red/red?at=5db35fcf2a6494729c3ce0e6)
    We need first to decide if `pick` should work on maps (see my post), and shouldn't we accept `any-type!` if we are to dispatch it to ports (once they are done).

--------------------------------------------------------------------------------

On 2019-11-25T14:00:56Z, 9214, commented:
<https://github.com/red/red/issues/3665#issuecomment-558168445>

    On a quick glance, `pick`, `poke`, `skip` and `at` need to be adjusted, `extract` might need some tweaking too, for consistency.
    
    Rebol3 supposed to work with symbol IDs and `pair!`s (judging by docstrings of `pick` and `poke`), but that does not hold on practice. `logic!` is treated as `1` for `true` and `2` for `false` (like in ternary `pick`) by all of them. `number!` works as described in my previous message, `char!` is not present.

--------------------------------------------------------------------------------

On 2020-03-23T14:19:51Z, 9214, commented:
<https://github.com/red/red/issues/3665#issuecomment-602625626>

    https://github.com/red/REP/issues/68 (`pick <value> <word>`).

--------------------------------------------------------------------------------

On 2022-05-07T22:00:46Z, greggirwin, commented:
<https://github.com/red/red/issues/3665#issuecomment-1120302251>

    Nenad said he's OK with making this change, if somebody wants to jump in and do it.

