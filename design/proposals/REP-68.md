
#68: WISH: More consistency in naming of reflectors, and suggestions for additional ones
================================================================================
Issue is open, was reported by meijeru and has 70 comment(s).
<https://github.com/red/REP/issues/68>

There are currently a number of reflectors that end in `?` . Ideally, only those reflectors that yield a `logic!` result should end in `?` while the others should end in `-of`.  This concerns the following built-in functions:
```
context?
distance?
index?
length?
offset?
size?
suffix?
type?
```
Changing the `?` into `-of` would in many cases break existing code. However, the changes are entirely systematic and could easily be made by everyone onto their entire codebase in a matter of minutes.
Additionally, as already requested in REP #12, on `vector!` values one should have `element-size-of` for the element size in bits, and `element-type-of` for the element type.
Finally, for `money!` values one should have `currency-of`, as a way of ensuring that operations on `money!` values can take account of the currency feature.



Comments:
--------------------------------------------------------------------------------

On 2020-03-20T21:12:38Z, 9214, commented:
<https://github.com/red/REP/issues/68#issuecomment-601912994>

    https://github.com/red/red/issues/248, https://github.com/red/red/issues/255. If "reflection" means "queries on composite datatypes", then there is more than one way to address that, see `date!` and `time!` as examples.
    
    ```red
    >> today: now/date
    == 20-Mar-2020
    >> today/day
    == 20
    >> pick today 2
    == 2020
    
    >> moment: now/time
    == 22:23:19
    >> moment/minute
    == 23
    >> pick moment 3
    == 19.0
    ```
    
    I also don't think that convention "`?` means logical predicate" is cast in stone, nor that `-of` should be used exclusively for such queries. Otherwise, extrapolating this REP's proposal, we should have `seconds-of`, `minutes-of`, `day-of`, `sign-of`, etc.
    
    (@dockimbel) I think the middle ground is to define `of` as a kitchen sink `op!` mezzanine that aliases to respective path selectors/reflectors/actions/whatever and wraps over a `pick` with `word!` values (that we discussed some time ago).

--------------------------------------------------------------------------------

On 2020-03-20T21:23:39Z, meijeru, commented:
<https://github.com/red/REP/issues/68#issuecomment-601916719>

    I know the argument against, but I don't think it goes for all of them, especially `context?` which I think is a real misnomer, and `distance?`, `offset?`  and `suffix?` which also lead to confusion. In any case, for the newly requested, and more rarely used ones that I put at the end, I sincerely think that using `-of` is entirely appropriate. Since the old discussion you reference, we have create REPs explicitly for this kind of requests. Also, you will notice that I have not touched things like `head` which are not reflectors in my opinion, but normal operations.

--------------------------------------------------------------------------------

On 2020-03-20T21:43:21Z, hiiamboris, commented:
<https://github.com/red/REP/issues/68#issuecomment-601922914>

    > Additionally, as already requested in REP #12, on vector! values one should have element-size-of for the element size in bits, and element-type-of for the element type.
    
    I'd like to mention image requestors too, esp. `size?` could support images, but `rgb`/`rgba`/`alpha` fields are also currently only accessible via path syntax.

--------------------------------------------------------------------------------

