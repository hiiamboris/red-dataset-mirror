# Archived messages from: [gitter.im/red/red/map-datatype](/gitter.im/red/red/map-datatype/) from year: 2015

## Monday 1st June, 2015

WiseGenius

[15:16](#msg556c7739463d0c7c066d9966)@dockimbel I've noticed that, unlike Rebol 3, in Red's `map!`'s keys, there is no distinction between `word!`s and `set-word!`s. Also, unlike Rebol 3, the mold of Red's `map!`s represents both `word!` and `set-word!` keys as `set-word!`s. Neat. I assume this is is intentional, but just wanted to check?

dockimbel

[15:35](#msg556c7bbff88eee3f7365321e)@WiseGenius It is fully intentional.

WiseGenius

[15:36](#msg556c7bfc05c872ce6ac77510):smile:

dockimbel

[15:37](#msg556c7c23757c7bdd121fbba7)I don't know if Rebol3 has a good reason to make such distinction.

WiseGenius

[15:39](#msg556c7cb405c872ce6ac7752e)I can't think of any, and it's not as easy to access `set-word!`s.

greggirwin

[17:28](#msg556c965805c872ce6ac778d9)I voted on the wiki, and didn't even rant.

## Tuesday 2nd June, 2015

dockimbel

[01:06](#msg556d0178f88eee3f7365332e)@greggirwin :smile:

rebolek

[05:07](#msg556d39f6a891bec12ef51e9c):point\_up: \[June 1 2015 5:16 PM](https://gitter.im/red/red/map-datatype?at=556c7739463d0c7c066d9966)  
I don't think there's distinction in R3:  
&gt;&gt; make map! \[a: 3 a 5]  
\== make map! [  
a: 5  
]

WiseGenius

[05:10](#msg556d3abe463d0c7c066dad0e)It's more like a preservation of type.

dockimbel

[05:11](#msg556d3b066e9da0e939f64674)Just tested in Red, we have a bug to fix for that use-case.

WiseGenius

[05:12](#msg556d3b3b463d0c7c066dad10)

```
>> m: make map! [a 1 b: 2]
== make map! [
    a 1
    b: 2
]

>> append m [a: 3 b 4]
== make map! [
    a 3
    b: 4
]
```

rebolek

[05:13](#msg556d3b8f9f3a9b7b060a3474) &gt;&gt; m: make map! \[a: 3 a 5] print m/(to set-word! 'a) print m/(to word! 'a)  
5  
5

WiseGenius

[05:17](#msg556d3c4d463d0c7c066dad1b)

```
>> type? pick words-of m 1
== word!

>> type? pick words-of m 2
== set-word!
```

[05:23](#msg556d3dd28d1a52c22e870270)Same code in Red:

```
red>> m: make map! [a 1 b: 2]
== make map! [
    a: 1
    b: 2
]
red>> append m [a: 3 b 4]
== make map! [
    a: 3
    b: 4
]
red>> type? pick words-of m 1
== word!
red>> type? pick words-of m 2
== word!
```

[05:24](#msg556d3dfaa891bec12ef51ecb)Personally, I like what Red does here.

rebolek

[05:38](#msg556d4163777c17d06a138d17)Yes, Red seems more consistent when molding but functionally they're both the same.

WiseGenius

[05:42](#msg556d423505c872ce6ac7892f)It's not just the molding. In the last 2 lines, Rebol still remembers that `b:` started out as a `set-word!`. Red doesn't.

rebolek

[05:44](#msg556d42b28d1a52c22e8702b6)Yes, but does it matter functionally?

WiseGenius

[05:45](#msg556d4304463d0c7c066dad7d)No. Only if you try to force it to. :smile:

[05:47](#msg556d436fa891bec12ef51f22)I like it, but I wonder if:

```
red>> make map! [a 1 b: 2 "c" 3]
== make map! [
    a: 1
    b: 2
    "c" 3
]
```

should be represented as:

```
== make map! [
    a: 1
    b: 2
    "c": 3
]
```

or:

```
== make map! [
    a 1
    b 2
    "c" 3
]
```

instead?

[05:47](#msg556d43899f3a9b7b060a34e4)Not so much arguing that it should as wondering out loud.

rebolek

[05:48](#msg556d43b3463d0c7c066dad8d)Well, as there is no `"set-string":` type, I guess the later.

WiseGenius

[05:50](#msg556d442205c872ce6ac78951)Yes, `"c":` would be bad.

pekr

[12:40](#msg556da4548d1a52c22e870bec)`test:`

## Wednesday 3th June, 2015

PeterWAWood

[03:42](#msg556e779e777c17d06a13ae46)Map allows both paren! and block! values to be used as keys. The values can be accessed with a little effort:

```
== make map! [
    (1 + 2) (3 + 4)
]
red>> m/(1 + 2)
== none
red>> select m (1 + 2)
== none
red>> select m first [(1 + 2)]
== (3 + 4)
red>> m2: make map! [[s] [d]]
== make map! [
    [s] [d]
]
red>> select m2 first [[s]]
== [d]
```

This is different to Rebol3. Is this intentional?

dockimbel

[03:49](#msg556e793ad7b85e59520e6fd4)@PeterWAWood Not intentional.

[04:00](#msg556e7bd97c118077202822c5)@qtxie ^---

PeterWAWood

[04:04](#msg556e7cb827d2203776cc5956)Have you considered automatically evaluating paren! values in make?

I know that the same behaviour can easily be achieved by composing make's argument block but it would be consistent with path notation:

```
red>> a: "Key One"
== "Key One"
red>> b: "Key Two"
== "Key Two"
red>> m: make map! [(a) 12345]
== make map! [
    "Key One" 12345                            ;;; <--- proposed behaviour
]
red>> m/(b): 67890
== 67890
red>> m
== make map! [
    "Key One" 12345                                                           
    "Key Two" 67890
]
```

dockimbel

[04:33](#msg556e83aed7b85e59520e6fd8)I am not sure I want to keep paren! in path, they create a big syntactic problem, as paths are mono-line literal forms while paren! can be multi-line.

[04:37](#msg556e8472069be0647dcfe1b3):point\_up: \[June 3 2015 12:04 PM](https://gitter.im/red/red/map-datatype?at=556e7cb827d2203776cc5956) No, I don't want to introduce a new special evaluation rule. You can use `compose` or `reduce` to construct the spec block for maps, or just dynamically fill it.

PeterWAWood

[06:08](#msg556e99eb8d1a52c22e872572)Not allowing paren! in paths would be a plus for consistency from my point of view.

pekr

[06:14](#msg556e9b49a891bec12ef5424d)sorry for my ignorance, but you want to disallow e.g. blk/(a) ?

PeterWAWood

[06:28](#msg556e9eaa463d0c7c066dd0b7)Isn't blk/(a) going to be the equivalent of blk/a in the majority of cases?

pekr

[06:34](#msg556e9fec05c872ce6ac7ac8d)no

[06:35](#msg556ea0188d1a52c22e8725c3)blk: \[a 1 b 2 c 3] blk/a vs a: 5 blk/(a)

[06:35](#msg556ea01aa891bec12ef54297)?

PeterWAWood

[06:43](#msg556ea2168d1a52c22e8725db)In that case blk/(a) is the equivalent of blk/:a

[06:46](#msg556ea2d3777c17d06a13b07f)I don't think, in the case you showed Pekr, there is any difference in the behaviour simply the syntax. You know that you don't want blk/a so you would need to use blk/:a instead of blk/(a)

(It's one less character to type too ;-) )

pekr

[06:50](#msg556ea3ca8d1a52c22e87260c)ok, what about eveluated = computed values?

rebolek

[06:51](#msg556ea3d9777c17d06a13b092)What about `blk/(a + 1)`

pekr

[06:51](#msg556ea3e6a891bec12ef542e5)exactly ...

[06:52](#msg556ea4108d1a52c22e872610)IIRC, there was some change in how are path evaluated, just not sure if it was for R2 too, or the change was done during the R3 development ...

rebolek

[06:53](#msg556ea4558d1a52c22e872614)What change?

PeterWAWood

[06:53](#msg556ea45b777c17d06a13b09a)Yes, you would need to handle that with an extra statement

pekr

[06:53](#msg556ea47f463d0c7c066dd118)btw: http://www.rebol.net/r3blogs/0229.html - change to Paths

rebolek

[06:55](#msg556ea4e7777c17d06a13b0a9)Ah, ok. Paths in blocks.

dockimbel

[07:48](#msg556eb13bc031e8121ba9c712)`blk/(a + 1)` =&gt; `select blk a + 1` (You can still add parens around `a + 1` if you find it more readable)

[07:49](#msg556eb181c031e8121ba9c714)Parens in paths are just syntactic sugar, removing them does not make us loose any feature. \_We should move this discussion to the main channel, it's off-topic here_

## Monday 8th June, 2015

WiseGenius

[05:21](#msg5575266205c872ce6ac839ab):point\_up: \[June 8 2015 3:12 PM](https://gitter.im/red/red?at=5575245027d2203776cce83a) I'm thinking `poke` should have the same refinements as `select`.

pekr

[05:32](#msg557528e105c872ce6ac839bd)will syntax like following work? get in map 'word ?

dockimbel

[05:34](#msg5575295505c872ce6ac839c4):point\_up: \[June 8 2015 1:21 PM](https://gitter.im/red/red/map-datatype?at=5575266205c872ce6ac839ab) I considered that, but in such case, `pick` should have too, which is going a bit too far as pick/poke are meant to be low-level series (or aggregates) accessors, so they are freed from any refinement so far, I wouldn't want to change that.

pekr

[05:35](#msg55752995463d0c7c066e5e0e)Sorry if not constructive. What I never liked about R3 process was if someone tried to add new functions, just for the sake of a difference. We have kind of polymorphism, so I like series functions I can acutally remember - first, second, next, select, pick, change, remove, etc.

dockimbel

[05:35](#msg557529a305c872ce6ac839c7):point\_up: \[June 8 2015 1:32 PM](https://gitter.im/red/red/map-datatype?at=557528e105c872ce6ac839bd) No, because keys can be any-strings or numbers, so they don't have a binding to change (`in` affects the binding of words).

pekr

[05:36](#msg557529c0777c17d06a143ec2)Then suddenly (and hopefully for a good, we started to detract from some reflections - maybe mostly of a security reasons) - so no first, second, on functions, objects, we got - words-of, series-of, etc.

[05:36](#msg557529d0813c577e1cf59598)But for general picking/extending, why the hell anything like extend even came to life?

dockimbel

[05:36](#msg557529ec05c872ce6ac839c8)Series functions are for series. If you start extending their use-cases too far from their original target, their meaning will weaken (like in human languages when you broaden too much the definition of a word).

pekr

[05:37](#msg55752a0a777c17d06a143ec7)Maybe it is because in fact, I never used maps, nor lists in R2, etc., so I am fully used and hence limited to mostly a block/object duo of semantics.

dockimbel

[05:37](#msg55752a1e27d2203776cce870)\_But for general picking/extending, why the hell anything like extend even came to life?_ Because objects, maps and other data structures are not series.

pekr

[05:37](#msg55752a2c27d2203776cce872)I was so glad, when R3 added append on objects, because I could see familiar word getting mapped to requested usage scenario ...

dockimbel

[05:39](#msg55752a75463d0c7c066e5e13):point\_up: \[June 8 2015 1:37 PM](https://gitter.im/red/red/map-datatype?at=55752a2c27d2203776cce872) I always considered that a mistake. ;-) Objects are not series.

pekr

[05:39](#msg55752a7b777c17d06a143ec9)Yes, that's what I am talking about? We let our functions being kind of polymorphic to many various datatypes, even stuff like dates, tuples, for e.g., and then kind of artificially we are saying - this is different, so we need different function names to do basically the same, what we do to series, but using differently named functions :-)

[05:39](#msg55752a88813c577e1cf5959e)OK, I stop my rant, untill I think a more about all that stuff ...

WiseGenius

[05:41](#msg55752b25777c17d06a143ed2):point\_up: \[June 8 2015 3:36 PM](https://gitter.im/red/red/map-datatype?at=557529ec05c872ce6ac839c8) Using that reasoning, maybe a different function from `poke` should be used for that functionality, since it doesn't seem to work this way on `block!`s and `hash!`s anyway?

```
red>> poke [a 10] 'a 20
*** Script error: value out of range: a
*** Where: poke
```

dockimbel

[05:43](#msg55752b9405c872ce6ac839cf):point\_up: \[June 8 2015 1:39 PM](https://gitter.im/red/red/map-datatype?at=55752a7b777c17d06a143ec9) We need new functions when the existing one are a bad fit to the new features we want to support. I always try to reuse existing one first, if they can fit. In case of map! in Red (which is different from R3's map case-handling-wise), I did not introduce any new functions (compare to R3), I just repurposed `modify` and changed `extend` arity.

[05:44](#msg55752bd7463d0c7c066e5e1d):point\_up: \[June 8 2015 1:41 PM](https://gitter.im/red/red/map-datatype?at=55752b25777c17d06a143ed2) In cases of series!, `poke` interprets the value argument as index, as there is no key/value concept in series. I don't think it is too far-streched to extend the polymorphism to let different data container structures interpret the `value` argument differently. BTW, in the spec, there is `modify` as alternative. Though, this is open to discussion.

pekr

[05:50](#msg55752d0d463d0c7c066e5e20)/note aaah, I never liked poke, it always reminds me of the ZX spectrum assembler :-)

[05:50](#msg55752d28813c577e1cf595ae)Will have to lookup 'modify, never used it in terms of R3 ... or I forgot ... it is a long time ...

dockimbel

[05:50](#msg55752d3f05c872ce6ac839db)I am not against removing `poke` (hence `pick` too) from being used on maps. We already have alternative ways to access maps.

pekr

[05:51](#msg55752d5605c872ce6ac839dc)Maybe no need to remove them ... yet ...

[05:55](#msg55752e4e05c872ce6ac839e2)Don't want to distract chat from map type, but looking into R3's 'modify - what is the difference then between the 'modify and 'update, when applied on ports? I mean - if we want to stay "kind of" (whatever it means) compatible to R3, wasn't 'modify meant to be really kind of tightly related to files/ports? I mean - wasn't that func, that was supposed to change some internals, kind of like you were looking for some means to change a dtype related "metadata"?

dockimbel

[05:55](#msg55752e5a777c17d06a143ee7)The thing with `append` and maps in Red is that `append` has no `/case` refinement. Adding one to it would require to add `/case` also to several other series actions and it might affect many series semantics.

[05:56](#msg55752e8b27d2203776cce890):point\_up: \[June 8 2015 1:51 PM](https://gitter.im/red/red/map-datatype?at=55752d5605c872ce6ac839dc) `update` takes 1 argument, `modify` takes 3. :)

WiseGenius

[05:57](#msg55752eb6463d0c7c066e5e37):point\_up: \[June 8 2015 3:55 PM](https://gitter.im/red/red/map-datatype?at=55752e5a777c17d06a143ee7) Yes, I was thinking that too. Does that mean `extend` will have one?

dockimbel

[05:57](#msg55752ec9813c577e1cf595b4):point\_up: \[June 8 2015 1:57 PM](https://gitter.im/red/red/map-datatype?at=55752eb6463d0c7c066e5e37) It does already in the spec. ;-)

[05:59](#msg55752f5b463d0c7c066e5e3c):point\_up: \[June 8 2015 1:51 PM](https://gitter.im/red/red/map-datatype?at=55752d5605c872ce6ac839dc) `modify` is just been extended to act on map! too, I would keep its base features for ports and files (once we implement IO).

pekr

[06:00](#msg55752f6e463d0c7c066e5e3d)I wonder if `extend`is needed? Would not `set`just do it? I mean - if the key does not exist, it is created?

WiseGenius

[06:06](#msg557530e4463d0c7c066e5e4a):point\_up: \[June 8 2015 3:55 PM](https://gitter.im/red/red/map-datatype?at=55752e5a777c17d06a143ee7) I'm wondering if that should be a concern though, since there is also no `/case` refinement when constructing a `map!` to begin with. I don't hear anyone considering adding `/case` to `make`.

dockimbel

[06:09](#msg5575318705c872ce6ac83a07):point\_up: \[June 8 2015 2:00 PM](https://gitter.im/red/red/map-datatype?at=55752f6e463d0c7c066e5e3d) `set` could fit the requirements (number of arguments and `/case` support), but such semantic rule would not be consistent with how `set` is used in other cases (setting a word or group of words to a value or list of values). `set` separates the words/keys to set from the corresponding value(s). `extend` would work with word/value or key/value pairs.

[06:10](#msg557531cbf40a067d1c9bbfe2):point\_up: \[June 8 2015 2:06 PM](https://gitter.im/red/red/map-datatype?at=557530e4463d0c7c066e5e4a) It is not needed, as constructing a map! is always case-sensitive. ;-)

[06:14](#msg557532c8f40a067d1c9bbff1):point\_up: \[June 8 2015 2:09 PM](https://gitter.im/red/red/map-datatype?at=5575318705c872ce6ac83a07)

```
set object [a: 123 b: 456] [1 2]
vs
set #(a: 123 b: 456) [a: 1 b: 2]
```

The second argument structure would be different. Though, supporting `set` on map! like for object! could be useful (but you cannot add new values that way).

WiseGenius

[06:15](#msg557532f627d2203776cce8c9)@dockimbel Isn't `append` always case-sensitive too?

```
red>> append [a 10 A 20] [b 30 B 40]
== [a 10 A 20 b 30 B 40]
```

dockimbel

[06:20](#msg55753446f40a067d1c9bbfff):point\_up: \[June 8 2015 2:15 PM](https://gitter.im/red/red/map-datatype?at=557532f627d2203776cce8c9) Yes (even if \_been case-sensitive_ concept does not apply with `append`on series), that's why `append` is a bad choice for maps in Red, and an even worse choice in R3 as maps are case-insensitives...

[06:20](#msg55753448463d0c7c066e5e70):point\_up: \[June 8 2015 2:15 PM](https://gitter.im/red/red/map-datatype?at=557532f627d2203776cce8c9) Yes (even if case-sensitive concept does not apply with `append` on series), that's why `append` is a bad choice for maps in Red, and an even worse choice in R3 as maps are case-insensitive...

WiseGenius

[06:25](#msg5575354905c872ce6ac83a42)I agree it's a bad choice for the Rebol 3 `map!`, but since Red's `map!`s construction is also always case-sensitive, I think it has a useful fit.

dockimbel

[06:29](#msg55753655777c17d06a143f5f):point\_up: \[June 8 2015 2:25 PM](https://gitter.im/red/red/map-datatype?at=5575354905c872ce6ac83a42) I get what you mean now...worth considering.

WiseGenius

[06:29](#msg5575365af40a067d1c9bc02d)`map!`s are case-sensitive for storage, `block!`s are case-sensitive for storage as well, so using `append` has predictable behaviour. But in Rebol 3, it's surprizing.

[06:30](#msg5575368c463d0c7c066e5e9d):point\_up: \[June 8 2015 4:29 PM](https://gitter.im/red/red/map-datatype?at=55753655777c17d06a143f5f) OK, I thought I was still missing something.

dockimbel

[06:31](#msg557536ba777c17d06a143f65)@WiseGenius We would still need a way to make bulk changes in a case-insensitive way, so `extend` remains the only option so far.

WiseGenius

[06:34](#msg5575375af40a067d1c9bc040):point\_up: \[June 8 2015 4:31 PM](https://gitter.im/red/red/map-datatype?at=557536ba777c17d06a143f65) Agreed.

PeterWAWood

[06:48](#msg55753ab3f40a067d1c9bc084)I don't really understand what you mean by blocks are case sensitive storage. Words and strings in Rebol are case-preserving whether in a block or not.

WiseGenius

[06:51](#msg55753b79463d0c7c066e5ee9):point\_up: \[June 8 2015 4:48 PM](https://gitter.im/red/red/map-datatype?at=55753ab3f40a067d1c9bc084)In Rebol 3, you can't 2 keys coexisting in a `map!` differing only by case sensitivity:

```
>> map [a 10 A 20]
== make map! [
    a 20
]
```

dockimbel

[06:53](#msg55753c0327d2203776cce966):point\_up: \[June 8 2015 2:48 PM](https://gitter.im/red/red/map-datatype?at=55753ab3f40a067d1c9bc084) Right, "case-preserving" is more accurate.

PeterWAWood

[06:54](#msg55753c1905c872ce6ac83a98)Yes, in Rebol3 map! keys are case folded. I'm still no wiser as to what you mean by blocks are case sensitive storage.

WiseGenius

[07:09](#msg55753fab463d0c7c066e5f21):point\_up: \[June 8 2015 4:54 PM](https://gitter.im/red/red/map-datatype?at=55753c1905c872ce6ac83a98)Yes. It only really needs to make sense when talking about `map!`s. Then, when asking if it's also true of `block!`s, we can say, “yes”. But it doesn't really make sense to start the question with `block!`s because then it isn't really applicable. They can even have:

```
>> [a 10 a 20]
== [a 10 a 20]
```

[07:09](#msg55753fb027d2203776cce99f)The reason I don't say “case-preserving” is because (as I understand the use of the term), even in Rebol 3, `map!` keys are case-preserving:

```
>> map [a 10 A 20 B 30 b 40]
== make map! [
    a 20
    B 40
]

>> m/b: 50
== 50

>> m
== make map! [
    a 10
    B 50
]
```

[07:10](#msg55754000777c17d06a143fe8)`B` keeps the first case it was given. Is this what you mean by “case-preserving” too?

[07:17](#msg5575416ff40a067d1c9bc0ef)In Red, 2 keys differing only by case can coexist in the same `map!`, making it useful for both case-sensitive and case-insensitive data:

```
red>> m: #(a 10 A 20 B 30 b 40)
== #(
    a: 10
    A: 20
    B: 30
    b: 40
)
red>> m/b: 50
== 50
red>> set/case 'm/b 60
== 60
red>> m
== #(
    a: 10
    A: 20
    B: 50
    b: 60
)
```

[07:22](#msg557542d2463d0c7c066e5f51)@PeterWAWood What would you call this attribute when comparing it to Rebol 3's `map!`? Whatever it is is what I've been referring to by “case-sensitive for storage”.

[07:35](#msg557545d1463d0c7c066e5fa2)Maybe Rebol 3's `map!` should just be considered “broken” or having a “bug”, and then we should just stop comparing Red's superior “unbroken” `map!` to Rebol's one until it is also “fixed”? Then I wouldn't be tempted to make up confusing phrases.

PeterWAWood

[07:53](#msg557549f6777c17d06a1440d0)As I see it, Rebol3 map! keys are case-preserving. The Rebol3 functions that operate on map! values treat the keys case insensitively. The functions that I refer to include make! and those that operate on paths.

dockimbel

[08:38](#msg5575546927d2203776cceb8d)@/all You can play with `modify` and `extend` on maps now. `append` support has been removed (replaced by `extend`).

WiseGenius

[08:39](#msg557554b7813c577e1cf598df):( Goodbye `append`. I thought you were OK.

dockimbel

[08:48](#msg557556d827d2203776ccebce):point\_up: \[June 8 2015 4:39 PM](https://gitter.im/red/red/map-datatype?at=557554b7813c577e1cf598df) Well, `append` just provides a shorter way to `extend/case`. OTOH, `pick` and `poke` provide no advantage and are still there, so I should make it consistent I guess.

WiseGenius

[08:49](#msg55755714777c17d06a14421c)Sorry `append`, I probably got you in trouble with #1221, and now I see the sense in it after all. :)

dockimbel

[08:50](#msg5575574c813c577e1cf5991d)If I want to be consistent, I should remove `pick` and `poke`, but if I want to support the broad polymorphism of Rebol actions, I should get `append` back...

[08:51](#msg5575577f777c17d06a144224)I need a coffee...:)

WiseGenius

[08:51](#msg5575578c27d2203776ccebdd):point\_up: \[June 8 2015 6:50 PM](https://gitter.im/red/red/map-datatype?at=5575574c813c577e1cf5991d)Yes, I feel the dilemma.

dockimbel

[08:54](#msg55755831813c577e1cf5993c):point\_up: \[June 8 2015 4:51 PM](https://gitter.im/red/red/map-datatype?at=5575578c27d2203776ccebdd) What is your feeling about this dilemma?

[08:55](#msg5575589f777c17d06a14424e)Just went through this interesting and funny reading about \[dilemna vs dilemma](http://www.dilemna.info). :-)

pekr

[08:59](#msg5575595b463d0c7c066e61cc)It is not a dilemma, it is a drama :-)

dockimbel

[09:11](#msg55755c38f40a067d1c9bc3ca)The problem also with `append` is all its refinements that have no effect or would be counter-intuitive on maps (like `/only` as shown in #1221). Though, `/part` could be supported if the argument is a block.

PeterWAWood

[09:24](#msg55755f33f40a067d1c9bc41b)If you've removed map! as a type handled by

```
append
```

why did you leave

```
insert
```

?

Surely, the same argument for removing or keeping them would apply?

dockimbel

[09:49](#msg5575650c27d2203776cced58):point\_up: \[June 8 2015 5:24 PM](https://gitter.im/red/red/map-datatype?at=55755f33f40a067d1c9bc41b) We'll remove it too.

WiseGenius

[10:01](#msg557567fe813c577e1cf59b2b):point\_up: \[June 8 2015 6:54 PM](https://gitter.im/red/red/map-datatype?at=55755831813c577e1cf5993c) Hunger! ;P

[10:01](#msg5575680127d2203776ccedc3)Since I haven't had much experience using `pick` and `poke`, I'm not sure I can fairly judge them. I find the help confusing. If their `series` argument types didn't include `map!`, could their `index` argument types be reduced to just `integer!`? If not, is anyone kind/patient enough to explain what they're for to a noob like me?

PeterWAWood

[10:07](#msg55756967463d0c7c066e63c8)Another consistency question,

```
find
```

supports

```
object!
```

but not

```
map!
```

. If

```
map!
```

lies between

```
object!
```

and

```
block!
```

, it would be intuitive for

```
find
```

to support

```
map!
```

.

That raises questions of how it would work. would there be an implicit

```
/skip 2
```

when the argument to

```
find
```

is a

```
map!
```

? Would it return

```
true
```

or

```
false
```

as

```
find
```

does with an

```
object!
```

parameter?

[10:09](#msg557569dd777c17d06a14449b)Now some not so well organised programmers, like me, would probably appreciate being able to use

```
find
```

to search the values of a

```
map!
```

and be returned a list of keys with that value.

dockimbel

[10:10](#msg55756a2c813c577e1cf59b76):point\_up: \[June 8 2015 6:07 PM](https://gitter.im/red/red/map-datatype?at=55756967463d0c7c066e63c8) Good point. As object!, map! is not a series!, so it has no position, nor sequence you can `/skip`. We could use `find` action for checking if a key is defined or not in the map! (so, returning a `logic!` value), that looks like a useful feature. Moreover, `find` has a `/case` refinement, so good match for map!. I will add it to the spec document.

[10:23](#msg55756d3f813c577e1cf59bcf)Hmm, actually `find` on map! needs to return `none` on failure, in order to be consistent with other datatypes. So, it falls in the "support for sake of broad polymorphism" category, as it is not very different from `select` then.

[10:38](#msg5575708c813c577e1cf59c21):point\_up: \[June 8 2015 6:01 PM](https://gitter.im/red/red/map-datatype?at=557567fe813c577e1cf59b2b) When you use `pick/poke` on some datatypes, you can pass also a word (basically, a named position) instead of an integer to specify a position, like in: `pick 1x2 'y` or `pick now 'hour`. IIRC, such extended usage was not there at the beginning, but added later for convenience. Those basic actions were extended to work on more than just series.

[10:42](#msg5575717d777c17d06a14454c)Also, the \_index_ argument to `pick/poke` can be of `logic!` type, `true` meaning the first position, `false` the second.

WiseGenius

[11:00](#msg557575cd05c872ce6ac840d9):point\_up: \[June 8 2015 8:38 PM](https://gitter.im/red/red/map-datatype?at=5575708c813c577e1cf59c21)Thanks. Looks like something to think about. In the meantime, I think removing `append` from `map!` makes sense.

[11:00](#msg557575e6813c577e1cf59c94)Should I be able to do this?

```
red>> extend #(a 1) make object! [b: 2]
*** Script error: extend does not allow object for its spec argument
*** Where: extend
```

dockimbel

[11:04](#msg557576ca463d0c7c066e64d0):point\_up: \[June 8 2015 7:00 PM](https://gitter.im/red/red/map-datatype?at=557575cd05c872ce6ac840d9) This one works:

```
red>> extend #(a 1) body-of make object! [b: 2]
== #(
    a: 1
    b: 2
)
```

[11:06](#msg5575773627d2203776ccef28)Though, I guess a more \_natural_ way to do it wouldn't hurt.

[11:08](#msg557577b1777c17d06a1445cf)Also, this might not be a very safe use-case, as the object can have words set to `none`, which would result in removing the corresponding keys in the map. If the user is not very careful, it can get unexpected results.

WiseGenius

[11:11](#msg55757847813c577e1cf59cbc)I only asked because my eyes misscanned the `spec` argument in help and I thought it listed `object!`, but it didn't after all.

[11:28](#msg55757c67813c577e1cf59d14)Good point about the `none` values. I wonder if it really would be so unexpected, though.

[11:28](#msg55757c70f40a067d1c9bc6d7)I think a bigger question is what is `extend object! map!` going to do with non-word keys, since `map!` \*\*is\** in the current `spec` argument (unless my eyes misscanned it again).

dockimbel

[11:30](#msg55757cf305c872ce6ac8415a):point\_up: \[June 8 2015 7:28 PM](https://gitter.im/red/red/map-datatype?at=55757c67813c577e1cf59d14) I am not sure we should allow it in this form, so would probably force the user to use a `body-of` and report errors if the keys are not words.

WiseGenius

[11:33](#msg55757d97463d0c7c066e653d):point\_up: \[June 8 2015 9:30 PM](https://gitter.im/red/red/map-datatype?at=55757cf305c872ce6ac8415a)Agree. `spec [block! hash!]`

[11:56](#msg557582e227d2203776ccf021)Which makes me ask: Is there still some vague plan being considered to make `hash!` more like a kind of `block!`? Shouldn't it be able to be used more like this in the meantime? For example, in `append`:  
In Rebol 2:

```
>> append [a b] make hash! [c d]
== [a b c d]
```

Currently in Red:

```
red>> append [a b] make hash! [c d]
== [a b make hash! [c d]]
```

dockimbel

[13:26](#msg557597fef40a067d1c9bca2b)`append` good point, please open a ticket for that one.

[13:27](#msg55759832813c577e1cf5a043)Yes, it is still planned to merge hash! in block! once we figure out a convenient syntax to read/write meta-data from values.

pekr

[13:32](#msg5575996a813c577e1cf5a079)Is the following code really OK?

[13:32](#msg5575997f813c577e1cf5a07d)

```
find #(a 123 b 456) 'b
== true
```

[13:34](#msg557599d9f40a067d1c9bca6c)`find`is an action value, should return series in the point of the found element, or none. We have `found?` counterpart, to return boolean value ... at least in R2 ...

WiseGenius

[13:35](#msg55759a0f813c577e1cf5a091)@pekr ... and in Rebol 3, I think.

pekr

[13:36](#msg55759a43813c577e1cf5a0a1)Well, did not want to claim that, as I have some old R3, where found? is buggy, it returns the value, instead of boolean ...

WiseGenius

[13:36](#msg55759a69f40a067d1c9bca80)Yes, I've noticed that too.

pekr

[13:37](#msg55759a9b777c17d06a1449ba)eh, no, I am just stupid, I need to chain it with 'find itself:  
&gt;&gt; found? find \[1 2 3 4 5] 3  
\== true

[13:38](#msg55759aca777c17d06a1449bf)So, in regards to above, can 'find work for us in a consistent way? I mean - returning the map at certain position, if we claim, there is no position?

WiseGenius

[13:42](#msg55759bcc05c872ce6ac844dd)Just wondering what the advantage is to chaining it like that? May as well just write `not none?` instead of `found?`, which is all the source basically seems to be, anyway.

PeterWAWood

[13:44](#msg55759c2905c872ce6ac844e3):point\_up: \[June 8 2015 9:37 PM](https://gitter.im/red/red/map-datatype?at=55759a9b777c17d06a1449ba)  
Rebol2:

```
>> o: make object! [a: 1]
>> find o 'a
== true
>>
```

Find on map! is consistent with find on object!. Neither map! nor object! are series! so they do not return a position in a series!.

pekr

[13:45](#msg55759c62813c577e1cf5a0ef)Well, never used it on objects, but as for me, it is a design nightmare

[13:46](#msg55759cc627d2203776ccf36d)but yes, then we are consistent with Rebol, so let it be that way ...

WiseGenius

[13:48](#msg55759d2b27d2203776ccf379)@pekr Just curious: Were you expecting `find #(a 123 b 456) 'b` to return an error, or something else?

pekr

[13:51](#msg55759dc505c872ce6ac84514) ... #(b 456) ... as with series ... or I can even imagine, as it is not a series, to return value, but then it would be just pick or select ...

PeterWAWood

[13:51](#msg55759df7813c577e1cf5a11c)Is this by design or accidental?

```
red>> m: make map! [a 1]
== #(
    a: 1
)
red>> n: make m [b 2]
== #(
    b: 2
)
```

If it is by design, wouldn't it be better to have similar behaviour to object!?

[13:53](#msg55759e70777c17d06a144a3f)This seems like a bug as the spec says unset! is not allowed as a map! value:

```
red>> mm: make map! reduce ['a print 1]
1
== #(
    a: unset
)
red>> mm/a
red>>
```

WiseGenius

[13:57](#msg55759f62813c577e1cf5a14f):point\_up: \[June 8 2015 11:51 PM](https://gitter.im/red/red/map-datatype?at=55759df7813c577e1cf5a11c) If by design, it might be a nice way of doing `n: extend m [b 2]` without affecting `m`?

PeterWAWood

[13:59](#msg55759fad777c17d06a144a69)

```
n: extend copy m [b 2]
```

WiseGenius

[14:03](#msg5575a0aef40a067d1c9bcb3f):point\_up: \[June 8 2015 11:59 PM](https://gitter.im/red/red/map-datatype?at=55759fad777c17d06a144a69) What is the difference between the two if `m` is an `object`?

PeterWAWood

[14:08](#msg5575a1d9463d0c7c066e69d1):point\_up: \[June 8 2015 10:03 PM](https://gitter.im/red/red/map-datatype?at=5575a0aef40a067d1c9bcb3f)  
The difference? n would be an object.

WiseGenius

[14:10](#msg5575a243777c17d06a144ad8):point\_up: \[June 9 2015 12:08 AM](https://gitter.im/red/red/map-datatype?at=5575a1d9463d0c7c066e69d1) Haha! I meant between `make` and `extend copy`. Any?

PeterWAWood

[14:12](#msg5575a2ce813c577e1cf5a1cb)I think the difference would be that if you used make you could change existing values and add new ones. With extend you can only add new values.

I thought the whole purpose of extend was to be able to add fields to an object without having to make a copy.

WiseGenius

[14:27](#msg5575a64127d2203776ccf4c6)I see, thanks. I was unsure because `extend` can currently change values on `map!` in Red, and in Rebol 3 it can change values on both `map!` and `object!` (although it's different in other ways, of course). Either way, I still think it would be nice for `make` to behave in the discussed way when a `map!` is its first argument . Just my opinion.

dockimbel

[16:08](#msg5575bdfe6642ebca1f1191a1):point\_up: \[June 8 2015 9:51 PM](https://gitter.im/red/red/map-datatype?at=55759dc505c872ce6ac84514) You are seriously confused about what is a series! and what is not... Map! like object! is not a series, therefore there is no concept of position, nor head, nor tail. Not every data structure can fit in the series! model.

pekr

[16:10](#msg5575be91777c17d06a144edd)The only thing which is serious here imo is for 'find to return a boolean value. Whoever designed it should be ashamed.

[16:11](#msg5575be9f463d0c7c066e6e04)I know about the series vs the map, that is why I corrected myself.

[16:11](#msg5575beb5463d0c7c066e6e09)In such a case, I am against 'find working both for objects and maps too. Well, but that is just me

dockimbel

[16:12](#msg5575bef18cdcaab91c3abeab):point\_up: \[June 8 2015 9:42 PM](https://gitter.im/red/red/map-datatype?at=55759bcc05c872ce6ac844dd) `found?` is just a handy way to convert the output of `find` to a logic! value.

pekr

[16:12](#msg5575bf0505c872ce6ac849c2)The problem for me is, that with the series, to know if the value "is there" and hence can be found, we use 'found? function, not find itself. That is why I think that it has weird design, but surely I can live with that, if others find it being ok ...

dockimbel

[16:13](#msg5575bf376642ebca1f1191a5):point\_up: \[June 9 2015 12:10 AM](https://gitter.im/red/red/map-datatype?at=5575be91777c17d06a144edd) It was Carl most probably. But, weren't you the one arguing for maximum polymorphism, and here you rant against it??

pekr

[16:15](#msg5575bf98777c17d06a144ef7)Yes, I was, but this one is weird ...

[16:15](#msg5575bfa3813c577e1cf5a5e5)It is in a definition of actually what should it return?

dockimbel

[16:16](#msg5575bfc76642ebca1f1191a6):point\_up: \[June 9 2015 12:12 AM](https://gitter.im/red/red/map-datatype?at=5575bf0505c872ce6ac849c2) No, the output of `find` is enough: `none` means not found, &lt;&gt; `none` means found. I personally almost never use `found?` as it is useless in most code patterns, like `if find series value [...]`.

pekr

[16:18](#msg5575c03905c872ce6ac849e6)For series, someone stated, that it returns the series at the point of found value, or the none. Then someone stated that for objects, it should return true or false, now ditto for maps. Here I would prefer find to work similar way to series - get a value, if found, or none. And if you want your boolean, found? should be used again. That is what I would consider being consistent ... but maybe I am missing something ...

WiseGenius

[16:18](#msg5575c03b463d0c7c066e6e3b)@pekr Correct me if I'm wrong, but are you saying is that `found?` should be changed to return a `logic!` value without needing to rely on `find`, and that it should work on `map!`s, `object!`s and `series!`, while `find` should only work on `series!`?

pekr

[16:19](#msg5575c07505c872ce6ac849ed)Replied in a message above ...

[16:19](#msg5575c084463d0c7c066e6e45)For objects and maps I would prefer it working like 'get then ...

[16:19](#msg5575c095777c17d06a144f11)... or none, if not found ...

dockimbel

[16:19](#msg5575c0a58cdcaab91c3abeb2):point\_up: \[June 9 2015 12:18 AM](https://gitter.im/red/red/map-datatype?at=5575c03905c872ce6ac849e6) _ Here I would prefer find to work similar way to series - get a value, if found, or none. _ That is not how `find` works on series, if found, it returns \*\*a series position\** and not a value.

[16:20](#msg5575c0dd8cdcaab91c3abeb4)`help find` will give you this in R3: \_Searches for a value; for series returns where found, else none._

[16:21](#msg5575c0fe51b208847ec36e10):point\_up: \[June 9 2015 12:18 AM](https://gitter.im/red/red/map-datatype?at=5575c03905c872ce6ac849e6) That "someone" is Carl. :-) Again, if you are against polymorphism for series action, I would not blame you. :)

pekr

[16:21](#msg5575c11827d2203776ccf89d)Yes, but you are just picky about the words. For series, it returns the series at the position, where you can use func like 'first to get the value. So you simply get the value, not some true or false

[16:21](#msg5575c11cf40a067d1c9bcfaa)what is that good for?

[16:22](#msg5575c13305c872ce6ac84a1d)I objected many times to some stuff I did not like and historically some of my submissions were accepted ;-)

dockimbel

[16:23](#msg5575c1968cdcaab91c3abeb5):point\_up: \[June 9 2015 12:19 AM](https://gitter.im/red/red/map-datatype?at=5575c07505c872ce6ac849ed) It is not a matter of personal preference, but rather what useful result could `find` provide for a non-series datatype. Duplicating `get` or another existing function is not helpful.

[16:26](#msg5575c21d51b208847ec36e16):point\_up: \[June 9 2015 12:21 AM](https://gitter.im/red/red/map-datatype?at=5575c11827d2203776ccf89d) I am, because you seems confused about the definitions and the concepts attached to them.

pekr

[16:26](#msg5575c23b777c17d06a144f46)Ok, do as you as a designer wish. I would never checked my object for the word existance, by using 'find. I even did not know, such nonsense (to return boolean) is possible. Most probably I would use code like: if get in object 'word .... maybe longer, but for me more clearly readable.

[16:27](#msg5575c285f40a067d1c9bcfcd)btw - we have some nice functions, which are not polymorphic enough ... eg. why somethin like following is not allowed?

[16:28](#msg5575c293777c17d06a144f4b)value? map/word?

[16:28](#msg5575c29c05c872ce6ac84a51)exists? ... to work on more than files?

[16:28](#msg5575c2b7777c17d06a144f50)etc ... you just today used/extended modify/extend, so why not exists? for e.g.? :-)

[16:28](#msg5575c2c8813c577e1cf5a642)just some wild ideas ...

WiseGenius

[16:30](#msg5575c325f40a067d1c9bcfdf):point\_up: \[June 9 2015 2:26 AM](https://gitter.im/red/red/map-datatype?at=5575c23b777c17d06a144f46) How would you usually have checked for the existence of something in a `series!`? In Rebol, I've gotten into a habit of simply using `find`.

pekr

[16:31](#msg5575c37b777c17d06a144f69)With series, I was used to use 'find to actually move to certain position ... and if I wanted to get a boolean, I tought myself using: if found? find .... not needed, but ...

dockimbel

[16:32](#msg5575c3a08cdcaab91c3abeb9):point\_up: \[June 9 2015 12:26 AM](https://gitter.im/red/red/map-datatype?at=5575c23b777c17d06a144f46) I understand the position of being against polymorphism for series action on non-series datatypes. I am often not far from thinking that too. Though, such extended polymorphism allows to reuse existing familiar actions for close (but often not identical) semantics, which reduces the size of the language in the end. So, it needs to be considered for what it's worth.

pekr

[16:35](#msg5575c44a813c577e1cf5a681)Well, sometimes a rebol is a bit messy, e.g. some files/ports only related funcs, which could eventually be used alsewhere. Right now, it is no big deal. Let's see how it all settles, once we introudce events, ports, tasks, etc.

[16:38](#msg5575c51305c872ce6ac84a8f)Something like: `if exists? in type value` would be nicely readable, but not sure e.g. `in`has some binding consequences, etc.

dockimbel

[16:43](#msg5575c64051b208847ec36e1e):point\_up: \[June 9 2015 12:35 AM](https://gitter.im/red/red/map-datatype?at=5575c44a813c577e1cf5a681) You wouldn't want to use file/ports functions for non-IO related stuff, for the same reason you don't want series action to be used on non-series types.

[16:45](#msg5575c6a651b208847ec36e1f)`in` returns a word (or now also a block in R3), `exists? word` does not make much sense (I would expect it to always return `true`)?

WiseGenius

[16:48](#msg5575c76005c872ce6ac84ae5)`in?`?

pekr

[16:52](#msg5575c841777c17d06a145003)why should exists? return always true for non defined words? Isn't it similar to stating, that value? word would always return true too ... but anyway - enough ... have your find returning boolean for certain types :-)

dockimbel

[17:00](#msg5575ca318cdcaab91c3abecc):point\_up: \[June 9 2015 12:52 AM](https://gitter.im/red/red/map-datatype?at=5575c841777c17d06a145003) You need to correlate the meaning of the function's name with what it does. A word always "exists" (because you create it to pass it as argument), but a word can reference a value or not.

[17:00](#msg5575ca3e8cdcaab91c3abecd)1am here, sleep time, night to all. :)

earl

[21:41](#msg55760c01813c577e1cf5af3b)@pekr FIND for values where position is not a meaningful concept is slightly tricky.

[21:42](#msg55760c5305c872ce6ac8535b)R3 currently allows FIND on series, but also on gob!, port!, bitset!, typeset!, object! and none!. (Note: no map!, at the moment.)

[21:43](#msg55760c6f463d0c7c066e7798)For port!s, it's up to the scheme author to defined FIND's specific behaviour.

[21:43](#msg55760c96777c17d06a14586c)For gob!s, FIND is a special "does this gob! contain the given gob! as a child" function.

[21:44](#msg55760cc3463d0c7c066e77a2)For bitset, typeset and object, we have this conundrum of those types not heaving a meaningful "position" FIND could return, in analogy to FIND on series.

[21:44](#msg55760ccd813c577e1cf5af57)Now basically, what we are left with then, is a few options:

[21:45](#msg55760ce0777c17d06a145873)- Disallow FIND on those types altogether.

[21:46](#msg55760d2305c872ce6ac85377)- Have FIND return the searched-for value if found, and none! otherwise. This effectively makes FIND identical to SELECT on these types, where SELECT is already allowed.

[21:47](#msg55760d68813c577e1cf5af68)- Have FIND return TRUE or FALSE

[21:49](#msg55760ddb05c872ce6ac8538a)For series, we currently have only two functions: FIND returns a position, SELECT returns a value. We \_don't_ have a third true/false-returning function.

PeterWAWood

[21:51](#msg55760e50777c17d06a14589b)A small point but isn't SELECT equivalent to FIRST NEXT FIND rather than FIRST FIND?

earl

[21:51](#msg55760e7d463d0c7c066e77e0)Yes. (Assuming none-transparent FIRST and NEXT ...)

[21:53](#msg55760ed2777c17d06a1458ab)So basically, we have the problem: we have a type where "searching" really makes sense, but the only really sensible result is a yes/no answer. Do you bolt that yes/no onto SELECT or do you re-purpose FIND?

[21:55](#msg55760f36813c577e1cf5afa0)And then you have another extra problem: no meaningful position, but both a meaningful need to answer "contains?" \_and_ "lookup" questions. That's the case for object! and map!. For object!, those really are two \_separate_ questions, because if you just use SELECT with a value or none answer, you can no longer discern between "key is present and associated with none!" and "key is not present".

[21:56](#msg55760fa2777c17d06a1458c9)I think that is what motivated using logic!-returning FIND for contains and value-returning SELECT for lookup.

[22:01](#msg557610b8463d0c7c066e782c)Another alternative would be to add a third lookup function to the mix, which I have seen being discussed (albeit on a rather low flame) many a time. Typical favourites for such a (two-argument) function are "CONTAINS", "IN", "HAS" (with or without a "?" suffix); IN and HAS are of course already in use in current Red/Rebol.

## Tuesday 9th June, 2015

greggirwin

[00:01](#msg55762ccff40a067d1c9bdb21)I was going to sketch out concrete examples for comparison purposes, but my day got busy.  
It will never be perfect and purist. We can probably all agree on that at the very least. If so, what is the most useful behavior most of the time, that still keeps the worst mistakes from slipping through? Or, what is the easiest behavior to explain and justify? It doesn't mean the behavior has to be exactly the same for all datatypes, just that each datatype should return a result that makes sense \*for that type\*. And we may have to accept that naive polymorphic funcs will do stupid things at times.

[00:05](#msg55762dc605c872ce6ac855ab)That said, let's pick a definition of the word itself: "Discover (something) to be present." works well for me. When you find something, you could say "I found it!" (logic! result). You could say "Here it is." (value result). Or you could say "I found it &lt;here&gt;" (location result).

Or you could say "I didn't find it."

[00:07](#msg55762e56463d0c7c066e7a1b)A location or value implies finding it, so we can infer a logical result from those, and they give us more information to boot. If we say that's better, then we should always return either a value or location if we can. Going one step further, if we know the location, we can find the value, but not vice versa. So we should return the location if we can.

WiseGenius

[00:09](#msg55762eb4463d0c7c066e7a1e)Personally, I don't find the current polymorphism of `find` to be that inconsistent. I even think it demonstrates the eloquence of Rebol. What's the worst case scenario of confusion it could cause?

greggirwin

[00:11](#msg55762f47463d0c7c066e7a26)If you're still with me, and agree, then we just have to decide if we can return a meaningful location for unordered datatypes. Sure you can, assuming we're talking about keys in objects or maps. The location is the key itself, perhaps bound to the context in the objects case.  
(I agree @WiseGenius)  
If we wanted to, we could also return the offset of the key in the WORDS-OF result for the target, but that's not terribly useful if the order is undefined.

[00:13](#msg55762fb527d2203776cd0416)The other thing I'm not sure of, just so I don't forget to mention it, is the value in setting a key to NONE to remove them from maps. Why not just use REMOVE if you want to force it?

WiseGenius

[00:14](#msg55762ff7813c577e1cf5b197)Yes, I would stay away from the `word-of` result, as `map!` is not positional. `words-of` is always available to the user if that's what they want (unless its name is changed to `keys-of`, haha).

earl

[00:14](#msg55762ff927d2203776cd041c)Hm. How would you REMOVE a key if you can't have a series reference and REMOVE is unary (as it is today)?

greggirwin

[00:16](#msg55763042463d0c7c066e7a33)Great point @earl . Dang it. Need a refinement or special func.

[00:16](#msg5576304c463d0c7c066e7a36)That's what I get for writing on the fly.

earl

[00:17](#msg5576308105c872ce6ac855c9)What \_would_ be possible, is to extend REMOVE to work on paths. (Or similarly: extend UNSET to work on map! paths.)

[00:17](#msg55763097f40a067d1c9bdb4d)However, you'd also have to add a `/case` refinement to whatever you choose.

[00:18](#msg557630e305c872ce6ac855ce)I also thought a bit about returning a position inside the BODY-OF spec block. However, that'd come with its own big can of worms. If you want to then enable series mutators on this block, you'd need a special block type to associate the spec block back to the `map!` value. Ugly.

greggirwin

[00:19](#msg5576310905c872ce6ac855d0)Yeah. That darn "With great power..." thing.

earl

[00:20](#msg55763156813c577e1cf5b1b1)Otherwise, if we had a more general facility to do such bidirectional "views", the idea of having a 1:1 mapping between a `map!` and its "backing" spec `block!`, with the possibility to mutate the backing spec, has its charms.

greggirwin

[00:20](#msg5576315af40a067d1c9bdb53)The result of REMOVE would also just have to be the target.

PeterWAWood

[00:23](#msg5576321a463d0c7c066e7a52)Is there any guarantee that BODY-OF will be consistent in the order of its contents?

WiseGenius

[00:55](#msg5576396e27d2203776cd048e)What if we assume we're searching the \*\*values\** of the `map!` and then `find` returns the key?

pekr

[01:01](#msg55763af7777c17d06a145b34)Well, so my rant produced lots of thoughts actually :-)

[01:10](#msg55763d00463d0c7c066e7aed)What I would prefer would be find on objects/maps returning the value, hence being mostly equivalent to select, but not sure what would happen, if the value would be none?

WiseGenius

[01:14](#msg55763de427d2203776cd04cb):point\_up: \[June 9 2015 11:10 AM](https://gitter.im/red/red/map-datatype?at=55763d00463d0c7c066e7aed) I don't think that makes sense. It's not consistent with what `find` does on a `series!`.

pekr

[01:17](#msg55763e9a05c872ce6ac85673)I can actually find it much more consistent. You get the position, you can almost say you can access the value: `second find [a 1 b 2 c 3] 'b`

[01:18](#msg55763eca05c872ce6ac85676)The advantage is, that if not found, none is returned, so it can be used also directly with the `if`

WiseGenius

[01:19](#msg55763f2805c872ce6ac8567b)How is that an advantage, since all the other suggestions do that too?

[01:21](#msg55763f8305c872ce6ac8567f)You needed to add `second` to get a similar result. It's not the same function.

[01:21](#msg55763f96777c17d06a145b70)At least if you use `find` on values, to get keys, you can think of a `map!` as an associative array who's index is a key, and `series!` as an array (though it isn't really) who's index is a number.

[01:21](#msg55763fa7813c577e1cf5b262)Oh, wait... that's not what it returns from a `series!`. My mistake.

pekr

[01:21](#msg55763fb005c872ce6ac85681)But you CAN get to the value that way, and it is the point!

[01:22](#msg55763fd9f40a067d1c9bdbfb)OK, if you really want to be consistent, then discard find on series returning the position, and just return true or false, and discard the found? func, as it is not going to be needed then ...

[01:23](#msg5576401905c872ce6ac85687)But voila, then you miss the func, which would return you the found value, which in the case of the series was decided to be the position of found value, to allow other operation at given index ...

[01:23](#msg55764020777c17d06a145b78)And that was my point ...

WiseGenius

[01:24](#msg5576406b777c17d06a145b7c)The `found?` function is already not needed.

[01:27](#msg557640fa463d0c7c066e7b31)Since `find` returns the value or `none` when working on a `series!`, it can be used in `if` in exactly the same way as it's used when working on a `map!` or `object!` and only returning a `logic!`.

pekr

[01:29](#msg5576415e05c872ce6ac85698)But how would you get yourself to the certains series position/index then? Because select returns the value.

[01:32](#msg5576422605c872ce6ac856a9)ok, will try to continue my sleep, 3:30 am here :-)

WiseGenius

[01:32](#msg5576423ef40a067d1c9bdc13)OK, goodnight. :)

dockimbel

[02:21](#msg55764dc66642ebca1f1192e4):point\_up: \[June 9 2015 8:20 AM](https://gitter.im/red/red/map-datatype?at=55763156813c577e1cf5b1b1) That's an interesting idea, but remember that in Red, we also have the hash! datatype for providing a series-oriented hashtable that can easily simulate an associative array (using `/skip`).

[02:26](#msg55764ee96642ebca1f1192e5)@earl For \*\*remove\** on path!, path! being already a series, I don't see how you could you change the semantics to make it usable for maps: `remove 'a/b/c == 'b/c`. Maybe with an additional refinement?

PeterWAWood

[02:29](#msg55764fa6f40a067d1c9bdcd3):point\_up: \[June 8 2015 9:51 PM](https://gitter.im/red/red/map-datatype?at=55759df7813c577e1cf5a11c) @dockimbel As it has been quite busy on here and you didn't reply to the questions, I wanted to check that you had seen this post.

WiseGenius

[03:30](#msg55765de027d2203776cd0673)@dockimbel Would it be too much if `keys-of` were to have a refinement that causes it to take a `value` argument which returns a `block!` of only those keys which have that value?

[03:47](#msg557661e0777c17d06a145d69)I don't know what you would call the refinement? `/value`? `/only`?

[03:48](#msg55766206463d0c7c066e7d18)Used like this:

```
red>> favourite-colours: #({John} {Blue} {Jane} {Green} {Peter} {Blue})
== #(
    "John" "Blue"
    "Jane" "Green"
    "Peter" "Blue"
)
red>> favourite-colour-of-john: favourite-colours/({John})
== "Blue"
red>> people: keys-of favourite-colours
== ["John" "Jane" "Peter"]
red>> those-whoes-favourite-colour-is-blue: keys-of/only favourite-colours {Blue}
== ["John" "Peter"]
```

[04:07](#msg5576667c813c577e1cf5b45e):point\_up: \[June 9 2015 12:29 PM](https://gitter.im/red/red/map-datatype?at=55764fa6f40a067d1c9bdcd3) Sorry we cluttered up the room on `find`. Maybe we should open tickets?

dockimbel

[06:28](#msg5576878a463d0c7c066e7f63):point\_up: \[June 9 2015 11:30 AM](https://gitter.im/red/red/map-datatype?at=55765de027d2203776cd0673) Interesting feature, basically a reverse-lookup on the map values. The performances wouldn't be great though as only keys are hashed. You could achieve it using a hash! value more efficiently, as everything is hashed there. This needs more thoughts.

[06:30](#msg5576881c777c17d06a145f92):point\_up: \[June 9 2015 12:07 PM](https://gitter.im/red/red/map-datatype?at=5576667c813c577e1cf5b45e) FIND discussions could be moved to red/red channel, use tickets only for proposing some wishes that have been discussed here before, that would be easier to handle for us.

[06:32](#msg5576887505c872ce6ac85aab):point\_up: \[June 9 2015 11:47 AM](https://gitter.im/red/red/map-datatype?at=557661e0777c17d06a145d69) BTW, colors are first class values in Red now:

```
red>> blue
== 0.0.255
red>> green
== 0.255.0
red>> blue or green
== 0.255.255
```

;-)

asampal

[06:39](#msg55768a04f40a067d1c9be00a)@dockimbel, wrt colors - should there not be an alpha component? Also, 10 bit/channel colors are pretty common these days - any thoughts on that?

[06:47](#msg55768c1b27d2203776cd092e)I guess that question is more suited for the red/red room

dockimbel

[07:02](#msg55768f86777c17d06a146006):point\_up: \[June 9 2015 2:47 PM](https://gitter.im/red/red/map-datatype?at=55768c1b27d2203776cd092e) Yes thanks. ;-)

WiseGenius

[07:05](#msg55769054777c17d06a146018):point\_up: \[June 9 2015 4:28 PM](https://gitter.im/red/red/map-datatype?at=5576878a463d0c7c066e7f63) @dockimbel, My comment on tickets was a suggestion to @PeterWAWood to open some for the \[two possible bugs](https://gitter.im/red/red/map-datatype?at=55759df7813c577e1cf5a11c) he was trying to get your attention about.

dockimbel

[07:09](#msg55769143777c17d06a146029):point\_up: \[June 9 2015 3:05 PM](https://gitter.im/red/red/map-datatype?at=55769054777c17d06a146018) Thanks for the reminder.

[07:22](#msg55769422813c577e1cf5b741):point\_up: \[June 8 2015 9:51 PM](https://gitter.im/red/red/map-datatype?at=55759df7813c577e1cf5a11c) That is not specific to map!, it is a feature of MAKE where `type` argument can be an "example" value instead of a datatype.

```
red>> probe make 123 99
99
== 99
red>> probe make "hello" 10
""
== ""
```

For the `unset!` point, the spec is wrong. :-)

[07:23](#msg5576948727d2203776cd09e6)In case of objects, we have inheritance, I am not sure if we want to overload map! with such concept. You can already use `extend` to combine two maps into a new one.

PeterWAWood

[11:09](#msg5576c95b05c872ce6ac8610b)I can see use in having inheritance for map! as it gives the ability for a programmer to both change existing values and add additional key:values in a single function.

I really can't see much point in allowing "example" values as arguments to MAKE other than code obfuscation. ;-)

dockimbel

[12:17](#msg5576d93d05c872ce6ac86340):point\_up: \[June 9 2015 7:09 PM](https://gitter.im/red/red/map-datatype?at=5576c95b05c872ce6ac8610b) `extend` does that already.

WiseGenius

[12:23](#msg5576dabc05c872ce6ac8637e):point\_up: \[June 9 2015 10:17 PM](https://gitter.im/red/red/map-datatype?at=5576d93d05c872ce6ac86340) @dockimbel Perhaps I misunderstood you, but I thought you were planning to remove `map!` from the `spec` argument of `extend` because extending an `object!` with a `map!` would have to check if it contained non-`word!` keys?

[12:32](#msg5576dccb777c17d06a1468be)If `map!` is included for `spec`, then I personally think `object!` should be included as well.

[12:41](#msg5576dee205c872ce6ac8640a)I personally think `map!`'s `make` should have inheritance, because it could otherwise be a source of confusion since `map!` and `object!` are so similar, and since `map!` can.

dockimbel

[12:59](#msg5576e34348dc5ddc51eddfe3):point\_up: \[June 9 2015 8:23 PM](https://gitter.im/red/red/map-datatype?at=5576dabc05c872ce6ac8637e) Actually, I should remove `object!` from the `spec` argument, as it is a feature the Red compiler won't support before a while.

[13:04](#msg5576e467716168927d9949eb):point\_up: \[June 9 2015 8:41 PM](https://gitter.im/red/red/map-datatype?at=5576dee205c872ce6ac8640a) Does this look like an object to you?

```
#("hello" 34 1.2 10 /only 15)
```

Map! is similar to object! on the suface, if you use only words for keys and path accesses. Map! in Red are very different from objects, much more than in Rebol3 where you can run code in a map as if it was an object (you can't in Red). Objects are namespaces, maps are not (but can look like they are in some use-cases).

WiseGenius

[13:07](#msg5576e51e777c17d06a146a2c):point\_up: \[June 9 2015 10:59 PM](https://gitter.im/red/red/map-datatype?at=5576e34348dc5ddc51eddfe3) :confused: I thought `object!` was already not in the `spec` argument?

dockimbel

[13:09](#msg5576e575716168927d9949f0):point\_up: \[June 9 2015 9:07 PM](https://gitter.im/red/red/map-datatype?at=5576e51e777c17d06a146a2c) Sorry, I meant `obj` argument.

PeterWAWood

[13:12](#msg5576e63d813c577e1cf5c0fe)When checking out that EXTEND does allow you to replace an existing value, I find that it does sometimes and sometimes it doesn't.

WiseGenius

[13:13](#msg5576e68205c872ce6ac86526):point\_up: \[June 9 2015 11:09 PM](https://gitter.im/red/red/map-datatype?at=5576e575716168927d9949f0) Oh OK. Why not leave it there? When using it, I just get:

```
*** Internal error: reserved for future use (or not yet implemented)
*** Where: extend
red>> ? extend
```

...which I found to be self-explanatory.

PeterWAWood

[13:14](#msg5576e6cd777c17d06a146a65)It seems that there is a bug related to words-of (or possibly values-of) that is stopping EXTEND working properly:

```
red>> m: make map! [a 1 b 2]
== #(
    a: 1
    b: 2
)
red>> words-of m
== [a b]
red>> values-of m
== [1 2]
red>> extend m [a 6 c 7]
== #(
    a 1
    b 2
    a: 6
    c: 7
)
```

WiseGenius

[13:22](#msg5576e886f40a067d1c9beaf7) :point\_up: \[June 9 2015 11:14 PM](https://gitter.im/red/red/map-datatype?at=5576e6cd777c17d06a146a65) It seems to be `words-of` and `keys-of`.

PeterWAWood

[13:23](#msg5576e8e9813c577e1cf5c183)I can confirm the issue is only related to WORDS-OF

dockimbel

[13:24](#msg5576e913716168927d994a00):point\_up: \[June 9 2015 9:13 PM](https://gitter.im/red/red/map-datatype?at=5576e68205c872ce6ac86526) Good, we took care of it already. :)

[13:26](#msg5576e97a716168927d994a01):point\_up: \[June 9 2015 9:14 PM](https://gitter.im/red/red/map-datatype?at=5576e6cd777c17d06a146a65) It looks like `words-of`is corrupting the internal map buffer.

PeterWAWood

[13:27](#msg5576e9c405c872ce6ac865c6):point\_up: \[June 9 2015 9:24 PM](https://gitter.im/red/red/map-datatype?at=5576e913716168927d994a00) Let me know if you need me to raise a Github issue.

dockimbel

[13:28](#msg5576ea1248dc5ddc51eddffc):point\_up: \[June 9 2015 9:27 PM](https://gitter.im/red/red/map-datatype?at=5576e9c405c872ce6ac865c6) No need, I'm fixing it right now.

[13:31](#msg5576eaa9716168927d994a0f)Issue fixed.

PeterWAWood

[13:31](#msg5576eab4777c17d06a146b13):-)

WiseGenius

[13:32](#msg5576eaddf40a067d1c9beb5e):clap:

dockimbel

[13:33](#msg5576eb2f48dc5ddc51eddffd)I was lucky, that one was easy. ;-)

WiseGenius

[13:34](#msg5576eb5c05c872ce6ac86606)@dockimbel What do you mean by “in Rebol3 where you can run code in a map”?

dockimbel

[13:44](#msg5576edb92be5032351459fa4):point\_up: \[June 9 2015 9:34 PM](https://gitter.im/red/red/map-datatype?at=5576eb5c05c872ce6ac86606) If you store functions in the map, you can run them the same way you do in objects.

WiseGenius

[13:45](#msg5576ee14813c577e1cf5c24c)Do you mean like this?

```
red>> f: does [print "hi"]
== func [][print "hi"]
red>> m: make map! reduce [1 2 3 :f]
== #(
    1 2
    3 func [][print "hi"]
)
red>> m/3
hi
```

dockimbel

[13:46](#msg5576ee4348dc5ddc51ede000)More like this (so it looks more like an object):

```
>> m: make map! compose [foo: (does [print "hello"])]
== make map! [
    foo: make function! [[][print "hello"]]
]
>> m/foo
hello
```

PeterWAWood

[13:48](#msg5576eebb27d2203776cd1505)Oh, you mean like this:

```
red>> m: make map! compose [a (does [print 1])]
== #(
    a: func [][print 1]
)
red>> m/a
1
```

WiseGenius

[13:48](#msg5576eebb05c872ce6ac866ab)Still seems to work in Red?

```
red>> m: make map! compose [foo: (does [print "hello"])]
== #(
    foo: func [][print "hello"]
)
red>> m/foo
hello
```

dockimbel

[13:49](#msg5576eece2be5032351459fa6):point\_up: \[June 9 2015 9:48 PM](https://gitter.im/red/red/map-datatype?at=5576eebb05c872ce6ac866ab) Damn! :worried: That will be a problem for the compiler.

PeterWAWood

[13:49](#msg5576eee7463d0c7c066e8b69)Seems a neat feature to me ;-)

WiseGenius

[13:49](#msg5576ef02813c577e1cf5c27b):point\_up: \[June 9 2015 11:49 PM](https://gitter.im/red/red/map-datatype?at=5576eee7463d0c7c066e8b69) Me too.

PeterWAWood

[13:51](#msg5576ef7d463d0c7c066e8b80)Seems to work okay when compiled:  
Source

```
Red[]

m: make map! compose [a (does [print 1])]
m/a
```

Output

```
rebol -qs red.r ../../Code/Red/test.red


-=== Red Compiler 0.5.3 ===- 

Compiling /Users/peter/VMShare/Code/Red/test.red ...
...compilation time : 316 ms

Compiling to native code...
...compilation time : 12108 ms
...linking time     : 91 ms
...output file size : 434176 bytes
...output file      : /Users/peter/VMShare/Languages/Red/test 


./test
1
```

dockimbel

[13:52](#msg5576ef9348dc5ddc51ede009):point\_up: \[June 9 2015 9:51 PM](https://gitter.im/red/red/map-datatype?at=5576ef7d463d0c7c066e8b80) It won't work in all use-cases.

PeterWAWood

[13:52](#msg5576efb1f40a067d1c9bec1d)I know that is a trivial example so is a long way from proof.

[14:00](#msg5576f191f40a067d1c9bec62)It doesn't work in this case. The code compiles but fails to run:

```
Red[]
i: 1
m: make map! compose [a (
	func [j /local k][
		k: i + j 
		print k
		k
	]
)]
print m/a 9
```

Output

```
./test

*** Script error: k has no value
*** Where: a
*** Stack: print a
```

[14:03](#msg5576f23e463d0c7c066e8bd7)Do you think it might possible for compiler to handle functions in map! values?

[14:07](#msg5576f337f40a067d1c9bec92):point\_up: \[June 9 2015 10:00 PM](https://gitter.im/red/red/map-datatype?at=5576f191f40a067d1c9bec62) I've updated the code as there was an error in the function call - I forgot the argument to the function.

[14:09](#msg5576f384777c17d06a146c55)The code runs correctly in the console.

dockimbel

[14:17](#msg5576f58a2be5032351459fb4):point\_up: \[June 9 2015 10:00 PM](https://gitter.im/red/red/map-datatype?at=5576f191f40a067d1c9bec62) Maybe that case could be fixed, but many others cannot. Same issue with functions from objects, though, for objects, there are workarounds.

PeterWAWood

[14:25](#msg5576f75d777c17d06a146cef)So anybody wanting to use functions in map! values would need to wrap anything to do with the map in a do \[] to get it processed by the interpreter.

[14:30](#msg5576f87d463d0c7c066e8cac)The reason that I'm asking about this is that your intention for functions to be first class values (in the first Red presentation, if I remember correctly).

Though disallowing function! values in maps doesn't stop them being such.

earl

[14:31](#msg5576f8bc813c577e1cf5c3df)I don't think disallowing function! values in maps is necessary. It's just a question of what you do with a path that ultimately turns out to point to a function inside a map.

dockimbel

[14:31](#msg5576f8d02be5032351459fc2):point\_up: \[June 9 2015 10:25 PM](https://gitter.im/red/red/map-datatype?at=5576f75d777c17d06a146cef) Right now, yes.

WiseGenius

[14:31](#msg5576f8d2f40a067d1c9bed7a)Oh please don't disallow them!

dockimbel

[14:32](#msg5576f906716168927d994a2f):point\_up: \[June 9 2015 10:31 PM](https://gitter.im/red/red/map-datatype?at=5576f8d2f40a067d1c9bed7a) Can you think of any usage scenario where maps would be a better container than objects for functions?

earl

[14:32](#msg5576f91705c872ce6ac86826)Yes.

WiseGenius

[14:36](#msg5576f9e527d2203776cd16bc):point\_up: \[June 10 2015 12:32 AM](https://gitter.im/red/red/map-datatype?at=5576f906716168927d994a2f) When I want to assign a function to a non-word key, and also if I want to have 2 functions whoes names are only differentiated by case.

[14:41](#msg5576fb2b463d0c7c066e8d27)@dockimbel What sort of use-cases did you mean in, “\[Objects are namespaces, maps are not (but can look like they are in some use-cases)](https://gitter.im/red/red/map-datatype?at=5576e34348dc5ddc51eddfe3)”?

dockimbel

[15:05](#msg557700b91078ea240e7aa122):point\_up: \[June 9 2015 10:41 PM](https://gitter.im/red/red/map-datatype?at=5576fb2b463d0c7c066e8d27) I meant when you use word keys, you can make a map look like an object, so people would tend to think that it should have the same semantics then as it looks the same.

WiseGenius

[15:13](#msg55770295f40a067d1c9bef96)Oh, that's all. I don't know whether or not this code accurately demonstrates the namespace difference?

```
>> o: make object! [a: "hi" b: func [][print a]]
== make object! [
    a: "hi"
    b: make function! [[][print a]]
]

>> m: make map! [a: "hi" b: #[function! [[][print a]]]]
== make map! [
    a: "hi"
    b: make function! [[][print a]]
]

>> o/b
hi
>> m/b
** Script error: a has no value
** Where: b
** Near: m/b
```

[15:14](#msg557702e3463d0c7c066e8ecd)IMO, Rebol's objects are far superior to JavaScript's in this way.

dockimbel

[15:19](#msg557703ff1078ea240e7aa140):point\_up: \[June 9 2015 11:13 PM](https://gitter.im/red/red/map-datatype?at=55770295f40a067d1c9bef96) Yes, that's a good demonstration.

pekr

[15:46](#msg55770a4405c872ce6ac86bb8)That's a good demonstration, but above example is imo no real reason to avoid such functionality? maps are simply not namespaces, so in above example 'a is not known. But if 'a would be defined in global context for e.g.? The code would work. Why trying to fix what could be regarded being a normal valid Red/Rebol code? It even does not seem confusing to me. But - if there is a problem with more complicated stuff, or some inconsistencies would arise along the further Red's implementation, then we better avoid that ...

dockimbel

[16:10](#msg5577100051d442124f70a426):point\_up: \[June 9 2015 11:46 PM](https://gitter.im/red/red/map-datatype?at=55770a4405c872ce6ac86bb8) Because "what could be regarded being a normal valid Red/Rebol code" is exactly the kind of confusion I wanted to avoid. Here is a less "normal"-looking example:

```
>> m: make map! [#"^/" #[function! [[][print "hi!"]]]]
== make map! [
    #"^/" make function! [[][print "hi!"]]
]
>> m/#"^/"
hi!
```

I am not against it, I just say it is a complex code pattern for the Red static compiler to solve in the general case (while being trivial for the interpreter).

greggirwin

[16:41](#msg55771723f40a067d1c9bf36a):point\_up: \[June 9 2015 8:32 AM](https://gitter.im/red/red/map-datatype?at=5576f906716168927d994a2f) Ren, where we only have maps?

[16:48](#msg557718e6777c17d06a147380)Something that would be nice is a short doc comparing the different data structure types. It can be confusing, where things are similar but have important differences. Same issue for certain words. e.g. AJOIN in R3 vs JOIN, or APPEND vs EXTEND. We love all our datatypes, until they lead to confusing or inconsistent behavior. I only rarely use tag! in R2 because of this.

[17:41](#msg5577254505c872ce6ac87039)I should note that even the single sentence in the map! wiki page that says "Conceptually, map! datatype sits in between hash! and object! datatypes." is great in telling us where things lie relative to each other.

[17:48](#msg557726f6f40a067d1c9bf5b9)The map wiki page talks about a MODIFY func. How is MODIFY different than CHANGE?

[17:49](#msg55772725777c17d06a14757d)Different arity compared to series based CHANGE I'm guessing?

earl

[17:55](#msg5577288ef40a067d1c9bf5de)Yep, MODIFY has arity 3, while CHANGE has arity 2.

greggirwin

[18:54](#msg55773674777c17d06a14773e)Thanks for confirming @earl.

## Wednesday 10th June, 2015

PeterWAWood

[00:03](#msg55777ebb813c577e1cf5d660)Is this a bug?

```
red>> m: #(a: 1 b: 2)
== #(
    a: 1
    b: 2
)
red>> extend m [c: none]
== #(
    a: 1
    b: 2
    c: none
)
red>> extend m [a: none]
== #(
    a: none
    b: 2
    c: none
)
```

WiseGenius

[01:02](#msg55778c95777c17d06a1480b4) :point\_up: \[June 10 2015 10:03 AM](https://gitter.im/red/red/map-datatype?at=55777ebb813c577e1cf5d660)

```
red>> type? m/a
== word!
```

[01:11](#msg55778ed3777c17d06a1480e8)Rebol 3's `append` works the same way:

```
>> m: make map! [a: 1 b: 2]
== make map! [
    a: 1
    b: 2
]

>> append m [c: none]
== make map! [
    a: 1
    b: 2
    c: none
]

>> append m [a: none]
== make map! [
    a: none
    b: 2
    c: none
]
```

[01:12](#msg55778ef1f40a067d1c9c014d)So does `make` in both:

```
>> m: make map! [a: none b: 2 c: none]
== make map! [
    a: none
    b: 2
    c: none
]
```

```
red>> m: make map! [a: none b: 2 c: none]
== #(
    a: none
    b: 2
    c: none
)
```

[01:13](#msg55778f51f40a067d1c9c0152)Even the literal:

```
red>> m: #(a: none b: 2 c: none)
== #(
    a: none
    b: 2
    c: none
)
```

dockimbel

[02:08](#msg55779c3534e2ebcb07f3e2ee):point\_up: \[June 10 2015 12:41 AM](https://gitter.im/red/red/map-datatype?at=55771723f40a067d1c9bf36a) You want to have functions in Ren?

PeterWAWood

[02:20](#msg55779eda463d0c7c066ea168)There seems to be a bug when using COPY with MAP! in the latest master:

```
red>> m: make map! [a: 1 b: 2]
== #(
    a: 1
    b: 2
)
red>> n: copy m

*** Runtime Error 1: access violation
*** at: 0002C3E2h
```

When I tried in the compiler, the code ran. After I added

```
probe n
```

the compiled code crashed with an access violation.

[02:24](#msg55779fe005c872ce6ac87ce1)I think that some map! tests would be very useful at this point. I'll make a start on them but don't have enough time at the moment to get a basic set of tests finished quickly.

Still "every little helps" :-)

dockimbel

[02:25](#msg5577a00334e2ebcb07f3e2ef):point\_up: \[June 10 2015 8:03 AM](https://gitter.im/red/red/map-datatype?at=55777ebb813c577e1cf5d660) No, it is not a bug, see the note in this \[section](https://github.com/red/red/wiki/Map!-datatype#deleting-keys) from the map spec.

[02:27](#msg5577a09da501647d705f304b):point\_up: \[June 10 2015 10:20 AM](https://gitter.im/red/red/map-datatype?at=55779eda463d0c7c066ea168) @qtxie Crash confirmed. That one is for you. ;)

PeterWAWood

[02:27](#msg5577a0aff40a067d1c9c0217):point\_up: \[June 10 2015 10:25 AM](https://gitter.im/red/red/map-datatype?at=5577a00334e2ebcb07f3e2ef) Thanks for the clarification.

[02:32](#msg5577a1c305c872ce6ac87cf8)There is what looks like an inconsistency between MOLD (and WORDS-OF) and FIND. After "deleting" a key/value combination by setting the value to none, the key doesn't show in MOLD's output but FIND still returns true:

```
red>> m: make map! [a: none b: 1 c: 3]
== #(
    a: none
    b: 1
    c: 3
)
red>> m/b: none
== none
red>> find m 'a
== true
red>> find m 'b
== true
red>> find m 'd
== none
red>> m
== #(
    a: none
    c: 3
)
red>> words-of m
== [a c]
```

dockimbel

[02:35](#msg5577a254a501647d705f304e):point\_up: \[June 10 2015 10:27 AM](https://gitter.im/red/red/map-datatype?at=5577a0aff40a067d1c9c0217) Good catch, another bug to fix for @qtxie .

qtxie

[02:35](#msg5577a27205c872ce6ac87cfe):point\_up: \[June 10 2015 10:25 AM](https://gitter.im/red/red/map-datatype?at=5577a00334e2ebcb07f3e2ef) ;-)

dockimbel

[02:37](#msg5577a2cd34e2ebcb07f3e2f0)BTW, I am considering replacing MODIFY by another word, as it is very valuable for meta-data access throughout all datatypes. Andreas suggested PUT (a new word), that I think would work great for maps (and could be reused for other types as well in the future).

WiseGenius

[02:39](#msg5577a35305c872ce6ac87d08):point\_up: \[June 10 2015 12:37 PM](https://gitter.im/red/red/map-datatype?at=5577a2cd34e2ebcb07f3e2f0) :thumbsup:

dockimbel

[02:39](#msg5577a37a34e2ebcb07f3e2f1)@qtxie Another change we need to do is to COPY any-string! keys by default, that should be the safer default (we can also add later a metadata flag for disabling copying to optimize resources usage).

[02:41](#msg5577a3f0a501647d705f3051)This is Andreas' show-case for wrong map behavior if you mutate a key:

```
red>> v: copy [] repeat i 64 [append v k: append copy "key" i append v i]
== ["key1" 1 "key2" 2 "key3" 3 "key4" 4 "key5" 5 "key6" 6 "key7" 7 "k...
red>> m: make map! v
== #(
    "key1" 1
    "key2" 2
    "key3" 3
    "key4" 4
    "key5" ...
red>> k
== "key64"
red>> select m k
== 64  ;; good
red>> append k "foobar"
== "key64foobar"
red>> select m k
== none  ;; BAD!
red>> select m "key64"
== none  ;; BAD!
```

qtxie

[02:50](#msg5577a608f40a067d1c9c0242)It has the same problem in hash! datatype.

```
>>  v: copy [] repeat i 64 [append v k: append copy "key" i append v i]
== ["key1" 1 "key2" 2 "key3" 3 "key4" 4 "key5" 5 "key6" 6 "key7" 7 "key8" 8 "key9" 9 "key10" 10 "key11" 11 "k
ey12" 12 "key13" 13 "k...
>> h: make hash! v
== make hash! ["key1" 1 "key2" 2 "key3" 3 "key4" 4 "key5" 5 "key6" 6 "key7" 7 "key8" 8 "key9" 9 "key10" 10 "k
ey11" 11 "key12" 12 "k...
>> select h k
== 64
>> append k "foobar"
== "key64foobar"
>> select h k
== none
>> select h "key64"
== none
```

dockimbel

[03:02](#msg5577a8b6a501647d705f3054):point\_up: \[June 10 2015 10:50 AM](https://gitter.im/red/red/map-datatype?at=5577a608f40a067d1c9c0242) We will allow the UPDATE action to be used on hash! and map! to rehash them on demand (for users who need to mutate the keys)

[03:04](#msg5577a928c134667e767637eb)For now, we can just make map! a little safer.

greggirwin

[03:17](#msg5577ac6305c872ce6ac87d6b):point\_up: \[June 9 2015 8:08 PM](https://gitter.im/red/red/map-datatype?at=55779c3534e2ebcb07f3e2ee) Sorry I wasn't clear. I meant that in Ren we don't have an object type, only map. And we don't have a plan for what they would look like (e.g. a nested map or list) so Red/R3 could LOAD them.

[03:20](#msg5577acf827d2203776cd2ba5)Still with an open question of whether #\[...] (maps) in Ren strictly defines name-value pairs or if the leading # is a hint for loaders.

WiseGenius

[03:23](#msg5577ada0777c17d06a14823c):point\_up: \[June 10 2015 1:17 PM](https://gitter.im/red/red/map-datatype?at=5577ac6305c872ce6ac87d6b) As I understand it, proper JSON's objects don't have functions. I think the question was even if Ren had `object!`s, should they be allowed to have `function!`s in Ren.

[03:24](#msg5577ae0a463d0c7c066ea21a)For now, I'm saying yes to both `map!`s and `object!`s because unlike JavaScript, Red is homoiconic.

greggirwin

[03:25](#msg5577ae1a777c17d06a148240)I think we absolutely need to be able to pass them around, but that doesn't mean Ren evaluates them.

dockimbel

[03:25](#msg5577ae47a501647d705f305a):point\_up: \[June 10 2015 11:25 AM](https://gitter.im/red/red/map-datatype?at=5577ae1a777c17d06a148240) If you put functions in Ren, it is no more a "data exchange format", but a source code for a programming language. ;-)

greggirwin

[03:28](#msg5577aedff40a067d1c9c02a1)I'm clearly not being clear. :-\\ Ren must allow us to store values that could be interpreted as instructions by consumers. Do we agree?

[03:35](#msg5577b09c777c17d06a148261)Assuming we do, as it does this today, and everything is just data, my point is that we want Ren to be as compatible with Redbol as possible. Hence, Ren needs to allow a serialized form for functions as Redbol might write them, and if Red doesn't allow funcs in maps...well, I guess we're still OK because everything could just be in one big list from Redbol. And Ren doesn't care if your list contains \[make object! ...].

WiseGenius

[03:41](#msg5577b1ed777c17d06a14826f):point\_up: \[June 10 2015 1:35 PM](https://gitter.im/red/red/map-datatype?at=5577b09c777c17d06a148261) I think you need to decide whether `map!`s are really `map!`s in Ren then, because:

```
red>> #(o: make object! [a: 1 b: 2])
== #(
    o: make
    object!: [a: 1 b: 2]
)
```

dockimbel

[03:46](#msg5577b2faa501647d705f305c):point\_up: \[June 10 2015 11:28 AM](https://gitter.im/red/red/map-datatype?at=5577aedff40a067d1c9c02a1) I'm not sure to understand, but "values that could be interpreted as instructions by consumers" looks like the definition for source code (regardeless of how you store them, in text format, block format or binary codes).

WiseGenius

[03:47](#msg5577b33f777c17d06a148280):point\_up: \[June 10 2015 1:41 PM](https://gitter.im/red/red/map-datatype?at=5577b1ed777c17d06a14826f) @greggirwin Please correct me if my reasoning is wrong, but it seems to me that if `map!`s are really `map!`s in Ren, and not just hinted lists, then Ren excludes `map!`s from containing `function!`s and `object!`s as values unless they have literal forms or construction syntax is allowed.

[04:01](#msg5577b68d777c17d06a1482a0)Of course, even if they are hinted lists, they could not hint to pairs containing `function!`s or `object!`s as single values of those pairs.

[04:02](#msg5577b6e3777c17d06a1482a2)Or am I missing something important about Ren?

PeterWAWood

[04:34](#msg5577be65813c577e1cf5d9a7)@qtxie I written a handful of map-tests (tests/source/units/map-test.red) including one to check the Find issue and another to test copy. The latter crashes so I haven't added the file to all-tests.txt yet.

[04:35](#msg5577be7d777c17d06a1482fd)I'll try to add more tests as time allows.

dockimbel

[04:40](#msg5577bfc2777c17d06a14830b):point\_up: \[June 10 2015 12:34 PM](https://gitter.im/red/red/map-datatype?at=5577be65813c577e1cf5d9a7) Thanks Peter!

pekr

[05:47](#msg5577cf8e777c17d06a1483af):point\_up: \[June 10 2015 4:37 AM](https://gitter.im/red/red/map-datatype?at=5577a2cd34e2ebcb07f3e2f0) Missing most of the discussion I wonder, why do we have 'modify at all? Aren't set/get, pick/poke pairs of funcs enough? As for PUT, I don't like it much, IIRC Ruby (and maybe some other langs) use PUTS as basically an equivalent of our PRINT?

[05:49](#msg5577cfe5f40a067d1c9c03fc)Could someone shortly explain, what is supposed to be an advantage of MODIFY vs the SET and POKE?

dockimbel

[06:03](#msg5577d325777c17d06a1483e6):point\_up: \[June 10 2015 1:47 PM](https://gitter.im/red/red/map-datatype?at=5577cf8e777c17d06a1483af) POKE has no `/case` refinement. SET has a different arity.

WiseGenius

[06:08](#msg5577d451777c17d06a1483f9):point\_up: \[June 10 2015 3:47 PM](https://gitter.im/red/red/map-datatype?at=5577cf8e777c17d06a1483af) Like many C functions, I think `puts()`has a silly name, and shouldn't be an influence. I like `put` for what is being suggested here.

[06:12](#msg5577d55005c872ce6ac87f54)On second thoughts, `put` seems to imply an inverse of `take`.

[06:13](#msg5577d5a2777c17d06a148410)`edit`?

pekr

[06:19](#msg5577d6f2f40a067d1c9c0456)I somehow miss clear borderline, which functions are `series!` related only and which ones could be used elsewhere. E.g. looking into R3's `change`, once again, while its help string talks about the series, then it adds - gobs, ports, but e.g. not objects ... confused ...

dockimbel

[06:36](#msg5577dad6463d0c7c066ea439):point\_up: \[June 10 2015 2:08 PM](https://gitter.im/red/red/map-datatype?at=5577d451777c17d06a1483f9) PUT would add or modify (depending if the key is already defined or not).

[06:37](#msg5577db3ef40a067d1c9c049d):point\_up: \[June 10 2015 2:19 PM](https://gitter.im/red/red/map-datatype?at=5577d6f2f40a067d1c9c0456) Ports are supposed to have a series-like dimension, I don't know for gobs (we don't plan to support them in our GUI engine).

WiseGenius

[06:39](#msg5577dbb1777c17d06a148462):point\_up: \[June 10 2015 4:36 PM](https://gitter.im/red/red/map-datatype?at=5577dad6463d0c7c066ea439) True. `put` re-'takes' the lead. ;)

dockimbel

[06:39](#msg5577dbb1813c577e1cf5db10):point\_up: \[June 10 2015 2:19 PM](https://gitter.im/red/red/map-datatype?at=5577d6f2f40a067d1c9c0456) CHANGE could not be used as a replacement for POKE on maps as their arity differs.

[06:39](#msg5577dbbe463d0c7c066ea446):point\_up: \[June 10 2015 2:39 PM](https://gitter.im/red/red/map-datatype?at=5577dbb1777c17d06a148462) haha, right. ;-)

WiseGenius

[06:42](#msg5577dc6005c872ce6ac87fc3):point\_up: \[June 10 2015 4:39 PM](https://gitter.im/red/red/map-datatype?at=5577dbb1777c17d06a148462) Besides, thinking the other way, the inverse of “take” in English is usually thought of as “give”... give or take.

dockimbel

[06:50](#msg5577de23777c17d06a14849f):point\_up: \[June 10 2015 2:42 PM](https://gitter.im/red/red/map-datatype?at=5577dc6005c872ce6ac87fc3) I would rather contrast "give" with "receive", but give or take works too. :)

qtxie

[06:50](#msg5577de42777c17d06a1484a4):point\_up: \[June 10 2015 12:34 PM](https://gitter.im/red/red/map-datatype?at=5577be65813c577e1cf5d9a7) Thanks! :smile:

WiseGenius

[06:53](#msg5577def627d2203776cd2e25):point\_up: \[June 10 2015 4:50 PM](https://gitter.im/red/red/map-datatype?at=5577de23777c17d06a14849f) True. And “steal” should just not exist to begin with.

dockimbel

[07:01](#msg5577e0d405c872ce6ac8800d):point\_up: \[June 10 2015 2:53 PM](https://gitter.im/red/red/map-datatype?at=5577def627d2203776cd2e25) "steal" is reserved for I/O. ;-P

WiseGenius

[07:02](#msg5577e10b05c872ce6ac88014):point\_up: \[June 10 2015 5:01 PM](https://gitter.im/red/red/map-datatype?at=5577e0d405c872ce6ac8800d) Oh! Well then by all means!

pekr

[07:16](#msg5577e468813c577e1cf5dbe0)Then docs are confusing

[07:17](#msg5577e4a4777c17d06a14853e)in the section, where all set, poke and modify are mentioned, there is a note - adding keys which don't exist, will simply create them. Could someone, please, explain the difference between the set, poke and modify/put?

WiseGenius

[07:25](#msg5577e64e05c872ce6ac88099):point\_up: \[June 10 2015 5:16 PM](https://gitter.im/red/red/map-datatype?at=5577e468813c577e1cf5dbe0) @pekr See: \[here](https://gitter.im/red/red/map-datatype?at=5575295505c872ce6ac839c4) and \[here](https://gitter.im/red/red/map-datatype?at=5577d325777c17d06a1483e6) What I have in my head is:

```
[[:get :set] [:pick :poke] [:select :put]]
```

dockimbel

[09:34](#msg557804a027d2203776cd324e):point\_up: \[June 10 2015 3:16 PM](https://gitter.im/red/red/map-datatype?at=5577e468813c577e1cf5dbe0) The spec says "setting a key that does not exist previously in the map, will simply create it.".

[09:38](#msg5578058af40a067d1c9c0904):point\_up: \[June 10 2015 3:16 PM](https://gitter.im/red/red/map-datatype?at=5577e468813c577e1cf5dbe0) SET takes a path as argument to locate the key, MODIFY requires separate arguments for the map, key and value. POKE is supported for sake of polymorphism and compatibility with R3, but it could be dropped easily, as it does not have a `/case` refinement, nor does it bring anything more than MODIFY.

[09:39](#msg557805d4463d0c7c066ea8b7)PUT would definitely be an improvement, and could replace POKE in other cases like for object!, so POKE would remain "pure" and used only for series.

[10:07](#msg55780c58777c17d06a148991):point\_up: \[June 10 2015 5:39 PM](https://gitter.im/red/red/map-datatype?at=557805d4463d0c7c066ea8b7) Just checked in Rebol3, POKE is not allowed for objects, but it is for map, not sure why the difference in treatment there.

pekr

[10:10](#msg55780d2e777c17d06a1489b3)It's a little bit of a mess, isn't it? :-(

earl

[10:12](#msg55780d8427d2203776cd336f)Another suggestion on the table: add a `/case` refinement to PICK and POKE. Use PICK and POKE for map!. Drop support for SELECT on map!.

[10:14](#msg55780dfaf40a067d1c9c0a20)This would make retrieval and storage map access in itself rather consistent, providing 3 pairs (which are also pairs in other scenarios): get/set-path! (no case), pick/poke (case), get/set (case).

[10:15](#msg55780e3b777c17d06a1489c7)We also wouldn't have to worry about all the other SELECT refinements (because no more SELECT for map!s), but only about PICK/POKE's /case refinement for non-map!s.

PeterWAWood

[10:22](#msg55781002463d0c7c066ea9de)I wouldn't been keen on replacing SELECT with PICK for MAP! values as I'm used to PICK returning the nth element of a SERIES! and SELECT the nth+1. The use cases I've seen most often for SELECT is to get the value from a set of key/values stored in a BLOCK!.

earl

[10:27](#msg5578112927d2203776cd33be)Both, PICK and SELECT, return an element associated with a given designator.

[10:28](#msg5578113c463d0c7c066ea9ff)Being able to continue to use SELECT while replacing a plain block! with a map! is a good point.

PeterWAWood

[10:29](#msg5578117505c872ce6ac8855a)My worry is that using PICK becomes more complicated for us beginners:

```
red>> m: make map! [1 "a" 2 "b"]
== #(
    1 "a"
    2 "b"
)
red>> b: [1 "a"  2 "b"  3 "c" 4 "d"]
== [1 "a" 2 "b" 3 "c" 4 "d"]
red>> pick m 2
== "b"
red>> pick b 1
== 1
```

earl

[10:30](#msg557811d1463d0c7c066eaa15)I fear that's polymorphism for you.

PeterWAWood

[10:31](#msg557811f027d2203776cd33cb)I should have included this:

```
red>> pick b 2
== "a"
```

earl

[10:33](#msg5578125c05c872ce6ac88572)

```
red
red>> m: make map! [1 x 2 y 3 z]
== #(
    1 x
    2 y
    3 z
)
red>> b: [1 x 2 y 3 z]
== [1 x 2 y 3 z]
red>> m/y
== none
red>> b/y
== 3
red>> m/2
== y
red>> b/2
== x
```

[10:36](#msg55781328463d0c7c066eaa2c)We have this very same difference with path-based access too. I'd say this difference in access/lookup behaviour is actually part of the raison d'être for map!.

PeterWAWood

[10:38](#msg557813a8463d0c7c066eaa36)Even I don't expect the language to guess my data structure. Though I can tell it with /SKIP:

```
red>> b: [1 "a"  2 "b"  3 "c" 4 "d"]
== [1 "a" 2 "b" 3 "c" 4 "d"]
red>> select/skip b "b" 2
== none
```

[10:41](#msg5578144e27d2203776cd340b)Path-based access is convenient but as you have shown has its drawbacks.

earl

[10:42](#msg557814b327d2203776cd3412)The same "drawback" the other way round: what should `select/skip` do on a `map!`?

[10:43](#msg557814ee463d0c7c066eaa5f)We have different datatypes here, and the reason they are different is because we \_want_ them to exhibit different behaviour.

PeterWAWood

[10:44](#msg557814ff05c872ce6ac885b7)In my thinking, Map! is closer to Object! than Series! Order is irrelevant. To many people, it seems the other way around possibly because it replaced Hash! in Rebol 3.

earl

[10:44](#msg5578152a05c872ce6ac885bb)I think part of the question is: how much do we want to channel this difference in behaviour through the \_same_ functions.

PeterWAWood

[10:45](#msg55781564463d0c7c066eaa68)The same functions we use on Object! or on Series! ?

earl

[10:46](#msg5578158527d2203776cd3424)These are not disjunct sets.

PeterWAWood

[10:46](#msg5578158e463d0c7c066eaa6d)If it was a vote, I'd vote for the same functions and a similar behaviour to Object!

earl

[10:47](#msg557815cbf40a067d1c9c0ac4)That would also assume, that this behaviour has been completely settled for object already. It seems it has not.

PeterWAWood

[10:48](#msg557815f6777c17d06a148a95)Hopefully this discussion will help in that respect.

earl

[10:48](#msg5578161905c872ce6ac885ca)But if it were, we only have R3 to guide us: and then it'd be SELECT for lookup and EXTEND for association.

[10:49](#msg55781626463d0c7c066eaa79)And we'd have to extend EXTEND with a /case refinement.

[10:50](#msg5578165f05c872ce6ac885cd)(NB: `extend` also works on block! and paren! in R3 ...)

[10:51](#msg557816c627d2203776cd343e)I don't think EXTEND is very aptly named (in my mind, there's a connotation with a guaranteed growth in size). But I could nevertheless live with SELECT / EXTEND as the get/put pair for map! :)

dockimbel

[10:51](#msg557816ca27d2203776cd343f):point\_up: \[June 10 2015 6:48 PM](https://gitter.im/red/red/map-datatype?at=5578161905c872ce6ac885ca) Just rename EXTEND to PUT and you have a winner. ;-)

earl

[10:52](#msg557816e1463d0c7c066eaa85);)

[10:53](#msg5578171bf40a067d1c9c0ae0)And then drop PICK/POKE on map!. Pity -- such nice and brief names.

PeterWAWood

[10:53](#msg55781747463d0c7c066eaa8c)SELECT works with objects in Rebol2 as well.

dockimbel

[10:54](#msg55781755f40a067d1c9c0ae3):point\_up: \[June 10 2015 6:52 PM](https://gitter.im/red/red/map-datatype?at=557816e1463d0c7c066eaa85) I am more and more tempted by that option, as shown by Peter in above examples, using them for maps looks far-stretched.

[10:55](#msg557817a4777c17d06a148ab7)I started making map! by trying to stick to how R3 did it, but it doesn't seem to be a good way, as it is unfinished work in R3.

earl

[10:55](#msg557817a827d2203776cd3450):point\_up: \[June 10 2015 12:54 PM](https://gitter.im/red/red/map-datatype?at=55781755f40a067d1c9c0ae3) I don't think they look too far-stretched, if you adjust your mindset that the behaviour just polymorphically extends "lookup by index" to also include "lookup by key" (of which a positional index is but one instance).

[10:57](#msg55781818777c17d06a148abe)get-path/set-path (no case), pick/poke (no case), get/set (case), select/put (case)

dockimbel

[10:58](#msg5578184305c872ce6ac885ec)PICK really means: return the value \_AT_ the index position. SELECT has always been key/value related, so no problem to reuse it in maps (and it has `/case`, so it fully qualifies).

[10:58](#msg5578186c813c577e1cf5e178)Let's present it differently: would you use PICK over SELECT on maps in your code? I would certainly go for SELECT/PUT combo for maps and probably never use PICK/POKE.

earl

[10:59](#msg5578188d05c872ce6ac885f4)Yes, I think I would (I'm confident, because I know I did).

PeterWAWood

[11:00](#msg557818ba463d0c7c066eaaa0)Yes it extends "lookup by index" to also include "lookup by key" though the price is that the programmer needs to know (or add a function call) whether its a Series! or Map! to determine which.

earl

[11:00](#msg557818c4463d0c7c066eaaa1)Even in R2, that PICK view "at index position" was not really true, though. Because PICK was also used as a reflector with arbitrary meanings associated with the "index" argument.

[11:02](#msg5578193c813c577e1cf5e18a)In R3 it certainly is no longer true, as PICK has changed to the more general "indexing" meaning.

[11:02](#msg55781955463d0c7c066eaaab):point\_up: \[June 10 2015 1:00 PM](https://gitter.im/red/red/map-datatype?at=557818ba463d0c7c066eaaa0) A price you also have to pay for path-based access.

[11:03](#msg5578199a777c17d06a148ad9)And a price you also have to pay for SELECT (or any other scheme-overridable action) when schemes and ports come into play.

[11:06](#msg55781a1f777c17d06a148af2)Finally, I mentioned above that I think "lookup by index" is a subset of the "lookup by key" view. For positional containers, the key is a positional index; for associative containers, the key is a more general value.

[11:07](#msg55781a5f777c17d06a148afc)(That view is fundamental to Lua's "tables").

[11:08](#msg55781a9d27d2203776cd3490)In any case, I think it may be better if we have only one pair of those functions for map (unless the other pair adds some real value). So PICK/POKE \_or_ SELECT/PUT, but probably not both.

pekr

[11:08](#msg55781ab4463d0c7c066eaae4)I would probably allow pick and poke, but to preserve their low level nature, I would not add /case refinement - simply put - use only in the case you can be sure it can work. But that's probably bad aproach :-)

WiseGenius

[11:10](#msg55781b31463d0c7c066eaaf8)Personally, I think we should keep \[all three pairs](https://gitter.im/red/red/map-datatype?at=5577e64e05c872ce6ac88099). I think it's normal that when you polymorph functions from different directions, their functionality will overlap on some datatypes. If we retreat any of those functions, different people will ask for different ones back again, depending on which other datatypes they work with the most, etc.

pekr

[11:11](#msg55781b7c27d2203776cd34a4)btw - I don't mind adjusting my mindset abou the difference of map/objects, having actually no index position ...

[11:13](#msg55781bc3f40a067d1c9c0b49):point\_up: \[June 10 2015 1:10 PM](https://gitter.im/red/red/map-datatype?at=55781b31463d0c7c066eaaf8) - I agree to the `Three pairs` proposal, adding that pick/poke should not have /case refinement ... but not sure about the consequences :-)

PeterWAWood

[11:22](#msg55781df427d2203776cd34e6)If there has to be all three, please can two of them wait until after Red 1.0 is here.

dockimbel

[11:24](#msg55781e6305c872ce6ac88673):point\_up: \[June 10 2015 7:10 PM](https://gitter.im/red/red/map-datatype?at=55781b31463d0c7c066eaaf8) What would you say to people complaining that PICK/POKE provide no additional feature compared to SELECT/PUT and are not even able to work in case-sensitive way, so why did we even allow them? :)

pekr

[11:25](#msg55781e8f27d2203776cd34f7)I can understand you, but then it is like deciding between the blk/1 vs the pick blk 1 :-)

WiseGenius

[11:25](#msg55781eb0813c577e1cf5e21b):point\_up: \[June 10 2015 9:24 PM](https://gitter.im/red/red/map-datatype?at=55781e6305c872ce6ac88673) If I were to drop any, it would definitely be `pick` and `poke`.

dockimbel

[11:25](#msg55781eb6777c17d06a148b77)We need to make a good choice there, that can sound reasonable and logical to the largest number of users. We can never satisfy everyone anyway.

pekr

[11:25](#msg55781eb7777c17d06a148b78)Well, not exactly, I know. So ask Doc, if we want to give up on PICK/POKE. For me, POKE was always related to ZX Spectrum Assembler :-)

dockimbel

[11:26](#msg55781edf463d0c7c066eab58):point\_up: \[June 10 2015 7:25 PM](https://gitter.im/red/red/map-datatype?at=55781eb7777c17d06a148b78) Was PEEK/POKE on ZX Spectrum. ;)

pekr

[11:26](#msg55781ef3777c17d06a148b7c)Ah, missed the first one, thanks :-)

dockimbel

[11:27](#msg55781f1405c872ce6ac88682)I would also drop PICK/POKE first.

pekr

[11:27](#msg55781f1b813c577e1cf5e22b)So - if you want to have pick/poke being more low level, why not then. But already for a series, they are not low level anyway. Should be reserved for a binary? :-)

[11:28](#msg55781f4305c872ce6ac88688)As for PUT - will it work for series then too, not just maps?

WiseGenius

[11:33](#msg5578209d463d0c7c066eab87):point\_up: \[June 10 2015 9:27 PM](https://gitter.im/red/red/map-datatype?at=55781f1b813c577e1cf5e22b) I would still need to use them on a series, but I don't see any unique use for them on `map!`. I can understand why some would want to use them that way, but they're not being denied any functionality if they can't.

earl

[11:34](#msg557820ca05c872ce6ac886a8)My preference would be PICK/POKE (with `/case`) over SELECT/PUT. But the latter is perfectly fine with me as well.

WiseGenius

[11:38](#msg557821c6813c577e1cf5e279)If it wasn't for \[this](https://gitter.im/red/red/map-datatype?at=5575708c813c577e1cf59c21), and `pick` and `poke` would otherwise only use numbers for their `index` arguments, then I would wholeheartedly push for them to be dropped from `map!`.

earl

[11:40](#msg55782226813c577e1cf5e285):point\_up: \[June 10 2015 1:38 PM](https://gitter.im/red/red/map-datatype?at=557821c6813c577e1cf5e279) I think this (things such as `pick now 'hour` or `pick 1x2 'y`) may be better served by REFLECT anyway.

[11:44](#msg55782302f40a067d1c9c0bfd)REFLECT was introduced in R3 to remove the other "weird" use of PICK before that: first, second, third (or pick 1, 2, 3) return e.g. a function's arguments, its body, and original spec in R2. This is what has later become WORDS-OF, BODY-OF, SPEC-OF. In R3 built atop REFLECT, in R2 wrappers around FIRST, SECOND, THIRD, etc.

[11:48](#msg557823f7463d0c7c066eabde)Just thinking out loud: we could also keep PICK/POKE on maps but make them case-sensitive-only ...

[11:49](#msg5578246005c872ce6ac88719)Smells somewhat "low-level" as I keep hearing that mentioned. Would have a clear distinction/additional value compared to SELECT/PUT to justify the additional existence. Would be much briefer than SELECT/case and PUT/case when you know you need the case-sensitivity anyway.

[11:51](#msg557824a5777c17d06a148c17)Again, just a thought. I'm not yet myself sure what to make of it :)

WiseGenius

[11:51](#msg557824c7f40a067d1c9c0c41):point\_up: \[June 10 2015 9:48 PM](https://gitter.im/red/red/map-datatype?at=557823f7463d0c7c066eabde) Your interesting thoughts make me smile. :smile:

[11:53](#msg5578253a463d0c7c066eac03)Would that mean that `pick now 'HoUr` wouldn't work as `pick now 'hour`?

earl

[11:57](#msg55782623463d0c7c066eac1f):point\_up: \[June 10 2015 1:51 PM](https://gitter.im/red/red/map-datatype?at=557824c7f40a067d1c9c0c41) My thought assumes this kind of reflection has already been relegated to REFLECT :)

WiseGenius

[12:03](#msg557827a905c872ce6ac88778):point\_up: \[June 10 2015 9:57 PM](https://gitter.im/red/red/map-datatype?at=55782623463d0c7c066eac1f) Then I would much more reluctant to drop them. Sadly, however, I don't think this is the way to go. It doesn't add new functionality. All it does is cut down on some key strokes. People would want to use them this way for `series!` as well, and then they would be far from their original function on `series!` which is an important one.

[12:08](#msg557828b6f40a067d1c9c0ccd)I think there are better ways to shortcut `/case`. For example, \[this one](https://github.com/red/red/wiki/Case-Sensitive-Map!-Keys#13) which is less prone to user mistakes. Also rather than chaining lots of `select`s and `pick`s together on different types of nested maps, all can be accessed with a single path and no refinements.

[12:09](#msg5578291627d2203776cd3648)But that's a wider language design topic, probably best left for another time and place.

rebolek

[17:32](#msg557874bd27d2203776cd420b)@pekr What's wrong with PICK(PEEK)/POKE reminiscence of ZX Spectrum? AFAIR, POKE gave unlimited lives, so it was wonderful thing ;)

greggirwin

[17:36](#msg557875bb813c577e1cf5ef15)Something else to consider is how Carl chose length-matched words that were related. It may seem a small thing, but PICK/POKE is nicer than PICK/PUT. I believe that does play into how we remember and associate things as well.

## Thursday 11st June, 2015

PeterWAWood

[02:47](#msg5578f6c527d2203776cd4f11)@dockimbel @qtxie There seems to be a weird bug with the interpreter. One of the tests that passes when compiled causes a script error when interpreted. The code also works in the console.

Code

```
Red[]

prin "compiled code says: "
m: #(a none b 2 c 3)
print 'none = m/a

do [
	prin "interpreted code says: "
	mi: #(a none b 2 c 3)
	print 'none = mi/a
]
```

Output

```
./test
compiled code says: true
interpreted code says: *** Script error: path mi/a is not valid for issue type
*** Where: =
*** Stack: do print =
```

Console

```
red>> mi: #(a none b 2 c 3)
== #(
    a: none
    b: 2
    c: 3
)
red>> 'none = mi/a
== true
```

dockimbel

[04:11](#msg55790a8827d2203776cd5029):point\_up: \[June 11 2015 10:47 AM](https://gitter.im/red/red/map-datatype?at=5578f6c527d2203776cd4f11) Looks like a lexer issue, not storing properly nested map values in redbin.

[05:14](#msg5579192427d2203776cd50b8):point\_up: \[June 11 2015 10:47 AM](https://gitter.im/red/red/map-datatype?at=5578f6c527d2203776cd4f11) Issue fixed.

pekr

[06:06](#msg5579256e813c577e1cf5fda8)So, any decision on the functions, which will serve for maps? SET/GET seem to be clear. But PICK/POKE (incl. /CASE) vs the SELECT/PUT?

dockimbel

[06:23](#msg5579295305c872ce6ac8a303)As I see it, SELECT is the most legitimate and natural way to get a key from a map, as its semantics imply a key/value oriented lookup, even with series. Making PICK work on map! would make it equivalent to SELECT, while it is clearly different when used on series. So, allowing PICK (hence POKE) on maps would IMHO introduce inconsistency and possible confusion to users. In the cases where PICK is used with a word value as index (like in `pick 4x4 'y`), the datatype is not a series, so SELECT is not supported, hence no risk of confusion.

pekr

[06:24](#msg5579299d27d2203776cd516f)ok, so we will get PUT counterpart, right? Will you make it to work on a series? Would be nice too ....

WiseGenius

[06:26](#msg55792a1b27d2203776cd5185):point\_up: \[June 11 2015 4:24 PM](https://gitter.im/red/red/map-datatype?at=5579299d27d2203776cd516f) No question, I would have thought.

pekr

[06:26](#msg55792a21813c577e1cf5fe0b)`blk: ["Petr" 42 "Jan" 32] put blk "Petr" 43`?

[06:28](#msg55792a8727d2203776cd518c)well, should be: `if now/date > 7-Sep-2015 [put blk "Petr" 43]` :-)

PeterWAWood

[06:29](#msg55792acc463d0c7c066ec7e6):point\_up: \[June 11 2015 1:14 PM](https://gitter.im/red/red/map-datatype?at=5579192427d2203776cd50b8) I've added the few map tests to run-all as they now run with no errors.

WiseGenius

[06:29](#msg55792acf463d0c7c066ec7e7):point\_up: \[June 11 2015 4:26 PM](https://gitter.im/red/red/map-datatype?at=55792a21813c577e1cf5fe0b) That's when you're moving to Neverland?

dockimbel

[06:36](#msg55792c55f40a067d1c9c276d):point\_up: \[June 11 2015 2:29 PM](https://gitter.im/red/red/map-datatype?at=55792acc463d0c7c066ec7e6) Thanks!

[10:47](#msg5579672605c872ce6ac8a87c)PUT could be allowed on series, as the counterpart of SELECT. It would replace the following code pattern:

```
s: [a 2 b 3 c 4]
;-- usual code pattern
if pos: find s 'a [poke pos 2 0]
;-- now using PUT
put s 'a 0
```

[10:49](#msg557967b2f40a067d1c9c2cb4)Note that PUT could return `none` if the key is not found or the new value otherwise (as does POKE).

[10:55](#msg55796931463d0c7c066ecdda)We could do it using a path syntax, but not using a function with separate arguments, so PUT would fill a hole in the series actions.

pekr

[10:56](#msg5579696a813c577e1cf603b4)what about PUT/NEW, which could create new value, if not found?

dockimbel

[10:58](#msg557969e1777c17d06a14adbf):point\_up: \[June 11 2015 6:56 PM](https://gitter.im/red/red/map-datatype?at=5579696a813c577e1cf603b4) You can create new values with APPEND or EXTEND already. In case of maps, PUT would create the new key for you (as does the path syntax already), that's part of the map-specific behavior.

pekr

[11:00](#msg55796a67813c577e1cf603c9)what is the difference between the APPEND and EXTEND, in case of series?

[11:01](#msg55796a86463d0c7c066ecdf5)well, anyway, 0.5.4 seems to be yet another quite big/important release :-)

dockimbel

[11:06](#msg55796b98463d0c7c066ece10)Not really different, actually. No sure it is worth allowing EXTEND on series! (or rather any-block!) in Red. Note that EXTEND in Red has not the same arity as in R3. In R3, EXTEND is what PUT is in Red now.

[11:07](#msg55796bdf777c17d06a14adf9)I still need EXTEND in Red to be used on objects (in the future), and it is still useful for mass-changes in maps.

PeterWAWood

[11:08](#msg55796c45813c577e1cf603f7)Just to be sure, EXTEND won't be allowed on string!, will it?

[11:11](#msg55796cff463d0c7c066ece2c)Is this part of the intended behaviour of PUT?

```
put "Paragraph 1" #"1" #"2"
```

dockimbel

[11:12](#msg55796d24813c577e1cf6040f):point\_up: \[June 11 2015 7:08 PM](https://gitter.im/red/red/map-datatype?at=55796c45813c577e1cf603f7) What result do you expect from it?

PeterWAWood

[11:13](#msg55796d45f40a067d1c9c2d61)

```
#"2"
```

[11:15](#msg55796dbe463d0c7c066ece3c)I am asking to check when you have been talking about series! (when discussing PUT etc.) that includes string!

[11:17](#msg55796e3af40a067d1c9c2d6d)Is there any difference between PUT and REPLACE for series! apart from the value returned?

dockimbel

[11:24](#msg55796fdc05c872ce6ac8a975):point\_up: \[June 11 2015 7:13 PM](https://gitter.im/red/red/map-datatype?at=55796d45f40a067d1c9c2d61) Right. So maybe PUT should return `none` in case it cannot write the value rather than if it cannot find the key?

[11:25](#msg55797020813c577e1cf6045a):point\_up: \[June 11 2015 7:13 PM](https://gitter.im/red/red/map-datatype?at=55796d45f40a067d1c9c2d61) REPLACE changes the searched key, PUT changes the value following the key.

[11:25](#msg55797039463d0c7c066ece7a)Think FIND vs SELECT.

PeterWAWood

[11:28](#msg557970db777c17d06a14ae80):point\_up: \[June 11 2015 7:24 PM](https://gitter.im/red/red/map-datatype?at=55796fdc05c872ce6ac8a975) Thanks.

dockimbel

[11:29](#msg55797105f40a067d1c9c2dbe):point\_up: \[June 11 2015 6:47 PM](https://gitter.im/red/red/map-datatype?at=5579672605c872ce6ac8a87c) In my above example, notice that `index` = 2.

PeterWAWood

[11:32](#msg557971e4777c17d06a14ae9f)Will PUT allow this:

[11:33](#msg5579720c27d2203776cd5871)

```
s: "a b c d"
put  s #"b" "an inserted string"
```

dockimbel

[11:35](#msg55797268463d0c7c066eceb4):point\_up: \[June 11 2015 7:32 PM](https://gitter.im/red/red/map-datatype?at=557971e4777c17d06a14ae9f) I think it should not, it should just allow a `char!` for any-string!. Same rule as POKE on any-string!.

PeterWAWood

[11:36](#msg557972b3813c577e1cf604b1)Thanks again for the clarification.

dockimbel

[11:37](#msg557972f9813c577e1cf604b9)PUT has been implemented for maps now, so you can play with it. ;)

WiseGenius

[11:39](#msg55797363f40a067d1c9c2dfc)@dockimbel How do you feel about #1233? I just added a comment to it for clarification.

dockimbel

[11:45](#msg557974e9463d0c7c066eceed):point\_up: \[June 11 2015 7:39 PM](https://gitter.im/red/red/map-datatype?at=55797363f40a067d1c9c2dfc) We won't support the linked \[proposition](https://github.com/red/red/wiki/use-blocks-as-keys) about block-as-key, as blocks are not part of the datatypes we hash. For your proposition, SET is already providing that feature on maps.

WiseGenius

[11:49](#msg557975c227d2203776cd58d3):point\_up: \[June 11 2015 9:45 PM](https://gitter.im/red/red/map-datatype?at=557974e9463d0c7c066eceed) How?

dockimbel

[11:51](#msg5579764727d2203776cd58e7):point\_up: \[June 11 2015 7:49 PM](https://gitter.im/red/red/map-datatype?at=557975c227d2203776cd58d3) Re-reading your proposition: actually, not exactly the same. I think your proposition is very interesting, as it could be applied to all the types supported by PUT, and we don't have any other easy way to achieve the same otherwise.

WiseGenius

[11:57](#msg557977a6f40a067d1c9c2e75):smile:

PeterWAWood

[13:30](#msg55798d9005c872ce6ac8ad80)I had expected PUT to return the added or changed value but it appears to return the map!. Is this correct?

dockimbel

[13:42](#msg55799055f23ce66022bbf7bd):point\_up: \[June 11 2015 9:30 PM](https://gitter.im/red/red/map-datatype?at=55798d9005c872ce6ac8ad80) No, it's not, will fix that now.

PeterWAWood

[13:44](#msg557990b4463d0c7c066ed2c7)There seems to be a small mistake in this error message:

```
red>> pick/case #(a 1 b 2) 'B
*** Script error: pick has no refinement called pick
*** Where: pick
```

WiseGenius

[13:44](#msg557990da27d2203776cd5cb2)Yes, I noticed that too.

PeterWAWood

[13:48](#msg55799190463d0c7c066ed2dd):point\_up: \[June 11 2015 9:42 PM](https://gitter.im/red/red/map-datatype?at=55799055f23ce66022bbf7bd) Thanks.

dockimbel

[15:00](#msg5579a291c84874c635ac0cd5):point\_up: \[June 11 2015 9:44 PM](https://gitter.im/red/red/map-datatype?at=557990b4463d0c7c066ed2c7) Please open a ticket for that one.

PeterWAWood

[21:40](#msg557a0062f40a067d1c9c3fa0)#1238 opened

## Friday 12nd June, 2015

dockimbel

[08:06](#msg557a9316813c577e1cf61f3a)FYI, I will remove PICK/POKE support from maps. Though, the discussion is still open if there are new arguments pros, I could reconsider it.

WiseGenius

[08:20](#msg557a9645f40a067d1c9c489e):point\_up: \[June 12 2015 6:06 PM](https://gitter.im/red/red/map-datatype?at=557a9316813c577e1cf61f3a) :+1: on their removal.

## Saturday 13th June, 2015

pekr

[07:58](#msg557be2af873bcf056fb4ef11)

```
red>> m: make map! []
== #()
red>> repeat i 1'000'1000 [extend m reduce [i i]]
Memory error: allocate memory > 2MB (--NOT_IMPLEMENTED--)
== "#()"
red>> m
== #(
    1 32768
    2 32768
)
```

[07:59](#msg557be2eb7d5adaae3b4eef6a)apart from typo in a million count, the result is identical ...

dockimbel

[08:04](#msg557be3fbc030cae67ed3891c):point\_up: \[June 13 2015 3:58 PM](https://gitter.im/red/red/map-datatype?at=557be2af873bcf056fb4ef11) Works fine with a lower counter number.

## Wednesday 22nd July, 2015

PeterWAWood

[10:03](#msg55af6a889402748911922dc1)Does the map literal syntax allow string keys? I get an error when I try:

```
red>> #("a": 1)
*** Syntax error: invalid issue! at #("a": 1)
*** Where: do
```

dockimbel

[10:12](#msg55af6caa14ea54755e72cc5f)@PeterWAWood Don't put a colon character, and it will be fine. ;-)

PeterWAWood

[10:15](#msg55af6d5ba3bbb5445f639b0d)@dockimbel Thanks. :-)

## Wednesday 23th December, 2015

PeterWAWood

[01:14](#msg5679f5713acb611716ff7ac2)@dockimbel @qtxie

make map! doesn't seem to like spec blocks produced by form:

```
red>> m: #("a" 1 "b" 2 "c" 3)
== #(
    "a" 1
    "b" 2
    "c" 3
)
red>> m1: make map! ["a" 1 "b" 2 "c" 3]
== #(
    "a" 1
    "b" 2
    "c" 3
)
red>> m2: make map! form m
*** Internal error: reserved for future use (or not yet implemented)
*** Where: make
```

[02:26](#msg567a06733acb611716ff7bee)@dockimbel @qtxie

[02:27](#msg567a069335e1a316162deb2c)Sorry. I missed out

```
load
```

. Not enough coffee!!

dockimbel

[03:28](#msg567a14e20171d1791d01d85c)@PeterWAWood :) Though, the error message there is not the right one, something like "unsupported spec type" would be more appropriate.

PeterWAWood

[05:14](#msg567a2dc79606b15a055d5887)@dockimbel I'm a bit puzzled by the failing map-test. When I run the test on its own, it passes. When the test is included in one of the large run-all tests, it fails.

[05:15](#msg567a2dd73c68940269247ff2)I can't see anything obvious.

[05:19](#msg567a2ef34f069158055b88e6)The problem appeared to be having

```
do f
```

instead of

```
do [f]
```

[05:23](#msg567a2fca35e1a316162dedfb)When I put the function call in a block, run-all passed under both OS X and Ubuntu.

[05:24](#msg567a2ffe653b30761d75cd66)Though looking at the help text for

```
do
```

it seems that it shouldn't be necessary to put the function in a block.

[05:34](#msg567a32789606b15a055d58ed)The fixed tests are now passing on Travis

dockimbel

[07:05](#msg567a47b23acb611716ff8017)@PeterWAWood Yes, you need to pass a block to `do`, passing it a function directly is not allowed (leads to arbitrary arity to `do` and we want to avoid that).

PeterWAWood

[07:20](#msg567a4b3f9606b15a055d5a9c)@dockimbel Is that just for functions? The help text says argument to do can be any-type.

```
red>> ? do

USAGE:
    do value

DESCRIPTION:
     Evaluates a value, returning the last evaluation result. 
     do is of type: native!

ARGUMENTS:
     value  [any-type!]
```

[07:23](#msg567a4bef653b30761d75cf03)I can generate some strange results with do:

```
red>> do make object! [f: func[][1] f]
== make object! [
    f: func [][1]
]
```

[07:25](#msg567a4c8235e1a316162defad)Sorry, it's not strange but it works without the block.

[07:29](#msg567a4d454f069158055b8afa)This also works:

```
red>> f: func[i][2 * i]
== func [i][2 * i]
red>> do f 3
== 6
```

[07:31](#msg567a4dc53c68940269248212)The latter also compiles and runs happily.

dockimbel

[07:56](#msg567a539e3c68940269248272)`do` on function should just return the function value. Though, we might simply output a specific error.

pekr

[08:14](#msg567a57f80199d70069df69c8)What abou do on function behaving just like do on block? Would it make sense?

PeterWAWood

[09:13](#msg567a65b84f069158055b8d4f)@pekr I think the difficultly with do on function will come when there is a JIT compiler. (Based on @dockimbel's comment about wanting to avoid arbitrary number of arguments to do.)

[09:14](#msg567a65e60199d70069df6b96)@dockimbel I think that a specific error would be better than returning the function value.

dockimbel

[09:56](#msg567a6fcb3acb611716ff8421)@pekr Not really, a function has an execution context, a block has not.
