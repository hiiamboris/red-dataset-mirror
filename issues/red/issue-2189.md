
#2189: collect with keep and collect keep of parse does not preserver the order
================================================================================
Issue is open, was reported by xqlab and has 28 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/2189>

```
red>> x: []
== []
red>> collect/into [keep "a" parse "1" [(keep "b") collect into x  keep "1"] keep "c" ] x
== [#"1" "a" "b" "c"]
```

I would expect 
    ["a" "b" #"1" "c"] 



Comments:
--------------------------------------------------------------------------------

On 2016-08-30T16:04:37Z, dockimbel, commented:
<https://github.com/red/red/issues/2189#issuecomment-243490854>

    The culprit is `collect` function, appending instead of inserting values at provided series position, `load/into` has the same issue, which also needs fixing. When you want to force appending, you can just pass a series at tail.

--------------------------------------------------------------------------------

On 2018-05-18T20:01:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/2189#issuecomment-390316774>

    What's even the point of making it `insert`-ing like in Rebol?
    Suppose I have this 100-item block `x: [1 .. 100]` and I'm going to what? insert stuff item-wise into it's head? `collect x [keep 'a (100 items were just copied) keep 'b (100 items were just copied again)]` like this? This is unsound ;) If I'm going to really need an insertion like that, I'll just do `insert x collect [keeps...]`
    Moreover using `insert` both collect's and parse's `keep` funcs should *share* the series position somehow or they are gonna insert stuff in almost unpredictable (read: not very useful) order. Should they both use append though, it'll be like @xqlab expected: `["a" "b" #"1" "c"]`. Why not just append in parse's `keep`?

--------------------------------------------------------------------------------

On 2021-03-31T17:43:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/2189#issuecomment-811282669>

    I'm going to mention here a few other design questions with `collect` (looks like there's no better place)
    
    1. it binds `keep` and `collected` words but bind cannot follow blocks referred to by words:
    ```
    >> f: func [x][if even? x [keep x]]
    >> collect [repeat i 10 [f i]]
    *** Script Error: keep has no value
    *** Where: either
    *** Stack: collect f  
    ```
    So it's impossible to offload `keep`-involving logic into other functions. No big deal I guess, but still a limitation.
    It can be fixed with the following design though:
    ```
    collect: function [
        "Collect in a new block all the values passed to KEEP function from the body block"
        body [block!]        "Block to evaluate"
        /into                "Insert into a buffer instead (returns position after insert)"
            collected [series!] "The buffer series (modified)"
    ][
        system/words/keep: func [v /only][either only [append/only collected v][append collected v] v]
        parse body rule: [                                  ;-- selective binding (needs BIND/ONLY support)
            any [pos: 'collected (pos/1: bind pos/1 'keep) | any-string! | binary! | into rule | skip]
        ]
        unless collected [collected: make block! 16]
        do body
        either into [collected][head collected]
    ]
    ```
    Unfortunately, `collected`, being a block, still has to be bound and will be available only to the immediate block of code.
    More dynamic designs are possible but they make `keep` slower because it becomes either interpreted or heavier.
    
    ---
    2. Would be nice to support arbitrary mixing of parse's collect and mezz collect:
    ```
    a: collect [parse [1 2 3] [some keep skip]]      ;) no collect in parse - collects into a
    b: parse [1 2 3] [collect some [x: (keep x/1)]]  ;) keep function collects into parse's allocated block b
    ```
    This is not doable on the mezz level and should have such support embedded into parse.
    
    ---
    3. Worth it or not but an even further extension may be considered:
    ```
    parse [1 [2] 3] [collect [keep integer! | x: (parse x/1 [any keep skip])]]
    ```
    Example is silly for simplicity, but the idea is that you may call a function that calls `parse` on something else and still collects into the same buffer. Which could still be done with `collect/into` of course if it always appended instead of inserting.
    
    ---
    All these extensions could be made possible by writing native version of `collect` and reusing it inside Parse. `collected` block would refer to the word in the topmost call to `collect` in the stack.

--------------------------------------------------------------------------------

