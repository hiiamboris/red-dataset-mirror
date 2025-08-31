
#255: More consistent *-of naming
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 50 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/255>

I looked through the REBOL dictionary for functions that are misnamed according to the new *-of convention. These certainly qualify:

```
head
tail
first ... tenth
last
```

These words are nouns that fail to communicate an action on an argument. Often you would want to use them as variable names instead.

How would you feel about using the *-of forms instead? We would move a little farther away from REBOL, but it would really be clearer, especially in complex expressions and for beginners. Simple assignments could still be used to reestablish compatibility with REBOL code.



Comments:
--------------------------------------------------------------------------------

On 2012-09-18T07:30:13Z, dockimbel, commented:
<https://github.com/red/red/issues/255#issuecomment-8643927>

    Actually, this ticket makes me regret to have granted ticket #248 (even R3 A111 doesn't implement it), because it's a very slippery slope. The point is, do you really want to have to write:
    
    ```
    length-of head-of third-of last-of series
    ```
    
    instead of
    
    ```
    length? head third last series
    ```
    
    I certainly don't want that.
    
    I think that readability and expressiveness are more important than consistent naming rules, especially when it's just about a single suffix character like `?`. Splitting a lot of core words into two words looks like a very bad design decision.
    
    `Often you would want to use them as variable names instead.` You can redefine them to whatever you want, wherever you want, at your own risk, same as in REBOL, and at least for me during my twelve years of REBOL coding, this has worked very well.

--------------------------------------------------------------------------------

On 2012-09-18T09:50:28Z, PeterWAWood, commented:
<https://github.com/red/red/issues/255#issuecomment-8647680>

    length? is often used in everyday English as a verbal abbreviation of "what is the length?". In fact this is a typical English spoken idiom as are colour? size? height? width? etc. etc. 
    
    They are not often used in written English but given recent "developments" in the language it can only be a matter of time.
    
    It always peeved me that what-dir was missing its ? in REBOL. 

--------------------------------------------------------------------------------

On 2012-09-18T15:42:55Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/255#issuecomment-8659250>

    I know, this is a step farther than #248, but I think it needed to be discussed. I stand by #248, because extra markers were already used, ? and -of, and they were inconsistent.
    
    You don't want to write what-dir? because every function returns a value, so to make that consistent, you would have to end every function with ?.
    
    You don't want to drop the -of from the current cases, either, because complex expressions would become meaningless as far as English is concerned. There's a reason the cases we changed in #248 had an extra marker to begin with, instead of just leaving them off.
    
    The above words can be kept as-is, but it should be clear that they're exceptions to the rule, only for brevity because they're used so much.

--------------------------------------------------------------------------------

