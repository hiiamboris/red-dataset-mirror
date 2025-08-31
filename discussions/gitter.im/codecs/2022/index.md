# Archived messages from: [gitter.im/red/codecs](/gitter.im/red/codecs/) from year: 2022

## Tuesday 4th January, 2022

greggirwin

[01:36](#msg61d3a4acd41a5853f931e229)@rebolek when would you like to do a PR for the markup codec? I'll try to review the code shortly, so we can sync up on anything there.

rebolek

[06:05](#msg61d3e3b482a4667b255b0c17)@greggirwin in a day or two, I’ll just review the code and do some cleanup. Should be really fast.

greggirwin

[19:14](#msg61d49c929a33545406075f6a)Sounds good.

## Wednesday 5th January, 2022

rebolek

[08:13](#msg61d55335e1a1264f0a3e9bf1)Found a bug.

[09:03](#msg61d55ed646529077f56c0bb8)@hiiamboris in your format, how should be stored? Just `tag` or `tag []` ?

hiiamboris

[09:54](#msg61d56aef9a3354540608e08e)`tag []`, so `tag/text!` would eval to none

rebolek

[11:08](#msg61d57c12e1a1264f0a3ef026)`text!`? it’s not `!` anymore? :-)

hiiamboris

[11:08](#msg61d57c325dc6213cd4c7b0e2)I like `!` but Gregg vetoes it :)

rebolek

[11:09](#msg61d57c546d9ba23328a759e9)`!` is still in code ;)

hiiamboris

[11:09](#msg61d57c7a5ee4df335acc1d83)Good! :)

rebolek

[11:10](#msg61d57c9746529077f56c4c15)Anyway, it’s user-configurable, so even if Gregg gets it changed to `text!`, you can override it.

pekr

[11:10](#msg61d57c9b5dc6213cd4c7b1f4)... not sure it's ready for release, if those things are not agreed-upon :-)

rebolek

[11:11](#msg61d57cc5d41a5853f9357e60)It would be released as alpha. Thanks to its modular nature, more formats may be added if we find a better way to represent XML data

hiiamboris

[11:11](#msg61d57cd85ee4df335acc1e72):+1:

rebolek

[11:12](#msg61d57d03d143b14f83000f83)@pekr it’s a one-line change, so can be done really at the last moment.

greggirwin

[19:52](#msg61d5f6e92a210c38c1b360dd)I still veto `!`. Please change it. As @rebolek notes, people can override it if they want for their own uses. For standard Red work, it should not be overridden.

[19:53](#msg61d5f71f6d9ba23328a87215)Writing up some docs will also help catch things that may have been changed many times in chat here.

[20:15](#msg61d5fc585ee4df335acd4cfa)For reference @rebolek: https://gitter.im/red/codecs?at=61bcf6d4c642515af33c5f43

## Thursday 6th January, 2022

rebolek

[05:55](#msg61d68441f5a3947800ef36b2)Ok, I’ll change it.

I’ve re-read that post and let me address few things there:

&gt; We won't change the lexer unless it's a lexer bug, but I think issues for attrs in boris are problematic only in two use cases (correct me @hiiamboris), which is 1) setting them, because you can't use them literally in a set-path.

IMO this is a bug. Why is it possible to use them in `path!` and not in `set-path!`? What’s the rationale here?

&gt; They can't nest, so will always be the last thing in a path.

I don’t see this as a problem, the way we would use them here, they always would be last thing in a path.

&gt; 2) is accessing an index in them. e.g. .../#name/1.

Same as above, index doesn’t make much sense here

&gt; You can still use indirection for them. Is that acceptable, or do we need to use another type?

For me, these are acceptable trade-offs.

[08:02](#msg61d6a2155dc6213cd4ca0e6b)&gt; Writing up some docs will also help catch things that may have been changed many times in chat here.

I wrote an overview of the implemented formats: https://gitlab.com/rebolek/markup/-/blob/main/README.md

[09:17](#msg61d6b3bb5dc6213cd4ca31c0)Anyway, the default sigil in `compact` format changed to `text!` and keywords in `key-val` format are now `issue!`

[09:17](#msg61d6b3c65ee4df335aceae4f)Also, all remaining bugs should be fixed I hope.

[09:19](#msg61d6b414d41a5853f9380085)There are some minor improvements left to do but it it seems to be ready for PR.

[09:20](#msg61d6b4609a335454060b89c0)Also, I was contacted by Danny Murrilland, who wrote http://www.rebol.org/view-script.r?script=rebol-dom.r which I’d like to review once I’m done with the minor improvements.

[11:27](#msg61d6d22f6d9ba23328aa18f3)I’ve made a pull request but probably it would need some changes still, here’s the question:

[11:29](#msg61d6d291526fb77b31668609)the codec is in `XML` context. Other codecs are in anonymous contexts. This context has a name so it’s possible to change some settings. I can probably add a function, something like `xml-settings` that would take care of it and let the context be anonymous. What do you think?

hiiamboris

[11:56](#msg61d6d8e3526fb77b316692ba)it's best to put settings into `system/codecs/xml` I think

pekr

[11:56](#msg61d6d8ea2a210c38c1b51d25)Xml-settimgs would sit in a global context? I don't like exposing thing, which have some abstarction (codec system), this way. Already did not like Rebol's do-service, do-browser. I lik3 polymorphism, but am also aware of evetual slow down by overloading functuons that way ...

[11:57](#msg61d6d9195ee4df335acef7e1)Maybe general get-codec name param?

hiiamboris

[11:58](#msg61d6d9659b470f3897521bca)btw it's rather strange that `system/codecs/json` uses capitalized names in it

[11:59](#msg61d6d985742c3d4b21836962)maybe they come from the header..

rebolek

[12:04](#msg61d6dae3d143b14f8302de22)@pekr yes, it would be in global context.

[12:06](#msg61d6db3e5ee4df335acefc33)@hiiamboris CSV also, but I copied it from JSON :-)

[12:25](#msg61d6dfc5e1a1264f0a41ce88)Hm, I’ve got compilation error on this.

[12:49](#msg61d6e5725ee4df335acf1139)Fixed.

greggirwin

[21:38](#msg61d76154526fb77b3167cee4):+1:

\- "Be aware that /as checks for invalid format names but if you override the format name directly, there is no check and you’ll end up with an error." To clarify, `/as` catches the error earlier, as it's checked when set, but setting the format name produces the same \*kind* of error, just when the data is loaded, correct? That is, you don't get a different error or crash.

\- `red-keys?` sounds funny to me. If that's the default, and the norm, would it be better to call it out as `str-keys?`? Then `unless red-keys? ...` (the two places it's used) become `if red-keys? ...` which is also cleaner. Also make sure it is doc'd outside `triples`, since it applies to `key-val` as well.

\- :+1: for having commented examples of each format right there. Maybe pull the XML source out of the `triples` section, since it's used for all of them. Or included it in the other sections for direct comparison of input and output.

\- "Text content is prefixed with a special sigil (by default !)," That's going to be `text!` instead of `!`, correct? The code does have that now. Also probably important to note why the sigil is used, because `!` can't appear in XML content, so it avoids conflicts.

\- Thoughts on a better name than `text-sigil`? Simply because "sigil" denotes a single symbol, rather than a name, key, or marker. This one does apply only to `compact`, so `text-key` is \*slightly* confusing as it looks like it applies to `key-val`.

\- Maybe `include-meta?` instead of just `meta?`.

\- I have to go back and look at earlier format chat now, because I think `key-val` is not quite right in the example.

```
version #text none #attr [number "$Revision$"]
        language #text "Czech" #attr [type "root"]
        markup #text none #attr none
```

Should be

```
version [#text none #attr [number "$Revision$"]]
        language [#text "Czech" #attr [type "root"]]
        markup [#text none #attr none]
```

Shouldn't it? Otherwise it's not key-val all the way down. And I don't remember if we decided `none` values would exclude their associated key (and the `none`). e.g.

```
version [#attr [number "$Revision$"]]
        language [#text "Czech" #attr [type "root"]]
        markup []
```

I do remember an issue being `x/#attr/z` may fail if `#attr` isn't there, but it will also fail if it's `none`.

\- @rebolek thanks for making the `load/to encode/decode` consistent with the others. :+1: I was looking at the old code and going to comment, but then checked the PR code and it's good there.

[21:45](#msg61d762efd41a5853f9398626)I'm OK with capitalized text, especially acronyms, as humans use them.

[21:57](#msg61d765ba46529077f5707a16)I don't like the idea of `xml-settings`, but we should be consistent. In the other codecs, you need to use `load/to` to spec alternative options. However we decide to do it, we should be consistent. Each codec can have an `options` area, but that means changing CSV and JSON now too. Doing it with refinements on `load/to` means a couple more for the XML loader. A third option is an `/options` refinement for `load/to` funcs, to subsume others. Not as nice for `help` that way.

My gut says to make XML (and HTML when we add that) work like CSV and JSON. But if we \*do* want to change it, better now than a year from now. In that case, XML is the guinea pig and we ask for feedback before changing JSON and CSV.

[21:59](#msg61d7664982a4667b25624e18)We also have the issue of PitS vs PitL. As soon as you introduce a global state or switch, other code can mess with it when you're not looking in a PitL scenario.

[22:05](#msg61d767a45dc6213cd4cbc4a0)In this case, we can also note for early release that the default format choice isn't frozen yet. If we discover in the next two months that `compact` or `key-val` is a big win for Red internally, in how we want to standardize access, we can change that if we do it before too long.

[22:08](#msg61d76851742c3d4b2184bca4)@rebolek I noted the `key-val` format issue \[here](https://gitter.im/red/codecs?at=61bcf8369a9ec834fbd51c45) before.

[22:14](#msg61d769c0bfe2f54b2e0623d9)Also, can someone remind me why `#text/#attr` (issues as keys) are used, rather than words for `key-val`? It's something we'll be asked, so need to doc it, and I don't remember. We need to note it for `compact` too, but I know why they're used there.

## Friday 7th January, 2022

greggirwin

[04:26](#msg61d7c0da526fb77b31688364)Correction to the above `red-keys?` note: Should be `if str-keys? ...`

rebolek

[07:01](#msg61d7e553bfe2f54b2e070560)&gt; To clarify, /as catches the error earlier, as it's checked when set, but setting the format name produces the same kind of error, just when the data is loaded, correct?

Setting the format directly would produce a different error, but that was fixed now and the check is the same for both methods. Now it returns "unknown format" error.

&gt; `red-keys?` ...

I’ll check if it’s in the docs, I am open to suggestions regarding naming, what about `words?`

&gt; Maybe pull the XML source out of the triples section

Yes, I’m planning to do that.

&gt; That's going to be text! instead of !, correct?

Yes, it hasn’t been fixed in the docs yet.

&gt; Thoughts on a better name than text-sigil?

`mark`? I don’t know, if anyone has a beter idea, I would be glad.

&gt; Maybe include-meta? instead of just meta?.

Maybe, but’s more of an internal state, it’s controled with a refinement `/meta` and for the refinement I prefer the shorter variant.

&gt; I think key-val is not quite right in the example.

Ah, maybe I misunderstood it earlier, I will change it.

[07:06](#msg61d7e6726d9ba23328ac5803)&gt; Also, can someone remind me why #text/#attr (issues as keys) are used, rather than words for key-val?

Well, words can be confused with tag names. For that reason, keywords were prefixed with a dot - `.text` but I don’t find it very Reddish. I can change it back but I still prefer a different type for keywords.

[08:37](#msg61d7fbae5dc6213cd4ccd216)@greggirwin I made changes to the \`key-val! format and this is current output:

[08:39](#msg61d7fc5582a4667b256363ec)

```
[
  identity [
    #attr none
    #text "Version and language^/"
    version [
      #attr [number "$Revision$"]
      #text none
    ]
    language [
      #attr [type "root"]
      #text "Czech"
    ]
    markup [
      #attr none
      #text none
    ]
    #text "Ending^/"
  ]
]
```

[08:40](#msg61d7fc8c742c3d4b2185d47b)The question is if we want to store empty text and attributes (in fact, not storing empty text is easier, it needs special logic).

[08:43](#msg61d7fd277842bd3ca933dae0)And another question is, if we are using keywords for attributes and text, why not use them for child elements too?  
Something like:

````
```
[
  identity [
    #attr none
    #text "Version and language^/"
    #children [
      version [
        #attr [number "$Revision$"]
        #text none
      ]
      language [
        #attr [type "root"]
        #text "Czech"
      ]
      markup [
        #attr none
        #text none
      ]
    ]
    #text "Ending^/"
  ]
]
````

hiiamboris

[09:44](#msg61d80b726d9ba23328aca3b3)Shouldn't it be '#children none' for the rest of elements?

rebolek

[09:51](#msg61d80d1fd41a5853f93ac7a1)good point

[09:51](#msg61d80d32d143b14f83056b71)or empty keywords could be roemoved

greggirwin

[19:01](#msg61d88e116d9ba23328adcc2e)- On `red-keys?` or `words?`, what is the \*downside* to `str-keys?`?

\- I thought about `text-mark` as well. Any thoughts @hiiamboris? `compact-text-key` says it exactly, but is a bit long. It's only used about 4 times though. Maybe `text-mark` is good enough.

\- I'm fine with `/meta` for the refinement name, but `meta?` alone reads like "Is there metadata in the content?". Again, only used a few places.

\- What about `text!/attr!`? That matches `compact`, where issues are used only for attr names, though also isn't idiomatic because they look like datatype names. OTOH, they \*are* keys for specific types of data in the content, so it's justifiable that way. @rebolek if you and @hiiamboris really want issues here, see if Nenad agrees that issues in paths are lexer-bugged. It still gnaws at me that we have to do this:

```
>> blk/identity/version/(#attr)/number
== "$Revision$"
>> blk/identity/version/(#attr)/number: "$Rev$"
== xyz
```

\- For `key-val`, there is no technical problem caused by removing empty keywords, correct? If so, let's do that.

\- Just had a thought, in the docs, maybe include the metadata in example output. Could be at the end, to keep the first examples cleaner.

[19:08](#msg61d88f92e1a1264f0a454f1a)@rebolek what is the win for using `#children`? I get that it makes all keys for an element one of `[text! attr! children!]`, and makes the child nodes explicit, but it's going to make path access quite a bit uglier I think. Imagine just one more level than in the examples. We go from `blk/identity/version/detail` to `blk/identity/children!/version/children!/detail`.

Collecting all children is marginally easier, but we'll provide examples, and likely helpers, out of the box, so people can do that.

hiiamboris

[19:11](#msg61d890685ee4df335ad28eb6)`text-mark` is ok with me, as well as `text-symbol`

[19:12](#msg61d890867842bd3ca9351a30)`text-marker` too

greggirwin

[19:14](#msg61d89104bfe2f54b2e086bba)`symbol` is kind of like `sigil` in meaning. I'm OK with `text-mark` or `text-marker`.

hiiamboris

[19:15](#msg61d8914ebfe2f54b2e086c25)`symbol` comes from association with \[`red-symbol`](https://github.com/red/red/blob/43609421b8b3612d8d882719650d5150f657d17f/runtime/datatypes/structures.reds#L162)

[19:16](#msg61d891897842bd3ca9351c86)though this term is from R/S, not Red

greggirwin

[19:17](#msg61d891b66d9ba23328add4a4)Ah, got it. Since we're talking about high level structures here, and we already struggle with when to use `[key word field name etc.]`, let's go with what fits this context best.

hiiamboris

[19:17](#msg61d891c982a4667b2564a81c):+1:

greggirwin

[19:18](#msg61d8920abfe2f54b2e086da0)Thanks for all your work on this @rebolek. :+1: It's exciting to have it so close!

zentrog:matrix.org

[22:36](#msg61d8c06f7842bd3ca93582e7)@greggirwin: attributes are not supposed to repeat inside elements, so the `blk/identity/version/(#attr)/number` syntax shouldn't be much of a concern. I think it might actually make the xml invalid if they do.

greggirwin

[23:03](#msg61d8c6ca2a210c38c1b938f0)What I mean is that we have to use parens in paths where `#text/#attr` are used (outside a tailing read), because of how issues are currently lexed. We'll get used to it, and we could argue that those values are special, and it makes them stand out in the path, so it's not the end of the world. Just leave a funny taste in my mouth at the moment.

## Saturday 8th January, 2022

rebolek

[06:46](#msg61d9334a9a3354540610aa7e)&gt; what is the downside to str-keys?

One downside I can see is the shortened form. `string-keys?` would be find IMO.

&gt; `text-mark` is ok with me, as well as `text-symbol`

Ok, `text-symbol` is it.

&gt; `meta?` ...

No problem, I’ll change it.

&gt; What about text!/attr!

I need to check if they aren’t valid XML keywords. If yes, we can’ use them. That’s why I want to use a different type so this kind of problems can’t happen.

[06:48](#msg61d933a146529077f573f994)I was looking at `ref!` also. It’s buggy in paths too but in a different way than `issue!`:

```
>> a: [@a [a]]
>> a/@a
== [a]
>> a/@a/1
== none
```

[06:52](#msg61d934a7bfe2f54b2e09a52b)Or "buggy", it takes `@a/1`as one value `"a/1"` which may be a good thing I guess.

[06:53](#msg61d934f1526fb77b316b5e0f)Ok, I think I have a solution, `tag!`:

```
>> a: [<b> [c]]
>> a/<b>
== [c]
>> a/<b>/1
== c
```

[06:54](#msg61d9350b9a3354540610ad2e)No need for parens.

greggirwin

[17:37](#msg61d9cbdc5dc6213cd4d05760)I'm fine with `string-keys?`, but `str` is almost always an acceptable abbreviation IMO because it's so common. Same with `obj` or `blk`.

I think the `!` makes `text!/attr!` illegal in XML, per earlier chat, but good to confirm.

Yes, refs being strings raises that issue. Good thing to note in docs. We should also ping @dockimbel on it.

We already talked about tags (though it's been a while). I don't like them because we're coming from markup and I think they'll be confusing as keys.

[17:40](#msg61d9cc772a210c38c1bb04dd)Consider that we're then taking all the things that \*are* tags in the XML and making them \*not* tags, but doing exactly the reverse for text and attrs.

rebolek

[18:45](#msg61d9dbcebfe2f54b2e0aceb3)I understand that, I’m just trying to find a fitting datatype.

[18:47](#msg61d9dc5f5dc6213cd4d075b7)It seems that `!` is illegal in tag names, so let’s go with `text!` and `attr!` for now.

[18:49](#msg61d9dcb12a210c38c1bb22f7)`str-keys?` - why not, I don’t have any strong opinions here.  
What's more important, is how to deal with these additional settings.

hiiamboris

[18:52](#msg61d9dd649b470f3897582213)generic `system/codecs/(name)/options` map/object?  
though global state.. bad

greggirwin

[18:52](#msg61d9dd7d742c3d4b21896c8e):+1: Yes, the option handling is key. (no pun intended)

Comments on my thoughts \[here](https://gitter.im/red/codecs?at=61d765ba46529077f5707a16)

[18:53](#msg61d9dda42a210c38c1bb25d0)That's its Achilles' Heel @hiiamboris, I agree.

hiiamboris

[18:54](#msg61d9dddebfe2f54b2e0ad287)let's go for /options refinement then

greggirwin

[18:54](#msg61d9ddf39a3354540611da9f)The way other systems work around that is that each working codec can be a separately config'd instance. To do that, we need to be able to `make` them.

[18:57](#msg61d9dea7e1a1264f0a47b79f)The other thing that happens there is that `load/save` don't work transparently on file/url values, but `/as` is already used there for the source format, not the resulting data structure. :^\\

[18:59](#msg61d9df0a46529077f575311e)This is where we have to guess about whether codecs we have now, and others which may be added, will have enough `options` to make that a win over direct refinements.

hiiamboris

[19:04](#msg61d9e030e1a1264f0a47bae0)Are you suggesting to add refinements for every future option?

rebolek

[19:15](#msg61d9e2b49a3354540611e39f)&gt; let's go for /options refinement then

I’m inclined to think it’s the best solution.

pekr

[19:54](#msg61d9ebdc5dc6213cd4d0921c)I am not sure I agree to `text!`, unless this is a real datatype.

greggirwin

[20:08](#msg61d9ef4f9a3354540611f949)@pekr, suggest something better. This space, unfortunately, has a lot of compromise involved. It needs to be something that can't appear in the XML source.

[20:11](#msg61d9efd8bfe2f54b2e0af13f)&gt;Are you suggesting to add refinements for every future option?

I'm saying that may be the best choice, if the number of options is small. No, it's not infinitely extensible, but we can see with XML what happens when you go that way. :^) So let's mock it up for XML, JSON, and CSV. Just the func specs. What do they look like with refinements (i.e. no changes to CSV and JSON), and what do they look like with `/options`, including sample calls.

hiiamboris

[20:13](#msg61d9f064d41a5853f93e7079)Point of `/options` is that it's future-proof and extensible by anyone. OTOH if there are 2-3 similar options, adding a refinement shortcut for that option makes sense.

greggirwin

[20:17](#msg61d9f15c46529077f5755209)&gt; Point of /options is that it's future-proof and extensible by anyone.

And this is where we, as designers, have to decide if that falls into YAGNI territory.

rebolek

[20:50](#msg61d9f92a46529077f5756172)The problem with the refinements is that they would apply only to a specific format, not to all of them.

greggirwin

[21:15](#msg61d9fee846529077f5756b06)Of course, just like other mutually exclusive refinements. And a downside to `/options` is that `help` won't know what to do with it. Hence, I suggest mocking things up.

zentrog:matrix.org

[21:17](#msg61d9ff5c82a4667b256734d7)Is the idea to have a global options object with the defaults and to make a custom one from that with changes?

greggirwin

[21:18](#msg61d9ffb7f5a3947800f60a0b)That's a bigger shift. Right now it's the choice between specific refinements and a more general `/options` refinement for `load-xml`, etc.

[21:19](#msg61d9ffecd143b14f830920ac)Bigger because we don't have a `make codec` concept, or how that would work with `load`, while still providing option locality for safety.

Oldes

[22:10](#msg61da0bdd7842bd3ca937ce8f)@zentrog:matrix.org you mean something global like... `system/options` ¿-)

zentrog:matrix.org

[22:11](#msg61da0c0b5ee4df335ad54d26)I thought /options would take an object (or similar). It would be nice to have a template object to base it on. Is that not how it would work though? I don’t think it would need to make the whole codec

[22:12](#msg61da0c5d5ee4df335ad54de9)Yes, something global to use as a template. It could also serve as global settings, though that introduces some risk as others have mentioned

[22:13](#msg61da0c9d82a4667b25674dcc)It would still be missing some documentation on what the settings do though…

## Sunday 9th January, 2022

greggirwin

[00:33](#msg61da2d4d2a210c38c1bbae20)I hope we'll see new tooling options, including making `help` smarter, so rich interfaces like objects and dialects become first class citizens like specs and refinements are today. That will be \*very* important in distributed message based systems, APIs, and interrogative interfaces (related to, but much more than autocomplete.

pekr

[09:43](#msg61daae5abfe2f54b2e0c303d)@greggirwin I might agree. Just checked and `!`is a regular word char. As far as `type text!` does not return `datatype!` (which it does not), I am OK with that.

[09:47](#msg61daaf3d526fb77b316df879)I would just like to note, that since the R2, there is a concept of `system/standard`, which holds some templates. It was IIRC mainly used by networking - e-mail header, etc.

[09:49](#msg61daafc1bfe2f54b2e0c3262)@greggirwin I was always missing more clever/extensible help, which would allow to use some docs for stuff like dialects and objects. And btw - even Carl has planned for objects to eventually have headers: http://www.rebol.net/r3blogs/0350.html

greggirwin

[18:05](#msg61db23eb9a33545406140b3b)Yes, we also want to be able to vet that an object matches a spec, in terms of duck typing.

rebolek

[18:13](#msg61db25da2a210c38c1bd5cfd)@pekr that `datatype!` use exclamation mark at the end is just a convention, `datatype!` has no literal form, it looks like a `word!` and you need to check for a type to distinguish it.

## Tuesday 11st January, 2022

greggirwin

[18:09](#msg61ddc7ebe1a1264f0a4f8b82)@rebolek are you working on mockups for `/options` vs refinements, or are you waiting for me to do that? I will make time today if that's the case.

rebolek

[18:16](#msg61ddc97682a4667b256ed933)@greggirwin I have something cooked up, but not yet published, I’m going to push it to Git tomorrow if that’s fine.

greggirwin

[18:25](#msg61ddcb9dd41a5853f9462504)OK. Thanks.

## Wednesday 12nd January, 2022

rebolek

[12:01](#msg61dec30c742c3d4b21933d54)Options handling changed (currenlty in the markup repo only, will be posted to the PR later). I’ve implemented both options, refinements and `/with options` variant.

There are four refinements:

```
/meta
/strict
/str-keys
/mark txt-mark ; this one is for COMPACT format only
```

which is not that much but that number would rise if we add other formats.

Second option is to use `/with` refinement followed by block or map of changed options. Options are first initiated to default values and then overridden using refinements or user options block (map).

## Thursday 13th January, 2022

rebolek

[06:03](#msg61dfc0c95ee4df335ae11325)This is a more general question, not specific to XML codec, but related as I encoutered it here too.

Image this data:

```
data: [tag "content" none]
```

This should produce this XML:

```
<tag>content</tag>
```

However, currently it won’t because, as you can see above, `none` is not `none!` but a `word!`.  
And the question is: should we be strict and require `none!` here or should we be relaxed and accept `word!` also? In this particular case it’s not a problem, there can’t be `word!` in place of attributes, but I can think of a case where it would be problematic, if you’re really contemptible person and would name your tag .

greggirwin

[20:56](#msg61e0920482a4667b2574d27e)Thanks for fixing `to-xml` so I could test it. :^)

Using `none!` seems like a good idea here. It has more semantic meaning, and is safer. It's also what we get from the loader, so it's more consistent.

[21:20](#msg61e0979c5dc6213cd4de4d7c)Just to confirm @rebolek, the current XML codec is \*not* expected to handle HTML, correct? I have an old test that loaded %simple.html and the output is wonky, so I wanted to check.

[21:32](#msg61e09a529b470f38976607b8)On 07-Jan I said:

&gt; For key-val, there is no technical problem caused by removing empty keywords, correct? If so, let's do that.

Are there any technical reasons to keep them? In probing some loaded data, I think it will be a pretty big win to omit them.

[21:59](#msg61e0a0d07842bd3ca9453771)Remember, if we include them now, they are there forever. If we omit them now, we can always add them and not break anything.

## Friday 14th January, 2022

rebolek

[01:20](#msg61e0cfc3bfe2f54b2e18f456)&gt; the current XML codec is not expected to handle HTML, correct?

Correct. HTML is a similar but different beast. Let's slay them one by one.

&gt; Are there any technical reasons to keep them?

It just needs a bit of extra logic. Nothing special, I just need to do it. And I will.

greggirwin

[03:06](#msg61e0e8ca2a210c38c1c9a0da):+1:

[03:15](#msg61e0eabd46529077f583c352)I was hoping to get you and Boris more feedback today, but another task took priority. Have to deal with some business paperwork tomorrow, but should at least be able to say more on the codec options interface.

[03:31](#msg61e0eeaee1a1264f0a563785)Small consistency note. `put system/codecs` is at the bottom for XML and JSON, but at the top for CSV.

[03:39](#msg61e0f0755dc6213cd4df086f)@rebolek should `strict?` be in options?

[03:40](#msg61e0f0bb46529077f583cee7)I know we're mocking right now, so no change needed ATM.

If we use `/with` consistently in codecs, that will chagne CSV, which uses it just for dlm today.

[03:43](#msg61e0f1479a33545406206db8)Indentation is an interesting one, because we can't yet schema map/obj/block. So as a refinement, we can say it needs to be a string, but as an option field we have to doc, and the user has to look up, if it's a string, an int, or either.

[03:45](#msg61e0f1d86d9ba23328bee319)CSV has `/as-columns /as-records` today, but could be just `/as` with an arg, like XML.

pekr

[07:26](#msg61e125ad742c3d4b219852db)Yes, it should it be ideally unified ....

## Monday 17th January, 2022

greggirwin

[20:06](#msg61e5cc457842bd3ca94f1d01)- `default-opts` uses lit-words and logic words in a map. I actually  
can't get `load-xml` to work using `/with` for `format` no matter what  
I try. Logic options have to use `#[true]/#[false]`.

\- No `Strict` option yet. Just a TBD note.

\- When `/meta` is used with `compact`, meta `issue!` vals change to  
`ref!` vals. With `key-val`, using %menu.xml test data, the first  
`#xml` changes to `.xml` but `#PI` stays `#PI`.

\- We have some options for encoding, and most for decoding. With an  
`/options` approach, how do we make it clear which go with `to-xml`  
and which go with `load-xml`? Or that `indentation` is ignored if  
`pretty?` is not `yes`? Similarly, `text-mark` only applies to  
`compact`.

\- Is there anything else we need to consider, along the lines of  
`/meta`, that namespace or DTD support might add?

\- `to-csv` doesn't need `/as` because the datatype tells us the format.  
XML could only do that for `key-val`, but that means changing that loaded format to `map!`, which we didn't want to do for the overhead.

[20:12](#msg61e5cdbc2a210c38c1d2dd9c)We could change CSV `/with` to `/delim` or something, so `/with` is available as a future option. It's more specific in any case. CSV has a lot of options, and it's unlikely we'll add more. Similarly, XML having 3 emitter options and `meta+strict` covers a lot. I'm also OK with removing `/mark` for now. I think we need `/str-keys`, but @dander can weigh in, or @hiiamboris based on the ICU work, to say if how often it might be needed.

[20:15](#msg61e5ce6d82a4667b257f06dd)Example calls for comparison.

[20:17](#msg61e5ced42a210c38c1d2dfe6)Simplest call

```
print mold load-xml/as file 'triples

print mold load-xml/with file #(format: triples)

print mold load-xml/with file #(
	format: triples
)
```

Next simplest

```
print mold load-xml/as/mark file 'triples 'text!

print mold load-xml/with file #(format: triples  text-mark: text!)

print mold load-xml/with file #(
	format:    triples
	text-mark: text!
)
```

Most complex

```
print mold load-xml/strict/meta/str-keys/as/mark file 'triples 'text!

print mold load-xml/with file #(
	strict?:   #[true]
	include-meta?: #[true]
	str-keys?: #[true]
	format:    triples
	text-mark: text!
)
```

[20:18](#msg61e5cf16526fb77b31844a6f)These are predicated on `/with ... format` working, which I can't so far, per my message on Telegram.

[20:24](#msg61e5d06cd143b14f8320c3b6)After looking at this, playing with things, and I am sorry it took so long to get this posted, my gut says that refinements are the way to go. If we had a dozen options, or a high probability of getting to that number, `/with options` might be the way to go. But I think it makes the calls more verbose while at the same time being less clear and specific. The fact that it's bugged (or so I think) also tells me we have some more map/serialized/config thinking to do, and this turned out to be a timely, real-world, example.

Thoughts?

[20:26](#msg61e5d0f47842bd3ca94f2918)I can certainly see tripping over word vs lit-word values in maps vs objects vs blocks, which is a key part of that discussion. How do we make it easy to use them as safely as possible when they may be mixed or interchanged?

hiiamboris

[20:28](#msg61e5d1729a3354540629cc80)&gt; I think we need /str-keys

Well, Red words cover much more than XML element names. But words have exceptions. E.g. `Bh` is not a word. In ICU data I haven't encountered invalid words, but when I tried loading their .txt format (so, not XML-related, even though it's the same data) `Bh` was a problem for me.

[20:29](#msg61e5d1c16d9ba23328c81de6)I'm for `/with options` because I would hate to pollute general `load` with refinements from all codecs. Though `/as` should be there as both option (format) and refinement /as because it's just so often going to be used. OTOH it conflicts with `load/as` so maybe another name.

greggirwin

[20:30](#msg61e5d1d95dc6213cd4e8470c)I always forget about literal hex notation. Not sure I can convince @dockimbel to remove it, but I think it isn't a great fit for Red, and causes issues like this.

[20:31](#msg61e5d21182a4667b257f0f25)We aren't polluting `load` at all, only `load-*` specific funcs get the necessary refinements.

hiiamboris

[20:31](#msg61e5d23af5a39478000dac0e)OK and how does this work with `load/as .. 'xml`?

[20:32](#msg61e5d266526fb77b31845255)(I don't care how `load-xml` itself works, either way is fine)

greggirwin

[20:32](#msg61e5d26cd143b14f8320c862)Just maps to default `load-xml`.

hiiamboris

[20:33](#msg61e5d2a75ee4df335aecfd7d)Hmm I was thinking /with would propagate from `load` to it's receiving ends.

greggirwin

[20:33](#msg61e5d2af7842bd3ca94f2c85)All codec specific loaders map their `decode` to something internal for that codec.

[20:34](#msg61e5d2f19b470f3897700502)&gt; Hmm I was thinking /with would propagate from `load` to it's receiving ends.

But that also bloats `load`. Not in the func spec, but in being completely general, where do you look for options, etc.

[20:35](#msg61e5d32be1a1264f0a5f7b82)And `load` already has 7 refinements.

[20:44](#msg61e5d53d82a4667b257f168a)Hex literals live in the uncanny valley of words.

hiiamboris

[20:55](#msg61e5d7bb6d9ba23328c82974)Yeah. Agree it's a bad syntax.

## Tuesday 18th January, 2022

rebolek

[08:33](#msg61e67b619a335454062b2a9f) @greggirwin to be sure, are you testing the version in the `markup` repo or in the Red PR? Because the Red PR is updated less often. I am using the `markup` repo as the working place and occasionally I push the changes to the PR as I don’t want to pollute that branch with too many commits. If you want to test the latest version, use the `markup` repo, please.

[08:45](#msg61e67e46bfe2f54b2e23ef77)&gt; default-opts uses lit-words and logic words in a map.

That’s a copy&amp;paste issue I guess. I look into it.

&gt; I actually can't get load-xml to work using /with for format

I believe I checked it and it was working but I’m going to check it again.

&gt; no /strict

`/strict` certainly works, you are probably looking at an older version.

&gt; When /meta is used with compact, meta issue! vals change to ref! vals.

Thanks, I’ll check it.

&gt; We have some options for encoding, and most for decoding. With an /options approach, how do we make it clear which go with to-xml and which go with load-xml?

Good question. I don’t know.

&gt; Is there anything else we need to consider, along the lines of /meta, that namespace or DTD support might add?

I believe that’s covered, name spaces work right now, DTD - I guess it’s supported, but needs more testing.

[09:04](#msg61e682a6bfe2f54b2e23f8c1)&gt; When /meta is used with compact, meta issue! vals change to ref! vals.

Ok, I’ve checked it and that’s intended because `issue!` is reserved for attributes in `compact` format. So I used `ref!` for meta tags. Maybe we can change it in other formats to use `ref!` too so it’s consistent. What do you think?

greggirwin

[21:14](#msg61e72dbd5ee4df335af002ec)I am testing with the repo. :+1: A common practice of mine is to write a %\_console.red script in the repo dir for playing and tests. e.g. for markup it includes %xml.red, dumps test files in different formats, and I can hack from there.

[21:16](#msg61e72e2bd41a5853f959312f)&gt; /strict certainly works

Poor wording on my part. I meant there is no `strict?` option for `/with`.

zentrog:matrix.org

[22:16](#msg61e73c25d143b14f8323ff29)I’m actually away on vacation right now, and prior to that, a winter storm knocked out my power for 13 days. I’m hoping I can help out a bit with testing and such after I get back and settle in a bit. Maybe around the weekend.

greggirwin

[22:40](#msg61e741f55dc6213cd4eb956a):+1:

## Wednesday 19th January, 2022

greggirwin

[01:40](#msg61e76c2a742c3d4b21a4c87b)I'm working on metadata thoughts, but it's going to be a big post and I'm being summoned for human interaction. :^)

[01:42](#msg61e76c7d742c3d4b21a4c949)In the meantime, here are three small topics we should be able to finalize quickly.

[01:43](#msg61e76ca5bfe2f54b2e25ffff)We're getting close on this. I'm excited. Nailing down some final details are all that's left. ;^) We're going to ignore advanced aspects like DTDs and "valid" doc handling for now.

\## Interface

I strongly cast my vote for refinements over `/with ... options`, and only @hiiamboris complained a little.

Can we gavel that decision?

\## Omit none values in key-val?

I vote to omit `text!/attr!` entries if they are none. Any objections or technical problems with that?

\## Prolog/Strict

XMLDecl, and full prologs, are optional per the spec. `/Strict` makes the loader require it, and `/meta` is nicely wrapped so only `meta-action` (and one other place at line 602: store-xml-decl) care about it. All `/strict` does is add `opt` to the grammar, making it strict vs loose.

The spec says docs \*should* start with XML-Decl, but they are entirely valid without it. If we keep `/strict` it means you get an error if it's not there. Then we'd add `/valid` or a `validate-xml` feature if/when DTDs are supported. But the pertinent question is whether we'd rather use `if error? load-xml/strict ...` or remove `/strict` and let users check for prolog info if they care. Note that `/strict` \*only* applies to the `XMLDecl` part of the prolog, as other prolog parts are still optional.

Any strong arguments for keeping `/strict`?

[19:44](#msg61e86a0c5dc6213cd4ede677)## /mark

I said not long ago that I think we can remove `/mark`. We can always add it later, but can't remove it once it's there. A simple `replace/deep` is all that's needed if someone wants a different marker, and should be fast if it's word-for-word.

Can we gavel that?

hiiamboris

[20:13](#msg61e870e1526fb77b3189ec16)Hands off /mark!!! ;)

[20:14](#msg61e8712cd41a5853f95bc2b8)I certainly wouldn't want to parse 1MB+ file extra time.

[20:16](#msg61e8719b6d9ba23328cdc131)Though if it's accessible as a setting inside XML context, it's acceptable, just a bit awkward.

greggirwin

[20:32](#msg61e875779a335454062f592e)&gt; Though if it's accessible as a setting inside XML context, it's acceptable, just a bit awkward.

True. So you're OK removing it? And, hey, let's profile it to see just how awful it will be. Good info to have.

hiiamboris

[20:49](#msg61e8793ce1a1264f0a651afc)330ms per file at max juice mode

[20:53](#msg61e87a3b82a4667b2584a9f3)I also find that `!` is good with path access but `text!` is good for defining field mappings in a DSL. E.g. `value: !` is not good there. So the use case dictates the sigil.

greggirwin

[21:03](#msg61e87c925dc6213cd4ee0c9b)An order of magnitude either way would make it an easier call. :^(

hiiamboris

[21:03](#msg61e87cb95dc6213cd4ee0cc2):D

greggirwin

[21:03](#msg61e87cbb742c3d4b21a6e4bb)@rebolek any idea why this doctype decl would cause a problem?

[21:08](#msg61e87dd95ee4df335af29d49)For now, let's remove `/mark`, but make sure that Boris, er, "the user" can set `text-mark` manually in the XML context to avoid the hit. And we should also note that "feature", and the `replace/deep` option in the docs. The latter keeps global codec state out of the picture. &lt;gavel&gt;

[21:10](#msg61e87e5f6d9ba23328cddbe0)@rebolek it's not that doctype it seems. I replaced it with one from %menu.xml and it still causes the rest of the doc not to load. Something with the other prolog elements I'm hacking in to test.

[21:22](#msg61e88125d41a5853f95be822)Got it. Mapping issue from the BNF `prolog ::= XMLDecl? Misc* (doctypedecl Misc*)?` to `parse`.

```
prolog: [
		XMLDecl
		opt [doctypedecl any Misc]
		any Misc
	]
```

All is well if the DTD is the first thing after XMLdecl, but the BNF says it can go anywhere. But if there are PIs or comments before it, it stops at the DTD (but still passes with `/strict`).

[22:39](#msg61e89318e1a1264f0a65517c)@rebolek looks like `standalone` in XMLDecl isn't captured.

[23:21](#msg61e89ce382a4667b2584f935)\[xml-metadata-notes.md](https://files.gitter.im/600719b0d73408ce4ff93018/xKgL/xml-metadata-notes.md)

[23:21](#msg61e89cf85dc6213cd4ee5230)If you want to add it to the repo @rebolek, that might not be a bad idea.

[23:26](#msg61e89e166d9ba23328ce1ca0)Here's my %prolog.xml test file.

```
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?> 
<!DOCTYPE data SYSTEM "./data/menu.dtd">
<?xml-stylesheet type="text/css" href="/style/design"?> 
<?xml-stylesheet type="text/xsl" href="menu.xsl"?>
<!-- This is a comment --> 
<?welcome to the real world?>
<?welcome x?>
<?welcome ?>
<customer_list> 
	<customer> 
		<name> Sanjay</name> 
		<location> Mumbai</location> 
	</customer> 
	<customer> 
		<name> Micheal</name> 
		<location> Washington</location> 
	</customer> 
</customer_list>
```

## Thursday 20th January, 2022

rebolek

[06:18](#msg61e8fec62a210c38c1d98804)@greggirwin Thanks for the test file, I will fix it.

[08:14](#msg61e919fa742c3d4b21a80673)&gt; I strongly cast my vote for refinements over /with ... options, and only @hiiamboris complained a little.

Ok, there’s not that much refinements, so let’s remove `/with`

&gt; I vote to omit text!/attr! entries if they are none. Any objections or technical problems with that?

No objections and it’s implemented already.

&gt; Any strong arguments for keeping /strict?

Probably no, If `XMLDecl` is optional in specs, let’s make it optional.

&gt; I said not long ago that I think we can remove /mark

I must object here. The problem here is the accessibility in the XML object. To access it, the XML object must not be anonymous, unlike other contexts. Do we really want that?

[08:20](#msg61e91b3c9b470f389776da45)@greggirwin your notes were added to the repo: https://gitlab.com/rebolek/markup/-/wikis/Metadata-notes

[10:23](#msg61e9382bbfe2f54b2e29a4e1)Some notes:  
&gt; Note that no doctypedecl information is retained. I don't know if that's by design or not.

It’s a missing feature, I am working on it.

&gt; Or if we change them all (meta data) to use ref! like compact does now.

I vote for changing them to `ref!` to be consistent across output formats.

&gt; If we can agree that having the entire prolog in a structure is a good thing

I am not against having a prolog in a structure, but that doesn’t solve some other problems - comments, processing instructions and CDData can be anywhere in the XML doc, not just prolog. If we move them to prolog, we will lose structure.

greggirwin

[15:06](#msg61e97a5d9a3354540631596f)&gt; I must object here. The problem here is the accessibility in the XML object. To access it, the XML object must not be anonymous, unlike other contexts. Do we really want that?

I don't really want that, no. But I like `!` even less, and `/mark` as a general feature is really only there from our own little legacy issues and one specific alternative marker (legacy happens fast sometimes :^). So I will still say to remove it, even with an anonymous context, and then @hiiamboris can tell me how much time he loses each day, working on L10N and ICU data, because he wants to use `!` and has to post-process it.

[15:13](#msg61e97c36d143b14f832870de)&gt; comments, processing instructions and CDData can be anywhere in the XML doc, not just prolog. If we move them to prolog, we will lose structure.

Ah, right. :^\\ OK, let's mock up a test file that mixes them all in, I will look at the CDATA examples to start, and plan to put the prolog in a structure, whose internal format will depend on the format we decide for those elements.

I \*really* thought we were almost done. ;^)

[17:08](#msg61e996febfe2f54b2e2a75f1)Here's my messy mockup for special values.

```
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?> 
<!DOCTYPE data SYSTEM "./data/menu.dtd">
<?xml-stylesheet type="text/css" href="/style/design"?> 
<?xml-stylesheet type="text/xsl" href="menu.xsl"?>
<!-- Prolog comment 1 --> 
<?welcome to the real world?>
<?welcome x?>
<?welcome ?>
<!-- Prolog comment 2 --> 
<customer_list> 
	<customer> 
		<![CDATA[Customer 1 CDATA]]>
		<name> Sanjay</name> 
		<!-- Customer 1 comment --> 
		<location> Mumbai</location> 
		<?cust-1-PI type="app/red" href="/root/path"?> 
	</customer> 
	<customer> 
		<?cust-2-PI-1 type="app/red" href="/root/path/1"?> 
		<?cust-2-PI-2 type="app/red" href="/root/path/2"?> 
		<name> Micheal</name> 
		<!-- Customer 2 comment 1 --> 
		<![CDATA[customer 2 CDATA 1]]>
		<location> Washington</location> 
		<![CDATA[customer 2 CDATA 2]]>
		<!-- Customer 2 comment 2 --> 
	</customer> 
</customer_list>
```

[17:09](#msg61e9973ee1a1264f0a676149)I should add some attrs for elements.

[17:12](#msg61e998022a210c38c1dac984)

```
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?> 
<!DOCTYPE data SYSTEM "./data/menu.dtd">
<?xml-stylesheet type="text/css" href="/style/design"?> 
<?xml-stylesheet type="text/xsl" href="menu.xsl"?>
<!-- Prolog comment 1 --> 
<?welcome to the real world?>
<?welcome x?>
<?welcome ?>
<!-- Prolog comment 2 --> 
<customer_list> 
	<customer name="myVar1"> 
		<![CDATA[Customer 1 CDATA]]>
		<name type="first"> Sanjay</name> 
		<!-- Customer 1 comment --> 
		<location type="geo"> Mumbai</location> 
		<?cust-1-PI type="app/red" href="/root/path"?> 
	</customer> 
	<customer name="myVar2"> 
		<?cust-2-PI-1 type="app/red" href="/root/path/1"?> 
		<?cust-2-PI-2 type="app/red" href="/root/path/2"?> 
		<name type="first"> Micheal</name> 
		<!-- Customer 2 comment 1 --> 
		<![CDATA[customer 2 CDATA 1]]>
		<location type="geo"> Washington</location> 
		<![CDATA[customer 2 CDATA 2]]>
		<!-- Customer 2 comment 2 --> 
	</customer> 
</customer_list>
```

[17:18](#msg61e9996ad41a5853f95e1de6)Thanks for all the fixes and improvements @rebolek. It's nice when my data doesn't load and I'm confident enough in the code to be sure it's my mock data that's messed up. :+1:

[17:21](#msg61e99a112a210c38c1dace50)An interesting design aspect here is that `compact`'s choice to use issues leaks out if we have to change the other formats to avoid it.

[17:22](#msg61e99a63f5a3947800159da1)In `key-val`, PIs need to be adjusted, as they are 3 values right now (key-val-val).

`#PI "cust-1-PI" {type="app/red" href="/root/path"}`

Should probably be

`#PI ["cust-1-PI" {type="app/red" href="/root/path"}]`

Comments and CDATA each just have a single string, so they're OK.

[17:23](#msg61e99a9f46529077f59502f9)DTD in the prolog is OK for the same reason.

[17:27](#msg61e99b897842bd3ca95714db)To make the test even better, we should mock attrs to be named `[cdata comment pi]`. Not that anyone in the real world would ever do that, just to check for conflicts as we look at syntax options.

hiiamboris

[17:30](#msg61e99c1c82a4667b2586f3ec)what is `#PI`?

greggirwin

[17:30](#msg61e99c25742c3d4b21a91d89)Processing Instruction.

hiiamboris

[17:30](#msg61e99c2d9b470f389777f08a)oh

greggirwin

[17:31](#msg61e99c59742c3d4b21a91df5)In source XML they aren't "named", just format to identify them.

hiiamboris

[17:32](#msg61e99c92e1a1264f0a676d3e)got it

greggirwin

[17:32](#msg61e99caa5dc6213cd4f048fa)My note from my metadata file:

&gt; `PI` is not meaningful, but `processing-instruction` is long. `Process`, no. `Proc-instr`, still not great. Given that "PIs are not part of the document's character data, but MUST be passed through to the application." what about `pass-thru`? I'm open to thoughts, and if @dander says `PI` makes the most sense in context, so be it.

hiiamboris

[17:33](#msg61e99cd482a4667b2586f58c)`proc-info` maybe

greggirwin

[17:33](#msg61e99d07e1a1264f0a676f0a)That expands to Process Information to me.

[17:34](#msg61e99d19bfe2f54b2e2a83f2)But not terrible.

[17:36](#msg61e99da86d9ba23328d02243)`cdata` could be `char-data` to match the length of `pass-thru | proc-info`.

[17:37](#msg61e99dc65dc6213cd4f04c06)But the standard abbreviation is probably very meaningful to XML users.

rebolek

[18:18](#msg61e9a774d143b14f8328d233)&gt; In key-val, PIs need to be adjusted, as they are 3 values right now (key-val-val).

Right, the code was just copy-pasted from `triples` format, I’ll fix it.

## Friday 21st January, 2022

greggirwin

[01:20](#msg61ea0a7abfe2f54b2e2b634e)Latest test data, with attr names matching XML keyword names we use.

```
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?> 
<!DOCTYPE data SYSTEM "./data/menu.dtd">
<?xml-stylesheet type="text/css" href="/style/design"?> 
<?xml-stylesheet type="text/xsl" href="menu.xsl"?>
<!-- Prolog comment 1 --> 
<?welcome to the real world?>
<?welcome x?>
<?welcome ?>
<!-- Prolog comment 2 --> 
<customer_list comment="comment-attr" cdata="cdata-attr" PI="PI-attr"> 
	<customer name="myVar1"> 
		<![CDATA[Customer 1 CDATA]]>
		<name type="first"> Sanjay</name> 
		<!-- Customer 1 comment --> 
		<location type="geo"> Mumbai</location> 
		<?cust-1-PI type="app/red" href="/root/path"?> 
	</customer> 
	<customer name="myVar2"> 
		<?cust-2-PI-1 type="app/red" href="/root/path/1"?> 
		<?cust-2-PI-2 type="app/red" href="/root/path/2"?> 
		<name type="first"> Micheal</name> 
		<!-- Customer 2 comment 1 --> 
		<![CDATA[customer 2 CDATA 1]]>
		<location type="geo"> Washington</location> 
		<![CDATA[customer 2 CDATA 2]]>
		<!-- Customer 2 comment 2 --> 
	</customer> 
</customer_list>
```

[01:34](#msg61ea0d9cd41a5853f95f1230)Here's my current thinking. Don't use issues or refs. Use the mechanism already in place for `text!` and `attr!`. I mocked it up in this file:

[01:34](#msg61ea0dad9a33545406328cc4)\[xml-proposed-keyword-syntax.txt](https://files.gitter.im/600719b0d73408ce4ff93018/kteO/xml-proposed-keyword-syntax.txt)

[01:45](#msg61ea104a7842bd3ca9580a54)Existing syntax at the top, then the proposed syntax at the bottom.

+1 for consistency. It's the same in all formats.

+1 for still avoiding keyword conflicts, because `!` can't be in XML names. So `!` acts like we use types today.

+1 for the implication that the keywords have a type meaning associated with them.

-1 for not standing out as much visually, because the sigil is at the end of the keyword, not the beginning. I can live with this. We could uppercase the keyword names, or add a leading underscore. That may be OK as these shouldn't occur nearly as much as regular content. @dander may have thoughts as well.

This makes the data pretty bland to look at. It's all just words now, with the exception being attr names in compact format. That also normalizes processing (except for `compact`). This mocked data is the worst things could ever look WRT the effect the syntax has. Massive data in attrs, or other issues will dwarf it in any raw readability comparison.

pekr

[06:28](#msg61ea5294f5a39478001707b2)Visually I prefer `!` instead of `#` or `@` too. The latter two variants seem to be quite busy, overloaded. Can't explain, it is just feeling after all ....

[06:29](#msg61ea52d57842bd3ca95888e4)Interesting, that you gave it a minus / con, while I consider it being a plus / advantage :-)

rebolek

[07:05](#msg61ea5b51d41a5853f95fa22f)Ok. My gut feeling is that using `ref!` would be better because it’s a different beast than `text!` and `attr!`, but I can live with that.

[07:28](#msg61ea6086742c3d4b21aaa1a7)Also, I am going to remove `/mark` as discussed becuase there is a way for accessing the anonymous XML context:

```
xml-ctx: context? first body-of :load-xml
xml-ctx/text-mark: '!
```

[07:28](#msg61ea60a55ee4df335af65dc0)Fairly easy :)

[08:13](#msg61ea6b3c2a210c38c1dc6214)&gt; cdata could be char-data to match the length of pass-thru | proc-info.

I would leave `CDATA` as it is, don’t introduce new terminology when it’s not needed.

hiiamboris

[10:12](#msg61ea86f37842bd3ca958f339)Why don't you use system/codecs/XML as context?

[10:12](#msg61ea870482a4667b2588b739)For settings.

rebolek

[11:29](#msg61ea990ad143b14f832aab05)That would mean adding new stuff there. I am not against it and if we agree on some structure that could be used with other codecs too, I am for moving options there.

greggirwin

[19:29](#msg61eb09839b470f38977ae66e)Something to run by Nenad. He recently noted that the "new" codecs don't use the "API" as he intended, but hasn't responded to how else we should write codecs that have options. All the old ones are just graphics loaders, and offer no control. In that context, I think it's OK. The only thing that limits us there is writing, e.g., JPG support in an image producing app that controls the compression level.

[19:30](#msg61eb09ec6d9ba23328d3079e)`CDATA` it is, unless @dander screams "NOOoooo!". &lt;gavel&gt;

What about `[PI pass-thru proc-info]`?

Should `doctype` be `doc-type`?

[19:32](#msg61eb0a4a5dc6213cd4f334c0)@pekr, the great thing about subjective experience is that we all see things differently. It's also terrible when we have to make decisions. :^) Thanks for weighing in, it's appreciated.

[19:38](#msg61eb0b985ee4df335af7c685)The downside to using the system codec context for options is, once again, globals. We don't have concurrency yet, but when we do a lot of things may need to change that assumed it doesn't exist. I'll also continue to push for separation between tasks, and using message passing. I'm not concerned about how many theoretical tasks we can run in microbenchmarks, but how we get real work done correctly without losing our minds.

hiiamboris

[19:46](#msg61eb0d8d742c3d4b21ac1cc3)well, accessing it's context via hacks has the same downside

rebolek

[20:30](#msg61eb17d09b470f38977b0300)&gt; He recently noted that the "new" codecs don't use the "API" as he intended

If I can take a look at that API, I’ll be happy to rewrite my codecs.

greggirwin

[21:01](#msg61eb1f169a3354540634af8d)@hiiamboris yup, the difference being that we as designers haven't blessed it, and therefore aren't to blame. ;^)

[21:03](#msg61eb1fb6f5a394780018b1a9)@rebolek I don't see a solution. The issue is that the other codecs don't have any options. I think his comments were in the PR. The problem is that adding support for options of any kind, in any codec, means `load` has to support a generic mechanism for it (as I understand it). And that has all the issues we talked about for it here.

If we can get him to clarify what \*he* wants, we can look at alternatives.

hiiamboris

[21:06](#msg61eb204b7842bd3ca95a3513):)

greggirwin

[21:06](#msg61eb20516d9ba23328d33405)https://github.com/red/red/pull/5026#pullrequestreview-856800137

rebolek

[21:13](#msg61eb21ed7842bd3ca95a385b)@greggirwin Ok, I’m cetainly not pushing for that, if @hiiamboris wants to override `text!` and use `!` there is a way even with the anonymous object as I shown, so IMO it’s not a problem currently.

[21:13](#msg61eb22176d9ba23328d337fe)OTOH having an unified mechanism for setting codec’s options makes sense not only XML and current codecs but also for all future ones.

Oldes

[21:55](#msg61eb2bd32a210c38c1ddebbe):point\_up: \[January 21, 2022 8:38 PM](https://gitter.im/red/codecs?at=61eb0b985ee4df335af7c685) I cannot imagine that someone, who does not want to loose his mind, would like to load simultaneously multiple XML files using a different options for each of them.

[21:56](#msg61eb2c2582a4667b258a0ed3)I believe, that having context to hold all codecs in one place is the right way to go... instead of having tons of floating `load-*` functions.

hiiamboris

[22:31](#msg61eb3452e1a1264f0a6ab794)Well, what if you import some tools that process (various kinds of) XML data and those tools operate on different formats.

greggirwin

[22:58](#msg61eb3a852a210c38c1de05af)@Oldes agreed, but when someone else touches the code, and wants their data in a different format, but doesn't tell you...you lose your mind for a different reason. It's not a showstopper, just a less appealing pattern.

[23:48](#msg61eb465c9a3354540634fb90)Synced. Thanks for the changes @rebolek.

Are we still going to put the prolog in a separate block? I'd like to &lt;gavel&gt; that.

[23:53](#msg61eb478bf5a394780018ffc9)@hiiamboris are you OK with PIs using issues for the PItarget part in compact form, even though it's not technically an attribute? e.g.

```
<?xml-stylesheet type="text/xsl" href="menu.xsl"?>
<?welcome to the real world?>
```

Becomes

```
PI! [#xml-stylesheet {type="text/xsl" href="menu.xsl"}] 
    PI! [#welcome "to the real world"]
```

## Saturday 22nd January, 2022

hiiamboris

[10:15](#msg61ebd92a5ee4df335af93d96)looks good

## Monday 24th January, 2022

greggirwin

[01:06](#msg61edfb87f5a39478001dc7b6)&gt; I believe, that having context to hold all codecs in one place is the right way to go... instead of having tons of floating `load-*` functions.

I think this falls into "pushing the problem around", rather than solving it. Whether you have options in a codec object, or a named func, if you need the functionality, it's got to be somewhere. So we look at tradeoffs. As noted before, we need to build a help system for anything beyond how `help` works for functions today. Otherwise there is nothing more than docs for a user to learn from. Then there's `help` itself. If there are no extended funcs, and we \*can* do that, you can't do `help load-` and get a list of them. You just get `load`'s help, that it has `/as` and a list of those formats. If it gets to \*tons* of them, you overload that doc string. But also, that doc string won't know about any non-standard codecs, so won't list them. If you're the only one working on your code, you know that you included the `XAML` codec, but on a team, or with shared code of any kind, you might not.

For me, this is all still very open to change, because we don't have enough people using them in different environments to tell us what design aspects are good, bad, or just wasting space.

pekr

[02:18](#msg61ee0c8382a4667b258f106a)I am sorry, but the concept of myriad of do-* functuons was one of the most hated design decisions about Rebol. It started with do-browser netscape plugin and exploded with do-service R3 services. I always regarded the reasoning about not overloading and slowing down functions as an excuse, or even worse - an afterthought and the lack of proper desing decisions.

[02:21](#msg61ee0d27d143b14f8330f024)The same hoes for the help system. Its topic is as old, as Rebol system. If we need eg objects having headers, let's just do it, after all even Carl planned that. Ditto for dialects. The recent help system design should not be a decision point, which brings mess to the language.

[02:28](#msg61ee0ec0e1a1264f0a6fb8b2)I was quite shocked by readimg Doc's PR comments re XML codec, where he wondered, why the codec obeys a codec API, and even worse, why it is not a streamed parser he always wished for. This ideas hoes back to the times of his mysql vs postgress drivers. It just reminded me of Carl letting others do r3- gui or VID 2.3, scrapping delivered solution later and redoing it himself. I can see the lack of coordination there without syncing upon basic system design requirements.

[02:30](#msg61ee0f3ebfe2f54b2e32d536)Ditto for the CLI module.

greggirwin

[03:36](#msg61ee1ec546529077f59d5c1b)@pekr, I'll ask here for a concrete design that we can discuss, to see which we like better. Saying "X is bad" only helps so much. We want the least worst option. :^)

I agree we can and should improve `help`. But who's going to do it? How important is it relative to other things?

Yes, coordination in a team can be really hard, and we hope to improve our internal communication in the future.

[03:41](#msg61ee1fd4bfe2f54b2e32f1c1)I do appreciate the feedback though.

[04:24](#msg61ee29e4d41a5853f966adc1)@pekr, maybe what triggered my response was:

&gt; functuons was one of the most hated design decisions about Rebol. It started with do-browser netscape plugin and exploded with do-service R3 services.

I don't remember any community discussion about those being hated, and "exploded" is kind of like @Oldes using the "tons" to describe how many codec might be in play.

Oldes

[05:37](#msg61ee3b1782a4667b258f62b9)@greggirwin what do you mean with the "tons"?

pekr

[06:55](#msg61ee4d626d9ba23328d8ce78)Sorry, I typed on a smartphone, and noticed "my most hated". I could not edit it on a smart phone. But I do remember the discussion I started because of that, requested a more polymorphic aproach and was silenced down by counter claims, that do / load are important function and their further slow down is not an option.

[07:00](#msg61ee4e7ee1a1264f0a702a63)And R3/Services was poluting the space further with stuff like send-service, open-service. I really don't want to see that. Those function should have an API imo and /as /with etc refinements are a good way to go. In there internal space (inside a module), the author can do whatever, but global space should be kept as much clean as possible.

[07:01](#msg61ee4ee79b470f389780a380)I even objected, that the naming could be reversed to something like service-send, service-open, so that help lists them one by each other. But that already leads us to service/open (or in other langs service.open) schema, which was refused too, because of the common naming order in Rebol.

Oldes

[07:06](#msg61ee4fe05ee4df335afd95ea)@greggirwin I'm currently having in Rebol (in the Bulk version) 31 codecs:

```
>> ? system/codecs
SYSTEM/CODECS is an object of value:
  text            object!    [name type title suffixes entry]
  markup          object!    [name type title suffixes entry]
  qoi             object!    [name type title suffixes entry size?]
  pkix            object!    [name type title suffixes decode identify]
  der             object!    [name type title suffixes decode identify DER-tags decode-OID verbose]
  mobileprovision object!    [name type title suffixes decode]
  crt             object!    [name type title suffixes decode fingerprint verbose]
  ppk             object!    [name type title suffixes decode]
  ssh-key         object!    [name type title suffixes decode]
  utc-time        object!    [name type title decode]
  unixtime        object!    [name type title suffixes decode encode]
  ar              object!    [name type title suffixes decode identify]
  gzip            object!    [name type title suffixes decode encode identify verbose level]
  zip             object!    [name type title suffixes decode encode identify decompress-file de-extra-fields ...
  tar             object!    [name type title suffixes decode identify verbose]
  dng             object!    [name type title suffixes comment decode identify]
  jpegxr          object!    [name type title suffixes decode encode identify]
  dds             object!    [name type title suffixes decode encode identify size?]
  tiff            object!    [name type title suffixes decode encode identify]
  gif             object!    [name type title suffixes decode encode identify size?]
  bmp             object!    [name type title suffixes decode encode identify size?]
  jpeg            object!    [name type title suffixes decode encode identify size?]
  png             object!    [name type title suffixes decode encode identify size? chunks]
  wav             object!    [name type title suffixes decode encode identify verbose]
  ico             object!    [name type title suffixes decode encode identify]
  swf             object!    [name type title suffixes decode decode-tag identify verbose swf-tags]
  pdf             object!    [name type title suffixes decode encode identify]
  bbcode          object!    [name type title suffixes decode]
  html-entities   object!    [name type title decode]
  json            object!    [name type title suffixes encode decode]
  xml             object!    [name type title suffixes decode verbose options xml-parse-handler echo-handler b...
```

[07:07](#msg61ee502a82a4667b258f899c)

```
rebol
>> ? codecs
TIME CODECS:
    UNIXTIME
    Unix time stamp converter
    Includes: decode encode

    UTC-TIME
    UTC time as used in ASN.1 data structures (BER/DER)
    Includes: decode


TEXT CODECS:
    BBCODE
    Bulletin Board Code
    Suffixes: .bbcode
    Includes: decode

    HTML-ENTITIES
    Reserved characters in HTML
    Includes: decode

    JSON
    JavaScript Object Notation
    Suffixes: .json
    Includes: encode decode

    MARKUP
    Internal codec for markup media type
    Suffixes: .html .htm .xsl .wml .sgml .asp .php

    TEXT
    Internal codec for text media type
    Suffixes: .txt .cgi

    XML
    Extensible Markup Language
    Suffixes: .xml .pom
    Includes: decode verbose options xml-parse-handler echo-handler block-handler ns-block-handler parser


CRYPTOGRAPHY CODECS:
    CRT
    Internet X.509 Public Key Infrastructure Certificate and Certificate Revocation List (CRL) Profile
    Suffixes: .crt
    Includes: decode fingerprint verbose

    DER
    Distinguished Encoding Rules
    Suffixes: .p12 .pfx .cer .der .jks
    Includes: decode identify DER-tags decode-OID verbose

    MOBILEPROVISION
    Apple's mobileprovision file
    Suffixes: .mobileprovision
    Includes: decode

    PKIX
    Public-Key Infrastructure (X.509)
    Suffixes: .pem .ssh .certSigningRequest
    Includes: decode identify

    PPK
    PuTTY Private Key
    Suffixes: .ppk
    Includes: decode

    SSH-KEY
    Secure Shell Key
    Suffixes: .key
    Includes: decode


COMPRESSION CODECS:
    AR
    Unix archive file
    Suffixes: .ar .a .lib .deb
    Includes: decode identify

    GZIP
    Lossless compressed data format compatible with GZIP utility.
    Suffixes: .gz
    Includes: decode encode identify verbose level

    TAR
    TAR File Format
    Suffixes: .tar
    Includes: decode identify verbose

    ZIP
    ZIP File Format
    Suffixes: .zip .aar .jar .apk .zipx .appx .epub
    Includes: decode encode identify decompress-file de-extra-fields validate-crc? verbose level


SOUND CODECS:
    WAV
    Waveform Audio File Format
    Suffixes: .wav .wave
    Includes: decode encode identify verbose


IMAGE CODECS:
    BMP
    Portable Bitmap
    Suffixes: .bmp
    Includes: decode encode identify size?

    DDS
    DirectDraw Surface
    Suffixes: .dds
    Includes: decode encode identify size?

    DNG
    Digital Negative
    Suffixes: .dng
    Includes: comment decode identify

    GIF
    Graphics Interchange Format
    Suffixes: .gif
    Includes: decode encode identify size?

    ICO
    Windows icon or cursor file
    Suffixes: .ico .cur
    Includes: decode encode identify

    JPEG
    Joint Photographic Experts Group
    Suffixes: .jpg .jpeg
    Includes: decode encode identify size?

    JPEGXR
    JPEG extended range
    Suffixes: .jxr .hdp .wdp
    Includes: decode encode identify

    PNG
    Portable Network Graphics
    Suffixes: .png
    Includes: decode encode identify size? chunks

    TIFF
    Tagged Image File Format
    Suffixes: .tif .tiff
    Includes: decode encode identify


OTHER CODECS:
    PDF
    Portable Document Format
    Suffixes: .pdf
    Includes: decode encode identify

    QOI
    Internal codec for qoi media type
    Suffixes: .qoi
    Includes: size?

    SWF
    ShockWave Flash
    Suffixes: .swf
    Includes: decode decode-tag identify verbose swf-tags


TIP: use for example help system/codecs/zip to see more info.
```

[07:08](#msg61ee507b46529077f59db555)(there is a bug... QOI should have set `image` type)

[07:18](#msg61ee52e2bfe2f54b2e334bd2)But Red cannot have codecs living in object, because it does not have implemented object extending..

```
>> extend object [] [x: 2]
*** Internal Error: reserved for future use (or not yet implemented)
```

[07:21](#msg61ee538d5ee4df335afd9dc9)@pekr since there is `transcode`, `load` is not so important function like it was in Rebol2.

zentrog:matrix.org

[08:03](#msg61ee5d47742c3d4b21b1ffef)@greggirwin: I think 'cdata' makes sense, since it's that everywhere. For processing instruction, I might have mentioned "PI" because it looks like \[a common abbreviation](https://en.wikipedia.org/wiki/Processing\_Instruction), but I've never done anything that processed them.

greggirwin

[19:22](#msg61eefc5d82a4667b2590f755)@Oldes, "tons" referred to your comment:

&gt; I believe, that having context to hold all codecs in one place is the right way to go... instead of having tons of floating `load-*` functions.

[19:25](#msg61eefd3446529077f59f125a)@pekr, we definitely agree on consolidating interfaces as much as possible. I fought hard for that with `round` in Rebol, and am doing so now for `split` (where we are now at the stage of deciding on a dialect vs refinements) and `format`. It then comes to how things work in practice, and finding the best balance, because it is possible to overload a small set of interfaces too far. That's part of the magic of Rebol's design for me. It's not that it's perfect, but it found a nice balance.

[19:28](#msg61eefdc646529077f59f132e)@Oldes thanks so much for the list, and the help example! I will pull that into notes and review when I can give it a block of time.

[19:32](#msg61eefeb99a335454063bc213)@zentrog:matrix.org thanks. :+1: Personally I like `pass-thru` or `proc-info`, as they are more word-like, and have nice meaning. But when dealing with XML, that domain uses `PI`. So I will defer to that, and nobody except me has complained about `PI` that I know of, so `PI` it remains. &lt;gavel&gt;

[19:33](#msg61eefeee46529077f59f1573)@rebolek what's still to be done on our checklist for release into the PR?

[20:30](#msg61ef0c5b46529077f59f3160)We are a week away from month end, and my goal is to get XML out, along with Animation. We'll note in the blog post that there may be changes, and that we are reviewing the overall codec interface.

The original JSON interface is a legacy issue for us now. R2 didn't have codecs, and that code has been around in various forms for a very long time. Romano did the first version, I took over maintenance and kept it up with Douglas Crockford on JSON.org, then @giesse, @rebolek, and @hiiamboris contributed to improving it; but the original interface lives on. :^\\

I don't want to pull anyone's focus right now, but also don't want to just hack in a different interface without thinking it through. So it will be a pretty big task. It will likely also inform other extension models or how a system catalog works, even for I/O protocols perhaps.

@Oldes made the point that a single app may only use one XML format, for sanity, which will be common. But it may also be common for a single service or process to act as a general data transformer, dealing with many input and output formats, per request. That leads to bigger architecture questions, concurrency and reentrancy issues, etc.

For my part, as you can probably all guess, I'm much more concerned about understanding and correctness than about micro-benchmarks. So the overhead of function calls into a codec are not as important to me as the big picture.

## Tuesday 25th January, 2022

toomasv

[04:29](#msg61ef7cc66d9ba23328db26f4)Thanks! Wow. A lot. Will study these now.

greggirwin

[04:33](#msg61ef7d889a335454063cb043)That's probably related to other stuff. :^)

[04:33](#msg61ef7d9e9b470f389782fe22)Gitter makes it easy to lose track of which group you're in.

rebolek

[06:37](#msg61ef9ab79b470f389783316d)@greggirwin

&gt; what's still to be done on our checklist for release into the PR?

I have almost rerady the `init` function, so the codec won’t eat memory when not used, this `PI! [#xml-stylesheet {type="text/xsl" href="menu.xsl"}]` (for the compact format) is not done yet. but that’s going to be very fast, and that’s all I believe. I’ll finish these two things and re-read the conversation to see if I haven’t forget about something.

If there’s not going to show up something else it definitely can be merged this month.

[09:50](#msg61efc7d37842bd3ca962d385)As, so the `PI! [#xml-stylesheet {type="text/xsl" href="menu.xsl"}]` is done already.

[09:50](#msg61efc7db46529077f5a094ed)And `init` is also finished.

[09:50](#msg61efc7f99b470f3897838e06)I am going to review the chat again, to see if I haven’ forgot anything. If not, we’re probably ready to go.

zentrog:matrix.org

[19:10](#msg61f04b256d9ba23328dcbcfb)👏

greggirwin

[20:50](#msg61f062b3526fb77b3199317b)@rebolek I think we agreed the prolog would be in a separate block. Is that right?

[20:52](#msg61f06308e1a1264f0a74592a)Thanks for reviewing chat. I'll leave that to you. We will write examples for the blog post which may bring things to light that we address after the release.

[20:54](#msg61f0638846529077f5a1dbeb)We should probably also add a %codecs/ folder to docs, and move the old wiki docs for JSON and CSV there, along with new XML docs.

rebolek

[22:36](#msg61f07b7fe1a1264f0a748e31)@greggirwin Prolog in a separate block - I am not sure about that.

[22:38](#msg61f07bca5dc6213cd4fd7267)&gt; We should probably also add a %codecs/ folder to docs, and move the old wiki docs for JSON and CSV there, along with new XML docs.

Good idea. The code is almost ready, reviewing the docs would take some time but I don't think it's a showstopper.

greggirwin

[22:38](#msg61f07bf9526fb77b31996455)The point of putting it \*all* in a separate block is so you just get two values back: prolog and body. Otherwise, how do you find the root node, and separate the prolog? You can do it, but should everyone have to, versus (which I think I used as the example) `set [prolog body] load-xml/meta ...`

[22:40](#msg61f07c64d143b14f8335dc4e)In the spec, the prolog rule includes those misc elements.

rebolek

[22:40](#msg61f07c72bfe2f54b2e37b1ef)Ok, I need to think about it a bit more and do some tests tomorrow (not in 20 minutes, but after some sleep ;) to see how it's going to work.

## Wednesday 26th January, 2022

greggirwin

[01:36](#msg61f0a59dd41a5853f96bb0b0)In probing the XML context, I saw that `cont-val` had a large chunk of data in it. It only gets cleared in `store-char-data`. I wonder if, as a general rule, we want to clear things like that when the main func is done. On the one hand, they can be handy for debugging. OTOH, leaving data laying around for others to sniff isn't great.

rebolek

[06:42](#msg61f0ed6bf5a3947800238df6)It gets cleared in `store-char-data` but there shouldn’t be anything left after the function ends. If there is, I may add `clear`, that would be probably wise, I agree.

greggirwin

[06:53](#msg61f0efd582a4667b2594cb58)It may have had data left due to a malformed file I was testing.

rebolek

[08:10](#msg61f101ff9a335454063fb386)Ah, that explains it. I’ll add clearing anyway to be sure.

[08:34](#msg61f107847842bd3ca965551b)@greggirwin re: malformed file - this is one thing that’s actually not solved yet. Now it silently accepts malformed files and returns whatever it was able to parse, but I believe an error should be thrown instead. Do you agree? It’s a simple change.

greggirwin

[09:12](#msg61f11091742c3d4b21b77950)Yes, I agree. :+1:

rebolek

[09:24](#msg61f1135a5ee4df335a030542)@greggirwin great! Will be done ASAP.

hiiamboris

[10:06](#msg61f11d1146529077f5a34459)Sometimes I'm tryin to-xml on a Red file and get surprised that it returns nothing. An error is better :)

rebolek

[10:40](#msg61f1250bbfe2f54b2e38fc95)Of course.

## Thursday 27th January, 2022

rebolek

[10:34](#msg61f27549742c3d4b21ba3a58)Arguments against prolog being a separate block:  
\* if you have a snippet of XML code without a prolog, prolog would be always an empty block in result data.  
\* prolog is not separated in XML anyway  
\* there is XML declaration in prolog, optional doctype, and optional metadata. However, metadata can be part of the document also. What’s the point of the separation then?

[10:58](#msg61f27adc9b470f38978904eb)Unanswered questions I was able to find after re-reading the conversation:

&gt; Should doctype be doc-type?

I would prefer to stick with the official terminology here.

pekr

[11:00](#msg61f27b6b5ee4df335a05df22)I am also versed on parsed XML data being 2 blocks each time you parse XML document. Not sure it is necessary ....

hiiamboris

[11:11](#msg61f27dd59a3354540642c381)also in most cases we're parsing known data structure, so we know how root is called and don't need `find xml word!` to figure it out

greggirwin

[19:45](#msg61f2f64bd41a5853f9705dee)`doctype` OK. Easy. :^) &lt;gavel&gt;

&gt; if you have a snippet of XML code without a prolog, prolog would be always an empty block in result data.

That's OK. You asked for `/meta` and there is none. Metadata could also be `none` in that case. If it's not in a block, and you use `/meta`, how do you determine if any exists?

&gt; prolog is not separated in XML anyway

Our goal is not to mimic the physical XML structure. None of our emitters do anyway. ;^)

&gt; there is XML declaration in prolog, optional doctype, and optional metadata. However, metadata can be part of the document also. What’s the point of the separation then?

Grouping associated data. The \*spec* for XML defines it as a number of elements (the `prolog` rule), even if there's not a syntactical delimiter marking the end of it. That is, it's part of the logical structure, not the physical structure.

I just noticed that the spec has `document ::= prolog element Misc*` but we have

```
document: [
			opt prolog
			element
		]
```

I'm OK without trailing `misc` elements, but would like @dander to weigh in on that. If we \*really* want to follow the spec, we should have them. Now we have another question: the epilog. ;^)

&gt; also in most cases we're parsing known data structure, so we know how root is called and don't need `find xml word!` to figure it out

@hiiamboris, that won't work. All the special values (`xml! doctype! PI! comment!`) are also words, so you have to find the first word that's not one of those. I agree that most users will act on specific docs of known, or semi-known structure. It just means a bit more work for anyone writing more general purpose tools. Not a showstopper there though.

Let's do this on metadata, since it's just me who wants it separate. We need more docs written up anyway, so do that @rebolek. Here are the two things to add first:

1\) If you use `/meta`, how do you determine if any exists?

2\) How do you find the root element, and treat it and metadata separately? @dander might have real world examples of when that's done.

hiiamboris

[19:49](#msg61f2f766f5a394780027d53c)`prolog! [...]` inside?

greggirwin

[20:04](#msg61f2fab982a4667b2598fd01)@rebolek did you see https://github.com/red/red/pull/5026#issuecomment-1022633966 ?

[20:06](#msg61f2fb3982a4667b2598fd9a)&gt; `prolog! [...]` inside?

I thought about that, and it's also viable, but doesn't answer the question of whether it should be demarcated somehow. If we name it, then we also have to ask if the refinement name should match the key. This damn XML thing is neverending. ;^)

zentrog:matrix.org

[20:09](#msg61f2fbf446529077f5a73bdf)I wouldn't call myself a prolog expert, but my impression is that it seems like a hack to deal with the issue that the document is required to start with a single root element, but they \_also_ wanted to allow a whole bunch of other stuff outside it...  
All that stuff can come just about anywhere inside the document though as well (comments in particular), so I would be in favor of not giving it special treatment.

greggirwin

[20:14](#msg61f2fd39e1a1264f0a79adb4)I think you saw my comment @rebolek. GH didn't refresh new comments for me.

[20:15](#msg61f2fd6246529077f5a73d9f)Thanks @zentrog:matrix.org.

zentrog:matrix.org

[20:27](#msg61f3003f46529077f5a74301)&gt; &gt; also in most cases we're parsing known data structure, so we know how root is called and don't need `find xml word!` to figure it out  
&gt;  
&gt; @hiiamboris, that won't work. All the special values (`xml! doctype! PI! comment!`) are also words, so you have to find the first word that's not one of those

That's an interesting use case favoring a different datatype for metadata tags

rebolek

[20:35](#msg61f301f6526fb77b319e88b1)If I have to choose between  
\* removing `/meta` and always include metadata  
\* adding separate block for prolog

then I am for removing `/meta`. Adding separate prolog wouldn’t serve any purpose IMO.

[20:36](#msg61f302305ee4df335a06fb9f)&gt; think you saw my comment @rebolek. GH didn't refresh new comments for me

Yes, I saw it and implemented it :)

greggirwin

[20:46](#msg61f304bcbfe2f54b2e3cd3d4)The refinement and block questions are separate. We can always include it, but still have to decide on the format.

[20:56](#msg61f307095dc6213cd402b458)I'm open to always including the metadata and removing `/meta`. It does mean, however, that everybody then has to follow the instructions @rebolek writes for how to ignore it. ;^) The question of value is how often people use it versus how often they need to ignore it. If people need to ignore it explicitly a good portion of the time, we should keep the refinement to make the default case easier. Just the doc Ma'am.

hiiamboris

[21:03](#msg61f308a45dc6213cd402b921)Please don't sabotage what we already have

greggirwin

[21:17](#msg61f30be2526fb77b319e9cd7)That's a bit vague.

[21:19](#msg61f30c49e1a1264f0a79cd9d)My gut says to leave `/meta` in place, and release v1 with the prolog as it stands (as long as the docs are written for how to deal with it).

pekr

[21:41](#msg61f3117882a4667b25992d06)How often users of XML use Prolog section anyway?

greggirwin

[21:50](#msg61f31395526fb77b319eacea)That's what I asked. ;^)

zentrog:matrix.org

[22:37](#msg61f31eb66d9ba23328e2712b)probably not much

## Friday 28th January, 2022

rebolek

[06:24](#msg61f38c17d143b14f833c0028)It’s easy to skip the prolog. It’s just xmldecl, doctype and misc (comments and PIs) and besides xmldecl, everything is optional.

zentrog:matrix.org

[07:07](#msg61f3963c46529077f5a85550)I think in some cases xml decl is treated as optional too, or even if it isn't, it's nice to be able to parse xml fragments in the same way as a whole document

rebolek

[07:15](#msg61f398017842bd3ca96a7794)@zentrog:matrix.org yes, parsing snippets is possible. XMLDecl is optional in XML1.0 and required in XML1.1.

greggirwin

[17:12](#msg61f42404d41a5853f972aa1f)&gt; It’s easy to skip the prolog. It’s just xmldecl, doctype and misc (comments and PIs) and besides xmldecl, everything is optional.

What I want is \*the code* to show how it's done. "Easy" is relative, like "fast/slow". Right now, my benchmark for easy is `set [prolog content] load-xml/meta`. What does easy look like the way it is now?

[17:35](#msg61f4294c7842bd3ca96ba2d0)And I'm not asking to change it, just show users how it's done.

rebolek

[17:40](#msg61f42aa09a335454064627cc)Ok, I’ll add it to the docs. There need to be three variants, one for each format.

[17:41](#msg61f42adf82a4667b259b514a)Anyway, I’m finishing with the codec, I just need to add processing of metadata to `to-xml/as 'key-val`, if there are no further problems, then I need just to update the docs.

greggirwin

[18:08](#msg61f4310a6d9ba23328e47ac0)Please also see my latest comment on the PR WRT `#delayed`.

[18:08](#msg61f4313782a4667b259b5e4a)&gt; There need to be three variants, one for each format.

Yup. ;^)

pekr

[18:37](#msg61f437db46529077f5a9a4e8)When I saw #delayed and other cool tricks, I got a bit scared that we are going to end with the code golf :-)

hiiamboris

[18:46](#msg61f43a07742c3d4b21bdc914)who you're betting on @pekr? ;)

zentrog:matrix.org

[20:07](#msg61f44cf8d143b14f833d8749)&gt; my benchmark for easy is `set [prolog content] load-xml/meta`. What does easy look like the way it is now?

@greggirwin It's certainly useful to get just the content, but I don't know that grouping the prolog into a single value is all that helpful, since the things in it are likely unrelated. I think it's better to just keep the relative ordering of metadata items along with the content if you know you need both. You can sort it out yourself, and maybe the relative positions are relevant.

rebolek

[20:16](#msg61f44f2c46529077f5a9d270)@greggirwin it seems that you are the only one who wants to have the prolog separated.

## Saturday 29th January, 2022

greggirwin

[04:51](#msg61f4c7b75dc6213cd40612af)Yes, and as I said:

&gt; And I'm not asking to change it, just show users how it's done.

pekr

[08:12](#msg61f4f6e182a4667b259cc4d5)I would like to write down my last comment to the codecs PR. For me, the decision was all but wrong, the code does not even make sense, #delayed is looking weird, is not even needed there. How do I put code style there? Using backtick, like here on gitter?

hiiamboris

[09:23](#msg61f5077b7842bd3ca96d4225)Yeah.

[09:23](#msg61f50789526fb77b31a26629)There's preview button btw :)

## Wednesday 2nd February, 2022

rebolek

[09:28](#msg61fa4ea1dc191b3d698f6739)@greggirwin @hiiamboris I want to make one last-minute change. Currently, in the `triples` format textual data have this format:

```
none "Some text" none
```

to get it more in line with other formats and also make it a bit more readable, I propose to change the first `none` to `text!`:

```
text! "Some text" none
```

It’s non-controversial change IMO. Any thoughts?

hiiamboris

[09:38](#msg61fa510451bd8b580c82ebc8)Might work.

greggirwin

[17:49](#msg61fac40e3349fe1c71f0987d)That seems like a good change to me. Nice catch @rebolek.

## Thursday 3th February, 2022

greggirwin

[00:07](#msg61fb1cc2dc191b3d69910f67)Where can I get a big, nasty XML file to `profile` against? In the blog announcement, I thought it might be nice to show a comparison between formats.

[00:09](#msg61fb1d3aa41d896a2077df30)NVM, I found a 300K file here that should be enough. If somebody knows of a \*really* big one though, pass it on.

[00:15](#msg61fb1eba3349fe1c71f1534d)Or maybe that's already too big. :^( `not enough memory`

[00:16](#msg61fb1ed403f270478216da7f)So now we know something else we need to research and doc: current limitations.

[00:20](#msg61fb1fdd3349fe1c71f155eb)DOH! I must need sleep. The file is 318M. Oh my.

See why we need that `bytes` formatter @hiiamboris. :^)

[00:51](#msg61fb271fa41d896a2077f0f2)Cut it down to ~200M and it made a valiant effort. 150M crashed Red. ~8M worked fine and fast, just a few seconds to load. Duped the bulk of it back up to ~24M and still works fine.

```
Time         | Time (Per)   | Memory      | Code
0:00:15.714  | 0:00:15.714  | 232'350'964   | triples
0:00:16.503  | 0:00:16.503  | 54'074'716    | compact
0:00:17.003  | 0:00:17.003  | 71'993'260    | key-val
```

Here it is down to 1.5M

```
Time         | Time (Per)   | Memory      | Code
0:00:00.808  | 0:00:00.808  | 15'945'432    | triples
0:00:00.811  | 0:00:00.811  | 6'357'364     | compact
0:00:00.832  | 0:00:00.832  | 7'155'460     | key-val
```

[01:14](#msg61fb2c7e0779373db8c66cbd)And loading %test-3.xml (4K) 375 times:

```
Time         | Time (Per)   | Memory        | Code
0:00:00.839  | 0:00:00.002  | 6'084'772     | triples
0:00:00.839  | 0:00:00.002  | 6'250'580     | compact
0:00:00.852  | 0:00:00.002  | 5'170'256     | key-val
```

pekr

[05:26](#msg61fb676b708e9c3dd75d5f99)What's with this Triples taking 2-4x more memory?

rebolek

[08:19](#msg61fb902b3349fe1c71f21cee)It's not that memory efficient but maybe it can be optimized further.

[08:35](#msg61fb93ef3349fe1c71f224d0)@greggirwin thanks for the tests! 'triples' memory usage is interesting, I need to look at why it's so much higher.

hiiamboris

[08:40](#msg61fb94e43349fe1c71f22683)I wonder if this is data size in memory or temporary allocations as well.

rebolek

[08:50](#msg61fb974151bd8b580c857af5)I hope it's temporary allocations so I can get rid of them :)

greggirwin

[19:41](#msg61fc3000a41d896a207a0d81)I will note that in the blog.

## Friday 4th February, 2022

rebolek

[07:44](#msg61fcd949a41d896a207b4bdb)Here's an alternative solution how to deal with options in codecs ;)  
https://twitter.com/bikerglen/status/1482516332432162820

hiiamboris

[12:08](#msg61fd174103f27047821acb3b)there's a mess in the docs - 2 `!` and 2 `text!`:  
!\[](https://i.gyazo.com/d442575411a1b875f1bf04bfdb2d5c04.png)

rebolek

[13:06](#msg61fd24cd3349fe1c71f54bbe)@hiiamboris thanks, I missed that!

greggirwin

[19:25](#msg61fd7d96e4c979478d5fab09)Thanks to @rebolek's continued efforts, the XML codec PR can be merged at any time. Woohoo!

But there's always something else, isn't there? You see, he did what I asked, and now that it's done I can ask a question. I would like everyone to give their brief thoughts, and I will abide by the majority's decision. I apologize that this is a bit involved, and managerial in some respects, but my hope is that exercises like this will help us work more effectively as a team going forward.

It's important to understand that none of this is a criticism of Bolek's work. This is all of us working together, and him giving us artifacts to work against for design discussion. We're also learning \*how* to work as a team, when to run with ideas and when not to.

\[xml-tools.red](https://gitlab.com/rebolek/markup/-/blob/main/xml-tools.red) has a new `get-meta` function, to get the metadata.

The question is: what is the benefit of having metadata \*not* in a block? I was the only one who wanted it in a block, but I didn't know how to make my concerns about the current design clearer than I already had, so I asked Bolek to doc it. Now we have a concrete thing to see for comparison. Sometimes I have a plan. :^)

\[here](https://gitter.im/red/codecs?at=61f307095dc6213cd402b458) I specifically talk about how to ignore it, if it's included. Since we still have `/meta`, that would be how right now; don't use `/meta`. A few messages later I said this:

&gt; Right now, my benchmark for easy is `set [prolog content] load-xml/meta`

On 27-Jan (bear with me, I know this isn't fun) I asked:

&gt; 1) If you use /meta, how do you determine if any exists?  
&gt; 2) How do you find the root element, and treat it and metadata separately?

The second is as yet unanswered, the first partially. Use `get-meta` and see if it's empty. But then you still can't tell if it's in the doc part, because `get-meta` doesn't remove it, so question 2 still stands.

@rebolek's original points on why \*not* to put it in a separate block:

https://gitter.im/red/codecs?at=61f27549742c3d4b21ba3a58

Only the first one has any weight, especially now that `get-meta` returns only the prolog metadata, not all metadata for the document. And if there is no metadata it returns an empty block, just like Bolek's first point says. If people use `/meta`, are we concerned about the overhead of that empty block, or that it's confusing? I'm not. 1) It's XML and not small or efficient, 2) we doc how it works, returning two blocks.

That's the design part.  
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\__

For the implementation, I \*think* putting metadata in a separate block would entail hitting the end of the `prolog` rule and moving everything that is in the document block so far into a new block, removing it from the document block. Can't say for sure, and @rebolek may see a better way, e.g. an `in-prolog?` flag that `meta-action` uses to decide where to put meta values.

Then the user just does the `set [prolog content] load-xml/meta` dance and their done.

With the current approach, we add %xml-tools.red to the mix, and have ~70 lines of code with a few tricky bits in it. `Get-meta/as` lets users get the metadata in a different format than the doc. What is the use case for that @rebolek?

`Get-meta` is basically doing the same work the `meta-action` related bits in the main XML parser do, but against the Red structure, not the raw XML. So we're doing the same work twice. Prologs will be small, and I'm not concerned about performance overhead. Just that less code = less bugs and doing the same thing in two different places can lead to different results.

```
;1) Get %xml-tools.red from...
#include %xml-tools.red
doc: load-xml/meta <file>
meta: get-meta doc
;A) Select known root word from doc
;- or -
;B) ??? How do you skip the metadata?
```

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\__

Thanks for your time. I know this was long.

Please briefly list what you see as the \*benefits* of \*not* having the prolog in a separate block. I don't claim to be right and, again, I will abide by the majority's decision.

[19:28](#msg61fd7e4c03f27047821bae0c)I hit Gitter's message size limit, so had to edit a bit. Let me know if something doesn't make sense.

[19:29](#msg61fd7ea0dc191b3d6995e14a)The benefits I see for using a separate block are:  
\- Less code, and simpler.  
\- Easier for users.

hiiamboris

[19:39](#msg61fd80f34164105ab07fb0ee)I think Bolek's main point was that if you include metadata and you \*don't* know the structure, then you \*have* to write the parser, because even if you skip the prologue metadata, you still have to handle metadata that is found inside the \*contents* part. From that perspective, neither `get-meta` nor having a block seems very useful.

greggirwin

[19:39](#msg61fd8103d410244480473300)@rebolek I want a DIP stick! :^)

[19:42](#msg61fd81a31fe6ba5a970c42ad)@hiiamboris sooo...oy, `/meta` includes it everywhere, and not using it leaves it out for the entire doc?

hiiamboris

[19:42](#msg61fd81bf3349fe1c71f6109c)So I believe.

greggirwin

[19:45](#msg61fd824241e3293d65d7b764)Wow. Not sure how I missed this in all the chat. :^\\

hiiamboris

[19:46](#msg61fd8288e4c979478d5fb4b6)For finding the root wouldn't simple `parse data [to [set w word! if (#"!" <> last form w)] data:]` work for all formats?

greggirwin

[19:46](#msg61fd829f41e3293d65d7b839)And testing. I must have only ever used `/meta` on files that had it for testing, and never \*not* used it on those.

[19:48](#msg61fd82f33e52f56a26ea74c5)Not sure I'd call that "simple", but if we wrap it in a `find-root` helper it's fine.

hiiamboris

[19:49](#msg61fd83476e4c1e1c844ab3dd)Well, with HOFs it could be `locate data [w [word!] .. #"!" <> last form w]`.

[19:49](#msg61fd835351bd8b580c895e7e)Anyway, it's not 70 LOC.

greggirwin

[19:50](#msg61fd838b708e9c3dd761a15f)That's no shorter than the `parse` approach though. `Locate` has more meaning of course.

hiiamboris

[19:50](#msg61fd83973e52f56a26ea7600)Agree.

greggirwin

[19:51](#msg61fd83ba0779373db8cb1bbf)`Get-prolog` is then splitting at `find-root`.

hiiamboris

[19:52](#msg61fd83e041e3293d65d7baa8)`split` into runtime! :)

greggirwin

[19:52](#msg61fd83ff3e52f56a26ea7695)This month, `split` and `format`. :^)

hiiamboris

[19:53](#msg61fd843a6e4c1e1c844ab601)It depends how lagging behind are you ;)

greggirwin

[19:55](#msg61fd84b41fe6ba5a970c474d)Looking at prologs in each format, that approach would seem to work. @rebolek, do you agree?

zentrog:matrix.org

[20:02](#msg61fd865e0779373db8cb2181)It sounds like a good approach to me. Maybe `find-element` instead of `find-root` though, since it's not just specific to the root of the doc.

greggirwin

[20:03](#msg61fd8685b8b08244821a81e9):+1:

hiiamboris

[20:54](#msg61fd9285e4c979478d5fd272)What's the place for this function though?

greggirwin

[21:25](#msg61fd99e70779373db8cb4824)In the docs to start.

[21:26](#msg61fd99f50779373db8cb4846)Could also be in the XML codec though.

hiiamboris

[21:40](#msg61fd9d55708e9c3dd761da52)But it's an anonymous context.

greggirwin

[21:41](#msg61fd9da61fe6ba5a970c7971)`Set` will still work to make it global, but then we have a naming issue. :^\\ Nothing is easy.

hiiamboris

[21:42](#msg61fd9dd53e52f56a26eaad97)This is something so specific that it should be kept in a namespace.

greggirwin

[21:43](#msg61fd9de43e52f56a26eaadcd)Agreed.

[21:44](#msg61fd9e2b51bd8b580c8994c7)So docs it is for now.

rebolek

[21:45](#msg61fd9e5e6e4c1e1c844aee39)&gt; 2) How do you find the root element, and treat it and metadata separately?

That's easy, skip prolog metadata, first tag you encounter is the root tag.

&gt; especially now that get-meta returns only the prolog metadata, not all metadata for the document.

No, it recursively scans whole document. If it misses something, it's a bug but with the test file I used, it works fine.

&gt; Get-meta/as lets users get the metadata in a different format than the doc.

There's no format autodetection. The function doesn't know what's user feeding to it, same as `to-xml`. That's why `/as` is needed. We probably can add autodetection but I'm not sure it's worth it.

[21:46](#msg61fd9ec651bd8b580c89962c)&gt; From that perspective, neither get-meta nor having a block seems very useful.

@hiiamboris I agree, I don't see the point of separating metadata from the structure. Maybe my biggest mistake was to introduce `/meta`, maybe I should have included metadata always and nobody would probably ever think about separating them from the rest of the content.

[21:47](#msg61fd9ef74164105ab07ff5b2)&gt; /meta includes it everywhere, and not using it leaves it out for the entire doc?

@greggirwin yep, that's the point. It leaves things like comments out from the whole doc, not just from prolog.

greggirwin

[21:48](#msg61fd9f47d410244480477016)&gt; No, it recursively scans whole document. If it misses something, it's a bug but with the test file I used, it works fine.

I think it's a bug then. Can you test against this file?

[21:49](#msg61fd9f523349fe1c71f64ff5)\[prolog+pi+cdata+cmt.xml](https://files.gitter.im/600719b0d73408ce4ff93018/PdEd/prolog-pi-cdata-cmt.xml)

[21:49](#msg61fd9f7d51bd8b580c8997a4)&gt; There's no format autodetection. The function doesn't know what's user feeding to it, same as to-xml.

Ahhhh, I see now. Hmmm.

[21:52](#msg61fda01641e3293d65d7f65d)I think from past chat that `/meta` \*may* be useful, but we can't say for sure. We did talk about always including it. And we can change our minds once we get some feedback (not too hopeful on that though ;^). While it's wasteful to post-process and remove it, that's an option.

rebolek

[21:52](#msg61fda01803f27047821bf326)That's actually the file I was using to test it :) And it works:

```
>> print mold get-meta load-xml/meta %data/prolog-pi-cdata-cmt.xml
[
    xml! none [
        version: "1.0" 
        encoding: "UTF-8" 
        standalone: true
    ] 
    doctype! {data SYSTEM "./data/menu.dtd"} none 
    PI! xml-stylesheet {type="text/css" href="/style/design"} 
    PI! xml-stylesheet {type="text/xsl" href="menu.xsl"} 
    comment! "Prolog comment 1" none 
    PI! welcome "to the real world" 
    PI! welcome "x" 
    PI! welcome "" 
    comment! "Prolog comment 2" none 
    cdata! "Customer 1 CDATA" none 
    comment! "Customer 1 comment" none 
    PI! cust-1-PI {type="app/red" href="/root/path"} 
    PI! cust-2-PI-1 {type="app/red" href="/root/path/1"} 
    PI! cust-2-PI-2 {type="app/red" href="/root/path/2"} 
    comment! "Customer 2 comment 1" none 
    cdata! "customer 2 CDATA 1" none 
    cdata! "customer 2 CDATA 2" none 
    comment! "Customer 2 comment 2" none
]
```

greggirwin

[21:53](#msg61fda0480779373db8cb543f)OK, I need to make sure I'm synced here. Thanks.

rebolek

[21:53](#msg61fda062e4c979478d5fef08)Of course you loose the structure, it returns just a flat block.

greggirwin

[21:56](#msg61fda121dc191b3d69962704)The problem is that it only works with `triples`, not for other formats. That's what I was seeing.

```
>> print mold get-meta load-xml/meta/as %data/prolog+pi+cdata+cmt.xml 'key-val
[
    xml! [
        version: "1.0" 
        encoding: "UTF-8" 
        standalone: true
    ] doctype! 
    PI! ["xml-stylesheet" {type="text/xsl" href="menu.xsl"}] comment! 
    PI! ["welcome" "x"] PI!
]
>> print mold get-meta/as load-xml/meta/as %data/prolog+pi+cdata+cmt.xml 'key-val 'key-val
*** Script Error: PARSE - unexpected end of rule after: into
*** Where: parse
*** Near : [collect into output [any [keep pick [['xml! ] ] ]]]
*** Stack: get-meta key-val  

>> print mold get-meta/as load-xml/meta/as %data/prolog+pi+cdata+cmt.xml 'compact 'compact
*** Script Error: PARSE - unexpected end of rule after: into
*** Where: parse
*** Near : [collect into output [any [keep pick ['xml! ] ]]]
*** Stack: get-meta compact
```

rebolek

[21:58](#msg61fda16841e3293d65d7f864)Ah, a bug. Sorry about that, I'll fix it.

greggirwin

[21:58](#msg61fda16ae4c979478d5ff0a4)So the prolog part was still returned, but the rest wasn't.

Will @hiiamboris' approach work? That should solve it.

[21:58](#msg61fda183dc191b3d69962816)This one: https://gitter.im/red/codecs?at=61fd8288e4c979478d5fb4b6

rebolek

[21:58](#msg61fda1961fe6ba5a970c80f8)This:

```
print mold get-meta load-xml/meta/as %data/prolog+pi+cdata+cmt.xml 'key-val
```

works by accident. It's interpreting `key-val` data as `triples`.

greggirwin

[21:59](#msg61fda1b03e52f56a26eab61b)&gt; works by accident

Like most software. ;^)

rebolek

[21:59](#msg61fda1c1a41d896a207cec5f)`get-meta/as ...` is the proper code but runs into a bug.

[22:02](#msg61fda2696e4c1e1c844af6ab)Ah, it's a result of a last-minute optimization...

[22:03](#msg61fda2c4b8b08244821ab937)Reverted to the working version.

greggirwin

[22:05](#msg61fda33a4164105ab07ffd9a)Sorry, my note on Boris' idea was for finding the root. Mixing up chat. :^\\

rebolek

[22:06](#msg61fda35c4164105ab07ffdd4)&gt; Will @hiiamboris' approach work? That should solve it.

Yes. I would prefer testing for metatags (there's just five of them) instead of `form`ing a word, but that's just an implementation detail.

[22:07](#msg61fda39741e3293d65d7fd01)&gt; Sorry, my note on Boris' idea was for finding the root. Mixing up chat. :^\\

No problem, I can parse it ;) I probably should reply in a thread but I still can't get used to them.

greggirwin

[22:07](#msg61fda39ed410244480477a45)That's fine. Please add it to docs, wrapped in a func called `find-element` as @dander proposed, unless a better name comes up.

[22:07](#msg61fda3ab0779373db8cb5a60)Threads on Gitter kill me.

[22:08](#msg61fda3cfe4c979478d5ff538)Whew! I have some blog revising to do now. :^)

rebolek

[22:09](#msg61fda4294164105ab07ffede)&gt; Please add it to docs...

OK, will do.

greggirwin

[22:10](#msg61fda43d03f27047821bfc2e)Thanks!

rebolek

[22:10](#msg61fda46bced11857f993e93a)But probably tomorrow, sorry, it's getting late here.

greggirwin

[22:11](#msg61fda4840779373db8cb5c22)NP.

[22:12](#msg61fda4d4a41d896a207cf2c1)We should probably also port https://gitlab.com/rebolek/markup/-/blob/main/README.md to a wiki page, to match JSON and CSV, until we add them all to docs for real.

rebolek

[22:13](#msg61fda50a3e52f56a26eabdcb)Of course, that repo is just for the development, I will move it to the Red wiki.

## Saturday 5th February, 2022

greggirwin

[02:15](#msg61fdddaf51bd8b580c8a0c9a)I'm excited to get this out, and have a lot of fun tasks for @rebolek to move on to. ;^) We should make notes, however, of things that support \*all* codecs, like examples and benchmarks. Once we have a wiki page up for XML, I'll think about that and anybody else is free to add notes to the codec wiki pages to help.

We will pale in comparison to optimized loaders for any given format, but that's OK. Our goal is practical use, and I will defend our position. In the future, there may be other codecs for formats, and that's OK.

[02:19](#msg61fdde9cced11857f99459f9)When I say "benchmarks" I don't mean direct comparisons. I mean telling people roughly what performance to expect, so if they look at their data they can decide if Red's standard XML codec is worth trying. If they see we can do 1.5MB/s and need 50x that, or if their files are massive, we can save them time by ruling it out.

And if I put ~1.5MB/s in the blog, is everybody OK with that?

[02:22](#msg61fddf713e52f56a26eb2b22)Maybe we should move \[this section](https://github.com/red/red/wiki/JSON-codec#references-comparisons-benchmarks-etc) from the JSON page to a general codecs page.

[02:36](#msg61fde2baa41d896a207d66bc)I just skimmed the \[CSV cocec](https://github.com/red/red/wiki/CSV-codec) page, and I \*really* like the way it's set up, which I had forgotten. Explaining the different formats with examples like that is fantastic.

pekr

[06:22](#msg61fe17966e4c1e1c844bc108)Isn't 1.5MB/s nowadys ... too slow?

rebolek

[06:34](#msg61fe1a77a41d896a207dc8ce)It's interpreted code, I haven't done optimizations and you get a Red data structure. I guess it depends of what kinf of XML data you are using. If they're config files in sub-MB teritorry, then it'đ fine. If they are multi-MB files, then converting them to Red doesn't much sense because of the memory usage.

pekr

[06:50](#msg61fe1e32a41d896a207dcf30)My most common use would be probably interfacing. So basically converting XML template to Red values. Reading and manipulating some data then, in terms of the Red "xml" block, outputting the resulting XML file, sending it to consuming interface.

[06:53](#msg61fe1efdd410244480485576)The code is probably too complex for a Red vs R2 (or R3) comparison, but those who found Red's parse being almost an order of magnitude slower, than R2, was accused of using an edge cases. The usage of more real-life scenarios like codecs for e.g., might be a nice test-bed to find out, what is the real-life difference.

rebolek

[07:09](#msg61fe22a341e3293d65d8e10e)@greggirwin re: `find-root`/`find-element`

IMO it makes sense to add both functions. `find-element` for finding \*any* element in the doc (actually all occurences of the element, IMO) and `find-root` as the specialized version that would skip prolog.

pekr

[07:10](#msg61fe22e03e52f56a26eb9b50)I like find-element to find any element ....

[07:11](#msg61fe2337b8b08244821b9a53)How my code could look like? For e.g.: `foreach element find-element xml-data element-name [do code]`?

rebolek

[07:21](#msg61fe2572b8b08244821b9e62)Yes, that's basically it. It should also support finding elements by their attributes, but we can add that later.

pekr

[07:36](#msg61fe2903d4102444804867c0)All that might be useful. I remember the need to find by ID, CLASS. We need the ability to filter out to certain elements. You might have two tables, identical elements, but they will differ in ID or CLASS .... but then I am talking HTML mostly.

greggirwin

[19:30](#msg61fed06e6e4c1e1c844d1a0d)@rebolek I'm fine with both. @dander @hiiamboris what do you think?

[19:33](#msg61fed1026e4c1e1c844d1b78)On general finding and filtering. The parallels to XPath/XQuery/XSL all happen at the next level. First we needed to define the structures for them to work against (and we have 3 :^\\).

hiiamboris

[19:42](#msg61fed33e6e4c1e1c844d1f8b)Since they will only live in the docs, I don't care ☻

[19:49](#msg61fed4b84164105ab082324c)For querying, I wrote a dialect: https://gitlab.com/hiiamboris/icu/-/blob/main/extract-locale.red#L326  
I just couldn't make anything useful with the CLDR without it, especially because I need to look for data in multiple files at once. And it makes XML iteration &amp; filtering much cleaner than generic `for-each`. But it's still very limited, driven by one use case only.

greggirwin

[19:56](#msg61fed689ced11857f99618cd)&gt; Isn't 1.5MB/s nowadys ... too slow?

@pekr, "too slow" isn't a number, and has no context. Is it too slow for people who know they need 1GB/s? Yes. What are those use cases and how frequently do they occur? Is it too slow for solving a huge number of real world problems? No.

Do I want it to be 10x faster? You bet I do.

1\) If someone needs to process more than 375 4K files per second, do we say "Sorry, it's too slow.", or do we say "Can you run multiple instances?"

2\) Do we sell Red's performance or overall capabilities? "Yes, Ms. XML user, you have to wait an ungodly 15s if your file is 25M (no sarcasm here, that's an unbearable amount of time to wait for a file to open). But what you get in return as a working GUI app in an hour, rather than mixing a fast C++ parser converting to JSON, and a web UI running against a local server." That is, marketing. ;^)

3\) How much of the total work time is XML loading? It's like the native vs mezz `loop` overhead question. If the only thing you're doing is loading XML we're really slow. As soon as you start doing real work with that data, what percentage of the time is that, compared to loading?

[20:08](#msg61fed92bb8b08244821ce895)&gt; But it's still very limited, driven by one use case only.

That's a good place to start. Infinitely better than zero use cases. :^)

[20:10](#msg61fed99f3e52f56a26ecec06)Typos in your code @hiiamboris. `greg-format` should be `gregg-format`, etc. ;^)

[20:11](#msg61fed9ffdc191b3d69985653)One of my oldest friends took to calling me Gregorious decades ago, and does it to this day.

hiiamboris

[20:15](#msg61fedae1b8b08244821ceb81)&gt; Typos in your code @hiiamboris. `greg-format` should be `gregg-format`, etc. ;^)

I thought about that :D

## Sunday 6th February, 2022

zentrog:matrix.org

[19:33](#msg6200229e3e52f56a26ef3a35)If there are going to be some more powerful searching functions which support things like recursion and predicate-based matching, then it may be redundant to have a specialized one built into the xml codec. Once the xml has been converted to red data, we should try to process them with generic processing functions, but there may be some predicates that are specific to the xml formats, like `element?` that would tell whether a particular word represents an element or something else.

hiiamboris

[19:47](#msg620025c96e4c1e1c844f89bd)With properly structured data there may be no need for complex processing utilities. XML is just very badly structured data.

[19:48](#msg62002618a41d896a208180fa)Of course, I agree that if we write such utility it should be general.

greggirwin

[20:20](#msg62002da94164105ab0849a4b)We're all on the same page. Generalize as much as possible, so things are consistent across common data models, but then add custom bits that fit each special need.

## Monday 7th February, 2022

zentrog:matrix.org

[00:35](#msg62006960d4102444804c77a0)The point I was going for was that it may be a bit premature to add more advanced searching/processing functions if those are going to be handled in a more general sense. If `find-root` or `find-element` are simple or can be considered temporary, it seems fine to add them. I still don't quite understand the distinction between them though, unless the idea is to make `find-element` much more powerful.

greggirwin

[00:47](#msg62006c380779373db8d05ec9)We're on the same page. Advanced search and filter will be general, and these are helpers for this specific need. `find-root` is a nice name, and more meaningful than something like `find-element` vs `find-element/deep`. It could be `find-element/root` to reverse that logic of course. The root is the starting point, and there can be only one. That makes it easy. If we do `find-element` it raises other questions (First? All? params, etc.), so it will be only an \*example* of how to write something like that. A strawman if you will.

Now that we have the foundation, the key questions to ask are:

\- What are the most common tasks you perform once you have a document?  
\- What are the biggest pain points?  
\- Can we research prior art and guess at the best general solutions, or are we better off building ad hoc solutions, collecting those, and \*then* seeing where the sweetest low-hanging fruit is?

pekr

[06:09](#msg6200b7aeb8b0824482203709)Gregg, we've got already names - head/tail, first/last ... so why to invent root?

rebolek

[06:13](#msg6200b8a6b8b0824482203870)`find-element/deep` - I don't think it makes sense to have flat search, XML structure is a tree, it should always search in nodes. So `find-element/deep` should be `find-element`.

pekr

[06:14](#msg6200b8b7708e9c3dd7677c38)+1

zentrog:matrix.org

[08:51](#msg6200dd75e4c979478d65caa1)Blocks can also be trees. Probably anything we come up with searching in decoded xml could be generalized for recursive block searching as well

rebolek

[09:23](#msg6200e513d4102444804d606f)True. But flat blocks are more common in Red than flat structure in XML IMO.

greggirwin

[18:47](#msg6201694f4164105ab086fb36)So to get the root you do `first find-element ...`?

rebolek

[18:50](#msg620169f8dc191b3d699d2ea3)No, `find-element` takes element's name as an argument and you don't know what is the root element going to be. That's why there's also `find-root`.

pekr

[18:51](#msg62016a3c3349fe1c71fd5798)There is a proposal for a node! type. If we want to have something re trees, I would expect similar proposal. find-root looks like a quick hack.

greggirwin

[18:52](#msg62016a7e1fe6ba5a97138e7b)@rebolek Ahhhh, right.

pekr

[18:53](#msg62016aa0ced11857f99af4fd)The question is, if the discussion is not preliminary. Let's get it out and improve in future. My feeling is, that whatever we chose now, is not backed by enough experience based upon a practical usage. Well, apart from few gurus here, who can think few steps ahead :-) ....

greggirwin

[18:53](#msg62016ab903f270478222ec5e)@pekr, we have to think very, very, very, very, very small here, or it won't ever get released.

rebolek

[18:53](#msg62016abb3e52f56a26f1c257)`find-root` is a quick hack, yes. But it's OK for now. Alo, you can just don't add `/meta` and then the root element is the first element.

greggirwin

[18:54](#msg62016accced11857f99af54f)And we're only adding it in docs.

rebolek

[18:54](#msg62016aefd4102444804e84fa)Right. And to the separate repo with XML-tools file.

greggirwin

[18:55](#msg62016b136e4c1e1c8451f79d)Or put %xml-tools.red in red/code.

rebolek

[18:55](#msg62016b3a6e4c1e1c8451f83d)Ah, good idea.

[18:56](#msg62016b4d0779373db8d259d8)I'll fix the docs tomorrow and move the file to red/code.

greggirwin

[19:03](#msg62016d1ba41d896a2083fa0f):+1:

## Wednesday 9th February, 2022

rebolek

[10:07](#msg620392573e52f56a26f618df)Wiki page moved (copied) to https://github.com/red/red/wiki/XML-codec

ldci

[11:35](#msg6203a6f541e3293d65e36e8b)@rebolek Thanks a lot :)

[12:13](#msg6203aff2dc191b3d69a1c6b8)Have a look here: https://www.ephe.psl.eu/actualites/projet-serenite-remettre-le-conducteur-au-centre-du-vehicule-autonome-et-connecte. Red language will be used for developping the digital twin:)

rebolek

[12:14](#msg6203b034d410244480531da3)@ldci wow, that sounds pretty cool!

ldci

[12:17](#msg6203b0bcced11857f99f898f)Oups, not the good room:)

hiiamboris

[12:30](#msg6203b3fc6e4c1e1c8456ac5c)should that wiki page have a `[DOC]` prefix?

rebolek

[12:34](#msg6203b4e94164105ab08b9dca)I don’t know, is there a styleguide?

hiiamboris

[12:35](#msg6203b51b1fe6ba5a97182b5c)\\* scratches the head...

[12:35](#msg6203b5293e52f56a26f65f5f)not that I recall

rebolek

[12:37](#msg6203b57ddc191b3d69a1d197)CSV codec page doesn’t have that prefix. But if it’s preferable, I can change both. @greggirwin ?

Oldes

[13:00](#msg6203bae0e4c979478d6bbd39)@rebolek you have a bug in one example:

[13:00](#msg6203bae403f270478227b72d)\[!\[image.png](https://files.gitter.im/600719b0d73408ce4ff93018/bJnC/thumb/image.png)](https://files.gitter.im/600719b0d73408ce4ff93018/bJnC/image.png)

rebolek

[13:45](#msg6203c5781fe6ba5a97184fa7) @Oldes thank you! Fixed.

endo64

[13:57](#msg6203c83851bd8b580c956930)When we organize the old wiki pages messes with GregT we've added prefixes to all the pages like ARCHIVE (old outdated pages), DOC (pages that probably used when we build official docs), HOWTO, LINK (to external sources), NOTES (to keep notes that won't be part of the official docs, but we direct users to) and PROP for proposals later moved to a repo.  
But later we loose tracking the newly added pages.

rebolek

[14:23](#msg6203ce7b41e3293d65e3ca3e)@endo64 thanks, I’ll the \[DOC] prefix to codec docs then.

## Tuesday 15th February, 2022

greggirwin

[19:40](#msg620c01b9a41d896a20998ffc)Quick question @rebolek. I had an old console open for XML play, and doing some blog work ran some tests. Saw that the result of `load-xml` is not copied. Not sure how I missed this before. Is that fixed in the PR version? e.g.

```
>> compact-data: load-xml/as src 'compact
== [
    Migration [
        Session [#Name "Main gather (Machine Independent)" #Type "Online" 
            Platform [#Typ...
>> kv-data: load-xml/as src 'key-val
== [
    Migration [
        Session [
            attr! [Name "Main gather (Machine Independent)" Type "Online"] 
       ...
>> compact-data
== [
    Migration [
        Session [
            attr! [Name "Main gather (Machine Independent)" Type "Online"] 
       ...
```

BuilderGuy1

[19:40](#msg620c01c9ced11857f9b0694b)I'm looking for the docs for CSV and JSON but I can't find them in the wiki. Could someone post a link to them. Thanks!

greggirwin

[19:41](#msg620c01f1d41024448064172f)Search for `codec` in the wiki and they should show up.

hiiamboris

[19:41](#msg620c01f641e3293d65f46231)https://github.com/red/red/wiki/CSV-codec

[19:42](#msg620c02090779373db8e7daa5)https://github.com/red/red/wiki/JSON-codec

BuilderGuy1

[19:43](#msg620c027251bd8b580ca61e1b)Awesome! Thanks !

greggirwin

[19:44](#msg620c02a8e4c979478d7c79cd)@rebolek seems the same in the PR, as `clear target` is used.

[19:45](#msg620c02f6dc191b3d69b2c5e0)While reusing the buffer is more efficient, it's not safe in this context.

rebolek

[19:46](#msg620c030adc191b3d69b2c60a)@greggirwin Ok, I take a look at it and fix it. Thanks letting me know!

greggirwin

[19:46](#msg620c0316708e9c3dd77e6d98):+1:

## Wednesday 16th February, 2022

toomasv

[12:57](#msg620cf4c541e3293d65f65066)@rebolek There seems to be problem with `load-csv/as-records`:

```
>> load-csv/as-records {"A","B"^/"1","2"}
*** Script Error: append does not allow map! for its series argument
*** Where: append
*** Near : value char
*** Stack: load-csv
```

But these work:

```
>> load-csv/as-records/header {"A","B"^/"1","2"}
== [#(
    "A" "1"
    "B" "2"
)]
>> load-csv/as-records {"A","B"^/1,"2"}
== [#(
    "A" "A"
    "B" "B"
) #(
    "A" "1"
    "B" "2"
)]
```

hiiamboris

[12:58](#msg620cf50c3349fe1c7114b504)https://github.com/red/red/issues/5075

toomasv

[12:59](#msg620cf5264164105ab09e5b2c)Ah, thanks!

rebolek

[13:34](#msg620cfd82e4c979478d7e7475)@toomasv thanks, I'll fix it

[14:02](#msg620d03f8a41d896a209ba1be)https://github.com/red/red/pull/5077

toomasv

[17:32](#msg620d3516a41d896a209c136e):+1:

## Saturday 6th August, 2022

GiuseppeChillemi

[15:40](#msg62ee8b7105ad4a3701f490ff)@rebolek  
I am not able to run the code at the end of the script for \[get-table](https://github.com/rebolek/red-tools/blob/master/html-tools.red)

How should I do? I have tried various combinations, loading `%xml.red` and `%html-tools.red` and `codepage.red` with no succes

## Thursday 11st August, 2022

rebolek

[08:16](#msg62f4baf905ad4a370120d3dc)@GiuseppeChillemi I take a look and let you know

## Monday 31st October, 2022

toomasv

[05:24](#msg635f5c200a8c6e22a1e953cc)While trying to save as redbin a tree of objects with references from children to parent (like view layout), I get error:

```
save/as %tmp layout [panel [field button]] 'redbin

*** Access Error: cannot decode or encode (no codec): handle!
*** Where: encode
*** Near : codec/encode :value dst
*** Stack: save
```

Am I doing something wrong, is it expected, or TBD, or bug?

Oldes

[05:32](#msg635f5dea21df5f7a54c79be7)Handle is a pointer to system resource and cannot be loaded / restored.

toomasv

[06:42](#msg635f6e39a3ccb16cbe32d57c)Ok, thanks!

[07:45](#msg635f7d26aa210536d637da3b)Any suggestions how to save/load such things?

dockimbel

[09:33](#msg635f965edcbf067fdcbd03f2)@toomasv Set all `face/state` to `none`.

[09:35](#msg635f96facf41c67a5cd79c1e)Hmm, `layout` is connecting the root face generated to the `screen` face. It should not, only `view` or `show` should do that.

toomasv

[10:37](#msg635fa55321df5f7a54c81e3a)Ok, thanks!

dockimbel

[10:42](#msg635fa683aa210536d63825c5)It seems that trying to mold face objects results in pulling in the global context too as a dependency. I'm having a quick look at it to see why exactly.

[11:55](#msg635fb7aacf41c67a5cd7d5bf)Even when using `layout/only` to avoid the creation of a window root face attached to the screen face, the serialization still chokes, but on routines. The culprit is the `/option` block created from a \[template](https://github.com/red/red/blob/master/modules/view/VID.red#L700) bound to `system/view` which contains routines.

If the binding of that template block is forced to the global context, the serialization still fails because of the face event handlers, `on-change*` mostly, which contains references to `system/view` context or other contexts like \[`system/reactivity`](https://github.com/red/red/blob/master/modules/view/view.red#L435).

[12:10](#msg635fbb4a5b0dbc04b8abe383)As soon as you are trying to serialize some code that was evaluated, the dependencies pulled through referenced contexts will explode. One of the main contributors are evaluated paths, as the interpreter will tend to bind the path words to their partially evaluated parent objects in order to speed up interpretation. In doing so, it often will bind a path word that was global to a local context, expanding the dependency graph.

[12:17](#msg635fbcdf0a8c6e22a1ea0327)Even if Redbin encoding was ignoring handles and routines, it would still result in a pretty huge payload, even for a single simple face object. So, complex objects like faces, with event handlers with big dependencies are not well-suited for full serialization. A good solution would probably be to have an intermediary layer that would convert those face objects into an intermediary representation more suitable for Redbin encoding, and a decoding layer on the other side, capable of reconstructing such face objects, even reallocating again the system resources they depend on. Ideally, using such intermediary framework, you could serialize displayed faces, send them to another Red session, and get them decoded and redisplayed with just a simple `load` call.  
As a side note, such "special" encoding layer could be some user-provided plugins to Redbin, which could be triggerred as a front layer on Redbin invocation, when those special values or datastructures are recognized.

[12:19](#msg635fbd4df00b697fec68ef66)Same approach could work for opened ports too.

toomasv

[13:30](#msg635fcdef21df5f7a54c86cc4)Thanks! For now I solved it with saving the tree as simple object, and manipulating it with parse after loading (removing `parent: make object! [...]` parts) and then reallocating resources and recording references again throughout the tree.

## Tuesday 1st November, 2022

hiiamboris

[22:55](#msg6361a3def00b697fec6c8e20)I think such plugin would be too tightly tied to the particular implementation version of the View module. On a different remote version, unlikely will do any good.

## Wednesday 2nd November, 2022

dockimbel

[13:19](#msg63626e45dcbf067fdcc26784)I don't see any problem with that, users could overwrite the plugin for a specific datastructure when needed. "User-provided" means that you can freely add/remove/replace any plugin there.

hiiamboris

[17:21](#msg6362a705cd9a8436d146e156)But we shouldn't expect users to know the internals of View, which are needed to build such plugin properly.

greggirwin

[18:47](#msg6362bb43f00b697fec6ea5b3)It's a cool technical problem to think about, but is there value that makes it worth the effort? Rather than working at the displayed faces level, would it make more sense to use an XWindows approach where net speed is high enough, or a VID+state management system that lets you send VID and a current state to recreate it somewhere else? Most important, of course, is use cases.
