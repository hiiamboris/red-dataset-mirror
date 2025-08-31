
#4910: get/any errors out on unset paths
================================================================================
Issue is closed, was reported by hiiamboris and has 66 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4910>

**Describe the bug**
```
>> o: object [unset a: 'a]
== make object! [
    a: unset
]
>> get/any 'o/a
*** Script Error: o/a has no value
*** Where: get
*** Stack:  
```

**Expected behavior**

Returns unset.

**Platform version**
```
Red 0.6.4 for Windows built 12-May-2021/6:12:03+03:00  commit #cebd5b9
```



Comments:
--------------------------------------------------------------------------------

On 2021-06-01T18:33:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/4910#issuecomment-852354037>

    More info here: https://github.com/red/red/issues/4550#issuecomment-671937637

--------------------------------------------------------------------------------

On 2021-06-03T14:53:14Z, dockimbel, commented:
<https://github.com/red/red/issues/4910#issuecomment-853931897>

    Defining clear and useful semantics for `get/any` for paths is not that straightforward. Consider path with more than two elements:
    ```
    get/any 'a/b/c/d/e
    == unset
    ```
    Which one of the path words is actually `unset`? We can't know. What if `a/b/c` part is actually returning `none`, then `/d` is erroring out. But what if `d` is unset, which error should it return?

--------------------------------------------------------------------------------

On 2021-06-03T15:05:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/4910#issuecomment-853941347>

    This ticket concerns only with the final value, that is `a/b/c/d` should be valid.
    I expect error still be thrown if any of the intermediate path words are not indexable as paths (although error message can be more specific and at least tell you which token in the path led to the error)

--------------------------------------------------------------------------------

On 2021-06-03T15:19:32Z, dockimbel, commented:
<https://github.com/red/red/issues/4910#issuecomment-853951455>

    > This ticket concerns only with the final value, that is a/b/c/d should be valid.
    
    That is then even more problematic. In `get/any 'a/b/c/d/e`, if `c` is unset, you get an error, but if `e` only is unset, you get no error... inconsistent and confusing. I think it's simpler to let `/any` be a no-op on paths and let the user use `try` to catch and process errors if any.

--------------------------------------------------------------------------------

On 2021-06-03T15:26:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/4910#issuecomment-853956174>

    On the contrary I think it would be consistent with how get-paths work.
    In other words, I expect `get/any 'p/a/t/h` be an alias of `:p/a/t/h` that you can use when `p/a/t/h` is a value, not a literal path.

--------------------------------------------------------------------------------

On 2021-06-03T15:53:48Z, dockimbel, commented:
<https://github.com/red/red/issues/4910#issuecomment-853977563>

    Get-path exhibits also this inconsistent behavior in the processing of `unset` depending on the position in the path. This looks to me like something that needs fixing rather than supporting.
    ```
    >> p: object [a: object [t: object [h: none set/any 'h ()]]]       ; h == unset
    >> :p/a/t/h                 ; no error
    >> set/any 'p/a ()          ; a == unset
    >> :p/a/t/h
    *** Script Error: path :p/a/t/h is not valid for unset! type
    *** Where: catch
    *** Stack:  
    ```

--------------------------------------------------------------------------------

On 2021-06-03T16:25:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/4910#issuecomment-854004888>

    Why is it inconsistent?
    - `:1/none/()/x` is an invalid path, and it fails on all scalars in the path
    - while `:block/block/x = unset` is a valid path that yields an unset value, and this is where `/any` should by design muffle the `unset`-related error, because we're ready to handle it
    
    To put it another way what can we **expect** from `something/unset/something`, or from `select () something`, if not an error? 
    
    To me, this is similar to get with words: `get/any ()` is an error, while `get/any 'unsetword` and `:unsetword` yield valid unset values.

--------------------------------------------------------------------------------

