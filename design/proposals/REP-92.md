
#92: WISH: how about we reduce `on-deep-change*`?
================================================================================
Issue is open, was reported by hiiamboris and has 22 comment(s).
<https://github.com/red/REP/issues/92>

Simple **example**: 
- got a list of items of different length `list: [item1 .. itemN]`. 
- need to track it's length: `list-length = sum map-each item list [item/length]`

Instead of recomputing the `list-length` every time I make changes, I could employ `on-deep-change*` and meticulously write length tracking code for all modifying series actions. There aren't *that* many: `insert change clear append move poke put random reverse sort swap take trim`.

First, that makes 13 actions. Each is duplicated (before and after the change), e.g. `append` - `appended`, `put` - `put-ed`, etc. So that makes **26 cases to account for!** Madness! *I would appreciate a lot if this model could be simplified.*

1. Each series-modifying action can be composed from only **two elementary actions**: insertion and removal of a single item (say hi to Levenshtein). Covering just two such actions in `on-deep-change*` would be a *huge lot less painful* (transition from one model into another can be done on mezz level, but we want maximum speed for this part). This requires 3 things: `index [integer!]` (where?), `insert? [logic!]` (what? - insert or remove) and `done? [logic!]` (when? - before or after the change).

2. Adding a `part [integer!]` (item count) to this simplest model makes sense, because there's always some initialization code that we don't wanna repeat for each item.

3. We want to keep track of items that are just rearranged (that is, source = target), e.g. for the example above `random reverse sort` do not affect the length. Let's add a `moving? [logic!]` flag to deal with it. Now we know when not to bother.

This is the interface I would like to work with:
**`on-deep-change*: func [owner [object!] word [word!] offset [integer!] part [integer!] insert? [logic!] moving? [logic!] done? [logic!]]`.**
We can add the action name (list of 13, not 26) here but only for better logging purposes e.g. `"append <here> of <N> items"`. 

In this model `change` would trigger 4 calls: before removal, after removal, before insertion, after insertion. Obviously, after removal and before insertion is the same state, so to further simplify it we could unify `insert?` and `done?` into `state = removing | adding | done`, but this seems less useful: e.g. for the above example I would use `removing` to subtract from the length, then `done` to add to it, but how would I differentiate `done` after `adding` (which I would use) from `done` after `removing` (which I could care less about)? I would need to save the previous `state` and that's more work.

Thoughts?


Comments:
--------------------------------------------------------------------------------

On 2020-12-30T19:28:34Z, greggirwin, commented:
<https://github.com/red/REP/issues/92#issuecomment-752732471>

    Side note first: We should extract the ownership notes from https://www.red-lang.org/2016/03/060-red-gui-system.html into object docs or the `ownership` page in docs. Probably the latter and link to it from the object page.
    
    Reducing code is almost always a good thing, but often doesn't come for free. We lose `target` here, though I haven't used it myself that I recall. My tinkering with ownership has been pretty light. I think having `action` is nice as well. That's the design choice: do we want details about what happened, or just the effect. With details we can determine the effect, but not the other way around. The current design is also more flexible when the system is extended (which is planned, per the blog entry).
    
    What I _love_ about this new model is the efficiency of aggregate thinking. 
    
    It would be interesting is to look at the `done?` before/after flag, and how it affects user code patterns compared to unique action names. You've provided a great use case, so it's a matter of mocking up some code, which I can do myself (always helps me to experience it) but not right now. :^\

--------------------------------------------------------------------------------

On 2020-12-30T19:40:34Z, greggirwin, commented:
<https://github.com/red/REP/issues/92#issuecomment-752735546>

    I plugged the ownership content into the ownership page, but it would benefit from more formatting.

--------------------------------------------------------------------------------