On 2020-03-21T02:09:23Z, greggirwin, commented:
<https://github.com/red/REP/issues/68#issuecomment-601978407>

    @meijeru, I disagree with " Ideally, only those reflectors that yield a logic! result should end in ?" It's strictly consistent, but I don't consider it ideal. It's also something we can't control beyond the Red codebase itself. Consistency is better than randomness, but that's where guidelines and judgement come in.
    
    Some words, like `suffix sign index offset` are natural verbs. Not a big argument, but a small one. Here we agree.
    
    "Logic" has the strict true/false meaning, but also truthiness in the larger sense, where you can view any value as broadly true or false (false | none vs everything else). Look at what `?` suffixed words return, particularly where `none!` is a pass-thru, where results can be treated logically and offer shortcuts both mentally and in code.
    
    "of as a kitchen sink op!" is absolutely worth pursuing. Can we all agree on that? We have the left lit-arg issue to deal with, but we can also require `lit-word!` values there IMO. Not as clean, but will do for experimentation, and maybe forever. It twists things around in my mind, so may end up being a dead end, or may feel very natural after a short time. 
    
    Rather than a mandate and rule, what if we look the small number of cases and address them specifically?
    
    ```
    CURRENT		PROPOSED/NOTES
    -------------------------------
    context?	context? or context-of
    distance?	distance (not used in the Red codebase today)
    index?		index?
    length?		length?
    metrics?	Not used in the Red codebase today, except a dyn-gui test
    		Remove and use new `of` op! only?
    offset?		use `distance` ?
    react?		react? or reaction?
    sign?		sign? or sign (I'm not a fan of `sgn`)
    size?		size?
    suffix?		suffix? or suffix-of; either can work.
    		The reasoning here is that `file? path?` conflict for file! parts,
    		so `path-of file-of suffix-of` was my solution in the past. If we
    		add `of`, that can be used here.
    type?		type?
    ```
    
    I'm not aiming for a fixed number of exceptions to the strict logic rule. Even now, of all the functions in Red, this isn't a huge number, and we can't say how many problems they have caused. Do they lead to confusion, as Rudolf suggests, or are they benign and absorbed in our brains without issue? If we can agree that *some* are better after a name change, that reduces the number even more.

--------------------------------------------------------------------------------

On 2020-03-21T09:23:26Z, meijeru, commented:
<https://github.com/red/REP/issues/68#issuecomment-602018301>

    I am glad I have been able to revive the discussion. I could certainly live with limited changes. That said, I would not want the requests for reflectors on `image!`,  `vector!` and `money!` values go under. Should I republish them as a separate REP issue?

--------------------------------------------------------------------------------

On 2020-03-21T09:44:38Z, rebolek, commented:
<https://github.com/red/REP/issues/68#issuecomment-602020403>

    I agree with @meijeru that ideally, only functions returning `logic!` should end with `?`. However, we don't live in an ideal world and as Red functions have side effects (so strictly they aren't functions at all), some functions ending with a question mark may return something else than `logic!`, `length?` comes to mind for example. 
    
    @9214 proposal for `of` `op!` is very interesting. `length of string`, `index of block` looks very natural and even better than `length? string` or `index-of block`.
    
    Anyway, I agree with @meijeru that naming should be more consistent, but we shouldn't aim for 100% as it comes with other trade-offs.

--------------------------------------------------------------------------------

On 2020-03-21T11:40:17Z, hiiamboris, commented:
<https://github.com/red/REP/issues/68#issuecomment-602032180>

    Just playing with `of` idea here...
    
    `2 * length? s` becomes `length of s * 2`
    `n < index? p` becomes `index of p > n`
    (to stay correct under the evaluation order)
    
    Let's complicate a little bit:
    `i + 1 * length? get w` becomes `length of (get w) * (i + 1)`,
    `n * m < index? fun x y z` becomes `index of (fun x y z) > (n * m)`.
    Which is less compose-friendly, likely slower. Although probably just as readable.

--------------------------------------------------------------------------------

On 2020-03-21T14:20:47Z, planetsizecpu, commented:
<https://github.com/red/REP/issues/68#issuecomment-602049947>

    I am very comfortable and used to the `?` syntax, I think doing them `-of` would be just unnecessary syntactic sugar. Separating `of` from the word I think would add cpu cycles, not desirable after all.

--------------------------------------------------------------------------------

On 2020-03-21T19:05:39Z, greggirwin, commented:
<https://github.com/red/REP/issues/68#issuecomment-602088499>

    Good examples @hiiamboris. 
    
    Seems consensus will be difficult if not impossible. Sometimes there is no perfect option, and it's just a choice. Often that choice will be called into question by future generations. Maybe we need a wiki page of "Inconclusions" where we can note these and let people choose their philosophical rabbit holes.
    
    I'll note that, in the past 20 years, this chat has come up a number of times, but AFAIK nobody has created a standard set of aliases that could be used, and which was adopted by anyone else. It would be a simple thing, but has *never* been done (to the best of my knowledge). So I'm of a mind that this isn't really a problem on the user side. At least not one so bad that it had to be addressed. Like many things, changing these names may be only a lateral move, not a definitive improvement. To that end I suggested, and do again, addressing each specific case, in the context of consistency yes, but really, find the best name for a given function first. Once we do that, do we find that they're all consistent, or that there are variances?