On 2021-06-03T23:24:38Z, greggirwin, commented:
<https://github.com/red/red/issues/4910#issuecomment-854248798>

    I'm with @hiiamboris here, in that the evaluation _of_ an `unset!` (for something further)  is what triggers the error. Evaluting _to_ `unset!` is OK.

--------------------------------------------------------------------------------

On 2021-06-04T14:23:48Z, dockimbel, commented:
<https://github.com/red/red/issues/4910#issuecomment-854766619>

    My concern was not theoretical but practical.  I think the following will be confusing for most users:
    ```
    >> get/any 'a/b/c/d/e
    *** Script Error: path a/b/c/d/e is not valid for unset! type
    ```

--------------------------------------------------------------------------------

On 2021-06-04T17:35:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/4910#issuecomment-854894383>

    Because the message is confusing. It should tell the part of the path that evaluated to unset. Rebol error is clearer IIRC.

--------------------------------------------------------------------------------

On 2021-06-04T18:12:19Z, dockimbel, commented:
<https://github.com/red/red/issues/4910#issuecomment-854913755>

    Fixing the error message would help indeed. I'll look into it, to see if that can be improved.

--------------------------------------------------------------------------------

On 2021-06-05T10:22:57Z, dockimbel, commented:
<https://github.com/red/red/issues/4910#issuecomment-855218215>

    I have improved the error message. Still, I think the behavior will appear confusing and inconsistent to most users:
    ```
    >> a: context [b: context [c: 123]]
    >> get/any 'a/b/c
    == 123
    
    >> get/any 'a/z/c
    ** Script error: cannot access z in path a/z/c
    ** Where: get
    ** Near: get/any 'a/z/c
    
    >> get/any 'a/b/z
    (unset)
    ```
    I think that explaining to users why `/any` is effective on the last word only but not on intermediary ones will be challenging.
    Maybe I am lowering the bar too much here, I'm not sure. @greggirwin what do you think?

--------------------------------------------------------------------------------

On 2021-06-07T23:05:31Z, greggirwin, commented:
<https://github.com/red/red/issues/4910#issuecomment-856317835>

    Compared to the original issue, this is a big improvement. Could the error message be:
    ```
    Script error: cannot access z/c in path a/z/c because z is unset
    ```
    or
    ```
    Script error: cannot access c in path a/z/c because z is unset
    ```
    ?
    
    A lot of things are challenging, so we just have to try to make them better incrementally, until the cost of making the better is too high; hoping the cost comes down in the future.

--------------------------------------------------------------------------------

On 2021-06-11T12:56:38Z, dockimbel, commented:
<https://github.com/red/red/issues/4910#issuecomment-859562405>

    > Could the error message be:
    ```
    Script error: z is unset in path a/z/c
    ```
    would be the cheapest option, as it requires only changing the error message string. The others you proposed require allocating and constructing a new sub-path just for error message. If such error is nested in a loop and wrapped in a `try`, it will generate additional pressure on the GC.
    

--------------------------------------------------------------------------------

On 2021-06-11T17:40:30Z, greggirwin, commented:
<https://github.com/red/red/issues/4910#issuecomment-859738626>

    That's fine. I wouldn't be terribly concerned about error cases like this and GC impact. Yes, we want to be efficient, but most edge cases are not as important as usability.

--------------------------------------------------------------------------------

On 2021-06-15T17:37:16Z, dockimbel, commented:
<https://github.com/red/red/issues/4910#issuecomment-861700946>

    Extra unit tests are pending.

--------------------------------------------------------------------------------

On 2021-06-15T18:29:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/4910#issuecomment-861736388>

    ```
    >> a: object [unset b: 'b c: 1]
    == make object! [
        b: unset
        c: 1
    ]
    
    >> get/any 'a/b/1
    *** Script Error: b is unset in path a/b/1
    *** Where: get
    *** Stack:
    
    >> get/any 'a/c/1
    *** Script Error: path a/c/1 is not valid for integer! type
    *** Where: get
    *** Stack:
    ```
    @dockimbel While you're at it, I suggest patching error message for all non-indexable types, not just unset.

