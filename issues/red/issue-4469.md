
#4469: ANY/ALL docstrings need clarification
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 54 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/4469>

`ANY` help brings you to the wrong conclusion that if a value is not `none` or `false` than it is true (logic).

```
>> help any
USAGE:
     ANY conds

DESCRIPTION: 
     Evaluates, returning at the first that is true. 
     ANY is a native! value.

ARGUMENTS:
     conds        [block!] 

>> any [false 22 33]
== 22
```
*...Evaluates, returning at the first that is* **true**.

But in Redbol logic:
```
>> true = 22
== false
>>
```

The same is needed for `ALL`
```

>> help all
USAGE:
     ALL conds

DESCRIPTION: 
     Evaluates, returning at the first that is not true. 
     ALL is a native! value.

ARGUMENTS:
     conds        [block!] 
```

I would suggest changing these help texts.

Discussion is [here](https://gitter.im/red/docs?at=5ecc27e6225dc25f54a5926e)  



Comments:
--------------------------------------------------------------------------------

On 2020-05-26T08:23:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/4469#issuecomment-633882707>

    This belongs to red/docs/issues

--------------------------------------------------------------------------------

On 2020-05-26T12:27:33Z, 9214, commented:
<https://github.com/red/red/issues/4469#issuecomment-633993148>

    Language semantics defines everything as being conditionally true except for `false` and `none`. Moreso, `all` and `any` are not limited to `logic!`, and can be used for short-circuited evaluation.
    
    In this regard docstring are short and to the point, while the issue comes loaded with incorrect assumptions; we can perhaps use ad-hoc "truthy" and "falsey" terms or describe results as "conditionally true/false", but I'm not sure how helpful that is.

--------------------------------------------------------------------------------

On 2020-05-26T18:51:33Z, greggirwin, commented:
<https://github.com/red/red/issues/4469#issuecomment-634210722>

    The chat for this started here: https://gitter.im/red/docs?at=5ecc27e6225dc25f54a5926e
    

--------------------------------------------------------------------------------

On 2020-05-26T19:03:22Z, 9214, commented:
<https://github.com/red/red/issues/4469#issuecomment-634216908>

    And then there are `if`, `either` and the like. I propose we amend the docstring to mention "conditionally true/false" and be done with it; the rest should be delegated to the user manual.

--------------------------------------------------------------------------------

On 2020-05-26T19:08:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/4469#issuecomment-634219955>

    I like docstrings proposed by @endo64 (although `non-falsy` should be just `truthy`)
    Current docstrings are super cryptic and tell little of value (I'm glad I never read them before ☻)

--------------------------------------------------------------------------------

On 2020-05-26T19:10:43Z, greggirwin, commented:
<https://github.com/red/red/issues/4469#issuecomment-634220923>

    ```
    1) 
    any : Evaluates and returns the first value that is not FALSE or NONE, (returns) NONE otherwise
    all : Evaluates and returns at the first FALSE or NONE, (returns the) last value otherwise
    
    2)
    any : Evaluates and returns the first value that is not FALSE or NONE; otherwise NONE
    all : Evaluates and returns at the first FALSE or NONE; otherwise returns the last value 
    
    3) 
    any : Evaluates and returns either NONE or the first value that is not FALSE or NONE
    all : Evaluates and returns either NONE, at the first FALSE or NONE, or the last value
    
    4)
    any : Evaluates and returns the first non-falsy value (or NONE)
    all : Evaluates and returns the last truthy value (or NONE)
    
    5)
    any : Evaluates and returns the first non-falsy value; otherwise NONE
    all : Evaluates and returns the last truthy value (or NONE)
    ```
    
    Other funcs fall in this area as well:
    ```
    either       native!       If conditional expression is true, eval true-block; else eval false-blk.
    if              native!       If conditional expression is TRUE, evaluate block; else return NONE.
    unless      native!       If conditional expression is not TRUE, evaluate block; else return NONE.
    until           native!       Evaluates body until it is TRUE.
    while           native!       Evaluates body as long as condition block returns TRUE.
    ```
    
    `Truthy` is not my favorite word, but is a lot shorter than `false or none`. It would be nice to be clear on `true logic!` vs truthy, not only for this set of doc strings, but going forward.

--------------------------------------------------------------------------------

On 2020-05-26T19:19:13Z, 9214, commented:
<https://github.com/red/red/issues/4469#issuecomment-634225466>

    Both truthy and falsy are used excessively, see [MDN web docs](https://developer.mozilla.org/en-US/docs/Glossary/Falsy) for example. In Red falsy is either `false` or `none`, the rest is truthy.

--------------------------------------------------------------------------------

On 2020-05-26T19:20:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4469#issuecomment-634225870>

    ```
    6)
    any : Returns first truthy value of conds; NONE otherwise
    all : Returns last value if all conds are truthy; NONE otherwise
    ```

--------------------------------------------------------------------------------

On 2020-05-26T23:55:00Z, greggirwin, commented:
<https://github.com/red/red/issues/4469#issuecomment-634341200>

    #6 is pretty nice. Though I also have an urge to rename the `conds` arg. That also ripples out to other funcs that use it. `Expr/exprs` is also short and somewhat cryptic, but more accurate. `Cond` is nice for `if/either` though, and carries forward into `any/all`, which was likely the original reason. So I won't push for that change right now. :^)
    
    ```
    7)
    any : Returns the first TRUE? value; otherwise NONE
    all : Returns the last value if all are TRUE?; otherwise NONE
    ```
    
    The question, in general, is whether we prefer truthy, TRUE?, non-false, "True in a three-valued logic sense", or "Presupposing a finite-valued logic system, where only FALSE and NONE..." ?

--------------------------------------------------------------------------------

On 2020-05-27T10:03:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/4469#issuecomment-634559778>

    Note that (6) also subtly hints at evaluation: returns a *value* of *conditions* (or expressions - even better).
    "truthy" or "true" or "TRUE?" I don't really care much. Just not "non-false" please, and not "non-non-true" ;)

--------------------------------------------------------------------------------

On 2020-05-27T17:38:50Z, greggirwin, commented:
<https://github.com/red/red/issues/4469#issuecomment-634825836>

    Ah, yes, I hacked yours, where the originals had "Evaluates and..."

--------------------------------------------------------------------------------

On 2020-05-27T17:47:06Z, greggirwin, commented:
<https://github.com/red/red/issues/4469#issuecomment-634830673>

    ```
    8)
    any : Evaluates and returns the first TRUE? value; otherwise NONE
    all : Evaluates and returns the last value if all are TRUE?; otherwise NONE
    ```

--------------------------------------------------------------------------------

On 2020-05-28T09:13:54Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/4469#issuecomment-635221328>

    Gregg, I like #8 and also agree with 9214 proposal "the rest should be delegated to the user manual"  which will explain the difference between logic true and result of true? ("truthy").
    

--------------------------------------------------------------------------------

On 2020-05-28T10:20:20Z, meijeru, commented:
<https://github.com/red/red/issues/4469#issuecomment-635253289>

    Rebol 2 and 3 have a function named  `TRUE?` which tests for truthy. If we re-introduce that in Red, #8 is the best!

--------------------------------------------------------------------------------

On 2020-05-28T11:32:58Z, 9214, commented:
<https://github.com/red/red/issues/4469#issuecomment-635284402>

    @meijeru what docstring of such function should say then? Defining conditional natives in terms of `true?` just pushes the terminological problem one level below (and introduces an ad-hoc alias for `to-logic`).

--------------------------------------------------------------------------------

On 2020-05-28T15:14:44Z, meijeru, commented:
<https://github.com/red/red/issues/4469#issuecomment-635413263>

    The docstring should say: "true if not false or none, false otherwise" (the latter part could be implied). You are quite right it pushes the problem one level lower, thus enabling other functions needing explanation (and there are many, as we have seen) to do with a short explanation rather repeating a long one, or introducing "truthy" as a concept in its own right. 

--------------------------------------------------------------------------------

On 2020-05-28T16:08:02Z, dockimbel, commented:
<https://github.com/red/red/issues/4469#issuecomment-635443250>

    I vote for 8), but using `truthy` instead of `TRUE?`. I think we should introduce words `truthy` and `falsy` in our jargon (and the docs), as they are short and intuitive.
    
    > `returns the first TRUE? value`
    
    TRUE? returns a logic value, so that sentence means a logic! value is returned?! TRUE? can become quickly confusing in such context.

--------------------------------------------------------------------------------

On 2020-05-28T16:20:24Z, 9214, commented:
<https://github.com/red/red/issues/4469#issuecomment-635450881>

    Agreed with @dockimbel. Like I said earlier, "truthy" and "falsey" are common terms in other languages (quick search points at JS, Python, Ruby, PHP), and at least JavaScript has them formalized in a glossary.
    
    And then there's `all` which should return `true` rather than `none` if there are no expressions.

--------------------------------------------------------------------------------

On 2020-05-28T16:24:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/4469#issuecomment-635453163>

    > And then there's `all` which should return `true` rather than `none` if there are no expressions.
    
    So it's not by design that `none = all []` in Red?
    And why `true`? `all` returns the value that it evaluates, so where would `true` come from?

--------------------------------------------------------------------------------

On 2020-05-28T16:47:58Z, 9214, commented:
<https://github.com/red/red/issues/4469#issuecomment-635464683>

    Scheme:
    ```racket
    > (and)
    #t
    > (or)
    #f  
    ```
    
    Common Lisp:
    ```common-lisp
    > (and)
    T
    > (or)
    NIL
    ```
    
    R:
    ```r
    > all()
    [1] TRUE
    > any()
    [1] FALSE
    ```
    
    J:
    ```j
       *./>a:
    1
       +./>a:
    0
    ```
    
    Julia:
    ```julia
    > all([])
    true
    > any([])
    false
    ```
    
    Python:
    ```python
    > all([])
    True
    > any([])
    False
    ```
    
    Javascript:
    ```javascript
    > [].every(function(){})
    true
    > [].some(function(){})
    false
    ```
    
    Rebol2 & Rebol3:
    ```rebol
    >> all []
    == true
    >> any []
    == none
    ```
    
    ---
    
    Look at boolean tables for `and` and `or`. Each has a single "default" case and the rest that make an exception out of it. For `and` / `all` it's `1` / `true`, for `or` / `any` it's `0` / `false` / `none`. If there are no expressions to evaluate, then there are no such exceptions to make, hence the default value is assumed.
    
    ```
    AND      OR
    0 0 0    0 0 0
    0 1 0    0 1 1
    1 0 0    1 0 1
    1 1 1    1 1 1
    ```
    
    Or you can rephrase it as "evaluate, stop at the first that returns X; if reached the tail, return logical complement of X". Naturally, if it's already at the tail, complement of X should be returned.

--------------------------------------------------------------------------------

On 2020-05-28T17:05:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/4469#issuecomment-635475999>

    > hence the default value is assumed.
    
    I guess it makes sense. Starting boolean flag state and first deviation upon which it stops. However, since `any`/`all` return the result of an expression, not and-ed or or-ed, but as is, this makes it a bit different.
    
    From consitency's PoV `unset? all []` makes more sense, as if `all` evaluated an empty expression, which result is truthy (compare to `()` and `do []`). Not that it's any more useful, although... not sure.
    
    Personally I never used `any`/`all` with an empty block so I don't care much. However this edge case will affect the docstring, so we should make a decision here.

--------------------------------------------------------------------------------

On 2020-05-28T19:32:00Z, greggirwin, commented:
<https://github.com/red/red/issues/4469#issuecomment-635551382>

    ```
    9)
    any : Evaluates and returns the first truthy value; otherwise NONE
    all : Evaluates and returns the last value if all are truthy; otherwise NONE
    ```
    
    While I don't love `truthy`, `TRUE?` isn't perfect either. So `truthy` it is.
    
    Do we standardize on `falsy` or `falsey` for spelling? I vote for the latter. Is has "false" in it, and then they are the same length.
    
    > And then there's all which should return true rather than none if there are no expressions.
    
    Nice explanation 9214. Has Rebol inspired this in all the other langs that have `any/all` now? Woohoo!
    
    The empty block should be a rare case, but not impossible, as you may build up a set of checks to run against. I may only have done this a couple times in the past. Even then, you just need to know the behavior and check for empty sets if you want a different behavior. Let me pose a different view.
    
    `Any/All` are finite-value logics, which we distill to truthy/falsey. In the logic tables, `0 0 0` (all false) returns false for both. That leads to asking "How do we interpret values that don't exist?" They aren't none, or even unset. Do you defend inaction by saying "Nobody told me I could."? Do you defend action by saying "Nobody told me I couldn't."? It can go either way, neither being "better" in all cases.
    
    If I give you a page that says "Answer the following questions:" and the rest of the page is blank. When you give it back to me and I ask "DId you answer all the questions?" what do you say? Yes, No, or "There weren't any questions." (true, false, none)? Red has an opinion on three valued logics, and we use `none` a lot (unlike `unset`). 
    
    ```
    >> last []
    == none
    >> first []
    == none
    >> pick [] 3
    == none
    >> find append [] [] []
    == none
    ```
    
    Given how _we_ use it, I think the current behavior is both justifiable and preferable. Maybe the other langs just copied the Rebol behavior. ;^)
    
    I bet @GiuseppeChillemi  had no idea the can of worms he was opening. I certainly didn't. :^)

--------------------------------------------------------------------------------

On 2020-05-28T20:14:41Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/4469#issuecomment-635579457>

    @greggirwin no, I had no idea that modifying one of its string our whole universe would have started to collapse!

--------------------------------------------------------------------------------

On 2020-05-28T20:16:06Z, 9214, commented:
<https://github.com/red/red/issues/4469#issuecomment-635581150>

    > If I give you a page that says "Answer the following questions:" and the rest of the page is blank. When you give it back to me and I ask "Did you answer all the questions?" what do you say? Yes, No, or "There weren't any questions." (true, false, none)?
    
    I say "yes" because "Did you answer all the questions?" is a question that followed after "Answer the following questions:".
    
    > Has Rebol inspired this in all the other langs that have any/all now?
    
    I don't think so, unless Rebol was designed by [McCarthy](https://en.wikipedia.org/wiki/Short-circuit_evaluation) and Carl Sassenrath is Keyser Söze.

--------------------------------------------------------------------------------

On 2020-05-28T20:36:18Z, greggirwin, commented:
<https://github.com/red/red/issues/4469#issuecomment-635593326>

    > I say "yes" because "Did you answer all the questions?" is a question that followed after "Answer the following questions:".
    
    :^) What if I wasn't trying to trick you?

--------------------------------------------------------------------------------

On 2020-05-28T20:50:22Z, greggirwin, commented:
<https://github.com/red/red/issues/4469#issuecomment-635600425>

    Asking "What is the most meaningful result?" could lead to yet another twist, where `false/none` values cause `any/all` to return `false` and an empty block returns `none`.

--------------------------------------------------------------------------------

On 2020-05-28T20:52:30Z, greggirwin, commented:
<https://github.com/red/red/issues/4469#issuecomment-635601357>

    That will break code that checks for `none?` results. :^\

