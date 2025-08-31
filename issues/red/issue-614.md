
#614: empty? bitset!, length?/empty? object! undefined
================================================================================
Issue is open, was reported by Kaj-de-Vos and has 36 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/614>

All these are defined in R3:

red>> empty? charset []

**\* Script error: action 47 not defined for type: 28

red>> length? context []

**\* Script error: action 36 not defined for type: 30

red>> empty? context []

**\* Script error: action 47 not defined for type: 30



Comments:
--------------------------------------------------------------------------------

On 2013-12-18T15:46:14Z, dockimbel, commented:
<https://github.com/red/red/issues/614#issuecomment-30852003>

    **empty?** meaning on bitsets is unclear as it's undocumented (I can't find a case where it returns **true**).
    
    Objects in Red won't support series-like actions as extensively as Rebol3. So, I'm dismissing this ticket.

--------------------------------------------------------------------------------

On 2013-12-19T00:08:08Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/614#issuecomment-30894233>

    R3:
    
    > > empty? charset []
    > > == true

--------------------------------------------------------------------------------

On 2013-12-19T03:42:52Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/614#issuecomment-30903013>

    Here's why I need empty? bitset! to work, in the JSON emitter:
    
    http://red.esperconsultancy.nl/Red-JSON/annotate?checkin=72d8c32e9635cd07&filename=JSON.red#a336
    
    It's already difficult to iterate over a bitset!, but like other series, I need to be able to detect whether to iterate at all.

--------------------------------------------------------------------------------

On 2013-12-19T14:39:45Z, dockimbel, commented:
<https://github.com/red/red/issues/614#issuecomment-30933111>

    In R3:
    
    ```
    >> empty? charset []
    == true
    
    >> empty? charset ""
    == false
    
    >> charset []
    == make bitset! #{}
    
    >> charset ""
    == make bitset! #{00}
    ```
    
    Looks messy to me.

--------------------------------------------------------------------------------

On 2013-12-19T14:45:21Z, dockimbel, commented:
<https://github.com/red/red/issues/614#issuecomment-30933543>

    _It's already difficult to iterate over a bitset!, but like other series, I need to be able to detect whether to iterate at all._
    
    Bitsets are not series, even if most of series actions are reused for it (but with special meanings).
    
    In R3:
    
    ```
    >> help series!
    SERIES! is a typeset of value: make typeset! [binary! string! file! email! url!
    tag! image! vector! block! paren! path! set-path! get-path! lit-path!]
    ```
    
    I don't understand what you are using bitsets for in your JSON code...?

--------------------------------------------------------------------------------

On 2013-12-20T18:09:45Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/614#issuecomment-31029367>

    So it's buggy in R3, but it does have the basic ability to solve the issue.
    
    The JSON and TNetStrings converters are generic converters between the type systems of Red and JSON/TNetStrings. You're supposed to be able to give it any Red data and it will convert it to the most meaningful JSON or TNetStrings type.
    
    The above implementation is what I currently considered most meaningful for a bitset!. It could be discussed if that is so, but in any case, it should provide a conversion for bitset!.

--------------------------------------------------------------------------------

On 2014-02-13T13:41:59Z, dockimbel, commented:
<https://github.com/red/red/issues/614#issuecomment-34978454>

    This is what I propose: extend `zero?` to allow testing for a bitset where all entries are unset (whatever the storage size of the bitset). Would that cover your needs?

--------------------------------------------------------------------------------

On 2014-02-13T19:17:41Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/614#issuecomment-35014604>

    That would be helpful. It would be a bit tricky to get right for complemented bitsets.

--------------------------------------------------------------------------------

On 2024-02-19T17:45:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/614#issuecomment-1952945142>

    It makes sense to define `empty? bitset` to be true if and only if `false = find bitset n` for each `n` in the allowed range (is it 0 to 2^31-1 right now?).
    
    `length? bitset` doesn't seem to make much sense from the high-level POV, but I guess it could be useful in estimating the amount of memory occupied by a bitset, e.g. to recreate it to free some RAM. That would however make `empty?` and `0 = length?` behave differently, so its support may not be worth the confusion.

--------------------------------------------------------------------------------

On 2024-02-19T19:39:40Z, greggirwin, commented:
<https://github.com/red/red/issues/614#issuecomment-1953068883>

    I don't think a bitset is empty unless it contains no elements. 
    ```
    >> make bitset! 0
    == make bitset! #{}
    >> make bitset! []
    == make bitset! #{00}
    ```
    Otherwise a block full of `false` values is also empty, right?

