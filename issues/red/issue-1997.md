
#1997: Empty issue! doesn't lex and throws bad error
================================================================================
Issue is closed, was reported by greggirwin and has 18 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/1997>

```
red>> #
*** Syntax error: invalid {"#"} at none
*** Where: do
red>> print #
*** Syntax error: invalid {"nt#"} at none
*** Where: do
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-16T10:59:50Z, dockimbel, commented:
<https://github.com/red/red/issues/1997#issuecomment-226453859>

    Issues are word-like in Red and R3, so empty issues are not accepted.
    
    Here is how R3 handles them:
    
    ```
    >> #
    == none
    
    >> load "[#]"
    == [none]
    ```
    
    We have a plan for having both issue-as-word and issue-as-string types, though this requires some more studying. See https://github.com/red/red/issues/380 and https://github.com/red/red/issues/1470.

--------------------------------------------------------------------------------

On 2016-06-16T15:32:37Z, greggirwin, commented:
<https://github.com/red/red/issues/1997#issuecomment-226522533>

    I'm good with empty issues not being valid. I remember old chat on word v. string issue types, and I think keyword!/issue! is a viable solution. The problem comes from GUIDS or hash digests starting with letters. The big question is what marks the end of an issue, which is where the type duality gets tricky, because ## is a handy marker, which is now not valid, unless ## is the sigil for issues and # for keywords, or vice versa, except we lose the ability to handle things like #380 #1470 refs as done here, which leads back to the leading alpha solution.

--------------------------------------------------------------------------------

On 2016-06-16T16:03:01Z, dockimbel, commented:
<https://github.com/red/red/issues/1997#issuecomment-226531884>

    Agreed about ## usefulness. So do you think that leading alpha as discriminator between issue! and keyword! would work well enough?

--------------------------------------------------------------------------------

On 2016-06-16T16:43:05Z, greggirwin, commented:
<https://github.com/red/red/issues/1997#issuecomment-226543057>

    Probably. We just need to write some guidelines so people can avoid serious problems. e.g. you design a system that uses issues as keys which are git SHA-1 digests. All lexically valid, but some become keywords if you just LOAD them. All the details are magically hidden from you, and everything is great. Then you get a "symbol table full" error at some point and your data no longer loads. Or you design a system using hashtags and find that some behave differently because they start with non-alphas. Many ways around it, people just need to know the rules.
    
    The general design question is whether you trade off the general applicability of the string type to optimize the subset which is keywords, or if you can really hide all the details magically. And though we aren't to the point of considering bigger datatype changes, similar rules might apply to an @ref at!/reference! type should you decide to add one.

--------------------------------------------------------------------------------

On 2016-06-16T16:51:44Z, dockimbel, commented:
<https://github.com/red/red/issues/1997#issuecomment-226545364>

    Good points about digests and hashtags usage. So the safest and most versatile option for users would be to keep issue! as a string-like value (same as in R2), and find other ways to speed up lookups when used as keywords (making lookups in a hash! or map! maybe).
    
    `@ref` is in my todo-list of new datatypes, just not sure how to name it (name!, label!, ref!, ...?)

--------------------------------------------------------------------------------

On 2016-06-16T17:12:08Z, greggirwin, commented:
<https://github.com/red/red/issues/1997#issuecomment-226551036>

    My thought as well, hoping the optimization isn't too hard, since it may be used a lot in the future when building dev tools (and Red itself).
    
    I could write at length about why, but I think `reference!` is the best choice for the type name. `Ref!` if you want it short and won't be confused too much with `refinement!`.

--------------------------------------------------------------------------------

On 2016-06-16T17:26:04Z, dockimbel, commented:
<https://github.com/red/red/issues/1997#issuecomment-226554812>

    I think adding support for map! and hash! in Parse would be enough to cover my needs for fast lookups on issue! values used as keywords.
    
    For `@ref` literal format, what about `annotation!` as it's often used in programming for that purpose in many languages? Though, `reference!` would be a valid name too. I don't have strong inclination towards any particular name for this one. If we could find a short name, that would be better (as we want to keep function spec blocks as short as possible, `refinement!` is quite painful to type, I would have preferred `option!`...though the meaning is more accurate with `refinement!`)

--------------------------------------------------------------------------------

On 2016-06-16T20:31:01Z, greggirwin, commented:
<https://github.com/red/red/issues/1997#issuecomment-226604660>

    Agreed on `refinement!` being a pain to type. Fortunately not used much IME. `Ref!` is probably OK.
    
    `At!` would be the shortest, but I think is too confusing with the `at` function. 
    
    I like _reference_ because it is general, and `@` is very general purpose. `Annotation!` is too specific. Here's where I could write a lot.
    
    In natural language, and the physical world, "at" could refer to a location, position, a time (including things like "at this time", "at once", or "at your convenience"), or even a refinement (e.g. speed of sound at 72F). In digital terms, the most recent coercion is @names, which is sort of like the old "to the attention of" usage, but you could refer to a value at a location (word), or like an annotation to draw attention. Then you have things like locations in files (byte or row+col), docs (page, para) or images (pair!), coordinate, or in URLs which may lead to endpoints.
    
    In my mind, the common trait is that they all _refer_ to something. Or that's the closest thing I've found anyway.
    
    If `@whatever` is just an annotated string, effectively, like `file!` or `issue!`, people will press it into service in many ways. Yes, the `file!` parallel leads to a question of quoting, which `issue!` can't do because of `char!`, so I say don't worry about that, but now I'm really OT. :^)

--------------------------------------------------------------------------------

On 2016-06-16T20:42:12Z, greggirwin, commented:
<https://github.com/red/red/issues/1997#issuecomment-226607618>

    I think I considered `at-ref!`at one point, should look for my old notes, but the only hyphenates we have today are for `let- get- set-`. I think `typeset!` is the only one that could add it, becoming `type-set!`, but not bothersome to me. 'char!`,`op!`, and`paren!`, are the current abbreviated type names.

