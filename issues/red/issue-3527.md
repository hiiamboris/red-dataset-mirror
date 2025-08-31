
#3527: unexpected behavior and access violation of MOVE/PART applied to the same series
================================================================================
Issue is open, was reported by 9214 and has 38 comment(s).
[type.bug]
<https://github.com/red/red/issues/3527>

### Expected behavior
```red
>> data: "aabbbcccc"
== "aabbbcccc"
>> move/part data tail data 2
== "bbbccccaa"

>> move/part data skip data 7 3
== "ccccbbbaa"

>> data: "bbbccccaa"
== "bbbccccaa"
>> move/part data skip data 6 3
== "cccbbbcaa"

>> move/part data skip data 1 5
== "cccbbbcaa" ; N.B. case with target index being inside /PART segment is a tricky one
```


### Actual behavior
```red
>> data: "aabbbcccc"
== "aabbbcccc"
>> move/part data tail data 2
== "bbbccccaa"
>> ; correct

>> move/part data skip data 7 3
== "ccccabbba"
>> ; overshoot by 1

>> data: "bbbccccaa"
== "bbbccccaa"
>> move/part data skip data 6 3
== "ccccbbbaa"
>> ; and here I expected "cccbbbcaa"

>> move/part data skip data 1 5

*** Runtime Error 1: access violation
*** at: 74598DFAh
```
[Culprit](https://github.com/red/red/blob/master/runtime/datatypes/series.reds#L416).

### Steps to reproduce the problem
See above.
### Red and platform version
```
Red for Windows version 0.6.3 built 3-Sep-2018/20:55:52+05:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-09-10T14:02:27Z, toomasv, commented:
<https://github.com/red/red/issues/3527#issuecomment-419923564>

    Problems with blocks also:
    ```
    ; This is moved 1 too far
    >> move/part blk: [a b c d e f] skip blk 4 2
    == [c d e a b f]
    ; But why doesn't it move here?
    >> move/part blk: [a b c d e f] skip blk 5 2
    == [a b c d e f]
    ; This is OK
    >> move/part blk: [a b c d e f] skip blk 6 2
    == [c d e f a b]
    ; This should not move IMO
    >> move/part blk: [a b c d e f] skip blk 3 3
    == [d a b c e f]
    ; Should move but not moving again
    >> move/part blk: [a b c d e f] skip blk 4 3
    == [a b c d e f]
    >> move/part blk: [a b c d e f] skip blk 5 3
    == [a b c d e f]
    ; And OK again
    >> move/part blk: [a b c d e f] skip blk 6 3
    == [d e f a b c]
    ; And this crashes!
    move/part blk: [a b c d e f] skip blk 1 3
    ```
    ```
    -----------RED & PLATFORM VERSION----------- 
    RED: [ branch: "master" tag: #v0.6.3 ahead: 852 date: 25-Aug-2018/6:59:56 commit: #5559136cac5bab402b76ecc03c2780db90cfb98e ]
    PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
    --------------------------------------------
    ```

--------------------------------------------------------------------------------

On 2018-09-10T15:51:54Z, 9214, commented:
<https://github.com/red/red/issues/3527#issuecomment-419963103>

    @toomasv how can your first example be OK if it should be `cdabef`?

--------------------------------------------------------------------------------

On 2018-09-10T16:53:39Z, toomasv, commented:
<https://github.com/red/red/issues/3527#issuecomment-419983393>

    Ah, yes, sorry! Corrected.

--------------------------------------------------------------------------------

On 2018-09-27T03:19:15Z, qtxie, commented:
<https://github.com/red/red/issues/3527#issuecomment-424945614>

    For the overshot by one issue, seems it's intended. Here is a test from the unit tests.
    ```
    list: [a b c d e]
    move list at list 3
    --assert list = [b c a d e]
    ```

--------------------------------------------------------------------------------

On 2019-03-16T16:13:43Z, toomasv, commented:
<https://github.com/red/red/issues/3527#issuecomment-473558382>

    # Some musings on `move`:
    
    ## Red `move` is very different beast from R2 and R3 `move`.
    
    R2 and R3:
    
    1. Neither one allows `move` from one series to other.
    2. Neither one accepts offset series for its target. Only integer offset is accepted.
    3. Both start offset counting after the part (default 1).
    4. In case of positive part, both return series after moved part.
    5. In case of negative part, both return series at calculated offset without moving anything.
    6. Both provide `/skip` and `/to` refinements in addition to `/part`.
    
    Red:
    
    1. Allows move from one series to another (with some restrictions).
    2. Accepts only offset series arguments for target. No integer offsets.
    3. Offset is given by `index?` of target, not counted.
    4. In case of positive part returns whole series after move.
    5. In case of negative part returns series at provided series offset without moving anything.
    6. Provides only `/part` refinement.
    
    `move` in R2 and R3 is well defined but with narrower application than Red.
    `move` in Red is more flexible, but not well defined currently.
    
    ## Quirks with Red `move`
    
    1. Moving at `tail` and `back tail` result in same move. E.g.
    ```
    move s: "abcdef" tail s
    ;== "bcdefa"
    move s: "abcdef" back tail s
    ;== "bcdefa"
    ```
    2. Moving a part at position which is less counted from tail than length of the part, is prohibited. E.g.
    ```
    move/part s: "abcdef" at s 5 3
    ;== "abcdef"
    ```
    3. Moving a part at position equal or greater from tail than length of the part, results in moving it one unit further from provided offset. 
    ```
    move/part s: "abcdef" at s 4 3
    ;== "dabcef"
    ```
    4. Neither of last two does happen when unit is moved from one series to the other. E.g.
    ```
    s: "abcdef" l: "123456" move/part s at l 6 3
    ;== "def"
    l
    ;== "12345abc6"
    s: "abcdef" l: "123456" move/part s at l 2 3
    ;== "def"
    l
    ;== "1abc23456"
    ```
    
    ## Remedies
    
    (Of course I may be grossly wrong here, as I am struggling to understand the R/S code)
    
    Source of the quirk (2) is line [419](https://github.com/red/red/blob/master/runtime/datatypes/series.reds#L419) which effectively prevents inserting part in the tail portion of series shorter than part.
    IMO this condition should be 
    ```
    if all [dst > src src + part >= dst][
    	return as red-value! origin
    ]
    ```
    This would prevent moving in case `dst` is somewhere inside or at end of the part.
    
    Source of quirks (1) and (3) seems to be line [433](https://github.com/red/red/blob/master/runtime/datatypes/series.reds#L433) which intentionally "extend(s) size to include target slot". Without this insertion would be done at provided offset and there would be no discrepancy with moving between different series.

--------------------------------------------------------------------------------

On 2019-10-25T15:10:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/3527#issuecomment-546393323>

    `move` is so bad that it doesn't even know what series it should return. Compare:
    ```
    >> c: move a: "1" b: "2"
    == ""
    >> same? a c
    == true
    >> c: move a: "" b: "2"
    == "2"
    >> same? a c
    == false
    >> same? b c
    == true
    ```
    I'm going to rewrite it from scratch. And dump that `[a b c d e]` test above. It's *plain wrong*. Inconsistent with `find`. Illogical. I see the rationale behind it, but I do not support it. Besides, it was not properly implemented for `part` longer than 1 item.

--------------------------------------------------------------------------------

On 2019-10-25T15:26:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/3527#issuecomment-546399466>

    Both integer index and a series' index can unambiguously define an insertion point. Here's how they relate:
    ![](https://i.gyazo.com/010953a8a6578a0574f673497db7fd56.png)
    It should support both IMO. 

--------------------------------------------------------------------------------

On 2019-10-25T17:12:34Z, qtxie, commented:
<https://github.com/red/red/issues/3527#issuecomment-546436328>

    @hiiamboris We don't have document for `move` action yet. No matter how it behaviors now. It works as the author expected. If you're going to rewrite it, please make a proposal first. Otherwise it may be rejected.

--------------------------------------------------------------------------------

On 2019-10-25T17:19:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/3527#issuecomment-546438553>

    @qtxie Proposal is the easy part :) Hard part is getting it to the author...

--------------------------------------------------------------------------------

On 2019-10-25T18:27:48Z, hiiamboris, commented:
<https://github.com/red/red/issues/3527#issuecomment-546462059>

    Okay, for the proposal.
    In short, I can just say that I agree with @9214's and @toomasv expectations.
    
    Now the long version.
    When I write:
    ```
    a: "12345"
    b: find a "5"          ;)  == "5"
    move/part a b 2        ;) moving part="12"
    ```
    I'm targeting `b` which is `"5"` and this will be my insertion point, just before `"5"`. It's as simple as that.
    Why would I sit thinking how it's all gonna roll around internally and what index should I specify instead of `b` to actually get it to insert my thing before `b`?
    
    Oh noes! I also have to check if `a` and `b` are the same series or not! Because if they are not, then `b` stays as it is, but if they are then I need to adjust `b` in some way. I don't even know how exactly I will adjust it yet. I should either read `move` code or experiment with it and hope that my experiments provide me enough info to explain the whole algorithm with it's edge cases.
    
    Excuse me, but what a nonsense... ☺
    
    I understand it was probably meant to work like `take`+`insert` pair. After `take` the indexes of items after the `/part` in question will shift by `-part` (and not by `-1` as in current implementation). So I would then call `insert` on a new index, which I have to calculate first. I will have to account for:
    - whether `a` and `b` share the series buffer
    - is `b` before `a` or after it
    - is part bigger than the tail? if so I'll have to cut it
    
    And then a reasonable question as you will agree: why do I have to do this calculation on my own? Can't `move` be smart enough to do that for me? And think of the beginners. How are you going to explain all that to them? ;)
    
    Instead I propose that `move` will adjust the index internally so that after `take` operation it still points to the same item. Then `move` operation on the same buffer can be drawn like this:
    ![](https://i.gyazo.com/5a240cc3eb699152fbd3ab9673e9930e.png)
    It's simple to reason about. It's symmetric. It satisfies the expectation that `part` will precede `target`. One thing to note is that (as on my previous drawing) all indexes between `a` and `skip a part` collapse into a single insertion point. And this allows me to support both integer and series `target`, mapping one to the other in a straightforward way. Allows me to be backward compatible at no cost.
    
    Now I'd love to hear your objections. Propose a better solution! ☻

--------------------------------------------------------------------------------

On 2019-10-26T06:15:14Z, qtxie, commented:
<https://github.com/red/red/issues/3527#issuecomment-546574211>

    Thanks. So what you want is define `move` strictly as a combination of `take` and `insert`. All the cases above will be solved if we use `take` and `insert` instead of `move`. Here is a more clear brief description of `move`.
    ```
    ACTION:
         MOVE origin target
    
    DESCRIPTION:
         Move is series of actions combinate `take` with `insert`.
         Step 1. Moves `takes` one or more elements from the `origin` series
         Step 2. then `insert` them into the `target` series.
    
    ARGUMENTS:
         origin       [series!]
         target       [series!]
    
    REFINEMENTS:
         /part        => Limit the number of values inserted.
            length    [integer!]
    
    RETURNS:
         returns the `origin` series.
    ```
    FYI, here is a good example of a proposal. https://github.com/red/REP/blob/master/REPs/rep-0101.adoc
    The process of a proposal: https://github.com/red/REP/blob/master/REPs/rep-0001.adoc
    
    If a small issue like this doesn't need a REP, a brief description as above in comment is enough and helpful. 
    
    PS, please put as few complains as possible, it will save time for both of us. ;-)

--------------------------------------------------------------------------------

On 2019-10-26T09:11:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/3527#issuecomment-546585563>

    You know, this is exactly what I wanted to avoid. Putting this into REP is, in my view, synonymous with putting it on hold for an indefinite time. I'm no man for bureaucratic routine, I'd rather write the PR and if it's gonna be declined, so be it. Although it's clear as day to me that you and 2 more people are very likely to support it.

--------------------------------------------------------------------------------

On 2020-05-23T17:44:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/3527#issuecomment-633103961>

    I was playing with `on-deep-change*`, and it's totally wrong for `move` as well:
    ```
    >> r: deep-reactor [x: [a b c] on-deep-change*: func [o w t a n i p] [?? a ?? i ?? p ?? t ?? n]]
    == make object! [
        x: [a b c]
    ]
    
    >> move r/x skip r/x 2
    a: move
    i: 0         ;) shouldn't index be = 2 as `t: [c]` suggests ???
    p: 1
    t: [c]       ;) part=1 indicates [c] will be removed, but it's not true
    n: none
    a: moved
    i: 1         ;) should be = 2 too ?
    p: 1
    t: [a]
    n: none
    == [b c a]
    
    >> move [d] tail r/x
    a: move
    i: 0         ;) should be = 3 ?
    p: 1
    t: []        ;) wrong series here: this is `tail r/x`, not `[d]` from which move takes an item
    n: none
    a: moved
    i: 3
    p: 1
    t: [d]
    n: none
    == []
    
    >> r/x
    == [b c a d]
    >> move r/x []   ;) does not trigger on-deep-change at all!
    == [c a d]
    >> move r/x []
    == [a d]
    >> move r/x []
    == [d]
    >> move r/x []
    == []
    >> r/x
    == []            ;) I emptied the series without it noticing!
    ```
    Maybe I'm not getting something? It's soooo twisted ☻

--------------------------------------------------------------------------------

On 2021-08-01T20:43:22Z, greggirwin, commented:
<https://github.com/red/red/issues/3527#issuecomment-890583749>

    Ping @qtxie @dockimbel. This came up again on Gitter, with another user hitting it.
    
    Great analysis here. For my part, what does `move` gain by being an action? My decade old R2 func counts show it was rarely used. If it's a func, ~140 lines of R/S become ~10 lines of Red, and self-document in the behavior:
    ```
    move: function [
        "Move a value or span of values in a series."
        old-pos [series!] "Source series (modified)"
        new-pos [series!] "Offset to move by, or index to move to"
        /part "Move part of a series"
            length [integer!] "The length of the part to move"
    ][
        part: take/part old-pos any [length 1]
        insert new-pos part ; pending index support.
    ]
    ```
    After `move`, my next suggestion for this change would be `swap`. I've always thought `swap` should support words as well. I admit to not having needed it much myself, but it is a very general purpose function. 
    
    Arg naming is unique too, I think. i.e. `origin` and `target`. Compare to `swap`. The names are nice, imagining the analogy of an archer moving an arrow. But moving objects from one location, place, or position to another doesn't fit quite so well.

--------------------------------------------------------------------------------

On 2021-08-02T07:23:41Z, dockimbel, commented:
<https://github.com/red/red/issues/3527#issuecomment-890789016>

    > For my part, what does move gain by being an action?
    
    From top of my head, three reasons:
    1. Avoid the cost of a temporary series that you must pay for with the `take`, then `insert` approach (though maybe a smart implementation using `insert/part` then `remove/part` could do the trick?).
    2. Have an atomic action for object events (View relied on that, not sure if it's still the case). With the proposed pure Red implementation, a owner object would get two unrelated events, instead of one.
    3. Consistency with other series modifying actions (even though R3 chose to make it a mezz).
    
    If 1. could be covered by a pure Red implementation, then I could see if View could live without 2. Also 3. needs to be considered.
    
    For the record, the current `move` implementation is partial (should be mentioned in the comments or in the commit logs), waiting for a complete definition.
    
    EDIT: for point 2., View still relies on it:
    ```
    either word = 'pane [
    		case [
    			action = 'moved [
    				faces: skip head target index	;-- zero-based absolute index
    				loop part [
    					faces/1/parent: owner
    					faces: next faces
    				]
    				;unless forced? [show owner]
    				system/view/platform/on-change-facet owner word target action new index part
    			]
    ```
    `move` on a `/pane` block of faces allows to reorder faces in one go, instead of triggering two events, each one with repercussions on screen updates and graphic components destruction/recreation. So with a `take` then `insert` part, all the moved faces will trigger destruction of their OS components counterparts, then recreation when the faces are re-attached to the `pane` block... that's an heavy price to pay, waste of OS resources and can result in screen glitches... all that just for changing the Z ordering... An atomic `move` provides a nice solution for that.

--------------------------------------------------------------------------------

On 2021-08-02T16:57:51Z, greggirwin, commented:
<https://github.com/red/red/issues/3527#issuecomment-891180462>

    Thanks. Good thoughts. 
    
    1) Depends on how heavily it's used. We can keep the action slots reserved, in case we find in the next year or two that it's used more heavily than in the past. As it relates to this ticket, it doesn't matter how efficient if it if the results are wrong.
    
    2) This is interesting. If we `take` on a pane, those face objects destroy their OS counterparts ensuring there's no `parent` attached. I can see where we wouldn't want to set a temp parent, or even keep those resources around, as there's a big potential for resource leaks. Though the GC should catch that and destroy the OS face if the face is no longer referenced (I hope). Vastly more efficient not to destroy them, so it's another matter of how often that might happen (Zorder changes). When I had ZOrder logic in R2 VID apps, it was minimal (move to front, send to back on single faces). But I can absolutely see how more advanced layering would be affected more heavily. Temporary/special parents or other extra logic have to be offset against mezz `move` gains. (side note: I wonder if some of the bugs @hiiamboris has found are related to `move`.)
    
    I'm torn. View is a special case, but an important one. For games, sprites should not be heavy (faces), but if we add something like `gob!`, it may have similar issues. For line of business apps, ZOrdering should not be a high frequency event (but maintaining state is a consideration; we don't want to make things worse if Zorder changes mess that up, especially as we write higher level UI data exchange libraries). A killer case then is the Red Browser. If we render documents as rich text, it's not affected. But if there's a tree of faces, and/or a virtual DOM of sorts, we can expect people to populate them with far more faces than we might expect. Add to that a non-native GUI system (e.g. @hiiamboris' Red Spaces). @hiiamboris weigh in with your thoughts from that side if you would.
    
    3) There is an interesting difference in `move` and `swap` though, in that two series may be affected, not just one. On consistency, can you give an example, or idea of where that might matter? There is a benefit in the type inheritance aspect.
    
    So, as much as I love the idea of `move` being a couple lines of Red, if we can spec it clearly and make the behavior unsurprising (i.e. =take+insert), that's probably the best step to take right now, if only because it has less ripple effects.

--------------------------------------------------------------------------------

On 2021-08-02T19:30:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/3527#issuecomment-891277480>

    @greggirwin Red Spaces don't deal with OS resources, so no need for `move`. Only thing I care about is maintain focus. If I take a focused space and insert it into the same list - it retains it's path on the tree, so it retains it's focus. If I insert it somewhere else, in current model I would need to set focus into it programmatically as it's path on the tree changed. But as long as the object is alive, no problems.
    
    View may dynamically measure speed of face destruction/allocation and grow/shrink an internal free list of OS windows. The cost is design & development time of course. I can see that `move` was a simple and working solution for this problem.
    
    I would love https://github.com/red/REP/issues/92 model implemented. But View still needs `move` to be an action.
    
    Performance doesn't matter though. `move` mezz could reuse the same static buffer, as it's not reentrant by design, however it will generate two on-deep-change events and each event could trigger another `move`, so that doesn't work yet (it would work in the proposed single-event model). But I'm of an opinion that eventually we'll have better GC that is able to keep a list of freed fragments and their sizes and allocate one almost instantly from this list. Properly written GC+allocator should IMO nullify the cost-of-allocation concern.
    
    

--------------------------------------------------------------------------------

On 2021-08-02T19:42:33Z, greggirwin, commented:
<https://github.com/red/red/issues/3527#issuecomment-891284024>

    Good reminder on red/REP#92. :+1:

--------------------------------------------------------------------------------

On 2023-10-13T16:27:58Z, endo64, commented:
<https://github.com/red/red/issues/3527#issuecomment-1761787876>

    A comment about `move`:
    
    > move returns first series if it is not at its tail, and second series if it is.
    
    [On gitter](https://matrix.to/#/!mjbZGzLqlsqlDLaQVP:gitter.im/$1twuouoEOuLDVp5fYAfqDDnJ-LHnKw4NXjYe053gBhc?via=gitter.im&via=matrix.org&via=tchncs.de)