--------------------------------------------------------------------------------

On 2024-02-19T19:51:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/614#issuecomment-1953081026>

    Block is an array, bitset is a [set](https://en.wikipedia.org/wiki/Set_(mathematics)) of integers. A set is indeed empty if it has no integers in it, which can only reliably tested right now with `repeat i 2147483648 [if find bitset i - 1 [break/return 'not-empty]]`.

--------------------------------------------------------------------------------

On 2024-02-19T20:16:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/614#issuecomment-1953110440>

    Speaking of length, more formally correct definition of it would be a count of all set (i.e. 1) bits (also coherent with `empty?`). But I'm not sure where it will be practically useful yet. Maybe if we supported bitset to block/hash conversion...

--------------------------------------------------------------------------------

On 2024-02-19T21:33:32Z, greggirwin, commented:
<https://github.com/red/red/issues/614#issuecomment-1953182615>

    A bitset is not a set of integers, it's a set of bits; individual binary digits / logic values.
    
    As long as there is a value "slot" there, it's not empty, any more than a vector containing all zeros is. And there are other semantics that are different from series, e.g. `clear`, which sets all bits to 0 but does not deallocate the existing bits.
    
    This opens a (worthwhile) conversation about the best fit of existing actions and funcs for bitsets. e.g. they support `length?`, which is is based on the implementation and doesn't mean the last `on` bit. They also support `pick`, but not `first/last` which are funcs that use `pick` internally. So I think this is a big picture design discussion.

--------------------------------------------------------------------------------

On 2024-02-19T22:01:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/614#issuecomment-1953207344>

    What you're describing is an implementation detail: how this set of integers is internally handled. I'm describing the model that this implementation aims to represent.
    
    Current `clear` semantic seems suboptimal: there's no way to 'shorten' the bitset. But current `length?` semantic like I stated above carries no high level meaning. 
    
    I don't think series (array) actions are a great fit for sets (because there's no head pointer), but we may indeed find some uses for them. An important aspect is to set/reset whole ranges is currently missing. Spec of `make bitset` has it, but only for newly created sets, not for the existing ones. Meaning e.g. to mark a range you first create a new bitset, then `or` it with an existing one, creating a third one in the process. Though it's only problematic with the current implementation, but not in principle, still it would be good to have a way to set/reset ranges. What action would fit that?
    
    To block/hash/vector conversions make sense to me.
    
    `insert`=`append` may work as union, but when given a block/hash/vector could read integers from it, just as it currently inserts strings into bitset (but chars in strings have a much more limited range). `remove/key` could be extended to block/hash/vector too.
    
    `trim` could be used to "compact" the bitset (if its implementation doesn't provide automatic compaction).
    
    Other actions doesn't seem to make sense at a quick glance.

--------------------------------------------------------------------------------

On 2024-02-20T01:21:43Z, greggirwin, commented:
<https://github.com/red/red/issues/614#issuecomment-1953342964>

    > What you're describing is an implementation detail: how this set of integers is internally handled
    
    No, I'm describing what it is, its general purpose, and how it's doc'd. What you think of as storing an integer, I think of as positional keys.
    
    Being able to set ranges could be done via HOFs and slices, in a fancy world, but even now slowly and imperatively. 
    

--------------------------------------------------------------------------------

On 2024-02-20T08:58:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/614#issuecomment-1953749993>

    Try to abstract from the implementation and see the `-set` part of `bitset` ;)
    As for ranges, I realized it's another good use case for a range datatype, but until we have one a `pair!` will do, e.g. `insert bitset 100x200`.

--------------------------------------------------------------------------------

On 2024-02-20T10:58:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/614#issuecomment-1953963601>

    There could be another `bitstream!` or `bitarray!` datatype that would model what you're describing - a *sequence* of individual bits - and could support all series actions. I don't think it'll be useful though. Compression and data exchange immediately come to mind, but who would want to implement them on (slow) Red level?

--------------------------------------------------------------------------------

On 2024-02-20T17:25:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/614#issuecomment-1954695533>

    I agree `first` and `last` will be useful if they return lowest and highest set bit number (just hit a use case). `min`/`max` are better words but are binary :/