--------------------------------------------------------------------------------

On 2020-03-22T05:38:12Z, greggirwin, commented:
<https://github.com/red/REP/issues/68#issuecomment-602151101>

    The notes on vector and image support, from #12, fall outside this discussion for me, and into a more general chat on `reflect`.

--------------------------------------------------------------------------------

On 2020-03-22T06:27:01Z, rebolek, commented:
<https://github.com/red/REP/issues/68#issuecomment-602154335>

    Just to be clear, I support `of` as an universal accessor, but that doesn't mean I want to get rid of `...?` functions.

--------------------------------------------------------------------------------

On 2020-03-22T10:10:34Z, 9214, commented:
<https://github.com/red/REP/issues/68#issuecomment-602174829>

    *Puts his crackpot hat on* what about `'s`? `block 's length`, `vector 's element`.

--------------------------------------------------------------------------------

On 2020-03-22T10:17:02Z, meijeru, commented:
<https://github.com/red/REP/issues/68#issuecomment-602175635>

    "_The notes on vector and image support, from #12, fall outside this discussion for me, and into a more general chat on reflect._"
    In that case, I will put a separate REP issue for `currency-of`, so that it does not get drowned in here..

--------------------------------------------------------------------------------

On 2020-03-22T18:18:21Z, greggirwin, commented:
<https://github.com/red/REP/issues/68#issuecomment-602250249>

    I drafted some quick notes here: https://github.com/red/red/wiki/Selection,-Reflection,-Accessors,-and-Type-Queries
    
    WRT `currency-of`, image, vector, and others (nobody has suggested `x-of/y-of <pair>` yet ;^), I'm going to push back. The goal, as I see it, is not to fill every box in an access matrix to be "complete". If there is at least one way to do something, we don't _need_ more. Sometimes they are convenient and commonly used. So much so that we want shortcuts. Others may be used so rarely that they won't be missed by 99% of users, or by the other 1% in 90% of their code. Just use another method.
    
    It's the ongoing balancing act of how much we can leave out, weighed against what provides value. What we have in our favor is that those who want consistency and completeness can create it for themselves. We don't have to provide it.

--------------------------------------------------------------------------------

On 2020-03-22T18:52:12Z, meijeru, commented:
<https://github.com/red/REP/issues/68#issuecomment-602254583>

    It is true that `currency-of` can be programmed by anyone (either as a routine or in Red, using textual analysis on a formed value) but given the fact that `money!` values have this "property" it seems logical that the implementation makes available either a reflector or an accessor, so that we don't have numerous re-inventions of the wheel. I made my one crude reflectors on `vector!` values, using textual analysis of the formed value, but it IS somewhat awkard...

--------------------------------------------------------------------------------

