# Archived messages from: [gitter.im/red/red.js](/gitter.im/red/red.js/) from year: 2022

## Saturday 2nd April, 2022

GaryMiller

[20:17](#msg6248af3ec61ef0178ea29857)@ALANVF any news on red.js?

## Monday 4th April, 2022

ALANVF

[00:26](#msg624a3b2d99d94f5f0c815b77)@GaryMiller I'm still working on it on-and-off (also balancing with my work on Star), however I'm currently in search for a new job as... things happened and I dropped college, and was not accepted to work at Replit again, so I will probably be less active on both projects for a little while

GaryMiller

[01:09](#msg624a454c8db2b95f0a9bca6c)Sorry to hear about the job situation. Obviously that takes first priority. Best of luck in the job search!

ALANVF

[01:23](#msg624a48823ae95a1ec1ce6e4a)thanks :thumbsup:

## Friday 6th May, 2022

ALANVF

[20:44](#msg627588b2cd35b566afd25954)ok so thinking about an implementation issue

[20:44](#msg627588b7cd35b566afd25959)how does `context?` work?

GiuseppeChillemi

[20:44](#msg627588c79db19366b2175919)What are you asking?

ALANVF

[20:45](#msg627588cccd938f6ea2344980)I was under the impression that words only store the context they came from, not the object that the context belongs it

[20:45](#msg627588fb89dcc96e9ced19fd)this is why `func[/local a][context? 'a]` will return the function itself

[20:46](#msg6275890afa846847c951d73e)but how/where is the function stored? is it stored with the context or the word?

GiuseppeChillemi

[20:46](#msg6275892746495f47cfcb10ac)Words have values in a context. They point to a context where you have both the symbol and the value.

ALANVF

[20:47](#msg62758979cd35b566afd25ada)sure, but say that word `a` belongs to context `b`, which is associated with object `c`. does `a` store a reference to `b` and `c`, or does `b` store a reference to `c` (as well as `c` storing a reference to `b`)?

[20:48](#msg6275899e949ae9400694256f)hopefully that makes sense

[20:49](#msg627589cbd30b6b44ebd7324d)maybe this is better asked in red/red

GiuseppeChillemi

[20:50](#msg627589f8949ae9400694263b)`a` does store a reference to an anonymous context.

ALANVF

[20:50](#msg62758a03bb0de60c7228bfe0)yes

GiuseppeChillemi

[20:50](#msg62758a169db19366b2175be8)`b` value is a reference to that anonyous context

ALANVF

[20:50](#msg62758a1dcd35b566afd25bbc)but does it also store a reference to the actual object the context belongs to, or does the context do that?

GiuseppeChillemi

[20:51](#msg62758a4a46495f47cfcb1302)it = ?

ALANVF

[20:51](#msg62758a56cd35b566afd25c28)`a`

GiuseppeChillemi

[20:52](#msg62758a9389dcc96e9ced1d04)Wait a minute, I need to search something

ALANVF

[20:52](#msg62758a95cd35b566afd25c6b)I see this in the runtime code:

```
red-context!: alias struct! [
	header 	[integer!]								;-- cell header
	symbols	[node!]									;-- array of symbol IDs
	values	[node!]									;-- block of values (do not move this field!)
	self	[node!]									;-- indirect auto-reference (optimization)
]
```

maybe `self` is the reference to the object, or the context (being a cyclic reference)?

GiuseppeChillemi

[20:53](#msg62758ac6d4ef6e15af337934)I can't answer this question, @hiiamboris or @greggirwin will

[20:57](#msg62758bb310cfc315bc688ce6)From my archive, from my master: @9414

[20:57](#msg62758bb6949ae940069428b2)https://gitter.im/red/help?at=5e7f658459057617f049a7ee

hiiamboris

[20:58](#msg62758be9cd938f6ea234502e)what's the question

ALANVF

[20:58](#msg62758c0061f5ca3feeec3ab3)&gt; sure, but say that word `a` belongs to context `b`, which is associated with object `c`. does `a` store a reference to `b` and `c`, or does `b` store a reference to `c` (as well as `c` storing a reference to `b`)?

hiiamboris

[20:59](#msg62758c30bb0de60c7228c52a)what's "associated"?

[20:59](#msg62758c4410cfc315bc688de8)ah, I see what you mean

ALANVF

[20:59](#msg62758c4761f5ca3feeec3bb8)yeah, objects store a reference to their context

GiuseppeChillemi

[21:00](#msg62758c52eaf3267f854b03f1)@ALANVF https://gitter.im/red/help?at=5c345c64357dd7655d354ab3

[21:00](#msg62758c5746495f47cfcb170f)From Nenad

ALANVF

[21:01](#msg62758ca241f4560c6f8a4964)ok so that supports what I've already thought about, so does that mean that contexts store a reference to their associated object/function?

hiiamboris

[21:01](#msg62758cb2bb0de60c7228c5b5)`a` should store a reference to context `b`, not object `c` (context can be a function too)

ALANVF

[21:01](#msg62758cc1a687887f8d921930)sure, that's what I'm doing currently

[21:02](#msg62758ccb61f5ca3feeec3cb8)but somehow, `context?` is able to access `c`

[21:02](#msg62758ce5eaf3267f854b062e)I am thinking about this from an implementation standpoint

[21:03](#msg62758d3f9db19366b217619b)or perhaps this can be thought of in an object-oriented way where objects and functions both have context as a base class?, meaning objects/functions are types of contexts?

[21:04](#msg62758d6dd4ef6e15af337def)that doesn't seem to hold up when looking at the impl details though

GiuseppeChillemi

[21:06](#msg62758dd6949ae94006942d05)@ALANVF Here is what I was searching for: https://gitter.im/red/help?at=5accc5a91130fe3d36c0b7e9

ALANVF

[21:08](#msg62758e3f14df4e44f2121384)hmm ok so it does appear that `b` does contain a reference to `c`, that's helpful thanks!

[21:09](#msg62758e79949ae94006942e1e)this can however probably be modeled using the object-oriented approach I discussed earlier though

GiuseppeChillemi

[21:10](#msg62758ec0949ae94006942ee5)Another link:  
https://gitter.im/red/help?at=5dc6a5feeeb63e1a838156b4

[21:10](#msg62758edfeaf3267f854b09f3)It is the last one until you will request me to continue

ALANVF

[21:11](#msg62758ef741f4560c6f8a4e63)no that's plenty helpful, thanks :+1:

hiiamboris

[21:26](#msg62759290a687887f8d922309)Red runtime is a damn maze

ALANVF

[21:26](#msg627592a141f4560c6f8a54d7)lol yeah kinda

hiiamboris

[21:27](#msg627592b889dcc96e9ced2c0e)my version is: `ctx/node` refers to a hashtable, and first value in that hash table contains the initial object/function (or maybe even 2nd value)

ALANVF

[21:27](#msg627592d9bb0de60c7228d013)yeah that lines up with my conclusion from earlier

[21:28](#msg627592f9bb0de60c7228d08a)I'm now rewriting some of the red.js code to follow this

hiiamboris

[21:28](#msg62759319d4ef6e15af33872e):+1:

ALANVF

[21:30](#msg62759364cd938f6ea2345e76)fun fact: while looking into this, I found that the global object context has an id of -1

hiiamboris

[21:37](#msg6275950761f5ca3feeec4ccf)https://github.com/red/red/blob/38b42610d2ddd5af53f0133dfe81d9391785126e/runtime/datatypes/context.reds#L404  
not a hashtable, just 2-cell series

[21:37](#msg62759520eaf3267f854b1492)https://github.com/red/red/blob/38b42610d2ddd5af53f0133dfe81d9391785126e/runtime/datatypes/object.reds#L912  
second value is the object/func

ALANVF

[21:37](#msg6275953041f4560c6f8a58ed)yeah that's what I figured, thanks

[21:38](#msg62759544949ae94006943974)a lot of R/S code is a bit cryptic for me because of all the pointer arithmetic lol

hiiamboris

[21:39](#msg627595a210cfc315bc689f5d)yeah it's like navigating a network of teleports without a map :)

[21:41](#msg627596079db19366b21770a1)not so much the pointers, but how things depend on other things

[21:41](#msg6275962646495f47cfcb2a58)View is even more of a mess, esp. it's Draw part

GiuseppeChillemi

[21:51](#msg627598549db19366b2177556)OMG, I am loosing the hope to learn the inner working of RED!

ALANVF

[22:09](#msg62759c89d4ef6e15af339836)ok got it working

[22:09](#msg62759c8b61f5ca3feeec5a4f)\[!\[image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/BHtp/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/BHtp/image.png)

## Thursday 19th May, 2022

ALANVF

[23:02](#msg6286cc7fd126691416a5f92b)ohhhh I just figured out how symbols work

[23:02](#msg6286cc8906a77e1e18454cea)apparently words refer to symbols, and are not actually the same thing

[23:03](#msg6286ccc84e38f759e27b50fb)that makes a lot more sense

## Friday 20th May, 2022

ALANVF

[19:59](#msg6287f33b06a77e1e184792a6)got words and contexts/objects working correctly

[19:59](#msg6287f33eda83520ac33eb0cf)\[!\[image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/CKwQ/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/CKwQ/image.png)

GiuseppeChillemi

[20:03](#msg6287f411da83520ac33eb1dc)Nice!

greggirwin

[20:27](#msg6287f9c7da83520ac33ebdd7):+1:

## Saturday 21st May, 2022

ALANVF

[01:24](#msg62883f4d06a77e1e18481de3)finally figured out how to correctly implement `self`

[01:24](#msg62883f51f8daa71e078d32d9)\[!\[image.png](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/2e7o/thumb/image.png)](https://files.gitter.im/5ec064b3d73408ce4fe3fbdb/2e7o/image.png)

[01:24](#msg62883f62da83520ac33f3f9b)that was a headache

[01:27](#msg62883ff37df86c141e95f536)I personally don't like how `self` is configured in Red after spending a few hours trying to figure it out, and I think there's probably a better way to do it in the future

## Friday 27th May, 2022

ALANVF

[02:10](#msg6290330ee393a3180628ac95)ok so thought

[02:10](#msg6290332a7df86c141ea57234)https://github.com/red/red/blob/master/runtime/datatypes/float.reds#L669 is a pita to implement in js without tons of extra allocations because you cannot simply get the binary repr of a float

[02:11](#msg6290336c4aa6c31dca206778)so uh, do I go with an expensive algorithm to do it with less allocations, use the bad solution, or do something else? (and if so, what?)

[22:44](#msg62915445da330517ff997f8f)the `compare` action is now available for many more datatypes, including numbers and words

[22:44](#msg62915450db6f627d25a33dd2)many basic series actions are also now available

## Saturday 28th May, 2022

toomasv

[03:23](#msg629195bfd126691416bb5927):+1:

greggirwin

[17:13](#msg62925822c61b987d33cfab6a)@ALANVF on floats, the first thing I would do is the easy thing, i.e. what JS does naturally with numbers. Then find the cases where that differs from Red and document it. There should be tests for Red to help focus on where that's used. With that, it can be put on a list and prioritized against other features.

ALANVF

[19:50](#msg62927d0cf8daa71e07a123bb)@greggirwin yep that's what I've done for now. I think that worst-case scenario, I could use an external JS library that does something similar and determine (and document) how that differs from Red's behavior

## Monday 22nd August, 2022

ALANVF

[20:39](#msg6303e992999499629302b0d1)Red.js has now been updated to Haxe 4.3 preview since it's now stable

[20:40](#msg6303e9d4999499629302b147)(curious, it's not showing up in the activity log?)

## Tuesday 23th August, 2022

GaryMiller

[00:35](#msg630420bf7ccf6b6d45751d9d)Did 4.3 have any features you've been waiting for? Still making any headway otherwise?

ALANVF

[00:35](#msg630420e6458f823ce02177af)4.3 added null-safety features (like `??` and `?.` operators), and it fixed a lot of compiler bugs

[00:36](#msg630420ff647d633cf6bdcdf7)it should be less annoying to work on new features now