On 2021-03-31T19:58:25Z, greggirwin, commented:
<https://github.com/red/red/issues/2189#issuecomment-811406943>

    Would it not be possible to do it at the mezz level? Just dashed this off, so not thought out deeply. The idea being that `keep` becomes a global word, everything gets really simple as no rebinding is needed (until it needs to be reentrant), and `parse` could still `#call` out to it (I think). I imagine people will cite performance issues, so we can profile it.
    ```
    collect-ctx: context [
        results: copy []
        dest: none
        
        set 'keep' func [v "Value" /only][
            ;TBD if none? dest [error: no collect]
            either only [append/only dest v] [append dest v]
            v
        ]
        
        set 'collect' func [
            "Collect in a new block all the values passed to KEEP function from the body block"
            body [block!] "Block to evaluate" 
            /into "Append to a buffer instead"
                buff [series!] "The buffer series (modified)" 
            /local res
        ][
            dest: either into [buff][copy []]   ; set KEEP target
            append/only results dest            ; push
            do body
            res: take/last results              ; pop
            dest: last results                  ; reset KEEP target
            res
        ]
    
    ]
    
    ;keep' #err
    collect' [keep' 1]
    collect' [repeat i 3 [keep' i]]
    collect' [repeat i 3 [keep'/only reduce [i now/precise] wait .01]]
    collect' [repeat i 3 [keep'/only collect' [repeat j 2 [keep' j]]]]
    collect' [
        repeat i 3 [
            keep'/only collect' [
                repeat j 2 [
                    keep'/only reduce [j 'x]
                    keep' now/precise/time
                    wait 0.01
                ]
                keep' collect' [keep' now/date + i]
            ]
            keep' 'top
        ]
    ]
    ```

--------------------------------------------------------------------------------

On 2021-03-31T21:17:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/2189#issuecomment-811471264>

    A few thoughts:
    - using mezz in parse is a bad idea performance-wise (especially `keep`), plus if you redefine it you likely break parse :)
    - need wrappers in `collect` for throw(/name), do error, break(/return), continue, return, exit - to restore the "stack", but that will break all of these: even `throw/name` you can't rethrow because you don't know the /name given, errors get bugged on rethrow often too, the rest is completely hopeless
    - if we expose `collected` (as we do right now, though it's undocumented), we still need `bind`, because if we make it a function too, we lose the ability to change it (`collected: [new data]`)
    - otherwise a good idea
    
    This btw highlights another limitation of `collect` as a mezz: currently it traps return & exit:
    ```
    >> f: does [collect [return 1] 2]
    >> f
    == 2          ;) should be 1
    ```

--------------------------------------------------------------------------------

On 2021-04-01T00:01:37Z, greggirwin, commented:
<https://github.com/red/red/issues/2189#issuecomment-811541196>

    - Performance: let's profile it. Always tradeoffs. `Collect` is a high level func. Ease of use is more important here IMO. That said, assuming this is also about behavior, the mezz level gives us a working prototype for reference.
    - Redefinition: isn't that the case for everything?
    - Special case and error handling has the same issues at the native level, doesn't it?
    - Don't expose collected. Why would we? In this case information hiding is a good thing.
    
    We have a number of overlapping issues here. Is one problem really that we need to address how `return` and other special cases are handled at the mezz level? I recently chatted with @dockimbel about error handling in general, `catch/throw`, etc. So if `return` is a problem, it's a problem in all mezzanines, right? And that comes back to when and where something is evaluated. _Should_ your example return 1? Is that because of where or _how_ we see it in the code? Do we see it as part of `f`, or as `collect`'s body? 
    ```
    >> f: does [probe collect' [return 1] 2]
    == func [][probe collect' [return 1] 2]
    >> f
    1
    == 2
    ```
    Unfortunately it's deep subject of how mezz level control funcs and thunks work, practically, and for simple and advanced use cases. There we have choices: 1) they're bugs in Red's implementation; fix them. 2) they're limitations in the design; redesign with potentially deep compatibility issues (OK if the new design is a big win). 3) There's no free lunch; toss a coin and write docs.
    
    Certainly good to collect other tickets related to flow control, but @dockimbel has final say on design.

--------------------------------------------------------------------------------

On 2021-04-01T09:14:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/2189#issuecomment-811773122>

    >     * Performance: let's profile it
    
    ```
    >> b: append/dup [] 1 1'000'000
    >> c: make [] length? b
    >> clock [parse b [collect into c any keep skip]]
    333 ms	[parse b [collect into c any keep skip]]
    >> clock [collect/into [parse b [any [skip (keep 1)]]] clear c]
    761 ms	[collect/into [parse b [any [skip (keep 1)]]] clear c]
    ```
    More than 2x slowdown. I know you will say "oh that's *just* 2x, I'm all for slow code", but should you want to write a parse-based DSL, you'll reconsider ;) Plus codecs, where there is no "fast enough" term.
    
    
    >     * Redefinition: isn't that the case for everything?
    
    I think Parse is more or less standalone. I may be wrong though, needs code review.
    It depends I think whether we want to `protect collect` as a reserved core word to prevent exploits, or we want to let anybody repurpose it to their needs. Right now I see that codecs and help system are depending on `collect`.
    
    
    
    >     * Special case and error handling has the same issues at the native level, doesn't it?
    > So if return is a problem, it's a problem in all mezzanines, right?
    
    No. Natives are not affected. Take `parse` for example: it can execute arbitrary code and does that always correctly.
    And one thing just trapping `return` and the worst case being it returns one scope down, another - trapping *all* control flow and mess up all the collections. That's why some languages have `try .. finally ..` in the first place.
    
    > * Don't expose collected. Why would we? In this case information hiding is a good thing.
    
    That's my preference as well.
    
    
    
    > _Should_ your example return 1? Is that because of where or _how_ we see it in the code?
    
    But of course it should. Because trapping return in `collect` is as meaningless as it would be to trap it in `loop` or `parse`. Let's not defend design limitations ;)
    R2 version has the same issue btw, but there it can be fixed with a `[throw]` attribute.
    
    Related: https://github.com/red/red/issues/4416 and https://github.com/red/red/issues/3755