On 2012-09-20T18:28:03Z, dockimbel, commented:
<https://github.com/red/red/issues/255#issuecomment-8740718>

    The more I think about the `*-of` convention, the more I think it is wrong and that I should revert #248.
    
    I will take a final decision in a few days, the time to review all documents about that topic. So far, the documents I have found are:
    - CureCode tickets: [#1818](http://curecode.org/rebol3/ticket.rsp?id=1818), [#1819](http://curecode.org/rebol3/ticket.rsp?id=1819)
    - REBOL 3 doc: [function names](http://www.rebol.com/r3/docs/concepts/scripts-style.html#section-10)
    
    Please add any other related links, especially if from Carl, as I can't find any page where Carl talks about the `of-` convention...

--------------------------------------------------------------------------------

On 2012-09-20T20:52:07Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/255#issuecomment-8745149>

    From your R3 function names link:
    
    "Begin Function Names with a Verb"
    
    This is exactly why I selected the list in this ticket. They're nouns. To make it clear that they're actions on an entity, one follows them with "of" in English. The examples from the style guide where ? is used are from the R2 days, when the new convention in R3 wasn't introduced yet, and even that says "such as ?". Hence the inconsistency we fixed in #248. Note that two of the four examples fall under the logic! convention and thus remain unaltered.
    
    In the R3 functions list there are eight occurrences of the -of convention, so it's clearly there, but code is really not going to be dominated by it:
    
    http://www.rebol.com/r3/docs/functions.html
    
    CC#1818 is about the style guide being outdated. Brian's comments are pretty accurate, and at the time he was communicating Carl's decisions as he was working with him on the design of R3. What I proposed is according to that line, except not letting the legacy convention apply to Red.

--------------------------------------------------------------------------------

On 2012-09-21T14:37:18Z, dockimbel, commented:
<https://github.com/red/red/issues/255#issuecomment-8766633>

    "...the logic! convention..." Where is that convention described in REBOL documentation or Carl's posts? 

--------------------------------------------------------------------------------

On 2012-09-21T16:00:05Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/255#issuecomment-8769345>

    It's a logical remainder if you move accessor style functions to *-of. A lot of functions that returned logic! values used ? and remain unaltered, and also undisputed.
    
    Brian and Maxim comment on it in CC#1818.
    
    Note that it gives you three very nice overlapping namespaces to draw your names from:
        INDEX          Variable
        INDEX?        Does it have an index?
        INDEX-OF    Get the index (probably into your INDEX variable)
    (This example would work better with HEAD and TAIL, because HEAD? and TAIL? really exist, and do something different than HEAD-OF and TAIL-OF, but the latter two don't exist according to the legacy convention.)

--------------------------------------------------------------------------------

On 2012-09-21T21:07:18Z, dockimbel, commented:
<https://github.com/red/red/issues/255#issuecomment-8780507>

    Rules and conventions are not a goal by themselves, their purpose should be to simplify the life of the programmer while ensuring consistency. So far, my concern is that when I weight the convention of having `?` suffix for noun/adjective actions that return logic! values and `-of` suffix for the rest, versus, having a _single_ word as action, I can't help thinking that having a single word (with `?` suffix for all non-verbs) is a far better choice for all end users.
    
    The rule could be that the noun/adjective + `?` suffix could be used to query for a datatype property, whatever the type of answer for that property is (being a boolean value, integer or anything else). This is consistent also with usage in English as shown by Peter above.
    
    Reducing the `?` as return type decoration looks to me as marching towards [Hungarian notation](http://en.wikipedia.org/wiki/Hungarian_notation) and we certainly don't want that in Red. Also, to be consistent, why having only a decoration for logic! return type, why not a decoration for every other return types (when the action/native/function returns always the same type, like...`length?` e.g.). Moreover, why introducting `-of` suffix and letting `?` character, instead of the more explicit `is-` prefix...? 
    
    This can go deep, and it could be like opening a pandora box if we don't stop on very simple and limited naming rules. For example: all type actions have to be a _single_ word, all non-verbs end with `?`.
    
    " _Brian's comments are pretty accurate, and at the time he was communicating Carl's decisions as he was working with him on the design of R3. What I proposed is according to that line, except not letting the legacy convention apply to Red._ " I'm still waiting for reading a word from Carl himself about that, to me it looks more like Brian pushing his own personal ideas.
    
    Anyway, I will re-read all arguments first, and then decide on the naming rules for Red, probably during next week.

--------------------------------------------------------------------------------

On 2012-09-22T00:11:07Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/255#issuecomment-8783700>

    I don't really understand what the problem is. All I'm concerned about is simplifying the life of the programmer, through a careful balance of brevity and consistency.
    
    If you ban any *-of convention, you go against the design of R3. Red would be more incompatible with REBOL than due to fixing #248. It's the outcome of a long design discussion. Most people agree with Brian on this.
    
    I don't understand the Hungarian Notation argument. I've always disliked HN and still want to rip it out of Syllable. "of" is plain English, not Hungarian or any mathematical notation resembling it. "?" however is used as a sigil in REBOL, so it's much more like HN, like $VAR in BASIC and Perl. A ? is only English at the end of a sentence. That makes it more defendable to want to put it on what-dir but that argument can't be extended to functions taking arguments, or when the result of what-dir is used in a larger expression.
    
    I agree that _? is equivalent to is-_. Despite the above, I've always thought of that as an elegant way in REBOL to write it a little bit shorter, while still being a good balance between a sigil and plain English. It meshes with the other sigils used in REBOL: "'", ":", "!". If that brief alternative is available, there's no need to use is-*.
    
    As I said before, using *? for everything is not the answer. Red is a functional language, so every function returns a value. If you take a question in English as the rule for that, every function returning a value would need a ?. The only exception you could make would be for functions returning unset!. If you take functions returning a property of an argument as the rule, it would mean that HEAD? and TAIL? should return a series at its head or tail, not ask whether it already was at its head or tail.
    
    As you're well aware, waiting for Carl to make a statement other than what he has done in code is not the answer, either. Your considerations are understandable in the context of a young and limited language, that's why they were the same for R2. However, during the further development of REBOL, overloading of words became increasingly a problem. That's why the *-of convention needed to be added, and then you have to think about consistency.

--------------------------------------------------------------------------------

On 2012-09-24T13:49:32Z, dockimbel, commented:
<https://github.com/red/red/issues/255#issuecomment-8819266>

    _I don't really understand what the problem is._ As I mentioned it several times, writing `length-of` is two words while `length?` is just one. I think such distinction matters a lot when it is about core action names. Writing `length-of` and `index-of` look awkward to me, when compared to other action names. I have less problem accepting it for non-actions words, that are less used like: `spec-of`, `body-of`, ... Once again, I believe that readability and expressiveness should take precedence over abstract consistency (you can always come up with consistent abstract rules).
    
    Hungarian Notation: that was my answer to _A lot of functions that returned logic! values used ? and remain unaltered, and also undisputed._ IMHO, linking `?` to returned logic! values is going towards HN.
    
    _If you ban any *-of convention, you go against the design of R3. Red would be more incompatible with REBOL than due to fixing #248._ `length?` and `index?` are used both by R2 and R3. Not reverting #248 will make Red incompatible with both R2 and R3. (I care more about R2 compatibility than R3 anyway, as R3 is used by just a few people).
    
    _If you take functions returning a property of an argument as the rule, it would mean that HEAD? and TAIL? should return a series at its head or tail, not ask whether it already was at its head or tail._ Ok, let's extend the rule then to be more consistent: by convention `?` is a suffix used on functions names not starting with a verb, to request a property or ask for a state.
    
    _As you're well aware, waiting for Carl to make a statement other than what he has done in code is not the answer, either_ I don't believe that Carl has done anything in the code wrt `-of` convention. All `*-of`functions are mezzanines in R3, so they could have been written by anyone. Carl could have agreed to such convention under the pressure of the few people working on R3 mezz code, but that doesn't mean that's in line with REBOL way of doing things (I guess that you need to be writing your own language to understand that such things can happen...). If I had involved myself in R3 development and design, I would have firmly battled against such move, and, maybe, my cause would have prevailed. As long as I don't read a direct statement of Carl saying that this is the right thing to do, it will look to me as a contestable design decision.

--------------------------------------------------------------------------------

On 2012-09-24T14:32:27Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/255#issuecomment-8820724>

    There's a lot of speculation in there. I don't see how Carl, with all the control he has exerted on R3, could work for six years to make it a better design, and then allow others who are under his control to "ruin" it.
    
    "Ok, let's extend the rule then to be more consistent: by convention ? is a suffix used on functions names not starting with a verb, to request a property or ask for a state."
    
    This is how it was in R2, and it doesn't fix the collision between HEAD? and TAIL? and HEAD and TAIL, or similar cases in user code. This whole issue is not about sigils or HN, which are both used in REBOL in mild forms, but about the flexibility to have multiple forms of the same word to prevent collisions in meaning. That's why many natural languages use accents, why REBOL uses sigils, and why languages such as English use short additional words such as "of", "is" and "in". IN is even a REBOL function.

--------------------------------------------------------------------------------

On 2012-09-24T15:27:06Z, earl, commented:
<https://github.com/red/red/issues/255#issuecomment-8822717>

    > by convention ? is a suffix used on functions names not starting with a verb, to request a property or ask > for a state.
    
    I think that's a relatively horrid rule, for three reasons. One, it results in the collision describe by Kaj (`head?` vs `head`). Two, it precludes verb-named predicates from having a `?` suffix (i.e. `walks` instead of `walks?`). Finally, this rule randomly sprays `?` sigils across the code without improving code readability. Yes, you can argue linguistically about the results, but "there's a `?` here because the function name is not a verb" doesn't help much in understanding what's actually going on in the code.
    
    In general, I think the convention of having _predicates_ (boolean-valued functions) suffixed with a `?` is a good one (and has a strong history in other language communities). Not because I'm a particular fan of Hungarian notation, but because this greatly helps readability and quick code comprehension _and_ happens to fit well with natural language conventions and therefore is unobtrusive and also feels somewhat "natural" (points that seldom apply to Hungarian notation).
    
    I would much prefer to relax the "all actions must start with a verb" rule slightly and introduce/tighten the "predicates (and only predicates) are suffixed with a `?`" rule.
    
    Pertaining to the particular functions discussed, I think usage frequency is a good guidance for making some exceptions. I'll use my gut feeling for the following, but we could also gain empirical data by analysing the script library.
    
    Concretely, I suggest:
    - `length`. This is a deviation from the verb rule and from R2/R3 but fixes the predicate rule violation. I think the verb rule violation is warranted because this by far the most heavily used function of those under discussion that violate the predicate rule.
    - `head`, `tail`, `first`, `second`, ..., `last`. Same reason: heavy (and often composed/chained) usage. Added bonus: R2/R3 compatibility.
    - `type-of`, `size-of`, `index-of`. To fix predicate rule violations. In those cases the "-of" form seems like a _very_ reasonable compromise between readability and usage frequency / usage patterns.

--------------------------------------------------------------------------------

On 2012-09-24T17:24:55Z, dockimbel, commented:
<https://github.com/red/red/issues/255#issuecomment-8826938>

    Andreas, thanks for the useful insights. At first look, I'm more inclined in using `length` than `length-of`. However, it precludes from using it as variable name. The drawback of your proposition is that it would make Red even less compatible with both R2 and R3, as both are using `type?`, `size?`, `index?`... Also, if we have to make exceptions from the beginning for the most frequently used words, IMHO, it's a sign that something is wrong with the rule, as we try to limit its application in order to make the language more practical. I'm certainly not against having consistent (abstract) rules, but not at any cost.
    
    I agree that my rule proposition was clumsy, I should not multiplex writing comment and writing code for Red, the topic is deep and deserves a full focus.
    
    Kaj, about speculation, that's all we have left as Carl abandoned R3 in unfinished state. Carl lived during more than 15 years with the `length?`, `type?`, `index?`,... and even after 6 years of R3 design, they are still like that in R3. If it was so unsupportably inconsistent, I wonder why he never changed those words, even after two major rewrites of the language. If the argument is that "backward compatibility" is vital, then I can invoke the same argument for Red as it will be so close to REBOL, that it will most probably run most scripts unchanged.
    
    I need some time to review all arguments, maybe later this week.

--------------------------------------------------------------------------------

On 2012-09-24T20:03:02Z, iArnold, commented:
<https://github.com/red/red/issues/255#issuecomment-8832514>

    Well let's throw in some new light. Programming in any other language than English makes the 'problem' go away:
    lengte: length? series (where lengte of course means length) 
    Programmers natively speaking English have always been faced by the fact that the best description for their variable was already taken by a reserved word. 
    The solution as always is in better description of your variable: length-of-name: length? name-series and not length: length-of name-series
    The same with head and tail and first second tenth etcetera second of what??
    Hope never to have to write length-of series in Red. It is a lot of unnecessary typing "-of"

--------------------------------------------------------------------------------

On 2012-09-24T20:35:44Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/255#issuecomment-8833701>

    It's exactly one key more to type, and you don't need the coordination required to use the `SHIFT` key.

--------------------------------------------------------------------------------

On 2012-10-27T16:28:35Z, dockimbel, commented:
<https://github.com/red/red/issues/255#issuecomment-9837088>

    I need to take a decision for Red first alpha release, but so far, I haven't made a definitive opinion on this topic. The reality is that R2 (and R3 for the most part) don't have any consistent naming rule, the "verb" rule mentioned in the documentation could be valid for user scripts only, but not for function names provided by the language. The "*-of" rule introduced in R3 applies only to new words (that also happen to be rarely used). 
    
    So either Carl messed up totally the design of R2/R3 wrt to function naming, or, knowing how picky he can be about choosing names, it's done that way on purpose. I will try to ask him about that, but my guessing is that the practical advantage of having short, meaningful words for base functions is more important than having strict naming rules. The systematic use of naming rules like "*-of" would surely satisfy academic imperatives, but if used extensively, as I've shown above, would IMHO make the code harder to read and harder to write. We've lived ~15 years with no strict naming rule in REBOL and I don't remember anyone complaining that it was a show-stopper, nor even an obstacle in using and mastering the language. I'm not against strict naming rules, it's just that they might not be a good fit for a REBOL-like language. What can look like broken from an abstract POV, can be just working well from a practical POV.
    
    The only part where I could agree about a naming rule would be to reserve the "?" character for function returning logic! values. But I don't see any satisfying enough solution so far for replacing the words not conforming to such rule.
    
    Anyway, this remains an open topic, but until we find a consensus over this topic and satisfying solutions, I will stick to R2/R3 names and I will revert #248 for v0.3.0 release.

--------------------------------------------------------------------------------

On 2012-10-28T20:44:20Z, iArnold, commented:
<https://github.com/red/red/issues/255#issuecomment-9850271>

    Hi Nenad,
    
    As far as my opinion in this is relevant, it would be possible to make an
    alias to name the functiona as you like anyway?
    
    I think it would have been to big a change to have all functions to be
    renamed from R2 to R3.
    
    Kaj's and others arguments to have a consistency is very valid. I still
    like the shorter form.
    My main argument will remain that having a variable named 'length' is a bad
    choice for variable name anyway (let alone if you called it 'length?').
    
    I think I would use aliases to rename those pesky *-of function names ;-)
    
    Hope this helps.
    Kind regards,
    
    Arnold
    
    2012/10/27 Nenad Rakocevic notifications@github.com
    
    > I need to take a decision for Red first alpha release, but so far, I
    > haven't made a definitive opinion on this topic. The reality is that R2
    > (and R3 for the most part) don't have any consistent naming rule, the
    > "verb" rule mentioned in the documentation could be valid for user scripts
    > only, but not for function names provided by the language. The "*-of" rule
    > introduced in R3 applies only to new words (that also happen to be rarely
    > used).
    > 
    > So either Carl messed up totally the design of R2/R3 wrt to function
    > naming, or, knowing how picky he can be about choosing names, it's done
    > that way on purpose. I will try to ask him about that, but my guessing is
    > that the practical advantage of having short, meaningful words for base
    > functions is more important than having strict naming rules. The systematic
    > use of naming rules like "*-of" would surely satisfy academic imperatives,
    > but if used extensively, as I've shown above, would IMHO make the code
    > harder to read and harder to write. We've lived ~15 years with no strict
    > naming rule in REBOL and I don't remember anyone complaining that it was a
    > show-stopper, nor even an obstacle in using and mastering the language. I'm
    > not against strict naming rules, it's just that they might not be a good
    > fit for a REBOL-like language. What can look like broken from an abstract
    > POV, can be just working well from a practical POV.
    > 
    > The only part where I could agree about a naming rule would be to reserve
    > the "?" character for function returning logic! values. But I don't see any
    > satisfying enough solution so far for replacing the words not conforming to
    > such rule.
    > 
    > Anyway, this remains an open topic, but until we find a consensus over
    > this topic and satisfying solutions, I will stick to R2/R3 names and I will
    > revert #248 https://github.com/dockimbel/Red/issues/248 for v0.3.0
    > release.
    > 
    > —
    > Reply to this email directly or view it on GitHubhttps://github.com/dockimbel/Red/issues/255#issuecomment-9837088.

--------------------------------------------------------------------------------

On 2012-11-12T16:56:44Z, pekr, commented:
<https://github.com/red/red/issues/255#issuecomment-10295136>

    Well, not sure discussion is closed already or no, but I do remember it quite differently and I don't necessarily agree with the reasoning Kaj provided here. So - IIRC, -of naming convention came up, when Carl decided to stop reflective inspection of functions! You are not allowed to use first, second, third on function name as accessors anymore.
    
    And If I remember it correctly, introduction of -of variants had no other reason, then to solve the accessor problem.

--------------------------------------------------------------------------------

On 2012-11-23T01:25:12Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/255#issuecomment-10648140>

    For what it's worth, Topaz standardises on the `*-of` convention proposed in #248, for example `length-of`.

--------------------------------------------------------------------------------

On 2012-11-23T11:28:50Z, dockimbel, commented:
<https://github.com/red/red/issues/255#issuecomment-10657051>

    That's one of the reasons why I accepted the change in the first place. Later, I realized that Topaz is still highly experimental and not bound to be compatible with R2/R3.

--------------------------------------------------------------------------------

On 2012-11-23T16:53:33Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/255#issuecomment-10664803>

    Here's another example of Carl using the pattern, from before R3:
    
    http://www.rebol.com/docs/changes-2-5.html#section-21

--------------------------------------------------------------------------------

On 2012-11-23T17:14:20Z, dockimbel, commented:
<https://github.com/red/red/issues/255#issuecomment-10665404>

    Nobody forbids using "-of" in your own code for new words. Actually, that is exactly what Carl did in R3, using them only for new function names (or to solve ambiguous old ones like `maximum-of` and `minimum-of`).

--------------------------------------------------------------------------------

On 2014-02-08T11:30:30Z, hostilefork, commented:
<https://github.com/red/red/issues/255#issuecomment-34541596>

    Just found this year-old **length?** vs **length** vs **length-of** issue.
    
    _(GitHub on mobile puts different things at the top, ranked by popularity instead of age, or something?)_
    
    I will remark that it's odd how selective people are with concerns.  As if having a `length` function would mean you can't call a variable "length" is all that different from not being able to call a variable `head`.  Why get so concerned all of a sudden?  Maybe I want to call a variable `skip` for a skip count.
    
    **length-of series** is a step backward; it's ugly and two more characters.  **length series** is a step forward; one fewer character, and an actual stake in the ground that we don't end functions that return anything besides yes/no with **?**.
    
    **index-of** is ugly but used much less often than length.  The two extra characters will be far outweighed by all the question marks saved on **length**.  Personal empirical data: I have called variables `index` but never `length`.
    
    The most important thing here is to blend _"efficient and clear coding"_ with a _"logical framework that can be applied to understanding why things are the way they are and set an example for user-written libraries"_.  Best answer I see is that nothing out of the box ends with **?** that doesn't return LOGIC!... and `length` avoids the "-of" debacle because it is too frequently used in everyday code.

--------------------------------------------------------------------------------

On 2019-05-29T00:22:02Z, greggirwin, commented:
<https://github.com/red/red/issues/255#issuecomment-496737422>

    Current list of funcs that end in `?` but don't return a logic value (not counting `?` and `??`). The vast majority of funcs ending in `?` _do_ return a logic value.
    ```
    context?
    distance?
    index?
    length?
    metrics?
    offset?
    react?
    sign?
    size?
    type?
    ```
    If we really want to follow the verb rule, we should name things `get-*`, rather than `*-of`. 
    
    Consistency is good, but I don't think we can apply a hard and fast rule, universally, forever. All we can provide is guidelines and rationale when it comes to naming. To that end, a trailing `?` sigil can simply mean: I'm asking a question. "What is X?" Sometimes the answer is Yes/No, in which case, the question is framed as "Is this [a/an] X?" or "Is this expression true?"
    
    Does that mean `?` could be used almost anywhere, because half the time we're asking about things? Yes it does. Just removing the sigil from the above funcs would cause naming conflicts, and perhaps some confusion (at least for old timers). But I don't think this is a problem, per se. At least not one with a solution that's better, only different. It's something you learn, you learn quickly, and then seems very natural. It's simply part of the vocabulary to learn, and you have hints to help you.
    
    I vote that we close this ticket, and if someone wants to propose renaming any of the above funcs, with concrete reasons for each, use new tickets.

--------------------------------------------------------------------------------

On 2019-08-31T12:53:45Z, dockimbel, commented:
<https://github.com/red/red/issues/255#issuecomment-526828422>

    After reading again this thread, I still stand by my early [comment](https://github.com/red/red/issues/255#issuecomment-8780507) about it. So, for now, we close this debate.

