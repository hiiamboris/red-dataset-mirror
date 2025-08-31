
#3932: Referencing an object inside itself doesn't work
================================================================================
Issue is closed, was reported by ALANVF and has 24 comment(s).
<https://github.com/red/red/issues/3932>

**Describe the bug**
Using an object as an argument type for a function inside itself doesn't work, instead saying that the object has no value.

**To reproduce**
```red
thing!: object [
	f: func [t [thing!]] [print true]
]
```

**Expected behavior**
It should run fine.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 21-Nov-2018/20:40:38-04:00 commit #755eb94ut
```


Comments:
--------------------------------------------------------------------------------

On 2019-07-03T22:20:50Z, greggirwin, commented:
<https://github.com/red/red/issues/3932#issuecomment-508274238>

    > It should run fine.
    
    No, it shouldn't. You're not using Red correctly in this case. Read up on datatypes and typesets, and join Gitter chat. The help room is great for people new to Red, and learning the concepts.
    
    In the future, please run things by people on Gitter before opening tickets, to confirm that they're valid.

--------------------------------------------------------------------------------

On 2019-07-03T22:32:59Z, ALANVF, commented:
<https://github.com/red/red/issues/3932#issuecomment-508276705>

    Ok, I must have confused this with something from another language. By the way, are there any plans to make things like this work in Red?

--------------------------------------------------------------------------------

On 2019-07-03T22:44:09Z, greggirwin, commented:
<https://github.com/red/red/issues/3932#issuecomment-508278945>

    "things like this" is too vague. We've talked about dependent type systems, but it's not likely that object definitions as types will be in the base language. However, that doesn't mean you can't write support for it at the mezzanine (user) level.

--------------------------------------------------------------------------------

On 2019-07-07T19:57:10Z, dumblob, commented:
<https://github.com/red/red/issues/3932#issuecomment-509026254>

    @greggirwin is there a place with all such misunderstandings about Red which appeared so far over the years (Rebol documentation doesn't have anything like that; second, such stuff seems more and more Red specific)? It would be very helpful to newcomers (instead of asking over and over about the same or similar stuff).
    
    I couldn't find any such place (there is slight overlap with the current content on GitHub wiki, which has otherwise a lot of content - mainly ideas though, but that's far from enough and sometimes it seems also deprecated :cry:).

--------------------------------------------------------------------------------

On 2019-07-07T20:54:52Z, 9214, commented:
<https://github.com/red/red/issues/3932#issuecomment-509030099>

    > is there a place with all such misunderstandings about Red which appeared so far over the years?
    
    Hackernews **/s**
    
    More to the point: we don't document other's people initial assumptions and biases WRT Rebol / Red (esp. if they didn't bother to learn the language first, or at least to skim the docs), although ideas about "Red for X programmers" pages were raised a couple of times. The closest we have is [this](https://github.com/red/red/wiki/[DOC]-Red-Should...-(Feature-Wars)) page stub.
    
    Problem is that Red has an unique heritage (Forth + Lisp + Logo), and its features have no equivalents in popular mainstream programming languages; explaining them in terms of analogies and other's misunderstandings (e.g. "oh it's just like X only Y" or "just imagine G but with H") isn't very helpful to newcomers and at times is downright misleading. Not to mention that everyone has different skillsets, and what's obvious for one might be a total mystery for the other.
    
    I can tell from experience that main stumbling blocks are core concepts (series, binding, homoiconicity) and technical nuances (e.g. `load` and `do` phases, polymorphism, type system, evaluation order, values and datatypes, in-memory data representation, etc). It would be more productive to document them in an accessible way.
    
    It's hard to say what OP expected in this particular case: either that object should act as an abstract type (which partially makes sense, since internal type hierarchy is object-oriented; I believe `port!`s also work in a similar way), or that "method" should receive a "self" object during "message passing" (which doesn't make sense, because language simply doesn't work that way).

--------------------------------------------------------------------------------

On 2019-07-07T21:40:20Z, dumblob, commented:
<https://github.com/red/red/issues/3932#issuecomment-509032919>

    >The closest we have is this page stub.
    
    As a newcomer I actually read most of the wiki (that's actually tons of text which is quite often not much useful) and that's exactly why I've written, that the overlap is rather negligible than important.
    
    >I can tell from experience that main stumbling blocks are core concepts (series, binding, homoiconicity) and technical nuances (e.g. load and do phases, polymorphism, type system, evaluation order, values and datatypes, in-memory data representation, etc). It would be more productive to document them in an accessible way.
    
    This is actually what I meant, but viewed from a newcomer (this doesn't necessarily mean **beginner**) point of view - namely in terms of "how do I do something more or less similar to creating an object instance and calling a method". From my experience the very best thing is [Learn X in Y minutes](https://learnxinyminutes.com/docs/red/ ) as it usually contains majority of "caveats", "gotchas", etc.
    
    Someone who wrote several wildly different interpreters and compilers (Prolog-like, C-like, Lua-like, Lisp-like) will have absolutely no problem with understanding Red/Rebol, but will **not know any** of the *"technical nuances"* which shall be therefore somewhere listed (I would definitely advocate for making *Learn X in Y minutes* a reference place for this). Showing extreme examples ("hard to read and understand, but informationally rich and dense") is the best way of doing it as it forces the newcomer to get through "hell" and then she'll know "everything" and will develop sense for "what to expect" and "what to look for" in all situations.

--------------------------------------------------------------------------------

On 2019-07-07T22:09:17Z, ALANVF, commented:
<https://github.com/red/red/issues/3932#issuecomment-509034586>

    Yeah so I had started using Red again (I'd been doing another project), and I guess I had forgotten how some stuff worked (although I'd love to have objects act as type constraints). After looking back through some docs, I couldn't find anything saying what could/couldn't be a type constraint, so that's probably something that needs to be checked.

--------------------------------------------------------------------------------

On 2019-07-08T07:25:33Z, 9214, commented:
<https://github.com/red/red/issues/3932#issuecomment-509111306>

    @dumblob if you feel up for it, we can discuss this in [`/docs`](https://gitter.im/red/docs) room and come up with desideratum. Advances on documentation front are always welcomed. ["Rebol in 10 steps"](http://www.rebol.com/rebolsteps.html) comes pretty close to what you describe, albeit only in a brief manner.
    
    @ALANVF as @greggirwin said, you can implement support for dependent types at user level, see [here](http://red.qyz.cz/dependent-types.html) for example. Drop by our community chat if you have any questions left.

--------------------------------------------------------------------------------

On 2019-07-10T00:39:46Z, greggirwin, commented:
<https://github.com/red/red/issues/3932#issuecomment-509861859>

    @ALANVF type constraints are by datatype or typeset, that simple.

--------------------------------------------------------------------------------

On 2019-07-10T08:20:00Z, endo64, commented:
<https://github.com/red/red/issues/3932#issuecomment-509961478>

    We can also add a kind warning / reminder to GitHub issue template that "Please consider asking / discussing on red/bug gitter room (link) before opening your issue"

--------------------------------------------------------------------------------

On 2019-07-10T12:56:52Z, meijeru, commented:
<https://github.com/red/red/issues/3932#issuecomment-510049459>

    To add to @greggirwin 's comment: creating an object creates a _value_ of type `object!`, not a _type_  (value of type `datatype!`).

--------------------------------------------------------------------------------

On 2019-07-10T16:12:52Z, greggirwin, commented:
<https://github.com/red/red/issues/3932#issuecomment-510128404>

    @endo64 good idea. Done.
    
    @meijeru yes, thanks for clarifying that. 