--------------------------------------------------------------------------------

On 2021-06-15T20:04:38Z, greggirwin, commented:
<https://github.com/red/red/issues/4910#issuecomment-861795067>

    1) `b is an integer! in path a/b/1`
    2) `b is not an indexable* type in path a/b/1`
    
    *2 raises the question of what we call these types. Indexable, keyed, compound, ...accessor-ized?
    
    1 is probably good enough for now. It at least says what value had a problem, and doesn't go into details we may need to change later, depending on what we end up calling things.

--------------------------------------------------------------------------------

On 2021-06-15T20:15:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/4910#issuecomment-861801465>

    I'm for (1) as it tells the type, which is a valuable piece of info. Or `b is an integer! in path a/b/1 and does not support path access` then no need to invent a name (which is hard considering functions and files also support path access with different meaning than indexing). 

--------------------------------------------------------------------------------

On 2021-06-16T17:25:54Z, dockimbel, commented:
<https://github.com/red/red/issues/4910#issuecomment-862568294>

    `b is an integer!...`
    `b is a tuple!...`
    
    Error messages can't handle `a/an` dynamically. We need a formulation that stays the same for all type names.
    Also, what the error message should be for `a/1/1`?

--------------------------------------------------------------------------------

On 2021-06-16T17:35:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/4910#issuecomment-862575047>

    `a/1/1` - good point. I also thought about duplicate word like `a/x/b/x`... Paths that Gregg proposes would solve the ambiguities, e.g. `a/1 is of integer! type and does not support path access` (or `a/x` or `a/x/b/x`...). As for GC pressure, we could worry about that later when we have slices. Also, how big is the actual pressure coming from an extra path, compared to creation of error object (and a hash for it)?

--------------------------------------------------------------------------------

On 2021-06-16T23:07:03Z, greggirwin, commented:
<https://github.com/red/red/issues/4910#issuecomment-862788395>

    `a/1 is a datatype (integer!) that does not support path access` ?
    
    Though it seems that in this day and age we should be able to handle a/an. ;^)
    
    But look at all the fun details this has brought out, which I call progress.

--------------------------------------------------------------------------------

On 2021-06-17T11:15:24Z, dockimbel, commented:
<https://github.com/red/red/issues/4910#issuecomment-863152229>

    `a/1 is a datatype (integer!)...` This formulation sounds confusing to me, `a/1` is a path! not an integer!.
    
    > But look at all the fun details this has brought out, which I call progress.
    
    There are as many Pandora boxes as you want in the current state of Red. The question that really matters to me is: do we want to open all those boxes first or do we want to speed up things to 1.0? If we open all those boxes now, we won't live long enough to see 1.0 then. Polishing semantics and solving all edge cases should not be the priority in a 0.6.4 alpha version.

--------------------------------------------------------------------------------

On 2021-06-17T19:34:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/4910#issuecomment-863510115>

    I consider error messages of high priority as they save (or waste) time of every Reducer. Until 1.0 there'll be a lot of them... ;)

--------------------------------------------------------------------------------

On 2021-06-17T20:16:47Z, greggirwin, commented:
<https://github.com/red/red/issues/4910#issuecomment-863535181>

    I agree that semantic and advanced edge cases are not as important as some other things, and also that error messages are important. Making them informative and friendly helps to fight complexity in user's minds. Since there is no easy way around the natural language formulations (which we should consider for future designs related to templated output, including `format`) we'll have to live with a less natural construction.
    
    1)
    `a/b/1`
    >> b is a datatype (integer!) in path a/b/1 and does not support path access
    
    `a/1/1`
    >> 1 is a datatype (integer!) in path a/1/1 and does not support path access
    
    2)
    `a/b/1`
    >> b is of type integer! in path a/b/1 and does not support path access
    
    `a/1/1`
    >> 1 is of type integer! in path a/1/1 and does not support path access
    
    3)
    `a/b/1`
    >> b is a/an integer! in path a/b/1 and does not support path access
    
    `a/1/1`
    >> 1 is a/an integer! in path a/1/1 and does not support path access
    
    4)
    ???