On 2020-03-22T20:59:44Z, greggirwin, commented:
<https://github.com/red/REP/issues/68#issuecomment-602272146>

    I agree that we shouldn't have to do textual analysis. My point in starting the wiki page is to lay out the current state of affairs, and create docs as we reason about changes. For example, can we agree that we should _not_ strive for 100% consistency? 
    ```
    m: USD$100
    m/currency == 'USD      ; R2 used FIRST and SECOND for money parts
    currency-of m == 'USD
    ```
    `Currency-of` seems OK, but what about `[x-of y-of user-of julian-of away?-of ...]`? What are the use cases where path notation doesn't suffice? Note that reflection (as it stands now) is used for information you can't get that way. It's internal, and read-only. The currency of a money value is just a component value. 
    
    Now, say we go for consistency, even if some names seem so bad that I imagine they'd never be used. What about `type-of` for `event!`? Do we go for consistency and change `type?` for type checking, or use it for property access? We can't have both. That's a case we know about today, but once we lay down hard and fast rules about naming=semantics and "all accessors must have an associated function" Red becomes much more strict, and a victim of its own rules if we want to choose what to include. Thanks to Vladimir for linking to https://wiki.c2.com/?BondageAndDisciplineLanguage recently. 
    
    That said, if we think only in terms of datatypes, it shouldn't get too out of hand, right? Wrong. No matter how much we tell people not to, they will create new datatypes for their own needs. And that's OK. A good thing even. 
    
    Remember that I'm thinking through this along with you. Today we have a few ways to get at things (see the new wiki page). The small number of general interfaces `[select pick reflect]`, along with type specific accessors avoid global naming conflicts. The more names we make global, and the more properties there are to access, the more confusion and conflict there will be. So we should strive to reduce conflict (both mentally and technically), and only adding things that address real pain points, which may mean being patient and waiting for people to feel a pain. 

--------------------------------------------------------------------------------

On 2020-03-22T21:12:40Z, 9214, commented:
<https://github.com/red/REP/issues/68#issuecomment-602273758>

    @greggirwin `currency-of m == 'USD` is an error though (you're quering `logic!` value).
    
    For the record, path accessor for `money!` values are on my checklist since a week, and I want to push the approach taken by `date!` and `time!` a bit further by allowing `pick` with `word!` values, so that you can write e.g. `pick EUR$123 'currency`.
    
    @dockimbel initially planned that feature for `date!` and `time!`, but didn't have time to implement that, keeping ordinal accessors only.
    
    ---
    
    On the topic of this REP, there are 3 issues that start to mix-up together:
    * Naming (`?` vs. `-of`) and utility vs. consistency;
    * Lack of datatype accessors (`most-significant-bit-of`, `presence-of-the-property-or-lack-thereof`, etc) and the question of their necessity;
    * Bringing all accessors/reflectors/queries/etc under one umbrella, the design question of their unification and of The Right Way™️ to do a reflection on datatypes.
    
    @greggirwin makes the right point: "reflection" as it is now in Red is used to [reify](https://en.wikipedia.org/wiki/Reification_(computer_science)) properties of a value (or the whole program) that you cannot really access otherwise (or can, but either it's a real PITA or there's only a lossy way of doing so, like a textual conversion).
    
    For example, `words-of` on `object!` will reify an array of symbol IDs into a block of words, `context?` will reify context into an `object!` or a `function!`, and can do so when the values of this context are on the evaluation stack, which is not directly accessible.
    
    So, there's also a question of terminology: reflection vs. querying.

--------------------------------------------------------------------------------

On 2020-03-22T21:14:55Z, hiiamboris, commented:
<https://github.com/red/REP/issues/68#issuecomment-602274087>

    `x-of` and `y-of` are not needed because there's `(pick 3x4 2) == 4`. Pairs are covered thus.
    
    Path accessors' drawback is that sometimes you don't have a word bound to your value. You may have only an intermediate expression. Without `pick` to back you up, you have to assign the value to a word. This demands a new workaround - e.g. if you're doing math in a VID actor declared as a block and you didn't declare it's locals. And it just grows and grows.
    
    That's the only reason I'm requesting for image size accessor. Although `size?` is a great fit for it, probably more general way to handle this mess is to allow `pick value word` semantic (e.g. `pick image 'size`, `pick value 'currency`), or using `reflect` instead of `pick` (but why?). Just while I was writing that, @9214 says he almost implemented it. Great! I support this PR! ;)

--------------------------------------------------------------------------------

On 2020-03-22T22:47:53Z, GiuseppeChillemi, commented:
<https://github.com/red/REP/issues/68#issuecomment-602288886>

    Path accessors' and `pick value 'word` are great, my +1 for them.
    
    Reflectors can't be relevant to all situations. As already written, where accessors are widely relevant they should have a general version, otherwise local path/pick base ones have to be used.
    
    EDIT:
    
    Some conserations: 
    
    which reflectors should return the accessors ? `words-of value` or _`words-of datatype`_ ? 
    
    Also I see a problem on functions and objects: while datatypes which express a numeric value have no paths, using them on objects one can expect `pick object 'word`, to return a word value of the object or execute a function, but also to return the function. So if `pick value   'word`  is implemented, its future use on objects should be considered.

--------------------------------------------------------------------------------

On 2020-03-23T00:17:55Z, greggirwin, commented:
<https://github.com/red/REP/issues/68#issuecomment-602304205>

    @9214 `currency-of m == 'USD` was meant to be what result you'd get for `currency-of m` in a console. Sorry that wasn't clear.
    
    `Pick` vs `select` for by-word access is a question. `Pick` is index oriented, while `select` is word/key oriented. `Select` already works on objects and maps. Ordinal accessors are of dubious value to me, at least right now. :^) There are use cases for them, and they don't _have to_ change as an implementation does, but still. What is the _best_ argument for them?
    
    @hiiamboris the pair question falls into the "how many ways do we need to be able to do something?" area. The big win in generalization is that it allows people to write general functions more easily in some cases. _But_, if you are writing general funcs, your value and key are already args that should work with path access.
    
    Thanks, all, for keeping this moving and productive. 

