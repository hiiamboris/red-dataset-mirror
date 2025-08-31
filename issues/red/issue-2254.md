
#2254: WISH: /types refinement of COPY should have typeset! argument.
================================================================================
Issue is open, was reported by meijeru and has 30 comment(s).
[status.reviewed] [type.task.wish] [type.design]
<https://github.com/red/red/issues/2254>

The docstring says

```
    /types => Copy only specific types of non-scalar values.
         kind  [datatype!]
```

Given the plural _types_ I would expect to find `kind [typeset!]` here.



Comments:
--------------------------------------------------------------------------------

On 2016-10-05T07:05:53Z, meijeru, commented:
<https://github.com/red/red/issues/2254#issuecomment-251598462>

    Anyhow, from inspecting the code I gather that the refinement is not operational yet ?!?

--------------------------------------------------------------------------------

On 2017-04-01T16:13:41Z, meijeru, commented:
<https://github.com/red/red/issues/2254#issuecomment-290929897>

    If this gets treated eventually, may I suggest to have a *block* of types *and* typesets as the argument to `/types`?

--------------------------------------------------------------------------------

On 2017-04-02T02:07:48Z, dockimbel, commented:
<https://github.com/red/red/issues/2254#issuecomment-290959738>

    The `/types` refinement is not implemented yet. 
    
    Why should it accept a block of types? Converting a block of types to a typeset is trivial, and will be done anyway internally (as matching with a list is highly inefficient).

--------------------------------------------------------------------------------

On 2017-04-02T08:05:31Z, meijeru, commented:
<https://github.com/red/red/issues/2254#issuecomment-290971484>

    So you say that if there is not an existing typeset for the desired combination, e.g.` [any-object! map!]`, one would have to `make` that typeset (and give it a name?) whereas the system can do it by itself... 

--------------------------------------------------------------------------------

On 2017-04-12T19:20:03Z, meijeru, commented:
<https://github.com/red/red/issues/2254#issuecomment-293680446>

    Ref #2167

--------------------------------------------------------------------------------