--------------------------------------------------------------------------------

On 2021-06-17T23:52:49Z, dander, commented:
<https://github.com/red/red/issues/4910#issuecomment-863632204>

    4.
    `a/b/1`
    
    > a/b in path a/b/1 is of type integer! and does not support path access
    
    `a/1/1`
    
    >  a/1 in path a/1/1 is of type integer! and does not support path access

--------------------------------------------------------------------------------

On 2021-06-18T11:43:14Z, dockimbel, commented:
<https://github.com/red/red/issues/4910#issuecomment-863977583>

    > I consider error messages of high priority as they save (or waste) time of every Reducer. Until 1.0 there'll be a lot of them... ;)
    
    I don't see how that way of prioritizing can lead to a 1.0. Even simply outputting error codes (looking up the descriptions on a dedicated page online) instead of messages would be an acceptable trade-off to me in order to reach earlier a fully featured and stable 1.0.

--------------------------------------------------------------------------------

On 2021-06-18T11:53:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/4910#issuecomment-863982760>

    Is it going to take more than an hour to provide a good error message?

--------------------------------------------------------------------------------

On 2021-06-18T13:14:01Z, dockimbel, commented:
<https://github.com/red/red/issues/4910#issuecomment-864030099>

    We spent already many man-hours on this ticket. The point is not how much time/resources is spent on one specific ticket, but how many "details" do we want to fix/improve instead of working on the big features on which depends the future of Red. We are still in alpha stage, not 1.x. The rules are not the same, the goals are not the same. Satisfying end users by polishing every possible detail should not be part of the work during alpha stage. Priority and importance are two different qualifiers. Many features and tickets are important, but only a very few are high-priority.
    
    In a nutshell, focusing on fixing details is holding back the whole development of Red. We need to change that if we want a 1.0 ever to see the light. Polishing details is the goal of 0.9.x version. We don't even have a Red language documentation which at this point should be a much higher-priority than fixing any non-crashing/corrupting bug.

--------------------------------------------------------------------------------

On 2021-06-18T15:34:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/4910#issuecomment-864121946>

    Totally agree. This issue was never a big thing. I'd more like to see #4854 done for instance.
    Of course, since your cache is already filled with this issue, would be wasteful to leave it half-solved ;)
    
    As for road to the stars (1.0 :), IMO there's a shorter way to that.. e.g. if you concentrated on designs, and left R/S grunt work to others... PRs are a powerful thing, and community participation if nourished and guided could get us there much faster. One man is just one man, with only 24 hours a day.

--------------------------------------------------------------------------------

On 2021-06-19T16:36:38Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/4910#issuecomment-864428505>

    > In a nutshell, focusing on fixing details is holding back the whole development of Red. We need to change that if we want a 1.0 ever to see the light. Polishing details is the goal of 0.9.x version. We don't even have a Red language documentation which at this point should be a much higher-priority than fixing any non-crashing/corrupting bug.
    
    I agree, I can sacrifice precise error messages until 0.9 or even past 1.0. The most important thing is having Red complete, after that we can concentrate on the details.
    
    NOTE: Why not keeping a ticket to list which error messages would be improved?
    

--------------------------------------------------------------------------------

On 2021-06-19T17:29:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4910#issuecomment-864439770>

    Like this https://github.com/red/red/issues/4532 ?

--------------------------------------------------------------------------------

On 2021-06-21T14:47:05Z, dockimbel, commented:
<https://github.com/red/red/issues/4910#issuecomment-865092531>

    @hiiamboris I wish it would be that simple. It cannot be designed only from an abstract perspective, often implementation limits the design or orient it in a different way. They are quite intertwined. Though, I agree that I should write down more design descriptions and guideline rules that contributors could leverage.