On 2020-12-30T20:28:26Z, hiiamboris, commented:
<https://github.com/red/REP/issues/92#issuecomment-752748391>

    In https://github.com/red/red/issues/4788 I'm proving that:
    - we can't reconstruct what is going to happen from the limited info provided by `on-deep-change*` spec
    - consideration of all special cases will be an enormous effort, most likely not worth it
    - reconstruction logic of what is gonna happen will be totally immense, even if we had all the info required for it
    - it's buggy as hell, so using it today is pointless, especially when you do not know in advance that e.g. you're only going to use `insert` and `remove` and nothing more complex (like when you're building a base for others to work on)

--------------------------------------------------------------------------------

On 2020-12-31T10:13:59Z, hiiamboris, commented:
<https://github.com/red/REP/issues/92#issuecomment-752913843>

    Let's replace `index [integer!]` in the model above with `target [series!]`. Because:
    - getting index is as trivial as `index: index? target`
    - the opposite is harder: `target: skip head get word index`

--------------------------------------------------------------------------------

On 2021-01-01T19:41:27Z, hiiamboris, commented:
<https://github.com/red/REP/issues/92#issuecomment-753372736>

    Also, insignificant probably, but we don't need `owner [object!]` as we can always use `self` or `context? word`. Having `owner`  just adds more confusion, like "is it different from self? when? or if not, why is it provided?", etcetera.
    
    Unless.. it's there for some future model where it will be different from `self`, e.g. peeking into inner objects changes from parent `on-deep-change*`? (but then `context? word` would get it all the same)

--------------------------------------------------------------------------------

On 2021-01-01T20:35:50Z, hiiamboris, commented:
<https://github.com/red/REP/issues/92#issuecomment-753379338>

    I take back the idea about `change` generating 4 calls. It's good for continuity and all, but not for performance.
    
    8 of the 13 actions: `change`, `move` (on the same buffer), `poke`, `put`, `random`, `reverse`, `sort`, and `swap` (on the same buffer) combine insertion and removal. In the current model we only see the series before and after the change is done, and this is how it should be.
    
    Example: list of 1M items (a string maybe?), we change the 1st char. In the 4-call model we would have to produce a correct intermediate state of the series after removal, that is, we'll have to shift 999999 items back, call `on-deep` twice, then shift it all again back. Bad thing to do.
    
    We could add a 'substitution' operation and split mixed operations into two (e.g. change -> substitution + removal/insertion), but that's a complication we probably don't even need (current model certainly never longed for it). So I leave this idea for now.
    
    I propose, case-by-case:
    - `change` generates (1) `insert?: no done?: no` then (2) `insert?: yes done?: yes`; we see both items that are about to be removed and those just inserted, everyone's happy
    - same logic for `poke`, `random`, `reverse`, `sort`, `swap` on the same buffer
    - `put` works as change of length=1 or length=2, so the same
    - `swap` with different buffers would work exactly as `take` + `insert` (4 calls); we have both opening (done=no) and closing (done=yes) call for each series involved
    - `move` on the same buffer would be called also without intermediate states, same as `change` but index for change is the same for opening and closing calls, for `move` it will differ
    - `move` on different buffers would work also as `take` + `insert`
    
    It is also tempting to get rid of "before insertion" and "after removal" calls totally. Why do we need them? Since we lose them for 8 or 13 actions anyway, why have them for the other 5? If we do so `done?` won't be needed anymore, as we know that it's true `insert? = true` and false for `insert? = false`. So we get the following:
    
    `on-deep-change*: func [word [word!] target [series!] part [integer!] insert? [logic!] moving? [logic!]]` (plus maybe `action`), where:
    - word is bound to owner
    - target is both series and index
    - part is always strictly positive
    - insert? tells us if we're before removal or after insertion
    - moving? tells us whether the content is actually gonna change or we just toss items around

--------------------------------------------------------------------------------

On 2021-01-01T21:06:44Z, hiiamboris, commented:
<https://github.com/red/REP/issues/92#issuecomment-753382481>

    Answering my own "Why do we need them?" question above, we don't need "after removal" at all IMO. "before insertion" we don't need for observers but we may need it for validators (that throw an error to forbid the change). And that's when it aaaall geeets triiickkyy...
    
    The current model does not provide any more validation capabilities than the new one save for the trivial synthetic example in the blog entry. Consider the `change` action in https://github.com/red/red/issues/4788, the "before change" call:
    ```
    >> change/dup/part next s [z x c] 2 3
    
    ON-DEEP:
    owner:	make object! [x: [1 2 3 4 5] spec: [owner word target action
    word:	x
    target:	[2 3 4 5]
    action:	change
    new:	none					;) !! `new` is not set
    index:	1
    part:	3		
    ```
    We need to know, before items are inserted, what items those will be?
    `new` is set to none as we see so we don't know that. We can't know! If we were to know, we would have to create a whole new series buffer: `[z x c z x c]` in this example, but once `dup` gets bigger the slowdown becomes obvious. Slowing down series operations for a hypothetical validator is a bad idea, so what can we do?
    - do create this new buffer and provide it to the validator, but only if validator is defined (objects without `on-deep-change` do not suffer then, but this still sounds like a bad idea to me)
    - create minimal buffer for single items, like `insert s 1` would create `new: [1]` and provide it, while `insert/dup s [2 3] 100` would provide an existing buffer `new: [2 3]`. But then if we're reusing a buffer, we need to tell how long a part of it is going to be inserted, e.g. for `insert/part s [1 2 invalid-item] 2` we need to provide `new: [1 2 invalid-item]` and `new-part: 2`. And this may just work. 
    
    But what about more complex validators? E.g. `random s` shuffles the order of items, and what if it's the order that we care about? We will never know the order until we've modified the series. Catch 22. So, while I proposed 2 solutions above on how to make item validators, I should question the whole idea of having them. We are in control of our code, so why not validate the new part before inserting it, manually? This works for any kind of validation, not just item type or range preview. As always, trade-offs everywhere ;)
    
    ---
    P.S. considering all said, reasonable tradeoff for me is validation of data "after insertion". It's not validation anymore, but rather "fixing". But on the bright side, no intermediate states needed, and since all data is present, any kind of validation is possible (removal of improper items, reordering, formatting, whatever). It's slow of course, like in the example from the blog post, but will do for small lists.
    
    One more point for the idea of getting rid of "before insertion" and "after removal" states altogether. `insert`, `append`, `remove`, `take` will generate only a single `on-deep-change*` event in this case. Is there an argument for not doing that?
    

--------------------------------------------------------------------------------

On 2021-01-02T16:19:57Z, hiiamboris, commented:
<https://github.com/red/REP/issues/92#issuecomment-753492787>

    > 
    > 
    > I plugged the ownership content into the ownership page, but it would benefit from more formatting.
    
    @greggirwin what page is that "ownership page" exactly? ;)

--------------------------------------------------------------------------------

On 2021-01-03T01:59:15Z, greggirwin, commented:
<https://github.com/red/REP/issues/92#issuecomment-753555850>

    https://github.com/red/docs/blob/master/en/ownership.adoc

--------------------------------------------------------------------------------

On 2021-08-02T19:41:52Z, greggirwin, commented:
<https://github.com/red/REP/issues/92#issuecomment-891283663>

    Just a quick thought on the name `moving?`. It's ambiguous with "things are moving in memory". My brain is thin right now, so I don't have a good word handy for "not allocating/deallocating". Could be something like `shift?` but I don't love that at first glance.

--------------------------------------------------------------------------------

On 2021-10-21T18:47:50Z, hiiamboris, commented:
<https://github.com/red/REP/issues/92#issuecomment-948905827>

    Mockup of this design here: https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/reactor92.red 

