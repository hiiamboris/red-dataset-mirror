# Archived messages from: [gitter.im/red/red/welcome](/gitter.im/red/red/welcome/) from year: 2017

## Monday 2nd January, 2017

greggirwin

[21:24](#msg586ac504aa6be0472ffc1bcb)The `to-*` funcs have often been questioned, as to the value they provide. They are useful if you use `to-` with `help` to find them all. I believe Carl also once said that he thought it would help people, but later decided they really didn't. I use them sometimes, and they are handy as function args for use with HOFs and such.

[21:24](#msg586ac51e9d4cc4fc536ba1a3)The other question is what we gain by removing them.

endo64

[21:34](#msg586ac76d9e6f00e74aec5f03)I prefer to keep to-* functions because not all of them should be as simple as `to integer!`, some of them could do more than that in the future (something like to-dir) and we can extend by adding more of them. I also prefer same naming for my `to-something` functions.

iArnold

[22:01](#msg586acda7c895451b754a5b43)\[to-integer can be typed without use of the shift key]

greggirwin

[23:22](#msg586ae0ba7a3f79ef5dcb89c3)Also gives us the option to add refinements.

## Tuesday 3th January, 2017

meijeru

[08:53](#msg586b668baf6b364a2925638c)@iArnold Except on certain keyboards, mind you -- not every one uses en-UK (I admit that I do).

iArnold

[10:47](#msg586b8150c02c1a3959e0600d)@meijeru :-) Always those custom keyboards! http://cdn0.vox-cdn.com/uploads/chorus\_asset/file/2316278/clicky-keyboards-2\_2040.0.jpg

[10:48](#msg586b81789e6f00e74aef3f78)@Pekr Welcome Tobias!

Senenmut

[12:00](#msg586b927a9e6f00e74aef8806)i hate libaries

nicolas42

[13:03](#msg586ba106aa6be0472f000f3b)Could anyone tell me where the red system code is for the find function?

Senenmut

[13:06](#msg586ba1d9aa6be0472f0014e5)happy new year , especially to iArnold

endo64

[13:48](#msg586baba8058ca96737c1326c)@nicolas42 `runtime\actions.reds` ?

## Wednesday 4th January, 2017

PeterWAWood

[05:48](#msg586c8c9faf6b364a292b0118)@nicholas42 The code you are probably looking for is distributed amongst the files in runtime/datatypes

[05:49](#msg586c8cd8aa6be0472f053be2)For example, find for the string datatype is in string.reds

[05:50](#msg586c8d327a3f79ef5dd389f2)Find for block! is in block.reds

9214

[14:19](#msg586d046bc02c1a3959e777ed)Red will be ~90% compatible with Rebol, am I right? In which part it will differ? Parse, R/S, more datatypes, anything else?

maximvl

[14:19](#msg586d0483af6b364a292d3a8d)@9214 we only will know once it's completed, I guess

rebolek

[14:20](#msg586d04b2d99b1dd03d2edba2)There are already improvements that can’t be found in Rebol, like object ownership, reactive programming, macros, ...

maximvl

[14:21](#msg586d04d7aa6be0472f079b17)many things changed after Rebol was created, like hashes/maps are a must to have in a language now

endo64

[15:20](#msg586d12bb7a3f79ef5dd6223b)And VID has many change even the core concept is same. But I think we should consider the compatibility on functions, natives etc.

maximvl

[16:11](#msg586d1e9aaf6b364a292dd95c)@endo64 why should we? people who have Rebol experience can easily find their ways in Red

endo64

[17:05](#msg586d2b72af6b364a292e2683)Sure. I meant it is impossible to be compatible for new features like reactions etc. because they don't exist in Rebol.

greggirwin

[18:59](#msg586d460b9d4cc4fc537764a2)Red is highly compatible with a Rebol mindset and understanding. If you aren't coming from Rebol, you shouldn't need to think in terms of Rebol at all.

geekyi

[18:59](#msg586d462f9d4cc4fc5377650e)@9214 In general, it's mostly compatible with rebol 2 and 3

[19:00](#msg586d46539e6f00e74af80c32)Yep, like @greggirwin says as an expert and me from my newbie experience ;P

[19:01](#msg586d4673c02c1a3959e8fd3f)What's different in red can be mostly found in the red blog posts

## Friday 6th January, 2017

pr-yemibedu

[15:38](#msg586fba0e9e6f00e74a03ba38)was it ever planned to have such a list of the current features that set it apart from Rebol? Something like a page with What is new, what breaks, and what is removed. Being new but also being told that I can refer to the Rebol documentation for now is a little confusing to get the lure of not just staying with Rebol. And some posts on red-lang are long to tell about a small set of list points. I do like what you are trying to do.

rebolek

[15:46](#msg586fbbc6da229f8d5bf02657)@pr-yemibedu good idea. I will try to do some list. Maybe some wiki will be better?

9214

[16:31](#msg586fc65faa6be0472f170cca)@rebolek Yes please! Rebol is a little bit better in terms of documentation and "maturity", but Red brings to the table lots of new features and I worried that I may lost something if I'll stick to the R2 while learning the very basics (and later transition back to Red will be harder). A comprehensive list of planned and implemented features of Red will be very helpful.

maximvl

[16:36](#msg586fc79f5ffdeea723145f64)Red blog posts are the best source of this information for now

9214

[16:40](#msg586fc87b9e6f00e74a040ce3)@maximvl sure thing

rebolek

[16:55](#msg586fcc129d4cc4fc538342db)@9214 Rebol has advantage of being here for much longer :) But IMO Red is now used by more people. The documentation will get better.

[16:56](#msg586fcc2e9d4cc4fc5383436c)@maximvl Absolute truth.

dander

[19:30](#msg586ff0499d4cc4fc5384058e)@pr-yemibedu @rebolek there is already this page: https://github.com/red/red/wiki/Differences-between-Red-and-Rebol  
I have no idea how comprehensive it is, but it'd probably be good to add any things there

pr-yemibedu

[22:57](#msg587020d2af6b364a293c99cb)@dander that page should be referenced from a nice Red feature list page.

[22:58](#msg58702116af6b364a293c9aa8)@rebolek the main red page could have a link at the end of the opening paragraph to a wiki. Maybe something on wikibooks.

[23:00](#msg5870219caf6b364a293c9dbd)@maximvl probably no one disagrees where to source is located. just that it in not as quickly consumeable to first timers as the length of growth and maturiy increases.

[23:02](#msg587021ef5ffdeea723169627)last time I saw Rebol was over a decade ago at university. I just saw red today referenced from a nemerle chat.

rebolek

[23:15](#msg5870250aaa6be0472f196d51)@pr-yemibedu sorry, but what is nemerle chat?

[23:15](#msg587025209d4cc4fc5384ff74)you have good ideas, BTW.

pr-yemibedu

[23:15](#msg58702524da229f8d5bf29182)https://gitter.im/rsdn/nemerle

rebolek

[23:16](#msg58702555aa6be0472f196eff)Thanks

pr-yemibedu

[23:17](#msg5870258eaf6b364a293cb610)just another .net runtime programming language. it happen to be there was some cross language posting, which brought me to your world.

rebolek

[23:19](#msg58702617c02c1a3959f6b337)That’s nice, thanks. I love the stories how people discovered Rebol/Red.

[23:20](#msg587026275ffdeea72316aceb)It’s always interesting.

## Monday 9th January, 2017

dockimbel

[07:48](#msg58734038cbcb28177045c7ba)@9214  
&gt; I don't get why we need `to-type`shortcuts

It's not a big need, but they are helpful for:  
1\. Auto-completion support in the console or in an IDE  
2\. Discoverability for beginners (using `help` in console)  
3\. Faster code reading, as `to-` stands like a single word.

Those are not heavy gains and I have mixed feelings about keeping those wrapper functions or removing them, though, for now, I think the benefits are worth the extra space they take in the runtime library.

maximvl

[08:27](#msg5873495a6c1635643c03e7c3)@dockimbel could you explain why contexts are static? we had a little discussion here and it turns out that set-words don't create a binding in current context, but in the global one

[08:27](#msg5873497864d5fd7e16953482)by static I mean inability to add/remove words

dockimbel

[08:44](#msg58734d61074f7be763a9fae6)@maximvl If you can remove words from contexts, then some bound words could refer to contexts where they are not defined anymore:

```
obj: context [a: 2 b: [a + 1]]
```

If you could remove `a` word from that `obj` context, they `[a + 1]` would not be able to be evaluated anymore (it would just crash badly, unless you manually rebind it to another context).

Moreover, the position of a word in the context symbol table is used pretty much everywhere internally, both in Rebol and Red implementations, so it would not be feasible to remove that "slot", or in other words, you could "delete" the word from the object but the entry in the object's symbol table will need to stay or everything would collapse.

[08:48](#msg58734e6b300f220a66c49e52)For adding words, you can do that already using `make` and create a new extended object. Though if you need a datastructure where you can freely add/remove key/value pairs, then object! is not the right type, block!, map! or hash! are much better suited for that.

[09:10](#msg587353696c1635643c041c0d)Moreover, supporting extending objects in-place with new words is trivial for the interpreter and a challenge for the compiler, that's why it's not implemented in Red yet.

maximvl

[09:43](#msg58735b28074f7be763aa4312)@dockimbel regarding adding words I was thinking about a little bit different scenario

[09:44](#msg58735b64dec171b811c50238)

```
red>> c: context [x: 5]
== make object! [
    x: 5
]
red>> code: [x: 6 y: 7]
== [x: 6 y: 7]
red>> bind code c
== [x: 6 y: 7]
red>> do code
== 7
red>> c
== make object! [
    x: 6
]
red>> y
== 7
red>> x
*** Script Error: x has no value
*** Where: catch
```

[09:44](#msg58735b97dec171b811c502fe)I wonder if it possible to run code and collect all set-things to specified context

[09:44](#msg58735b9b64d5fd7e16959ae2)instead of global one

dockimbel

[09:48](#msg58735c7a64d5fd7e1695a03c)@maximvl Yes, that is what `make object!` of `function` are doing. We haven't exposed the `collect-words` R/S function at Red level yet, though it's trivial to write using a Parse rule. Though, the semantics of a set-word (or `set` native) is to change the referred value of a word in a context, not to extend that context (which is a different operation).

maximvl

[09:49](#msg58735cc3cbcb28177046754f)@dockimbel words can also be set with `set` and maybe other different ways

[09:50](#msg58735cd361fac5a03db4ae27)is it something it is possible to take care of?

[09:51](#msg58735d33300f220a66c4f944)ah, I see

[09:53](#msg58735d87074f7be763aa5562)@dockimbel and one more question - the `bind` with word argument feels confusing because behind the scenes it takes word's context and binds to it

[09:53](#msg58735d9c61fac5a03db4b2cf)don't you think it would be more clear to have something like this: `bind code context-of word` ?

[09:55](#msg58735e1cdec171b811c517f5)and `context-of` could also allow to inspect word's context and do stuff

dockimbel

[10:04](#msg58736031dec171b811c5246c)@maximvl `context-of`already exists, it's named `context?`.

[10:06](#msg5873609d6c1635643c046ecf)`bind` already accepts an object! or function! value as second argument, see `help bind`.

maximvl

[10:12](#msg5873620b64d5fd7e1695d3d7)@dockimbel nice, I probably missed it

```
red>> f: func [x y] [ probe context? 'x ]
== func [x y][probe context? 'x]
red>> f 1 2
func [x y][probe context? 'x]
== func [x y][probe context? 'x]
```

[10:12](#msg5873621661fac5a03db4cb92)so context can be function itself, interesting

dockimbel

[10:14](#msg587362756c1635643c0476c8)Right, from a type hierarchy perspective, you can consider that both `function!` and `object!` derive from a `context!` type (which actually exists, but not exposed to users).

maximvl

[10:48](#msg58736a84dec171b811c56416)@dockimbel since you mentioned types I would assume that `context?` checks the type of argument to be a `context!` as with other datatypes

[10:49](#msg58736a9c300f220a66c54879)and

```
red>> object? context? 'f
== true
```

[10:49](#msg58736ad264d5fd7e169607dd)means that `context` is `object` which contradicts saying `object derive from a context`

dockimbel

[11:41](#msg587376e0873d96e16d45282e)@maximvl `context!` is an \*internal* datatype, from user perspective, it does not exist, so that function will return the derived type (either object! or function! for now).

meijeru

[12:35](#msg587383a3873d96e16d4572d7)I wonder, how can `context?` return a value of `function!`type.

maximvl

[12:37](#msg587383ff61fac5a03db59304)so, to me `context` is key-value table which has bindings for particular words

[12:39](#msg5873846a6c1635643c0540b7)I would say that `function` has a context, but it doesn't really fit in my mind how `function` itself can be a `context`

[12:40](#msg587384bf873d96e16d457872)to me this part feels messy, all things mixed together instead of clear definition for what is `context`, what is `function`, what is `object` and how they all relate together

meijeru

[12:45](#msg587385facbcb281770477175)@maximvl If you look at the source of `%runtime/datatypes/structures.reds` it may become clear how these different items hang together. However, I don't find an anwer to my own question there...

maximvl

[12:52](#msg5873877664d5fd7e1696b13f)@meijeru so function also has context reference, makes sense, it's there but it's hidden and you need to keep it in mind

[13:26](#msg58738f8f61fac5a03db5da42)@meijeru do you know by chance where is a definition of `func` ?

[13:39](#msg5873929e074f7be763ab7d18)hm, so `bind` doesn't really bind block, it binds words inside

[13:41](#msg587392f461fac5a03db5ed02)

```
red>> f: func [x] [ x + y ]
== func [x][x + y]
red>> bind body-of :f context [y: 10]
== [x + y]
red>> bind body-of :f context [x: 5]
== [x + y]
red>> do body-of :f
== 15
red>> f 1
== 15
red>> context? first body-of :f
== make object! [
    x: 5
]
red>> context? third body-of :f
== make object! [
    y: 10
]
```

[13:41](#msg58739326dec171b811c648fe)and each word has a reference to context

[13:41](#msg5873932761fac5a03db5ee85)nice

[13:42](#msg5873932f6c1635643c059a10)I'm starting to understand things

[13:44](#msg587393a2dec171b811c64b7c)and `function` is really just a connection between context, which filled with arguments and a body which has words binded to this context

[14:03](#msg58739834300f220a66c6570f)small iteration mezz here, but I don't get how should I `bind` body to have an effect similar to `foreach`:

```
forskip: func [series skip body] [ while [ not tail? series] [ do body series: at series skip + 1 ]
```

[14:04](#msg5873985e300f220a66c65839)and output is:

```
red>> x: [1 2 3 4 5 6 7]
red>> forskip x 2 [ probe x/1 ]
1
1
1
1
```

[14:04](#msg58739881300f220a66c65933)so `x` in `body` still points to original one, and it's position doesn't advance

[14:07](#msg587399176c1635643c05bf17)ok, after playing with contexts seems like `foreach` doesn't bind body to another context, probably it does something like this:

```
forskip: func ['series skip body][while [not tail? get series] [do body set series at get series skip + 1]]
```

[14:07](#msg5873991e873d96e16d45fc2a)this one works as expected :D

[14:09](#msg587399b5074f7be763aba9ca)

```
red>> forskip x 2 [ probe x/1 ]
1
3
5
7
```

meijeru

[14:12](#msg58739a3bdec171b811c679a9)@maximvl `func` is defined in `%environment/natives.red`. NB it is a `native`in contrast to Rebol 2 and 3, where `func`is defined as a mezzanine as follows:

```
func: func [
    "Defines a user function with given spec and body."
    [catch]
    spec [block!] {Help string (opt) followed by arg words (and opt type and string)}
    body [block!] "The body block of the function"
][
    throw-on-error [make function! spec body]
]
```

repectively

```
func: make function! [[
    "Defines a user function with given spec and body."
    spec [block!] {Help string (opt) followed by arg words (and opt type and string)}
    body [block!] "The body block of the function"
][
    make function! copy/deep reduce [spec body]
]]
```

I leave it to you to consider the differences...

maximvl

[14:13](#msg58739a7d6c1635643c05cd97)@meijeru I see, pretty much a shortcut like `to-` ones, thanks :)

[14:14](#msg58739ac4dec171b811c67c26)@meijeru and the real source is in `runtime/datatypes/function.reds`, right?

meijeru

[16:16](#msg5873b740873d96e16d46c074)@maximvl `func` as well as `function` are convenient shortcuts for what could be done with `make function!` \[...], i.e. they create values of type `function!`. The full behaviour of values of type `function!` is indeed described in `runtime/datatypes/function.reds`.

DideC

[16:43](#msg5873bdafcbcb28177048da07)@maximvl Have a look to \*\*Rebol\** `forskip` source ;-)

geekyi

[18:07](#msg5873d14adec171b811c7f9b3):point\_up: \[December 23, 2016 3:09 PM](https://gitter.im/red/red/welcome?at=585cf7d2af6b364a29ea0fcd) :point\_up: \[December 23, 2016 5:01 PM](https://gitter.im/red/red/welcome?at=585d1235c5a4e0233bbfc361) :point\_up: \[December 23, 2016 5:47 PM](https://gitter.im/red/red/welcome?at=585d1cf9db9cafe9183a55c7) @maximvl discussion about static contexts for future reference

[21:09](#msg5873fbfacbcb2817704a61ee):point\_up: \[January 9, 2017 6:39 PM](https://gitter.im/red/red/welcome?at=5873929e074f7be763ab7d18)  
&gt; I'm starting to understand things

Quick! Write newbie notes before you understand it all! ;)

[21:09](#msg5873fc2061fac5a03db8a324)@geekyi feels still a bit new :/

## Tuesday 10th January, 2017

dockimbel

[05:02](#msg58746ad96c1635643c0aa37e)@meijeru  
&gt; However, I don't find an anwer to my own question there...

Could you point me to your question?

maximvl

[08:11](#msg5874973fdec171b811cc17da)&gt; I wonder, how can `context?` return a value of `function!`type.

@dockimbel his question was ^

PeterWAWood

[10:19](#msg5874b52ecbcb2817704e077e)@dockimbel :point\_up: \[January 9, 2017 8:35 PM](https://gitter.im/red/red/welcome?at=587383a3873d96e16d4572d7)

## Wednesday 11st January, 2017

dockimbel

[06:47](#msg5875d504873d96e16d526d5f)Thanks. So I guess I answered that above, `context!` type is not a first-class type, so only derived type values can be returned (object! or function!).

meijeru

[07:13](#msg5875dafc074f7be763b7df58)Yes, but `context?` has an argument of `word!` type, so my question is: which kind of words yield a result of `function!` type?

dockimbel

[07:14](#msg5875db38873d96e16d5288ce)@meijeru A local word in a function:

```
red>> do has [a][a: 1 probe context? 'a]
func [/local a][a: 1 probe context? 'a]
== func [/local a][a: 1 probe context? 'a]
```

meijeru

[07:35](#msg5875e035300f220a66d2ae26)Does that also go for the arguments (including refinements) of a function?

dockimbel

[07:35](#msg5875e053873d96e16d529f82)@meijeru For all the locally bound words, yes.

meijeru

[07:36](#msg5875e068cbcb28177054c40b)OK that is clear then :smile:

geekyi

[08:41](#msg5875efbd300f220a66d2f9e3)That is something that needs a double look to realize that it is a `function!` which returns a `context!` that references the function itself

[08:43](#msg5875f041873d96e16d52f4e7)Is a `/local` word like a closure in other languages?

rebolek

[08:45](#msg5875f0b1d99b1dd03d2fac76)No, local words are initialized on each call. There are ways to get closure-like behavior though.

geekyi

[08:47](#msg5875f105dec171b811d3e023)I see

rebolek

[08:55](#msg5875f31ddb9cafe9183c24a4)@geekyi you may want to read \[this](http://red.qyz.cz/safe-and-persistent-locals.html)

maximvl

[09:08](#msg5875f5f3074f7be763b85af6)@geekyi I suppose that it is safe to just use what `context?` returns in functions which want context and that's it

[09:08](#msg5875f605074f7be763b85b61)without making assumptions on what is actually there

endo64

[11:59](#msg58761e3d074f7be763b92d70)@dockimbel `context?` returns `system/words` for `unset!` values, is this desirable or just a side effect?

```
red>> same? system/words context? 'unset-value
== true
```

maximvl

[12:39](#msg58762790e836bf70102c9efb)looks like context field should be filled with something and `system/words` is the default

meijeru

[12:48](#msg58762986dec171b811d52044)In other terms, every word has a binding, even if it is to the unset value...

DideC

[13:27](#msg587632b8873d96e16d5457ae)The word `unset-value` must be loaded to be evaluated, so it must be bind somewhere !

endo64

[15:11](#msg58764b34300f220a66d5115d)`unset-word` appears in `system/words` when typed in console, so it is normal `context?` returns `system/words` for that unset! word, but I wonder if `context?` should consider the value is `unset` and returns `none`.

```
red>> probe context? 'unset-word
...
    caps-lock: unset
    num-lock: unset
    unset-word: unset
]
```

meijeru

[15:24](#msg58764e1fcbcb2817705746f2)The context is something else than the value, it is a collection of word-value pairs. This collection cannot be `none`, since it also contains other word-value pairs.

## Thursday 12nd January, 2017

dockimbel

[07:35](#msg587731dc300f220a66d9c303)@endo64  
&gt; context? returns system/words for unset! values, is this desirable or just a side effect?

No, `context?` returns system/words for `unset-value` word, the value (or lack of) of that word is irrelevant there, the context is a property of words only.

## Friday 13th January, 2017

virtualAlan

[01:10](#msg587828f8873d96e16d5f9ee8)might be helpful: I update it weekly: http://www.mycode4fun.co.uk/red-beginners-reference-guide - also adding new examples here: http://www.mycode4fun.co.uk/About-Red-Programming - my site seems to be all about Red just lately.

## Sunday 15th January, 2017

koba-yu

[06:16](#msg587b13a8e836bf7010467abc)I do not see the meaning of the \[description in the Red document](https://doc.red-lang.org/en/draw.html#\_source\_position) below:

```
== Source position 

Set-words can be used in the Draw code *in-between* commands to record the current position in Draw block and be able to easily access it later.
```

What does "current position" mean and what does this section want to tell?

PeterWAWood

[07:43](#msg587b2819cbcb2817706f9f0a)I'm

geekyi

[08:59](#msg587b39fb873d96e16d6db043):point\_up: \[January 15, 2017 11:16 AM](https://gitter.im/red/red/welcome?at=587b13a8e836bf7010467abc) I'm not sure, but possibly refers to `draw` being a dialect.

```
draw [
  position-of-thing: text "thing"
]
```

I agree that it is confusing. Any suggestions for a better wording?

[08:59](#msg587b3a0ae836bf701047096b)@koba-yu

dockimbel

[11:07](#msg587b57e3074f7be763d28bd7)@koba-yu  
&gt; What does "current position" mean and what does this section want to tell?

\_Draw code_ is a block! series, series have positions (also called \_index_ or \_offset_ in various documentation). So using a set-word! in Draw will set the word to the \_current_ block position (just after the set-word). Such reference can be later used to directly access the content of the Draw block from that specific position.

koba-yu

[13:07](#msg587b740e6c1635643c2fb256)@geekyi Thank you for your suggesting example!

[13:09](#msg587b747be836bf701047db98)@dockimbel Oh, make sense.

[13:09](#msg587b74a2300f220a66eda4e3)@dockimbel Thank you for your reply!

[13:10](#msg587b74d3074f7be763d2f8a5)I am trying to translate the document into Japanese but it takes some time. It has a lot of pages!

dockimbel

[13:12](#msg587b754c873d96e16d6e9721)@koba-yu You're welcome. Japanese support would be nice to have, I guess many Rubyists in Japan could be interested in Red.

koba-yu

[13:18](#msg587b769511e7a7f61d9ba934)@dockimbel I hope so, too. It is obvious that Ruby became popular in Japan because it has many Japanese documents and Web site about it. Please let me ask on gitter when I get a new question!

dockimbel

[13:18](#msg587b769fe836bf701047e3f0)@koba-yu You can see an example of set-word usage in Draw blocks in the \[Eve clock](http://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html) demo.

[13:18](#msg587b76c111e7a7f61d9baa01)@koba-yu Feel free to ask as many questions as you need. ;)

koba-yu

[13:19](#msg587b76f7300f220a66edaea3)@dockimbel Thank you! That demo is always interesting.

## Wednesday 18th January, 2017

CodeTortoise

[17:42](#msg587fa923300f220a66032ffe)Hello. I have come to be welcomed.

[17:43](#msg587fa93d074f7be763e8c1e7)Actually, that was an uncomfortable entrance.

[17:43](#msg587fa943e836bf70105e1488)Hello peeps.

rebolek

[17:43](#msg587fa95196a565f844096529)Hi @CodeTortoise, you are welcomed! :smile:

CodeTortoise

[17:45](#msg587fa9b011e7a7f61db23511)I feel like I found out about red/Red/RED? at the perfect time. I was about to dig into the Eve, take a bite into the future, then I realized a more interesting future is actively being worked on.

rebolek

[17:45](#msg587fa9ced99b1dd03d308a14)"Red" is right.

CodeTortoise

[17:47](#msg587faa43300f220a660336cb)The Red website is super interesting because \[almost] every blog post is a tutorial. I came to ask about what is the best way to get started and up to speed, but every link a click on I bump into another example.

[17:48](#msg587faa7cdcb66e4f767cdc34)Still, any recommended path? I know that reading a book cover to cover is not the most efficient way to learn a language, and I should spend as much time playing with it before learning everything about it. What can I look at that will make me dangerous?

rebolek

[17:49](#msg587faabe61e516c157917283)I think it depends what you want to do. Some people are super excited about GUI, other do not care about GUI at all, but find other parts great.

CodeTortoise

[17:51](#msg587fab3ccbcb2817708775c4)Well, the thing I find really interesting is that it is advertised as a full stack language. So, it can be used for systems programming, application programming, and general scripting. I guess the most satisfying thing would be to explore it's GUI capabilities.

[17:52](#msg587fab76873d96e16d853c3a)Without learning a library, I typically get stuck making console applications. I guess I don't really need to be so tied back anymore!

rebolek

[17:54](#msg587fabdc96a565f844096592)GUI is really easy to do. Look at some examples and feel free to ask in https://gitter.im/red/red/gui-branch

greggirwin

[19:17](#msg587fbf5f6c1635643c46f721)GUIs are fun to play with, and learn the VID dialect a bit, to see how easy it is to create GUIs. Then you may want to step back and do some console work. Get the basics down and understand the language fundamentals more, because it can seem quite different at first. Then you can dive into Red/System and see how the whole things works from the ground up.

[19:18](#msg587fbf84e836bf70105ea951)And welcome to the Red community!

CodeTortoise

[20:57](#msg587fd6a9e836bf70105f44a2)@greggirwin Thanks you! That seems like solid advice. I am interested in well, I don't know. Build things I think I need but aren't readily available or are just a little annoying to use, like a better pomodoro app. Red seems to be a better "language of thought" than a lisp, since it seems that ALL THE BATTERIES are a core part of the language.

greggirwin

[21:27](#msg587fddb2300f220a66046c66)Red is a \*great* language of thought. And if you don't like it, you can use it to build the language you want. :^)

geekyi

[22:12](#msg587fe847873d96e16d86c83a)@CodeTortoise learning and using rebol2 would not be wasted time I believe as a newbie

CodeTortoise

[22:27](#msg587febbc300f220a6604c2af)@geekyi Is there an advantage to learning rebol2? I mean, aside from R3 only being alpha? I know there is a lot more material for rebol2, but is the language more featured than Red?

[22:28](#msg587febfc300f220a6604c435)I am considering it since 90% combatability is still very high for what are essentially different languages.

geekyi

[22:28](#msg587febfecbcb281770891607)@CodeTortoise Advantage is rebol2 is very similar to red. Or kind of, the other way around

[22:29](#msg587fec3c300f220a6604c6d5)Red may diverge in the future, I don't know, but I don't feel I wasted time by learning it

[22:30](#msg587fec806c1635643c4827d0)Rebol2 is definitely more featured, mature, and stable than red, but the gap is closing fast

[22:32](#msg587fecfecbcb281770891b53)At the \*very* least, you'll understand some of the reasons for the design decisions in Red

CodeTortoise

[22:34](#msg587fed8d300f220a6604cdbf)I see. Actually, I am curious to try out Rebol2 if only for the little interface that pops up. Yeah, I think I will do that. Guh, J, Red, now Rebol. I may just have to give up Erlang for the month.

[22:36](#msg587fede911e7a7f61db3ebb7)@geekyi There is no way to retroactively reply to you. Hah. I shall give Rebol2 to my fullest attention, then return to do some damage with Rd.

geekyi

[22:38](#msg587fee67300f220a6604d0ed)&gt; Guh, J, Red, now Rebol. I may just have to give up Erlang for the month.

Careful.. I may suddenly start suggesting more to add to that list :p

CodeTortoise

[22:41](#msg587fef0a074f7be763ea61e5)@geekyi Honestly, I am just trying to build up enough expertise in alternative languages that would mitigate me having to use C++, Java, .NET stuff, Javascript... you the kind of languages I can list. I thought about Rust, but I kind of want to avoid that too.

geekyi

[22:45](#msg587fefff300f220a6604de5f)@CodeTortoise learning more is always better I believe. Don't avoid rust I'd say. J may be too steep of a jump if you haven't tried something like haskell before; but I could be wrong

[22:46](#msg587ff05d6c1635643c484504)I'm going to try out \[7 languages in 7 weeks](https://www.goodreads.com/book/show/7912517-seven-languages-in-seven-weeks) and it's sequel sometime (next month?). Let me know if you're interested.

[22:48](#msg587ff0a8dcb66e4f767e9b22)My goal is to replicate all of it in Red one day

greggirwin

[23:10](#msg587ff5f411e7a7f61db4198e)@CodeTortoise, learning R2 will not be wasted time. The languages are fundamentally compatible. There will be some differences, but if you get comfortable with the basic concepts of `words`, `series`, and the various datatypes, it will serve you well.

Even if you don't end up writing Red full time, it's a handy language to have around for building tools, generating code, parsing data, scripting, etc. And, as you noted, it's a great language for thinking in, which helps you with all your development.

## Thursday 19th January, 2017

loganmac

[02:29](#msg58802479873d96e16d8802db)Hey guys, I just discovered Red the other day. Wow. Exciting stuff. I'm also looking for as much information as I can, but I had a few questions:  
1\) Type system - it seems that Red is a dynamic language a la Scheme, is that true? If so, are there any efforts to add gradual typing? My current language of choice is Haskell and I'm wondering how to get the same level of "correctness" without having to rely on writing automated tests.  
2\) Is the GUI for mac in a state where it's usable? It seems most of the examples are for GUI but I'm a mac developer primarily.  
3\) What's the best way to learn enough to contribute? I'd love to see any articles on design philosophy or explaining the internals - especially Red/System.

PeterWAWood

[02:46](#msg588028a211e7a7f61db50403)@loganmac Welcome to Red.

1\) Values in Red are strongly typed. References to values are not constrained by datatype. Red function arguments can be typed but, with the current bootstrap compiler and the interpreter, these give runtime errors rather than compile time ones.

It is expected that the self-hosted compiler will provide some level of type checking.

[02:56](#msg58802adf873d96e16d881e78)@loganmac 2) @dockimbel has just written this in the Red channel:  
"See the macGUI branch, the work is almost finished, just needs some polishing and bugfixing."

[02:57](#msg58802b22cbcb2817708a2fc3)@loganmac 3) :point\_up: \[January 19, 2017 7:10 AM](https://gitter.im/red/red/welcome?at=587ff5f411e7a7f61db4198e)

geekyi

[10:34](#msg588096386c1635643c4b69f9)@loganmac  
&gt; 1) Type system -\[...] how to get the same level of "correctness" without having to rely on writing automated tests.

What do you mean by "correctness" ?

[10:36](#msg588096a5300f220a6607e3eb)Actually, I've used haskell and know what you mean approx. The point being, correctness isn't defined; you can go further than haskell

[10:39](#msg5880975311e7a7f61db742df)\*\*tl;dr\** Red doesn't sacrifice flexibility for correctness. The general philosophy being.. you add whatever features you need yourself

dockimbel

[11:27](#msg5880a28811e7a7f61db79556)@loganmac Gradual typing is planned to be supported by Red compiler, probably before 1.0.

greggirwin

[20:14](#msg58811e2911e7a7f61dbb0fe5)@loganmac, I'll tackle your third question, since nobody else has.

First, get familiar with using Red. A lot of notes here about that, but Rebol2 references are a fine source while more Red docs are ramped up. Understanding the basics (words and series, everything is data that is sometimes evaluated, etc.) will help. It's always good to question design decisions, but sometimes people will find Red and immediately think it needs to be changed to be more like Blub/X. Also, as a newcomer, you can contribute by pointing out what is unclear from your perspective. Some of us have lost that ability. :^) And ask questions. That helps everyone.

loganmac

[20:31](#msg5881222511e7a7f61dbb27d7)@geekyi and @dockimbel that's so awesome. Gradual typing is exactly what I want. I'd love to help with this if I can

geekyi

[20:44](#msg58812519519afee26b89c638)@loganmac Do you know of dependent types? http://red.qyz.cz/dependent-types.html example by @rebolek

[20:45](#msg58812569519afee26b89c781)Also, `?`, `??`, `source` and `reflect` are some of the most useful functions

## Friday 20th January, 2017

gltewalt

[06:51](#msg5881b37adcb66e4f76882579)Are room topics set? I've not seen a message upon joining red/welcome or red/red.

endo64

[06:55](#msg5881b47811e7a7f61dbdff3c)I see topic as "New to Red language? Ask any question about it here, move to red/help room for deeper help with your Red code." in this room on top of the page, is that what you mean?

gltewalt

[06:57](#msg5881b4f1074f7be763f3a6bf)Yes. I'm using the iPhone app, and it doesn't show a message upon join.  
It may be visible if I scroll up a thousand miles, but it shouldn't be that way.  
Checking...

[07:00](#msg5881b5a76c1635643c51faa8)Scrolling up just shows an indefinite history of messages. No topic.  
Tried rejoin, and no topic was shown.  
Bummer.

[07:01](#msg5881b5dedcb66e4f7688301c)Ok, first question: Why Gitter for newbies and not an IRC channel?

DideC

[09:12](#msg5881d49511e7a7f61dbeac36)Gitter: Probably because it can be link to github project.

[09:15](#msg5881d52111e7a7f61dbeb045)Rebolers used to use Altme (a nice Rebol Chat system), and still do so. I lke it so much (for a 10 years old apps, it's still very powerfull). But it's a bit "darknet" and an opensource project needs something publicly open. If not, you will be not there propably.

gltewalt

[09:47](#msg5881dcad519afee26b8d2b0e)I immediately notice too much diffusion (my opinion!)  
12 different Gitter rooms, twitter, Facebook, mailing list, and I see now a mention of an IRC channel that's probably mostly empty at this point, and not a standalone, slick website.  
By diffusion I mean scattering the advocacy and community building signal

endo64

[13:20](#msg58820ea66c1635643c53de81)Gitter is enough to follow whole Red development and community. You can see what happens on other channels (FB, Tw) here as people share them here first (usually).  
In Gitter, welcome, red, doc, help used mostly.

geekyi

[16:37](#msg58823ce1cbcb281770958a13)@gltewalt here in gitter is the place to talk :)  
&gt; Ok, first question: Why Gitter for newbies and not an IRC channel?

Gitter also has an irc-bridge, which I'm not sure if it works

[16:38](#msg58823cf3cbcb281770958a5a)@matrixbot hi?

[17:24](#msg588247dd074f7be763f6f8d7)Relevant xkcd :p http://xkcd.com/1782/

CodeTortoise

[19:45](#msg588268c2300f220a661219b6)Sooo. I am going through a Rebol2 Tutorial "The Easiest Programming Language" and I find it unreal. The random little things I can do just from the console incredible, at least on Windows.

[19:45](#msg588268d6d43728124e82320d)I am wondering if Red is close to the capabilities of Rebol2?

[19:46](#msg5882692ed43728124e823409)I know Red has the ambition of being a full-stack language, so it will definitely go beyond that eventually.

dander

[22:13](#msg58828b9dd43728124e83086c)@CodeTortoise the \[Trello Milestones](https://trello.com/b/FlQ6pzdB/red-tasks-overview) list is a good overview of the remaining things to get to 1.0. Note that there is some basic I/O already, just a bit limited for now.

greggirwin

[23:43](#msg5882a094cbcb28177097b2e5)@CodeTortoise, anything you can do with R2 will eventually be doable in Red, and a whole lot more. Most datatypes are there, I/O and networking are the next big things to come, as they are very basic in Red right now. The GUI and Draw systems are there, though a bit different in Red. Already Red is far beyond R2 in having a reactive GUI system. Look at some of the demos. The new things they're doing inside Excel are exciting, and the macro system is very powerful (also something Rebol doesn't have). With Red/System, you can work at the C level and do...anything. And that's all there today. Oh, and cross platform compiling, all built in.

[23:45](#msg5882a127300f220a66135a45)@geekyi, that XKCD is \*brilliant\*!

## Saturday 21st January, 2017

gltewalt

[00:24](#msg5882aa49dcb66e4f768de5da)Is Series the same structure, internally, as Lisp Lists?

CodeTortoise

[01:48](#msg5882bdd3dcb66e4f768e382a)@greggirwin Alright. I am pretty much sold on Red. I only hope to become good enough quick enough to start contributing to it, at least with apps of my own. This feels like a community of proper futurists, and I want to help build the future.

greggirwin

[02:32](#msg5882c820519afee26b92208a)@CodeTortoise :^) Just have fun. You will end up making great stuff.

[02:37](#msg5882c966dcb66e4f768e6872)@gltewalt, `series!` is a pseudo-type that covers a range of datatypes which can be accessed via a consistent interface. `Block!` is the closest thing to Lisp lists. If you do `? series!` in the console, it will list all the types that can be treated as a series. Some, like `string!` can only contain specific value types (`char!` in the case of `any-string!` types, `integer!` in the case of `binary!`, `tuple!` in the case of `image!`), while `any-block!` types can reference any value.

[02:44](#msg5882cb16d43728124e842ca8)Without going too deep right off, since you're new to Red, there are limitations that may not be obvious. For example, `path!`s (e.g. a/b/c) support values that aren't legal when used in a path's literal form. For example, you can use a `paren!` in a path (a very handy feature), but you can't currently use an `issue!` in a literal path. You can `make` a path with one though.

```
red>> type? second 'a/(b)/c
== paren!
red>> type? second 'a/#b/c
*** Syntax Error: invalid path! at "'a/#b/c"
*** Where: do
red>> make path! [a #b c]
== a/#b/c
red>> type? second make path! [a #b c]
== issue!
```

[02:46](#msg5882cb69cbcb28177098587b)Red gives you \*enormous* flexibility. Use it wisely. :^)

maximvl

[09:42](#msg58832d06519afee26b9385e3)@gltewalt no, it's not, series is common interface, `block` is most similar thing to lists, however internally it is more like double linked list with additional information (like pointers to `head`, `tail`, current position etc)

[09:47](#msg58832e1e074f7be763fb16f6)@gltewalt here's an example of what you can't do with lisp's lists:

```
red>> a: [ 1 2 3 ]
== [1 2 3]
red>> a: next a
== [2 3]
red>> a
== [2 3]
red>> a: back a
== [1 2 3]
red>> a
== [1 2 3]
red>> a: tail a
== []
red>> a
== []
red>> index? a
== 4
red>> a: head a
== [1 2 3]
red>> index? a
== 1
```

gltewalt

[23:10](#msg5883ea73074f7be763fe7b8b)👍🏻

[23:17](#msg5883ec01d43728124e892bdb)Thanks for some clarification

## Sunday 22nd January, 2017

gltewalt

[03:06](#msg588421bae836bf70107597de)Isn't Reactive programming the total opposite of what has been preached for at least 20 years? Loose Coupling good. String coupling bad.

[03:06](#msg588421d0e836bf701075987b)\*Strong Coupling

[03:18](#msg588424a1e836bf7010759f9b)I think that I don't understand it yet

geekyi

[06:00](#msg58844a6ce836bf701076257f)@gltewalt I don't understand what you mean, i.e. how reactive programming is strong coupling. If you do feel it is tho.. you can simply not use reactive programming. Also, suggestions of alternatives welcome! :)

gltewalt

[06:03](#msg58844b15074f7be763ffd34f)No, I just misunderstood it...  
I decided to keep quiet and start to read articles

geekyi

[06:04](#msg58844b6b074f7be763ffd4f8)@loganmac and others :point\_up: \[January 19, 2017 7:29 AM](https://gitter.im/red/red/welcome?at=58802479873d96e16d8802db)  
&gt; 3) I'd love to see any articles on design philosophy

On Philosophy, red is about being \[simple](http://www.rebol.com/cgi-bin/blog.r?view=0509)

[06:11](#msg58844d23d43728124e8aa2d4)Altho, what I think you want:  
&gt; What's the best way to learn enough to contribute? or explaining the internals - especially Red/System

Is to get quickly upto speed to contribute to the red codebase. Technically For Red/System, it's the official \[spec](http://static.red-lang.org/red-system-specs.html). But actually you're looking for an overall guiding principle. And just stating it's about being \*simple\*, doesn't feel enough?

[06:16](#msg58844e58d43728124e8aa741)Reading the other blog articles help. But a \*\*tl;dr\** is, \*for me personally\*:  
\*Steal ideas from others\*, and  
\*No rules set in stone*  
If someone else does it better.. you try to implement that in redbol ;)

## Monday 23th January, 2017

CodeTortoise

[01:15](#msg5885591fdcb66e4f7699ac3a)Serious Question: Where can I get the "Take the RED Pill" shirt worn by Nenad Rakocevic in his conference talk? You know, the one with the stylized letters and the E that resembles the stack in the icon?

gltewalt

[02:37](#msg58856c5bcbcb281770a358f4)I don't know, but you could tag him or message him

[20:53](#msg58866d5411e7a7f61dd5c79f)I recommend that we newbies try VSCode with its Red extension

greggirwin

[21:41](#msg58867875dcb66e4f769fd6d0)On coupling, you may find that you do things differently in Red. While I do have a lot of libraries that are shared withing a system, I have a \*lot* of apps that make up those systems. Rather than a more monolithic approach (maybe coarse grained is a better term), I build systems composed of loosely coupled scripts/programs. Within a given program, I don't worry too much about layering and encapsulation.

justjenny

[23:59](#msg588698d4cbcb281770a98838)just wondering - The superb and brilliant 'Red' in under one meg in size, but everyone is dribbling over this pimped up text editor that is what, 32 ish meg and then all its dependancies on top of that - whats it all about ?

## Tuesday 24th January, 2017

gltewalt

[00:02](#msg588699afd43728124e96d505)Which text editor?

justjenny

[00:04](#msg58869a00dcb66e4f76a0a0cd)VSCode

gltewalt

[00:10](#msg58869b7311e7a7f61dd6cf09)It isn't just for Red. It has extensions for many languages. It gives syntax highlighting, and depending on the language and extension, code completion and documentation lookup.

[00:14](#msg58869c6d074f7be7630b9647)https://mobile.twitter.com/red\_lang/status/788648326279340032

justjenny

[00:18](#msg58869d4ae836bf7010821ff5)yes, i know, have used it and its very good, does a lot - but my point is: we have a 'one meg' - tiny and fully functional language - but then we use this over sized text editor - what is the original Red dream ?

[00:22](#msg58869e5dd43728124e96ef4b)whats the point of having a portable language like Red, and then encumbering it with an over sized resource hungry text editor

[00:28](#msg58869fb211e7a7f61dd6e661)I thought we were trying to get away from the resource hungry 'Visual studio' style stuff - but it seems many really want to be part of it.

gltewalt

[00:35](#msg5886a159c0de6f017fe1cbb5)An editor / ide isn't a dependency, it's a convenience.  
There are native Red editors?

dander

[00:39](#msg5886a233c0de6f017fe1cf9d)There has been a bunch of discussion around building an IDE with Red, where one of the goals would be a lightweight footprint, and I think there is a lot of interest in that. It's just a big project though, and I think that based on the current available editors, people just need to decide for themselves what kind of size / capabilities tradeoff they are willing to make

[00:41](#msg5886a2a9d43728124e970532)I probably shouldn't speak for the Red team, but my sense is that the decision to add support to VSCode was based on the ease of implementing a plugin for it, and its level of popularity

justjenny

[00:43](#msg5886a319e836bf7010823790)yes, i know, just, being a bitch - I know it is all about preferences. and yes its all about getting Red out there.

dander

[00:48](#msg5886a443d43728124e970ca6)I think it's a pretty valid question actually. It feels like the editor defeats the purpose of having such a lightweight toolchain. But I guess it's just one piece of the puzzle - maybe just the piece that will lead to everything else getting smaller/leaner

justjenny

[00:56](#msg5886a623c0de6f017fe1e0da)yes, i worked using 'visual studio' for a few years, so am not a fan - so am a bit biased about VSCode.

[00:57](#msg5886a662dcb66e4f76a0e0a2)but, if it helps some, then its ok.

gltewalt

[00:57](#msg5886a66611e7a7f61dd7088d)Work on both.  
I don't think that the lumbering industry is going to rise up out of its chair to use Reds future tiny-footprint editor, but they might experiment with it if the can use Atom or Lighttable or VSCode.

justjenny

[01:03](#msg5886a7c7d43728124e971deb)@gltewalt yes, i agree 100% about it being a 'lumbering industry' been in it for a lot of years, still using Cobol in my place - its about preferences, i know. i'm just making my point - and apreaciate your point also .

greggirwin

[01:56](#msg5886b45bc0de6f017fe21b40)There is a distinction, as well, in what developers need on their systems, versus what users/servers need for use and deployment.

[02:04](#msg5886b619cbcb281770aa0ec1)We'll build the tools we need for ourselves. I did an experimental code completion editor for R2 many years ago, and I think Bolek or someone else has done something for Red. For FullStack, it's a harder question, but Red, itself, won't be the roadblock in what tools can be built. Only our vision of what we need, and the time (justified) to do it.

Chatting with my son recently, he noted that "jump to definition" is a useful feature (he never needed before) now that he's in a new place where he has to learn a large, existing code base. I noted that I first used that feature in QB4.5 in 1989. ;^)

justjenny

[02:04](#msg5886b646c0de6f017fe22202)@greggirwin yes, i know and agree, but why is this VSCode on the Red site - of course its a choice and its up to you. but what's it got to do with Red ?

greggirwin

[02:07](#msg5886b6e1c0de6f017fe22410)It helps tick up interest I think, because some developers don't see the beauty in small and simple, seeing it only as spartan. They want some kind of shiny, and this might be enough to get them to look at Red, where they would otherwise write it off at a glance.

[02:08](#msg5886b703074f7be7630c1bc5)Ask the Red marketing department. :^)

justjenny

[02:09](#msg5886b75bcbcb281770aa126c)Red is slick, tiny, but fully loaded, this VsCode is just a pimped up text editor, but you said it all

greggirwin

[02:09](#msg5886b763dcb66e4f76a128c1)And it does show that other editors can be made to work with Red.

justjenny

[02:09](#msg5886b76c074f7be7630c1dd2)ad i get it

greggirwin

[02:09](#msg5886b76f519afee26ba3d78e)We agree.

gltewalt

[02:10](#msg5886b794519afee26ba3d826)I think that the creator wants it to spread.  
I would say, "Be careful what you wish for", but it's his baby.

greggirwin

[02:11](#msg5886b7e1c0de6f017fe227aa)It needs to grow enough to be sustainable. Once we get there, we can freely draw a harder line on purity.

justjenny

[02:12](#msg5886b816c0de6f017fe22813)of course - got it

greggirwin

[02:13](#msg5886b83f074f7be7630c207a)But we all want different things, and part of Red's power is that people will "build to suit".

[02:15](#msg5886b8a8cbcb281770aa1868)What \*may* be controlled is the core, and the fundamental design. Still, always hard to hold the reigns and dig in your heels once the horses smell the hay...or something.

gltewalt

[02:15](#msg5886b8db11e7a7f61dd75959)What does Nenad want?

[02:16](#msg5886b911c19662f1537f4516)It can be disturbing to watch a language explode in popularity. I watched it happen when Ruby on Rails was introduced.

greggirwin

[04:59](#msg5886df43074f7be7630cc353)I watched it happen with VB.

[05:02](#msg5886dfefdcb66e4f76a1cf2a)The editor in R2 was custom all the way down, because the whole GUI system was. By using native widgets, Red faces different challenges in building a custom editor. From early experiments people are doing with Draw and rich text, it will surely be possible though.

gltewalt

[05:16](#msg5886e33c11e7a7f61dd8014e)I left shortly after the explosion. Just revisited it this past summer.

DideC

[08:54](#msg5887163bcbcb281770ab97d0)I'm sure an editor will be integrated to the system (like Rebol2/view has). Seing what is planned for the console in 0.6.3 (syntax coloration), it will probably be more powerfull. Probably more like an IDE, but lightweight ;-)

mikeparr

[09:03](#msg58871878e836bf7010843b4a)It is actually quite hard (IMHO) for beginners to run Red from their favourite editor. (I recall that there was a page about editor integration, but can't find it now). I know people use Sublime, but strictly, that is not free. I'm talking about e.g. notepad++, Geany. Can we publish the instructions to integrate? (Incidentally, I'm a big fan of VS with VB, for me the main benefits are in interactive debugging, and GUI creation)

maximvl

[09:25](#msg58871da4e836bf7010845a92)@justjenny language has nothing to do with IDE/Editor

[09:26](#msg58871dc2dcb66e4f76a3015c)you can use your favorite emacs/vim/acme/ed/sam/sed

DideC

[09:34](#msg58871fa5c19662f153812fc7)What does "integrated" mean ?  
I use Textpad. It starts in 0.5s (not the 10s of VSCode). I have Rebol syntax coloring that helps, but I could work without. I just configured a few commands to "Interpret" or "Compile" my script. Thats' all.  
I think anybody can do that for it's prefered editor, if he would like to read the its doc and take some time to do it.

[09:34](#msg58871fb4cbcb281770abc776)Sometimes, I just use Windows notepad, if there is nothing else : that's a text editor !  
"Young" people tend to be too accustomated to IDE helpers. But notepad and a Red console could be enough to start.

maximvl

[09:36](#msg5887200ec19662f153813253)@DideC to me "integrated" is when it's (almost) impossible to use language without it

[09:36](#msg58872017519afee26ba5ae24)like Smalltalk, Java

[09:36](#msg58872038c19662f15381388b)luckily there are not much such languages around

mikeparr

[09:53](#msg588723ffe836bf7010848632)@DideC - you are correct in a way, but asking someone who wants to try Red to configure their editor, from scratch? Barrier is too high for the uncommitted user. Could we publish how to configure a particular editor? (NB textpad is not free, I think)

PeterWAWood

[11:23](#msg5887392ac0de6f017fe49c3a)I feel that because Red is already so functional it is easy to forget that Red is still Alpha and has some way to go to be the finished article. It really is too early in Red's evolution to be attracting uncommitted users.

DideC

[11:31](#msg58873b03c0de6f017fe4a609)Agreed. There is important missing parts. We tend to forget that.

mikeparr

[13:05](#msg58875126074f7be7630f27c6)@PeterWAWood Yes, I understand re uncommitted users.

gltewalt

[16:08](#msg58877c03e836bf7010869aef)But, there's Try Red in browser

maximvl

[16:49](#msg5887859ee836bf701086e5f0)I think it's outdated, not sure though

geekyi

[20:12](#msg5887b51e11e7a7f61ddd4500)@gltewalt which? I think it's been down since about the beginning of the year. \*Or since the ddos attacks*

gltewalt

[20:47](#msg5887bd63c0de6f017fe8137e)Probably that one. Haven't looked in awhile

## Wednesday 25th January, 2017

CodeTortoise

[20:21](#msg588908e7c0de6f017fefbeed)If I wanted to create a website, what would be the better tool, Rebel or Red? Also, is there a recommended "stack" for using Red for web development?

geekyi

[20:33](#msg58890b8b519afee26bb05e3e)@CodeTortoise Red is alpha remember? Nope. I think by "stack" you mean a web framework like you have in other languages?

[20:34](#msg58890beddcb66e4f76aee60e)One of the goals is to do away with such unneeded abstractions. But you can take a look at things like `Lest`, `Draem`, (thing I don't remember). Also checkout `cheyenne` web server

[20:36](#msg58890c69e836bf70108fe241)Less layers of abstractions. For example, cheyenne works like a full stack web server and scripting engine based on rebol. Check it out

CodeTortoise

[20:43](#msg58890e00c0de6f017fefe28f)@geekyi Alright, I shall stop asking for things from Red until the big One-Oh. Anyways, R2 has got me hooked, and I am okay with getting to know it for a bit longer.

I think what I am looking for is something along the lines of a static-site generator. I haven't actually done any web development, but I am thinking about starting in probably the least convenient way. Mostly, I just see all the sites that were built with Rebol that are still active, and I hope it might be an easier entrance than some of the other tools.

geekyi

[20:45](#msg58890e5fcbcb281770b6b8c5)@CodeTortoise \[`Lest`](https://github.com/rebolek/lest) is a static site generator by @rebolek. There are others too

[20:46](#msg58890e93cbcb281770b6b9ca)For something simple like that, (something like `Lest`) should work with Red too, I've not tried

[20:46](#msg58890e9dc19662f1538d3541)You can also try writing your own

CodeTortoise

[20:53](#msg58891051e836bf70108fff9d)@geekyi Yeah, I need to get off the tutorial train and start doing some real thinking anyways. Thank you for the response.

## Thursday 26th January, 2017

endo64

[07:46](#msg5889a969e836bf70109362a9)You can try Cheyenne web server as a Rebol application platform, it is very cool and fun.  
OTOH, you can add Rebol executable to your web server (IIS, Apache or NGINX) as a CGI then use to generate your web pages.

rebolek

[07:47](#msg5889a9a161e516c1579248ed)`Lest` is currently R3 only, Red version is planned.

PeterWAWood

[07:58](#msg5889ac0bc19662f15390cf78)@endo64

```
nginx
```

does not support CGI. You can get nginx to forward CGI requests to an upstream server. You can use nginx to serve static files (e.g. html pages, javascript and images) and have it forward cgi requests to Cheyenne (or another lightweight web server). In tests, I have forwarded requests directly to Rebol TCP/IP servers using nginx simple load balancing.

[08:03](#msg5889ad53e836bf70109375c5)Something like \[OpenResty](https://openresty.org/en/) may be possible though.

endo64

[08:22](#msg5889b1b5e836bf7010938bb9)Yeah, NGINX supports FastCGI only but R2/Core requires SDK license for fastcgi.

## Friday 27th January, 2017

CodeTortoise

[06:17](#msg588ae60cfba5bfea06940c96)I am not sure this is appropriate to ask, but I am curious anyways: What is your (aimed at anyone who sees this) favorite language to program in? I am at the moment learning Rust and coming back to Red is like, cooling my brain on ice after frying it with new information.

endo64

[08:09](#msg588b004fc0f28dd8624bdc9d)My primary languages at work are Rebol 2 and PHP. Currently my favorite language is Rebol 2 (didn't use R3 much) but it will be Red soon when some of its core components ready (like IO, Networking etc.)

geekyi

[15:23](#msg588b660e1e4d4bd9629e00d1)@CodeTortoise I have no favourite, but assuming I'm the only one coding (i.e. no collab); for one-off calculations, there is `J`, for unit conversions: `Frink`, the `Rebol` family is my new favorite for parsing and data manipulation (and experimenting with lang construction!). I'm at a language learning phase, so this list would keep increasing probably

[15:25](#msg588b6652e836bf70109bb1f9)Safe to say `Rebol` is my overall fav.

CodeTortoise

[15:57](#msg588b6dfa4c04e9a44e3aa1d7)@geekyi Wow. I remember stumbling on Frink while looking for programming tools on Android. Glad to see the guy behind it is still cranking out updates.

[16:00](#msg588b6ebae836bf70109bdc6f)I like J. I think it's the mathy language I will eventually need to learn. Probably next to Julia. Yeah, Rebol is hitting all the fun spots in my brain. For now, my "necessarily serious" language that I am learning is Rust. For my own enjoyment, Rebol and Red is what keeps me next to my computer much of the day.

greggirwin

[20:47](#msg588bb1d6dcb66e4f76bc5dc7)@CodeTortoise. R2 has been my favorite language for a long time, and Red makes it even better. I keep looking at new things, and will apply them when needed, but Redbol langs are productive and really fun to play with. When I have to work in something else, I feel the loss of datatypes most profoundly I think.

With my admitted bias, because I use it daily and it is the most natural to me now, I can say that I haven't tired of it in 16 years, nor outgrown it. Everything has limits of course.

CodeTortoise

[22:26](#msg588bc90a4c04e9a44e3ca696)@greggirwin I find that incredibly reassuring. For awhile I've been exploring a lot of languages, not really going deep into any, except C++, thinking I need to be some kind of polyglot. Yet, it seems that a lot people spend their career writing a majority of their work in one language, like C, lisp, Ruby... Haskell. I think I am fine no longer dithering. There is a wealth of resources to learn R2, and by the time it becomes really outdated, Red will probably be at 1.0 Okay, no more off topic things from me.

greggirwin

[23:58](#msg588bde9d1e4d4bd962a0a416)It's a good topic to bring up, because we only have so many hours in the day to choose and learn tools. Red is a handy language to have around, and complements other tools well. It's excellent for parsing and transforming data, and code generation. I do that a lot.

## Saturday 28th January, 2017

greggirwin

[00:05](#msg588be0484c04e9a44e3d02f6)As you evaluate languages, look at your needs and make a matrix. Do you need to write server side stuff? GUIs? Mobile apps? System apps? Device drivers? Tests and testing tools? Parsers or text processing? ETL? Glue one thing to another? Shell-type scripting? What OSs or hardware? Integrate with XYZ?

When you fill in a box for a tool/lang, don't just mark X. Instead, give it a grade or 1-10 rating at how effective it is for each of your needs. Add weighting if you care to. Sum up and see where things fall. Add new tools to it when you find them and see if something knocks off your current leaders.

gltewalt

[04:45](#msg588c21cde836bf70109f096e)Favorite languages to dabble in (as I'm not very talented at programming), have been Ruby, Common Lisp, and recently Rebol.

On the menu are Elm, Elixir, and maybe... Haskell.

I've "dithered" to varying degrees with:  
C, smalltalk, python, JavaScript, basic, C#, Visual Basic (vba and vbscript), powershell, AppleScript (cringe), Ruby, Common Lisp, and Rebol.

I like learning concepts. Especially new concepts that are considered stumbling blocks in whichever language I'm trying out.

My last long term job - I was tasked with maintaining a VBA code base and adding new features where I could. Not my favourite, but better than data entry.

[04:49](#msg588c22bfdcb66e4f76bdffb2)Though I've never felt very good at programming, I just can't leave it alone. I'm drawn back all the time.

[05:05](#msg588c268b1e4d4bd962a19f88)(End of TMI)

geekyi

[06:41](#msg588c3d142ff29dec0647561d)@gltewalt @CodeTortoise &amp; others: if you want to explore together and share the knowledge, let me know. I've downloaded and played with some of the interpreters `Elixir` and `Rust` is on my todo list

gltewalt

[22:51](#msg588d2058dcb66e4f76c20f60)👍🏻

## Friday 3th February, 2017

geekyi

[20:51](#msg5894ed3aca6c6eb44941611c)Had problems signing in: https://twitter.com/gitchat/status/827577653246955520

greggirwin

[21:05](#msg5894f0ab73e8cb0a0912b4e4)Me too.

## Monday 6th February, 2017

gltewalt

[05:57](#msg5898103821d548df2ccf427d)Suppose I wanted to split an integer of two digits and add the two digits together

[05:58](#msg5898106af045df0a220f2695)are there any unusual functions that would help me along?

PeterWAWood

[06:16](#msg589814bb6b2d8dd55207afac)@gltewalt Integer values are scalar values and cannot be split. You would need to convert the integer to a

```
string
```

or

```
binary
```

to split the digits.

Most people would use simple maths to spilt a two-digit integer and add the two digits

```
i: 21 (i / 10) + (i % 10)
```

gltewalt

[06:19](#msg5898158c6018ccd65275f7aa)Here I was all thinking about Parse and coverting strings back and forth... So simple. Thanks, Peter

greggirwin

[17:49](#msg5898b7381465c46a562cc075)@PeterWAWood, is the current behavior of returning an int when dividing 2 ints locked down now, or is it still under discussion whether to return a float/decimal?

rebolek

[17:52](#msg5898b7c4fef1d2de52a93273)I hope it is locked.

greggirwin

[17:53](#msg5898b80400c00c3d4f02d991)I hope it isn't. ;^)

## Tuesday 7th February, 2017

PeterWAWood

[03:38](#msg58994132f045df0a221612f6)@Gregg @rebolek I don't think the behaviour is locked down at all. I used the current behaviour in the example because it makes a lot of sense in the context of the question. (I think it feels natural to somebody like me with a background in languages that having strongly typed variables).

[03:39](#msg5899417aaa800ee52c605db1)Saying that I feel the need is to have both a divide which returns a fractional answer and one which returns an integer.

gltewalt

[21:50](#msg589a412e1465c46a5635b9ee)Is Red/Rebol averse to recursion ?  
I was trying a few things and it was blowing the stack

cloutiy

[22:18](#msg589a47cf21d548df2cdca473)Where is the best place to for me to post about red issues? when trying to start red I get:  
`error while loading shared libraries: libcurl.so.4: cannot open shared object file: No such file or directory`

[22:22](#msg589a48bf21d548df2cdcaa07)Nevermind!!!! Iguess itwould helpto red the \*note* thatIneed to install the 32 bit libcurl library.

JacobGood1

[22:39](#msg589a4cb96b2d8dd552151e63)@gltewalt I don't think there is any tail call optimizations if that is what you are asking

gltewalt

[22:42](#msg589a4d4d872fc8ce62079547)Yeah

JacobGood1

[22:42](#msg589a4d5d1465c46a56360a0f)@cloutiy look right below the downloads, http://www.red-lang.org/p/download.html

## Wednesday 8th February, 2017

greggirwin

[04:53](#msg589aa467aa800ee52c681ea9)@gltewalt, as @JacobGood1 said, there is no TCO. Other than that, there is no recursion aversion.

## Friday 10th February, 2017

gltewalt

[06:34](#msg589d5f07de50490822acc998)Opinions wanted on how to handle integer changing to float

[06:35](#msg589d5f1f6b2d8dd5522568db)

```
Red []

drt: function [
    "Returns the Digital Root of integer!"
    n [integer! float!]] [1 + ((n - 1) % 9)]

; 111111111111 should equal 3 with inclusion of float!
print drt 111111111111
; 1234567891234 should equal 1 with inclusion of float!
print drt 1234567891234
; 12345 should equal 6
print drt 12345
```

[06:36](#msg589d5f71872fc8ce62180d1d)Normally a digital root is for Integers, but it blows up if too big of a number is given to the function - without allowing for float!

[06:38](#msg589d5ff0de50490822accca5)Should I just let it throw an error, let it return the correct value (before the decimal place), or try a catch/throw type of thing?

[06:39](#msg589d6013872fc8ce62180f70)I realize that integer is supposed to be of a certain range

dockimbel

[10:47](#msg589d9a3a872fc8ce62193f07)@gltewalt `integer!` datatype is an unsigned 32-bit integer value. If you input an out-of-range value, it will be promoted to a 64-bit float. Support for arbitrary long numbers (big-number) is planned but not implemented yet. A contributor started working on it, but I haven't heard any news in a while about it.

[10:49](#msg589d9ab3de50490822adeed9)You can use `to integer!` to force the result to be of `integer!` type

gltewalt

[19:07](#msg589e0f77aa800ee52c7b7fd3)Are you thinking about native support or using the Gnu MP ?

[19:08](#msg589e0fb921d548df2cf164b1)Or homegrown support

[19:20](#msg589e1285f045df0a222ff1b3)It was rumored that you want to stay away from dependencies

[19:26](#msg589e13d9aa800ee52c7b9d28)@dockimbel my first inclination was to use to-integer to force result back

## Saturday 11st February, 2017

dockimbel

[07:27](#msg589ebccfaa800ee52c7e97ab)@gltewalt Homegrown support, though, GMP could be integrated as an extension (requires modules support, so for Red 0.8.0).

9214

[18:07](#msg589f52f91465c46a565085d8)Sup guys, I've gathered all known resources about Red and Rebol into one \[.org gist](https://gist.github.com/9214/784e7f7af2342f117bc67a8e2698855b), additions and suggestions are welcomed!

maximvl

[18:13](#msg589f5431f045df0a223575a5)@9214 Good job! Thanks!

[18:13](#msg589f543ef045df0a2235761f)btw link to `hostilefork` blog is broken :D

9214

[18:13](#msg589f544b1465c46a56508d20):O

endo64

[18:38](#msg589f5a1600c00c3d4f26bebd)@9214 Very nice work!

## Monday 13th February, 2017

virtualAlan

[00:47](#msg58a1022421d548df2cfea2e6)  
Also added more examples here .... http://www.mycode4fun.co.uk/About-Red-Programming  
And lots more here .... http://www.mycode4fun.co.uk/red-beginners-reference-guide  
Also plenty other new Red things ....  
Regards .... Alan.  
&gt;

maximvl

[01:27](#msg58a10b8921d548df2cfec7ba)@virtualAlan nice one, thanks for sharing!

virtualAlan

[01:40](#msg58a10e94de50490822bdab12)thanks @maximvl just hope its helpful

maximvl

[01:40](#msg58a10ea5aa800ee52c88e1c7)I'll try it later

greggirwin

[05:37](#msg58a1462800c00c3d4f2f1a34)Thanks @9214 and @virtualAlan! Keep up the good work in helping others.

geekyi

[13:51](#msg58a1b9f4f045df0a22401252)@geekyi wants to try out @virtualAlan's editor but is in process of moving :(

virtualAlan

[23:46](#msg58a2453b238b1dae57068fd6)Thanks @greggirwin - Is @geekyi really moving, or just not a fan ? only kidding.

## Wednesday 15th February, 2017

mikeparr

[09:04](#msg58a419801465c46a56691744)@virtualAlan I really like your material!

virtualAlan

[23:46](#msg58a4e84d872fc8ce623f6584)thanks @mikeparr

## Friday 17th February, 2017

lpvm

[14:31](#msg58a7092a0ad50ac3152b2f4d)I want to load a png image, modify it with poke and save it under new name. Tried `img: load %c.png`

[14:31](#msg58a709330ad50ac3152b2fa1)probe image? img

[14:31](#msg58a709341465c46a5679ebb8)true

[14:32](#msg58a70981de50490822de162a)Is it the way to load it? or use /as png refinement? What type of image is it assumed?

[14:33](#msg58a709bb00c00c3d4f503a44)Then to save it, just `save %c1.png` img

[14:34](#msg58a709e921d548df2c20eb26)seems to be a png file, so what is the /as png refinement under save for?

meijeru

[15:33](#msg58a717c021d548df2c214bdb)@lpvm Good question! I used to think it was necessary. Perhaps the `.png`extension is enough to indicate the format to the run-time. In other words, `/as` would only be needed if the extension provided no clue. Note that values of type `image!` contain no indication of any external format, they are "raw" series of pixels.

[15:38](#msg58a7190000c00c3d4f50a6bd)I did some tests, and saving to `.jpg` makes JPEG format. Saving to `.txt` produces a `mold` of the image! I speculate that any other non-picture extension does the same. To be confirmed by @dockimbel. Another candidate for the guru :smile:

lpvm

[16:02](#msg58a71e8df045df0a225e1346)@meijeru: Nice, thanks

[16:18](#msg58a7225021d548df2c2194e2)In Linux 64 bits, when running `$ ./red-16feb17-878e22b` for the first time (compiling) it complains about `~/.red/console-2017-2-16-60339: undefined symbol: dlopen`

[16:18](#msg58a7225c21d548df2c219512)what should I need to install to make it work

[16:18](#msg58a7225dde50490822deb9f2)?

ghost~5680c5f416b6c7089cc058a5

[16:26](#msg58a724461465c46a567aa9d5)@lpvm Which linux distro are you using?

[16:27](#msg58a724610ad50ac3152be5f1)BTW, about this issue, there is discussion here - \[February 17, 2017 1:41 AM](https://gitter.im/red/red?at=58a6078e21d548df2c1baa30)

lpvm

[16:44](#msg58a7286a21d548df2c21bfa6)@nc-x I'm using Void Linux

maximvl

[16:46](#msg58a729001465c46a567aca9a)@lpvm now I wonder what is Void Linux and why are you using it?

lpvm

[16:48](#msg58a72952f045df0a225e6023)@maximvl I save you some searching: http://www.voidlinux.eu/

maximvl

[16:48](#msg58a7296ff045df0a225e608a)@lpvm I can search it, but I'm interested in your opinion

lpvm

[16:48](#msg58a729701465c46a567acd02)Simple, BSD like, no systemd, rolling release

maximvl

[16:49](#msg58a729930ad50ac3152c06f8)for a few years I was using Funtoo, which is kinda similar

[16:49](#msg58a729ab0ad50ac3152c07fc)but it was created by the guy who created Gentoo, so he knows what he is doing :)

lpvm

[16:50](#msg58a729bdf045df0a225e627e)I used Slackware before, but got tired of not having binaries for third party software, or slackbuilds wouldn't work anymore with current

maximvl

[16:50](#msg58a729d50ad50ac3152c0972)well, almost everything is better than Slack I would say :D

lpvm

[16:50](#msg58a729eff045df0a225e63c7)Yes, I ran Gentoo too, circa 2006, know Funtoo but never went to it. Don't want to compile everything

[16:51](#msg58a72a05872fc8ce624bac54)Try voidlinux!

maximvl

[16:51](#msg58a72a1621d548df2c21cafe)yeah, compilation is pain

lpvm

[16:52](#msg58a72a57872fc8ce624bae58)Void was create by an old NetBSD developer. So, it's even more BSD like than Slack

greggirwin

[19:54](#msg58a754eb0ad50ac3152d11ae)@lpvm and @meijeru , you can do `source save` and see the code, because it's a mezzanine. And, yes, it looks through the codec catalog for a matching extension if you don't provide a format with `/as`.

## Saturday 18th February, 2017

Senenmut

[22:21](#msg58a8c90621d548df2c2966be)Hi there. Forget voidlinux.

[22:24](#msg58a8c98021d548df2c296a4b)Ther is only one linux that is truly "Rockn Roll". Its called MX16 Linux. Pure POWER. And great forum for support. Give it a try and i am shure you realize. Its a debian style.

[22:28](#msg58a8ca9b00c00c3d4f58bc09)Trust me , i mosttimes know what i say. Sledge Hammer

lpvm

[23:01](#msg58a8d2640ad50ac31533ca3d)@Mennohexo It's debian based, Void is not based in any. MX is infected with systemd, Void is not. Good luck.

## Sunday 19th February, 2017

gltewalt

[07:42](#msg58a94c69aa800ee52cb53b54)Kali GNU/Linux Rolling 64-bit

```
-=== Red Compiler 0.6.1 ===- 

Compiling /root/rebol-core/environment/console/console.red ...
...using libRedRT for Linux
...compilation time : 240 ms

Target: Linux 

Compiling to native code...
*** Compilation Error: undefined symbol: red/unicode/decode-utf8-char 
*** in file: %/root/rebol-core/environment/console/POSIX.reds 
*** in function: exec/terminal/fd-read
*** at line: 235 
*** near: [
    unicode/decode-utf8-char utf-char :len
]
```

PeterWAWood

[07:54](#msg58a94f4400c00c3d4f5aa231)@Gregg Did you specify the

```
-r
```

compiler option. You now need to do this when compiling the console from source. (The docs will be updated when the 0.6.2 Alpha is released).

gltewalt

[07:56](#msg58a94fa01465c46a56846107)Oh. No, I didn't.  
Thanks

geekyi

[10:38](#msg58a975a4f045df0a226851d1)Looks like we have too many "Greg"s :smile:

9214

[12:27](#msg58a98f41de50490822e94a90)Keep this thread away from linux flamewars genlemen ;)

Senenmut

[13:36](#msg58a99f6bde50490822e9903b)Except Captain Trump , who was made a embittered man by Sledge Hamme. ha

PeterWAWood

[13:56](#msg58a9a41daa800ee52cb6a65d)It would be helpful if all posts were on topic - Welcome to Red.

gltewalt

[18:03](#msg58a9ddefde50490822eabc31)If i do the the `do/args %red.r` way of compiling, are there any flags or refinements?

[18:31](#msg58a9e46a872fc8ce6257e701)Oh, I got it. `do/args %red.r "-r %environment/console/console.red"`

## Monday 20th February, 2017

gltewalt

[04:39](#msg58aa72f9aa800ee52cba76cf)@geekyi I'm only 4/5 of Irwin

SimplyNova

[06:27](#msg58aa8c55f045df0a226d4076)newb here XD no serriusly im an amatuer XDDD

rebolek

[06:38](#msg58aa8efafef1d2de52aac6d6)@UnknownxKami welcome! that doesn’t matter at all :smile:

greggirwin

[18:20](#msg58ab338621d548df2c350619)We all started somewhere, sometime. When my Dad was teaching me chess, he would say "Everyone was a beginner once...even if only for 30 minutes" :^)

redredwine

[19:47](#msg58ab47d77ceae5376a16bc46)using the red console, I did  
print now and I get an internal error as shown below. is date/time not implemented yet ?  
red&gt;&gt; print now  
\*\** Internal Error: reserved for future use (or not yet implemented)  
\*\** Where: now  
red&gt;&gt;

greggirwin

[20:10](#msg58ab4d43de50490822f2338a)Correct. Date! values are not in place yet. Time! values are supported, so you can get the current time with `now/time`.

## Saturday 25th February, 2017

cyborhyzm

[14:05](#msg58b18f3f1465c46a56b1c41a)In this instance: `print [ name ": Hello." ]` I don't want a space automatically placed before the colon. It seems like the default behavior of print should be to let the programmer choose where spaces go, no?

meijeru

[14:34](#msg58b195ec872fc8ce6282599a)Even with the current rule you could achieve your goal by coding `prin name print ": Hello."`

cyborhyzm

[15:07](#msg58b19db51465c46a56b20fa6)Yes, true. Thanks. I still wish for the alternative though..

[15:08](#msg58b19dec00c00c3d4f880c2a)Seems like it would match most other popular (for good reason) languages like C, Python, Perl, Awk etc

rebolek

[15:21](#msg58b1a0efe961e53c7f6749b0)`print rejoin [name ": Hello."]`

[15:22](#msg58b1a139f1a33b62754ad677)If you pass a string to `print` then it prints exactly what you want. However if you pass a block, it does automatic formatting for you.

dockimbel

[15:22](#msg58b1a151e961e53c7f674b42)@cyborhyzm We are cooking a formatting dialect to cover that (and many other text formatting needs), it's just not ready yet (@gregg might have more info about that).

cyborhyzm

[15:24](#msg58b1a19d21d548df2c59398d)That sounds good and is more what I would expect and looked for as soon as I had the problem; i.e, a function (word) that does automatic formatting and one that doesn't

[15:24](#msg58b1a1bc1465c46a56b222ea)the rejoin solution is almost perfect though ;)

[15:25](#msg58b1a1fc7ceae5376a3a501a)Thanks for covering this little topic with me guys

dockimbel

[16:43](#msg58b1b41c21d548df2c5995bd)@cyborhyzm You're welcome.

cyborhyzm

[17:26](#msg58b1be3bde50490822148766)The Linux UI for Red is 'not yet ready for prime time', but has the back-end been decided for it to the best of anyone's knowledge? xlib, xcb, sdl, gtk, qt etc?

dockimbel

[17:32](#msg58b1bfac1465c46a56b2cb02)@cyborhyzm \[GTK](https://github.com/red/red/tree/GTK), a few features have been implemented already. QT is C++ only (no C API), Xlib/Xaw is too old (lacks many modern features), SDL does not provide graphic components.

cyborhyzm

[18:44](#msg58b1d08b1465c46a56b327a1)Makes sense. GTK will likely be the most similar implementation with API for win32 and osx compared against xlib as well. It's standard enough in distros as well. How is that expected to work when compiling binary with `red -c`? Will GTK need to reside on the system?

[18:50](#msg58b1d1f4872fc8ce62838f1a)I'm definitely looking forward to UI on linux with Red. I run into cases where the interpreter works but the compiled version of a script doesn't and vise versa quite often. Maybe it's better on win32. I've been switching between REBOL, Red and Boron because of differences or features I'm looking for. I'm hoping Red will reliably have most of them at some point.

[18:50](#msg58b1d20e00c00c3d4f8916c7)like #! for example

## Sunday 26th February, 2017

greggirwin

[05:01](#msg58b2612ade504908221744f4)I haven't pressed forward on `format`, because dates are such a big part of it and we don't have those yet. I may have a little more free time for a while, and can dust some things off.

dockimbel

[08:44](#msg58b2955ee961e53c7f6b7f5c)@greggirwin A reduced version of `format` while waiting for dates support, would be welcome. ;-)

[08:45](#msg58b295c7e961e53c7f6b8042)@cyborhyzm Yes, GTK will need to be preinstalled on the system.  
Please report those mismatching cases between interpreted/compiled code in red/red channel.

## Wednesday 1st March, 2017

justjenny

[02:36](#msg58b633b6f1a33b627562d9fb)hi, I created this blog that might be helpful to those new to Red- I had some good feedback on it and will add more to it soon.  
It is in its early stages, but Please take a look: http://jennyk36.blogspot.co.uk/

greggirwin

[04:40](#msg58b650d71465c46a56cbb498)I responded on the ML, but Woohoo!

dockimbel

[05:30](#msg58b65c5ce961e53c7f812aca)@justjenny Congrats on the new blog, and thank you for your kind words. Interesting feedbacks, I agree with you that we need to have a different approach for beginners vs experienced developers. IDEs are certainly helpful there, as you suggest. We have plans to go more into that direction. As Gregg says on the ML, we need more resources like your blog. Looking forward to read more blog entries from you! ;-)

Oldes

[08:21](#msg58b6849ce961e53c7f8208fd)@justjenny instead of:

```
you can use:
```

rejoin \[name " has " color " eyes."]\`

[08:23](#msg58b684f3de504908222d46d2)In Rebol I would use:

```
reform [name "has" color "eyes."]
```

But that is not in Red... @dockimbel has some plans how to simplify formating.

dockimbel

[08:25](#msg58b6856421d548df2c740a1c)&gt; In Rebol I would use:

```
reform [name "has" color "eyes."]
```

But that is not in Red...

`reform [...]` =&gt; `form reduce [...]` The `reform` function is just a convenient shortcut, it brings nothing new that is not there already.

Oldes

[08:25](#msg58b6856d1465c46a56ccd3e9)You can add `reform` easily using Rebol source:

```
reform: func [
    "Forms a reduced block and returns a string."
    value "Value to reduce and form"
][
    form reduce :value
]
```

[08:26](#msg58b68598de504908222d4aa6)Yes.. I should note that it is not in-build in Red by default.

[08:31](#msg58b686ea00c00c3d4fa2d32c)I think it is confusing to have `rejoin` and not `reform`... at least when you come from Rebol land and want to post some example. Like now... I had to try if `reform` is there and it was not.

justjenny

[15:04](#msg58b6e2f27ceae5376a578390)@dockimbel @greggirwin Thanks - And @Oldes I will post a 'rejoin' version as well as the 'append form' version, as an alternative option .

## Saturday 4th March, 2017

dsgeyser

[08:09](#msg58ba762ede50490822437052)Joe Marshall was saying some time ago:

"Rebol is \*extremely* difficult to compile in any meaningful sense. Since the parse tree can change dynamically at runtime, there is a combinatoric explosion of code paths. You can constrain things a bit by allowing the user to declare procedure arity, though."

Guess his view point was limited. Makes you appreciate the work done by Team Red even more. More surprises awaiting....

rebolek

[08:10](#msg58ba76934150746b1515b663)@dsgeyser I think he was right, some things in Red cannot be compiled and are interpreted even in compiled programs. Fortunately using interpreter from compiler is so trivial this is not an issue.

dsgeyser

[09:15](#msg58ba859b872fc8ce62b4af40)@rebolek So compiled Red will never equal the speed of compiled c or c++ code. If Red is compiled to machine code, what role does the interpreter play at execution time? And is the interpreter also compiled?

rebolek

[09:20](#msg58ba86c24150746b1515b6c0)@dsgeyser For speed you would use Red/System anyway, but only fraction of code really needs full speed. And most of Red can be compiled, it’s just the more dynamic stuff that cannot be compiled. Interpreter is compiled, Red console is exactly this. In your compiled code, everything you pass to `do` is interpreted.

dsgeyser

[09:20](#msg58ba86d121d548df2c8bfc37)Never knew the interpreter is also playing a role at execution time (after reading your answer again).

rebolek

[09:21](#msg58ba8705fef1d2de52ac2efd)It may, when needed.

dsgeyser

[09:21](#msg58ba87211465c46a56e4c594)Nothing in Red was developed in C?

rebolek

[09:21](#msg58ba8735fef1d2de52ac2f01)No.

[09:22](#msg58ba87514150746b1515b6c8)Red is written in Red/System and Red/System compiler is written in Rebol (currently). Not a single line of C here.

[09:23](#msg58ba87919eb1bd81481ebaab)See this code:

```
a: 1
print a
```

When you compile it, everything is compiled. However in this code:

```
a: 1
do [print a]
```

`print` will be run by interpreter.

dsgeyser

[09:23](#msg58ba87ac00c00c3d4fba94cd)Come to think of it: Rebol had such power back in 1997(8). All this possible with only Rebol. Mind blowing!

[09:33](#msg58ba89dc872fc8ce62b4c115)How many APIs out there are based on JSON and RESTful API, do you think?

rebolek

[10:00](#msg58ba904e567b0fc8138f55cb)I don’t know, many I guess. Why?

[10:01](#msg58ba90604150746b1515b6ec)Gitter itself is based on it.

dsgeyser

[10:06](#msg58ba91a400c00c3d4fbac759)I think that Red is a good fit for a Node-red implimentation which uses APIs to IoT devices etc. Maybe later Red might be embedded on such devices. I have read somewhere that APIs are actually a bad design.

[10:12](#msg58ba931ae961e53c7f9a358d)Using a disassembler on a compiled Red script would reveal the inner workings of the Red System compiler, or not?

rebolek

[10:13](#msg58ba93404150746b1515b6fa)It might, I guess, but isn’t reading R/S compiler sources much easier?

dsgeyser

[10:20](#msg58ba94d500c00c3d4fbad6e5)I am thinking of ways to feed my curiosity. Trying to learn Red/ System by using more familiar Red syntax. If only disassembling the compiled script can somehow point to the Red/System equivalent code.

rebolek

[10:21](#msg58ba952a567b0fc8138f55fe)Well, Red/System syntax is same as Red syntax. I think it wouldn’t be that hard to get generated RS code from the compiler.

meijeru

[12:16](#msg58bab007872fc8ce62b56acc)There is a compiler switch to output the R/S code!

geekyi

[12:24](#msg58bab2027ceae5376a6d8bc2)@dsgeyser  
&gt; I think that Red is a good fit for a Node-red implimentation which uses APIs to IoT devices etc.

By that, do you mean http://nodered.org/ or https://github.com/node-red/node-red by any chance? \*Confusing names*

[12:36](#msg58bab4ba1465c46a56e58ba0)Node-red is "A visual tool for wiring the Internet of Things".. using flow diagrams in the browser, with node as the backend?

[12:38](#msg58bab5431465c46a56e58ec1)&gt; There is a compiler switch to output the R/S code!

```
-v <level>, --verbose <level>  : Set compilation verbosity level, 1-3 for
                                     Red, 4-11 for Red/System.
```

\- from the commandline usage  
fyi, generates quite a lot of code tho!

dsgeyser

[13:00](#msg58baba7e7ceae5376a6daf25)@geekyi Same thing. Source code on github.

## Tuesday 7th March, 2017

lpvm

[16:20](#msg58bedde7f1a33b627590ee56)Windows version (under wine)  
&gt;&gt; about  
Red 0.6.1 - 7-Mar-2017/16:06:52

[16:21](#msg58bede12872fc8ce62cb7a0c)cc: load %cc.png  
\== make image! [147x32 #{  
FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF  
probe length? cc  
4704  
\== 4704

[16:21](#msg58bede2421d548df2ca31a06)Linux version:

[16:22](#msg58bede2af1a33b627590efdc)red&gt;&gt; about  
Red 0.6.1 - 7-Mar-2017/16:15:07  
red&gt;&gt; cc: load %cc.png  
\== %cc.png  
red&gt;&gt; probe length? cc  
6  
\== 6

[16:22](#msg58bede52872fc8ce62cb7b2b)I know that the Linux version for GUI is behind the Windows one. But shouldn't this be working?

maximvl

[16:50](#msg58bee4c07ceae5376a84243d)&gt;6

lol

Oldes

[20:17](#msg58bf156921d548df2ca49e57)@lpvm image loading is so far \[only on Windows](https://github.com/red/red/blob/master/runtime/platform/image-gdiplus.reds)... 6 is length of your file name

## Wednesday 8th March, 2017

lpvm

[00:12](#msg58bf4c7ee961e53c7fb3b639)@Oldes Yes, I know. It was just to show the difference.

Oldes

[00:28](#msg58bf504100c00c3d4fd49793)Of course... there should be the \_not implemented_ error

## Sunday 12nd March, 2017

ZenoArrow

[16:19](#msg58c57518de504908227d9c3e)Hi, I'd like to be able to read data from a CSV file, can anyone explain how I would do that in Red? Alternatively, any good beginners tutorials that might cover this? Thanks!

rebolek

[16:24](#msg58c57645872fc8ce62f1829f)@ZenoArrow Hi! Parsing simple CSV is pretty easy, however, CSV can get extremly complicated, so it depends on you input. Anyway, let's say you have some simple input like

[16:24](#msg58c576541465c46a5621664a)

```
a, b, c
1, 2, 3
```

ZenoArrow

[16:26](#msg58c576a721d548df2cc89e0b)@rebolek Sure, it can be complicated. To be honest I prefer TSV (tab-delimited) files, if that's easier to explain then I'd be happy to use those instead.

[16:27](#msg58c576e500c00c3d4ff7b77e)But yes, the data I've got in mind is quite simple.

[16:28](#msg58c577271465c46a56216a3d)&gt;

```
a, b, c
1, 2, 3
```

is a good starting point. :-)

rebolek

[16:28](#msg58c5773021d548df2cc8a005)

```
red>> out: []
== []
red>> foreach line split csv newline [append/only out split line comma]
== [["a" "b" "c"] ["1" "2" "3"]]
```

where `csv` is your input data.

[16:31](#msg58c577e1e961e53c7fd6acc9)For proper CSV parser take a look at http://www.rebol.org/view-script.r?script=csv-tools.r - it is for Rebol, but with little changes it should work in Red too (maybe directly, I haven't tested it yet).

ZenoArrow

[16:31](#msg58c577f000c00c3d4ff7bd67)Thanks @rebolek , that does get me off to a good start. One more question, how do I read the file into the variable? I've not used Red before today (tried Rebol about 4 years ago, but I've forgotten most of it!).

[16:33](#msg58c5783ddd08b4b859be190a)If there's a good tutorial that covers the fundamentals I'd be glad to see it!

rebolek

[16:33](#msg58c5786d21d548df2cc8a5a8)@ZenoArrow you can use `read %my-csv-file`, or you can use `read/lines %my-csv-file` which is actually better for CSV, because it already splits input on newlines:

```
red>> read %csv
== "1,2,3^/a,b,c"
red>> read/lines %csv
== ["1,2,3" "a,b,c"]
```

ZenoArrow

[16:34](#msg58c5789e7ceae5376aa9c55e)Thank you @rebolek .

rebolek

[16:35](#msg58c578c5872fc8ce62f19017)@ZenoArrow for good tutorial take a look at http://www.rebol.com/docs/core23/rebolcore.html . It is for Rebol, but very relevant to Red.

ZenoArrow

[16:56](#msg58c57dcedd08b4b859be3601)

```
read/lines %/c/Work/Red/RedTest/examplecsv.csv
foreach line split csv newline [append/only out split line comma]
```

[16:57](#msg58c57dfcde504908227dcf83)Tried the above, got told "Error: not a Red program".

[16:57](#msg58c57e171465c46a56218e6d)Guessing I'm missing the part where I assign read/lines to the csv variable, will try that.

[17:04](#msg58c57fbb7ceae5376aa9f430)

```
Red [Title: "CSV parse test"]

csv: read/lines %/c/Work/Red/RedTest/examplecsv.csv
foreach line split csv newline [append/only out split line comma]

print out
```

[17:06](#msg58c57ff87ceae5376aa9f527)Error message with the above was: Script Error: split does not allow block! for its series argument

[17:06](#msg58c5800b1465c46a56219b12)Any ideas what I'm doing wrong there?

[17:06](#msg58c5802f00c00c3d4ff7ef11)Do I need to transform the csv input in a different way because I'm using read/lines?

pekr

[17:13](#msg58c581d5dd08b4b859be4b20)try with `foreach line csv [append/only out split line comma]`

[17:14](#msg58c581fcde504908227de63c)the first split was there for the variant without the prior `lines`refinement for the `read`function ....

[17:14](#msg58c5820ee961e53c7fd6ef95)Haven't tested it, just from my head, so please try to experiment ....

[17:17](#msg58c58299872fc8ce62f1cd52)Also - working iwht CSV in the past in Rebol, I sometimes got into trouble, when file contained an empty element or comma was last char of the particular line. But - that was dependant upon Rebol's `parse`functionality. I usually used some loop to check that each line is e.g. 8 elements long ...

rebolek

[17:31](#msg58c585ffde504908227dfe24)@ZenoArrow when you use `read/lines` you do not need to `split csv newline` - it does it for you.

ZenoArrow

[17:35](#msg58c586d1e961e53c7fd70cde)Okay. Thanks @pekr and @rebolek .

[17:35](#msg58c586fc7ceae5376aaa214c)Next step will be to convert the CSV data into an array of objects, will read up on this to see what I can find out.

rebolek

[17:43](#msg58c588bade504908227e0e98)@ZenoArrow It is always good to provide some example, if you are lost, feel free to ask.

ZenoArrow

[17:49](#msg58c58a32872fc8ce62f1facb)Thanks @rebolek . Essentially I have this TSV data file, and I'd like to be able to import it into Red as an array of objects, where the object keys match the column headers: http://s000.tinyupload.com/index.php?file\_id=00006562233902777140

[17:51](#msg58c58aaa7ceae5376aaa3ae8)The end goal is to have a simple GUI that can display the images contained in that TSV file, and back and forward buttons to scroll through them, but trying to break it down into smaller tasks.

rebolek

[18:07](#msg58c58e59e961e53c7fd73f63)Ok, let's look at that data - everything is in quotation mark, which makes it `string!` in Red - so we can `load` that data, which makes things easier. So, here is not universal solution, but something fit your specific data:

```
red>> data: load %data.txt
== ["XMLDir" "XMLPath" "ImgName" "URNField" "URNValue"
    "C:\Users...
red>> names: collect [loop 5 [keep to set-word! take data]]
== [XMLDir: XMLPath: ImgName: URNField: URNValue:]
red>> objs: copy []
== []
red>> until [values: take/part data 5 append objs context collect [repeat i 5 [keep reduce [names/:i values/:i]]] empty? data]
== true
red>> probe objs
[make object! [
    XMLDir: "C:\Users\User\Desktop\XMLParse\XML\Batch1"
    XMLPath: {C:\Users\User\Desktop\XMLParse\XML\Batch1\Index2.xml}
    ImgName: "imagedos.tif"
    URNField: "URN_1"
    URNValue: "123"
] make object! [
    XMLDir: "C:\Users\User\Desktop\XMLParse\XML\Batch1"
    XMLPath: {C:\Users\User\Desktop\XMLParse\XML\Batch1\Index2.xml}
    ImgName: "imagedos.tif"
    URNField: "URN_4"
    URNValue: "234"
] make object! [
    XMLDir: "C:\Users\User\Desktop\XMLParse\XML\Batch2"
    XMLPath: {C:\Users\User\Desktop\XMLParse\XML\Batch2\Index2.xml}
    ImgName: "imagequatro.tif"
    URNField: "URN_1"
    URNValue: "345"
] make object! [
    XMLDir: "C:\Users\User\Desktop\XMLParse\XML\Batch2"
    XMLPath: {C:\Users\User\Desktop\XMLParse\XML\Batch2\Index2.xml}
    ImgName: "imagequatro.tif"
    URNField: "URN_4"
    URNValue: "456"
]
```

ZenoArrow

[18:18](#msg58c590e3e961e53c7fd74b50)Holy smokes!! That's incredible!

[18:18](#msg58c590eb872fc8ce62f22177)Thank you @rebolek !!

[18:18](#msg58c5910b00c00c3d4ff85220)I thought Red was powerful, but you parsed all that without the aid of a library in 4 lines of code!!

[18:19](#msg58c591397ceae5376aaa5ead)What you've shown me will make the next step a lot easier, thanks again!

rebolek

[18:22](#msg58c591cae961e53c7fd75116)@ZenoArrow you're welcome :)

## Monday 13th March, 2017

rupipal

[10:55](#msg58c67ab8dd08b4b859c354e9)I have started with Red an hour or so ago

[10:56](#msg58c67ad121d548df2cce0d13)How do access Red in command prompt on windows

[10:56](#msg58c67aea872fc8ce62f6fb36)the red console builds up. of course

maximvl

[10:56](#msg58c67aee00c00c3d4ffd079b)@rupipal `red.exe --cli` should work

[10:57](#msg58c67b1321d548df2cce0feb)@rupipal are you asking how to run red or how to run it inside windows terminal?

rupipal

[10:57](#msg58c67b22de5049082282e4d7)in windows terminal

maximvl

[10:57](#msg58c67b2bde5049082282e4f5)then `--cli` :)

rupipal

[10:58](#msg58c67b4ede5049082282e5f8)doesnt it require PATH settings

maximvl

[10:58](#msg58c67b5a872fc8ce62f6fd85)it does, of course

[10:59](#msg58c67b8200c00c3d4ffd0b38)I'm not an experienced windows user, but I think google will help you easily

rupipal

[11:01](#msg58c67bfb00c00c3d4ffd107e)hmm. bcoz there is just one file. I did add to PATH. half-convinced. it isn't working

[11:01](#msg58c67c09dd08b4b859c35b9e)I'll chk google.

maximvl

[11:01](#msg58c67c27dd08b4b859c35c73)@rupipal does it still say that it's not found or any other error?

[11:02](#msg58c67c3509e7ba8510bb0d14)did you restart console after changing PATH?

[11:02](#msg58c67c447ceae5376aaf36fd)is there any way in console to check PATH? does it show your changes?

rupipal

[11:05](#msg58c67cea09e7ba8510bb1046)yes yes. I restarted console

maximvl

[11:05](#msg58c67d127ceae5376aaf3d47)btw, did you add executable itself or it's directory?

rupipal

[11:07](#msg58c67d83872fc8ce62f70b06)I first tried with directory. just now tried with exec.

[11:08](#msg58c67dbb7ceae5376aaf41a0)I navigated to the directory too. doesnt work

maximvl

[11:14](#msg58c67f1bde5049082282fcc0)@rupipal could you print the PATH in the console?

[11:15](#msg58c67f4521d548df2cce2f04)otherwise you have to wait for any windows Red users, I'm more like a linux guy :D

rupipal

[11:16](#msg58c67f7a00c00c3d4ffd2513)yes yes. echo %PATH%

[11:18](#msg58c67ff57ceae5376aaf4e6c)ok. thanks. google isn't throwing up anything on the top either

maximvl

[11:18](#msg58c6800509e7ba8510bb215a)@rupipal so what does `echo %PATH%` show?

[11:18](#msg58c6801600c00c3d4ffd2925)does it have Red dir?

rupipal

[11:19](#msg58c68034de504908228302e5)of course. all directores. including the one I added for Red. You wan't me to copy here

maximvl

[11:19](#msg58c6805ddd08b4b859c3774b)well, I only wanted to check if Red dir is there

rupipal

[11:21](#msg58c680a100c00c3d4ffd2bc7)as I told you. I just now added the file too. I am copying here.

[11:21](#msg58c680a6de5049082283059d)D:\\ProgramFiles\\Python\\Scripts\\;D:\\ProgramFiles\\Python\\;C:\\ProgramData\\Oracle\\Ja  
va\\javapath;C:\\Windows\\system32;C:\\Windows;C:\\Windows\\System32\\Wbem;C:\\Windows\\S  
ystem32\\WindowsPowerShell\\v1.0\\;C:\\Program Files\\Java\\jdk1.8.0\_91\\bin;C:\\Program  
Files\\Microsoft SQL Server\\100\\Tools\\Binn\\;C:\\Program Files\\Microsoft SQL Serve  
r\\100\\DTS\\Binn\\;C:\\Program Files\\Microsoft SQL Server\\120\\Tools\\Binn\\;%USERPROFI  
LE%\\.dnx\\bin;C:\\Program Files\\Microsoft DNX\\Dnvm\\;E:\\ProgramFiles\\nodejs\\;E:\\Pro  
gramFiles\\Cloud Foundry;E:\\ProgramFiles\\Git\\cmd;E:\\ProgramFiles\\Android\\sdk\\tool  
s;E:\\ProgramFiles\\Android\\sdk\\platform-tools;C:\\Users\\nwe\\AppData\\Roaming\\npm;D:  
\\ProgramFiles\\maven\\bin;D:\\Bitnami\\rubystack-2.2.6-1\\ruby\\bin;D:\\ProgramFiles\\Re  
d\\red-061.exe

dockimbel

[11:21](#msg58c680bd872fc8ce62f72040)@rupipal You might want to check the solution at the bottom of this ticket: https://github.com/red/red/issues/543

rupipal

[11:21](#msg58c680d7dd08b4b859c379f3)ok thanks

dockimbel

[11:23](#msg58c6812d872fc8ce62f7222f)You might also want to rename `red-061.exe` to just `red.exe` if you intend to use it from command-line.

rupipal

[11:24](#msg58c68173872fc8ce62f723d9)ok. I 'll try that. but

[11:26](#msg58c6820021d548df2cce4238)So need I add just the directory or or executable as well to PATH

[11:29](#msg58c682b37ceae5376aaf5c22)And I'd tried from the directory itself. I mean. Without adding to PATH and with adding

[11:30](#msg58c682d321d548df2cce46f5)I mean one wouldn't need PATH. If one navigates to home of red

dockimbel

[11:37](#msg58c6846ce961e53c7fdc6483)@rupipal What does `red --cli` do when you're in the directory where you put the red.exe file? I'm not sure what you want to do exactly.

rupipal

[11:40](#msg58c6853200c00c3d4ffd4800)it works

[11:40](#msg58c6854009e7ba8510bb4324)with that change of name to red.exe

[11:41](#msg58c6855200c00c3d4ffd4861)also. of course PATH isn't required

[11:41](#msg58c6856809e7ba8510bb43b5)the compiler too works

[11:42](#msg58c685a800c00c3d4ffd4b1b)I mean. Its basically that PATH can't be given to Red

dockimbel

[11:43](#msg58c685d500c00c3d4ffd4bb7)@rupipal Have you read the ticket #543 as mentioned above?

rupipal

[11:44](#msg58c6860ede50490822832590)yes yes. thanks.

[11:46](#msg58c6868221d548df2cce5c1d)I simply typed red. which is the name of file. in home directory. as, expected, the shell simply executes that

[11:46](#msg58c6868a7ceae5376aaf74fd)home of red

dockimbel

[11:48](#msg58c686fd21d548df2cce5ec5)@rupipal Ok, so it works fine now?

[11:51](#msg58c687a8dd08b4b859c3a470)Feel free to ask any question about Red in this channel.

rupipal

[11:53](#msg58c6882f21d548df2cce653f)yes

[11:53](#msg58c6883500c00c3d4ffd5b0f)it seems to work

[11:53](#msg58c6884d00c00c3d4ffd5b8e)typing red ..open interpreter in separate window

[11:54](#msg58c6885f09e7ba8510bb553b)typing red --cli open in the command window itself

[11:54](#msg58c68883dd08b4b859c3ab36)the former allows compiler to work in the command prompt

[11:55](#msg58c6889a21d548df2cce68fd)this should be ok. for time being. thanks

dockimbel

[11:55](#msg58c688ae7ceae5376aaf8295)You're welcome.

## Saturday 18th March, 2017

metaperl

[15:46](#msg58cd566aac314c8a1a6228f5)oops. I should've been typing in red/welcome as a new person :)

9214

[16:36](#msg58cd62221c040b8e040e527f)@metaperl hello and welcome!

\* Red is in early stage of developement, no support for threads AFAIK.  
As for type safety - we have optional typing mechanism, perhaps there will be more safety stuff at `1.0` version. (I'm not an expert in these matters, hope that our members will answer your questions in more detail).  
IMO Rust is a way to go for you, since it's both fast/safe, mature and production ready, though Red is really fun to play with even in alpha. And, as you've mentioned it's really concise and expressive. ;)  
\* Well, I would say that Red could be very ambiguous, because it has strong emphasis on dialecting (DSLs), hence one language construct could have different meanings, depending on the context. Aside from that, Red/REBOL type system is an unique beast on it's own (I still don't get it and again hope that someone will clarify your questions).

## Sunday 19th March, 2017

OussamaElgoumri

[13:00](#msg58ce80e96701410e58538274)why red?

greggirwin

[19:07](#msg58ced70ff7f7d4810433e893)Why not? :^)

9214

[19:17](#msg58ced948fe6a638b1ae1705a)@greggirwin nay, it should be 42

greggirwin

[19:19](#msg58ced9aa590d72c864e4e56a)That's a bigger question.

## Monday 20th March, 2017

endo64

[08:01](#msg58cf8c6da84f611959c310b4)No, it's the answer, we should wait 1 million years for the question :)

xqlab

[10:45](#msg58cfb2e32215a08f04a5c0f2)I thought red means reduced Rebol

9214

[10:46](#msg58cfb30e7b3f37e754171b0f)@xqlab yup

dockimbel

[10:58](#msg58cfb5d5f7f7d4810436fa31)We moved it to "Rebol enhanced dialect". ;-) Nowadays, I like to think of "Red" as a hint to "Reduce" (reduce code, reduce time, reduce costs).

lpvm

[13:20](#msg58cfd712a84f611959c46b6e)As Red doesn't have http implemented yet, I tried to read html from a webpage but can't do it because of a redirect error: `** Access error: protocol error: "Redirect to other host - requires custom handling"`. I want to automate the process and only have information about these urls, not the redirected ones. Is there anything I can do to still use Rebol to scrape these pages or do I have to do this in another language? http://www.rebol.net/docs/prot-http.html

[13:20](#msg58cfd72da84f611959c46d73)for the http (partial) rebol implementation

rebolek

[13:22](#msg58cfd7a458ad4eb0283331a0)@lpvm Red has http(s). It does not have ports yet. But I use http(s) in Red everyday.

[13:23](#msg58cfd7ea8fa1633954f97239)`** Access error: protocol error: "Redirect to other host - requires custom handling"` - I think this is Rebol3 error.

lpvm

[14:40](#msg58cfe9e08fa1633954f9d39d)@rebolek You're right! It was a Rebol3 error. Tried it with Red and it worked fine. I got the idea that http was not implemented because of what I saw at the Trello web page, but got it wrong.

greggirwin

[15:53](#msg58cffaf28fa1633954fa3485)Red's I/O is basic today, but works very well. Full I/O will come in 0.7.0.

geekyi

[16:33](#msg58d004612215a08f04a75544)@lpvm  
&gt;Trello web page

can you show what got you confused?

lpvm

[18:14](#msg58d01c02a84f611959c5d70b)@geekyi It was https://trello.com/c/BW1SPeOU/48-i-o-support

## Wednesday 29th March, 2017

greglearns

[18:13](#msg58dbf9508fcce56b20ae4b18)googling for Red related material is difficult since "red" is a pretty generic word. Any thoughts on how best to search for things? For example, I was about to ask "Is there an estimate as to when 0.7.0 will be out?" but then I thought that I should google it first, but then remembered that I've had a tougher time this last 12 hours finding Red stuff (Rebol is easier since it's a made-up word!) ... I just googled "red-lang 0.7" and probably got my answer... but...

gltewalt

[18:14](#msg58dbf989f22385553dec35ac)Red language is usually the google phrase I use

greglearns

[18:14](#msg58dbf993f22385553dec35c5)got it

greggirwin

[18:14](#msg58dbf9968fcce56b20ae4d77)"red lang" can help, but Trello has the main roadmap.

9214

[18:17](#msg58dbfa3d0e4137042ac32f29)@greglearns https://gist.github.com/9214/784e7f7af2342f117bc67a8e2698855b

greggirwin

[18:18](#msg58dbfa7aad849bcf423048ae)You know @9214, I have that bookmarked here, and yet I always forget about it. red-by-example.org also has a lot of stuff, and I forget to mention that as well.

[18:18](#msg58dbfa8cf22385553dec3b10)We need sticky posts in gitter.

greglearns

[18:24](#msg58dbfbe68bb56c2d1156a845)thanks!

geekyi

[18:30](#msg58dbfd4608c00c092a2b23e3)@all anyone know a good online bookmarking system? The existing ones don't

gltewalt

[19:08](#msg58dc062c08c00c092a2b531a)lol

```
>> sites: [
[     https://gist.github.com/9214/784e7f7af2342f117bc67a8e2698855b
[     https://doc.red-lang.org/en/
[     http://www.rebol.com/docs/core23/rebolcore.html
[    ]
== [
    https://gist.github.com/9214/784e7f7af2342f117bc67a8e2698855
>> foreach site sites [browse site]
```

[19:09](#msg58dc0685f22385553dec798c)That might be windows only though

[19:21](#msg58dc09458fcce56b20ae968e)To create havoc, wrap it in `forever`

rebolek

[19:26](#msg58dc0a48ad849bcf423095e2):)

## Thursday 30th March, 2017

virtualAlan

[00:13](#msg58dc4dc50e4137042ac4958a)Here's a Red mp3 music player: http://www.mycode4fun.co.uk/red-apps

greggirwin

[00:17](#msg58dc4e9cf22385553ded9e19)Cool Alan. What are you using to play them? The DL is pretty big.

virtualAlan

[00:23](#msg58dc501a8bb56c2d11580c28)yes, i used a 'basic' type language 'panoramic' to prototype the engine. It's so easy and quick to use - Will use a better more compact option later.

dockimbel

[01:21](#msg58dc5d998fcce56b20afe58e)@greglearns Welcome! For 0.7.0, no ETA yet, though most probably this year, as the work on it will start as soon as 0.6.3 is out.

geekyi

[06:11](#msg58dca1840e4137042ac5aa5f)On mobile.. Incomplete messages get automatically posted.. 😓

gltewalt

[06:27](#msg58dca5608fcce56b20b0cf28)Mobile is... lacking. I feel your pain.

## Sunday 2nd April, 2017

Scaremonger

[12:03](#msg58e0e8a6bc370d964ede35fd)Hey everyone. I'm trying out Red as a possible replacement of some of my current tools but can't find details on licencing for Red and for apps generated by it. Any pointers?

ZenoArrow

[12:06](#msg58e0e9518bb56c2d11694f8e)@Scaremonger From the GitHub page: "Both Red and Red/System are published under BSD license, runtime is under BSL license. BSL is a bit more permissive license than BSD, more suitable for the runtime parts."

[12:08](#msg58e0e9a1b52518ed4dd02ebe)@Scaremonger If you just want to use the runtime, this is the BSL licence that the Red runtime is licenced under: https://github.com/red/red/blob/master/BSL-License.txt

Scaremonger

[15:08](#msg58e113e3f22385553dffb857)@ZenoArrow, thanks. Just what i was looking for.

[15:39](#msg58e11b27bc370d964edeeeee)I always have a problem with legal scripts and not familiar with BSL. Looks like BSL allows distribution of executeables derived from Red or Red/System as long as its closed source and you've compiled it in relase mode and you don't use their product names to promote your software. If its open source you need to include all the BSL license stuff with your source. Is that the correct assessment?

rebolek

[15:53](#msg58e11e6b8e4b63533d8b5568)@Scaremonger IANAL, but as I understand it, you are probably correct.

ZenoArrow

[18:17](#msg58e1403cb52518ed4dd172a1)@Scaremonger I'd suggest you'd even be allowed derivative works as long as you used the same BSL licence and didn't try to use Red as the name of your software. What you suggested would be fine.

[18:22](#msg58e141658fcce56b20c23f4b)@Scaremonger It's also worth pointing out that now that LibRed is released, it's even easier. Just include LibRed along with any code you write, you're almost certain to be able to licence and distribute the code that sits on top of it however you wish: http://www.red-lang.org/2017/03/062-libred-and-macros.html

Scaremonger

[19:36](#msg58e152d808c00c092a3fa5ed)Thanks guys. Looks like i

[19:37](#msg58e152f08bb56c2d116adce1)... need to come up to speed with it now.

greggirwin

[19:40](#msg58e153a2f22385553d00af70)It's easy to get started, but it sounds like you're one who will step off into the depths before long. When that happens, don't be afraid to post questions on channels here. We've all been there.

Scaremonger

[19:45](#msg58e154c8f22385553d00b382)Cheers @greggirwin .

## Tuesday 4th April, 2017

thinklog

[17:38](#msg58e3da20ad849bcf424f2e5f)Clicking on this link "Mac OS X red-04apr17-78cd95a 0 MB" goes to this page http://www.red-lang.org/p/download.html which displays a 404 Page not found error.

[17:39](#msg58e3da6a7ea420cc42398977)The same error is displayed when attempting to download the red binary for Mac either zipped or raw. The respective pages are http://static.red-lang.org/dl/auto/mac/red-latest.zip and http://static.red-lang.org/dl/auto/mac/red-latest

[17:45](#msg58e3dbad0e4137042ae25018)Is 0.6.3 that includes the macOS GUI backend already merged into the official Red 0.6.2 for MacOSX download?

rebolek

[17:45](#msg58e3dbc0ad849bcf424f3812)Yes, unfortunately, there is some problem with Mac building machine, so Mac download is missing currently.

thinklog

[17:48](#msg58e3dc758bb56c2d117561e2)@rebolek I must be misunderstanding something. This doesn't work

[17:48](#msg58e3dc76f22385553d0b1a8d)--== Red 0.6.2 ==--  
Type HELP for starting information.

&gt;&gt; view \[field hint "search text" field]  
\*\** Script Error: view has no value  
\*\** Where: catch  
&gt;&gt;

rebolek

[17:49](#msg58e3dc998e4b63533d96ce1a)@thinklog what are you using to try it?

thinklog

[17:49](#msg58e3dca60e4137042ae25503)I'm on a Mac.

rebolek

[17:50](#msg58e3dccfb52518ed4ddc3378)Are you using MacGUI branch?

thinklog

[17:51](#msg58e3dd0c8e4b63533d96d034)No. I'm using the official Red 0.6.2 for MacOSX download. That's why I asked my previous question regarding 0.6.3 having been marged with the official MacOSX download.

[17:51](#msg58e3dd380e4137042ae2572d)Where do I get the MacGUI branch, and how do I make it work?

rebolek

[17:52](#msg58e3dd4f4cb8d091735aeef8)Oh, I see, I was saying "yes" to your previous question about download, MacGUI has not been merged yet.

[17:52](#msg58e3dd788bb56c2d11756662)@thinklog macGUI branch: https://github.com/red/red/tree/macGUI

[17:53](#msg58e3dda94cb8d091735af14d)Clone the repo, download Rebol 2.7.8 from here: http://www.rebol.com/downloads.html and unpack it

thinklog

[17:54](#msg58e3ddb87ea420cc42399b8b)OK. Thanks.

rebolek

[17:54](#msg58e3ddb9f22385553d0b21bf)then run it with `./rebol`

iArnold

[17:54](#msg58e3ddc54cb8d091735af1da)(The master branch has been merged into the macGUI branch.)

rebolek

[17:55](#msg58e3de09f22385553d0b230a)See https://github.com/red/red/tree/macGUI#running-red-from-the-sources for more details.

## Wednesday 5th April, 2017

dockimbel

[04:39](#msg58e474f88bb56c2d1177c1f1)@thinklog Mac GUI should be merged in master this week (maybe today or tomorrow). For the automated builds, one of our contributor is working on a solution, it should also be ready soon (@x8x this week?).

rcqls

[05:00](#msg58e47a008fcce56b20cf5b22)@dockimbel @qtxie don’t know why `Needs: View` has been removed in `console.red` in the `macGUI` branch. I have to put it back to have the tests or examples about GUI running .Do I miss something? BTW, this works pretty well and looks really nice...

rebolek

[05:08](#msg58e47bc80e4137042ae4d101)@rcqls are you sure it was removed? AFAIK, `Needs: View` isn't in `console.red`, only in `gui-console.red`.

rcqls

[05:11](#msg58e47c73ad849bcf4251bab0)@dockimbel recent commit`423178752300a2290897ce9359aea8b22e69acf5`

[05:12](#msg58e47cd17ea420cc423c2447)was useful for macOS only I guess…. I though it was done in purpose thinking `gui-console.red` could compile but it was not the case….

rebolek

[05:36](#msg58e482708fcce56b20cf7385)@rcqls I think it was there by error.

rcqls

[05:42](#msg58e483bef22385553d0d9f90)@rebolek I had this in mind but it was no more possible to play with GUI examples with macOS. Have you tried to run tests on GUI with the last macGUI branch?

rebolek

[05:47](#msg58e484f30e4137042ae4f21a)@rcqls No, I have troubles with GUI and also networking on macOS, so I have to test things in Windows VM.

rcqls

[05:48](#msg58e485328e4b63533d996265)@rebolek I checked again and `*** Script Error: view has no value *** Where: catch` is the message without `Needs: View` in `console.red`

rebolek

[05:51](#msg58e485f3ad849bcf4251dca3)@rcqls Yes, for GUI usage, you have to add that line manually, or use gui-console (but that can't be compiled yet). It's a hassle, but it is work in progress and will get better, I think.

rcqls

[05:58](#msg58e487947ea420cc423c4d48)@rebolek in commandline `console` mode since `Needs: View` is only required in the preamble of `console.red` even if `console` is not a GUI stuff but this provides access to view tools in the console REPL.

[06:00](#msg58e487f10e4137042ae4fd54)BTW, console works perfectly now. I never test network stuff but GUI is almost ready...

qtxie

[08:00](#msg58e4a4048e4b63533d99de55)@rcqls Yes. I remove it as we're preparing for merge it into master.

rcqls

[08:03](#msg58e4a4ecb52518ed4ddf3669)@qtxie Without `Needs: View`, `console` could not run GUI stuff. Is it on purpose? As a command line user, I would appreciate to be able to have it in console REPL.

x8x

[08:07](#msg58e4a5a768bee3091f104b83)@rcqls here is latest macGUI before `Needs: View` has been removed https://red.niaxa.com/tmp/red-05apr17-f70e4c4

rcqls

[08:12](#msg58e4a6e68bb56c2d1178803a)@x8x Thanks!

qtxie

[08:40](#msg58e4ad798fcce56b20d02304)@rcqls It will be added automatically when you using red binary to run the console. But you need to add it manually when compiling the console from source.

rcqls

[08:45](#msg58e4aea58bb56c2d1178a1d4)@qtxie Thanks for your explanation! Since there is no way to buy (or get) an SDK license it is unfortunately difficult to build red binary except for the lucky old Rebol users…. My only way is to compile with rebol binary. Not a big deal to have my own console.red with `Needs: View` added in the preamble.

rebolek

[08:47](#msg58e4af08ad849bcf42528286)@rcqls that's not true. You can hapilly compile with normal Rebol from http://www.rebol.com/downloads.html . I do it few times each day.

[08:48](#msg58e4af778e4b63533d9a0d18)You cannot compile Red executable without SDK, but you can build executables written in Red (it is bit confusing terminology).

dockimbel

[08:50](#msg58e4afc508c00c092a4d7456)The `red` binary we offer for download is really just for convenience, it is not strictly required to use Red toolchain to compile any Red app (including the consoles), which can be done from sources with just a Rebol interpreter (free and easily available).

rcqls

[08:57](#msg58e4b16d0e4137042ae59d11)@rebolek I meant red executable when saying red binary…. With a few lines of bash, I can have a script bash (using Rebol executable) that do almost the same thing than red executable but this former is more convenient as @dockimbel mentionned it.

rebolek

[08:59](#msg58e4b20c8bb56c2d1178b17b)@rcqls Ok. Actually with `call` currently implemented, it should be easy to compile directly from Red console :)

rcqls

[09:02](#msg58e4b2a6408f90be668dadc5)@rebolek Good point!

## Thursday 6th April, 2017

justjenny

[23:47](#msg58e6d37a408f90be6697087c)'call' is big - There is so much can be done with a o.s. call ....

[23:57](#msg58e6d605ad849bcf425c179f)sorry - I meant good, not big

## Saturday 8th April, 2017

raton3062015

[06:06](#msg58e87dc8b52518ed4def298d)flatten a block in red \["a" \["c" \["b" \["d"] "e"]] 1 3 "f"]

rebolek

[07:47](#msg58e895a9ad849bcf4262ca78)@raton3062015

```
>> flatten-tree: function [tree [block!]] [rule: [some [ahead block! into rule | keep skip]] parse tree [collect rule]]
== func [tree [block!] /local rule][rule: [some [ahead block! into rule | keep skip]] parse tree [collect rule]]
>> flatten-tree ["a" ["c" ["b" ["d"] "e"]] 1 3 "f"] 
== ["a" "c" "b" "d" "e" 1 3 "f"]
```

KenSingleton

[08:21](#msg58e89d7108c00c092a5dbd3b)@raton3062015 try this: split form t space

rebolek

[08:35](#msg58e8a0cab52518ed4def989f)@KenSingleton your solution is fine for given input, but does not prevent types in other:

```
>> t: [a [b]]
== [a [b]]
>> split form t space
== ["a" "b"]
```

KenSingleton

[08:36](#msg58e8a111408f90be669dd627)@rebolek Good point

raton3062015

[10:24](#msg58e8ba4b7ea420cc424d7aa0)Pls help me to understand bitset!. What is it why it is necessary? Thanks in advance to all red monks

dockimbel

[10:34](#msg58e8bcb28e4b63533daa9bf1)@raton3062015 Try going through \[this document](http://www.rebol.com/r3/docs/datatypes/bitset.html) first. If there are parts you don't get, feel free to ask here or in red/help.

raton3062015

[10:43](#msg58e8beb7408f90be669e370e)Actually I can not comprehend the basic of bitset. If I can then everything will be clear . suppose &gt;&gt; bits: make bitset! #"a".

dockimbel

[10:46](#msg58e8bf700e4137042af61b84)A bitset is just an array of bits, nothing more. They are often used as "charsets", as it is convenient to map Unicode codepoints to indexes in such array. For example: #"A" =&gt; 65, #"B" =&gt; 66, .... So when you flip bits in a bitset to represent a list of characters, checking if a character is in such list or not, becomes as easy as checking if the bit at that codepoint index in the array is set to 1 or 0.

raton3062015

[10:46](#msg58e8bf71b52518ed4deffec5)&gt;&gt; in c , n= 0b0001

pekr

[10:51](#msg58e8c0c5408f90be669e3e78)@dockimbel in the past, Carl planned to introduce something like "named bits", which might be useful for flags, etc. Would you find anything like it useful in Red?

```
flags: make bitset! [opened closed connecting exited async]

if not flags/opened [
    flags/closed: true
]
```

raton3062015

[10:58](#msg58e8c25608c00c092a5e35f4)flags: make bitset! \[ open] , flags is an array of bits. which bit is set here.

[11:03](#msg58e8c36c8e4b63533daab424)what is happening here? open is converted into an index or group of index and set those index true?

rebolek

[11:04](#msg58e8c3a08fcce56b20e0bec6)@raton3062015 that is something that was just proposed, but does not work in Red (yet), so ignore it.

dockimbel

[11:06](#msg58e8c43db52518ed4df011b6)@pekr Your post is offtopic here and confusing newcomers who are trying to learn Red.

[11:06](#msg58e8c4518bb56c2d118967a4)@raton3062015 Please ignore that post.

raton3062015

[11:18](#msg58e8c71ead849bcf42637666)n = 23; (0b00010111) ; set 6th bit on ; (n |=1 &lt;&lt; 6) ;; in red how I can do it with bitset!

dockimbel

[11:21](#msg58e8c7c68e4b63533daac606)@raton3062015 If what you want to achieve is bit-level manipulations, bitsets are not for that, just use base math/bitwise operators:

[11:22](#msg58e8c80a68bee3091f212645)

```
lisp
>> n: 23
== 23
>> n: n or (1 << 6)
== 87
```

michaeldesu

[11:25](#msg58e8c893f22385553d1f0347)Hi - I'm a newcomer to Red and Rebol, so studying it from scratch - firstly thanks alot Nenad &amp; other contributors for making Red - it's rather fantastic (and VS Code plugin is nice) - I have a question about function declaration

[11:25](#msg58e8c8a168bee3091f212751)I see this is usual  
inc: function \[x]

raton3062015

[11:25](#msg58e8c8bbb52518ed4df020d8)so I can say bitset is a map of character where the bit is set as per the data provided

michaeldesu

[11:26](#msg58e8c8e28e4b63533daac981)and to specify type, you do, e.g.  
inc: function \[x \[integer!]]  
I wonder why the brackets around integer! is needed - is it just language convention, or there some reason?

dockimbel

[11:26](#msg58e8c8ea4cb8d091736eb63a)@raton3062015 That's right. And the mapped data is codepoints or just plain integers.

raton3062015

[11:27](#msg58e8c91208c00c092a5e4b5d)Flag: charset "abcdefg" , means 65 66 67 ... Bit are set and

[11:28](#msg58e8c965ad849bcf42637ece)Find "raton" Flag = aton ,where a is set in flag

Scaremonger

[11:28](#msg58e8c96fad849bcf42637ed8)@michaeldesu: I'm just learning too, but I think the optional \[integer!] does a type conversion to make sure that you always receive an integer.

michaeldesu

[11:30](#msg58e8c9d18bb56c2d11897915)@Scaremonger , thanks - I'm asking from a cosmetic angle, i.e. to me the extra square brackets around integer looks a bit noisy, i.e. the following looks cleaner to me, but of course is not permitted  
inc: function \[x integer!]

[11:31](#msg58e8c9faf22385553d1f07fc)it's not a problem.. I was just wondering.. maybe the square brackets puts the type declaration into a block for some other purpose

Scaremonger

[11:33](#msg58e8ca730e4137042af63ef5)@michaeldesu I don't know why yet either, i'm just taking it as the way things are for the moment. Good to know that the sq brackets are required though. I hadn't tried it without.

raton3062015

[11:33](#msg58e8ca7c0e4137042af63f1c)there are lots of websites for sharpen programming skills by providing solution with different pro language. But no one use red language. I am looking forward earnestly a website where I can solve provided problems with my beloved tool red.

dockimbel

[11:33](#msg58e8ca9a8e4b63533daacf16)@michaeldesu Welcome! Thanks for the nice words. The block usage is necessary to separate type specification from arguments names. Both `x` and `integer!` are words in a unreduced block, so there is no way to tell for the function constructor. Moreover, mixing argument names and type specifier can lead to very hard to read function specifications:

```
function [series block! string! path! value integer! char! path path!]
vs
function [series [block! string! path!] value [integer! char!] path [path!]]
```

[11:38](#msg58e8cbb00e4137042af644db)@raton3062015 Red is still very new (just 0.6.2) and not much known yet. Though, you can have a look at http://rosettacode.org/wiki/Rosetta\_Code and see the examples for \[Red](http://rosettacode.org/wiki/Category:Red) and \[Rebol](http://rosettacode.org/wiki/Category:REBOL).

michaeldesu

[11:38](#msg58e8cbbbb52518ed4df02b62)Thanks Nenad - looking forward to future updates, particularly for Android - I noticed the tweet about Mac - exciting times!

dockimbel

[11:39](#msg58e8cbd74cb8d091736ebefa)Indeed, this year should bring a lot of great features. ;-)

michaeldesu

[11:40](#msg58e8cc188e4b63533daad613)I will study Red (I come from Python background, so I'm interested to explore the nice syntax of Red)

Scaremonger

[11:40](#msg58e8cc364cb8d091736ebfad)I'm looking forward to trying out Android, but I noticed in the planned additions that AVR support was 15% complete... That is rather exciting too.

[11:41](#msg58e8cc62408f90be669e6705)I'm just trying to get my head around the GUI :(

[11:42](#msg58e8ccad408f90be669e68dd)Don't suppose anyone knows how to make a window "allways on top"?

michaeldesu

[11:43](#msg58e8cce0408f90be669e6965)i.e. modal?

Scaremonger

[11:44](#msg58e8cd0fad849bcf42638aff)Not really. My application doesn't want to be exclusive on top. Just never go behind any other application.

[11:44](#msg58e8cd3668bee3091f213769)Most of the time it sits as a sidebar at the edge of the screen.

michaeldesu

[11:48](#msg58e8cdfcb52518ed4df033f0)Sorry, I'm not familiar with view/ui stuff yet.

Scaremonger

[11:54](#msg58e8cf614cb8d091736eca7b)np. I'll post it over in red/gui-branch

dockimbel

[12:43](#msg58e8daf28bb56c2d1189b8b2)@Scaremonger No built-in way to get the Window always on top for now. You can use a call to `SetWindow()` from win32 API for that, though you'll need to write a routine! in Red/System for that for now (you should be able to do that from Red directly soon).

[13:27](#msg58e8e527408f90be669ec120)@Scaremonger Here is the code for keeping the window on top (Windows plateforme only):

```
Red [Needs: View]

set-top: routine [hWnd [handle!]][
	gui/SetWindowPos as int-ptr! hwnd/value as int-ptr! -1 0 0 0 0 3
]

win: view/no-wait [title "Top" text "I'm always on top"]
set-top win/state/1
do-events
```

This code relies on Red/System, so it need to be compiled `red -r`. You can use `#include` to include your app code, so that you can develop your app and test it from the console, and when ready, you can use this script to include your code and get the window flagged properly to stay on top.

maximvl

[14:12](#msg58e8efd28fcce56b20e164c9)@michaeldesu Hi,  
&gt;I have a question about function declaration

The interesting thing is that Red doesn't have function declaration in usual sense, all values including functions are anonymous and `x: function ...` is just assignment of function value returned by function `function` to the word `x`, the same as `x: 5` :)

greggirwin

[16:10](#msg58e90b828e4b63533dabcac8):point\_up: \[April 8, 2017 5:28 AM](https://gitter.im/red/red/welcome?at=58e8c96fad849bcf42637ed8) Datatype declarations on function parameters do not cause any type coercion. They are strictly for type checking.

```
>> fn: func [i [integer!]][print i]
== func [i [integer!]][print i]
>> fn 1.0
*** Script Error: fn does not allow float! for its i argument
*** Where: fn
```

[16:11](#msg58e90bbe8e4b63533dabcc1c)When you're new to Red, a good way to learn (in addition to asking here), is to play in the console. You don't have to compile, and you can experiment easily.

Scaremonger

[20:14](#msg58e944c0ad849bcf42654971)@dockimbel - Thanks for that. It's a good to know how easy it is to interface to the Win32 API too.

[20:16](#msg58e9453bf22385553d20d44f)@greggirwin - Cheers. Good to know.

## Sunday 9th April, 2017

michaeldesu

[02:44](#msg58e9a0177ea420cc4250a5e1)Thanks @maximvl , @greggirwin The community here is great.

geekyi

[07:37](#msg58e9e4a1408f90be66a20369)@michaeldesu to add to what everyone says here, you \*could* argue that it is by convention. And you can override `function` to make it work that way easily. But my counter is.. Would it be better? What about accounting for the rest of the language? What about supporting arguments with multiple types? `[integer! string!]`

michaeldesu

[11:31](#msg58ea1b9ef22385553d2363a2)@geekyi Thanks for showing the way with the multiple types part. I had no idea that was possible, and the fact the type is in a block makes sense for multiple types support. I experimented with the following in the console

```
fn: func[x [integer! float!]][x: x + 1]
```

and was surprised that it works as expected when passing in either type (I found this was mentioned \[here](http://www.rebol.com/docs/core23/rebolcore-9.html#section-3.1)  
\*Arg Type A block that identifies the data types that are accepted by the function*  
This is an interesting &amp; unexpected feature.

Scaremonger

[11:43](#msg58ea1e458e4b63533daf5161)This community is great, but is there an archive or a way to search through other peoples historic questions so newbies (like me) can find an answer without having to ask the same questions from you guys?

ghost~5680c5f416b6c7089cc058a5

[12:00](#msg58ea22708fcce56b20e5512d)@Scaremonger you can use the Search option on gitter. Also check Red questions on stackoverflow and the mailing list.

[12:01](#msg58ea227ea0e4856242e86cbf)BTW the search option on gitter rarely works

[12:02](#msg58ea22bbad849bcf4267f492)IIRC @rebolek created a tool that could extract and store all the messages from gitter? If searching through those messages is possible then it is great.

rebolek

[12:17](#msg58ea26478bb56c2d118e11ff)Yes,it is part of my Gitter API available here: https://github.com/rebolek/gritter . Downloader is in `%gitter-tools.red`, `download-all-messages/only`. There are also some support functions for searching. @Scaremonger I am working exactly on that, extracting questions to help newbies, but it takes time. Contact me privately, if you have any questions.

[12:18](#msg58ea26afbdf4acc11240e4d5)Messages are stored in simple format, each message is `map!` with 5 fields (when you use `/only` refinement), looking like this:

```
#(
    id: "573ea8777aab25fb459d157e"
    text: {The above image is part of (A) . IDK why it got uploaded late...}
    sent: "2016-05-20T06:02:31.228Z"
    v: 1
    author: "5680c5f416b6c7089cc058a5"
)
```

Scaremonger

[14:47](#msg58ea499d08c00c092a635342)I already have Stackoverflow in my bookmarks and found it useful so far, but I tried the gitter search earlier and didn't seem very good. I'll take a look at @rebolek 's api. Thanks again.

greggirwin

[17:15](#msg58ea6c144cb8d09173743c5d):point\_up: \[April 9, 2017 5:31 AM](https://gitter.im/red/red/welcome?at=58ea1b9ef22385553d2363a2) @michaeldesu, Not only can you spec multiple types, as you did: `fn: func[x [integer! float!]][x: x + 1]`, but Red has a concept of typesets, which let you group types together. Many are built in, but you can create your own as well. Do `help typeset!` in the console to see the standard ones. You'll see that `number!` is there, and you can use that in func specs. There are also helper funcs (e.g. `any-string?`) to test for typeset membership.

[17:16](#msg58ea6c5408c00c092a63d7d3)@Scaremonger, in addition to full history, it would be great to extract things into organized FAQ/wiki areas.

## Monday 10th April, 2017

geekyi

[06:02](#msg58eb2001408f90be66a61272)@Scaremonger @nc-x  
&gt; search option on gitter rarely works

What do you mean?  
1\. Search not returning results  
2\. Search ui is bad (when you scroll, pop ups open and close)  
3\. Search results not relevant

For 1, is a problem with gitter client sending multiple requests; solution: I copy and paste what I want in search field. For 2, I use mouse wheel. 3, I don't have problems with

[06:04](#msg58eb206608c00c092a663521)You could report problems to gitterHQ channel (tho most of the time, their devs are busy implementing what takes more priority such as scaling)

[06:05](#msg58eb20aaad849bcf426b5fce)This FAQ problem could supposedly be solved by gitter TOPICS, which, last I heard, is still in beta

[06:07](#msg58eb212b8fcce56b20e8a9c3)But rebolek's gritter could be a better solution in the long term I think, if we're able to build a better ui. It's pretty easy to get started with, do check out, and ask in https://gitter.im/gitterHQ/gitter if you have problems..

rebolek

[06:12](#msg58eb2238f22385553d26e1e3)@geekyi There is no search UI in Gritter yet, but the API can be used for searching (it may need some wrapper function for easier searching, because API is not very user friendly in this regard).

geekyi

[06:16](#msg58eb234aa0e4856242ebddb6)@rebolek yeah of course :smile: , right now, the workflow is download using your tool and working on it using custom functions..not that usable I guess

[06:17](#msg58eb2385b52518ed4df80498)Gitter backend search api does have some hidden functions which you have to search for (not very discoverable)

rebolek

[06:22](#msg58eb24b3408f90be66a621f4)Searching with `%gitter-api.red`:

```
>> do %gitter-api.red
>> messages: gitter/get-messages/with 'red/red/welcome "q=gritter"
>> print messages/50/text
Gitter backend search api does have some hidden functions which you have to search for (not very discoverable)
```

[06:24](#msg58eb25218fcce56b20e8b652)Hm, that doesn't seem right :)

[06:33](#msg58eb273ff22385553d26f4b2)I pushed some fixes and search should be:

```
>> messages: gitter/get-messages/with 'red/red/welcome [q: "gitter"]
>> print messages/33/text
@keesse You can render nicely the posted source code on Gitter by enclosing it with 3 backquotes on a head line, then 3 backquotes on a bottom line.
```

[06:36](#msg58eb27fc8e4b63533db2dffc)However, search for"Gritter" returns empty block:

```
>> messages: gitter/get-messages/with 'red/red/welcome [q: "Gritter"]
== []
```

even if there is at least one message with string "Gritter" in this room. So the search on Gitter \*\*is\** limited.

geekyi

[07:13](#msg58eb309bad849bcf426b9ad2)@rebolek I'm getting \[4 messages](https://gitter.im/api/v1/rooms/570387cd187bb6f0eaddec47/chatMessages?q=Gritter&amp;lang=en&amp;limit=30) tho

rebolek

[07:17](#msg58eb31714cb8d0917376bed2)@geekyi interesting, I still get zero.

geekyi

[07:24](#msg58eb33288fcce56b20e8ee7a)I'm moving this conversation to gritter chanel

michaeldesu

[12:22](#msg58eb791db52518ed4df96c6f)@greggirwin thanks. The built-in help in console is very useful. BTW I've noticed that

````
names: ["bill" "mary" "jane"]
i: 2
print names/:i```
and
````

print names/(i)\`  
i.e. /:i and (i) appear to be functionally identical. Is there any problem with the latter approach, is any preferred?

dockimbel

[12:25](#msg58eb79a108c00c092a67a659)@michaeldesu The idiomatic form is `/:i`, the latter approach is slower as it does a sub-evaluation of the expression(s) in the paren and returns the result of last evaluation.

michaeldesu

[12:25](#msg58eb79bb08c00c092a67a766)@dockimbel Thanks so much

[12:26](#msg58eb79fb68bee3091f2a944c)BTW I like the tweeted direction of the colours in the console - I noticed the colour changed on string completion (like closing quote) this is nice.

rebolek

[12:26](#msg58eb7a084cb8d0917377e92b)@michaeldesu

```
>> print names/(print first names i)
bill
mary
```

michaeldesu

[12:29](#msg58eb7a92b52518ed4df9744b)@rebolek thanks, wow that's a bit of a head-scratcher for a newbie like me- I will study it

[12:30](#msg58eb7adabdf4acc11245c9d9)I kinda thought the one in an example I saw

```
repeat i (length? names) [print [names/:i]]
```

seems a bit easier to follow, or the foreach one is better again

rebolek

[12:30](#msg58eb7adb8bb56c2d1192e2a8)@michaeldesu it is simple, `paren!` gets evaluated first: 1) it prints first names - "bill" and 2) it returns value of i - 2. That value is taken as index for names and "mary" gets printed

[12:30](#msg58eb7b028e4b63533db4464b)If you want numerical index, `repeat` is better than `foreach`

michaeldesu

[12:31](#msg58eb7b144cb8d0917377ee60)thanks again!

rebolek

[12:31](#msg58eb7b1ebdf4acc11245cabb)But if you care only about the values in series, `foreach` is definitely better.

ghost~5680c5f416b6c7089cc058a5

[14:07](#msg58eb919c68bee3091f2b0265)@geekyi I mean 1 &amp; 2.

meijeru

[17:16](#msg58ebbddf8fcce56b20eb64e7)@michaeldesu `/(...)` is needed if the value used as a selector is semantically valid, but lexically forbidden after the `/`, e.g. a character literal like `#"a"`

greggirwin

[17:39](#msg58ebc367b52518ed4dfad1ed)And any value can be used as a "key". That is, path notation works like `select`, returning the value that comes next, after the one you specify. It is not limited to name-value pairs.

```
>> data: [a 2x2 c %test d]
== [a 2x2 c %test d]
>> data/(2x2)
== c
```

michaeldesu

[23:42](#msg58ec187ea0e4856242f04123)Thanks Rudolf &amp; Gregg for your continuing guidances. It's appreciated. I'm experimenting with loading text files and searching using `find`. I noticed there is `/any` but it seems unavailable. Is there a plan to have it, and also how about regex or similar search capability?

gltewalt

[23:43](#msg58ec18acad849bcf426fbf44)@michaeldesu `parse` is a whole dialect for regex type things

michaeldesu

[23:44](#msg58ec18ef8e4b63533db72f45)@gltewalt Thanks alot for your guidance, I'll check it out

gltewalt

[23:45](#msg58ec19008fcce56b20ecfee0)http://www.red-lang.org/2013/11/041-introducing-parse.html

[23:46](#msg58ec195668bee3091f2d6216)From the Rebol/Core Users Guide  
http://www.rebol.com/docs/core23/rebolcore-15.html

michaeldesu

[23:49](#msg58ec19ecf22385553d2b2f15)Thanks again

gltewalt

[23:51](#msg58ec1a95f22385553d2b3085)There are some things that are not the same right now between the Red version and the Rebol version, so don't be afraid of a few bumps in the road. If you hit a bump, don't be afraid to ask here or in the red/help room

michaeldesu

[23:58](#msg58ec1c09408f90be66aa7af9)Thanks. It's interesting about the regex past - it'll be interesting to see how parse compares or is better.

## Tuesday 11st April, 2017

greggirwin

[01:47](#msg58ec35cbf22385553d2b8c68)`Find/any` will come, and is basic wildcard matching, not full regex.

michaeldesu

[02:00](#msg58ec38aebdf4acc112491487)Thanks. I'm not finding parse particularly intuitive after learning regex, e.g. finding say, the word 'the' in a string like "I called the phone" is pretty trivial in regex. The closest I can get with parse is something like `parse "I called the phone" [some [thru "the"]]` - am I on the right track?

[02:01](#msg58ec390e68bee3091f2dcbc5)after finding this interesting \[reference](http://rebol-land.blogspot.com.au/2013/12/count-string-occurrence-in-string.html) but I think it's overkill for simple searches. So I think `Find/any` will be a useful addition for simpler searches (until I learn some more). Parse looks really powerful for validation.

[02:06](#msg58ec3a118bb56c2d11963828)However searching via `find` is impressively quick. I loaded a huge XML file about 300Mb into a variable, and it took around 30 s to scan it looking for an ad-hoc string. This is really nice.

PeterWAWood

[02:14](#msg58ec3c19a0e4856242f0c09a)@michaeldesu Try this:

```
parse "I called the phone" [to "the" thru end]
```

[02:22](#msg58ec3dcf408f90be66aae8c3)This parse rule counts the number of times 'the' appears in the Red homepage:

```
parse read http://www.red-lang.org [(count: 0) any [thru "the" (count: count + 1) | thru end (print count)]]
```

dockimbel

[02:35](#msg58ec40d808c00c092a6b1d26)@michaeldesu Searching performance could be much faster, it is not optimized at all currently, we'll get it done on the road to 1.0.

michaeldesu

[03:09](#msg58ec48d14cb8d091737b6eaf)@PeterWAWood Thanks alot for that - great references. @dockimbel Sounds great. Thanks for your reply.

[03:14](#msg58ec4a1768bee3091f2e0683)JFYI I just tried that parse read http://www.red-lang.org example at work, and it triggered a Symantec endpoint trigger (\[SONAR.Heuristic.159](http://securityresponse.symantec.com/security\_response/writeup.jsp?docid=2017-010520-1048-99&amp;tabid=2)) probably our aggresive corp antivirus

PeterWAWood

[03:16](#msg58ec4a9c68bee3091f2e087b)@michaeldesu Do you get the same trigger if you just read the webpage?

```
webpage: read http://www.red-lang.org
```

michaeldesu

[03:17](#msg58ec4abd408f90be66ab14d8)yes

PeterWAWood

[03:20](#msg58ec4b7e8e4b63533db7dc3b)Perhaps your corporate policies don't like plain http websites. You could check by trying both:

```
read https://bbc.co.uk
```

and

```
read http://bbc.co.uk
```

michaeldesu

[03:22](#msg58ec4c04a0e4856242f0f2c4)ok - thanks

[03:24](#msg58ec4c8108c00c092a6b4196)yeah, both of those cause the same issue (red-062.exe is quarantined &amp; effectively removed)

[03:25](#msg58ec4c99b52518ed4dfcf29b)JFYI I have to run a virus scan, so it will be interesting to see what happens :-) I understand about false positives, so I'm not expecting any issues

[03:28](#msg58ec4d4b8e4b63533db7e2e9)I do have to set a https\_proxy env var when I have to install python packages, so it's pretty tight

maximvl

[16:33](#msg58ed05708fcce56b20f0dab1)top #1 HN post: whining about electron consuming too much resources as a platform :D

rebolek

[16:54](#msg58ed0a54408f90be66ae60a6):)

9214

[17:35](#msg58ed13e28bb56c2d119a046e)puny mortals!

Scaremonger

[20:18](#msg58ed3a2fa0e4856242f550c5)I'm having problems understanding GUI events. The documentation mentions actors, react and events, but I don't really get the difference! Does anyone have some example event code for "over", "click", "right-click" etc on a window rather than a button or panel? I've tried playing with the test code below and the commented blocks show my unsuccessful attempts. The only thing I received was button click events, but not those from the window itself. Where am I going wrong?

```
Red [ Needs: View ]

mainwindow: layout [
	title "TESTAPP"
	button "OKAY" [print ["OK Pressed" ]]

	;on-click: func [ face [object!] event [event!]] [
	;	print [ "click" ]
	;]
]

;mainwindow/react [ face ] [
;	switch event/click [ print "clicked" ]
;]

mainwindow/actors: make object! [
	on-click: func [face [object!] event [event!]] [ 
		print[ "click" ]
	]
]

view mainwindow
```

endo64

[21:22](#msg58ed491408c00c092a6fc48d)Here is a quick example on `actors` on `window` faces:

```
win: make face! [
	type: 'window
	size: 300x300
	actors: object [
		on-down: function [face event] [
			print "Window click"
		]
		on-alt-down: function [face event] [
			print "Window right click"
		]
		on-key: function [face event] [
			if event/key = #"^[" [unview] ;escape to quit
		]
	]
]

view win
```

[21:23](#msg58ed49518e4b63533dbc636b)React is completely different idea, have a look at `react-test.red` file in the repository.

## Wednesday 12nd April, 2017

dockimbel

[03:42](#msg58eda20eb52518ed4d02b60c)@Scaremonger `click` event is (for now) only available for `button` faces, use `down` for other faces to detect when the left mouse button is down.

Scaremonger

[08:09](#msg58ede0b1408f90be66b1c2e5)@endo64 - Thats a good example and I was so close. @dockimbel - As I was only getting button clicks; thats obvious now, but sometimes you just can't see where you're going wrong. Thanks guys.

dockimbel

[08:54](#msg58edeb62ad849bcf42778411)@Scaremonger Did you miss the Red/View \[documentation](https://doc.red-lang.org/en/view.html)? In \[event list](https://doc.red-lang.org/en/view.html#\_event\_names) you can find:  
`click | mouse | Left mouse click (button widgets only).`.

Scaremonger

[08:57](#msg58edebe7ad849bcf42778680)Yep. Guilty as charged. ;) I was using that document too. doh!

dockimbel

[08:59](#msg58edec5608c00c092a722c8f)Well, no problem, small details can be easily missed when learning a new API. ;-)

Scaremonger

[09:09](#msg58edeec108c00c092a72381b)Once you've "misread" something it's difficult to re-read it without your brain assuming it says what you "misread" previously.

raton3062015

[15:12](#msg58ee43c38e4b63533dc067f6)Red/parse

[15:13](#msg58ee443769a692963ea3639c)There should be a room on red/parse. Because we new comer want to learn red parse

greggirwin

[15:58](#msg58ee4eb84cb8d09173841718)You can post in red/help. If enough messages build up on `parse` we can create a room.

raton3062015

[16:03](#msg58ee4fe1f22385553d34abbf)Pls give some example on parse. Especially use of keyword.

greggirwin

[16:05](#msg58ee5044bdf4acc1125221f0)http://www.red-lang.org/2013/11/041-introducing-parse.html

raton3062015

[16:11](#msg58ee51ac4cb8d09173842a79) "welcome 12-01-17 how are you". parse date

dockimbel

[16:12](#msg58ee520469a692963ea3b004)@raton3062015 See also Rebol \[Parse docs](http://www.rebol.com/docs/core23/rebolcore-15.html). For your example, here is some rules to get you started:

```
digit: charset "0123456789"
date: [2 digit #"-" 2 digit #"-" 2 digit]

text: "welcome 12-01-17 how are you"
parse text [some [copy d date | skip]]
d            ; == "12-01-17"
```

raton3062015

[16:17](#msg58ee53338e4b63533dc0c0ae)Parse text \[ date ]

[16:18](#msg58ee5364bdf4acc112523476)Why use some and skip

greggirwin

[16:18](#msg58ee5373b52518ed4d05c773)Have you read the docs?

raton3062015

[16:19](#msg58ee53998fcce56b20f675e7)some will match 1 or more time

greggirwin

[16:19](#msg58ee53aab52518ed4d05c82c)`some` means "one or more". `skip` advances one element, not trying to match.

raton3062015

[16:20](#msg58ee53e98bb56c2d119f564e)If I not use skip what will happen

greggirwin

[16:22](#msg58ee5440f22385553d34c447)So the above example says "one or more times, copy text matching a date or advance" If you don't advance, it will just sit there trying to match a date at the head of the text.

[16:23](#msg58ee547aad849bcf42799668)When learning, you can use set-words in rules to mark the current position in the input, which you can then probe to debug.

dockimbel

[16:23](#msg58ee547f8fcce56b20f67994)Without the `| skip` part, the rule will try to match the date from the first character of the string, fail, and give up (because no alternative rule is provided, and `some` is not advancing the input), returning `false` to show that the rules didn't match the input.

```
>> d: none
== none
>> parse text [some [copy d date]]
== false
>> d
== none
```

raton3062015

[16:24](#msg58ee54a4ad849bcf427996e4)Thanks Gregg Irwin

greggirwin

[16:25](#msg58ee550d8bb56c2d119f5ae3)

```
digit: charset "0123456789"
date: [2 digit #"-" 2 digit #"-" 2 digit]

text: "welcome 12-01-17 how are you"
parse text [some [copy d date (print 'date!)| pos: (probe pos) skip]]
d            ; == "12-01-17"
```

[16:27](#msg58ee5576408f90be66b3f1c8)Happy to help. :^)

AlexanderBaggett

[21:35](#msg58ee9db1a0e4856242fb5cc4)Hi all. What is the difference between Write and Save in Red/Rebol?

rebolek

[21:39](#msg58ee9ea9ad849bcf427aea43)@AlexanderBaggett `save` stores `load`able format. `write` stores bytes.

AlexanderBaggett

[21:40](#msg58ee9ed1408f90be66b54581)Thanks for the clarification

rebolek

[21:42](#msg58ee9f314cb8d091738594db)@AlexanderBaggett

```
>> write %del.me [this: is "code"]
>> probe read %del.me
{[this: is "code"]}
== {[this: is "code"]}
>> probe load %del.me
[this: is "code"]
== [this: is "code"]
>> probe length? read %del.me
17
== 17
>> probe length? load %del.me
3
== 3
```

[21:43](#msg58ee9f848e4b63533dc22239)`load` is doing `load read` when given `file!`

AlexanderBaggett

[21:44](#msg58ee9fc0bdf4acc1125398ca)I see

[21:46](#msg58eea0238bb56c2d11a0b9b0)What does probe do in your example. The read and load line both work fine without it.

[21:49](#msg58eea0de8fcce56b20f7d3dd)&gt;&gt; length? load %del.me  
\== 3  
&gt;&gt; length? read %del.me  
\== 17  
&gt;&gt;

rebolek

[21:50](#msg58eea1088e4b63533dc22a0f)@AlexanderBaggett `probe` just prints value and returns it.

AlexanderBaggett

[21:51](#msg58eea15e8fcce56b20f7d589)So it lets us assign the value to a variable while writing the the console at the same time?

rebolek

[21:52](#msg58eea1a6408f90be66b5537d)@AlexanderBaggett it does not assign value, it just prints and returns it.

[21:52](#msg58eea1b7bdf4acc11253a112)It is useful when you have long values, like this:

[21:53](#msg58eea1bf69a692963ea526fa)

```
>> b: collect [loop 100 [keep random 100]]
== [53 81 67 51 13 4 3 71 48 92 6 51 54 38 19 14 2 19 14 24 76 75 61 3 98 76 7 17...
>> b
== [53 81 67 51 13 4 3 71 48 92 6 51 54 38 19 14 2 19 14 24 76 75 61 3 98 76 7 17...
>> probe b
[53 81 67 51 13 4 3 71 48 92 6 51 54 38 19 14 2 19 14 24 76 75 61 3 98 76 7 17 15 68 30 100 44 20 84 60 73 98 62 34 43 100 7 12 38 69 12 1 20 37 42 92 90 91 71 24 21 46 22 63 54 5 11 37 90 86 27 27 29 40 47 41 38 95 34 99 10 76 83 19 6 97 2 6 15 100 92 90 40 6 96 32 33 70 11 69 83 31 56 39]
== [53 81 67 51 13 4 3 71 48 92 6 51 54 38 19 14 2 19 14 24 76 75 61 3 98 76 7 17...
>>
```

[21:54](#msg58eea20df22385553d3638d6)Using `probe` in `load/read` example is not necessary, it's just habit.

AlexanderBaggett

[21:54](#msg58eea222f22385553d3638fb)Oh, so in some scenarios stuff returned to the console is actually truncated and probe always returns the full value.

rebolek

[21:55](#msg58eea2348e4b63533dc22e86)@AlexanderBaggett exactly.

[21:55](#msg58eea26cbdf4acc11253a3d4)`probe` is (almost) like `print`, but `print` does not return value

[21:56](#msg58eea291bdf4acc11253a4b0)

```
>> print 1
1
>> probe 1
1
== 1
```

AlexanderBaggett

[21:57](#msg58eea2b98fcce56b20f7db55)Oh I see, in the second scenario it really is returning the value. Thus the ==

rebolek

[21:58](#msg58eea3118bb56c2d11a0c759)Exactly, that's the difference. So you can do things like

```
>> a: 1
== 1
>> 1 + probe a
1
== 2
```

AlexanderBaggett

[21:59](#msg58eea34b69a692963ea52dba)&gt;&gt; temp: print 1  
1  
\*\** Script Error: temp: needs a value  
\*\** Where: temp  
&gt;&gt; temp: probe 1  
1  
\== 1

[21:59](#msg58eea3598bb56c2d11a0c908)I see

[22:03](#msg58eea4358bb56c2d11a0cc67)What kind of collections / sequences does red support?

rebolek

[22:05](#msg58eea4aaf22385553d3643ed)`block!` is basic. `[here "can" #be almost@anythi.ng]`

AlexanderBaggett

[22:06](#msg58eea4cdbdf4acc11253afda)Okay, I know about block!. Its an arbitrary block of code basically.

rebolek

[22:06](#msg58eea4de8e4b63533dc2381d)Yes.

AlexanderBaggett

[22:07](#msg58eea505408f90be66b55ffd)I have a background in .Net so some of this is a bit new to me.

rebolek

[22:07](#msg58eea50b69a692963ea534ef)Well, it \*may* be code, but is actually just a block of values.

[22:07](#msg58eea51cad849bcf427b0611)You can interpret it as code.

AlexanderBaggett

[22:07](#msg58eea52508c00c092a758abb)so if my block contained only variable names it would work too?

rebolek

[22:08](#msg58eea549408f90be66b560f7)Your block can contain anything that is valid value in Red.

[22:08](#msg58eea5618bb56c2d11a0d03e)There are no variables, btw.

gltewalt

[22:09](#msg58eea5888bb56c2d11a0d13f)until it's evaluated by a 'do' either explicitly or implicitly

[22:09](#msg58eea5abb52518ed4d073854)It's all inert in a block until evaluated

AlexanderBaggett

[22:09](#msg58eea5b408c00c092a758cc6)Oh

rebolek

[22:09](#msg58eea5b5b52518ed4d073865)then you get word's value, that's as close to a variable, as you can get :)

AlexanderBaggett

[22:10](#msg58eea5d5408f90be66b562ed)So, its unevaluated when in a block state and a do has to be used to cause some evaluation.

[22:10](#msg58eea5df8fcce56b20f7e601)Can you give an example?

rebolek

[22:11](#msg58eea615ad849bcf427b0a0c)

```
>> a: 1
== 1
>> b: 2
== 2
>> blk: [a b]
== [a b]
>> foreach w blk [print w]
a
b
>> foreach w blk [print get w]
1
2
>>
```

AlexanderBaggett

[22:12](#msg58eea65108c00c092a758f3f)okay one sec. Let me screw my head back on. You just blew my mind.

rebolek

[22:12](#msg58eea662b52518ed4d073bd7)@AlexanderBaggett :)

AlexanderBaggett

[22:13](#msg58eea66ff22385553d364b77)so you can iterate over data in a block without having to implement an iterator?

rebolek

[22:14](#msg58eea6a98bb56c2d11a0d577)@AlexanderBaggett it depends on what do you call an iterator. `w` is not enough? :)

[22:14](#msg58eea6bd08c00c092a759042)It should be `value` to be correct.

AlexanderBaggett

[22:14](#msg58eea6dd8fcce56b20f7e965)Yeah, I am still getting to know all of the words.

[22:15](#msg58eea6e8bdf4acc11253b712)\*jargon*

[22:15](#msg58eea6f3ad849bcf427b0e83)associated with Red/Rebol

rebolek

[22:15](#msg58eea6fff22385553d364d26)I know, it is bit different, but it makes sense.

gltewalt

[22:17](#msg58eea7658e4b63533dc2411e)from your background - conceptually, series! could be like an Interface. The traversal functions are taken care of for you

AlexanderBaggett

[22:18](#msg58eea7bf8e4b63533dc24293)So calling get on the "values" in the block cause them to be evaluated?

rebolek

[22:20](#msg58eea813bdf4acc11253bb80)Actually no, it just gets their value. It is the same in above example, but not always.

[22:20](#msg58eea822b52518ed4d074250)Let me show you some example

AlexanderBaggett

[22:21](#msg58eea887b52518ed4d0743e3)Boleslav, what is your background in Red/Rebol btw?

rebolek

[22:22](#msg58eea8be4cb8d0917385bafd)

```
>> fn: does [print 1]
== func [][print 1]
>> block: reduce [:fn get 'fn fn]
1
== [func [][print 1] func [][print 1] unset]
```

[22:25](#msg58eea9588fcce56b20f7f3a3)@AlexanderBaggett I am using Rebol from first publicly available version, so for 18 years I think?

AlexanderBaggett

[22:25](#msg58eea973ad849bcf427b171c)Woah

[22:26](#msg58eea981bdf4acc11253c14d)Also with regards to your code

[22:26](#msg58eea9834cb8d0917385bd68)Woah

[22:26](#msg58eea9a38bb56c2d11a0e0e3)what does it do?

rebolek

[22:27](#msg58eea9cc8fcce56b20f7f514)`reduce` evaluates

[22:28](#msg58eeaa06b52518ed4d074ab2)you have three different expressions in `block`: `:fn`, `get 'fn` and `fn`

[22:28](#msg58eeaa2008c00c092a759e36)`1` is printed by evaluated `fn`

AlexanderBaggett

[22:29](#msg58eeaa4608c00c092a759ea5)block is our ~~variable~~ word.

rebolek

[22:29](#msg58eeaa5a408f90be66b572fa)the result is `[function! function! unset!]`

[22:30](#msg58eeaa7b8e4b63533dc24d16)word can be called a variable

[22:30](#msg58eeaa838bb56c2d11a0e525)word can hold a value

[22:30](#msg58eeaa8d408f90be66b57414)block is collection of values

[22:30](#msg58eeaa938e4b63533dc24d63)some values may be words

AlexanderBaggett

[22:31](#msg58eeaabea0e4856242fb9355)I understand.

[22:31](#msg58eeaac9bdf4acc11253c4c4)So what is unset! ?

rebolek

[22:32](#msg58eeaaee69a692963ea54ffe)`unset!` is special value that is treated as non-value.

AlexanderBaggett

[22:33](#msg58eeab2a69a692963ea5512d)is it similar to void in C style languages?

greggirwin

[22:33](#msg58eeab2b69a692963ea55145)@bolek, you're blowing minds! :^) Maybe leave first class functions out of the mix for now, if @AlexanderBaggett is just starting with Red.

rebolek

[22:33](#msg58eeab3408c00c092a75a29f)It is value that is returned from function that should not return a value.

AlexanderBaggett

[22:33](#msg58eeab3a408f90be66b5765a)Oh

[22:33](#msg58eeab498bb56c2d11a0e87e)Well now I am no stranger to functional programming

rebolek

[22:33](#msg58eeab4f8fcce56b20f7fa19)@greggirwin I should, but @AlexanderBaggett has great questions :)

AlexanderBaggett

[22:34](#msg58eeab65a0e4856242fb957f)passing around functions and blocks of code is not new to me.

greggirwin

[22:34](#msg58eeab858bb56c2d11a0e917)&lt;he he&gt; Coming back to sequence types. Red calls them `series!`. In the console you can see what types support series actions:

```
>> ? series!
series! is a typeset! of value: make typeset! [block! paren! string! file! url! path! lit-path! set-path! get-path! vector! hash! binary! tag! email! image!]
```

There are a lot.

AlexanderBaggett

[22:35](#msg58eeab9808c00c092a75a35f)But decomposing data into executable code and then evaluating it is a bit new for me.

greggirwin

[22:35](#msg58eeabb9408f90be66b577d5)If you do `? foreach` in the console, you can see that its first arg is a `series!` type, so any of those types will work there.

AlexanderBaggett

[22:35](#msg58eeabc38fcce56b20f7fc47)Okay

greggirwin

[22:35](#msg58eeabcead849bcf427b2289)It's a mind bender for a while, for everyone.

AlexanderBaggett

[22:36](#msg58eeabf74cb8d0917385c5cb)Also, since this is functional programming, sometimes I am having trouble knowing when to use type? versus ?

rebolek

[22:36](#msg58eeac0a8fcce56b20f7fd1c)Just use both ;)

AlexanderBaggett

[22:37](#msg58eeac2aa0e4856242fb97fa)so ? essentially tells me the arguments and usage of a given function in the api yes?

rebolek

[22:37](#msg58eeac3a408f90be66b5799c)yes

greggirwin

[22:37](#msg58eeac4408c00c092a75a67f)`help/?` is for interactive use. `Type?` is more for runtime use, but also handy when debugging.

michaeldesu

[22:37](#msg58eeac45f22385553d365ef6)wow - so much interesting activity overnight  
I have a question about the above parse example, since I also want to get my head around this..  
if `some` mean one or more, then if I change the text to "text: "welcome 12-01-17 how are you 12-02-17" and re-run the parse `parse text [some [copy d date | skip]]` then I'm not sure why d is not returning a block of 2 dates

greggirwin

[22:38](#msg58eeac598e4b63533dc254d4)`?` is just an alias for `help`.

rebolek

[22:38](#msg58eeac5e69a692963ea555e4)`type?` will give you datatype of value that a word holds.

greggirwin

[22:39](#msg58eeacb708c00c092a75a7fa)@michaeldesu, if you want to collect values when parsing, use the `collect` keyword in your rules. In this case, the last match wins. If you merge your new test data with the `probed` version I posted, you can see it finds both.

michaeldesu

[22:40](#msg58eeaccb69a692963ea55783)thanks Gregg

rebolek

[22:40](#msg58eeacdcb52518ed4d0754f2)@greggirwin you were faster again ;)

greggirwin

[22:40](#msg58eeace7ad849bcf427b2624)\*This* time. ;^)

[22:40](#msg58eeacf88e4b63533dc257c5)You must have been busy. ;^)

AlexanderBaggett

[22:41](#msg58eead258bb56c2d11a0f180)So Gregg about what you said earlier about series! It looks like I can pass in a block! for foreach. Does it have a way of determining that the block is actually a series?

rebolek

[22:41](#msg58eead254cb8d0917385c964)@greggirwin Yes, I am still working on a bot that will beat both of us :smirk:

michaeldesu

[22:41](#msg58eead2f8e4b63533dc258a9)parse is like a world to its own.. but sounds like it's great - have to drop a lot of baggage or past thinking

greggirwin

[22:42](#msg58eead608e4b63533dc25941)`Parse` is the crown jewel. Indeed a world of its own.

rebolek

[22:42](#msg58eead61ad849bcf427b286c)@AlexanderBaggett block! is always a series!

AlexanderBaggett

[22:42](#msg58eead6ea0e4856242fb9b34)Oh

[22:43](#msg58eead8e8fcce56b20f80377)are there series! that are not block!s or vice versa?

rebolek

[22:43](#msg58eead908e4b63533dc259e6)`series!` is meta-type and `block!` is part of it.

[22:44](#msg58eeadb308c00c092a75ad92)Yes, `string!` is also a `series!` but it's not a `block!`

greggirwin

[22:44](#msg58eeadc58e4b63533dc25a6e)@AlexanderBaggett, Red can use typesets to verify that a value supports certain actions. `? typset!` will show you all of the standard ones, but you can define your own as well. As Bolek says, we sometimes call them metatypes or pseudotypes.

rebolek

[22:44](#msg58eeade308c00c092a75ae6e)There are other `series!` types, but do not care about them for now

AlexanderBaggett

[22:45](#msg58eeae26a0e4856242fb9df8)Ahh, so that is why `foreach w "hello" [print w]` works

greggirwin

[22:46](#msg58eeae43b52518ed4d075a10)Correct. Strings are also series values.

AlexanderBaggett

[22:47](#msg58eeae7b69a692963ea55cc1)Okay one sec. `foreach w "hello" [print type? w]` prints out `char` but I thought value types ended with a !

greggirwin

[22:48](#msg58eeaeaff22385553d36692e)They do. `foreach w "hello" [print mold type? w]` will show you the value that way.

AlexanderBaggett

[22:48](#msg58eeaed88fcce56b20f809be)Okay, so then what does `mold` do?

greggirwin

[22:49](#msg58eeaeea4cb8d0917385d067)`Print` does an implicit `form` on values, which produces their human friendly format. `Mold` produces a `load`able format, much like `write` vs `save`.

AlexanderBaggett

[22:50](#msg58eeaf368e4b63533dc25f68)Thanks :)

greggirwin

[22:51](#msg58eeaf5608c00c092a75b3a2)There's another option in this case. `foreach w "hello" [print type?/word w]` Now you've see a refinement used on a function. :^)

AlexanderBaggett

[22:52](#msg58eeaf90bdf4acc11253d420)It looked like refinements are the equivalent of properties in C style languages

greggirwin

[22:52](#msg58eeafa7ad849bcf427b3195)Play with `mold` in the console, on blocks too, to get a feel for it.

AlexanderBaggett

[22:52](#msg58eeafa88fcce56b20f80bfa)but what are they really since type? is a function (I think its a function anyway).

greggirwin

[22:53](#msg58eeafce8bb56c2d11a0fcb8)C doesn't have properties, so not sure what you mean. OOP C-langs do, but refinements are not the same thing.

AlexanderBaggett

[22:53](#msg58eeaff58e4b63533dc261ff)What is a refinement?

greggirwin

[22:53](#msg58eeaff68bb56c2d11a0fd8d)`Type?` is a function, you're correct. Refinements let you specify optional behavior and arguments, to "refine" how a function behaves.

AlexanderBaggett

[22:53](#msg58eeaffdb52518ed4d07618b)Ah

rebolek

[22:53](#msg58eeb0018bb56c2d11a0fda7)refinement is basically a switch that can be used with a function

greggirwin

[22:54](#msg58eeb0088fcce56b20f80e78)Refinements are also first class values. :^)

AlexanderBaggett

[22:54](#msg58eeb00d4cb8d0917385d426):)

[22:54](#msg58eeb02b69a692963ea56287)Well, I learned a lot today. Thanks to both of you. I will be back tomorrow with more questions

greggirwin

[22:54](#msg58eeb03db52518ed4d076331)Great! See you then.

rebolek

[22:55](#msg58eeb053a0e4856242fba544)@AlexanderBaggett thank you. I love good questions :)

greggirwin

[22:56](#msg58eeb091408f90be66b58a71)Bolek pretends he wants to help people. Really he just wants to melt their minds.

rebolek

[22:58](#msg58eeb11c8e4b63533dc265fe)Gregg, you should keep that for yourself, not everybody has to know it.

greggirwin

[23:00](#msg58eeb1718fcce56b20f81441)And on a public channel. Shame on me. Oh well, at least you're not a zombie.

## Thursday 13th April, 2017

michaeldesu

[00:47](#msg58eecaaa69a692963ea5be97)following from the above parse discussion, I'm studying the suggested rebol page on parsing . I have a question about the first example (splitter example)

```
probe parse "The trip will take 21 days" none
["The" "trip" "will" "take" "21" "days"]   ; expected output
```

this doesn't work in Red (nor similar attempts like \[none]) - I get an error. What is the Red equivalent?

greggirwin

[01:54](#msg58eeda5bad849bcf427bc181)Red's parse does not do the simple splitting that Rebol's did, by design. Right now, Red has a simple `split` function, which will be enhanced in the future.

```
>> split "The trip will take 21 days" space
== ["The" "trip" "will" "take" "21" "days"]
```

michaeldesu

[01:59](#msg58eedb6c08c00c092a764f35)@greggirwin Thanks alot for that. `split` is more intuitive in that regard, so I'm glad about that improvement.

geekyi

[03:52](#msg58eef6158bb56c2d11a1f3b5)@michaeldesu I think `split` is the only feature in rebol2 `parse` that isn't in red (also same as red in rebol3)

raton3062015

[03:54](#msg58eef65ba0e4856242fca0a6)t: "raton1234" tt: "1234raton" ttt: "ra1234ton" . with parse = 1234

geekyi

[03:56](#msg58eef6d28bb56c2d11a1f4f7)@AlexanderBaggett red isn't just a functional programming language. It doesn't fit any particular paradigm. It blows your mind multiple times. And that's the only thing you can expect consistently.. to be different

[03:57](#msg58eef72d8fcce56b20f9071c)And I've used "weird" languages like `j`, `factor` and others.. and it's the most mind bending of them all

[03:59](#msg58eef791bdf4acc11254d47c)\*P.S.* @AlexanderBaggett and @raton3062015 , do you know you can use three backticks? "\`" (ctrl+shift+m for more details)

9214

[05:43](#msg58ef10114cb8d09173871f4e)and how can I enclose backtick inside backticks? :D

[05:43](#msg58ef10198e4b63533dc3bd32)`\`\`

[05:44](#msg58ef1046bdf4acc11255260f)`\`\\

[05:44](#msg58ef104ff22385553d37b5c4):confused:

geekyi

[06:22](#msg58ef192aad849bcf427c9c6e)@9214 one of those deep mysteries I haven't been able to solve 😝 how do you escape the escapes? How do you \[mention the uses](https://en.wikipedia.org/wiki/Use%E2%80%93mention\_distinction)?

Phryxe

[08:54](#msg58ef3cbfa0e4856242fdb61c) a`b`

geekyi

[11:13](#msg58ef5d488bb56c2d11a3ab3f)@9214 :point\_left: \[April 13, 2017 4:10 PM](https://gitter.im/red/sandbox?at=58ef5cb14cb8d09173885977)

9214

[13:00](#msg58ef76608bb56c2d11a42124)\`

michaeldesu

[13:01](#msg58ef7693a0e4856242feb91f)this might not be the right place, but I wonder if anyone else using the Mac red-062 has found that if you press shift-left arrow or shift-right arrow, it seems to cause a freeze of the REPL (escape does not recover)

maximvl

[13:05](#msg58ef77aaa0e4856242febd3f)@michaeldesu the cli repl or gui one?

9214

[13:07](#msg58ef78198bb56c2d11a429aa)@maximvl I think CLI, since GUI is Windows only (for now)

maximvl

[13:08](#msg58ef783f69a692963ea87c2d)@9214 not anymore ;)  
https://twitter.com/red\_lang/status/850331925004771333

9214

[13:10](#msg58ef78b8ad849bcf427e4de9)@maximvl true, my bad

:point\_up: \[13 апреля 2017 г., 17:38](https://gitter.im/red/red?at=58ef7138ad849bcf427e26a6)

AlexanderBaggett

[16:40](#msg58efa9f7ad849bcf427f543a)FYI, the file properties of red-062.exe still show Rebol stuff.

[16:42](#msg58efaa64f22385553d3a884b)http://imgur.com/a/PQdfY

dockimbel

[16:51](#msg58efaca4b52518ed4d0b71da)@AlexanderBaggett Good catch, we'll see how to customize those properties in our building toolchain.

greggirwin

[16:56](#msg58efadae69a692963ea987fd)The Mac GUI release is huge news. Once again, Go Team Red!

AlexanderBaggett

[22:09](#msg58eff722ad849bcf4280a97b)is `.reds` for Red/System files?

maximvl

[22:10](#msg58eff745f22385553d3bdbfb)@AlexanderBaggett it is, yep

michaeldesu

[23:33](#msg58f00ae008c00c092a7b606f)@maximvl sorry for (overnight) delay, yes I was using CLI (i.e. launching red-062 within the Mac terminal).

[23:36](#msg58f00b9bbdf4acc112599667)I should try the Mac automated build version - thanks for the tip

[23:43](#msg58f00d1c8bb56c2d11a6be37)I just tried Mac 'red-13apr17-b27625b' and lauched it, and after it compiled itself, I found the same freeze issue (it's really minor) when pressing shift-left or right arrow keys

PeterWAWood

[23:48](#msg58f00e30ad849bcf4280f898)I can confirm the problem and have opened #2575.

michaeldesu

[23:48](#msg58f00e4c08c00c092a7b6c42)@PeterWAWood Thanks alot!

## Friday 14th April, 2017

michaeldesu

[04:29](#msg58f05032f22385553d3cfc8d)I would like to ask if someone can confirm my understanding about `parse` in the following case. I've been studying some docs, and trying simple variations of `parse "dog cat" [some ["cat" | "dog" | space]]` and trying to get my head why some pass/fail, and I believe to understand it, it's good to understand the moving pointer or index concept. For the following example (I'd like to confirm my understanding of why it returns `false` since I thought at first it should be `true` due to the 'dog' part at the start:

```
parse "dog c at"  [some ["cat" | "dog" | space]]  ; returns false
```

at the start, the pointer is at 'd' and it's a 'pass' since those 3 chars is a match for dog. Then the pointer is moved to the space after 'g' and that is a 'pass' since it matches the space, and then the pointer is moved to the 'c' which presents a fail since neither 'c' nor 'c a' is a match for any rule. Is that the correct mechanism for the above code? This was based on the premise that `some` continues until failure. Sorry this was long.

dockimbel

[05:47](#msg58f06266ad849bcf428201db)@michaeldesu Your understanding is correct, `some` stops on failure to match, and as the input's end position has not been reached by the parsing rules, `false` is returned.

[05:48](#msg58f062c9bdf4acc1125aa86e)A different way to express it could be: if there is no path through the rules, which allows to reach the end position of the input series, a `false`will be returned.

9214

[05:53](#msg58f063c7ad849bcf42820688)@michaeldesu \[some nice parse tutorial](https://en.wikibooks.org/wiki/REBOL\_Programming/Language\_Features/Parse), it's for Rebol though, \[here's a blog post for Red version](http://www.red-lang.org/2013/11/041-introducing-parse.html)

michaeldesu

[06:16](#msg58f06950bdf4acc1125abc4f)@dockimbel Thanks for the confirmation - it's taking me a while to get my head around it - but it seems like the effort will be worth it @9214 Thanks - yes, I'm using the Red version as a main reference.

greggirwin

[06:19](#msg58f069f708c00c092a7c8b81)It's worth it. I think we should coin a new paradigm: Parse Oriented Progamming. :^)

dockimbel

[07:21](#msg58f0786169a692963eac4940)Just POP it! ;-)

raton3062015

[07:21](#msg58f0788bad849bcf42824b4f)text: "abcdeff1245". i want to parse digit. ...........

[07:22](#msg58f07898f22385553d3d7c0b)digits: charset "0123456789"

[07:22](#msg58f078c98e4b63533dc98f30)parse text \[some \[ copy x digits (append k: "" x) | skip]]

dockimbel

[07:32](#msg58f07afe8bb56c2d11a815e5)@raton3062015 `copy x digits` =&gt; `copy x some digits`. Moreover, the (append k: "") part there is not needed, if `k`word is the one which needs to refer to the extract digits string, then just use it instead of `x`.

raton3062015

[07:38](#msg58f07c7df22385553d3d8ae0)text: abc14def19

[07:38](#msg58f07c888bb56c2d11a81b00)will just returning last 19

[07:39](#msg58f07c9a408f90be66bc7228)if i want to extract all digits 1419

[07:39](#msg58f07ccb4cb8d091738cb5e3)or just first 14

dockimbel

[07:41](#msg58f07d3ead849bcf42825a03)In such case, your code was correct.

[07:42](#msg58f07d74ad849bcf42825af4)For limiting the number of loops, use an integer value instead of `some`. For example: `2 [copy...` for extracting only first 2 digits.

raton3062015

[07:45](#msg58f07e15ad849bcf42825f06)parse {abcdef1245sadf} \[some \[copy x 2 digits | skip]]

[07:45](#msg58f07e1af22385553d3d90ce)result 45

dockimbel

[07:50](#msg58f07f528fcce56b20ff0a08)It depends if you want first two digits or first number with two digits. ;-)

raton3062015

[07:51](#msg58f07f8b08c00c092a7cd51d)first number with 2 digits. text: "abcdefs12efabc1457"

dockimbel

[07:52](#msg58f07fa0408f90be66bc7943)Then your code is correct.

raton3062015

[07:53](#msg58f08001f22385553d3d98ef)parse {abc12slkdfjkdl1245} \[some \[copy x 2 digits break | skip]]

[07:53](#msg58f0800a8bb56c2d11a82701)x = 12

[07:54](#msg58f0801f4cb8d091738cc0f4)if i don't use break then x = 45

dockimbel

[07:56](#msg58f0809408c00c092a7cd91e)You're right, I overlooked it. You can use a simpler approach then, for extracting the first number:

```
parse {abc12slkdfjkdl1245} [to 2 digits copy x 2 skip]
```

raton3062015

[08:03](#msg58f08250408f90be66bc83b4)pls explain what is happening here

iArnold

[08:22](#msg58f086dd8fcce56b20ff2520)The first block is to be parsed using the rules following it. (And as I understand this)  
The rule says first go to the place where you find 2 digits in a row, then copy into x the next 2 places then skip (to the end).

greggirwin

[15:18](#msg58f0e84569a692963eae07bc)Close Arnold. `copy x 2 skip` means "copy into x the contents to 2 skips". Nothing says to go to the end in this case, so the parse will actually return `false`, because the 2 skips didn't reach the end of the input. You could just add `to end` to the end of the rule though.

## Saturday 15th April, 2017

michaeldesu

[00:15](#msg58f1662069a692963eafe0b1)still learning.. but I think the following is more intuitive

```
parse "abc12slkdfjkdl1245" [to 2 digits copy x 2 digits]   ; or [to 2 digits copy x 2 digits to end] ; to get true result
```

originally I got hung up on true = matches found, but I guess if you're copying into a variable then the return value doesn't matter?

greggirwin

[00:51](#msg58f16ea88bb56c2d11aba9bd)You can certainly be more explicit with your rules than just using skip. More self documenting and likely protected from inadvertent changes as rules morph.

michaeldesu

[03:29](#msg58f19381ad849bcf42867c45)@greggirwin Thanks alot for your explanation to Arnold above - very helpful

rpherman

[14:53](#msg58f233f08bb56c2d11ae072c)I posted this on Google Groups, but I figure this is where I should be asking questions from now on:I am closely following Red, but I have not learned enough to go beyond other people's examples.

I like doing math and graphics programming, usually the two together! I juse C, J and sometimes Mathematica or Python.

With C and Python as two ends of the fast -&gt; almost fast spectrum, where would Red fit in for something like graphing visual complex functions such as these examples by a J programmer:

http://code.jsoftware.com/wiki/User:Andrew\_Nikitin/Phase\_portraits

Red keeps luring me!

Rob

maximvl

[15:20](#msg58f23a2169a692963eb276fb)@rpherman Hi and welcome :)  
Red should be fast enough for such things, unfortunately I don't know J to port your example

greggirwin

[16:20](#msg58f2486ba0e48562420902ba)Hi Rob. I replied on the ML, but good to see you here. Here's what I said there:  
&gt; Red will be in the Python league, Red/System (the C level dialect of Red) will be much closer to C. No optimizing in place for either yet, but check out the Red/System demos, like Mandelbrot, to see what it can do. It should be 2-4x C speed in most cases. As the mandelbrot demo shows, you can easily prototype in Red and translate as well, or just drop down to Red/System for the routines that need to be fast.

I should clarify that 2-4x is \*slower* than C speed.

gltewalt

[19:12](#msg58f270b88bb56c2d11aedb63)@rpherman @geekyi Knows J. He might have some ideas.

rpherman

[22:45](#msg58f2a27fad849bcf428a312f)Thanks, everyone! I will probably check here more often. Google Groups seems to be lagging for all of my groups. I know J, but not the plotting or image libs as well as just straight J. The pictures on the link were just beautiful without understanding them fully, but some took quite long to render if I changed the 128 to 1024 for higher resolutions.

[22:48](#msg58f2a330a0e48562420a5126)The J language is available as a DLL. It can call C and C can call it, so I am hoping it can be used with Red. What are the maths libs available in Red? I am teaching myself Geometric Algebra, a type of Clifford Algebra, that is finding great use in computer vision, graphics and many other fields. There is a C++ library called Versor that would be great if I could call into it, and build GUI and OpenGL/WebGL demos in! Red reminds me of my Amiga days of building and not sweating the platform or GUI details as much as what it is I am trying to create. Thanks 100X!

[22:49](#msg58f2a36da0e48562420a5200)What room should I move this conversation over to in future? red /red, or red /help?

## Sunday 16th April, 2017

greggirwin

[00:03](#msg58f2b4ca881b89e101547f2d)libRed also allows Red to be called from other langs, as well as calling out to them from standard Red+System, so integration is possible on many levels. Red doesn't have any math libs yet, but there's OpenCV work done by Francois Jouen which is very cool.

Calling into C++ libs requires they be `extern c` callable.

Just post where it seems most appropriate.

[00:04](#msg58f2b4fe4cb8d09173947ab5)The worst thing about Redbol langs is that they kind of ruin everything else for you. ;^)

geekyi

[12:03](#msg58f35da608c00c092a8687e7)@rpherman :point\_up: \[April 15, 2017 7:53 PM](https://gitter.im/red/red/welcome?at=58f233f08bb56c2d11ae072c) Red being very much alpha, so there aren't many libs for anything like you want, especially visualization of complex functions :smile: (unless, so you have to code your own. I use other software like \*fragmentarium\*, \*mandelbulber* and \*visions of chaos* for that. While they are fractal drawing programs, you can hack them to display what you want. I also think using gl shaders like used in those is the way forward, good news is, most of those are open source. So, I think that also answers your question:  
&gt; What are the maths libs available in Red

What red code exists you can search on \[github](https://github.com/search?utf8=%E2%9C%93&amp;q=language%3ARed&amp;type=Repositories&amp;ref=advsearch&amp;l=Red) and I see Gregg has mentioned RedCV.  
I've been reading about the \*Versor* library you mentioned, and it looks very interesting! But I'm on windows and I've not been able to find an easy way to download and run it.  
After much browsing, I found a port called \[versor.js](http://weshoke.github.io/versor.js/examples/C3.hopf.html) which demonstrates some of its features

[12:06](#msg58f35e47881b89e101568753)The functions in the \[appendix](http://versor.mat.ucsb.edu/masters\_appendix.pdf) could be implemented as a dialect

rpherman

[12:57](#msg58f36a35ad849bcf428c9d52)Thanks @geekyi! I have used those programs, and they are wonderful. I code for fun, not work, so creating things is my hobby when I code. I am hoping to do many things with Red. The versor.js library is good, but I don' think it is a full implementation. Echolisp is a language that is a Lisp in Javascript that does math and other graphing too. I could just create simple vector classes, and such, I just didn't want to reinvent a library. I also don' t know if it is easy enough to just create an interface for existing C libs. I prefer C over C++, since I know it better.

[13:00](#msg58f36b06bdf4acc11264f95a)The cool thing about Geometric Algebra (GA) is that you can think geometrically in numeric or algebraic terms. It expresses things like the circle created by intersecting spheres in a very concise equation, so you can start to think of manipulating geometry without all of the matrices coming up. Remembering even basic 2D transformation matrices usually requires I look them up each time I walk away from the subject for a bit. Yes, OpenGL/WebGL would be a great library to have in Red, and a hook into BLAS and LAPACK to do all sorts of fun game/math stuff! Sounds like I have my plate filled for year or so!

Mufferaw

[13:53](#msg58f37749a0e48562420ce289)@rpherman and anyone else that is interested, I recently picked up a good introductory book called "Geometric Algebra for Computer Graphics" by John Vince. Been too busy to dig into the book but the bits that I did read seemed pretty easy to follow.

geekyi

[14:01](#msg58f3793e8bb56c2d11b22705)@rpherman  
&gt; I also don' t know if it is easy enough to just create an interface for existing C libs. I prefer C over C++, since I know it better.

It should be easy enough especially for C. It depends on what you want to do, see \[red blog posts](http://www.red-lang.org/search/label/compilation) , and \[intro to red system](http://red.qyz.cz/red-system-from-red.html) by rebolek

[14:03](#msg58f379bda0e48562420cebfe)@Mufferaw nice, should collab once we have enough people right?

[14:05](#msg58f37a33f22385553d47cc57)I've just installed CLUCalc 4 and am playing with it, has an interesting interface

[14:12](#msg58f37bb34cb8d0917396e1b7)\[!\[image.png](https://files.gitter.im/red/red/welcome/T69A/thumb/image.png)](https://files.gitter.im/red/red/welcome/T69A/image.png)

[14:14](#msg58f37c438fcce56b20092fe6)\[output.webm](https://files.gitter.im/red/red/welcome/8ka4/output.webm)

[14:15](#msg58f37c8f408f90be66c6a1f0)Concise code, interactive output

Mufferaw

[14:15](#msg58f37c968bb56c2d11b233b3)@geekyi I don't know much about the subject but I wanted to try to make something like GeoGebra (except a lot more basic) to experiment with

geekyi

[14:17](#msg58f37cf269a692963eb6a734)@Mufferaw sounds like a good idea, tho I'm still at the exploring and learning stage.. I'd need to understand more..

[14:17](#msg58f37d14408f90be66c6a3be)This might actually be useful for another idea I had.. being able to quickly change coordinate systems

[14:19](#msg58f37d6069a692963eb6a85d)Would be really useful for a vector drawing app, for the next generation of \*Sketch*

[14:19](#msg58f37d8e69a692963eb6a8c5)I'd need to write down the design of that first tho, it's all in my head right now. Too much is in my head :smile:

Mufferaw

[14:21](#msg58f37dce408f90be66c6a689)@geekyi Haha, I know what you mean. I have a lot of things that I want to do but not nearly enough time!

greggirwin

[15:54](#msg58f393cba0e48562420d4c6c)@rpherman, have you seen what VPRI has done with their Nile language? Might be right up your alley.

dsgeyser

[16:29](#msg58f39bd7a0e48562420d6857)@geekyi Did you manage to run Gritter in latest build? I need to save on data, and stay off the browser.

geekyi

[20:24](#msg58f3d2ea408f90be66c7e5d1)@dsgeyser no, I used only gritter's Gitter.red api lately.. Which you could also use in principle.. Right now, I don't think gritter is that optimized to save on data either.. @rebolek knows best

## Monday 17th April, 2017

rpherman

[03:00](#msg58f42fdfa0e48562420f5682)@Mufferaw Vince's book is a very gentle introduction. I am also interested in GA for physics. David Hestenes book "New Foundations for Classic Mechanics" is mind-blowing. He is the one responsible for dredging this all up again and for bringing on a GA renaissance of sorts. The history of how vectors and matrices won out over Grassman and Clifford's work is another example of how the solution that wins is not always the best one.

[03:04](#msg58f430bdad849bcf428f5fca)I personally prefer Kenichi Kanatani's "Understanding Geometric Algebra: Hamilton, Grassmann and Clifford for Computer Vision and Graphics". He goes through all of them to show how GA evolved, and applies it to common computer graphics work.

[03:06](#msg58f43119881b89e1015965fd)@geekyi I blew countless bus trips playing with CluCalc. "Geometric Algebra for Physicists" was what I read to understand what I was doing with CluCalc back then.

[03:09](#msg58f431f4881b89e1015968b7)The interesting fact is that GA gives you power to do symbolic geometry on paper again, however, even libraries written to take advantage of it on the computer are still slower than the optimized vector, matrix stuff already out there. One is that the most useful GA is the conformal model in 5 dimensions to do 3D work. You are dealing with that many more calculations for the processor. I think this will change with time. For me, the real win is the ability to be able to abstract in my head and on paper, whereas computational science is moving into the area of just being able to view results, and not the way there.

[03:12](#msg58f4328e0ed3020c3822fc32)Pablo Colapinto (wolftype) the creator of Versor, I think nailed it with his library. His dissertation is a great read too. Now, I need to figure out how to make a Versor livecoding GUI in Red!! I've been on the GA horse for almost 12 years, so this would be a milestone for me to be able to start coding and playing with GA, rather than making toy exercises in it.

[03:19](#msg58f4345569a692963eb90a02)@greggirwin I remember an HN article about HN, but I never followed enough to get to the bottom of it. I seem to remember the rabbit hole of links never led to a simple 'what is it, and this is how you use it' kind of article. I'll google later, thanks! I can tell from the little interaction here that Red's community is also right up my alley!

michaeldesu

[04:13](#msg58f440ffd32c6f2f0911d2e3)I have a question about reading (a large) text from a file line-by-line. In python, one could iterate over a file object, which automatically uses buffered IO/memory management. I'm wondering if Red supports the same, maybe in like the following?

```
foreach line read/lines %mydata [print line]
```

greggirwin

[04:51](#msg58f449db69a692963eb944cb)I/O is basic right now. Real I/O will come in 0.7.0 and will likely have direct mode for unbuffered access as an option.

dsgeyser

[06:05](#msg58f45b44bdf4acc11268172a)

rebolek

[06:12](#msg58f45cc58e4b63533dd6c520)@dsgeyser I made changes to Gitter API that are not reflected in Gritter yet (just in Gitter tools). I will fix it and let you know.

michaeldesu

[07:08](#msg58f469d3a0e48562420ffa28)@greggirwin Thanks. It's probably not a big deal for now - I gather Red can access as much RAM as available within a 64-bit env on Windows?

greggirwin

[08:01](#msg58f476738fcce56b200c6992)Red is 32-bit only right now, so limits apply. 64-bit will come when it's self-hosted. Remember, it's early days for Red.

dockimbel

[08:03](#msg58f476efbdf4acc112687120)@michaeldesu 4GB only for now.

michaeldesu

[09:27](#msg58f48a8b08c00c092a8a6dd1)no problem - grateful for what it is today :-)

AlexanderBaggett

[19:47](#msg58f51bd008c00c092a8ce1f0)Hi all, I am trying to do something simple here. I am trying to create a view with a red image. I can't seem to get the syntax correct however.

[19:47](#msg58f51be6d32c6f2f09151e16)This is what I have so far. Correct me here if I don't understand something.

[19:47](#msg58f51bea0ed3020c38266c1e)view \[title "stuff" size 400x400 canvas \[img: make image! reduce \[640x480 red] ] ]

Scaremonger

[19:56](#msg58f51decd32c6f2f0915260b)@AlexanderBaggett - I don't know what a canvas is yet (I'm still learning too), but you can draw an image using the "IMAGE" face type  
(Make sure you have a .JPG called example.jpg in the same folder):

```
Red [ needs view ]
img: %example.jpg
view [
	size 400x400 
	image img 300x300
]
```

AlexanderBaggett

[19:56](#msg58f51df0d32c6f2f0915263d)Okay this produces a grey square `view [title "stuff" size 400x400 base [make image! reduce [640x480 red]] ]`

[19:57](#msg58f51e16881b89e1015cff3f)I messed up earlier, canvas was a variable name in a tutorial I was looking at.

[19:57](#msg58f51e1e08c00c092a8ceb7c)http://redlcv.blogspot.fr/

Scaremonger

[19:57](#msg58f51e45ad849bcf42930410)You can draw a simple red box by changing the `image img 300x300` to `box 300x300 #f00`

greggirwin

[19:58](#msg58f51e55bdf4acc1126b2ff7)'Canvas\` isn't a known style in VID. That's one problem. Another is that blocks inside VID are used for actions, when a user interacts with a face. You can't just put Red code in there and have it evaluated. In general anyway.

[19:59](#msg58f51eafd32c6f2f09152a23)`view [base 400x400 red]` will do it minimally.

AlexanderBaggett

[19:59](#msg58f51eb0d32c6f2f09152a25)Thank you @Scaremonger , that does work.

Scaremonger

[20:00](#msg58f51ef108c00c092a8cf077)@AlexanderBaggett - VID and VIEW have got some decent examples \[here](http://www.mycode4fun.co.uk/About-Red-Programming) and the full documentation is \[here](https://doc.red-lang.org/en/view.html#\_check).. I'm just working my way through it at the moment.

greggirwin

[20:01](#msg58f51f0808c00c092a8cf09d)That just sets the color of the face though. If you want an image to manipulate and update, you need to do that separately, changing pixels in an image! or using `draw` commands.

Scaremonger

[20:06](#msg58f5202fd32c6f2f09153197)I've not got to Draw yet... :) Still messing about with the normal GUI components at the moment.

greggirwin

[20:06](#msg58f5204ef22385553d4dc5a5)That's a good way to start.

[20:09](#msg58f520f8f22385553d4dc9a1)There are a lot of features, and things are different enough from other langs that it can take some getting used to. Eventually you'll expect \*everything* to take minimal effort and code, and complain when it takes a dozen lines to connect a few things via dynamic reactors. :^)

Scaremonger

[20:11](#msg58f5216ba0e485624212fdcb)I'm already impressed at how easy it is to create a GUI. I've created a test app with a GUI the same as an app I wrote in another language and although it's not quite identical (whilst I mess about with the properties of faces) it's certainly a lots smaller.

maximvl

[23:02](#msg58f54977ad849bcf4293be39)@AlexanderBaggett you can check out the way I draw on image here: https://gist.github.com/maximvl/12d7f153c3479a54044f45cd8a5ace47

## Tuesday 18th April, 2017

michaeldesu

[00:59](#msg58f564ef08c00c092a8e11de)does Red have (or likely to have) native Zip file (decompress/compress) support? I did find some r code on the Rebol site for extracting files from zip so I can look at that if need be (just thought I'd check here first). Thanks.

greggirwin

[02:01](#msg58f5738a881b89e1015e4520)At least a few of us want that as a native element, but it won't be standard soon, unless someone takes it on personally. I think they'd like it in Red, but it's not a priority for the core team to work on.

dockimbel

[03:22](#msg58f5868708c00c092a8e77eb)@michaeldesu We will have it in the future, but not before 0.7.0.

## Wednesday 19th April, 2017

michaeldesu

[01:49](#msg58f6c227881b89e101639bdc)I have another parse question - I've figured out how to collect all required items using:

```
digit: charset "0123456789"
date: [2 digit "/" 2 digit "/" 2 digit]
parse "welcome 12/01/17 how are 13/01/17 you" [(found: []) some [copy d date (append found d) | skip] to end]
```

is there a better, clearer or more intuitive way to do this? e.g. with collect or other? Also I believe 'to end' is optional in this case, but is there any good reason to keep it? Thanks.

greggirwin

[01:56](#msg58f6c3e1f22385553d546170)Since you have `| skip` you don't need `to end`. It will just get there one item at a time.

Here it is using parse's `collect`.

```
parse "welcome 12/01/17 how are 13/01/17 you" [
    collect some [keep copy d date | skip]
]
```

[01:58](#msg58f6c44469a692963ec33be1)`to end` is handy when you are looking for things in data, and once you find them you're done and can skip to the end. That way you still get a `true` result.

michaeldesu

[02:05](#msg58f6c5d9ad849bcf4299c7e7)Thanks alot @greggirwin . I admit to struggling a bit with `copy d date` as the replacement for just `date`. So am I right in that the system kinda works from the "inside out", in that parse is doing the `some [date | skip]` with the extra items like `copy d` (and even `keep`) are modifiers that add extra functions like the copy &amp; keep etc?

greggirwin

[02:08](#msg58f6c6ba8fcce56b2015b374)I haven't examined the `parse` source, so can't say with authority how it works internally. http://www.red-lang.org/2013/11/041-introducing-parse.html nicely puts the commands in sections, with their purpose. It's a bit tricky because you put parens \*after* the match has succeeded, but the extraction rules come \*before\*, still only triggering if the rule succeeds.

[02:11](#msg58f6c737d32c6f2f091bb885)You can think of `keep/copy` kind of like "start copying at this point in the input until the end of the following rule. If the rule fails, don't complete the copy operation."

[02:11](#msg58f6c766f22385553d546e77)i.e. "Copy from &lt;here&gt; to the end of &lt;rule&gt;"

michaeldesu

[03:24](#msg58f6d86308c00c092a93ec39)thanks for your kind explanation - it's great. I've seen that doc, and it's very good. Generally, I found the transition from `date` to `copy d date` a bit strange, since I consider the initial `date` as the rule, and the `copy d date` as a complete set of instructions about the rule, i.e. copy into d the (just matched) rule (date) and that whole instruction replaces the original one (single rule). It might have been more intuitive like the `to` example above (`parse "abc12slkdfjkdl1245" [to 2 digits copy x 2 digits]`) where the search rule is achieved first, then the next step is the action as a result (i.e. copy). I realise this is not a Red matter per-se, it's just the parse design (and my lack of understanding :-)). I guess the way `some` works as an iterator is a bit lost on me, compared to the way `to` works, which is clear (advance the input) - but I think I get it now: in this case `some` is just a test of the block contents, and skip is doing the input movement upon match failure.

dockimbel

[05:09](#msg58f6f0f5d32c6f2f091c3b5f)@michaeldesu  
&gt; So am I right in that the system kinda works from the "inside out"...

That's a way to express it. Rules are stacked in Parse, so if a nested rule fails, the action of the parent rule(s) will not be carried on.

[05:12](#msg58f6f1b469a692963ec3ce1a)`some` evaluates the sub-rule (could be a block of rules or any other valid rule) iteratively, until the sub-rule fails. In the above case, `| skip` ensures that the sub-rule does not fail until the end of the input is reached.

michaeldesu

[05:23](#msg58f6f45fad849bcf429a58ed)@dockimbel Thanks alot

AlexanderBaggett

[14:53](#msg58f779e9cfec91927254cb21)`view [title "hi" size 600x600 base 500x500 red]`  
`? base` `Word base is not defined` What is `base` in this context? It doesn't appear to be part of view either as I did `? view` and didn't see it there either.

9214

[14:55](#msg58f77a6108c00c092a96825f)is this Red or Rebol code?

AlexanderBaggett

[14:55](#msg58f77a6a3e27cac331a330b6)Red

maximvl

[14:56](#msg58f77a8008c00c092a96835b)@AlexanderBaggett because `base` only belongs to `view` dialect

[14:56](#msg58f77a8b8bb56c2d11c1d057)it is not normal Red entity

AlexanderBaggett

[14:56](#msg58f77a9a3e27cac331a331d6)So I can't do `?` and find info on it?

maximvl

[14:56](#msg58f77aa6881b89e1016677c5)unfortunately nope

[14:57](#msg58f77acc8fcce56b201876ce)@AlexanderBaggett if `view` would have it's own `help`/`?` it could have contained explanation

AlexanderBaggett

[14:57](#msg58f77aecad849bcf429c9c89)That makes it harder to learn...

9214

[14:57](#msg58f77af43e27cac331a33403)hm, and how are we supposed to document DSLs?

dockimbel

[14:58](#msg58f77b0508c00c092a968553)@maximvl  
&gt; because base only belongs to view dialect

VID is the dialect, View is the GUI engine (working with faces).

9214

[14:58](#msg58f77b0f8bb56c2d11c1d365)aside from external documentation

maximvl

[14:58](#msg58f77b26881b89e1016679b6)@AlexanderBaggett you can find it here :D https://doc.red-lang.org/en/view.html

dockimbel

[14:59](#msg58f77b4fad849bcf429c9e6f)@AlexanderBaggett Dialect are like sub-languages, so their words have no meaning (or a different meaning) in the main language.

AlexanderBaggett

[15:00](#msg58f77b92881b89e101667bc8)I hear what you are saying, however there should be a way to pull up some kind of help on them without going to the web.

[15:01](#msg58f77bd2cfec91927254d40b)Also, the way things are documented on https://doc.red-lang.org/en/view.html is a different format than what you get it if you did `?` on something.

Oldes

[15:01](#msg58f77be7d32c6f2f091e8284)Right... there should be some help available for dialects.. do you have any idea how it should work?

dockimbel

[15:02](#msg58f77becf22385553d574ba2)We don't have yet a mechanism for providing a minimal doc about dialects.

9214

[15:02](#msg58f77c17881b89e101667e7b);

Oldes

[15:03](#msg58f77c31ad849bcf429ca2c7)I was thinking about special help function defined in the dialect context where the main help could redirect reqests.

maximvl

[15:04](#msg58f77c843e27cac331a33c45)something like `help/dialect base view` ?

9214

[15:04](#msg58f77c903e27cac331a33c5c)can dialect possibly be wrapped inside of a module?

dockimbel

[15:04](#msg58f77c9ba0e48562421c9c4f)@AlexanderBaggett `?` is a shorcut for `help` which provides help for words defined in the Red global (or local) context(s). Dialect words are not defined there, nor do they share the same concepts as the main language. Most dialects rely on keywords or commands, not words concept like in the main language. So the same helping system cannot be used (the format of the output would be totally different anyway).

maximvl

[15:05](#msg58f77ccabdf4acc11274aff5)I guess it can be redirected to something like `view/help 'base`

9214

[15:07](#msg58f77d2e08c00c092a968dea)in other words we need `help`dialect :D

AlexanderBaggett

[15:07](#msg58f77d39ad849bcf429ca7e7)Could we do something where I could type `view/? base` and get some info on base as an example? Or `Vid/? X` and get info on X

maximvl

[15:07](#msg58f77d3bd32c6f2f091e8944)lol

9214

[15:08](#msg58f77d7b08c00c092a968f70)idk how we gonna get help about `help` dialect itself

Oldes

[15:08](#msg58f77d858fcce56b201884ad)But `view` has nothing to do with the `vid` dialect.. it is the `layout` which is using the dialects and converts it into structure which `view` may use.

gltewalt

[15:09](#msg58f77d98ad849bcf429caa50)spec-of vid/X ?

Oldes

[15:09](#msg58f77db28bb56c2d11c1e528)Of course in the `view`'s doc string there may be mentioned a command which could be used for the `vid` help.

AlexanderBaggett

[15:10](#msg58f77dd4f22385553d575558)Anyway, I like the idea of using `?` to find out what we need to. I like the idea of not having to leave the red REPL to find out stuff. It makes the experience more immersive and enjoyable.

maximvl

[15:10](#msg58f77de58fcce56b20188676)@maximvl agrees

AlexanderBaggett

[15:10](#msg58f77de5f22385553d575595)That is my opinion anyway.

9214

[15:10](#msg58f77df3cfec91927254e07c):+1:

Oldes

[15:10](#msg58f77dfc8fcce56b2018869a)Anyway.. it should be made in a systematic way as there will be many dialects.

9214

[15:11](#msg58f77e20d32c6f2f091e8e5f)This is an interesting issue you've raised up

Oldes

[15:12](#msg58f77e458e4b63533de36592)It should be addressed with modules imho.

9214

[15:12](#msg58f77e6ea0e48562421ca5a2)that's what I think too

dockimbel

[15:13](#msg58f77ea4cfec91927254e409)I think we can add a list of the keywords/commands for each dialect with a minimal description of their purpose and syntax. Though, we need a way to leave it out of the runtime library when compiling apps which are not the Red console, so it probably should be pulled by the console's code from somewhere in the codebase.

9214

[15:16](#msg58f77f4cf22385553d575ca4)store dialect inside modules with additional information and docs which you optionally can through

dockimbel

[15:16](#msg58f77f5908c00c092a969ac9)Which modules?

9214

[15:17](#msg58f77f768e4b63533de36c3d)the ones which are planned for 1.0, no?

dockimbel

[15:17](#msg58f77f94f22385553d575e02)Ah, sure, though modules would be overkill, a simple object is enough.

Oldes

[15:18](#msg58f77fbcd32c6f2f091e9554)The hard part is to define the format which should be used. Probably which could be reused to create documentation in a HTML for as well.

AlexanderBaggett

[15:18](#msg58f77fda881b89e10166927a)I really like the format `?` spits out. It's very helpful.

9214

[15:19](#msg58f77ff0881b89e1016692fa)to keep red toolchain lightweight this documentation should be optional and modular, that's what I wanted to say

Oldes

[15:20](#msg58f780213e27cac331a34f2c)It could just be a field in a script's header which could be included or ignored by compiler.

9214

[15:20](#msg58f78033d32c6f2f091e987c)some kind of internal offline DB

maximvl

[15:23](#msg58f780f9881b89e101669a37)@Oldes I don't like this idea, it tires together code and files

Oldes

[15:24](#msg58f78116f22385553d5766c8)

```
Red [
	title: "My first dialect"
	name: 'something
	type: 'dialect
	help: http://somwhere/help  
]
```

maximvl

[15:24](#msg58f7812b8e4b63533de37942)what if you have several dialects in one file?

[15:24](#msg58f78134d32c6f2f091e9df6)what if you have several files for your dialect?

[15:24](#msg58f7814bf22385553d5767f5)what if files will not exist in the future? :D

Oldes

[15:25](#msg58f7814f8e4b63533de37a27)I don't think you will have multiple dialects in one file:)

maximvl

[15:25](#msg58f7815c8e4b63533de37a60)oh, I will do it just to prove you are wrong xD

dockimbel

[15:25](#msg58f781678bb56c2d11c1fb81):-)

Oldes

[15:25](#msg58f7817af22385553d5768ee)I know you can do it... but it is not serious dialect than.

maximvl

[15:26](#msg58f7819608c00c092a96a76a)you see, now you define a "serious" dialect based on how it is spread in files

Oldes

[15:27](#msg58f781d7ad849bcf429cc513)Also we should not limit only on dialects... there will be ports soon and you will be in the same situation.

maximvl

[15:28](#msg58f7820508c00c092a96a98b)how is writing something in header different from calling a callback which can be placed anywhere in the code?

Oldes

[15:28](#msg58f782068fcce56b20189a77)Also we should not limit only on dialects... there will be ports soon and you will be in the same situation.

maximvl

[15:29](#msg58f782438fcce56b20189c8b)@Oldes let's say I'll go full meta and write one file which generates several ports, for example for different SQL dialects/dbs

Oldes

[15:29](#msg58f7825308c00c092a96aaca)As a \_serious_ dialect I consider \[`VID`](https://github.com/red/red/tree/master/modules/view) or for example my \[\_Bass_ binding](https://github.com/red/code/blob/master/Library/Bass/bass.red)

9214

[15:29](#msg58f7825fcfec91927254fa33)I don't like header idea either, this way metainfirmation about program will be bigger than actual program

maximvl

[15:29](#msg58f78262881b89e10166a2bd)file's header is something static, I can't program it

Oldes

[15:30](#msg58f7828a8bb56c2d11c20153)Just to make sure... the header does not have to hold data.. you can use file or url like in the example above.

[15:30](#msg58f7829ad32c6f2f091ea5e4)It is just a way how to get the help out of the rest for the compiler.

9214

[15:31](#msg58f782d98e4b63533de38130)anyway, we need unified, offline and modular documentation system for all kinds of things

Oldes

[15:31](#msg58f782e43e27cac331a35fb2)Agree.

9214

[15:32](#msg58f7831e881b89e10166a5e0)url inside header doesn't solve this problem IMO

Oldes

[15:34](#msg58f7837da0e48562421cc049)It could... if the url would be in form like: https://github.com/red/help/vid

9214

[15:34](#msg58f783948e4b63533de38457)I think Altme used something similar, some kind of offline database for each world, every user has his own copy an can synchronize it whenever he prefer, am I right?

dockimbel

[15:34](#msg58f783a0d32c6f2f091eac6b)I'm trying to come up with a format for specifying a helping system for dialects, it's far from trivial, as, e.g., the syntax for keywords in different dialects can vary a lot, so coming up with a summary line, with common rules, like you have in `help` is actually pretty hard.

Oldes

[15:35](#msg58f783c48e4b63533de3859b)As I said.. it is the hardest part of it:)

[15:37](#msg58f784338fcce56b2018a707)@9214 Altme synchronize whenever you log in. Which was btw causing long initial startups and creation of new words when they started to be huge.

maximvl

[15:38](#msg58f7847f3e27cac331a3691e)let it return a free text and that's it

pekr

[16:04](#msg58f78a9ebdf4acc11274ffda)Sorry for joining the discussion late, hopefully will not create more confusion than adding to the discussion anything valuable :-)

[16:06](#msg58f78b11d32c6f2f091ed4db)For quite some time, well maybe ever since VID appeared, we were all thinking about how to get dialects documented. In the past, I proposed an extension of `help`function, e.g. something like `help/dialect`, `help/custom`or some such extension ... so it could look like `help/custom vid button`

[16:08](#msg58f78b6dcfec919272552c3a)The trouble imo is not to extend a help system, but to envision, how various dialects (which can be pretty much just anything) should self-document .... we would have to create some agreed upon mechanism, to which dialect authors would have to adhere. Not sure it is easily achievable ....

[16:09](#msg58f78baad32c6f2f091ed7ab)The other part of the language, and sorry for possibly incorrect classification, which are a bit troublesome, are a "hidden properties" (just my term).

[16:10](#msg58f78bdabdf4acc112750520)e.g. `time: now`(in R2, as not working in Red yet). Now having a `time`- how do I know about all those refinements I can use on it?

meijeru

[16:10](#msg58f78beaad849bcf429cf9d8)Even the help for simple "dialects" that are found in the parts of `make bitset!`, `make vector!` etc. would be quite difficult to organize. Though these intrinsic parts of Red belong perhaps in the "official" description which is no doubt off-line.

pekr

[16:10](#msg58f78c113e27cac331a3984f)I can think about having those available in terms of `help date!`

greggirwin

[16:31](#msg58f790daf22385553d57ba59)@dockimbel :point\_up: \[April 18, 2017 11:09 PM](https://gitter.im/red/red/welcome?at=58f6f0f5d32c6f2f091c3b5f), I'm tempted to say we could describe some keywords as meta-rules.

[16:37](#msg58f792398e4b63533de3d113):point\_up: \[April 19, 2017 9:25 AM](https://gitter.im/red/red/welcome?at=58f7814f8e4b63533de37a27) Multiple dialects in a file will depend on organization. For example, `format` will have both short form and masks for formatting. Both like dialects. Does that mean we have to split the files up to satisfy the doc tool?

dockimbel

[16:39](#msg58f792dbad849bcf429d1cc8)@greggirwin Most rules can be nested, some cannot, so I would rather call them simply "top rules". "Meta" implies a higher abstraction level to me (though, maybe I'm not aware of a more common usage of that word).

greggirwin

[16:40](#msg58f79302d32c6f2f091efcf6)Formatting is tricky to normalize, because, as others have said, there is no single structure dialects will follow. In VID alone we have keywords, styles, facets, actors, and reactivity.

[16:41](#msg58f793488e4b63533de3d74e)Metadata is data about data. Metacognition is thinking about thinking. Metarules would be rules about rules. Just a simple view, that a metarule can't exist without a rule it affects.

[16:46](#msg58f794678fcce56b2018fe18)Back on help, I've brought up the possibility of special sigil types (more types, I know) for documenation purposes. The tradeoff is that the more we include doc info directly, contextually, in place with what it docs, the more the code grows. So we need a way to exclude it. It may also obscure the code, and be best put elsewhere. And while it sounds great to have a standardized format for it, that may be difficult.

[16:50](#msg58f7954c881b89e10166fd46)Another way we can approach it is with tools. Executable documents that target one dialect or area. The old \*-lab tool idea, and others. Old Rebolers will remember EasyVID and EasyDraw.

Then help just needs a way to identify what tools are available, and where they can be accessed if not already installed locally.

We can argue that putting help info in the code is best, but it's not always. It doesn't guarantee it will be kept up to date, and sometimes the best person to write docs is not the person who writes the best code.

[16:58](#msg58f79727a0e48562421d1eb4)In some of my work, I've started including an `e.g.` alias for `comment`. I can then put `e.g. [ ... ]` as commentary, and also making it clear that it's example information, like how to use a function. We can easily do this kind of thing, to create the help/doc dialect. Aliasing to `comment/noop` when compiling could then exclude those bits, while another func might collect them into an internal resource section in the EXE for later use by `help`.

[17:00](#msg58f797a18e4b63533de3ec69)We could move this chat to red/docs if it's going to continue.

geekyi

[17:16](#msg58f79b593e27cac331a3e661)@AlexanderBaggett I think we all missed that you can't get `help` on vid 😉

gltewalt

[18:09](#msg58f7a7e7d32c6f2f091f6372)Comments lie

AlexanderBaggett

[18:35](#msg58f7ae0b8fcce56b201975c9)@geekyi :smile:

maximvl

[18:54](#msg58f7b2548fcce56b201988fe)@pekr  
&gt;Now having a time- how do I know about all those refinements I can use on it?

We should support reflection on builtin types as well, I proposed this couple times :)

[18:59](#msg58f7b379a0e48562421d9ec0)@meijeru  
&gt;parts of make bitset! &lt;spec&gt;, make vector! &lt;spec&gt; etc. would be quite difficult to organize.

I actually would like them to be made as "normal" dialects as well, so they would also have similar interface, and help can be as simple as `help/dialect bitset!` returning the description

Oldes

[19:06](#msg58f7b54c8e4b63533de481bb)I would prefer just `help bitset!` for above. Or `help/dialect` without argument would have to display all possible dialect values.

maximvl

[19:07](#msg58f7b57ea0e48562421da8a7)`help bitset!` shows help on the datatype, can also mention or include help on related dialect

greggirwin

[19:23](#msg58f7b91a881b89e10167a523)`Usage`. It could work like `help` providing base info if there's no arg, or probing available info for a type or arg. To start with, we just build the info directly into the func to experiment.

meijeru

[19:30](#msg58f7babd3e27cac331a47a8c)The func involved in the `make`dialects is `make`, and that is applicable to ALL types...

greggirwin

[19:48](#msg58f7bf26cfec919272562410)\*Excellent* point Rudolf. "Dialects" built in Red/System can't be doc'd the same way as parse-based things we build in Red.

maximvl

[20:06](#msg58f7c352f22385553d58ac80)@greggirwin why?

greggirwin

[20:11](#msg58f7c4598e4b63533de4cb1c)Because `parse` isn't used there, and Red/System doesn't have all the datatypes Red does.

Oldes

[20:33](#msg58f7c97f8e4b63533de4dfa7)Years ago I used special inline comments too... here is how looks \[the source](http://rebol.desajn.net/rswf/swf-tag-rules\_enczes.rb) when \[converted to html](http://rebol.desajn.net/rswf/)

AlexanderBaggett

[21:47](#msg58f7dadda0e48562421e4ad0)I have some beginner questions about the roadmap and interop between red and red/system.

[21:48](#msg58f7db24cfec919272569c67)So, currently the Red runtime is written in Red/system mostly?

[21:48](#msg58f7db3b8e4b63533de52da6)And by runtime we mean the .exe for windows users?

rebolek

[21:49](#msg58f7db4da0e48562421e4c6f)Mostly in Red/System and the rest is written in Red.

[21:49](#msg58f7db6ed32c6f2f09204674)No, runtime is not .exe

[21:50](#msg58f7dbad881b89e101683a3e).exe is compiled program that includes runtime, when the source is Red.

AlexanderBaggett

[21:50](#msg58f7dbb9ad849bcf429e6c56)help me understand what the runtime really is

rebolek

[21:51](#msg58f7dbf43e27cac331a50b91)runtime is `libRed`, it is what helps to run your scripts.

AlexanderBaggett

[21:52](#msg58f7dc0abdf4acc112768511)Ah

[21:52](#msg58f7dc19cfec919272569fcc)Okay, so what is Red/System written in?

[21:52](#msg58f7dc2a881b89e101683c65)Rebol?

rebolek

[21:53](#msg58f7dc413e27cac331a50d05)Red/System compiles to assembler. Current compiler is written in Rebol, yes.

AlexanderBaggett

[21:53](#msg58f7dc65a0e48562421e502c)It compiles to assembler so it is inherently low level.

[21:53](#msg58f7dc69bdf4acc11276872c)okay

rebolek

[21:54](#msg58f7dc9908c00c092a9858eb)Red/System is C-level language and Red is high level language written in Red/System.

greggirwin

[21:54](#msg58f7dca0f22385553d591cae)Actually, it compiles to machine language directly. No assembler required.

rebolek

[21:55](#msg58f7dcb6d32c6f2f09204d50)@greggirwin right, my fault.

AlexanderBaggett

[21:59](#msg58f7ddb1881b89e101684165)Is there any interop between Red/System and C ?

rebolek

[22:00](#msg58f7de058fcce56b201a45b1)You can use C libraries from Red/System for example.

AlexanderBaggett

[22:00](#msg58f7de1a8bb56c2d11c3a994)Are there any good examples on how to do that?

rebolek

[22:06](#msg58f7df538fcce56b201a4a9b)See http://static.red-lang.org/red-system-specs.html#section-6.3.2

[22:07](#msg58f7df98ad849bcf429e79cc)and http://static.red-lang.org/red-system-specs.html#section-15

AlexanderBaggett

[22:08](#msg58f7dffaa0e48562421e5e7f)Thank you

## Thursday 20th April, 2017

dockimbel

[03:19](#msg58f828dca0e48562421f5910)@maximvl  
&gt; We should support reflection on builtin types as well, I proposed this couple times :grinning:

Reflection is helpful for accessing information only available at runtime, or which might change. Datatype accessors are fixed, you will \*always* get the same result from a given datatype, so that would not qualify for support by reflection. A simple list somewhere in the system object could suffice.

maximvl

[06:41](#msg58f8581cbdf4acc112783d33)@dockimbel I don't get this logic, ok, I will always get the same result for given datatype, so what? I still want to have this information in runtime, I know I will need it, I will use it

[06:42](#msg58f8586908c00c092a99fe14)in Erlang one of the biggest issues of type system was that the only custom `record` datatype only had field's names in compilation time, thus you couldn't inspect these objects, you couldn't create them dynamically and so on

[06:43](#msg58f858848bb56c2d11c5418d)it ended up with people adding custom compiler macros to provide these (constant) fields names for runtime

[06:44](#msg58f858d0ad849bcf42a02b7d)and we already have `words-of` which is perfectly fits this use case

[06:55](#msg58f85b68cfec9192725855e3)because this is much more convenient and gives you so much power that any "optimization" of not having this information is just nothing comparing to what it gives a programmer

9214

[06:55](#msg58f85b7e881b89e1016a01d5)Is it possible to `load` binary file in Red? I've tried and got `Access error: invalid UTF-8 encoding` error :confused:

maximvl

[06:56](#msg58f85b9fcfec9192725856bf)@9214 `load` only loads strings/files with Red syntax

9214

[06:58](#msg58f85c118bb56c2d11c55187)so I should go down to R/S?

maximvl

[06:59](#msg58f85c62d32c6f2f09221ff7)@9214 this is not related

9214

[07:00](#msg58f85ca3881b89e1016a06bd)well, ok, then how can I load binary file?

dockimbel

[07:01](#msg58f85cbccfec919272585bca)@9214 `read/binary`

maximvl

[07:01](#msg58f85cc9881b89e1016a071e)you can't `load` it, you can `read` it

9214

[07:01](#msg58f85ccd8bb56c2d11c554aa)`load` can accept `binary!` datatype, I'm not sure what that means

[07:01](#msg58f85cd3ad849bcf42a03cb9)ah, `read`, thanks!

dockimbel

[07:02](#msg58f85ce88fcce56b201bf151)@maximvl Maybe you missed the last sentence of my post:  
&gt; A simple list somewhere in the system object could suffice.

maximvl

[07:02](#msg58f85d10f22385553d5ae269)@dockimbel as long as it is accessible with something like `words-of` I'm for it

[07:04](#msg58f85d678fcce56b201bf3c1)@9214 this is for loading red data saved in binary format:

```
>> b: to-binary "[a b c]"
== #{5B61206220635D}
>> load b
== [a b c]
```

dockimbel

[07:04](#msg58f85d8dcfec919272585e72)@9214 `load` is higher-level than `read`, it will attempt to decode the binary data using one of the built-in codecs, like image formats.`save` / `write` are the opposite functions.

[07:05](#msg58f85dbfa0e4856242201a54)@9214 `to-binary` on a `string!` produces a UTF-8 encoded version of it, which is the format expected by `load` for Red files.

9214

[07:06](#msg58f85de1d32c6f2f0922260b)@dockimbel everything clicked, ty :smile:

[07:14](#msg58f85fd0881b89e1016a1379)The thing is: I want to read binary data, find bytes on specific offsets and decode them. `read`ed binary is just a series, so I can manipulate them with path notation?

dockimbel

[07:15](#msg58f8600b08c00c092a9a18e1)@maximvl `words-of` purpose is to list words from a context. You should make a practical case for what you're asking for, because, besides for quick help support, I can hardly see any use-case for it. I don't remember anyone ever asking for such feature in Rebol community (others can correct me if that happened). I never needed it either (except for quick `help` support). You can already have it if you need it:

```
refinements: [
    pair! [x y]
    email! [user host]
    time! [hour minute second]
    image! [size argb rgb alpha]
]
```

It should be all we have now.

[07:16](#msg58f860433e27cac331a6d64c)@9214 All series actions apply to `binary!` series, you can even use Parse on it.

9214

[07:16](#msg58f8604bf22385553d5aef91)suppose I want to get byte from `0xdeadbeef` offset ,`src/(#16{deadbeef})` is a vaild way to do so?

[07:16](#msg58f8605e8fcce56b201bfdac)because it ain't works :(

dockimbel

[07:17](#msg58f86081d32c6f2f09222f5b)`pick src to-integer #{deadbeef}`

maximvl

[07:17](#msg58f860963e27cac331a6d711)@dockimbel I would like to have autocompletion work with these fields, for example

[07:18](#msg58f860c2f22385553d5af190)now it works on objects only

dockimbel

[07:20](#msg58f8612a3e27cac331a6d9a0)or  
`i: to-integer #{deadbeef} src/:i`

[07:20](#msg58f8614a3e27cac331a6da21)@maximvl That's doable from the console input line, but not from a code editor (at least not from a text editor, but doable from a "live" editor).

rebolek

[07:21](#msg58f86174d32c6f2f092233ba)And of course also `src/(to integer! #{deadbeef})` :)

maximvl

[07:24](#msg58f8621acfec919272587307)@dockimbel I would also like to have tools which can inspect "hidden" fields like "alpha" in image:

```
>> i: make image! 2x2
== make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]
>> i/alpha
== #{00000000}
```

dockimbel

[07:27](#msg58f862e612d24099357e5697)@maximvl Sure, just use the block of data I posted above. A tool doing internal inspection should be type-aware, so harcoding those data in such tool would be fine. We can add it to the system object anyway (adding some docstrings to it, so `help` could use it).

pekr

[07:39](#msg58f86598cfec919272588191)I like the Doc's idea. Relatively easy to achieve, straightforward, and will surely help in the end ...

raton3062015

[08:00](#msg58f86a9dcfec919272589af9)save/as %a.HTML { &lt;p&gt;raton&lt;/&gt;} \`html

[08:01](#msg58f86abe12d24099357e77ac)is it possible to save json format

[08:06](#msg58f86c0ac1d3b501540124a1)difference between make block! \[1 2] and make vector! \[1 2]

maximvl

[08:08](#msg58f86c94c1d3b501540129bf)@raton3062015

```
>> type? make vector! [1 2]
== vector!
>> type? make block! [1 2]
== block!
```

dockimbel

[08:09](#msg58f86ccf12d24099357e8295)@raton3062015 Block is a universal container (can contain anything), vector can only contain a limited number of types (mostly numbers) and all values in a given vector must be of same type. Basically, vector is close to number arrays in most other languages. Last but not least, vector optimizes the storage space, while each block value takes 128-bit.

[08:12](#msg58f86d65c1d3b50154012d25)Besides that, `vector!` is a series, so series action apply.

AlexanderBaggett

[21:47](#msg58f92c838e4b63533deabd4a)Is there a way to compile red code from the REPL or via a command without going the OS's commandline/terminal?

greggirwin

[21:50](#msg58f92d3508c00c092a9dd9f5)Use `call`.

AlexanderBaggett

[21:52](#msg58f92d948bb56c2d11c916f7)Thank you @greggirwin

## Friday 21st April, 2017

michaeldesu

[04:11](#msg58f986613e27cac331abc4a6)is there a smarter or more elegant way to convert a string containing digits to an integer series? Initial attempt below

```
>> a: "123"
>> b: []
>> foreach x a [append b to-integer to-string x]
== [1 2 3]
```

to-string is needed since x is a char, so the to-integer conversion is the ascii number not the actual one.

9214

[04:26](#msg58f989f63e27cac331abd1ea)`load/all "123"`

greggirwin

[04:27](#msg58f98a1908c00c092a9f11df)@9214, nope. Try it.

[04:28](#msg58f98a6bd32c6f2f092721d1)`collect [foreach x a [keep to-integer form x]]`

9214

[04:28](#msg58f98a8708c00c092a9f1322)oh, my bad, but it's still a block! :^)

greggirwin

[04:29](#msg58f98aa812d24099358342cd)If you have more complex needs, varying number of digits to grab, I can dig something up.

michaeldesu

[04:30](#msg58f98ae108c00c092a9f13dd)@9214 :-) @greggirwin Thanks alot. This was a good one.. `form` is new to me, and a nice solution to getting a character instead of string

[04:32](#msg58f98b428e4b63533dec0816)

```
a: "123"
to-integer a/1 ; gives 49
to-integer form a/1 ; gives 1
```

9214

[04:37](#msg58f98c8d12d2409935834b12)

```
b: charset [#"A" - #"Z" #"0" - #"9"]
repeat i length? b [print [i tab to char! i]]
```

michaeldesu

[04:52](#msg58f98ff1881b89e1016f29c9)@9214 Thanks - it's a nice study piece for me

9214

[04:58](#msg58f99181cfec9192725d8fcd)@michaeldesu btw, `form` gives you a string, not a character

```
>> first "123"
== #"1"
>> type? first "123"
== char!
>> form first "123"
== "1"
>> type? form first "123"
== string!
```

michaeldesu

[04:59](#msg58f991b7f22385553d601865)thanks - yes, I realise that (i.e. the post above with `to-integer form a/1 ; gives 1`) and (without form) `to-integer a/1 ; gives 49`where 49 is the ascii value of the char #"1"

[05:19](#msg58f99666ad849bcf42a57f7c)getting a char instead of a single-char string is a difference to Python

```
a = "hello"
for x in a:
	print(type(x)) # gives <class 'str'> times 5 for each char
```

pekr

[05:49](#msg58f99d568bb56c2d11caa780)Well, to be honest, I thought the same many times in the past - namely why picking a substring of length 1 from string, does convert to char by default. If I want a char, I can easily convert. But - this is historical Rebol behaviour, it is imo not going to change ...

greggirwin

[05:52](#msg58f99e1acfec9192725dbcc8)You're picking a single value from its containing series, so what you get back depends on what the series contains. Do you expect `first [1]` to return `[1]` because you're picking from a block? Of course, it's an action strings could override, but I don't think it's a clear win either way, just a choice.

pekr

[05:55](#msg58f99ee08bb56c2d11caac34)It might be consistent, but not much useful. There might be some patterns, and here, you usually will convert back to string ...

greggirwin

[05:56](#msg58f99f0a8bb56c2d11caacce)I think it's a coin toss about which is more useful, that's my point.

pekr

[05:58](#msg58f99f84c1d3b501540647ed)`copy/part`is our friend then. Tried with other type, e.g. binary:

```
>> bin: #{FF0AFEC7} 
== #{FF0AFEC7}
>> copy/part bin 2
== #{FF0A}
>> copy/part bin 1
== #{FF}
>> bin/1
== 255
```

dockimbel

[06:22](#msg58f9a51708c00c092a9f6e1b)@michaeldesu The following version is much more efficient:

```
foreach x a [append b to-integer x - #"0"]
```

[06:25](#msg58f9a5cd12d240993583a55b)As Gregg pointed out, strings are series, so they are sequences of char values. Returning a string from `pick` makes no sense in that context, and would break the series behaviors (the whole series polymorphism would break down).

michaeldesu

[06:36](#msg58f9a85a12d240993583ae32)@pekr , thanks - yeah I agree (I understand this is a different system &amp; way - pros/cons etc exist) but mostly just understanding of the new way  
&gt; why picking a substring of length 1 from string, does convert to char by default - this is historical Rebol behaviour, it is imo not going to change ...

[06:45](#msg58f9aa92f22385553d607b44)@greggirwin @dockimbel thanks for comments and code improvements. Returning a char is a bit strange for me - strings are a series, so I think that it's not illogical to expect that when picking off one character from that series, that you get a single-character string as a result. I realise returning a char is just the way it is, and accept it.

greggirwin

[06:48](#msg58f9ab55ad849bcf42a5cff7)Not to belabor the point, but consider this:

```
>> pick #{AABBCCFF} 4
== 255
>> pick [a b c d] 4
== d
>> pick make image! 5x5 4
== 255.255.255.0
```

rebolek

[06:50](#msg58f9aba1d32c6f2f0927a1b0)@michaeldesu `string!` is series of `char!` values. So you must pickup `char!` because that's what is there :)

michaeldesu

[06:50](#msg58f9abbcc1d3b50154067d49)I agree with @pekr `copy/part a 1` is another solution that returns a single-char string "a", so it's another alternative (I think other chars can be grabbed via `copy/part a 2 2 ; gives "b"`)

[06:50](#msg58f9abd38bb56c2d11cae211)@rebolek thanks alot - ok that makes sense

greggirwin

[06:51](#msg58f9abe0c1d3b50154067df3)Each returns an atomic value from the series. Should string be different? Should it do this?

```
>> pick "abcd" 4
== "d"
>> pick %abcd 4
== %d
>> pick http:// 4
== p  ; (this is a url!)
>> pick <abcd> 4
== <d>
```

[06:51](#msg58f9ac0e08c00c092a9f8d19)I hadn't thought about this in a long time. Good refresher.

dockimbel

[06:53](#msg58f9ac54d32c6f2f0927a37c)@michaeldesu In many languages, strings are made of...strings (probably old BASIC inheritage), in Redbol, strings are made of characters. Which one sounds the more logical to you? ;-)

michaeldesu

[06:53](#msg58f9ac7b12d240993583bf42):-) yeah, the latter - so Rebol/Red is making things straight ;-)

dockimbel

[06:54](#msg58f9ac9d12d240993583bfa1)At least, we try. ;-)

michaeldesu

[06:54](#msg58f9acadd32c6f2f0927a4c3)thanks everyone - this has been really useful

rebolek

[06:54](#msg58f9acb1ad849bcf42a5d634)String theorists and Tcl programmers think that everything is a string ;)

dockimbel

[06:55](#msg58f9acd58fcce56b202187d4):clap: ;-)

pekr

[08:07](#msg58f9bdab8bb56c2d11cb2fc9)@rebolek I just mistakenly read "string terrorists" :-)

9214

[08:08](#msg58f9be1b881b89e1016fe872)elegant weapons for a not so civilized age ;)

[09:09](#msg58f9cc38d32c6f2f09283059)just realised that @pekr (or can I say "string terrorists"? :suspect:) broke the chain of winking smiles

dnmurphy

[09:42](#msg58f9d415881b89e1017047bb)@9214 maybe a better expression is 'string fundamentalists' ;)

maximvl

[10:17](#msg58f9dc4e3e27cac331ad1b15)

```
>> a: [1 2]
== [1 2]
>> append a [3 4]
== [1 2 3 4]
```

```
>> append a [3 4]
== [1 2 [3 4]]
```

Which one looks more logical? :D

dockimbel

[10:18](#msg58f9dc918bb56c2d11cbb723)Both. Sometimes you want a container type to be treated as a single value, sometimes you want it to be treated as a list of value.

maximvl

[10:21](#msg58f9dd353e27cac331ad1ec0)maybe it's because of my experience, but every language does second by default

[10:21](#msg58f9dd3c8e4b63533ded5b04)except perl, btw

rebolek

[10:28](#msg58f9dedc12d2409935848ee4) With the second, you can't do things like

```
>> do append [1 +] 1
== 2
```

dockimbel

[10:35](#msg58f9e073f22385553d61594d)@maximvl Unless "every language" has the same types and semantics as Redbol, cherry-picking semantic rules from other languages, and applying them to Redbol, can quickly become irrevelant. The default behavior of `append` (and other series actions) wrt to block arguments is very useful, as Redbol relies on fixed-size arity functions, so specifying "several values" instead of one can only be achieved by passing a block (or a `any-block!`container, like `paren!`). Such usage is common enough in Redbol, to deserve to be the default behavior. Redbol is optimized for practical usage.

meijeru

[11:02](#msg58f9e6c98e4b63533ded83a3)And remember, you can still do the second using the `/only` refinement that most series actions have.

maximvl

[11:22](#msg58f9eb7f881b89e10170a699)@rebolek @dockimbel what bothers me in this case is that flatten is default behaviour, while it could be optional like `append/flat`

[11:22](#msg58f9eb8b8fcce56b20229149)instead of `append/only`

[11:23](#msg58f9ebcd8fcce56b20229254)@rebolek you don't append block, so it's the same for your example ;)

rebolek

[11:34](#msg58f9ee4e08c00c092aa0a428)@maximvl oh, right. Then `do append [1 +] [1]`. :) Anyway, there was some debate if `/flat` route is netter than `/only`, but AFAIK, no strong argument for `/flat` ever came up.

maximvl

[11:36](#msg58f9eea18bb56c2d11cbfcca)I don't have strong arguments either, it just "feels" more logical

dockimbel

[11:37](#msg58f9eefb8fcce56b20229dec)@maximvl  
&gt; what bothers me in this case is that flatten is default behaviour, while it could be optional like `append/flat`

I just explained to you why it's a better default.

maximvl

[11:38](#msg58f9ef22881b89e10170b55c)yep, I got it

[11:38](#msg58f9ef428fcce56b20229f33)and I also believe a lot of newcomers from other languages will ask this exact question soon :D

dockimbel

[11:39](#msg58f9ef73881b89e10170b682)No problem, such question can go into a FAQ (we should set up one on the wiki I guess, until we get a new website).

michaeldesu

[12:29](#msg58f9fb138bb56c2d11cc3217)here's another 'is there a better way' question :-). Reduce on a series including math operators gives the result in a block, e.g.

```
a: [1 + 2 + 3]
b: reduce a ; gives [6]
c: b/1 + 1
== 7
```

so getting access to the block in b, I've done `b/1`, is there a smarter/more elegant way?

meijeru

[13:19](#msg58fa06ce881b89e101711992)What about `do a`? This will yield `6`. Remember: blocks are evaluated by `do` and parens evaluate automatically. So to quote a block, just write it; to quote parens, put `quote`in front. In the REPL:

```
>> [1 + 2]
== [1 + 2]
>> do [1 + 2]
== 3
>> (1 + 2)
== 3
>> quote (1 + 2)
== (1 + 2)
```

[13:21](#msg58fa0769ad849bcf42a760b9)But beware: `reduce` makes a block with all the evaluated values in it, while `do` yields the value of the last evaluation.

```
>> reduce [1 + 2 3 + 4]
== [3 7]
>> do [1 + 2 3 + 4]
>> 7
```

dockimbel

[15:17](#msg58fa22768bb56c2d11ccf82a):+1: for `do` solution.

greggirwin

[17:31](#msg58fa420512d2409935865a3e):point\_up: \[April 21, 2017 5:39 AM](https://gitter.im/red/red/welcome?at=58f9ef73881b89e10170b682) https://github.com/red/red/wiki/FAQ

dockimbel

[17:33](#msg58fa426308c00c092aa2349f)Thanks, forgot we had one already.

greggirwin

[17:33](#msg58fa426cad849bcf42a885de)Me too.

rcqls

[18:05](#msg58fa49f68fcce56b20244943)@greggirwin Nothing major but I guess a space is missing between 2 and 3 in the last point of the FAQ in `[1 23 4]`.

greggirwin

[18:31](#msg58fa50198bb56c2d11cdd2f9)Thanks! Fixed.

michaeldesu

[23:03](#msg58fa8fc58bb56c2d11ced161)@meijeru `do` solution - thanks alot Rudolf. Really appreciate this community!

## Monday 24th April, 2017

michaeldesu

[07:05](#msg58fda3c6c1d3b50154145d58)I'm still studying parse, in particular \[modifying text](http://www.rebol.com/docs/core23/rebolcore-15.html#section-7.5). I'm trying the example there. I've come up with the following to exchange a 3 digit number to all X's.

```
digit: charset "012345679"
triple: [3 digit]
a: "this is 111 and this is 222 and this is 333 and then"
parse a [some [to triple tmp: 3 skip (change tmp "XXX")]]
>> a
== {this is XXX and this is XXX and this is XXX and then}
```

but I wonder why the following also works:

```
parse a [some [to triple tmp: (change tmp "XXX") 3 skip]]
```

since in the later parse, it seems to me that the change request is being done before the pointer has moved to 3 skips. Thanks.

rebolek

[07:07](#msg58fda42a8bb56c2d11d85962)No, `to` moves the pointer to start of the triplet. `tmp:` stores position. `change` does the change.

michaeldesu

[07:50](#msg58fdae5cf22385553d6e1bfe)@rebolek thanks - I follow how `to` works, I guess what I didn't understand is the `change` is merely copying three chars starting at the position of tmp, and the skip doesn't really matter

rebolek

[07:53](#msg58fdaf05881b89e1017d57dc)`change` changes as many characters as is the length of its `value`argument.

[07:55](#msg58fdaf6f12d2409935917cbf)@michaeldesu you can also use `change` keyword in `parse`:

```
>> parse a [some [change triple "XXX" | skip]]
== true
>> a
== {this is XXX and this is XXX and this is XXX and then}
```

greggirwin

[07:57](#msg58fdafe0d32c6f2f09353e54)@michaeldesu, if you `probe tmp`, you can see that it's the same in both cases.

```
digit: charset "012345679"
triple: [3 digit]
a: "this is 111 and this is 222 and this is 333 and then"
parse a [some [to triple tmp: 3 skip (change probe tmp "XXX")]]

a: "this is 111 and this is 222 and this is 333 and then"
parse a [some [to triple tmp: (change probe tmp "XXX") 3 skip]]
```

That's because the `tmp:` gets the position in the input \*before* the next rule (e.g. `skip`) is evaluated.

[07:57](#msg58fdb003f22385553d6e22a3)It is not dependent on the next rule succeeding.

michaeldesu

[08:36](#msg58fdb8ff12d240993591a115)@rebolek thanks, I'm not sure how the `value` argument is set- I will study the doc @greggirwin thanks for your tips. I noticed that skip is not needed in my example

```
parse a [some [to triple tmp: (change tmp "XXX")]]
>> a
== "this is XXX and this is XXX and this is XXX"
```

rebolek

[08:39](#msg58fdb9b9c1d3b5015414b1cd)@michaeldesu `value` argument is `"XXX"` in your case, see `help change`.

You do not need `skip`, because you are using `to`. I can rewrite my `change`keyword example as:  
`parse a [some [to triple change triple "XXX"]]`

michaeldesu

[08:40](#msg58fdb9ebc1d3b5015414b2a0)thanks very much

[09:29](#msg58fdc5828fcce56b202f9d5d)@rebolek can I ask, in your latest example, what advances the pointer to avoid an endless loop?

rebolek

[09:31](#msg58fdc5da12d240993591ddea)@michaeldesu If you change all triples to "XXX", there's nothing to match and the rule fails, stopping execution.

michaeldesu

[09:32](#msg58fdc63e8e4b63533dfabb9a)@rebolek ok, thanks alot once again!

rebolek

[09:34](#msg58fdc6b88e4b63533dfac0a0)@michaeldesu

```
>> parse a [some [to triple change triple "XXX"] (print "if you see this, it means previous rule stopped execution and parse moved to next rule (this one)")]
if you see this, it means previous rule stopped execution and parse moved to next rule (this one)
```

michaeldesu

[09:49](#msg58fdca19881b89e1017dc8c5)can I ask a potentially dumb question: without `change triple "XXX"` the parse goes into an infinite loop, so does that change advance the pointer to allow the next `to` to operate?

rebolek

[09:51](#msg58fdcaaf08c00c092aad9e34)@michaeldesu `change` does not advance the pointer, `to` does.

[09:52](#msg58fdcaf46aea30763d383db3)With `change`, you are at `"111 and ..."`, it changes to `"XXX and ..."` so `triple` no longer matches and `to` must find next `triple`.

[09:53](#msg58fdcb1c881b89e1017dcbb4)Without change, you are still at `"111 and ..."` so it still matches -&gt; infinite loop.

michaeldesu

[09:57](#msg58fdcc1412d240993591fd62)@rebolek great answer! thanks so much - it makes sense.

rebolek

[10:10](#msg58fdcf158bb56c2d11d91636)@michaeldesu you're welcome, I am happy to help.

endo64

[10:51](#msg58fdd8c9cfec9192726c6dff)Why `change` in `parse` doesn't advance the position as in `Red`? I mean what is the reason?

rebolek

[10:52](#msg58fdd90908c00c092aade63d)@endo64 my bad, it does. I was too focused on `to`.

endo64

[10:53](#msg58fdd919c1d3b5015415413c)Hmm wait.. it looks like it advance the pointer?

```
>> parse s: "a" [change "a" "x"]
== true
>> parse s: "a" [change "a" "x" p: insert "y"]
== true
>> s
== "xy"
```

rebolek

[10:53](#msg58fdd93acfec9192726c6fa3)Yep, I can't edit it anymore. Sorry for the confusion.

endo64

[10:53](#msg58fdd9446aea30763d387f39)Ah, ok, no problem.

michaeldesu

[12:22](#msg58fdee05f22385553d6f343a)ha - came back to see some more info:-) so `change` does advance the pointer after all.

rebolek

[12:24](#msg58fdee62c1d3b5015415a1d5)@michaeldesu sorry it does, I was focusing too much on `to` in the explanation.

michaeldesu

[12:24](#msg58fdee98f22385553d6f366f)no worries - your explanation did make sense also. The above from Semseddin was interesting.

[12:26](#msg58fdef068fcce56b203055ee)@endo64 thanks for your input - what's the significance of the `p` assignment in your 2nd parse example?

rebolek

[12:28](#msg58fdef628fcce56b20305840)I think `p:` is there for debug.

endo64

[12:28](#msg58fdef6ec1d3b5015415a5e0)You can ignore that. Its for debugging.

michaeldesu

[12:28](#msg58fdef70c1d3b5015415a5e8)how elegant that you can assign and use in the same line like `s: "a"` etc

endo64

[12:29](#msg58fdef8c8fcce56b2030594e)But see this one as a prove `change` is advancing:

```
>> parse s: "a" [p: change "a" "b"]
== true
>> p
== "b"
```

michaeldesu

[12:29](#msg58fdef8ecfec9192726cd9ee)thanks guys

[12:30](#msg58fdefca08c00c092aae50ad)this is all so deep :-) and interesting

dockimbel

[12:31](#msg58fdf01d8bb56c2d11d9a959)To be accurate, it's the `"a"` token which is making `change` rule advance. It's called the rule-mode (vs position-mode) for `change` in Parse, in the upcoming documentation for Red's Parse.

[12:32](#msg58fdf074587a245e24424003)

```
lisp
>> digit: charset "012345789"
== make bitset! #{000000000000FDC0}
>> parse s: "123" [change [3 digit] "b"]
== true
>> s
== "b"
```

endo64

[12:35](#msg58fdf11008c00c092aae56f7)So it still different than normal `change` which returns the position \*after* the change.

[12:35](#msg58fdf123cfec9192726ce21a)

```
>> change s: "ax" "b"
== "x"  ; not "b"
```

toomasv

[12:42](#msg58fdf2c8d32c6f2f09366839)@endo64 Seems like parse's `change` acts as `change/part`:

```
>> change/part s: "ax" "b" 2
== ""
>> s
== "b"
```

That is, changing not the length of the argument, but the length of the match, which makes sense.

endo64

[12:50](#msg58fdf4a6587a245e2442535a)@toomasv But you removed `x` from `s`, `>> head s ; == "b"`

toomasv

[12:51](#msg58fdf4e112d240993592bb97)@endo64 Yes, I changed "ax" into "b" as "123" was changed into "b" in doc's example.

endo64

[12:53](#msg58fdf54a8e4b63533dfba2e3)So the result is not same. \*length of the match* is 1 not 2 in my example.

toomasv

[12:54](#msg58fdf59808c00c092aae6e98)You mean in your last example? Yes, the match is the length of argument there.  
... Actually, there is no match at all in this example :)

dockimbel

[13:01](#msg58fdf73df22385553d6f5ffc)@toomasv Correct, internally in Parse, it's using `change/part`.

toomasv

[13:05](#msg58fdf805c1d3b5015415cf6a)So it is actually `change/part s: "match" "replacement" length? s`

michaeldesu

[21:56](#msg58fe74848fcce56b2032a7a1)I am unsure about why @rebolek's example of:

```
digit: charset "0123456789"
triple: [3 digit]
a: "this is 111 and this is 222 and this is 333 and then"
parse a [some [to triple change triple "xxx"]]
```

works the way it does. I mean looking at other examples, I was conditioned to thinking we have to put a pointer into a variable for the `change` action

```
parse a [some [to triple tmp: (change tmp "XXX")]]
```

But in the former, there is no such variable assignment. It's like the `change triple "xxx"` is that assignment, but `triple` is a rule, and usually the first parameter in change is a series. It's almost magical :-) I think that latter application is similar to the earlier example of

```
parse "aa 12/11/70 bb 13/12/71 xx" [to date copy d date]
```

where one moves to the first date, then takes an action using that date rule to fill the variable d.

rebolek

[21:57](#msg58fe74dd881b89e10180bad5)@michaeldesu there is difference between `change` as parse keyword and `(change)` as Red function.

[21:58](#msg58fe7504f22385553d71a7a6)The assignment for the former (`change` keyword) is done by the matching rule.

michaeldesu

[22:00](#msg58fe757008c00c092ab0bab7)both these parse methods work, but the former is better (replaces the match with a larger text swap) - mine overwrites

```
a: "this is 111 and this is 222 and this is 333 and then"
parse a [some [to triple change triple "CHANGED"]]
>> a
== {this is CHANGED and this is CHANGED and this is CHANGED and then}
```

```
a: "this is 111 and this is 222 and this is 333 and then"
parse a [some [to triple tmp: (change tmp "CHANGE")]]
>> a
== {this is CHANGEd this is CHANGEd this is CHANGEd then}
```

why is that?

[22:02](#msg58fe75e88fcce56b2032abc7)@rebolek thanks - I will persevere with learning :-)

rebolek

[22:04](#msg58fe7654c1d3b5015418145a)@michaeldesu wait a moment...

[22:04](#msg58fe767e08c00c092ab0bebe)OK, let's forget about `parse` for a moment.

[22:06](#msg58fe76e76aea30763d3b4ea7)See what `change` function does:

```
>> s: "111 and this is..."
== "111 and this is..."
>> change s "CHANGE"
== "d this is..."
>> s
== "CHANGEd this is..."
```

[22:07](#msg58fe771b6aea30763d3b5042)And now take a look at `change/part`:

```
>> s: "111 and this is..."
== "111 and this is..."
>> change/part s "CHANGE" 3
== " and this is..."
>> s
== "CHANGE and this is..."
```

[22:08](#msg58fe7757587a245e2444b47a)What `change` keyword in `parse` does is actually `change/part`, where the `/part` length is length of the match.

michaeldesu

[23:50](#msg58fe8f54cfec9192726f9bf4)@rebolek thanks again for your great explanation

## Tuesday 25th April, 2017

michaeldesu

[01:23](#msg58fea4fe881b89e101815d90)how to get access to the length of the match in order to tailor a tricky replace - consider this:

```
multi: [4 digit | 5 digit | 6 digit]
s: "123 aaa 1234 bbb 12345 zzz 123456 yes"
parse s [some [to multi 2 skip change 2 digit "XX"]]
; produces "123 aaa 12XX bbb 12XX5 zzz 12XX56 yes"
```

but say if I wanted to keep the last 2 digits from the matched result, and still do the `change` to XX, i.e. the desired result is  
`"123 aaa XX34 bbb 1XX45 zzz 12XX56 yes"`

greggirwin

[01:45](#msg58feaa398e4b63533dfe9bf3)Sometimes you need to, or it can help a lot, to break your rules down more. Also in `multi` you should check for longest matches first.

michaeldesu

[01:51](#msg58feab9ff22385553d7258c0)yes you're right about `multi` rule - thanks. Agree, it would be ok to break up the rules. I was just wondering since it seems like the matches result is passed through to `change`. Is it possible to call a function upon each match, and in that way pass out the matched value, and use the function return result for the subsequent `change`?

[01:52](#msg58feabe4587a245e244566d8)or maybe for this case, it's better to collect all the matches in a series, and then subsequently process in another step. It's ok, it's just an exploratory question.

greggirwin

[04:25](#msg58fecfb9cfec919272706f96)Sorry I haven't had time to look at it. Maybe tomorrow.

michaeldesu

[06:22](#msg58feeb1bf22385553d732260)I've written a simple blog \[post](http://www.michaelsydenham.com/reds-parse-dialect/) about some very basics about `parse` &amp; `change` aimed at beginners like me. I hope to post more as I learn more. Any feedback/corrections welcome. Thanks to the community here for the learnings!

rebolek

[06:25](#msg58feebc7f22385553d73261a)@michaeldesu Nice! The images surely help understanding what is going on.

9214

[06:29](#msg58feecac8bb56c2d11dd879f)@michaeldesu cool! Very newbie-friendly.

michaeldesu

[06:31](#msg58feed5b8fcce56b20342ff5)Thanks

9214

[06:36](#msg58feee85c1d3b5015419aa50)@michaeldesu  
\* \[Rebol wikibook](https://en.wikibooks.org/wiki/REBOL\_Programming/Language\_Features/Parse) will tell you more about original Rebol parse dialect, but it's a little different from the one we have in Red, so,  
\* \[check blog post about Red parse](http://www.red-lang.org/2013/11/041-introducing-parse.html) to see the main differences.

rebolek

[06:37](#msg58feeeb68e4b63533dff81e9)@9214 I certainly wouldn't call it quite different. Red's version is enhanced Rebol's version.

michaeldesu

[06:38](#msg58feeef56aea30763d3cd465)@9214 thanks - I think `change` is not documented yet, but I think it's coming (from above). It's understandable as I see that post was written in 2013!

[06:40](#msg58feef5cd32c6f2f093a44f5)I think it's an important one, as discussed before, I think novice users expect to use the `word:` pointer catching and setting/updating text later, but this `change` mode I think is 'new' (at least to me:-)).

9214

[06:46](#msg58fef0b1f22385553d733542)@rebolek true, I think the main confusion for me was that some `parse` functionality in Red was moved to `split` :)

michaeldesu

[06:46](#msg58fef0d18fcce56b20343ee8)agree

rebolek

[06:49](#msg58fef165881b89e101825ba1)@9214 oh, that :) I see.

9214

[07:00](#msg58fef40e08c00c092ab25396)

```
>> 2 - 1
== 1
>> -: :+
== make op! [[
    "Returns the sum of the two values" 
    v...
>> 2 - 1
== 3
>> probe system/words/-
make op! [[
    "Returns the sum of the two values" 
    value1 [number! char! pair! tuple! vector! time!] 
    value2 [number! char! pair! tuple! vector! time!] 
    return: [number! char! pair! tuple! vector! time!]
]]
== make op! [[
    "Returns the sum of the two values" 
    v...
>> ; how can I bring original `-` back?
>>
```

rebolek

[07:01](#msg58fef43c881b89e1018265ee)@9214 store it somewhere else first

9214

[07:02](#msg58fef4736aea30763d3ce630)@rebolek ha, so I can literally cut off my limbs in Redbol that way? :D

[07:05](#msg58fef52f8e4b63533dff9ba6)

```
>> clear spec-of :help
== []
>> clear body-of :help
== []
>> help print
[] is a block 

*** Script Error: print is missing its value argument
*** Where: print
>> help 'print
[help 'print] is a block 

== print
>> ? parse
[? parse] is a block 

*** Script Error: parse is missing its input argument
*** Where: parse
>> help
[help] is a block 

>> somebody help!
*** Script Error: somebody has no value
*** Where: catch
>> plz
*** Script Error: plz has no value
*** Where: catch
>>
```

rebolek

[07:06](#msg58fef55ccfec91927270ef37):D

[07:06](#msg58fef57a587a245e24465e87)With great power comes great responsibility

dockimbel

[07:28](#msg58fefab38bb56c2d11ddc0ce)@9214 You can also recreate the `op!` from its `action!` counterpart:

```
>> plus: make op! :add
>> 2 plus 3
== 5
```

toomasv

[07:31](#msg58fefb5a6aea30763d3d042d)How can I use anonymous function?

```
>> reduce func [a] [print a] "b"
*** Script Error: func [a][print a] is missing its a argument
*** Where: reduce
```

dockimbel

[07:32](#msg58fefba608c00c092ab2732e)@toomasv

```
>> do [func [a] [print a] "b"]
== "b"
```

toomasv

[07:33](#msg58fefbb48bb56c2d11ddcb07)Thanks!

dockimbel

[07:33](#msg58fefbc98e4b63533dffb5c7)Hmm, didn't work actually...

toomasv

[07:34](#msg58fefbec881b89e101828a63)Yes, just returns last element in block

dockimbel

[07:34](#msg58fefbfdf22385553d7367c3)

```
lisp
>> do reduce [func [a] [print a] "b"]
b
```

toomasv

[07:34](#msg58fefc0b12d240993596c4d7)Great!

[07:45](#msg58fefeb1881b89e1018296b5)But why is it so:

```
>> reduce [func [a] [print a] "b"]
== [func [a][print a] "b"]
>> do [func [a][print a] "b"]
== "b"
```

Is it because `reduce` is binding "b" to argument a, but in case of `do [func...]` it is not bound?

rebolek

[07:47](#msg58feff08f22385553d7373f5)no

dockimbel

[07:47](#msg58feff1e8e4b63533dffc4ba)Because `[func [a] [print a] "b"]` is a block of 4 values, none of which is a `function!`. So you need two evaluations, first one will construct the function, second one will evaluate it (consuming the "b" argument). To be more clear:

```
>> reduce [func [a] [print a] "b"]        ; block of 4 values
== [func [a][print a] "b"]                ; block of 2 values (a function! and a string!)
```

rebolek

[07:47](#msg58feff28881b89e101829990)`reduce` will evaluate each value and return block of results, `do` will do basically the same, but returns last value

toomasv

[07:48](#msg58feff6af22385553d73766b)Got it! Thanks

9214

[07:53](#msg58ff0077cfec919272712743)@dockimbel yes, I actually thought about that

toomasv

[07:55](#msg58ff010ed32c6f2f093a8f23)But then again:

```
>> do [reduce [func [a][print a] "b"]]      ; why does `do` not evaluate this?
== [func [a][print a] "b"]                  ; here should be 2 values now
```

rebolek

[07:57](#msg58ff01668bb56c2d11dde23c)There are two values:

```
>> length? do [reduce [func [a][print a] "b"]]
== 2
```

toomasv

[07:57](#msg58ff0184587a245e244694ab)Oh, I got it -- `reduce` creates another block

rebolek

[07:58](#msg58ff018d8e4b63533dffcf5d)But, `do` executes block that contains `reduce` and its argument, it does not evaluate result of `reduce`.

9214

[07:58](#msg58ff018f8bb56c2d11dde275)

```
>> type? first do [reduce [func [a][print a] "b"]] 
== function!
>> type? second do [reduce [func [a][print a] "b"]] 
== string!
>> length? do [reduce [func [a][print a] "b"]] 
== 2
```

toomasv

[08:05](#msg58ff036508c00c092ab298f1)Well, I got it wrong again :(  
@rebolek @9214 Thanks, this explains the situation:

```
>> do do [reduce [func [a][print a] "b"]]
b
```

9214

[08:12](#msg58ff05058e4b63533dffdd7f)`unset words-of system/words` crashed console :smiling\_imp: with great power... (c)

[08:13](#msg58ff0526cfec919272713fa2)It didn't actually crashed, just closed without any warnings

toomasv

[08:16](#msg58ff05decfec9192727141b7)What did you expect? :D

dockimbel

[08:19](#msg58ff06808bb56c2d11ddf7b6)@9214 You destroyed the universe! ;-) Once we had `protect` support, such actions will be less destructive.

9214

[08:19](#msg58ff06a7f22385553d739881)but that one didn't worked :( it has something to do with `bind`ology, right? Or `copy`?

```
>> bomb: object [explode: does [wait 5 clear words-of :system/words]]
== make object! [
    explode: func [][wait 5 clear words-of :system/words]
]
>> bomb/explode
== []
```

dockimbel

[08:21](#msg58ff070ccfec919272714678)`words-of` gets you a copy of the words, not a direct reference to the list of symbols used in the target context.

9214

[08:22](#msg58ff0747d32c6f2f093aaa5b)@dockimbel ok, so reflectors (`*-of` things) return copy, why then `unset words-of system/words` broke everything?

dockimbel

[08:23](#msg58ff07958fcce56b2034a358)Those two parts in your sentence are unrelated. `unset` accepts a block of words. How to created such block does not matter. Moreover, some reflectors return a direct reference (e.g. `body-of`).

9214

[08:25](#msg58ff0816881b89e10182c011)@dockimbel ah, jeez, I messed up... `clear` != `unset`

[08:26](#msg58ff08348bb56c2d11de005b)attention span of a goldfish :fish:

toomasv

[08:33](#msg58ff09e0c1d3b501541a24d1):point\_up: \[April 25, 2017 11:05 AM](https://gitter.im/red/red/welcome?at=58ff036508c00c092ab298f1)  
Actually, I didn't get it wrong after all! :)  
`reduce [func [a][print a] "b"]` produces `[ "b"]`  
`do [[ "b"]]` produces `[ "b"]` and  
`do [ "b"]` produces `b`  
So, best to stick to `do reduce [...]`.

9214

[08:40](#msg58ff0b60c1d3b501541a2e8c)`deduce: function [x] [do reduce x]` ;)

[08:41](#msg58ff0bb08bb56c2d11de13f4)!\[bravo Watson](http://orig15.deviantart.net/45a4/f/2012/050/8/6/not\_bad\_\_by\_ocean\_crystal-d4q8b10.jpg)

dockimbel

[09:16](#msg58ff13ee587a245e2446e684):-)

toomasv

[10:13](#msg58ff21508e4b63533d005b3f)Yeah, bear with me the dumb one :shipit:

9214

[10:39](#msg58ff2768c1d3b501541ab017)

```
>> repeat i 5 [print i wait 1]
; after 5 seconds
1
2
3
4
5
== none
```

Is that intended? I expected `1 (1 sec) 2 (1 sec) 3 (1 sec) etc`

pekr

[10:41](#msg58ff27f3f22385553d742696)Imo not intended - does not make much sense? ...

9214

[10:58](#msg58ff2be012d240993597a505)I checked Rebol version and it works like expected, gonna fill the ticket

rcqls

[11:02](#msg58ff2cb412d240993597a934) @9214 works as expected on macOS.

9214

[11:03](#msg58ff2d0a587a245e24475a5d)@rcqls oh, now that's weird

[11:05](#msg58ff2d8408c00c092ab354f9)can someone check it on Linux?

rcqls

[11:07](#msg58ff2dd66aea30763d3dd685)@9214 It works too on linux!

9214

[11:07](#msg58ff2e0008c00c092ab356ad)well played MS :shit:

pekr

[11:09](#msg58ff2e5612d240993597af87)Depends how time measures are implemented on each platform ...

9214

[11:11](#msg58ff2ece6aea30763d3dda9a)I'm not sure that it's about time measurement, it simply freezes the output

pekr

[11:12](#msg58ff2f27cfec919272720561)Maybe an incorrect english term, I simply thought about - how time related functionality is implemented ...

9214

[11:13](#msg58ff2f4d8e4b63533d009849)@pekr ah, got it

rcqls

[11:15](#msg58ff2fe4c1d3b501541ad493)@9214 @pekr it works on windows with `red —cli`too. Seems to be related to the `console-gui`.

9214

[11:16](#msg58ff2ff6587a245e244766d2)@rcqls many thanks!

toomasv

[13:36](#msg58ff50ddc1d3b501541b6da3):point\_up: \[April 25, 2017 11:33 AM](https://gitter.im/red/red/welcome?at=58ff09e0c1d3b501541a24d1)  
Continuing to embarrass myself. What I was trying to get at, is this:

```
for-all: func [
	s [series!]
	f 
	/with gather
][
	forall s [
		either with [
			gather: do reduce [f gather first s]
		][
			do reduce [f first s]
		]
	]
]
```

Now I can do things like:

```
for-all "abcde" 'print
for-all/with [3 5 7] 'multiply 1
for-all [split cause-error] 'source
```

Is there some simple clever way in Red to do this kind of stuff?

pekr

[13:50](#msg58ff541bc1d3b501541b7f48)Maybe you are looking for an `apply`func, which is not yet available in Red? http://www.rebol.com/r3/docs/functions/apply.html

toomasv

[14:00](#msg58ff567208c00c092ab41226)@pekr Thanks for the reference, but it is not `apply`. `apply` applies arguments as a block to the function, I apply a function to the block.

rebolek

[14:05](#msg58ff57bac1d3b501541b95ff)@toomasv The proper way would be to pass function, not word referring to it, something like:

```
>> fn: func [s f][foreach v s [f v]]
== func [s f][foreach v s [f v]]
>> fn [1 2 3] :print
1
2
3
```

toomasv

[14:42](#msg58ff60688fcce56b20362b21)@rebolek Thanks for advice!

endo64

[16:56](#msg58ff7faf08c00c092ab4e015)@9214 `repeat i 5 [print i wait 1]` that problem occurs only on gui-console because gui-console already in an event loop and you are `wait`ing inside that loop. I think it will be fixed when the gui-console re-written .

greggirwin

[17:07](#msg58ff825408c00c092ab4ef37)@toomasv, what you're after is a `map` HOF. Doc has ideas on this, and some of us have drafts of implementations. Normally you would do just what Bolek said, but Red gives us another way as well, as `foreach` et al do, where you're anonymous func is just the body.

[17:08](#msg58ff82796aea30763d3f77af)

```
map-each: function [
	"Evaluates body for each value in a series, returning all results."
	'word [word! block!] "Word, or words, to set on each iteration"
	data [series!] ; map!
	body [block!]
][
	collect [
		foreach :word data [
			; @dockimbel said it should return a block of the same size
			; as the input, but there is no hard decision on whether 
			; unset results should be returned as NONE. They are different,
			; as unset! is treated as a truthy value.
			; Supporting unset! results means COLLECT's KEEP func has to
			; be modded to allow any-type! in its spec.
			;if not unset? set/any 'tmp do body [keep/only :tmp]
			;keep/only either unset? set/any 'tmp do body [none][:tmp]
			keep/only do body
		]
	]
]
map-each v [1 2 3] [2 * v]
map-each v "IBM" [v - 1]
;map-each [k v] #(a 1 b 2 c 3) [append form v k]
map-each x [1 2 3 4 5] [either even? x [continue] [x]]
map-each x [1 2 3 4 5] [either even? x [break] [x]]
```

[17:11](#msg58ff832e8fcce56b2036d842)Eliminate the `word` param, and change body to a `function!` arg, and you have standard `map`.

[17:15](#msg58ff8423d32c6f2f093d05a8)And because of Red's free ranging evaluation we can do sort of a "reverse variadic" twist, where we pass a list of all possible args and the target func will take just as many as it uses.

```
; JS-like MAP. The order of args to the function is a bit odd, but is set
; up that way because we always want at least the value (if your func takes
; only one arg), the next most useful arg is the index, as you may display
; progress, and the series is there to give you complete control and match
; how JS does it. Now, should the series value be passed as the head of the
; series, or the current index, using AT?
; This is *sort of* like map-indexed in Clojure.
map-js: func [
	"Evaluates a function for all values in a series and returns the results."
	series [series!]
	fn [any-function!] "Function to perform on each value; called with value, index, series, [? and size ?] args"
	;/only "Collect block types as single values"
	;/skip "Treat the series as fixed size records"
	;	size [integer!]
][
	collect [
		repeat i length? series [   ; use FORSKIP if we want to support /SKIP.
			keep/only fn series/:i :i :series ;:size
		]
	]
]
res: map-js [1 2 3 a b c #d #e #f] :form
res: map-js [1 2 3 a b c #d #e #f] func [v i] [reduce [i v]]
res: map-js [1 2 3 a b c #d #e #f] func [v i s] [reduce [i v s]]
res: map-js "Hello World!" func [v i s] [pick s i]
res: map-js "Hello World!" func [v] [either v = #"o" [1][0]]	; sum result = count
res: map-js "Hello World!" func [v i] [if v = #"o" [i]]			; remove none! values to keep only index values
res: map-js "Hello World!" func [v i s] [if v = #"o" [at s i]]	; remove none! values to keep only series offsets
```

[17:29](#msg58ff8784587a245e24491b4b):point\_up: \[April 25, 2017 12:22 AM](https://gitter.im/red/red/welcome?at=58feeb1bf22385553d732260) @michaeldesu, nice blog entry!

rokf

[18:17](#msg58ff92a6881b89e101856515)@michaeldesu :clap:

dnmurphy

[18:21](#msg58ff93918bb56c2d11e09cdf)@9214 re "repeat i 5 \[print i wait 1]" what result did you expect to see? I ran the code in mac for Rebol and Red and they produced same as you except not showing the "; after 5 seconds"

greggirwin

[18:24](#msg58ff9471f22385553d7642cb)@dnmurphy, in the GUI console on Windows, currently, nothing is displayed until the end, rather than after each tick. That will be fixed in 0.6.3.

[18:25](#msg58ff948b08c00c092ab549a3)OSX, Linux, and Windows CLI are fine.

dnmurphy

[18:25](#msg58ff94b412d240993599a86d)@greggirwin ok thanks, I misread the post

toomasv

[19:14](#msg58ff9ffb6aea30763d4005cb)@greggirwin Thank you for these examples and the explanation! Usually `map` should return the same length as input data, but then `filter` is needed also. But this kind of procedure where you have complete control over the manipulation of succeeding elements of series is very handy. Thanks!

greggirwin

[19:58](#msg58ffaa60c1d3b501541d3cd8)

```
; Clojure: When coll is a map, pred is called with key/value pairs.
; Some langs call this 'partition
filter: function [
	"Returns two blocks: items that pass the test, and those that don't"
	series [series!]
	test [any-function!] "Test (predicate) to perform on each value; must take one arg"
	/only "Return a single block of values that pass the test"
	; Getting only the things that don't pass a test means applying NOT
	; to the test and using /ONLY. Applying NOT means making a lambda.
	; Not hard, for people who understand anonymous funcs.
	;/pass "Return a single block of values that pass the test"
	;/fail "Return a single block of values that fail the test"
][
	;TBD: Is it worth optimizing to avoid collecting values we won't need to return?
	result: reduce [copy [] copy []]
	foreach value series [
		append/only pick result make logic! test :value :value
	]
	either only [result/1][result]
]
```

JacobGood1

[20:00](#msg58ffaae96aea30763d4038fe)@greggirwin I am used to partition being a grouping function, not the classic filter

greggirwin

[20:02](#msg58ffab5f6aea30763d403b10)Yes, my old partition/group funcs can apply any number of tests to create groups. So you really have that as the foundation, and `filter` is just a special case with one test, like `forall` is a special case of `forskip`.

[20:04](#msg58ffabb5cfec919272746389)And we have `remove-each` already, so it's coming up with the hierarchy and naming that's important. e.g. `keep-each` for the bodied version.

[20:04](#msg58ffabd8cfec91927274645d)And with partition, there is the `else` case, for values that don't match any predicate.

[20:10](#msg58ffad478fcce56b2037a897)Will have to fix it up for Red. Doesn't work because of different `repeat` interface. No series support in Red.

[20:12](#msg58ffadbd6aea30763d4045d9)Easy fix.

[20:12](#msg58ffadc3f22385553d76b586)

```
partition: func [   ; GROUP ?
	{Applies each predicate to each element in blk and returns
	a block of blocks with items partitioned by which predicate
	they match. If an item doesn't match any predicate, it will
	be in the last block. Only handles simple args right now.}
	series [series!]
	predicates [block!]
	args
	/local match result p
][
	result: copy []
	loop add length? predicates 1 [append/only result copy []]
	foreach el series [
		match: false
		repeat i length? predicates [
			; Have to use a temp var for the predicate here, in addition to
			; the result of the predicate call.
			p: get predicates/:i
			match: p :el either block? args [args/:i][args]
			if match [
				append result/:i :el
				break
			]
		]
		if not match [
			append last result :el
		]
	]
	result
]
partition [1 2 3.4 5.6 7 8.9] [integer? float?] none
partition [1 2 3.4 5.6 7 8.9 0 100] [lesser? greater?] [3 7]
partition [1 2 3.4 5.6 7 8.9 0 100] [lesser? greater?] 3
```

[20:13](#msg58ffade78fcce56b2037ab06)Need to clean and modernize it. :^)

[20:29](#msg58ffb1c68e4b63533d031111)

```
partition: function [   ; GROUP ?
	"Group values by matching predicate, with last group as vals that didn't match any"
	series [series!]
	predicates [block!] "Block of functions"
	args "Arg to go with each predicate"
][
	result: copy []
	predicates: reduce predicates
	loop add length? predicates 1 [append/only result copy []]	; until we have `array`
	foreach el series [
		match?: false
		repeat i length? predicates [
			match?: predicates/:i :el either block? :args [args/:i][:args]
			if match? [append result/:i :el  break]
		]
		if not match? [append last result :el]
	]
	result
]
data: [0.5 1 2 3.4 5.6 7 8.9 0 100]
partition data [:integer? :float?] none
partition data [:lesser? :greater?] [3 7]
partition data [:lesser? :greater?] 3
```

geekyi

[20:40](#msg58ffb437d32c6f2f093de308)Quick, sort!

[20:41](#msg58ffb47a8e4b63533d031e1c)@geekyi wonders how many people know of partition sort

greggirwin

[20:49](#msg58ffb65d8bb56c2d11e13f2f)Comb sort is my favorite.

rokf

[20:54](#msg58ffb79d6aea30763d4075a6)Which sorting algorithm is used by the `sort` function?

rebolek

[20:56](#msg58ffb7e3f22385553d76e4fb)Quicksort and Merge, see http://www.red-lang.org/search?q=sort

## Wednesday 26th April, 2017

michaeldesu

[01:45](#msg58fffbd0c1d3b501541e8cae)strings are passed into a function by reference - is that correct? I have a recollection that any series is passed in like that.

```
de-space: func [str] [replace/all str " " ""]
a: "hello work"
de-space a
== "hellowork"
>> a
== "hellowork"
```

how to pass it in by value, so it's copied?

PeterWAWood

[01:52](#msg58fffd478bb56c2d11e247ee)@michaeldesu Use

```
copy
```

```
red>> de-space: func [str] [replace/all copy str " " ""]
== func [str][replace/all copy str " " ""]
red>> a: "hello world"
== "hello world"
red>> de-space a
== "helloworld"
red>> a
== "hello world"
```

[01:53](#msg58fffd8ef22385553d77ff54)It is not possible to pass a series! value (such as a string!) by value.

michaeldesu

[01:55](#msg58fffe028e4b63533d0434af)@PeterWAWood thanks alot!

toomasv

[04:12](#msg59001e39587a245e244b8e72)@greggirwin Maybe it would be good to have optimized function for each of these: `map`, `filter`, `partition`, `group`?

greggirwin

[04:15](#msg59001ef9d32c6f2f093f6002)One of the nice things about Red is that it's usually easy to whip up alt versions for testing. Optimization has to be worth it. Sometimes it comes for free, but not often.

[04:17](#msg59001f5a6aea30763d41f4c4)Our brain cells are far more valuable than compute cycles. Moreso every day. At least until performance is so bad that it keeps us from getting the ideas out as fast as they come.

toomasv

[04:20](#msg59001ffc12d24099359bcf45)True. But it wouldn't hurt to have optimised versions and wrapper, eg `deal-with` :), which would let you have all of these together. Thus you could have a hierarchy of functions too, not only datatypes.

greggirwin

[04:22](#msg5900208ec1d3b501541f0d4f)"it wouldn't hurt", it can. ;^) However, I'm not against layers. Sometimes we gain a lot, though, by keeping things grouped contextually.

[04:23](#msg590020c9587a245e244b963f)I normally build hierarchies based on functionality, not performance, but sometimes the lure of speed is too much to resist.

[04:24](#msg5900210af22385553d7879f2)Besides, if we optimize too much, we won't stress test the GC as well when it appears. :^)

## Thursday 27th April, 2017

michaeldesu

[07:23](#msg59019c87587a245e245226b5)I've been trying a tally routine using parse - the following looks ok

```
vowels: charset "aeiou"
a: "this is a lovely lucky cat with nine lives"
v-map: make map! ["a" 0 "e" 0 "i" 0 "o" 0 "u" 0]
== #(
    "a" 0
    "e" 0
    "i" 0
    "o" 0
    "u" 0
)
parse a [some [to vowels copy v vowels (put v-map v (select v-map v) + 1)]]
>> v-map
== #(
    "a" 2
    "e" 3
    "i" 5
    "o" 1
    "u" 1
)
```

but seems a bit clumsy, especially the `put v-map v (select v-map v) + 1)` part which is so nicely done in python using something like `map[key]=value`. I've started to look into using (what I'm calling) a paired-series , i.e.

```
>> v-list: [a 1 e 2 i 3 o 4 u 5]
== [a 1 e 2 i 3 o 4 u 5]

>> ii: 'u
== u

>> v-list/:ii
== 5
```

I feel like I'm onto something, however I'm a total noob about these lit style things. Anyway, if there's a more elegant or better solution to using map, it would be interesting to learn about it. Thanks.

rebolek

[07:25](#msg59019d06cfec9192727c890b)@michaeldesu try something like this:

```
parse a [some [to vowels copy v vowels (v-map/:v: v-map/:v + 1)]]
```

michaeldesu

[07:27](#msg59019d488e4b63533d0b0ce5)@rebolek ah there's always a better way for the noobs, thanks alot!

[07:27](#msg59019d738fcce56b203f9f5c)do you think the `map` the best way here, or paired series is better?

rebolek

[07:28](#msg59019d99d32c6f2f094595c1)You're welcome :) Also, I would replace strings with chars, but both should work same:

```
v-map: make map! [#"a" 0 #"e" 0 #"i" 0 #"o" 0 #"u" 0]
parse a [some [set v vowels (v-map/:v: v-map/:v + 1) | skip]]
```

geekyi

[09:50](#msg5901becbc1d3b501542615d3)@michaeldesu  
&gt; strings are passed into a function by reference - is that correct? I have a recollection that any series is passed in like that.

Everything is, and you have to `copy`. That's all you need to know now.  
It goes deep tho.. and it's subtly different from normal scoping rules. You can think of it as everything being anonymous and being like pointers everywhere. Or it may take an year to sink in..

michaeldesu

[09:52](#msg5901bf6ac1d3b501542617f3)thanks - I've realised it's not quite everything, e.g. an integer is not by reference. But I guess you meant any series.

geekyi

[09:53](#msg5901bf9d8bb56c2d11e9c498)@michaeldesu why not an `integer!`?

michaeldesu

[09:54](#msg5901bfbbc1d3b50154261905)

```
add: function [x] [x: x + 1]
>> my-number: 10
== 10
>> add my-number
== 11
>> my-number
== 10
```

is it correct?

[09:58](#msg5901c0ce12d2409935a2d177)which is different to:

```
>> append-word: function [y][append y "world"]
>> my-str: "hello "
== "hello "
>> append-word my-str
== "hello world"
>> my-str
== "hello world"
```

geekyi

[10:01](#msg5901c1878fcce56b20403cba)Hmm.. I cannot refute your argument

9214

[10:02](#msg5901c19c587a245e2452cad3)`integer!` is a scalar value, so yes, it's not passed by reference

michaeldesu

[10:02](#msg5901c1b6cfec9192727d30ca)how about other numerical types? I guess it's the same as integer

geekyi

[10:04](#msg5901c2318fcce56b20404085)@9214 it's an optimization for non-scalar `series!` like types only?

michaeldesu

[10:05](#msg5901c27f587a245e2452ce5b)same for a real number (not passed by reference)

9214

[10:07](#msg5901c2d38e4b63533d0baf15)@geekyi no clue, I just remembered that someone from guru tribe explained this to me some time ago :D

dockimbel

[10:09](#msg5901c35f587a245e2452d266)All \*immediate* types (`?? immediate!`) are passed by value (they can fit entirely in a value slot). For the rest of types, they are "passed by reference" (not entirely accurate, but good approximation).  
For deeper explanation on that last part, series for example, have a "value slot" part (including the position) and a series buffer part (which is external and shared by all series created from the same original one). Some functions can change the info in the "value slot" part, like changing the position (`next, back, skip`, ...), in such case, the series will behave like "passed by value". Some other functions will modify the series buffer (`append, insert, remove`, ...), in such case, the series will behave like "passed by reference".

9214

[10:11](#msg5901c3cff22385553d7facf8)https://github.com/red/red/blob/master/runtime/datatypes/structures.reds

geekyi

[10:22](#msg5901c65fc1d3b501542636c2)That's helpful, thanks!

michaeldesu

[11:13](#msg5901d25212d2409935a31893)love this message (playing around..)

```
>> source a
Sorry, a is a string! so no source is available
```

just discovered `what` and going through the listings.. feel like I've just opened pandora's box :-)

greggirwin

[16:06](#msg59021723587a245e24546ac0)Pass by val/ref note added to https://github.com/red/red/wiki/Guru-Meditations.

rcqls

[17:22](#msg590228d0f22385553d81a4a8)@greggirwin Thanks for this nice explanation about series.

geekyi

[22:20](#msg59026e90d32c6f2f09495cde)Nothing really groundbreaking here but, while browsing youtube today, I went from \[this](https://www.youtube.com/watch?v=Ne\_FEOK5JHk ),\[this](https://www.youtube.com/watch?v=ddWQU6Wo3v8 ),\[this](https://www.youtube.com/watch?v=QYbi4rbMK88 ), to \[this](https://www.youtube.com/watch?v=GR72NwhuzfA)  
\*\*All music synthesizers\*\*, specifically sequencers, which are like drumkits: looping variations of beats. Approx in increasing order of complexity. Unlike traditional sequencers that don't go beyond manual editing of sequences, some of these allow editing with patterns and even automatic variation and randomization. Wonderful how a properly designed app can be.  
Each of them having the following in terms of UI:  
1\. Extremely dense information visualization  
2\. Real-time modification  
3\. Multiple layers that can be edited (and saved?) separately  
4\. Math. Almost all of them feels like an application of group theory (to me)

[22:26](#msg590270218bb56c2d11ed22c8)The last app reminds me of http://worrydream.com/ScientificCommunicationAsSequentialArt/

michaeldesu

[22:48](#msg59027533f22385553d82f987)@geekyi interesting :point\_up: (about music/synths).. I was recently thinking about resizeable UIs in Red (whether it's possible in the future), as this is cropping up in many DAWs/VST plugins.

geekyi

[22:56](#msg5902772f6aea30763d4c4145)@michaeldesu I think there was some talk on \*adaptive* (vs responsive) uis before.. a search in the chats might turn it up

michaeldesu

[22:59](#msg590277bc8fcce56b20437f88)&gt; Pass by val/ref note added to https://github.com/red/red/wiki/Guru-Meditations.

@greggirwin thanks for maintaining that, some interesting info in there. I noticed some of those entries look like FAQs - perhaps that Guru link should be posted/included on the FAQ page as well? or merged (e.g. take/copy those question-like ones) into the FAQ?

greggirwin

[23:01](#msg5902785d8fcce56b204381c7)Guru entries generally come from chat here. It is FAQ-like though.

geekyi

[23:02](#msg590278718fcce56b20438217)@michaeldesu :point\_left: \[August 26, 2015 2:08 PM](https://gitter.im/red/red?at=55dd820b1b959eaa5602aeef) adaptive aka \*responsive* (I forget the buzzwords) ui

michaeldesu

[23:03](#msg590278c8881b89e101921231)@geekyi thanks

geekyi

[23:04](#msg590278f012d2409935a621d7)@michaeldesu @greggirwin I think a simple re-categorization is needed only from time to time ( Some of that could be moved to a \*Debugging* page?)

greggirwin

[23:04](#msg59027917c1d3b501542996c2)I'm all for someone organizing wikis. That's my main gripe with them in general.

[23:05](#msg5902793df22385553d830829)Just that people (i.e. me) don't take time to organize them.

geekyi

[23:05](#msg590279446aea30763d4c4844)@Scaremonger seems to be pretty good at it :smile:

greggirwin

[23:05](#msg59027953d32c6f2f0949827a)Agreed.

geekyi

[23:07](#msg590279a5587a245e2456304a)I have a little idea of how the debugging red piece of puzzle works a bit now.. I have to organize some links I have tho..

[23:10](#msg59027a4e8bb56c2d11ed4660)https://papaly.com/ looks like a good social bookmarking service that allows organizing of links into a browsable form. Might be better than putting everything into a gist (drag and drop organizing) Less resilient tho (because they aren't text files)

[23:13](#msg59027b10f22385553d831152)https://papaly.com/#board\_id=6c857d19f6854e0cabf209d851a92533 is something I tried, but it's not yet integrated into my workflow..

[23:13](#msg59027b3412d2409935a62b3f)Would be happy to collab with anyone on a red board!

## Friday 28th April, 2017

michaeldesu

[05:17](#msg5902d0788fcce56b2044909a)just experimenting with directories:

```
>> foreach file list-dir pwd [print file]
%/C/~tools/Red/    red-062.exe            sheet2.xml             TT Archive -20...  *** Script Error: foreach does not allow unset! for its series argument
*** Where: foreach
>> a: dir
    red-062.exe            sheet2.xml             TT Archive -20...  *** Script Error: a: needs a value
*** Where: a
```

why are the `Script Error`s occurring? Alternatively, how do you put a list of files into a series block.

9214

[05:32](#msg5902d3fbf22385553d842c8e)@michaeldesu

```
>> read %./hax/
== [%KaratInstall.rar %metasploit-latest-windows-installer-x86.exe %metasploit-latest-wind...
```

[05:35](#msg5902d4b1c1d3b501542ac57f)

```
>> series? list-dir %./hax
    KaratInstall.rar       metasploit-lat...      metasploit-lat...      MiniMouseMacro...  
    nemesis-1.4.zip        PacketSenderPo...      PlayCap-0.1.1-...  == false
```

`list-dir` returns `unset`, not `series!` value, that's why `foreach` can't iterate over it

michaeldesu

[05:36](#msg5902d4d512d2409935a740ab)@9214 thanks - that was a bit unexpected, but I see file! can be a directory, so I guess it makes sense.

[12:13](#msg590331d1cfec919272833b08)I'm wondering how to get the length of a matched content in a parse statement, without advancing the pointer. I noticed this example on the Red Parse blog:

```
parse "aaabbb" [copy letters some "a" (n: length? letters) n "b"]
```

but the pointer advances to the start of the b's. How to get the length of the a's without advancing the pointer?

[12:15](#msg59033245d32c6f2f094c28a2)also to confirm, it's not possible to skip backwards, isn't it? From my testing, seems like for setups like `n skip` n &gt;= 0 is ok

[12:33](#msg590336a18bb56c2d11f001cc)never mind, I found the answer, it's using `ahead`

xqlab

[12:34](#msg590336bc8e4b63533d11d1b4)You can either use ahead

```
or   pos:  get an index and  set an index ':pos
```

parse "aaabbb" \[ pos: copy letters some "a" (n: length? letters) :pos n "b"] \`

michaeldesu

[12:34](#msg590336d3cfec919272835215)@xqlab thanks! It's interesting how ahead works, treating the whole `copy letters some "a"` as a rule (block)

xqlab

[12:34](#msg590336ea8e4b63533d11d26c)How can I edit ?

michaeldesu

[12:35](#msg590336f808c00c092ac4ade1)press the up arrow key, or try clicking on the 3 dots next to your message (edit)

xqlab

[12:41](#msg5903385d12d2409935a8e28c)Thanks too

sergey6661313

[16:03](#msg590367c96aea30763d4ff857)how to run red func from #System or routine block?

```
Red[]

	my-test-red-func: func [ ] [ print "lal" ]

	#System [
		my-test-red-func
	]
```

returned  
'\*\** Compilation Error: undefined symbol: my-test-red-func '

9214

[16:12](#msg590369dfcfec919272844657)@sergey6661313 you mean \[this](http://static.red-lang.org/red-system-specs-light.html#section-16.8)?

meijeru

[16:12](#msg590369ee6aea30763d50038b)You should put `#call` in front.

[16:13](#msg59036a1308c00c092ac59db4)@9214 you beat me :smile:

9214

[16:13](#msg59036a22587a245e2459ed4f):muscle:

sergey6661313

[19:04](#msg590392238bb56c2d11f1b2c2)Thx!

AlexanderBaggett

[21:49](#msg5903b8f1c1d3b501542ec7b0)Is there a way to do menu events without actors?

## Saturday 29th April, 2017

geekyi

[09:40](#msg59045f8d587a245e245d35e4)@geekyi assumes @AlexanderBaggett got the answer in red/help

michaeldesu

[10:12](#msg5904671ef22385553d8a31bd)Please help me understand about initialising a series in a function. I have the following test case. The aim is to have an empty block each time the function is run.

```
test-me: function [str [string!]] [
    my-series: []
    print [">" my-series]
    foreach x str [append my-series to-integer to-string x]
]

test-me "123"
test-me "456"
test-me "789"
```

However the output emitted by the print statement in the function shows me the series is not initialised to empty each time the function is called, i.e. I see:

```
>
> 1 2 3
> 1 2 3 4 5 6
```

so I guess `my-series: []` is not the best way to init an empty series for this case.

xqlab

[10:14](#msg590467966aea30763d536a02)Use  
my-Series: copy \[]  
or  
my-Series: clear \[]  
in order to initialize anew

[10:15](#msg590467bc8bb56c2d11f45f28)as long as no GC clear \[] is recommended

michaeldesu

[10:16](#msg59046801d32c6f2f0950814d)@xqlab thanks alot - `clear` is good. This is a bit counter-intuitive, unless a series can be like a static variable (in the way I did it). I guess I take it away as another learning :-). The reason why it's confusing is in the REPL it seems to work logically:

```
>> a: [1 2 3]
== [1 2 3]
>> a: []
== []
>> a
== []
```

of course it might just be the behaviour in a function is different.

greggirwin

[10:26](#msg59046a63881b89e101991229)The REPL does an implicit copy, which is confusing. Learning about copying series is a rite of passage in Redbol. :^)

michaeldesu

[10:35](#msg59046c84881b89e1019918ba)thanks @greggirwin

dockimbel

[10:36](#msg59046cb6f22385553d8a415f)@michaeldesu If you create your block dynamically, you would not run into such issue:  
`my-series: make block! 1` or doing some preallocation: `my-series: make block! length? str`.

[10:37](#msg59046cfc6aea30763d537796)Though, the `clear []` is the most memory-saving option.

michaeldesu

[10:38](#msg59046d2508c00c092ac904d3)thanks alot @dockimbel

[10:50](#msg59047008c1d3b5015430e064)is it by design that `my-series: []` acts like a static variable (i.e. no clear or copy in use), or this is a side-effect of my bad coding

greggirwin

[10:51](#msg5904702312d2409935ad3d92)It is by design.

michaeldesu

[10:52](#msg59047057587a245e245d6e19)thanks @greggirwin - ok so it's a potentially useful feature to keep in mind for the future

greggirwin

[10:52](#msg5904705a6aea30763d53827a)And it is true for all series variables in functions.

GiuseppeChillemi

[10:53](#msg590470b56aea30763d538431)A good question would be: why it has been designed in such a way !

greggirwin

[10:53](#msg590470b58bb56c2d11f47c71)Yes, it catches everyone not long after they start Reducing, but it is definitely intentional.

[10:58](#msg590471bd12d2409935ad421e)https://github.com/red/red/wiki/Why-do-I-have-to-copy-series-values%3F

dockimbel

[10:59](#msg590472278fcce56b204a7153)@michaeldesu @GiuseppeChillemi There is no specific design rule there, it is just a consequence of how the language works (both Red and Rebol). It boils down to understanding what `word: []` is, and how it is evaluated. It is deeply different from what you would have in another language (like in JS: `v=""`, or `v=[]`). Understanding such expression is a key part of understanding Redbol.

GiuseppeChillemi

[11:02](#msg590472b28bb56c2d11f482b1)@dockimbel Is there any documentation helping us undestand this and the global picture behind this design ?

greggirwin

[11:02](#msg590472d1c1d3b5015430e8aa)See the link I just posted.

dockimbel

[11:02](#msg590472d3587a245e245d768e)@GiuseppeChillemi There is this wiki entry posted by Gregg above, and otherwise, the whole Rebol documentation.

GiuseppeChillemi

[11:03](#msg590472eaf22385553d8a5427)Which just disappeared as we lost rebol.com

[11:03](#msg590472f16aea30763d538afc):(((

michaeldesu

[11:03](#msg59047301587a245e245d76b7)agree - that link probably should be required reading by any newcomer

dockimbel

[11:03](#msg5904730dcfec91927287b4a2)@GiuseppeChillemi http://web.archive.org/web/20170325102835/rebol.com

[11:04](#msg5904732ccfec91927287b503)A fundamental cause is that there is no distinction between "code" and "data" in Redbol. `word: []` is data, which eventually gets evaluated. In JS, `v=[];` is just code.

michaeldesu

[11:05](#msg590473648fcce56b204a7464)wow - did rebol.com recently die?

greggirwin

[11:05](#msg59047386cfec91927287b70a)There are just some domain expirations going on.

michaeldesu

[11:05](#msg590473878bb56c2d11f486c3)"there are no "variables" in Red" - wow. Yeah may as well check all the preconceived notions about other languages at the door :-)

dockimbel

[11:07](#msg590473eb8bb56c2d11f48763)"variable" is a convenient approximation we use, but we know that the meaning behind it, is different in Redbol.

[11:08](#msg5904742ccfec91927287baaa)Golden rule of learning Red/Rebol: forget about the programming languages you already know, that knowledge will get in the way (unless it's Lisp ;-)), start with a fresh mindset.

michaeldesu

[11:09](#msg590474658fcce56b204a771f)this is interesting about words/variables http://web.archive.org/web/20161214100405/http://www.rebol.com/r3/docs/guide/code-words.html

GiuseppeChillemi

[11:09](#msg59047474881b89e1019936cd)Noooo, it makes me feel strange reading you using "Redbol" word....

[11:10](#msg5904748b881b89e1019936e5)I am just reading the first link

michaeldesu

[11:10](#msg5904749e881b89e10199372e)so I guess an analog for 'variables' is like a key: value pairing? where words are like the keys? and value is the actual data (or function). I guess it doesn't matter. So I can see there really are no variables, it's all just data (and even the labels).

greggirwin

[11:10](#msg590474af8bb56c2d11f48c19)Redbol is our word to encompass all rebol-like languages.

[11:11](#msg590474eecfec91927287bd1a)@michaeldesu, right, with each pairing being unique to a context.

[11:12](#msg5904753912d2409935ad4c18)A context (and objects are contexts) can be viewed as 2 columns, the first being the words and the second being the values they refer to.

dockimbel

[11:14](#msg590475848e4b63533d165ce9)@michaeldesu That R3 doc is to be taken with a grain of salt, as it tries to fit the concept of "variable" into Rebol, to ease the learning process, but I think a clear cut would be better, to avoid newcomers building a wrong mental model of how words and binding work.

PeterWAWood

[11:14](#msg590475846aea30763d539456)@dockimbel @greggirwin @GiuseppeChillemi Correction - The rebol.com domain name has not yet expired. I can access the homepage only. My ISP has probably cached the page.

[11:15](#msg590475ea8e4b63533d165e4a)Unfortunately this trick only seems to regain access to the Rebol.com homepage.

GiuseppeChillemi

[11:19](#msg590476c58fcce56b204a7f79)@dockimbel The last 5 lines of the documentation cleared everything:  
&gt;&gt; One more thing. The colon (:) suffix in a word is not an assignment operator (as in other languages), it's part of the set-word! datatype literal syntax. When evaluated, it binds the word to the result of next expression. It doesn't do anything more than that. So a: "" does not "reset" or "reinitialize" the "variable" a. That is an incorrect interpretation, it just makes the word a refer to the literal string "" which follows it.

[11:20](#msg590476fdc1d3b5015430f63c)It is time I read the Bindology article from Ladislav....

[11:21](#msg5904774e587a245e245d878e)@dockimbel &gt; but I think a clear cut would be better, to avoid newcomers building a wrong mental model of how words and binding work.

[11:22](#msg5904775c8bb56c2d11f49560)In fact I have a wrong mental model of this.

greggirwin

[11:22](#msg590477918fcce56b204a81af)https://gist.github.com/9214/1dd30a88383a3e46edf45e33e9def3a7 if you want to melt your brain, or a spoon, a bit.

GiuseppeChillemi

[11:23](#msg590477be8e4b63533d166790)I would like to see how code/data is structured underneath in a structured manner. Is there any graph/table

dockimbel

[11:24](#msg590477fecfec91927287c824)Variables in most other languages are just labels on memory storage spaces. The variable type is the type of the value stored into that memory place. In Redbol, a word is a first-class datatype, of type `word!` and that never changes. A word can exist and be manipulated, \*without referring to any other value\*. A word can refer to values of any type. Making a word refer to a value (let's say a string), does not change the type of the word, it is still `word!`. So, in Redbol, you have two distinct entities: word and the referred value. Such distinction does not exist in most other languages, which just have "variables", that's why such term can be misleading in Redbol.

pekr

[11:27](#msg5904788a08c00c092ac92cf7)@greggirwin Is REPL doing an implicit copy of the series a correct behaviour? Don't remember, how it was in R2 and can't check right now, typing on a phone ...

GiuseppeChillemi

[11:27](#msg590478a2f22385553d8a68af)@greggirwin I am not able to translate correctly the english word SPOON.  
The volcabulary say it is "cucchiaio", the food table companion tool of a FORK

greggirwin

[11:28](#msg590478de08c00c092ac92e4b)That's the funny thing @GiuseppeChillemi, if you look at Red you can see the structure.

[11:29](#msg590478ffcfec91927287ce88)@pekr, it is a convenience when working in the REPL.

GiuseppeChillemi

[11:29](#msg5904791b08c00c092ac92fbe):(

[11:29](#msg5904792108c00c092ac92fd2)REPL stands for ?

pekr

[11:29](#msg590479318e4b63533d166cdc)@GiuseppeChillemi "There is no spoon" might be a famous message from the Matrix movie :-)

greggirwin

[11:29](#msg59047937d32c6f2f0950b908)Read Eval Print Loop. The console bascially.

GiuseppeChillemi

[11:30](#msg5904794412d2409935ad5be7)Thanks !

greggirwin

[11:30](#msg590479486aea30763d53a2a6)@GiuseppeChillemi, the translation is correct. It refers to this: https://www.youtube.com/watch?v=uAXtO5dMqEI

dockimbel

[11:32](#msg590479cbcfec91927287d0ae)@GiuseppeChillemi  
&gt; I would like to see how code/data is structured underneath in a structured manner. Is there any graph/table

As Gregg said, just look at the "code" in front of you, that's the structure, blocks, values, words, ... Underneath, it's just the encoding of those values in memory in binary format (using 128-bit cells, you can see blocks as arrays of cells).

GiuseppeChillemi

[11:33](#msg59047a0b12d2409935ad5e6c)Thanks, now it is time to have a meal for me... I'll complete my study later.

greggirwin

[11:35](#msg59047a7acfec91927287d2d5)@GiuseppeChillemi, in Lisp, there is an outer set of parens that makes it clear everything lives inside that "list". In Red, that outer block is implicit, so you don't see it. But if you imagine it there, then everything you see is just a series of values inside that block.

GiuseppeChillemi

[16:48](#msg5904c3d008c00c092aca43b0)I hate you. I have headache ! I am just revisiting the topic and the spoon script... it will take some more question from me.

greggirwin

[16:59](#msg5904c68212d2409935ae6155):^)

[17:00](#msg5904c6a28bb56c2d11f5bf24)The thing is, many people can use Red effectively without ever knowing anything about how it works internally.

Senenmut

[19:23](#msg5904e819f22385553d8bf86b)Hi GuiseppeChillemi , many people sometimes hate thing in their occupation activities. Just remember captain trump who became manytimes a little bit angry about Sledge Hammer and the 45er Magnum. Finally they wordked together on the new project...............

[19:37](#msg5904eb86d32c6f2f09524a14)https://www.youtube.com/watch?v=cQl6r0fqRAI

## Sunday 30th April, 2017

ghost~5680c5f416b6c7089cc058a5

[14:17](#msg5905f1f2587a245e24624dc4)&gt; it is a convenience when working in the REPL.

[14:17](#msg5905f21112d2409935b20a39)Wouldn't it lead to confusions? Something works in the console differently than when the same code is compiled.

[14:18](#msg5905f24dcfec9192728c9245)For newbies like me, it is sure confusion. I would like consistent behaviour between repl, interpreter and compiler (dyn-stack branch)

[14:19](#msg5905f2808fcce56b204f2576)Differences between the behaviour will lead to gotcha moments. Either all these gotcha moments need to be documented or behaviour made consistent.

greggirwin

[15:16](#msg5905ffc6d32c6f2f09558f27)@nc-x, the question is how to make that work. In the console, Red takes a string input (what you type) and has to `load` that, then `do` it. In a script, the entire thing gets loaded once, and you are operating on a block of red values after that. That is, running a script looks like this (using @michaeldesu's example from above):

```
do load {
test-me: function [str [string!]] [
    my-series: []
    print [">" my-series]
    foreach x str [append my-series to-integer to-string x]
]

test-me "123"
test-me "456"
test-me "789"
}
```

Where running in the console is like this:

```
str: {function [str [string!]] [
    my-series: []
    print [">" my-series]
    foreach x str [append my-series to-integer to-string x]
]}

test-me: do load str
do load {test-me "123"}
test-me: do load str
do load {test-me "456"}
test-me: do load str
do load {test-me "789"}
```

Does that make sense?

## Monday 1st May, 2017

dockimbel

[08:35](#msg5906f33b881b89e101a121dd)@nc-x I'm not sure what @greggirwin meant by "implicit copy", but there is no difference in how the REPL and the compiler handle series (unless there's a bug I'm not aware of).

pekr

[08:41](#msg5906f4d3f22385553d926c21)Implicit copy - imo that in the repl, single assignment like `blk: []`behaves like `blk: copy []`?

dockimbel

[08:49](#msg5906f696cfec9192728fda59)There is no such rule in Red, nor in Rebol.

docmathoc\_twitter

[10:00](#msg59070732c1d3b50154396af9)Hi all - anyone tried choco install red recently? I get a hash error...

[10:07](#msg590708d0d32c6f2f0958e486)(On intel windows 10 64)

dockimbel

[10:08](#msg5907092108c00c092ad17dce)@dander ^---

greggirwin

[16:02](#msg59075c01d32c6f2f095a415a)@dockimbel "implicit copy" was me trying to keep it simple, which I decided wasn't as good as a better explanation.

dander

[17:20](#msg59076e50881b89e101a30d59)@dockimbel I'm getting the checksum error too. I thought I had double-checked that. Did the release binary change?

[17:45](#msg59077457d32c6f2f095aaf71)@docmathoc\_twitter I updated the checksum of the package. It should be available within an hour or so probably

GiuseppeChillemi

[20:42](#msg59079dcec1d3b501543bd667)After 2 days I have understood that in A: \["hello!" "world!"]  
: makes a link and an assignment

[20:44](#msg59079e266aea30763d5e6c03)It seems to me more natural that A: \[] removes this link. Why the choice has gone to A: copy \[] and not A: \[]  
Has A: \[] a meaning ?

[20:46](#msg59079e9e12d2409935b804e2)Also I need a good explanation of CONTEXT and the words MOLD, FORM, BIND etc... where I could find one ?

dander

[21:18](#msg5907a64312d2409935b82647)@GiuseppeChillemi when you evaluate a `set-word!` (i.e. `a: ...`) it sets the value of the word to whatever follows it. The `[]` is a literal block with no elements in it, but it's important to realize that there is not a distinction between code and data (the whole function body is just data, and can be manipulated). If you modify the value referenced by `a`, you can see that block actually gets changed

```
>> f: function [value][a: [] append a value]
== func [value /local a][a: [] append a value]
>> f "hello"
== ["hello"]
>> :f
== func [value /local a][a: ["hello"] append a value]
```

If you want a new block each time, you can either `copy []` which makes a copy of an empty block that nothing else will be touching, or `make block! n` which initializes a new block with `n` slots

[21:19](#msg5907a66bedf919574a68f465)I hope I am not over-complicating things

[21:34](#msg5907a9de12d2409935b83604)I think the most comprehensive docs are still the Rebol2 docs (unfortunately not online at the moment), though there are some inconsistencies with Red, still a useful resource  
https://web.archive.org/web/20170105211834/http://www.rebol.com/docs/core23/rebolcore.html  
and  
http://web.archive.org/web/20170105074227/http://www.rebol.com/docs/dictionary.html

AlexanderBaggett

[21:50](#msg5907ad9e881b89e101a415a2)I believe we should start getting some documentation of our own. And, if updating documentation pages is not easily feasible, perhaps we could start asking questions on stackoverflow.

RnBrgn

[22:48](#msg5907bb3bd32c6f2f095bd4fb)@GiuseppeChillemi A good way to explain FORM is to see how it works in an example. Run the script below which creates a simple csv text file. Run the script using the word FORM than run it again removing the word FORM from the script.

```
Red []
 users: [ "John Smith" "123 Tomline Lane Forest Hills, NJ" "555-1234" 
"Paul Thompson" "234 Georgetown Pl. Peanut Grove, AL" "555-2345" 
"Jim Persee" "345 Pickles Pike Orange Grove, FL" "555-3456"
 "George Jones" "456 Topforge Court Mountain Creek, CO" ""
 "Tim Paulson" "" "555-5678" ]
 foreach [name address phone] users [
 write/append %users.csv form reduce [ name ", " address ", " phone "^/" ] ]
```

greggirwin

[23:02](#msg5907be8a6aea30763d5eeeb9)See also: http://www.red-by-example.org/#form and http://www.red-by-example.org/#mold

AlexanderKoshkarov

[23:22](#msg5907c34312d2409935b89743)Hey all, I just learn about red language existence. It is advertised to be very expressive. How does it compare to for example haskell with it's typeclasses ad hoc polymorphism. And for example with racket which probably has the most powerful DSL building capabilities?

[23:25](#msg5907c3e1d32c6f2f095bf392)and it looks that one of the targeted audience is system programming, so what about red vs rust?

## Tuesday 2nd May, 2017

gltewalt

[01:37](#msg5907e2e1edf919574a69c877)Rascal or Racket?

[01:38](#msg5907e30dc1d3b501543cc5e1)I tried Racket about a month ago - felt like I had handcuffs on compared to Red. (Just to do basic things)

AlexanderKoshkarov

[01:39](#msg5907e337c1d3b501543cc643)what about haskell?

[01:40](#msg5907e38d12d2409935b8ff30)I never tried rascal... only racket. so far looks good

gltewalt

[01:41](#msg5907e3ce8bb56c2d11004a0e)@dander Rebol 2 docs are good, but there are things that will trip up the Red user immediately. The first Parse example comes to mind, and there were a few others that I can't recall right now - but more examples of first or second examples not working in Red

[01:42](#msg5907e4098bb56c2d11004a78)I've never attempted Haskell. @geekyi Has experience, also he might be able to give you some input

AlexanderKoshkarov

[01:42](#msg5907e411881b89e101a4d0e2)racket has clear modo: programmable programming language, but I cannot understand what is main advantage of Red. The desription: the one to rule them all does not look convincing

gltewalt

[01:44](#msg5907e46a6aea30763d5f724f)Domain Specific Languages. Can do system programming if you wish.  
Compiles to binaries. Easy cross compiling.

geekyi

[01:45](#msg5907e4b6f22385553d9618bb)@AlexanderKoshkarov the \*\*tldr\** is that red is still very much alpha. While you may feel a lot of things are missing, from what I've seen and experienced, almost anything can be easily implemented

gltewalt

[01:48](#msg5907e5898e4b63533d221df7)Main advantage to me is that I feel more 'free' when playing around, And at the same time, challenged, because it's very different.

[01:50](#msg5907e5e38e4b63533d221f76)Lots of people would say that Parse is a big advantage

AlexanderKoshkarov

[01:51](#msg5907e60dc1d3b501543cce67)I see, anyway to promote it, you probably you need to have some good slogan. First thing you read is "Red is a new programming language strongly inspired by Rebol" but well, there are people who are not aware of Rebol. You need something anyone can understand, or at least become curious about, like: Haskell - pure, racket - programmable programming language, python - one way to do it, rust - no need for GC, perl - a lot of ways to do it, etc...

geekyi

[01:51](#msg5907e61712d2409935b9083e)Re. Haskell, altho Red has a very rich set of types, what I want most is \*typeclasses\*. I feel a more sophisticated system could be implemented tho. Some people have code for higher order functions.  
The general idea is to steal from the best I think. Doc said he'd implement something based on Rust ownership system in the future.

[01:52](#msg5907e653881b89e101a4d914)@AlexanderKoshkarov Red - have it all, or implement yourself ;)

AlexanderKoshkarov

[01:52](#msg5907e66a881b89e101a4d930)hah, it is lisp slogan

[01:54](#msg5907e6baf22385553d961fa2)steal from the best is good, but you guys originate from this strange Rebol, so Red probably has it's big thing, right? what is it? =)

geekyi

[01:54](#msg5907e6d06aea30763d5f78c3)There are quite a lot of things that is different.. but if I were to settle on any one thing, it's being able to change the language to suit yourself. This might mean different things to different people

AlexanderKoshkarov

[01:55](#msg5907e6fa6aea30763d5f7919)heh, that is exactly what Racket folk telling me about racket....

geekyi

[01:56](#msg5907e74eedf919574a69d773)..And also being simple, like forth? :)

AlexanderKoshkarov

[01:56](#msg5907e761881b89e101a4dc34)oh, I do not know forth

gltewalt

[01:57](#msg5907e78012d2409935b90d0a)Here's one. It has no scope.

AlexanderKoshkarov

[01:57](#msg5907e7a212d2409935b90d52)I know Red is lisp influenced , homoiconic and all. But a lot of languages have it, even for example Julia

[01:58](#msg5907e7a85f3e76601edc9d53)no scope?

gltewalt

[01:58](#msg5907e7a908c00c092ad4eaa3)There are no scopes. :smile:

AlexanderKoshkarov

[01:58](#msg5907e7b95f3e76601edc9d65)heh

geekyi

[01:58](#msg5907e7bb881b89e101a4ddf9)@AlexanderKoshkarov Have you heard of factor? My next favourite thing (it's a forth dialect with high-level programming constructs, \*combinators\*)

AlexanderKoshkarov

[01:58](#msg5907e7bfd32c6f2f095c6288)that is interesting

[01:58](#msg5907e7d2f22385553d96241d)factor? not really

gltewalt

[01:58](#msg5907e7d908c00c092ad4eafb)It's called definitional scoping.

dockimbel

[01:58](#msg5907e7de8e4b63533d222976)@AlexanderKoshkarov "Red: there is no code"

AlexanderKoshkarov

[01:59](#msg5907e7ee8e4b63533d22298c)=D

dockimbel

[01:59](#msg5907e7f38e4b63533d2229a1)"Red, it's bigger on the inside."

AlexanderKoshkarov

[01:59](#msg5907e817c1d3b501543cd5a6)that's better =)

geekyi

[01:59](#msg5907e8188e4b63533d2229e8)Well, that's better I suppose

gltewalt

[02:01](#msg5907e89108c00c092ad4ed6a)"building the worlds first full stack programming language"

AlexanderKoshkarov

[02:02](#msg5907e8a2f22385553d9626c5)yes

[02:02](#msg5907e8bed32c6f2f095c651a)I was not ment to be an asshole, but you defiantly need to sell it with better marketing

geekyi

[02:02](#msg5907e8cad32c6f2f095c6527)I do feel like Julia is a really nice language we can steal ideas from..

[02:03](#msg5907e8f6881b89e101a4e1e8)@AlexanderKoshkarov did you checkout http://www.red-lang.org/p/about.html ?

dockimbel

[02:04](#msg5907e9256aea30763d5f8073)@AlexanderKoshkarov More seriously, it's hard to sum it up in a single sentence, as there are many dimensions in Red you won't find them all in other languages: everything is data (even more so than Lisps), DSL-oriented (5 or 6 DSL built-in already), (real) full-stack programming from metal to high abstractions, built-in cross-platform GUI system, reactive programming, etc...

AlexanderKoshkarov

[02:04](#msg5907e94712d2409935b912cf)yes, I even watched some part of video

gltewalt

[02:05](#msg5907e94c881b89e101a4e2e7)"The matrix is real"

AlexanderKoshkarov

[02:07](#msg5907e9d9edf919574a69df56)@geekyi , when I read a list of features in http://www.red-lang.org/p/about.html I thought: I saw every point of this list already somewhere, so what Is so special about Red? and I came here bugging you guys

dockimbel

[02:08](#msg5907ea1bc1d3b501543cdd0c)@AlexanderKoshkarov Your point is valid, it's just that whatever punch-line you can think of, it would be very reductive compared to the vast number of features Red offers (and will offer). Yet, we need to select one best angle for marketing it. Fullstack programming might be that one.

AlexanderKoshkarov

[02:09](#msg5907ea418e4b63533d223153)"Single-file (~1MB) contains whole toolchain, standard library and REPL." damn! at first I thought, the hellow world is ~1MB =D

dockimbel

[02:10](#msg5907eaa8881b89e101a4e871)1MB = Red compiler + native cross-compiler + linker + interpreter + runtime library (~50 datatypes, GUI system, 5 DSLs, ...) + REPL (a CLI and a GUI one).

AlexanderKoshkarov

[02:11](#msg5907eabfedf919574a69e399)well, yes, now I see

[02:11](#msg5907eac0c1d3b501543cdf37)=D

gltewalt

[02:11](#msg5907eac28fcce56b20563412)I say play with it for about a week. You'll probably have a "oh my god" moment

AlexanderKoshkarov

[02:11](#msg5907eac5881b89e101a4e8cc)that is neat

geekyi

[02:11](#msg5907ead05f3e76601edca5ce)@AlexanderKoshkarov mm, I think I forgot biggest selling point ;) currently, gui works best on windows. Contributions welcome elsewhere :)

AlexanderKoshkarov

[02:11](#msg5907eadeedf919574a69e3cd)I do not use windows

[02:11](#msg5907eae0f22385553d962f41)=D

geekyi

[02:12](#msg5907eb0d8bb56c2d11006497)A lot of others here use wine. But MacOS works slightly I think

AlexanderKoshkarov

[02:12](#msg5907eb1308c00c092ad4f536)Well, I will play, you've got me intrigued

[02:12](#msg5907eb298fcce56b20563647)no mac for me =)

[02:13](#msg5907eb51d32c6f2f095c6d84)Once I've passed my comprehansive exam (in 2 weeks) I will play with red, it is indeed looks interesting

dockimbel

[02:15](#msg5907ebb56aea30763d5f8947)@AlexanderKoshkarov You can have an overview of a few key features through some of the blog articles like:  
\* http://www.red-lang.org/2016/03/060-red-gui-system.html  
\* http://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html  
\* http://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html  
\* http://www.red-lang.org/2013/11/041-introducing-parse.html

AlexanderKoshkarov

[02:15](#msg5907ebca6aea30763d5f8970)thx

geekyi

[02:15](#msg5907ebd88bb56c2d110066be)@geekyi is curious how @AlexanderKoshkarov found out about red

AlexanderKoshkarov

[02:16](#msg5907ec00edf919574a69e79f)mm, let me remember

[02:16](#msg5907ec0bf22385553d9632cb)I was on some forum about common lisp

[02:16](#msg5907ec0f881b89e101a4ef23)someone mentioned it

[02:17](#msg5907ec39c1d3b501543ce2fa)Just decided to see what it is

dockimbel

[02:19](#msg5907ec94f22385553d96341c)We have some CL fans here (@maximvl) who can give you some better info by comparing it to CL.

AlexanderKoshkarov

[02:19](#msg5907eca16aea30763d5f8bb4)I do not know CL

[02:19](#msg5907eca86aea30763d5f8c03)I am learning racket

[02:19](#msg5907ecb7881b89e101a4f083)so I am close to lisp in some sense

dockimbel

[02:19](#msg5907ecc6f22385553d9634b1)Then @JacobGood1 might give you better insights.

[02:20](#msg5907ecf0d32c6f2f095c72d4)@AlexanderKoshkarov FYI, we have plans for a "typed Red", something along the lines of Typed Racket.

AlexanderKoshkarov

[02:22](#msg5907ed51f22385553d96368c)heh

[02:22](#msg5907ed6f08c00c092ad4fc86)btw it is not working with arch linux out of the box (. anyway, I will fix it latter, once I pass my exam

geekyi

[02:23](#msg5907ed8a8bb56c2d11006ae8)@AlexanderKoshkarov 32 bit libs are \[needed](http://www.red-lang.org/p/download.html)

dockimbel

[02:23](#msg5907ed98c1d3b501543ce78e)@AlexanderKoshkarov Yes, 32-bit libs are needed for now.

JacobGood1

[02:23](#msg5907ed9ed32c6f2f095c745c)Clojure, CL, and Shen... those are the Lisps I am most familiar with

AlexanderKoshkarov

[02:23](#msg5907edb7c1d3b501543ce7df)Shen... nice lisp... if you cal it so =D

dockimbel

[02:24](#msg5907ede7881b89e101a4f4a4)@AlexanderKoshkarov Good luck for your exams then, see you around.

AlexanderKoshkarov

[02:24](#msg5907edf85f3e76601edcb05f)Thanks

JacobGood1

[02:25](#msg5907ee00edf919574a69eebc)@AlexanderKoshkarov yea, quit procrastinating =P

AlexanderKoshkarov

[02:25](#msg5907ee1108c00c092ad4fe97)for anyother Arch linux users, there is an AUR package https://aur.archlinux.org/packages/red/

[02:25](#msg5907ee2bc1d3b501543ce8df)eh, @JacobGood1 you are right...  
Thanks guys

greggirwin

[03:47](#msg5908014d8fcce56b20568182)I was reading some Robert Martin articles recently, and he has some great thoughts (I don't always agree with him, but sometimes I do strongly). One point was that there is nothing new in programming languages, not for a long time. We tweak and flavor, but nothing is revolutionary.

Each of us has favorite things about Red, and there are things about it that elegantly combine ideas from Lisp, Forth, Logo, and others. We can talk tech about a lot of things that are different, but it still doesn't tell the story. For better or worse, you really need to experience it to feel the difference.

One thing I often bring up is the number of datatypes, and how they let you clearly express things in a natural way. The wide range of ways to use it is another one. Not just in the sense of being full stack (metal to meta), but in that Lisper can hack crazy things their way, C-farers can do their thing down low, and anyone with a brain can write a GUI. All by dropping a single EXE in a folder.

Of course, we have our sacred cows, and it's easy enough to hold up our strengths, pointing them out as weaknesses in other languages. It all depends on what you want to do, and what clicks in your brain.

We do need to compare ourselves to other langs, to set some context and manage expecations, but, in many ways, doing so is an exercise in futility. Rather than competing in a feature matrix or micro-benchmark, we need examples of real things we need to write, what they look like in Red, and let others map to their language of choice.

[03:49](#msg590801e5d32c6f2f095cb42b)I do think there are revolutionary things in Red, many from Rebol's design, but Carl and Nenad's deep experience is like that of great writers or musicians. The result comes from them, and their past experience.

[03:51](#msg5908025b6aea30763d5fd0f5)Red would be an easy sell if those who have used Rebol and Red for a long time could just mind meld their experiences and feelings to new users. :^)

[03:53](#msg590802c0f22385553d967d69)So, @AlexanderKoshkarov, what kind of real-world needs do you have? What have you built that you would be curious to see an implementation of in Red? Obviously, we can't tackle huge projects, but it's fun to puzzle out new solutions and ideas.

[03:55](#msg59080337d32c6f2f095cb721)e.g., 7GUIs came up recently, and I've done all but the last task in Red. If you do GUIs, you can compare the different langs they have in the project: https://github.com/greggirwin/7guis/tree/master/Red

michaeldesu

[04:28](#msg59080b048e4b63533d229d12)sorry to interrupt, I have a question about parse and this from the Red site:  
if (expr) : evaluate the Red expression, if false or none, fail and backtrack.

I don't understand how to code the backtrack part. I am doing some string modification based on a validity check, something like this:

```
parse s [
    some [
        to my-rule 
        ahead copy m my-rule 
        if (pass-test m) [ 
            ; m is valid, so do an update that advances the pointer
        ]  ; otherwise skip
    ]
]
```

originally this was fine until I encountered a string that was invalid, and seem to stop everything. I realised I need a skip in the fail case, so I thought to try something like the following (to replace the if test), but it doesn't work since either is not a valid term I think.

```
either (pass-test m) [ 
            ; m is valid, so an update that advances the pointer
        ] [ skip ]
```

can someone show how to code the failure part using the backtrack? Thanks.

dockimbel

[04:41](#msg59080e148e4b63533d22a54e)@michaeldesu `if (pass-test m) |`

michaeldesu

[04:49](#msg59080fc808c00c092ad567aa)thanks, but I'm having some trouble. is it

```
if (pass-test m) | skip [ 
            ; m is valid, so an update that advances the pointer
]
```

or

```
if (pass-test m) [ 
            ; m is valid, so an update that advances the pointer
] | skip
```

as I've tried both, and these don't work it seems

dockimbel

[04:51](#msg5908105c8bb56c2d1100d95c)@michaeldesu You are trying to apply Red `if` syntax in Parse, it's not the same. `if` command in Parse only expects a paren expression, that's all. So: `if (pass-test m) | skip` is enough. The purpose of `if` in Parse is to offer a way to set the success/failure state according to a Red expression rather than a matching rule.

michaeldesu

[04:55](#msg5908114a881b89e101a56860)@dockimbel oh I see - I've misunderstood the use of `if`. Thanks alot. I'll see how I go.

[04:57](#msg590811b88bb56c2d1100deba)so I guess it's like this? `[rule if(pass-test m) ; do the rule if the test passes | ; do the alternative]`

[05:10](#msg590814bc08c00c092ad578e2)ok I understand it now - thanks. Does it matter where the `if` statement appears in the rule? I found in my case, it worked reliably when the `if` statement was placed as the last one in the rule.

dockimbel

[05:19](#msg590816e96aea30763d6013b4)@michaeldesu `if` rule can be used anywhere.

michaeldesu

[05:20](#msg5908171ff22385553d96bf60)thanks

[06:56](#msg59082d9812d2409935b9ea92)@dockimbel well after a fair amount of frustration, the only way I could get it to work was like:

```
parse s [
    some [
        to my-rule 
        ahead copy m my-rule 
        [ if (pass-test m) [  ; do an update ] | skip ]
    ]
]
```

I'm not sure if it's the way you suggested. I guess I misunderstood it before. This is one of the really tricky things about Parse.

dockimbel

[07:42](#msg5908384f6aea30763d609951)@michaeldesu Could you post a real (short) example of what you want to achieve? There is probably a simpler way.

mikeparr

[09:11](#msg59084d3012d2409935ba6e42)Parse and Red literal types. I can get it to recognise most types so far, apart from binary - the case where an explicit base is provided with a #. Any thoughts? Bug, or work-in-progress?

maximvl

[10:02](#msg59085922edf919574a6b8bb4)@AlexanderKoshkarov hi, I know Racket as well, it's quite similar to CL it terms how they both are different from Red :D

michaeldesu

[11:30](#msg59086dd05f3e76601ede9a8c)@dockimbel thanks. I've whittled it done to this working example. The objective is to cut and mask numbers to a set style (cut the overall length to 4 chars fewer than the original number length, but also leave remaining 4 digits visible). This is achieved using `remove` and `insert`. A necessary step is to validate the number (achieved with the `if`) - simplified for example's sake. The rule for skip is needed to avoid getting stuck when we don't want to use the number due to it being invalid. Any easier way is appreciated.

```
digit: charset "0123456789"
check: [10 digit | 12 digit]    ; simplified multi-length values to check (in reality there are more sizes)

is-valid: function [num-str] [
    "simple validation"
    either even? (to-integer (last num-str) - #"0") [true] [false]
]

s: "hi 7766665555 aaa 9876543210 bbb 1234567893 ccc 1122334452 ddd 991122334452 eee"

print ["before:" s]

parse s [
    some [
        to check 
        ahead copy m check 
        (n: (length? m) - 4 fill-count: n - 4)
        [
            if (is-valid m) [
                remove n digit
                fill-count insert "X"
            ] | skip 
        ]
    ]
]

print [" after:" s]
```

gives

```
before: hi 7766665555 aaa 9876543210 bbb 1234567893 ccc 1122334452 ddd 991122334452 eee
 after: hi 7766665555 aaa XX3210 bbb 1234567893 ccc XX4452 ddd XX334452 eee
```

I feel like I've learned a lot about Red just to get this working. I'm grateful for this board's help :-) BTW in learning about `remove` &amp; `insert` I kinda feel those parameters are a bit inconsistent (but this is likely my misunderstanding). Thanks.

gltewalt

[14:33](#msg590898b9d32c6f2f095f382a)Perhaps you could use trim/with or trim in your code in place of remove and fill-count

geekyi

[20:51](#msg5908f14dedf919574a6e8a11)@mikeparr I'm pretty sure something related was posted here somewhere

## Wednesday 3th May, 2017

9214

[03:39](#msg590950faf22385553d9c090d)@AlexanderKoshkarov IDK if this is a good selling point, but check \[this Haskell library for parsing text into structured data](https://github.com/facebookincubator/duckling) and then compare it with build-in Red and Rebol `parse` meta-DSL and rich type system. (Maybe someone from guru tribe will show you some examples, since I'm not that experienced with parsing yet :( ). But this thing in Haskell required Facebook incubator to build it, while in Redbol it could be done by one semi-experienced user for sure.

maximvl

[12:52](#msg5909d271d32c6f2f0964536d)@9214 check this out: https://github.com/facebookincubator/duckling/blob/master/Duckling/Ranking/Classifiers/EN.hs

[12:52](#msg5909d277edf919574a71f936)the guys almost invented `parse`

[12:53](#msg5909d2b308c00c092adcde3c)hm, they generate this file, but where is the source

[12:54](#msg5909d3008fcce56b205e084d)looks like this is it: https://github.com/facebookincubator/duckling/blob/master/Duckling/AmountOfMoney/EN/Rules.hs

geekyi

[13:04](#msg5909d5625f3e76601ee49d42)@9214 @maximvl Somewhat related: https://frinklang.org/#HowFrinkIsDifferent

maximvl

[13:08](#msg5909d640edf919574a7209f7)@geekyi do they have a type system which represents each "type"? I can imaging something like

```
a: 5 meters
b: 5 kilometers
a + b ; => 5005 meters
```

geekyi

[13:11](#msg5909d6f55f3e76601ee4a82c)It's a slightly different take from rebol syntax and datatypes (whitespace is multiplication):

```
5 m + 5 km
5005 m (length)
```

(first line is actual code, second result)

[13:11](#msg5909d7145f3e76601ee4a89a)\[!\[image.png](https://files.gitter.im/red/red/welcome/Nt6C/thumb/image.png)](https://files.gitter.im/red/red/welcome/Nt6C/image.png)

[13:15](#msg5909d7db8e4b63533d2a36a8)

```
frink
24 lightyears -> parsecs
7.3584334508532136155
```

[13:15](#msg5909d8038fcce56b205e204d)`->` works like a conversion operator

[13:21](#msg5909d9615e61bd94342beb98)It's a pretty lightweight system ~ 1 kB + Java. Between frink, redbol and j, they are the most handy tools I use almost daily basis

[13:23](#msg5909d9ef08c00c092add05f4)The \*secret ingredient* is a \[data file](https://frinklang.org/frinkdata/units.txt)

[13:38](#msg5909dd52c1d3b5015444fc02)What \*Duckling* seems to provide in addition seems to be more relaxed rules of parsing; which isn't always an advantage (i.e. ambiguity and verbosity)

[13:39](#msg5909dd7c881b89e101acf544)And the core idea there is having a corpus of examples and generating rules for it, and the rest is automated:  
&gt;To extend Duckling's support for a dimension in a given language, typically 2 files need to be updated:  
\* Duckling/&lt;dimension&gt;/&lt;language&gt;/Rules.hs  
\* Duckling/&lt;dimension&gt;/&lt;language&gt;/Corpus.hs

maximvl

[13:46](#msg5909df20f22385553d9e67d3)we can parse frink's datafile into Red rules :D

geekyi

[14:02](#msg5909e2ff8bb56c2d1108973c)@maximvl yup. The problem is syntax tho. For the particular use case of doing offhand calculations and conversion, frink syntax is almost ideal (whitespace is multiplication)  
I don't know how you would introduce it to red except as a dialect.. except with almost identical syntax  
Alternatively, you have to do `add 5 * m 5 * km` if you want to retain the meaning of whitespace as item seperator in blocks: `[5 * km 4 * m]`

maximvl

[14:03](#msg5909e33af22385553d9e7c0f)@geekyi  
&gt;except as a dialect

well, dialect is the way to go for such thing, why should it be anything else?

geekyi

[14:04](#msg5909e3655f3e76601ee4ee61)@maximvl Yeah, dialect syntax being too different from redbol I mean specifically

maximvl

[14:04](#msg5909e37e5f3e76601ee4eebf)@geekyi but it space is multiplication, what will be the output of this? `5 m km` or `5 * 5 * m` ?

geekyi

[14:05](#msg5909e3c4881b89e101ad1747)You mean in frink?

```
5 m km
5000 m^2 (area)
```

maximvl

[14:06](#msg5909e3d98bb56c2d11089b2b)yep

[14:06](#msg5909e3e88bb56c2d11089b92)ok, I see

[14:07](#msg5909e413f22385553d9e8014)so `5` is `5`, but `5 * m` is `5 m`, right?

geekyi

[14:07](#msg5909e43ef22385553d9e8188)The hierarchy is like this: `Quantity` -&gt; `Unit` -&gt; `UnitPrefix` : `length` -&gt; `m` -&gt; `km`

maximvl

[14:08](#msg5909e444c1d3b50154451f65)but this `5 m` is still an expression, a multiplication, what is the result of it?

geekyi

[14:08](#msg5909e447881b89e101ad19cf)Yes, exactly

[14:09](#msg5909e48ec1d3b501544520f0)Taken together, `5 m` is `5` multiplied by `m` end result which gives you a measure of a quantity of length/distance

[14:10](#msg5909e4b95f3e76601ee4f5e7)It doesn't matter what it actually is, as long as the end result is the same :smile:

maximvl

[14:10](#msg5909e4c95e61bd94342c214b)interesting

geekyi

[14:10](#msg5909e4f0f22385553d9e85b9)In other words, whitespace meaning of multiplication is a bit crucial to remove the verbosity there

maximvl

[14:11](#msg5909e52b08c00c092add3c6b)@geekyi is `5 5` a `25`?

geekyi

[14:12](#msg5909e533edf919574a725cfb)Yep

maximvl

[14:12](#msg5909e55108c00c092add3d26)I'll try to make a dialect on the weekend :D

geekyi

[14:13](#msg5909e57e08c00c092add3deb)If you've got java, or android, I suggest you try it out. ~ 1kb standalone .jar file or android app

9214

[14:13](#msg5909e59712d2409935c15f70)&gt; weekend

that's the whole point!

[14:15](#msg5909e5e75e61bd94342c265c)and frinklang is dated back to... 2001?

geekyi

[14:18](#msg5909e6a7edf919574a72660f)

```
frink
now[] - # 2002-01-03 10:00 AM New York #  -> [years, months, days, min, s]
15, 3, 29, 39, 19.6101544
```

[14:19](#msg5909e6de12d2409935c164b6)Not much to complain about it except the literal handling of dates and intervals

maximvl

[14:20](#msg5909e71b881b89e101ad2aae)well, we have no dates yet :D

geekyi

[14:20](#msg5909e7428fcce56b205e6b8a)@maximvl Rebol does and how it does that is awesome!

greggirwin

[17:10](#msg590a0f148bb56c2d11097d31)I looked at Frink when @geekyi posted about it some time back. It's on my list. :^) I've thought of it more like symbolic programming, as Wolfram is, where we not only need to design the input format, but the internal symbolic structure and engine. It could be really fun, and a great example of how Red is a language construction toolkit, not just for programming, but for sharing and exchanging knowledge.

[17:11](#msg590a0f505e61bd94342d081e)https://www.wolfram.com/data-framework/

[17:19](#msg590a11135f3e76601ee5d8cd)Their Notebooks and CDF are also something we can do. Active documents are an old concept in Rebol, and if you look at their symbolic expressions (https://www.wolfram.com/language/fast-introduction-for-programmers/en/symbolic-expressions/ -- can anyone say "Relative Expression"?) and WSTP, Red is \*the* language to build things like it. As I've said about building an editor in Redbol, the first thing they did for Emacs was create the language to write it in. We already have that.

## Thursday 4th May, 2017

michaeldesu

[03:48](#msg590aa4aa5f3e76601ee80882)is there a way to copy a file within Red?

greggirwin

[04:44](#msg590ab1b55e61bd94342f6ef8)`write/binary` + `read/binary`

michaeldesu

[05:03](#msg590ab62a8fcce56b20619363)ok thanks

[05:50](#msg590ac12d8fcce56b2061b7c0)I have a pretty dumb question about walking a directory collecting files to process - first I'm collecting the files for a dir. so I have

```
>> my-dir: request-dir
== %/C/temp/ms/test/
>> files: read my-dir
== [%test%20numbers1.txt %test%20numbers2.txt %test%20numbers3.txt]
>> foreach f files [print [my-dir f]]
/C/temp/ms/test/ test numbers1.txt
/C/temp/ms/test/ test numbers2.txt
/C/temp/ms/test/ test numbers3.txt
```

I want to get the complete path, so I can read the file properly. I'm used to a simple direct concat. Is this

```
foreach f files [a: clear "" append a my-dir append a f print a]
; which gives:
; /C/temp/ms/test/test numbers1.txt
; /C/temp/ms/test/test numbers2.txt
; /C/temp/ms/test/test numbers3.txt
```

the most elegant solution, or something better?

rebolek

[05:52](#msg590ac19ad32c6f2f09682262)@michaeldesu of course:

```
foreach f files [print my-dir/:f]
```

michaeldesu

[05:54](#msg590ac207f22385553da1f393)@rebolek thanks - that's super compact (wow that's a mind-bender)

rebolek

[05:59](#msg590ac34412d2409935c4e10b)@michaeldesu `my-dir/:f` is a `path!` that gets evaluated and if first element is `file!`, it evaluates to `file!`. Note this:

```
>> my-dir
== %/Users/sony/Documents/
>> file: %some-file
== %some-file
>> my-dir/:file
== %/Users/sony/Documents/some-file
>> my-dir/file
== %/Users/sony/Documents/file
```

michaeldesu

[06:02](#msg590ac3d98e4b63533d2dfcf0)thanks for that - I was just trying to figure it out..

rebolek

[06:02](#msg590ac40b5f3e76601ee871e3)Sorry for the spoiler :smile:

michaeldesu

[06:03](#msg590ac434f22385553da1f956)no - it was welcome, not a spoiler - kinda put me out of my misery :-)

rebolek

[06:05](#msg590ac4bf5f3e76601ee87398):)

michaeldesu

[06:14](#msg590ac6aaedf919574a75e73b)I think the spacing idea is good for this concat method:

```
red>> print ["Area is" area "square units"]
Area is 6 square units
```

but I wonder if there's a mode to make not add the space between items?

x8x

[06:15](#msg590ac6f9c4ac989f3cb93ea3)

```
area: 6 print ["Area is" area "square units"]
Area is 6 square units
  area: 6 print rejoin ["Area is" area "square units"]
Area is6square units
```

michaeldesu

[06:17](#msg590ac783edf919574a75ea22)@x8x - wow, thanks alot

rebolek

[06:19](#msg590ac7d95f3e76601ee88197)It's the difference between passing `string!` and `block!` to `print`. `string!` is printed as is, while `block!` gets some special treatment (`form reduce` basically).

x8x

[06:20](#msg590ac8197b553c707c531437)@rebolek Hey, slowly! I was writing that.. 😠

rebolek

[06:20](#msg590ac8345e61bd94342fb9fa)@x8x sorry, I will get back to work and leave it to you ;)

michaeldesu

[06:21](#msg590ac8595e61bd94342fba89)no, please - multiple viewpoints welcome and greatly appreciated! :-)

x8x

[06:27](#msg590ac9cedddd87f332d407f0)😃 have a look at `? form` `? mold` `? reduce` `? rejoin`

michaeldesu

[06:27](#msg590ac9eec1d3b5015448c958)thanks

[06:29](#msg590aca59881b89e101b0c7c2)I see a similar issue when I try to write a block form concat to `write` - if I write the block by itself I get the unexpected result. I think `form` is good here. Maybe.

rebolek

[06:33](#msg590acb238fcce56b2061dc8c)@michaeldesu you should use `save` in your case, I think.

michaeldesu

[06:41](#msg590acd04f22385553da219ad)hmm, what's the best way to get a natural result in this case:

```
area: 6
write %log.txt ["Area is" area "square units"]
```

i.e. `Area is 6 square units` to appear in the text file

rebolek

[06:41](#msg590acd35edf919574a75fe91)Probably what `print` does:

```
write %log.txt form reduce ["Area is" area "square units"]
```

[06:42](#msg590acd4fc1d3b5015448d6d9)Maybe adding a newline makes sense also.

michaeldesu

[06:42](#msg590acd688e4b63533d2e1fe1)yes, it works thanks - that was unexpected

[06:44](#msg590acdde08c00c092ae0d131)I see how `print ["Area is" area "square units"]` in the REPL gives the unquoted output vs what's really needed:

```
>> print ["Area is" area "square units"]
Area is 6 square units
>> form reduce ["Area is" area "square units"]
== "Area is 6 square units"
```

rebolek

[06:45](#msg590ace134098d96d343567a1)`print` does not print the quotes.

michaeldesu

[06:45](#msg590ace158fcce56b2061e611)thanks again for the lesson @rebolek @x8x you guys should write up some tutorial blog posts ;-)

[06:46](#msg590ace3e8e4b63533d2e22c9)yes, I noticed - it's a learning here thanks

[06:47](#msg590ace8408c00c092ae0d464)it's a different thinking compared to the usual in python :-)

[07:01](#msg590ad1ca8e4b63533d2e3388)in python, I could do a thing like `print('-' * 10)` to emit 10 hyphens - what is the equivalent in Red?

dockimbel

[07:03](#msg590ad24a5f3e76601ee8ab9f)@michaeldesu @greggirwin is currently working on a DSL for that. Right now, you don't have such syntactic sugar, but can use `pad` (`? pad`) or `append/dup` to generate sequences of same pattern.

pekr

[07:03](#msg590ad2555f3e76601ee8abb1)`- * 10`= 10 hyphens? :-)

rebolek

[07:04](#msg590ad270c1d3b5015448ecf4)In Rebol , there is `array`:

```
>> rejoin array/initial 10 #"-"
== "----------"
```

michaeldesu

[07:05](#msg590ad2a5881b89e101b0e6e4)@pekr heh, I think it doesn't work @rebolek thanks again!

rebolek

[07:05](#msg590ad2b212d2409935c51c9a)@michaeldesu but that does not work in Red.

[07:05](#msg590ad2d68e4b63533d2e37d4)`pad`ding empty string is probably shortest code, I guess

```
>> pad/with "" 10 #"-"
== "----------"
```

michaeldesu

[07:07](#msg590ad32b5e61bd94342fe2cd)I see, thanks - it's a solution. I'm so used to putting compact hyphens to break up printed sections of output (with the python equiv.)

toomasv

[07:09](#msg590ad3c1edf919574a7614cc)

```
fill: func [c n][pad/with "" n c]
>> fill #"-" 8
== "--------"
```

michaeldesu

[07:13](#msg590ad49c08c00c092ae0eba9)@toomasv yes, agree - thank you - I was just about to consider

pekr

[07:14](#msg590ad4c5881b89e101b0ed35)@michaeldesu that was not an example of Red, just a smile that multiplying hyphen char by 10 gets you 10 hyphens :-)

michaeldesu

[07:15](#msg590ad5154098d96d34358626)@pekr sorry - you had me giving it a try however, in case I missed something obvious. Yes - it's strange but effective in that lang, and commonly seen

rebolek

[07:17](#msg590ad58b8e4b63533d2e419a)@pekr Actually, you can multiply hyphen too in Red :)

```
>> 10 * #"-"
== 450
```

pekr

[07:21](#msg590ad68e8e4b63533d2e457a)I was looking for a `duplicate`function. Forgot it was part of `append`and other few funcitons ...

michaeldesu

[07:21](#msg590ad696c1d3b5015448fea9)ah yes, I've been caught out with that for converting string to integers

```
>> foreach x "123" [print to-integer x]
49
50
51
; need 
foreach x "123" [print to-integer to-string x] 
; or
foreach x "123" [print to-integer x - #"0"]  ; thanks to Nenad's suggestion from before
1
2
3
```

rebolek

[07:22](#msg590ad6d0c1d3b5015448ffa1)Or

```
>> foreach x "123" [print load form x]
1
2
3
```

michaeldesu

[07:23](#msg590ad6edc1d3b5015448ffec)there's always a better (mind-bending) way ;-) The wizard is casting his (educational) spells again! Thanks again @rebolek

[07:25](#msg590ad778d32c6f2f0968758b)this simpler one also seems to work:

```
>> foreach x "123" [print form x]
1
2
3
```

I have a recollection now, that another may have already mentioned here before

rebolek

[07:26](#msg590ad7a15f3e76601ee8c172)@michaeldesu Actually, this works also:

```
>> foreach x "123" [print x]
1
2
3
```

[07:26](#msg590ad7bbd32c6f2f096876fa)But it depends what type of `x` do you want.

pekr

[07:27](#msg590ad7e0c1d3b50154490629)`parse "123" [any [char: (print copy/part char 1) skip]]`

michaeldesu

[07:27](#msg590ad7e58fcce56b20620c21)yes, in my case before I wanted to convert the string digits to a series containing integer equivalents

rebolek

[07:27](#msg590ad7f612d2409935c5305c)`x` -&gt; `char!`, `form x` -&gt; `string!`, `load form x` -&gt; `integer!`

michaeldesu

[07:29](#msg590ad83fc1d3b501544907d3)@rebolek thanks - it's handy to know

toomasv

[07:33](#msg590ad95fedf919574a762e9c)Also:

```
times: func [n c][pad/with "" n either char? c [c][to-char c]]
times: make op! :times
x: :times
>> 8 times "-"
== "--------"
>> 8 x "-"
== "--------"
```

rebolek

[07:36](#msg590ada1bedf919574a763114)Nice :)

pekr

[07:47](#msg590adc7dd32c6f2f09688943)cool :-)

PeterWAWood

[08:06](#msg590ae0ed4098d96d3435bb43)@toomasv I think you can shorten your times func to

```
times: func [n c][pad/with "" n to char! c]
```

It will be a little quicker too.

toomasv

[08:08](#msg590ae16e8e4b63533d2e6ff2)Thanks, @PeterWAWood! Interesting! How do you comment this? After defining the above function it gets stuck in first values:

```
times: func [n c][pad/with "" n to-char c]
times: make op! :times
>> 8 times "+"
== "++++++++"
>> 8 times "-"
== "++++++++"
>> 8 times " "
== "++++++++"
>> 20 times "-"
== "++++++++------------"
>> 30 times "."
== "++++++++------------.........."
>> 5 times ";"
== "++++++++------------.........."
```

PeterWAWood

[08:10](#msg590ae1da8fcce56b2062390e)You need to copy or clear the string value in the function:

```
times: func [n c][pad/with  copy "" n to char! c]
```

toomasv

[08:11](#msg590ae2194098d96d3435bf8d)@PeterWAWood OK, thanks! So it's:

```
x: times: make op! func [n c][pad/with copy "" n to char! c]
```

9214

[09:01](#msg590aedf84098d96d3435f490)According to ancient ~~docs~~ scrolls, to embark on the Path, apprentice should master the following combat styles:  
\* `copy`-fu  
\* jiu-`bind`su  
\* `block!`kwang-`do`  
\* `parse`kido

dockimbel

[09:24](#msg590af34f12d2409935c5a631)@9214 :+1: ;-)

toomasv

[09:34](#msg590af5a88e4b63533d2ec3d3):) Here's a little `copy`-fu routine for those who come after:

```
fill: func [c n][pad/with clear "" n to-char c]
a: third body-of :fill
>> fill "-" 5
== "-----"
>> a
== "-----"
>> probe :fill
== func [c n][pad/with clear "-----" n to-char c]
>> fill "+" 3
== "+++"
>> a
== "+++"
>> probe :fill
== func [c n][pad/with clear "+++" n to-char c]
```

michaeldesu

[10:35](#msg590b03dec1d3b5015449cc4d)thanks @9214 for the laugh.. should rename "welcome" to "dojo" - it does feel like a path... :-) thanks all for your continue support &amp; tips to the apprentices

JacobGood1

[11:58](#msg590b1751c1d3b501544a1daf)@9214 lol, good stuff

swthornton

[12:45](#msg590b2256881b89e101b25136)Why we use Red, hilarious example of doing a to-do app. So many layers 😊 ://hackernoon.com/how-to-build-a-todo-app-using-react-redux-and-webpack-1aa99dc2f45c

[12:45](#msg590b226cf22385553da3982d)https://hackernoon.com/how-to-build-a-todo-app-using-react-redux-and-webpack-1aa99dc2f45c

greggirwin

[15:45](#msg590b4c7dd346fab721badba8)Def and Dupe Demo: https://gist.github.com/greggirwin/75ec0e46b4babad9077b23a57916eeec

I have `array` as well, but will let people make their own as a learning exercise.

[15:50](#msg590b4daac93941e153c94b8e)@toomasv, I have a different `fill` experiment in the `format` work I'm doing, which may also apply to what @michaeldesu says he does with filling between things in some cases.

[15:50](#msg590b4dd44d51a79e643c1621)

```
fill: function [
		"Fill part of a template string with a formed value"
		str [any-string!] "Template string"
		align [word!] "[left center right]"
		val "(formed) Value to insert in template string"
		;/trunc "Truncate val if longer than str" ;?? make ellipsis last char if truncated?
	][
		str: copy str							; Don't modify template string
		if not any-string? val [val: form val]	; Prep the value
		diff: (length? str) - (length? val)		; Find the length difference between them
		if not positive? diff [return val]		; Never truncate the formed value
		pos: switch/default align [
			left   [1]
			center [add 1 to integer! divide diff 2]
			right  [add 1 diff]
		][1]
		head change at str pos val
	]
	e.g. [
		template: "+________+"
		fill template 'left   ""
		fill template 'right  ""
		fill template 'center ""
		fill template 'left   "abc"
		fill template 'right  "abc"
		fill template 'center "abc"
		fill template 'left   "abcd"
		fill template 'right  "abcd"
		fill template 'center "abcd"
		fill template 'left   "abcdefghi"
		fill template 'right  "abcdefghi"
		fill template 'center "abcdefghi"
		fill template 'left   "abcdefghij"
		fill template 'right  "abcdefghij"
		fill template 'center "abcdefghij"
		fill template 'left   "abcdefghijk"
		fill template 'right  "abcdefghijk"
		fill template 'center "abcdefghijk"
	]
```

[16:14](#msg590b534c594c95a5642e9389)@swthornton, wow. Indeed.

dander

[16:23](#msg590b559110a6a16673e1463d)@greggirwin Does your format function do padding? Like with spaces (to line up columns) or leading zeros. If it had the ability to specify the padding character, that could support that case as well

greggirwin

[16:27](#msg590b568863a9bc902848ea89)It will, yes.

AlexanderKoshkarov

[16:45](#msg590b5a96594c95a5642eba2f)@9214 well, I have never heard of this duckling library in Haskell, but I familiar with monadic parsers in haskell (like parsec), combining it with Haskell datatypes, I cannot imagine what can beat it in convenience (maybe not in speed)

[16:45](#msg590b5abbc93941e153c99a66)I will definatly check red's parser anyway

[16:57](#msg590b5d7ebedc54b621c9cd58)@greggirwin , heh, I am not coding for money, and I am not even in computer science major (I am theoretical physicst). I used python/C before, but then I descovered Haskell, and it was the best thing I ever tried :) so after that, I become interested in computer languages just to see what is out there. Currently, I am learning lisp (racket) and It's selling point for me is homoiconicity, but I have not saw anything else new to me yet (I am optimistic). For my work, I use Julia or C or Fortran because there is nothing better for scintific computing yet. So I woild definatly check out the Red, but I would mostly look into language design not in good staff people want (cross compilation, good windows support, GUI). I work exclusively in Linux and a little gui is possible.

greggirwin

[17:05](#msg590b5f71bedc54b621c9d5b6)Making Red usable for science, including data science, will benefit greatly from users like you, who know the domain and your needs.

[17:08](#msg590b5ffb4d51a79e643c7808)Languages like Haskell have huge appeal for people who think in math. :^)

AlexanderKoshkarov

[17:11](#msg590b60d0d346fab721bb507b)well, for data science I think it would be difficult to beat julia. It is like matlab done right =) + whole community is focused on numerical computing. All lagnuage is designed to be good at it... So I doubt that I will switch my numerical staff needs. But I would check out Red just to see the ideas of the language. Maybe I will be a fan. (Currently haskell is my favourite)

geekyi

[17:13](#msg590b6142d346fab721bb520f)Agree about Julia. Still.. it takes quite a lot of space in my HD, and I'm not sure why..

AlexanderKoshkarov

[17:14](#msg590b6190e66ccf474deed35f)I do not know if I think in math... and I defiantly do not know how other people think, but haskell is not as difficult as it is advertised, it is just different =) From what I heard so far Red is also different =)

[17:15](#msg590b61b210a6a16673e1839b)" it takes quite a lot of space in my HD" ?

geekyi

[17:16](#msg590b6209734cd4454d1d056a)@AlexanderKoshkarov My `.julia` file. Must be the dependencies installed

AlexanderKoshkarov

[17:19](#msg590b628c734cd4454d1d0682)heh, mine is 6GB. A lot of packages use their own version of things, like own version of python... it makes it battery included, but there is a bad taste about it

[17:19](#msg590b62a4e66ccf474deed97d)if whole world would move to something like NixOs, all those problems would be solved ofcourse

geekyi

[17:20](#msg590b62dd63a9bc9028492a4e)Mine is 2GB. And I thought that was large! Indeed.. so Julia comes batteries included with it's own python? XD

[17:20](#msg590b62f84d51a79e643c848f)&gt; if whole world would move to something like NixOs, all those problems would be solved ofcourse

I see we think alike! :D

AlexanderKoshkarov

[17:22](#msg590b636810a6a16673e18cf7)heh) well, Julia does not, but some packages outside of the language are quite free to do what they want

[17:22](#msg590b637263a9bc9028492d6a)for example Plots.jl

[17:23](#msg590b637e63a9bc9028492d9d)can use Conda

[17:23](#msg590b6391e1b61e9328122946)so will use it's own python... to not scare people with a lot of errors ....

greggirwin

[17:27](#msg590b648d4d51a79e643c8b71)I don't want to beat the specialized tools, but complement them.

AlexanderKoshkarov

[17:35](#msg590b6655c93941e153c9d305)well, maybe there is a place to complement Julia in scientific computing, I do not know. Julia also was created with slogon : one language to rule them all :) and some Julia fanboys claim to use Julia for any type of programming , but I also doubt that. Anyway, julia is not so good at beating MPI yet, but they are work on it. If Red can be used on clusters with ~100000 processors, it would be nice replacement for C/Fortran , but this is very very difficult task

[17:35](#msg590b66594d51a79e643c9481)to beat MPI

## Friday 5th May, 2017

gltewalt

[03:44](#msg590bf514631b8e4e61a406ea)

```
>> explode! @geekyi
== [#"@" #"g" #"e" #"e" #"k" #"y" #"i"]
```

[03:44](#msg590bf53b631b8e4e61a4074f)Is there a "code" room?

9214

[05:03](#msg590c07980dcaa48e672cfab2)@gltewalt https://gitter.im/red/red/code this one?

[05:29](#msg590c0dbfac693c532ac13310)

```
Scheme
((if #t + -) 1 2)
=> 3
((if #f + -) 1 2)
=> -1
```

```
>> do reduce [either on ['add]['subtract] 1 2]
== 3
>> do reduce [either off ['add]['subtract] 1 2]
== -1
```

I'm still thinking about `deduce` (`do` + `reduce`) mezzanine.

[05:32](#msg590c0e690a783b6c0a67bc6d)@rebolek but you still need `do` `reduce` combo ;)

rebolek

[05:32](#msg590c0e80c4d73f445a766abf)@9214 you're right, I should not post before first tea ;)

9214

[05:33](#msg590c0e9ac89bb14b5ad0c5c1)since `:add` and `'add` are `any-word!`s, there's little difference IMO

gltewalt

[05:36](#msg590c0f5a0a783b6c0a67bf0a)@9214 gratzi

rebolek

[05:42](#msg590c10d7c89bb14b5ad0cc95)@9214 There is big difference, `:add` returns function directly, `'add` may have different meaning in different context.

9214

[05:44](#msg590c11330dcaa48e672d15b9)but then `:add` will return whatever value is bounded to `add` in specific context, no?

rebolek

[05:45](#msg590c1169c89bb14b5ad0cdcc)

```
>> c: context [add: 1]
== make object! [
    add: 1
]
>> get in c 'add
== 1
>> get in c :add
*** Script Error: in does not allow action! for its word argument
*** Where: in
```

9214

[05:46](#msg590c11b65c89dc5361797195)I don't get this error message :confused:

[05:48](#msg590c1222c89bb14b5ad0cfd7)ah, `:add` will be evaluated before `in`?

rebolek

[05:50](#msg590c12a7c89bb14b5ad0d241)Yes

michaeldesu

[07:12](#msg590c25f29d90dc7a1c4a140b)@AlexanderKoshkarov I have a very similar background to you. I've never used Julia. I'm using python for its extensive libs for Excel and data processing, and lately this is my bread and butter activity. So far I like what I see with Red, and the community here is fantastic. I encourage you to try out Red (I think less brackets than Racket :smile: ).

9214

[07:18](#msg590c2752c4d73f445a76c618)The major advantage is that in Lisps you type `(` and `)` by pressing `Shift + 9` and `Shift + 0` with your poor little pinkie, while in Redbol it's just `[` and `]`. Language was designed with care about user's fingertips. :point\_up: :point\_up\_2:

[07:21](#msg590c280e631b8e4e61a4b67c)I think Paul Graham said something like that about `lisp-naming-notation` versus `snake_case_naming`, since `_` = `Shift + -`.

michaeldesu

[07:21](#msg590c28179d90dc7a1c4a1c98)@9214 yeah I had realised that also - I think little things like that (and also no semi-colons at end) I think really make a nice difference

[07:25](#msg590c29060a783b6c0a682521)for a MS-DOS app, is there anyway to pass command-line parameters into the program?

9214

[07:26](#msg590c29320dcaa48e672d6bf2)@michaeldesu `system/script/args`?

michaeldesu

[07:27](#msg590c295fc4d73f445a76ceab)thanks, I'll check it out

[07:29](#msg590c29bc2b926f8a6723d83b)also another dumb question, earlier I talked about collecting a bunch of files from a dir:

```
>> my-dir: request-dir
>> files: read my-dir
```

how to do a recursive view to collect files in various sub-dirs?

9214

[07:29](#msg590c29bdc4d73f445a76cf7f)* `system/options/script` refers to the script name (string! or none!).  
\* `system/options/args` refers to a list of tokenized arguments (block! or none!).  
\* `system/script/args` refers to the original command-line (string! or none!).

michaeldesu

[07:29](#msg590c29da0a783b6c0a68283f)@9214 ok that's great - thanks alot

rebolek

[07:29](#msg590c29f2e2285d3b162d58d7)@michaeldesu How do you want to collect them? Structured tree, flat block, with/without path...?

michaeldesu

[07:30](#msg590c2a0d33e9ee771c76e406)probably a flat block with path, so I can do a foreach loop through each file

9214

[07:34](#msg590c2afeac693c532ac19ce4)list all files in all subdirectories?

rebolek

[07:34](#msg590c2b0d33e9ee771c76e98d)@michaeldesu Try something like:

```
get-files: function [path /inner] [
    out: [] 
    unless inner [out: copy []] 
    foreach file read path [
        either dir? file [get-files/inner path/:file][append out path/:file]
    ]
]
```

pekr

[07:38](#msg590c2beb0dcaa48e672d77db)Well, well, as for the keyboard layout effectivity, that all counts for an english keyboard layout only? For me, in order to get special chars like braces, curly braces or square braces, require special keypress too. In Czech layout for e.g., it is an Alt Gr key, plus specific key. On my keyboard from Logitech, it does not even have those alternative chars displayed, so I just need to know, that AltGr + F = `[` ... not much convenient ....

iArnold

[07:40](#msg590c2c8bac693c532ac1a50a)In the days of WordPerfect, everybody had a little paper with the combinations for the 12 function keys stuck on the keyboard.

9214

[07:42](#msg590c2cee631b8e4e61a4cb9b)smells like Emacs :alien:

michaeldesu

[08:04](#msg590c3218d1a7716a0a954284)thanks @rebolek

[08:11](#msg590c339b0a783b6c0a685346)@pekr maybe there's a utility you can get to map the keystrokes more conveniently for you?

pekr

[08:17](#msg590c35099d90dc7a1c4a5354)The utility is Alt + Shift, which changes to English layout, which many programmers even in CZ use anyway :-)

toomasv

[08:31](#msg590c38610dcaa48e672daeb7):point\_up: \[May 4, 2017 6:50 PM](https://gitter.im/red/red/welcome?at=590b4daac93941e153c94b8e) @greggirwin That's a nice `fill`. Thanks for sharing! What do you think of this:

```
to-spec: func [words values][
	out: clear []
	repeat i length? words [
		append out reduce [
			to-set-word pick words i 
			either v: pick values i [v][""]
		]
	]
]
to-columns: func [source [block!] cols template /start s /end e][
	set [s e] reduce [any [s ""] any [e ""]]
	print s
	foreach (cols) source [
		bind template object to-spec cols reduce cols
		print template
	]
	print e
]
```

This can be used with `pad` or with your `fill`. Here are some examples of usage:

```
do %fill.red
x: times: make op! func [n c][pad/with copy "" n to char! c]

src: [123 342 5643 115 49837 324 2 99 3567 878589 9659 959 9589589 95 89589 959 59 95 895 95895 959 94564 242 66]
to-columns/start src [a b c d][
;	pad/left form a 10 pad/left form b 10 pad/left form c 10 pad/left form d 10
	fill "|         " 'right a
	fill "|         " 'right b
	fill "|         " 'right c
	fill "|         " 'right d #"|"
] 	rejoin [
	fill "|__________" 'center "Col1" 
	fill "|__________" 'center "Col2" 
	fill "|__________" 'center "Col3" 
	fill "|__________|" 'center "Col4"
]
src: ["111" 111 [32 451] "nice!" url! %some/file #(a: map) 'word]
to-columns/start src [a] [fill "|____________|" 'center a] rejoin [" " 12 x "_"]
to-columns src [a] [pad/left mold a 10]

; These are used together
to-columns/end ["value" "type?"] [a b] [pad/left a 10 pad/left b 10] 21 x #"_"
to-columns src [a] [pad/left form a 10 pad/left to-string type?/word a 10]
```

9214

[08:35](#msg590c3945c4d73f445a770c72)@rebolek it seems that your `get-files` function doesn't work :confused: and I have no idea how to manage this task without blowing up the stack with recursive calls.

rebolek

[08:38](#msg590c3a070a783b6c0a686f80)@9214 What does it do? There is missing `out` in the end, btw.

9214

[08:40](#msg590c3a6d631b8e4e61a50bef)it lists only files in a directory (without subdirectories)

rebolek

[08:50](#msg590c3cdde2285d3b162dacfa)Hm, I thought it could work, but not tested it very much. Let me come up with something better.

9214

[09:02](#msg590c3fa50dcaa48e672dca76)too bad there's no TCO yet :(

michaeldesu

[10:58](#msg590c5ac0c4d73f445a77a137)@rebolek @toomasv @PeterWAWood @greggirwin thanks alot for showing some good tips, re: "-" * 10 method

[11:01](#msg590c5b83e2285d3b162e2c08)is `to char!` equiv to `to-char`?

toomasv

[11:05](#msg590c5c722b926f8a6724b970):point\_up: \[May 5, 2017 11:31 AM](https://gitter.im/red/red/welcome?at=590c38610dcaa48e672daeb7) If we add to this following functions, then we can do down-&gt;across column printing also:

```
map: func [series [series!] fn [any-function! /local out]][
	out: make type? series []
	foreach i series [append out fn i]
]
to-blocks: func [blk num /local out l n b][
	out: clear []
	l: length? blk
	n: either 0 = (l % num) [l / num][l / num + 1]
	b: copy blk
	repeat i num [append/only out take/part b n]
	out
]
combine: func [blocks /local out num][
	out: clear []
	num: length? first blocks
	repeat i num [foreach b blocks [append out pick b i]]
	out
]
>> to-columns combine to-blocks ['a 'b 'c 'd 'e 'f 'g 'h 'i 'j 'k 'l] 3 cols: [c1 c2 c3] map cols func [c][return compose [pad/left form (c) 5]]

    a     e     i
    b     f     j
    c     g     k
    d     h     l
```

9214

[11:08](#msg590c5d369d90dc7a1c4af83b)@michaeldesu yes, it's just a shortcut

michaeldesu

[11:23](#msg590c60c4631b8e4e61a5ae8e)BTW today on windows 7 when using request-dir, the dialog only showed local fixed drives, and not mapped drive letters (though there were plenty on my machine) I wonder if this has been seen by others, and if not, perhaps I should raise an issue (have screenshot)

meijeru

[12:38](#msg590c72550a783b6c0a696993)@michaeldesu The equivalent shortcuts exist as built-in functions for all types.

michaeldesu

[13:00](#msg590c777c2b926f8a67253f13)thanks - btw I lodged an issue about the above.

[13:01](#msg590c77bc33e9ee771c7835f5)I noticed with windows, a DLL is present and needed - I think I read somewhere there is a future plan to allow building a self-contained exe - is it a 1.0 feature plan?

rebolek

[13:03](#msg590c782433e9ee771c78376f)@michaeldesu what DLL? You can build self-contained Red exe.

[13:04](#msg590c78612b926f8a67254395)&gt;&gt; 7.Want to generate a compiled executable from that program with no dependencies?  
&gt;&gt;  
&gt;&gt; $ red -r hello.red  
&gt;&gt; $ ./hello

[13:05](#msg590c7888e2285d3b162eb0b0)Source: https://github.com/red/red/

michaeldesu

[13:05](#msg590c78ab0dcaa48e672ecaba)good news. I thought the libRedRT.dll was needed to accompany the exe

[13:06](#msg590c78b8d1a7716a0a96779e)thanks alot @rebolek

rebolek

[13:07](#msg590c7907c4d73f445a782de7)@michaeldesu libRed is recent addition to speed-up compilation. Before O.6.2 it was possible to compile self-contained exe \*\*only\*\*. :)

PeterWAWood

[13:18](#msg590c7b9be2285d3b162ebe5d)If you compile with the

```
-r
```

(release option) you will get a self-contained executable.

michaeldesu

[13:20](#msg590c7c0333e9ee771c784780)thanks, sorry I should have read the doc - maybe it's good to put that info in the \[getting started](http://www.red-lang.org/p/getting-started.html) page

toomasv

[14:10](#msg590c87ec0a783b6c0a69d102):point\_up: \[May 4, 2017 6:50 PM](https://gitter.im/red/red/welcome?at=590b4daac93941e153c94b8e) @greggirwin I tried to add `justify` to your alignments menue:

```
justify [
			num: length? split copy val " " 
			unless num < 2 [
				len: length? replace/all copy val " " "" 
				diff2: (length? str) - len
				splen: diff2 / (num - 1)
				remains: diff2 % (num - 1)
				replace/all val " " splen x " "
				if 0 <> remains [parse val [remains [thru some " " insert " "]]]
			]
			1
		]
```

And this is how it came out:

```
>> fill 150 x "-" 'justify ""
== {------------------------------------------------------------------------------------------------------------------------------------------------------}
>> fill 150 x " " 'justify "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
== {Lorem   ipsum   dolor   sit   amet,   consectetur   adipiscing   elit,   sed   do  eiusmod  tempor  incididunt  ut  labore  et  dolore  magna  aliqua.}
```

Oh, I used also this snippet there `x: make op! func [n c][pad/with copy "" n to char! c]`

[16:55](#msg590cae8d33e9ee771c793966)@greggirwin Ok, now it uses the template to fill the spaces:

```
x: make op! func [n c][pad/with copy "" n to char! c]
fill: function [
	"Fill part of a template string with a formed value"
	str [any-string!] "Template string"
	align [word!] "[left center right justify]"
	val "(formed) Value to insert in template string"
	;/trunc "Truncate val if longer than str" ;?? make ellipsis last char if truncated?
][
	str: copy str                             ; Don't modify template string
	if not any-string? val [val: form val]    ; Prep the value
	diff: (length? str) - (length? val)       ; Find the length difference between them
	if not positive? diff [return val]        ; Never truncate the formed value
	pos: switch/default align [
		left   [1]
		center [add 1 to integer! divide diff 2]
		right  [add 1 diff]
		justify [
			num: length? split copy val " "                    ; Number of words
			unless num < 2 [                                   ; Unless too few word
				len: length? replace/all copy val " " ""       ; Length without spaces
				diff2: (length? str) - len                     ; Difference of template and spaceless string
				splen: diff2 / (num - 1)                       ; Length of would-be spaces
				remains: diff2 % (num - 1)                     ; Additional spaces to distribute
				replace/all val " " splen x " ";pad/with copy "" splen #" "     ; Replace single spaces to longer ones
				if 0 <> remains [parse val [remains [thru some " " insert " "]]]  ; Distribute additional spaces
			]
			1
		]
	][1]
	either align = 'justify [             ; Some special treatment
		w: charset [not " "]              ; Non-spaces
		parse val [some [to w s: copy word to [" " | end] (head change at str index? s word)]]     ;  Transfer words to template
		str                               ; Return template
	][
		head change at str pos val
	]
]
>> sentence: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
== {Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.}
>> fill 150 x "_" 'justify sentence
== {Lorem___ipsum___dolor___sit___amet,___consectetur___adipiscing___elit,___sed___do__eiusmod__tempor__incididunt__ut__labore__et__dolore__magna__aliqua.}
```

[17:16](#msg590cb36f0dcaa48e672fee7d)

```
lines: ["_" "_|_|_" "_|_____|_" "|_________|"]
	foreach l lines [print fill "           " 'center l]
     _     
   _|_|_   
 _|_____|_ 
|_________|
```

pekr

[17:30](#msg590cb6a72b926f8a67266be2)Those functions should at least end up in some code repo. Might be handy for some devs ...

[17:31](#msg590cb6f633e9ee771c795e6c)I wonder if anything like red-lang.org is planned for the community scripts, which are not eventually a representative showcase to be included in the Github's red/code?

greggirwin

[17:36](#msg590cb81e631b8e4e61a74da0)@toomasv, wow, thanks! I'm going to steal...er...\*note* all this for upcoming work on `format`. The Hanoi tower is very fun. :^)

[17:36](#msg590cb836c89bb14b5ad3c393)@pekr, I'm sure there will be an official location for sharing resources.

toomasv

[18:16](#msg590cc198ac693c532ac436e0)@michaeldesu @rebolek @9214 This does work for me:

```
get-files: function [path /inner] [
    path: normalize-dir path       ; Convert to absolute path
    out: [] 
    unless inner [out: copy []] 
    foreach file (read path) [
        either dir? file [get-files/inner path/:file][append out path/:file]
    ]
]
foreach f get-files %. [print f]
```

iArnold

[19:12](#msg590cce91d1a7716a0a981789)&gt; I wonder if anything like red-lang.org is planned for the community scripts, which are not eventually a representative showcase to be included in the Github's red/code?

&gt; @pekr, I'm sure there will be an official location for sharing resources.

So for the time being the scripts that you think are nice to keep around but you do not believe to have the needed quality for official showcase can be collected at https://github.com/freered/Code

## Saturday 6th May, 2017

michaeldesu

[00:40](#msg590d1b8a33e9ee771c7ad631)@toomasv thanks so much - works well

dockimbel

[05:09](#msg590d5a892b926f8a6728a3b5)@toomasv Very cool Hanoi construction. ;-) Be careful with `out: []` as it points to the same block on each call. You might want to change it to`out: copy []`.

[05:23](#msg590d5ddc33e9ee771c7b8445)Oh, I see you have `/inner` option for that.

PeterWAWood

[05:38](#msg590d613fc89bb14b5ad5fff9) Is it sensible to use clear instead of copy until there is a garbage collector?

toomasv

[06:32](#msg590d6df52b926f8a6728dbd0):point\_up: \[May 5, 2017 11:31 AM](https://gitter.im/red/red/welcome?at=590c38610dcaa48e672daeb7) `bind` in `to-columns` may be an overkill. It is enough to `print compose template`, but then template must inlude column names in parens:

```
to-columns: func [source [block!] cols template /start s /end e][
    set [s e] reduce [any [s ""] any [e ""]]
    print s
    foreach (cols) source [
        ;bind template object to-spec cols reduce cols
        print compose template
    ]
    print e
]
contents: [0 "Red apprenticeship" 1 1 "There is no spoon" 2 2 "Some `copy`-fu drills" 3 2 "`parse`kido exercises" 4 2 "First steps in tai-`reduce`" 5 1 "There be wizards" 7 2 "`system`-do" 8]
to-columns contents [level title page][(level * 4) x " " fill (50 - (level * 4)) x "." 'left (title) pad (form page) 3]
 Red apprenticeship................................ 1  
     There is no spoon............................. 2  
         Some `copy`-fu drills..................... 3  
         `parse`kido exercises..................... 4  
         First steps in tai-`reduce`............... 5  
     There be wizards.............................. 7  
         `system`-do............................... 8
```

greggirwin

[06:35](#msg590d6ec2c4d73f445a7bd198)Nice.

[06:38](#msg590d6f6e0a783b6c0a6d2f9c)@toomasv, I have some `help` work at the top of my list, but I've grabbed your format-related posts here for when I get back on `format`.

toomasv

[06:39](#msg590d6f8b0dcaa48e67325d01)@greggirwin Cool! :)

geekyi

[19:23](#msg590e22c80a783b6c0a6fb787)@toomasv @9214 what about \*reduce, do, load* magic? Meta programming without parse.. Too advanced?

## Sunday 7th May, 2017

toomasv

[20:22](#msg590f8216631b8e4e61b0ea22):point\_up: \[May 5, 2017 9:16 PM](https://gitter.im/red/red/welcome?at=590cc198ac693c532ac436e0) An alternative solution: \[A directory tree](https://gist.github.com/toomasv/f2bcf320800ca340379457c1c4036338):

```
>> dir-tree %./ ; While in red-master
%red-master/
├─%.appveyor.yml
├─%.editorconfig
├─%.travis.yml
├─%boot.red
├─%bridges/
│ ├─%android/
│ │ ├─%build.r
│ │ ├─%dex/
│ │ │ └─%classes.dex
│ │ ├─%samples/
│ │ │ └─%eval/
│ │ │   ├─%AndroidManifest.xml
│ │ │   ├─%eval.red
│ │ │   └─%res/
│ │ │     ├─%drawable-hdpi/
│ │ │     │ └─%ic_launcher.png
│ │ │     ├─%drawable-mdpi/
│ │ │     │ └─%ic_launcher.png
│ │ │     ├─%drawable-xhdpi/
│ │ │     │ └─%ic_launcher.png
│ │ │     ├─%drawable-xxhdpi/
│ │ │     │ └─%ic_launcher.png
│ │ │     ├─%values/
│ │ │     │ ├─%dimens.xml
│ │ │     │ ├─%strings.xml
│ │ │     │ └─%styles.xml
│ │ │     ├─%values-sw600dp/
│ │ │     │ └─%dimens.xml
│ │ │     └─%values-sw720dp-land/
│ │ │       └─%dimens.xml
│ │ └─%src/
│ │   ├─%org/
│ │   │ └─%redlang/
│ │   │   └─%eval/
│ │   │     ├─%ClickEvent.java
│ │   │     ├─%LongClickEvent.java
│ │   │     ├─%MainActivity.java
│ │   │     └─%TouchEvent.java
│ │   └─%redroid/
│ │     ├─%ClickEvent.java
│ │     ├─%LongClickEvent.java
│ │     ├─%MainActivity.java
│ │     └─%TouchEvent.java
...
```

michaeldesu

[23:58](#msg590fb4b60dcaa48e673a306d)@toomasv wow, looks great - thanks alot

## Monday 8th May, 2017

dockimbel

[01:32](#msg590fcab2c89bb14b5ade32fd)@toomasv Your ascii-fu is great! ;-)

x8x

[02:54](#msg590fddcdefe561b154b96623)Alternative `tree` func using an improved `ls` func. Work in progress!! Functionality is good, doc strings are not 😬. https://gist.github.com/x8x/dfb530a2c86bc9599c5f46fa0e056823

toomasv

[03:36](#msg590fe7d233e9ee771c844692)@michaeldesu @dockimbel :)

greggirwin

[03:42](#msg590fe9270a783b6c0a75b61f)@toomasv and @x8x, both very nice. I have some reading to do.

toomasv

[06:53](#msg591015d833e9ee771c84e3a9)@x8x It's very nice work!

WayneCui

[12:13](#msg591060f733e9ee771c862731)Wrote a simple sbn compiler: https://github.com/WayneCui/re-scripts/blob/master/sbn.red ;-P

gltewalt

[14:11](#msg59107c84c4d73f445a868a82)Three months in, and the JS version is still easier to read for me :worried:

greggirwin

[14:57](#msg591087522b926f8a6733de37)Cool Wayne! Greg, why do you think that is?

gltewalt

[18:02](#msg5910b2a68a05641b116101df)I don't know - maybe because I spent years looking at JS off and on?

[18:06](#msg5910b3a3631b8e4e61b5b8e2)Could be the modern style of more visual line breaks. Minified JS that I see behind some browser info is unreadable to me - so not always the case that it's easier to read

x8x

[19:44](#msg5910ca954746d29d249a030c)@toomasv @greggirwin Thanks! 🤓 Tom, we both get to the same result! Btw, I just printed your red-type-hierarchy https://github.com/toomasv/red-type-hierarchy/raw/master/Red%20type%20hierarchy2.pdf , very neat, will help in improving my allowed types in function definitions! 👍🏼

[19:57](#msg5910cdc44746d29d249a034c)@toomasv There has been some changes lately about `any-word!` and introduction of new `all-word!` see here :point\_up: \[April 28, 2017 6:07 AM](https://gitter.im/red/red?at=590279b08bb56c2d11ed4477) (should point to red/red room)

greggirwin

[20:09](#msg5910d0862b926f8a6735585b)@x8x, good reminder. @dockimbel, have you had any further thoughts on the `all-word/ext-word/???-word` names?

## Tuesday 9th May, 2017

dockimbel

[03:15](#msg5911346c2b926f8a6736d74b)@greggirwin Nothing more than what we discussed, `ext-word!` is still on the table, you can make a PR to switch the codebase to it if you have time.

greggirwin

[03:19](#msg5911354b9d90dc7a1c5d041c)OK.

toomasv

[06:57](#msg591168408a05641b1163b559)@x8x Thanks for reminder! I updated the \[hierarhy](https://github.com/toomasv/red-type-hierarchy/blob/master/Red%20type%20hierarchy2.pdf). Also added some functionality and comments to my dir-tree (`/expand levels` -- 'all, 0, 1, 2, 3... default 2; `/only` -- to print directories only ; and `/redish` -- to keep Red format, default is plain format).

AlexanderBaggett

[19:01](#msg59121223c89bb14b5ae7c1b8)Are there any code samples available on how to use `call`?

9214

[19:25](#msg591217bfd1a7716a0aac79b9)@AlexanderBaggett `call`

AlexanderBaggett

[19:27](#msg5912182fc4d73f445a8daabe)okay thank you

9214

[19:28](#msg59121874ac693c532ad82a5e)`call/show "ping 8.8.8.8"` for example, but I'm not sure that it's working in Red, try R2 if it didn't

AlexanderBaggett

[19:30](#msg591218d883cb5db07314c57d)is there a string replace? let's say I have a panel in a tab panel named t and I am trying to replace it's text with a new one. What would I do? `t/face/data/1/` I feel silly asking this. In C# this is just simple assignment. But I wonder if a function is required here in Red.

9214

[19:32](#msg5912195883cb5db07314c883)@AlexanderBaggett are we talking about View or simple string manipulation?

```
>> replace "abracadabra" "cada" "-POO-"
== "abra-POO-bra"
```

AlexanderBaggett

[19:36](#msg59121a44c89bb14b5ae7ec16)Not sure which one I need for this case

[19:36](#msg59121a5ad1a7716a0aac8766)if it was view

9214

[19:37](#msg59121a898a05641b116704fb)text in tab should be changed on some action?

AlexanderBaggett

[19:38](#msg59121aadc89bb14b5ae7eea3)could I do `t/face/data/1 : "new text"` and thus change the value of the first tab in the tab panel or does that instead create a word named `t/face/data/1` and assign it the value of "new text" ?

9214

[19:41](#msg59121b82c89bb14b5ae7f451)I think first one should do with `react`, if you want text to change on button click or something

AlexanderBaggett

[19:42](#msg59121b93d1a7716a0aac8d67)oh

[19:42](#msg59121b948a05641b11670b2a)okay

[19:42](#msg59121b97d1a7716a0aac8d74)how do I do that?

9214

[19:42](#msg59121bafac693c532ad83a95)let's find out :)

AlexanderBaggett

[19:43](#msg59121be3ac693c532ad83af3):)

9214

[19:45](#msg59121c760a783b6c0a7f6f88)

```
view [
        sld: slider return
        base 200x200 
            draw  [circle 100x100 5]
            react [face/draw/3: to integer! 100 * sld/data]
    ]
```

in your case it should be `react [t/face/data/1: ]` I guess

AlexanderBaggett

[19:47](#msg59121cb92b926f8a673b11ba)Well short story is I am working on an IDE for Red, long story is, its proving to be quite a challenge with out a background in rebol or lisp.

9214

[19:48](#msg59121cf62b926f8a673b12f8)@AlexanderBaggett oh, that's a tough one, you should start small

AlexanderBaggett

[19:48](#msg59121d0c83cb5db07314da22)well not quite. it almost does what I want so far

9214

[19:49](#msg59121d4033e9ee771c8dda01)https://github.com/ldci/RedEdit

AlexanderBaggett

[19:52](#msg59121e00c89bb14b5ae7ff5e)I played with it before and decided I wanted to write my own.

9214

[20:44](#msg59122a3aac693c532ad87f97)@AlexanderBaggett just tinker with small toy-prototypes and gradually build upon it, Red has lots of things to learn, I still barely touched VID and View myself

greggirwin

[21:14](#msg5912314d9d90dc7a1c61884a)`help call` may give you more info as well.

I suppose you'll learn a language deeply by writing an IDE for it. Jumping right into the deep end though. :^)

[21:15](#msg5912318c8a05641b116773e3)We'll have a new GUI console coming soon as well.

AlexanderBaggett

[21:19](#msg5912325cd1a7716a0aacfaab)Yeah I saw that on Trello

[21:20](#msg5912329b631b8e4e61bc6e4d)Well, What I could really use is someone who can take a look at my code and show me the correct way to do the things I am trying to do.

[21:21](#msg591232be33e9ee771c8e415a)I managed to convey my intent, but it doesn't actually function in a few areas.

greggirwin

[21:21](#msg591232f65c89dc5361914915)Always tough when we're short of time, which I always seem to be. If you put it in a gist, someone might glance and make comments.

gltewalt

[21:30](#msg59123502ac693c532ad8b02e)@rebolek is a witch doctor. He could probably glance at a gist and give a bunch of suggestions

AlexanderBaggett

[21:32](#msg59123566c4d73f445a8e324e)Ok, well. This is the basic idea. The menu and compiling doesn't work. Could use some help with those.

[21:32](#msg59123567c4d73f445a8e3250)https://gist.github.com/AlexanderBaggett/20ed905f7e77a30dab9cff0add62fa2b

gltewalt

[21:32](#msg59123583c4d73f445a8e32bb)Or those of us who are still learning could poke at it together if the code was up somewhere

[21:33](#msg5912359c83cb5db07315516f)Ahh, didn't see before I messaged (mobile)

AlexanderBaggett

[21:33](#msg591235b9c4d73f445a8e340b)poke it with a good stick please

## Wednesday 10th May, 2017

michaeldesu

[01:06](#msg5912677d5c89dc536192011b)I'm trying:

```
>> s: read/as request-file 'Latin-1
*** Internal Error: reserved for future use (or not yet implemented)
```

have I done something wrong?

greggirwin

[01:06](#msg591267af33e9ee771c8f0615)I believe `/as` will come with full I/O in 0.7.0.

michaeldesu

[01:07](#msg591267d5c89bb14b5ae91469)the reason why I have to do this is, oddly I'm reading a text file that seems to be encoded as windows european but I get `Access Error: invalid UTF-8 encoding: #{A04D6364}` when I do `s: read in-file`

[01:08](#msg591267f39d90dc7a1c6247f6)@greggirwin ok thanks. for now, I'll try to coerce the file into UTF8

greggirwin

[01:09](#msg5912684c5c89dc5361920347)Yeah, I think you'll hit the same thing if you read as binary and use `to string!`, at a glance anyway.

michaeldesu

[01:18](#msg59126a7ac89bb14b5ae91dcd)thanks for the tip, I'll give it a try (for now, rewriting the file to UTF8 solved my problem)

greggirwin

[01:19](#msg59126a928a05641b11683fc4)I don't think it will work, is what I meant.

[01:19](#msg59126a9cd1a7716a0aadc307)Glad you worked around it.

michaeldesu

[01:19](#msg59126aa633e9ee771c8f0f2a)ok, thanks again :smile:

greggirwin

[01:19](#msg59126ab8c4d73f445a8eeb79)@AlexanderBaggett, looking at your code now. Found one problem so far. Bracket in the wrong place in your on-menu func spec.

AlexanderBaggett

[01:32](#msg59126d9d5c89dc5361921720)@greggirwin thank you :)

[01:32](#msg59126db30a783b6c0a80b16a)Does anyone have an example of Red using symbolic programming?

[01:33](#msg59126dffd1a7716a0aadcf25)@greggirwin Can you leave a comment in the Gist?

greggirwin

[01:36](#msg59126e950a783b6c0a80b47a)@AlexanderBaggett , I'll post edited code to you privately, to save space here.

Suggestion #1 is to format your code according to the style guide: https://github.com/red/red/wiki/Coding-Style-Guide  
That will make it a lot easier for others to review.

The `face/parent/parent/pane/...` approach makes it hard to know what faces you're referring to. You should be able to set face references and access them by name.

You shouldn't need to `compose` paths with parens as segments.

Where `call` isn't working--I'm not going to fix that--look at your strings as you `append` to them.

[01:39](#msg59126f3c5c89dc5361921d14)My \*main* suggestion is to break things out and test \*small* pieces. Once you know a piece works, add it to the app. That eliminates all extraneous stuff that could be wrong.

AlexanderBaggett

[02:30](#msg59127b2c9d90dc7a1c628757)I had to do the face/pane approach per Doc's suggestion of how to dynamically add tabs to a tab pane. https://stackoverflow.com/questions/43809351/how-can-you-dynamically-add-a-new-tab-to-a-tab-panel-in-red

[02:35](#msg59127c8b5c89dc5361924735)@greggirwin So you are saying I didn't need compose on the paths?

[02:37](#msg59127ce7631b8e4e61bd8639)I do like the coding style of doing a single command per line.

[02:37](#msg59127ceb8a05641b11687b9b)That makes it much more readable.

greggirwin

[03:13](#msg5912856b9d90dc7a1c62a61c)Correct on paths:

```
>> key: 'xx
== xx
>> blk: [a b xx yy]
== [a b xx yy]
>> blk/(key)
== yy
```

Readability is one of those darn subjective things. Take this line from your original, for example:

```
button 75x25 "Compile" on-click [print "Compiling" write %data.red face/parent/parent/pane/2/text  either face/parent/pane/3/data = "Dev" [print "Dev code path" call append "red-062.exe -c" "data.red"][print "release" call append "red-062.exe -r" "data.red"]]
```

It's \*really* long, and isn't just a single command. There's a lot going on in there.

As Reducers, we do often pack a lot in on a single line, but it's always a balance. As you work on something, refactoring and shrinking it, it's clear to you as the author. When someone else sees it, they don't have the history, or the thought process. They only see the end result. Many's the time I've had to tease apart an experts code to figure out what it's doing.

AlexanderBaggett

[03:20](#msg591287169d90dc7a1c62ae83)Yeah

[03:21](#msg5912872ad1a7716a0aae1f5b)Well I fixed 2 things myself since I have had the version you gave me back

[03:21](#msg5912874ad1a7716a0aae1fc2)Do you know a good way to convert a `string!` to a `file!`?

dockimbel

[03:51](#msg59128e4dd1a7716a0aae37f7)@AlexanderBaggett  
&gt; I had to do the face/pane approach per Doc's suggestion of how to dynamically add tabs to a tab pane. https://stackoverflow.com/questions/43809351/how-can-you-dynamically-add-a-new-tab-to-a-tab-panel-in-red

My answer was specific to your question, which asked for having the same content in different tabs. If there is no such constraint, then a simpler method, like suggested by @greggirwin, is preferable.

AlexanderBaggett

[03:58](#msg59128fdfd1a7716a0aae3d29)Well I do have the constraint of the same thing in each tab.

[03:59](#msg5912902a0a783b6c0a812197)Your answer was very helpful.

michaeldesu

[04:33](#msg591298148a05641b1168d1a6)I'm using parse to update some binary material. I'm wondering how to specify any byte value (so I can skip one byte at a time once I get to the beginning of the search). So far I have `r: [#{00} - #{FF}]` to specify any hex value of 1 byte width. It seems incorrect. What is the correct way?

[05:06](#msg59129fe4d1a7716a0aae73d3)maybe I should give an example. Let's say I want to change the #{33} value below to #{FF}, but I don't want to care what that next hex value is after the initial found case:

```
test: to-binary "123"
== #{313233}
parse test [thru r (print "found") change #{33} #{FF}]
found
== #{3132FF} ; direct case works
test: to-binary "123"  ; reset
>> r: [#{00} - #{ff}]  ; setting up a range for any value of byte width doesn't work
== [#{00} - #{FF}]
>> parse test [thru #{32} (print "found") change r #{FF}]
found
>> test
== #{313233}  ; proof of failure
```

so I want to know how to avoid a hardcoded value for the `change` match. I know something like `r: [#{33} | #{34}]` works to setup several values to search for, so I was hoping for something like `r: [#{00} - #{ff}]`to get a range (for any byte value). Does it make sense?

rebolek

[05:24](#msg5912a41f631b8e4e61be07c2)@gltewalt @AlexanderBaggett sorry, I was sleeping already. But I see @greggirwin was very helpful.

[05:25](#msg5912a43c2b926f8a673d02ef)@AlexanderBaggett  
&gt; Do you know a good way to convert a `string!` to a `file!`?

`to file! string`

michaeldesu

[06:17](#msg5912b06cc89bb14b5aea1394)ok, I've opted to do the dumb solution :-) for my above question - building a range iteratively - but how can I force the binary values to be one byte wide only, rather than 32-bit values?

```
any-byte: clear []
num-ints: 255

; build the range for 'any byte'

while [num-ints >= 0] [
    append any-byte to-binary num-ints
    if num-ints <> 0 [append any-byte [|]] 
    num-ints: num-ints - 1
]

print mold any-byte ; gives [#{000000FF} | #{000000FE} | #{000000FD} | ...  #{00000003} | #{00000002} | #{00000001} | #{00000000}]

test: to-binary "123"

print ["before:" test]

parse test [thru #{32} (print "found") change any-byte #{FF}]

print ["after:" test]; this should be #{3132FF}
```

so how can I convert `[#{000000FF} | #{000000FE} | #{000000FD} | ... #{00000003} | #{00000002} | #{00000001} | #{00000000}]` to be `[#{FF} | #{FE} | #{FD} | ... #{03} | #{02} | #{01} | #{00}]`. I've noticed I can do things like

```
>> test: to-binary 255
== #{000000FF}
>> test/4
== 255
>> to-binary test/4
== #{000000FF}
```

but feel like this is going in circles.

[06:18](#msg5912b0d3c89bb14b5aea14e3)also I have a fundamental question.. as a rank beginner - why does `if` have a conditional expression, and `while` has a condition block! I've just been through some confusion about no-brackets vs brackets for these and getting errors due to that. e.g. `while [num-ints >= 0]` raises an error without the brackets

greggirwin

[06:20](#msg5912b1279d90dc7a1c634366)Something like this?

```
>> test: #{313233}
== #{313233}
>> rng: charset [0 - 255]
== make bitset! #{FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
>> parse test [any [change rng #{FF} | skip]]
== true
>> test
== #{FFFFFF}
>> test: #{313233}
== #{313233}
>> rng: charset "13"
== make bitset! #{00000000000050}
>> parse test [any [change rng #{FF} | skip]]
== true
>> test
== #{FF32FF}
```

michaeldesu

[06:22](#msg5912b18f33e9ee771c8ffa5d)@greggirwin thanks alot - you've saved my sanity - `charset [0 - 255]` threw me here a bit (i.e. a learning) - I thought charset was for characters only, but apparently not

greggirwin

[06:24](#msg5912b219ac693c532ada5c54)On brackets vs no brackets, `if` would have to treat blocks specially, as a block itself is a truthy value. Imagine a word could refer to a block, or to `none`, which you use as the test condition. Now think about how `while` might work if its test was \*not* a block. It has to evaluate it multiple times, with changing values.

[06:24](#msg5912b239c4d73f445a8fdded)You could also do `rng: charset [#"^@" - #"ÿ"]`, but the numbers seemed clearer given your example.

[06:25](#msg5912b26a9d90dc7a1c6348e6)A charset is for chars, hence the name, but the dialect is a bit flexible, to aid expression.

michaeldesu

[06:27](#msg5912b2d85c89dc536193057c)&gt; A charset is for chars, hence the name, but the dialect is a bit flexible, to aid expression.

thanks, that makes sense - I guess `numset` or similar might make more sense (for building a number set like your example), but now it's understood it's ok

9214

[06:37](#msg5912b51d0a783b6c0a81a356)@michaeldesu this trick will do?

```
>> to binary! 42
== #{0000002A}
>> to binary! [42]
== #{2A}
```

michaeldesu

[06:37](#msg5912b53c2b926f8a673d4619)@9214 thanks alot

9214

[06:56](#msg5912b99c631b8e4e61be5be2)

```
Red
>> skip to binary! 42 3
== #{2A}
>> remove-each byte x: to binary! 42 [zero? byte]
>> x
== #{2A}
```

michaeldesu

[06:59](#msg5912ba4d83cb5db073171a0f)@9214 thanks - just for my curiosity about your upper example, why does this fail?

```
>> val: 255
>> to binary! [val]
*** Script Error: cannot MAKE/TO binary! from: val
*** Where: to
```

endo64

[06:59](#msg5912ba6ed1a7716a0aaed68f)`to binary! reduce [val]`

9214

[07:00](#msg5912ba790a783b6c0a81b952)@michaeldesu

```
>> val: 255
== 255
>> to binary! reduce [val]
== #{FF}
```

[07:00](#msg5912ba7ec89bb14b5aea3a97)@endo64 dang! ;)

endo64

[07:00](#msg5912ba845c89dc536193283c):)

michaeldesu

[07:00](#msg5912ba929d90dc7a1c636a41)thanks guys - super quick!

9214

[07:01](#msg5912bac383cb5db073171bd2)@michaeldesu just remember that `block!` is a structured pile of data until you \*explicitly* evaluate it with a function call

michaeldesu

[07:04](#msg5912bb715c89dc5361932bd6)@9214 thanks for your `skip to` examples too - that's kinda what I was looking for before

9214

[07:06](#msg5912bbde9d90dc7a1c636f1c)@michaeldesu you're welcome, I recently done some bitdiddling in Red myself and learned all of this

michaeldesu

[07:06](#msg5912bbfb8a05641b116958d9)greatly appreciated; thanks again to @greggirwin &amp; @endo64

dockimbel

[09:22](#msg5912dbd5d1a7716a0aaf73f1)@michaeldesu Charset ranges can be specified using literal char! values, or their codepoints (so integers).

x8x

[20:23](#msg591376ade4cfd50062a5f575)Any reason why going directly from `integer!` to `tuple!` is not allowed?

```
to-tuple to-binary 1
;   0.0.0.1
  to-tuple 1
*** Script Error: cannot MAKE/TO tuple! from: 1
*** Where: to
  to-tuple to-binary 1.0
;   63.240.0.0.0.0.0.0
  to-tuple 1.0
*** Script Error: cannot MAKE/TO tuple! from: 1.0
*** Where: to
```

rebolek

[20:27](#msg591377c1631b8e4e61c2088c)@x8x What should `to tuple! 1.0` return? Going thru binary gives `63.240.0.0.0.0.0.0`, which makes sense, but should it return save value directly also?

x8x

[20:30](#msg5913787573b39c5f1573d27b)I'm not sure about `float!` as I don't understand it's `binary!` representation, but `integer!` to `tuple!` why not?

rebolek

[20:32](#msg591378d40a783b6c0a856bd2)`binary!` representation is IEEE 754 value (see https://www.h-schmidt.net/FloatConverter/IEEE754.html).

[20:33](#msg591378fe5c89dc536196d40a)`integer!` to `tuple!` - what about values over 255? Should they overflow to next tuple number?

x8x

[20:37](#msg591379feefe561b154b99fb0)well yes like it does when going thru `binary!`:

```
to-tuple to-binary 256
;   0.0.1.0
```

[20:40](#msg59137aad551ea6485ba83615)Thanks for the link, I thought that was more complicate.. 😁

rebolek

[20:44](#msg59137bc683cb5db0731ac5f5)I think the conversion can be supported, when there are sensible rules for it. Doing the same as `to tuple! to binary!` makes sense IMO, let's see what @dockimbel thinks.

x8x

[20:47](#msg59137c5de4cfd50062a5f60a)Ok thanks! Have a good night!

## Thursday 11st May, 2017

greggirwin

[00:05](#msg5913aac99d90dc7a1c67e292)Tricky question. Why would a low int value go in segment 4? Why not 1.0.0 or 0.0.0.0.0.0.0.0.0.0.0.1?

dockimbel

[03:06](#msg5913d51e5c89dc536198293e)A `tuple!` value is a fixed-length sequence of bytes. They are mapping issues arising from a direct conversion from a number. Should `to-tuple 1` return `0.0.1`, or `0.0.0.1`, or even a larger tuple? If you need to manipulate a byte representation of a number, binary! is there for that, and it can be easily converted to tuple! if needed, and size of the resulting tuple! would then match the size of the binary series.

x8x

[08:18](#msg59141e3973b39c5f1573d951)@greggirwin If I'm not wrong, an integer is 32 bits, 4 bytes, so it should fill a size 4 tuple from right to left: 0.0.0.1 , 0.0.0.2 , ... I don't see why it is tricky nor why it should be 0.0.1 or 0.0.0.0.0.0.0.0.0.0.0.1 .

dockimbel

[08:47](#msg591425055c89dc5361995925)@x8x What if you want 3 elements only in your tuple, like for an RGB color, what if you want more... You integer is 32bits, but I don't see use-cases where you would want more a 4-element tuple from your integer rather than 3-element one. What about 64-bit integers in the future, should they always convert to 8-element tuples?

x8x

[08:54](#msg591426ca551ea6485ba83d86)it's just how the conversion should work, 1 integer = 4 bytes = 4-element tuple, about use cases I'm not sure 😉 Also why is tuple limited to max 12-elements ?

rebolek

[08:55](#msg591426f1631b8e4e61c4992f)That's maximum that fits in Red value slot.

x8x

[09:11](#msg59142ad9b88c0f5a0426b785)Thanks, just curious.

[10:00](#msg5914365673b39c5f1573db0c) @qtxie has been so nice to enhance the console, so now we can use colors!! I'm so happy! 😁

```
colors: [black red green yellow blue magenta cyan white]
;https://en.wikipedia.org/wiki/ANSI_escape_code
color: function [s f /bg b /space][
	o: clear {}
	s: form s
	if space [s: rejoin [{ } s { }]]
	if t: find colors f [
		append o join {3} (index? t) - 1
	]
	if all [bg t: find colors b] [
		append o join {;4} (index? t) - 1
	]
	unless empty? o [
		s: rejoin [{^[[} o {m} s {^[[m}]
	]
	s
]

warn: func [n][loop n [print {^[[?5h^[[F} wait .05 print {^[[?5l^[[F} wait .05] exit]

beep: does [warn 3]

blink: func [s /local r][
	insert r: form s {^[[5m}
	unless find/last r {^[[m} [append r {^[[m}]
	r
]

alert: func [s][beep print blink color/bg/space s 'white 'red]

  a: ask color "Name: " 'red
Name: John
;   "John"
```

[10:01](#msg5914367ee4cfd50062a5fe08)\[!\[Screen Shot 2017-05-11 at 16.52.40.png](https://files.gitter.im/red/red/welcome/gy3I/thumb/Screen-Shot-2017-05-11-at-16.52.40.png)](https://files.gitter.im/red/red/welcome/gy3I/Screen-Shot-2017-05-11-at-16.52.40.png)

Oldes

[10:22](#msg59143b8033e9ee771c968fb0)@x8x actually it does not work correctly in Windows yet... and not in gui-console.

[10:23](#msg59143b9b9d90dc7a1c6a07d2)But it is my long lasting wish to have colorful console.

rebolek

[10:23](#msg59143bb8ac693c532ae102fc)Red-console has color support.

[10:24](#msg59143bcc33e9ee771c9690cd)But that's not finished, I know.

Oldes

[10:29](#msg59143cfe0a783b6c0a887217)Not finished and not documented and does just automatic conversion. I would like to have color under control like @x8x above.

rebolek

[10:31](#msg59143d7cd1a7716a0ab573ab)You \*can* have color under control, if you know how. But you're right, there's lack of documentation, so you have to figure it out yourself. I would not recommend it for usage yet, but it is promising thing that will bring colors to all GUI platforms.

[10:31](#msg59143d980a783b6c0a8874f6)And actually more than just colors.

x8x

[10:55](#msg5914430c4746d29d249a3a34)Sorry @Oldes , I'm really noob on Windows, I should have specified that above is for macOS and Linux.

Oldes

[10:57](#msg591443840a783b6c0a888e47)I'm doing my best to have it on Windows too:)

x8x

[10:57](#msg5914438fe4cfd50062a5ff09)@rebolek more than just colors = curses ? 😜😁😜

[11:07](#msg591445f7efe561b154b9a871)@Oldes what do you think about https://github.com/chjj/blessed is that a good reference (despite being 16'000 loc..) if considering to port to red? Or would some binding to ncurses or other be a better go?

pekr

[11:08](#msg59144617631b8e4e61c52b0d)Do you guys remember old console demos? I remember something from Bo, but can't find those scripts anymore ....

x8x

[11:08](#msg59144634e4cfd50062a5ff3d)I did some stuff in nodejs with blessed and it was quite pleasent to work with.

Oldes

[11:10](#msg59144690ac693c532ae12f3a)@x8x curses are part of the Red many years https://github.com/red/red/tree/master/system/library/curses just don't know if still works... for me it is too heavy. I'm fine with simple ansi sequences.

rebolek

[11:10](#msg59144694ac693c532ae12f3f)@pekr you mean TUI - text user interface? AFAIR it was on rebil.org

[11:10](#msg591446a35c89dc536199fa8a)rebol.org

pekr

[11:12](#msg59144726d1a7716a0ab5a034)I remember some christmass tree demo. Btw - are we able to position the cursor in terms of the console?

Oldes

[11:14](#msg591447b192217cca5865f136)not in gui-console... but in nix terminals and CMD you can do: `prin "^[[2J^[[10;10HHELLO"`

[11:15](#msg591447c78a05641b116ff34b)which clears screen and prints HELLO on position 10x10

[11:16](#msg591448152b926f8a674427f6)we are out off topic here imho.

x8x

[11:18](#msg5914486cb88c0f5a0426b9b2)@Oldes which room then?

pekr

[11:23](#msg591449bf92217cca5865f9ab)Well, we were talking console, coloring, so dunno why it should be offtopic ...

[11:24](#msg591449e28a05641b116ffc3a)I already proposed some red/relax for general chit chat ... could be called by some other name as well ...

michaeldesu

[11:40](#msg59144dbb83cb5db0731def78)FWIW, the \[colorama](https://pypi.python.org/pypi/colorama) package for python is a nice reference for console colour, e.g. `print(Fore.YELLOW + Back.GREEN + "hello")`

x8x

[11:52](#msg5914507b551ea6485ba840ab)@pekr I think the relax room is the `red/sandbox`. Anyway it looks to me that all old timer users of Altme are a little lost on choosing the right room here on Gitter. Not sure how to improve that, maybe just replicate the Altme rooms? Sure `announce` and `ann-reply` would be welcome here as well, so many others. The status now is that there is not much difference in what is being discussed between red, welcome, help, sanbox. Not complaining, but it probably means something is not clear or we really need more rooms, stricter rules and some policing.

[11:53](#msg591450a8e4cfd50062a5fff4)@michaeldesu How would you write your example in Red?

[11:57](#msg591451bb4746d29d249a3b1b)@michaeldesu This not good enough? `print [color/bg "hello" 'yellow 'green]` ?

[12:17](#msg5914565973b39c5f1573dd12)@michaeldesu quick example:

```
paint: func [b /local c s][
	print rejoin parse b [
		collect any [
			[c: [word! | path!] s: string! keep (
				either word! = type? c/1 [
					color s/1 c/1
				][
					color/bg s/1 c/1/1 c/1/2
				]
			)]
			| keep string!
		]
	]
]
paint [yellow/green "hello" " " red "Michael"]
```

[12:18](#msg5914569cefe561b154b9a963)\[!\[Screen Shot 2017-05-11 at 19.17.42.png](https://files.gitter.im/red/red/welcome/28EK/thumb/Screen-Shot-2017-05-11-at-19.17.42.png)](https://files.gitter.im/red/red/welcome/28EK/Screen-Shot-2017-05-11-at-19.17.42.png)

michaeldesu

[12:41](#msg59145bedd1a7716a0ab5f928)@x8x sorry about that, I'm a bit lost or not paying enough attention - I didn't realise the capability was there (coming soon to Windows I see). What you've outlined looks good - looking forward to it. Thanks to the contributors!

geekyi

[14:18](#msg591472988a05641b1170bfde)@x8x @pekr I've been thinking about chat, and I've come to the conclusion that the problem is limitation of gitter as a chat client, in that it doesn't have threads. `slack`, `flowdock`, `discord`, etc.. has them. Even stackoverflow has limited support for those.  
But alternatively, based on what gets posted, I have an idea of how the rooms can be arranged topically

[14:55](#msg59147b6000efc2bb3e588bb4)# Rooms suggestions  
Gitter favors rooms based on github repos. We could re-organize code according to

\## Audience based  
1\. Beginners to redbol `welcome`, also could be \*learn\*, \*hello (world)\*, only intro (no large code here, more Q&amp;A, point to docs and SO)  
2\. Re(d)bol users `help`, also could be \*code-help\*, \*code-review* (any question should have at least partially working code here, or snippets. Link to SO code review)  
3\. Redsystem users `red/system`?  
4\. Red-development `red/red` (design vs regressions?)  
5\. Red code snippets, libraries, demos, etc. `mezz`, also could be \*code(-snippets)\*, \*pastebin*  
6\. Language based, e.g. `Chinese`  
?? Red for programmers of X ( we have `lisp`, why not others)? altho, I think we should have paradigms instead of languages: \*functional\*, \*object-oriented\*, \*logic\*, \*ML*

\## Topic based  
1\. +Dialects and parse. `dialecting`  
2\. ++Metaprogramming `lisp` room sometimes has discussions a bit like this  
3\. VID `red-guibranch`?  
4\. +Draw  
5\. +Red concepts `concepts` semantics, syntactically invisible things like \*context\*, theory, etc  
6\. Tests `tests`? currently dedicated to quicktest and tests in red system  
7\. Random `sandbox`  
8\. Bugs.. `bugs` regressions/design vs other ?  
9\. Data types and formats, currently we have lots of these `RIF`, `vector-datatype`, etc  
?? more of these?  
?Programming paradigms? Integrations and ffi, data formats, api, parsers, editors and IDE, math, scientific programming, opencv and visual media

\## Repo based  
1\. Red `red/red`  
2\. Code `red/code`, could be `samples` or `examples` to avoid confusion with a room to  
3\. Red official docs `red/doc` need a separate topical room on other docs, documentation style guides, etc..

Note: `+` is room suggestions  
What I don't know is how to gently enforce rules. Maybe a bot?

greggirwin

[17:16](#msg59149c7700efc2bb3e5937e6)@geekyi, good thoughts though enforcement is always hard. Being able to move messages would help, but I don't think gitter allows that, WRT enforcement. What we \*can* do is :point\_left: :point\_right: and link to them as conversations shift. As topics come up that generate a lot of chat, we can add rooms.

The hard part, for me, is being able to \*see* what rooms are available in the gitter UI. Is the "community" grouping in gitter what we have now, based at a repo?

[17:24](#msg59149e6900efc2bb3e5942a9):point\_up: \[May 11, 2017 2:18 AM](https://gitter.im/red/red/welcome?at=59141e3973b39c5f1573d951) @x8x, as Doc said, what happens when an integer is 64-bits in the future? I don't think the conversion choice is clear in this case. That happens sometimes, so then we have to ask "What is the value?" What is the big win in being able to convert directly from integer to tuple?

x8x

[19:36](#msg5914bd3173b39c5f1573e671)@greggirwin Make sense thx. Didn't know 64 bits int where coming .

## Friday 12nd May, 2017

michaeldesu

[05:49](#msg59154cff9d90dc7a1c6e7c6b)FWIW, I've noticed when reading or writing very large XML files (&gt; 200Mb) with any version of 0.62 on Windows (using plan read or write, usually the latter), I get `Runtime Error 1: access violation` but when I do the same with `/binary` it's ok. With smaller files, it's generally fine without /binary.

AlexanderBaggett

[13:26](#msg5915b8120a783b6c0a8edf59)@x8x is that Color stuff console only or is it going to in `view` as well?

[13:27](#msg5915b83600efc2bb3e5dc577)Also, general question for everyone, when is the version of Red coming out?

[13:33](#msg5915b9909d90dc7a1c705fb7)I don't see the coloring on the trello board for 0.6.3 or 0.6.4

Oldes

[13:40](#msg5915bb3c92217cca586c17e0)The new Red-console should have support for colors, don't know if ansi sequences support.

rebolek

[15:03](#msg5915ceabd1a7716a0abc3255)I think that ANSI sequences are not supported in Red-console (yet).

x8x

[16:46](#msg5915e6cd0de3eb3e19a70716)@AlexanderBaggett the stuff works well in macOS and Linux terminal, not sure about Windows and GUI-Console 😃

## Saturday 13th May, 2017

dsgeyser

[11:52](#msg5916f37433e9ee771ca19a90)Is this statement also true about Redbol development:

There are two "rules of three" in \[software] reuse:

a. It is three times as difficult to build reusable components as single use components, and

b. a reusable component should be tried out in three different applications before it will be sufficiently general to accept into a reuse library.

greggirwin

[14:54](#msg59171e3ad1a7716a0ac149d1)Their relative truth should be comparable, but they are very general and, perhaps, came from an OOP mindset. Bertrand Meyer has an entire book about building reusable software, and tools are different than objects, which are not the same as modules or frameworks or functions.

Really \*good* reusable "components" may be very hard to design and build indeed, but the return on investment is higher as well. We could probably also build a graph of diminishing returns based on the generality of solutions. But if you rotate that graph to see the third dimension, you may see huge spikes of value in specializations.

[14:55](#msg59171e78631b8e4e61d0c271)What is different about Red(bol) is that the components we build may be languages.

xqlab

[15:39](#msg591728cd8a05641b117b640f)It is three times as easy to build single use components in Re(d)bol than in other languages. Therefore I build single use components most of the time.

greggirwin

[15:41](#msg591729168a05641b117b651e)That's a really nice way to say it @xqlab.

[19:35](#msg59176018631b8e4e61d1bbcd)Ah, MeatLoaf.

## Monday 15th May, 2017

iArnold

[11:03](#msg59198b07631b8e4e61d93c28)Right, after over three hours of Eurovision Songcontest that was a welcome distraction. I removed the posts because the links were taking a lot of visual space.

michaeldesu

[12:08](#msg59199a490a783b6c0a9d30c1)@iArnold thanks - I guess there's no size setting for those - they do take up alot of space

pekr

[13:15](#msg5919a9e1d1a7716a0aca6db7)@iArnold You can collapse those visuals, using three dot menu at the right side of the post, but it is available only for a certain amount of time, which I found being a weak point of Gitter ...

geekyi

[15:35](#msg5919caab33e9ee771cac2219)@pekr `/collapse-all` doesn't work for you? On web

## Tuesday 16th May, 2017

sergey6661313

[10:39](#msg591ad6e333e9ee771cb0a24f)android not run my compiled simple hello world reds app... "error: only position independent executables (PIE) are supported."

dockimbel

[11:12](#msg591ade8300efc2bb3e71ac5e)@sergey6661313 Which Android version? Red toolchain currently only supports PIC for shared libraries, not executables.

sergey6661313

[11:28](#msg591ae26cc4d73f445ab0d05a)android 6.0. (homtom HT17Pro). Compiled the command red.exe -t android MyHello.reds

[11:31](#msg591ae317d1a7716a0acfee1e)I started the MyHello in the terminal emulator (termux) because "NativeExe app" crashes without warning. And I got an error (above)

dockimbel

[11:34](#msg591ae3ab0a783b6c0aa3006e)@sergey6661313 The current Android support code was a proof of concept and written for 4.x, so I guess that newer versions now require PIE binaries. We will upgrade our toolchain in the next months as we advance on \[0.6.5](https://trello.com/b/FlQ6pzdB/red-tasks-overview).

sergey6661313

[11:35](#msg591ae3f3d1a7716a0acff304)Good luck

dockimbel

[11:35](#msg591ae3f62b926f8a675e6e20)@sergey6661313 You can try cross-compiling using the extra `--config [PIC?: yes]` option, though it probably will not be enough for full PIE support.

sergey6661313

[11:40](#msg591ae52bf3001cd342284c0a)did not work. It would be nice to add possible configs to the wiki.

dockimbel

[11:41](#msg591ae567d1a7716a0acff9fb)Just look \[here](https://github.com/red/red/blob/master/system/config.r) for possible config options.

sergey6661313

[11:51](#msg591ae7cc00efc2bb3e71d62a)I probably do not enter the command correctly.  
How to enter correctly?

G:\\redlang&gt;red.exe -t android --config \[PIC?: yes] MyHello.reds  
Cannot access source file: G:\\redlang\\yes]

dockimbel

[14:41](#msg591b0f9583cb5db07338c56e)@sergey6661313 Put `--config` option first, before `-t`.

sergey6661313

[14:53](#msg591b12800a783b6c0aa4037c)The same error, but now he writes it not in the console cmd, but in the console Red.

[14:54](#msg591b128983cb5db07338d60c)\*\** Error: cannot access argument file

dockimbel

[14:55](#msg591b12dad1a7716a0ad10267)Then, you should better wait until we upgrade Android support in 0.6.5.

ZenoArrow

[18:12](#msg591b41212b926f8a67605aca)@sergey6661313 Can you post your current build command? I'd like to see if I can help.

sergey6661313

[19:01](#msg591b4c95f3001cd3422a68c0)red.exe --config \[PIC?: yes] -t android MyHello.reds

maximvl

[19:03](#msg591b4cf333e9ee771cb31df6)is android platform already supported?

[19:03](#msg591b4d0e0a783b6c0aa53366)I see

sergey6661313

[19:05](#msg591b4d77f3001cd3422a6c88)not, but news December 26, 2011 ARM support released. binary files before was supported...

ZenoArrow

[22:31](#msg591b7dd2631b8e4e61e24412)@sergey6661313 The following worked for me: C:\\ProgramData\\Red\\0.6.2\\red-062.exe --config \[PIC?:yes] -  
t android -c C:\\Users\\User\\Desktop\\hello.red

[22:33](#msg591b7e1e9f4f4ab05bcf99b6)If red.exe is a renamed version of red-062.exe. the only other difference I can see is the use of -c .

[22:34](#msg591b7e8b631b8e4e61e24802)When I say it worked for me, I mean it compiled, I haven't tried the compiled code on an Android device.

## Wednesday 17th May, 2017

michaeldesu

[04:29](#msg591bd1aa83cb5db0733c0061)I'm parsing hundreds of XML files (reading, parsing, writing within a loop) and getting a `Runtime Error 19: stack error or overflow` at about the 70th file. I believe I'm operating within available RAM. Is there some memory-based debugging I can apply within my program. Also I have a question - within the loop, I'm doing a `read` into the same var like `s: read %string.xml` (reading over and over again into the same var - assuming the old content is replaced with the new). Is this safe?

[04:48](#msg591bd61c33e9ee771cb52072)From the physical memory usage chart, it's clear I have a memory leak somewhere. I'll check it out.

sergey6661313

[05:28](#msg591bdf7f9f4f4ab05bd0e647)@ZenoArrow @dockimbel i try copy yours command. They are separated by a space. (in PIC?:\_\_yes). Without a space, compilation runs without errors, but my phone still says that I'm not piling it to PIE binaries.

[05:28](#msg591bdf8292217cca58845723)If the -t option is given, then the presence or absence of the -c option gives an absolutely identical file.

[05:34](#msg591be0f592217cca58845cc4)i try Put quotation marks: red.exe --config "\[PIC: yes]" -t android MyHello.reds and i got а larger file. But right now I can not test it on my device ...

geekyi

[06:25](#msg591becd39f4f4ab05bd11d5a)@sergey6661313 just curious, are you using red \*master* branch or \*android* branch?

michaeldesu

[06:34](#msg591beee10a783b6c0aa7adcf)I could use some help. I think I found my memory leak. I've whittled a test case down to the following:

```
test2: function [] [
    int-series: clear []
    num-str: "4111111111111111"
    foreach x num-str [append int-series to-integer to-string x]   ; convert string to integer series for processing
    ; int-series: collect [foreach x num-str [keep to-integer x - #"0"]]  
]

loop 1000000 [
    print test2
]
```

Now when I run the above using `foreach x num-str` I see the memory usage continuously climb at a 45 degree angle (until I get a `stack error or overflow`). If I comment that out and use the other i.e. `int-series: collect..` it does the same thing but at a shallower angle (around 30 degrees). I don't understand why. If someone can explain it I'd be glad. BTW this occurs on Win 7 using red 0.6.2 release or the latest (red-16may17-d98300c.exe) version.

pekr

[06:42](#msg591bf0dbf3001cd3422cd25a)maybe good to repost in red channel, for developers? otoh zhey monitor all channels

geekyi

[06:43](#msg591bf105c4d73f445ab568bd)@michaeldesu no gc yet so it's expected

michaeldesu

[06:46](#msg591bf1bf33e9ee771cb58f7d)@geekyi thanks - ok no long processing for me - I guess I'll have to reconsider my approach

geekyi

[06:48](#msg591bf23400efc2bb3e767ac6)@michaeldesu if I were to guess, I think it's the conversions, steeper because converting twice

rebolek

[06:49](#msg591bf26e83cb5db0733c80db)`to-string` makes new string on each call, so that's 16 milion strings in total

michaeldesu

[06:50](#msg591bf2acf3001cd3422cdab2)I'd be glad to use the other, which is more efficient, but it still consumes a fair amount of memory over a long time

geekyi

[06:53](#msg591bf34ec4d73f445ab572d1)The trick is to try and reuse everything

dockimbel

[06:53](#msg591bf35a8a05641b118e2dd4)`collect` is creating a new block on each call.

[06:53](#msg591bf37233e9ee771cb597f0)

```
lisp
>> test2: function [] [
[        int-series: clear []
[        num-str: "4111111111111111"
[        foreach x num-str [append int-series to-integer x - #"0"]
[    ]
>> stats
== 3317760
>> loop 1000000 [test2]
== [4 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
>> stats
== 3317760
```

Zero extra memory allocated.

michaeldesu

[06:55](#msg591bf3d3c4d73f445ab57435)@dockimbel thanks alot. BTW glad you mentioned `stats` - is this figure showing the amount of memory free (when called)?

rebolek

[06:55](#msg591bf3f72b926f8a6762ffb8)@michaeldesu `stats` shows amount of used memory

michaeldesu

[06:59](#msg591bf4dc83cb5db0733c8bf9)@rebolek thanks alot. @dockimbel grateful for your input - it's a great solution, thanks again, another nice learning.

dockimbel

[07:00](#msg591bf51cd1a7716a0ad4cd97)@michaeldesu You're welcome.

rebolek

[07:00](#msg591bf526631b8e4e61e3e0d4)@dockimbel Hm, does `stats` really work?

```
>> stats
== 3317760
>> x: []
== []
>> loop 10000 [append x random 10000]
== [2753 3781 1267 2651 4113 4804 2503 2771 7648 9492 1906 1951 5254 2638 4119 2614 5002 2619 6714 9524 5276 1575 3961 6703 ...
>> stats
== 3317760
```

dockimbel

[07:03](#msg591bf5b633e9ee771cb5a1d1)@rebolek `stats` shows the total allocated memory from the system, used memory is lower (can be seen in `stats/info`, for each memory category, you get a list of \[used free total]).

rebolek

[07:04](#msg591bf619631b8e4e61e3e48b)@dockimbel Thanks, I compared the result to what Rebol shows, where the value increased in such case.

dockimbel

[07:06](#msg591bf68792217cca5884b061)AFAIK, Rebol2 uses the same approach, if your memory needs fits into the available memory, the total won't change. If the available memory is not enough, it will increase.

michaeldesu

[07:10](#msg591bf75333e9ee771cb5a99e)is there some doc about the memory categories for `stat/info`?

sergey6661313

[12:27](#msg591c419cc4d73f445ab6e6e6)@geekyi i used latest autobild. By the way right now I do not have the download page to download the new version ...

## Thursday 18th May, 2017

dockimbel

[06:54](#msg591d451b2b926f8a6768bc95)@michaeldesu No docs, but looking at its source code, you can easily see what it is about.

sergey6661313

[11:59](#msg591d8cb233e9ee771cbca270)@dockimbel What command do you need to enter to get the source code of "stats/info"?

maximvl

[12:00](#msg591d8cebf3001cd34233ede7)@sergey6661313

```
>> source stats
Sorry, stats is a native! so no source is available
```

[12:02](#msg591d8d4eeec422e415c53203)@sergey6661313 you have to look for it in Red's sources: https://github.com/red/red/blob/d98300c334b4a4ff7779cf20298dabde4d2d1d7f/runtime/natives.reds#L1037

dockimbel

[12:22](#msg591d920f2b926f8a676a25a9)`stats/info` calls `mem-info` which is there: https://github.com/red/red/blob/master/runtime/debug-tools.reds#L25

[12:23](#msg591d92435e34568d5e687553)@sergey6661313 You can't get the source of a native function, as it's written in Red/System and compiled to native code, so the source code is not available anymore.

maximvl

[12:37](#msg591d9580c4d73f445abc9960)I wonder if we can make it available

dockimbel

[13:01](#msg591d9b1df3001cd3423433aa)I don't think that including the whole Red runtime source code into Red runtime itself would be very helpful and worth it, given the cost.

maximvl

[13:02](#msg591d9b559f4f4ab05bd86400)what's the cost?

dockimbel

[13:03](#msg591d9b8f33e9ee771cbceb23)Several extra MB to every Red executable. Just to save users from going on github to look at the source code.

meijeru

[13:44](#msg591da5512b926f8a676a8581)On the other hand, the source of routines IS available and publishing it is the subject of issue (WISH) # 2696.

Oldes

[14:19](#msg591dad5700efc2bb3e7e2041)@meijeru I think there are better things to do now, aren't there?

meijeru

[14:43](#msg591db305631b8e4e61eba7a3)Right now I am using `probe body-of :routine-name` since `source` says "no source available" so I am not in a hurry :grimacing:

rebolek

[14:46](#msg591db3c75e34568d5e691d2b)You can get source of natives if you want to, for example:

```
nsrc: function ['name] [
    natives: pick load https://raw.githubusercontent.com/red/red/master/runtime/natives.reds 11 
    src: mold copy/part find natives to set-word! rejoin [name #"*"] 4 
    take/last remove src ; mold/flat emulation
    print src
]


>> nsrc if

    if*: func [check? [logic!]] [#typecheck if
        either logic/false? [
            RETURN_NONE
        ] [
            interpreter/eval as red-block! stack/arguments + 1 yes
        ]
    ]
```

dockimbel

[15:28](#msg591dbd89631b8e4e61ebe21d)@rebolek :+1:

meijeru

[16:18](#msg591dc95a5e34568d5e698ef4)With suitable warnings, the methods to get at the source of natives, actions and routines, could be incorporated in the `source` function.

rebolek

[17:38](#msg591ddc0d83cb5db073454047)Why not. This is oneliner written in two minutes, but I think that the general idea of getting help from web, where it makes sense, is something, that probably should be considered.

Senenmut

[17:40](#msg591ddca5eec422e415c6bb7b)hi , i am back again here. May i ask for the progress in networking for RED. Just a port connection or else. Yeah it takes time i know. Anyway , it boost the fun up !

geekyi

[19:46](#msg591dfa1b92217cca588dc74c)@rebolek I've been meaning to write something exactly like that! For all functions you can't have source of. Except using my local git copy. Now that you posted it, it looks simpler than I expected.. `source-git`can we have it for everything?

rebolek

[20:04](#msg591dfe4a9f4f4ab05bda3d3a)@geekyi for everything? Hmm. This depends on specific code structure. Native functions are defined as `name*`. For other code bases there should be different extraction mechanism. So it can be added, but it won't be automatic.

## Friday 19th May, 2017

michaeldesu

[00:28](#msg591e3c1b631b8e4e61ee136a)a couple of questions here a little off-topic perhaps. Due to zip compress/decompress support being in the future, I've been `call`ing 7z exe on Windows as a workaround. I'd prefer to use a DLL - I guess it's possible to call DLLs from red/system? If so, anyone anyone can suggest a reasonable cost or free zip DLL for Windows? The ones I've seen are rather expensive.

[00:29](#msg591e3c7e83cb5db07346d3ae)I also found \[this](http://rebol2.blogspot.com.au/2012/11/compression.html) Rebol page featuring some zip code but the code delivery part has been down for around a week

dockimbel

[04:04](#msg591e6ed25e34568d5e6c2a0f)@michaeldesu You can have a look at \[zlib](http://zlib.net/).

michaeldesu

[04:07](#msg591e6f842b926f8a676dd34f)@dockimbel Thanks alot. About my prev message, let me rethink it - I'm a bit tired

[04:23](#msg591e732b631b8e4e61eec5d0)about

```
>> a
== true
>> b
== false
>> a = false and b = false
== true ; incorrect
>> (a = false) and (b = false)
== false  ; correct
```

I've learnt that brackets are needed for this kind of test - it's strange for me (coming from python where brackets here is unneeded). Is there a subtle Red-related learning in this?

rebolek

[04:28](#msg591e745433e9ee771cc06af0)Yes, there is. In Python (and other languages), operator precedence have priorities. Not so in Redbol, where all operators have same priority (see i.e `2 + 3 * 4`).

[04:29](#msg591e74912b926f8a676de19c)So you either can put your expressions in parens, or use more Red-like way:

```
all [a = false b = false]
```

michaeldesu

[04:30](#msg591e74d5eec422e415c8f442)@rebolek :thumbsup: that's great, thanks alot

dockimbel

[05:35](#msg591e840a0a783b6c0ab2e58d)@michaeldesu In addition to @rebolek good answer, if you don't need to explicitly test for `false` logic! value (you very rarely need to do so), you can reduce your expression to: `not any [a b]` or `all [not a not b]`. The former one is often preferable, as you can shortcut `if not` with `unless`, so it can reduce to just `unless any [a b][print "ok"]`

rebolek

[05:38](#msg591e84cb0a783b6c0ab2e7e2)@dockimbel @michaeldesu of course, that's much nicer :)

michaeldesu

[06:12](#msg591e8cdd92217cca588fc8e1)@dockimbel Thanks alot - in my real case I have a string test and boolean test, so I guess it translates to something like: `all [term = "needed_string" not found-flag]` or `all [term = "needed_string" found-flag = false]` to be the equiv of my original `(term = "needed_string") and (found-flag = false)`. This learning from @rebolek about use of `all` is very good. Thanks once again!

rebolek

[06:33](#msg591e91a10a783b6c0ab3147c)@michaeldesu There's also `any` that works like `or`: `any [false true] => true, any [false false] => false`

michaeldesu

[06:49](#msg591e958e83cb5db07347f1b2)@rebolek thanks again. Bit by bit I'm getting the gist of Red, and it's starting to click and is becoming enjoyable. Looking forward to the future updates!

AlexanderBaggett

[16:33](#msg591f1e6d5e34568d5e6f21fa)speaking of future updates, what is the timeline looking like for `0.6.3`?

[16:42](#msg591f207292217cca58923e50)As new features come out, I would like to incorporate them into my project.

rokf

[18:37](#msg591f3b750a783b6c0ab6041b)I'm trying to extract function help descriptions with https://gist.github.com/rokf/40598a238211cc2a5a5b1caaeeca0478 and I have a question. The mold function gives me the output where newlines are represented with a `^/`. Can I somehow replace those `^/` with `\n` and maybe remove the `{` and `}` that surrounds the mold output?

[18:39](#msg591f3bfc5e34568d5e6fa902)I've already tried `replace/all (...) lf "\n"` around the mold but it didn't work.

AlexanderBaggett

[18:53](#msg591f3f110a783b6c0ab61630)@rokf there is a newline char, let me double check.  
yeah the newline char is literally `newline` see if you can do your replace with that instead.

rokf

[18:55](#msg591f3f8983cb5db0734b0073)`lf` is the same as `newline` and no, it does not work

[18:55](#msg591f3f942b926f8a677151a1)worth trying tho :D

AlexanderBaggett

[19:04](#msg591f41a800efc2bb3e84ce32)The `{` and `}` denote individual strings. Perhaps you need a way to combine it all into one before hand

[19:07](#msg591f425b92217cca5892e6a7)Okay I got it

[19:07](#msg591f428e00efc2bb3e84d2f8)@rokf

try this

```
Red []

get-api-data: function [][
    collect/into [
    foreach w sort words-of system/words [
        if all [word? w any-function? get/any :w][
            a: ""
            append a w
            append a fetch-help w
            keep a
        ]
    ]
    ] copy ""
]
write %api_data.txt get-api-data
```

[19:10](#msg591f433e5e34568d5e6fcb38)You could add formatting newlines or whatever to the output via `append`if you wanted.

rokf

[19:16](#msg591f448a0a783b6c0ab6355b)I could yeah, but it looks cleaner with `reduce` and multiple `keep` calls. Also I need the mold call, because I want each entry in its own line.

AlexanderBaggett

[19:17](#msg591f44ac0a783b6c0ab635f8)I like this format personally

```
Red []

get-api-data: function [][
    collect/into [
        foreach w sort words-of system/words [
            if all [word? w any-function? get/any :w][
                a: ""
                append a "-------------"
                append a newline
                append a w
                append a newline
                append a fetch-help w
                append a newline 
                append a "-------------"
                append a newline 
                keep a
            ]
        ]
    ] copy ""
]
write %api_data.txt get-api-data
```

[19:18](#msg591f44e9f3001cd3423b3bbd)You get stuff that looks like this :

```
-------------
/

USAGE:
      value1 /  value2

DESCRIPTION:
      Returns the quotient of two values. 
      / is of type: op! 

ARGUMENTS:
     value1   [number! char! pair! tuple! vector! time!]  => The dividend (numerator). 
     value2   [number! char! pair! tuple! vector! time!]  => The divisor (denominator). 

REFINEMENTS:

-------------
-------------
//

USAGE:
      a //  b

DESCRIPTION:
      {Wrapper for MOD that handles errors like REMAINDER. Negligible values (compared to A and B) are rounded to zero. 
      // is of type: op! 

ARGUMENTS:
     a   [number! char! pair! tuple! vector! time!] 
     b   [number! char! pair! tuple! vector! time!] 

REFINEMENTS:

-------------
```

[19:23](#msg591f46365e34568d5e6fe028)@dockimbel , there are a lot of duplicates for `%` that showed up in this.

geekyi

[19:34](#msg591f48cc2b926f8a67717cdb)@AlexanderBaggett what do you mean? Example code?

rokf

[19:56](#msg591f4de0c4d73f445ac3daeb)Ok, I could replace all newlines with the pattern `^^/` instead of `^/`

AlexanderBaggett

[20:10](#msg591f5140eec422e415ccafe0)@geekyi I was talking about the function above for Rok. He was designing a function that would output all of the help for all of the functions. I found the `%` function showed up many times.

[20:11](#msg591f515792217cca58932af6)You can run the code in my example above

rokf

[20:12](#msg591f51b733e9ee771cc4480f)Shows up only once for me.

geekyi

[20:58](#msg591f5c91c4d73f445ac42221)@AlexanderBaggett strange, repeats only when it is `write`n:

```
>> print take/part get-api-data 300
-------------
%
W is a word! value: %

-------------
-------------
*
```

[21:14](#msg591f604a92217cca589373fb)Ok, I just realized I get something completely different. Must be the recent changes in `help` (`fetch-help` is deprecated now, should use `help-string` instead)

rokf

[22:17](#msg591f6ef25e34568d5e709f41)I got what I wanted btw, https://github.com/rokf/howl-red/blob/master/gen\_api\_data.red

It looks a bit thrown together but it works great :sparkles:. It writes the data in a Lua table format so I could add autocompletion and inline docs to my Red bundle for Howl :smile:

## Monday 22nd May, 2017

rokf

[13:47](#msg5922ebeafa63ba2f766a3287)Are there any tutorials or examples around the stuff available in the `system` object?

rebolek

[13:54](#msg5922ed9e05e3326c67f94e3f)@rokf I don' think so. There's some \[info](http://rebol2.blogspot.cz/2012/04/system-object-exposed.html) about Rebol's `system` object, which is close to Red's one.

dockimbel

[14:11](#msg5922f19e2b926f8a677ea4ca)@rokf No info, but you can use `help` to navigate it (like:  
`help system/options`) and you can ask as many questions here (or in red/help) as you need. ;-)

rokf

[14:43](#msg5922f916eec422e415d98584)@rebolek @dockimbel Alright, thanks :+1:

## Tuesday 23th May, 2017

kammd

[06:05](#msg5923d11164a70be11ad3353a)I came across some rebol code which mentions read/custom refinement to post some data to http url.

[06:05](#msg5923d11b0de3eb3e19a7a11e)Is there anything similar in red as well?

rebolek

[06:06](#msg5923d16d5e34568d5e805970)@kammd If you want to post data to url, in Red, you need to use `write/info`. Here's a simple example, feel free to ask about details:

```
write/info http://some.serv.er [POST [header: here] "data here"]
```

kammd

[06:08](#msg5923d1dd7410563012836b73)@rebolek where can I find this information??

[06:09](#msg5923d1fe0de3eb3e19a7a12b)I mean is there a documentation page which gives the details??

rebolek

[06:09](#msg5923d2190a783b6c0ac6982c)@kammd current IO in Red is just temporary solution, until full IO is implemented in 0.7.0. So expect IO documentation to come with 0.7 release.

kammd

[06:10](#msg5923d23a331deef46469969f)oh ok.. btw I am getting \*\** Runtime Error 1: access violation

rebolek

[06:10](#msg5923d243f3001cd3424c27e8)@kammd which OS?

kammd

[06:10](#msg5923d24d5dc6925a7a44b9ea)mac os

[06:10](#msg5923d25a21759a6a01669a33)red 0.6.2

rebolek

[06:11](#msg5923d27c9f4f4ab05befe803)@kammd can I see your code?

[06:11](#msg5923d2a40a783b6c0ac69a19)It is possible to get this error when the info block is badly formatted.

kammd

[06:12](#msg5923d2cb7410563012836b7e)naah my bad.. i forgot that here was a string..

rebolek

[06:13](#msg5923d2f8f3001cd3424c2a61)So badly formatted block :) It should probably give better error message.

kammd

[06:13](#msg5923d31b21759a6a01669a35)Oh ok.. btw while I am here.. I wanted to understand file io better.. let's say if I want to implement unix tail in red.

[06:13](#msg5923d32764a70be11ad33553)but without reading the whole file.. is that possible?

rebolek

[06:14](#msg5923d359eec422e415dcfea6)There is `read/seek file index`

kammd

[06:18](#msg5923d42e21759a6a01669a4d)Hmm thats a start

rebolek

[06:20](#msg5923d4a792217cca58a3e3a7)See help for `read`, there is also `/part` refinement that may be useful for this.

[06:21](#msg5923d5065e34568d5e80664c)However, AFAIK there is one missing piece still - you can't get file size ;)

kammd

[06:22](#msg5923d538331deef4646996ba)yeah was trying to figure out if there is a `size?`

meijeru

[08:40](#msg5923f59205e3326c67fd810e)You can always do a `read/binary` and ask for the `length?` of the resulting `binary!` value...

rebolek

[08:42](#msg5923f5df0a783b6c0ac736dc)@meijeru you can, but than you have the file in memory and do not need to use `read/skip` at all...

meijeru

[08:44](#msg5923f66f05e3326c67fd8520)With memory being cheap, this brute force method isn't so bad.

iArnold

[08:47](#msg5923f71c05e3326c67fd8b42)Prices for memory have gone up in the past year due to high demand from smartphone industry. ;-)

rebolek

[08:47](#msg5923f737fa63ba2f766eb18f)Loading takes some time with larger files and without GC you will end up consuming more and more memory. Getting the file size from OS is probably better way with something like:

```
>> call/output "du -s ide.exe" s: ""
== 0
>> 512 * load first split s tab
== 1097728
```

[08:48](#msg5923f77bfa63ba2f766eb268)OTOH this is not exactly precise value, maybe calling `ls` would be better in such case.

dockimbel

[09:03](#msg5923fae9eec422e415ddacea)@kammd I just implemented the `size?` native, as it's too useful to not have, even with current simple IO.

rebolek

[09:03](#msg5923fafbc4d73f445ad557dd)Cool!

kammd

[09:12](#msg5923fcf621759a6a01669cc2)@dockimbel Awesome!

[09:12](#msg5923fd0264a70be11ad337d3)That was fast..

sergey6661313

[10:36](#msg592410a7c4d73f445ad5c564)how to delete attribute in Object! ?

rebolek

[10:38](#msg5924112405e3326c67fe0b7f)@sergey6661313 objects are static, you can't add or remove words (attributes). You can do that with maps, but they have their own limitations.

sergey6661313

[10:39](#msg5924116d0a783b6c0ac7b880)i can add.: new-object: last-object \[new-attrib: integer!]

rebolek

[10:41](#msg592411d8631b8e4e61042123)Do you mean `new-object: make last-object [new-attrib: integer!]`? This actually makes new object, it does not add to old one.

sergey6661313

[10:45](#msg592412e300efc2bb3e96f1fc)yes. i forgot "make" word... Can I get a new object without the specified parameter?

[10:46](#msg59241301fa63ba2f766f42be)In the sense of attribute

rebolek

[10:49](#msg592413b02b926f8a67839fdc)If you make an object, you need both word and value that will be added.

[10:49](#msg592413cb00efc2bb3e96f63f)like `o: make object! [x: 1]`

sergey6661313

[10:51](#msg5924143292217cca58a5184e)example a: make object! \[b: 1 c: 2] how get object! like "a" but without "b" ( something like new-object: make a \[del b] )

rebolek

[10:52](#msg592414785e34568d5e81888a)Why not use maps, where you can easily remove keys?

sergey6661313

[10:53](#msg592414a0f3001cd3424d5957)I do not know how to use them :)

rebolek

[10:54](#msg592414eb631b8e4e61043503)It is easy :)

```
m: make map! [x: 1 y: 2]
m/x: none
probe m
```

sergey6661313

[10:55](#msg592415150a783b6c0ac7cd9f)O00ooo...

[10:55](#msg59241521f3001cd3424d5aff)thx!

[10:55](#msg5924153d92217cca58a51ecc)What is the advantage of objects?

rebolek

[10:56](#msg5924155d0a783b6c0ac7cfe7)Or you can use literal syntax: `m: #(x: 1 y: 2)`

dockimbel

[11:06](#msg592417be00efc2bb3e970a24)@sergey6661313 Objects provide a namespace, maps do not. If you need to delete words from objects, you are probably using the wrong datatype, you should be using blocks or maps if you really need an associative data structure.

sergey6661313

[12:10](#msg592426a6fa63ba2f766fa7e8)Maybe not right, but really want to.

geekyi

[15:28](#msg59245511f3001cd3424eb1e7):laughing: (sorry, I imagined that as "really want to :worried:")  
@sergey6661313 maybe you're trying to bend Red to do OOP? There's probably an easier way to do what you want.. Posting example code helps

sergey6661313

[17:47](#msg592475bdf3001cd3424f5c91)There is no code. Even the concept so far there.  
I want to combine a notebook, a phone book, office work (Office administration), a daily schedule and a production schedule.  
So I think how it will be.  
We need structures:  
Enterprise \[name]  
Tasks \[% of performance]  
Subtasks \[requirements]  
Production hall \[name, power]  
Person: \[name, surname, telephone, company, division (production department)]  
Products \[name, number production workshop (performer), labor intensity]

But the trick is that some products sometimes have 2 or more numbers.  
Sometimes a few performers. Sometimes workers work on 2 shops at once. etc.  
In short, for flexible production, very flexible OOP facilities are needed

geekyi

[21:11](#msg5924a57100efc2bb3e99cafa)@sergey6661313 Sorry, didn't see this.. In that case use blocks:

```
; if necessary, wrap this with `products: [ bag: ... shoe: .. ]`
bag: [
    "Default Name"
    other: 'Name
    default-number: 344
    numbers: [
        #defaultNo.344
        isbn: #32342
        barcode: #sdfs
    ]
]
```

[21:16](#msg5924a6b5fa63ba2f76724184)Actually, I don't find a reason why you cant use `make object!`: even for very flexible records, you don't generally want to delete any attribute or you would have problems.  
The actual structure depends on your data schema. I get the feeling you want something like a document database tho (nosql, which redbol notation is much suited for)

[21:19](#msg5924a770631b8e4e610717da)My example above could be done better, showing more of \*what to do when the structure changes\*, like a new attribute getting added, etc. In general, you \*never* delete attributes tho

## Wednesday 24th May, 2017

sergey6661313

[10:56](#msg592566e6eec422e415e3d082)@geekyi You understood me correctly.  
I do not like coffins in the form of "none". How to delete a record from the block correctly?

```
MyMap: make map! [ a: 0 b: 1 ]
MyMap/a: none
print MyMap

MyBlock: [ a: 0 b: 1 ]
MyBlock/a: none
print MyBlock
```

It turns out "none, 1" .

Oldes

[12:41](#msg59257f8e9f4f4ab05bf74914)

```
>> MyBlock: [ a: 0 b: 1 ]
== [a: 0 b: 1]
>> remove/part MyBlock 2
== [b: 1]
>> MyBlock
== [b: 1]
```

[12:42](#msg59257fd2c4d73f445adc1e8b)

```
>> MyBlock: [ a: 0 b: 1 ]
== [a: 0 b: 1]
>> find MyBlock 'b
== [b: 1]
>> remove/part find MyBlock 'b 2
== []
>> MyBlock
== [a: 0]
```

sergey6661313

[13:34](#msg59258bfc00efc2bb3e9d74fc)i try put MyBlock info/id info, and. if i use map! i turns out "id: \[]" . if i use block! i turns out \[id \[]] Those without a colon. This is normal? Will this affect the continued use?

rebolek

[13:36](#msg59258c61eec422e415e47a48)@sergey6661313 It is normal and it won't affect usage. All word types are equivalent in block /map:

[13:36](#msg59258c67f3001cd34253eff9)

```
>> b: [x]
== [x]
>> b: [x 1]
== [x 1]
>> select b 'x
== 1
>> select b quote x:
== 1
>> select b quote :x
== 1
```

Oldes

[15:32](#msg5925a77800efc2bb3e9e0cc1)@rebolek @sergey6661313 not necessarily equivalent with `block!`:

```
>> b: [x 1 x: 2]
== [x 1 x: 2]
>> select/same b 'x
== 1
>> select/same b quote x:
== 2
>> select/same b to set-word! 'x
== 2
```

[15:34](#msg5925a81c0a783b6c0acec892)

```
>> m: #(x 1 x: 2)
== #(
    x: 2
)
```

greggirwin

[21:25](#msg5925fa402b926f8a678cceb7)@sergey6661313, each type has different strengths. Experimenting with them in the console, or just playground scripts, along with the examples others have given, should give you a feel for them. We should write up a primer doc, though, if we don't have one already.

[21:33](#msg5925fc432b926f8a678cda91)@rokf, nice way to put Red to work.

nulldatamap

[22:41](#msg59260c120a783b6c0ad0f6bf)Hey

greggirwin

[23:53](#msg59261d05fa63ba2f76793e3d)Hey.

[23:59](#msg59261e54631b8e4e610de655)Though, in Red, your avatar should really be `{^@}` or maybe `#{00}`. ;^)

## Thursday 25th May, 2017

dockimbel

[06:39](#msg59267c18fa63ba2f767a9492)@greggirwin Welcome back! Is that first one bearded? ;-)

greggirwin

[07:39](#msg59268a3bf3001cd342589bc0)And with an old-fashioned hairstyle.

nulldatamap

[11:20](#msg5926bded00efc2bb3ea3042e)How do I make it so that compiled GUI programs on Windows don't spawn a parent console on startup?

rebolek

[11:21](#msg5926be3f00efc2bb3ea305da)@nulldatamap compile with `-t Windows`, default target is MSDOS - console programs.

nulldatamap

[11:23](#msg5926beb9fa63ba2f767ba909)Thanks!

sergey6661313

[11:25](#msg5926bf1700efc2bb3ea30a24)how to ignore exception? try load not exist file and script stopped :(

rebolek

[11:26](#msg5926bf7e00efc2bb3ea30c44)@sergey6661313 you can wrap your code in `try`, but ignoring exceptions doesn't seems wise ;) What exactly are you trying to do?

dockimbel

[11:28](#msg5926bfd39f4f4ab05bfce2ae)@sergey6661313 Use `try` or `attempt` if you don't want to process the error. For testing if a file exists, use the `exists?` function.

sergey6661313

[11:29](#msg5926c01c0a783b6c0ad391dc)@dockimbel @rebolek thx

[12:10](#msg5926c9c600efc2bb3ea335a5)All the same, colons of the court are important throughout. those. I have to use map!

```
humans: make map! [ last-id: 0 ]

create-new-record: func [ 
	table	[map!]
	info	[map!]
] [
	new-id: table/last-id + 1	; here. What type of data should I use what was with the colon?
	put info 'id new-id			; Here I get a colon
	put table new-id info 		; But not here. 
	table/last-id: new-id
]

serg: make map! [
	name: "Сергей"
]

create-new-record humans serg
;remove/part find humans id 1; And that it works
help humans
```

nulldatamap

[15:16](#msg5926f5435e34568d5e8e20b4)How do you tell syntactically when an expression ends?

9214

[15:17](#msg5926f5805e34568d5e8e2270)@nulldatamap usually it's newline or end of the block/parens

nulldatamap

[15:18](#msg5926f5c6fa63ba2f767ca7b5)Is it definable by a grammar, or does it require information about how many arguments a function takes?

greggirwin

[15:19](#msg5926f5fd631b8e4e61113b3d)@9214, that's not how Red sees things, of course, and perhaps not even as common as you think.

@nulldatamap, Red has free-ranging evaluation, which depends on function arity in a given evaluation context.

9214

[15:19](#msg5926f6055e34568d5e8e273c)@nulldatamap I think the latter one, since Rebol and Red are completely freeform

[15:20](#msg5926f630631b8e4e61113ca8)ending expression on the same line or inside delimiters is just a preferred coding style

nulldatamap

[15:21](#msg5926f6670a783b6c0ad48378)Ah, that's gonna make my life a lot harder then

greggirwin

[15:22](#msg5926f69f0a783b6c0ad48472)It can make some things tricky, yeah. What are you trying to do?

nulldatamap

[15:25](#msg5926f7680a783b6c0ad4891c)I'd like to implement an evaluate expression command for emacs (like the one in SLIME for Common Lisp)

[15:26](#msg5926f78d0a783b6c0ad489b3)But I guess I'll have to go with syntactic approximation and just write code that follows that guideline. The alternative is not really realistic

greggirwin

[15:26](#msg5926f7912b926f8a6790ce43)Red is \*very* flexible. Sometimes you have to take a deep breath, when learning it, and remember that it's by design.

```
>> prn+: func ['a [any-type!] 'b [any-type!]] [print [mold :a mold :b]]
== func ['a [any-type!] 'b [any-type!]][print [mold :a mold :b]]
>> prn+
unset unset
>> prn+ 1
1 unset
>> prn+ 1 2
1 2
>> do [prn+ ]
unset unset
>> do [prn+ ()]
unset unset
>> do [prn+ () 1]
unset 1
```

[15:27](#msg5926f7d4631b8e4e61114690)I haven't used SLIME, but I think you're on track with approximation.

nulldatamap

[15:28](#msg5926f809fcbbe1891c4488b6)You basically use a shortcut and it detects the bounds of the expression your cursor is inside of and evaluates it

greggirwin

[15:32](#msg5926f91000efc2bb3ea41564)You would have to know the context of the words, so tricky. This is something tools, like an IDE, will need to be creative with. When you have dialects, or words may be rebound, approximation is surely going to be low-hanging fruit. Anything you do for SLIME we can probably learn from.

9214

[15:48](#msg5926fcdc9f4f4ab05bfdf6a2)@sergey6661313 IMO it's more suitable to use prototype object and inherit every entry directly from it

```
table: object [
    list-of-humans: copy []
    
    next-id: does [add length? self/list-of-humans 1]
    update: function [entry] [append self/list-of-humans entry]
    find: function [id] [
        foreach obj self/list-of-humans [
            if obj/id = id [return obj]
        ]
    ]
]

entry: object [
    id: name: none
]

table/update make entry [
    id: table/next-id
    name: "Сергей"
    additional-info: "I code in Red"
]

table/update make entry [
    id: table/next-id
    name: "Владимир"
    age: 3000
    answer: 42
]

probe table/list-of-humans ; not a pretty one :(
probe table/find 1
probe table/find 0 ; nope!
```

[15:50](#msg5926fd430a783b6c0ad4a6db)@greggirwin howdy Gregg, nice to see you again :)

greggirwin

[16:03](#msg5927005a631b8e4e61116ff8)Thanks @9214. Good to unplug, but had some Red withdrawals. :^)

[16:15](#msg5927032000efc2bb3ea44685)@sergey6661313, the reason you don't get a colon when using `new-id`as the key is because it's an integer, not a word.

```
>> m: #(a: 11 b 22 3 33 "4" 44)
== #(
    a: 11
    b: 22
    3 33
    "4" 44
)
```

sergey6661313

[16:37](#msg5927084c9f4f4ab05bfe2b78)@greggirwin It's clear. But it is not clear how to work with this. Or replace id: integer! For example id: 'a0001 and try to work with it, but then I do not know how to increment it. Or I'll try all the same objects by advice @9214 as I originally thought ...  
Because such an option is possible: a: #(1 "test" 2 3 3 1)  
If I use the table / find function, it will not find the first three.

greggirwin

[16:55](#msg59270c730a783b6c0ad4eede)I don't know what you mean about `find` not working. Incrementing words is a bit of work, as you have to convert to string, modify, then back to word.

sergey6661313

[17:01](#msg59270dd75e34568d5e8ea384)@9214 Records are obtained without keys. How can I delete them?

greggirwin

[17:02](#msg59270e0e631b8e4e6111b289)With maps, you just set their value to `none`.

```
>> m: #(a: 11 b 22 3 33 "4" 44)
== #(
    a: 11
    b: 22
    3 33
    "4" 44
)
>> m/3: none
== none
>> m
== #(
    a: 11
    b: 22
    "4" 44
)
```

sergey6661313

[17:06](#msg59270f04631b8e4e6111b7c2)@greggirwin I asked about the example of objects ... And in your example, just the problem that I described above arises. I decided to use "id" for a reason. And that would be the key to which you could delete the record.  
It is necessary that it was like in python  
Table = {key: value}  
Table.remove (key)

greggirwin

[17:07](#msg59270f6cf3001cd3425afc96)I'm afraid I'm still not clear on the problem.

sergey6661313

[17:17](#msg5927119600efc2bb3ea487fc)@greggirwin Thanks earned. Probably me already brains buggy. I do not know why I used the remove / part command instead of just none.

greggirwin

[17:18](#msg592711d3631b8e4e6111c5c0)It's a difference in how maps work, so an easy mistake to make as you get used to things.

mpchean

[17:27](#msg5927140f2b926f8a67916173)\[!\[image.png](https://files.gitter.im/red/red/welcome/shrZ/thumb/image.png)](https://files.gitter.im/red/red/welcome/shrZ/image.png)

[17:27](#msg59271418fcbbe1891c451652)Is there another Red Languange icon i could use besides this:

greggirwin

[17:32](#msg592715255e34568d5e8ec4c2)%system/assets/ has some %.ico files in it.

nulldatamap

[17:49](#msg59271927eec422e415eb6045)Hmm, `red --cli` halts and uses my entire CPU when I try to pipe input into it

dander

[17:58](#msg59271b4feec422e415eb6b75)@greggirwin It's nice to see you back again. I'm always learning so much from you. The `prn+` example surprised me. I thought functions always had to be fed the correct number of arguments. Is that special behavior related to `lit-word!` argument definitions? Why don't we get a `prn+ is missing its ... argument` error?

greggirwin

[18:01](#msg59271c15fcbbe1891c453b70)The `lit-word!` param is the trick there, yes. You can change that and get the error you expect. It's not something you want to do, in general. Easy to get wrong with free ranging stuff, but that's how `help` knows whether you asked for something specific as well.

[18:03](#msg59271c695e34568d5e8ee6bd)You can also go the other way, and pass extra args that may not be consumed. Again, care is required.

[18:04](#msg59271c915e34568d5e8ee7e5)Old experiment:

```
map-js: func [
	"Evaluates a function for all values in a series and returns the results."
	series [series!]
	fn [any-function!] "Function to perform on each value; called with value, index, series, [? and size ?] args"
	;/only "Collect block types as single values"
	;/skip "Treat the series as fixed size records"
	;	size [integer!]
][
	collect [
		repeat i length? series [   ; use FORSKIP if we want to support /SKIP.
			keep/only fn series/:i :i :series ;:size
		]
	]
]
res: map-js [1 2 3 a b c #d #e #f] :form
res: map-js [1 2 3 a b c #d #e #f] func [v i] [reduce [i v]]
res: map-js [1 2 3 a b c #d #e #f] func [v i s] [reduce [i v s]]
res: map-js "Hello World!" func [v i s] [pick s i]
res: map-js "Hello World!" func [v] [either v = #"o" [1][0]]	; sum result = count
res: map-js "Hello World!" func [v i] [if v = #"o" [i]]			; remove none! values to keep only index values
res: map-js "Hello World!" func [v i s] [if v = #"o" [at s i]]	; remove none! values to keep only series offsets
```

[18:06](#msg59271d12fa63ba2f767d6a9f)The `lit-word!` trick can be used, very effectively, in CLI scenarios, where the function can prompt for more details and args in an interrogative fashion.

dander

[18:47](#msg592726c1fa63ba2f767d92b7)very interesting. So basically the function consumes as many args as it wants, and any extra are still evaluated, but ignored because of where they are evaluated. I haven't seen a technique like that used anywhere else

9214

[18:50](#msg592727609f4f4ab05bfec7c2)@sergey6661313 so, in my example, you want to delete entry by id?

[18:50](#msg592727830a783b6c0ad563f4)

```
table: object [
    list-of-humans: copy []
    
    next-id: does [add length? self/list-of-humans 1]
    update: function [entry] [append self/list-of-humans entry]
    find: function [id] [
        foreach obj self/list-of-humans [
            if obj/id = id [return obj]
        ]
    ]
    delete: function [id] [
        remove system/words/find self/list-of-humans find id
    ]
        
]

entry: object [
    id: name: none
]

table/update make entry [
    id: table/next-id
    name: "Сергей"
    additional-info: "I code in Red"
]

table/update make entry [
    id: table/next-id
    name: "Владимир"
    age: 3000
    answer: 42
]

table/update make entry [
    id: table/next-id
    name: "Alice"
]

probe table/list-of-humans ; Alice is here
table/delete 3
probe table/list-of-humans ; Alice is gone :(
```

sergey6661313

[19:06](#msg59272b36c4d73f445ae3c349)please tell me what I'm doing wrong?

```
>> join "super" "duper"
**  Script Error: join has no value
**  Where: catch
```

9214

[19:10](#msg59272c14c4d73f445ae3c763)@sergey6661313

```
>> type? :join
== unset!
```

there's no `join` function

[19:10](#msg59272c2beec422e415ebb67f)

```
>> append "super" "duper"
== "superduper"
```

sergey6661313

[19:15](#msg59272d39fa63ba2f767dad1c)@9214 I'll try not to ask stupid questions anymore :)

greggirwin

[19:15](#msg59272d3ceec422e415ebbaf1)

```
; I have this here because some old format code I'm porting uses it.
	; It may all change to `rejoin`, but it gave me a reason to port `join`
	; to Red for real and think about object/map support. `Rejoin` doesn't
	; work for those. The question, then, is what value there is in a
	; uniform interface for copy+extend.
	join: func [
		"Concatenate/merge values"
		a "Coerced to string if not a series, map, or object"
		b "Single value or block of values; reduced if `a` is not an object or map"
	][
		if all [block? :b  not object? :a  not map? :a] [b: reduce b]
		case [
			series? :a [append copy a :b]
			map?    :a [extend copy a :b]
			object? :a [make a :b]
			'else      [append form :a :b]
		]
	]
```

AlexanderBaggett

[19:28](#msg592730795e34568d5e8f3e13)is there a way to get the selected text of a text-area?

dander

[19:46](#msg5927349d9f4f4ab05bff03ec)so I noticed that the `lit-word!` function trick works when it's defined as `any-type!`, but not for parameters that don't have type(s) defined. Any reason for that difference? I was thinking of the parameter type block as a constraint on evaluation.

nulldatamap

[21:10](#msg5927485d631b8e4e6112caa5)How come I can't compile a script that uses `ask`? It says the word is not defined

## Friday 26th May, 2017

greggirwin

[00:14](#msg5927734eeec422e415ecbbf8)`ask` is in the console code, in %input.red.

[00:17](#msg5927740a9f4f4ab05bffe6e3)@dander, it's the `unset!` arg (or lack thereof) that trips it up. If you create a new typeset, just adding `unset!` to `default!`, it works.

[00:17](#msg592774235e34568d5e9039d4)@AlexanderBaggett, I don't think that feature is in place yet.

michaeldesu

[00:20](#msg592774b100efc2bb3ea60d75)with the recent map discussion, I have a question - are the following two ways to create a map (with data) identical?

```
>> a: make map! [x 1 y 2 z 3]
>> b: make map! [x: 1 y: 2 z: 3]
```

it seems so. I thought it was the former method, but often seeing the later above

greggirwin

[00:26](#msg592776410a783b6c0ad68ff5)@michaeldesu, they work the same, yes. There's a bit of sugar to make things easier.

```
>> keys-of a: make map! [x 1 y 2 z 3]
== [x y z]
>> keys-of b: make map! [x: 1 y: 2 z: 3]
== [x y z]
```

michaeldesu

[00:27](#msg59277673fa63ba2f767ebd0f)@greggirwin thanks alot - great to see you here again :smile:

greggirwin

[00:27](#msg59277685eec422e415ecc534)Thanks. :^)

AlexanderBaggett

[13:10](#msg5928294e0ba4d59763e2c46c)that is a really cool way to make a map

dockimbel

[15:16](#msg592846b35e34568d5e93682c)@nulldatamap I don't think redirections from command-line are properly supported yet. Were you trying to pipe in a Red script?

nulldatamap

[16:33](#msg592858c5c4d73f445ae862a1)I'm trying to connect to the Red REPL with emacs which is done by piping.

dockimbel

[16:40](#msg59285a8af3001cd342602823)@nulldatamap Then in such case, using the console executable directly would be a better way. The `red` executable is just a convenient wrapper over it. You can find the precompiled console in `c:\programdata\red` on Windows and in `~$HOME/.red/` on other platforms.

nulldatamap

[17:20](#msg592863f7fa63ba2f7682821d)@dockimbel thanks, where should I start digging into the code if I want to contribute to make piping work?

dockimbel

[17:47](#msg59286a32eec422e415f06f68)@nulldatamap For the REPL, I think it should work already, though I don't remember testing it, @qtxie should know better. For the `red` executable, it's a bit more complicated, as it contains the toolchain code wrapped with a Rebol executable to run it. Rebol has a `--cgi` option to enable I/O redirections, let me try if enabling that would make it work...

nulldatamap

[17:48](#msg59286a830ba4d59763e3ebc2)Yeah because piping to the REPL executable still the halts the program

dockimbel

[17:52](#msg59286b402b926f8a6796b187)I pushed a fix for the wrapper script.

[17:52](#msg59286b6d0a783b6c0ada5a46)@qtxie ^--- Do we already support standard I/O redirection in Red console?

[17:53](#msg59286b9fcb83ba6a4100e02e)@nulldatamap BTW, on which platform are you running it?

nulldatamap

[17:54](#msg59286bd5fcbbe1891c4a7a9f)Currently I've only tried on Windows 7 64bit, though I also have a 64bit Linux system

dockimbel

[18:11](#msg59286fd3c4d73f445ae8c446)If you want to add support for I/O redirection, you can start by looking \[here](https://github.com/red/red/blob/master/environment/console/engine.red#L44) and \[there](https://github.com/red/red/blob/master/environment/console/engine.red#L85).

nulldatamap

[19:25](#msg5928810c0ba4d59763e4516a)I don't assume it to be a task of high priority

## Saturday 27th May, 2017

qtxie

[00:55](#msg5928ce8e00efc2bb3eab5ffd)Yes. I think the CLI console supports I/O redirection.

[01:02](#msg5928d01c2b926f8a67982702)Also if you want to write to stdout in Red, there is a temporary routine `write-stdout` in the runtime. I use it in VSCode plugin.

dockimbel

[03:20](#msg5928f08b5e34568d5e95d850)@qtxie I can't make it work from DOS using the CLI console...

qtxie

[03:34](#msg5928f3c00a783b6c0adc32fe)@dockimbel I tried this one, it works:

```
D:\Dev>console red\tests\hello.red >> redirect.txt
```

[03:36](#msg5928f453eec422e415f250d6)On Linux with pipe:

```
qtxie@ubuntu:~/Red$ ./console red/tests/hello.red | grep 'den'
Dobrý den světe
```

[03:41](#msg5928f557631b8e4e61192648)Ah, yes. Read from stdin does not work.

dockimbel

[03:41](#msg5928f580eec422e415f254f4)I tested with stdin, yes.

sergey6661313

[08:40](#msg59293b620ba4d59763e69a2b)I again do not understand anything:

```
>> help 'a
'a is a lit-word!

>> lit-word? 'a
== false
```

endo64

[08:41](#msg59293bd3eec422e415f323cc)

```
>> lit-word? first ['a]
== true
```

Probably you are on console and your `'a` evaluates to `a` which is not a lit-word but a word.

[08:43](#msg59293c4d00efc2bb3eac9f8a)Check this out:

```
>> b: [a 'a] reduce [word? b/1 word? b/2 lit-word? b/1 lit-word? b/2]
== [true false false true]
```

dockimbel

[11:38](#msg592965362b926f8a6799ddf3)@sergey6661313

```
>> 'a         ;-- a lit-word!
== a          ;-- evaluates to a word!
```

[11:39](#msg5929658dc4d73f445aebf879)So when you are passing `'a` as an argument, it will evaluate to a `word!` before reaching the caller function.

[11:40](#msg592965acfa63ba2f7685dd0f)

```
lisp
>> to-lit-word 'a
== 'a
```

endo64

[15:11](#msg5929973500efc2bb3eadc2af)@sergey6661313 And probably you are wondering why it is evaluated in `lit-word? 'a` but not in `help 'a`, check the source of `help` function:

```
>> ? help
USAGE:
      help 'word
ARGUMENTS:
     'word   [any-type!]  => Word you are looking for.
```

Note that the single quote in the argument.

greggirwin

[15:11](#msg5929973b631b8e4e611b13dc)\*But\*, `help` uses a `lit-word!` argument, which is what may be confusing. It's an advanced technique which prevents the argument from being evaluated.

[15:12](#msg5929975eeec422e415f4452e):^)

endo64

[15:12](#msg592997625e34568d5e97d119)@greggirwin Almost at the same time :)

greggirwin

[15:13](#msg59299788c4d73f445aec9c01)Usually it's Bolek that beats me like that. You guys must have a system. ;^)

endo64

[15:13](#msg59299794eec422e415f44594):D

## Wednesday 31st May, 2017

gltewalt

[17:06](#msg592ef830cb83ba6a4119733a)'word is a sneaky snake in the repl. By the time output is shown it has decayed into (or been evaluated to) word.  
I think it's within the top 5 "gotchas" for Red explorers.

[17:08](#msg592ef88fcb83ba6a41197584)unset! also wreaks havoc. It's a chain breaker.

dockimbel

[17:10](#msg592ef8f4f3001cd3427914c9)@gltewalt `'word` evaluating to `word` is a basic evaluation rule overlooked by many when reading the (Rebol) docs. We'll try to improve that in the Red docs.

[17:10](#msg592ef915fa63ba2f769b4c61)&gt; unset! also wreaks havoc. It's a chain breaker.

That's precisely its purpose, to generate errors in order to signal logical issues in the code.

gltewalt

[17:11](#msg592ef9575e34568d5eacdaf9)lit-word! unset! logic!  
In the top 5 of Surprise and Alarm.  
Making a paper on the top 5 traps would be a great document

greggirwin

[17:13](#msg592ef9b3c4d73f445a01146b)Don't think of `lit-word!` as different from any other word. They all evaluate.

```
>> 'a
== a
>> a
*** Script Error: a has no value
*** Where: catch
>> :a
>> a:
*** Script Error: a: needs a value
*** Where: a
```

dockimbel

[17:13](#msg592ef9ce0a783b6c0af2ecf2)@gltewalt What about `logic!`? Is it the word representation of the two logic! values which is causing trouble, or the fact that all values are treated as `true` except `false` and `none`?

greggirwin

[17:13](#msg592ef9d10a783b6c0af2ecf6)What about `logic!` is confusing?

gltewalt

[17:14](#msg592ef9df00efc2bb3ec2a07f)Sure, but newcomers expect 'a to return 'a, from what I've noticed

rebolek

[17:15](#msg592efa1fc4d73f445a0116ca)@gltewalt But then this won't work:

```
>> a: 1
== 1
>> a
== 1
```

gltewalt

[17:15](#msg592efa21631b8e4e612fb9df)The latter with logic!  
I don't think a lot of people are used to everything being true except for false and none

[17:15](#msg592efa4dfcbbe1891c6315aa)I'm not saying anything is wrong. Just my feedback on what I see tripping people up

rebolek

[17:16](#msg592efa6a3aeff8a61f62b1d1)I see. Good points to mention in documentation then.

[17:16](#msg592efa843aeff8a61f62b214)But as I see, people usually do not read it anyway ;)

dockimbel

[17:16](#msg592efa8a2b926f8a67af562c)@gltewalt Yes, trying to use your knowledge from other languages will just get in the way.

gltewalt

[17:17](#msg592efab02b926f8a67af571d)A problem I have is that I will think, "x y and z seem to cause confusion and would be a good document addition", but then I forget about it

dockimbel

[17:18](#msg592efae30a783b6c0af2f2bc)@gltewalt The wiki on red/red is there for that, it's public, you can write there. ;-) A page listing all the apparent "traps/gotchas" is welcome, so we can check it while writing the Red docs.

gltewalt

[17:20](#msg592efb41fcbbe1891c631ac6):smile:

[17:24](#msg592efc5ecb83ba6a41198b6c)@dockimbel Are there currently undocumented hooks for the stack in Red, or are they to be implemented for the next release?

greggirwin

[17:27](#msg592efd0e631b8e4e612fc89c)https://github.com/red/red/wiki/Primer

dockimbel

[17:29](#msg592efd6438b37b982842cf49)@gltewalt You mean the Red evaluation stack? What kind of hooks are you thinking about?

[17:29](#msg592efd920ba4d59763fbece8)@greggirwin Thanks for starting it!

gltewalt

[17:35](#msg592efedb0a783b6c0af30708)@dockimbel Yes, the evaluation stack. Having handles to retrieve stack information.  
It's probably necessary for writing Trace or Debug utilities, isn't it?

toomasv

[17:52](#msg592f02ce3aeff8a61f62d7e9)For noobies (like me) `old-falsey?: func [val][either to-logic val [parse to-string val ["0" | ""]][true]]`

dockimbel

[17:54](#msg592f035cfa63ba2f769b7fd4)@gltewalt We have such hooks in our plans, though probably not in the current release, maybe the next one.

gltewalt

[19:16](#msg592f168c0a783b6c0af37fcb)Is there a better way to say this? And is it worth putting into a Primer?

```
To create a function that returns unset! instead of 
a traditional return value, use exit.

>> example: func [value] [value]
== func [value][value]
>> example "value"
== "value"
>> example: func [value] [value exit]
== func [value][value exit]
>> example "value"
>>
>> type? example "value"
== unset!
>>
```

rebolek

[19:20](#msg592f177cf3001cd34279aa1b)@gltewalt I think you said it right, but I don't think it's worth putting there. Do people really need functions that return `unset!` that much? IMO it's easier to ignore returned value than make functions return `unset!`.

gltewalt

[19:21](#msg592f17cdcb83ba6a411a170e)Ok

[19:22](#msg592f17ebfcbbe1891c63b437)Maybe a section on `unset!` in general, and why it exists?

rebolek

[19:22](#msg592f17fd5e34568d5ead6b1e)Yes, that makes sense.

## Thursday 1st June, 2017

dockimbel

[02:19](#msg592f79a33aeff8a61f64b9d7)@gltewalt Redbol languages are based on denotational semantics, where the meaning of every expression needs to have a representation in the language itself. Every expression needs to return a value. Without `unset!` there would be a hole in the language, several fundamental semantic rules would be collapsing, e.g. `reduce [1 print ""] => [1]` (reducing 2 expressions would return 1 expression).

endo64

[08:03](#msg592fca6838b37b982845faa6)About logic!, most new comers expect `to logic! 0` and `to logic! ""` is `false` as in most language (ex. PHP)

```
(bool) 'x'; // true
(bool) '';  // false
(bool) 3;   // true
(bool) 0;   // false
```

dockimbel

[08:05](#msg592fcadd5e34568d5eb02ee9)@endo64

```
>> to logic! 0
== true
>> make logic! 0
== false
```

endo64

[08:11](#msg592fcc17fa63ba2f769e883e)@dockimbel I didn't know that! That's another difference with R2 (R3 is same with Red, sorry R2 is still my main language)

```
R2> make logic! 0
== false
R2> to logic! 0
== false
```

dockimbel

[08:11](#msg592fcc1f5e34568d5eb035af)"Most languages" are so different than Redbol, that such comparison is quite pointless. What makes sense in one language probably doesn't in another. Many of mainstream languages, are by default, just copying C semantics, which is a bad idea if the language is higher-level.

endo64

[08:12](#msg592fcc5ecb83ba6a411cc79b)I definitely agreed on that.

gltewalt

[19:13](#msg59306771142826e97273b29f)People reach for comparisons. Many languages are written in C so I can see how C semantics would leak over to the new language

## Friday 2nd June, 2017

9214

[10:50](#msg593142fe6462d8493cd22acd)* Any ETA on concurrency support in Red?  
\* Is it possible (or will be possible) to call SIMD instructions from R/S? Or work directly with `xmm[0-7]` registers (currently this feature limited to IA32)?  
\* Aside from concurrency and data level parallelism, how can I exploit multi-channel commands (i.e. how can I make RAM bus very busy) in Red or R/S? Maybe `system/fpu` and floating-point bit diddling will do?  
\* In R/S, `print system/fpu/type` returns `1`, honestly I don't know how to interpret it :( (see \[R/S specs](http://static.red-lang.org/red-system-specs.html#section-13.10)). Does it mean x87 FPU or SSE?

[11:04](#msg5931462b7503e2b706036752)Aha, Trello says concurrency is planed for `0.9.0`

meijeru

[15:14](#msg593180dbca6d4ae80cd53d74)@9214: see in the sources `%system/runtime/system.reds` for your last question

9214

[16:11](#msg59318e19f2dd2dba06620e90)@meijeru thanks!

dockimbel

[16:40](#msg5931951402c480e672070ee7)@9214  
\* SIMD: we certainly want it, might happen in a 0.9.x version, or post 1.0. Direct access to XMM registers will be possible, though you'll have specific R/S types to abstract SIMD operations.  
\* Multi-channel: no plans for that before 1.0 (not sure what are the `multi-channel commands` you're referring to).  
\* Search in the source code, definitions are there (we should probably replace it with an #enum): https://github.com/red/red/blob/master/system/runtime/system.reds#L14. Currently Red relies only on the x87 FPU, SSE is not yet used for general floats support, though such support should happen before 1.0.

9214

[16:54](#msg5931982e6462d8493cd3d02a)@dockimbel thanks Nenad!

By "multi-channel" I meant instructions which use multiple processing units at once (frankly I'm not completely sure what I'm talking about :D guh, noobiness). I think in real worlds it's called parallelism ;) Perhaps what I want in my case is something that can be considered "costly" operation which fully loads primary system bus and avoids caching mechanism, like SIMD `MOVNTDQ` instruction.

About codebase: are there any tips for newcomers on how to navigate it? Sometimes I know that my answer is in the sources (like with `fpu/type` above), but I'm not sure where to find it :(

dockimbel

[17:01](#msg593199d07503e2b70604f69d)@9214 I don't remember any instruction on Intel/ARM capable of using multiple processing units at once, maybe you're thinking about hyperthreading?

[17:05](#msg59319adc6549436c7d0d77e4)Codebase: `grep` is your friend on Unix, or any equivalent feature in your Code editor. I have a "Find in files" feature (&lt;=&gt; `grep`) in my main code editor, which I use dozens of time everyday to navigate through the source code.

[17:09](#msg59319bae167d046a7d612615)`make RAM bus very busy` should be achieved by any tight loop intensively reading/writing 32-bit values in memory (until we get 64-bit support). Such operations will go through the caches, there is no specific cache control instructions emitted by the compiler. Such optimizations are planned for 2.0.

9214

[17:10](#msg59319bed02c480e672072c4f)@dockimbel you're right, excuse me my newbiness, it's "multiple memory channels", not "multiple processing units". I just need CPU to write really huge chunks of bytes into RAM and keep RAM bus busy (that's what SIMD and parallelism can do, correct?). Though it could be much easier for me to leave \[this](https://www.usenix.org/system/files/conference/usenixsecurity15/sec15-paper-guri-update.pdf) for you as a weekend reading (ch. 5 specifically) ;)

dockimbel

[17:12](#msg59319c99eb257a8725d0bdba)Looking at the front page of that paper... :-) For ch.5, you can't do that with R/S only for now, though you can code it in an assembler and include the resulting binary inside a R/S function (though I may have removed such option since early days of R/S...).

9214

[17:17](#msg59319d9b6462d8493cd3ead0)You haven't seen the one which shows two PC communicating with each over via "thermal pings" from their heated system units ;)

[17:18](#msg59319df7f2dd2dba06625e7a)graduate diploma with tin foil hats, you know

[17:20](#msg59319e5ef2dd2dba06626062)@dockimbel yeah, I thought about that, but, as I understand, it's very platform-dependent

dockimbel

[17:22](#msg59319ecbca6d4ae80cd5cdee)It's always amazing to see what people can achieve by leveraging electromagnetic emissions of PCs. ;-) I read an article a few weeks ago about a technic for guessing digits typed on a smartphone, by using machine learning on the accelerometer data recorded while typing. ;-)

9214

[17:24](#msg59319f54e531dbc905a4aca8)There's an excellent \[series of papers](https://arxiv.org/find/all/1/all:+Guri/0/1/0/all/0/1) about such stuff from Ben Gurion University

greggirwin

[17:35](#msg5931a1e16462d8493cd3fda9)&gt; you can code it in an assembler and include the resulting binary inside a R/S function

I never knew that was possible! I learn new things every day.

pekr

[17:40](#msg5931a2fc7503e2b706052527)I do remember only old tricks, Commodore 64 floppy drives, made some sounds reading/writing the data, so guys made it to make some mellody ...

9214

[17:50](#msg5931a560e531dbc905a4c75c)@greggirwin even the mighty shall fall... ;)

[18:07](#msg5931a955142826e97278dabb)btw, R/S turned out to be not that scary as I thought, even simplier than C.

greggirwin

[18:53](#msg5931b4156549436c7d0de272)I should have known it was possible. Including ASM in QB was one of my favorite features in a "toy" language. PowerBASIC went even further. Sad that it seems to have stalled since Bob Zale passed away.

michaelcmccann\_twitter

[21:50](#msg5931ddb66462d8493cd50c71)Hello, I'm new to Red, but have been using REBOL awhile. A relations engine I use that runs in R2 core won't run in Red. I'm wondering if one of you could take a look at the code, at the link below, and suggest changes to make it work. Thanks! https://web.archive.org/web/20090629061029/http://www.hmkdesign.dk/rebol/relationsengine/relations.r Here's a doc that explains how the relations engine works: https://web.archive.org/web/20090915173011/http://hmkdesign.dk:80/rebol/relationsengine/relations.txt

taisantt

[22:05](#msg5931e113167d046a7d6254ab)Hello I'm a french one

[22:05](#msg5931e12e02c480e6720853c2)my english may be will be no perfect

[22:06](#msg5931e16a6462d8493cd51a0c)i follow rebol and red also for a time

[22:06](#msg5931e17de531dbc905a5cc98)and as the world of programming is !

[22:07](#msg5931e1b1ca6d4ae80cd6e2e7)I always waiting thing concerning the web, mobile etc ...

[22:08](#msg5931e1c3167d046a7d625792)did we have a progress about that ?

[22:10](#msg5931e24a6462d8493cd51d40)I steel have a hope of one language, but just only one for multidevice, but also for multi level(net,hardware,soft,apps)

[22:10](#msg5931e256167d046a7d625921)are there a reflexion about that ?

[22:10](#msg5931e26a02c480e6720858f5)or all ready a solution

greggirwin

[22:17](#msg5931e3e7142826e97279dd8e)@michaelcmccann\_twitter, will scan shortly.

@taisantt you may try https://gitter.im/red/red/France, but of course you're welcome here too. :^) Red is the solution you're asking about. If you visit https://github.com/red/red, the readme will tell you quite a bit, and https://github.com/red/red/wiki has links to more resources.

[22:17](#msg5931e40f31f589c64f6c1706)@michaelcmccann\_twitter, if you can say exactly what problem you're encountering, that would help.

[22:18](#msg5931e443f31c8ced0cfa0f17)There's a bit going on in there, so I can't tell at a glance what it might be.

[22:20](#msg5931e49c02c480e6720860e1)I don't know if Henrik is in this room, but he would know faster than anyone, as it's based on his code.

pchg

[22:21](#msg5931e4e86462d8493cd52566)Bonsoir @taisantt !

[22:22](#msg5931e52b7503e2b706063a20)Hello everybody! I've been out for a long while, just got back from Africa. And still Rebolling. Redding a bit.

greggirwin

[22:22](#msg5931e53d167d046a7d62639b)Welcome back!

pchg

[22:23](#msg5931e545142826e97279e312)Thanks!

greggirwin

[22:23](#msg5931e55102c480e67208633c)You may have a lot of catching up to do. Team Red has been busy.

pchg

[22:23](#msg5931e560cf9c13503c4a6723)Excellent!

[22:24](#msg5931e583f31c8ced0cfa13d8)@taisantt "are there a reflexion about that" =&gt; oh yes!

[22:24](#msg5931e5b4e531dbc905a5dbe5)@taisantt "all ready a solution" =&gt; well, I use Rebol 2 to my greatest pleasure on a daily basis. I wish I could switch ASAP to an open-source solution, Red.

[22:25](#msg5931e5c3167d046a7d62652a)@greggirwin so, what are the news, in a nutshell?

[22:26](#msg5931e618e531dbc905a5dd9e)Is Red now included in all GNU/Linux distros, all Mac machines, and Windows OSs? Is Red now powering half of the Internet?

greggirwin

[22:26](#msg5931e62b6462d8493cd529a0)Maybe easiest to hit http://www.red-lang.org/ and scan for topics. Macros, libRed, Mac GUI, reactive GUI system, more...

pchg

[22:28](#msg5931e683cf9c13503c4a6b7c)Yes, I've read some news from the Red site, once in a while. Actually, I didn't quite get what the fuss concerning macros was all about: after all, in Rebol (and all these languages), a piece of code inside \[] can be thought of as a macro, no?

greggirwin

[22:28](#msg5931e685142826e97279e714)Red is still alpha, so only places where someone has helped get it there. I think @dander did a Chocolatey setup, @gltewalt did a Cloud9 install, and @qtxie did a VSCode plugin. MacGUI is new, pending official release.

[22:29](#msg5931e6db6462d8493cd52d42)Macros help at compile and load time. Rebol never compiled, so it wasn't an option to handle things then. One great use, though, is pre-processing things you want to load.

pchg

[22:30](#msg5931e6ecf31c8ced0cfa1847)Chocolatey =&gt; is this a package manager? I thought that Red was going to be as simple as Rebol was: just one executable, no need for a package or anything? Maybe I'm wrong.

greggirwin

[22:30](#msg5931e70002c480e672086a0d)The big difference is that Red's macros can operate on Red values, not just text.

pchg

[22:30](#msg5931e71c6462d8493cd52dbd)Hm. I must try these macros.

[22:31](#msg5931e72d142826e97279e9c7)Thanks, you convinced me!

greggirwin

[22:31](#msg5931e75d142826e97279ea4f)Red is still easy as can be, yes. But from a business perspective, they need to get it visible in as many places as possible. Makes it look respectable or something. ;^)

[22:33](#msg5931e7d0f2dd2dba066393b4)A small example: https://github.com/red/red/wiki/Guru-Meditations#modifying-data-before-loading-it-lisp-reader-macros

michaelcmccann\_twitter

[22:39](#msg5931e91c6462d8493cd5337c)Thanks, Gregg! It is, in fact, Henrik's code, or rather, a link to an archive of it. I have added to it elsewhere, but wanted to get his version running before adding in my own complications. There seem to be numerous syntactical problems, beginning with "Syntax Error: invalid integer! at "2006-01-31 Date: 2006-02-02 Version." Each error I fix breeds a new one, eventually exceeding my comprehension. It may well take Henrik's eyes to make it work, given it's complexity. Thanks again.

greggirwin

[22:42](#msg5931e9d431f589c64f6c2902)Red doesn't have dates yet, so that's one roadblock.

[22:43](#msg5931e9f931f589c64f6c295a)If they're just in the header, comment them out or make them strings for now.

michaelcmccann\_twitter

[22:45](#msg5931ea7ef31c8ced0cfa22d7)I commented out as many errors as I could, but eventually the incompatibilities become too numerous and complex for me to follow. I need to dig into Red more, but the documentation still seems a bit scant. Very promising for what it does so far, though.

pchg

[22:45](#msg5931ea94ca6d4ae80cd701f4)@greggirwin This example (https://github.com/red/red/wiki/Guru-Meditations#modifying-data-before-loading-it-lisp-reader-macros ) makes me thing a lot of Frebol or Fred! It is just a very simple mapping of words to allow my kids (who don't speak English) to be able to program. Funny!

greggirwin

[22:45](#msg5931ea9c167d046a7d627280)That said, you will probably need to take some time to learn a bit about Red, and what is different.

[22:46](#msg5931eab66549436c7d0ebefe)We do still point people to Rebol docs for the basics, but the deeper stuff needs to get there for Red.

michaelcmccann\_twitter

[22:46](#msg5931ead8ca6d4ae80cd70262)@greggirwin Yes, that is for sure. I'm pretty comfortable with Rebol, though there's always more to learn.

greggirwin

[22:47](#msg5931eaf8ca6d4ae80cd702e8)@pchg, it has a lot of potential, though we can still do most anything with `parse` at runtime. It just opens up a lot of new possibilities.

pchg

[22:47](#msg5931eafaca6d4ae80cd702eb)True. From time to time, I try to stuff some Rebol code into Red console, and I'm most often deceived. The fact, as you say, that documentation questions are usually pointed to Rebol 2 documentation doesn't help much.

greggirwin

[22:48](#msg5931eb24142826e97279f859)We have a pretty active group here, and often pull from chat into wikis for later reference. So ask away when you hit a snag.

pchg

[22:48](#msg5931eb43cf9c13503c4a7a95)Well, the thing is, I'm very often off the Internet. Difficult to make phone calls from the Sahara.

greggirwin

[22:48](#msg5931eb477503e2b706064ded)There will be a big doc push a few releases down the road.

[22:49](#msg5931eb6131f589c64f6c2c79)We've just improved `help`, but it may still not be enough. ;^)

pchg

[22:49](#msg5931eb74f2dd2dba06639ec6)Last time I ran into such a deception, I just realised that \*for* was not implemented... And dockimbel didn't seem too excited about implementing for...

greggirwin

[22:49](#msg5931eb826549436c7d0ec161)Can you write them in the sand, and then send a link to a satellite photo? :^)

pchg

[22:49](#msg5931eb8de531dbc905a5eec0)Sure!

greggirwin

[22:50](#msg5931eba26462d8493cd53a55)`For` may come, but likely not be Rebol compatible in the interface to it.

pchg

[22:50](#msg5931eba96462d8493cd53a59)I'm more often on reg than in sand, though. Gotta learn how to make geoglyphs in Red.

greggirwin

[22:51](#msg5931ebeeca6d4ae80cd706c4)Just write a dialect to control a rock-carving robot, and zoom out.

pchg

[22:52](#msg5931ec1b167d046a7d627811)As the source is available for \*for* in Rebol 2 (source for), I was wondering if there were some copyright or other similar issues, if one would take such code and get it into Red directly. Any idea?

[22:52](#msg5931ec43ca6d4ae80cd707a2)Otherwise, it would be more interesting, albeit a bit longer, to dive into the code, understand it, and rewrite it differently from scratch. No copy-paste, just mind.

greggirwin

[22:53](#msg5931ec547503e2b7060651a7)We try not to do that, though it's hard to change one-liners much. The problem with `for` in R2 is that it's not very efficient, or flexible, or predictable in its behavior.

pchg

[22:53](#msg5931ec8002c480e672087af5)Oups. I use it very often... Probably a bad habit that I got from the time when I programmed on a ZX81.

[22:54](#msg5931ec95e531dbc905a5f1fc)I would just fire up the machine, and, without even thinking, begin to type:

greggirwin

[22:54](#msg5931eca1142826e97279fbf9)We have https://github.com/red/red/wiki/REP-0101---For-loop-function as a source of discussion, but then Nenad wrote a macro, just for fun, which is probably even better than my version.

pchg

[22:54](#msg5931eca5167d046a7d6279af)FOR I = 1 TO

[22:54](#msg5931ecace531dbc905a5f262)And after, inspiration would come...

greggirwin

[22:55](#msg5931eccbcf9c13503c4a801b)You can certainly paste it into your own code to make things easier right now.

[22:55](#msg5931ece2e531dbc905a5f2c9)It may need a tweak or two. Don't know.

michaelcmccann\_twitter

[22:55](#msg5931ece7ca6d4ae80cd7091b)@greggirwin Here is an example of a code incompatibility problem that currently eludes me: " /local flag point parent-point p d"

greggirwin

[22:56](#msg5931ed2231f589c64f6c3282)Eludes me to, just from that. :^) What is the error?

michaelcmccann\_twitter

[22:56](#msg5931ed38e531dbc905a5f42b)== func [  
block \[block!] value  
/local flag point parent-poin...

pchg

[22:57](#msg5931ed4e02c480e672087d9f)Yes, many tweaks are necessary... I tried...

greggirwin

[22:57](#msg5931ed53142826e97279fe2b)Use 3 backticks on their own line to start and end code blocks.

michaelcmccann\_twitter

[22:57](#msg5931ed5b31f589c64f6c3355)Thanks.

greggirwin

[22:57](#msg5931ed60e531dbc905a5f4b4)ctrl+shift+M to see help.

michaelcmccann\_twitter

[22:58](#msg5931ed9dcf9c13503c4a822b)OK, will do.

[22:59](#msg5931edbee531dbc905a5f697)

```
== func [
    block [block!] value 
    /local flag point parent-poin...
```

greggirwin

[23:02](#msg5931ee826462d8493cd54211)`/local` works the same in Red as in Rebol, so it should be fine. You may need to start small and test one piece at a time.

[23:03](#msg5931eead142826e9727a03e2)I have to run, but will check back tomorrow.

michaelcmccann\_twitter

[23:04](#msg5931eee6cf9c13503c4a8795)Thanks again, Gregg.

dander

[23:23](#msg5931f376ca6d4ae80cd71d1b)@pchg The Chocolatey package isn't really much of a package. It just downloads the latest stable red.exe from the website and puts it in your `path` for you. Saves a few clicks maybe. There is also a similar package manager for \[Scoop](https://github.com/red/scoop-bucket), which is convenient because it can target the latest automated build and doesn't need to elevate. I didn't do that one

## Sunday 4th June, 2017

nd9600

[14:55](#msg59341f6cf2dd2dba066aa9a0)Hi!  
I ran into a bit of a problem with loops in Red recently

[14:57](#msg59341fede531dbc905acef81)`wait` doesn't seem to work properly with `print` inside a loop

[14:58](#msg59342002f2dd2dba066aab83)`i: 0 while [lesser? i 10] [wait 1 print i i: add i 1]` waits for 10 seconds, and then prints all 10 values

[14:58](#msg5934200b02c480e6720f4fb1)rather than waiting a second each time

[14:59](#msg593420396462d8493cdc3cba)Also, I've found that input or output doesn't seem to work if a loop doesn't terminate, either

[14:59](#msg5934203ef2dd2dba066aac34)Is that by design?

[15:00](#msg5934207c7503e2b7060d5224)`forever [ print "hello" break]` prints "hello" once,  
but `forever [ print "hello"]` doesn't do anything at all

[15:00](#msg5934208bcf9c13503c519db2)I'd expect it to print out "hello" forever, but it doesn't

[15:01](#msg593420af02c480e6720f5153)I can't quit the GUI console either - it has to be killed  
This is on Windows

9214

[15:01](#msg593420d1142826e97280f0b6)@nd9600 https://github.com/red/red/issues/2627

nd9600

[15:02](#msg593420eb6462d8493cdc3f88)thanks @9214

[15:04](#msg5934219bcf9c13503c51a1f6)the 2nd issue matters for me because I'm writing a subleq interpreter (just for fun), and the code  
`3 4 6 7 7 7 0 0 0`  
in a language like Python would continually jump between the first and third lines, but in Red, it doesn't print anything at all

[15:05](#msg593421cd31f589c64f7354ef)that should be

```
3 4 6
7 7 7
0 0 0
```

[15:06](#msg593421e2167d046a7d6967b4)Rebol2 behaves like I expected

ghost~5680c5f416b6c7089cc058a5

[15:08](#msg59342287e531dbc905acfa30)You can use the code in red cli console till the issue is fixed for the gui console

[15:09](#msg5934229c142826e97280f6f0)Start the cli console from command prompt with `red --cli`

nd9600

[15:09](#msg593422af6549436c7d15c5e3)Yeah the 2nd issue does't exist in the CLI console

[15:09](#msg593422b131f589c64f7358a5)Thanks

[15:09](#msg593422b7f31c8ced0c01466e)Just in the GUI

[15:16](#msg59342441167d046a7d697045)hmm now my scripts close as soon as they finish running, so I can't see the input

ghost~5680c5f416b6c7089cc058a5

[15:18](#msg593424c17503e2b7060d62d6)Are you compiling your script and running the executable by double clicking?

[15:19](#msg593424f6cf9c13503c51ad6d)Add `wait 10` (or any other value) in the end so then the executable will wait for some time and you will be able to see the result.

nd9600

[15:19](#msg59342500cf9c13503c51ad70)No, just with a .bat script like  
`red-062.exe --cli "%1"`  
I'll have it fixed in a sec

ghost~5680c5f416b6c7089cc058a5

[15:20](#msg59342521142826e972810051)Still `wait` should do the trick.

nd9600

[15:38](#msg5934298a6462d8493cdc5df7)Is there a way to get the CLI console to return to the console after running a script, like the GUI does?

[16:12](#msg593431746549436c7d160052)Is there a reason why the action! `and~` must be written with a `~`?

[16:12](#msg593431847503e2b7060d9248)In Rebol , it's just `and value1 value2`

toomasv

[16:16](#msg5934324a167d046a7d69a6a9) @nd9600 Because in Red there is op! `and`

```
>> and~ true true
== true
>> true and true
== true
```

nd9600

[16:17](#msg5934328dcf9c13503c51e506)So it needs the `~` to distinguish it?

[16:17](#msg5934329e6462d8493cdc7fe2)I wonder how Rebol manages with both

toomasv

[16:21](#msg593433966462d8493cdc831e)My old Rebol shows

```
REBOL/View 2.7.6.3.1 14-Mar-2008
Copyright 2000-2008 REBOL Technologies.  All rights reserved.
REBOL is a trademark of REBOL Technologies. WWW.REBOL.COM
>> ? and
USAGE:
    value1 AND value2

...
>> ? and~
USAGE:
    AND~ value1 value2
...
```

nd9600

[16:22](#msg593433b5f2dd2dba066af477)yet `and true false` works

[16:22](#msg593433c131f589c64f73948e)in place of `true and false`

ghost~5680c5f416b6c7089cc058a5

[16:25](#msg59343468cf9c13503c51ead5)&gt; Is there a way to get the CLI console to return to the console after running a script, like the GUI does?

[16:25](#msg59343478142826e972813a18)Maybe `halt`. I am not sure though.

[16:28](#msg59343520e531dbc905ad4191)What is the advantage to `and value1 value2` over `value1 and value2`? IMHO only one way should be supported. Too many ways to do a thing hinders readability.

nd9600

[16:29](#msg5934354e02c480e6720f9e99)There's a similar thing with `add value1 value2` over `value1 + value2`

[16:30](#msg593435936549436c7d16111a)I found that something like `a: [] length? a + 1` doesn't work, but `a: [] add length? a 1` does

[16:31](#msg593435cee531dbc905ad44ba)I suppose there's the advantage

ghost~5680c5f416b6c7089cc058a5

[16:32](#msg5934360cca6d4ae80cde5f6b)In that case `value1 and value2` should be replaced with `value1 & value2`. Adding a few more symbols to the language can do no harm i guess? In my case, well i do prefer these symbols to writing the whole word.

[16:32](#msg5934363a6549436c7d16142e)&gt; I found that something like `a: [] length? a + 1` doesn't work, but `a: [] add length? a 1` does

[16:33](#msg5934365e31f589c64f739ea1)I am not on PC, but i suppose that could be due to precedence rules?

nd9600

[16:33](#msg59343668e531dbc905ad478b)Yeah, I think it was

9214

[18:34](#msg5934529f167d046a7d6a1952)`a + 1` is an `integer!`, not a `series!`, you can't get `length` from it

[18:36](#msg59345325142826e97281ac94)@nd9600

```
>> a: [] (length? a) + 1
== 1
```

[18:44](#msg59345526e531dbc905adbcc6)I think `and~` is suitable for ANDing results of very long expressions

```
Red []

print 13 and 37

print and~
		10 * 2 - (3 * 2 + 1) + 100 - 100 * 1'000'000 / 1'000'000
		50 - 13 + 1'000'000'000 - 1'000'000'000 * 1 / 1
```

greggirwin

[18:52](#msg593457017503e2b7060e19b1)`Any` and `all` are more idiomatic in Red, though `and` and `or` work fine for 2 args of course. They are less clear in prefix form though.

The strict left-&gt;right evaluation does mean you sometimes need to arrange things differently, or use parens.

&gt; Adding a few more symbols to the language can do no harm i guess?

On the contrary, lexical space is \*very* tight in Red, because of the large number of literal forms.

[18:53](#msg5934572e31f589c64f741303)Not that we can't do it, just that we have to consider them carefully.

9214

[18:53](#msg59345741f2dd2dba066b6ee0)DIY approach: `&: :and`

Scaremonger

[18:56](#msg593457e531f589c64f741629)Why did you decide to use a tilde (which means "Approximately")?

9214

[18:57](#msg5934580c31f589c64f74168b)It's the same as with `!` in datatype words - because we can!

Scaremonger

[18:59](#msg59345874f2dd2dba066b7387)Fair enough! :)

9214

[20:05](#msg59346813cf9c13503c52b0a0)@9214 realises that `a + 1` ain't an `integer!`, it's addition of `block!` and `integer!`, hence the error

greggirwin

[20:39](#msg59346ff6ca6d4ae80cdf379d)`~` as a suffix on those funcs is also a holdover from Rebol.

[20:41](#msg593470757503e2b7060e7a09)I should add that the prefix forms can be clear with some formatting and types of code.

## Monday 5th June, 2017

dockimbel

[03:07](#msg5934caddf31c8ced0c0389fd)@nd9600 Yes, using the `--cli --catch`, though it seems broken right now, looking into it...

[03:21](#msg5934ce2031f589c64f7597b7)It's fixed now:

```
C:\Dev\Red>red --cli --catch tests/hello.red
Hello, world!
Χαῖρε, κόσμε!
你好, 世界
Dobrý den světe
>>
```

nd9600

[16:47](#msg59358b30cf9c13503c56ee81)Thanks @dockimbel !

gltewalt

[20:33](#msg5935c02cf31c8ced0c079bbe)I don't remember where the `unset!` talk was at, and it seems I can't reply to the blog post, so I'll say it here:

```
Sorry to set off such ill will.
I've read that the creator of rebol took his time in putting the language together, so he must have had a reason for unset to be the way that it is. That's what I wonder about the most - the design decision.
As a relative newcomer, unset being a non-benign return value causes me to stub my toe at times.

I don't think we need to be rude to each other.
```

greggirwin

[21:14](#msg5935c9b5cf9c13503c581a28)https://github.com/red/red/wiki/Guru-Meditations#why-does-unset-exist

[21:15](#msg5935c9d8167d046a7d6fb570)Not sure what blog post you're talking about though.

gltewalt

[21:20](#msg5935cb0402c480e67215b080)'Forum post'  
I chose not to link to it, but no, not your Meditations section.

greggirwin

[21:20](#msg5935cb2602c480e67215b0dd)Just added http://www.rebol.net/r3blogs/0318.html to the wiki entry as well.

gltewalt

[21:21](#msg5935cb60cf9c13503c58211f)@rebolek will understand. Up to him if he wants the link shown.

9214

[22:46](#msg5935df4b7503e2b706140770):fork\_and\_knife: look, it's a \*fork* with a knife (wink-wink)

## Tuesday 6th June, 2017

virtualAlan

[00:39](#msg5935f9b502c480e67216638d)This is the welcome page ? - what ? newcomers will run and never come back. Come on, you must see it ?

[01:36](#msg59360713f2dd2dba0671fc25)Look, this aint rocket science.  
The novice programmer will automatically be drawn to the welcome/newcomer page. But It's what they see there that will make them decide. Will they go with Red, or not..  
So the student or the school wants to know about Red - then they look at this page, the welcome page, the newcomers page,  
As it is now, it's game over, they will move on. New programmers are different, they need to be helped and made to feel really welcome. The welcome page should be a proper welcome page. simple (very simple) and instructive. just my opinion.

gltewalt

[01:46](#msg5936097331f589c64f7ac950)Examples?

greggirwin

[02:55](#msg593619b502c480e67216cbe2)We can't guess what every visitor's background is. New here doesn't mean "new programmer" And we really have no control over the setup for a room in Gitter. It's just a chat system. I don't think we can even make sticky entries as you would in a forum. All we can hope for, IMO, is that they see "welcome" and post \*something* here, so we can meet them and direct them to specific rooms or resources. We do our best to make people feel welcome.

dockimbel

[02:56](#msg593619f2167d046a7d70d02f)@virtualAlan  
&gt; This is the welcome page ?

No, this is the welcome chat room, and newcomers arrive here by clicking an "Open Chat" button.

rebolek

[04:54](#msg5936356b142826e97288f794)@gltewalt If someone wants to write about `unset!` in Rebol-like languages and then writes about one language that is getting less and less Rebol-like, it's not very informative IMO and can be confusing for people.

michaeldesu

[07:03](#msg593653be6462d8493ce49f8b)@virtualAlan I think the title of this chat says it best "New to Red language? Ask any question about it here" - it's to pose questions not to really get an overview. The red-lang.org site gives a good overview, plus gives the handy link to this chat page. As a rank newbie myself, I personally found the approach really refreshing and welcoming - i.e. arrive at the site, get the overview and see the 'Open chat ' button to ask your newbie questions. The community here is really great, and has contributed to me sticking with it.

meowy

[09:34](#msg593677196549436c7d1e9b80)Yo. Does Red have something to make HTTP requests with that's slightly more comprehensive than what read offers? Because I need to pass headers.

9214

[09:37](#msg593677c6f2dd2dba067394ea)@meowy full-blown I/O support is planned for `0.7.0`, though I saw something about making requests from @rebolek, can't remember exact details

[09:39](#msg5936785df2dd2dba06739775)@meowy :point\_up: \[7 апреля 2017 г., 18:19](https://gitter.im/red/red?at=58e791fc8e4b63533da644cd) how about that?

dockimbel

[09:41](#msg593678d76549436c7d1ea553)@meowy Use `write/info` and pass a `GET` method + headers, as shown by @9214's link.

meowy

[09:47](#msg59367a4b6462d8493ce54b5c)@dockimbel @9214 Thanks!

rupipal

[12:03](#msg59369a1be531dbc905b6b9e4)hello. installing the nativeexe apk on Android is one option. I'll try that. I have earlier tried to install Red in GNURoot Debian (app available in PlayStore), but I don't get execute permissions. chmod doesn't work in fakeroot. What is workaround to install in this debiam fakeroot? suggestions pls

[12:10](#msg59369ba4e531dbc905b6c1ec)processor arm

[12:11](#msg59369c09e531dbc905b6c3a4)GNURoot Debian is fakeroot, But it is good.

[12:36](#msg5936a1d3167d046a7d72f71a)2ndly. About the language design and roadmap itself. Is object-orientation a major goal. I saw it documented, of course. In other words, I mean, we could set scalability or managing complexity of large programs a goal in roadmap . seed7 is another extensible programming language. We may want learn from it.

CodeTortoise

[14:58](#msg5936c311142826e9728b865c)Hello. I got really excited about the Red language awhile back ago, and was getting my fingers whet by going through Rebol 2 tutorials. Since then I got distracted by other things, such as Smalltalk/Pharo, Self, Racket. Still, Red is on my mind as as language I want to keep my brain on. The problem is, I have abandoned Windows, losing half of what makes Red powerful and interesting, at least as far as the tutorials make it seem.

9214

[14:59](#msg5936c346e531dbc905b787e3)@CodeTortoise Hey, as far as I know Red works just fine under Wine

CodeTortoise

[14:59](#msg5936c3496462d8493ce6bb88)My question is, how much of the Red language is ported to Linux, minus of course the GUI aspects of it, I guess VID \[I know that is the Rebol term]?

rebolek

[14:59](#msg5936c3667503e2b70617ba98)@CodeTortoise Hi, glad you like Red! Minus the GUI, Red on Linux is same as on Windows.

CodeTortoise

[14:59](#msg5936c366167d046a7d73a4f6)Hm, I may try that.

9214

[14:59](#msg5936c36a7503e2b70617bac2)@CodeTortoise everything except GTK backend

[15:02](#msg5936c40b31f589c64f7df6c9)speaking of which, I don't see GTK in Trello milestones, is it low priority?

CodeTortoise

[15:02](#msg5936c414f31c8ced0c0bce39)Ah, neato. I kind of miss it. I keep coming in and out of CS stuff because I just can't get too interested in a lot the language and frameworks that exist. I have given up on caring about the likes of Python, C\[++,#]/Java, and go straight to the interesting languages and ideas, such as Nim, Rust, Clojure... Fun stuff.

rebolek

[15:03](#msg5936c4446549436c7d201517)@9214 Yes, it is.

[15:04](#msg5936c47fe531dbc905b790f2)The current GTK stuff was done by contributor, if anybody's willing to pick up where he stopped, it would be great of course.

CodeTortoise

[15:05](#msg5936c4d2167d046a7d73aad9)Alright on Linux I get Red to compile and can go in and out of the console. Yet, when I try calling Red from any other directory, I get =&gt; PROGRAM ERROR: Invalid encapsulated data.

[15:06](#msg5936c4f8f31c8ced0c0bd275)I put the red file in /usr/bin, so it is in PATH

9214

[15:07](#msg5936c52102c480e67219b315)@CodeTortoise try `red --cli`?

CodeTortoise

[15:08](#msg5936c5536462d8493ce6c753)Same thing. Maybe I can just symlink it. I like to keep things I install on my own separate from how the package manager deals with things anyways.

9214

[15:08](#msg5936c56b31f589c64f7dff48)ah, wait a sec

[15:08](#msg5936c577ca6d4ae80ce8a8a8)&gt; Note: Running the Red toolchain binary from a $PATH currently requires a wrapping shell script (see relevant tickets: #543 and #1547.

CodeTortoise

[15:09](#msg5936c5ad167d046a7d73afe3)Ah, I too use Fish

[15:10](#msg5936c5cd6549436c7d201cc8)Eh, I can just launch it with bash

9214

[15:22](#msg5936c89b31f589c64f7e0e87)@CodeTortoise  
\[!\[img.png](https://files.gitter.im/red/red/welcome/9pbI/thumb/\_\_\_\_\_\_\_\_\_\_\_.png)](https://files.gitter.im/red/red/welcome/9pbI/\_\_\_\_\_\_\_\_\_\_\_.png)  
;)

rebolek

[15:22](#msg5936c8b4e531dbc905b7a847):)

9214

[15:23](#msg5936c8db6549436c7d202d0d)AFAIK Self OO model also inspired Redbol

[15:23](#msg5936c8eb167d046a7d73c1f1)all roads leads to Rome :D

CodeTortoise

[15:42](#msg5936cd50167d046a7d73d9d0)@9214 Love it. A fantastic set of languages come together to inspire Red.

greggirwin

[16:54](#msg5936de4f142826e9728c127d)@rupipal, OO is in Red today, and probably won't change much. It's prototype based, rather than class based. We'll also get modules and there will be more tools for PitL as time goes on.

If you know seed7 (or for anyone saying we can learn from other langs), it helps if you can be specific. Team Red is small, and doesn't have the luxury to learn every other language to see what makes them special. People who have that knowledge can help by sharing it. It's unlikely that Red will change its fundamental design and principles, because those are vetted and sound. But knowing what people like about other tools, and showing how Red relates to them, is always good.

9214

[17:59](#msg5936ed85cf9c13503c5d0237)Anyone thought about how we gonna call packages in Red? There're `crates` in Rust, `shards` in Crystal, `gems` in Ruby, etc

Oldes

[18:22](#msg5936f2e7e531dbc905b882f2)We can call it `ruby` in Red :)

greggirwin

[18:25](#msg5936f3a66549436c7d2100a5)How about... `packages`?

9214

[18:26](#msg5936f3d8ca6d4ae80ce9a3ff)@greggirwin that's too boring!

greggirwin

[18:29](#msg5936f4a3f2dd2dba06760e8f)As one who loves wordplay and clever names (See: Ren), there are times when boring is best. From the names, can you tell what Grunt or Bower do? How about the zillion other things with clever names? I'm all for a clever name if it has value and adds meaning. Docker is a funny name, but Container is a great name in its context.

[18:30](#msg5936f4dc6462d8493ce7bf3d)When you come up with a clever name, remember the package manager and build system need to reference it as well, and they need \*their* own names. Naming is hard.

[18:35](#msg5936f5eacf9c13503c5d3321)Of course, RedHat has already taken RPM. If it weren't for possible confusion, I would suggest that. Straight-ahead acronym, but also the meaning of speed.

[18:37](#msg5936f678ca6d4ae80ce9b075)At one time, I thought it would be fun to call Red/System `Infra/Red`, but I think Nenad made the right call. It says exactly what it is. Plus, it leaves `Infra` open for an IaaS offering. :^)

9214

[18:48](#msg5936f8fae531dbc905b8a2fd)@greggirwin :point\_up: \[20 марта 2017 г., 10:48](https://gitter.im/red/red?at=58cf6d462215a08f04a4aad8) hummingbird (package manager) and pollen (packages) :D

[18:54](#msg5936fa52167d046a7d74c38d)we could call it \[Helena](https://en.wikipedia.org/wiki/Bee\_hummingbird), and look at all these beautiful \[pollen grains](http://www.slate.com/blogs/the\_vault/2015/05/08/pollen\_scientific\_history\_carl\_julius\_fritzsche\_s\_portraits\_of\_pollen\_grains.html) :bird:

[18:56](#msg5936fac4f2dd2dba06762cc1)\[this](https://en.wikipedia.org/wiki/Hemaris) guy is nice too

iArnold

[19:10](#msg5936fe226549436c7d213682)I like Container. Can, tank, drum, holder. Locker, barn (for a big one).

[19:11](#msg5936fe5e02c480e6721ae2aa)RPM is fine too, noone remembers RedHat anyway.

meowy

[21:51](#msg593723eef31c8ced0c0db824)@greggirwin The good thing about unique names like that is searchability - they don't even need to make sense, that's just a bonus. But if the term's unique enough, it makes it far more likely to actually find what you're looking for when you're searching it on Google.

geekyi

[21:52](#msg59372435f31c8ced0c0db8db)Ooh packaging! Something I've been thinking about a lot lately. Mostly because it's what I'm missing the most in Red. I have the basic design in my head, and I think I can begin on a prototype

[21:54](#msg5937247a6549436c7d21ef05)It would mostly be an interim solution till we have a real system, because I badly need a way to organize and search for code

meowy

[21:54](#msg59372490142826e9728d7c5a)If I search for "grunt", I'm not gonna get wrestling videos or military stuff, I'm gonna get the frontend tool. Doubly so if Google knows I have an interest in software.

geekyi

[21:57](#msg593725396549436c7d21f127)@meowy remember that Red, python isn't actually unique enough either 😋 @greggirwin well I'd too come up with a rather boring name, something like `packager`. We can use your even more boring one too. 😜

[21:59](#msg593725d3cf9c13503c5e23d9)Anyway, the only concern I have so far is duplication of effort. I don't think I'd be stepping toes on `module`s implementation, as I have a higher level goal. And if that does get implemented, I can simply swap my code to build up on it

[22:00](#msg593725f26549436c7d21f4c9)Thoughts?

[22:01](#msg5937264b142826e9728d84d7)I'll put together a list of links for my inspiration. And maybe document my ideas in the wiki if anyone is interested

[22:03](#msg59372696142826e9728d862b)I'm also curious about how rebol.org and the librarian was built; their design in particular

greggirwin

[23:05](#msg593735486462d8493ce8ed90)@meowy, searchability is a benefit, I agree. I'm all about concrete when it comes to suggestions. If we throw things at the wall, something may stick. Or Doc may already have ideas.

@geekyi, Maxim Olivier-Adloch did the packager and design for rebol.org. He may have based it on his SLiM work, which was very nice as well. For R2 I only ever used `#include`, SLiM, and my own stuff, and did OK with those.

I have an old matrix of package systems and their metadata. `[REBOL DOAP RPM GemSpec DublinCore Qtask Maven OPML Roxy REBOL.org Packages(JS)]` It was before NPM, but that would be easy enough to add. Also a couple links to CL and Go.

\- http://www.gigamonkeys.com/book/programming-in-the-large-packages-and-symbols.html  
\- https://thenewstack.io/understanding-golang-packages/

[23:10](#msg5937364de531dbc905b9c6f7)Links and design ideas would be great @geekyi. I'm interested, and think it's good to shake out ideas over some time.

geekyi

[23:43](#msg59373e0d6462d8493ce90b43)@greggirwin I'm more interested in the search and categorization than namespaces. Namespacing would be better handled at the module level I think? My interest is at a higher level of abstraction. Such as search by type! Like hoogle and hayoo. Elm and Nix looks like the most interesting players in this area. They have functional and hashed dependecies. Then there's this, which I've not properly understood: standardML modules and how exactly they are related/useful. Nobody else looks like they are bringing any fresh ideas(or I haven't read about it recently). Not necessarily a bad thing, sticking to simple stuff that works.

[23:49](#msg59373fa36462d8493ce90f87)Should probably continue this in red/red channel

## Wednesday 7th June, 2017

gltewalt

[04:27](#msg5937809b6549436c7d231a08)Entirely depends on the mascot. :smile:

rupipal

[16:26](#msg593829277503e2b7061df3a0)@greggirwin

[16:31](#msg59382a6ce531dbc905bdcd30)I didn't imply that red team know about all languages. Rather I suggested one particular seed7, which clearly claims to be extensible programming language much as red or rebol supporting dialects

greggirwin

[16:40](#msg59382c8c6549436c7d2610ec)@rupipal, right, so \*what, exactly* should Red try to learn from Seed7? I glanced at it, and its model is quite different from Red. But I can't really learn much in a few minutes and may be missing something.

[16:42](#msg59382cdde531dbc905bdd8f0)My comment about "all" languages stems from N people each suggesting just one language. I have a long research list, and Seed7 is now on it as well.

rupipal

[18:03](#msg59383fe0f2dd2dba067b9ad7)Gregg. I simply suggested seed7 bcoz its goals overlaps that of red and also as you rightly noted. It's model is different. I simply suggested it as case study , as assistance, tip. surely not as my wishlist. With the kind of ambitious goals red has, as online docs suggest, long research list may be inevitable, IMHO. I simply gently suggested, didn't and wouldn't push it. As far as specific comparison.

[18:04](#msg59384017167d046a7d7a1c0e)I may work on it and may share as soon as possible

greggirwin

[18:14](#msg5938428ae531dbc905be4607) I understand you're not pushing, sorry if it sounded that way. It's \*great* when people suggest things that will help. What helps even \*more* is sharing their expertise and knowledge of other tools and how they might align with Red. Please do share.

geekyi

[18:14](#msg5938428fcf9c13503c630564)@rupipal Red already has object oriented features (only the best parts ;p) See `make` and `make object!`

greggirwin

[18:16](#msg593842ebf31c8ced0c12a5be)e.g., "What I love about seed7 is XXX, and here's how it helps me."

geekyi

[18:20](#msg593843f4e531dbc905be4ca6)What's the killer feature of Seed7? ;)

greggirwin

[18:23](#msg593844bf167d046a7d7a32b3)How well the name maps to the goal. "Seed" is the perfect name for a growable language. More seriously, the extensibility in defining a language at load time, perhaps. The first big difference I noted from Red, in skimming the docs, is the small number of literal forms. Ties in with the construction syntax chat in red/red.

[18:24](#msg593844f7167d046a7d7a34be)I also wonder if it uses a Pratt parser, because of the association operator and precedence definition.

## Thursday 8th June, 2017

rupipal

[13:53](#msg593956dee531dbc905c285bd)@greggirwin I hope to share. I'm coming back to look into languages after long.

[14:05](#msg593959bbca6d4ae80cf3993d)Last, I remember doing something worthwhile was writing method to construct modified GNF(greibach normal form) table-driven parser for minor university paper. GNF modified slightly to construct parser. Sometimes, with advantage of experience, one tries to give ideas intuitively.

## Friday 9th June, 2017

raton3062015

[02:12](#msg593a03f602c480e6722761f4)Neurocutaneous

## Saturday 10th June, 2017

cyclecraze\_twitter

[12:50](#msg593beb296462d8493cfb790f)Is there a comparison of how rebol and red syntax differ if at all?

rebolek

[13:12](#msg593bf03cd83c50560cf53b03)There are only minor differences. Red supports literal `map!` in form of `#(key value)` and hexadecimal numbers in form of `12ABh`. That's probably all, AFAIR.

cyclecraze\_twitter

[14:01](#msg593bfb9e31f589c64f933466)thanks

dockimbel

[14:47](#msg593c06966549436c7d34b3c0)@cyclecraze\_twitter Also, no money! and date! datatypes yet in Red.

rebolek

[15:13](#msg593c0caa02c480e6722ee8a6)I do not count is difference, because they will be implemented ;)

geekyi

[16:01](#msg593c17e56462d8493cfc1034)@cyclecraze\_twitter possibly less difference between rebol2 and red, than between rebol2 and rebol3 ;p

PeterWAWood

[23:08](#msg593c7be1cf9c13503c733ade)@cyclecraze\_twitter &gt; Is there a comparison of how rebol and red syntax differ if at all?

https://github.com/red/red/wiki/Differences-between-Red-and-Rebol

## Tuesday 13th June, 2017

cyclecraze\_twitter

[13:14](#msg593fe54eca6d4ae80c0c9dc1)That was useful, thanks.

## Wednesday 14th June, 2017

cyclecraze\_twitter

[20:54](#msg5941a28c6462d8493c1235ad)How do I buy the team lunch? Got a button for that?

greggirwin

[20:57](#msg5941a326f31c8ced0c379223)There use to be a donate button, but I can't find it right now.

## Thursday 15th June, 2017

dockimbel

[02:22](#msg5941ef5ef6a78eab484cec2d)@cyclecraze\_twitter Just keep using Red and participating to the Red community, that's our best reward for the hard work. ;-)

dander

[02:24](#msg5941efc1cf9c13503c88c814)I'm curious about other people's Red development flow.  
The workflow I've settled on lately is: start up VS Code, write some stuff, launch the file in GUI REPL for testing, then loop between edit / test. I've been putting this in pretty much every file `reload: does [do system/options/script]` to refresh function definitions and such. So I can just type `reload` after editing the file to keep using the same console window.

greggirwin

[03:41](#msg594201d7f6a78eab484d3a86)Nice trick @dander! My workflow varies, based on what I'm doing. I use the REPL much more when tinkering on small pieces, but I've also used the flow you describe in larger setups (R2 mainly, as my Red scripts are mostly self-contained at this point). As things grow, I just re-run from my editor most of the time. In R2 I have quite often included a `halt` button in my GUI scripts, so it's easy to go through some steps and then check the app state and poke around, then type `do-events` to get the GUI going again. That doesn't work in Red right now. I also use a lot of "driver" scripts, which I can use to trigger and run tests when more pieces are intertwined, or I'm editing test data and parse rules.

dander

[05:06](#msg594215dad83c50560c0d0b77)cool, thanks. I like the technique of recycling the GUI. I am beginning to notice how red can practically replace the shell

greggirwin

[05:08](#msg5942165d142826e972b831c8)We'll get there even more. A portable shell is too useful not to have. I, and others, have various grep funcs, and I have an AWK dialect as well. One of my old, fun projects was to see what base shell commands could be built with it in a small amount of space. e.g. cat, tee, etc.

[05:09](#msg5942169a6549436c7d4bfef6)I also have an overblown file-list experiment. Great fun, but could be simpler. More flexibility than you need 99% of the time.

[05:10](#msg594216c5e531dbc905e51724)OTOH, if you really leverage the file system as a data store, it can be nice.

iArnold

[06:43](#msg59422ca6e531dbc905e5642c)@dander I just use a text editor save the changes and 'do the script from a compiled gui-console. I keep the command to run the script as a comment at the bottom, since I noticed that all stuff before the Red header is NOT comment like it should be. (Unless that has been fixed in the meantime but I do not know if)

geekyi

[07:01](#msg594230b16462d8493c142cd8)@dander same except with the `reload`.  
I'm using folders to organize everything in "repos" (I have a main \*playground* repo for misc stuff and ideas, until it's promoted to a separate folder)  
The process goes as follows:  
1\. `Ctrl+k Ctrl+m` and select the one I want, or `f6`:  
a. CLI usually  
b. GUI if I want to debug anything  
c. Then compilation if needed  
\- Having a quick `ctrl+shift+p`command to `red clean` would be useful sometimes I think.

[07:05](#msg594231d06462d8493c143131)2. If I want more abstraction (livecoding, etc), I do that particular file in vscode like in step `1`, then copy and paste code  
\- I guess a better way to do this would be nice (with a command as starting point, and with a file) haven't figured out a consistent way tho

michaeldesu

[07:17](#msg59423488caf4d68d6f376fe1)@geekyi what does Ctrl+k Ctrl+m do? I usually just press F6. Most of what you guys do is above me.. I just use REPL to test ideas (plus the help is good) and then move working fragments over to a file in VSCode.

geekyi

[07:20](#msg59423537ca6d4ae80c163898)3. If someone posts a gist or a link to file, I do the following:  
a. get the raw link  
b. `load` the code into a word  
c. `do` the code into another word  
d. modify the `load`ed code  
e. repeat as necessary, putting each new piece of code into a new word with `copy`, so I have a history of my steps

[07:20](#msg5942354ae531dbc905e58628)@michaeldesu Just try it ;) I see you are a probably a \*bottom up* programmer, while I'm a \*top down* one most of the time :p

michaeldesu

[07:28](#msg59423723ca6d4ae80c1640ad)thanks. Yeah I have a macro assigned to ctrl-m .. I was too lazy to turn it off to try ;-) glad I did seem like a useful thing.

greggirwin

[17:41](#msg5942c6d0caf4d68d6f39fe49)In R2 I have `load-clip/ do-clip` clipboard funcs (and other things in %user.r) per @geekyi's gist comment. I also have `cc` which molds a value and writes it to the clipboard. Makes it quick to grab data, hack it in the REPL, then put results for pasting elsewhere. I do the same thing in Red, but without the shortcut funcs yet.

[17:42](#msg5942c71be531dbc905e82f8b)Other %user.r bits are `file-list grep awk format` and such, so the REPL is largely my shell.

## Thursday 22nd June, 2017

9214

[19:48](#msg594c1f0fbf1bfe6770dcfe71)

```
>> :comment
== func [value][]
>> [1 2 comment {foo}]
== [1 2 comment "foo"]
>> [3 4 /* but what about real multiline comments? */]
*** Syntax Error: invalid path! at "*/]"
*** Where: do
```

greggirwin

[19:49](#msg594c1f4ea44c60fa4c52c57a)Ummm, that would be C. ;^)

9214

[19:53](#msg594c201c88348abd0abb7ff2)Also, can anyone point me out to this thing I'm trying to achieve? I think I've done this once, but can't remember how exactly:

```
>> reduce [if yes [[1 +]] 2] ; want it to become [1 + 2]
== [[1 +] 2]
```

toomasv

[19:55](#msg594c20a3bf1bfe6770dd0722)How about

```
if yes [append [1 +] 2]
```

greggirwin

[19:55](#msg594c20cf746f1fd6632f5d3a)

```
>> append either yes [[1 +]][[]] 2
== [1 + 2]
```

9214

[19:56](#msg594c20dfe59e74be0aa8145d)@toomasv but if `no` I want it to return just `2`

rebolek

[19:58](#msg594c21615bf0bef94cd33ec5)

```
>> trim compose [(if yes [[1 + ]]) 2]
== [1 + 2]
>> trim compose [(if no [[1 + ]]) 2]
== [2]
```

9214

[19:58](#msg594c21687bf0f2951a2d5c2d)Yessiree!

```
>> do compose [(if no [[1 +]]) 2]
== 2
>> do compose [(if yes [[1 +]]) 2]
== 3
```

[20:00](#msg594c21e502c480e67270b814)@rebolek yeah, yours is nicer, deals with `none` returned from `if`

rebolek

[20:12](#msg594c24b9e265aa025eed4645)`do` ignores `none`, so `trim` is not needed, but you're right, it's nicer 🙋

cyclecraze\_twitter

[22:39](#msg594c472757a6e9f72eebf021)If I may: https://news.ycombinator.com/item?id=14612680

[22:41](#msg594c478ac101bc4e3a0f03df)Quoted from above conversation: How did you convince VC-s, that there's need for a new programming language? =&gt; We are not really making a programming language. So, err.. ok, we are. But it is "just" an engine. Luna is a data processing platform. It allows you to prototype, design and deploy data processing applications much faster than it is currently possible, while working in an elegant, interactive data visualization environment. Moreover, we are supported by many cool companies that want to use Luna for their purposes, including IOT, Data Science or Bioinformatics ones. We got a really big interest in our technologies and we've collected the whole round in less than 6 weeks, choosing the investors we liked among many that wanted to contribute. I'm writing about it because I'm really very grateful for their help and super happy that the need for such development is widely recognized. =&gt;  
Wow. That's exciting. I wouldn't think it would be possible to get a programming language funded, but you found a way. I look forward to seeing where things go. Good luck!

## Friday 23th June, 2017

9214

[00:07](#msg594c5bc36ae41d5d33752423)@cyclecraze\_twitter looks impressive, definitely will check up again once it'll be opensourced

greggirwin

[00:11](#msg594c5ccf11755ab05611b71a)Thanks for the link. Lots of comments to go through there.

michaeldesu

[00:12](#msg594c5cd676a757f80896becf)for me personally, I think the above comment is interesting and I will watch it too. FWIW my use of Red has been exclusively for data processing, and I've been alternating between Red and Python for my work, and lately returning to Python since Red is unable to open large files &amp; has the GC issue (previously reported). It's not a criticism - Red is alpha, and it's a fantastic alpha, and I've been working within its limits. In time I know Red will address these - I mainly want to say, take the above as an encouraging step, as I think data is an interesting application (also will recent Julia interest) and Red seems well suited to this domain (and more with IoT etc in time).

gltewalt

[00:14](#msg594c5d5c743aa6f7088d7c62)Doesn't it seem weird that you can't just grab it and try it?

michaeldesu

[00:15](#msg594c5db88dae42503143df1f)not really - they are filtering applications - it seems like they want to curate the initial involvement to build the right community

strpipe

[07:29](#msg594cc341e60ad24f31058bf1)Yesterday, I thought it would be really cool if there would be strong speech-recognition for red. I thought it would play well with it, considering it should be closer to natural language. What do you think about it?

rebolek

[07:30](#msg594cc38a76a757f808982ebd)@strpipe it would be of course cool, but how would it be done? Native library in Red, or some existing one? How big it would be? And, who's going to do it? ;)

strpipe

[07:40](#msg594cc5fd3230e14f3ae718fa)@rebolek Yeah you are right, however I knew you were searching for a cool IDE for beginners. And I thought speech recognition could solve that piece of the puzzle from a different perspective (if it works well) Ain't it? I think it would be catchy, although maybe not useful for crowded offices. I do not think it needs to be native however.

geekyi

[12:18](#msg594d0701743aa6f708901b32)@strpipe for windows 10+ (not sure how early, maybe vista too?), it may be not so hard as there's a library. Just need someone to do it. Ditto android. I don't know about other platforms

## Wednesday 5th July, 2017

rokf

[13:09](#msg595ce5172723db8d5edd6e9e)I'm trying to write a parse dialect to generate HTML from a block and have an issue.

```
Red []

htmlize: function [ b ][
  tree: [
    collect [
      any [
        set tag word! (
          otag: form reduce ["<" tag ">"]
          ctag: form reduce ["</" tag ">"]
        ) keep (otag) block! keep (ctag)
      ]
    ]
  ]
  parse b tree
]

html: [
  head [
    title []
  ]
  body []
]

probe htmlize html
```

[13:12](#msg595ce5c3329651f46e576b5f)If I replace `block!` with `tree` as it is supposed to be then the output only contains the `...` part .

[13:15](#msg595ce661bf7e6af22ca883eb)With `block!` like in the code above the output contains both the `head` and `body` tags but doesn't go into the nested ones so there is no ` ` in the output.

[13:16](#msg595ce6c4329651f46e577073)Any idea what to change to get this to work? What am I missing?

[13:17](#msg595ce6f90de4d2545ef73a3d)Btw, what to use instead of `form` to achieve the same effect but without the spaces?

[13:25](#msg595ce8af0de4d2545ef74297)I've tried to replace the `form reduce [...]` parts with `append append ...` but then the output gets weird.

[15:12](#msg595d01ea76a757f808dcc656)Solved the `block!` issue by changing it into `into tree`.

[15:13](#msg595d020e1c8697534af2bf54)However a new issue appeared

```
htmlize: function [ b ][
  tree: [
    collect [
      any [
        set tag word!
        keep (form reduce ["<" tag ">"])
        into tree
        keep (form reduce ["</" tag ">"])
      ]
    ]
  ]
  parse b tree
]
```

[15:14](#msg595d02636ae41d5d33bb1b09)The closing tag for all the parent tags stays the same as the last tag value in the nested block.

greggirwin

[16:21](#msg595d11ef3230e14f3a2acbf5)Parse rules aren't automatically re-entrant WRT vars. This was true in Rebol as well, which led to http://www.rebol.org/view-script.r?script=use-rule.r

[16:21](#msg595d12033230e14f3a2acc26)To join values without spaces between, use `rejoin`.

9214

[16:55](#msg595d19e80de4d2545ef85d83)That was unexpected :smile:

```
>> ka-boom!: does [probe body-of ka-boom!]
== func [][probe body-of ka-boom!]
>> ka-boom!
...
```

[16:58](#msg595d1aa70de4d2545ef861be)Here a question arises: can function reflect on itself without knowing its name? E.g. `foo: does [body-of :self]`

[17:01](#msg595d1b6a6ae41d5d33bbaf98)Alternatively, how can function bind word to its context (or body) from within the body?

[17:03](#msg595d1bc489aea4761d6a78e7)Sounds too cryptic

[17:06](#msg595d1c910de4d2545ef86b30)Here:

```
iterate-back: func [
    'index [word!]
     bump  [integer!]
     body  [block!]
][
    set :index bump
    while [(get :index) > 0] [
        do body
        set :index (get :index) - 1
    ]
]
```

```
>> leaked?
*** Script Error: leaked? has no value
*** Where: catch
*** Stack: 
>> iterate-back leaked? 1 []
>> leaked?
== 0
```

How can I bind word reffered with `'index` (`leaked?` in this case) to `iterate-back` and make it local?

greggirwin

[17:06](#msg595d1c996ae41d5d33bbb6dd)Functions are just values, which may or may not have words that refer to them.

[17:11](#msg595d1dd33230e14f3a2b0d88)Because there are no args, it evaluates it. Maybe something we just want to document, as we can't really catch that.

9214

[17:11](#msg595d1ddb4bcd78af567c877d)Ah, dark magic :crystal\_ball:

```
iterate-back: func [
    'index [word!]
     bump  [integer!]
     body  [block!]
][  
    spec: reduce [:index]
    body: reduce [
        set :index bump
        while [(get :index) > 0] [
            do body
            set :index (get :index) - 1
        ]
    ]

    do has spec body
]
```

greggirwin

[17:12](#msg595d1df789aea4761d6a847d)No idea why my previous message turned pink.

9214

[17:13](#msg595d1e4c0de4d2545ef8762a)No, wait, it's still leaking! :O

greggirwin

[17:15](#msg595d1ec74bcd78af567c8bda)I thought there was a note about using `context?` on a local word in a func, but can't find it at the moment.

9214

[17:59](#msg595d291d4bcd78af567cc3bd)@greggirwin yes, that way I can get local context of the function, but can't figure out how to make everything work.

greggirwin

[18:08](#msg595d2b2c0de4d2545ef8b6e5)When you do, write it up. :^)

9214

[18:18](#msg595d2d731c8697534af3a77c)Hm, does function without arguments create context? If so, how can I access its context without using `context?` on some arg?

[18:55](#msg595d36256ae41d5d33bc38ea)@greggirwin

```
foo: func ['ref body][do bind body context reduce [to set-word! get ref none]]

probe unset? :qux
bar: 'qux
foo bar [qux: 42]
probe unset? :qux
```

[18:56](#msg595d3657c101bc4e3a55ef1d)

```
iterate-back: func [
    'index [word!]
     bump  [integer!]
     body  [block!]
     /local
        body*
        ctx
][  
    body*: compose/deep [
        while [(index) > 0][
            do body
            set quote (index) (index) - 1
        ]
    ]
    ctx: context reduce [to set-word! index bump]

    bind body* ctx
    bind body  ctx
    do body*
]

probe unset? :i
iterate-back i 5 [print i]
probe unset? :i
```

rokf

[19:10](#msg595d39a74bcd78af567d18df)@greggirwin Thanks :thumbsup:

9214

[19:47](#msg595d42606ae41d5d33bc7505)@9214

```
iterate-back: func [
    'index [word!] 
     bump  [integer!] 
     body  [block!] 
     /local 
        ctx [object!]
][  
    ctx: context reduce [to set-word! index bump]
    do bind compose/deep [
        while [(index) > 0][
            (bind body ctx)
            set quote (index) (index) - 1 
        ] 
    ] ctx
]
```

rokf

[20:15](#msg595d48c90de4d2545ef94f77)Why does `rejoin` still put spaces in between when ran on a mixed nested block? Example: `rejoin ['a ['b 1 2 3] 'c 'd]` produces `ab 1 2 3cd`.

9214

[20:18](#msg595d4982329651f46e598011)@rokf you want `"ab123cd"`?

rokf

[20:18](#msg595d499276a757f808de32e6)@9214 yup

9214

[20:19](#msg595d49bc329651f46e5980ca)

```
>> trim/all form ['a ['b 1 2 3] 'c 'd]
== "ab123cd"
```

DonaldTsang

[20:19](#msg595d49ef0de4d2545ef954dc)Hi!

9214

[20:20](#msg595d4a0489aea4761d6b60fa)Hey there @DonaldTsang

DonaldTsang

[20:21](#msg595d4a30f5b3458e3018582d)Planning to relearn Red after reading 1/5th of "Learn Haskell for Great Good". A Red children's book would be great

[20:21](#msg595d4a4e329651f46e5982ca)Make it 1/4th

[20:21](#msg595d4a6389aea4761d6b6364)@9214 Hey

iArnold

[20:27](#msg595d4b984bcd78af567d7254)@DonaldTsang Learnyousomeerlang is also doable until about 1/4th and then we spoiled brats want to return to Red or Rebol ;-)

rokf

[20:29](#msg595d4c24f5b3458e30186618)@9214 Hmm, looks like its too aggressive for my case (cleaning up spaces from rendered html tags). I'll put something together with `replace`. Thanks tho!

DonaldTsang

[20:33](#msg595d4cfe76a757f808de44c4)@iArnold what are atoms, monads and monoids?

[20:34](#msg595d4d5789aea4761d6b748f)Also, the "Learn you some X for Great Good" is a perfect format for children's textbooks (I recognize the format, which is used everywhere for Y1-6 and maybe Y7-9 students)

iArnold

[20:39](#msg595d4e9e2723db8d5edfb3a4)I came till the atoms. I think for kids the stuff gets too theoretical and there is way too little practice and missing on lots of basic computer cpu chip working things that can keep them interested.

[20:45](#msg595d4fffbf7e6af22caad251)I don't think kids should start programming schooling with monads, closures.

[20:46](#msg595d50126ae41d5d33bcbbc0)Perhaps BASIC like we did in the old days ;-)

DonaldTsang

[20:46](#msg595d503bf5b3458e30187abd)@iArnold We should make a better children's book with Red, but the brackets... Java... :anguished:

iArnold

[20:51](#msg595d51556ae41d5d33bcc17d)Agreed! What is wrong with the brackets?  
I know what is wrong with Java LoL!  
I tried to teach the code is data concept:

```
say-hello: [print reverse "Hello"]
probe say-hello
do say-hello
probe say-hello
```

And show that "Hello" in the code itself is reversed time after time. That is a hard concept to grasp.

DonaldTsang

[20:53](#msg595d51dec101bc4e3a567f26)@iArnold cutting through Another quarter of Haskell

[20:56](#msg595d526d76a757f808de5d54)If code is data, how can it be consistent? I know Ruby have mutable objects, but this is just... wow

## Thursday 6th July, 2017

greggirwin

[02:04](#msg595d9ac14bcd78af567eb9a2):point\_up: \[July 5, 2017 2:15 PM](https://gitter.im/red/red/welcome?at=595d48c90de4d2545ef94f77) @rokf, you can use `source` on `rejoin` to see how it works. There's no `/deep` refinement, that is, it's not designed for nested structures, but you could hack the current one to do that.

toomasv

[06:32](#msg595dd9973230e14f3a2e0e35)@rokf May be something like this?

```
>> str: clear "" parse ['a ['b 1 2 3] 'c 'd] [collect into str any [keep skip]]
== true
>> str
== "ab123cd"
```

rokf

[07:22](#msg595de5331c8697534af69dd5)@toomasv Still leaves spaces on a real example. This is a nested block that I get from my HTML parse dialect:  
`["" ["" ["" ["Heading"] " " "" ["Content"] ""] ""] ""]`

[07:25](#msg595de6076ae41d5d33bef311)There is one less space produced using your method tho :smile: (compared to `rejoin`).

[07:36](#msg595de87c2723db8d5ee1fb98)

```
concat: function [b] [
  a: copy []
  foreach el b [
    either string? el [
      append a el
    ] [
      append a (concat el)
    ]
  ]
  return rejoin a
]
```

[07:36](#msg595de89889aea4761d6db868)This works :sparkles:

9214

[07:57](#msg595ded7bc101bc4e3a58c4f8)@rokf be aware that Red doesn't support tail-call optimisation yet, you can blow up the stack with deeply nested blocks (`concat` recursive call)

geekyi

[08:49](#msg595df987c101bc4e3a58f602)@rokf which editor are you using? I remember thinking it was interesting.. but I don't know how to search in gitter

9214

[08:50](#msg595df9be4bcd78af56802fe0)@geekyi \[Howl](https://howl.io/) I believe

geekyi

[08:50](#msg595df9d53230e14f3a2e9fa6)@9214 thanks

[09:01](#msg595dfc616ae41d5d33bf576c)I started a wiki page for \[editors with red support](https://github.com/red/red/wiki/Editor-Integrations) feel free to add to it!

rokf

[09:43](#msg595e0639329651f46e5c69c6)@geekyi Great! Added links to the Howl website and my bundle for Red

## Friday 7th July, 2017

greggirwin

[03:01](#msg595ef98abf7e6af22cb22b73)Good stuff @rokf! In case you aren't familiar with the Redbol optimizer, it works like this: You post a nice piece of code, and it inspires someone to tweak it. That, in turn, may lead to more tweaks. Distributed refactoring at its best. :^)

[03:03](#msg595efa031c8697534afb872e)Here was my first pass:

```
concat-x: function [b] [
    a: copy []
    foreach el b [
        append a either string? el [el][concat el]
    ]
    rejoin a
]
```

Note that `either` is an expression, and returns a value you can use directly. That leads to removing the paren, since the `concat el` call is now clearly bracketed. And you can omit the last `return` because the last expression is returned automatically.

[03:05](#msg595efa6689aea4761d72a65e)Pass 2:

```
concat-xx: function [b] [
    rejoin collect [
        foreach el b [
            keep either string? el [el][concat el]
        ]
    ]
]
```

`Collect` is a handy function, which can replace allocating the block and the `append` call. `Keep` is the magic word there, inside `collect` bodies.

toomasv

[05:19](#msg595f19eb2723db8d5ee759ea)@greggirwin Shouldn't it be `concat-x` \\ `concat-xx` on fourth line then?

mydoghasworms

[10:16](#msg595f5f9a76a757f808e753d1)@kingburrito666 Are you on Linux or some other platform besides Windows or Mac?

dockimbel

[10:18](#msg595f5fe82723db8d5ee8887e)@kingburrito666 Use triple backticks for code snippets. No direct GUI support on Linux yet (just a prototype for GTK3, in the `gtk` branch), though our GUI system works fine on Wine.

kingburrito666

[10:19](#msg595f6027c101bc4e3a5f2e9e)gosh darn

[10:19](#msg595f60404bcd78af56869224)So gtk branch has some support?

dockimbel

[10:20](#msg595f607589aea4761d7439a3)Very limited, IIRC, button, text, field, a bit of Draw (our vector 2D dialect), like lines and pen colors. We are searching for someone skilled enough to take over that GTK backend and complete it (though, that's not for the faint-hearted).

kingburrito666

[10:21](#msg595f60b489aea4761d743acb)@dockimbel What is the timeframe for full support? How long you think?

mydoghasworms

[10:22](#msg595f60cc3230e14f3a34dd05)@dockimbel On what platform do you develop, out of interest?

dockimbel

[10:22](#msg595f60f50de4d2545e026e52)No timeframe until we find someone to work on it. Though, we should be presenting Red at the GNOME global conf in China on October, so I hope we can find someone motivated and skilled enough there to work on it.

[10:23](#msg595f611876a757f808e75bac)@mydoghasworms Hmm..&lt;cough&gt;Win7&lt;cough&gt;. ;-) Using a basic code editor (just syntax coloring).

kingburrito666

[10:23](#msg595f613a329651f46e62744b)Ubuntu is baby though

mydoghasworms

[10:25](#msg595f61a1bf7e6af22cb3e54d)@kingburrito666 If I had the choice, I would work exclusively on Linux, but for work I am forced to use Windows :-(

[10:26](#msg595f61ca1c8697534afd2d4a)@dockimbel Time to switch to Deepin Linux! :-D (Or Kylin)

dockimbel

[10:29](#msg595f6280329651f46e627ea8)@mydoghasworms The best OS for me is the one which disappears entirely, so I can focus on my work and not spend time administrating the OS in any way. ;-) I don't like any of the modern OSes wrt UX, Windows is the one which gets the less in my way so far, so I'm sticking with it for now. BTW, I don't use CLI for work (everything I do is either in my code editor or in the Red/Rebol GUI console), so I don't miss a good shell on Windows.

kingburrito666

[10:30](#msg595f62d0c101bc4e3a5f3979)Thanks for the help, just got it to launch with wine

dockimbel

[10:31](#msg595f62e76ae41d5d33c5b48b)@kingburrito666 :+1:

mydoghasworms

[10:32](#msg595f63270de4d2545e027640)Well, I must admit Microsoft are very thoughtful: Once in a while they force you to take a complete break by running updates. Us poor Linux users can never get a break :smiley\_cat:

geekyi

[10:33](#msg595f638589aea4761d744c80)@kingburrito666  
&gt; So gtk branch has some support?

\[Current implementation (gtk branch)](https://github.com/red/red/compare/GTK). Looking at \[`modules/view/backends`](https://github.com/red/red/tree/master/modules/view/backends) gives you an idea of what you need to implement. `test`folder gives you a nice overview of the api  
Anything I've missed @dockimbel ?

kingburrito666

[10:33](#msg595f6390f5b3458e30214e43)Is there an option for compiling with a different filename? My OSX executable wrote over my linux one because they had the same name

[10:34](#msg595f639e6ae41d5d33c5b710)I put them all in a bash file

geekyi

[10:34](#msg595f63aec101bc4e3a5f3c71)@kingburrito666 `-o`

kingburrito666

[10:34](#msg595f63b2c101bc4e3a5f3c75)Thanks'

[10:34](#msg595f63bd1c8697534afd3616)before or after -t

[10:34](#msg595f63d34bcd78af5686a7a6)or is it ambiguous

geekyi

[10:35](#msg595f63d889aea4761d744daf)@kingburrito666 don't think it matters. `red -h` for all options

dockimbel

[10:36](#msg595f642289aea4761d744eec)@mydoghasworms I reboot my Win box once every few months only, when I decide to apply some OS updates, otherwise I just hibernate it daily, with all my dozens of windows and apps there opened for weeks/months. ;-)

kingburrito666

[10:37](#msg595f647f1c8697534afd3865)I tri boot windows 8 and ubuntu 16.04 and Mint. Gotta have the best of all worlds

dockimbel

[10:37](#msg595f648676a757f808e7707d)@geekyi Good overview. :+1:

[10:38](#msg595f64b1f5b3458e302153ed)@kingburrito666 Can't choose between Ubuntu and Mint?

kingburrito666

[10:39](#msg595f64d089aea4761d745589)@geekyi thanks `-o` worked

[10:39](#msg595f64db4bcd78af5686ace0)No I love ubuntu themes

[10:39](#msg595f64e42723db8d5ee89f3f)Mint terminal

[10:39](#msg595f64f2f5b3458e302154f9)Windows I just use for apps

dockimbel

[10:40](#msg595f651e6ae41d5d33c5c092)@kingburrito666 ~~apps~~ games! ;-)

mydoghasworms

[10:46](#msg595f668ebf7e6af22cb3fac2)@dockimbel I will grant you that Linux users do spend more time on administration (though maybe because we enjoy it :-P ) but as far as UI/UX goes, I think it depends on what you are used to. I found that after a while on Linux, I was more productive once I had learned the shortcuts and doing things on the command line (like installing software) was more efficient.

kingburrito666

[10:47](#msg595f66b1c101bc4e3a5f4821)I agree @dockimbel It's so much easier now when you know what you're doing

[10:47](#msg595f66d70de4d2545e028c8c)It's almost 4 am so Im lights out

dockimbel

[11:33](#msg595f71a26ae41d5d33c600df)@mydoghasworms My memory being pretty average, I prefer my mind to be filled with code, architectures and algorithms, rather than man pages. ;-) I used to have several Linux boxes a long time ago (back to Slackware 2.0 days) and recompiling kernels and dealing with conflicting/broken archives (.tgz) was where my time was spent on instead of coding. Even now on Ubuntu 16.04, I can waste quite some time dealing with missing/conflicting dependencies in apps/packages. I really like the total freedom you get from an open source OS and the Linux ecosystem, but I can't afford the time for it. Coding is where I want to spend my time and energy. ;-)

iArnold

[12:20](#msg595f7c7876a757f808e7dcf0)@kingburrito666 @mydoghasworms I have a couple of repo's forked from the Red repo ideal for sharing code between developers wanting to have a common goal like expanding on the GTK branch. Using those makes sure that that development does not get in the way for the FS team.

[12:20](#msg595f7ca50de4d2545e02f5be)(I do need to update them with the new date! functionality though)

PeterWAWood

[12:39](#msg595f81033230e14f3a357d7f)Having people working on the GTK branch will not get in the way of the Red team. That is the whole point of having a separate branch.

iArnold

[12:49](#msg595f8341329651f46e631983)And who will facilitate the commits and PR's?

PeterWAWood

[13:01](#msg595f862976a757f808e80ce2)There was no problem accepting PRs submitted by Zamlox on the GTK branch.

[13:23](#msg595f8b6b1c8697534afdf2d4)I just can't see the benefit in developing a GTK backend on a forked repository when people could actively contribute to Red by working on the GTK branch.

pekr

[13:27](#msg595f8c5d76a757f808e82ab5)Well, it depends upon how much one wants to experiment :-) E.g. I am 100% sure that quality of my code is not acceptable for an official branch. But I don't need to even fork, I can download and experiment locally ... (not fluent with Git, merging stuff, PRs, etc.)

iArnold

[13:29](#msg595f8ca91c8697534afdf982)Yes their efforts would also be heavily restricted by the code requirements. In a fork there is more room for experimental/imperfect code.

PeterWAWood

[13:33](#msg595f8d9abf7e6af22cb4c114)@Pekr Exactly you can experiment locally, there is no need to use a third party repository.

[13:38](#msg595f8ec2f5b3458e302218f5)@Arnold I'm afraid I don't see the benefit of developing a GTK backend that is not going to be accepted into Red to the people who want Red to have a GTK backend.

[13:39](#msg595f8f2d329651f46e6355ab)Isn't the best way to develop an acceptable GTK backend to make sure the code is acceptable each step of the way?

iArnold

[14:01](#msg595f941c2723db8d5ee98f6a)@PeterWAWood Well that code could have improvement on improvement getting it more in line and from what is achieved parts can be cherry picked and offered in a version that is acceptable to be included in the official Red repo. In the mean time those interested in Red and using the GTK on their Linuxes have something to stick to Red and not dismissing it for lack of Linux support (and do not want to use Wine).

[14:02](#msg595f9471c101bc4e3a602a38)@PeterWAWood  
&gt; Isn't the best way to develop an acceptable GTK backend to make sure the code is acceptable each step of the way?

In an ideal world perhaps yes, but it not given to all to get up to that level. We are not all QTXies.

PeterWAWood

[14:16](#msg595f97a36ae41d5d33c6bd8e)Clearly we need to accept our different opinions. I feel it is unfortunate that you are trying to divert people from contr

kingburrito666

[14:25](#msg595f99f11c8697534afe4115)Does anyone know how to change the compiler output path?

PeterWAWood

[14:30](#msg595f9b23329651f46e639993)Use the -o option

iArnold

[14:37](#msg595f9c94329651f46e63a096)&gt; Clearly we need to accept our different opinions. I feel it is unfortunate that you are trying to divert people from contr

I think that is meant as contributing to the official repo. I am not. I am creating an opportunity that gets more contributers in and help out to the level of their abilities. If some skilled ppl come in that are able to help out on the official project I am the first to point to the main branch.

mydoghasworms

[14:58](#msg595fa1a34bcd78af5687e4a6)@dockimbel Linux distributions have certainly come a long way and, although I hear your point about the need for a distraction-free OS environment in which to program, the one gripe I have with Windows compare to Linux is that, due to (presumably) bloat in Windows, some functions like compiling programs takes orders of magnitude longer. On Linux my IRB shell starts instantly; on any of the 3 Windows installations to which I have access, it takes 2-4 seconds. The same can be said for starting up any programs and any long-running tasks; for whatever reason, Windows is always much slower; everything just performs poorly.  
I realize I will not convince you to switch, but hopefully someone else reading this message ;-)

kingburrito666

[14:58](#msg595fa1ad89aea4761d75845b)A little confused on the difference between a Macro and a Function?\\\\

dockimbel

[15:43](#msg595fac07c101bc4e3a60a2da)@mydoghasworms That's not my experience on Windows, here all my tools just start immediatly (I have a very fast desktop computer), except for VisualStudio and VSCode. ;-) That said, I'm not fan of Windows either, it's just the less annoying one to me among the main operating systems.

[15:44](#msg595fac7a329651f46e63f9b3)@kingburrito666 Macros are functions that can modify your source code before it is interpreted or compiled (preprocessing stage).

kingburrito666

[16:12](#msg595fb2f14bcd78af56884b18)@dockimbel great thanks!

greggirwin

[17:36](#msg595fc68c89aea4761d764244):point\_up: \[July 6, 2017 11:19 PM](https://gitter.im/red/red/welcome?at=595f19eb2723db8d5ee759ea) @toomasv, yes, of course. Thanks for catching that.

[17:47](#msg595fc940c101bc4e3a61303f)It sounds like Doc and I work very much the same. Maybe why we get along so well. :^) If there were great improvements in new OSs, that would be nice, but sadly... Being comfortable, and knowing your tools and environment is probably the biggest productivity booster there is, but it's hard to make money from that, so we're smothered in anecdotes and methodologies.

rebolek

[19:42](#msg595fe41e0de4d2545e04ea8f)I have different experience. Windows frustrate me, I have macOS on desktop and Linux on notebook (having macOS on both would be great, but Apple tax is very prohibitive) and it's much better experience than Windows. I've also installed Linux on my parents computer and now I need to assist them just maybe once in a month (and that's usually some Skype problem), not 2-3 times a week, like with Windows :)

pekr

[19:46](#msg595fe51ef5b3458e3023c30c)I mostly never need to assist just to anyone having modern Windows machine, apart from users errors not having anything in common with Windows. Apart from that, I find Win10 being a solid OS. But your milleage might vary :-)

toomasv

[19:54](#msg595fe706f5b3458e3023cb65)I was pleasantly surprised to have pretty similar workflow with &amp;dockimbel and &amp;greggirwin :smile:

greggirwin

[21:31](#msg595ffdc576a757f808ea51a3)And I have a bit of a beard at the moment, so I can look more like @toomasv. I think that's where his `parse` powers come from.

rokf

[21:56](#msg596003a16ae41d5d33c8acdb)I'm trying to do a https://github.com/nsf/termbox/ wrapper with `Red/System` and got a question.

[21:57](#msg596003bdf5b3458e302442da)

```
#import [
  "libtermbox.so.1" cdecl [
    tb-init: "tb_init" [
      return: [integer!]
    ]
    tb-shutdown: "tb_shutdown" [
      return: [integer!]
    ]
  ]
]

print tb-init
tb-shutdown
```

[21:58](#msg596003ecc101bc4e3a622d67)The `tb_init` function should return a integer but when I want to print it it doesn't do anything.

[21:59](#msg5960045b76a757f808ea6976)The code compiles and runs with no error but it doesn't seem to work.

[22:04](#msg5960058b1c8697534a00283d)What could be wrong? `print ["init" tb-init]` doesn't print anything either.

alexdore

[22:45](#msg59600f052723db8d5eebb443)Hello you all,

[22:49](#msg59600fe86ae41d5d33c8d658)Absolute Newbie. I am trying to improve on the demo called Tile Gaming. It is nice but I found a major problem which is: clicking on any button will make the button position switch with the empty space in the game. This is not correct. Only button near the empty space can move. Any way, I manage to correct the problem in 3 lines of code : Red [  
Title: "Tile Game"  
Needs: 'View  
]

b: 50  
c: make pair! b ;; size of each button  
d: 3 ;; number of button per side ex 3 for 8 buttons and 1 empty box  
view [  
title "Tile Game"  
backdrop silver  
style t: button c [  
btn: face/offset ;; axb of clicked button ex 10x120  
btn-empt: absolute (face/offset - e/offset) ;; scalar difference ex 0x60  
if (btn-empt/1 + btn-empt/2) == (b + 10) [ ;; if 60 == b + 10 then btn can move  
face/offset: e/offset  
e/offset: btn  
]  
]

t "15" t "14" t "13" t "12" return  
t "11" t "10" t "9" t "8" return  
t "7" t "6" t "5" t "4" return  
t "3" t "2" t "1" e: base c silver  
]

[22:52](#msg5960109089aea4761d776301)Now, what I would like to do is ask the player to choose not only the size of the button but also the number of buttons (3 by 3, 4 by 4 or 5 by 5). So I need to generate pragrammatically the buttons. I could not find any documentation or examples on this. Does anybody has an idea how to proceed ? Regards

[22:55](#msg59601168c101bc4e3a625976)

```
Red [
    Title: "Tile Game"
    Needs: 'View
]

b: 50
c: make pair! b ;; size of each button
d: 3 ;; number of button per side ex 3 for 8 buttons and 1 empty box
view [
    title "Tile Game"
    backdrop silver
    style t: button c [
        btn: face/offset ;; axb of clicked button ex 10x120
        btn-empt: absolute (face/offset - e/offset) ;; scalar difference ex 0x60
         if (btn-empt/1 + btn-empt/2) == (b + 10) [ ;; if 60 == b + 10 then btn can move
            face/offset: e/offset
            e/offset: btn
        ]
    ]
    t "15"  t "14"  t "13"  t "12" return
    t "11"  t "10"  t "9"  t "8" return
    t "7" t "6"  t "5"  t "4" return
    t "3"  t "2" t "1" e: base c silver
]
```

dander

[23:07](#msg59601443bf7e6af22cb7150b)Hi @alexdore , welcome! I'm not an expert at programmatically generating View code, but the argument to `view` is just a block, so you could construct the part at the end with all the buttons, and append it to the rest.

[23:08](#msg5960145ac101bc4e3a626404)

```
Red
>> append [title "title" other stuff] [button "one" button "two"]
== [title "title" other stuff button "one" button "two"]
```

[23:16](#msg5960166789aea4761d7776ad)on a side note, I think this version of that demo might be working a bit better: https://github.com/red/code/blob/master/Showcase/tile-game.red

alexdore

[23:24](#msg596018414bcd78af568a10e6)''''''

[23:28](#msg5960192076a757f808eab372)'''''  
style piece: button 100x100 font-size 12 bold [  
delta: absolute face/offset - empty/offset  
if delta/x + delta/y &gt; 90 \[exit]  
pos: face/offset face/offset: empty/offset empty/offset: pos  
]  
''''''  
Great, the code in the link you gave me is nice. "Rudolf W. MEIJER (meijeru)", the author and I found the same approach to determine if a button can or cannot be moved. However, Mr Meijer way to do it breaks if the size of the tile is more than 90. My approach works with any size button. Thank you Mr Andersen.

[23:38](#msg59601b684bcd78af568a1b01)OK, let met explain a little bit better. Before the start of the game, I want the player to specify how many buttons he wants to play with. This means that I do not know the number of buttons in advanced. But, as soon as he specifies the number of buttons, I should be able to generate the appropriate number of buttons in each row of the game. This has to be done on the spot not in advanced. I tried with : loop n \[loop n \[ generate buttons and return if appropriate ]], ... but it does not work. Sigh.

dander

[23:43](#msg59601c9ff5b3458e30249d09)I haven't had much experience with view yet, but I'm sure someone else will chime in about how to do it

## Saturday 8th July, 2017

greggirwin

[00:24](#msg596026341c8697534a00957d)@alexdore, as @dander said, it's not hard, if you think of your layout as data.

[00:31](#msg596027f12723db8d5eec03f0)

```
; Defaults
board-size: 4
button-size: 60x60
; TBD: set button size
view [
    text "Board Size:"  f-board-size:  field data (form board-size)  return
    ;text "Button Size:" f-button-size: field data (form button-size) return
    button "Go!" [
        board-size:  to integer! f-board-size/data
        ;button-size: to pair!    f-button-size/data
        unview
    ]
]
; Start with the static prologue of your layout
; TBD: fix up hard-coded delta check
board: compose [
	title "Tile game"
	style tile: button (button-size) font-size 12 bold [
		delta: absolute face/offset - empty/offset
		if delta/x + delta/y > 90 [exit]
		pos: face/offset face/offset: empty/offset empty/offset: pos
	]
]
; Add the dynamic buttons
repeat n subtract round (board-size ** 2) 1 [
    repend board ['tile form n]
    if zero? n // board-size [append board 'return]
]
; Add the static epilogue
append board [empty: tile ""]
; See if it worked
view/tight board
```

[00:33](#msg59602863f5b3458e3024c01f)Since you're already diving into dynamic GUIs, I'm guessing you'll figure out how that works pretty quick. `Probe` `board` to see the generated layout block.

geekyi

[02:44](#msg596046ffbf7e6af22cb7a925)@alexdore just wanted to mention for the future, we have https://gitter.im/red/red/code for discussing about code in that repo

[02:48](#msg5960481889aea4761d7802b2)@alexdore If you haven't figured it out already, the key in @greggirwin's code is `compose`. It helps you compose stuff :p especially code in dialects.  
You can also go down an abstraction layer and see what happens internally, if you replace `view` with `layout`. That produces the `object!` representation of the view dialect

greggirwin

[05:12](#msg596069aa2723db8d5eecbcef)`Compose` isn't actually required here, but I sometimes sneak in teasers. :^)

dockimbel

[06:30](#msg59607c0176a757f808ebd7ad)@alexdore @geekyi `dump-face` is also a helpful function to know for checking your generated face tree.

geekyi

[06:45](#msg59607f851c8697534a019e9f)@geekyi keeps forgetting about `dump-face`, thanks!

dockimbel

[06:46](#msg59607fd13230e14f3a3955a2)BTW, in purely dynamic GUI, you can also just drop VID, create face objects directly and assemble them into a tree. In some cases, it can result in simpler or more intuitive code. \[Here](https://gist.github.com/dockimbel/a6ad059854e8059147d23e5033b490d6) is an example.

[06:51](#msg596080e1329651f46e66eef2)Just a remark about the code in that demo: beware of what you put in an object body block when defining it inside a function using `function` constructor, as it will gather \*all* set-words, even the one inside the block you want to use as body for the object. If you don't pay attention to it, it will result in apparently odd errors. So in such cases, using `func` and manually defining the local words list, is the safe thing to do. @greggirwin One of the big drawback of the auto-gathering of set-words approach. I think that we maybe should avoid teaching `function` to beginners.

pekr

[06:54](#msg596081c2bf7e6af22cb85316)Maybe we've just got first example of how we could bring in a grid widget to Red :-)

alexdore

[11:30](#msg5960c25cbc46472974cb4d07)Thank you guys ! Never thought I would find such a nice bunch of people here. Lots of food to think about here. Regards.

dockimbel

[11:43](#msg5960c5514bcd78af568c2256)@alexdore :+1:

greggirwin

[16:07](#msg5961035c3230e14f3a3b2142)I agree that `function` can be a double-edged sword. And there's a place for generating VID or View code dynamically.  
@pekr, we already have it in the spreadsheet example, but it doesn't scale very far. Generating sub-panes, ala R2's `list` style, can go a long way though. Other things ahead of the "virtual pane" on my task list though, especially now that we have `date!`.

[16:08](#msg59610389329651f46e68b362)@alexdore, welcome, and Happy Reducing!

iArnold

[18:51](#msg59612999c101bc4e3a65fb61)Does `dump-face` still also dump the parent (face)?

greggirwin

[23:27](#msg59616a7f89aea4761d7be88a)Why not try it and see?

## Sunday 9th July, 2017

iArnold

[08:29](#msg5961e96f2723db8d5ef1b64f)because I probably know the answer already, and currently I am not on a supported system to test it out. I hope the dump will be restricted in some way to limit the almost endless output one has to `face` otherwise.

geekyi

[16:21](#msg5962580cbf7e6af22cbe6f40)@iArnold no(t anymore):

```
a: layout [b: panel [c: button "hi"]]
dump-face b
```

```
Style: panel Offset: 10x10 Size: 82x45 Text: none
     Style: button Offset: 10x9 Size: 62x25 Text: "hi"
== make object! [
    type: 'panel
    offset: 10x10
...
```

## Monday 10th July, 2017

alexdore

[01:47](#msg5962dcafc101bc4e3a6ba51d)@dockimbel : Sorry to bother you, but the example code you pointed me has a typo that prevents its execution.  
\*\** Syntax Error: invalid integer! at "08/07/2017]generate: function [board"  
The code should be Date: "08/07/2017" instead of Date: 08/07/2017 in the Red header  
Regards

[02:06](#msg5962e124c101bc4e3a6bb305)@dockimbel It is a funny behaviour since in some other examples the date does not have to be in quotes in order to work

geekyi

[04:26](#msg596301debc46472974d327d9)@alexdore which code are you talking about? `date` was implemented recently (a few days back); so that might be one reason it's not working

[04:27](#msg596302332723db8d5ef5793c)Get latest nightly build from http://www.red-lang.org/p/download.html

dockimbel

[04:30](#msg596302fdf5b3458e302e49a2)@alexdore Sorry for that, I'm too happy to be able to use unquoted dates in Red headers since a few days. ;-) You can double-quote it, or just download the latest build from the link provided by @geekyi.

9214

[12:09](#msg59636e912723db8d5ef7550b)@dockimbel :+1: for `function` avoidance, recently I've forced myself to use `func` exclusively, this helped me to better understand context construction and prevent "leaking" behavior.

Also `function` doesn't pay attention to `set` syntax, this can lead to confusion. But manually specifying local words could be cumbersome sometimes :(

dockimbel

[12:13](#msg59636f7abc46472974d4f9fd)@9214 Indeed, actually `func` is the safest default, as it has no \*hidden* side-effects, unlike `function`. I think an IDE could help greatly there, by showing you which words in the body block get "caught" by `function`.

## Wednesday 12nd July, 2017

mikeparr

[14:02](#msg59662bddbf7e6af22cceb486)  
Func vs function. Should I rewrite this extract from Red-By-Example? -  
"In almost any case it is better to use the word function than func,  
because function provides out of the box what has to be specified  
explicitly with func otherwise."

iArnold

[14:22](#msg59663095329651f46e7d6224)I would recommend function over func. But I still almost always declare all local variables anyway. I think the recommendation on Red-by-Example is ok for its purpose.

greggirwin

[16:37](#msg59665039c101bc4e3a7a9139)@mikeparr, RBE's `func`entry has a comment that is the reverse as well. In this case, I think it's worth going into a little more detail about the difference, because functions are so common in what we do. I had a similar thought about not using `/local` with `function`, but Doc pointed out that they are entirely compatible, because `function` won't catch `set` usage.

[16:37](#msg5966504b76a757f8080350f2)Something along these lines perhaps?

```
Function (not a complete entry here)

    - /local followed by all variables that should be local to the 
             function. See note below.

    - /extern followed by all variables that should be available in
              global scope. See note below.
        
As stated above, variables assigned using `set-word!` syntax in the 
body of a function are automatically local to the function. If `set`
is used instead, the variable is *not* captured. The combination of
those behaviors, and the `/local` and `/extern` refinements, let you
specify variable locality that makes the intent clear in a variety
of situations.

`Function` with `set-word!` usage is the most common case, and will 
be most familiar if you're coming to Red from another language. 

Func

Replace "In almost any case it is better to use the word function."
with "See also: `Function`"
```

[16:39](#msg596650d62723db8d5e0406f6)Bah, formatting.

dockimbel

[16:50](#msg5966533d329651f46e7e27cc)@greggirwin Not just words declared with `set`, but any word that is not set using a set-word, e.g., words in a dialect like Parse: `copy`).

greggirwin

[18:04](#msg596664a076a757f80803be7f)Yes, good catch.

mikeparr

[21:06](#msg59668f3d4bcd78af56a3bb2f)Thanks @greggirwin - I'm on holiday, will do the edit when I return.

## Thursday 13th July, 2017

strpipe

[09:16](#msg59673a73bf7e6af22cd3626c)I thought again about the IDE, what do you think about marking certain areas in the script and then displaying them as separate in the IDE.  
Meaning you open a script, let's say (foo.red) and it contains certain areas like UI, Initialization... and what else. Which will then appear in form of tabs for example, like in the internet browser, but perhaps on the bottom.  
So one could have some logical separation while still having it all in one single script.  
If this is not helpful, just dismiss it.  
PS: I never haved programmed in red, I just saw some really long scripts in rebol on the internet.  
Happy Coding!

greggirwin

[17:21](#msg5967ac3276a757f808095edc)That should be very doable, even if they are just jump markers, or to subtly change the backcolor of areas. In the early versions of VB, you didn't even have an option to edit action handlers for controls in the context of the entire file. You selected the control and action from drop lists, and you viewed and edited a single action/handler at a time.

## Tuesday 18th July, 2017

joeerl\_twitter

[10:09](#msg596dde5289aea4761dacfb86)Hello - can red talk to the outside world though TCP or UDP

dockimbel

[10:16](#msg596de01abf7e6af22cec9381)@joeerl\_twitter Hi Joe, unfortunately, not yet, it's scheduled for 0.7.0 (which will start as soon as 0.6.4 is out). Currently you can only do HTTP/S.

[10:57](#msg596de9aec101bc4e3a977077)@joeerl\_twitter I'll be sure to notify you when we'll get full networking support. ;-) Thanks for stopping by.

joeerl\_twitter

[13:46](#msg596e112976a757f808213eff)@dockimbel I wrote this article http://joearms.github.io/2016/01/28/A-Badass-Way-To-Connect-Programs-Together.html explaining why I like OSC messaging - I view programs as components connected together with message passing channels - a program that cannot be remote controlled should probably not be written. It would be great to remotely control red :-)

pekr

[13:57](#msg596e13be1c8697534a3740cc)Red is inspired by Rebol. And Rebol got created by the AmigaOS author, Carl Sassenrath. AmigaOS offered so called Arexx ports to the apps, so that you could do lots of automatition. I expect no less from the Red ... one day :-)

dockimbel

[15:07](#msg596e24420de4d2545e3cfb0b)@joeerl\_twitter Thanks for the interesting article. I share that line of thought too. As @pekr said, many of Red (and Rebol) users were AmigaOS users in the 80's/90's, so heavily influenced by \[ARexx](https://en.wikipedia.org/wiki/ARexx). I do have plans about supporting a modernized version of that, so that Red apps could be easily remote controlled (if desired) from third-party apps. I like the minimalism of OSC, so I'm willing to make a Red implementation for it as soon as we get TCP/UDP support (later this year).

greggirwin

[16:57](#msg596e3df4f5b3458e305c0de2)@joeerl\_twitter, thanks for the link. I recently read your HOPL paper on Erlang and was reminded of how close some ideas are to tuplespaces (one of my favorite models), which I keep bugging @dockimbel about.  
Off to read more on OSC now.

## Wednesday 19th July, 2017

meijeru

[07:01](#msg596f03b976a757f80825326c)&gt; @joeerl\_twitter Hi Joe, unfortunately, not yet, it's scheduled for 0.7.0 (which will start as soon as 0.6.4 is out). Currently you can only do HTTP/S.

I see a `0.6.5` release planned before `0.7.0`. Moreover, I don't see TCP/UDP in the Trello planning...

iArnold

[07:04](#msg596f0486c101bc4e3a9c2c66)@meijeru Work will be done for two releases simultaneously. https://trello.com/c/BW1SPeOU/48-i-o-support

dockimbel

[07:19](#msg596f07fc329651f46ea0075e)@meijeru We have working on two versions in parallel since last year (currently 0.6.4 and 0.6.5). The I/O todo-list in a different card, I just copied the basic list in the 0.7.0 card.

meijeru

[07:21](#msg596f08810de4d2545e408ac9)I see!

geekyi

[07:58](#msg596f1108c101bc4e3a9c60f0)@geekyi finds the name Joe Armstrong strangely familiar..

maximvl

[08:30](#msg596f18880de4d2545e40d179)creator of Erlang

[08:30](#msg596f188e1c8697534a3b92ca)(one of)

[08:30](#msg596f18b31c8697534a3b9357)oh wait, Joe in the chat O\_O

[08:34](#msg596f19784bcd78af56c4d857)btw I used Erlang in production for ~4 years, and I had an idea to write gui from Erlang using Red

## Thursday 20th July, 2017

AndruxaSazonov

[04:11](#msg59702d7bbc4647297408bf0a)Hello! Red idea is cool! But one question. Avira blocks somewhat crush.dll after start of compiler binary. Some suggestions maybe?

greggirwin

[05:34](#msg597040d376a757f8082a9e90)Noted in https://gitter.im/red/red too, that Avira still hasn't addressed the false positive on this.

[05:34](#msg597040e389aea4761db72d79)Any other AV should be fine.

AndruxaSazonov

[06:16](#msg59704ad72723db8d5e2b52c3)Ok, got it. will try on other machine

[06:16](#msg59704ada1c8697534a40ac9d)thanks

dockimbel

[06:18](#msg59704b19bc46472974092513)@AndruxaSazonov You shouldn't need to, just whitelist the Red executable and crush library in Avira.

AndruxaSazonov

[06:38](#msg59704ffa1c8697534a40c2e0)done :smile: ... but now I have error "Cannot make directory /C/ProgramData/Red even if I start through ConEmu and git bash and win cmd console

[06:39](#msg5970500cbc46472974093848)also with admin permissions

[06:41](#msg5970509e89aea4761db76596)found issue on github, will try to repair by myself

dockimbel

[06:46](#msg597051c4c101bc4e3aa1dd38)@AndruxaSazonov Let us know how you fixed it (you can write it as comment on the ticket). Anyway, we'll probably switch to a different folder in the next release to avoid those permission-related issues.

AndruxaSazonov

[07:46](#msg59705fcd1c8697534a4108f6)no luck. ProgramData in Windows 10 is heavily protected by OS. even with full permissions of my account I had no chance (choco didn't help also). licensed choco have option to target install directory, but this is not good. later maybe i will try to clone and build from repo. thanks anyways

9214

[09:00](#msg5970712f76a757f8082b7200)@AndruxaSazonov try to leaf through this chat :point\_up: \[10 мая 2017 г., 00:01](https://gitter.im/red/red?at=591211fcc89bb14b5ae7c02d)

[09:04](#msg5970722fbc4647297409d6cf)oh, my bad, you've already bypassed Avira

kpeters58

[18:53](#msg5970fc17bc464729740c7741)I just compiled my very first RED GUI program - upon start if also fires up a console in the background. Is there a way to suppress that behavior?

greggirwin

[18:53](#msg5970fc30c101bc4e3aa5192c)Use `-t Windows` when compiling.

kpeters58

[18:59](#msg5970fd93bf7e6af22cfa6ad0)Thanks for the super-quick answer!

eranws

[19:08](#msg5970ff95329651f46ea899cc)Judging by the fast response time in Red community, I'm starting to think that they red team are actually a group of intelligent help-bots... :smile:

kpeters58

[19:08](#msg5970ffa6f5b3458e3067cb0f)Next question: That worked well, but the program window cannot be moved. What must I do to achieve that?

greggirwin

[19:08](#msg5970ffc6bc464729740c8617)@eranws at least we're intelligent!

[19:09](#msg5970fff1bc464729740c86f5)@kpeters58, it should work. What OS? Can you post your code?

kpeters58

[19:12](#msg597100a54bcd78af56cd2c74)Windows 10

[19:12](#msg597100a789aea4761dba9f4f)Red \[needs: 'view]  
view [  
title "Tip Calculator"  
below  
f: field "9"  
t: field ".2"  
button "Calculate" [  
append clear x/text (to float! f/text) * (1 + (to float! t/text))  
]  
x: field "tip"

greggirwin

[19:15](#msg5971014e2723db8d5e2ec143)Fine here on Win7. Small window with a long title. What if you set the size of the window?

```
Red [needs: 'view]
view [
    title "Tip Calculator"
    size 400x400
    below
    f: field "9"
    t: field ".2"
    button "Calculate" [
        append clear x/text (to float! f/text) * (1 + (to float! t/text))
    ]
    x: field "tip"
]
```

[19:17](#msg597101e53230e14f3a7b25fd)And don't forget Red has a `percent!` datatype.

kpeters58

[19:21](#msg597102cf329651f46ea8a76a)Ahh - that works. Now I seem to have an area to grab - thanks.

maximvl

[20:10](#msg59710e3df5b3458e3068098a)guys guys, we should create a Red framework called `Hat`

greggirwin

[20:16](#msg59710fb1614889d475d47699):^)

[20:17](#msg59710fc9329651f46ea8df12)And a build tool called Ant.

[20:24](#msg597111804bcd78af56cd745f)Our cloud service could be called Balloon. Our sailor's weather service, Sky. Our government system will be Tape (not sure how far Red Tape translates).

maximvl

[20:25](#msg597111aa614889d475d47e49):D

rebolek

[21:32](#msg5971215cbc464729740d15b3)Many many years ago I wrote Total Commander clone in Rebol, called Red Commander. Maybe I should rewrite it ;)

greggirwin

[22:20](#msg59712cb8329651f46ea952d3)That's a really good GUI test app.

kpeters58

[23:10](#msg59713856bc464729740d64f1)I just noticed that there's no tabbing between edit fields (Windows) - both the TAB &amp; ENTER keys don't navigate. On purpose or just not yet implemented?

## Friday 21st July, 2017

dander

[05:56](#msg5971977b2723db8d5e30cc21)@kpeters58, that seems to be planned for the \[next release](https://trello.com/c/eNUMIJKu/185-gui)

joeerl\_twitter

[06:58](#msg5971a6053230e14f3a7d7297)@greggirwin Linda tuple spaces are one of the great "forgotten" ideas :-) - Imagine a shared whiteboard with programs written in any any language manipuating the spaces.

In a way this is rather like this forum - there is  
a) A way of communicating (for Forum SW)  
b) A shared language (English)

We all \*think* in different languages - but we communicate with a shared languages.

In computer terms communication could mean TCP or UDP. The shared languages could be JSON/XML/OSC  
My personal preferences is OSC/UDP.

[07:09](#msg5971a897614889d475d6867c)@maximvl Great idea - I've been struggling with wxWidgets to make GUIs - aaaagggghhh the pain. It's crazy when things like rebol/red/tcl/shoes/smalltalk make GUI programming easy (so you would think would be popular) whereas QT/wxWidgets/C++ make GUI programming insanely hard are popular.

[07:16](#msg5971aa43c101bc4e3aa77a94)I have two "proof of concept" challenges -  
a) make a software simulation of the Novation Circuit  
b) make a graphic backend that can do some of Dorico

Be inspired by inscore (http://inscore.sourceforge.net/)  
The inscore GUI when started does \*nothing* has no menus, no title bar - I repeat \*NOTHING*  
To get it to do something you send it OSC messages over UDP.

The novation circuit needs sound+graphics+real-time control - so would be a suitably difficult problem to test the system. (Actually I think sound should be handled \*outside* red in (say) the manner of the superconductor.

maximvl

[08:44](#msg5971bf083230e14f3a7dda6d)@joeerl\_twitter I have to admit, I tried Erlang + wxWidgets and the idea that each object is a separate process with a state is quite cool, helps you reason about the system and do introspection easily

greggirwin

[09:10](#msg5971c50cbf7e6af22cfd45f6)Thanks @joeerl\_twitter, more reading to do. One of the things I like about Red, regarding Tuplespaces, is that it is its own data format, and with `parse`, I can match tuples any which way. I built one years ago and it works great. Keep tossing ideas out. We make notes and play as time allows.

kskarthik

[10:29](#msg5971d7863230e14f3a7e4794)Hello all ! I came accross redlang few days ago. Nice to be here ! I a noob to programming &amp; want to learn red. Please link me the docs for newbies to programming in red. I saw on the site but not so easy for me :worried: Thanks !

michaeldesu

[10:30](#msg5971d7de4bcd78af56d0623c)@kskarthik I really recommend reading the red-by-example.org site 'cover to cover'

kskarthik

[11:07](#msg5971e08576a757f8083179e4)looks like linux GUI isn't ready yet...

pekr

[11:09](#msg5971e0f3329651f46eabe19f)No, it is not. Its author is not active anymore here, so unless someone takes over, it is not a high priority right now. You might try with Wine though, should work ....

eranws

[13:21](#msg5971ffd0bc464729741064c7)@joeerl\_twitter Inscore is inspirational beauty! Thanks

mikeparr

[19:33](#msg59725703f5b3458e306d3156)@michaeldesu Just to say that I am still updating Red by Example - hoping to add Vid GUI stuff in a week or 2.

ne1uno

[23:10](#msg597289fe614889d475da89bc)mikeparr I used chmProcessor to make a chm help file from Red By Example.

[23:12](#msg59728a7076a757f8083473d9)it couldn't quite make an index of everything. took an hour to process all the links!

kpeters58

[23:59](#msg59729566614889d475daad6a)I had the typo (stype instead of style) as show below in my code and it produced an exe that silently failed. No error during compilation at all - is that to be expected or a bug?

[23:59](#msg59729569c101bc4e3aab793a) view [  
title t\_gtitle

style lbl: text right 100  
style fldw: field 200  
style fldm: field 80  
stype flds: field 40

tp: tab-panel [

## Saturday 22nd July, 2017

kpeters58

[00:00](#msg59729590f5b3458e306e0af8)Compiling for WIN with 'red -t Windows -r &lt;source file&gt;

greggirwin

[00:06](#msg59729720f5b3458e306e0fea)VID, being a dialect, doesn't compile, so it won't get caught there. However, with the new GUI test capabilities, a build tool, or even the compiler with a switch perhaps, \*could* find calls to `view` and use that to vet the VID specs.

[00:08](#msg59729796c101bc4e3aab7fbd)The silent failure is a separate issue, and I believe is already known.

kpeters58

[00:12](#msg5972987f329651f46eaee1c4)Thanks Gregg - turns out I jumped to conclusions, seeing the typo. It's something else that I haven't been able to pin down yet...

greggirwin

[02:21](#msg5972b6a01c8697534a4aa203)Running interpreted sometimes helps.

kpeters58

[22:21](#msg5973cfdb45fc670746b92ad9)I have been working on localizing a few layout mockups and I can get most of it done; the exception being the sheets in a tab panel. Since something like below does not work, how does one do it?

[22:21](#msg5973cfdd89aea4761dc4e8bf)Red \[needs: 'view]

one: " uno "

view [  
title "Test"

tp: tab-panel [  
one \[]  
" two " \[]  
" three " \[]  
]  
]

## Sunday 23th July, 2017

greggirwin

[04:45](#msg59742a063230e14f3a864798)

```
one: " uno "
view compose/deep [
    title "Test"
    tp: tab-panel [
        (one)       []
        " two "   []
        " three " []
    ]    
]
```

kpeters58

[04:51](#msg59742b3cf5b3458e307300f6)Thanks once again!

greggirwin

[04:56](#msg59742c8c614889d475df9097)Happy to help.

kpeters58

[18:30](#msg5974eb31f5b3458e3075783b)\[!\[image.png](https://files.gitter.im/red/red/welcome/1SOO/thumb/image.png)](https://files.gitter.im/red/red/welcome/1SOO/image.png)

[18:31](#msg5974eb70714ea96f78159be1)Question: Can a layout like above be achieved without absolute positioning (Physician area spanning 2 rows)?

[18:37](#msg5974ecf3f5b3458e30757e60)Question 2: Is there an easy way to tell a face to assume the current width of its parent container? My goal is to have a number of group-box faces all the same width with that width being determined by the widest group-box based on the faces inside that group-box. I would prefer to do this without specifying absolutes values.

maximvl

[18:41](#msg5974edd589aea4761dc862b6)i also wonder if layout engine can do this kind of things

[18:42](#msg5974ee0b4bcd78af56db0625)i mean you can have horizontal layout with two panels, but then widgets inside them will not be aligned against each other

greggirwin

[18:47](#msg5974ef2f76a757f8083c27d4)If you look at the `VID dialect` section in the latest blog entry (Red's main page), you can see the new VID features that work towards this. However, it's not magic. For @kpeters58 question #1, there aren't 2 rows for it to span. That is, VID's alignment rules aren't governed by a global, canonical grid/table. You can certainly achieve this kind of thing, but sometimes you need to pivot your mental view.

[18:48](#msg5974ef89f5b3458e30758a9f)For Q2, look at the `View engine` section (same blog entry). After the GUI test feature, it talks about `foreach-face`, which will let you do this kind of thing very easily.

[18:50](#msg5974efd82723db8d5e3ca62e)

```
win: layout [
	across
	button field return
	button field return
	button field return
]
win/actors: object [
	on-resizing: function [face [object!] event [event!]][
		w: face
		foreach-face/with win [face/size/x: w/size/x - face/offset/x - 10] [face/type = 'field]
	]
]
view/flags win [resize]
```

[18:50](#msg5974f0111c8697534a51d00a)You can also resize vertically, of course, which might be something you mix in for your 2-row-spanning field.

[18:51](#msg5974f014c101bc4e3ab2b43b)

```
win: layout [
	across
	button field return
	button field return
	button field return
]
rows: 3
win/actors: object [
	on-resizing: function [face [object!] event [event!]][
		w: face
		foreach-face/with win [face/size/x: w/size/x - face/offset/x - 10] [face/type = 'field]
		y: w/size/y / rows
		i: 0
		foreach-face win [
			face/size/y: y - 10
			face/offset/y: y * (i / 2) + 5
			i: i + 1
		]
	]
]
view/flags win [resize]
```

[18:59](#msg5974f20f329651f46eb6502d)@kpeters58, you could do your layout with something like this:

[18:59](#msg5974f2142723db8d5e3caed5)

```
view [
    style dk-lbl: text silver center
    style lbl: text right
    style field: field 100
    across
    panel [
        lbl "Birth date" field return
        dk-lbl "Gender" drop-down data ["Male" "Female" "Other"] return
        lbl "Fee1" field hint "0.00"
    ]
    panel [
        lbl "Current age" field return
        dk-lbl "Title" drop-down data ["Mr." "Mrs." "Ms."] return
        lbl "Fee2" field hint "0.00"
    ]
    panel [
        dk-lbl "Provider" drop-down return
        lbl "Prov. Ref." field return
        lbl "Fee3" field hint "0.00"
    ]
    panel [
        lbl "Referred by" field 300 return
        lbl "Physician" area 300x60
    ]
    
]
```

kpeters58

[19:11](#msg5974f4ce89aea4761dc87f73)Thanks once again, Gregg. (Should really create a keyboard macro for thanking you!) Shifting the mental model - exactly what I needed!

greggirwin

[19:11](#msg5974f4dfbc464729741a4b99):^)

kpeters58

[22:27](#msg597522e0714ea96f781668d1)One more for today: How can I set the font size for an entire window?

## Monday 24th July, 2017

greggirwin

[03:53](#msg59756f51329651f46eb7deb3)You could do it with the `foreach-face` func, but that's another concept that doesn't really exist in native UIs, AFAIK.

GuitarRover\_twitter

[14:57](#msg59760ad72723db8d5e40cba4)Hello experts. Env: Win 10. I'd like to run a script at start-up of the REPL to load a bunch of words and have the REPL stay up afterward. How is this done in Red? I know how it is done in REBOL.

rebolek

[14:59](#msg59760b3e1c8697534a55e113)@GuitarRover\_twitter Red does not support something like `%user.red`, you need to compile your own REPL that will either include stuff you want, or will load such file on start. It's pretty easy to add.

GuitarRover\_twitter

[15:01](#msg59760bc076a757f80840624a)Thanks. So absent a compile, I need to fire up Red and then merely do %user.red? Any thoughts on something like %loader.red compiled into my own REPL, which would point to a directory / folder to load whatever is in there?

rebolek

[15:03](#msg59760c32714ea96f7819e033)Just add your stuff here https://github.com/red/red/blob/master/environment/console/console.red (after `#include`s), or in `%gui-console.red`, if you are on supported system.

[15:04](#msg59760c67bc464729741e61c9)something like `if exists? %loader.red [do %loader.red]` should be enough

[15:05](#msg59760cb02723db8d5e40d4b1)then compile the console, I do it in Rebol with `do/args %red.r "-r environment/console/console.red`, but there are other ways also. That's all you need to do.

GuitarRover\_twitter

[15:05](#msg59760ccd1c8697534a55e8e2)Thanks

kpeters58

[15:26](#msg597611c0c101bc4e3ab6f860)@greggirwin Thanks!

[15:28](#msg597612324bcd78af56df4d92)I noticed that there is a 2 pixel (?) offset between a text face and a button face when I would expect perfect alignment. Bug or feature?

[15:28](#msg5976123445fc670746c0e5fa) Red \[]

view [  
style txt: text 100 right  
style btn: button 100  
style fld: field 100

group-box [  
txt "Text 1" fld return  
txt "Text 2" fld return  
btn "Text 3" fld  
]  
]

greggirwin

[16:20](#msg59761e6a45fc670746c121f4)Good question. I'll link to that from the GUI branch room.

abdllhygt

[18:52](#msg597641d4714ea96f781adc7b)Hi!

[18:53](#msg59764215bc464729741f77ec)`nothing`

greggirwin

[19:47](#msg59764eeac101bc4e3ab83516)Hi @abdllhygt. Welcome to Red!

abdllhygt

[19:53](#msg5976504dbc464729741fbddd)i use red :)

[19:53](#msg5976505376a757f80841a34d)i'm not new

[19:55](#msg5976509945fc670746c20b89)https://github.com/abdllhygt/Sozluk my red program for basic language translater system

GuitarRover\_twitter

[20:01](#msg59765226614889d475e7b6a9)Env: Win 10. Ver: 0.6.3. Is there a reason why the changes to the font size settings in the REPL fail to persist between sessions?

greggirwin

[20:39](#msg59765b151c8697534a576139)Ah, nice @abdllhygt.

[20:41](#msg59765b62bc464729741fef50)@GuitarRover\_twitter Probably related to Win10 permissions on the prefs file. Can you manually edit %console-cfg.red in the program data dir for Red?

[20:41](#msg59765b80329651f46ebbe00a)That file location may change in the near future, because of issues like this.

[20:42](#msg59765bd176a757f80841d4cf)See https://github.com/red/red/issues/2897 for some details.

GuitarRover\_twitter

[21:09](#msg5976621f45fc670746c2594d)I don't even know what the %console-cfg.red file is. I'm only using the downloaded executable from red-lang.org.

I am merely an end user who programs end user programs.

[21:11](#msg5976628a45fc670746c25add)So what happened to /all refinement with PARSE? In trying to port REBOL 2.7.8 scripts to Red 0.6.3, the interpreter alerted me that Parse lacks an /all refinement.

Does that not mean there is now no way to manually account for whitespace is parsing?

greggirwin

[21:30](#msg5976670189aea4761dce48f4)@GuitarRover\_twitter, understood. %console-cfg.red is where the Red console stores its data. You will find it under %programdata%/red/ on your system.

GuitarRover\_twitter

[21:30](#msg5976671245fc670746c26d26)Thanks much

greggirwin

[21:31](#msg59766731f5b3458e307b7a1f)And, yes, `/all` is the standard in `parse` under Red.

[21:31](#msg5976674e45fc670746c26df0)If you're using `/all`, just remove it and you should be good to go.

GuitarRover\_twitter

[21:34](#msg597667d41c8697534a57935c)Wait. /all is parse of Red parse or isn't? Help says it isn't. I can see why to remove it, right because did not split replace string parsing and in split whitespace can be handled?

greggirwin

[21:34](#msg597667fc4bcd78af56e0d9e3)You don't need to use `/all` in Red, it's the default behavior now.

GuitarRover\_twitter

[21:35](#msg5976680d89aea4761dce4c20)I see what you're saying now.

greggirwin

[21:35](#msg5976681c45fc670746c27055)`Split` is a simple func in Red right now, and may be enhanced in the future.

GuitarRover\_twitter

[21:36](#msg5976685b1c8697534a579581)Is there a published timetable for datatypes yet to be implemented? Do you know if currency will be supported and if so, when?

greggirwin

[21:40](#msg59766933c101bc4e3ab8ad02)There is no timetable. It's based on priorities, which may change, and what is easy to experiment with. `Point!` has been discussed, as has `money!`, and a new `ref!` type. The known need, though, is `port!` for I/O, so that will probably be next.

[21:40](#msg5976695c76a757f8084209fe)`Money!` \*will* come. It may come sooner if someone can do the work or sponsor it to make it a priority.

GuitarRover\_twitter

[21:42](#msg597669bf76a757f808420b98)Are there docs on point!

greggirwin

[21:43](#msg597669e8bc46472974202d1c)And, while it's not spec'd yet, it's possible it will be \*only* the numeric value, rather than being Rebol compatible. The case for the currency type attr hasn't been strong.

[21:45](#msg59766a7c329651f46ebc1c3e)There was chat here on `point!` can't turn up notes on it right now.

[21:48](#msg59766b181c8697534a57a2a4)Gitter search is not helpful. :^\\

[21:52](#msg59766c32714ea96f781b93e5)Basically, a 3-value numeric type, with decimal support, and a different notation from `pair!`. e.g. `(x, y, z)`

GuitarRover\_twitter

[22:05](#msg59766f2289aea4761dce68a5)I see. But in the real world, countless data comes in the form of $10.99. I suppose I could load such data as floats after bringing in as strings and popping the $.

But thanks for the heads up on this Gregg

[22:06](#msg59766f4a1c8697534a57b129)money! in REBOL and the supporting math ops has made work a breeze.

[22:07](#msg59766fb0c101bc4e3ab8c4af)In real world Internet / web programming, what gave REBOL a leg up over Javascript was date! money! and read http://whereever/data.csv

[22:08](#msg59766fc42723db8d5e429943)Anyway, cool. Thanks for your help.

greggirwin

[22:08](#msg59766febc101bc4e3ab8c51c)The `$` sigil will be there, yes. It's the `USD`, etc. part that may not.

[22:08](#msg59766ff8c101bc4e3ab8c531)We agree on the benefit.

GuitarRover\_twitter

[22:08](#msg59766ff91c8697534a57b326)I don't care about that, the USD part that is.

greggirwin

[22:09](#msg5976701789aea4761dce6b40)And it will be accurate. That's the top priority.

GuitarRover\_twitter

[22:10](#msg5976704076a757f80842210e)That is great. I've worked with many dollar amounts to 10 decimal places in apps involving currency exchange data.

greggirwin

[22:11](#msg5976707c1c8697534a57b48b)If you have test cases, those would be \*most* welcome. I have old stuff too, but much of it was proprietary.

## Tuesday 25th July, 2017

vulnz

[00:07](#msg59768bb3714ea96f781bf8a6)Hello guyz!

[00:07](#msg59768bc6714ea96f781bf8e1)https://github.com/vulnz/redide will be glad if you will use it and help it to become better

[00:08](#msg59768c0e714ea96f781bf937)I like this programming language and I did not find any working ide in Red that works, so I did my best so people can start programming in Red faster

[00:09](#msg59768c38bc4647297420a2c1)Thank you ;)

greggirwin

[02:37](#msg5976aee789aea4761dcf330b)Thanks @vulnz! There are a few other beginnings of IDE experiments. Maybe their authors will chime in here. I'll try to look at yours soon.

[02:39](#msg5976af541c8697534a5880e3)At a glance, the first thing I'd suggest is looking at https://github.com/red/red/wiki/Coding-Style-Guide and trying to get your code a little closer to that style. It will help people who want to contribute.

matrixbot

[08:21](#msg5976ff9b2723db8d5e448f65)`kskarthik` hello from Matrix !

kskarthik

[08:26](#msg597700a3714ea96f781d84b8)two way ping test

matrixbot

[08:29](#msg5977017476a757f808441129)`kskarthik` matrix ping!

kskarthik

[08:29](#msg5977017b89aea4761dd05561)pong

pekr

[08:39](#msg597703dc89aea4761dd0613c)what's that? Do you need guys any assistance? :-)

PeterWAWood

[08:51](#msg5977067df5b3458e307d9d5d)Please do not use this channel to play with a bot.

[08:53](#msg59770710f5b3458e307da0a7)You can use https://gitter.im/red/sandbox

kskarthik

[09:46](#msg5977138b4bcd78af56e34e3b)Sorry guys. Just trying to setup a matrix bridge.

vdsfr

[10:13](#msg597719ba614889d475ea95a3)In the code below click the button and close the hello panel  
the window stays open. Now click the drop-list, click the button,  
close the hello panel, the main window closes. I suppose that the  
window should stay open. Right? or Wrong?

Red \[needs 'view]  
view/no-wait compose \[title (rejoin \["V: " form system/version])  
below  
drop-list 200 data \[ "1" "2"] \[]  
button 200 "Show-Hi" \[ view \[ h1 "Hello"]]  
]  
; Peter

kskarthik

[11:15](#msg5977285cbc4647297422e498)How can I compile red source against musl instead of glibc ? I am using alpine Linux &amp; it uses musl.

vulnz

[11:38](#msg59772dc9c101bc4e3abb7c13)@greggirwin thank you for inspiration. I will be really glad if this great programming language will grow faster!

PeterWAWood

[11:59](#msg597732ab89aea4761dd136f3)@kskarthik The alpha Red compiler is written in Rebol2. I very much doubt that a version of Rebol2 which is linked against musl exists.

You could probably create a personalised Red interpreter by "patching" red/system/runtime/lib-names.reds and cross-compiling it on a non-Linux machine.

[12:00](#msg597732ecc101bc4e3abb9439)Of course, that assumes that the functions in musl have the same names as LibC.

dockimbel

[12:04](#msg597733de614889d475eb0c30)@vdsfr Are you compiling that code or interpreting it? When run from the GUI console, the first window does not close. If you are compiling it, it will close because there is no event loop anymore as you launch the first window with `view/no-wait`. So you can either remove the `/no-wait` refinement, or add a `do-events` at the end of your program, to ensure an event loop will be running for the first window.

[12:38](#msg59773bdf329651f46ebf1b4e)@kpeters58 About the 2 pixels issue, the buttons on Windows have a 1+1 pixels margin on left and right, VID tries to rectify that, though, maybe it should not in that case. You can open a new ticket on github, and post your code there.

iArnold

[13:24](#msg5977468ac101bc4e3abbee2f)@kpeters58 As a workaround you can use some padding to correct. Negative padding also works:

```
btn "Text 3"  pad -2x0  fld
```

eranws

[14:10](#msg5977516945fc670746c5fdad)@kskarthik I have done some experiments with Alpine Linux and red here: https://github.com/eranws/red-docker

[14:11](#msg5977518cbc4647297423b148)Can't recall compiling red, but can run it in some form...

kskarthik

[14:37](#msg5977579d45fc670746c61da6)Oh! Thanks for sharing

[14:41](#msg59775884614889d475ebc923)O tried compiling red in alpine chroot. Red needs rebol2 to compile it. Rebol is based on glibc.

gltewalt

[14:51](#msg59775adb89aea4761dd2027d)money! would be the most important next type, because... well, 'money' makes the world go round

[14:51](#msg59775b0989aea4761dd20349)Although currency! might be better

southwolf

[14:55](#msg59775bce45fc670746c631d2)LoL I don’t think money! or currency! is a good choice, because currency contains ISO 4217 unit(currency code). It’s a LOT of work https://en.wikipedia.org/wiki/ISO\_4217

9214

[14:55](#msg59775be2bc4647297423e8b2)`cryptocurrency!` will get us more views ;)

southwolf

[14:59](#msg59775cde45fc670746c63758)hahahahahaha… But we don’t have a reliable HTTP/Socket/RPC library yet, cryptocurrency! can wait...

vdsfr

[15:04](#msg59775de32723db8d5e4652b8) I am interpreting. The no-wait is a leftover of testing various combinations. It fails with or without no-wait. Replacing drop-list by drop-down works ok.

kskarthik

[15:06](#msg59775e60614889d475ebe749)If we make a cryptocurrency, better we follow mini blockchain system. Cryptonite, nimiq are using it already. Also let's name it RedCoin !

greggirwin

[16:59](#msg597778e945fc670746c6b900)We can consider `decimal!` as the non-float decimal datatype name. We'll also want `money!/currency!` though. It won't be the full ISO treatment, just numeric, more than likely. R2 allowed country codes, but R3 does not. It was a nice idea in R2, but ended up being more effort when dealing with money values, because they weren't atomic.

[16:59](#msg5977790abc4647297424774d)A currency dialect is the way to go, once we get there.

## Wednesday 26th July, 2017

kpeters58

[03:48](#msg5978110dbc4647297426c121)The moment I add the line below, I receive:

[03:48](#msg59781110329651f46ec27392)\*\** Script Error: foreach does not allow none! for its series argument  
\*\** Where: foreach  
\*\** Stack: context view layout

[03:48](#msg597811222723db8d5e491096) style tabpnl: tab-panel 400x100

[03:49](#msg5978116476a757f8084881f4)Looks like a bug to me, but then I am very new to Red .... so is this a valid assessment or something I need to learn...?

greggirwin

[06:55](#msg59783ce21c8697534a5ec8c1)Need a little more to go on.

iceflow19

[08:44](#msg5978567fbc4647297427b891)@kpeters58 You're forgetting a block! at the end. It should be:

`style tabpnl: tab-panel 400x100 []`

kskarthik

[12:58](#msg597891f189aea4761dd6d9d0)How can I call Linux shell from red? Eg: dd, echo, cat. In python we do `import os`

9214

[12:59](#msg597892214bcd78af56e96888)@kskarthik type `? call` in REPL

kskarthik

[13:03](#msg597893352723db8d5e4b20db)Thanks!

kpeters58

[13:49](#msg59789de389aea4761dd717c5)@iceflow19 Thanks - that was it

## Thursday 27th July, 2017

AndruxaSazonov

[08:22](#msg5979a2b54bcd78af56ed652e)moved from avira to kaspersky free.... it works :)

doublegifts

[17:23](#msg597a2188614889d475f6f410)Newbie on both Rebol/Red, got some "beginner" question; come from other languages, I am kind of confuse the different about empty? vs tail? and size? vs length? from "end-user" point of view, they seems alias ( doing the same ). To minimize and less function words to remember, why length? cannot act on file! type and return the size ( why we need a size? word? ; same as tail?/empty? although empty? doing more with none! and under the hood is calling tail? ) In other word, why we cannot just extend lenght? to suport file! type instead add new size? word ( because Red want as close as Rebol and Rebol already use size? and length? ? )

rebolek

[17:29](#msg597a22fa2723db8d5e512c86) `tail?` vs `empty?` - yes, they are basically the same, `empty?` also supports `none`because of the `none` transparency.

&gt; why length? cannot act on file! type and return the size

Because `file!` type value does not represent the file in itself, just the filepath. But once we get full IO, you would be able to use `length?` on files, See this R2 code:

```
>> file: open file://sony/Code/red/version.r
>> length? file
== 5
>> size? %version.r
== 5
>>
```

doublegifts

[17:32](#msg597a23a7bc464729742ec9d6)Just play a bit Red and seems found a bug about now/date + 1 ( at least the result behavior different than Rebol )

```
>> print [system/version  system/build/date]
0.6.3 18-Jul-2017/14:03:42-04:00
>> 
>> now/date
== 27-Jul-2017
>> now/date + 1
== 27-Jul-2017
>> now/date + 0
== 26-Jul-2017
>> 
>> d: 2017-07-27
== 27-Jul-2017
>> d + 1
== 28-Jul-2017
>> d + 0
== 27-Jul-2017
```

rebolek

[17:35](#msg597a2450c101bc4e3ac71ff3)It is usual in Red/bol to add common useful functions. I.e. first version of Rebol did not have `append`, you can do the same with `insert tail`, but it's useful to have it. Same with `empty?`.

doublegifts

[17:36](#msg597a248dc101bc4e3ac72061)got it. thanks @rebolek

rebolek

[17:38](#msg597a252c329651f46eca849d)@doublegifts you're welcome.

[17:44](#msg597a2697bc464729742ed41f)@doublegifts That date problem looks like a bug indeed (though I cannot reproduce it).

doublegifts

[17:48](#msg597a27594bcd78af56ef9193)Hmm... i don't try on other platform, mine is Mac OS 10.12

meijeru

[18:00](#msg597a2a3a4bcd78af56ef9eda)Also, your version is from 18-Jul; many improvements have been made since, but -- admittedly -- I did not check whether those concerned date (but I think so, because date was heavily developed recently).

kpeters58

[18:05](#msg597a2b6289aea4761ddcef97)Bug or not?

[18:05](#msg597a2b72c101bc4e3ac73db6)When I create a style like this:

[18:05](#msg597a2b73a7b406262d37a210) style nbtn: button font \[ style: \[bold] size: 10 ]

[18:06](#msg597a2bb089aea4761ddcf12a)And then use it from the console, but without supplying a caption for the button, the console quietly shuts down without any error reporting.

[18:33](#msg597a31ddbc464729742f01bd)\[!\[image.png](https://files.gitter.im/red/red/welcome/NdPq/thumb/image.png)](https://files.gitter.im/red/red/welcome/NdPq/image.png)

[18:33](#msg597a31f41c8697534a6698c7)\[!\[image.png](https://files.gitter.im/red/red/welcome/XRUn/thumb/image.png)](https://files.gitter.im/red/red/welcome/XRUn/image.png)

[18:34](#msg597a32304bcd78af56efbdb4)The above is the result of this:

[18:34](#msg597a323289aea4761ddd0bf8) db-nav: panel [  
b\_first: nbtn "|&lt;"  
b\_prev: nbtn "&lt;"  
b\_next: nbtn "&gt;"  
b\_last: nbtn "&gt;|"  
pad 10x0  
b\_new: btn "New"  
b\_edit: btn "Edit"  
b\_del: btn "Delete"  
b\_canc: btn "Cancel"  
b\_save: btn "Save"  
] ; nav panel

[18:36](#msg597a329445fc670746d16b93)Button order is not respected - bug or not? Even renamed 'Cancel' button to rule out that the new x-platform rules don't apply - still incorrectly ordered....

rebolek

[18:42](#msg597a3420614889d475f73b81)@kpeters58 Try to turn off rewriting engine with `system/view/VID/GUI-rules/active?: no`

[18:43](#msg597a344676a757f808510e66)See http://www.red-lang.org/2017/07/063-macos-gui-backend.html for more informations abut rewrite engine.

kpeters58

[18:57](#msg597a378089aea4761ddd1f54)that worked - but I was under the impression that it only affected OK/Cancel buttons....?

rebolek

[18:58](#msg597a37b9c101bc4e3ac76e77)Probably the rules are not perfect yet :) Maybe you should report it as a bug.

greggirwin

[22:26](#msg597a68abf5b3458e308b1966):point\_up: \[July 27, 2017 11:32 AM](https://gitter.im/red/red/welcome?at=597a23a7bc464729742ec9d6) @doublegifts, confirmed. Good find!

[22:30](#msg597a697645fc670746d23160)&gt; In other word, why we cannot just extend length? to suport file! type instead add new size?

Two different things. As Bolek said, one acts on the `file!` value, which is a string type. If `length?` is used to get the size of the file contents, how do you get the length of the `file!` value itself? You'd have to `form` it first.

[22:31](#msg597a69c976a757f80851db59):point\_up: \[July 27, 2017 12:05 PM](https://gitter.im/red/red/welcome?at=597a2b6289aea4761ddcef97) @kpeters58, I can't dupe the problem. Works fine here.

## Friday 28th July, 2017

OhCoder

[10:15](#msg597b0ed8329651f46ecd8111)hello, world!

geekyi

[11:06](#msg597b1abe76a757f808540ab0)@OhCoder

```
view [button "hi"]
```

doublegifts

[15:25](#msg597b57552723db8d5e55436c)@greggirwin Ah, thanks for explanation. I did not know that length? can apply to file! too. Its help doc said:  
ARGUMENTS: series \[series! bitset! map! tuple! none!]  
and size? doc said:  
ARGUMENTS: file \[file!]  
Now, I known that for the same file! value, length? returns file name length, and size? returns file's content size.  
Just found the type inheritance diagram, and known seres! --&gt; string! --&gt; file! ( so, length? can apply to file! type )

greggirwin

[16:19](#msg597b642c1c8697534a6ac853)Yes @doublegifts. You can also do quick checks in the console.

```
>> ? typeset!
    series!          [block! paren! string! file! url! path! lit-path! set-path! get-path! vector! hash! binary! ...
    any-type!        [datatype! unset! none! logic! block! paren! string! file! url! char! integer! float! word! ...
    number!          [integer! float! percent!]
    any-object!      [object! error!]
    scalar!          [char! integer! float! pair! percent! tuple! time! date!]
    any-string!      [string! file! url! tag! email!]
    any-word!        [word! set-word! lit-word! get-word!]
    any-function!    [native! action! op! function! routine!]
    any-block!       [block! paren! path! lit-path! set-path! get-path! hash!]
    any-path!        [path! lit-path! set-path! get-path!]
    any-list!        [block! paren! hash!]
    immediate!       [datatype! none! logic! char! integer! float! word! set-word! lit-word! get-word! refinement...
    all-word!        [word! set-word! lit-word! get-word! refinement! issue!]
    internal!        [unset!]
    external!        [event!]
    default!         [datatype! none! logic! block! paren! string! file! url! char! integer! float! word! set-wor...

>> ? series!
SERIES! is a typeset! value: make typeset! [block! paren! string! file! url! path! lit-path! set-path! get-path! vector! hash! binary! tag! email! image!]
```

[16:20](#msg597b6467f5b3458e308e8c41)You'll internalize the most important type categories in no time. And that's important, because types are a big part of what makes Red special, and leveraging them makes code much nicer.

jacktyme\_twitter

[16:27](#msg597b65fabc46472974332e6f)Hello

[16:28](#msg597b661d1c8697534a6ad062)is DocKimbel here?

dockimbel

[16:29](#msg597b667c1c8697534a6ad124)@jacktyme\_twitter Hi Jack. Sorry, I couldn't salvage your \[question on SO](https://stackoverflow.com/questions/45259483/external-application-remote-control-from-red-language), the rules they apply there are quite strict (probably too strict in this case). You can find the answer to what you asked for in the first example on \[this page](http://www.mycode4fun.co.uk/example-scripts). If you need any help with it, feel free to ask here or in the \[red/help](https://gitter.im/red/red/help) room.

Senenmut

[17:53](#msg597b79fca7b406262d3c3554)\[Ni Hau]

jacktyme\_twitter

[18:34](#msg597b83d176a757f80855c454)@dockimbel Hey thanks for the answer. I didn't phrase what I exactly wanted correctly on stack. I edited the question but not sure if anyone could see it. I will post the new question here: "I want to create a program with Red that attaches to the windows process Calculator (calc.exe) and have it perform the calculation 1 + 1. This has to be done by manipulating the memory values and not via any keystroke inputs." ---&gt; This is what I wanted but didn't word it correctly.

greggirwin

[19:50](#msg597b95694bcd78af56f49284)How would you do that from other languages? My question is why it needs to work that way? What is the ultimate goal?

[19:52](#msg597b95f7c101bc4e3acc3f26)Poking into another processes address space is a \*really* bad idea.

## Saturday 29th July, 2017

dockimbel

[02:46](#msg597bf6f9614889d475fd4bc0)@jacktyme\_twitter  
&gt; You can find the answer to what you asked for in the first example on \[this page](http://www.mycode4fun.co.uk/example-scripts).

[02:48](#msg597bf78c1c8697534a6cad0c)&gt; This has to be done by manipulating the memory values and not via any keystroke inputs.

That is not a good option. Both because there is no reliable way to achieve it regardless of the language, and because it would be considered a "bad practice", as processes exist in the first place to provide memory isolation.

jdrexler

[07:19](#msg597c37074bcd78af56f64aa0)Hello, I am doing my first Red experiments. Does the „write" action already support HTTP PUT? Or is the cURL binding a better option at the moment?

PeterWAWood

[07:43](#msg597c3ca9210ac2692036bc53)@jdrexler It supports POST (see :point\_up: \[May 23, 2017 2:06 PM](https://gitter.im/red/red/welcome?at=5923d16d5e34568d5e805970)). I'm not sure about PUT but you could try.

[07:46](#msg597c3d652723db8d5e5804cf)@jdrexler I checked the source code and HTTP PUT isn't implemented yet.

jdrexler

[11:21](#msg597c6fd576a757f808586ef9)@PeterWAWood Thanks for the info! I tried PUT instead of POST anyway. Seems to work!

jacktyme\_twitter

[16:38](#msg597cba221c8697534a6ec812)@greggirwin @dockimbel Ok thanks for the input. I happen to be fascinated by MMO( Online Games ) bots. A lot of bot makers use image recognition to make bots. Another way is manipulating the memory of the game in question. I just wanted to know if Red can do this. I know there are numerous examples of bots writting in C# C++ Java etc that perform the bot operations by memory manipulation rather than image recognition. Thanks for the help guys.

greggirwin

[17:47](#msg597cca21210ac2692038528d)Thanks @jacktyme\_twitter. The context helps a lot. If you have links to examples, we can put our heads together on recommended approaches and applicability.

[17:48](#msg597cca602723db8d5e5983a3)Certainly, if you can do it from C, you can do it from Red/System, depending on specific functionality you need. See also: https://gitter.im/red/red/system

jacktyme\_twitter

[22:10](#msg597d07eba7b406262d40bbf4)@greggirwin I'll gather some links with some examples soon.

## Sunday 30th July, 2017

jdrexler

[04:37](#msg597d629abc4647297438e29e)I found some unexpected behavior when appending string within a function. Bug or feature?

```
>> f: function [] [ append "" "Foo" ]
== func [][append "" "Foo"]
>> f
== "Foo"
>> f
== "FooFoo"
>> f
== „FooFooFoo“
```

greggirwin

[05:05](#msg597d690745fc670746db4c21)One of the first rites of passage in Redbol languages: https://github.com/red/red/wiki/Why-do-I-have-to-copy-series-values%3F

jdrexler

[05:24](#msg597d6d782723db8d5e5b278c)@greggirwin Great article! Thank you! That explains a lot.

## Monday 31st July, 2017

kpeters58

[01:04](#msg597e82091c8697534a73c6ee)Where can I find info on the currently available view options &amp; flags?

dockimbel

[04:03](#msg597eac2a4bcd78af56fd42a6)@kpeters58 In the \[documentation](https://doc.red-lang.org/en/view.html), search for "flags" and "options" . The one specific to windows are \[there](https://doc.red-lang.org/en/view.html#\_window).

Senenmut

[09:29](#msg597ef85f210ac269203e88d2)The barbarian programmer is back. Yes , its me.

greggirwin

[15:38](#msg597f4f121c8697534a769e0a):^)

Senenmut

[17:27](#msg597f686545fc670746e1b759)Hallo Gregg , may i ask you. Do you have a programmers Nickname ? Or do you want nothing to do with that kind of stuff ?

greggirwin

[17:54](#msg597f6ef21c8697534a772968)I don't have one. I prefer real names, but don't have any problem with those who enjoy using them, and don't abuse them.

[18:03](#msg597f70f7614889d47507db76)I knew Nenad as DocKimbel for a long time before learning his real name, so he may always be "Doc" to me. Same for Endo, Cyphre (an old Reboler), and a few others. I don't think I've ever used Bolek's full name. :^)

Senenmut

[18:06](#msg597f71b3c101bc4e3ad7e041)Ya. Good viewpoint. I aint able to make a suggestion for a nickname. This must be done automatic , from someone who is many times in contact. However , sometimes makes the athmosphere cool and tuned in conversation. I only did for iArnold one time. ok. thank you for your attention. im back again with programming issues. at the time i have to learn REBOL most important themes. see you again this whole thing only " by the way".

[18:25](#msg597f7631614889d47507ee5c)ok. one more. I give myself the name : Barbarian Programmer. Why ? Simple. A Barbarian wants to get results by his programming and is fighting against complexity. ha

virtualAlan

[23:40](#msg597fbfebbc4647297440aeb4)VoiceAlarm is a Speaking alarm clock.  
It Speaks the time when the set time is reached.  
Same as my example34 at: http://www.mycode4fun.co.uk/About-Red-Programming  
but with a little extra for the voice.

I used SAPI (Speech Application Programming Interface).  
I've also included the Red script in the VoiceAlarm.zip.  
I tend to avoid releasing scrips when I think they could confuse more than help,  
but I think/hope you find this is pretty straight forward.  
I tested it with Win 7, Win 8, Win 8.1, Win 10. All seems to work fine.  
try it here; http://www.mycode4fun.co.uk/red-apps  
Alan.

## Tuesday 1st August, 2017

geekyi

[08:27](#msg59803b8f4bcd78af5602df8f)Was it @strpipe who was looking for voice recognition?

dockimbel

[09:27](#msg59804967329651f46eddee33)@virtualAlan Nice! Keep up the good work!

geekyi

[10:46](#msg59805c01329651f46ede3443)@virtualAlan Should have a space after "The time is":

```
>> tm: rejoin ["The time is" t/hour " " t/minute]
== "The time is07 44"
```

tmpbci

[10:54](#msg59805dd6329651f46ede3b93)hi

[10:55](#msg59805e1a210ac2692043bb64)geekyi I came to chat as requested

[10:55](#msg59805e1d76a757f8086512b5):)

[10:55](#msg59805e3745fc670746e5225c)in fact I can't use any array anywhere in a view context

[10:56](#msg59805e5d76a757f80865139e)global array

[10:58](#msg59805ee145fc670746e5249c)cause of syntax error

[11:00](#msg59805f49614889d4750b2b43)any plan to use red syntax in view ?

[11:04](#msg5980605645fc670746e52b8b)of course i can define other variable with array content before using view. But not very practical... Imagine I design a functional MRI UI that launch stimulation scripts, I need to scan directories for script, build an array and view it.

geekyi

[11:25](#msg59806544329651f46ede5bd1)@tmpbci I think it's possible to some extent, but you don't have to use red syntax, you can `compose`

[11:27](#msg59806585a7b406262d4b8b5c)

```
red
c: ["something"]
view compose [ field (c/1) ]
```

[11:27](#msg59806596bc4647297442fa50)That's just one way to do it

tmpbci

[11:27](#msg598065b51c8697534a7aa927)ok i will try

geekyi

[11:29](#msg5980660645fc670746e548f4)@tmpbci do you know what I mean by dialects and DSLs?

[11:30](#msg5980664ebc4647297442fe9e)I see you like OSC quite a lot :smile:

tmpbci

[11:32](#msg598066b0c101bc4e3adb35a8)no for DSL. OSC is the new MIDI so very useful. (rebol had no sound on OS X, that left no choices anyway)

geekyi

[11:32](#msg598066d145fc670746e54ce8)And you've been playing with VID for longer than me https://github.com/tmpbci/reboluino/blob/master/reboluino.r

tmpbci

[11:32](#msg598066e145fc670746e54d7a)probably :)

[11:33](#msg598066fdc101bc4e3adb3791)far longer, way before github

geekyi

[11:34](#msg59806762f5b3458e309e6b0b)Just tested.. so it works in Rebol 2 , might be a path! bug actually (not sure if paths are asupposed to work inside Red's VID)

tmpbci

[11:36](#msg598067ab4bcd78af5603a6b8)OSC is UDP so as soon as you have UDP, you can control anything far more than music. I didn't find how to open a network port in Red

[11:36](#msg598067bb614889d4750b4e6e)I see i can read tcp:

[11:37](#msg598067fc4bcd78af5603a7b5)but how to open a local port to do a server

[11:41](#msg598068cfbc46472974430b25)about path in reboluino it's at beginning define it according to your platform

[11:41](#msg598068d9210ac2692043e4d7)maybe it's tty.USB0

geekyi

[11:46](#msg59806a0976a757f8086549da)@tmpbci no ports yet in Red

tmpbci

[11:46](#msg59806a26f5b3458e309e7ad2)I saw I/O in the roadmap

geekyi

[11:47](#msg59806a401c8697534a7abefd)https://trello.com/c/Iz0cl1e8/61-070-full-i-o-support

tmpbci

[11:47](#msg59806a5b4bcd78af5603b243)there is some early work ; read tcp://ident.me:80

geekyi

[11:47](#msg59806a63c101bc4e3adb4485)Well, http works now mostly, that could be ticked off I guess

[11:50](#msg59806b132723db8d5e6523fe):point\_up: \[July 21, 2017 OSC was mentioned](https://gitter.im/red/red/welcome?at=5971aa43c101bc4e3aa77a94)

[11:52](#msg59806b72c101bc4e3adb4919)That's why I was familiar, there was talk in another room too, red/red or red/help. So I've read about it and understood the implications :smile:

tmpbci

[12:01](#msg59806d8a329651f46ede7e79)do you have the 0MQ bindings in store ? the website is not responding http://rebol.esperconsultancy.nl/

[12:01](#msg59806d97210ac2692043fb13)for rebol /red

x8x

[12:09](#msg59806f750cef4fed2eb873b1)@tmpbci Sam, look here https://github.com/red/code/tree/master/Library/ZeroMQ .

tmpbci

[12:10](#msg59806fc3a7b406262d4bb7d0)thks

greggirwin

[18:40](#msg5980cb2876a757f808670f23)I commented on the ticket about path eval in VID. Just a question of whether Doc left it out intentionally, so they could be used for something else. VID does allow more flexibility in recent releases. The `data` and `at` keywords can now be followed by arbitrary Red expressions.

## Wednesday 2nd August, 2017

kpeters58

[17:49](#msg598210ba76a757f8086bed95)I just bumped into a (the?) case issue with the Red header - apparently one must propercase 'Red' - otherwise REPL complains about a missing header if a script containing a non-propercased header is loaded. Is this intentional? If so, what's the purpose behind it? Why not all cases as long as there's a header of the format: red\[&lt;optional content&gt;]....

9214

[17:50](#msg598210f8bc4647297449ba40)@kpeters58 yes, that's intentional, `red` is a common word and `Red` is used to distinguish the regular `red` from header keyword

kpeters58

[17:53](#msg598211af2723db8d5e6bbb85)Nothing prevents me from defining 'Red' elsewhere - so not sure if that argument holds much water. Plus, you do have its position: It must be the first string REPL encounters... I feel that it's a gotcha waiting to happen...

[17:54](#msg598211d52723db8d5e6bbc93)As it just did

9214

[17:55](#msg59821222210ac269204a6c9f)@kpeters58 :point\_up: \[2 августа 2017 г., 22:49](https://gitter.im/red/help?at=598210a3614889d47511f83b) only `Red [` counts as a start of the header. And there's script's preface ;)

kpeters58

[17:57](#msg5982128aa7b406262d524600)What do you mean by preface?

[17:57](#msg5982128d2723db8d5e6bbf33)&gt;&gt; Red: 1  
\== 1  
&gt;&gt; red: 2  
\== 2  
&gt;&gt; Red  
\== 2  
&gt;&gt;

9214

[17:57](#msg598212a776a757f8086bf52f)@kpeters58 we're talking about \*scripts\*, not REPL

kpeters58

[17:58](#msg598212cec101bc4e3ae1da0a)As we can see, Red does not care about case - it's inconsistent to have a spot where it does

9214

[18:05](#msg59821457f5b3458e30a52c7b)

```
text
red [File: %bad-script.red]

42
```

```
>> do %bad-script.red
*** Syntax Error: script is missing a Red header: %bad-script.red
*** Where: do
*** Stack: do-file cause-error
```

gltewalt

[18:17](#msg5982174e210ac269204a858f)because `red` has a default value.

```
>> red
== 255.0.0
```

[18:18](#msg59821778a7b406262d525ec3)

```
>> type? red
== tuple!
```

[18:20](#msg598217edf5b3458e30a53a4f)Or rEd, RED, etc. The Red \[] is an exact match special case, because.... how else do we determine the start of a script without something specific to look for?

[18:22](#msg598218631c8697534a81830b)You could have embedded Red script in a text file, or more than one Red script in a text file. So the first `Red` encountered wouldn't work. There has to be an exact pattern to scan for

[18:27](#msg5982199545fc670746ec3835)Exact patterns can't be case insensitive

greggirwin

[18:57](#msg598220931c8697534a81a33b)@kpeters58, now that you know it's case sensitive, for the Red header, how often do you think you'll make that mistake?

## Friday 4th August, 2017

kpeters58

[16:50](#msg5984a5c71c8697534a8b25b5)@greggirwin I hope I'll remember the case sensitivity of the Red header for life (unless Alzheimer's gets me ...). That's not my point and I should have made that clear - my point is that any gotchas are bad when it comes to promoting something - they create unnecessary frustration, especially in newcomers , that gets in the way of spreading the gospel. So, back to the issue at hand: When I, as a newbie, read that Rebol/Red are case insensitive and then pretty much the first word in any script negates that statement (and as a newbie I don't know nor care about any possible reasons for this design choice), I do not expect that and have to spend time to figure that out. That is an unnecessary stumbling block; it may be small but small things can add up and tip scales. I very much like Rebol &amp; Red - I have way more fun with them, than with any other language and often wonder why they have not (yet) become mainstream. They are very different and maybe, just maybe, unnecessary little idiosyncrasies like this one works against them by adding to the learning curve...

gltewalt

[16:57](#msg5984a792bc46472974537cb8)It's not exactly the same newbie crop as, say, one of the mainstream, established languages, though. It's beta software.  
As far Rebol, I don't know if the word Rebol is set in global scope by default.  
I understand the frustration from the little gotchas - perhaps the Red Team will consider any alternative ideas you might have

greggirwin

[17:34](#msg5984b02a4bcd78af56142b1b)Thanks for the thoughts @kpeters58. We should surely doc why that's the case.

rebolek

[17:50](#msg5984b3d4bc4647297453addf)I know that the reason for case-sensitive `Red` is its much higher probability than `Rebol`, but what is probability of case-insensitive `Red[`? Is it really that high?

meijeru

[17:53](#msg5984b4aa4bcd78af56143be6)How about `if color = red []`

9214

[17:55](#msg5984b4f81c8697534a8b629f)or, say, some color-related DSL

greggirwin

[17:56](#msg5984b557f5b3458e30af2cfa)It \*will* come up from time to time, so we need to note it. The rule could be relaxed later, but not the other way around.

gltewalt

[18:12](#msg5984b922210ac269205474ac)even weirder, what value does rebol return in the repl?

[18:15](#msg5984b9b2c101bc4e3aebdf84)Could create one, and only one, reserved word. For delineation purposes.

[18:17](#msg5984ba232723db8d5e75e48b)Red-Head \[] ;-)

9214

[18:17](#msg5984ba57bc4647297453cc6c)&gt; reserved word

IMO that goes against core language principles

gltewalt

[18:18](#msg5984ba742723db8d5e75e63a)Yep, that's why a limit of 1

geekyi

[18:19](#msg5984babb45fc670746f60ed4)@gltewalt Red allows interop with Rebol. It is a valid defined word in it

[18:20](#msg5984bad6bc4647297453ce1b)So can write a script that works in both

9214

[18:21](#msg5984bb162723db8d5e75e8fb)In my mind it goes like this: only \_words_ inside \_scripts_ are case-insensitive, `Red` keyword isn't a part of the script - it's a part of the header, hence the case-insensitivity rule isn't applicable to it.

gltewalt

[18:21](#msg5984bb16329651f46eeeee32)It's weird to a 'newbie', and was funny to me.

rebolek

[18:21](#msg5984bb20bc4647297453cf17)There are already scripts working in both Red and Rebol - http://dobeash.com/files/munge3.r

9214

[18:22](#msg5984bb54f5b3458e30af4ae2);) https://github.com/red/red/blob/master/utils/preprocessor.r

gltewalt

[18:25](#msg5984bc04a7b406262d5c29b8)Rebol isn't likely to be a word that some random cider makes up for a word. (Side note)

[18:25](#msg5984bc0da7b406262d5c29ff)Coder

[18:30](#msg5984bd5e1c8697534a8b8561)There is Red/System, so something like Red/Red could be used for regular Red header

kpeters58

[18:43](#msg5984c0374bcd78af561467ea)Slightly on the same 'illogical' topic: Why do the docs say (haven't tried in code yet) that data: true/false drives the checked state for radio faces, but para: true/false for check faces?? Again, makes no sense to me whatsoever....

[18:46](#msg5984c0e9c101bc4e3aebfb04)Discovered that while working on this next question: How do I efficiently and 'red-ish' reset all input-capable faces; i.e. fields and areas to text = "", empty text-list &amp; drop-list's data, set radio data to false and check para to false?

meijeru

[18:50](#msg5984c1e145fc670746f62c8f)On check faces: I am sure that there is a typo in the docs; the true/false belong to the data facet.

kpeters58

[18:51](#msg5984c231a7b406262d5c4289)Who is in charge of the docs, so that his question won't have to get asked multiple times?

meijeru

[19:25](#msg5984ca222723db8d5e762b45)I will raise an issue.

[19:30](#msg5984cb3dbc4647297454132d)\[Here](https://github.com/red/docs/issues/22) it is

greggirwin

[19:48](#msg5984cf92f5b3458e30af9589)Thanks @kpeters58 and @meijeru. On resetting, you could use `foreach-face` and dispatch on the style for what facets to reset.

kpeters58

[20:34](#msg5984da4c614889d4751c82b6)@greggirwin I had thought about that, of course, since you provided me with an example of it last week or so.

[20:34](#msg5984da4e2723db8d5e7663e1) foreach-face/with win \[face/size/x: w/size/x - face/offset/x - 10] \[face/type = 'field]

[20:37](#msg5984db04a7b406262d5c951c)It seems a great fit if one wants to perform the same action on number of identical face/types. In my case, I need to perform slightly different actions based on face/types and I don't have the eyes yet to see that fit.....? Unless I looped once for each type group - which can't be right.

rebolek

[20:39](#msg5984db72210ac2692054ed2e)

```
switch face/type [
    field [some field action]
    button [some button action]
]
```

kpeters58

[20:42](#msg5984dc2f1c8697534a8bf790)Ah - not deploying the second block for identifying the face type. Didn't realize that that was optional - thanks

rebolek

[20:44](#msg5984dcb6a7b406262d5c9aab)Yes, `/with` is refinement and refinements are optional, they sometimes can take an argument, but they are not mandatory.

greggirwin

[21:06](#msg5984e1d5329651f46eef7a3f)

```
do-it: does [
	foreach-face win [
		switch face/type [
			button [face/text: rejoin ["I'm a button at " face/offset]]
			field [face/text: rejoin ["I'm a field of style: " face/options/style]]
		]
	]
]
view win: layout [
	style button: button 150
	style fld-150: field 150
	button button button "Click Me!" [do-it] return
	fld-150 fld-150 fld-150
]
```

## Saturday 5th August, 2017

kpeters58

[00:04](#msg59850b72614889d4751d13d1)Red \[ needs: 'view ]

ctx-1: context [

do-it: does [  
foreach-face form-1 [ switch face/type [  
field area \[ print "field or area"]  
text-list drop-list \[ print "list"]  
check radio \[ print "check or radio"]  
]  
]  
]

form-1: layout [  
p: panel 200x200 [  
button "1" \[]  
]  
do \[ do-it ]  
]  
view form-1  
]

[00:06](#msg59850bf1bc4647297454d9c1)The code above does not work (which makes sense, since form-1 isn't fully defined by the time do-it gets called. But is there a way to achieve what I am after - like deferred execution or such?

geekyi

[12:57](#msg5985c0cca7b406262d5f1ca6)@kpeters58 why not just `do-it` at the end.. or button press like :point\_up: \[above](https://gitter.im/red/red/welcome?at=5984e1d5329651f46eef7a3f)

nomadics\_twitter

[14:25](#msg5985d54f329651f46ef22750)Greetings Everyone..  
&lt;de-lurking&gt;  
I am returning Rebol enthusiast starting around 2001(?)  
Mainly I was using the charming vanilla.r  
{blog-cms by Chris Langreiter &amp; others}  
Customized towards mt own projects.

[14:43](#msg5985d9a176a757f808791d6d)Hello  
intro cont..

Like many, trajectory of Rebol was thrilling &amp; painful.  
I am so happy and grateful to see how the Red project has emerged.  
Want to thank ALL of you for the beautiful work you have been doing&gt;

I am stepping back in now ..  
Have questions, ideas, projects..  
Want to contribute in any way I can

that's for now  
~Jason

greggirwin

[16:26](#msg5985f1cdbc4647297457682a)Nice to see you again Jason! Welcome!

Start by asking questions and playing with Red, since it has so many new features over Rebol. You know the basics, and those are not changed much. You'll ramp up fast. From there, docs and tests are key places to help, but also cool demos. We have a community repo that isn't really in use yet, as we're all stretched for time.

[16:35](#msg5985f3cef5b3458e30b2c896)Jason, https://gitter.im/red/red is the main chat group here, but you can also ask questions in https://gitter.im/red/help. See https://github.com/red/red/wiki/Gitter-Room-Index for a more complete list of rooms. (Thanks for updating that @geekyi)

[16:42](#msg5985f57976a757f8087976f0)The Red REPL is solid, and will get a big refresh in 0.6.4, to be even better. We have `call` today as well, so you can tap into the OS if needed. While Red has added some advanced features (compilation, macros, etc.), I'd say start with running interpreted, and play with the GUI system, as it's familiar (VID), but all native, with new features like reactivity.

[16:42](#msg5985f58bf5b3458e30b2cf61)No Linux GUI yet, so that may not be what you need.

[16:43](#msg5985f59ef5b3458e30b2cf82)Seeing some recent work on that though. Woohoo!

nomadics\_twitter

[16:45](#msg5985f61d45fc670746f9b255)@greggirwin  
Hi Gregg &amp;thanks

## Tuesday 8th August, 2017

doublegifts

[01:36](#msg59891588bc4647297461a0c4)Newbis question about GUI: does it exist any kind of geometry manager like TK to handle resize; or ... I have to DIY base on on-resize event?

dockimbel

[03:54](#msg598936042723db8d5e84034c)@doublegifts Such feature is planned, but not implemented yet. Probably a first version of a "geometry manager" will be included in 0.6.5, with Android release.

doublegifts

[04:00](#msg59893772a7b406262d6a2a07)@dockimbel Thanks for info.

## Wednesday 9th August, 2017

Meshu

[01:09](#msg598a60cbbc4647297466ace2)Hey there ! Total newb here, checking Red out and loving it for a little internal tool.  
I am looking to provide a way for the user to open file and dir dialogs

[01:10](#msg598a60e9c101bc4e3afe4b13)Is there an idiomatic way to leverage the native ones yet ?

qtxie

[01:12](#msg598a616c1c8697534a9e2cd1)@Meshu Use `request-dir` or `request-file`.

[01:13](#msg598a619f329651f46e019ceb)You can use `help` to show the usage:

```
>> help request-file
USAGE:
    REQUEST-FILE /title text /file name /filter list /save /multi

DESCRIPTION: 
    Asks user to select a file and returns full file path (or block of paths) 
    REQUEST-FILE is a function! value

REFINEMENTS:
    /title     => Window title
        text     [string!] 
    /file     => Default file name or directory
        name     [string! file!] 
    /filter     => Block of filters (filter-name filter)
        list     [block!] 
    /save     => File save mode
    /multi     => Allows multiple file selection, returned as a block
```

Meshu

[01:14](#msg598a61ddc101bc4e3afe4e5a)Oh my, this is glorious, thank you very much

abdllhygt

[15:47](#msg598b2e751c8697534aa1545c)Hi!

[15:47](#msg598b2ea0c101bc4e3a016a70)I need "Red GUI exercise doc"

greggirwin

[15:49](#msg598b2ef4614889d47531d138)Do you mean tasks to complete, to learn by, or examples themselves?

[15:50](#msg598b2f3576a757f8088bb74c)http://www.red-by-example.org/vid.html has examples, as does @virtualAlan on his site.

abdllhygt

[16:13](#msg598b349076a757f8088bd28c)this is good but i want big doc

[16:13](#msg598b34b54bcd78af562a5b62)data grid view, list-box, vector...

greggirwin

[17:54](#msg598b4c40ee5c9a4c5fa61a63)You mean https://doc.red-lang.org/en/ ?

[17:54](#msg598b4c59a7b406262d727fcc)Red doesn't have a data grid view yet.

abdllhygt

[18:29](#msg598b549cbc464729746a7a8d)Why :(

[18:30](#msg598b54d2329651f46e05544e)I want that, code + gui image for all.

geekyi

[18:42](#msg598b5783210ac269206ad412)@abdllhygt because Red is alpha. You can sponsor to make that part faster, code it yourself, use Rebol, etc

[18:43](#msg598b57cc80d90ca024e38692)Writing X-platform GUI parts is hard, and Red needs more man-power, it is a small team after all..

[18:44](#msg598b580180d90ca024e3879f)Also read https://github.com/red/red/wiki/Contributor-Guidelines ;)

greggirwin

[19:00](#msg598b5bb42723db8d5e8c6c00)Yes, what @geekyi said.

geekyi

[19:04](#msg598b5cab210ac269206ae9e8)@abdllhygt also, is \[this](https://gitter.im/red/red/gui-branch?at=59896606329651f46efd8ef1) what you're looking for? Donating to @rebolek or the team really does speed things up ;)

[19:04](#msg598b5ccdc101bc4e3a024383)Or anyone else willing for that matter..

abdllhygt

[19:07](#msg598b5d58614889d475329c26)yes, i want like this

[19:07](#msg598b5d8a614889d475329ccb):)

[19:08](#msg598b5da8a7b406262d72d182)you say "donate Abdullah!" :D

geekyi

[19:10](#msg598b5e114bcd78af562b115e)@abdllhygt or can help other ways too ;) write docs, find bugs, etc https://doc.red-lang.org/en/ could use some screenshots and more examples

abdllhygt

[19:20](#msg598b6085a7b406262d72dcab)i think to write book but with turkic language :)

greggirwin

[19:52](#msg598b67f8a7b406262d72f864)We don't have a Red/Turkish room yet, but you're not the only one here.

## Sunday 13th August, 2017

NihilCoin\_twitter

[16:52](#msg599083bdc101bc4e3a13c66c)Hi all,  
Are there any server-side capabilities of Red yet? I mean, for listening on TCP ports and processing incoming connections

rebolek

[16:53](#msg5990840f614889d4754448f0)Hi @NihilCoin\_twitter ! There is \*some* server-side capability, you can use Red as CGI for example, but not for listening on TCP port. This will come in 0.7.0 with full IO.

NihilCoin\_twitter

[16:53](#msg599084112723db8d5e9dc56b)same goes about raw socket access, from what I've seen is HTTP(S) URL support only, is it correct?

rebolek

[16:54](#msg59908431210ac269207c7988)Yes, that's correct.

NihilCoin\_twitter

[16:54](#msg59908451ee5c9a4c5fb8345c)@rebolek no I didn't mean CGI, I meant socket support by Red itself, ok, we'll wait for 0.7.0

rebolek

[16:55](#msg5990848b614889d475444b9d)Yes, for TCP you have to wait (I am waiting also ;) ), but I believe it would be worth it :)

NihilCoin\_twitter

[16:55](#msg5990849f4bcd78af563cd788)one more question - from what I heard, Android GUI support is coming in 0.6.5, will it require Android SDK or will the compiler be completely autonomous?

rebolek

[16:56](#msg599084cb1c8697534ab3fd21)AFAIK it should be completely autonomous.

NihilCoin\_twitter

[16:57](#msg599084f4210ac269207c7b90)that's great, because dependency on Android SDK/Studio and all that Java stuff is terrible

rebolek

[16:58](#msg599085464bcd78af563cd984)Yes, that's the advantage of using Red.

NihilCoin\_twitter

[17:00](#msg5990859e614889d475445055)and considering Red already has client HTTP(S) requests, with 0.6.5 we're going to start writing our own wallet for Android in Red, I believe the experience is going to be revolutionary

rebolek

[17:01](#msg59908602162adb6d2ef0410b)Well, you can start writing for Android now, testing it on macOS/Windows (and Linux) and just adapt the GUI later.

NihilCoin\_twitter

[17:02](#msg5990863080d90ca024f54a2b)and Linux? Is GTK GUI in place? Can test also on Mac though.

rebolek

[17:03](#msg5990864e80d90ca024f54a94)GTK GUI works only partially, that's why I've put Linux in parenthesis.

NihilCoin\_twitter

[17:03](#msg599086564bcd78af563cdddf)but how about Android-specific things like system tray push notifications?

rebolek

[17:04](#msg5990869780d90ca024f54b97)I'm not sure what will the first version of Android GUI support, it's possible that system-specific things will come later.

NihilCoin\_twitter

[17:04](#msg599086a7bc464729747c7780)oh ok

rebolek

[17:07](#msg599087391c8697534ab40731)Both macOS and Windows GUI try to target common subset, leaving system-specific things out (at least for now), so I guess Android will go the same path. However, there are system-wide notifications in Windows and macOS too, so some kind of support may come. But I'm just guessing here.

NihilCoin\_twitter

[17:09](#msg599087cf76a757f8089e5a74)good to know

greggirwin

[17:51](#msg59909186210ac269207ca7dc)Contributions for system specific extensions will also be \*very* welcome, though they may not go into an official cross-platform build. Because Red is its own toolchain, and because we can build custom runtimes easily, we'll likely see people do that quite a bit, to support mutiple apps as an external runtime, as libRed, and for standalone EXEs with no external dependencies.

Tobleron737\_twitter

[18:15](#msg599097364bcd78af563d1c5c)Hi everyone

[18:17](#msg599097c380d90ca024f58d61)I wonder how you guys imagine the future of Red's language. I haven't seen anything other than REBOL similar in terms of being able to do everything in one solution. But I am a bit worried that for some reason the development of this great language stops..

[18:18](#msg599097e776a757f8089e8f6a)So how do you guys see the future going for this DEV platform?

NihilCoin\_twitter

[18:28](#msg59909a314bcd78af563d2525)hi, sorry for disturbing again, but I cannot find any single example of View dialect with responsive controls, i.e. how to even get current window size dynamically or specify face width in percents, any lead on that?

rebolek

[18:53](#msg5990a01d4bcd78af563d36b1)@NihilCoin\_twitter all questions are welcome, you are not disturbing at all. Percent sizing is currently not supported, there is no resizing engine yet.

NihilCoin\_twitter

[18:54](#msg5990a07dc101bc4e3a142cf0)@rebolek but is there a way to retrieve current window size?

rebolek

[18:55](#msg5990a0aaa7b406262d84ff21)@NihilCoin\_twitter of course, you can get all sizes, from text to window and add custom resizing on top of VID.

NihilCoin\_twitter

[18:56](#msg5990a0eb76a757f8089eb2c3)@rebolek is there any example of that? I couldn't find it in the docs

[18:57](#msg5990a104614889d47544b0a3)@rebolek I mean, how to get the size of window

rebolek

[18:58](#msg5990a158bc464729747cd0eb)@NihilCoin\_twitter for example:

```
>> window: view/no-wait [button "hello world"]
== make object! [
    type: 'window
    offset: 904x516
    size: 11...
>> window/size
== 111x48
```

NihilCoin\_twitter

[18:58](#msg5990a161162adb6d2ef0a922)only could find how to get the screen size, not window

[18:59](#msg5990a19bc101bc4e3a1430cc)ok thanks

greggirwin

[19:52](#msg5990adfe80d90ca024f5daed)@NihilCoin\_twitter, the latest blog entry talks about some GUI rule engine possibilities. Along with `foreach-face`, which you can use today yourself. e.g.

```
win: layout [
	across
	style area: area 200x50
	button area return
	button area return
	button area return
]
rows: 3
win/actors: object [
	on-resizing: function [face [object!] event [event!]][
		w: face
		foreach-face/with win [face/size/x: w/size/x - face/offset/x - 10] [face/type = 'area]
		y: w/size/y / rows
		i: 0
		foreach-face win [
			if face/type = 'area [face/size/y: y - 10]
			face/offset/y: y * (i / 2) + 5
			i: i + 1
		]
	]
]
view/flags win [resize]
```

[20:28](#msg5990b663a7b406262d854a85)@Tobleron737\_twitter, welcome! Red is based heavily on Rebol's design, as a language. There are others as well, which we collectively call "Redbol" languages. A key difference between Red and R2 is that R2 was closed source. R3 was open source, and has a few forks. While each project has its own goals and features, they will be largely compatible. Not completely, but the core concepts are solid and should be common.

Red got some investment money a few years ago, which has allowed it to get to this point, even with a very small team. One of our goals is to figure out how to make Red sustainable. Other languages have the same issue. Project goals have to align with investor goals, which is also tricky. The business side is not being neglected, but it is a challenge.

The future is bright. Rebol has been around for a long time, and even the frozen version of R2 is still used in production in many places (I've used Rebol since 2001). And we have a few weapons in our arsenal to help ensure that Red users (we call ourselves Reducers), can safely commit to Red for their work. We need to push hard to get to 1.0, and make Red completely self-hosted. There are key features needed to get there, but if you read the blog entries at red-lang.org, you can see how much has already been done, especially in the past year.

Development only stops if we \*all* decide there is something better out there, and stop using Red. It's a very different language, and attracts a different kind of user. We can't guarantee that Red will become popular, and so may not be the only tool in your box, but it has, effectively, been around, as Rebol, for 20 years, and could probably be \*a* tool in your box for at least that much longer. The design is amazing, and more languages every day adopt bits and pieces from it. It's a great tool for thinking, even if development on it stopped tomorrow.

Worrying doesn't do any good, but working \*against* things you \*might* worry about is a positive action each of us can take. Not just for Red, but in life. If you want Red to stick around, \*use* it. I could say "Talk it up, blog about it, contribute code, find investors, ..." and those are all good things to do, but start by \*using* it. Let it make your life better. Enjoy it. Everything else will follow.

Happy Reducing!

## Monday 14th August, 2017

Phryxe

[07:07](#msg59914c4abc464729747ee449)http://static.red-lang.org/dl/auto/win/red-latest.exe is now renamed when downloaded. I thought there were a reason for it to always have the same name.

NihilCoin\_twitter

[09:36](#msg59916f2f80d90ca024f821d1)Another question: are there any known JSON and ECDSA libraries for Red?

rebolek

[09:37](#msg59916f5f4bcd78af563fbeb8)@NihilCoin\_twitter JSON: https://github.com/rebolek/red-tools/blob/master/json.red

NihilCoin\_twitter

[09:42](#msg59917074a7b406262d878a64)ok thanks a lot, anything about ECDSA (probably something that could be ported from Rebol) or generic cross-platform OpenSSL bridge? (we need just ECDSA though to sign transactions)

rebolek

[09:44](#msg599170e6a7b406262d878c06)@NihilCoin\_twitter I have no experience with ECDSA, you say it could be ported from Rebol, can you point me where in Rebol is this implemented?

NihilCoin\_twitter

[09:45](#msg59917133a7b406262d878e02)@rebolek I mean probably there were some libraries for Rebol where this crypto was already implemented, unfortunately couldn't find any

[09:45](#msg5991714ec101bc4e3a16b925)@rebolek if there were some, I could probably port them to Red

[09:49](#msg5991721f4bcd78af563fcb6c)@rebolek ok nevermind, how about bignum support? (up to 2^256)  
if there's any, I can reimplement ECDSA from scratch in Red, although it might take lots of time

rebolek

[09:52](#msg599172d21c8697534ab70ec1)@NihilCoin\_twitter There \*\*is\** some crypto support in Red, there is HTTPS and you can get SHA and other hashes using `checksum`.  
However bignums are currently not supported.

NihilCoin\_twitter

[10:07](#msg59917652210ac269207f8352)@rebolek I see. It's all cryptocurrency-related btw: once one has ECDSA, JSON-RPC and hash functions, one has the ability to create apps for the entire blockchain infrastructures like Bitcoin and Ethereum. Looks like hashes are in place, JSON-RPC (JSON+HTTPS) is in place, ECDSA is the only part missing in Red. We can create a transaction logger/price monitor in Red but cannot write a complete wallet (to send transactions ourselves) because of this missing part.  
There is, for example, a very small amount of libraries for Ethereum transaction signing out there, and most of them target JavaScript. However they all use somewhat quirky ECDSA implementation based on no less quirky bignum emulation.  
Just FYI that it would be a \*\*huge\** jump forward for Red if such a library appears. We're also ready to contribute and start digging into this ourselves. If anyone of us comes up with a bignum/crypto solution/a way to leverage OpenSSL in some way, I'll get in touch.

rebolek

[10:10](#msg5991770a614889d475475d84)@NihilCoin\_twitter adding support for OpenSSL seems the easiest way to me.

NihilCoin\_twitter

[10:12](#msg59917797ee5c9a4c5fbb4488)@rebolek making this support cross-platform is not so easy

[10:13](#msg599177cd1c8697534ab723b9)@rebolek but seems like the most robust, so that we don't have to reinvent the wheel

[10:37](#msg59917d81a7b406262d87c056)btw I already see that approach in https://github.com/red/red/blob/master/runtime/crypto.reds

[10:40](#msg59917e2680d90ca024f85a0f) ;-- Using OpenSSL Crypto library  
#switch OS [  
macOS [  
#define LIBCRYPTO-file "libcrypto.dylib"  
]  
FreeBSD [  
#define LIBCRYPTO-file "libcrypto.so.8"  
]  
#default [  
#define LIBCRYPTO-file "libcrypto.so.1.0.0"  
]  
]  
#import [  
LIBCRYPTO-file cdecl [  
...and so on

but how can we use Red/System bridge in a usual Red code afterwards? Could you please point me to the documentation where this is described?

gltewalt

[11:13](#msg599185bd4bcd78af56401878)Do you want #system ?

[11:13](#msg599185c3ee5c9a4c5fbb7c83)http://static.red-lang.org/red-system-specs-light.html

[11:16](#msg5991867a162adb6d2ef371e6)oops, I mean #call

[11:16](#msg59918694614889d4754796b3)Section 16.8

NihilCoin\_twitter

[11:17](#msg599186b44bcd78af56401bc5)yes, #system, thanks

PeterWAWood

[11:19](#msg59918745c101bc4e3a170a48)You will need `routine!` to bridge between Red and Red/System. @Bolek has written some notes.

NihilCoin\_twitter

[11:26](#msg599188ec2723db8d5ea0ed7a)@PeterWAWood managed to call a function from libcrypto with #system and external .reds file, still have to learn a lot on how OpenSSL APIs are operating on a level that low, but at least it's proven to be doable  
thank you all a lot!

## Wednesday 16th August, 2017

NihilCoin\_twitter

[19:58](#msg5994a3e8ee5c9a4c5fc9b69a)Hi again, are there any Base32 decoder libraries for Red? I found one for Rebol3 but unfortunately my red-fu is not enough to port it since it's using ajoin  
other than that, TOTP lib compatible with Google Authenticator is pretty much complete, it just accepts raw binary keys instead of Base32-encoded ones now

greggirwin

[20:19](#msg5994a8e1a7b406262d967a3c)@NihilCoin\_twitter, if you patch `ajoin` from R2, does it work? If not, can you post a link to the source you're trying to port?

```
ajoin: func [
    {Reduces and joins a block of values into a new string.}
    [throw]
    block [block!]
][
    make string! reduce block
]
```

rebolek

[20:19](#msg5994a8e72723db8d5eaf2155)@NihilCoin\_twitter actually, the conversion was very easy, `ajoin` is basically `rejoin`:

```
>> to-base32/decode to-base32 "https://gist.github.com/rebolek/d3c1e680b63a3b73c86309e590c6e356"
== {https://gist.github.com/rebolek/d3c1e680b63a3b73c86309e590c6e356}
```

[20:20](#msg5994a90bee5c9a4c5fc9d206)https://gist.github.com/rebolek/d3c1e680b63a3b73c86309e590c6e356

greggirwin

[20:25](#msg5994aa299acddb2407996ee8)I beat you on time @rebolek, but you win on content. :^)

rebolek

[20:26](#msg5994aa58ee5c9a4c5fc9d8ba):)

[20:26](#msg5994aa7d614889d475560d30)and now I want to port other Graham's tools :)

NihilCoin\_twitter

[20:27](#msg5994aa94a7b406262d968246)yes, that was the version, ok thanks, let me try it out

[20:43](#msg5994ae8d80d90ca024071f65)ok, it worked after changing to-char to to-binary because the decoded values are raw keys, and even after removing it, because debase returns binary

[21:35](#msg5994ba97578b44a046b7e775)something like this https://gist.github.com/plugnburn/93af4a06ec54b0e6ac26b9b7ecf49be6

## Friday 18th August, 2017

callowaysutton

[03:12](#msg59965b2e76a757f808b7b0ee)hey where would red.redPath be on a Windows 10 64 bit computer?

[03:24](#msg59965e0a210ac2692095b5a4)or settings.json sorry

koba-yu

[11:56](#msg5996d5d92723db8d5eb8f3f8)@callowaysutton you mean vs code extension setting? if you downloaded Red from \[here](http://www.red-lang.org/p/download.html), it is binary you downloaded(it may have the name like "red-063" or "red-\_date\_" )

[12:06](#msg5996d83d80d90ca02410e0e7)Or you mean this?

[12:06](#msg5996d840ee5c9a4c5fd3b8da)https://github.com/red/VScode-extension/blob/master/README.md#configurations

callowaysutton

[15:49](#msg59970c95614889d47560f424)the people on IRC helped me out, it was me just not being vigilant

## Sunday 20th August, 2017

maximvl

[22:18](#msg599a0aa9ee5c9a4c5fe05fff)first version of shell dialect I made over the weekend in 200 loc : https://gitlab.com/maxvel/red-shell-dialect

[22:18](#msg599a0ab1ee5c9a4c5fe06027)Red seems to be extremely productive :D

endo64

[22:30](#msg599a0d8876a757f808c6b66d)@maximvl Cool!

## Monday 21st August, 2017

greggirwin

[05:53](#msg599a755d162adb6d2e199b69)Very cool @maximvl. I'll try to take a look at it for real, soon.

maximvl

[08:27](#msg599a998a210ac26920a668a4)@endo64 @greggirwin sure, all feedback is welcome :)

[08:40](#msg599a9c629acddb2407b23248)I would love to integrate it into something like emacs `*scratch*` to be able to call commands not in line-by-line manner as in shells, but to execute arbitrary things

[08:41](#msg599a9cc9210ac26920a67b17)and with some graphical output support it can become real gui shell replacement :D

[08:43](#msg599a9d17ee5c9a4c5fe28be7)hopefully new console will be able to do things like this

endo64

[10:00](#msg599aaf529acddb2407b28d82)I sometimes want to use Red (or Rebol) on my company's servers (there are a plenty of Ubuntu servers) as a replacement of bash, it is much easier to do some operation on Redbol console than writing cryptic find/grep.  
It would be nice to have a DSL like: "do-something on each file deeply if its create date is later than X and its size is smaller than Y"

[10:02](#msg599aaf9e210ac26920a6d661)For example, switch to shell mode, a `forever` loop inside console which executes the given DSLs would be great.

pekr

[10:14](#msg599ab278578b44a046d0ef0f)@endo64 found this old article. Not sure if it is what I remember from the former Rebolforces article by Jeff Kreis though ..... http://www.cs.unm.edu/~whip/rebol-unix-shell.html

rebolek

[10:15](#msg599ab2c99acddb2407b29f14)@endo64  
&gt; do-something on each file deeply (...)

Sounds like a task for my old `foreach-file` function :) do-something on each file deeply

endo64

[10:31](#msg599ab66a578b44a046d10209)@rebolek @pekr Yes something like that but with a DSL and keeping in the shell mode.

```
shell> move to /tmp if extension = %.png
shell> delete if size > 100 MB and modified < 2017-08-01
```

[10:31](#msg599ab69276a757f808c952e7)Not a well thought example of course :)

rebolek

[10:32](#msg599ab6a3578b44a046d1035c)@endo64 defining the dialect is the hardest part :)

geekyi

[13:44](#msg599ae3d6162adb6d2e1b98cb)This would help a lot if there's a `word!` for traversing trees, like we have the `for-` family to traversing lists

[13:46](#msg599ae4229acddb2407b38499)Able to select from a spectrum between \*depth* first and \*breadth* first

[13:46](#msg599ae43c9acddb2407b385a3)\*transducers* in \*clojure\*?

maximvl

[14:35](#msg599aefa0ba0f0f6e38ca05c3)@endo64 reminds me of CL's `loop` macro

9214

[14:35](#msg599aefcba7b406262db08b1c)@maximvl I think @dockimbel mentioned `loop` dialect (or macro?) somewhere as TBD

maximvl

[14:36](#msg599aefd52723db8d5ec98b75)you could write something like `(loop for file in each-file when (equal (extension file) ".png") do (move file "/tmp"))`

9214

[14:36](#msg599aeff69acddb2407b3bff9)@maximvl is it an actual CL code? :O

maximvl

[14:36](#msg599aeffa578b44a046d22053)yup

9214

[14:37](#msg599af020bc46472974a8b526)I'm sold

maximvl

[14:37](#msg599af037578b44a046d22279)CL doesn't have as many built-in dialects as Red, but two biggest ones are `loop` and `format`

9214

[14:38](#msg599af04a162adb6d2e1bd875)yeah, I know that, just never actually saw them in action

maximvl

[14:38](#msg599af0682723db8d5ec98f98)@9214 scroll through examples here: http://www.gigamonkeys.com/book/loop-for-black-belts.html

[14:38](#msg599af081210ac26920a80c40)there are some bizarre examples :D

[14:44](#msg599af1d4578b44a046d22b2c)just to give you personal example: CL has plenty of iterating facilities, like do, dolist, dotimes and so on

[14:45](#msg599af1fb2723db8d5ec99868)and I tried to remember how and when use each of them, but once I understood loop - this was the only one I used ever since for every case :)

9214

[14:46](#msg599af243ba0f0f6e38ca1489)I feel the same with Red - lots of iterators and all could be boiled down to one keyword to avoid mental baggage

maximvl

[14:46](#msg599af250ee5c9a4c5fe42e70)exactly

pekr

[15:26](#msg599afb93ba0f0f6e38ca4268)There is @greggirwin 's `for`loop proposal, not sure how actual it is ... https://github.com/red/red/wiki/REP-0101---For-loop-function

9214

[15:30](#msg599afc9a2723db8d5ec9c8a5)interesting read, thanks @pekr

greggirwin

[19:29](#msg599b34b5614889d475718e09)@pekr, it's actual in R2 code. Shouldn't be hard to port.

[19:31](#msg599b3509a7b406262db1c5f2)&gt; It would be nice to have a DSL like: "do-something on each file deeply if its create date is later than X and its size is smaller than Y"

@endo64, that was the idea behind http://www.rebol.org/view-script.r?script=file-list.r

[19:33](#msg599b3596a7b406262db1c8ad)4 dialects in one: spec, date, size, and attr. e.g.

```
Examples:
            [%*.txt]
            [%*.txt  changed after  1-Aug-1998]
            [%*.txt  changed before 1-Aug-1998]
            [%*.txt  changed after  1-Aug-1998 >= 10 kb]
            [%*.txt  changed after  1-Aug-1998 <  10 kb]
            [%*.txt  changed after  1-Aug-1998 >= 10 kb  system]
            [%*.txt  changed after  1-Aug-1998 >= 10 kb  not system]
            [%*.txt  changed after  1-Aug-1998 <  10 kb  read-only]
            [%*.txt  changed after  1-Aug-1998 <  10 kb  not read-only]
            [ <  10 kb  %*.txt  not read-only  changed after  1-Aug-1998]
            [not read-only   < 10 kb   changed after 1-Aug-1998  %*.txt]
            [not read-only   < 10 kb   changed after 1-Aug-1998  %*a*.txt]
```

[19:34](#msg599b35dfc101bc4e3a40d2a4)

```
Examples:
            [size >= 1024]
            [less than or equal to 1024 bytes]
            [>= 64 kb]
            [smaller than 2 MB]
            [greater than .5 MB]
            [larger than %file-list.r]
```

[19:35](#msg599b35f6bc46472974aa0bbe)

```
Examples:
            [accessed after 1-jan-2006]
            [created before 1-jan-2006]
            [newer than %test-files.r]
            [older than %file-list.r]
```

endo64

[20:01](#msg599b3c1d2723db8d5ecade3c)@greggirwin That's very useful! Thanks!

## Tuesday 22nd August, 2017

Sunnypt

[00:15](#msg599b77bfc101bc4e3a41d90f)Hi,  
Just started with Red, only a week ago.  
I need a little help. How can I search for a specific word in a string. I mean a sub-string  
i.e. "Hello how are you today" How can I inspect this to know if "how" does or does not exist in the string and if it does, copy it to a variable.  
thanks in advance.  
Sunny.

RnBrgn

[01:07](#msg599b83e8ee5c9a4c5fe6a8c8)@Sunnypt take a look at `find` http://www.red-by-example.org/#find

callowaysutton

[01:25](#msg599b881a2723db8d5ecc0bd0)wait do I put --cgi in the command line or at the top of my red file?

RnBrgn

[01:36](#msg599b8a8e2723db8d5ecc1554)@Sunnypt

```
search:  "how"
either find "hello how are you" search [
     print "found how"][
     print "none"]
```

Sunnypt

[22:39](#msg599cb2be578b44a046d9f813)@RnBrgn thanks for the help.

## Wednesday 23th August, 2017

maximvl

[13:54](#msg599d8925c101bc4e3a4ac677)@greggirwin that's a nice one :D

unchartedworks

[14:05](#msg599d8bc6578b44a046dd75f3)I can’t find join function in red? Is it removed from Red? join \[\[1] \[2] \[3]] == \[1 2 3]

rebolek

[14:07](#msg599d8c04c101bc4e3a4ad288) @unchartedworks no, it's not implemented yet, because `join`'s going to be different from Rebol version.

unchartedworks

[14:09](#msg599d8c93614889d4757b6ac8)@rebolek Thanks. I will write one myself.

## Thursday 24th August, 2017

unchartedworks

[08:59](#msg599e957e66c1c7c477d6f9ff)Can I use Red as an embedded intepreter?

pekr

[09:14](#msg599e98fca7b406262dc03ee6)I think you can. Red has so called libRed, which allows embeddability and there is very cute demo showing the Pong game between the MS Excel and Red window :-)

[09:15](#msg599e991e66c1c7c477d70c99)http://www.red-lang.org/2017/03/062-libred-and-macros.html

9214

[09:15](#msg599e992aa7b406262dc03f9f)@unchartedworks :point\_right: https://doc.red-lang.org/en/libred.html

unchartedworks

[09:19](#msg599e9a379acddb2407c35df1)@9214 Does it support iOS?

9214

[09:20](#msg599e9a52162adb6d2e2b87ef)@unchartedworks that's a tricky question actually :D

[09:21](#msg599e9a87614889d4757fec08)\_maybe\_, though you better wait what our gurus will say

unchartedworks

[09:22](#msg599e9acaee5c9a4c5ff3ee51)@9214 All right. Thanks. :smile:

PeterWAWood

[09:57](#msg599ea2fd76a757f808da55a6)The Red alpha does not have an iOS target so libRed can't be built for iOS yet.

unchartedworks

[10:04](#msg599ea4b99acddb2407c391a5)@PeterWAWood I see. Thanks.

## Friday 25th August, 2017

unchartedworks

[07:32](#msg599fd299ba0f0f6e38df4166)How to define a function parameter type like this, a series of integer!.

meijeru

[07:46](#msg599fd5ceee5c9a4c5ff964cf)The nearest thing to a series of integers is a `vector!` value. Vectors are ordered sequences of values of identical type, which can be `char!` or `integer!` (8/16/32 bits), `percent!` or `float!` (32/64 bits); default: 32 bits for `char!` or `integer!` and 64 bits otherwise.

unchartedworks

[07:58](#msg599fd8a0614889d475856e28)

```
>> vector? [1 2 3]
== false
```

@meijeru I think it’s a limitation of Red, it can’t express composite data type very well.

rebolek

[08:01](#msg599fd949bc46472974be133c)@unchartedworks There is no literal vector representation, `[1 2 3]` is a `block!`, you need to do vector from that:

```
>> vector: make vector! [1 2 3]
== make vector! [1 2 3]
>> vector? vector
== true
```

unchartedworks

[08:04](#msg599fd9fd578b44a046e7879e)@rebolek  
A:

```
>> sum [1 2 3]
>> 6
```

B:

```
>> sum (make vector! [1 2 3])
>> 6
```

I think A is simpler.

meijeru

[08:09](#msg599fdb2b210ac26920bd0860)If you go for block you have to enforce the identity of component type yourself. With vector, the compiler/interpreter does it for you.

unchartedworks

[08:11](#msg599fdbc0a7b406262dc5cc25)That’s why I said it’s a limitation. It should be done by compiler/intepreter but not developers. This is the problem I found. And it’s error-prone.

meijeru

[08:20](#msg599fdde9ba0f0f6e38df7087)Are you saying a type like block! should not exist? That pulls the rug from under the language ...

[08:22](#msg599fde38162adb6d2e310d10)Or are you pleading for a lexical form for vectors?

[08:24](#msg599fdeaf76a757f808dfbbf6)That would be a fair wish, but the lexical space is limited!

unchartedworks

[08:31](#msg599fe046162adb6d2e311661)What I means is that block! is a composite data type. However it can’t express itself very well. I would rather say block is a list. There are many kinds of lists. a list of integer, a list of string…

[08:34](#msg599fe127614889d47585930d)function! has the similar issue. I think function! is a composite data type, however I can’t really describle it in details in Red. For instance function \[x]\[x &gt; 2], the type of this fucntion is integer! -&gt; logic!, there is no way to express it like this in Red as far as I know.

endo64

[08:35](#msg599fe15dbc46472974be3a27)More precisely a block is a list of values (values of any-type, object, integer, block etc.)

[08:37](#msg599fe1b776a757f808dfc6cc)

```
>> b: [] append/only b b
== [[...]]
```

[08:39](#msg599fe257614889d475859964)`function [x][x > 2]` is not exactly integer! -&gt; logic!, it is any-type! to logic! or error!

unchartedworks

[08:40](#msg599fe296c101bc4e3a551402)you are right. I can fix it. function \[x \[integer!]]\[x &gt; 2]

[08:49](#msg599fe4a3162adb6d2e3128ab)

```
>> f: function [x [integer!]][x > 2]
== func [x [integer!]][x > 2]
>> function? f
== true
```

It isn’t enough. What I want is something like this.

```
>> f: function [x [integer!]][x > 2]
== func [x [integer!]][x > 2]
>> function/type? :f [integer! -> logic!]
== true
```

It can be even better.

```
f: function [x [integer!]][x + 3]
filter :f [1 2 3 4]

***Script Error: filter does not allow integer! -> integer! for its f argument
```

rebolek

[08:50](#msg599fe4dc9acddb2407c90803)What you are looking for is

```
>> f: function [x [integer!] return: [logic!]][x > 2]
== func [x [integer!] return: [logic!]][x > 2]
```

[08:51](#msg599fe52bc101bc4e3a551e0e)@unchartedworks of course `[1 2 3]` is simpler than `make vector! [1 2 3]`. Vector is specialized type and it makes sense to use it only when you really need it.

unchartedworks

[08:53](#msg599fe58ec101bc4e3a551f8f)@rebolek Not really. I can’t control how f is been written. What I can do it is to check f's type. I think it should be done by compiler/intepreter but not by developers.

endo64

[08:57](#msg599fe6909acddb2407c90e4b)@unchartedworks Is this what you are asking?  
for `f: function [x [integer!]][x + 3]` compiler should raise an error (at compile time) for `f "x"` ?

[08:58](#msg599fe6c2bc46472974be4fba)Red and Rebol are different by their natures, it's not like Java or C#.

unchartedworks

[09:01](#msg599fe759614889d47585af7a)f is used as another function's parameter. The parameter’s type should be integer! -&gt; logic!, if f doens’t comply with the type-checking, compiler should raise an error.

[09:01](#msg599fe762210ac26920bd48ba)@endo64

rebolek

[09:03](#msg599fe7cfc101bc4e3a552891)@unchartedworks I don't think this feature will be implemented before rewriting compiler to Red.

unchartedworks

[09:04](#msg599fe825a7b406262dc5ff74)@rebolek Are you saying it’s useful and low priority? ;)

endo64

[09:05](#msg599fe86b614889d47585b43d)I don't even think it is possible, how could compiler detect error for below patern:

```
p: either test [1] ["s"]
f p
```

[09:07](#msg599fe8e676a757f808dfe5a7)or even better:  
`f random/only [1 "s" file! none [block] ]`

[09:08](#msg599fe91d66c1c7c477dcc9ea)f's parameter could be anything and compiler can never know before executing that line.

unchartedworks

[09:12](#msg599fe9ea162adb6d2e314152)Assume  
`f: function [x [integer!]][x + 3]`

```
p: either test [1] ["s”]
f p
```

Compiler should raise an error, because either’s return type is any-type! but not integer!.

endo64

[09:16](#msg599feaf4578b44a046e7d0e2)And what will happen for, a warning?

```
either test [p: 1] [p: "s”]
f p
```

unchartedworks

[09:18](#msg599feb5bba0f0f6e38dfab3e)

```
***Script Error: f does not allow any-type! for its x argument
```

endo64

[09:21](#msg599fec2f210ac26920bd5eac)But p is not any-type! it is integer! or string!. So what you ask is strong typing, p should be integer! and cannot change.

unchartedworks

[09:26](#msg599fed54210ac26920bd63b6)The point is that Red compiler should raise an error when p’s type isn’t expected type, integer!.

PeterWAWood

[09:52](#msg599ff36d66c1c7c477dcf755)How can the compiler know the type of value to which p is bound?

9214

[09:57](#msg599ff483ee5c9a4c5ff9f5c6)TL;DR - Red should be Haskell :neutral\_face:

[09:59](#msg599ff51a9acddb2407c9498d)just curious, and what if `either` is rebounded to other function?

[10:00](#msg599ff53e9acddb2407c94a09)what if line above is executed in a dialect with completely different semantics?

maximvl

[10:01](#msg599ff597614889d47585ed02)that's possible of course

[10:02](#msg599ff5b6162adb6d2e31738c)the thing with Red code is you should always know the context

[10:02](#msg599ff5c5ee5c9a4c5ff9fa9c)to understand what is going on

9214

[10:04](#msg599ff63276a757f808e01d33)`block!` is \_code\_, and what code \_does_ depends on how it's evaluated and in which context it resides, I doubt that compiler can figure out all of this (at least in its current alpha stage)

maximvl

[10:04](#msg599ff64bba0f0f6e38dfdd50)`block!` is data actually ;)

9214

[10:05](#msg599ff654210ac26920bd8a09)it depends! ;)

maximvl

[10:05](#msg599ff668bc46472974be9108)once you evaluate it it becomes a code

[10:05](#msg599ff680c101bc4e3a55688f)it's like if you have a brick - it's a brick

[10:06](#msg599ff68e162adb6d2e317702)but if you start nailing things with it - it becomes a hammer :D

9214

[10:06](#msg599ff6bcbc46472974be92cf)is that code or data?

```
[
3 4 6
7 7 7
3 4 0
]
```

one could say that it's a block of integers, but \_maybe_ it's a code for `subleq` dialect?

maximvl

[10:08](#msg599ff70b614889d47585f2e2)well I would say that your paste is data, but in

```
subleq [
3 4 6
7 7 7
3 4 0
]
```

it's a code :D

9214

[10:08](#msg599ff71eba0f0f6e38dfe0d2)ok, to rephrase - `block!` is \_data_ until it's evaluated, and what `block!` \_does_ as \_code_ depends on \_how_ it's evaluated and in which context.

maximvl

[10:08](#msg599ff72bba0f0f6e38dfe142)yeah, code is data anyways

9214

[10:09](#msg599ff774a7b406262dc63f2f)anyway, if you want to stick with Red but code in Haskell, bake a `hs` dialect and enforce strong typing, currying, monads or whatever

maximvl

[10:10](#msg599ff790a7b406262dc63ff8)yep, I'd love to have typed, even pure dialect

unchartedworks

[10:11](#msg599ff7b5578b44a046e80910)typed functional dialect

maximvl

[10:11](#msg599ff7ce162adb6d2e317bff)because it's so easy to make assumptions about proven and checked code

[10:11](#msg599ff7e8ba0f0f6e38dfe4a0)and keep dynamics for quick prototyping and hacky things

9214

[10:11](#msg599ff7ea66c1c7c477dd0b2e)such compiler checks are a good thing, but they will go against language free-formity, thus, they should be optional (not to say that typing is a debatable thing itself!). I think Racket done this in a clever way with its `#lang`s.

maximvl

[10:12](#msg599ff802210ac26920bd92a4)exactly, when it's a dialect - you can use it whether you want

[10:12](#msg599ff81d578b44a046e80bc8)some things are just terrible to write in haskell

[10:12](#msg599ff822a7b406262dc6423c)others are super awesome

9214

[10:13](#msg599ff84466c1c7c477dd0cee)and when it comes to Red `2.0` with its modual toolchain, I think you could just plug in your `hs` compiler module and have fun

[10:13](#msg599ff85ec101bc4e3a55705c)but, that's another story :D

unchartedworks

[10:15](#msg599ff8d8210ac26920bd96aa)No, it won’t against the language itself, it just make it better. For intance, if you don’t define the type of an parameter, then it’s the same as before, otherwise compiler will raise errors if there is an illeagal parameter.

9214

[10:16](#msg599ff8e466c1c7c477dd0fd0)moreover `f` may not be a function, because `function` is not a... well, `function!` constructor.

maximvl

[10:19](#msg599ff9a2614889d47585fc96)modular toolchain

[10:19](#msg599ff9bc614889d47585fcfc)will be a big time

unchartedworks

[10:20](#msg599ff9d09acddb2407c95cbf)Like llvm?

9214

[10:20](#msg599ff9d766c1c7c477dd14e3)even thinking about that gives me goosebumps

maximvl

[10:20](#msg599ff9e3ba0f0f6e38dfecad)but for a DSL we don't really need that, I guess

9214

[10:20](#msg599ff9e5ba0f0f6e38dfed1b)yeah, only smaller and simplier

maximvl

[10:21](#msg599ffa2da7b406262dc64c3d)RAAP - Red as a platform

9214

[10:22](#msg599ffa5a162adb6d2e3186ba)I envision rap songs about RAAP

[10:23](#msg599ffab4578b44a046e814c9)https://docs.racket-lang.org/ts-guide/

[10:28](#msg599ffbd6578b44a046e8196c)or we should just wait for `protect`

[10:29](#msg599ffc0176a757f808e036a3)http://www.rebol.com/docs/words/wprotect.html

[16:58](#msg59a0573776a757f808e20269)@unchartedworks `?` expected "help string", not a `block!` value

unchartedworks

[16:59](#msg59a0575fee5c9a4c5ffbea2e)@9214 I see. Thanks. :)

9214

[16:59](#msg59a05780ba0f0f6e38e1a17a)oh, wait, you actually passed quoted `sort/compare` to it

unchartedworks

[17:02](#msg59a05825162adb6d2e33490a)What’s the difference between function! and any-function!?

9214

[17:04](#msg59a05887578b44a046e9e69c)`function!` is a subset of `any-function!` among with some other datatypes

```
>> any-function!
== make typeset! [native! action! op! function! routine!]
>> function!
== function!
```

unchartedworks

[17:05](#msg59a058ee578b44a046e9e8ee)@9214 Thanks.

toomasv

[17:49](#msg59a06317ee5c9a4c5ffc1eea)@unchartedworks Current \[type hierarchy](https://github.com/toomasv/red-type-hierarchy/blob/master/Red%20type%20hierarchy2.pdf)

abdllhygt

[18:13](#msg59a068b9bc46472974c0c538)Hi

9214

[18:13](#msg59a068cdee5c9a4c5ffc3980)@abdllhygt howdy

abdllhygt

[18:14](#msg59a068f3ba0f0f6e38e1f230)what is "howdy"

9214

[18:14](#msg59a06913a7b406262dc863e3)https://en.wikipedia.org/wiki/Howdy ;)

abdllhygt

[18:15](#msg59a0692f76a757f808e25c7b)oh :) fine thanks and you

9214

[18:15](#msg59a0693c578b44a046ea3907)I'm ok

abdllhygt

[18:15](#msg59a0694bba0f0f6e38e1f33f)i want to develop a programming language

[18:15](#msg59a069569acddb2407cb75f7)red is good for it?

9214

[18:16](#msg59a06976ee5c9a4c5ffc3c61)I would say it's good for domain-specific languages, not sure about general-purpose PLs

abdllhygt

[18:17](#msg59a069a5162adb6d2e339e93)thank you

9214

[18:17](#msg59a069ae578b44a046ea3b8d)you're welcome

abdllhygt

[18:17](#msg59a069cf9acddb2407cb77e2)i think: 70% DSL and 30% normal :)

[18:18](#msg59a069e0ba0f0f6e38e1f68c)i have an idea

unchartedworks

[18:19](#msg59a06a22bc46472974c0cc1e)@toomasv not bad. :)

9214

[18:19](#msg59a06a2776a757f808e26024)note that Red itself is in active developement, if you just want to play around and build a toy programming language - IMO it's a good choice

abdllhygt

[18:20](#msg59a06a80578b44a046ea3e4f)what is IMO?

9214

[18:21](#msg59a06a8ea7b406262dc86ae3)"In my opinion"

abdllhygt

[18:25](#msg59a06b9fee5c9a4c5ffc481d)oh okay

[18:26](#msg59a06bc8ee5c9a4c5ffc4b18)i know that, like lisp or red languages good for language development

[18:27](#msg59a06c2fc101bc4e3a579a12)language are good*

9214

[18:30](#msg59a06ccebc46472974c0d99b)yes, just like Lisps, Red is \[homoiconic](https://en.wikipedia.org/wiki/Homoiconicity) and extremely flexible, has good \[metaprogramming](https://en.wikipedia.org/wiki/Metaprogramming) capabilites and macro (https://en.wikipedia.org/wiki/Macro\_(computer\_science)) system. But unlike Lips, it also has built-in \[TDPL parser](http://www.red-lang.org/2013/11/041-introducing-parse.html).

[18:32](#msg59a06d3066c1c7c477df4aa1)@9214 dang, Gitter can't handle nested parens inside links

abdllhygt

[18:34](#msg59a06db19acddb2407cb88fd)okay, thank you

[18:34](#msg59a06dba9acddb2407cb890f)i will research

9214

[18:34](#msg59a06dc4210ac26920bfcf29):+1:

abdllhygt

[18:35](#msg59a06ddf578b44a046ea4f07)do you develop an app with red?

9214

[18:36](#msg59a06e37ba0f0f6e38e20b5c)yes, small hash decoder, but I haven't released it yet (needs some final polishing)

abdllhygt

[18:39](#msg59a06eca9acddb2407cb8da7):+1:

[18:39](#msg59a06ed266c1c7c477df519e)okay now :)

## Saturday 26th August, 2017

greggirwin

[02:12](#msg59a0d8f0210ac26920c16e7f)@abdllhygt, since Red is still Alpha, most of us are working on tools, functions, and examples for Red, plus testing, rather than production apps. Certainly we can write tools for our own use though.

geekyi

[07:31](#msg59a123c1210ac26920c251e1)

```
red
>> to url! "https://en.wikipedia.org/wiki/Macro_(computer_science)"
== https://en.wikipedia.org/wiki/Macro_%28computer_science%29
```

@9214 \[macro]( https://en.wikipedia.org/wiki/Macro\_%28computer\_science%29 )

9214

[08:52](#msg59a136c066c1c7c477e21a6b)@geekyi that's the spirit!

unchartedworks

[11:09](#msg59a156e5ee5c9a4c5fff8ce9)Hi, does map! support key which type is string?

rebolek

[11:13](#msg59a157c5a7b406262dcbbc67)@unchartedworks of course

```
>> m: #("key" value)
== #(
    "key" value
)
>> select m "key"
== value
```

meijeru

[11:30](#msg59a15bc3ee5c9a4c5fffa03b)Unfortunately, for lexical reasons the expression `m/"key"` is not allowed. But `m/("key")` is.

unchartedworks

[11:31](#msg59a15c0266c1c7c477e29d15)@rebolek Thanks. It works.

```
m1: #(a: 1 2 20 "c" 3)
== #(
    a: 1
    2 20
    "c" 3
)
>> m1/2
== 20
```

What if I want to query the value of the first key value pair and I don’t know the key name.

meijeru

[11:38](#msg59a15d9f614889d4758b8ec0)`keys-of` gives you a block of keys. Pick the first one of that: `select m first keys-of m`

9214

[11:38](#msg59a15db966c1c7c477e2a2cc)

```
text
>> map: #("a key I don't know" value)
== #(
    "a key I don't know" value
)
>> keys-of map
== ["a key I don't know"]
>> values-of map
== [value]
```

unchartedworks

[11:39](#msg59a15df4ee5c9a4c5fffa985)@meijeru @9214 Thanks.

greggirwin

[16:05](#msg59a19c619acddb2407cfc962)&gt; What if I want to query the value of the first key value pair and I don’t know the key name.

@unchartedworks, `map!` entries are unordered, so there is no guarantee you will always get them back in the same order on each access. Accessing them that way works fine though.

unchartedworks

[16:06](#msg59a19c95bc46472974c5396b)@greggirwin I thought it’s ordered map.

greggirwin

[16:08](#msg59a19d14ba0f0f6e38e6616c)I could be wrong, but I don't believe that's a guarantee. Maps are intended to be accessed by key, not index.

[16:10](#msg59a19d7976a757f808e6e208)

```
>> m: #(a: 1 b: 2 c: 3)
== #(
    a: 1
    b: 2
    c: 3
)
>> keys-of m
== [a b c]
>> m/b: none 
== none
>> m/b: 22
== 22
>> keys-of m
== [a b c]
>> m/bb: 222
== 222
>> keys-of m
== [a b c bb]
```

rebolek

[16:13](#msg59a19e2e66c1c7c477e3a86e)Currently, the order of keys is always same, but that may change with implementation, so theoretically it is not guaranteed, but right now it practically is.

DVL333

[22:44](#msg59a1f9c2210ac26920c57898)Hello everybody!  
I've interested by Red. And some questions had appeared...  
Red is considerated to be a language for hardware and driver creation. What about speed and file size of its apps? Is there any tests, comparisons with other languages?

I compiled "Hello world" app, without dependencies. And was badly surprised - its size is about 600KB without GUI and about 900KB with GUI (Windows platform). In the same time, size of that program written with Nim is much less - about 22 and 27 KB respectively (with optimization)! May be Red compiler has any options, that allow to reduce file size? Or any plans to optimize the compiler in the future? What results is expected?

PeterWAWood

[23:13](#msg59a2008bc101bc4e3a5d671d)The Red/System dialect should be used for hardware and driver creation. The size of a "Hello World" app created by the current bootstrap compiler is 106KB. Optimisation is not possible with the bootstrap compiler.

## Sunday 27th August, 2017

greggirwin

[00:55](#msg59a21881ba0f0f6e38e8360a)@DVL333, at 600K you get the entire Red runtime, as there is no modular compilation yet (as Peter noted about optimizations as well). The extra for the GUI system adds the other 300K. Nim compiles to C, so gets the benefit of those compiler systems. Red, on the other hand, is a self-contained toolchain. That's why no optimizations or other benefits yet.

DVL333

[10:42](#msg59a2a229578b44a046f23724)Ok, thank you very much. As I consider, it's temporary situation and compiler will be improved in the future. :+1:

Oldes

[12:39](#msg59a2bd6a9acddb2407d3a7a3)Red/System compiled file is also about 20KB. Even less without runtime.. but than it is all up to user to implement what is needed.

## Monday 28th August, 2017

unchartedworks

[09:10](#msg59a3ddfdee5c9a4c5f08dc93)Hi ,is there any way to create a private function? For instance it’s only in file scope.

rebolek

[09:18](#msg59a3e000162adb6d2e4024e4)@unchartedworks I'm not sure what you mean by \*file scope\*, but all functions are anonymous in Red. It's up to you how much you expose them (Red can be more helpful in this area, but you have all the control).

unchartedworks

[09:21](#msg59a3e0ae578b44a046f707ac)@rebolek I don’t want to expose some internal functions which should be accessed only by other functions which are in the same file.

rebolek

[09:22](#msg59a3e0d666c1c7c477ebec44)@unchartedworks I see. Than you need to wait for modules.

unchartedworks

[09:29](#msg59a3e297578b44a046f71258)@rebolek Thanks.

[12:44](#msg59a41036ba0f0f6e38ef8697)Why are the results the same? Is it a bug of sort?

```
>> xs: "dcba"
== "dcba"
>> sort/compare xs func [x y][x < y]
== "abcd"
>> sort/compare xs func [x y][x > y]
== "abcd"
```

[12:47](#msg59a410f5ba0f0f6e38ef8b14)If the input is an array of string, it works as expected.

```
>> xs: ["d" "c" "b" "a"]
== ["d" "c" "b" "a"]
>> sort/compare xs func [x y][x < y]
== ["a" "b" "c" "d"]
>> sort/compare xs func [x y][x > y]
== ["d" "c" "b" "a"]
```

endo64

[13:37](#msg59a41ca2578b44a046f82745)I think `sort/compare` ignores the given function if the parameters are `string!`  
Check this out: `sort/compare xs func [x y] [ 1 / 0 ] ; == == "abcd"`  
No error!

unchartedworks

[14:04](#msg59a422e0c101bc4e3a655481)I think it’s a bug.

rebolek

[14:18](#msg59a42646bc46472974ced159)Yes, looks like a bug to me.

greggirwin

[16:45](#msg59a44896c101bc4e3a6615ab):point\_up: \[August 28, 2017 3:21 AM](https://gitter.im/red/red/welcome?at=59a3e0ae578b44a046f707ac) @unchartedworks, you can create a context in the file and only export those funcs you want globally visible, by using `set`.

9214

[16:46](#msg59a448d876a757f808f11902)@greggirwin but then it's the matter of writing `obj/foo`, no?

unchartedworks

[17:46](#msg59a456e6614889d475970733)@greggirwin It doesn’t work for me. I don’t want to use functions with an object/context name.

9214

[17:47](#msg59a457388f4427b462aa2d50)@unchartedworks you can `bind` block with function usage to this object instead.

[17:47](#msg59a4574276a757f808f15ff8)or to multiple objects at once

[17:48](#msg59a4576966c1c7c477ee335f)

```
text
>> obj: object [answer: 42]
== make object! [
    answer: 42
]
>> do bind [print answer] obj
42
```

greggirwin

[17:59](#msg59a459e776a757f808f16b95)`Set`, used in a context, sets the word in the global context:

```
>> context [set 'global-fn does [print "Hey!"]]
== make object! []
>> global-fn
Hey!
```

[18:00](#msg59a45a2c9acddb2407da4ff8)You can also, of course, create the functions in the context and then set global words to refer to just those you want exported.

[18:01](#msg59a45a6a210ac26920ce7265)

```
>> obj: context [fn: does [print "Hey!"]]
== make object! [
    fn: func [][print "Hey!"]
]
>> global-fn: get in obj 'fn
== func [][print "Hey!"]
>> global-fn
Hey!
```

9214

[18:02](#msg59a45ab666c1c7c477ee4441)

```
text
>> obj: context [foo: does [print "hey"] bar: does [print "there"]]
== make object! [
    foo: func [][print "hey"]
    bar: func [][print "...
>> set [my-foo my-bar] reduce [:obj/foo :obj/bar]
== [func [][print "hey"] func [][print "there"]]
>> my-foo
hey
>> my-bar
there
```

unchartedworks

[18:02](#msg59a45ab78f4427b462aa3fb9)

```
BaseKit: object [delete*: func [xs][head remove xs]]
delete*: :BaseKit/delete*
print mold delete* [1 2 3]

[2 3]
```

[18:04](#msg59a45b3dc101bc4e3a6674be)@9214 @greggirwin Thanks. It’s working.

greggirwin

[18:08](#msg59a45c0bc101bc4e3a66797c)@9214, my old gray roots are showing, `get in` vs `get-path!` syntax. :^)

[18:27](#msg59a46084162adb6d2e42a6fb)@unchartedworks, a little more explicit approach (idea):

```
export: function [
	"Export words to the global context"
	obj   [object!] "Context to export from"
	words [block!]  "Words to export"
	/as names [block!] "Use these names in the global context"
][
	if all [as  (length? words) <> (length? names)][
		print "You need a name for each word when using /as."
		halt
	]
	foreach word words [
		set either as [also  first names  names: next names][word] :obj/:word
	]
	words
]
obj: object [a: 1 b: does [print "Hey!"]]
export obj [a b]
export/as obj [a b] [aa bb]
```

Couldn't find my old one just now.

unchartedworks

[18:29](#msg59a46100210ac26920ce8fb5)@greggirwin :)

## Tuesday 29th August, 2017

geekyi

[00:49](#msg59a4ba1d8f4427b462abf3ad)@unchartedworks :point\_up: \[August 28, 2017 5:44 PM](https://gitter.im/red/red/welcome?at=59a41036ba0f0f6e38ef8697) didn't see this chat, I posted details in your bug https://github.com/red/red/issues/3003  
\*tl;dr* It's like @endo64 said, not implemented

endo64

[09:09](#msg59a52f36578b44a046fce1e0)qtxie fixed it on latest commit. It works now.

unchartedworks

[11:36](#msg59a551cd66c1c7c477f26c49)I use a workaround, because I can’t build binary compiler from source.

9214

[11:37](#msg59a55213ba0f0f6e38f52f59)@unchartedworks just grab the latest automated build

unchartedworks

[11:38](#msg59a55238210ac26920d28a17)@9214 Thanks.

tekjar

[11:52](#msg59a55571578b44a046fd938f)Hi. I'm trying this simple example on ubuntu16.04

[11:52](#msg59a5557976a757f808f59dae)

```
Red [needs: 'view]
view [button "OK"]
```

[11:53](#msg59a555af162adb6d2e46ab09)I get this error

[11:53](#msg59a555b8210ac26920d29b58)

```
*** Script Error: view has no value
*** Where: catch
*** Stack:
```

9214

[11:54](#msg59a55611bc46472974d3f735)@tekjar hi, GTK backend is a work in progress (though you can see recent changes in \[`gui-branch`](https://gitter.im/red/red/gui-branch) room). Meanwhile, just stick with Wine (if that's ok for you).

tekjar

[11:56](#msg59a5565dbc46472974d3f82f) @9214 Ohh..Ok..Thanks :)

9214

[11:56](#msg59a556649acddb2407de8d2e)@tekjar you're welcome

unchartedworks

[18:39](#msg59a5b4d08f4427b462b0665b)

```
view [text (concat replicate 4 "OK”)]

*** Script Error: VID - invalid syntax at: [(concat replicate 8 "OK")]
*** Where: do
*** Stack: view layout cause-error
```

It doesn’t work, why?

```
oks: concat replicate 4 "OK"
;;"OKOKOKOK"
view [text oks]
```

It works.

9214

[18:43](#msg59a5b5ed76a757f808f796eb)@unchartedworks use `compose` to evaluate the parens

[18:44](#msg59a5b6299acddb2407e07b06)

```
text
>> view compose [text (append reverse form 'ih #"!")]
```

unchartedworks

[18:48](#msg59a5b6f7578b44a046ff8aa4)@9214 It’s working. Thanks. :)

greggirwin

[20:58](#msg59a5d573578b44a046002501)Only a couple facets support arbitrary expression at this time, as an experiment. `Data` is one. e.g. `view [text-list data (collect [repeat i 10 [keep form i]])]`

## Wednesday 30th August, 2017

unchartedworks

[09:36](#msg59a68706ba0f0f6e38faa0d4)It’s good to know.

[09:40](#msg59a68805210ac26920d7f7f6)Which is better? A or B?  
(&amp; is a reverse application operator.)  
(-&gt; is function operator)

```
to-charints: [xs] -> [map ([x] -> [to-integer #"a" + x]) xs]
to-chars:    [xs] -> [map :to-char xs] 
to-strings:  [xs] -> [map :to-string xs]

;A
[0 1 2 3] & :to-charints & :to-chars & :to-strings & :concat & :uppercase & :print

;B
[0 1 2 3] >>> [to-charints to-chars to-strings concat uppercase print]
```

```
ABCD
ABCD
```

rebolek

[09:44](#msg59a688e18f4427b462b3e37f)@unchartedworks You're certainly good at obfuscation :) Once I will understand what is going there, I may answer, but not sooner :)

unchartedworks

[09:46](#msg59a68965b16f264642e8b86e)@rebolek not really. ;)

9214

[09:50](#msg59a68a5e76a757f808fafef4)\*B* seems to be more modular and flexible

[09:52](#msg59a68ac4ee5c9a4c5f14d12d)though it uses rebinded `>>>`

unchartedworks

[09:54](#msg59a68b4776a757f808fb02ee)@9214 I don’t use &gt;&gt;&gt; for bitwise operations.

9214

[09:56](#msg59a68be09acddb2407e3ff57)I believe `to-strings concat` could be replaced with `rejoin`

unchartedworks

[09:59](#msg59a68c678f4427b462b3f577)

```
chars-to-string:  [xs] -> [concatMap :to-string xs]
```

9214

[10:01](#msg59a68cf09acddb2407e404b4)

```
text
>> x: []
== []
>> extract/into "abcd" 1 x
== [#"a" #"b" #"c" #"d"]
>> x
== [#"a" #"b" #"c" #"d"]
>> rejoin x
== "abcd"
```

unchartedworks

[10:50](#msg59a698679acddb2407e43921)rejoin is strange.

```
>> rejoin [#"a" #"b" #"c"]
== "abc"
>> rejoin ["a" "b" "c"]
== “abc”
>> rejoin [[a] [b] [c]]
== [a [b] [c]]
```

codenoid

[12:21](#msg59a6adb79acddb2407e49b4c)please, how to install on MAC

9214

[12:22](#msg59a6adfc9acddb2407e49c7c)@codenoid grab release for MacOS \[here](http://www.red-lang.org/p/download.html)

codenoid

[12:22](#msg59a6ae0b66c1c7c477f89396)then ? what i must do ?

9214

[12:23](#msg59a6ae2cba0f0f6e38fb5848)I believe just double-click on it ;)

codenoid

[12:23](#msg59a6ae4f162adb6d2e4cbfc4)is not executable file on here :(

[12:23](#msg59a6ae5cee5c9a4c5f157eeb)\*opened as text file

9214

[12:24](#msg59a6ae92162adb6d2e4cc0f1)what about `./red-063` from shell?

codenoid

[12:24](#msg59a6ae9a614889d475a15a96)whait

9214

[12:25](#msg59a6aebac101bc4e3a70a562)is that "wait" or "what"? :)

codenoid

[12:25](#msg59a6aec2162adb6d2e4cc1b0)yasss

9214

[12:26](#msg59a6af0aba0f0f6e38fb5d4b)anyway, I'm not MacOS guy, but if launching downloaded binary with `./red-063` doesn't work, let's wait for someone with OSX at hand to help you.

dockimbel

[12:27](#msg59a6af4b9acddb2407e4a475)@codenoid From terminal:

```
chmod +x red-063
./red-063
```

9214

[12:28](#msg59a6af658f4427b462b49a58)oh, right, `chmod`, my \*nix skills are rusty :(

dockimbel

[12:29](#msg59a6af908f4427b462b49aef)Once we get the GUI console on macOS, it will be as simple to run as on Windows.

codenoid

[12:32](#msg59a6b05376a757f808fbbe84)

```
~/Downloads ᐅ ./red
zsh: permission denied: ./red
~/Downloads ᐅ sudo chmod -R 777 red
Password:
~/Downloads ᐅ ./red
Compiling compression library...
Compiling Red console...
--== Red 0.6.3 ==--
Type HELP for starting information.

>>
```

[12:32](#msg59a6b05a76a757f808fbbe92)done @dockimbel ;)

dockimbel

[12:33](#msg59a6b0818f4427b462b4a089)@codenoid :+1: Feel free to ask questions about Red learning in the \[red/help](https://gitter.im/red/red/help) group.

codenoid

[12:36](#msg59a6b14276a757f808fbc367)ok ^^, thanks ^^ , i'm really new in programming world, my background is text plain ;) :+1:

dockimbel

[12:37](#msg59a6b173bc46472974da0d8d)@codenoid No problem, we were all beginners in programming at some point. ;-)

codenoid

[13:51](#msg59a6c2ee162adb6d2e4d2c5f)i just write  
`view [text "Hello Mac World!"]` at vscode  
and got `invalid Red program`, what wrong?

is there any documentation?

9214

[13:52](#msg59a6c3008f4427b462b50ac1)@codenoid you probably forgot `Red []` header

[13:52](#msg59a6c30dbc46472974da6e3b)https://doc.red-lang.org/

codenoid

[13:52](#msg59a6c326c101bc4e3a711398)work in progress :/

9214

[13:53](#msg59a6c36dbc46472974da6f11)as well as the language itself, bear in mind that its version is `0.6.3`, not `1.0.0`

codenoid

[13:54](#msg59a6c392ba0f0f6e38fbc5ad)nice http://www.red-by-example.org/index.html

9214

[13:55](#msg59a6c3e6bc46472974da722c)\[Rebol/Core user guide](http://www.rebol.com/docs/core23/rebolcore.html) is essential, \[Red wiki](https://github.com/red/red/wiki) too.

codenoid

[13:56](#msg59a6c3f9c101bc4e3a71177c)haha, success, my first GUI app with Red

[13:56](#msg59a6c41abc46472974da72fd)&gt; \[Rebol/Core user guide](http://www.rebol.com/docs/core23/rebolcore.html) is essential, \[Red wiki](https://github.com/red/red/wiki) too. thanks :+1:

9214

[13:57](#msg59a6c4388f4427b462b511ab)@codenoid :point\_right: https://gist.github.com/9214/784e7f7af2342f117bc67a8e2698855b

codenoid

[14:28](#msg59a6cb7cba0f0f6e38fbef75)`undefined word ask` , is `ask` for getting STDIN deprecated or ?

[14:30](#msg59a6cbfc614889d475a1f5b6)https://groups.google.com/forum/#!topic/red-lang/7LjOOj5Yg7E

9214

[14:34](#msg59a6cd00162adb6d2e4d654a)I believe `ask` doesn't work only then compiling

rebolek

[14:42](#msg59a6cef09acddb2407e5476f)@codenoid `ask` is specific for console, you need to `#include` this file: https://github.com/red/red/blob/master/environment/console/input.red

unchartedworks

[15:22](#msg59a6d82f66c1c7c477f9709e)Hi, how to work around this issue?

```
compose-function: function [
    f [any-function!]
    g [any-function!]
][
    return func [x][f x]
]

f1: func [x][x + 1]
g1: func [x][x * 2]

fg1: (compose-function :f1 :g1)
print (fg1 3)

*** Script Error: f is not in the specified context
```

9214

[15:27](#msg59a6d95276a757f808fc9735)@unchartedworks

```
>> chain: func ['f 'g][func [x] reduce [f g 'x]]
== func ['f 'g][func [x] reduce [f g 'x]]
>> foo: func [x][x + 1]
== func [x][x + 1]
>> bar: func [x][x * 2]
== func [x][x * 2]
>> qux: chain foo bar
== func [x][foo bar x]
>> qux 3
== 7
>> qux 42
== 85
```

unchartedworks

[16:32](#msg59a6e892614889d475a291bc)@9214 There is a problem. chain f g

[16:33](#msg59a6e8d8b16f264642eaa673)The function names can't be f or g, otherwise it won't work.

9214

[16:34](#msg59a6e9069acddb2407e5d12f)what do you mean?

```
>> f: func [a][a + 1]
== func [a][a + 1]
>> g: func [b][b * 2]
== func [b][b * 2]
>> h: chain f g
== func [x][f g x]
>> h 3
== 7
>> h 42
== 85
>> f 1
== 2
>> g 2
== 4
```

[16:39](#msg59a6ea44ba0f0f6e38fc91c8)or maybe

```
>> chain: func [f g][func [x] reduce [:f :g 'x]]
== func [f g][func [x] reduce [:f :g 'x]]
>> c: chain func [x][x + 1] func [x][x * 2]
== func [x][func [x][x + 1] func [x][x * 2] x]
>> c 3
== 7
>> c 42
== 85
```

unchartedworks

[16:47](#msg59a6ec0f162adb6d2e4e04de)Sorry, It is my mistake. I can't duplicate the issue.

[16:50](#msg59a6ecbf162adb6d2e4e07b8)The second is better for me. Thanks.

## Thursday 31st August, 2017

9214

[02:13](#msg59a770e2162adb6d2e504892)Lo and behold!

I've spent last month working on a \[tiny app](https://github.com/9214/daruma) about which I really care about. I also wrote an \[article](https://9214.github.io/13) about this experience and there's a lot (clumsy disguised :stuck\_out\_tongue\_winking\_eye:) Red advocacy. Any feedback is appreciated, as this is my first "serious" piece of software and full-release-circle-open-source experience.

I also leaved a couple of \[issues](https://github.com/9214/daruma/issues) (dare I say \*issues\*?) for other Red newbies and newcomers who want to dabble their feets with the language and contributing. Let's make the world a better place ;)

toomasv

[05:11](#msg59a79a9ac101bc4e3a74d8c8)@9214 That's `Aww yiss!` It really is! (Not that I understood anything :pensive:)

greggirwin

[05:12](#msg59a79ad8bac826f05464d9bd)Thanks @9214 ! Late here, but I will try to look tomorrow.

9214

[07:29](#msg59a7badb8f4427b462b92f85)@toomasv oh c'mon, is it that bad? :(

Oldes

[08:02](#msg59a7c2a6bc46472974decd36)@9214 wau... interesting reading :o)

9214

[08:03](#msg59a7c2cc8f4427b462b94d48)thanks @Oldes

toomasv

[08:58](#msg59a7cfae210ac26920ddb294)@9214 Not bad at all! I'm just too dumb for the crypto stuff :(. Nevertheless I enjoyed the reading :)

9214

[09:00](#msg59a7d014614889d475a66f84)@toomasv think of it as of super-sofisticated `parse` rule :)

toomasv

[09:04](#msg59a7d10ac101bc4e3a75bc86):joy:

x86128

[09:54](#msg59a7dce1162adb6d2e51ef8f)Hello! Is any simple way to read VERY large text file line by line to process each line individually, not all lines at once, like "read" do? My task is to select and print to stdout some records from LARGE CSV-file.

9214

[09:59](#msg59a7ddec8f4427b462b9d008)@x86128 hi! Curent I/O support is pretty basic, I believe what you ask should come with `port!` datatype and full blown I/O support in `0.7.0` release

PeterWAWood

[10:05](#msg59a7df5cb16f264642eec277)@x86128 This might help:

```
>> write %test.csv "1;2;3^/4;5;6"
>> foreach line read/lines %test.csv [print line]
1;2;3
4;5;6
```

[10:05](#msg59a7df7cbac826f054661089)I need to check if the file is read one line at a time or converted after being read.

x86128

[10:07](#msg59a7dfccc101bc4e3a760258)@PeterWAWood thanks for reply, i checked this. red-0.6.3 just falls with access violation...

PeterWAWood

[10:10](#msg59a7e09dc101bc4e3a76069b)I ran the above code with red-0.6.3

[10:11](#msg59a7e0b866c1c7c477fdf187)Which directory is your red-0.6.3 in?

x86128

[10:15](#msg59a7e1cb614889d475a6c079)@PeterWAWood i'm talking about my case when I'm reading a large CSV (about 1.2G).

[10:15](#msg59a7e1cd162adb6d2e520436)$ /usr/bin/time ./vvvv

\*\** Runtime Error 1: access violation  
\*\** at: F76B71B1h  
Command exited with non-zero status 1  
6.24user 0.57system 0:06.89elapsed 98%CPU (0avgtext+0avgdata 3786424maxresident)k  
0inputs+0outputs (0major+368489minor)pagefaults 0swaps

rebolek

[10:16](#msg59a7e20566c1c7c477fdf913)@x86128 you need to wait for full IO support in 0.7.0, currently it's not possible to access file on disk, only to load it to memory.

x86128

[10:17](#msg59a7e2218f4427b462b9e475)@rebolek thanks

9214

[10:22](#msg59a7e36aee5c9a4c5f1af6c6)@x86128 :point\_right: there's also \[`red/Russian`](https://gitter.im/red/Russian) room if you want to join :)

rebolek

[10:23](#msg59a7e3b19acddb2407e9f17b)да

x86128

[10:25](#msg59a7e40dee5c9a4c5f1af9b1)@9214 @rebolek cool!

unchartedworks

[11:07](#msg59a7ee0ab16f264642ef09fa)read/lines is different from many functions. I even can’t get its type. Is it a bug?

```
>> type? :type?
== native!
>> type? :read/lines
*** Script Error: unsupported type in :read/lines get-path
*** Where: type?
*** Stack:
```

rebolek

[11:09](#msg59a7ee4dee5c9a4c5f1b2922)@unchartedworks `/lines` is an `refinement!`, `read/lines` is just `read`.

9214

[11:10](#msg59a7ee93ba0f0f6e3800f31f)@unchartedworks

```
>> type? :form
== action!
>> type? /part
== refinement!
>> type? :form/part
*** Script Error: unsupported type in :form/part get-path
*** Where: type?
*** Stack:  

>> type? quote :form/part
== get-path!
```

rebolek

[11:10](#msg59a7eea9162adb6d2e523e4a)@9214 Thanks.

9214

[11:10](#msg59a7eeb68f4427b462ba1d1c)@rebolek да ;)

rebolek

[11:11](#msg59a7eed9bac826f054665668)@9214 спосиба :)

9214

[11:12](#msg59a7ef078f4427b462ba1e3d)you've made my day

unchartedworks

[11:14](#msg59a7ef88ee5c9a4c5f1b2ee4)How to catch the error?

```
>> try [type? :read/lines]
*** Script Error: unsupported type in :read/lines get-path
*** Where: type?
*** Stack:
```

rebolek

[11:15](#msg59a7efbdc101bc4e3a764a0b)@unchartedworks you've just caught the error with `try`

9214

[11:15](#msg59a7efc98f4427b462ba21fb)or

```
>> attempt [type? :read/lines]
== none
```

rebolek

[11:15](#msg59a7efdf210ac26920de42ab)

```
>> ret: try [1 / 0]
*** Math Error: attempt to divide by zero
*** Where: /
*** Stack:  

>> type? ret
== error!
```

9214

[11:16](#msg59a7f00e210ac26920de4410)

```
text
>> probe try [type? :read/lines]
make error! [
    code: 330
    type: 'script
    id: 'invalid-path-get
    arg1: :read/lines
    arg2: none
    arg3: none
    near: none
    where: 'type?
    stack: 40667144
]
```

rebolek

[11:16](#msg59a7f0239acddb2407ea2bd9)The error is returned to console, because it is last value, but it does not break the run of the script:

```
>> try [1 / 0] 1 + 1
== 2
```

unchartedworks

[11:17](#msg59a7f05dbc46472974df9c9a)@rebolek I see. Thanks.

[11:18](#msg59a7f079bc46472974df9cfa)attempt is better in my case.

[11:40](#msg59a7f5bebc46472974dfb7e2)Is it a bug?

```
>> print mold type? first [read/lines]
path!
```

9214

[11:41](#msg59a7f5d5162adb6d2e525db0)why do you think it's a bug?

unchartedworks

[11:41](#msg59a7f5f7210ac26920de5f5a)

```
>> type? first [read]
== word!
```

9214

[11:42](#msg59a7f625bc46472974dfb95a)@unchartedworks yes, because `block!` contains either `any-word!`s or `immediate!`s (I think), oh, and `series!`

[11:42](#msg59a7f63d66c1c7c477fe5a52)

```
text
>> type? get first [read]
== action!
```

unchartedworks

[11:48](#msg59a7f79766c1c7c477fe5fed)@9214 I found a way to work around it.

```
>> f: function [x] reduce [first [read/lines] 'x]
== func [x][read/lines x]
>> f %/etc/passwd
== ["##" "# User Database" "# " {# Note that this file is consulted…
```

[14:15](#msg59a81a0e66c1c7c477ff1657)How to define an optional type like Racket does?

```
> (safe-first '(#\a #\b #\c))
(just #\a)
> (safe-first '())
#<nothing>
```

9214

[14:20](#msg59a81b49162adb6d2e531699)well, that's a tricky one, what specifically are you trying to achieve?

[14:21](#msg59a81b5666c1c7c477ff1c16)for me it looks like an alias for `get/any`

[14:23](#msg59a81bd9210ac26920df2732)

```
text
>> a: 'setted!
== setted!
>> x: [a b]
== [a b]
>> probe get/any first x
setted!
== setted!
>> probe get/any second x
unset
```

unchartedworks

[14:36](#msg59a81edc162adb6d2e532850)@9214 Optional values provides a reasonable framework for managing failable computations in a consistent and extensible way. For example, consider an operation that can fail.

```
> (define (safe-first lst)
    (if (empty? lst)
        nothing
        (just (first lst))))
```

9214

[14:37](#msg59a81f35bac826f05467419b)`attempt`,`try`, `get/any` and `set/any` are your friends

maximvl

[14:40](#msg59a81fdb9acddb2407eb1eac)@unchartedworks what you are asking is higher-level framework than pure Red

[14:40](#msg59a81febbc46472974e09cb6)but the good news is you can implement one yourself ;)

9214

[14:41](#msg59a82036614889d475a7f2e4)you may call it... pu\*\*red\** or something

[14:43](#msg59a8208966c1c7c477ff3bbf)personally I always try to define failabale funcs in such a way that they return either result or `none`

unchartedworks

[14:43](#msg59a82094210ac26920df3cda)@maximvl I am not expecting Red supports Algebraic data type. However if it doesn’t support simple data type like Maybe, I have no idea where to start.

maximvl

[14:44](#msg59a820c1bc46472974e0a1ac)@unchartedworks maybe is super easy, `if error? e: try compose/deep [return [just (code)]] [return 'nothing]`

unchartedworks

[14:45](#msg59a821059acddb2407eb24cb)@9214 That’s not enough. Maybe is just a start point. I would like to have Either Error Data if I know how to implment Maybe.

9214

[14:45](#msg59a8210fee5c9a4c5f1c2b0a)though `unset` could be considered as a nothing

[14:46](#msg59a8213cbc46472974e0a473)idk, pass everything in a container-like blocks with `['type var]` spec

maximvl

[14:47](#msg59a8217cbc46472974e0a5c0)you can use simple objects to implement it like `make object [type: 'just value: 10]` and `make object! [type: 'nothing value: none]`

9214

[14:47](#msg59a821829acddb2407eb2723)or an `object!`

[14:47](#msg59a8218ebac826f054674d6f)duh, @maximvl was faster

maximvl

[14:47](#msg59a82198614889d475a7fad6)and make few functions like `is-nothing`, `from-just` etc

[15:03](#msg59a8253dc101bc4e3a775ca2)for the stuff like `Either` you need a proper type checking system

[15:04](#msg59a82561ba0f0f6e3802025a)otherwise you are just replacing `if`s with checks for types

[15:04](#msg59a8257b8f4427b462bb39ef)I'd like to have such system implemented in Red as well :)

unchartedworks

[15:04](#msg59a8258cba0f0f6e3802031d)I think it’s a good start. Thanks.

[15:05](#msg59a825a7162adb6d2e534ba1)

```
->: make op! :function

Nothing: [] -> [make object! [type: 'Nothing]]
Just: [x] -> [make object! [type: 'Just value: x]]
isJust: [x [object!]] -> [x/type == 'Just]
isNothing: [x [object!]] -> [x/type == 'Nothing]
fromJust: [x [object!]] -> [x/value]

print Just 3
print isJust Just 3
print isJust Nothing
print Nothing
print isNothing Nothing
print isNothing Just 3
```

```
type: 'Just
value: 3
true
false
type: 'Nothing
true
false
```

maximvl

[15:05](#msg59a825d7210ac26920df5863)looks good

[15:06](#msg59a826109acddb2407eb412e)the naming looks strange for Red though, we prefer dashed lower-case eg: `is-just`

unchartedworks

[15:08](#msg59a82674614889d475a814b2)You are right. It’s a dialect. That’s why it looks different.

maximvl

[15:11](#msg59a827378f4427b462bb4649)the dialect could look like `typed [x: nothing x >>= first]` to return 'nothing

unchartedworks

[15:13](#msg59a8277c162adb6d2e535424)That’s what I am going to do. To implement &gt;&gt;=

[16:49](#msg59a83e158f4427b462bbbbfd)blackjack

```
hit:      [x] -> [Just (x + 8)]
stand:    [x] -> [either x > 21 [Nothing][Just x]]
win:      [x] -> [Just "$1000"]
showtime: [x] -> [Just ("You win " ++ x ++ "!")]

blackjack: [x [object!]] -> [x >>= :hit >>= :hit >>= :stand >>= :win >>= :showtime]
r1: blackjack Just 3
r2: blackjack Just 8
print r1
print r2
```

```
type: 'Just
value: "You win $1000!"
type: 'Nothing
```

greggirwin

[18:45](#msg59a85933bc46472974e1c69b):point\_up: \[August 31, 2017 8:43 AM](https://gitter.im/red/red/welcome?at=59a82094210ac26920df3cda) @unchartedworks, where do you start in any other lang that doesn't have `Maybe`? You're on track, though. A dialect is the way to go about this. If you think of Red as a "value based language" (just made that up), maybe it will help. When you want something like `Maybe`, it's up to you to choose which value type represents the non-value. As @maximvl said, the most common way is to use `none!`, with the trick being that `none!` is a valid value in some contexts, not an indication of failure.

unchartedworks

[18:51](#msg59a85ac3210ac26920e060ad)@greggirwin I tried to use none and Nothing both. I don’t have a problem to change isNothing or isJust, however `none == Nothing` is false. I have to override == to work around this issue. I think it might be a mistake to mix them.

maximvl

[19:30](#msg59a863cdba0f0f6e38033e61)@unchartedworks `Nothing: none` ?

unchartedworks

[19:31](#msg59a8642eee5c9a4c5f1d762b)@maximvl

```
Nothing: [] -> [make object! [type: 'Nothing]]
isNothing: [
    "returns True iff its argument is Nothing."
    x [object! none!]
] -> [and’ [(x/type == ‘Nothing) (x == none)]
```

[19:32](#msg59a8644cba0f0f6e38034063)It doesn’t work. Nothing == none

[19:33](#msg59a864759acddb2407ec861a)Unless I override == and &lt;&gt;.

[19:34](#msg59a864b3210ac26920e09243)(isNothing none) == (isNothing Nothing) it works.

[19:35](#msg59a864ff9acddb2407ec891e)I want to keep it simple, this is the final one.

```
Nothing: [] -> [make object! [type: 'Nothing]]
Just: [x] -> [make object! [type: 'Just value: x]]
isJust: [
    "returns True iff its argument is of the form Just _"
    x [object!]
] -> [x/type == 'Just]

isNothing: [
    "returns True iff its argument is Nothing."
    x [object!]
] -> [x/type == 'Nothing]
```

maximvl

[19:38](#msg59a865a5162adb6d2e548712)@unchartedworks well, you don't have to make Nothing an object

unchartedworks

[19:38](#msg59a865c166c1c7c477009f98)@maximvl what’s the other option?

maximvl

[19:39](#msg59a865dc162adb6d2e5488ce)`Nothing: none` :) and check with `none! = type? x`

[19:39](#msg59a865fdc101bc4e3a789dce)btw you can use `?` in names, like `just? x`, `nothing? x`

unchartedworks

[19:41](#msg59a86671614889d475a95ea5)Type-Checking is a good thing. isNothing read/lines

```
>> type? :read/lines
*** Script Error: unsupported type in :read/lines get-path
*** Where: type?
*** Stack:
```

meijeru

[19:42](#msg59a866a0ba0f0f6e38034be6)`none! = type? x` can be simplified to `none? x`

maximvl

[19:42](#msg59a866a68f4427b462bc87f7)proper way is to use `get-word`

[19:42](#msg59a866acbac826f05468b61c)

```
>> type? :read
== action!
>> type? :read/lines
*** Script Error: unsupported type in :read/lines get-path
*** Where: type?
*** Stack:
```

unchartedworks

[19:44](#msg59a8673766c1c7c47700a7ec)

```
>> get-word :read/lines
*** Script Error: get-word has no value
*** Where: catch
*** Stack:
```

maximvl

[19:46](#msg59a867a5614889d475a96475)@unchartedworks `:x` gets value of x, means of `x` is a function, action or error - it will get you the value instead of "running it"

[19:47](#msg59a867c3614889d475a96594)if `x` contains the name of something - you should use `get`

unchartedworks

[19:47](#msg59a867e2162adb6d2e5492e2)@maximvl yes, what I mean is I can’t use type? to check if it’s none (Nothing).

maximvl

[19:48](#msg59a867fd614889d475a96658)

```
>> x: '+
== +
>> type? x
== word!
>> type? get x
== op!
```

[19:48](#msg59a86814c101bc4e3a78a7de)you can

[19:48](#msg59a8681bc101bc4e3a78a7fd)`type? get x`

unchartedworks

[19:49](#msg59a86861bc46472974e20f0e)

```
>> type? get 'read
== action!
>> type? get 'read/lines
*** Script Error: unsupported type in read/lines get-path
*** Where: get
*** Stack:
```

[19:51](#msg59a868c6210ac26920e0a559)This is what I know. That’s why I prefer type checking.

maximvl

[19:52](#msg59a86912614889d475a96a0b)@unchartedworks you can use `none? x`

[19:53](#msg59a8691ebac826f05468c116)as @meijeru mentioned before

[19:53](#msg59a86946c101bc4e3a78aba0)the thing is `get` fails on bad arguments:

```
>> get 5
*** Script Error: get does not allow integer! for its word argument
*** Where: get
*** Stack:
```

unchartedworks

[19:53](#msg59a869488f4427b462bc9430)@maximvl

```
>> none? read/lines
*** Script Error: read/lines is missing its source argument
*** Where: read
*** Stack: none?
```

[19:54](#msg59a86975bac826f05468c2d5)I think using object is simpler in this case.

maximvl

[19:56](#msg59a869e766c1c7c47700b401)@unchartedworks but it's the same as if you pass non-object to `isNothing`

[19:56](#msg59a869e9b16f264642f1817e)it will also fail

unchartedworks

[19:57](#msg59a86a469acddb2407eca07a)@maximvl I think it’s a compiler error but not a run-time error. I prefer compiler errors.

meijeru

[20:25](#msg59a870a2210ac26920e0c894)To get back to `type? :read/lines`: the evaluation rules of the language (as yet unfortunately not completely documented) say that the expression `:read/lines` where the head word (`read`) is referring to a function/action etc., is in error. One could discuss the best formulation for the error message, but an error it is. In other words, `:read/lines` cannot have a type, only `:read` can.

unchartedworks

[20:55](#msg59a877b6c101bc4e3a78f1a8)It's a surprise.

dander

[23:48](#msg59a8a048bc46472974e30d18)`any` can be used for default values, if you are using `none` as the invalid value

```
>> x: 1 y: 2
== 2
>> any [x y]
== 1
>> x: none
== none
>> any [x y]
== 2
```

It starts to get weird with unset things though. Anyone know why `make logic! ()` =&gt; `true`?

```
>> unset 'w
>> any [w x y]
*** Script Error: w has no value

>> any [get/any 'w x y]
>> 
>> type? any [get/any 'w x y]
== unset!
```

## Friday 1st September, 2017

rebolek

[06:29](#msg59a8fe4f8f4427b462bed31c)@dander I think it may be a bug, you should open an issue.

meijeru

[07:51](#msg59a9119d614889d475ac192f)Per definition, anything that is not `none` or `false` is `true`. That now appears to include `unset`. I would say it is not a bug, it is a feature :worried:

maximvl

[07:53](#msg59a911e8b16f264642f42685)hm

rebolek

[07:53](#msg59a911f466c1c7c4770353c3)@meijeru I believe you are talking about `to`, not `make`.

maximvl

[07:54](#msg59a91225614889d475ac1b93)now thinking about it I wonder, is it (theoretically) possible to curry funcs and refinements, like:

```
read-lines: :read/lines
read-lines source
```

[07:55](#msg59a912619acddb2407ef32bd)seems like we need a `curry` dialect :D

meijeru

[07:58](#msg59a9132fba0f0f6e38060c52)@rebolek the only difference between `to` and `make` is when the argument is a number; see issue #2645 for an exhaustive discussion

[08:00](#msg59a913adba0f0f6e38060f00)Also, see the conversion matrix in the red/docs repository.

rebolek

[08:04](#msg59a9149f66c1c7c477035ea3)@meijeru I see, thanks.

maximvl

[08:53](#msg59a91ffc162adb6d2e576114)here's the set of rules to parse any type of `spec` block :)

```
>> probe rules
[opt string! any [[any-word! opt block! opt string! | refinement! any [not [refinement! | 'return] opt string! opt any-word! opt block!]]] opt ['return block! opt string!]]
```

tested on all `function!`, `op!`, `native!`, `action!` values

[08:54](#msg59a9205ac101bc4e3a7b858d)the foundation of `curry` dialect, will try to make it later, need to get back to work :D

dockimbel

[08:55](#msg59a92065614889d475ac55b2)@maximvl :+1:

maximvl

[09:01](#msg59a92201bac826f0546b99f4)@dockimbel I don't understand how to parse literal refinement values though

[09:02](#msg59a92221b16f264642f47050)suppose I want to parse `/local` separately:

```
>> parse [/local a] ['/local 'a]
*** Syntax Error: missing #"]" at "'/local 'a]"
*** Where: do
*** Stack: load
```

rebolek

[09:11](#msg59a92444c101bc4e3a7b95f6)

```
>> parse [/local a][quote /local 'a]
== true
```

[09:11](#msg59a92451b16f264642f47a5f)There is no `lit-refinement!` type

maximvl

[09:11](#msg59a9245cb16f264642f47a76)I see, thanks

unchartedworks

[11:00](#msg59a93de2210ac26920e402d4)How to create a string pair in Red?

```
>> "string"x"string"
*** Script Error: x has no value
*** Where: catch
*** Stack:

>> 7x7
== 7x7
```

9214

[11:02](#msg59a93e3f66c1c7c477041898) Nohow, I think `pair!` supports only `integer!`s

unchartedworks

[11:04](#msg59a93ed966c1c7c477041cb1)@9214 Thanks. I use block! instead.

[13:49](#msg59a96584614889d475ad9c94)What’s wrong?

```
>> (function [x][x + 1]) 3
== 3
```

9214

[13:51](#msg59a965ee9acddb2407f0b868)

```
text
>> do reduce [func [x][x + 1] 3]
== 4
```

unchartedworks

[13:53](#msg59a96641bac826f0546cd785)

```
>> f: (function [x][x + 1])
== func [x][x + 1]
>> f 3
== 4
```

9214

[13:53](#msg59a96650bac826f0546cd7b7)and..?

unchartedworks

[13:53](#msg59a96666c101bc4e3a7cd064)I have no idea why I can’t write it in one line.

9214

[13:54](#msg59a9667e8f4427b462c0b377)I already showed you how to create "lambdas"

unchartedworks

[13:56](#msg59a9671cb16f264642f5b485)Maybe not.

```
g: f x
g y
```

What I want:

```
(f x) y
```

9214

[13:56](#msg59a96726c101bc4e3a7cd3ab)

```
text
>> λ: func [spec body args][do reduce [func spec body args]]
== func [spec body args][do reduce [func spec body args]]
>> λ [x][x + 1] 3
== 4
```

[13:59](#msg59a967cabc46472974e65f14)what's that, partial application?

unchartedworks

[14:00](#msg59a967e6210ac26920e4ceee)The problem is that I don’t understand the difference between the first and the second ones.

[14:00](#msg59a96812bc46472974e65ffa)(f x) y is preferred.

9214

[14:01](#msg59a96827b16f264642f5ba53)can you show some Red example?

[14:01](#msg59a9685366c1c7c47704ecf3)I thought you want to apply a function without bounding it to some word, i.e. lambdas

unchartedworks

[14:03](#msg59a968a5ba0f0f6e3807a299)

```
curry: function [
    "curry converts an uncurried function to a curried function."
    f [any-function!]
    x
][
    function [y] reduce [:f x 'y]
]

f: curry :add 2
f 1

(curry :add 2) 1
```

9214

[14:05](#msg59a96921210ac26920e4d4b4)well, in this case `(curry :add 2)` is evaluated, and `1` is evaluated too, what you need is to wrap it up inside `do reduce [...]` I think

[14:05](#msg59a969419acddb2407f0ca89)

```
text
>> do reduce [(curry :add 2) 1]
== 3
```

unchartedworks

[14:06](#msg59a96982c101bc4e3a7cdf5b)I think the problem is () doesn’t evaluate curry :add 2.

9214

[14:07](#msg59a96990614889d475adb1f8)it is

[14:07](#msg59a96998b16f264642f5c2c9)and returns a function value, but that's it

[14:07](#msg59a969ad66c1c7c47704f3c4)then `1` evaluates to itself

maximvl

[14:07](#msg59a969afba0f0f6e3807a7e5)it does evaluate `curry :add 2` but it doesn't evaluate it's result

9214

[14:08](#msg59a969c8210ac26920e4d87a)only the result of last evaluation is returned from expression, namely `1`

[14:13](#msg59a96af38f4427b462c0ca1d)it's the same as writing

```
>> 1 2 3
== 3
```

[14:15](#msg59a96b669acddb2407f0d575)`func` is not a function in a strict sense, it's a \_function constructor\_, i.e. if you evaluated it, it returned a function, but for that function to be applied to some arg it should again be evaluated

[14:17](#msg59a96be0ee5c9a4c5f21cbc3)in fact `func` is a shortcut for

```
>> make function! [[x][x + 1]]
== func [x][x + 1]
```

[14:23](#msg59a96d4ac101bc4e3a7cf3db)

```
text
>> apply: func [f x][do reduce [f x]]
== func [f x][do reduce [f x]]
>> apply curry :add 2 1
== 3
```

maximvl

[14:23](#msg59a96d4d162adb6d2e58d0e7)I would say `func` is exactly function in a strict sense

9214

[14:24](#msg59a96d8cc101bc4e3a7cf533)whatever

unchartedworks

[14:29](#msg59a96eb166c1c7c477050d3e)Red isn’t functional, it can’t return a function and take arguments.

9214

[14:29](#msg59a96edbee5c9a4c5f21da48)it can, you should just tell it to do so

[14:34](#msg59a96ffa614889d475add31a)and how `function!` \*\*value\** can take another \*\*value\*\*?

maximvl

[14:35](#msg59a97021614889d475add3d3)@unchartedworks it's fully functional, `func` is a function which returns function

[14:35](#msg59a9703bb16f264642f5e3a7)you are confusing values with calls

9214

[14:35](#msg59a97044ba0f0f6e3807ccf8)@maximvl me?

toomasv

[14:36](#msg59a9705266c1c7c477051534)@maximvl :point\_up: \[September 1, 2017 11:53 AM](https://gitter.im/red/red/welcome?at=59a91ffc162adb6d2e576114) I cooked something \[similar](https://gist.github.com/toomasv/eaac3829ac5e745f43121aa60b555d68)

maximvl

[14:36](#msg59a97056bc46472974e68c4d)in this sense Red's semantics is a bit different from other languages

9214

[14:36](#msg59a97069bac826f0546d0a4a)it could be nice to have "hungry" (or greedy?) functions though

maximvl

[14:37](#msg59a97095bac826f0546d0b8d)@9214 not you :)

9214

[14:37](#msg59a970a1c101bc4e3a7d0644)phew, I thought I'm doomed

maximvl

[14:38](#msg59a970eec101bc4e3a7d0789)@toomasv oh nice, I'll take a look

[14:39](#msg59a97129bc46472974e6934d)@unchartedworks it's true that you can't write code like in haskell, chaining all the call together

9214

[14:39](#msg59a9713dc101bc4e3a7d0953)... but that doesn't mean that Red is "bad"

maximvl

[14:40](#msg59a9714a614889d475add9ff)but in the same way in Haskell functions do not exist as a runtime values

[14:41](#msg59a971b69acddb2407f0fa1d)I think :)

9214

[14:43](#msg59a971feb16f264642f5ebee)I believe that behavior can be simulated with a macro, though idk how error-prone it will be

maximvl

[14:48](#msg59a97321bac826f0546d16b1)function should be enough

[14:48](#msg59a9732f210ac26920e50ae9)

```
>> funcall: func [f args] [ do append append copy [] :f args ]
== func [f args][do append append copy [] :f args]
>> funcall func [x] [x + 1] 3
== 4
```

[14:48](#msg59a9734f614889d475ade59f)arguments should be provided as a list though

9214

[14:48](#msg59a97352ee5c9a4c5f21f1a3)isn't that the same as :point\_up: \[1 сентября 2017 г., 19:23](https://gitter.im/red/red/welcome?at=59a96d4ac101bc4e3a7cf3db) ?

maximvl

[14:49](#msg59a97382b16f264642f5f4c7)@9214 it works with multiple arguments

9214

[14:50](#msg59a973c4bc46472974e6a01d)oh, right

maximvl

[14:52](#msg59a97440162adb6d2e58f3c5)

```
>> funcall func [x y] [ x + y] [3 4]
== 7
```

9214

[14:53](#msg59a97475162adb6d2e58f493)

```
text
>> apply: func [f x][do reduce compose [f (x)]]
== func [f x][do reduce compose [f (x)]]
>> apply :add [1 2]
== 3
```

unchartedworks

[14:55](#msg59a974d0b16f264642f5fdc8)partial application and application are not the same thing.

9214

[14:55](#msg59a974fa614889d475adefe0)okay, but you can apply you "partial" function to another argument the same way

[14:56](#msg59a9750166c1c7c477052f26):point\_up: \[1 сентября 2017 г., 19:23](https://gitter.im/red/red/welcome?at=59a96d4ac101bc4e3a7cf3db)

unchartedworks

[15:06](#msg59a97779ee5c9a4c5f220de8)Write it in two lines intead of in one line.

```
f: curry [x y] -> [x * y] 2
    y: 8
    z: f 4
```

9214

[15:09](#msg59a9783c8f4427b462c117cb)you can write it in one line if it really bothers you ;)

unchartedworks

[15:10](#msg59a97856210ac26920e52972)I found it finally.

```
4 & curry :add 4
```

[15:12](#msg59a978c1bac826f0546d383e)&amp; is a reverse application operator.

9214

[15:18](#msg59a97a4fba0f0f6e38080752)@unchartedworks

```
>> :apply
== func [f x][do reduce compose [f (x)]]
>> &: make op! func reverse copy spec-of :apply body-of :apply
== make op! [[x f]]
>> apply curry :add 4 4
== 8
>> 4 & curry :add 4
== 8
```

[16:38](#msg59a98d21bc46472974e728e6)can anyone show me a good use-case for `also`?

unchartedworks

[16:45](#msg59a98e8e9acddb2407f18967)

```
>> probe1: func [x] [also (copy x) (print x)]
== func [x][also (copy x) (print x)]
>> probe1 "hi"
hi
== "hi"
>> probe "hi"
"hi"
== "hi"
```

9214

[16:47](#msg59a98f2166c1c7c47705b001)hm, why after the first call `"hi"` is printed instead of `hi`?

[16:49](#msg59a98f9bba0f0f6e38086f92)and how is it different from

```
== probe1: func [x][print x x]
>> probe1 "hi"
hi
== "hi"
```

unchartedworks

[16:49](#msg59a98fac9acddb2407f18ea5)that’s another problem.

```
print mold “hi”
```

9214

[16:50](#msg59a98fc58f4427b462c190c2)no, this actually makes sense

[16:50](#msg59a98fda8f4427b462c19108)ah, jeez, you're using `probe` instead of `probe1` :D

unchartedworks

[16:51](#msg59a98ffb210ac26920e5a5f9)

```
>> print mold "hi"
"hi"
>> probe1: func [x] [also (copy x) (print mold x)]
== func [x][also (copy x) (print mold x)]
>> probe1 "hi"
"hi"
== "hi"
```

rebolek

[16:51](#msg59a99015b16f264642f68748)@9214  
For example this is useful:

```
>> x: 1
== 1
>> also x x: x + 1
== 1
>> x
== 2
```

9214

[16:51](#msg59a99020210ac26920e5a703)again, what's the benefit?

```
== func [x][print mold x x]
>> probe1 "hi"
"hi"
== "hi"
```

[16:52](#msg59a99047c101bc4e3a7da19f)yes, thanks @rebolek, `also` seems like an interesting construct, I just can't figure out how to leverage it

rebolek

[16:54](#msg59a990aac101bc4e3a7da2c8)It makes sense in loops usually

dander

[17:14](#msg59a99573c101bc4e3a7dbb2e)@9214 I've been experimenting with iterators/generators, and find myself using it a lot, but mainly just because I don't have `yield`, so I'm kind of using it as a hack

greggirwin

[18:28](#msg59a9a6b6bc46472974e7a237)@unchartedworks, please take this in the spirit of constructive criticism.

A lot of your posts come across, at least to me, as "Red is wrong because...it doesn't work how I expect it to." No language is perfect, but I think your confusion comes from expecting Red to be \*something\*, rather than trying to understand what Red \*is\*. For example, the `type? :read/lines` problem you had. In the context of Red, when and how things are evaluated comes into play. e.g.:

```
>> type? first [:read/lines]
== get-path!
```

Works just fine. Now we can talk about \*why* things evaluate the way they do. `(function [x][x + 1]) 3` is another example. If you do this:

```
>> reduce [(function [x][x + 1]) 3]
== [func [x][x + 1] 3]
```

and think about how Red returns the last evaluated value, you can see that the first expression created the function, but that it isn't called automatically.

Again, please take this constructively. It's not a personal criticism. Just trying to help us all communicate more effectively.

9214

[18:46](#msg59a9aafaba0f0f6e3808ef3f)but otherwise it's a nice challenge of porting Haskell to Red :) though, I can relate to @greggirwin and point out that it's better to not to go against the grain

greggirwin

[18:50](#msg59a9ac0fbc46472974e7bb12)Certainly it's good to say "How do I ... in Red?". Always. And to see how we might implement concepts from other langs in Red. We all learn from that.

9214

[19:07](#msg59a9affdbac826f0546e453a)@greggirwin worth a wiki entry, what ya think?

[19:23](#msg59a9b3a88f4427b462c22a9b)I mean "how do I make X in Red"

dander

[19:33](#msg59a9b60ab16f264642f73720)those make great Stack Overflow questions as well

greggirwin

[19:43](#msg59a9b85e162adb6d2e5a46cb)We could start a wiki for it, but the list is endless. Needs a certain level of organization as well, which wikis aren't great for (at least automatically), because the possible list is so varied.

9214

[19:46](#msg59a9b9279acddb2407f24f4f)well, at least for those who are coming from other languages

[19:47](#msg59a9b936c101bc4e3a7e5d5c)closures and lambdas are already on the list

greggirwin

[19:47](#msg59a9b951ee5c9a4c5f2351c9)It would be great to have a general wiki for it, and either sections, or language specific wikis, that help people migrate and find their way.

9214

[19:51](#msg59a9ba249acddb2407f252de)or perhaps the confusion comes from the fact that Red claims to be functional and "functional" is often read as "Haskell / Lisp"

dander

[19:58](#msg59a9bbeeba0f0f6e38093afb)Yeah, I think the other part to that is many of those languages which have a philosophy like "functional" do so by imposing constraints on themselves, like immutability, while Red favors flexibility

gltewalt

[20:05](#msg59a9bd7db16f264642f757b8)add call/cc to the list?

9214

[20:06](#msg59a9bdc2ee5c9a4c5f2362b2)I think it boils down to saving `system/words` somewhere, no?

gltewalt

[20:06](#msg59a9bdccbac826f0546e8337)Soon it could be time for this:  
http://rosettacode.org/wiki/Rosetta\_Code

[20:07](#msg59a9bde7bc46472974e80994)@9214 I think so

9214

[20:07](#msg59a9bdf29acddb2407f26368)but bindings should be preserved

gltewalt

[20:08](#msg59a9be28614889d475af5053)Right. A snapshot, basically

## Saturday 2nd September, 2017

9214

[15:59](#msg59aad550210ac26920ea6dfd)Is there any way to save REPL settings (i.e. background color, font color and font type) when running under Wine?

[19:38](#msg59ab08bdb16f264642fc0a40)There is: edit `console-cfg.red`in

```
~/.wine/dosdevices/c:/users/Public/Red
```

## Thursday 7th September, 2017

BeardPower

[20:31](#msg59b1ac909acddb2407136a65)Hi all, I'm currently testing out various languages/frameworks for my "research" project, and I wanted to ask various things about Red, which is just awesome, if it fits my needs.  
The questions are related to the GUI, data types, 2D rendering and performance. Is this the right channel, or should I post each relevant question in the specific room?

9214

[20:32](#msg59b1accc4e50cfde2715b3d5)@BeardPower welcome! Sure, go ahead.

BeardPower

[20:32](#msg59b1ace7210ac2692006c1e8)Thanks!

[20:35](#msg59b1ad7d66c1c7c477275a49)The application is a trading terminal/charting system, so it needs a lot of reactive GUI elements. It will also use a flat design. Is the GUI in Red fast enough to manage 50-100 UI elements, changing in real-time? Is it possible to create themes/skins? I don't need native controls.

[20:39](#msg59b1ae9666c1c7c477275f77)Data types: as there are multiple interactive charts on the screen, which can have up to 100k data points, which native data type/structure would be the best choice for that? The data points are pushed in real-time, about 10 per/sec and only need to be stored in memory.

9214

[20:40](#msg59b1aeba4e50cfde2715beb9)@BeardPower  
\* Red has its own reactive framework, so, yeah you'll get real-time interactivity;  
\* Skins/themes - yup, I think you should use Draw dialect for that or `style` keyword for something more basic;  
\* Speaking of speed - I haven't worked with large GUI apps, but I believe it's reasonably fast;  
\* The only drawback is memory management - we should get GC in the next major release, and until that happen making non-trivial GUI apps is kinda tricky.

But don't count on me and wait for our gurus to stick in and clarify everything :)

[20:41](#msg59b1aef8bc46472974097137)Since charts are 2D, you can go with a `hash!` of `point!`s I suppose

BeardPower

[20:43](#msg59b1af64614889d475d07e6d)2D rendering: the charts consist of circles, squares, lines etc.. As I read, Red is using Direct2D for rendering, so it's GPU accelerated. But how about Linux and macOS or FreeBSD? Is the backend using OpenGL (ES) or Vulkan?

[20:44](#msg59b1afa1bac826f0548fc73b)Thanks for your information. Will wait for them for sure :)

[20:46](#msg59b1b01cb16f264642186299)This UI is not designed by me, but it gives a nice overview of what the application is about: https://www.behance.net/gallery/41921083/One-Admin-Dashboard

9214

[20:49](#msg59b1b0d1c101bc4e3a9ef705)I believe graphical backends do not rely on any third-party libraries at all (that's the main idea of the language, to be totally self-contained). Only Win and MacOS are currently fully supported, Linux backend is WIP with recent community efforts.

BeardPower

[20:49](#msg59b1b0db614889d475d08546)I read about a basic Face!, which should be used for "custom widgets", but is it possible to skin a Button!? Does style work on the Faces?

[20:50](#msg59b1b1184e50cfde2715caab)So it's directly using DirectX or OpenGL?

9214

[20:51](#msg59b1b15fc101bc4e3a9ef88d)there's no `face!` or even `button!` datatypes, \*face* is just an `object!` that represents hierarchy of UI elements on the screen. For custom widgets - either `style` on existing ones or `draw`ing everything from scratch and specifying needed actors.

BeardPower

[20:53](#msg59b1b1acee5c9a4c5f443610)Ah, I see.

9214

[20:54](#msg59b1b2134e50cfde2715cfdc)here my knowledge is lacking, but I believe that Red manages all of the GUI stuff directly with system API calls

[20:55](#msg59b1b239bc46472974098217)see \[Win32](https://github.com/red/red/blob/master/modules/view/backends/windows/win32.reds) and \[Cocoa](https://github.com/red/red/blob/master/modules/view/backends/macOS/cocoa.reds) examples

BeardPower

[20:56](#msg59b1b2948f4427b462e2ebb1)So something like in the link I posted would be absolute feasible in Red? E.g. 60fps (regarding animations) and responsivenes of the UI/charts.

[20:59](#msg59b1b31e210ac2692006deb9)Nice.

9214

[20:59](#msg59b1b3338f4427b462e2eed5)Perhaps. It's hard to answer unequivocally, bear in mind that Red is in active development and isn't considered to be `1.0` and production ready.

BeardPower

[21:01](#msg59b1b3a19acddb2407138e41)That's totally okay. I'm just trying out some frameworks. I always searched for something like Red. One thing for the full stack.

[21:02](#msg59b1b3f5162adb6d2e7b0625)Once it supports concurrency and everything, it's not a problem to adapt the code.

9214

[21:03](#msg59b1b419bc46472974098cfb)I suggest you to stick around, read some docs, get familiar with language and wait for the next release with first version of GC, after that all gates will be open :)

[21:03](#msg59b1b43bbc46472974098dc5)And list some other alternatives of course.

greggirwin

[21:04](#msg59b1b46a210ac2692006e45e)It's also easy to build some small examples, as Red is data oriented, that generate different numbers of points, rates, etc. and check results directly.

BeardPower

[21:05](#msg59b1b4a4c101bc4e3a9f0963)Will do. I'm currently digging through http://www.red-by-example.org and the doc.  
I hope I can switch to Red completely, once 1.0 is released.

9214

[21:06](#msg59b1b4c44e50cfde2715df94)Yes, metaprogramming in Red is a no-brainer. Data-oriented and language-oriented approaches are highly encouraged.

BeardPower

[21:08](#msg59b1b535162adb6d2e7b0b6b)No need for some In-Game editor. More like LightTable :)

9214

[21:08](#msg59b1b56b614889d475d09d96)@BeardPower here's my \[grab bag](https://gist.github.com/9214/784e7f7af2342f117bc67a8e2698855b) of learning resources, the major ones are \[Rebol/Core](http://www.rebol.com/docs/core23/rebolcore.html), \[Red docs](https://doc.red-lang.org/en/) and \[wiki](https://github.com/red/red/wiki).

BeardPower

[21:09](#msg59b1b5a366c1c7c47727831c)Thanks! Much appreciated!

9214

[21:10](#msg59b1b5afbac826f0548fe609)Also \[`code`](https://github.com/red/code) and \[`community`](https://github.com/red/community) repos with various examples.

[21:10](#msg59b1b5e2bac826f0548fe6b9)List of all red rooms is \[here](https://gitter.im/orgs/red/rooms) I suppose.

greggirwin

[21:11](#msg59b1b5fa614889d475d09fa2)

```
Red []

system/view/auto-sync?: off

n: 100'000
size: 320x240 ; 800x600 ;1800x900

data: make block! n
append data 'line
repeat i n [append data random size]

view lay: layout compose/only [
    f: base (size) draw (data) rate 10 on-time [
        repeat i n [
            if i > 1 [  ; don't process 'line command
                data/:i: data/:i + random random/only [-2x-2 -2x2 2x-2 2x2]
            ]
        ]
        show f
    ]
]
```

BeardPower

[21:11](#msg59b1b5fb66c1c7c47727849e)I guess you guys all started with Red a while (years) ago? Or have some REBoL experience?

greggirwin

[21:11](#msg59b1b60fc101bc4e3a9f0eab)We have a mix of experience levels, both old Rebolers and fresh blood.

9214

[21:12](#msg59b1b62766c1c7c4772784f0)fresh blood would be me :feelsgood:

greggirwin

[21:12](#msg59b1b651b16f264642187fd1)If you run the above, you can tweak and play. I have a non-GPU workstation card. Low end. Not fast. It's slow for me, updating 100K data points, especially on a large face.

BeardPower

[21:13](#msg59b1b69666c1c7c47727872b):) I never heard about REBoL or Red until today. I'm currently using C/C++, Haxe and Elixir recently.

greggirwin

[21:14](#msg59b1b6c6b16f2646421881b4)But, here's the thing. If you have 100K data points, on multiple charts, and want 60 FPS, you can hope it will magically handle it (you seem reasonable, so know that may not be the case), or look at how Red may let you interpolate effectively, so you can maximize its capabilities. We often have more data than we can display, and have to map it to human limits.

9214

[21:15](#msg59b1b6f04e50cfde2715e9e4)or you can go down into R/S rabbit hole :rabbit:

greggirwin

[21:15](#msg59b1b6fe8f4427b462e30059)There's that too. Look at the Mandelbrot example.

BeardPower

[21:16](#msg59b1b721bac826f0548fed6c)Just ran it. About 2-4fps.

[21:16](#msg59b1b72bc101bc4e3a9f155a)Thanks for the code!

[21:18](#msg59b1b7a9b16f26464218886d)Yeah, I watched the Red talk and it mentioned inline Assembly.

[21:21](#msg59b1b872c101bc4e3a9f1b66)Yeah, 100k data points is more of an exception, than the rule. I'm just curious how many data points Red could handle, running on a decent frame rate. If it's slow, it could be also my fault :)

greggirwin

[21:24](#msg59b1b907210ac2692006f7d9)

```
system/view/auto-sync?: off

size: 320x240 ; 800x600 ;1800x900
n: size/x

data: make block! size/x
append data 'line
repeat i n [append data as-pair i random i]

view lay: layout compose/only [
    f: base (size) draw (data) rate 10 on-time [
        repeat i n [
            if i > 1 [data/:i/x: data/:i/x - 1]
        ]
        remove at data 2
        append data as-pair size/x random size/y
        show f
    ]
]
```

[21:24](#msg59b1b9109acddb240713a5dc)Just playing.

BeardPower

[21:24](#msg59b1b9134e50cfde2715f513)Absolutely. The data can always be streamed in, or/and implementing some round robin database like RRDtool.

greggirwin

[21:25](#msg59b1b947b16f264642188f34)It's normal to start with the easiest code that expresses what you want to say, and optimize later. Often we don't have to, but it's early days for animation in Red.

BeardPower

[21:26](#msg59b1b996210ac2692006f9d0)Do you also have some flickering?

greggirwin

[21:27](#msg59b1b9b78f4427b462e30bb9)A hint, yes. I don't think Red double-buffers at this point.

BeardPower

[21:27](#msg59b1b9c64e50cfde2715f92a)I see.

[21:28](#msg59b1b9e4162adb6d2e7b1e4f)Regarding animation: will Red come with full fledged tweening support?

greggirwin

[21:28](#msg59b1ba0b9acddb240713a9af)Flickers at 24/30 rate as well, but otherwise pretty smooth.

[21:29](#msg59b1ba3bbc4647297409aa29)Can't say. It's not on the roadmap that I know of.

BeardPower

[21:29](#msg59b1ba44b16f26464218935d)I'm still wondering how Red can be so concise. Not to mention the 1MB file size.

greggirwin

[21:30](#msg59b1ba8366c1c7c4772798c6)Work. Lots and lots of work. Resisting inclusion of the kitchen sink, and making size a priority.

[21:31](#msg59b1ba9c8f4427b462e30ffa)We could make some things even smaller, but that's not the \*only* goal. We also want maintainable code.

[21:31](#msg59b1babcee5c9a4c5f445f6d)VPRI's Nile project is pretty amazing too, when looking at what dialects can do.

9214

[21:33](#msg59b1bb2c66c1c7c477279af7)@9214 saw OMeta references ~10 times in the last month and starts to think that hivemind wants something from him

greggirwin

[21:33](#msg59b1bb3466c1c7c477279b92)We also have a pretty amazing Redbol optimizer. You post code, the community dissects it, and many great brains come up with solutions from different perspectives.

[21:36](#msg59b1bbdd210ac2692007037a)Red's core design, from Rebol, also comes into play, as it is very flexible, and allows you to leverage datatypes much more than in other langs.

9214

[21:36](#msg59b1bbe6c101bc4e3a9f2a44)and then @rebolek and @toomasv find a Grave Flaw (TM) in other examples and benchmarking races start :car: :blue\_car: :runner:

BeardPower

[21:36](#msg59b1bbee66c1c7c477279f38)You guys really want to push the limits :+1:

greggirwin

[21:37](#msg59b1bc31614889d475d0bb16)What could me more fun? :^)

BeardPower

[21:38](#msg59b1bc5266c1c7c47727a0aa):)

[21:39](#msg59b1bc8ec101bc4e3a9f2d60)I read that you also want to target JVM and MSIL. Any thoughts about BEAM?

[21:40](#msg59b1bcd59acddb240713b932)Sorry, in case someone doesn't know: it's the ErlangVM

greggirwin

[21:40](#msg59b1bcdf614889d475d0bdf2)Only Nenad can say for sure, but I would say it's not likely. JoeA showed up here, not long ago, and maybe he would share his wisdom when it comes time for us to go concurrent.

9214

[21:40](#msg59b1bce4614889d475d0bdf6)@maximvl :point\_up: hear hear!

greggirwin

[21:41](#msg59b1bd24162adb6d2e7b2c6b)We need to look at each piece and weigh the costs and benefits.

BeardPower

[21:42](#msg59b1bd54210ac269200708f5)Yeah, sure.  
IIRC you are gonna use something different than Actors for concurrency.

greggirwin

[21:43](#msg59b1bd72bac826f054900b3c)If an Erlanger wanted to do it, the first step is still to design the concurrency model in Red, because you need that to map to all back ends. Then look at what benefits BEAM offers as a target, the effort required, and if it can be made to work consistently on all platforms.

[21:43](#msg59b1bd8d8f4427b462e31ef2)Final concurrency model is TBD.

[21:44](#msg59b1bdb24e50cfde27160afe)I'm personally a fan of the Tuplespace model, especially in the context of a data and messaging oriented language.

BeardPower

[21:47](#msg59b1be68614889d475d0c51f)Interesting.

[21:51](#msg59b1bf5ab16f26464218aafb)Whatever it is in the end, I'm sure it will be great!

[21:52](#msg59b1bfa7210ac269200714df)Godspeed!

[21:54](#msg59b1c01f162adb6d2e7b3ba4)Is anyone of you using Red in the Cloud9 IDE?

callowaysutton

[21:57](#msg59b1c0c0b16f26464218b439)how would I do that?

BeardPower

[21:58](#msg59b1c11f66c1c7c47727b73f)There is a howto: https://github.com/red/red/wiki/Install-Red-in-Cloud9-IDE

callowaysutton

[22:43](#msg59b1cb9066c1c7c47727e4d3)I'll be sure to check that out, thanks!

BeardPower

[23:26](#msg59b1d5bb66c1c7c477280b18)You're welcome!

virtualAlan

[23:38](#msg59b1d86f66c1c7c47728145b)http://www.mycode4fun.co.uk/red-apps

## Friday 8th September, 2017

greggirwin

[05:11](#msg59b22672b16f2646421a518e)I think @gltewalt did the Cloud9 setup. Not sure if he's using it as a daily driver though.

maximvl

[07:24](#msg59b245c666c1c7c47729b6ce)@greggirwin I'm not sure what the Tuplespace model is, but from the wiki on Object Spaces:  
&gt;Object Spaces is a paradigm for development of distributed computing applications. It is characterized by the existence of logical entities, called Object Spaces. All the participants of the distributed application share an Object Space. A provider of a service encapsulates the service as an Object, and puts it in the Object Space. Clients of a service then access the Object Space, find out which object provides the needed service, and have the request serviced by the object.

[07:25](#msg59b24602614889d475d2dfdf)this is exactly the description of Erlang's actors, every process is on object which belongs to process/"object" space and each of them is a service other processes can use via it's API requests

[07:27](#msg59b2464d614889d475d2e0ce)except, maybe in Erlang processes namespace is flat, while from the description above you may have different object spaces

[08:22](#msg59b2533eee5c9a4c5f46d4bf)concurrency model in Erlang is super good, but it has performance drawbacks. Basically Erlang doesn't use OS threads nor "green threads", it has it's own scheduler implemented in low level C code

[08:24](#msg59b253d54e50cfde2718690a)each erlang process is a structure which has so called "reductions counter" and on any function/operation call it got increased

[08:25](#msg59b253ec66c1c7c47729f4b7)if it reaches some value scheduler got called and transfers control to another process

[08:26](#msg59b2541dee5c9a4c5f46d8e0)this allows to stop process at any given point, not only on specific IO operations like with the green threads

[08:26](#msg59b254328f4427b462e57a53)which removes possibility of one process to hang whole group

[08:27](#msg59b2545e4e50cfde27186c10)but this creates overhead, of course and regular non-parallel code in Erlang is slower than similar in other languges

[08:27](#msg59b25488bac826f054926a57)you listened to the course "Erlang in 5 minutes" :D

[08:29](#msg59b254d8c101bc4e3aa194cb)here's some detailed explanation: https://hamidreza-s.github.io/erlang/scheduling/real-time/preemptive/migration/2016/02/09/erlang-scheduler-details.html

greggirwin

[14:11](#msg59b2a512bc464729740d9d19)The big difference is that in Erlang you send messages to a specific process, and that process has to be alive when you do. With a tuplespace, tuples (not Red `tuple!`) are found by pattern matching, and are persistent in the space, so processes can be temporally decoupled as well. Also, it naturally leads to the ability to write heterogeneous processes, where Erlang processes all have to run on the VM. That does mean that the processes are OS processes (normally). You can build a layer to handle them though. I think that's what Gigaspaces does on the JVM.

maximvl

[14:12](#msg59b2a56aee5c9a4c5f484a51)&gt;With a tuplespace, tuples (not Red tuple!) are found by pattern matching

Erlang has libraries for that

&gt;so processes can be temporally decoupled as well

what happens with the message then? is it stored? where? does it get delivered to process later?

[14:13](#msg59b2a5a5162adb6d2e7ef0f1)&gt;where Erlang processes all have to run on the VM

in Erlang you spawn VM process which communicates with external things, like a proxy, so it's not an issue

greggirwin

[14:14](#msg59b2a5aa66c1c7c4772b7d5c)Yes, it is stored. That's "the space".

maximvl

[14:15](#msg59b2a5e9162adb6d2e7ef266)@greggirwin do programmers have control over it? what if a service died and now all the messages which should be delivered to it are going to be stored and eat all the memory?

greggirwin

[14:15](#msg59b2a5f8614889d475d49399)Messages aren't destined for a specific process. Addressing is content based. So there is no "delivery", only a possibility that some process will come along and consume them.

maximvl

[14:15](#msg59b2a60cee5c9a4c5f484cc5)and what if nobody consumes them?

greggirwin

[14:16](#msg59b2a63e614889d475d494c7)Implementations vary. I'm just talking about the overall model.

If nobody consumes them, it depends on the system. Some systems have "leases" that let things expire.

maximvl

[14:17](#msg59b2a664162adb6d2e7ef540)that's an interesting feature, though I can see many issues which can raise here

greggirwin

[14:17](#msg59b2a672bc464729740da33a)There is no perfect system. :^)

maximvl

[14:18](#msg59b2a69d4e50cfde2719d2ef)I'm asking because in Erlang it's one main issues - size of the mailbox

[14:18](#msg59b2a6b3c101bc4e3aa2ff7e)once you have too many messages coming and process doesn't process them on time - it dies quite soon

greggirwin

[14:20](#msg59b2a71bcfeed2eb65e6dba7)With a tuplespace, because any process can consume any message, you can have multiple processes matching on the same pattern. Automatic load balancing and redundancy. Then you can also add supervisor processes, as you would in Erlang, either to monitor spaces or processes themselves (likely using tuples).

maximvl

[14:22](#msg59b2a794b59d55b823d21e27)interesting, in Erlang there are libraries to do that, basically they just forward messages to idle workers

greggirwin

[14:23](#msg59b2a7e7b16f2646421c97b6)Right, in the TS model, your thinking is reversed. The focus is more on the messages themselves, and modeling the data and its flow. If you've ever built a blackboard system, it's a lot like that.

maximvl

[14:25](#msg59b2a83ebc464729740dacf8)&gt;you can have multiple processes matching on the same pattern

How does this look like? You specify patterns and then run consume loop?

greggirwin

[14:25](#msg59b2a843210ac269200ac888)An issue with the tuplespace model, at least the original one, is that once a tuple is taken, it's gone from the space (the op is atomic). The risk, then, is that the process which took it dies before putting it back (if modifying) or writing a new tuple for another step in the chain. Modern system address that in various ways.

maximvl

[14:26](#msg59b2a884bc464729740daddc)&gt;is that the process which took it dies

doesn't sound like an issue to me - maybe it died because of corrupted message

greggirwin

[14:27](#msg59b2a8c1b16f2646421c9b06)Each process can do what it wants. Some may consume just one message, others may be long running and consume in a loop. The original model also had an `exec` op, which is kind of like spawning in Erlang. You call `exec` and the engine spawns a processs, passing it the tuple you provided.

[14:29](#msg59b2a938210ac269200acc82)A process could die for any reason. Say you have an indexing system. A tuple contains a url, processes consume that tuple, read the url, scan the content for urls, and write new tuples for each url found, and also another for indexing. If process A takes a tuple with a url, then dies while working, no other process will know that tuple existed, and everything downstream of that url won't be processed.

maximvl

[14:31](#msg59b2a9b966c1c7c4772b923e)well, yeah, that makes sense

[14:31](#msg59b2a9ccb16f2646421ca22b)in Erlang it's solved with `links`, one process can link to another and get a message that the second one died

greggirwin

[14:32](#msg59b2a9e2ee5c9a4c5f485fe4)Right. Each model has different features.

gltewalt

[17:23](#msg59b2d208162adb6d2e7fd583)No I haven't used cloud9 as a daily driver for Red. Mainly because syntax hi-lighting is regex driven - but @toomasv has since done a lot of work with regex

[17:34](#msg59b2d4bf162adb6d2e7fe292)I'm not sure if he plans on parse to regex translation, but it would help for reducers who wish to use cloud9 but aren't into regex

toomasv

[18:55](#msg59b2e792162adb6d2e8039cd)@gltewalt I haven't used Cloud9. Do you have a link where I can see what to do?

gltewalt

[19:31](#msg59b2f016614889d475d5f710)I think, under the 'Defining Syntax Highlighting Rules' section, here:  
https://ace.c9.io/#nav=higlighter

toomasv

[19:35](#msg59b2f100b16f2646421e0087)@gltewalt Thanks!

gltewalt

[21:51](#msg59b310f966c1c7c4772d773e) Looks like it would be worth it to make an ACE Editor mode for Red. It's used by Cloud9, but also many other places:

https://ace.c9.io/#nav=production

## Saturday 9th September, 2017

gltewalt

[03:22](#msg59b35e7f614889d475d79933)I tried their tool to convert tmLanguage file but it failed with WSH errors

toomasv

[04:41](#msg59b370dc66c1c7c4772ec7d9)@gltewalt Thanks, I'll try

## Monday 11st September, 2017

toomasv

[17:33](#msg59b6c8fe319100804e20fc51)@gltewalt \[Cloud9 syntax highlighter for Red](http://toomas.vooglaid.ee/ace/tool/mode\_creator.html). Work in progress. Errata? Omissions? Suggestions?

gltewalt

[21:58](#msg59b706f4cfeed2eb65f8fe49)I will have to dig into it tonight, and do some playing.  
Thanks!

[22:05](#msg59b708a21081499f1f1d1553)Just trying in the Document Pane in the Mode Creator -- works awesome so far. Hovering over tokens is returning the correct info so far

[22:07](#msg59b709361081499f1f1d1887)Oh, except `refinement` comes back as `keyword`. Paths in code come back as `variable.path`, which seems right to me

## Tuesday 12nd September, 2017

gltewalt

[04:12](#msg59b75ecb210ac269201e2c87)@toomasv  
On compound "names" such as `get-col:`  
Mouse-over on `get-` portion returns `keyword`, while mouse-over on `col` returns `variable.set-word`

Other than that, everything seems to be good as I play around with it. :+1:

[04:20](#msg59b7609f319100804e23e337)hmm... hovering over `i` returns `text`instead of `variable.word` in something like:

```
apply: func [fn blk][
    collect [foreach i blk [keep fn i]]
]
```

And `[` `]` returns `paren.lparen` and `paren.rparen` -- not sure if that's expected

[04:22](#msg59b76121c101bc4e3ab6acad)You deserve Red dollars

toomasv

[07:28](#msg59b78ca8cfeed2eb65fb5075)@gltewalt Thanks for reviewing! I'll try to correct these misfits. The problem is there are only a handful of keywords to use that different themes would recognize. Some of my tags would not be recognized and therefore treated differently by themes. E.g. there is no `value` tag, not to mention `issue` or `refinement` or `datatype`. So I guess new themes are also needed for Red. To overcome this I have used several tags to at least let existing themes to color things somehow.  
As about `paren.lparen` and `paren.rparen`, this is how currently all languages seem to categorize `[{(` and `)}]`. I think folding functionality is connected to this.  
BTW You can paste different code samples with varying keywords/datatypes to the document pane to test more tags.

[07:43](#msg59b79028cfeed2eb65fb6228)Sorry, I see you have already tried different code samples :wink:

[11:21](#msg59b7c320c101bc4e3ab8ae39)@gltewalt I made some corrections. I think you have to shift-refresh to load changes. `i` returning `text` while hovering over I didn't see. But whitespace (everywhere) neighbouring tokens shows `text`.  
And what to do with constructs like `some/path/:get-word` or `some/(to-word "string")/path` and the like? I think these should be leaved just as it is, not trying to accommodate every possibility, as this would become quite complicated.  
One thing more: what to do with cases when keywords are used as set-words, that is redefined, as for example in `to-float: func [..][..]`. I think in such cases keyword should still be tagged as `keyword`, not as `variable.set-word`, to call attention to a possible problem. What do you think?

gltewalt

[15:09](#msg59b7f899c101bc4e3ab9f977)Ok, you're right. Better to draw attention to a possible problem and return keyword.

[15:12](#msg59b7f94e210ac2692021688c)Leave the complicated constructs like some/path/:get-word. You're right there, too, it is good enough

## Monday 18th September, 2017

sptorin\_twitter

[11:33](#msg59bfaeee7b7d98d30d0c7e98)Hello. Can I organize data like flat table? With certain set of columns. With possibility to create new rows and modify existing. Like table "Users" with columns: "Login" "Name" "Mail" "Department"...

endo64

[11:36](#msg59bfafd1bc464729744aa057)Sure you can, please check: http://www.rebol.com/docs/core23/rebolcore-7.html and http://www.rebol.com/docs/core23/rebolcore-6.html  
They are almost identical for Red as well.

sptorin\_twitter

[12:04](#msg59bfb654bac826f054d0e6bb)Tnx. Really simple method - use block of blocks. Before I'm trying `person: make object! [ ... ]` and maps. May be exist path addressing block of blocks like `users/1/name` and `users/2/mail`? Now it looks `users/1/1` and `users/2/3`

RnBrgn

[15:44](#msg59bfe9efbc464729744c0de9)@sptorin\_twitter You don't always need to use block of blocks. You can use `sort/skip/compare` as well. http://www.red-by-example.org/#sort

9214

[15:45](#msg59bfea13614889d47512924d)@sptorin\_twitter you mean this?

```
>> db: [[name: "me" mail: ".org"][name: "not me" mail: ".com"]]
== [[name: "me" mail: ".org"] [name: "not me" mail: ".com"]]
>> db/1/name
== "me"
>> db/2/mail
== ".com"
```

sptorin\_twitter

[17:20](#msg59c0006a210ac2692048316d)@9214 - block of maps! it's work!

rebolek

[17:25](#msg59c0017bc101bc4e3ae1357c):)

sptorin\_twitter

[17:26](#msg59c001b0cfeed2eb6524d066)not exactly maps, but looks like it

9214

[17:43](#msg59c005c5c101bc4e3ae14ee5)it's a `block!` of `block!`s actually, we have dedicated `map!` datatype for fast read access

sptorin\_twitter

[17:48](#msg59c00709614889d475133e05)I'm trying `map!`, nice key-value datatype.

[17:55](#msg59c008761081499f1f48e351)BTW, when I compile to native under linux - ELF executable have a lot library dependencies (40 libs). It's normal? In description lang: "Produces executables of less than 1MB, with no dependencies"

Oldes

[18:15](#msg59c00d28177fb9fe7ed84aaa)You probably should exclude system libraries.

## Tuesday 19th September, 2017

dockimbel

[02:38](#msg59c08337210ac269204a9419)@sptorin\_twitter On Unix systems, Red has a temporary dependency on libcurl, which itself has tons of dependencies. We will remove the libcurl dependency in 0.7.0.

sptorin\_twitter

[09:44](#msg59c0e6fecfeed2eb6528c6f3)Sorry for elementary question, but how I can use variable as index option for access subset of block? For example: `db: [1 2 3 4]`, `idx: 1`, `print db/idx` - `none`. Need like `print db/1`.

rebolek

[09:45](#msg59c0e723177fb9fe7edc0c3a)@sptorin\_twitter This room is exactly for elementary question so no need to be sorry!

[09:45](#msg59c0e730177fb9fe7edc0c6e)Try `db/:idx`

[09:46](#msg59c0e77f210ac269204c232f)With `db/idx`, you are selecting value next to `idx` in `db`: `db: [1 2 3 idx 123] db/idx ; == 123`

KimRoach143\_twitter

[12:57](#msg59c11442bc4647297451a53f)is there any plan for gui with datagridview in next release if yes when just found out about red full stack like it a lot

rebolek

[13:02](#msg59c1156c177fb9fe7edd006e)@KimRoach143\_twitter I wrote `text-table` style that probably would fit your needs, but I am waiting for GC with release, as it can get out of memory \*really fast*

KimRoach143\_twitter

[13:06](#msg59c1165cb59d55b823151089)@rebolek Can I use red in my production workflow I mean is it stable to use?

rebolek

[13:07](#msg59c116a2210ac269204d1202)@KimRoach143\_twitter it depends on your requirements. Red is still alpha, but pretty stable IMO.

KimRoach143\_twitter

[13:13](#msg59c11803cfeed2eb6529ca26)@rebolek My Requirement is very simple lots of data-driven tasks so I need table or datagridview or pivotview gui , And I am trying to migrate from windows to linux and mac so must be cross platform gui and red does that, that's why I am interested.

rebolek

[13:17](#msg59c118f5bac826f054d7c20f)@KimRoach143\_twitter then you probably need to wait for next release, it should include simple GC, that would vastly improve custom styles.

KimRoach143\_twitter

[13:18](#msg59c1190dbac826f054d7c252)any hint on when next release will be

rebolek

[13:21](#msg59c119bdbc4647297451c7cd)I believe as soon as possible ;) it's going to include Android GUI also, so it may take some time. Probably @dockimbel can give us some estimate

pekr

[13:22](#msg59c11a1c1081499f1f4d9379)There are two branches - 0.6.4 and 0.6.5, Android. Those are developed in parallel, or that is how I understand the situation. Last few weeks, only 0.6.5 can see some progress though. But - Red Team does some development in some non-public repos too, so difficult to guess ...

KimRoach143\_twitter

[13:29](#msg59c11ba97b7d98d30d139572)thanks @pekr , @rebolek than I will wait for future updates may be @dockimbel can give some insight :wink:

9214

[16:25](#msg59c144e8bc4647297452c1b7)last weeks were all about private `0.6.5` branch, now Doc and Co are back and try to push `0.6.4` a little, it's hard to do any estimation though

## Wednesday 20th September, 2017

hilaily

[15:49](#msg59c28e087b7d98d30d1a98c9)hello, could someone tell me how to use send function. I tried `send aa@aa.com "123"` but failed

Oldes

[15:58](#msg59c29009177fb9fe7ee429f2)@Laily123 This is not implemented yet. (in Red)

hilaily

[16:34](#msg59c2988fcfeed2eb65310cda)@Oldes Oops... thank you.

## Friday 22nd September, 2017

KimRoach143\_twitter

[10:09](#msg59c4e16fbac826f054e8efb8)I have been doing some programming with red/rebol for last two days so far I like it. But After reading Roadmap and trello I think RED 1.0 will take at least more 3 years to complete and fully stable and that's very long time to wait.

pekr

[10:23](#msg59c4e4ad177fb9fe7eeea9da)The question is, if there is a need to wait. In some areas, Red might be already more stable than R2. As fir the funcionality, we have simple-io stack, which allows you to do basic networking. We've also got call, so you can interface with outer world too. In terms of the next version or two, we will get simple GC too ...

KimRoach143\_twitter

[10:44](#msg59c4e98a7b7d98d30d25095d)@pekr Please don't misunderstand me, but I was looking for UI controls and widgets like "devexpress" and that must be cross platform but it's not. That's why I was looking around on internet and stumbled upon red than I found out it is work in progress and there aren't any widgets that can do similar things like simple table with good GC or datagridview with excel like filters. Also I am very impressed by 1mb executable thing never in my life I have found something like that. I tried to do similar thing with rebol and its table but it was not as sophisticated like "devexpress" or other UI controls and widgets.

abdllhygt

[12:58](#msg59c508ffbac826f054e9a63b)Hi

[13:00](#msg59c509761081499f1f5ef315)How to get index of text-list?

dockimbel

[14:06](#msg59c518cfc101bc4e3af85343)@abdllhygt \[`selected` facet](https://doc.red-lang.org/en/view.html#\_text\_list).

rebolek

[15:11](#msg59c5280f210ac269205f482f)@KimRoach143\_twitter it is possible to write you own widgets using Draw dialect, that will work across all platforms in Red. I’ve written text table and graph widgets that may provide at least partial functionality of what you need.

abdllhygt

[16:02](#msg59c5342c32fc8b7e402d1972)@dockimbel sorry, i don't understand this. can you show me?

[16:05](#msg59c534af210ac269205f861c)my code:

```
text-list linen 250x350 font-size 16  data rn/1 [
        bilgi/text: pick face/data face/selected
]
```

greggirwin

[17:30](#msg59c548cdcfeed2eb653cec0c)@KimRoach143\_twitter, Red isn't going to be ready for everyone's needs for a while. Certainly, it's not going to be DevExpress soon. If that's what you need, Red is probably not for you yet. Just keep an eye on us and, if you like Red, see where you \*can* apply it effectively.

[17:32](#msg59c5491a210ac269205feb37)@abdllhygt, does this help: https://gist.github.com/greggirwin/c67d640f09e9ccd0dac0859ec7374ca3

abdllhygt

[17:42](#msg59c54ba1bac826f054eaff8a)@greggirwin i look this, but i want index number

greggirwin

[17:44](#msg59c54bec210ac269205ffa76)

```
view [
    text-list linen 250x350 font-size 16  data ["A" "B" "C"] [
        ;bilgi/text: pick face/data face/selected
        print face/selected
   ]
]
```

[17:45](#msg59c54c27614889d4752b6f71)`face/selected` returns in the index number.

abdllhygt

[17:48](#msg59c54d04bac826f054eb05e3)oh thank you so much :)

## Sunday 24th September, 2017

virtualAlan

[00:16](#msg59c6f95bbac826f054f0e91a)Just a congrats to Mike Parr and Arie Wingerden for their work on 'Red-By-Example' - Nice Work ....

dockimbel

[05:38](#msg59c744b87b7d98d30d2dc3a0)@virtualAlan @Arie-vw @mikeparr Congrats indeed, your work \*does* help Red reach new highs. There should be an announcement next month regarding that (crossing fingers), stay tuned. ;-)

sptorin\_twitter

[08:18](#msg59c76a6dbac826f054f23733)Trying fill block of blocks with data from external source, but final structure have all equal blocks. Skip some `copy` command in declaration of variables?

```
people-template: copy [[name-t: "" phone-t "" mail-t ""]]
db: [Tom 123 qwe@qwe.org Bob 456 asd@asd.com]
people: copy [[]]
index: 1

foreach [name phone mail] db [
    append people people-template
	people/:index/name-t: name
	people/:index/phone-t: phone
	people/:index/mail-t: mail
	index: index + 1
]

probe people
```

answer: \[\[name-t: Bob phone-t: 456 mail-t: asd@asd.com] \[name-t: Bob phone-t: 456 mail-t: asd@asd.com]]

[08:20](#msg59c76ac2c101bc4e3a009cc3)wrong copy-paste, must be:  
\`

[08:21](#msg59c76b0f210ac26920672cc5)Broke chat...

rebolek

[08:21](#msg59c76b19bac826f054f23a06)@sptorin\_twitter There's no need for `people-template` to be block in block. Just use `append/only`. And the `copy` function should be in the `append` line: `append/only people copy people-template`

sptorin\_twitter

[08:22](#msg59c76b57177fb9fe7ef806bc)yes, it previous variant, can't paste normal

[08:23](#msg59c76b7f177fb9fe7ef80716)`people-template: copy [[name-t: "" phone-t: "" mail-t: ""]]`

[08:23](#msg59c76b8cb59d55b8232fb29a)`db: [Tom 123 qwe@qwe.org Bob 456 asd@asd.com]`

[08:23](#msg59c76b987b7d98d30d2e3939)`people: copy []`

[08:24](#msg59c76bcd210ac26920672fad)Result must be block of blocks

rebolek

[08:25](#msg59c76bdc614889d4753289de)

```
Red[]

people-template: [name-t: "" phone-t "" mail-t ""]
db: [Tom 123 qwe@qwe.org Bob 456 asd@asd.com]
people: []
index: 1

foreach [name phone mail] db [
    append/only people copy people-template
    people/:index/name-t: name
    people/:index/phone-t: phone
    people/:index/mail-t: mail
    index: index + 1
]

probe people
```

sptorin\_twitter

[08:27](#msg59c76c667b7d98d30d2e3bed)And both blocks in result is equal

[08:27](#msg59c76c74b59d55b8232fb5a8)Both with "Bob"

rebolek

[08:28](#msg59c76c9a7b7d98d30d2e3c95)Oh, sorry, I forgot `copy` there :smile:

[08:28](#msg59c76ca6b59d55b8232fb675)Code fixed

sptorin\_twitter

[08:28](#msg59c76cc3bac826f054f23df2)Yes, now right! Tnx!

maximvl

[08:29](#msg59c76d027b7d98d30d2e3d62)if you update `people` directly you wouldn't need this circus with `index` :)

sptorin\_twitter

[08:34](#msg59c76e33614889d475329305)Yes, but in original my incoming data is multiply lines with Tom where name equal, but info different (first line with phone, second line with mail, third line with work phone). And multiply lines with other people.

vulnz

[13:07](#msg59c7ae00614889d475336a1a)hello guys! is it any socket realization on red ?

[13:07](#msg59c7ae0f210ac269206807a5)and if yes, how to create web site on red ;) ?

callowaysutton

[18:14](#msg59c7f5f9614889d4753475de)http://www.red-lang.org/p/roadmap.html I believe Network I/O is still being worked on

rebolek

[18:28](#msg59c7f96832fc8b7e40366933)@vulnz @oldes just wrote socket implementation for Red/System - https://github.com/Oldes/code/tree/master/Library/Sockets  
How to create web site - do you mean using Red as web server? That will come with full IO. If you want to use Red as CGI, that's possible even now.

## Monday 25th September, 2017

BeardPower

[11:01](#msg59c8e1f8bc464729747215ce)

rebolek

[11:17](#msg59c8e5e1177fb9fe7efd7c33)@BeardPower I don't think so, Red will implement full I/O in 0.7.0 and probably won’t use third party code for it. That is question for @dockimbel

BeardPower

[13:12](#msg59c900bdbc4647297472ac6c)I see. But isn't implementing the same feature twice a waste of precious resources?

[13:12](#msg59c900dbbc4647297472ad81)Don't get me wrong, I appreciate all your efforts :)

[13:16](#msg59c901a4177fb9fe7efe1371)I'm just thinking, that it would speed up the project, if existing code would be merged. As I don't have insights into the project, I can, of course, be totally wrong.

pekr

[13:19](#msg59c90255177fb9fe7efe1850)If random existing code would be merged, we would soon end-up in the multiple megabyte territory along with messy architecture :-) OTOH, noone is preventing us to use such code in terms of libraries or simply special solutions ...

BeardPower

[13:22](#msg59c9031f32fc8b7e403a6e03)Sure, but I think that would only be a problem, if the code would not be following the project and architectural guidelines.

dockimbel

[14:23](#msg59c9117dcfeed2eb654a9a05)@BeardPower  
&gt; I see. But isn't implementing the same feature twice a waste of precious resources?  
&gt; As I don't have insights into the project, I can, of course, be totally wrong.

Your last assertion is correct. ;-) Red "full I/O" will rely on an async I/O engine.

BeardPower

[14:43](#msg59c916027b7d98d30d34b285)@dockimbel :+1:

geekyi

[15:38](#msg59c92305210ac269206dd51f)@BeardPower existing code helps, because we'd then have something to compare and improve upon! And we'd learn from the mistakes and know what to use. SO in the end, the code that gets merged would be pretty high quality..

greggirwin

[18:51](#msg59c9504632fc8b7e403c0d9c)All code and examples are helpful, even if they don't directly make it into the official mainline. As @geekyi said, and also because people can learn from them and build things they need which may not match what Red makes standard. e.g., @Oldes' code may be extremely useful to some people, and even end up as an extension, for some circumstances.

[18:53](#msg59c9509bb59d55b823375d16)They can also save Team Red research time. As long as Team Red knows they exist, they can leverage them as well.

BeardPower

[21:10](#msg59c970b6bc46472974751727)@geekyi A very good point :)  
@greggirwin Yeah, having all these resources available is really great for learning Red. Thanks to everyone for providing them :+1:

## Tuesday 26th September, 2017

abdllhygt

[11:39](#msg59ca3c67210ac2692072935a)Hİ!

[11:39](#msg59ca3c7e614889d4753e46fa)How to convert integer to string?

rebolek

[11:42](#msg59ca3d22b59d55b8233b3f66)

```
>> form 123
== "123"
```

abdllhygt

[11:47](#msg59ca3e3cf7299e8f53735dfd)thank you!

rebolek

[11:47](#msg59ca3e627b7d98d30d39c892)You're welcome! There are other ways, like `to string!`, but I prefer `form`.

KimRoach143\_twitter

[11:50](#msg59ca3efa177fb9fe7e03ce43)@rebolek hello I am still learning red code just wondering how can I lock the file or folder and open it only with system or administrator in read only mode

[11:50](#msg59ca3f1fcfeed2eb65500564)any file related documentation might help

abdllhygt

[11:51](#msg59ca3f5a177fb9fe7e03cf8e)@rebolek this doesn't work on gui :/

rebolek

[11:52](#msg59ca3f637b7d98d30d39cdc6)@KimRoach143\_twitter Hi! Red currently supports only basic file operations, full I/O will come with 0.7.0, but if it will include file locking is something I honestly can’t answer.

[11:52](#msg59ca3f7df7299e8f53736508)@abdllhygt Do you have an example of non-working code?

abdllhygt

[11:53](#msg59ca3fb032fc8b7e403ff477)'''  
"Kasa " [  
text form 123  
]  
'''

[11:54](#msg59ca3fec177fb9fe7e03d2d5)

```
"Kasa " [
text form 123
]
```

KimRoach143\_twitter

[11:56](#msg59ca40757b7d98d30d39d3ea)@rebolek dang it, I knew it could not find in any doc :wink:

[12:00](#msg59ca4164bac826f054fe0194)do we have MDI (Multiple document interface)with gui?? If yes any example

rebolek

[12:02](#msg59ca41e432fc8b7e404001d5)@abdllhygt I see, you can’t put the code there directly, use something like

```
compose [text (form 123)]
```

abdllhygt

[12:04](#msg59ca425e177fb9fe7e03e1ba)doesn't work, "Script Error: VID - invalid syntax at: \[(form 100)]"

BeardPower

[12:06](#msg59ca42d2177fb9fe7e03e3d7)Which version are you using? Works on 0.6.3

abdllhygt

[12:06](#msg59ca42dcb59d55b8233b5c27)yes, 0.6.3

BeardPower

[12:07](#msg59ca42eeb20c6424298a9a41)

```
>> compose [text (form 123)]
== [text "123"]
```

KimRoach143\_twitter

[12:07](#msg59ca430232fc8b7e4040078a)yep works for me too

9214

[12:09](#msg59ca4386177fb9fe7e03e6f7)@abdllhygt I bet you forgot `compose`

abdllhygt

[12:10](#msg59ca439dcfeed2eb65501c19)@9214 no, i did use

rebolek

[12:10](#msg59ca43c97b7d98d30d39e4c4)This works: `view compose [text (form "123")]`

9214

[12:11](#msg59ca43d5bac826f054fe1118)can you show full code snippet?

abdllhygt

[12:11](#msg59ca43e8b59d55b8233b61c6)

```
"Kasa " [
        	compose [text (form 120)]
                ; "Kasa" is tab-panel
        ]
```

[12:11](#msg59ca43f5614889d4753e6d29)My full code is long

[12:13](#msg59ca4483cfeed2eb6550227d)error message: \*\** Script Error: VID - invalid syntax at: \[compose \[text (form 120)]]  
\*\** Where: do  
\*\** Stack: view layout layout layout cause-error

9214

[12:31](#msg59ca48be177fb9fe7e0403c5)@abdllhygt

```
view compose/deep [text-list data [(form 1) (form 2) (form 3)]]
```

abdllhygt

[12:33](#msg59ca492232fc8b7e404029a3)yes :D

[12:33](#msg59ca492d614889d4753e8cea)thank you @9214 haha

[12:39](#msg59ca4a7232fc8b7e40402fa1)i develop a commercial app with red

[12:39](#msg59ca4a8fb20c6424298ac2df)\[hccm](https://i.hizliresim.com/5Gdl0M.png)

KimRoach143\_twitter

[12:52](#msg59ca4d8732fc8b7e40403f36)@abdllhygt can you please share last code because it still gives me same error

abdllhygt

[12:55](#msg59ca4e52210ac2692072f649)@KimRoach143\_twitter i add near view "compose/deep"

[12:56](#msg59ca4e7f7b7d98d30d3a26e0)

```
view compose/deep [
;your code
]
```

KimRoach143\_twitter

[12:57](#msg59ca4eb1f7299e8f5373c147)thanks @abdllhygt

abdllhygt

[12:57](#msg59ca4ebc177fb9fe7e0426dc)you're welcome

GiuseppeChillemi

[20:11](#msg59cab470b20c6424298d8fd8)Hi, I am still having problems understanding why a: "" or a: \[] does not reset the content of A  
From you comments at the end of april I have realized the "code is data" concept.  
In this example:  
red&gt;&gt; do code  
\== func \[input /local s]\[s: "hello world" append s input]  
red&gt;&gt; test "x"  
\== "hello worldx"  
red&gt;&gt; body-of :test  
\== \[s: "hello worldx" append s input]  
I have realized that you are directly modifing the data/code structure.  
But why a: "" or a: \[] lead to nothing ? Aren't we linking a: to an empty block or are "" and \[] "non existant", so it is like doing nothing ?

9214

[20:21](#msg59cab6ce614889d475415da8)@GiuseppeChillemi for "how" - use `copy` or `copy/deep`, for "why" - `series!` values are passed as pointers to some memory location, then you say something like `word: []`, it means "allocate some space for series, initiate it with some content (no content in this case) and make word point to that storage space" . So, in fact,`word` from that moment is always bound to \*static* memory address, while \*content* of that address could be changed and extended freely.

GiuseppeChillemi

[20:33](#msg59cab98ef7299e8f53766f35)but if you a: "abcdef" and later a: "" why it is still "abcdef" ? shouldn't "a:" get linked to another memory region ?

9214

[20:40](#msg59cabb48bac826f054011565)@GiuseppeChillemi ?

```
>> a: [1 2 3]
== [1 2 3]
>> a: ""
== ""
>> a
== ""
```

GiuseppeChillemi

[21:12](#msg59cac2d2b20c6424298de41c)rebol \[]

print-it: func \[/local str] [  
str: ""  
insert str "ha"  
print str  
str: ""  
]

[21:13](#msg59cac2f17b7d98d30d3d2a76)try print-it many times

9214

[21:26](#msg59cac608b20c6424298dfb42)Body of `print-it` is \*data\*, just like everything else in Red. This data is represented by block of 9 elements, and while 2nd and 9th element looks identical, they're not the same thing.

[21:33](#msg59cac78d7b7d98d30d3d4687)perhaps my answer with pointers and stuff was misleading :confused:

[21:39](#msg59cac91df7299e8f5376d7f8)

```
text
>> foo: func [x][s: [no spoon] probe append s x poke body-of :foo 2 [no spoon]]
== func [x][s: [no spoon] probe append s x poke body-of :foo 2 [no spoon]]
>> foo 'whatsoever
[no spoon whatsoever]
== [no spoon]
>> body-of :foo
== [s: [no spoon] probe append s x poke body-of :foo 2 [no spoon]]
```

[21:41](#msg59cac98b7b7d98d30d3d521f)I wonder if `self` could be supported in specs?

[22:04](#msg59cacf0bb59d55b8233ed72b)

```
text
>> foo: func [x][s: "before" probe append s x s: "after" probe s]
== func [x][s: "before" probe append s x s: "after" probe s]
>> foo "!!!"
"before!!!"
"after"
== "after"
>> body-of :foo
== [s: "before!!!" probe append s x s: "after" probe s]
```

Step by step:  
\* `s:` means \*next time when you see `s`, evaluate it to the result of an expression that follows me, whatever it might be\*;  
\* `"before"` is just a string to which `s` word is bound now, as implied by `s:` syntax;  
\* `append` is word that is bounded to a function, that function receives two arguments that follow `append` word;  
\* the first argument, `s`, evaluates to the \*\*thing that follows\** `s:`, namely `"before"` string, or, more specifically \*\*second\** element of `foo`'s body;  
\* the second argument, `x`, evaluates to whatever we've passed to `foo`;  
\* now, we have \*\*second element of foo's body\** and some value; what `append` does is just this: append some value to \*\*second element of foo's body\*\*;  
\* next `s:`, just like the first one, simply states \*next time when you see `s`, evaluate it to the result of an expression that follows me, whatever it might be\*;  
\* and `"after"` is what follows `s:`, \*\*it's the 8th element of foo's body\*\*, all subsequent `s` words will be evaluated to it;  
\* `probe` is a word that is bounded to function that blah-blah-blah;  
\* finally, `s` is evaluated \*\*to the 8th element of foo's body\*\*, and it is what it is, just `"after"`.

greggirwin

[22:06](#msg59cacf50177fb9fe7e077020)@GiuseppeChillemi, see https://github.com/red/red/wiki/Why-do-I-have-to-copy-series-values%3F

Or maybe this will help:

```
print-it: func [] [
	""
	insert first body-of :print-it "ha"
	print first body-of :print-it
	""
]
```

```
>> print-it
ha
== ""
>> print-it
haha
== ""
>> print-it
hahaha
== ""
```

[22:09](#msg59cad020b59d55b8233ede6d)Same as @9214's answer, without the explanation. :^) That is, the two empty strings in your func exist independently of any words that refer to them. So, at the end of your func, you have `str` point to the second one, but it's never used. On the next call, `str` is set to refer to the first string, which has now been modified, and you print that.

9214

[22:11](#msg59cad094b20c6424298e416c)All modifications are happen in-place, i.e. they modify original \*\*data\*\*. If you have a cup and ask Red to break that cup, it will break \*\*that\** cup instead of magically poofing broken cup out of air next to the original one.

greggirwin

[22:13](#msg59cad114614889d475420062)From the end of the wiki page:

&gt; One more thing. The colon (:) suffix in a word is not an assignment operator (as in other languages), it's part of the set-word! datatype literal syntax. When evaluated, it binds the word to the result of next expression. It doesn't do anything more than that. So a: "" does not "reset" or "reinitialize" the "variable" a. That is an incorrect interpretation, it just makes the word a refer to the literal string "" which follows it.

9214

[22:14](#msg59cad132bac826f054019dcd)but if you're just curious how broken cup might look like and don't want your precious cup to be mutilated, use `copy` on your cup, that way Red will make a new cup identical to yours (yeah, Red knows pottery) and will break that copy of a cup

greggirwin

[22:14](#msg59cad1637b7d98d30d3d7f58)I thought it was a vase he broke when he met the oracle. :^\\

9214

[22:15](#msg59cad177b20c6424298e453c)which vase? \*\*CRUSH SOUND\**

greggirwin

[22:15](#msg59cad184210ac26920764505)Yes! Well played.

9214

[22:16](#msg59cad1a4614889d475420564)though, I still can't bridge that mental gap between when data is evaluated and becomes another data

greggirwin

[22:16](#msg59cad1a632fc8b7e40437925)Now you can edit your post and say "What cup?"

9214

[22:19](#msg59cad2867b7d98d30d3d85ff)I mean, \*code* is `what to do`, something \*active\*, and \*data* is `something to manipulate upon`, something \*passive*

[22:20](#msg59cad2a032fc8b7e40437dbe)if everything is data and everything is passive, how something can happen at all?

gltewalt

[22:20](#msg59cad2b4cfeed2eb6553c984)Do!

9214

[22:21](#msg59cad2e7b59d55b8233eec9b)I know that this active/passive presupposition is lame and it comes from another languages, but it just doesn't click

[22:21](#msg59cad2f1614889d475420d19)well, `do` is data too

[22:22](#msg59cad30cb59d55b8233eed39)and of course you can `do do`, but then first `do` is data too...

gltewalt

[22:22](#msg59cad311b59d55b8233eed4c)The word is

[22:22](#msg59cad32432fc8b7e40437fbb)The soul is the evaluator, isn't it?

9214

[22:23](#msg59cad357177fb9fe7e078577)uh-uh, so at least evaluator is code

gltewalt

[22:23](#msg59cad374bac826f05401aae9)I'm guessing

[22:27](#msg59cad43bbac826f05401af2c)We will have to consult @dockimbel for deep diving, I think

9214

[22:29](#msg59cad4bc177fb9fe7e078c25)It actually make sense if you think of a Red program as a copy book with simple math: you see `1 + 2` \*\*on the paper\** and you write down answer \*\*on the same paper\*\*. `1 + 2` is data, but then you process it and come up with an answer, it's a code, \*\*but only in your head\*\*.

[22:30](#msg59cad504cfeed2eb6553d7ec)@gltewalt 2deep4me

[22:31](#msg59cad55ab59d55b8233ef6f0)how can you, oh mighty Redbol gurus, live on such mental heights without your head exploding?

[22:33](#msg59cad5c7b59d55b8233ef982)well, Frankenstein is a corpse until it's explicitly revived by an electricity :shipit:

gltewalt

[22:34](#msg59cad5fdb20c6424298e59b7)So there has to be some force or 'do', right? It can't all be inert data, can it?

9214

[22:35](#msg59cad63c210ac26920765dfd)it all boils down to the fact that our Universe consists of strings and at the center of the Universe is a tiny Red `v42.0.0` interpreter that constantly performs `do load` on everything

[22:35](#msg59cad64fb20c6424298e5bd3)it's that simple, no Ph.D required

gltewalt

[23:49](#msg59cae78bb59d55b8233f4f8f)@GiuseppeChillemi You might want `clear`, but it's important to learn the `copy` way.

```
print-it: func [/local str][
    str: ""
    insert str "ha"
    print str
    clear str
]
```

Many `print-it`:

```
loop 20 [print-it "ha"]
```

## Wednesday 27th September, 2017

sptorin\_twitter

[14:53](#msg59cbbb5eb20c64242992f5e6)@9214 @greggirwin read your last messages and head explodes twice... Let `a: "1234567890"` and after `a: ""`. This mean what somewhere in memory exist string "1234567890" and word `a` bound to it. After this we create new string "" and bound `a` to it. Now no one pointer look on "1234567890" - and this string must be garbage collected?

9214

[17:30](#msg59cbe01f614889d47547bcbc)@sptorin\_twitter tricky question

greggirwin

[17:50](#msg59cbe50232fc8b7e404920e2)@sptorin\_twitter, my guess is that the string can't be collected as long as the function exists. i.e. there is a value slot in the function body for that string, even though no word refers to it.

9214

[21:46](#msg59cc1c43177fb9fe7e0e9cfb)my thoughts are that as long as something is a part of the data (and everything is data), it can't just disappear (unless you explicitly delete it, i.e. modify data at run-time)

## Thursday 28th September, 2017

sptorin\_twitter

[01:54](#msg59cc5647f7299e8f537ef9d2)

```
a: "qwerty"
b: "qwerty"
c: "qwerty"
```

a, b, c - bounds to same data "qwerty"? In compiler mode, in interpreter mode?

PeterWAWood

[02:20](#msg59cc5c6fb20c6424299677db)@sptorin\_twitter Each of a, b and c are bound to a string! value. All three string! values initially contain the characters q,w,e,r,t, and y

```
>> a: "qwerty"
== "qwerty"
>> b: "qwerty"
== "qwerty"
>> c: "qwerty"
== "qwerty"
>> append a "a"
== "qwertya"
>> append b "b"
== "qwertyb"
>> append c "c"
== "qwertyc"
>> a
== "qwertya"
>> b
== "qwertyb"
>> c
== "qwertyc
```

[02:21](#msg59cc5cc6bac826f05409c86c)This is how to bind words to the same value:

```
>> a: b: c: "qwerty"
== "qwerty"
>> append a "abc"
== "qwertyabc"
>> b
== "qwertyabc"
```

sptorin\_twitter

[02:55](#msg59cc64b732fc8b7e404b9eb4)@PeterWAWood this make three string in memory?

```
a: "qwerty"
b: "qwerty"
c: "qwerty"
```

If we look at your first example, this right - now three string in memory with content "qwerty"

[02:57](#msg59cc650432fc8b7e404b9f65)Now make:

```
a: "qwerty"
a: "qwerty"
a: "qwerty"
```

Againg three string in memory?

PeterWAWood

[03:08](#msg59cc67b3cfeed2eb655c17ea)On reflection, it probably doesn't but I'm not certain.

If it does then values that are not bound to a `word!` or included in a collection (e.g. `block!`) will be garbage collected, once the garbage collector has been implemented.

sptorin\_twitter

[03:16](#msg59cc699b7b7d98d30d460c6d)`loop 100 [a: "qwerty"]` - 100 times bound `a` to same value? Because value in `block!`?

PeterWAWood

[03:19](#msg59cc6a497b7d98d30d460e69)I think that `a` is bound to the value "qwerty" in the first line, in the second and third lines, Red does not rebind to a new value.

[03:24](#msg59cc6b8a177fb9fe7e1001a1)

```
text
>> stats
== 3317760
>> loop 100000 [a: "qwerty"]
== "qwerty"
>> stats
== 3317760
>> loop 100000 [a: copy "qwerty"]
== "qwerty"
>> stats
== 6238208
```

[03:27](#msg59cc6c3cb20c64242996b5b6)As I understand, `set-word!`s evaluate differently if the word needs to be added to the context from when the word has already been added to the context.

geekyi

[11:30](#msg59ccdd59b20c64242998e8c5)Typing out a word(without pressing enter) creates 4 instances. Of those, 2 instances are 2-byte word encodings, one is history of whole console.  
Pressing enter gives me an obvious error about the word having no value, and 8 more instances are created (which includes the error message).  
Note that it's all done in the console on Win10.

So, depending on how things are done, it may take up different memory in ways one wouldn't have thought!  
Also, being alpha software, there's still space for much improvement here.

GiuseppeChillemi

[19:10](#msg59cd492832fc8b7e40505f7c)&gt; @9214 @greggirwin read your last messages and head explodes twice... Let `a: "1234567890"` and after `a: ""`. This mean what somewhere in memory exist string "1234567890" and word `a` bound to it. After this we create new string "" and bound `a` to it. Now no one pointer look on "1234567890" - and this string must be garbage collected?

[19:10](#msg59cd4940f7299e8f5384162c)

greggirwin

[19:40](#msg59cd50107b7d98d30d4b0d46)I answered that as best I could @GiuseppeChillemi. If \*nothing* refers to a value, it may be garbage collected. As long as \*something* refers to it, it can't. :point\_up: \[September 27, 2017 11:50 AM](https://gitter.im/red/red/welcome?at=59cbe50232fc8b7e404920e2) may be corrected by @dockimbel, but these are also details that could change, and may not be worth time answering right now.

[19:40](#msg59cd503ebac826f0540f043c)When implementation details like this become important is when they affect users directly.

## Friday 29th September, 2017

dockimbel

[07:13](#msg59cdf2aeb20c6424299eb73f)@geekyi How to do you end up with those counts?

[07:17](#msg59cdf3a1b59d55b8234f4b76)@GiuseppeChillemi  
&gt; The answer has still not solved some points like this. Hope @dockimbel will help clarify.

I'm not sure what is missing from above explanations, but to answer your question, a series which is no longer referenced anywhere will be garbage -collected. If you put that string in a function body block, it is referenced.

[07:19](#msg59cdf4117b7d98d30d4e098f)@9214  
&gt; how can you, oh mighty Redbol gurus, live on such mental heights without your head exploding?

With Redbol, it's most of time simpler than you think. I'm trying to write down some general explanations of the core concept, for the Red documentation and eventually a blog article.

9214

[08:47](#msg59ce08bccfeed2eb65648a73)@dockimbel that will be great, because I feel that I lack strong mental model of what is really happening then I program in Redbol and it kinda limits my power. I would say that freedom is truly paralyzing ;)

[08:49](#msg59ce09117b7d98d30d4e76ba)btw, currently only `series!` could be modified in-place, am I right that with `ref!` datatype such self-modification will be doable with everything?

meijeru

[09:39](#msg59ce14cb32fc8b7e40541b62)I thought that `ref!` was a re-designed `issue!`... :worried:

rebolek

[09:49](#msg59ce172bb59d55b823501011)IIRC `ref!` is for `@name`

[09:50](#msg59ce1760614889d475532621)(I’m not sure why, but I can't type `@` in Firefox, I have to copy it)

PeterWAWood

[09:55](#msg59ce187db20c6424299f8709)@9214 I'm not certain that "currently only `series!` could be modified in-place" is correct. Though I may not understand what you are saying. `object!` and `map!` values can be modified in place. I believe that `pair!` and `tuple!` values can be modified in place.

9214

[10:49](#msg59ce252e7b7d98d30d4f174d)@PeterWAWood

```
>> x: [1 2 3]
== [1 2 3]
>> reverse x
== [3 2 1]
>> x
== [3 2 1]
>> x: 1x2
== 1x2
>> reverse x
== 2x1
>> x
== 1x2
>> x: 1.2.3.4
== 1.2.3.4
>> reverse x
== 4.3.2.1
>> x
== 1.2.3.4
```

meijeru

[10:53](#msg59ce2610bac826f054130888)But,

```
>> x: 1.2.3
== 1.2.3
>> x/1: 4
== 4
>> x
== 4.2.3
```

[10:54](#msg59ce2682614889d4755377ba)This modification in place applies to `pair!`, `tuple!`, `time!` and `date!` values.

9214

[10:59](#msg59ce27757b7d98d30d4f2181)not sure what I meant either :D

```
>> f: func [x][y: 0 y: y + x]
== func [x][y: 0 y: y + x]
>> f 5
== 5
>> body-of :f
== [y: 0 y: y + x]
```

```
>> f: func [x][y: [0] y/1: y/1 + x]
== func [x][y: [0] y/1: y/1 + x]
>> f 5
== 5
>> body-of :f
== [y: [5] y/1: y/1 + x]
```

what if I want `y` in the first example to be modified as in the second example, only without explicit block wrapping?

[10:59](#msg59ce27a1177fb9fe7e1924fe)I thought that `ref!` is something like a pointer to series position

[10:59](#msg59ce27a8bac826f054131059)reference

rebolek

[11:06](#msg59ce293c177fb9fe7e192ead)No, probably the name is confusing and should be changed.

9214

[11:08](#msg59ce29c2cfeed2eb6565436e)so, `ref!` is sort of a @9214 mention?

[11:09](#msg59ce29e3b59d55b823507235)couldn't find any info about this datatype in R3 docs

rebolek

[11:10](#msg59ce2a2ab20c6424299fe326)@9214 it is not in R3

9214

[11:14](#msg59ce2b1d32fc8b7e40549790)another thing that I learned today is that `tuple!` is not limited in it's length (I thought that it should contain exactly 4 elements)

PeterWAWood

[11:18](#msg59ce2c1ccfeed2eb65655097)&gt; another thing that I learned today is that `tuple!` is not limited in it's length (I thought that it should contain exactly 4 elements)

`tuple!` is limited in length.

[11:19](#msg59ce2c5fcfeed2eb65655164)

```
text
>> 1.2.3.4.5.6.7.8.9.10.11.12
== 1.2.3.4.5.6.7.8.9.10.11.12
>> 1.2.3.4.5.6.7.8.9.10.11.12.13
*** Syntax Error: invalid tuple! at "1.2.3.4.5.6.7.8.9.10.11.12.13"
*** Where: do
*** Stack: load
```

9214

[11:22](#msg59ce2cfd614889d4755399d2)@PeterWAWood thanks, my bad, I stopped at 10th :D

[11:22](#msg59ce2d0c177fb9fe7e194164)and minimum length is 3, otherwise it's a `float!`

toomasv

[11:24](#msg59ce2d75177fb9fe7e194339)It doesn't accept devil's dozen :imp:

PeterWAWood

[11:28](#msg59ce2e667b7d98d30d4f441a)A baker's dozen in England 🥐

pekr

[11:46](#msg59ce329df7299e8f538899c0)`ref!`leads ppl to think it is a pointer oriented datatype. I can simply imagine it being named `name!` or `label!`

[11:48](#msg59ce32fd32fc8b7e4054c628)btw - as for a pointer stuff, isn't there a `handle!`datatype for that?

greggirwin

[16:03](#msg59ce6ebef7299e8f538a26a4)The `ref!` name was discussed quite heavily at one point, on atlme too, but is not finalized. We also have `tuple!` with a different meaning than in other languages. What we need to do is ask: "What is the main purpose of this datatype? What does it represent?" People new to Red have a \*lot* of concepts to learn, and old habits and ideas to un-learn.

I'm short on time, but will try to write up thoughts in the future. But `ref!` values aren't \*just* for human handles in chat (e.g. @pekr). They could be used to refer to locations in code, as in a cross-reference, a specific message in a chat, a point in time, etc. That is, it refers to \*something\*. And since Red has no concept of a pointer, though R/S does, there shouldn't be much confusion after initial exposure.

## Saturday 30th September, 2017

GiuseppeChillemi

[06:50](#msg59cf3e9fb59d55b82355e2b4)@dockimbel  
I have worked on the "there is no spoon" problem and while it seems I have understood the "code is data"/"data is code" paradigm, I have ended up in a problem:

[06:50](#msg59cf3ea8210ac269208cf126)Please look at this code:

[06:57](#msg59cf404bf7299e8f538ded4f)

```
print-it: func [/local str] [
    str: ""
    insert str "ha"
    print ["First STR" str]
    str: ""
    print ["Secnd STR" str]
    Clear STR
    print ["Clear STR" str]
]
```

[07:01](#msg59cf414d210ac269208cfe02)New users head "explodes" while thinking that "STR" as the second "str" let us think the first one is being reset and referenc to the value of the rist one lost.

[07:03](#msg59cf41cc210ac269208cffbd)What confuses more, and I am talking of personal experience, is the fact this kind of code works flawlessy in the main code body as if you do not repeat it in a loop, each time you start the script REDBOL programs seems behave like other programming languages

[07:05](#msg59cf423632fc8b7e405a1674)Only inside a loop, when the first STR and its next VALUE is referenced for the second time you will discover it is "ah" and then "ahah" and then "ahahah" at the third round.

[07:13](#msg59cf4423177fb9fe7e1eda4d)In other programming languages STR: "ah" and STR: "" change the value of the variable with a CLEAR and SET TO a value which is independend from the position of the code. While in REDBOL languages the position is a STORAGE of VALUE too.And we should workwith a very different logic

9214

[07:19](#msg59cf459d177fb9fe7e1edf2c)@GiuseppeChillemi  
Every Redbol script is contiguous block of data. Think of it as one dimensional space. Now, this one dimensional space have some sort of spatial markers which point to specific location in this space. This is what `set-word!` is - it's just this type of marker. `set-word!` points to location in source code, while variables usually point to location in memory. \*\*But there's no variables in Redbol\*\*. In a vague sense, script's body is it's own memory. Entire script is just one big chunk of self-modifiable state, which can be trivially serialized, saved and restored.

GiuseppeChillemi

[07:20](#msg59cf45c3b59d55b8235601be)STR: "ah" must be read: STR is taking data from the CODEFLOW position shich is next to it (lets say it is pointer 1 to "ah")  
another STR: "" must be read as TAKE DATA FROM CODEFLOW position next to it (lets say it is a pointer 2 to "")  
When the code loops the first STR takes data from code position 1

[07:22](#msg59cf4643f7299e8f538e047f)So it is like having a different pointer not the same one which is reset or repositioned to point to another value

[07:25](#msg59cf4707bac826f05418c779)In  
STR: "ah"  
STR: ""  
We have  
STR: is "CODEFLOW POSITION INDEX 1"  
"ah" is "CODEFLOW POSITION INDEX 2"  
STR: "CODEFLOW POSITION INDEX 3"  
"" is "CODEFLOW POSITION INDEX 4"

9214

[07:26](#msg59cf4741210ac269208d13db)what is "codeflow" anyway?

GiuseppeChillemi

[07:28](#msg59cf4781f7299e8f538e095e)It is FLOW of CODE: any word which makes up your code

9214

[07:28](#msg59cf47a7b59d55b823560a5d)and why not just "block"?

GiuseppeChillemi

[07:38](#msg59cf49eb614889d475591fc4)When you:

```
STR: "" ;""  is data structure position 2
insert STR "ah"
STR: "" ;"" is data structure position 7
insert STR "bb"
```

you are stating: SET STR to what you find at position 2 of your data structure ("")  
Then: insert on what is rapresented in position 5 (word "ah") on position 2  
Then: set STR to what is rapresented in position 7 (second "") and use THIS POSITION in further reference to get/set the contend of STR  
then insert on POSITION 7 "bb"  
If this code loops, the first STR will take again the value "ah" insted of "BB" as it will use the content of position 2. The second one will use te conent of position 7.

[07:39](#msg59cf4a27cfeed2eb656ada1d)So the first insert STR "ah" will have as result "ahah" at the second loop

cahiggins

[07:42](#msg59cf4af7b59d55b823561910)that makes sense now

GiuseppeChillemi

[07:45](#msg59cf4ba7614889d475592777)@cahiggins After more than 10 years of REBOL it now makes sense to me too. It is important to help other users to "disconnect" to their old knowledge and connect to the new one.  
I can say I am out of the matrix now !

9214

[07:54](#msg59cf4dc7177fb9fe7e1f00f2)here's another food for thought - think about how it all mixes together with `bind` and contexts

GiuseppeChillemi

[07:59](#msg59cf4ec4b20c642429a5b147)@9214 Bind, contexts, reduce, form, mold, set, pick, blocks, system/words, parse, dialects.... I have to start over with new eyes.

[07:59](#msg59cf4ed5614889d4755933e0)there is no spoon !

[08:00](#msg59cf4f27f7299e8f538e2615)I am a borg ! I am part of the group. We all say "there is no spoon". You will be assimilated to the 'NO SPOON" logic. Resistence is futile.

9214

[08:07](#msg59cf50ac7b7d98d30d54e5c4)for that matter, the next step is to accept that there's no `I`

rebolek

[08:15](#msg59cf52aff7299e8f538e3489)Carl has described Rebol script as \*series of values* which is best description IMO.

9214

[08:16](#msg59cf52e57b7d98d30d54ef87)@rebolek well, yeah, since script can be in various forms (`block!`, `string!`, `binary!`)

rebolek

[08:17](#msg59cf530eb59d55b823563c69)Yes, but it loads as `block!` anyway.

PeterWAWood

[08:24](#msg59cf54b4b59d55b823564441)Carl also refers to Rebol scripts as \*expressions\*. He says "REBOL Expressions are based on this concept: you combine values and words into blocks".

The chapter \[Expressions](http://www.rebol.com/docs/core23/rebolcore-4.html#section-1) in the Rebol User Guide is pretty much essential reading.

rebolek

[08:26](#msg59cf55237b7d98d30d54f914)I agree. Basically the whole book is essential reading.

geekyi

[09:58](#msg59cf6abe7b7d98d30d555835)\[!\[image.png](https://files.gitter.im/red/red/welcome/U82u/thumb/image.png)](https://files.gitter.im/red/red/welcome/U82u/image.png)

[09:58](#msg59cf6ae0cfeed2eb656b69e4)@dockimbel :point\_up: \[September 29, 2017 12:13 PM](https://gitter.im/red/red/welcome?at=59cdf2aeb20c6424299eb73f)  
&gt; @geekyi How to do you end up with those counts?

I used a program that reads strings in memory

[09:59](#msg59cf6af3210ac269208dadef)\[Process Hacker 2](http://processhacker.sourceforge.net/downloads.php)

[10:18](#msg59cf6f72f7299e8f538eafdb)Interestingly, I can also write to memory (notice the `Blu`):

[10:18](#msg59cf6f79177fb9fe7e1f8db0)\[!\[image.png](https://files.gitter.im/red/red/welcome/HsRr/thumb/image.png)](https://files.gitter.im/red/red/welcome/HsRr/image.png)

[10:19](#msg59cf6fbd7b7d98d30d5569d7)@geekyi rubs hands (using this to debug the internals would be fun)

[10:21](#msg59cf703d210ac269208dc2ae)This is also easier for anyone to get started with, than most other programs I tried(this particular functionality was just hidden very deep)

dockimbel

[10:37](#msg59cf73e0614889d47559cc2f)@geekyi Such extra copies could be created by the OS or the C library, as you are reading through the whole process's memory.

geekyi

[10:38](#msg59cf7411177fb9fe7e1fa0e4)Yes, some of them seem to be 2-byte encodings

dockimbel

[10:38](#msg59cf742c32fc8b7e405ada3a)That's UTF-16 strings, used by Windows API.

greggirwin

[17:11](#msg59cfd04f614889d4755b68ca):point\_up: \[September 30, 2017 1:19 AM](https://gitter.im/red/red/welcome?at=59cf459d177fb9fe7e1edf2c) @9214, save this somewhere. I like this explanation.

9214

[17:13](#msg59cfd0c6b20c642429a7e7fb)@greggirwin :muscle:, though, I need to meditate on how to blend this all together with bindology and other features nicely

greggirwin

[17:25](#msg59cfd382f7299e8f53906337)Yes, but it's a nice "visual" metaphor.

## Sunday 1st October, 2017

GiuseppeChillemi

[08:08](#msg59d0a263bac826f0541e547d)@greggirwin Yes, it add a missing block: code is itself memory where you store, retrieve and interpret.

gltewalt

[17:48](#msg59d12a5ef7299e8f5395c71b)Will there be a mechanism in the future to prevent code injection or 'not so nice' foreign code?

rebolek

[18:53](#msg59d1399a177fb9fe7e270947)There already are such ways, `construct`, etc.

## Monday 2nd October, 2017

greggirwin

[03:16](#msg59d1af9b7b7d98d30d5ecb73)Dialects are also a major pattern for preventing code injection. You will likely never be able to safely `do` untrusted code.

dockimbel

[03:28](#msg59d1b24b7b7d98d30d5ed3d8)@gltewalt `do` cannot be secured, but it should be possible to sandbox untrusted code, by blocking some language features.

## Sunday 8th October, 2017

GiuseppeChillemi

[19:12](#msg59da789d177fb9fe7e534b42)Now that I have understood "there is no spoon" I want to move to the next step: how is the code interpreted ? From loading the script to the very first steps

greggirwin

[19:45](#msg59da8053b20c642429d9cc9e)@GiuseppeChillemi, lexical scanning is the first step. Parsing and tokenizing the input to find Red values in the text, and determining if the input is valid. That is, it contains all valid Red values.

At that point you have a block of values. Think about how you, as a human, interpret that. You know some values are direct values, like numbers. But what happens when you find a word? You need to determine what to do. What kind of word is it? What is the behavior of each kind of word?

## Monday 9th October, 2017

RiVeND

[12:21](#msg59db69d0f7299e8f53c627d3)@greggirwin Thanks for that, Gregg :thumbsup: . I always find I have better comprehension of a system if I can picture what's going on under the hood. Maybe, when the documentation efforts get off the ground, those with more in-depth knowledge of Red could produce some simple flowcharts of what the more complex parts do (such as parse). I know they would definitely help me get a better grip on the language.

greggirwin

[17:51](#msg59dbb73fbbbf9f1a383e419d)Glad if it helped a bit @RiVeND. `Parse` is deep, and hard to describe in prose/text, because the behavior and data mixture will be verbose. An interactive tool will be much better, so you can see what rule is being evaluated, the current location in the input, and maybe hints about keyword behavior. e.g. if `ahead` is evaluated, a "does not advance" indicator could light up.

There was an old parsing tool, VisualParse++, from Sandstone technology, that did something like that. It was a shift-reduce parsing tool, and was pretty cool.

GiuseppeChillemi

[20:39](#msg59dbde68210ac26920c6e19d)How datatypes are associated to each element of the block ?

dander

[20:51](#msg59dbe1373cb340a26104a8e1)@GiuseppeChillemi the elements of a block are all values, and every value has a type. All values in Red are 'boxed', and the box contains both the type and data structure which represents the value

## Tuesday 10th October, 2017

greggirwin

[18:27](#msg59dd110e177fb9fe7e605ff7)@GiuseppeChillemi, to add to @dander's answer, you can think of blocks as having "value slots" that refer to values. The block doesn't know, or care, what type of value is in each slot.

## Wednesday 11st October, 2017

MartenH

[10:52](#msg59ddf7eb3cb340a2610efe49)Hi  
I'm new to the language and I'm trying to do something that I think is quite simple, but I fail.  
I just want to convert a hexadecimal byte that is on string format to a binary value.

Something that works:

```
t: #"^(AB)"
a: to binary! to-hex/size (to integer! t) 2
print a
```

I now want to "construct" t so that "AB" can be a string, ie construct a character from a string if that makes any sense.

I know that are other ways to do this but this got interesting.

9214

[10:57](#msg59ddf9203cb340a2610f040e)?

```
>> skip to binary! #"^(AB)" 1
== #{AB}
```

[10:58](#msg59ddf93f01110b7231a122fc)idk if that will work for you in general case

dockimbel

[11:25](#msg59ddffbf614889d4759ef522)@MartenH

```
t: #"^(AB)"
append a: #{} to-integer t

== #{AB}
```

[11:27](#msg59de0009e44c43700a1cd6ae)&gt; construct a character from a string

A string is composed of characters, so such wording doesn't make much sense in this context. You might want to \*extract* a character from a string rather.

MartenH

[11:48](#msg59de04f5f7299e8f53d3b227)Thanks for the responses.  
I'm know I'm missing something fundamental but I still don't understand how to create t in this case.

Assume "AB" is held in a string! how to I create t ?

```
str: "AB"
t: ????
```

pekr

[11:53](#msg59de062df7299e8f53d3bba1)`load rejoin ["#{" "AB" "}"]` ; though not sure it is a safe aproach ...

9214

[11:54](#msg59de0659210ac26920d1cdcf)@MartenH

```
>> str: "AB"
>> load rejoin [{#"^^(} str {)"}]
== #"«"
```

[11:54](#msg59de066301110b7231a16caf)ah, @pekr was faster :)

MartenH

[12:16](#msg59de0bbb614889d4759f38b1)Thanks a lot! Was looking for something like "rejoin" , but I could not find it:http://static.red-lang.org/red-system-specs-light.html nor here...http://www.red-by-example.org/ . Again, thanks.

[13:04](#msg59de16d0e44c43700a1d653b)More things I don't understand, in this case why I would need paranthesis around a.  
I simply do not understand the difference

```
>> t: "12345"
== "12345"
>> repeat a length? t [ print t/a ]
*** Script Error: word! type is not allowed here
*** Where: print
*** Stack:  

>> repeat a length? t [ print t/(a) ]
1
2
3
4
5
>>
```

toomasv

[13:39](#msg59de1f0001110b7231a20688)@MartenH Without parenthesis, path notation seeks literal `a`, but inside parens `a` is first evaluated to number and only then path is accessed. String is series, and you can access its elements by index numbers but not by literal words. Other structures can be accessed by words, e.g.:

```
>> t: [a b c]
== [a b c]
>> t/a
== b
>> t: #(a: 1 b: 2)
== #(
    a: 1
    b: 2
)
>> t/a
== 1
>> t: object [a: 1 b: 2]
== make object! [
    a: 1
    b: 2
]
>> t/a
== 1
```

pekr

[14:00](#msg59de23eebac826f0545fa9df)`repeat a length? t [print t/:a]`

9214

[14:07](#msg59de25a13cb340a261100847)`forall t [print first t]`

MartenH

[14:34](#msg59de2bdd3cb340a261102f49)Seems I have been coding C for too long...

DVL333

[16:05](#msg59de4144f7299e8f53d52239)I want to create form with flags (for example, "resize") and options ("menu"). I know how to do it separately, but how to combine them together for the form?

```
view/options [][menu: ["a" "b" "c"] ]
view/flags [] ['resize 'modal]
```

nd9600

[16:27](#msg59de465ef7299e8f53d544dc)Is there a way to have error messages tell you what line they were thrown from? I can only see "Where: append" right now, and I've a lot of appends in my script, so it's a bit hard to debug

[16:30](#msg59de4717177fb9fe7e66d6e2)http://www.rebol.org/ml-display-thread.r?m=rmlZRCK seems to say "no"

gltewalt

[19:07](#msg59de6c0b3cb340a26111b16e)@MartenH take a look at `pad` it might help with what you want

toomasv

[19:52](#msg59de7684614889d475a1d755)@nd9600 I think this is the way:

```
view/options/flags [][menu: ["a" "b" "c"]]['resize 'modal]
```

greggirwin

[20:11](#msg59de7ae9210ac26920d490c1)@MartenH, you'll find your feet in Red soon enough. Just keep asking questions when you need to, and save some time.

[20:13](#msg59de7b55614889d475a1f6b3)@DVL333, I think @toomasv meant to tag you in his answer.

[20:16](#msg59de7c1ebbbf9f1a384cbbed)@nd9600, there is no line information in errors. It would come up at times in the Rebol community, but I haven't seen it requested for Red yet. It's tricky, and Carl talked about it at one point, because there isn't always a concept of "lines". That is, Red doesn't need to maintain new line markers for processing in loaded code. Practically speaking, we use them a lot.

DVL333

[20:21](#msg59de7d3f614889d475a2020e)@toomasv @greggirwin Yes, i've tried it - OK. Thank you very much!

toomasv

[20:31](#msg59de7f96bac826f05461e2fd)@greggirwin Thanks! :blush:

MartenH

[20:53](#msg59de84beb20c642429eea880)@gltewalt @toomasv @9214 @greggirwin Thanks..

gltewalt

[23:39](#msg59deabaa3cb340a261130829)I was confused earlier. I might still be unclear on what is expected, but - @MartenH is this the result that you were looking for?

```
>> str: "AB"
== "AB"
>> t: enbase/base str 2
== "0100000101000010"
```

## Thursday 12nd October, 2017

9214

[01:49](#msg59deca23177fb9fe7e69967c)@MartenH  
&gt; Thanks a lot! Was looking for something like "rejoin" , but I could not find it:http://static.red-lang.org/red-system-specs-light.html

on a side note - you shouldn't look at R/S docs, because they are not about Red, but about Red/System, a low level dialect. Here's a \[list](https://gist.github.com/9214/784e7f7af2342f117bc67a8e2698855b#red) of learning resources, but you also should get familiar with `probe`, `source`, `help`, `what`, `?` and `??` functions.

gltewalt

[02:02](#msg59decd4a3cb340a26113888e)Best list of all time

RnBrgn

[02:31](#msg59ded3fa177fb9fe7e69beb3)@greggirwin  
&gt;@nd9600, there is no line information in errors. It would come up at times in the Rebol community, but I haven't seen it requested for Red yet. It's tricky, and Carl talked about it at one point, because there isn't always a concept of "lines". That is, Red doesn't need to maintain new line markers for processing in loaded code. Practically speaking, we use them a lot.

Greg, if Red code is just data , why can't the error indicate which element "#" in the series code block the error happened at?

MartenH

[08:05](#msg59df2240bac826f05464c177)@9214 I'm actually a bit confused about what is in the R/S and in Red. The R/S specification is really good but for specific Red things (#system, etc) I find myself digging in the examples..it will come to me I guess.

9214

[08:06](#msg59df228a01110b7231a72462)R/S -&gt; C, Red -&gt; Rebol + Forth + Lisp + turtles all the way down

MartenH

[08:18](#msg59df2566f7299e8f53d98720)@gltewalt Nope. What I have a string of byte values, so "AB12CD" should become #{AB12CD}. Did @pekr solution and that worked fine..

[08:22](#msg59df2639bac826f05464d5e3)Is there a "/local" for block scope? I now use things like "t: copy \[]" to clear things...

dander

[08:33](#msg59df28ee210ac26920d7a683)@MartenH there is also `debase` for converting a binary coded string into a binary value: `debase/base "AB12CD" 16` (default is base 64)

MartenH

[08:39](#msg59df2a4a01110b7231a74c98)@dander Yes, that was indeed simpler...

dander

[08:40](#msg59df2a97177fb9fe7e6b4403)There isn't really such a thing as "block scope" in Red. Each word in independently bound to a context, and some things like functions will bind all the words of their body to a new context, which works a lot like having a function scope. It is one of the deeper topics to dig into, but depending on how far deep you want to go, there are some articles from Rebol on "bindology" that explain it pretty well

9214

[09:06](#msg59df30ab177fb9fe7e6b64bb)@MartenH not sure what you mean by "block scope"

MartenH

[09:11](#msg59df31d4bac826f0546512ff)@9214 I used the /local in a block and thought it would be the same thing as in C, but it  
has function scope and not block scope....

In C this would be:

```
if( ..) {
   uint32_t hello;
   hello = 1;
}
```

hello variable would only live in the if block.

9214

[09:13](#msg59df3227177fb9fe7e6b6cb0)@MartenH I dont' know C that much, but here's the thing - C has lexical scoping, but Red has \*no scopes at all*

dockimbel

[09:13](#msg59df3236e44c43700a2304ac)@MartenH I strongly suggest reading the \[Rebol/Core Manual](http://www.rebol.com/docs/core23/rebolcore.html), if you haven't done so yet. You cannot understand Red language from R/S documentation.

MartenH

[09:13](#msg59df3251b20c642429f1c336)The page @dander refers seems to be this, https://en.wikibooks.org/wiki/Rebol\_programming/Advanced/Bindology, but it's beyond me at this point

[09:16](#msg59df32eebac826f054651919)@dockimbel Thanks.... I'm reading there now also.

9214

[09:17](#msg59df3329b20c642429f1c75a)here's how you can "localize" the block

```
>> my-block: [x: 1]
== [x: 1]
>> context my-block
== make object! [
    x: 1
]
>> x
*** Script Error: x has no value
*** Where: catch
*** Stack:
```

[12:14](#msg59df5c97b20c642429f2bc6a)@dockimbel is it correct to say that only some (or all?) `any-function!`s are context constructors?

[12:15](#msg59df5cebe44c43700a23faec)and what's the difference between `action!`, `routine!` and `native!` ?

dockimbel

[12:33](#msg59df610ebac826f054662337)@9214 That statement is only valid for `function!` constructors, the other ones are written in R/S, so they don't need a Red `context!` to operate.

9214

[12:34](#msg59df614fb20c642429f2d707)@dockimbel thanks, though `context!` is a hidden internal datatype, right?

dockimbel

[12:35](#msg59df6187177fb9fe7e6c7e44)`action!` are datatypes "methods", `native!` are just core functions written in R/S (for performance, simplicity or feasability reasons). `routine!` are user-written functions with a R/S body (routines exist both in Red and R/S realms at the same time).

[12:35](#msg59df6190bac826f0546625bf)Correct, it's not directly exposed to Red level. Though `object!` and `function!` both hold a reference to `context!` values internally.

9214

[12:37](#msg59df6222b20c642429f2db8e)I feel a strong itch to dive lower and study system programming either with Forth or R/S :smile:, any suggestions (books/stuff, meditation techniques, etc) taking into account that I only barely know C (~ first 4 K&amp;R chapters)?

[14:52](#msg59df81b201110b7231a953dc)@dockimbel this means that `make` (`action!`) isn't context constructor? I mean, not in general, but when it comes to `function!` and `object!`.

dockimbel

[15:24](#msg59df892701110b7231a982e4)@9214 Only in those two cases (for now), yes.

9214

[15:29](#msg59df8a65e44c43700a2512dc)&gt; for now

:suspect:

greggirwin

[19:21](#msg59dfc0b9177fb9fe7e6ecaba)@MartenH, see also: https://github.com/red/red/wiki/Why-do-I-have-to-copy-series-values%3F

[19:27](#msg59dfc235bac826f05468751a)@RnBrgn, It's possible that Red \*could* provide more information. I can't speak to internal details, but consider that there may be a lot of overhead in tracking things. Only in the simplest cases is your code a single level series of values. Add to that, the ability to dynamically construct and change code, even at runtime, and Red potentially has to maintain a lot of state-location references.

[19:28](#msg59dfc26c210ac26920db3425)So the question to ask may not be "Can we show line numbers?", but "What is the most helpful information to show, that is also useful when building tools?"

gltewalt

[19:37](#msg59dfc492bac826f05468820a)If we had the ability to grab a name from its value, could tell what `word` error happened at?

greggirwin

[19:42](#msg59dfc5b0b20c642429f52d91)More than one word can refer to the same value. And, again, what do you do when things change dynamically? Yes, we have a lot of cases where that doesn't happen, but if we momentarily forget how things work in other langs, and think in terms of Red...if you were the "Red engine", what would you tell the user?

gltewalt

[20:04](#msg59dfcab3177fb9fe7e6f03fd)In this example, does 'a get clobbered twice, or are these actually distinct atoms?

```
>> set/only [a a a] [1 2 3]
== [1 2 3]
```

greggirwin

[20:10](#msg59dfcc1801110b7231ab099d)I don't know what you mean by "clobbered", but `a` is in the same context. `Set` will evaluate each word in the word block and set it to reference the appropriate value. Words can't be duplicated in contexts.

```
>> probe context [a: 1 a: 2]
make object! [
    a: 2
]
```

gltewalt

[20:11](#msg59dfcc6c177fb9fe7e6f0c4a)I mean rebind the word `a` each time it appears after the first time

greggirwin

[20:12](#msg59dfcccb3cb340a26118ccf7)Yes. Easy to see:

```
>> set [a a a] [1 2 3]
== [1 2 3]
>> a
== 3
```

gltewalt

[20:18](#msg59dfcdff3cb340a26118d329)Isn't that different than `set/only`?

[20:19](#msg59dfce543cb340a26118d4d0)I was wondering if there's really only one `a` in the `set/only` example, or if the individual words were identifiable somehow?

greggirwin

[20:20](#msg59dfce99f7299e8f53dd6a60)Only in what value is referenced.

```
>> set [a b c] [1 2 3]
== [1 2 3]
>> print [a b c]
1 2 3
>> set/only [a b c] [1 2 3]
== [1 2 3]
>> print mold reduce [a b c]
[[1 2 3] [1 2 3] [1 2 3]]
```

9214

[22:55](#msg59dff2f93cb340a2611994ca)you can't have two identical words with two different meanings in the same context, but you can have two identical words with two different meanings in the same block

RnBrgn

[23:13](#msg59dff72be44c43700a277129)@greggirwin thanks for taking the time to respond to my question. There"s always more to it than I realize. But I always learn a bit more with explanations like that.

## Friday 13th October, 2017

greggirwin

[16:14](#msg59e0e6655c40c1ba79985ddf)@RnBrgn, you're very welcome. Others, lurking, also learn, and I often learn things as I revisit and try to figure out how best to explain them.

[16:17](#msg59e0e730e44c43700a2c31c1)@gltewalt, to build on what @9214 said:

```
>> o-1: object [a: none]
== make object! [
    a: none
]
>> o-2: object [a: none]
== make object! [
    a: none
]
>> blk: reduce ['a  in o-1 'a  in o-2 'a]
== [a a a]
>> blk
== [a a a]
>> set blk [1 2 3]
== [1 2 3]
>> a
== 1
>> probe o-1
make object! [
    a: 2
]
== make object! [
    a: 2
]
>> probe o-2
make object! [
    a: 3
]
== make object! [
    a: 3
]
```

[16:19](#msg59e0e7793cb340a2611e5162)Getting into binding is a bit deep for the Welcome group, but expanding minds early isn't a bad thing. :^)

## Monday 16th October, 2017

Senenmut

[18:16](#msg59e4f7895c40c1ba79aabbbd)Hi Gregg , i make a break from programming. Just send a message from holidays to the best guys in programming like Red ones are. Such like the best yacht for yachting here in Italy on the Azimut Grande 140 Trideck. Ill be back. http://azimutyachts.me/yachts/list-grande/boat-f-140.html The barbarian.

greggirwin

[18:22](#msg59e4f900e44c43700a3e6334):^)

nd9600

[21:02](#msg59e51e6e177fb9fe7e881ed0)Is there a way to read the parameters for things in the VID or draw dialects?

[21:03](#msg59e51eaf5c40c1ba79aba2c1)I try to see what facets something like `box` needs by trying `? box` but it never works

[21:04](#msg59e51ecc210ac26920f4149d)I assume because `?` only works for proper Red code, not a dialect

[21:07](#msg59e51f925c40c1ba79aba7cb)I mean, apart from https://doc.red-lang.org/en/vid.html

greggirwin

[21:59](#msg59e52bd9bbbf9f1a386c4d48)@nd9600, correct. `Help` doesn't know about dialects.

nd9600

[22:04](#msg59e52cd0e44c43700a3f9a79)Ah so we'll probably just always have to go to the online docs

greggirwin

[22:04](#msg59e52d09177fb9fe7e887334)No. Someone just needs to write a `vid-help` function or tool.

[22:05](#msg59e52d3e210ac26920f4677d)That said, there is no standard for dialect reflection, so it's not going to work like `help` does.

nd9600

[22:36](#msg59e534515c40c1ba79ac15b2)Thanks

[22:36](#msg59e5346c32e080696eeb3ee4)Should `random` return the same values when I run it in different console instances?

[22:37](#msg59e53497b20c6424290ead71)I just noticed it always returns first 753, then 781, then 267 if I run `random 1000` in different consoles

[22:39](#msg59e53519bbbf9f1a386c8163)`random/secure 1000` and `random/seed 1000` give the same behaviour

[22:39](#msg59e535225c40c1ba79ac1961)It's probably just not done yet

greggirwin

[22:48](#msg59e5375501110b7231c451fc)The RNG is seeded the same by default. You use `/seed` to give it a different seed, so you can get reproducible results when needed. e.g.

```
>> random/seed 1000
>> random 1000
== 178
>> random/seed 1000
>> random 1000
== 178
>> random/seed 1001
>> random 1000
== 985
```

[22:49](#msg59e53786bbbf9f1a386c8b89)Here's a quick `randomize`, though we should do some R&amp;D to determine the best way to randomize. This is and old func, ported from R2.

```
randomize: func [
    "Reseed the random number generator."
    /with seed "date, time, and integer values are used directly; others are converted."
][
    random/seed either find [date! time! integer!] type?/word seed [seed] [
        to-integer checksum form any [seed now/precise] 'sha1
    ]
]
```

nd9600

[22:57](#msg59e53961614889d475c27720)I see. I assumed it would have a different seed every time

## Tuesday 17th October, 2017

geekyi

[03:19](#msg59e576d95c40c1ba79ad29b1)@nd9600 :point\_up: \[October 17, 2017 2:02 AM](https://gitter.im/red/red/welcome?at=59e51e6e177fb9fe7e881ed0)  
&gt; I try to see what facets something like `box` needs by trying `? box` but it never works

```
l: layout [box]
dump-face l    ; notice the `pane`?
box: dump-face l/pane/1
? box
```

[03:22](#msg59e5777af7299e8f53f78ed4)Given, I'm using the object representation instead of the VID dialect, but for this case (VID) it works. I think I could wrap that in a small function too..

[03:27](#msg59e578b1bbbf9f1a386d97d7)

```
red
vid-help: func [spec [block!]] [
    dump-face first select layout spec 'pane
]
```

It's a bit hacky tho..

[03:29](#msg59e57907177fb9fe7e89c040)

```
red
>> vid-help [button "hi" green]
 Type: button Style: button Offset: 10x9 Size: 62x25 Text: "hi"
== make object! [
    type: 'button
    offset: 10x9
    size: 62x25
    text: "hi"
    image: none
    color: 0.255.0
    m...
```

[03:30](#msg59e57967210ac26920f5af66)Basically works like `dump-face`, but ignores everything except the first

[03:38](#msg59e57b2fbbbf9f1a386da0cf)

```
red
>> a: vid-help [base] b: vid-help [box]
 Type: base Style: base Offset: 10x10 Size: 80x80 Text: none
 Type: base Style: box Offset: 10x10 Size: 80x80 Text: none
== make object! [
    type: 'base
    offset: 10x10
    ...
```

`box` is really a `base` with styling:

[03:38](#msg59e57b465c40c1ba79ad3b2a)

```
red
>> ? a/options/style
A/OPTIONS/STYLE is a word! value: base

>> ? b/options/style
B/OPTIONS/STYLE is a word! value: box
```

nd9600

[18:38](#msg59e64e34d6c36fca31632579)Wow that's great @geekyi , thanks

greggirwin

[18:46](#msg59e650235c40c1ba79b20410)

```
do-it: does [
	foreach-face win [
		switch face/type [
			button [face/text: rejoin ["I'm a button at " face/offset]]
			field [face/text: rejoin ["I'm a field of style: " face/options/style]]
		]
	]
]
view win: layout [
	style button: button 150
	style fld-150: field 150
	button button button "Click Me!" [do-it] return
	fld-150 fld-150 fld-150
]
```

nd9600

[21:04](#msg59e67049614889d475c91ab6)Can you change the origin position of `base` so that 0x0 is in the bottom left of the face rather than the top right?

[21:05](#msg59e67087177fb9fe7e8f6362)Actually, it'd be in a 'draw block

[21:06](#msg59e670cab20c642429156861)I found https://doc.red-lang.org/en/draw.html#\_pattern\_pen , but couldn't apply it

[21:07](#msg59e67119e44c43700a4671cf)A block like  
`graph: compose/deep [ pen pattern flip-y line-width 1 polygon (border) line (graph_points) ]`  
just complains about a syntax error

[21:10](#msg59e671d1f7299e8f53fd203f)`pen red` does change the pen colour so there's just a small thing wrong with `pen pattern 300x300 flip-y`

## Wednesday 18th October, 2017

greggirwin

[00:50](#msg59e6a54e210ac26920fc4038):point\_up: \[October 17, 2017 3:04 PM](https://gitter.im/red/red/welcome?at=59e67049614889d475c91ab6) @nd9600, see https://doc.red-lang.org/en/draw.html#\_transform

DVL333

[15:47](#msg59e7778f177fb9fe7e94bd70)In REBOL there is a function `array`. What is an analog in Red?

greggirwin

[15:48](#msg59e777df32e080696ef72bbe)

```
array: function [
	"Makes and initializes a block of of values (NONE by default)"
	size [integer! block!] "Size or block of sizes for each dimension"
	/initial "Specify an initial value for elements"
		value "For each item: called if a func, deep copied if a series"
][
	if block? size [
		if tail? more-sizes: next size [more-sizes: none]
		size: first size
		if not integer? size [
			; throw error, integer expected
			cause-error 'script 'expect-arg reduce ['array 'size type? get/any 'size]
		]
	]
	result: make block! size
	case [
		block? more-sizes [
			loop size [append/only result array/initial more-sizes :value]
		]
		series? :value [
			loop size [append/only result copy/deep value]
		]
		any-function? :value [
			loop size [append/only result value]
		]
		'else [
			append/dup result value size
		]
	]
	result
]
```

maximvl

[15:49](#msg59e77803177fb9fe7e94c037)@greggirwin wow, 30 lines in a minute :D

[15:49](#msg59e77805e44c43700a4bba14)that's fast

9214

[15:49](#msg59e7780cf7299e8f53025e5b)or combination of `collect/keep` and some looping construct

greggirwin

[15:49](#msg59e778105c40c1ba79b81c65):^) Old port. Not heavily tested.

DVL333

[15:52](#msg59e778a9d6c36fca31694eee)But if I type `block: array 5` in the console it gives me an error: `Script Error: array has no value` :(

9214

[15:52](#msg59e778c8177fb9fe7e94c543)@DVL333 did you copypasted @greggirwin's code?

greggirwin

[15:52](#msg59e778ca177fb9fe7e94c54d)Did you include the above code? `Array` is not standard in Red at this time.

DVL333

[15:53](#msg59e7790c5c40c1ba79b8232c)Ok, i see you. I thought, it is a standart already.

vulnz

[16:51](#msg59e786abf7299e8f5302bd15)Hello bros! when will be sockets ;)?

9214

[17:14](#msg59e78c13210ac26920010f10)@vulnz https://trello.com/c/Iz0cl1e8/61-070-full-i-o-support

[19:07](#msg59e7a65ed6c36fca316a68ea)@greggirwin would it make sense if such data generation was a part of `make` functionality?

greggirwin

[19:21](#msg59e7a9a9f7299e8f53038a3f)@9214, you mean like `array`? How would it discern a dialected spec, and extra args? We'd have to add refinements. I've been fine with `make-*` helpers in the past. A general `generate` dialected func could be interesting though.

gltewalt

[22:25](#msg59e7d4c301110b7231d27973)@greggirwin Did you just paraphrase rebol array source, for Red?

## Thursday 19th October, 2017

greggirwin

[06:07](#msg59e8412801110b7231d440aa)Yup.

dander

[19:08](#msg59e8f819210ac2692008bc15)@greggirwin with generators, a dialect is perhaps unnecessary (though I haven't really compared performance, so it might be situational)

```
>> do https://gist.githubusercontent.com/dander/66ad65555b30286115cee675b16bf1d7/raw/71fd99b9cd7c4d624b55e92bdf8187dee34c8129/generators.red
>> blockify limit does [0] 20
== [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
>> blockify limit cycler [a b] 5
== [a b a b a]
```

But it can be super flexible. I seem to find myself doing `blockify limit` a lot... I could add a limit refinement.

greggirwin

[20:46](#msg59e90f15d6c36fca3172002a)@dander, a dialect is never \*necessary\*, but can make intent clearer. e.g., in your last example, I thought the output should be `[a b a b a b a b a b]` at first glance. A dialect might be `generate [[a b] 5 times]` for that, while the above output would be done with `generate [5 values using [a b]]`, `generate [cycle through [a b] limit to 5]`, etc.

[20:47](#msg59e90f60177fb9fe7e9d8db9)So the dialect just becomes a thin wrapper over your generator funcs.

9214

[20:47](#msg59e90f77f7299e8f530b2904)@greggirwin language is an ultimate API

BeardPower

[21:06](#msg59e913bfe44c43700a546d89)Does Red has some built-in function similar to pick, but based on probabilities?  
E.g. 70% of the time pick Red, 30% of the time pick Blue. Or is there a better method than defining a probability array like \[Red Red Red Red Red Red Red Blue Blue Blue] and use pick in combination with random?

rebolek

[21:07](#msg59e913fdb20c64242923b578)@BeardPower there's no such function, but it is easy to write. I did it once, give me few minutes to recreate it...

BeardPower

[21:07](#msg59e91418614889d475d770e2)@rebolek Awesome! Appreciate it!

9214

[21:12](#msg59e915535c40c1ba79c106e5)?

```
>> pick [red blue] (random 100%) < 70%
== red
```

rebolek

[21:12](#msg59e91558177fb9fe7e9db028)@BeardPower this will give you value between 0.0 and 1.0, the higher the input, the more biased the values will be towards 1.0:

[21:13](#msg59e91566d6c36fca31722194)

```
random-more: func [probability][(random 1.0) ** (1.0 / probability)]
```

[21:17](#msg59e91652210ac26920096701)and vice versa

BeardPower

[21:19](#msg59e916ff614889d475d78427)@9214 What the... ;-)

@rebolek Very nice. Never thought about a biasing function. I implemented it using the bounds function of map in C++. I need to think different(ly) : )

[21:24](#msg59e91812177fb9fe7e9dbee4)Is there also some similar Red magic, if there are more than 2 values involved? E.g. picking red 10% blue 40% and green 50%?  
I used the mentioned probability array for that.

rebolek

[21:24](#msg59e9181ce44c43700a548667)@BeardPower if you need speed, `power` is certainly not the right way, but then you may implement it with a table, I guess.

9214

[21:25](#msg59e9183501110b7231d93a33)@BeardPower seems legit

```
>> bitset: does [collect [loop 10 [keep pick [1 0] (random 100%) < 70%]]]
== func [][collect [loop 10 [keep pick [1 0] (random 100%) < 70%]]]
>> sum: func [x /local acc][acc: 0 forall x [acc: acc + x/1]]
== func [x /local acc][acc: 0 forall x [acc: acc + x/1]]
>> avg: func [x][divide sum x length? x]
== func [x][divide sum x length? x]
>> tries: collect [loop 100 [keep sum bitset]]
== [7 10 8 6 8 8 7 7 8 6 9 7 5 5 9 3 8 8 10 7 7 10 5 8 10 7 8 8 7 8 8 5 8 8 9 8 8 5 10 6 ...
>> avg tries
== 7
```

[21:26](#msg59e91899210ac269200972c6)for more than two values I would use some kind of randomized `bitset!`

BeardPower

[21:27](#msg59e918a532e080696e001cbd)@rebolek Yeah, probably.

@9214 Very interesting.

maximvl

[21:29](#msg59e9192e614889d475d792c0)@BeardPower  
&gt; E.g. picking red 10% blue 40% and green 50%?

```
>> random 255.255.255
== 66.191.67
>> random 255.255.255
== 33.30.197
```

9214

[21:29](#msg59e91942b20c64242923d4d5)but bear in mind that `tuple!` is limited in size

maximvl

[21:30](#msg59e91960b20c64242923d553)well, it's good enough for colors

9214

[21:30](#msg59e9196c01110b7231d9419e)sure, I just don't know what's the use case

BeardPower

[21:31](#msg59e919c2614889d475d79666)@maximvl Isn't the random function picking the color values uniformly?

maximvl

[21:32](#msg59e919db01110b7231d943bb)true, I read the original question only now :)

[21:32](#msg59e919f5e44c43700a549097)I'd say probability array is a good solution

BeardPower

[21:32](#msg59e91a0332e080696e002352)No problem :)

maximvl

[21:39](#msg59e91b9bd6c36fca317241fb)ok, now after more thinking I came to @rebolek 's solution :D

[21:41](#msg59e91bfd614889d475d7a32b)it's quite good so I'll stop thinking now

gltewalt

[21:41](#msg59e91c24177fb9fe7e9dd5d4)@greggirwin Can I use your `array` function in the doc I'm working on? I'm at section 3.1 Creating Arrays

BeardPower

[21:42](#msg59e91c47f7299e8f530b7170)I will also try to find some additional solutions in the Rebol repos.

[21:43](#msg59e91c7101110b7231d9513a)Thanks everyone for the valuable input.

rebolek

[21:46](#msg59e91d47f7299e8f530b76e0)@maximvl :D I've originally implemented it (without the random part) as sine to square oscillator. Works quite well :)

[21:58](#msg59e9200432e080696e00458b)Square to sine of course, for filtering.

[22:00](#msg59e92068614889d475d7bce8)But the math is reversed...nevermind... :finnadie:

dander

[22:11](#msg59e923185c40c1ba79c15019)@greggirwin that is interesting. I guess what I was thinking was that with a good enough API design, the built-in Red semantics are enough to clearly express intention. Would you say there is a learning cost in going to a dialect? In your example, I agree it is easier to read and understand the intent (and maybe that is the most important part), but to work in that dialect, I would likely have to find its documentation (at least while there is no formalized dialect help). Possibly instead of dialecting it, just picking better names or adding some more specialized functions would help. Certainly in order to use those functions, you have to learn them as well, but they are more general purpose than a dialect. What sort of calculus do you use to decide when a dialect is the right approach? Maybe a dialect fills the hole where you can't do enough with functions that are too general, and over-specialized functions are not useful anywhere else? (end ramble)

rebolek

[22:23](#msg59e925f232e080696e0062dd)@BeardPower

&gt; E.g. picking red 10% blue 40% and green 50%?

[22:24](#msg59e9261a5c40c1ba79c15d99)

```
x: random 100% 
case [x <= 10% [red] x <= 50% [blue] x [green]]
```

BeardPower

[22:26](#msg59e926b0d6c36fca31727eaf):+1:

## Friday 20th October, 2017

toomasv

[11:47](#msg59e9e259614889d475db4939)Building on @rebolek -- \[pick-random](https://gist.github.com/toomasv/97003231ab9be8969a881ee66fd9f27a)

```
>> do %pick-random.red
>> count-items pick-random/init/size ['red 'blue 'green][10% 30% 60%] 100
== [blue 26 green 64 red 10]
>> count-items pick-random/init/size ['red 'blue 'green][50% 30% 20%] 100
== [blue 26 green 25 red 49]
>> loop 10 [probe pick-random ['red 'blue 'green]] ; percentages as initialized in previous command
blue
red
blue
red
red
blue
red
blue
red
green
```

BeardPower

[12:10](#msg59e9e7cad6c36fca31761525)@toomasv :clap:

[12:16](#msg59e9e926e44c43700a58524b)@toomasv Why do you prefer set instead of ":" in your code? set 'pick-random

toomasv

[12:22](#msg59e9ea77b20c64242927b2e6)@BeardPower Because this function is defined in a context. If set-word (`pick-random:`) were used, the function would have remained local to the context. `set` makes it global.

BeardPower

[12:26](#msg59e9eb7f8808bed73d084046)@toomasv Ahhh, thanks. I forgot about that. It really takes some time to think different(ly) with the "code is data is code" paradigm.

toomasv

[12:28](#msg59e9ebf8f7299e8f530f561b)@BeardPower You are welcome! :)

BeardPower

[12:36](#msg59e9ede932e080696e0417f0)@toomasv Are you also a former Reboler or just a fast learner? Which Rebol/Red learning resources would you recommend?

rebolek

[12:38](#msg59e9ee4e614889d475db8c88)@toomasv nice!

toomasv

[12:51](#msg59e9f15ee44c43700a587d8e)@BeardPower I played with Rebol years ago, but didn't get hooked then, although liked it. Delved into Red in this spring.  
@rebolek Thanks to you!

[13:49](#msg59e9fed75c40c1ba79c58b71)@BeardPower

&gt; Which Rebol/Red learning resources would you recommend?

I mainly use blog articles on http://www.red-lang.org, official docs in https://doc.red-lang.org/en/, then http://www.red-by-example.org and occasionally http://www.rebol.com/docs.html; but @9214 has a good collection of links to resources.

greggirwin

[16:11](#msg59ea202a614889d475dcc986):point\_up: \[October 19, 2017 3:41 PM](https://gitter.im/red/red/welcome?at=59e91c24177fb9fe7e9dd5d4) @gltewalt, yes, of course. Use `array` however you want.

[16:12](#msg59ea2063b20c64242928f6fb)@toomasv, really nice.

[16:25](#msg59ea235ff7299e8f5310ab1e)@dander, I don't have a set formula for deciding when to dialect things, but the more generally programmatic something is, i.e., the more the domain is regular code, the less I think of using a dialect. The more there is a clear domain level of logic and intent, the more useful they are.

Another case where they can be helpful is where you have a lot of default state, but want to change a few, without a fixed arity. VID is the classic example here.

Think, too, about how you can leverage datatypes. If all your params are integers, a dialect may not be better than an object param where you can use names.

9214

[16:29](#msg59ea247601110b7231de93ce)@BeardPower  
https://gist.github.com/9214/784e7f7af2342f117bc67a8e2698855b

BeardPower

[16:30](#msg59ea24bd5c40c1ba79c67ece):+1: Thanks again.

toomasv

[17:15](#msg59ea2f2e5c40c1ba79c6bba0)Thanks, @greggirwin !

BeardPower

[18:40](#msg59ea4302d6c36fca31783a9c)I just noticed, that the actual Red version comes with the implementation from @rebolek:

```
>> source random-more
random-more: func [probability][(random 1.0) ** (1.0 / probability)]
```

9214

[18:40](#msg59ea4335d6c36fca31783bdf)@BeardPower wat?

[18:41](#msg59ea434b8808bed73d0a5b67)you defined it yourself :D

BeardPower

[18:41](#msg59ea434d210ac269200f7fc9)Ah forget it lol

[18:41](#msg59ea4353614889d475dd9512)Yeah

[18:41](#msg59ea4363614889d475dd9575)Silly me :D

[18:43](#msg59ea43e5b20c64242929c937)So how can I check, if it's built-in or I defined it myself? By the type like action! and native! ? To save myself from another embarrassing moment ;-)

9214

[18:50](#msg59ea4584b20c64242929d2cf)@BeardPower yes, user functions are, well, `function!`s

BeardPower

[18:53](#msg59ea4627d6c36fca31784e1c)Got it, thanks.

9214

[18:54](#msg59ea46518808bed73d0a6cef)though there're a couple of built-ins

```
>> ? "function!"
     any-function!   typeset!      [native! action! op! function! routine!]
     bind            native!       [word [block! any-word!] context [any-word! any-object! function...
     context?        native!       Returns the context in which a word is bound.
     foreach-face    function!     Evaluates body for each face in a face tree matching the condition.
     function!       datatype!     function!
     insert-event-func function!     Add a function to monitor global events. Return the function.
     parse           native!       [input [binary! any-block! any-string!] rules [block!] /case /pa...
     parse-func-spec function!     Parses a function spec and returns an object model of it.
     react           function!     Defines a new reactive relation between two or more objects.
     react?          function!     Returns a reactive relation if an object's field is a reactive s...
     remove-event-func function!     Remove an event function previously added.
     sort            action!       Sorts a series (modified); default sort order is ascending.
```

gltewalt

[18:54](#msg59ea467b01110b7231df579e)I think post load time definitions should be at the end of system/words

[18:55](#msg59ea46af32e080696e063b1b)Unless you are working in a constructed context

9214

[18:55](#msg59ea46b1e44c43700a5a77df)@gltewalt and how you'll find there they started?

gltewalt

[18:56](#msg59ea46dbe44c43700a5a78c7)Grab the last system/word after load - before you type anything else in console

BeardPower

[19:05](#msg59ea48eaf7299e8f53117e92)I read/learned, that Red's index base is 1, not 0 like in C and even 0 is true.  
How does the conversion from true to the index 1 and false to the index 2 works in here. Does true and false used with pick mean "first" and "second"?

```
>> pick [red blue] true
== red
>> pick [red blue] false
== blue
```

9214

[19:06](#msg59ea491d5c40c1ba79c74e80)@BeardPower yes, it's the same as ternary `?:` in C

BeardPower

[19:07](#msg59ea4959210ac269200fa399)Nice.

9214

[19:08](#msg59ea49abe44c43700a5a88be)@BeardPower

```
>> make logic! 1
== true
>> make logic! 0
== false
>> to logic! 1
== true
>> to logic! 0
== true
```

BeardPower

[19:09](#msg59ea49d5d6c36fca31786317)Yeah, I read about these differences on github.

[19:13](#msg59ea4af1f7299e8f531189b5)So there is no way to get false with to logic!, because negative numbers also return true.

9214

[19:14](#msg59ea4b1cb20c64242929f5b1)@BeardPower almost correct, `to` follows Red semantics that "everything is `true` except `false` or `none`"

rebolek

[19:14](#msg59ea4b1e8808bed73d0a870d)using `to`, values are `true`

greggirwin

[19:15](#msg59ea4b4432e080696e0654df)Even `unset!` casts as true with `to`.

9214

[19:15](#msg59ea4b45614889d475ddc248)

```
text
>> to logic! none
== false
>> to logic! false
== false
>> to logic! [literally whatever]
== true
```

BeardPower

[19:15](#msg59ea4b57e44c43700a5a91dd)Except with

```
>> to logic! not 1
== false
```

9214

[19:16](#msg59ea4b74b20c64242929f7f0)@BeardPower

```
>> not 1
== false
```

[19:16](#msg59ea4b9b32e080696e06570c)`not` follows Red semantics too

[19:16](#msg59ea4baab20c64242929fa3c)boolean complement of any value except `false` or `none` is `false`

BeardPower

[19:17](#msg59ea4bb732e080696e0657ad):+1:

## Sunday 22nd October, 2017

Ungaretti

[15:22](#msg59ecb79eb20c642429338ab8)Hello! I just discovered Red/Rebol and I am thrilled. I am not a professional programmer, but I have been developing IoT projets and I think that Red/Rebol with mqtt protocol and access to the serial port can become great in the maker/IoT community. I would like to contribute somehow. By the way, I suggest adding a DONATE button in Red-lang home page. I had to Google to find a way to donate, and since "red" is too vague for search engines, it was not trivial.

9214

[15:24](#msg59ecb81db20c642429338d6a)@Ungaretti welcome, with full IO support in `0.7.0` release you'll be like at home ;)

[15:30](#msg59ecb9a08808bed73d142d78)@Ungaretti It seems that \[donations](http://www.red-lang.org/p/donations.html) link is hidden on purpose, since Red project got enough funding to sustain itself. If you want to support the team anyway I guess you should discuss this with @dockimbel.

Ungaretti

[15:35](#msg59ecbad68808bed73d143563)Thank you 9214! Very good to know that IO is coming in 0.7.0. Meanwhile I'll improve my Red coding skills and try to find ways to contribute.

saolof

[21:25](#msg59ed0cd132e080696e115ecf)I just came into contact with Red and I am seriously impressed

## Monday 23th October, 2017

saolof

[01:47](#msg59ed4a3c01110b7231eb57e7)Is there some good documentation of the standard library? Like for example, how do I concatenate two strings?

RnBrgn

[02:34](#msg59ed551a32e080696e12825a)@saolof Check out www.red-by-example.org

[02:35](#msg59ed55825c40c1ba79d3a144)@saolof To concatenate, take a look at "append" http://www.red-by-example.org/#append

[02:42](#msg59ed5705b20c642429363773)@saolof http://redprogramming.com/Getting%20Started.html

dander

[04:52](#msg59ed75a2d6c36fca3184fd50)@saolof also, `rejoin` will evaluate and concatenate each thing in a block you give it (reduce and join).

gltewalt

[04:58](#msg59ed76f401110b7231ebefc3)also, also: `insert`. append is essentially `insert tail`.

[05:03](#msg59ed780b01110b7231ebf4af)@greggirwin Can we fashion a `help/arg` so that functions, etc can be sorted by the argument type that they take?

dander

[05:06](#msg59ed78d5b20c64242936ad16)@gltewalt you can do `help "string!"` to get pretty close to that

gltewalt

[05:07](#msg59ed790f01110b7231ebf982)It's in the ballpark - but not optimal

saolof

[06:19](#msg59ed89de32e080696e134b41)Honestly it feels really weird to have written a simple text editor with autosaving before I knew how to concatenate strings in a language

[06:19](#msg59ed8a04210ac269201c8e3b)in pretty much every other language, the progression would be the opposite, but Red makes GUI programming so ridiculously easy

Ungaretti

[09:21](#msg59edb48ee44c43700a681dbf)I have made a RED syntax highlighting configuration file for notepad++:  
https://github.com/Ungaretti/Notepad-config-file-for-Red-Language

rebolek

[09:25](#msg59edb599d6c36fca31863374)@Ungaretti cool!

dockimbel

[11:01](#msg59edcc17e44c43700a689c01)Would be nice if someone could gather all those Code editors syntax files and put them on a red/red wiki page.

9214

[11:12](#msg59edceac5c40c1ba79d5e303)@dockimbel there's already something similar from @geekyi I believe

[11:14](#msg59edcf1301110b7231eda571)https://github.com/red/red/wiki/Editor-Integrations

mikeparr

[11:15](#msg59edcf40e44c43700a68ace3)@Ungaretti Thanks. Notepad++ is zero-cost, unlike some editors people use here. Would also be nice to have instructions to run Red from it.

Ungaretti

[12:45](#msg59ede484e44c43700a692ac9)@mikeparr Working on it!

greggirwin

[18:52](#msg59ee3a83d6c36fca31895c64)@Ungaretti, I did an IoT-ish project some years back, in Rebol2, which used ZeroMQ instead of MQTT (though I might have some old MQTT experiments somewhere). Also used TFTP. With Red/System at our disposal now, too, going small will be better than ever.

[18:56](#msg59ee3b6832e080696e174e80)And nice work on the Notepad++ integration! Could you add your link to the wiki page @9214 posted?

9214

[19:02](#msg59ee3cc8b20c6424293b0eda)@gltewalt in other words function that accepts datatype and lists all its `action!`s?

greggirwin

[19:03](#msg59ee3d1d5c40c1ba79d89860)@gltewalt, I've done some experiments along those lines in the past. It's a bit of work, and really needs the design time put in to make it useful. The trick being that you may end up missing important things, or getting flooded with results, because you don't know exactly what the user wants, and they don't know how to tell you that.

For example, you want to concatenate 2 strings, but `rejoin` doesn't say anything about strings in its spec. Or maybe you ask about strings, but funcs that take `series!` args \*might* apply. Once you start expanding typesets and looking at permutations, it gets involved. We can easily do the set operations. Again, the design is the hard part.

I have other ideas for how to deal with that, but it's beyond the scope of `help`.

gltewalt

[19:09](#msg59ee3e57d6c36fca31897370)@9214 something like that

greggirwin

[19:09](#msg59ee3e6601110b7231f049ac)The old R2 Word Browser was nice, but also required manual metadata entry.

gltewalt

[19:10](#msg59ee3e8bf7299e8f53229949)If `what` exposed its result, we could filter with parse (probably)

greggirwin

[19:10](#msg59ee3eaa01110b7231f04acc)You mean like `what/buffer`?

[19:12](#msg59ee3f10d6c36fca3189776b)So you can use `what/buffer/with/spec "string!"` and then process.

gltewalt

[19:12](#msg59ee3f34b20c6424293b1cf6)Oh yeah... forgot s about /buffer

greggirwin

[19:12](#msg59ee3f3a01110b7231f04e51)You can also use `help-string` directly if you want.

9214

[19:13](#msg59ee3f74e44c43700a6b5f24)can't remember if `/with` and `/spec` existed last time I checked `what` :confused:

greggirwin

[19:14](#msg59ee3f8501110b7231f04f7e)`help what`. :^)

9214

[19:14](#msg59ee3f8ae44c43700a6b5fb8)`wat`

greggirwin

[19:15](#msg59ee3fc601110b7231f0513b)@9214 `Wat` does a general search of the entire internet and produces an exact answer to your query, but the runtime is undefined.

9214

[19:15](#msg59ee3fef32e080696e17691a):^)

```
>> wat: does [42]
== func [][42]
```

greggirwin

[19:16](#msg59ee4001210ac2692020aaab)Indeed. Thank you Douglas Adams!

gltewalt

[19:24](#msg59ee41efe44c43700a6b6e2d)https://imgur.com/a/uPWEe

greggirwin

[19:25](#msg59ee422cb20c6424293b3024)@gltewalt, you may have asked the wrong question.

## Tuesday 24th October, 2017

Ungaretti

[01:04](#msg59ee91a35c40c1ba79da5acb)@greggirwin I'm very interested in hearing about your work with IoT and lightweight protocols, very much indeed. As soon as I get more experience with Red I hope we can discuss it, specially those MQTT experiments.  
I will improve the Notepad++ integration and add the link wiki. Hopefully I can find a configuration that allows to use it as an IDE.

[01:19](#msg59ee953f614889d475f0bb5d)If I wanted to develop an MQTT client for RED, what would it be, a dll? a dialect?

greggirwin

[02:02](#msg59ee9f2e8808bed73d1daf51)@Ungaretti, it could be done a number of ways. Since we don't have full I/O and ports yet (due in 0.7.0), you can start by getting familiar with Red as a language. To build an MQTT client, there will be a couple important pieces: the protocol handler, and the de/serialization aspect. The serialization side means packing and formatting data. Red is a high level language, while Red/System is its low level counterpart. Because MQTT aims to be small, it uses less than byte sized values and flags. Some of those may be easier to deal with in Red/System (and you could perhaps choose a C client to port to Red/System), but Red will give you tools like `parse` to deal with incoming packets.

The protocol side will probably be best done as an FSM (Finite State Machine), and you could play with how to do that in plain old Red to get a feel for things. Eventually, the port model and sample protocols Red will provide may be a good template to work from.

Without true I/O in place, you're still not stuck. If you can capture some sessions and store them in binary files, you can use file I/O in place of network I/O, and do productive work and gain understanding of the problems you need to solve.

[02:03](#msg59ee9f86d6c36fca318b5380)Once you have that in place, you can decide if you want to expose it as a DLL, a source code library, or both. A dialect may be used, but perhaps only internally. That part can come later though.

[02:14](#msg59eea1eb8808bed73d1db876)Can't find any working MQTT code here at the moment. I only remember using 0MQ for the real work, so likely just a bit of R&amp;D on MQTT. It was for a precision agriculture product, where real-time data from fields was delivered from sensors in combines.

usbinov

[12:47](#msg59ef366d32e080696e1c26b4)Hi, I download Red since 0.5.0 and on but never learn it seriously. But I use Red for a couple of projects.

9214

[13:29](#msg59ef404201110b7231f54626)@usbinov welcome!

greggirwin

[16:22](#msg59ef68c7b20c6424294123d8)@usbinov, whether or not you use Red for production work, it's a great tool for thinking.

## Wednesday 25th October, 2017

DVL333

[09:25](#msg59f0589cd6c36fca31941d0d)Hi all!  
Many years ago, when I was a student, I studied Artificial Intelligence. And we was programming on Prolog language. This language gives ability just to describe a problem and a program searches a solution itself.  
One of such problems was Tower of Hanoi and it can be resolved with Prolog.  
Is it possible to resolve "Tower of Hanoi" with Red like in Prolog (without describing of algorithm for it resolving)? As I can see, a Red-lang logo is a Tower of Hanoi too. :) And it is a functional language also. So I suggested that it is possible, but don't know how. I will be thankful for code sources, if they exist.

9214

[09:26](#msg59f058cc0182fa5f4d760661)@greggirwin smells like hivemind :bee: :point\_up:

[09:27](#msg59f05909f7299e8f532d2120)@DVL333  
https://gist.github.com/greggirwin/5da11ee2893f87ccdfc883f670f70368

DVL333

[09:59](#msg59f06088f7299e8f532d4b84)@9214 Thanks!

greggirwin

[16:16](#msg59f0b8ec210ac269202d7646)@9214, I think what @DVL333 wants is a logic language dialect that we can then use to solve it, which could be done of course. We also have @toomasv's interactive version, so we can cover all approaches and put them in the red/code repo.  
\- http://www.rebol.org/view-script.r?script=prolog.r  
\- https://github.com/onetom/rebol-prolog

9214

[16:19](#msg59f0b97bd6c36fca31966d2a)I suppose you can also leverage reactive parts

greggirwin

[16:19](#msg59f0b9a832e080696e244dfc)For Hanoi or Prolog?

9214

[16:19](#msg59f0b9afb20c642429481f74)both?

greggirwin

[16:28](#msg59f0bb95e44c43700a7872a3):^) For the logic language side, we can certainly react to changes in the fact database. I'm trying to picture, now, tying into state transitions while animating discs. Yeah, we could do that.

DVL333

[19:30](#msg59f0e63bb20c64242949358c)@greggirwin Yes, you understood me - I asked mostly about a logic dialect, and its impementation for Hanoi as an example. Of course, realization in pure Red is also useful. And it will be really great, if a logic dialect become a part of Red by design and Red core is optimized for that. :+1: I really like Red!

## Thursday 26th October, 2017

Ungaretti

[00:40](#msg59f12efef7299e8f5331eead)Instructions for a "Makeshift IDE for RED Language" in https://ungaretti.github.io/ .  
I added it to the wiki under "Editor integration"/Notepad++.

dockimbel

[07:38](#msg59f19103210ac26920319194)@Ungaretti Nice! :+1:

mikeparr

[14:26](#msg59f1f09ae44c43700a7eb441)@Ungaretti very clear instructions + screenshots!

toomasv

[15:48](#msg59f203ebf7299e8f53361e84)@Ungaretti Great instructions! I develop on Notepad++ too :+1:

greggirwin

[17:02](#msg59f2153a5a1758ed0f51f699)@Ungaretti +1 Fantastic. Thanks so much for doing this.  
\- §5 typo: Donload == Download  
\- §7 typo: goto == go to  
\- §10 typo: clik == click

[17:04](#msg59f21587210ac2692034b075)And thanks for adding it to the Editor Integrations wiki page as well. This will help a lot of people.

Ungaretti

[17:13](#msg59f217c032e080696e2b9c61)Hope it helps. Thank you for pointing the typos.

[19:17](#msg59f234c3e44c43700a804d40)Is Red/System something like Rebol/Core? Where can I download it? Docs?

rebolek

[19:18](#msg59f234eb4ff065ac187d3606)@Ungaretti Red/System is C-like dialect of Red, in which Red runtime is written.

9214

[19:18](#msg59f234f28808bed73d30bbb0)@Ungaretti http://www.red-lang.org/p/documentation.html

rebolek

[19:18](#msg59f234f68808bed73d30bbb9)It is part of Red, there is no separate download.

Ungaretti

[22:05](#msg59f25c2f32e080696e2d399a)@rebolek @9214 Thank you! I see.

## Friday 27th October, 2017

paulsmith22

[00:29](#msg59f27dd4e44c43700a81cce9)nice work, just looking at Red

greggirwin

[15:51](#msg59f355e732e080696e321e0f)Welcome @paulsmith22. Holler if you have any questions.

## Monday 30th October, 2017

Ungaretti

[07:20](#msg59f6d2c0210ac2692049e024)Is "parse" not fully implemented yet? I tried to split a string into its words, but all I get is "false"

dockimbel

[07:21](#msg59f6d307b20c64242964ad38)@Ungaretti Red has moved that feature to the `split` function, so it's not part of Parse anymore.

Ungaretti

[07:22](#msg59f6d33d614889d47518fcd2)Oh. Thank you.

9214

[08:16](#msg59f6dfcc614889d475193c53)@Ungaretti Red's `parse` by default is Rebol's `parse/all`

greggirwin

[17:57](#msg59f767ef5a1758ed0f6aa7ed)R2's behavior, using `none` as the rule for simple splitting, should cause an error in Red. Red \*requires* a block for the rule.

## Tuesday 31st October, 2017

paulsmith22

[20:48](#msg59f8e19d5a1758ed0f727d13)Are there any docs or help for the Camera type ? an example would be good. to display a cam feed.

9214

[20:50](#msg59f8e226976e63937e0f0f39)@paulsmith22 https://doc.red-lang.org/en/view.html#\_camera

[20:53](#msg59f8e2c9d6c36fca31bdf223)can't show you an example because for some reason `view`ing `camera` face crashes my console :confused:

[20:55](#msg59f8e346e44c43700a9fcba7)try something like `view [camera with [selected: 1]]`

## Wednesday 1st November, 2017

usbinov

[00:19](#msg59f912feb20c64242970f61f)Thanks @9214 and @greggirwin .  
Looking forward for the 0.7.0 version.

dockimbel

[02:14](#msg59f92e1a5a1758ed0f73e3c0)@qtxie ^--- Camera face should display the feed when the camera index is pre-selected.

## Thursday 2nd November, 2017

paulsmith22

[00:03](#msg59fa60c42a69af844b38e2f9)thanks @9214 but still cant get anything with camera, the face appears but no feed from cam ?

dockimbel

[02:19](#msg59fa80b22a69af844b3975f5)@paulsmith22 @9214 The camera needs to be shown first, then setting the`/selected` facet triggers the feed on/off. @qtxie will add support for a preset `/selected`.

qtxie

[03:21](#msg59fa8f38614889d4752ca928)@paulsmith22 The camera should works now.

virtualAlan

[03:54](#msg59fa97054ff065ac18a59e95)Hi, I've just updated a couple of pages on my site....  
Here: http://www.mycode4fun.co.uk/red-apps  
And here: http://www.mycode4fun.co.uk/About-Red-Programming  
Regards .... Alan

dockimbel

[04:17](#msg59fa9c45b20c64242978bfad)@virtualAlan Keep up the good work! I wonder if you could use some help from @rgchris to turn your code samples into syntax colored code. Chris has a lib to generate the right HTML code for that IIRC.

Oldes

[09:02](#msg59fadf1432e080696e55b174)@dockimbel @virtualAlan anybody can use my Highlight script (JS) for client side colorization - http://rebol.desajn.net/highlight/demo/

dockimbel

[09:02](#msg59fadf37e44c43700aa9c414)@Oldes Thanks, that would work too.

Oldes

[09:06](#msg59fae02ad6c36fca31c80908)Source code is \[here](https://github.com/Oldes/highlight.js) (in case someone would like to improve it).. but getting scripts from the demo page could be easier.

[09:07](#msg59fae05fd6c36fca31c80a4d)Btw... it will be almost 2 years I did it.

9214

[09:17](#msg59fae2ace44c43700aa9d5b9)speaking of highlighting - github dropped support for pygments on github pages, and now \[rouge](https://github.com/jneen/rouge) is everywhere, but, unlike pygments (IIRC @Oldes make a lexer, right?) it doesn't support Red or Rebol

[09:18](#msg59fae2dd614889d4752e27eb)so I wonder if anyone brewed in Ruby could take a look at it

Oldes

[09:22](#msg59fae3c9f7299e8f53617994)Ah... another language to learn just to write a highlighter for Rebol and Red?

9214

[09:22](#msg59fae3eb614889d4752e2bcb)@Oldes c'est la vie!

[09:23](#msg59fae425e44c43700aa9dcce)and just when you finished they'll rewrite it in Crystal or whatever

Oldes

[09:24](#msg59fae45ef7299e8f53617bed)It looks that Github is still using the pygments.. at least I can see some colors there.

9214

[09:25](#msg59fae48b4ff065ac18a70c69)weird, in my case it spitted out warning and falled back to rouge automatically

greggirwin

[15:29](#msg59fb39bc4ff065ac18a91257)It's the net. Didn't you know inconsistency is desirable in large systems? ;^\\

gltewalt

[17:06](#msg59fb50875a1758ed0f7e8867)Looks fantastic

[17:10](#msg59fb51895a1758ed0f7e8d5f)Compatible with stylesheets designed for pygments

rgchris

[21:36](#msg59fb8fcf2a69af844b3f55d7)@virtualAlan @dockimbel I need to review which Rebol 2 colorizer script I have is current. I worked on \[Prettify Rebol](https://github.com/draegtun/PrettifyRebol) (works with Google Code Prettify) which I used for my script library prototype: e.g. \[form-date.r](http://scripts.rebol.info/scripts/form-date). Is fairly easy to get going.

## Friday 3th November, 2017

virtualAlan

[00:03](#msg59fbb245614889d47532b66f)Thanks @dockimbel and @Oldes , @rgchris - yes, will look at introducing syntax code colouring for my code examples.

githubnyn

[00:06](#msg59fbb2f5976e63937e1e1f29)I am sorry for my ignorance but I haven't found any info on this anywhere. Does RED run on Arduino / ESP32 ?

greggirwin

[03:59](#msg59fbe9a7e44c43700aaf6b92)@githubnyn, it does not. Cross compilation targets are listed in https://github.com/red/red (readme), a little over halfway down.

dockimbel

[04:51](#msg59fbf5ef5a1758ed0f81ae5f)@githubnyn There was a proof of concept backend for Red/System for AVR8 a few years ago, it could just make a LED blink, but the work on it has not been continued, mostly because of lack of resources.

## Sunday 5th November, 2017

rgchris

[19:53](#msg59ff6c25e44c43700abebbba)@dockimbel Red-based rudimentary \[Color Code](https://github.com/rgchris/Scripts/blob/master/red/color-code.red).

## Monday 6th November, 2017

Ungaretti

[08:17](#msg5a001a81614889d47545b07b)I can't find a way to check if a file has been modified, like Rebol's "modified?". How can I do that in Red?

rebolek

[08:19](#msg5a001b04f7299e8f53793c5e)@Ungaretti you need to wait for full IO, it is not supported currently.

Ungaretti

[08:20](#msg5a001b57d6c36fca31dfdcff)I see.. Thank you!

abdllhygt

[11:16](#msg5a0044a3df09362e67d35109)Hi! i want to know, that your(plural) programming languages.  
I use Ruby and Red.

endo64

[11:51](#msg5a004caee44c43700ac2a3e3)For me its mostly Rebol, Red, PHP, Purebasic and some C# (ASP.net). Old times: VB6, VB.net, some C. Older times: Perl, Arexx, 68000/6502 Assembly.

greggirwin

[17:09](#msg5a0097365a1758ed0f964756)@abdllhygt, you'll find a wide range I imagine. I've dabbled in a lot of languages, but Rebol has been my mainstay for many years. Before that I specialized in VB from v1-6. I've also used C/C#, Delphi, PowerBASIC, bits of PHP, SQL, JS, and a few others for production work. And I know I'm not the only one to have played with a \*lot* of others through the years. Something to be learned from most of them. Jorf was very fun, as was HyperPad and Matrix Layout. XBasic was cool in a lot of ways. Various old dBase langs. Of course I've looked at the more popular kids too.

abdllhygt

[17:54](#msg5a00a1d2f7299e8f537c3360)@endo64 @greggirwin thank you for the answers.

## Tuesday 7th November, 2017

virtualAlan

[00:15](#msg5a00fb14b20c6424299754c5)Here's a new Red script from me - might be useful.  
I've used syntax colouring, Nenads suggestion.  
Using the 'Red-lang.xml' for the website colouring.  
I changed the 'line comments' colour to green,  
I thought the gray was a bit pale.  
Regards ....  
Alan.  
http://www.mycode4fun.co.uk/example-scripts

githubnyn

[01:49](#msg5a011116b20c64242997b23d)on the Mac when I try to compile \** \[http-tools.red](https://github.com/rebolek/red-tools/blob/master/http-tools.red)\** I get the following error: \*\** Syntax Error: Invalid string! value  
\*\** in file: /Users/apple/Desktop/http-tools.red  
\*\** line: 316  
\*\** at: {"%")

dockimbel

[01:55](#msg5a011289614889d4754aefb8)@githubnyn What is the command-line you are using for that?

[01:55](#msg5a011294976e63937e36befe)@virtualAlan Looks good. :+1:

githubnyn

[01:59](#msg5a01136786d308b755b7e4f9)./red.dms -c http-tools.red

dockimbel

[03:35](#msg5a0129ec614889d4754b4acf)@githubnyn Are you using Red 0.6.3 or the lastest automated build?

[03:35](#msg5a012a01f7299e8f537ec97d)@rebolek Can you reproduce that above issue?

githubnyn

[03:36](#msg5a012a20e44c43700ac73e2a)Red 0.6.3

[03:38](#msg5a012aa2614889d4754b4cb5)apple$ ./red.dms -c http-tools.red

-=== Red Compiler 0.6.3 ===-

Compiling /Users/apple/Desktop/http-tools.red ...  
...using libRedRT built on 6-Nov-2017/19:29:15-5:00  
\*\** Syntax Error: Invalid string! value  
\*\** in file: /Users/apple/Desktop/http-tools.red  
\*\** line: 316  
\*\** at: {"%")  
^-^-^-^-]  
^-^-^-]  
^-^-] ""  
^-]

^-decode: func}  
\_\_\_\__  
same error with the latest automated build from nov 17

rebolek

[06:22](#msg5a01510e86d308b755b8d3a5)@dockimbel let me try...

[06:28](#msg5a015274f7299e8f537f66a5)@dockimbel I can reproduce the bug, there is `%"%"` in source code, not sure why it's causing problems, but I guess I can replace it with something else and try if it compiles.

[06:31](#msg5a01535a976e63937e37c761)That line is buggy anyway and does not work.

[06:42](#msg5a0155d4e44c43700ac7ee10)@dockimbel @githubnyn I've fixed the typos and can compile `http-tools.red` now.

CodeTortoise

[07:36](#msg5a016296976e63937e380a67)Damn. I haven't been her in months. Which is completely irrelevant since I have yet to contribute to the project.

dockimbel

[09:40](#msg5a017f70e44c43700ac8c595)@rebolek Looks like `%"%"` is supported by the run-time lexer, but not the compiler...

[09:40](#msg5a017f895a1758ed0f9abd5d)@CodeTortoise Welcome back, it's never too late for starting. ;-)

rebolek

[10:08](#msg5a018626b20c64242999c807)@dockimbel right, that's probably the case. Should I open bug for it?

dockimbel

[10:08](#msg5a018630f7299e8f5380758d)Yes, please.

rebolek

[10:09](#msg5a01864fe44c43700ac8e593)Ok, will do.

[10:58](#msg5a0191cdd6c36fca31e74d61)@dockimbel https://github.com/red/red/issues/3099

greggirwin

[16:39](#msg5a01e1d6e44c43700acb1527)@CodeTortoise, slow but steady wins the race.

## Wednesday 8th November, 2017

Y2J2142

[01:00](#msg5a025733b20c6424299eb602)Hi guys. I'm trying to learn Red and i have a little problem. How do I create unique objects in a loop or on a button press? I have a function that makes an object from a parent object and appends it to a block but every time a new object is created it overwrites objects that were created previously and I end up with separate objects with identical values

9214

[02:53](#msg5a027199d6c36fca31ec6d95)@Y2J2142

```
>> probe collect [repeat i 5 [keep object [id: i]]]
[make object! [
    id: 1
] make object! [
    id: 2
] make object! [
    id: 3
] make object! [
    id: 4
] make object! [
    id: 5
]]
== [make object! [
    id: 1
] make object! [
    id: 2
] make object! [
    id: 3
] mak...
```

[02:55](#msg5a027218df09362e67df3a44)`append` can't overwrite any values in a series

greggirwin

[16:25](#msg5a032fe2614889d475565dec)@Y2J2142, can you provide a code example? "Overwrite" and "separate objects with identical values" isn't clear to me what you might be doing.

Y2J2142

[22:27](#msg5a0384e0e44c43700ad44a95)@9214 @greggirwin

```
Red[needs: view]

Artist: make object![
    artist-name: 
    album-block: []

    print-info: does[
        print artist-name
    ]
]

Album: make object![
    album-name: 
    album-genre: 
    song-block: []
    rating: 0
]




make-artist: func [name [string!] /local d [object!] ] [
   d make Artist[
        album-name: name
        album-block: []
    ]
    return d
]

make-album: func [name [string!] genre [string!]] [
    make Album[
        album-name: name
        album-genre: genre
        song-block: []
        rating: 0
    ] 
]

artist-block: []

view[
    name: field

    create-artis-button: button "Create artist!" [
        append artist-block make Artist[
            artist-name: name/text
            album-block: []
            ]
        
        ]
    
    button "print artists" [
            foreach art artist-block
            [print art/artist-name]
    ]

]
```

So here's my code and the issue is after I add lets say 4 artist and then try to print their names the program prints the name of the last added artist 4 times. Sorry for not wording it correctly

greggirwin

[22:29](#msg5a038544df09362e67e55278)First thing I see is a typo: `d make Artist[` should be `d: make Artist[`.

[22:29](#msg5a0385587081b66876c93ef6)Now I'll actually read the code.

[22:34](#msg5a038677df09362e67e55882)@Y2J2142 `artist-name: name/text` needs to be `artist-name: copy name/text`. Without that, you're referring to the same string in each object.

```
>> str: "AAA"
== "AAA"
>> o1: object [s: str]
== make object! [
    s: "AAA"
]
>> change str "BBB"
== ""
>> o2: object [s: str]
== make object! [
    s: "BBB"
]
>> o1
== make object! [
    s: "BBB"
]
```

[22:35](#msg5a0386aeb20c642429a55002)https://github.com/red/red/wiki/Why-do-I-have-to-copy-series-values%3F

[22:36](#msg5a0386f3df09362e67e55b55)In this case, the `field` style uses the same string internally, for its `text` facet as you edit.

## Saturday 11st November, 2017

Ungaretti

[20:08](#msg5a0758bd540c78242df0624c)Hi! Will Red 0.6.5 be able to compile to Android's apk?

greggirwin

[20:14](#msg5a075a10505b630c05cf1757)@Ungaretti, that's the plan: https://trello.com/c/zsGMrT3n/145-065-android-gui-support

Ungaretti

[20:22](#msg5a075c1c026aeaa02f00b09f)@greggirwin . Thanks! Creating apps that can be distributed by google play seems too good to be true.

greggirwin

[20:23](#msg5a075c55540c78242df0717e)It's going to be a killer feature, because it's so painful with the existing approaches.

Ungaretti

[20:30](#msg5a075df3f257ad91098213e2)Exactly!  
I'm in love with Red. Studying it whenever I can. By the time 7.0.0 comes out, I might be a decent amateur programmer.

greggirwin

[20:31](#msg5a075e2edf09362e67f8172b)No doubt more than decent. :^)

hiiamboris

[22:42](#msg5a077ce8d6c36fca31060be5)Hi users of the glorious language. Can you test this code https://pastebin.com/T3V0Yese ? My red 0.63 always hangs up ):

[22:44](#msg5a077d5171ad3f8736d1f748)(Rebol performs perfectly btw)

greggirwin

[22:46](#msg5a077db6df09362e67f89f2e)Runs fine here @hiiamboris. My local build is probably a day old. What OS? I'm on Windows.

hiiamboris

[22:46](#msg5a077dc5d6c36fca31060f6b)win7 x64

[22:46](#msg5a077dd4982ea2653f69d1a2)I tried running 0.62 too

greggirwin

[22:47](#msg5a077df1026aeaa02f0142c4)Interesting. I pulled things out first, then added back. I get a hang now too.

hiiamboris

[22:47](#msg5a077e04505b630c05cfb4a3)lemme try the beta

greggirwin

[22:48](#msg5a077e30026aeaa02f0143d2)It's the `probe am` that does it.

hiiamboris

[22:49](#msg5a077e68505b630c05cfb5b2)yep, in fact every access to am does it, but only at some point

[22:51](#msg5a077f0d614889d4756c0820)same with the beta

greggirwin

[22:53](#msg5a077f6871ad3f8736d1ff60)Some issue with molding `am` for display it seems. Try `probe 1 + am` and it works.

[22:54](#msg5a077fa571ad3f8736d20021)The current GUI console doesn't update in tight loops, so we may need to play a bit to see what value is causing the issue. Seems a good find.

hiiamboris

[22:56](#msg5a078038f257ad910982a2e0)thought so too, seemed like a lucky bug find to me :)

greggirwin

[22:58](#msg5a078095d6c36fca310619e4)Lucky you!

[23:05](#msg5a078222df09362e67f8af22)This is where it hangs for me:

```
am+1: 1.00150839378652
let's try
0.001508393786519569
got here again
am+1: 1.00168495789291
let's try
```

But forming a literal `0.00168495789291` doesn't cause an issue.

[23:07](#msg5a0782a9614889d4756c14e4)`0.0016849578929099` seems to do it.

[23:08](#msg5a0782d7982ea2653f69e1e4)Would you like to file a ticket for that @hiiamboris, since you're the discoverer?

hiiamboris

[23:21](#msg5a07860c505b630c05cfd35c)sure why not

greggirwin

[23:22](#msg5a07862d614889d4756c2378)It's the trailing 9s. Once you file the ticket, I'll add more examples.

hiiamboris

[23:22](#msg5a078649d6c36fca31062fd4)wow that's subtle

greggirwin

[23:26](#msg5a078724df09362e67f8c41e)Yup, looks like they have to have exactly 15 places and end in multiple 9s. A few examples and @dockimbel will probably see what makes the `until` in https://github.com/red/red/blob/master/runtime/datatypes/float.reds#L84 not exit (as a guess).

[23:31](#msg5a07884b86d308b755d8c14d)Looks like this is the problematic range, if you want to include it in your ticket:

```
0.0099999999999999
0.0009999999999999
```

hiiamboris

[23:32](#msg5a07888a540c78242df12de5)https://github.com/red/red/issues/3106

[23:32](#msg5a0788a2614889d4756c2e31)please paste your findings and insights there

greggirwin

[23:33](#msg5a0788ca505b630c05cfde9e)Will do, thanks.

hiiamboris

[23:33](#msg5a0788dd71ad3f8736d22231)thanks for assisting me (:

[23:34](#msg5a0788f471ad3f8736d2225e)can't wait until this all thing gets mature!

greggirwin

[23:35](#msg5a07894a71ad3f8736d2249a)One step closer, with this bug exposed.

[23:39](#msg5a078a1c505b630c05cfe30b)An interesting language thought would be that of a runaway-safe `while/until` option. We know they're flexible, because they may be used in theoretical infinite loop scenarios, but there are probably also a lot of cases where the overhead of a limit check is acceptable, and prevents situations like this.

hiiamboris

[23:46](#msg5a078bbedf09362e67f8d770)yeah.. great idea  
if one could compile it with some flag that adds a time check to loops' scopes to identify where it deadlocked

## Sunday 12nd November, 2017

dockimbel

[08:31](#msg5a0806d5026aeaa02f032322)@Ungaretti That's the right mindset. Android support will be a big thing for all \*reducers* (that's how we often call Red users ;-)), and will make Red spread around much more than we ever seen before. People learning it now, will be teaching the big wave of newcomers in a few months. ;-)

[08:32](#msg5a080713505b630c05d186e9)@hiiamboris Thank you for the finding. :+1:

## Wednesday 15th November, 2017

DVL333

[08:23](#msg5a0bf975ba39a53f1aa0578e)Question: how to get information about program, that contained in header? What variable is used for storing it?

[08:23](#msg5a0bf99b505b630c05e5407d)(it seems to be different from Rebol)

rebolek

[08:26](#msg5a0bfa24505b630c05e542f9)@DVL333 Info should be in `system/script` but it's not populated right now. I guess it's not implemented yet.

DVL333

[08:29](#msg5a0bfaf6540c78242d06587a)@rebolek Ok. What about `system/standard/header`? It looks like template for that...

rebolek

[08:30](#msg5a0bfb18982ea2653f7f6623)Yes, that's a template that you can use for example when generating scripts.

DVL333

[08:32](#msg5a0bfb84614889d47581ed17)@rebolek Thanks :+1:

[08:46](#msg5a0bfefbdf09362e670e607c)One more question. Header template from `system/standard/header` contains fields `Name` and `Type`. What do they mean?

rebolek

[08:50](#msg5a0bffcd71ad3f8736e7bd7b)For more info about header, see http://www.rebol.com/docs/core23/rebolcore-5.html#section-2 . `Name` is scripts name for title bar (not sure if it works in Red yet) and `Type` was introduced by rebol.org library and you can read about it more here http://www.rebol.org/one-click-submission-help.r

DVL333

[08:55](#msg5a0c0105cc1d527f6b719fba)But title bar is defined with `title` argument for `view`, isn't it? Is there any difference?

rebolek

[08:56](#msg5a0c0132982ea2653f7f8507)Well, I was citing Rebol docs, maybe Red will choose different approach.

DVL333

[08:56](#msg5a0c015bdf09362e670e6cdf)I see, thanks.

rebolek

[08:56](#msg5a0c015bba39a53f1aa08081)Anyway, all header fields are optional, so you can use only those that you really need and also introduce your own.

9214

[09:22](#msg5a0c0765cc1d527f6b71bfa7)@DVL333, as @rebolek said, header format is free-form, though, when using `view`in compiled script, you need to specify `Needs: View` field, and if you want a custom icon for your app instead of a standard Red logo, you need to specify `Icon: %red/path/to/ico/file.ico`.

greggirwin

[20:01](#msg5a0c9d09df09362e671208aa)In Red you can also include the window title in the layout spec:

```
view [size 400x100 title "Testing" text "Hello"]
```

## Thursday 16th November, 2017

Ungaretti

[07:30](#msg5a0d3e7ddf09362e67151e77)@9214 Is the "icon:" is implemented for Windows too? I tried every combination of path I could think of, but couldn't change the Red icon.

dockimbel

[07:51](#msg5a0d439dcc1d527f6b788150)@Ungaretti It is implemented, though I don't remember testing it with a different option than `default`. @qtxie will have a look at that.

Ungaretti

[08:13](#msg5a0d48c4e606d60e34ce2227)@dockimbel Thanks!

greggirwin

[08:33](#msg5a0d4d5e614889d4758935ca)I just put an icon file in the same dir as a script, compiled it, and the icon shows for the EXE and in the View window. Maybe the icon format @Ungaretti ?

[08:33](#msg5a0d4d75cc1d527f6b78b399)I just have this in the header:

```
Red [
	needs: View
	icon: %relay.ico
]
```

[08:35](#msg5a0d4de9505b630c05ec801c)Windows 7 here.

9214

[09:06](#msg5a0d5526f257ad91099ffd11)@Ungaretti it doesn't work only if you interpret script

[09:09](#msg5a0d55d971ad3f8736ef27c6)uh, I chose weird wording, as @greggirwin pointed out, script should be compiled for new icon to show up

Senenmut

[16:13](#msg5a0db94471ad3f8736f18b2b)Hi Gregg

[16:22](#msg5a0dbb5ff257ad9109a277b3)Have you heared that rebol or red "official" supports development for android .apk applications ?

dander

[16:37](#msg5a0dbedf540c78242d10260a)@Mennohexo Android support is the focus for 0.6.5. The roadmap is over here: https://trello.com/b/FlQ6pzdB/red-tasks-overview

Senenmut

[16:44](#msg5a0dc06fdf09362e67182390)Yeah. But do you know if rebol does it too ?

dander

[16:45](#msg5a0dc0b9f257ad9109a299be)I was never a Rebol user, but I don't believe Rebol ever had Android support

Senenmut

[16:46](#msg5a0dc0e3df09362e67182582)Are you shure ?

dander

[16:48](#msg5a0dc15be606d60e34d0f3f9)I'm not positive

Senenmut

[16:51](#msg5a0dc1f9540c78242d10375a)Do you know the guy nick antonnacio and his manuals ?

dander

[16:53](#msg5a0dc29a982ea2653f898fcb)I've seen the name, but I am not familiar with him. I'm somewhat newer to this community (past couple years maybe)

Senenmut

[16:55](#msg5a0dc31ae606d60e34d0fd5b)Nick is a prof who has many manuals online since rebol and the development to red. Also the manuals for beginners to really understand the language better.

[16:59](#msg5a0dc3d971ad3f8736f1cc0d)For my surprise what i have found today is a language called RFO Basic. A simple basic dialect that make you able to develop android applications. apk directly or on emulated android system with ease. Nick has created a maual for that language too in 2012.

[17:00](#msg5a0dc420f257ad9109a2adbd)Seems he found a way at this time for android because rebol did not support it.

dander

[17:00](#msg5a0dc43e71ad3f8736f1cf84)Sounds pretty interesting. A Rebol dialect?

Senenmut

[17:01](#msg5a0dc469614889d4758c0ccd)no no, just easy basic such like GW Basic. The easiest language ever known in 1985.

rebolek

[17:01](#msg5a0dc46c505b630c05ef3f34)@Mennohexo there was experimental Android GUI support for Red3.

9214

[17:02](#msg5a0dc4bc982ea2653f899dda)@rebolek you mean R3?

rebolek

[17:05](#msg5a0dc55a505b630c05ef45c4)sorry, typo :)

Senenmut

[17:07](#msg5a0dc5d9540c78242d104e06)At his time RED come into the game. New Threads for experimental saphiron r3 are descibing problems with the displaying on the android screen. (to great or so).

[17:08](#msg5a0dc60d982ea2653f89a5e1)This guy nick is hacking in rebol / red and RFO Basic

[17:10](#msg5a0dc696e606d60e34d11095)Why not take the easiest programming language of the world for android. Make sense. Then you have too languages for android. That's fun.

[17:11](#msg5a0dc6ae982ea2653f89a909)If Red is on the stage.

[17:19](#msg5a0dc88d71ad3f8736f1eb45)There is only one joke that can impress such profs like nick. Are you running windows 10 ? No. I am running an emulated Windows 10 in Windows XP ! Not really ? Yes of course. Oh, youre right. All this stuff are screenshots. ha ha

[17:25](#msg5a0dca13cc1d527f6b7ba591)Thank you friends. See you. Barbarian Programmer

greggirwin

[17:52](#msg5a0dd04ccc1d527f6b7bc77f)@Mennohexo, Rebol never supported Android, and I don't think any of the R3 forks do either. Don't know if they plan to. Red \*will* support Android, and soon. It's an important part of the plan for Fullstack. NIck is a \*great* guy, and very practical. He's great at finding tools and teaching people about them. RFO Basic is an old-school style BASIC in many ways, built on top of Java. So you need Java itself, maybe Eclipse if you want to develop on the desktop rather than the device itself, and an APK builder.

Senenmut

[17:54](#msg5a0dd0d3982ea2653f89e5f0)First. Hi Mr. Gregg. Nice to see you again. Gentlemen programmer.

rebolek

[17:56](#msg5a0dd159540c78242d108d71)@greggirwin I have to disagree with you, R3 supported Android and also Android GUI. The support was only experimental, but existing. It may not have been released to the public, I am not sure about that.

Senenmut

[18:01](#msg5a0dd277ba39a53f1aaaa4eb)My focus is definetly RED. Of course. Anyway , i am a basic programmer too. GW Basic was my first language. So RFO Basic is only a experiment for me to taste if it is possible. For that i install a android emulator on Windows XP that has a behavor such like a real hardware android phone. Then i can run the application direct in the emulated one.

greggirwin

[18:02](#msg5a0dd29871ad3f8736f224dc)@rebolek, I stand corrected. I didn't know about that. Which fork?

[18:02](#msg5a0dd2adf257ad9109a3049c)@Mennohexo I'm an old BASIC hound as well.

Senenmut

[18:02](#msg5a0dd2c371ad3f8736f22573)Really ?

greggirwin

[18:04](#msg5a0dd32171ad3f8736f227a9)Yup. I have extremely fond memories of my days with QB4.5 and BASIC PDS. Also used GFA Basic, tried XBasic, and still have PowerBASIC code in production. Many years of VB as well.

rebolek

[18:05](#msg5a0dd368ba39a53f1aaaa97f)@greggirwin I can't tell you exactly when or which fork, it was Cyphre's work and he's very cautious with releasing things, so it may not have been released to the public. But it exists :)

Senenmut

[18:05](#msg5a0dd37adf09362e67188b3c)Then you know the statement of "real professionals" : A programmer NEVER needs a GOTO. ha ha

rebolek

[18:07](#msg5a0dd3ed982ea2653f89f913)Actually what exists on Cyphre's disk, could have pushed Rebol3 much further away, if he decided to release at least half of it. But that's different story.

greggirwin

[18:09](#msg5a0dd455df09362e67188fff)@Mennohexo, I started with unstructured BASICs as well, on an HP85 and then PC. Also did some on a Tandy T100 and CoCo3.

Thanks @rebolek, good to know.

[18:09](#msg5a0dd471540c78242d109e71)Need to lure Cyphre back to Red. ;^)

rebolek

[18:11](#msg5a0dd4dc540c78242d10a06a)Well it takes time, but I am working on that ;)

Senenmut

[18:11](#msg5a0dd4dde606d60e34d15d85)Thanks for informations. RED PLANET

Ungaretti

[22:29](#msg5a0e1141614889d4758dcca0)@greggirwin @greggirwin Yes, indeed the icon only changes if I compile the program. Interesting. Thank you!

greggirwin

[22:56](#msg5a0e17a4982ea2653f8b8432)If it changed when interpreted, it would mean updating the resource in the Red binary itself, which obviously isn't a good idea. If you want to be able to set the icon for each View window, you can open a wish ticket, or try your hand at porting this old R2 code of mine:

```
NO_HINSTANCE: 0
    IMAGE_ICON: 1
    DEFAULT_SIZE: 0
    LR_LOADFROMFILE: to integer! #{0010}
    WM_SETICON: to integer! #{0080}
    IMAGE_ICON: 1
    ICON_SMALL: 0
    ICON_BIG: 1
    set-window-icon: func[
        file [file! string!] "Must be a string to the full path of the .ico file."
        /local hwnd himg
    ][
        if hwnd: get-foreground-window [ ; get-current-window
            himg: load-image NO_HINSTANCE to-local-file file IMAGE_ICON DEFAULT_SIZE DEFAULT_SIZE LR_LOADFROMFILE
            send-message hwnd WM_SETICON ICON_SMALL himg
        ]
        
    ]
```

[22:58](#msg5a0e182d505b630c05f129a1)&gt; Given a View face!, is it possible in some reasonably easy way to access its underlying HWND?

&gt; Yes, you get it using face/state/1, see the "State facet" section in View doc.

[22:59](#msg5a0e185cba39a53f1aac1d3d)So the `hwnd` part in the above code doesn't have to look for the window with an API call.

[23:01](#msg5a0e18bde606d60e34d2de4a)Supporting funcs used the above.

```
win-user: load/library %user32.dll

    load-image: make routine! [
        hinst       [integer!]
        lpszName    [string!]
        uType       [integer!]
        cxDesired   [integer!]
        cyDesired   [integer!]
        fuLoad      [integer!]
        return:     [integer!]
    ] win-user "LoadImageA"
    send-message: make routine! [
        hWnd    [integer!]
        wMsg    [integer!]
        wParam  [integer!]
        lParam  [integer!]
        return: [integer!]
    ] win-user "SendMessageA"
```

[23:01](#msg5a0e18e1e606d60e34d2df1c)Note that you need to use R/S today, since Red doesn't have FFI yet. You can do that with routines, but it also means your code has to be compiled.

Ungaretti

[23:39](#msg5a0e21b7505b630c05f15728)@greggirwin I'll study that code, but it doesn't look trivial. Anyway, while I can see the importance of changing the main icon, having a different icon for each window is a bit too much in most cases.  
What about selecting where on screen the window shows? Is it possible?

greggirwin

[23:42](#msg5a0e2252614889d4758e1cef)@Ungaretti, yes. `view/options [...] [offset: 50x50]`

## Friday 17th November, 2017

Ungaretti

[07:52](#msg5a0e9531e606d60e34d4f303)@greggirwin Nice! Thank you.

## Sunday 19th November, 2017

githubnyn

[19:04](#msg5a11d5c7e606d60e34e34b0e)every time I run anything with \*\*view/no-wait\** I get the beach ball on the Mac and I need to shut down the terminal

```
win: view/no-wait [ hello: button "Hello" [print "ok"]]
```

is this normal ?

[19:11](#msg5a11d750e606d60e34e35035)also when I run this example from the red home page

```
img: draw 20x20 [fill-pen red triangle 10x0 19x19 0x19]
forall img [if img/1 = 255.255.255.0 [img/1: transparent]]

view [
	style box: base beige 60x30
	box "Arrow"
	box "I-beam" cursor I-beam
	box "Hand"   cursor hand
	box "Cross"  cursor cross
	box "Custom" cursor img
]
```

the terminal crashes

```
2017-11-19 14:09:29.752 console-2017-11-13-28381[3189:191486] -[RedBase contentSize]: unrecognized selector sent to instance 0x708930

*** Runtime Error 17: illegal instruction
*** at: 922C4A12h
```

## Monday 20th November, 2017

greggirwin

[00:46](#msg5a1225e2982ea2653f9d968c)@githubnyn, you need to use `do-events` if you use `view/no-wait` for your main window. i.e., you need an event loop running at some point.

[00:47](#msg5a122624df09362e672c18ff)The above example works fine here on Win7, so maybe worth a ticket about crashing on MacOS.

dockimbel

[05:15](#msg5a1264fb982ea2653f9e8e36)@qtxie ^--- Please have a look at that crash.

qtxie

[06:45](#msg5a127a10cc1d527f6b90668b)Seems it's fixed in 0.6.4 branch, I'll cherry pick it to master branch.

## Tuesday 21st November, 2017

Ungaretti

[09:32](#msg5a13f2c871ad3f87360fb471)I would expect the program below to print "hello", wait two seconds and print "world". Instead it opens the console, waits two seconds and then do both printings.

```
Red []
print "hello"
wait 2
print "world"
```

[09:33](#msg5a13f2de2837ee5106ad3366)Is it normal?

xqlab

[09:44](#msg5a13f58771ad3f87360fc35d)It works in the pure console, but not yet in the gui-console

greggirwin

[09:46](#msg5a13f5e5540c78242d2d8ea2)As @xqlab says, it's a temporary GUI console issue.

## Wednesday 22nd November, 2017

DVL333

[11:54](#msg5a156569ba39a53f1acf5e09)What is right variant for function: `function` or `func`? In Wiki it's stated that `function`, and `func` doesn't exist. But in the built-in help in console it's stated opposite.  
And one more question. It's a shame but ... how to set a position for a window on display? :worried:

9214

[11:56](#msg5a1565df232e79134dba9356)@DVL333 the difference between `function` and `func` is that first one is "smart" and can localize all `set-word!`s inside its body automatically, while `func` is "dumb" and you need to put `/local` words by yourself.

[11:58](#msg5a156658540c78242d356d42)and the answer to "what is right" is - it depends :D

[11:58](#msg5a156674df09362e673d440d)to which wiki you're reffering to btw?

DVL333

[11:59](#msg5a1566a0540c78242d356e0d)@9214 https://github.com/red/red/wiki/Differences-between-Red-and-Rebol

9214

[12:00](#msg5a1566e1614889d475b06a2f)ah, you misread it - only `funct` doesn't exist in Red

DVL333

[12:01](#msg5a156719ba39a53f1acf696f)@9214 Oh, yes. Sorry. :(

9214

[12:03](#msg5a1567842837ee5106b5081e)as for window positioning, try something like

```
view/options [text "text"][offset: 100x100]
```

DVL333

[12:05](#msg5a156801ba39a53f1acf709c)@9214 :+1: Vid dialect rather complicated...

9214

[12:07](#msg5a15686a540c78242d3577c2)well, it has its rough edges for sure, but, comparing with other GUI building frameworks (only Qt and Tk comes to mind), it's much more simpler ;)

gltewalt

[17:58](#msg5a15bac9ba39a53f1ad17398)My issue with vid is that "how to" is scattered in bits around the internet.  
A central by example doc would be great

9214

[18:07](#msg5a15bcf5982ea2653fb14695)it's not issue with VID, but with documentation, which will come at some point in the future

## Friday 24th November, 2017

Ungaretti

[01:08](#msg5a177118ffa3e37919b1b6fe)@DVL333 @gltewalt Take a look at the last chapters of  
https://www.gitbook.com/book/ungaretti/red-language-notebook/details  
It is a work in progress, and I just begun working on the GUI chapters, but maybe it can already help a little bit. Warning: there may be gross misunderstanding of Red jargon and syntax.

gltewalt

[01:24](#msg5a1774be982ea2653fb9f1ab)@Ungaretti Great work

PeterWAWood

[02:14](#msg5a1780a1e606d60e34006d58)@Ungaretti Your notebook is a great idea. I was able to take a quick look and noticed your blocks -&gt; series, strings hierarchy. Actually, `series!` is the "top-level". `block!` and `string!` are both `series!`. There are many types of `series!` in Red.

```
>> probe series!
make typeset! [block! paren! string! file! url! path! lit-path! set-path! get-path! vector! hash! binary! tag! email! image!]
```

[02:20](#msg5a1781e4df09362e6747e90c)Your explanation of Blocks/Series is very good.

[02:21](#msg5a17823c71ad3f8736228c8e)Perhaps you could consider using the "word" index instead of "pointer" in your explanation. It is usually called the series' index.

toomasv

[04:30](#msg5a17a064ba39a53f1ada8d72)@Ungaretti Great work! While skimming through your notes I noticed that in `Datatypes` you say about `char!` that it represents ASCII character and has numerical value in range 0-255. It is not so.

```
>> to-integer #"ä"
== 228
>> to-char 228
== #"ä"
>> to-char 36947
== #"道"
>> to-integer #"道"
== 36947
```

Official \[doc](https://doc.red-lang.org/en/char.html) says:

&gt; Char! values represent a Unicode code point. They are integer numbers in the range hexadecimal 00 to hexadecimal 10FFFF. (0 to 1,114,111 in decimal.)

About datatypes -- haven't checked it lately, but \[this diagram](https://github.com/toomasv/red-type-hierarchy/blob/master/Red%20type%20hierarchy2.pdf) should be mainly correct. Maybe is of some use.

[04:42](#msg5a17a347e606d60e3400e007)Also, about integers you say

&gt; Dividing 2 integers gives rounded result

But it is not rounded:

```
>> 2 / 3
== 0
>> 2.0 / 3
== 0.6666666666666666
>> round 2.0 / 3
== 1.0
```

KimRoach143\_twitter

[06:54](#msg5a17c21cba39a53f1adb044b)@toomasv " &gt;&gt; query \[print \[first name age] of persons]  
none Timmu Tamm 57  
none Oscar Brewer 54  
none Ivan Bezrodny 13  
none Xia Chong 55  
none Edward Kinnock 18 "

[06:54](#msg5a17c229ffa3e37919b2d4cf)why none??

toomasv

[07:09](#msg5a17c5a0982ea2653fbb08ec)@KimRoach143\_twitter These should work

```
>> query [print [(first name) age] of persons]
Oscar 54
Ivan 13
Xia 55
[...]
== true
>> query [print [first-name age] of persons]
Oscar 54
Ivan 13
Xia 55
```

KimRoach143\_twitter

[07:27](#msg5a17c9e88b3a9e2c0c10868a)@toomasv worked please update Redme about it also update this line "ids cam be accessed by path" cam to can.

toomasv

[07:31](#msg5a17cab4df09362e6748ea76)@KimRoach143\_twitter Done. Thanks!

KimRoach143\_twitter

[07:53](#msg5a17cfecdf09362e6749054a)@toomasv '''  
query \[print \[rejoin \[person/default comma space person/age ", " person/birthdate]] person with \[address = "London, Trafalgar Sq 22"]]  
none Oscar Brewer , 54 , 24-Jun-1963  
none Edward Kinnock , 18 , 13-Jun-1999  
\== true  
'''

[07:53](#msg5a17d005ffa3e37919b3137e)how can I put code in that blackbox

[07:54](#msg5a17d030ffa3e37919b31443)'test'

toomasv

[07:55](#msg5a17d08ddf09362e67490814)@KimRoach143\_twitter I'll fix it:

```
query [print [(rejoin [person/default comma space person/age ", " person/birthdate])] person]
Oscar Brewer, 54, 24-Jun-1963
Ivan Bezrodny, 13, 27-Jan-2004
```

Use 3 backticks on separate line before and after the code. See Markup help on right.

endo64

[08:51](#msg5a17dd758b3a9e2c0c10ea44)@Ungaretti Great work!

Ungaretti

[08:54](#msg5a17de60232e79134dc6d1ee)@gltewalt @PeterWAWood @toomasv @endo64 Thank you for the support and the input. I'll check those issues.

[09:05](#msg5a17e0ea232e79134dc6de74)@toomasv May I add you diagram to my text? Giving you credit, of course.  
Actually I have copied and pasted a few bits of text from Red's documentation and red-by-example.org, I wonder if that is ok. I will mention that in the Introduction.

toomasv

[09:07](#msg5a17e160e606d60e3401ed5e)@Ungaretti Yes, you may use it. I'll try to check it and if anything changes, I'll let you know.

endo64

[10:55](#msg5a17fa8ce606d60e34026b53)@Ungaretti It could be nice to have `block!` and `series!` in `Datatypes` section and refer them to `Blocks & Series` section. Because they are datatypes too (and very fundamental ones)

sptorin\_twitter

[10:58](#msg5a17fb52540c78242d423ba6)@Ungaretti Great red-book! Very helpful for newcomers! I was looking for this before.

greggirwin

[20:13](#msg5a187d5e232e79134dca327c)@Ungaretti, wonderful! I skimmed quickly, but looks good. We can certainly continue making suggestions, but it's a solid piece of work that we should link to from the wiki, if that's OK with you.

Ungaretti

[21:34](#msg5a189079232e79134dca89f7)@greggirwin , thank you! Sure, I'll make the link, although there is a lot to be done yet.

[21:47](#msg5a189372540c78242d456ef0)Thank you for all suggestions, I implemented most of them. A few I'll give some more thought. I focus more on "getting a beginner going" (me) than being thorough.

## Saturday 25th November, 2017

gltewalt

[04:16](#msg5a18eeaae606d60e3406f85e)@Ungaretti Do you know powershell? I was thinking, since it's a beginner guide, that maybe a script that sets up the environment automagically for the reader would be popular

Ungaretti

[07:29](#msg5a191bbf71ad3f873629bb6f)@gltewalt Interesting, I'll look it up.

## Sunday 26th November, 2017

bdheeman

[13:52](#msg5a1ac72e232e79134dd35cc9)Hello, everybody

[13:53](#msg5a1ac76fe606d60e340e2ab3)From where can I get the red-gtk?

9214

[16:42](#msg5a1aeedddf09362e67559d1b)@bdheeman you mean @rcqls' fork?

[16:44](#msg5a1aef60e606d60e340ed666)https://toltex.u-ga.fr/RedGtk

geekyi

[16:44](#msg5a1aef816b5080350f31b48e)@bdheeman I think you may have to compile from sources yourself.. it's a branch https://github.com/rcqls/red/tree/GTK

[16:45](#msg5a1aefa8cc1d527f6bb91d2a)Ah that's a better link than what I just posted

## Monday 27th November, 2017

mikeparr

[08:02](#msg5a1bc6a4e606d60e34124b32)@Ungaretti Excellent work on Red book!

## Thursday 30th November, 2017

virtualAlan

[00:46](#msg5a1f54cccc1d527f6bd04fee)@Ungaretti Very nice, great work - I know from experience how much hard work goes into these tutorial pieces, so congratulations on your excellent work.

dsnezhkov

[06:43](#msg5a1fa88c540c78242d66f727)@Ungaretti thank you for the git book!

Ungaretti

[09:02](#msg5a1fc9373c69dd491706f349)@mikeparr @virtualAlan @dsnezhkov Thank you! I'm very glad that you folks appreciate it and think it's useful.  
It is, like I said, a work in progress, I guess half way through. There is not a day I don't change things even in the very first chapters.

## Monday 4th December, 2017

hiiamboris

[10:31](#msg5a25241dc65707ba2b0cb241)Is ports IO not yet implemented in Red?

9214

[10:34](#msg5a2524c7ba39a53f1a19e276)@hiiamboris it's planned for `0.7.0` release

## Tuesday 5th December, 2017

Ungaretti

[10:30](#msg5a26754b3a80a84b5bbbd68c)Is there any Red IDE project going on?

9214

[10:32](#msg5a2675aeffa3e37919fa9c29)@Ungaretti there're a couple of them

[10:32](#msg5a2675d3ffa3e37919fa9cf0)https://github.com/AlexanderBaggett/RedIDE  
https://github.com/vulnz/redide

[10:33](#msg5a2675eccc1d527f6bf22e9c)are all I can remember

[10:33](#msg5a2676003ae2aa6b3f8afeae)but I'd say VSCode plugin is a no-brainer

[10:35](#msg5a267674540c78242d876b8b)see also https://github.com/red/red/wiki/Editor-Integrations

Franktic2

[10:58](#msg5a267bcaffa3e37919fabc24)@Ungaretti I want to add my thanks for your book. I have spent the day going through it and found it very useful.

Ungaretti

[12:02](#msg5a268ac6c65707ba2b14424d)@Franktic2 I'm glad to hear that. Let me know if there is anything you think could be improved.

[12:10](#msg5a268cab3a80a84b5bbc51b8)@9214 Yes, I like the simplicity of VScode very much. I think an IDE for Red should be simple, like the one Processing has. I could not find a way to add a simple execute command to VScode. I'm not saying it's not possible, just that I figured notepad++ first.

[12:12](#msg5a268d4aa2be466828624784)I'l look into those links, thanks.

greggirwin

[14:14](#msg5a26a9c387680e6230d3b69a)The Red VSCode plugin should already add a few menu/hot-key commands for executing.

9214

[14:18](#msg5a26aacdba39a53f1a220ca5)`F6` and `F7` for interpreting and compiling IIRC

greggirwin

[14:27](#msg5a26ace387680e6230d3c9e0)Thanks @9214, I haven't fired it up in a while.

## Wednesday 6th December, 2017

virtualAlan

[01:44](#msg5a274b67cc1d527f6bf70a6c)There's a lot about VScode lately. Not sure why ? Red is a brilliant 1 meg in size. So you are using a bloater to edit it ?

greggirwin

[03:03](#msg5a275e1887680e6230d7a834)

```
>> popularity = technical merit
== false
```

gltewalt

[03:22](#msg5a276258ffa3e37919ffd51e)We use Red on windows and \*nix operating systems - there's quite a bit of bloat there

endo64

[12:00](#msg5a27dbce232e79134d15cf1b)Any simple text editor is enough for Red, Notepad++ or similar one. I use Editplus for years and I very happy with it.  
VS Code is on the other hand is a bit bloated but still very easy to use. Not like Eclipse based IDEs. If you just use it for Red it may not necessary, but if you need an IDE for other languages (PHP, JS, some C# in my case) and Red, then it is useful.

9214

[15:16](#msg5a2809b4ba39a53f1a29579c)speaking of bloatness - does someone else experience massive memory consumption (to the point that entire system starts to lag like hell) after VSCode is closed, on \*nix system?

gltewalt

[16:09](#msg5a28164effa3e37919038a2a)If the gurus could agree on an editor design made from Red, for Red, I'd use it.

[16:15](#msg5a2817aecc1d527f6bfb1b32)Looks like `editor` source is view-able in Rebol2, but relies on Rebol/IOS things

sptorin\_twitter

[16:49](#msg5a281f92c65707ba2b1ce111)Someone know about:  
Matt Combatti  
24 октября  
I am currently working on an amazing cross-platform IDE for Red with syntax coloring, suggestions &amp; language help, auto-complete, and a drag-n-drop app builder interface with a property editor &amp; the works. See some of my other works at xojostudio.org. Will keep everyone updated and should have a beta available to the public soon.

endo64

[16:51](#msg5a282012232e79134d1777db)Writing a simple editor using Red is not difficult, there are many features that users want them "default" like syntax coloring, code snippets, auto-complete etc.

9214

[16:51](#msg5a28202c3a80a84b5bc4c353)@sptorin\_twitter first time I ever hear about this guy, but I do remember @endo64's work on drag-n-drop GUI builder

[16:52](#msg5a28203c540c78242d908412)and various IDE projects form other members (mentioned them yesterday)

[16:54](#msg5a2820b6ba39a53f1a29f600)pretty basic editor can be coded in, like, 3 or 5 lines of nicely formatted Red

[16:58](#msg5a2821cc3ae2aa6b3f9423a0)and I think that new `0.6.4` console engine will bring something new on the table

greggirwin

[17:50](#msg5a282dcf232e79134d17cf98)@sptorin\_twitter, thanks for the info. News to me. I also think the new features coming will help a lot in building something like this. I'm happy to live without syntax highlighting or some other common features to start with, while we figure out the big picture. And other things we might want, that aren't done today. e.g., highlight/underline based on scope or evaluation range.

[17:55](#msg5a282f073a80a84b5bc51c4a)Some features are easy for us. @maximvl did a popup help example some time back. I did an intellisense (crude) example in R2 years and years ago, we can include things like a system browser (e.g. https://gist.github.com/greggirwin/91dc1c3971998e0babeedba9f7e60bc5), there are a few live coding examples out there.

[18:14](#msg5a28338e3ae2aa6b3f94966b)@sptorin\_twitter, ah, I forgot that Xojo is RealBasic. So that's very promising. I specialized in VB for many years, and RealBasic made a short list of tools to consider some years back, for a client of mine. I have the same hope for Red, that we can make something a \*lot* of people can use. Actually, I believe we can build a \*lot* of things a \*lot* of people can use.

[18:15](#msg5a2833b6540c78242d910386)I hope Matt Combatti will show up here and that we can support him in his efforts.

## Friday 8th December, 2017

pkphilips\_twitter

[13:40](#msg5a2a96463ae2aa6b3fa0f12f)Really sorry to butt into the conversation. But where do I get an update on the gtk backend for red?

[13:41](#msg5a2a966ecc1d527f6b0872bf)&gt; Someone know about:  
Matt Combatti  
24 октября  
I am currently working on an amazing cross-platform IDE for Red with syntax coloring, suggestions &amp; language help, auto-complete, and a drag-n-drop app builder interface with a property editor &amp; the works. See some of my other works at xojostudio.org. Will keep everyone updated and should have a beta available to the public soon.

[13:44](#msg5a2a97543ae2aa6b3fa0f689)Apologies - just found the link to the repository on github: https://github.com/rcqls/red/tree/GTK

[13:44](#msg5a2a9758232e79134d249f3b)I will check this out

greggirwin

[19:33](#msg5a2ae91bcc1d527f6b0a728b)Butting in is fine. Gitter doesn't give us many options.

## Saturday 9th December, 2017

pkphilips\_twitter

[04:18](#msg5a2b641a232e79134d28b999)Not particularly familiar with how Gitter operates and I noticed that you gents were already busy in another conversation. Thank you so much

[04:25](#msg5a2b65a0232e79134d28bfb2)I did get the code off github but didn't succeed in getting it compiled. I got this error when I tried running rebol from the console on Linux Mint 8.3: \** User Error: Bad face in screen pane!  
\** Near: size-text self

[04:25](#msg5a2b65d7540c78242da150a2)I did manage to finally run it after installing the following font packages: apt-get install xfonts-100dpi xfonts-75dpi

[04:26](#msg5a2b6601540c78242da150e0)Would really appreciate it if this was documented directly on the red-lang.org website itself so that the experience of installing and trying rebol is better for Linux users.

9214

[08:20](#msg5a2b9cc4232e79134d298d69)@pkphilips\_twitter why do you think list of \*Rebol2* dependencies should be mentioned on \*Red* website?

[08:21](#msg5a2b9d2387680e6230ed7605)\[this](https://killring.org/2012/12/16/developer-notebook-installing-rebol/) might help

[08:32](#msg5a2b9fb1cc1d527f6b0d6ada)makes more sense to include list/link above in an appropriate readme on github

pkphilips\_twitter

[15:58](#msg5a2c082387680e6230ef300a)@9214 Without the rebol dependencies being mentioned, it is not even possible to compile red on Linux. Thats why. Though I ultimately gave up after I couldn't get the links to the kernel and the license key I need for building red in any case.

[15:58](#msg5a2c0840cc1d527f6b0f2ca4)If the instructions are more thorough it would definitely help the adoption of the language

9214

[15:58](#msg5a2c0843c65707ba2b304025)@pkphilips\_twitter you don't need any license key for compiling

[15:59](#msg5a2c08633a80a84b5bd858e0)https://github.com/red/red#running-red-from-the-sources-for-contributors

pkphilips\_twitter

[15:59](#msg5a2c0875cc1d527f6b0f2d6a)This is what I read from the README.md in the /build folder for red-GTK.  
1\. Place a copy of one of the \[encappers](http://www.rebol.com/docs/sdk/kernels.html) ( \*\*enpro\** would be a right choice) along with a copy of \*\*license.key\** file into the \*\*%build/\** folder.

9214

[16:00](#msg5a2c089bba39a53f1a3d8816)@pkphilips\_twitter yeah, now look at the same file in an official repo  
https://github.com/red/red/tree/master/build

[16:00](#msg5a2c08a4a2be4668287e7aab)&gt; Note: This is not required to build or run red from sources. It is for a feature used by the red team. Check the main readme if you want to build red from sources

pkphilips\_twitter

[16:01](#msg5a2c08dba2be4668287e7b42)Ah ok! thank you

9214

[16:02](#msg5a2c0906cc1d527f6b0f3099)if you're using R2 binary just for Red compilation, the issue with fonts should arise IIRC

pkphilips\_twitter

[16:02](#msg5a2c0915cc1d527f6b0f310e)Would you recommend that I use something else?

9214

[16:02](#msg5a2c0926540c78242da3eb1b)@pkphilips\_twitter what do you mean?

[16:03](#msg5a2c093b3ae2aa6b3fa7a5e2)Usually I just grab latest automated build from official site and that's it

pkphilips\_twitter

[16:03](#msg5a2c0956ffa3e3791917b3c1)My intent was to try the gtk backend. I am completely new to red so it is very likely that I am messing up

9214

[16:03](#msg5a2c096b3ae2aa6b3fa7a781)you may want to use custom-compiled binary if you want to add some feature for yourself or working on contribution

[16:06](#msg5a2c09fcc65707ba2b304a77)@pkphilips\_twitter the GTK branch you've checked is for the most part a community effort from @rcqls and others (@honix I believe?), official GTK branch is stalled until `1.0` release, simply because team has limited resources and time for developement of another backend.

[16:07](#msg5a2c0a2effa3e3791917b872)I guess you can play around with Win version under Wine, it works for the most parts, though doesn't look very pretty

pkphilips\_twitter

[16:09](#msg5a2c0ab23a80a84b5bd86235)Thanks a lot for the heads up. Most appreciated. Couldn't get it to run.

9214

[16:09](#msg5a2c0ac3232e79134d2b5d93)you're welcome

pkphilips\_twitter

[16:09](#msg5a2c0ac63ae2aa6b3fa7ad6c)About the road map, do we have any idea about when 1.0 is due?

9214

[16:10](#msg5a2c0ae93a80a84b5bd862fa)@pkphilips\_twitter tricky question, I don't want to play around with estimations, I guess even @dockimbel himself can't say for sure

pkphilips\_twitter

[16:10](#msg5a2c0afb540c78242da3f4d9)understood

greggirwin

[19:39](#msg5a2c3bdc87680e6230f01be7)Trello is kept up to date pretty well on what things are being worked on.

[19:39](#msg5a2c3c02cc1d527f6b1024c2)And unless you want to contribute to the GTK development, Wine is the easiest way to run under Linux right now.

rebolek

[21:19](#msg5a2c5356cc1d527f6b10939f)Unless you need networking.

## Sunday 10th December, 2017

Mufferaw

[09:12](#msg5a2cfa7c540c78242da7994b)@Ungaretti Your Gitbook is fantasic, the GUI section is especially nice. I noticed a small point of confusion... https://ungaretti.gitbooks.io/red-language-notebook/content/assets/coordinates.png

Ungaretti

[10:11](#msg5a2d086ecc1d527f6b133875)OOps! I'll fix that. Thank you!

Palaing

[14:36](#msg5a2d4665a2be466828839819)Hi everybody,

[14:36](#msg5a2d468aba39a53f1a42868c)I downloaded and launched red-063.exe on Windows,

[14:37](#msg5a2d46b9c65707ba2b3536a3)AVG detected "Win32:Malware-gen" in gui-console-2017-8-3-49893.exe

9214

[14:38](#msg5a2d46f0ffa3e379191caeee)@Palaing this was discussed multiple times already, it's a false positive and AVG with Avira are nowhere in fixing their heuristics

Palaing

[14:38](#msg5a2d46f23ae2aa6b3fac982b)I sent gui-console-2017-8-3-49893.exe to https://www.virustotal.com/ ; 7 out of 66 antiviruses detect some malware. Any idea about that ?

[14:39](#msg5a2d4704ffa3e379191caf34)ok thanks a lot !

9214

[14:39](#msg5a2d4727ba39a53f1a42890f)@Palaing https://github.com/red/red#anti-virus-false-positive

Palaing

[14:40](#msg5a2d475a87680e6230f44555)@9214 Thanks a lot ; I missed that.

9214

[14:40](#msg5a2d47763ae2aa6b3fac99bf)@Palaing https://twitter.com/red\_lang/status/887970289618829312

[14:41](#msg5a2d478487680e6230f445f4)look at the date ;)

[14:41](#msg5a2d478a3ae2aa6b3fac9a16)they don't really care

Palaing

[14:42](#msg5a2d47b8c65707ba2b353bdf)@9214 indeed

9214

[14:51](#msg5a2d49f9cc1d527f6b144b7e)@dockimbel :point\_up: idea about monk-dress fashion parade of shame still holds?

greggirwin

[18:23](#msg5a2d7baccc1d527f6b152600)@Ungaretti, it seems you can write content faster than I can read it! Keep up the great work. So many nice diagrams included as well.

[18:27](#msg5a2d7c770163b028101d03c7)The difference between `drop-list` and `drop-down` is that the former does't allow you to type into the text area, while the latter does.

[18:30](#msg5a2d7d32c65707ba2b363e92)Both also support an action facet. For `drop-list` the default actor is `on-change` and for `drop-list` it's `on-enter`.

Ungaretti

[20:21](#msg5a2d9730232e79134d31c898)@greggirwin I'm glad you are liking it! I hope it can serve as a crash-course and a reference to beginners.  
Updates done! Thanks.  
Any idea how to retrieve the text one writes in the text box of drop-down?

mikeparr

[21:17](#msg5a2da46eba39a53f1a443a7d)@Ungaretti - drop-down - On http://www.red-by-example.org/index.html#0drop-down - there is a link to some code.

Ungaretti

[21:25](#msg5a2da637a2be466828854bd4)@mikeparr Thanks, but what I mean is how to retrieve what I write in the textbox, not the data options. I mean, what is the point of being able to write in the box if I can't retrieve what is written.

gltewalt

[21:31](#msg5a2da7bc232e79134d321ed3)Is it `select` ?

Ungaretti

[21:35](#msg5a2da8843ae2aa6b3fae574f)@gltewalt I think `select` returns the number of the selected option. 1 for the first line, 2 for the second... ]

mikeparr

[21:36](#msg5a2da8ec87680e6230f6045f)@Ungaretti - yes, I had a problem in this also. I'm not sure if what I wrote (to follow) was correct, but: 'It is possible to preset the edit field, which might be used as an initial  
selection, or a prompt. '

9214

[21:39](#msg5a2da984232e79134d322778)@Ungaretti you can't update content of `drop-down`, I think

[21:42](#msg5a2daa3c87680e6230f609ac)and `drop-down` has `data` facet, you can access any element in it knowing its index

Ungaretti

[21:45](#msg5a2dab0cffa3e379191e82e8)@9214 That's what I thought (no update), but as Greg Irwin pointed out, the fact that you can write in it's text box is one of the differences from `drop-list` and pressing `enter` in the box triggers it's action facet, so I assume it has a field.  
I guess I'll print the object to find out...

9214

[21:47](#msg5a2dab85540c78242daaa7aa)you can enter some text in it, it will be stored in `text` facet

[21:48](#msg5a2daba7cc1d527f6b15fbfa)@Ungaretti it's more like a `field` with some pre-selected options to choose from, doesn't make much sense to allow modification of these options

Ungaretti

[21:49](#msg5a2dabf2ffa3e379191e8650)@9214 Solved. Its in the attribute /text. Pretty obvious, sorry.

gltewalt

[21:53](#msg5a2dacf0cc1d527f6b16021e)I thought that, but I then thought that had probably been tried already

Ungaretti

[21:54](#msg5a2dad13ba39a53f1a4462e6)@gltewalt I know, embarassing...

gltewalt

[21:55](#msg5a2dad3ba2be466828856b68)Don't worry about it. I'm the king of embarrassing myself and they still accept me

9214

[21:55](#msg5a2dad6ecc1d527f6b16040a)aww :sparkles:

## Monday 11st December, 2017

greggirwin

[04:11](#msg5a2e0567a2be46682886ca50)We're all on the same road. Some of us have just gone around more than once. :^)

[04:11](#msg5a2e058cba39a53f1a45baae)@Ungaretti, this may not add any info at this point: https://gist.github.com/greggirwin/c67d640f09e9ccd0dac0859ec7374ca3

toomasv

[14:56](#msg5a2e9c92ffa3e379192316dc)@Ungaretti Two remarks on "Notes on syntax" chapter:

&gt; "words" are separated by one or more spaces.

Maybe "whitespaces" is better here:

```
>> a: [1
[    2]
== [1 
    2
]
>> forall a [
[    print
[    a/1
[    ]
1
2
```

&gt; every word must have a value

This is not so. You can surely have words without value, until they are not evalueated, e.g.:

```
>> last [a b c]
== c
>> unset? :c
== true
>> value? 'c
== false
```

9214

[15:12](#msg5a2ea05ec65707ba2b3b822e)everything \*\*is\** a value, and each value must have a datatype

greggirwin

[17:41](#msg5a2ec34e232e79134d37b32f)The current text is probably fine for the target audience, which is newcomers. Unset is a tricky concept.

Ungaretti

[23:39](#msg5a2f17363ae2aa6b3fb5d166)@toomasv I changed it to whitespaces.  
My first attempts to program in Red were full of "... has no value" errors. How about "every word must have a value after (during?) evaluation"?

## Tuesday 12nd December, 2017

toomasv

[04:28](#msg5a2f5afa540c78242db33e78)@Ungaretti My tries too :) May-be "while evaluated"?

9214

[04:45](#msg5a2f5efccc1d527f6b1e8ae7)word may or may not be bound to some value in some context, if word isn't bound to any value during its evaluation, and error will occur

[04:48](#msg5a2f5f8e3ae2aa6b3fb70492)words on their own don't have any value, instead they have a reference (binding) to a value slot in some context

[04:50](#msg5a2f600187680e6230fe9fa5)and to denote that this value slot is empty, (i.e. it doesn't store any value)`unset` is used

[04:51](#msg5a2f605d540c78242db35406)currently it's impossible to have a word without a binding, but that my change after module system is presented

PeterWAWood

[07:22](#msg5a2f83c4232e79134d3b82cb)@9214  
The way I look at words is: a word is a symbol which can be bound to another value.

Words can exist without being bound to a value and can be used as symbols.

This example may help:

```
my-words: [oui non peut-être]

loop 10 [
	my-word: first random my-words
	switch my-word [
		oui			[print "yes"]
		non			[print "no"]
		peut-être	[print "may be"]
	]
]
```

9214

[08:37](#msg5a2f952d540c78242db449e9)@PeterWAWood yes, I just wanted to stress out that words and their values are separate things

Ungaretti

[23:40](#msg5a3068e8cc1d527f6b245de5)Would opening a wish ticket for mqtt support be too much to ask?

greggirwin

[23:53](#msg5a306be93ae2aa6b3fbce08e)@Ungaretti, I've added it to https://trello.com/c/BW1SPeOU/48-i-o-support in the Nice To Have section.

Ungaretti

[23:54](#msg5a306c48232e79134d40cde8)@greggirwin Great. Let's wait for 0.7 then, and hope it comes in it.

greggirwin

[23:55](#msg5a306c8d0163b028102c5afd)Once we have ports, and docs and a couple examples, protocols are something the community can contribute to.

[23:58](#msg5a306d14cc1d527f6b2471e0)Nenad wrote Cheyenne, Uniserve, and a MYSQL driver for R2, and knows well what issues to expect and how to make our lives easier when building them.

## Wednesday 13th December, 2017

dander

[19:00](#msg5a3178e2232e79134d468866)@greggirwin looking at the IO support list, I think "skydrive" should be changed to "onedrive" and perhaps "s3" should be on that list?

pekr

[19:32](#msg5a31803887680e62300a64cb)Nenad also wrote Postgress SQL driver, something around the NTLM authentication and scheduler dialect/protocols, ti name a few others ...

greggirwin

[22:10](#msg5a31a57087680e62300b3e01)@dander, done.

## Friday 15th December, 2017

zinid

[09:49](#msg5a339ac2c254d1100e298da4)Hi guys, any news about Linux GUI?

9214

[09:52](#msg5a339b47a2be466828a4ab92)@zinid AFAIK nothing new, maybe @rcqls has something to say

[09:53](#msg5a339b98ba39a53f1a63310b)I remember @dockimbel talked about some GTK conf in China where he wanted to present Red and get some potential help

zinid

[10:00](#msg5a339d461a4e6c822310962f)Hehe...

rcqls

[12:29](#msg5a33c01cffa3e379193eb858)@zinid @9214, at some point I tried to do my best to the improvement of the GTK backend. Actually I am not a daily linux user since I work on macOS most of the time. But since I think that red is just a powerful project because of the multicrossplatform skill, I spent some time to help in this direction. Now, I am waiting for the android backend and maybe some new contributors. Of course, if I made a stop, it is because I found some weird behaviors in the layout management of the widgets. I am sure that @qtxie and @dockimbel with full working time would find THE solution…. However I tried to explore a lot of features (with the list in the comments in the PR). This is still experimental and working for basic examples… Maybe we need new better contributors for the linux branch (even gtk is not the best choice following some comments here but I am not an expert). Also, @honix contributed on the draw dialect. @qtxie was kind enough to give me some support because it was at some point pretty difficult to develop GTK branch without documentation (even it is of course normal) by simply trying to adapt macOS and windows backends. Maybe with android backend, I hope that it could be easier.

## Saturday 16th December, 2017

zinid

[05:24](#msg5a34ae21ba39a53f1a688359)@rcqls where is the gtk code? Is it available in github?

9214

[05:26](#msg5a34ae76a2be466828aa33a3)@zinid https://toltex.u-ga.fr/RedGtk

zinid

[05:32](#msg5a34b004ba39a53f1a688911)@9214 thanks

## Tuesday 19th December, 2017

MartenH

[23:24](#msg5a399fa900d569114bc7d5fd)Hi,

I want to use the GUI to call program/scripts that I direct the output from to some GUI element (area, etc)  
This leads me to two questions:  
\* Is there a way to output during execution of the call?  
E.g. if I run a script that takes a long time I want the output in realtime, not just when the program ends.  
\* Can I direct both stdout+stderr from a call to the same output as the program is outputting it?  
`>> stdout: "" == "" >> stderr: "" == "" >> call/output/error %"python --version" stdout stderr == 0 >> stderr stdout >> print stdout >> print stderr Python 2.7.13`  
Here I get them separated.

Cheers  
/M

## Wednesday 20th December, 2017

Ungaretti

[08:23](#msg5a3a1e120163b028105af346)@MartenH If I understand correctly, you want to use Red's GUI to display the result on a non-Red program/script, is that it?  
One suggestion would be to write the output of your non-Red program to a text file and create a Red GUI element with a fast `rate` that checks that file for changes. You must make your Red and non-Red programs run at the same time. Your non-Red program must close the file after each `write`.  
This solution is not very fast, I guess you will have a 0,3 second delay.

rebolek

[08:25](#msg5a3a1e70ffa3e379195c6eb0)Once IO is ready, you could use sockets for this.

rokf

[08:28](#msg5a3a1f3a03838b2f2a17de49)Sockets / named pipes are probably the best solutions for inter-process communication.

greggirwin

[18:06](#msg5a3aa6b8540c78242deaa931)I have no doubt Nenad knows well the importance of this capability when writing pipe and filter style apps. I would be very surprised if they didn't work to make this very easy and natural, along with other ways we could do it. i.e., more structured IPC options.

MartenH

[20:40](#msg5a3acad203838b2f2a1bc2e4)@Ungaretti , thanks for the suggestion but I don't have that kind of control over the programs that run. It seems as have have to wait for the IO to complete. Thanks everyone.

## Friday 22nd December, 2017

rashidvali

[19:38](#msg5a3d5f3affa3e379196d11d3)Hi everyone. Just discovered Red and am very excited. Though cannot install it in Windows 10 - it opens a command prompt and stays forever; looks like Norton is blocking it: Auto-Protect is processing threads.

9214

[19:39](#msg5a3d5f74ba39a53f1a9178b8)@rashidvali welcome!

rashidvali

[19:39](#msg5a3d5f83232e79134d8060eb)thank you

9214

[19:40](#msg5a3d5f9ba2a87ea0215fa7e3)try again with AV turned off (if you're okay with that of course), lets see if something changes

rashidvali

[19:41](#msg5a3d5fccc072deaf0bf20970)OK, thanks, let me try

greggirwin

[20:36](#msg5a3d6ce3ba39a53f1a91bdbd)Some AVs don't like Red. We keep working to improve that by reporting false positives.

rashidvali

[21:27](#msg5a3d78b2c072deaf0bf289c0)Hi Gregg. I disabled Norton and installed red. When enabled Norton Back it kept complaining and removing ‘gui-console-2017-8-3-49893.exe’ even I added it to the Norton allowed list. It was complaining about ‘Heur.AdvMLB.’. Then at last at Norton fix action I chose ‘exclude’ and finally it left it alone. I can run the console now.

[21:28](#msg5a3d7900b48e8c356657cf81)any suggestions for a good start (examples etc).?

[21:29](#msg5a3d792a5355812e570a0345)and thank you 9214

RnBrgn

[21:30](#msg5a3d796be43a7a150c9798ff)@rashidvali Take a look at https://ungaretti.gitbooks.io/red-language-notebook/content/ and  
http://www.red-by-example.org/index.html

rashidvali

[21:31](#msg5a3d79ce232e79134d80dc4d)Thank you RnBrgn

[21:33](#msg5a3d7a360163b028106be091)by the way, does anyone know why red installation uses ‘Heur.AdvMLB.’ that Norton considers as harmful: "Heur.AdvML.B is a heuristic detection designed to generically detect malicious files using advanced machine learning technology. A file detected by this detection name is deemed by Symantec to pose a risk to users and is therefore blocked from accessing the computer. "

greggirwin

[22:08](#msg5a3d824c0163b028106c080a)Some AVs have known poor heuristics that they have not yet addressed. If you add tell them, too, it may help.

rashidvali

[22:16](#msg5a3d8441e43a7a150c97c831)thanks again Gregg

## Saturday 23th December, 2017

BooBSD

[13:14](#msg5a3e56c3c072deaf0bf5a68e)Hello. Do you plan to implement the Webassembly backend for Red?

pekr

[13:26](#msg5a3e597ee43a7a150c9ac0ba)That's the question for Red Team to answer, but my bet is, that @dockimbel has surely some plans in that regard in mind ...

9214

[13:26](#msg5a3e59960163b028106f077e)@rashidvali there's plenty of learning material both for Rebol and Red on \[github wiki](https://github.com/red/red/wiki/Learning-resources)

dockimbel

[14:34](#msg5a3e696b03838b2f2a2c4c23)@BooBSD Yes, but so far the plan was to start with an asm.js one, as it's quicker to do. Making a wasm backend for Red/System, is not a big deal, but making a DOM/JS/wasm backend for our GUI engine would probably require more work.

## Monday 25th December, 2017

codenoid

[04:45](#msg5a40825e232e79134d8bed9a)yeah baby

[04:45](#msg5a40826a232e79134d8bede7)Happy XMAS FOR ALL

## Tuesday 26th December, 2017

NYCheetah\_twitter

[08:18](#msg5a4205c6ba39a53f1aa297c2)When is the ICO?

KimRoach143\_twitter

[08:33](#msg5a420964b48e8c356668a1ba)@NYCheetah\_twitter https://www.investopedia.com/terms/i/initial-coin-offering-ico.asp go through this article

dockimbel

[10:38](#msg5a4226aeba39a53f1aa31878)@NYCheetah\_twitter Should be in January, we should announce the final dates after New Year.

shalabhc

[11:22](#msg5a4230ebba39a53f1aa34194)Hello all, is 'view supposed to work out of the box on Linux? (It doesn't)

WayneCui

[11:25](#msg5a4231ace43a7a150ca8ae9d)Anyone could explain this for me?

[11:25](#msg5a4231c7ffa3e379197f528b)

```
ta4-t: 1:1:1
ta4-t/hour: -1
--assert equal? ta4-t -0:58:59
```

[11:27](#msg5a42323effa3e379197f54cb)Maybe this is the answer:

[11:28](#msg5a423245e43a7a150ca8b08d)

```
>> 1:1:1 - -0:58:59
== 2:00:00
```

9214

[15:27](#msg5a426a76232e79134d934d21)@shalabhc no, currently Linux backend is highly experimental and considered to be work in progress

[15:30](#msg5a426afab48e8c35666a4d30)For everyone: Doc \[decided](https://gitter.im/red/red?at=5a42692a0163b028107e364e) to conduct a Q/A session, you can send your questions to me in PM or drop them here (or in any other room, just be sure to mention me with @9214 to ease the process), I'll then gather everything in a wiki page.

rashidvali

[19:01](#msg5a429c73232e79134d9435d5)thank you 9214, that is indeed a good place to start

gltewalt

[19:37](#msg5a42a513b48e8c35666b4fcf)@9214 What is the airspeed velocity of an unladen swallow?

9214

[19:40](#msg5a42a5adffa3e37919816947)@gltewalt could you please stay on topic? :)

greggirwin

[20:55](#msg5a42b72bffa3e3791981b5f0)@WayneCui, if you run those test lines in the console, what do you get? Looks OK here in an older build, so may be a regression.

coventry

[21:02](#msg5a42b8cbb48e8c35666ba87e)Is this the right forum to ask questions about RTC?

rebolek

[21:03](#msg5a42b91fba39a53f1aa5b4fa)@coventry https://gitter.im/red/blockchain

coventry

[21:04](#msg5a42b97203838b2f2a3cab9b)Thanks.

rebolek

[21:07](#msg5a42ba0ba2a87ea02173e1de)You're welcome.

## Wednesday 27th December, 2017

WayneCui

[08:55](#msg5a435ff05355812e57205f09)@greggirwin The test is fine, and I just wandered what is the meaning of the result ;-)

[09:00](#msg5a4361450163b02810821dc4)I thought the negative number means the clock hand move CCW

[09:11](#msg5a4363b703838b2f2a3f3372)Well, I see:

[09:11](#msg5a4363c0c072deaf0b0882ec)

```
>> 0:1:1 - 1:0:0
== -0:58:59
```

[11:14](#msg5a438090c072deaf0b09065b)I am confused with select/skip:

[11:14](#msg5a4380960163b0281082ab6f)

```
>> a: [2 3 5 test #"A" a/b 5 "tesT"]
== [2 3 5 test #"A" a/b 5 "tesT"]
>> select/skip a 5 2
== test
>> select/skip a 5 3
== "tesT"
>> select/skip a 5 1
== test
```

[11:15](#msg5a4380c8c072deaf0b090700)Anyone can help?

rebolek

[11:20](#msg5a4381e60163b0281082b226)@WayneCui `/skip` define size of record. So with `/skip 2`, you have `[2 3] [5 test] [#"A" a/b] [5 "tesT"]` and with `/skip 3`, you have `[2 3 5] [test #"A" a/b] [5 "tesT]`.

9214

[11:20](#msg5a4381f7c072deaf0b090bae)@WayneCui `skip` requires the size of one record in your block  
\* with size of `2`, first record is `2 3`, second one is `5 test`, etc

```
>> a: [2 3 5 test #"A" a/b 5 "tesT"]
== [2 3 5 test #"A" a/b 5 "tesT"]
>> select/skip a 5 2
== test
```

\* with size of `3`, it's `2 3 5` followed by `test #"A" a/b` and `5 "testT"`

```
>> select/skip a 5 3
== "tesT"
```

\* with size of `1` it seems to be identical to the case with size of `2`

[11:20](#msg5a43820ee43a7a150cae2170)@rebolek :eyes:

rebolek

[11:21](#msg5a438230edd2230811e1f520)@9214 I know. I am faster than @greggirwin and I am faster than you. I am Speedy Gonzales.

9214

[11:21](#msg5a43824eb48e8c35666eb2b1)@rebolek https://www.youtube.com/watch?v=\_ORHe0dhDW4

WayneCui

[11:52](#msg5a4389895355812e572117f9)@rebolek @9214 Wow, quick answers! How kindly you are😀

9214

[11:53](#msg5a4389a30163b0281082cf72)@9214 and fast :runner:

rebolek

[11:56](#msg5a438a565355812e57211b68)@9214 Ah, the good old Terrordrome, I feel like I'm 18 again.

9214

[11:57](#msg5a438ac303838b2f2a3fe346)@rebolek I miss this times because I was born too late :(

rebolek

[12:01](#msg5a438ba4e43a7a150cae4b57)So you are younger in more interesting time :)

## Thursday 28th December, 2017

haiitch

[09:36](#msg5a44bb2703838b2f2a44f790)Hello all, I'm taking a first look into Red

[09:36](#msg5a44bb350163b0281087e43d)Is there a git repo available for the source?

9214

[09:36](#msg5a44bb395355812e57264e45)@htrob hey there, welcome

are1000

[09:37](#msg5a44bb3d5355812e57264e56)https://github.com/red/red

haiitch

[09:37](#msg5a44bb46ba39a53f1aade460)That's pretty straightforward, eh? hahah

[09:37](#msg5a44bb48edd2230811e75168)Thank you

9214

[09:37](#msg5a44bb555355812e57264ebf)@rebolek could you look at that, @are1000 is faster than me (and you)! :P

are1000

[09:37](#msg5a44bb64c072deaf0b0e5479):tada:

[09:37](#msg5a44bb76ba39a53f1aade517)(I actually didn't know for sure, just guessed it :P)

[09:40](#msg5a44bbf8232e79134d9cfb15)@htrob btw, the best way to experience Red is to download the binary and play with the console!

haiitch

[09:47](#msg5a44bdcaedd2230811e75de0)Oh of course, I'm going to do that

[09:48](#msg5a44bdddb48e8c356674018b)Just considering whether Red is a good match for a project I'm starting

are1000

[09:48](#msg5a44bdfa5355812e57265aaa)If you want to share, we can definitely help you (with considering things)!

haiitch

[09:49](#msg5a44be0f5355812e57265afc)I'm building a type of non-www hypertext system

[09:49](#msg5a44be29ba39a53f1aadf01e)picking up from where others like Doug Engelbart and Ted Nelson left

[09:50](#msg5a44be4c5355812e57265c5f)and consciously trying to avoid a number of problems we're facing on the web

[09:51](#msg5a44bebec072deaf0b0e61cb)(adware, phishing, and really... even legal advertising, to boot)

[09:52](#msg5a44bec9edd2230811e76279)all of these problems are enabled by the client side architecture

are1000

[09:52](#msg5a44becd03838b2f2a450884)that would require drawing into the GUI, which Red easily can + parsing some data format, which Red excels at

haiitch

[09:52](#msg5a44bee6e43a7a150cb3701f)I took a look at the GUI intro, that's cool

[09:52](#msg5a44bef8c072deaf0b0e62b1)I'm already doing some fairly decent graphics using Go and OpenGL

[09:53](#msg5a44befdedd2230811e76327)so that's not what attracts me most

[09:53](#msg5a44bf0f0163b0281087f86c)I'm more interested about the Javascript replacement part

are1000

[09:53](#msg5a44bf1bb48e8c3566740681)?

haiitch

[09:53](#msg5a44bf31232e79134d9d0b4c)The kind of hypertext I'm trying to design won't have Javascript

are1000

[09:54](#msg5a44bf3c0163b0281087fa04)Isn't that just HTML?

haiitch

[09:54](#msg5a44bf4f29ec6ac3119118c9)but a different sort of paradigm for dynamic distributed applications will be needed

[09:54](#msg5a44bf58b48e8c3566740869)and that will require a language

[09:54](#msg5a44bf6229ec6ac3119119a4)I started out considering Forth and Lisp

are1000

[09:54](#msg5a44bf6903838b2f2a450b92)Why not Javascript tho?

haiitch

[09:56](#msg5a44bfd2232e79134d9d0f7f)Javascript is too complex, lacks namespaces, has limited data type support for integers and floats (the standards are improving, but the deployed base isn't)

[09:56](#msg5a44bfe7232e79134d9d0ff5)I thought of something a bit more lower level like Forth or Lisp

9214

[09:57](#msg5a44c00803838b2f2a450e24)@htrob FYI, Rebol (the predecessor of Red) is heavily influenced by Forth and Lisp

[09:57](#msg5a44c013232e79134d9d1138)and for low level stuff we have dedicated DSL called Red/System

haiitch

[09:58](#msg5a44c03aba39a53f1aadf988)Oh I have read about Rebol and it probably exists to fix the things Forth and Lisp got wrong

[09:58](#msg5a44c0405355812e5726670b)so that's why I'm here

9214

[09:58](#msg5a44c048232e79134d9d122d)like, very low level, down to stack/register manipulations

haiitch

[09:58](#msg5a44c0555355812e5726675d)I'm going to take a look at Red/System

9214

[09:58](#msg5a44c0605355812e572667c3)@htrob what they got wrong in your opinion?

haiitch

[09:59](#msg5a44c081b48e8c3566740d35)In Forth for example, you push parameters to the stack, then you call a word

9214

[09:59](#msg5a44c08503838b2f2a451085)I always was a Forth/Lisp wannabe but never had a chance to push myself and start to learn :)

haiitch

[09:59](#msg5a44c097ba39a53f1aadfb66)but there's no contract that lets the called word know what's the number of parameters it must accept

[09:59](#msg5a44c09c29ec6ac3119120a5)or how it has to clean up

[10:00](#msg5a44c0b3edd2230811e76ce9)every word has to know what to do, and if it doesn't, you create bugs

[10:01](#msg5a44c0e2e43a7a150cb37c0c)Postscript had a similar problem, and that made the NeWS GUI system (based on Display Postscript) a nightmare to debug when something went wrong

[10:01](#msg5a44c0f929ec6ac311912350)there is a convention among Forth programmers where they specigy

[10:01](#msg5a44c0fbba39a53f1aadfe8e)specify

[10:01](#msg5a44c10d03838b2f2a45139d)the parameters that a word can take as ASCII art in comments

[10:01](#msg5a44c111c072deaf0b0e6da9)right next to the word definition

[10:02](#msg5a44c131e43a7a150cb37da1)that may have been acceptable for small programs 30 years ago

[10:02](#msg5a44c1480163b028108805e4)but it's not a reasonable practice for a medium sized project in 2018

[10:03](#msg5a44c181232e79134d9d1826)anyway, I've been trying to avoid creating a new language

[10:04](#msg5a44c191edd2230811e77158)or operating major surgery on Forth

9214

[10:04](#msg5a44c195b48e8c356674123a)IIRC Factor used that convention to check number of arguments and their types, kinda of mini-DSL

haiitch

[10:06](#msg5a44c20eba39a53f1aae0463)Yes, Factor does that, and it's the other language I'm considering

[10:06](#msg5a44c22aba39a53f1aae04d4)Factor is more Forth like

[10:06](#msg5a44c2325355812e57267227)and Red borrows some from Forth and some from Lisp

9214

[10:07](#msg5a44c255ba39a53f1aae06bf)@htrob yes, but IMO Red is more actively developed that Factor, which is still on `0.97` (or is it `0.98`?) after, idk, 6 years or something?

haiitch

[10:07](#msg5a44c25d5355812e572672e8)I think the readability of Red is a big plus as well

9214

[10:07](#msg5a44c2635355812e57267366)there's still some activity in main repo though

haiitch

[10:08](#msg5a44c294232e79134d9d1e00)Are there any rough estimates when Red will achieve self-hosting?

9214

[10:08](#msg5a44c2aac072deaf0b0e74d8)@htrob no estimates, only speculations ;)

haiitch

[10:08](#msg5a44c2b903838b2f2a451c9f)What do speculations say? :-)

9214

[10:09](#msg5a44c2cf232e79134d9d1ee5)https://www.youtube.com/watch?v=0d6yBHDvKUw

haiitch

[10:09](#msg5a44c2f7232e79134d9d2005)hahah

[10:10](#msg5a44c2f9e43a7a150cb388e0)they do

[10:12](#msg5a44c3a5e43a7a150cb38cbd)The Red syntax seems simple enough that I could theoretically parse it and write a little interpreter in Go for the time being

[10:13](#msg5a44c3d20163b028108813cb)So all code should be more or less compatible

maximvl

[10:13](#msg5a44c3dc232e79134d9d2466)you will curse the operators, I promise :D

haiitch

[10:14](#msg5a44c3eac072deaf0b0e7992)By the time Red achieves self-hosting I may be able to replace the scripting engine with the Red compiler

[10:14](#msg5a44c40203838b2f2a452257)Is the operators precedence esoteric?

maximvl

[10:14](#msg5a44c413ba39a53f1aae0e6a)not esoteric, but it doesn't fall into a very simple overall precedence

[10:14](#msg5a44c423edd2230811e78049)also parsing is one thing, execution is completely another

[10:16](#msg5a44c481232e79134d9d2639)basically if you have `a b c d` you just go from right to left collecting arguments unless you hit a function

[10:16](#msg5a44c489232e79134d9d2657)then you execute a function

[10:17](#msg5a44c49c5355812e57267dc6)but with `a b + c d` it becomes way more complex

haiitch

[10:17](#msg5a44c4c6ba39a53f1aae1269)right, I saw this was discussed elsewhere earlier

[10:18](#msg5a44c4dc232e79134d9d27a0)some folks were wondering what were the compiler heuristics

maximvl

[10:18](#msg5a44c4fbedd2230811e78403)I'm writing a typed dialect with type inference and I don't support operators there :D

[10:18](#msg5a44c50b5355812e57268057)so it's only `+ a b`

haiitch

[10:18](#msg5a44c5100163b02810881a08)Is it going to be part of the main Red project?

maximvl

[10:19](#msg5a44c530ba39a53f1aae1457)can't tell, this is a subject to many things

haiitch

[10:22](#msg5a44c5dcba39a53f1aae16f0)I suppose I could avoid all that in "Redscript"

[10:22](#msg5a44c5ffe43a7a150cb399f3)maybe introducing the requirement that such expressions involving operators must be between { }

are1000

[10:23](#msg5a44c61803838b2f2a452b95){ } in Red are string delimiters btw

haiitch

[10:23](#msg5a44c625ba39a53f1aae1834)and work towards achieving eventual 100% compatibility

are1000

[10:24](#msg5a44c6500163b02810882111)so `{ hello world }` and `" hello world "` are the same (maybe you already know that, just making sure?)

haiitch

[10:27](#msg5a44c6f9ba39a53f1aae1ba4)I didn't. Anyway, some other syntax may be possible, no worries.

[10:27](#msg5a44c72cc072deaf0b0e89d7)Do double curlies have any special meaning? For example: {{ a + b + c }}

are1000

[10:28](#msg5a44c74b5355812e572689d0) &gt;&gt; {{ a + b + c }}  
\== "{ a + b + c }"

haiitch

[10:28](#msg5a44c75cb48e8c3566742e2b)Right.

[10:28](#msg5a44c767c072deaf0b0e8a76)Not convenient then

are1000

[10:28](#msg5a44c76aba39a53f1aae1e57)I am new to Red too, but as far as I know, you don't need to introduce new syntax

[10:29](#msg5a44c777ba39a53f1aae1eb4)you can just use blocks

[10:29](#msg5a44c77fedd2230811e791b1)with a function that handles them

maximvl

[10:29](#msg5a44c78129ec6ac311914316)blocks and strings are different

[10:29](#msg5a44c7a3ba39a53f1aae1f9d)`{}` just handles newlines and other special chars:

```
>> { abc
{    def
{    }
== " abc^/def^/"
```

[10:30](#msg5a44c7aab48e8c3566742ef6)think of it as `"""` in python

are1000

[10:30](#msg5a44c7b0ba39a53f1aae1fd3)but there was never a need for string in the first place? I think blocks would work here better (evaluating expressions)

[10:30](#msg5a44c7d3b48e8c3566743053)like `op [ a + b ]` would work, where `op` handles operators

maximvl

[10:31](#msg5a44c7eb0163b02810882758)for evaluation blocks are the way to go, it's just that other languages don't have a proper abstraction they use strings for code

are1000

[10:31](#msg5a44c7f00163b0281088276f)(maybe I'm not understanding everything correctly)

maximvl

[10:31](#msg5a44c7f7e43a7a150cb3a35f)@are1000 there is `math` dialect ;)

are1000

[10:31](#msg5a44c802ba39a53f1aae21ef)@maximvl of course there is :D

maximvl

[10:31](#msg5a44c80903838b2f2a453443)

```
>> 2 + 2 * 2
== 8
>> math [ 2 + 2 * 2 ]
== 6
```

[10:32](#msg5a44c82a232e79134d9d3827)you can do `source math` and study the code, it's super simple

are1000

[10:32](#msg5a44c82ee43a7a150cb3a426)so really, you could create a subset of Red and ditch the operators altogether

[10:32](#msg5a44c856c072deaf0b0e8f94)@maximvl I don't really get parse that much yet

maximvl

[10:33](#msg5a44c8645355812e57268ea7)@are1000 do you know what PEG is?

are1000

[10:33](#msg5a44c870b48e8c35667432b8)I do, I have written some grammars in PEG

[10:33](#msg5a44c87b0163b02810882b36)in PEG.js specifically

maximvl

[10:33](#msg5a44c886b48e8c35667432fd)ok, so `parse` is pretty much PEG with a few more features

[10:33](#msg5a44c895232e79134d9d3a1a)and it's integrated into the language and operates with blocks

are1000

[10:33](#msg5a44c897e43a7a150cb3a589)but in PEG you define rules

maximvl

[10:34](#msg5a44c89db48e8c3566743394)same in parse :)

are1000

[10:34](#msg5a44c8ba232e79134d9d3ad1)how would a simple grammar that parses `a + b - c` look?

[10:34](#msg5a44c8d2edd2230811e7985e)where `a` may be a single letter and operators are `+`, `-`, `*` or whatever?

[10:35](#msg5a44c8e1ba39a53f1aae247a)in PEG I could write:

[10:35](#msg5a44c9080163b02810882d4a)(skipping all whitespace)

maximvl

[10:36](#msg5a44c91229ec6ac3119149d0)

```
>> op: [ '+ | '- ]
== ['+ | '-]
>> parse [ a + b - c ] [ any [ word! | op ] ]
== true
```

are1000

[10:36](#msg5a44c92929ec6ac311914a06)

```
exp = exp op id | id op id
op = "+" | "-" | "*"
id = [a-z]
```

[10:36](#msg5a44c94bba39a53f1aae25f3)althought PEG would choke on what I have written since left recursion

[10:37](#msg5a44c95f0163b02810882fd6)

```
exp = id op exp | id op id
op = "+" | "-" | "*"
id = [a-z]
```

maximvl

[10:37](#msg5a44c9625355812e5726926d)yeah, `parse` would go into infinitive loop with it ;)

are1000

[10:38](#msg5a44c99103838b2f2a453a6e)ok, but from what I have seen, `parse` returns true which is useless for me

maximvl

[10:38](#msg5a44c9960163b02810883076)@are1000 take a look at more interesting example here: https://gitlab.com/maxvel/red-shell-dialect/blob/master/shell.red#L60

[10:38](#msg5a44c9ad5355812e5726947e)yes, by default

[10:38](#msg5a44c9bb29ec6ac311914c8b)but the trick is you can run arbitrary code inside parse

are1000

[10:38](#msg5a44c9bc29ec6ac311914c8d)how can I create AST from `a+b-c`?

maximvl

[10:39](#msg5a44c9fac072deaf0b0e9613)in a simple case you can just collect what's needed:

```
>> parse "ax-bx+c" [collect any [keep to copy c ["-" | "+" | end] keep c]]
== ["ax" #"-" "bx" #"+" #"c"]
```

are1000

[10:39](#msg5a44c9fe232e79134d9d4040)assuming that our leaf is `[ exp op exp ]` and `exp = id | id op id | id op exp`

[10:41](#msg5a44ca62b48e8c3566743b70)so `a+b-c` would be `[ #"a" #"+" [ #"b" #"-" #"c" ] ]`

maximvl

[10:41](#msg5a44ca680163b028108833ee)

```
>> state: copy []
== []
>> parse [ a - b + c ] [ any [ 'a (print "hello, I hit a") | 'b (append state 'b) | copy tmp skip (append state tmp)] ]
hello, I hit a
== true
>> state
== [- b + c]
```

[10:42](#msg5a44caaa03838b2f2a453f6f)@are1000 in your example if you put your staff into separate rules `collect/keep` would copy the rules structure

are1000

[10:43](#msg5a44cac729ec6ac311915093)is Parse similiar to what Rebol has?

[10:43](#msg5a44cacb5355812e572699bc)I must read into it

maximvl

[10:43](#msg5a44cacd5355812e572699be)yup

[10:48](#msg5a44cbf6b48e8c3566744234)seems somebody deleted Rebol tutorial on wikibooks?

[10:48](#msg5a44cbfde43a7a150cb3b645)@are1000 here's is the best guide: https://web.archive.org/web/20150510171128/http://en.wikibooks.org:80/wiki/REBOL\_Programming/Language\_Features/Parse/Parse\_expressions

9214

[13:02](#msg5a44eb6be43a7a150cb44c5b)@maximvl it isn't deleted, link changed

maximvl

[13:02](#msg5a44eb7f232e79134d9de52f)@9214 what's the new link? I couldn't find it on wiki

9214

[13:02](#msg5a44eb82edd2230811e844dc)https://en.wikibooks.org/wiki/Rebol\_Programming/Language\_Features/Parse/Parse\_expressions

[13:03](#msg5a44eb9729ec6ac31191eeb3)`REBOL_programming` :point\_right: `Rebol_Programming`

[13:03](#msg5a44eb9cedd2230811e84559)or something like that

maximvl

[13:03](#msg5a44eba6c072deaf0b0f38b3)ok, he moved it today after my request

9214

[13:03](#msg5a44eba75355812e57273bd8)but they forgot to update internal links

maximvl

[13:03](#msg5a44ebace43a7a150cb44d85)ah

[13:03](#msg5a44ebb1b48e8c356674e116)jeezuz

9214

[13:03](#msg5a44ebbe5355812e57273c3c)uh-huh

maximvl

[13:04](#msg5a44ebd1b48e8c356674e188)I wrote to a guy who was doing the move

[13:04](#msg5a44ebdde43a7a150cb44ecf)anyway the official language name is `REBOL`, no need to rename anything..

asampal

[15:58](#msg5a4514c181cd9a5d7ea22cfd)@maximvl , I'm pretty sure there was a general agreement (including Carl) to go with Rebol, more recently.

rebolek

[16:00](#msg5a45151cba39a53f1aaf9bc4)@asampal right, http://www.rebol.com/article/0525.html

haiitch

[18:06](#msg5a45329e5355812e5728b1c9)Can Red be built using R3 (open source) ?

rebolek

[18:06](#msg5a4532b0b48e8c3566763df5)Well

[18:06](#msg5a4532c1ba39a53f1ab03a21)it depends on what you mean by building

[18:07](#msg5a4532edba39a53f1ab03a96)R3 is written in C, so if running external compiler from Red using `call` is good enough, then yes.

haiitch

[18:12](#msg5a45340ce43a7a150cb5c56e)I don't mean to use R3 myself

[18:12](#msg5a45342b03838b2f2a474c17)Did I read correctly that Rebol 2 is needed to build Red?

[18:13](#msg5a45345003838b2f2a474c8a)And R2 is commercial software. I was wondering if Red could be built using R3 instead

[18:14](#msg5a453488edd2230811e9c3af)(even though R3 can't be built without the r3 make binary anyway... it's a circular problem)

9214

[18:49](#msg5a453cb8e43a7a150cb5ec6f)@htrob why not to use latest builds?

rebolek

[19:06](#msg5a45409d0163b028108a791a)@htrob for building Red, you need just free version of Rebol2.

[19:06](#msg5a4540c8b48e8c3566767ff6)@9214 latest versions are buggy

haiitch

[19:18](#msg5a45439a0163b028108a86da)It's important for legal reasons that I only use open source code

[19:19](#msg5a4543c0e43a7a150cb60aa6)(toolchain and all)

[19:20](#msg5a4543f9232e79134d9faabb)and Red can't bootstrap itself for now

[19:20](#msg5a45441229ec6ac31193b444)when Red becomes able to self-host, there won't be any binary dependencies

[19:20](#msg5a45441b29ec6ac31193b46c)so I'm trying to assess what's the best course of action

[19:22](#msg5a45445bb48e8c3566768f9d)My options are: 1) use Red as it is and wait until it self-hosts, or Rebol (if I'm going to be depending on binaries anyway)

[19:22](#msg5a45446429ec6ac31193b55c) 2) Use Factor instead, forget about binary deps

[19:23](#msg5a45449803838b2f2a47962e)3) Write a simple scripting engine that is a subset of Red. Still Red compatible, and keeping the door open to reuse any code I write.

[19:25](#msg5a4545210163b028108a8d5e)If I manage to achieve (3) I might even be able to use the IA-32.r architecture support code to compile some Red scripts.

[19:26](#msg5a454583232e79134d9fb2da)I really like the language and I think it will be better than using Forth or Lisp

rebolek

[19:30](#msg5a454649ba39a53f1ab0915f)@htrob If you have time and will to do it, `3)` seems best to me :)

are1000

[19:31](#msg5a454691b48e8c3566769bb6)I think that a small subset of Red written as a nice library would be a great addition to the open source community.

[19:32](#msg5a4546b503838b2f2a47a2e2)And of course I think that even few people would be interested in contributing

rebolek

[19:32](#msg5a4546d0e43a7a150cb6197d)Few basic types and `parse`? Would be nice, indeed.

are1000

[19:33](#msg5a45471c03838b2f2a47a5a1) You could even remove the hard parts like (previously mentioned) operators

rebolek

[19:35](#msg5a454776ba39a53f1ab09704)@are1000 Thanks to Red license, you can reuse lot of code for such project. It would be really interesting.

are1000

[19:37](#msg5a4547e203838b2f2a47a906)It would be like Red on detox :P

haiitch

[19:43](#msg5a454964edd2230811ea229c)Call it Redscript maybe. I think the PyPy compiler guys did something similar when they started

greggirwin

[19:52](#msg5a454b8d5355812e572921cc)@htrob, you are most welcome here. Many old R2 projects went along the lines you are thinking, and a number of us want to write a Red "browser". If you're using Go, maybe libRed would work for you, at least to experiment: https://doc.red-lang.org/en/libred.html

haiitch

[19:53](#msg5a454bbc0163b028108aaba8)Thank you Gregg

[19:54](#msg5a454bd8ba39a53f1ab0ac41)I've modestly started building a sort of descendant of the venerable Gopher

[19:54](#msg5a454bee29ec6ac31193da86)\[!\[gopherine01.png](https://files.gitter.im/red/red/welcome/u9wn/thumb/gopherine01.png)](https://files.gitter.im/red/red/welcome/u9wn/gopherine01.png)

[19:55](#msg5a454c2329ec6ac31193db8a)It still doesn't do much, I'm experimenting with scuttblebutt and ipfs network support, aiming to supersede http

[19:56](#msg5a454c58232e79134d9fd1dd)I'm designing a different sort of hypertext language, totally unrelated to the combo of html / css / js

[19:56](#msg5a454c8129ec6ac31193dd17)I have the language more or less defined for: content / layout / styling / linking

[19:57](#msg5a454ca9c072deaf0b1116ef)so I'm researching what can be done about the necessary dynamic programming bits

[19:58](#msg5a454cd05355812e57292783)I considered a declarative language that is not turing-complete to get started with

[20:00](#msg5a454d56b48e8c356676ba93)then I thought that a number of applications would still require computation on the client side, and I could have it both ways. Two dialects could be defined in Lisp to be used, one as declarative code, the other as dynamic, executable code.

[20:01](#msg5a454d84edd2230811ea3722)But I've been stuck with Forth and Lisp for various reasons, so that prompted me to look elsewhere, and some folks who used Rebol in the past suggested that I take a look at Red.

[20:03](#msg5a454e16b48e8c356676be45)Red / Rebol happens to have some of the best features of both Lisp and Forth, and has already solved some of the problems I had with those ages ago. For what I'm seeing for now it may well be a good choice.

greggirwin

[20:07](#msg5a454ef9e43a7a150cb63db0)Very cool @htrob. Looks nice. Using dialects is a great way to provide both ease of use and safety when giving users some level of control.

haiitch

[23:49](#msg5a4582feb48e8c3566779e29)I have a lot to learn, but so far so good

## Friday 29th December, 2017

haiitch

[15:58](#msg5a46661268d092bb6201aa96)@greggirwin libRed looks interesting. I'm going to explore whether using libRed is a viable approach for me in Go. I will likely try both approaches (implementing a Redscript subset in Go, and linking in libRed)

[15:59](#msg5a46665729ec6ac311989b84)I would probably have to tweak libRed to enforce security constraints, it seems worth the effort trying.

rebolek

[15:59](#msg5a466661edd2230811eec2ad):+1:

## Saturday 30th December, 2017

greggirwin

[02:55](#msg5a47001629ec6ac3119b2255)@htrob, as you eval what security you need, please make notes for the team. We don't have sandbox security and such in Red yet, so the design is still open enough to consider needs, especially since libRed is a new model.

haiitch

[10:31](#msg5a476b1f84fb74b9401b525e)Thank you Gregg. I'll make sure to take notes

[12:21](#msg5a4784bb84fb74b9401bac1d)My platform of choice is primarily Linux

[12:21](#msg5a4784e3edd2230811f30dde)I notice that the Red GUI and drawing bits aren't available in the official Linux builds

[12:22](#msg5a47850d68d092bb6205e20d)Is anybody making full builds for Linux?

[12:22](#msg5a47851eedd2230811f30e96)Or, is there a guide on how to build the whole thing on Linux?

[12:23](#msg5a478555ba39a53f1ab988c1)(even if it's buggy and pre-alpha quality, that will be far more convenient for me than procuring Windows)

rebolek

[12:24](#msg5a47856368d092bb6205e2e7)@htrob Building on Linux works just fine, if you can live without GUI (I am on Linux).

[12:24](#msg5a47857f84fb74b9401bae97)Also, you can take a look at https://toltex.u-ga.fr/RedGtk

9214

[12:24](#msg5a47858884fb74b9401baead)official Linux backend is experimental, though there's a community effort to bring useful GTK backend

haiitch

[12:24](#msg5a47858ab48e8c35667faf4a)Precisely, I'm asking if there's any way to have a full Linux build, with GUI stuff included

[12:24](#msg5a47859403838b2f2a50a448)Oh I'm going to take a look, thank you

[12:27](#msg5a47862a232e79134da8cbd8)I kind of assumed that GUI development was a unified effort

9214

[12:31](#msg5a478705ba39a53f1ab98ed8)@htrob Red team doesn't have enough resources to develop another backend before 1.0 release, Mac one was already time-consuming and slightly delayed initial roadmap.

rebolek

[12:33](#msg5a4787a75355812e57321ab7)When RCT is out, we can change it with our votes ;)

9214

[12:34](#msg5a4787bc5355812e57321b3c):moneybag:

pekr

[12:43](#msg5a4789f70163b02810939353)@rebolek it depends, if our votes will have enough of power against the will of big investors, no?

rebolek

[12:49](#msg5a478b6c5355812e573227ef)Then let's hope that some of big investors need Linux GUI too :)

KimRoach143\_twitter

[12:56](#msg5a478ce00163b02810939f09)Mac too 😉

haiitch

[13:10](#msg5a47903d29ec6ac3119d2504)I don't really need it, I only wanted to run the examples

[13:10](#msg5a47906303838b2f2a50cdeb)I was already writing my own GUI thing in Go anyway

[13:11](#msg5a47908403838b2f2a50ce72)so the best course of action for me is probably keep going with my current project

[13:11](#msg5a47908b84fb74b9401bd778)and try to incorporate libRed

[13:12](#msg5a4790b4edd2230811f33c90)or implement a reduced subset of Red as a scripting engine

[13:13](#msg5a47910f29ec6ac3119d2837)I may also adopt Red object notation and paths, instead of JSON

[13:14](#msg5a47915129ec6ac3119d28d9)most of the web uses json, but it's not an excellent standard, it only exists because of Javascript

gour

[17:45](#msg5a47d0a403838b2f2a51d873)@htrob what do you use for GUI in Go?

[17:47](#msg5a47d1415355812e57334e26)i just read latest blog \[post](http://www.red-lang.org/2017/12/leaping-into-future-red-goes-blockchain.html) and wonder what implications it would have on issues like 64bit support, Linux support etc.

greggirwin

[21:42](#msg5a48083e232e79134daade16)@gour, we hope it will mean more resources, and the ability to reward and encourage community efforts. We \*know* it will mean the core team focusing on the blockchain target for a while. Feature development will be prioritized based on those needs, and what backers want.

## Sunday 31st December, 2017

gour

[09:07](#msg5a48a8e3b48e8c356683d529)@greggirwin thank you for reply...i am not sure what to think about it. personally do not have much interest in blockchain stuff and not sure that is smart move in general. otoh, for many developers and potential new Red users 64bit &amp; Linux support is usually taken for granted. however, i understand that :moneybag: sets the rules, but have a feeling it won't be be good for Red (language)

rebolek

[09:12](#msg5a48aa18edd2230811f74943)@gour let's hope that :moneybag: will get us closer to 64bit and Linux GUI (writing this on 64bit Linux machine).

gour

[09:18](#msg5a48ab645355812e57364faf)@rebolek i was seriously interested in Red, but lack of those two things put me off...i still consider there is great potential in Red...right from the simply utility scripts to the full-fledged desktop apps (i simply despise JS-crap being used on the desktop), but seeing that those features are still not there and that, afaict, development is general seems a bit slow with uncertain schedules, i do not know whether it is safe to bet on Red and spend time learning it :confused:

[09:21](#msg5a48ac35ba39a53f1abda360)see e.g. this \[interview](https://notamonadtutorial.com/interview-with-nenad-rakocevic-about-red-a-rebol-inspired-programming-language-681133e3fd1c) and feature-estimations...

[09:22](#msg5a48ac6903838b2f2a54d567)"We aim at launching the 1.0 release in 2016." :worried:

rebolek

[09:26](#msg5a48ad30b48e8c356683e631)@gour let's see how the ICO turns out, we should know more in a month or two.

[09:26](#msg5a48ad4bedd2230811f75550)To be fair, it's hard to estimate time in SW development ;)

gour

[10:01](#msg5a48b56984fb74b9402012ed)@rebolek i agree, but i'm afraid whether we're going to have 64/bit/linux support ready even in 2018...

[10:02](#msg5a48b5b2b48e8c356684032c)personally, i do not have Mac OS machine nor access to Windows - my last license was for Win XP, which leaves me with 32bit only and no GUI :worried:

rcqls

[10:17](#msg5a48b92c29ec6ac311a15733)Hi @gour, what about helping in the GTK branch. It is what I did (for two months this summer) even though I am now mostly a macOS user.

gour

[10:23](#msg5a48ba95ba39a53f1abdd6ca)@rcqls what skills are required for that (besides GTK) ? Red/system? something else?

rcqls

[10:26](#msg5a48bb43b48e8c3566841740)@gour Yes! see https://toltex.u-ga.fr/RedGtk

[10:27](#msg5a48bb9329ec6ac311a15e71)I made a stop because of an issue with layout placement.

9214

[11:05](#msg5a48c46cba39a53f1abdfa6b)@gour 1.0 in 2016 and 1.0 as it is considered now are apples and oranges. Hopefully upcoming article will clarify that.

gour

[11:25](#msg5a48c91e68d092bb620a6d8a)@9214 probably...but from the perspective of someone not interested for blockchains etc. maybe it's better to focus on some other language/environment (e.g. Racket) than to wait for Red...shift of focus certainly has trade-offs and will bring some new people in and drive some out...

9214

[11:28](#msg5a48c9d703838b2f2a5545d5)@gour that decision comes at a cost, and @dockimbel clearly understands that, so am I and other community members - we need to "ride the hype wave" and occupy a vacant market niche in order to gain a solid ground and keep Red project alive from financial perspective, but for that we need to pay the price of slower development of core parts and derailing of initial roadmap.

[11:32](#msg5a48cae984fb74b94020643e)@gour and I don't think that lack of things you've mentioned should stop you from learning Red, basic concepts and ideas are independent from technical details, take your time to study them and decide for yourself if it's worth waiting

[11:39](#msg5a48cc7268d092bb620a788d)and I doubt that community will lock itself in blockchain, let me copypaste my response from HN discussion  
&gt; you don't really need to be interested in blockchains and stuff (personally I don't) to participate in community and programming with Red, there's lots of other things to play with (metaprogramming, language-oriented programming, reactive programming, data-driven programming, parsing, DSL and eDSLs, baking cross-platform GUIs, system programming with Red/System).

KimRoach143\_twitter

[11:41](#msg5a48ccf6b48e8c3566845636)@9214 I agree I came here because of cross-platform gui without any dependency I will stay and invest in this project.

[11:42](#msg5a48cd11edd2230811f7c5fe)My personal choice 😉

pekr

[11:45](#msg5a48cde384fb74b940206e2a)@gour Your estimation for 64 bit not being available in 2018 might be valid. Well, at least if my understanding of the topic is correct, which might not be the case. My understanding is, that 64 bit support is planned after the compiler rewrite, which means after the 1.0? Maybe others will correct me. Who knows, maybe priorities will change in that regard ....

9214

[11:46](#msg5a48ce1903838b2f2a55560e)@pekr yes, AFAIK 64bit support is planned after bootstrapping phase is completed, i.e. then team starts to rewrite Red in Red itself

gour

[11:47](#msg5a48ce34232e79134dad812d)@9214 thank you for your input...my gut feeling is that the current economy based on the money-created-out-of-thin-air cannot survive on the long run and will collapse sooner or later. yes, it can be profitable in the short term and possibly/maybe attract required funds, but there should be long run vision ready

pekr

[11:48](#msg5a48ce73ba39a53f1abe1dfc)Then you have to exchange your Bitcoins for "real money" sooner than the bubble bursts :-)

9214

[11:48](#msg5a48ceaa03838b2f2a555848)@gour we all have our doubts ,let's just see how it turns out ;)

gour

[11:49](#msg5a48cedc5355812e5736ce54)@pekr yeah. i use 64bit distro for quite some time and actually not sure how many of major distros still provide 32bit versions...don't worry, i just have some insignificant amount of bitcoins which i bought to pay for some sw license (android) not wanting to deal with paypal

KimRoach143\_twitter

[11:50](#msg5a48cf2203838b2f2a5559bc)@gour Yes you know what I said when I came here it will take at least 3 years to reach red 1.0 based on the current development time line

gour

[11:51](#msg5a48cf3a68d092bb620a8307)@9214 sure. we can only speculate about the future or use some 'divination' to get an insight...for now i use only first method and conclude based on my superficial monitoring of what is going on with Red

KimRoach143\_twitter

[11:51](#msg5a48cf5b84fb74b94020734f)but it can change if we get enough money 💰 💵 💷 😉

9214

[11:52](#msg5a48cf8629ec6ac311a1aa2e)slowing on one side means speed up on another, there's already some activity in concurrency and network I/O support (on Windows for now), since blockchain requires them

gour

[11:52](#msg5a48cf9384fb74b94020742e)@KimRoach143\_twitter when did you show up here for the first time? speed of the timeline changes was the reason i post-poned my interest in Red a bit and looking at other places...which provide stuff \*\*today\**

pekr

[11:55](#msg5a48d03984fb74b9402075ed)@9214 Thread support for POSIX was pushed 1 day ago, so not only for Windows :-)

KimRoach143\_twitter

[11:55](#msg5a48d04903838b2f2a555d8d)in July and for today I have 🐍 and Delphi, on site http://www.red-lang.org as you can seed it started in2011 and now its almost 2018 that was my gustation

9214

[11:57](#msg5a48d0a85355812e5736d41c)@pekr https://inception.davepedu.com/

meijeru

[12:48](#msg5a48dcb8b48e8c35668495d4)@pekr Thread support for POSIX was pushed?? In which branch, please? Did not find it in red/red nor in qtxie/red.

pekr

[13:05](#msg5a48e09603838b2f2a559a79)@meijeru qtxie/ev ... but I think, those are just basic wrappers, not sure it is going to do anything useful yet ...

greggirwin

[17:45](#msg5a49225203838b2f2a56acf7)Red has costs, and takes more time, because one of its main priorities is to avoid external dependencies. Always a tough call, because we have to rebuild wheels (not fully reinvent them though), but using other pieces has its own cost.

When targeting platforms, and trying to become self sustaining, it makes sense to pick those where you have the best chance of finding paying customers.

gour

[18:18](#msg5a4929d929ec6ac311a32247)i can understand it and fully agree with it. otoh, i arrived to Red in search for nice language with decent multi-platform capabilities for writing desktop gui apps...cross-compiling, small runtime etc. are great add-on features in Red, but i must admit that i also like what i see in e.g. Racket which does miss some of the Red stuff, but deliver today

gltewalt

[18:25](#msg5a492bb35355812e57385d4d)What’s funny to me is that I ball at trying out new languages that make me separate items in a list by comma

[18:26](#msg5a492bc10163b02810998abf)\*balk

gour

[18:33](#msg5a492d62b48e8c356685e83e)@gltewalt so, Python is out, Racket in :smile:

gltewalt

[18:34](#msg5a492dbc5355812e5738670d)Lispy ones and Rebol, Red - yep

gour

[18:35](#msg5a492dd784fb74b94021fd83):+1:

greggirwin

[19:00](#msg5a4933c5ba39a53f1abfc649)&gt; cross-compiling, small runtime etc. are great add-on features in Red

@gour, they are not add-on features, but fundamental ones. I have Racket installed and have ~500M and ~22K files before doing anything. It has also been around for over 20 years and I imagine got some funding because it's a Scheme, which was used for teaching. Not saying you're wrong in any way, because you're not. It's just comparing ants to eleph-ants. ;^)

gour

[19:06](#msg5a49352f29ec6ac311a3527a)@greggirwin s/add-on/additional (extra) features available inRed which are not present in Racket/

greggirwin

[19:07](#msg5a49355584fb74b940221a7f)Ah, I see what you mean now. Thanks for clarifying.

gour

[19:08](#msg5a4935a729ec6ac311a35393)otoh, i worry if Red won't miss some trains due to delay while changing focus...eg. Nim language was supposed to have 1.0 release before Rust and many people simply not care enough for pre-1.0 products

greggirwin

[19:09](#msg5a4935da84fb74b940221ca6)What train might we miss? Most are already running. The blockchain train is just leaving the station.

gour

[19:09](#msg5a4935ebb48e8c3566860ad9)heh...

[19:10](#msg5a493613b48e8c3566860b65)it is questionable how long is the trip with the blockchain train :wink:

greggirwin

[19:11](#msg5a49364bba39a53f1abfcea0)Or whether hitching to the blockchain train will give us momentum, and then we can move cars to other tracks.

gour

[19:11](#msg5a493654b48e8c3566860d4e)i hope/wish you are on the right one

greggirwin

[19:11](#msg5a4936565355812e57388946)I like this metaphor. :^)

BeardPower

[19:20](#msg5a4938930163b0281099bb87)Red needs some "killer apps" to show it's awesomness. If developers see what can be achieved with it, they will be interested. I recently tested some software wallets like Exodos. It uses 300MB of RAM just for some fancy UI and some wallet/BC code. This is ridiculous. The same app can be pulled of in Red using only 10MB of RAM with fast time to market and native cross-platform support. This is nothing short of amazing!

[19:22](#msg5a4938f35355812e57389520)The Red/CCC will be in the same category.

greggirwin

[19:23](#msg5a49393e03838b2f2a570bdd)People are funny @BeardPower. Rebol has many of the same advantages of Red, though not all the capabilities of course. The base language is the same. And people don't get it for some reason. I shake my head when people see things I've built, and are amazed at the power and clarity, but then never use it.

gour

[20:28](#msg5a4948540163b0281099f405)but, didn't Rebol failed due to licensing issue?

[20:28](#msg5a49485aedd2230811f9cbee)\*fail

greggirwin

[20:29](#msg5a494896ba39a53f1ac010d8)No single reason.

gltewalt

[20:32](#msg5a494953edd2230811f9d06e)Competed with Python, Ruby, Perl around the same time - all open source. Not especially OO (or not traditional class-based OO), which was the craze at the time. Syntactically farther away from Shell and C than Perl. Huge marketing push for Java and Applets.

[20:32](#msg5a49495c29ec6ac311a39891)^ My guesses

gour

[20:33](#msg5a4949a484fb74b940226690)it seems that atm Red could replace (for my usage) e.g. need for Python for simple scripting, iow. writing simple utilities not requiring extensive set of libs, but for other things, 64bit and (Linux) GUI would be most welcome

gltewalt

[20:34](#msg5a4949d95355812e5738d5f4)Easy to lose sight of the Red goal. Full Stack, single toolchain

9214

[21:53](#msg5a495c4503838b2f2a57871a)@gour in any case, if you'll choose Racket other Red, please take your time in the future to tell us which of its features, in your opinion, Red should adopt, and how they could be done better. Two major ones that come to mind is integrated IDE and rich macro system with language/DSL creation capabilities.

greggirwin

[22:23](#msg5a49637c84fb74b94022c6cd)@9214 +1

RnBrgn

[23:36](#msg5a497491ba39a53f1ac0a9cd)I always thought Red would and could dominate in the IOT / Raspberry Pi market. Python seems to have taken the lead here. If developers in this market could see the simplicity of Red, the GUI engine and the fact it can compile to an executable and its small foot print, Red would explode.  
imagine creating an app on a Raspberry Pi that compiles to an executable under 2MB , with an easy GUI dialect and then create an app on an Android device, using the same programming language, that can control your Red app on the Raspberry Pi. If you want Red to take off. This is where its at.

[23:51](#msg5a4977ff232e79134db018a0)https://developers.slashdot.org/story/17/12/30/1715210/blockchain-brings-business-boom-to-ibm-oracle-and-microsoft