--------------------------------------------------------------------------------

On 2020-03-23T10:48:01Z, Oldes, commented:
<https://github.com/red/REP/issues/68#issuecomment-602518217>

    `of` as an `op!` is what HF did in Ren-C and I must say that it is one of changes which I really don't like. 
    
    I was many time proposing on gitter, that there could be more clever `query` function. Could be like:
    ```red
    >> query %upload_cert.der
    == make object! [
        name: %/r/upload_cert.der
        size: 727
        date: 19-Mar-2020/16:54:13.9+1:00
        type: 'file
    ]
    
    >> query/mode %upload_cert.der none
    == [name size date type]
    
    >> query/mode %upload_cert.der [name size]
    == [%/r/upload_cert.der 727]
    
    >> query/mode %upload_cert.der [name: size:]
    == [
        name: %/r/upload_cert.der
        size: 727
    ]
    
    >> query/mode %upload_cert.der 'size
    == 727
    ```
    
    and it could work with other datatypes in a similar way. For example:
    ```red
    >> query/mode now none
    == [
        date year month day zone time hour minute second weekday yearday 
        timezone week isoweek julian
    ]
    
    >> query/mode now 'year
    == 2020
    ```
    
    I'm just not sure, if `query/mode` is the best name, but that is how it was used in R3-alpha.
    
    And of course, the path access like `now/year` is the best one, when possible.

--------------------------------------------------------------------------------

