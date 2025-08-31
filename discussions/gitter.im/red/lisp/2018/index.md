# Archived messages from: [gitter.im/red/red/lisp](/gitter.im/red/red/lisp/) from year: 2018

## Tuesday 9th January, 2018

AmurLisp\_twitter

[06:01](#msg5a545aa1ce68c3bc74961e92)As a lisper what material should I start to learn in orde to implement a web app?

rebolek

[06:03](#msg5a545b2db48e8c3566b956b9)@AmurLisp\_twitter hard to say,, you should probably start asking here and people will help you and point you to different materials. There's no "Red web apps for Lispers" doc, AFAIK.

greggirwin

[06:20](#msg5a545f186117191e6141f16f)@AmurLisp\_twitter, there is no web back end for Red yet.

AmurLisp\_twitter

[06:20](#msg5a545f3a290a1f4561674cb4)Thanks

greggirwin

[06:23](#msg5a545fe75a9ebe4f7563aa71)BUT! As a Lisper, you should feel right at home with Red. Full Windows and Mac support today, and only GUI missing from Linux.

[06:24](#msg5a5460245a9ebe4f7563ab05)Well, you'll feel at home in some ways, but maybe lost in others for a bit. You'll be fine though.

## Saturday 13th January, 2018

JacobGood1

[04:18](#msg5a5988a4ce68c3bc74b065e5)@AmurLisp\_twitter what lisp are you familiar with?

## Thursday 8th February, 2018

9214

[15:38](#msg5a7c6f0893be87284d91096b)have anyone in our community looked into \[Shen](http://shenlanguage.org/)?

[15:39](#msg5a7c6f4d4a6b0dd32ba69f35)https://www.youtube.com/watch?v=lMcRBdSdO\_U

greggirwin

[16:42](#msg5a7c7de04a6b0dd32ba705b3)I glanced at it some time back. I also saw Qi mentioned in something I read recently, which brought it back to my mind. I seem to recall that it had some cool type system features, but it wasn't enough to make me jump in and start using it.

9214

[16:43](#msg5a7c7e33ce68c3bc746065da)it seems to share a lot with Red and Rebol, like built-in parser for example, or general smallness and portability

[16:43](#msg5a7c7e3f6117191e610fc06c)worth to keep on radar I suppose

greggirwin

[16:44](#msg5a7c7e83ce68c3bc74606859)Do you know how performance is? I think that's the reason Red and Rebol are built the way they are. I've always thought it would be interesting to build Red in both Scheme and Forth style, in Red, as an educational tool.

9214

[16:46](#msg5a7c7eeab3c4a0d376fa55bb)No idea about performance, I marked idea to port Shen to Red in my life-long todo list though ;)

greggirwin

[16:46](#msg5a7c7effe217167e2c5c809d)We should compare lists. Probably a lot of overlap. :^)

9214

[16:48](#msg5a7c7f4ee217167e2c5c8334)okay @greggirwin , you won't get off with casual chit-chat - there's the article? :japanese\_ogre:

greggirwin

[16:50](#msg5a7c7fea86ef1bb1418556ee)Yes, I know. Nenad is traveling again and it's in review.

dander

[18:09](#msg5a7c926c7dcd63481f357e93)@9214 , there was a lot of discussion about Shen in the lisp channel with @JacobGood1 IIRC... I think it was some of the inspiration for macros in Red (or at least that was my impression)

9214

[18:10](#msg5a7c928ff283b8e546388d34)@dander nice, too bad Gitter search is :shit:, need to dig up this discussion

rebolek

[18:10](#msg5a7c92a393be87284d91fdac)Use the Gritter search ;)

dander

[18:16](#msg5a7c93f07084124a34524788)@rebolek did you make a command-line gritter search? It seems the Gritter gui is unusable because of that evil bug :(

rebolek

[18:17](#msg5a7c944ab3c4a0d376fae61c)@dander You can search in command-line, but I don't know if it isn't affected by MEBIR also, I use old build. :/

dander

[18:18](#msg5a7c94637084124a345249d3)@9214 I've had better luck (than the Gitter search) finding things by downloading all the channels with Gritter, then using the VSCode all-files-search, but it's a bit messy because raw data has ids instead of usernames

[18:21](#msg5a7c953fb3c4a0d376faec6a)@rebolek Ahh, I see. I should maybe just do that. I wonder if it could run on 0.6.3 as well... It would be really useful to add a powerful search to the Gritter UI. Need to find a good search algorithm though. It's something I would be interested in tackling, but I haven't had any time to hack on Red in the last two months 😞

rebolek

[18:27](#msg5a7c9684b3c4a0d376faf4b0)@dander what I've got is just simple `find` on text data and return all matches. So nothing fancy yet. But usually I can get more results than from Gitter. There are other problems though, loading times are terrible in Red (I have an idea how to make it better, but haven't implemented it yet).

JacobGood1

[19:25](#msg5a7ca432f283b8e5463900ab)@9214 Shen is really cool, the performance depends on what it is running on. Shen is meant to be a symbiotic lisp, it needs a host first and foremost.

[19:26](#msg5a7ca4796117191e6110b60c)One thing about Shen is its pattern matching macros, there is no real way to replicate this in red without adding parens everywhere.

[19:27](#msg5a7ca4bace68c3bc74615b5f)@greggirwin theoretically, the type system in Shen is more powerful than any previous language that is known to Dr. Tarver(Shen creator), as well as me... if that counts.

9214

[19:28](#msg5a7ca4e2e217167e2c5d7970)too bad there's no electronic version of TBoS

JacobGood1

[19:29](#msg5a7ca50c7084124a3452adf4)Dr. Tarver is a little anti open source, so do not hold your breath

9214

[19:29](#msg5a7ca52b93be87284d9272f4)yes, I figured out that he's an iconoclast ;)

JacobGood1

[19:31](#msg5a7ca579ce68c3bc74615e31)I created a huge wiki page on macros for red that somehow was deleted/lost... it used ideas from Shen

9214

[19:31](#msg5a7ca58e6117191e6110bd64)@JacobGood1 yes, I've found the link but it was empty

JacobGood1

[19:31](#msg5a7ca5a586ef1bb141864257)Eventually I realized that there is no way we can reach Shen parity, oh well... trade-offs

9214

[19:33](#msg5a7ca6047084124a3452b376)Is non-professional Shen suitable for pet projects, hobbies and such? The model that Tarver chose makes me raise my eyebrow a bit.

JacobGood1

[19:33](#msg5a7ca60c93be87284d92770f)yes it is

[19:34](#msg5a7ca6286117191e6110c0d4)don't expect to get near the help you get here though

9214

[19:34](#msg5a7ca638f283b8e546390b6f)welp, one day I'll embrace emacs and start digging into lisp land :alien:

JacobGood1

[19:37](#msg5a7ca6f8f283b8e546390fcb)one great thing about lisp is the runtime, that is where I get most of my excitement from

[19:38](#msg5a7ca724f283b8e546391130)over time I have started to judge languages not only by their features but also by their implementations

9214

[19:38](#msg5a7ca7436117191e6110c892)maybe we need dedicated `red/forth` group too...

JacobGood1

[19:39](#msg5a7ca769ce68c3bc74616994)this is the kind of stuff I want to see in Red one day: http://malisper.me/debugging-lisp-part-1-recompilation/

9214

[19:41](#msg5a7ca7f8ce68c3bc74616c9f)oh wow :O

dander

[21:21](#msg5a7cbf5b4a6b0dd32ba8a67f)@JacobGood1 I found your \[Macros wiki page](https://gist.github.com/dander/5ddcdb81f2e50022da5b120cab53f3fd) if you want to put it back up. I couldn't find a change that deleted it. My guess is there is some GitHub bug relating to weird file names (based on the wiki titles). The wiki is apparently a Git repo here: https://github.com/red/red.wiki.git

JacobGood1

[21:23](#msg5a7cbfe4b3c4a0d376fbea48)I should read before I type lol

[21:23](#msg5a7cbfefb3c4a0d376fbeab8)good find

[21:28](#msg5a7cc0fdf283b8e54639a92c)I do not think I ever finished the proposal, it looks a little rough

[21:28](#msg5a7cc1147084124a34534573)I suppose macros were added, then I stopped, not really sure that was a while ago

dander

[21:30](#msg5a7cc189ce68c3bc7462022f)You could always start up where you left off :)

JacobGood1

[21:32](#msg5a7cc1d1b3c4a0d376fbf4b9)Well, now I think we need special syntax for macros

[21:32](#msg5a7cc2074a6b0dd32ba8b7b8)because we cannot control their expansion, either that or some special function that tells red not to expand in certain places

[21:33](#msg5a7cc2164a6b0dd32ba8b7da)no-expand \[]

[21:33](#msg5a7cc23cf283b8e54639b1d2)just ad-libbing here

[21:35](#msg5a7cc296b3c4a0d376fbf827)in shen, it knows exactly where to expand a macro, if a certain syntactic pattern is found at the front of a list

[21:35](#msg5a7cc2b87084124a34534cd2)in red, it will expand the pattern wherever it occurs in the code... that is the problem

BillDStrong

[21:35](#msg5a7cc2b86117191e61116385)Wouldn't it be more useful to control the expansion of each layer of nested functions? so expand/1 would only affect the outer set of \[] in \[\[]]

JacobGood1

[21:36](#msg5a7cc2ed7dcd63481f3690a0)sure, im just saying we need something like this if we are going to control the macros

[21:37](#msg5a7cc3186117191e611166ca)otherwise we are all going to have some horrendous bugs to bite us

[21:39](#msg5a7cc37ace68c3bc74620d21)the issue is we are now back to composing, this is a hard problem

[21:42](#msg5a7cc44586ef1bb14186f606)maybe we just need an ide telling us a pattern is being matched for expansion, we can then verify whether we desire that to occur or not. However, that would make reds macro system be dependent on ide, I have no problem with that, others might. Ok, done spit balling for now.

greggirwin

[23:28](#msg5a7cdd1a93be87284d939e40)I agree that there are lessons we can learn from Shen, just can't drop them in directly though. Sounds like @JacobGood1 is the leading mind on this.

## Friday 9th February, 2018

greggirwin

[01:56](#msg5a7cffc77dcd63481f37a295)On CL and restarts, per...the messages gitter won't let me point to right now... @maximvl did some work in that area: https://gist.github.com/maximvl/dcb8c4e9ef5d4db91f7a6b52da9b9cee

## Friday 16th February, 2018

JacobGood1

[19:25](#msg5a87302fcd1c600323360998)@greggirwin lorddimwit is talking about multiple dispatch... which is something I would like to see as well

greggirwin

[20:08](#msg5a873a3617b16a2377580348)OK, how do you see it working in Red, and what's the big win?

JacobGood1

[20:44](#msg5a8742c90202dc012e4341d5)it does not really work unless red allows for user defined types/objects instead of anonymous objects

greggirwin

[22:34](#msg5a875c910202dc012e43f4a3)But if we had those, what is the big win over, say, a general pattern-action dispatcher (where the patterns could match simple arg types, but could also do more)?

geekyi

[22:54](#msg5a876122888332ee3a911493)Short version is, multiple dispatch allows a simpler api

greggirwin

[22:54](#msg5a876134a2194eb80d71da4c)How so?

[22:55](#msg5a87617a8f1c77ef3a16809f)In looking at examples, I see \*how* it's done, I just don't see how it's better yet. Mind you, I'm coming from a Redbol mindset.

geekyi

[22:57](#msg5a8761c3e4ff28713a87bd8b)Take for example, `function/refinements` .. what if, you can ignore the refinement, and the implementation chooses the refinement based on the type?

greggirwin

[22:57](#msg5a8761f5e4ff28713a87be6d)Can you give me a concrete example?

geekyi

[23:00](#msg5a87628cc3c5f8b90dc53d1d)Looks like I'm having problems with my internet..

greggirwin

[23:01](#msg5a8762d3a2194eb80d71e563)Gitter doesn't like that. I know.

geekyi

[23:16](#msg5a87663d0202dc012e4432d0)Yeah, It's I think, the basic idea behind (typed) functional programming.  
&gt; what is the big win over, say, a general pattern-action dispatcher

A dispatcher simplifies api is what I meant. So the argument reduces down to `pattern-action` vs `type-action`.  
There, I'm not sure, because I find both suitable, for different tasks.

But I'll try to make my case tho:

Pattern matching is useful for (one or more of):  
\- limited number of cases  
\- text

Types:  
\- lots of different cases  
\- easily matches 1:1 with a (data) type  
\- few or no edge cases

So, for `parse` and `case` like stuff, pattern matching. For the rest, types make the api simpler. However, in redbol, there aren't that many different types (`series!` is the only collection type) and it is already pretty functional. So doesn't add much..

[23:18](#msg5a8766b9a2194eb80d71f9c2)@greggirwin  
&gt; a general pattern-action dispatcher (where the patterns could match simple arg types, but could also do more)?

Actually, I'm not sure what you mean here; if you can match by arg type, that's what I mean. Your version could be simpler

[23:41](#msg5a876c13a2194eb80d721a37)&gt; it does not really work unless red allows for user defined types/objects instead of anonymous objects

To be precise, what you actually need at a minimum is `attributes`, or metadata on types/objects. Alternatively, you can call them type `property`s or `traits`. Thinking a bit abstract here: usually these features are , but a few somewhat concrete examples:

\## Performance

```
a: unique [5 4 3]
b: sort [1 2 3 ]
```

`a` is a set with the uniqueness property, `b` is a list that has the property of being sorted.  
So far, you don't see the advantage over normal code.

But, in this particular case, both of these operations are idempotent. So, an implementation that specializes on type can generate optimize code (no-op) in this case.

\## Simpler api  
`load` is already very simple as is. Can it be simpler(more convenient) tho? What if it dispatches based on the file format/extension/content type?  
For example, based on the file extension / file contents, can you dispatch on `load/as %file.jpg 'jpg` so it's just `load %file.jpg`

\## Better extensibility  
Right now, if you want to extend a function, you have to rewrite it. Fortunately, this is much less painful (not to mention even being possible!)  
But if you multiple dispatch, you can write the `spec` once, implementation eslewhere multiple times!

JacobGood1

[23:52](#msg5a876eca8f1c77ef3a16d342)@geekyi "To be precise, what you actually need at a minimum is attributes, or metadata on types/objects." yep

[23:53](#msg5a876f02888332ee3a91651a)i love the way it is done in lisp, dynamic multi-methods on the outside of objects

geekyi

[23:57](#msg5a876ff435dd17022eb37054)Typo in first paragraph:  
&gt; a bit abstract here: usually these are different features*  
named and implemented differently depending on the programming language, but the same to me at a higher level of abstraction

## Saturday 17th February, 2018

greggirwin

[03:31](#msg5a87a21ac3c5f8b90dc6854a)Performance is a separate issue. Let's focus on the interface aspect.

The `load/as` example isn't great, because `load` already handles that as you want. `/as` is an override, if the file extension isn't mapped to a codec.

&gt; Right now, if you want to extend a function, you have to rewrite it.

You have to extend it, not necessarily rewrite it. This is maybe where you see the CL approach as an advantage, in that if you want to change the interface to a built-in you write a new version of the func, yes? And the original remains untouched.

&gt; But if you multiple dispatch, you can write the spec once, implementation eslewhere multiple times!

This is where the examples I found look like a lateral move to me. Not better, just different. e.g. given the wikipedia example:

```
(defmethod collide-with ((x asteroid) (y asteroid))
   ;; deal with asteroid hitting asteroid
   )
 (defmethod collide-with ((x asteroid) (y spaceship))
   ;; deal with asteroid hitting spaceship
   )
 (defmethod collide-with ((x spaceship) (y asteroid))
   ;; deal with spaceship hitting asteroid
   )
 (defmethod collide-with ((x spaceship) (y spaceship))
   ;; deal with spaceship hitting spaceship
   )
```

How is it better than something like this?

```
collide: func [a b][
    dispatch [a b] [  ; dispatch ~= parse reduce 
        [asteroid asteroid]   (...)
        | [asteroid spaceship]  (...)
        | [spaceship asteroid]  (...)
        | [spaceship spaceship] (...)
        | (default handler)
    ]
]
```

Of course, we're not matching by object class as CLOS is, which is a question of fundamentals. But what we get in return is, given any block of values as a spec, we can dispatch based on any criteria we want via `parse`, yes? I have old, and some newer, things that use this approach, which I hope to do more with in the near future.

[03:45](#msg5a87a5618f1c77ef3a17d85c)The object metadata aspect is the interesting part. Interesting because it raises the question of how objects are "typed" (e.g. duck typing), and because "why should objects be special?" That is, why don't blocks get metadata too? How do we "type" things in Red? We do it by value type. We can do more of course, because we have `parse`.

Two thought experiments to ruin your weekend:

1\) How to "parse" object defs to pattern match? I'm not the only one with experiments here.

2\) Why use objects for dispatching at all? Do we need to? Did someone say "dynamic multi-methods on the outside of objects"?

JacobGood1

[13:14](#msg5a882ab7e4ff28713a8b9721)because collide itself must be altered in order to make an extension to collide, with lisp you are not altering the original implementation

greggirwin

[16:33](#msg5a88595535dd17022eb800f3)I understand that, I just don't see \*yet* how it's a better fit in Red. Other langs do something similar (to CLOS), from an interface perspective, yes? Or have implemented in to emulate CLOS. So we should be able to dig up some good stories about the pros and cons. @JacobGood1 @geekyi @maximvl (or anyone else), what are your best personal stories about how this has helped you on real projects?

When you use this in real life, in CLOS, do you keep all the definitions for `collide` (e.g.) together? Or as you add new types, do you add new `collide`implementations with the code for each new type (much as Red does with datatype actions today)?

JacobGood1

[18:12](#msg5a887096a2194eb80d774db1)@greggirwin you create an interface first,

```
(defgeneric blah blah blah)
```

, you refer back to this when you need to know what the functions purpose is. The implementation of the function can take place anywhere, it is the users preference. I tend to keep them together, but it really depends on the project as with anything.

"Or as you add new types, do you add new collide implementations "  
Depends, clos has full blown multiple inheritance with method combinations, so you could just inherit from whatever object's implementation of that method that you desire to have for your object.

[18:37](#msg5a887687a2194eb80d7805fb)@greggirwin here is a paper that I have linked a few times, it is more amenable to the prototype object approach: http://sauerbraten.org/lee/ecoop.pdf

[18:46](#msg5a88786a35dd17022eb9460a)"Of course, we're not matching by object class as CLOS is, which is a question of fundamentals"  
It is also a question of performance, unless that is not a concern. The CLOS model has good performance, which may not be a concern to all, but it is to me.  
Robert Strandh has made some great strides in improving the speed of CLOS even further: http://metamodular.com/generic-dispatch.pdf  
Christian Schafmeister and him have been working on a new implementation of common lisp, clasp. They have incorporated these CLOS improvements into clasp, so they actually work. At this point, clasp has one of the fastest generic dispatch infrastructures for common lisp, here is a video where he talks about some of this stuff and a whole lot of chemistry: https://vimeo.com/156442057 go to around 36 for clasp discussion.

maximvl

[20:59](#msg5a8897ade4ff28713a8e8789)I see multi dispatching as a very powerful way of constructing and extending the code in fact some languages eg Julia took it as a central, language-defining concept

[21:00](#msg5a889801888332ee3a97d200)also it simplifies code a lot, makes it more readable - instead of having a tree of conditions in a single function you just write several implementations

[21:03](#msg5a88988ee4ff28713a8e8afc)from my own experience it really helped me once when I was working with CL XMPP implementation and it was an old library which didn't support some mandatory modern messages, it was extremely easy to add this support in my code without touching the original library using multi dispatch (this was possible because each message is a class in this library)

rebolek

[21:03](#msg5a8898ba6fba1a703a657634)Interesting.

maximvl

[21:07](#msg5a88997635dd17022eb9f0f4)here's the code: https://github.com/maximvl/lbot/blob/master/lbot.lisp#L364

[21:07](#msg5a8899a36fba1a703a657a8c)every `defmethod xmpp:` adds a method for certain type into `xmpp` package

9214

[21:07](#msg5a8899a40202dc012e4ae09c)@maximvl would you say that multi dispatching is a data-oriented approach?

maximvl

[21:09](#msg5a8899ed8f1c77ef3a1d49d6)now when I looked at it I actually did overwrite quite a lot because I also fixed some bugs

[21:09](#msg5a889a06c3c5f8b90dcc2e41)so the ability to extend libraries from user code is very powerful

[21:09](#msg5a889a1fc3c5f8b90dcc2eec)@9214 it's a user-oriented approach for sure :D

9214

[21:10](#msg5a889a4e8f1c77ef3a1d4bcf)IIRC, there two paths:  
\* you have a bunch of operations defined over set of datatypes; whenever new datatype is presented each of operations should be updated in order to work with this datatype  
\* you have a bunch of datatypes, each supports a defined set of operations; whenever new datatype is presented it just need to implement a set of operations which it wants to support

[21:11](#msg5a889a970202dc012e4ae5a6)where multiple dispatch fits here?

maximvl

[21:12](#msg5a889abe888332ee3a97df2e)the second one looks like it, though the set of operators can be extended, it's not fixed as a set of types as well

9214

[21:15](#msg5a889b89e4ff28713a8e9975)http://sarabander.github.io/sicp/html/2\_002e5.xhtml#g\_t2\_002e5

maximvl

[21:18](#msg5a889c1635dd17022eb9fd7f)you can combine regular non-dispatching functions with dispatching ones, yes, this is how it's usually done

[21:18](#msg5a889c2835dd17022eb9fdc2)because of performance issues

9214

[21:18](#msg5a889c3b6fba1a703a658863)I'm just trying to understand which approach fits Red naturally

[21:19](#msg5a889c5ba2194eb80d78cc1f)CL is cool, industrial strength and all that, but I would like to see Red being consistent in its design

maximvl

[21:20](#msg5a889c8cc3c5f8b90dcc3acb)I don't see any problems with both of them

9214

[21:20](#msg5a889ca1e4ff28713a8e9e2f)no, I mean about multiple dispatch

maximvl

[21:20](#msg5a889ca5c3c5f8b90dcc3b3b)dispatch is just more powerful and a bit harder to implement

9214

[21:21](#msg5a889cd0e4ff28713a8e9f1b)it's more powerful, but not necessarily fits into Red's design?

[21:23](#msg5a889d34a2194eb80d78d087)in short, multiple dispatch allows to extend existing functions without re-defining them from scratch?

maximvl

[21:23](#msg5a889d588f1c77ef3a1d5a31)yes, usually these functions needs to be declared in a special way so the runtime knows they can be extended

9214

[21:23](#msg5a889d5f8f1c77ef3a1d5a3a)we can do that already, but in a \*really* hackish way

maximvl

[21:23](#msg5a889d66a2194eb80d78d18c)eg in CL it's `defgeneric` and `defmethod`

9214

[21:23](#msg5a889d6bc3c5f8b90dcc3ec0)and only with user-defined functions or mezzanines

maximvl

[21:24](#msg5a889da435dd17022eba059e)as a library it should be easy to implement, the problem is there is no type system on objects which is a key to extensions

[21:27](#msg5a889e2a6fba1a703a65920c)after 10 years of development a new version of cross-platform CL GUI manager is released:  
https://common-lisp.net/project/mcclim/excite.html

[21:27](#msg5a889e42e4ff28713a8ea75d)fully object-oriented and based on ideas of symbolic lisp os

rebolek

[21:30](#msg5a889edae4ff28713a8ea965)So, do I understand it correctly?

```
dispatcher: func [spec][
	func spec compose [
		types: (copy #())
		do select types type?/word (first spec)
	]
]

dispatch: func [
	dispatcher type body
	/local types
][
	types: second body-of :dispatcher
	types/(to word! type): bind body :dispatcher
	:dispatcher
]
```

and...

```
>> myfun: dispatcher [value]
== ...
>> dispatch :myfun integer! [value + 1]
== ...
>> dispatch :myfun string! [append value "..."]
== ...
>> myfun 1
== 2
>> myfun "abc"
== "abc..."
```

9214

[21:32](#msg5a889f55e4ff28713a8eac88)yes, and in theory it should be extendable with user-defined datatypes

maximvl

[21:32](#msg5a889f596fba1a703a65988a)as a basic - yes, thought dispatch can be more sophisticated, based on pattern matching etc

rebolek

[21:32](#msg5a889f818f1c77ef3a1d63c1)Ok, I guess I should spend more than five minutes on it.

maximvl

[21:33](#msg5a889f9b6fba1a703a659a2a)for example from CL code:

```
(defmethod xmpp:message ((connection xmpp:connection)
                         to body &key id (type :chat) xhtml-body)
```

[21:33](#msg5a889fc0888332ee3a97f8b2)here I specify method for first argument of type `xmpp:connection` which is a class and `type` argument for constant keyword `:chat`, rest is unspecified

[21:34](#msg5a889fffa2194eb80d78dd2e)so it's actually a pattern-matching DSL

rebolek

[21:44](#msg5a88a22c888332ee3a9804b0)Thanks. So back to editor.

[22:09](#msg5a88a8278f1c77ef3a1d8d53)https://gist.github.com/rebolek/0345849840abc3899de0e19650f38f9b

## Sunday 18th February, 2018

greggirwin

[19:03](#msg5a89ce19c3c5f8b90dd20059)Thanks for all the info guys! I don't have time to watch the ~2:0:0 Clasp video, but any key points would be great to know.

&gt; clos has full blown multiple inheritance with method combinations, so you could just inherit from whatever object's implementation of that method that you desire to have for your object.

@jacobgood1, so it's truly a mixed system, as earlier you said

&gt; i love the way it is done in lisp, dynamic multi-methods on the outside of objects

But you can also inherit if you want.

&gt; also it simplifies code a lot, makes it more readable - instead of having a tree of conditions in a single function you just write several implementations

@maximvl, that's subjective, but I understand what you mean. I like not having to touch working code, but I don't see this as a free lunch. Still working on it though.

@rebolek, your code made my head explode first thing in the morning. :^)

I remembered the ecoop paper once I saw Sharks mentioned. I even found my old PMD notes on it from Aug-2016 @jacobgood1.

I imagine I didn't pursue it, because the CLOS model is deeply tied to objects and their specific classes, including user defined objects. That's great for consistency, but not a great fit for Red as it stands. Objects are important values, but OOP isn't Red's primary model.

One thing that makes it trickier is typesets. There is talk of total ordering vs partial ordering, and how the dispatch has to be designed to choose. But we could define ambiguous interfaces, yes? So that has to be accounted for. e.g.

```
fn-a: func [x [number!] y [number!]][print 'a]
fn-b: func [x [integer!] y [number!]][print 'b]
fn-c: func [x [number!] y [float!]][print 'c]
fn-d: func [x [float!] y [integer!]][print 'd]
; etc.
```

We also have to consider free ranging evaluation and refinements.

None of this is to say we can't do it, or have a lib to do something like it, but it needs a champion to show how it would work and look at the big picture. Any notes we make here, including resource references, would be great to put in a wiki page, so we know what we've talked about.

rebolek

[19:09](#msg5a89cf4c35dd17022ebfcee9)@greggirwin sorry about that, I thought I can't make it simpler.

greggirwin

[19:26](#msg5a89d3588f1c77ef3a231715):^) Here's how my brain did it this morning: https://gist.github.com/greggirwin/a6741c60167e7beb36c9a78afc6bc6fd

rebolek

[19:27](#msg5a89d3bbc3c5f8b90dd21f69)Looking at your fn-a - fn-d example, I guess that `all` should be automatic so it could be rewritten as

```
fn: dispatcher [x y]
dispatch :fn [number? x number? y][print 'a]
dispatch :fn [integer? x number? y][print 'a]
dispatch :fn [number? x float? y][print 'a]
dispatch :fn [float? x integer? y][print 'a]
```

greggirwin

[19:28](#msg5a89d3cca2194eb80d7eb1f2)I have a number of other things along this line, looking at the pattern-action model in different domains (tuplespace, FRP, observer pattern, evented matching), which I hope to coalesce into something that works well generally.

[19:29](#msg5a89d41d35dd17022ebfec8e)@rebolek, could work that way too. In my old notes from 2016, I have something like this:

```
handle-encounter: func [a b][
    case [
        dying-shark? a                  [a/swim-away b]
        all [fish? a healthy-shark? b]  [a/swim-away b]
        all [healthy-shark? a shark? b] [a/fight b]
        'else                           [a/say "meh"]
    ]
]
```

[19:30](#msg5a89d440a2194eb80d7eb51c)Which was planned to work a lot like yours, in that new cases would just be appended by the new func def.

rebolek

[19:31](#msg5a89d4a08f1c77ef3a231eef)Yes, that's basically the same thing.

greggirwin

[19:33](#msg5a89d4fa0202dc012e50dfb0)I remember my early Rebologo interpreter, where I used the func def to add new rules to the parser rules dynamically, and how amazing I thought that was. And still do. :^)

rebolek

[19:33](#msg5a89d5128f1c77ef3a2321df)It is :)

## Monday 19th February, 2018

greggirwin

[01:29](#msg5a8a2897c3c5f8b90dd3e2b3)Gitter can't seem to refresh this group for me.

[01:30](#msg5a8a28a5a2194eb80d8074b6)Posting fixed it.

[01:30](#msg5a8a28bdc3c5f8b90dd3e334)Argh. No it didn't. Still some unread hidden message somewhere.

toomasv

[04:15](#msg5a8ae3ca6f8b4b994693dd3a)@greggirwin There is a hidden message for me too. We share it!

pekr

[06:24](#msg5a8a6d9f0202dc012e53ccba)Mark All as Read on a cell phone did fix it for me. ...

9214

[07:15](#msg5a8a799fe4ff28713a97b697)same for me

rebolek

[07:20](#msg5a8a7acb888332ee3aa0ca1f)Gitter hasn't been updated for some time (since July IIRC) and there are some bugs, like XSS that can insert miner into a room. I guess this is one of those bugs.

9214

[07:21](#msg5a8a7b158f1c77ef3a2652a9)@pekr's fix did it for me too

rebolek

[07:23](#msg5a8a7b83e4ff28713a97c1cc)Alternatively, you can use Gritter client with it's own set of bugs ;)

[13:14](#msg5a8acdae8f1c77ef3a2884e5)I've added support for catch-all rule and also for removing rules for my `dispatcher`:

```
>> x: dispatcher [a b]
== func [a b][
    case []
]
>> dispatch :x [integer? a integer? b][a + b]
== func [a b][
    case [all [integer? a integer? b] [a + b]]
]
>> dispatch :x none [rejoin [a b]]
== func [a b][
    case [all [integer? a integer? b] [a + b] true [rejoin [a b]]]
]
>> dispatch :x [float? a float? b][a * b]
== func [a b][
    case [all [float? a float? b] [a * b] all [integer? a integer? b] [a + b] true [rejoin [a b]]]
]
>> dispatch/relax :x [float? a integer? b][a / b]
== func [a b][
    case [all [float? a float? b] [a * b] all [integer? a integer? b] [a + b] all [float? a integer? b] [a / b] true [rejoin [a b]]]
]
>> dispatch :x [integer? a integer? b] none
== func [a b][
    case [all [float? a float? b] [a * b] all [float? a integer? b] [a / b] true [rejoin [a b]]]
]
```

DideC

[16:05](#msg5a8af5c16f8b4b9946946331)Is there a 'mark all as read' in the browser version ? Can't find it.

rebolek

[16:34](#msg5a8afc9a888332ee3aa4606f)@DideC the green button in top right corner has option to mark as read

greggirwin

[19:50](#msg5a8b2a6cc3c5f8b90dda47bf)Thanks guys. Hidden message cleared, though I wonder what it was.

[19:50](#msg5a8b2a7f0202dc012e590068)@rebolek our own bugs are always easier to swallow.

[19:55](#msg5a8b2b9a6fba1a703a737098)I thought about removal, but you either need an ID or to match the stored body/func to find it again, yes? Otherwise you risk removing an entry with matching types.

rebolek

[20:49](#msg5a8b386fe4ff28713a9cef18)@greggirwin see last example above, rule is needed for removal with `none` as body (action) to trigger it. You can't have two actions with same rule, because passing an action with already existing rule will overwrite it.

[21:04](#msg5a8b3bd4c3c5f8b90ddab92e)I should also note that this approach is refinement transparent.

JacobGood1

[21:51](#msg5a8b46c98f1c77ef3a2bb7e0)@greggirwin "But you can also inherit if you want."  
Think of it more like an object becomes multiple types so the function that was written for a certain type can dispatch on another object that shares that type.

arbitrary example:  
If i wrote a bunch of multi-methods for a vector I could combine player and vector so that now I can call all the vector functions on the player, player would be both a vector and a player.

DideC

[21:58](#msg5a8b486d6f8b4b9946967ec0)@rebolek Thanks (tiny one, would not have found that without help)

JacobGood1

[22:18](#msg5a8b4d290202dc012e59d0c3)+

greggirwin

[23:31](#msg5a8b5e48888332ee3aa6b653)Thanks @JacobGood1. Still not sure it's sinking in as to the best concrete use cases. I appreciate you guys taking time to explain. I'll look at @maximvl's code again. One of those things that may not click in my head without having actually used it.

## Tuesday 20th February, 2018

maximvl

[13:10](#msg5a8c1e2fa2194eb80d8babe2)&gt;I imagine I didn't pursue it, because the CLOS model is deeply tied to objects and their specific classes, including user defined objects. That's great for consistency, but not a great fit for Red as it stands. Objects are important values, but OOP isn't Red's primary model.

In CL AFAIK dispatching is very flexible and can be done on atomic values as well

[13:10](#msg5a8c1e3f6fba1a703a78412a)@greggirwin ^

[13:17](#msg5a8c1ffc0202dc012e5de819)

```
(defmethod test ((x number) (y number))
  '(num num))

(defmethod test ((i integer) (y number))
  '(int num))

(defmethod test ((x number) (j integer))
  '(num int))

(test 1 1)      =>  (int num), not (num int)
(test 1 1/2)    =>  (int num) 
(test 1/2 1)    =>  (num int) 
(test 1/2 1/2)  =>  (num num)
```

JacobGood1

[13:55](#msg5a8c28dde4ff28713aa1addc)The acronym CLOS does not fit well with CLOS either because there is a huge difference between OOP in something like java vs CLOS

dander

[17:49](#msg5a8c5fae0202dc012e5fb371)I've been thinking it would be nice to do an experiment where some of the existing sequence processing functions (such as `foreach`, `append` etc) could be extended to also allow taking `function!` as the sequence argument. This would be possible by replacing the existing methods, but feels somewhat heavy-handed. I presume having multiple dispatch would make it easier? Would that scenario be a reasonable use case?

greggirwin

[18:22](#msg5a8c67736f8b4b99469c9c96)@dander, that is the idea behind it, yes. You can define new specs for a func of the same name, but there are limitations. @maximvl @JacobGood1 would have to confirm, but you can't, e.g., change the arity, because the "original" defines the interface to that extent, as I understand it. That, of course, gets into the realm of currying and things like transducers in Clojure.

dander

[18:33](#msg5a8c6a108f1c77ef3a31e510)In this case, I just want to add a new type to the existing spec:

```
>> probe spec-of :foreach
[
    "Evaluates body for each value in a series" 
    'word [word! block!] "Word, or words, to set on each iteration" 
    series [series! function!] 
    body [block!]
]
```

So a passed-in function could be treated as a series (take values from it until it returns `none`).  
I wanted to suggest this as a potential concrete use case. It's a lot more relevant if you have some \[generator functions](https://gist.github.com/dander/66ad65555b30286115cee675b16bf1d7) to feed it with. I still need to really clean that gist up...

greggirwin

[18:34](#msg5a8c6a2ce4ff28713aa390c1)I see \*how* it works, and understand the reasoning and flexibility. Since it's just a thought experiment for me right now, I'm still working through the pros and cons in practice, in the context of Red. Adding new datatypes, or usertypes, means you have to update actions in all types that want to add support. So you have to touch existing code and add logic. But if you use the MD/MM approach, those changes (if you don't want to touch existing code) will now live outside the original datatype.

Right now, it still looks \*different* but not \*better* in my head. Different tradeoffs. And I don't know how we'd make it work all the way down without a big redesign of datatypes in general. That is, it works well when it's central to how the host language works, but can you transplant it equally well?

[18:37](#msg5a8c6b016f8b4b99469cb73b)@dander it's a great concrete use case, and helpful. But we can't treat functions and series the same, so there has to be a change in the body logic (which is the MM/MD approach's goal). But is that a win over a separate `map/map-each` function? It opens a lot of questions.

[18:40](#msg5a8c6bba0202dc012e60087b)- Is it something the average programmer can understand and use effectively?  
\- Where is it most useful (e.g. small apps vs large, complex code bases)?  
\- If mostly useful in PitL, what are its counterparts that might be used instead?  
\- Does it need to be multi-dispatch all the way down, or is a lib/dialect enough for those who really need it?

dander

[18:57](#msg5a8c6f92888332ee3aacaf92)@greggirwin To me, `foreach` is more of a side-effecting process. "for each of the items in some atomically divisible thing, perform some operation", where the `map`/`map-each` functions are treated more functionally (implying no side effects), so there are some specific features you gain with them, like being able to chain and compose them with other functional methods. I typically try to use functional/HOF things to mold the raw inputs to something that I can feed into a `foreach`

[18:58](#msg5a8c6ff153c1dbb743548d5a)I think the benefit of keeping it in `foreach` is that it allows the `foreach` to stay focused on what it is for (iterating over a sequence (not the type) of things), versus the mechanics of what it can take.

[19:05](#msg5a8c71606fba1a703a7a9fe2)I think @JacobGood1 once posted this link, which I thought was interesting: \[Multimethods, Multiple Inheritance, Multiawesome!](http://journal.stuffwithstuff.com/2011/04/21/multimethods-multiple-inheritance-multiawesome/)

greggirwin

[19:10](#msg5a8c72a16fba1a703a7aa81e)@dander the FP aspect is a good one, but then that seems to say `foreach` \*shouldn't* support funcs, because they shouldn't be "effectable", yes?

[19:11](#msg5a8c72fc53c1dbb743549f55)Of course, it would be useful inside, say, a `collect`.

[19:14](#msg5a8c738ea2194eb80d8e14aa)I'm not saying `foreach` \*shouldn't* support funcs, just thinking out loud.

[19:15](#msg5a8c73d98f1c77ef3a3227e5)And this will nicely lead into generators and whether we need to be lazy.

[19:16](#msg5a8c741d8f1c77ef3a322a28)Because if we don't need to be lazy, it's almost a moot point, yes?

dander

[19:18](#msg5a8c747753c1dbb74354a861)I tend to use the `foreach` as the consumer of a chain of functional transformations. The transformations can be nicely composed to describe how your inputs need to be filtered/transformed, but then you need to do something useful with them, like print out the results, or update a DB or whatever

[19:19](#msg5a8c74b3888332ee3aacd4f7)it's certainly possible to be too lazy ;) but sometimes it's a nice feature to have

[19:22](#msg5a8c7572c3c5f8b90de1ae5e)I think the lazy-by-default argument is kind of similar to the copy-on-write thing. You lose a little bit of performance because of the extra function calls, but you \_sometimes_ gain a lot when you don't need the whole sequence

greggirwin

[19:35](#msg5a8c78700202dc012e605eb2)Right, so it's a matter, today, of having to build a series from your chain first.

dander

[19:48](#msg5a8c7b936fba1a703a7add38)Yeah, and presumably if you have some sort of generator library, it will have a function that converts a generator sequence to a block (or other appropriate sequence) but if it is natively supported by `foreach` then you can short-circuit if it makes sense... Or going back to the MM thing, maybe the generator library would "upgrade" `foreach` along with half the things from `help "series"` with generator support

rebolek

[21:28](#msg5a8c930735dd17022ed01557)@dander

```
>> foreach*: :foreach
== make native! [[
    "Evaluates body for each value in a series"
    'word [word! block!] "Word, or words, to set on each iteration"
    series [series!]
    body [block!]
]]
>> foreach: dispatcher ['word series body]
== func ['word series body][
    case []
]
>> dispatch :foreach none [foreach* :word series body]
[all [none] [foreach* :word series body]]
== func ['word series body][
    case [true [foreach* :word series body]]
]
>> dispatch :foreach [function? :series][while [set :word series][do body]]
[all [function? :series] [while [set :word series] [do body]]]
== func ['word series body][
    case [all [function? :series] [while [set :word series] [do body]] true [foreach* :word series body]]
]
>> foreach x [1 2 3][print x]
1
2
3
>> foreach x func [][take [1 2 3]][print x]
1
2
3
```

dander

[21:39](#msg5a8c95a36fba1a703a7b7d48)@rebolek great! thanks :smile:

rebolek

[21:41](#msg5a8c962035dd17022ed028b1)@dander you're welcome. You need latest version of `dispatcher` from https://github.com/rebolek/red-tools/blob/master/func-tools.red

## Wednesday 21st February, 2018

maximvl

[10:54](#msg5a8d50036fba1a703a7f2dad)@greggirwin I can confirm that arity can't be changed by implementations, though CL supports optional and keyword arguments which can provide flexibility

greggirwin

[18:33](#msg5a8dbb8d0202dc012e67ae36)Thanks @maximvl, good to know.

`Help` came to mind too. How would that work with multiple dispatch? I started hacking on mine, to steal @rebolek's best ideas, but I need to rethink a bit. Bolek's model may be a better fit for this, though now I'm intrigued about how mine might be used.

## Monday 5th March, 2018

maximvl

[13:05](#msg5a9d40a235dd17022e22b1b4)FYI: https://www.european-lisp-symposium.org/2018/index.html

## Tuesday 6th March, 2018

greggirwin

[01:05](#msg5a9de94ef3f6d24c683f6ab2)I get: The site www.european-lisp-symposium.org is not yet installed

maximvl

[10:42](#msg5a9e7096f3f6d24c6841a8fd)@greggirwin whoops, it was working just yesterday

[10:43](#msg5a9e70c7888332ee3a056578)should be fixed soon, in short the conference is on latest Lisp-related technologies and researches, in Marbella, Spain 16-17 April

[10:43](#msg5a9e70eec3c5f8b90d3bdde4)topics are meta-programming, language programming, live programming etc

greggirwin

[20:02](#msg5a9ef3f00a1614b712ecaa8b)Ahhh, cool! Are you going? Anybody here in Spain? Are they looking for presenters? This isn't something we want to pull a core team member for, with all the other work going on, but maybe we can help support someone who wants to do it.

## Wednesday 7th March, 2018

maximvl

[14:31](#msg5a9ff7dcf3f6d24c68497d10)@greggirwin yep, have my tickets already, btw the website is back

[14:33](#msg5a9ff8320a1614b712f1838e)I'm not ready to give a talk on such event yet ;) I want to see what's going on there first :)

[14:35](#msg5a9ff8b38f1c77ef3a92c4dd)it's happening every year so maybe on next one (with 1.0 released :D)

greggirwin

[18:16](#msg5aa02c90e4ff28713a0611e6)Great! Can't wait to hear the report.

9214

[18:31](#msg5aa02fe7f3f6d24c684ae6ce)@maximvl :+1: ask Lispers if they have problems with AV vendors :D

## Saturday 28th April, 2018

jbshirk

[21:50](#msg5ae4ecc3109bb04332102938)I installed the gitter app on my dumbphone to read this thread out of curiosity. There's no way to jump to the beginning of the thread. No way to search the history of the thread. Question and answers are disjointed and scattered about. What's this room about again?

JacobGood1

[22:45](#msg5ae4f9791130fe3d3629bd20)This room is for discussing lisp in relation to red

## Sunday 29th April, 2018

guraaku

[06:38](#msg5ae5687f15c9b031144936b8)Is there any particular reason why people interested in Red also have an interest in Lisp ?

[06:44](#msg5ae569d57c3a01610d3103e7)Has anyone got any experience with Racket ? This here https://beautifulracket.com/ talks about how good Racket is for building your own language - anyone got any thoughts on how it compares with building languages in Red ?

pbaille

[09:59](#msg5ae5977f6d7e07082b46d6b0)@guraaku i think the metaprograming capabilities of Lisp (via macros) leads naturally to Red, which seems (at least to me, i'm new to red, but am a long time clojurian) to be more powerful than most lisps for building your own language. Kernel is an exception (a lisp with Fexprs)...

guraaku

[10:02](#msg5ae598511130fe3d362b8702)thanks @pbaille , I'm pretty new to Red too - am using it to implement a language previously implemented via a handwritten recursive descent parser in C#. I'm looking at different options, came across the Racket thing and just wondered if Red enthusiasts had any view on how it compared to Lisps

[10:04](#msg5ae598a262316e05050fe8b6)So far, yes, I'm finding Red to be very flexible, the little I have read so far from that Racket book looks more complicatedf

pbaille

[10:13](#msg5ae59ad47c3a01610d31a384)red is really something... it let you do so much things... I don't have the big picture yet, but I have searched a new language for a while, and the only that makes me feel the kind of joy that i have experienced learning lisp is Red. Syntax is beautiful, and it the core language is so powerfull... in lisp you have a sublanguage for implementing macros which is not so fine (i spoke for clojure), in red, you can do the same things (at runtime or compile time) more easily it seems.

guraaku

[10:14](#msg5ae59b1f62316e05050ff031)yes, that was the same feeling I have

greggirwin

[21:12](#msg5ae6355b7c3a01610d33d021)@guraaku Red inherits from Lisp, Forth, and Logo (also a Lisp), along with Self for the object model. It adds many new ideas, but offers many things Lisp does. This room is a good place to talk about what Lisp features match up, and how to offer things in Red (e.g. HOFs) that match Red's design.

## Monday 30th April, 2018

JacobGood1

[03:42](#msg5ae6909e15c9b031144d068d)lisp macros are still more powerful than red macros, however, the metaprogramming features of red are more user friendly

[03:43](#msg5ae690ee15c9b031144d0758)@pbaille "in lisp you have a sublanguage for implementing macros which is not so fine" that is not true, the reader macros only simplify what you would write by hand but they are not necessary.

[03:44](#msg5ae69126109bb0433215639a)I am sure that red macros will improve over time, but one cannot expect them to reach lisp potential due to the free form nature of red

pbaille

[06:44](#msg5ae6bb5815c9b031144da8dc)@JacobGood1 i was talking about the macro dsl ( ~ ' \` ~@ ...) which is not so fine in my opinion. My comparaison wasn't really between red macros vs lisp macros, but lisp macros vs red funcs (which can be viewed as runtime macros or fexprs i believe). I don't really know red macros, and for now don't feel the need to, since most commonly used lisp macros can be implemented with a simple func.

JacobGood1

[16:21](#msg5ae7428b5d7286b43a83371b)reds "runtime macros" are not as powerful, they do cover most use cases but not all

pbaille

[16:26](#msg5ae743cb7c3a01610d381859)@JacobGood1 could you please give me an exemple? i cannot find one.

[16:36](#msg5ae74602270d7d3708208c80)i taught that red metaprograming approach was somehow analogous to Fexprs (which i believe is more general than macros) but maybe i'm wrong.

9214

[16:38](#msg5ae7466c7c3a01610d3828bc)@pbaille that's true, Red and Rebol functions are close equivalents to fexprs.

[16:44](#msg5ae7480962316e05051683fd)@JacobGood1 do you have The Book of Shen btw?

pbaille

[16:47](#msg5ae748a45d7286b43a8355ae)I have it, it is wonderfull

[16:48](#msg5ae748d02d0e228d7bca6d62)any of you have spent some time with shen?

9214

[16:49](#msg5ae74903c3072ad76f1e1540)@pbaille I believe @JacobGood1 tinkered with it and also proposed its macro system to be a reference implementation for Red's macros.

[16:49](#msg5ae74925c3072ad76f1e15bc)Meanwhile I'm on the hook. :)

[16:50](#msg5ae749612b9dfdbc3ae59fb1)@pbaille https://gist.github.com/dander/5ddcdb81f2e50022da5b120cab53f3fd

pbaille

[16:55](#msg5ae74a9fc3072ad76f1e1d4f)should be a good source of inspiration :)

9214

[16:56](#msg5ae74ac82b9dfdbc3ae5a7bd)I'm a little baffled by Tarver's way of doing things though :confused:

pbaille

[16:56](#msg5ae74ada2d0e228d7bca761f)you mean the closed source stuff?

9214

[16:57](#msg5ae74aff15c9b03114508256)Yeah, and no digital versions of documentation books.

pbaille

[16:57](#msg5ae74b067c3a01610d38421e)yes...

[17:00](#msg5ae74bad2b9dfdbc3ae5ab99)maybe he's not ready to handle an open source community

JacobGood1

[18:04](#msg5ae75a9e7c3a01610d389268)@pbaille for one thing, only mezzanine(I think that is what they are called) functions are available for the creation of macros, while in lisp the whole language is available including anything you or anyone else have made. Another problem is expansion, since there are no syntactic clues as to when the expansion should occur, it will occur, by default, wherever the macro's symbol is found. There are other problems as well, but these are the easiest to digest.

[18:04](#msg5ae75ab5dad6fb186f01c9c3)@9214 yes, I have it somewhere...

pbaille

[18:25](#msg5ae75f8d5d7286b43a83cd1b)@JacobGood1 Forgive me i was not clear. I missused the word macro. For my practice, a macro is a meta-programming facility before being a compile time thing. so in fact i was comparing red functions with lisp macros. It does not make so much sense... With eval in lisp you can probably do what red functions do, also it is not encouraged, in red, code manipulation seems to be at the heart. In lisp (clojure specifically) macros and functions that call eval are marginal, and thinking of it, i'm not sure you can always tweak the environment before evaluating some expression in lisp at runtime (as the 'bind function of red seems to do). So the big thing is, in my point of view, the mindset in which red puts you (encouraging meta-programing) vs the mindset of lisp (functional?). in the red mindset macros are more interesting has a compile time unit than as a meta-programing tool, but in lisp it is not so clear... I hope to be clear, but i have some doubts! :p

JacobGood1

[19:26](#msg5ae76df95d7286b43a841474)Most people mean common lisp when using the word lisp, it does have a proprietary ownership of the .lisp extension after all =). Common lisp allows one to have environments of evaluation, which can be tweaked as much as desired. Lisp, historically, was not a very functional language at all, it was more of an oop one, oddly enough. As for as mindsets go, the clojure community does seem a little allergic to meta programming, however, the lisp community does not.

## Tuesday 1st May, 2018

pbaille

[07:40](#msg5ae819e4dea1b95c10f2e009)@JacobGood1 I understand, thanks for the clarifications!

JacobGood1

[16:21](#msg5ae8941f0a9c956f0419f4bd)Don't get me wrong though, I really like rebol/red/ren-c, there is something to be said about the simplicity of meta-programming in red, and programming in general in red. I would not be here if I did not like it. I do not really get to program in the language all that much, but when I do, it is very enjoyable. One thing I love about rebol, is the fact that parsing is a fundamental feature of the language, it is pretty ridiculous that this is not the case for most languages.

## Friday 8th June, 2018

GiuseppeChillemi

[21:43](#msg5b1af888106f3c24bde73092)@JacobGood1 , do you know other languages with REDBOL like parsing ?

greggirwin

[23:08](#msg5b1b0c71a09ae108e60e6c08)Racket may aspire, but nothing I've seen comes close to Redbol and `parse`. If you don't mind the Lisp/Scheme approach, Racket is worth a look.

## Saturday 9th June, 2018

9214

[09:23](#msg5b1b9c9ddd54362753fb31b5)@GiuseppeChillemi Racket has whole macro system dedicated to DSL creation, Shen has built-in YACC compiler-compiler.

## Sunday 10th June, 2018

JacobGood1

[04:01](#msg5b1ca29814d4bc146e7acf04)Most languages have parsing in the form of a library. I do not know many languages that focus on parsing as part of their standard.  
Asking if I know of rebol like parsers... Most parsers I know of operate on strings almost exclusively, so I do not know of any other parser that has a duel mode such as rebol. However, there are many types of parsers, some of them do have benefits over rebol while simultaneously having deficits; there are no silver bullets.

## Thursday 16th August, 2018

9214

[15:53](#msg5b759e1549932d4fe4ee2c00)@JacobGood1 any thoughts on Dart 2.0?

JacobGood1

[15:55](#msg5b759e6d5b07ae730ac8cee0)I have not programmed in Dart in a while, but I am sad to see the language go in a more mainstream direction.

[15:56](#msg5b759e9767eb9f60feec1e29)They just had too many fans of static typing crying all the time.

9214

[15:57](#msg5b759ef1a3a93d24227300dd)Puny mortals. :japanese\_goblin:

JacobGood1

[15:58](#msg5b759f22988005174eea15c6)The main draw of Dart right now is Flutter

[16:00](#msg5b759f8fe9b96f2c9818eeec)Oddly enough, one of the most exciting things for me right now is the graalvm

9214

[16:00](#msg5b759f9149932d4fe4ee34c8)I see, they probably gonna push it hard with new OS.

JacobGood1

[16:00](#msg5b759faa49932d4fe4ee3529)They already said it will be the official OS language kinda like C# is to Windows

[16:04](#msg5b75a07167eb9f60feec2a09)I wish that red/rebol would become a hosted language honestly, I do not care that much about underlying complexity and the size of executables. It would be great if the red team could do everything in their vision but it is going to take a loooong time. I would care more about those "pure" ideas if they were more attainable before I become a crusty old man.

[16:04](#msg5b75a0aa8206fd2a46b7ecdf)It worked very well for clojure, I think it would work well for rebol too

9214

[16:05](#msg5b75a0c75ec2bc174f097198)Problem is that world doesn't need another Clojure :^)

JacobGood1

[16:05](#msg5b75a0c7a37112689c2b69a5)Hehe, I am not talking much about Dart am I?

9214

[16:05](#msg5b75a0dd8206fd2a46b7edd7)@JacobGood1 https://gitter.im/red/chit-chat ?

JacobGood1

[16:06](#msg5b75a0f3a37112689c2b6a8a)I do not want another clojure, I want a hosted red =)

[16:07](#msg5b75a14b5b07ae730ac8e1d5)that way they get a gc, optimizations, and libraries galore... obviously there would be downsides, just like there has been with clojure being a hosted lisp

[16:09](#msg5b75a1d15b07ae730ac8e510)making lisp symbiotic with a vm has been mostly positive in my opinion

9214

[16:10](#msg5b75a211179f842c9748f153)@JacobGood1 do you have any other examples of "symbiotic" relationships between two languages, aside from Lisp family?

JacobGood1

[16:12](#msg5b75a281e9b96f2c9819017b)anything being written for the graalvm, https://www.graalvm.org/, take a look at the languages near "High-performance polyglot VM"

[16:13](#msg5b75a2b0937eee242327a0c6)however, none of these languages were created with the idea of being hosted

9214

[16:14](#msg5b75a2c8a6af14730b4433c4)@JacobGood1 I'm actually interested in those that \*were* created with this idea in mind.

[16:14](#msg5b75a2d5a3a93d2422731db3)Shen in particular is a \*very* cunning example.

JacobGood1

[16:14](#msg5b75a2f667eb9f60feec39f4)yea but it is in the lisp family so I was not thinking about that one

9214

[16:15](#msg5b75a339a3a93d24227320f6)More like `language -> portable subset -> another language` than `language -> bloaty runtime SDK or >100 gb framework -> another language`.

JacobGood1

[16:19](#msg5b75a416a3a93d2422732488)maybe F#?  
I cannot really think of any others honestly

9214

[16:20](#msg5b75a440a37112689c2b8135)Hmmm, interesting, so F# compiles to something besides IL?

JacobGood1

[16:21](#msg5b75a49467eb9f60feec44a0)I know basically nothing about F# except that is a functional language that targets .net/clr

[16:21](#msg5b75a49b637ee66082fc50a5)It never really interested me much

[16:24](#msg5b75a52349932d4fe4ee57b1)Sorry, I am not a very good source for information on hosted languages. I just know that lisp was more niche before Rich Hickey decided to make a hosted dialect.

9214

[16:24](#msg5b75a537a3a93d2422732c3f)@JacobGood1 no worries, thanks for the chat anyway!

greggirwin

[17:29](#msg5b75b48b637ee66082fcb4fe)"More niche" ...still very niche. I think Clojure is riding the FP/immutable wave, but don't see it gaining wide adoption.

JacobGood1

[17:38](#msg5b75b694a2101b348b39a59c)No one invited you! =P

[17:39](#msg5b75b6de937eee2423281c2c)That is true, in the end, who knows why a language becomes popular...

greggirwin

[17:42](#msg5b75b7a0a3a93d2422739fe1)...because they look like C. ;^\\

[17:43](#msg5b75b7c749932d4fe4eecdff)Or meet business needs.

## Wednesday 17th October, 2018

DonaldTsang

[07:50](#msg5bc6e9e1bbdc0b2505548f24)Hi everyone!

rebolek

[07:51](#msg5bc6e9efef4afc4f288887ca)Hi @DonaldTsang

DonaldTsang

[07:53](#msg5bc6ea70ef4afc4f28888ac7)@rebolek sorry, was busy with school.  
Idea: Red having a good milestone with Anaconda's packaged functions?  
https://docs.anaconda.com/anaconda/packages/py3.6\_win-64/  
https://docs.anaconda.com/anaconda/packages/py3.6\_linux-64/  
https://docs.anaconda.com/anaconda/packages/py3.6\_osx-64/  
(was expecting that Red can get off the ground earlier....)

[07:54](#msg5bc6eaa5271506518d25c6aa)Also Discord and Matrix/Riot is getting more popular than Gitter, so it would be great if Red can engage with the youth of our time there.

rebolek

[07:57](#msg5bc6eb4d82893a2f3bf4d140)@DonaldTsang I don't think that moving to another chat platform is that great idea. Matrix/Riot may be popular now, but in few years something else will replace it and then what. Move again?

DonaldTsang

[07:59](#msg5bc6ebcd1c100a4f299c1f70)@rebolek Discord isn't going anywhere (it is "hip with the kids"), and Matrix can be used as a compatibility layer between different chats

rebolek

[08:04](#msg5bc6ed0a600c5f6423c15bc5)\*Discord is a \*\*proprietary\** freeware...* - OK, I don't have to read anything else about it  
At least Matrix is open, but its \[API description](https://matrix.org/docs/spec/client\_server/r0.4.0.html) has 170kB. Crazy.

[08:05](#msg5bc6ed4abbdc0b250554a82c)Anyway, doing Matrix client in Red is possible. Maybe someone can try it.

9214

[08:05](#msg5bc6ed5fe65a634336effca0)@rebolek their bot was banned in our rooms some time ago.

rebolek

[08:06](#msg5bc6ed7cc7bf7c366224da1f)@9214 what bot?

9214

[08:06](#msg5bc6ed9cef4afc4f28889e9c)https://github.com/matrixbot

rebolek

[08:11](#msg5bc6eea5435c2a518ebd88d6)@9214 I see. Why?

9214

[08:13](#msg5bc6ef19435c2a518ebd8b74)@rebolek first time someone just started to test a bot in one of the rooms by playing ping-poing with himself, the other time IIRC it was OS flamewar.

rebolek

[08:13](#msg5bc6ef3b435c2a518ebd8c16)Wow, I totally missed that

DonaldTsang

[08:24](#msg5bc6f1b764cfc273f9dd4a00)@rebolek KIds don't care about FOSS, they just care about engagement e.g. VoIP and stickers/emojis

9214

[08:27](#msg5bc6f27e384492366151a733)A pity, because Red is more about open-source than stickers or whatnot.

rebolek

[08:27](#msg5bc6f2866e5a401c2d855eb8)@DonaldTsang I have no problem with that, but this is technical chat, not some game room.

DonaldTsang

[08:44](#msg5bc6f654ef4afc4f2888db1c)@rebolek I don't think you understand what I said. It is the best way of engaging with the youth of today. Examples  
Hydrus - discord.gg/vy8CUB4 https://github.com/hydrusnetwork/hydrus/releases  
ShokoAnime - discord.gg/vpeHDsg https://github.com/ShokoAnime  
WhatAnime - discord.gg/K9jn6Kj https://github.com/soruly/whatanime.ga  
Nori - discord.gg/3DTNcHu https://github.com/tjg1/nori/releases

[08:44](#msg5bc6f66d435c2a518ebdb95e)@9214 I think it is a generations thing

9214

[08:57](#msg5bc6f96fae7be940166ea10f)&gt; I don't think you understand what I said

I don't think \*you* understand what you are saying either. Comparing programming language with hobbyst's media apps, and asking to throw community of knowledge and practice that surrounds it into hipster (or otaku?) moshpit. That's sound more like bad PR manager's prank.

DonaldTsang

[09:07](#msg5bc6fbbc6e5a401c2d859bb1)@9214 What I am saying is "get them when they are young, so that they will stick to it in the long term", and I don't think it is hipster as it is "of our generation". If being pro is important, I would say Slack or Gitter can do it, but the engagement would be lowered.

[09:12](#msg5bc6fcebef4afc4f28890107)Take this for example https://discord.me/page/coding https://discord.me/page/geekhub https://discord.me/page/coding-core  
(the community of programmers or would-be programmers are huge)

9214

[09:18](#msg5bc6fe7264cfc273f9dda29c)Spreading community across multiple communication channels won't solve any of our problems. They require constant monitoring, moderation, promotion and presence of community leaders - all the things that core team cannot afford time and resources for, as there are more important things to do.

DonaldTsang

[09:34](#msg5bc7020cbbdc0b25055531f3)It is one things to get things done, and other to attract people to the software. Some questions to think about: How is Go (2009), Rust (2010), Nim (2008), (all three are Java/C-level), Scala (2004), Elixir (2011) (both functional) more popular than Red (in terms of Github stars or RedMonk metrics) http://sogrady-media.redmonk.com/sogrady/files/2018/08/lang.rank\_.618-1.png

9214

[09:43](#msg5bc7042c6e5a401c2d85d0d7)Derailing discussion into language flamewar (or pushing subjective comparison metrics of completely different projects, two which are courtesy of Google and Mozilla) doesn't give you any credit, I believe you know that. Red is not a software, it's a toolchain for software creation. And it needs to be fully functional to attract people who will use it en masse.

greggirwin

[15:18](#msg5bc752c064cfc273f9e00466)This should move to red/chit-chat to continue. I'll respond there.