On 2019-09-24T12:28:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/2254#issuecomment-534535179>

    Let's take a closer look...
    
    The current behavior is as this:
    - `copy` copies the series given; all nodes contained inside still point to the same sub-series.
    - `copy/deep` copes the series given; then recursively copies every item of this series if this item's type is any of the `series!` typeset
    
    `series!` is: `[block! paren! string! file! url! path! lit-path! set-path! get-path! vector! hash! binary! tag! email! image!]`
    It includes `hash!`, `image!`, `vector!`
    It does not include `object!`, `error!`, `map!`, `port!`
    
    R3 takes `/types` as `typeset! datatype!`. Here's how it behaves:
    ```
    >> t: copy/types/deep s: [a [b "c"]] string!
    >> same? s/2/2 t/2/2
    == true
    >> t: copy/types/deep s: [a [b [c]]] block!
    >> same? s/2/2 t/2/2
    == false
    ```
    `/types` decides not only what types to *copy* but also what types to *visit*. And to think of it, there's no other way, since if we don't copy `[b "c"]` block, we can't copy `"c"` inside of it without modifying the original.
    
    Now let's think a bit.
    
    Regarding `/types` argument... IMO `copy/deep/types` becomes less useful without types included in the `series!`. I would expect one to either:
    1. narrow the `series!` typeset by removing one or a few types from it (e.g. my strings or images are all constants and I don't want to copy them)
    can be done as `exclude series! make typeset! [types to exclude..]` or `series! xor make typeset! [...]`
    2. extending it by one or a few types (e.g. I hold data in objects and I want all objects copied - with all the series they may contain)
    can be done as `union series! make typeset! [...]` or `series! or make typeset! [...]`
    3. a combination of 1 and 2
    
    Question is: how do we express this (combinatorial by it's nature) behavior using a block? Maybe it's better to diverge from Rebol and split `/types` into two refinements - one will add types to `series!`, another will remove them (e.g. `/also` and `/omit`). I consider this way more expressive than `/types` as it is.
    
    Next question: should we allow both `object!`, `error!`, `port!` and `map!` types to be included into the `/types` argument?
    
    And third question: if we encounter scalar types in the `/types` argument, should we ignore these or raise an error?

--------------------------------------------------------------------------------

On 2019-09-27T22:42:31Z, greggirwin, commented:
<https://github.com/red/red/issues/2254#issuecomment-536118314>

    First, *very* nice analysis @hiiamboris. Thanks for that.
    
    I agree that typeset support will add a lot of value here. It also makes sense to me for the arg to accept a block and make a typeset from that. At least I don't see a reason *not* to do that. We do it in func specs, after all.
    
    My first reaction to `/also /omit` is mixed. You're still doing `union/exclude` math in your head. They make those changes explicit and "active", but have the implicit `series!` check you have to keep in mind. Making the `/types` arg the entire rule to apply makes things completely explicit and declarative. As your example shows, it's likely people will have coarse rules to apply, so building a typeset once is the way to go there. 
    
    All copyable types should be supported.
    
    I'm OK, with letting `copy` itself do the enforcement on values. Though we could create a `copyable!` typeset... 

--------------------------------------------------------------------------------

On 2019-09-28T07:18:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/2254#issuecomment-536161652>

    Being explicit is good. But compare these for readability (scenario 1 above):
    `copy/deep/types ... exclude series! make typeset! [image!]`
    vs
    `copy/deep/omit ... image!` or
    `copy/deep/omit ... [image! any-string!]`
    
    To be clear, I'm not saying it's clearly a better way. I'm just inviting you to look from another perspective and weigh what it gives and takes.
    
    @greggirwin I didn't get this next one, sorry :)
    > I'm OK, with letting copy itself do the enforcement on values. Though we could create a copyable! typeset...
    
    Do you mean, if we encounter an `integer!` in the typeset, we silently skip it?
    
    Here's a fourth question: `/types` without `/deep` - should raise an error? or should it just pass the original series untouched? or, like R3, just pretend the `/types` refinement isn't there at all? (I'd prefer an error)

--------------------------------------------------------------------------------

On 2019-10-05T21:48:45Z, greggirwin, commented:
<https://github.com/red/red/issues/2254#issuecomment-538691646>

    I understand the `/also/omit` perspective, and if you inline all the calls, of which there are many, it states the intent directly. My instinct says that the specs on what you want to copy are going to be more global than local. i.e., you're not likely to have different copy rules inlined in different funcs. Your goal will be to do the same thing consistently throughout an app. That means either having wrapper funcs or writing declarative rules/configs.
    
    It's an interesting thought experiment. The flexibility that could be brought to bear with this kind of detailed control. I don't want to go off track, but we could build examples for structured/parse-based copy specs. It's a subset of general transformation, which would be even better.
    
    > Do you mean, if we encounter an integer! in the typeset, we silently skip it?
    
    Yes. If you pass an integer as the `value` arg to `copy`, it will catch that and throw an error. Internal integers (all non-copyable values) are still skipped as they would be. 
    
    > Here's a fourth question: /types without /deep - should raise an error? or should it just pass the original series untouched? or, like R3, just pretend the /types refinement isn't there at all? (I'd prefer an error)
    
    What if `/types` also means `/deep`? Change the `/types` doc string from:
    
    > Copy only specific types of non-scalar values
    to 
    > Copy only specific copyable values (implies /deep)
    
    If we don't want that, because using both is more explicit, an error does seem better.

--------------------------------------------------------------------------------

On 2019-10-06T06:12:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/2254#issuecomment-538715614>

    > Yes. If you pass an integer as the value arg to copy, it will catch that and throw an error. Internal integers (all non-copyable values) are still skipped as they would be.
    
    And if I pass the `integer!` type into the `/types` refinement: `copy/deep/types src make typeset! [integer!]`?

--------------------------------------------------------------------------------

On 2019-10-06T07:30:38Z, greggirwin, commented:
<https://github.com/red/red/issues/2254#issuecomment-538719781>

    It should ignore it. 

--------------------------------------------------------------------------------

On 2020-04-27T12:24:48Z, Oldes, commented:
<https://github.com/red/red/issues/2254#issuecomment-619953409>

    @hiiamboris isn't this R3 example correct?
    ```rebol
    >> t: copy/types/deep s: [a [b "c"]] string!
    >> same? s/2/2 t/2/2
    == true
    ```
    Because I think that you cannot copy the string inside the block without also copying the block, can you?

--------------------------------------------------------------------------------

On 2020-04-27T12:58:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/2254#issuecomment-619969080>

    @Oldes Technically, yes. That was my conclusion as well. What I find debatable is whether /types should override the default typeset or complement it.

--------------------------------------------------------------------------------

On 2020-04-27T13:59:50Z, Oldes, commented:
<https://github.com/red/red/issues/2254#issuecomment-620004906>

    I think it should override.

--------------------------------------------------------------------------------

On 2020-04-28T02:38:28Z, greggirwin, commented:
<https://github.com/red/red/issues/2254#issuecomment-620342586>

    - Typeset support +1. 
    
    - Block support +1. We do it in func specs.
    
    - Create a `copyable!` typeset.
    
    - `copy/deep/omit ... image!` -1 because `/omit` reads like "leave out images from the copy."
    
    - `copy/deep/also ... image!` -1 because `also` is a func with non-obvious behavior. In this context is can read like "Copy/deep, but also do X"
    
    - Non-copyable values: If you pass one as the value arg to copy, it will catch that and throw an error. Inside a copyable non-copyable values are still skipped as they would be.
    
    - `/types` without `/deep` should raise an error.
    
    - A non-copyable type for `kind` ...my initial thought was to ignore it, but now I think an error is best here. 
    
    - Don't add more refinemnts (`/omit /also`). It doesn't stop people from doing anything, won't break anything if we add them later, and lets us see how it's used in real life, and who complains.