--------------------------------------------------------------------------------

On 2021-04-01T17:30:28Z, greggirwin, commented:
<https://github.com/red/red/issues/2189#issuecomment-812059477>

    As much as I want almost everything at the mezz level in some respects, I expect, and hope, that when we find things that need to be faster we will make them so at that time. Quick profiling here says mezz collecting is 2.5-4x slower than native in `parse` today. Are we OK with collecting 1-3M items per second for now?
    
    (I wrote this before seeing your new message, but forgot to post it :^)

--------------------------------------------------------------------------------

On 2021-05-06T15:14:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/2189#issuecomment-833604464>

    Both the original and my proposed alternative design, and your Gregg, have this flaw:
    ```
    do-each: function [list] [collect [foreach expr list [keep do expr]]]
    do-each [ [1 + 2] [2 * 3] [3 ** 4]]
    collect [ do-each [ [keep 1 + 2] [keep 2 * 3] [keep 3 ** 4] ] ]
    ```
    I made `do-each` up, but let's say it is a general purpose loop that uses `collect` internally. When we create loops we expect them to evaluate the provided code in the context it's originally written in. I wrote `keep 1 + 2` etc in the context of my own `collect` call, and I know nothing of `do-each` internals. That's why I receive a totally unexpected result - my `keep` was intercepted and the output of the 3rd line is `[]` (expected `[3 6 81]`).
    
    This can only be solved by letting each `keep` belong to it's own context. So we should not only create a new function, but a new context for it as well. This won't work for my alternative design, but will work for the original one.

--------------------------------------------------------------------------------

On 2021-05-13T22:12:54Z, greggirwin, commented:
<https://github.com/red/red/issues/2189#issuecomment-840865400>

    My original `collect` design lost out to `keep`. I had an extra param, a word, so it was like `foreach`. In the body, that word when used as a `set-word!` was the equivalent of `keep`.

--------------------------------------------------------------------------------

On 2021-05-13T22:30:27Z, greggirwin, commented:
<https://github.com/red/red/issues/2189#issuecomment-840872138>

    That said, I stand by my post from 31-Mar. If we are passing thunks (`body` args) around, we necessarily have to know how the callee handles them. I can look at your example code and consider it absolutely ambiguous. Just because your body to `do-each` is nested in the outer `collect` call doesn't mean to me that the outer `collect` takes precedence. Quite the contrary, I initially understood it to be under the control of `do-each`.

--------------------------------------------------------------------------------

On 2021-05-13T22:32:49Z, greggirwin, commented:
<https://github.com/red/red/issues/2189#issuecomment-840873033>

    Admittedly, it's a strange pattern, which is another question entirely.
    ```
    >> collect [keep keep keep 1]
    == [1 1 1]
    ```

--------------------------------------------------------------------------------

On 2023-02-20T20:19:18Z, dockimbel, commented:
<https://github.com/red/red/issues/2189#issuecomment-1437509497>

    > Moreover using insert both collect's and parse's keep funcs should share the series position somehow or they are gonna insert stuff in almost unpredictable (read: not very useful) order
    
    That's a key point. I think that alone should be enough reason to drop the support for insertion and only keep the appending behavior for all `/into` and `keep` instances. Anyway, the use-cases for insertion are pretty much non-existent. I personally never had a need for it, and such behavior can be achieved easily using `insert` action afterwards. 

--------------------------------------------------------------------------------

On 2023-02-20T20:47:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/2189#issuecomment-1437529059>

    A simplistic example of `collect` that uses a global bound `keep`:
    ```
    collect': function [code [block!]] [
    	also buffer: make [] 10
    	do code
    ]
    
    keep: function [value [any-type!] /only] with :collect' [
    	either only [append/only buffer :value][append buffer :value]
    ]
    ```
    Benefits:
    1. The [above code](https://github.com/red/red/issues/2189#issuecomment-833604464) returns expected result:
    ```
    >> do-each [ [1 + 2] [2 * 3] [3 ** 4]]
    == [3 6 81]
    >> collect' [ do-each [ [keep 1 + 2] [keep 2 * 3] [keep 3 ** 4] ] ]
    == [3 6 81]
    ```
    2. `keep` function doesn't have to be re-created every time
    3. `keep` can have docstrings and be accessible for `help`/`?`
    
    Drawbacks:
    1. `keep` loses compiled performance boost
    2. functions like this cannot be easily copied / extended due to nonstandard binding
    
    But it still needs some R/S backup to be synced with Parse.