On 2020-03-24T18:14:36Z, greggirwin, commented:
<https://github.com/red/REP/issues/68#issuecomment-603422058>

    @Oldes, first hand experience is the best kind. Thanks for sharing yours on `of`. `Query/mode` doesn't grab me, as a name. Rebol had `info?` as a wrapper around `query` which, like `reflect` returns read-only meta information. A key difference is that `reflect` deals with internal data (like `keys-of`), while `query` goes outside for it (e.g., to get a file's size in the FS). So they are very close to each other, and even leak some information in that way (there may be exceptions that don't come to my mind right now). This brings up another interesting design point. Leaking information is often viewed as universally bad, but I don't think that's the case. It can also provide valuable hints. Yet another balancing act. 
    
    I don't know where the line is, if there even is one, where we get too granular (too many datatypes, or types of functions), but how things are organized...how _we can_ organize things in our minds, seems key to me. Neither a single list of 20'000 items or a hierarchy 9 levels deep with 3 items at each level is easy to deal with. Just as with module and function sizes, there is too granular and too coarse. Even how much we include in Red as standard. That's what every user has to deal with, but will mix and match to their needs beyond that. 

--------------------------------------------------------------------------------

On 2020-03-25T11:09:52Z, Oldes, commented:
<https://github.com/red/REP/issues/68#issuecomment-603780587>

    @greggirwin actually Rebol (2) had not just `info?` around `query`, but also other mezzanines.. like `size?` which was actually a wrapper around `info?`.
    
    As I said... I don't grab `query/mode` as well. But I think having a way how to get info from some (if not all datatypes) in various formats (not just single value, but also multiple values) using dialect as I proposed above could be useful.

--------------------------------------------------------------------------------

On 2020-03-25T18:09:00Z, greggirwin, commented:
<https://github.com/red/REP/issues/68#issuecomment-603999292>

    There was also `get/set-modes`, which were natives in R2, `get-modes` being a meta-reflector.

--------------------------------------------------------------------------------

On 2020-07-30T16:58:57Z, 9214, commented:
<https://github.com/red/REP/issues/68#issuecomment-666525094>

    https://github.com/red/red/issues/2577, https://github.com/red/red/issues/3552

--------------------------------------------------------------------------------

On 2020-09-20T05:23:02Z, theSherwood, commented:
<https://github.com/red/REP/issues/68#issuecomment-695747178>

    I don't have Rebol experience; so this is an outsider's/newcomer's perspective. I think it is more important that the "?" be clear and consistent than that the verb-for-function-word be consistent. There are a few reasons for this:
    
    1. Other languages use the "?" consistently to indicate a predicate; so benefits for newcomers.
    2. Following the verb-for-function-word convention is bound to be at least somewhat inconsistent if function names are going to be short. So it seems to me that it would be better to concentrate the inconsistency into one soft convention, and allow the other to be consistent.
    3. Sigils (and any punctuation) are rare in Red, and consequently send a much stronger signal than the verb/adjective/noun distinction. Seems like the clarity and consistency of the stronger signal should be prioritized.
    
    I personally don't see a problem with `length`, `size`, `distance`, and `offset` (in contrast to the `-of` variations). But again, no Rebol experience.

--------------------------------------------------------------------------------

On 2020-09-20T21:40:18Z, rebolek, commented:
<https://github.com/red/REP/issues/68#issuecomment-695839891>

    I see a problem there, the words you mentioned ( `length` etc) are great as variable names, while `length-of` isn't such good and is a better fit for a function name. At least from my POV.
    'length?' is used mostly for a historical reason (and it's shorter ;) ), I  personally wouldn't have a problem with switching to `length-of`. Maybe having `length?` as an alias for some time?

--------------------------------------------------------------------------------

On 2020-10-06T11:41:38Z, 9214, commented:
<https://github.com/red/REP/issues/68#issuecomment-704211933>

    Some languages tend to encode the type of a value in the name of a variable, as in `intFooBar`.
    
    In Red there are exactly two cases of such tendency, as can be seen in postfixing conventions for datatypes (exclamation mark, `datatype!` value) and predicates (question mark, supposedly `logic!` value).

--------------------------------------------------------------------------------

On 2020-10-09T20:41:23Z, greggirwin, commented:
<https://github.com/red/REP/issues/68#issuecomment-706393077>

    @theSherwood newcomers are only newcomers for a short time. Casual users may be that way for a long time. But we don't want to sacrifice, er, _cater_ the language's design to either one.
    
    @9214 Hungarian notation has seen ups and downs in popularity. The irony is that we, as an industry, still use things like naming conventions rather than better tools. In other langs, tooling has an easier job, but in Red a live environment could still do a lot to help. e.g. syntax coloring could show words in a color that matches the value of the type they refer to, since that isn't obvious; where it's obvious that a word is a word.

--------------------------------------------------------------------------------

On 2024-01-18T07:15:28Z, Oldes, commented:
<https://github.com/red/REP/issues/68#issuecomment-1897928360>

    When reviewing this issue again, I've got an idea that `query` function could be modified (in Red case implemented) to require always the second (`mode`) argument. So instead:
    ```rebol
    >> query/mode %x.red none
    == [name size date type]
    >> query/mode %x.red 'size
    == 4637756
    >> query/mode %x.red [name size]
    == [%/C/Users/oldes/x.red 4637756]
    ```
    it would be just:
    ```rebol
    >> keys-of %x.red
    == [name size date type]
    >> query %x.red 'size
    == 4637756
    >> query %x.red [name size]
    == [%/C/Users/oldes/x.red 4637756]
    >> query %x.red [name: size:]
    == [
        name: %/C/Users/oldes/x.red
        size: 4637756
    ]
    ```
    And again I repeat, that the `query` should not be limited only to ports and files but could be used with all datatypes where it makes sense... like:
    ```rebol
    >> query now 'zone
    == 1:00
    >> query now [hour minute second]
    == [8 13 24]
    >> query 1x2 [y z]
    == [2 1]
    ```
    

--------------------------------------------------------------------------------

On 2024-01-18T10:38:05Z, hiiamboris, commented:
<https://github.com/red/REP/issues/68#issuecomment-1898222461>

    @Oldes since we have `pick now 'zone`, what's the use for `query now 'zone`? could just extend `pick` to support blocks.

--------------------------------------------------------------------------------

On 2024-01-18T11:07:41Z, Oldes, commented:
<https://github.com/red/REP/issues/68#issuecomment-1898270122>

    Then `pick` would need to be also extended to support for example: `pick %file 'size`

--------------------------------------------------------------------------------

On 2024-01-18T11:26:57Z, Oldes, commented:
<https://github.com/red/REP/issues/68#issuecomment-1898299204>

    But why not... maybe just extend `pick` is not a bad idea... the question is, if this should be also supported:
    ```rebol
    >> pick "ABC" [1 3]
    == [#"A" #"C"]
    ```
    Although it is not related to the consistency in naming of reflectors. Btw... in Rebol3 it is possible to do:
    ```rebol
    >> reflect now 'zone
    == 1:00
    ```
    But it does not support the proposed block... and also is not implemented for all datatypes.
    

--------------------------------------------------------------------------------

On 2024-01-18T11:58:46Z, hiiamboris, commented:
<https://github.com/red/REP/issues/68#issuecomment-1898344092>

    I propose limiting `query` to IO. E.g. with file it does not return a property of the `file!` datatype, but performs an IO operation on the target of it. We then won't expect IO errors in the use of `pick`, but should in the use of `query`.

--------------------------------------------------------------------------------

On 2024-01-18T20:03:37Z, greggirwin, commented:
<https://github.com/red/REP/issues/68#issuecomment-1899127106>

    - `query` always requiring the arg would make it like `checksum` is in Red, vs Rebol. I think that's worked out well, for clarity, and because there was no clear default value that was better than any other. Same with `query`. _What are you asking for?_ is important.
    - Words have meaning. `Pick` and `select` have different meanings, and that tells you, when you see them, _how_ to think about what is being done. If we change `pick` to also support keys, you lose that. If we make that change, `poke` also needs to be updated for consistency. Now those funcs have more power, and subsume, `select/put`. Something else changes. Today, when you see `pick/poke` you naturally think that its target is a series. But...
    - ...some other types can be used, and this isn't great IMO. Done because path access was the only other way. That means either magic numbers or const defs for indexes. Still, you _at least_ know that `pick/poke` are _not_ working against a key-value structure.
    
    All that said, it can be very useful to have a generic accessor model, which `query` can be. It's a good word: `a question (inquiry) to be answered or resolved`  I like this definition for the "or resolved" part. That tells me it may be quick to answer, or require some work. But I think it also leans much more in that direction than answers you already have, and are selecting from. e.g. `pick or select`. Can we write a wrapper that dispatches by datatype and key type? Sure. Let's to that. What do we call it? How does it work? Do we like it? Is it performant enough? Does it see use?
    
    As far as muti-pick, I don't think we need pick to support it. Let's prove its worth first. Remember, it's an action, which means a lot of R/S code changes. As a mezz it is just:
    ```
    pick-multi: function [
    	"Returns multiple values picked from a series or other value."
    	value   [series!]
    	indexes [any-block!] "Block of PICK-compatible index values"
    ][
    	collect [
    		foreach index indexes [keep/only pick value index]
    	]
    ]
    ```
    This can be the start of a new, all-encompassing, `request` function.

