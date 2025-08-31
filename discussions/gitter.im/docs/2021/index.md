# Archived messages from: [gitter.im/red/docs](/gitter.im/red/docs/) from year: 2021

## Friday 1st January, 2021

gltewalt

[00:05](#msg5fee6731ac9d8e7463e25e36)Can you think of a list of common tasks?

greggirwin

[19:50](#msg5fef7d1c2084ee4b7886486e)Let's start one. We can use wiki page, you can I can prime it, and we can post on the main channels for others to contribute.

## Monday 4th January, 2021

gltewalt

[01:45](#msg5ff2732ade608143155e824e)Humbly ask for your additions to a "common tasks" list that I've started in the Wiki.

https://github.com/red/red/wiki/%5BHOWTO%5D-How-Do-I-Do-X-with-Red%3F

greggirwin

[02:51](#msg5ff282ab22f12e449b2c8ac7)I made a list at the bottom. One of the keys to helping people find answers is using language they know. Then we can teach them our nomenclature. e.g. we think of reading URLs, but the rest of the world things of making HTTP requests.

mikeparr

[08:52](#msg5ff2d76ace40bd3cdb1de73d)@gltewalt as regards tasks, there is some Red material in the Rosetta Code site at https://rosettacode.org/wiki/Category:Red This site lets readers investigate tasks in a range of languages. Some of the tasks are bigger than we want here, I think, but some are small - e.g. read a file

gltewalt

[14:54](#msg5ff32c418bb7347469729261)Ah, ok

greggirwin

[19:49](#msg5ff37147dbb17f28c5bbb10b)We have RC in our advocacy list. Filling in entries there is valuable as well.

## Tuesday 12nd January, 2021

meijeru

[09:28](#msg5ffd6bda14cec811ec92e050)I have submitted an issue on `refinement.adoc`which is part of a more general difficulty with the `all-word!`literals. @toomasv pointed out that my treatment in the spec document is now seriously flawed, because the specs for `any-word!` vs `issue!` and `refinement!` literals have significantly diverged. This is now a question of balancing the desire for allowing as much variety as possible, vs. consistency and ease of remembering. If one spells out the allowed characters in detail for each of the types, it becomes painfully obvious (e.g. `##` is allowed, but `/#` is not, `#,` is not allowed, but `/,` is ).

greggirwin

[16:48](#msg5ffdd2cfdc2e4809aa1a3160)Thanks @meijeru.

## Wednesday 13th January, 2021

loziniak

[10:38](#msg5ffecdaee578cf1e95e5d978)Perhaps a "Getting help" paragraph would be nice to have in this HOWTO?

meijeru

[11:30](#msg5ffed9d65562a61e9aa1fc3d)This is now the spec of as deduced from the lexer FSM:

```
An `<issue-literal>` consists of `#` followed by a sequence of one or more characters.
It is delimited by end-of-text, whitespace, semicolon, or any character from the set `[ ] ( ) { } " < @` .
Note that any of `[ ( { "` preceded by `#` introduces a (grouped) value of another type than `issue!`.

Restrictions: `/` is only allowed as first character of the sequence, while `<` `>` and `,`
are only allowed if they are *not* the first character.
Also, the combinations `<>` and `<…​>` with any characters in between the `<` and `>`
characters are not allowed anywhere in the sequence.
```

Is this what the designers wanted?

[11:37](#msg5ffedb6fe578cf1e95e5fb6c)For instance, what use is the fact that `#/` is allowed but no other issue literal with `/` in it is allowed?

[11:38](#msg5ffedbd0787d8f79c8fc2d61)More to come on refinements later.

[13:26](#msg5ffef4f503529b296be98844)Here is my draft for

```
A `<refinement-literal>` consists of a `/` followed by a sequence of one or more characters,
 It is delimited by end-of-text, whitespace, semicolon,
 or any character from the set `[ ] ( ) { } " @ : /` subject to the exceptions below.

A `/` followed by one or more `/` and possibly further characters is not
a `<refinement-literal>` but a `<word-literal>`. This is delimited by the above-mentioned
 delimiters and also by `#`. The same goes for a single `/` before any of these delimiters,
except obviously `/`. See further <<word,section 5.2.5>>.
```

[13:28](#msg5ffef565252c0a6ded09d82e)I have also found an issue in refinement lexing.

[14:01](#msg5ffefd5603529b296be9a117)The issue is not an error but a confusing consequence of the spec: `//a/b` is a regular `path!` value since the path "head" `//a` is lexed as a word. I would guess that most people confronted with the question: is`//a/b` a valid Red value and what is its type?, would have difficulty analyzing it. Or am I the only one?

greggirwin

[17:55](#msg5fff3403252c0a6ded0a8217)@loziniak do you want to take a crack at an intro for that page? Even just some TBD notes about what you'd like to see there would help.

Oldes

[20:25](#msg5fff575191e9b71badd480f9)@meijeru in Rebol `//a` is an invalid construct... maybe it should be also in Red.

## Thursday 14th January, 2021

greggirwin

[02:08](#msg5fffa7a881c55b09c707d209)@meijeru I'm going to respond with thoughts, just can't do it quickly like some other things here, as you raise issues that require more thought.

meijeru

[09:09](#msg60000a394498e01bbfa85598)For the time being, I will update the spec document to reflect the current, rather messy, state. I doubt that, even after some modifications in the lexical space, the spec will be able to go back to its original, rather neat formulation using .

GiuseppeChillemi

[11:30](#msg60002b6a9632f63d8717cbf2)I have read that `/a/b` is lexed as 2 refinements. I like the idea of \*headless/rootless* paths to later join `WORD /a/b`and have `word/a/b`. This would make relative paths a breeze.

[11:39](#msg60002d6bfe007479e40f4f05)Also, while exploring "relative paths", I have really missed a way how to have the first word reduced like:

`(a)/x`  
but Red does not allow it.

```
a: 'x
x: [y z]
(a)/y
== /y
```

[11:42](#msg60002e1fcd31da3d9ab031c1)Also this is not what I expect:

```
a: 'x
Rejoin [to-path a /y]
== x//y
```

[11:43](#msg60002e5581c55b09c70924cd)I have expected `x/y`

[11:53](#msg600030bad5f4bf2965e6c0c2)Also this does not work:

```
x: [y [z ww]]
a: 'y/z
x/(a)
== none

>> x/y/z
== ww
```

[12:00](#msg6000325d5562a61e9aa5664c)The whole application scenery would be to have the relative structure of a data object stored like this:

```
mystruct: [
   size: /heading/size
   body: /body
   extra: /footer/extra/
]
```

So you can access the parts of your data building the path as follow:  
`DATA/(mystruct/size)`  
Which would be reduced to:  
`data/heading/size`  
Or for full relativeness of paths:

`(DATA)/(mystruct/size)`

Oldes

[14:20](#msg6000534414cec811ec9a5a67)`/a/b` would have to be a new datatype which now even don't have a name... or you would have to kill `refinement!` datatype like HF did in Ren-C and have `/a` as a `path!` (but that is a `block!` type, not a `word!` like `refinement!`)

[14:25](#msg60005468252c0a6ded0d645c)But to be honest... I don't think that having `/a` to be a path with length of 2 and actually using blocks in function specification in place of refinements as it is in Ren-C (now - it can be changed in any hour) is a good way.

rebolek

[14:26](#msg6000548fd5f4bf2965e72345)Please, no. HF doesn't understand Rebol so he decided to rewrite it and with each change he finds out he did something wrong so he needs to change it later to even more arcane construct... Ren-C has no documentation because it can't. It's always a moving target, it's impossible to document it.

[14:26](#msg600054ae9632f63d87183f2c)@Oldes why do you think it makes sense?

Oldes

[14:27](#msg600054c299549911fc203aa2)Have I said that it makes sense?

rebolek

[14:27](#msg600054dbfb85d46e04e0124d)@Oldes Oh sorry, I read it as "I think"

[14:28](#msg60005505fe007479e40fbf92)I need to use a bigger font I guess :)

Oldes

[14:29](#msg60005550252c0a6ded0d66a1)@GiuseppeChillemi why you think that:

```
mystruct: [
   size: /heading/size
   body: /body
   extra: /footer/extra/
]
```

is better than:

```
mystruct: [
   size:  heading/size
   body:  body
   extra: footer/extra
]
```

GiuseppeChillemi

[15:42](#msg6000666d4498e01bbfa9578f)@Oldes No particular reason, just to have a way to identify it has a "path with a missing part", but \*you are right\*, it would make no difference!  
The most important part to me is the ability to use `()` on any segment of the path because actually we can't.

```
>> x: [y z [d r]]
== [y z [d r]]
>> x/('z/d)
== none
```

The notation `(WORD|PATH)/(WORD|PATH)` is a very powerful one to have an absolute flexibly on the selection of elements.

[15:43](#msg600066aa252c0a6ded0d9bc1)@greggirwin Do you think I could make a request for it?

Oldes

[15:54](#msg6000693503529b296bed5a31)What you don't see is how expensive such a code is internally.. and also dangerous, if you do some complicated code inside the parenthesis. I remember how Carl was long time refusing to implement it in Rebol.

[15:59](#msg60006a6214cec811ec9aa1ae)You could also play with code like:

```
>> p: as path! [a b/c d]
== a/b/c/d
>> length? p
== 3
>> p/('b/c)
== d
>> to block! p
== [a b/c d]
```

GiuseppeChillemi

[16:14](#msg60006de24498e01bbfa96e0e)Oldes, I can see it and I can understand the fears you have but I use the `WORD/(code)` syntax every single day and believe me, it makes things a lot easier if properly used. Allowing `(code)/(code)` in paths would give \*extreme power* to this selector in all its simplicity.

[16:17](#msg60006ea75562a61e9aa615bf)(A personal note, I consider this feature the second most powerful thing after `parse`).

Oldes

[16:22](#msg60006fc581c55b09c709e31c)`(code)/(code)` (as a path) is a nonsense... you would not be able to write `(1 + 1)/(2 * 2)`

[16:26](#msg6000709f252c0a6ded0dba80)And I don't have any fears ;-) I have nothing against `word/(index + 1)`. I was requesting it in Rebol to be implemented years ago... I just see also the dark sides. Occasionally.

GiuseppeChillemi

[16:26](#msg600070a191e9b71badd75992)I see, but if there could be a solution, I think it's whort trying to find it.

Oldes

[16:27](#msg600070e391e9b71badd75a83)Every solution has its price and sometimes the price is too high. But go ahead and make a wish ;-)

GiuseppeChillemi

[16:37](#msg6000734603529b296bed7678)@Oldes  
&gt; `(code)/(code)` (as a path) is a nonsense... you would not be able to write `(1 + 1)/(2 * 2)`

`/(code)/(code)` could be a road to this but how to make it without disturbing refineents ;-)  
Also, I think it is now time to move elsewhere, I propose \[red/red](https://gitter.im/red/red)

Oldes

[16:41](#msg6000742ffb85d46e04e06fca)I don't think it should be more discussed in chat.. write a wish and you get it refused most probably... `/(code)/(code)` is imho ugly even without long expressions and I don't see any real usage why it should complicate everything.

[16:44](#msg60007505d5f4bf2965e77dd9)Btw... If you want to feed your brain, you can start here: https://www.curecode.org/rebol3/ticket.rsp?id=2094

GiuseppeChillemi

[17:53](#msg600084fc787d8f79c8008fce)@Oldes In fact it is not LONG and COMPLICATED CODE the target use but a simple thing like: `(word)/(idx)/(word-reduced-to-path)`. Nothing more simple and powerful than this!

[17:54](#msg6000854b4498e01bbfa9b9ff)To the Red team, if they will like it, to find a way to do this.

toomasv

[17:55](#msg6000857a81c55b09c70a2537)@GiuseppeChillemi Why not make your local adjustments, something like:

```
>> path: function [a b][to path! append to block! a to block! b]
== func [a b][to path! append to block! a to block! b]
>> length? probe path 'a 'c
a/c
== 2
>> length? probe path 'a/b 'c
a/b/c
== 3
>> length? probe path 'a/b 'c/d
a/b/c/d
== 4
>> length? probe path 'a 'c/d
a/c/d
== 3
>> length? probe path 'a [c d]
a/c/d
== 3
>> length? probe path [a b] [c d]
a/b/c/d
== 4
```

Or go even further:

```
>> //: make op! :path
== make op! [[a b]]
>> [a b] // [c d]
== a/b/c/d
>> 'a // 'c/d
== a/c/d
>> 'a // (to path! [c d e f])
== a/c/d/e/f
```

GiuseppeChillemi

[17:57](#msg6000860e4498e01bbfa9bd0c)Isn't `//` already used?

toomasv

[17:58](#msg6000865c99549911fc20d786)If you use mod, then yes, just add one more `/` :)

Oldes

[17:59](#msg60008666e578cf1e95ea6ad8)@GiuseppeChillemi you should be aware that Red in not in version 2.0.0 and that even that if you want to use just `word/(code)`, someone must solve a lot of complicated situations, because soon or later there will come someone who starts with:

```
p: [] p/(loop 100 [append p random 100] random 100)
```

and will continue until it starts to make problems, which someone else must again solve for you.

[18:00](#msg600086bedc2e4809aa214a57)Still don't see any real use for `(code)/(code)` pattern. Which would be so important that we would have to reconsider complete code evaluation.

[18:03](#msg60008755d5f4bf2965e7b256)Especially when `(code)/(code)` can be written in a Redbol way like: `pick (code) (code)`

GiuseppeChillemi

[18:05](#msg600087dd787d8f79c8009921)Think about some series sharing the same structure and stored in different words:

```
mystruct: [
   size:  heading/size
   body:  body
   extra: footer/extra
]

foreach series [s-one s-two s-three s-four] [
  Print ["Size is:" probe (series)/('mystruct/size)]
]
```

Oldes

[18:05](#msg600087df9632f63d8718e20b)Not mentioning that someone must also write a compiler to support this \*\*theoretical\** code pattern. :/

GiuseppeChillemi

[18:10](#msg6000890a5562a61e9aa66285)And if you have multiple elements which have the same row structure:

```
foreach series [s-one s-two s-three s-four] [
  repeat idx length? series [
     Print ["Size is:" probe (series)/(idx)/('mystruct/size)]
  ]
]
```

Oldes

[18:14](#msg60008a1de578cf1e95ea7925)Just write a wish and forget it... because I don't believe it will happen! Or you can talk to HF.. which will figure out something.. he has open mind for \[such a requests](https://www.curecode.org/rebol3/ticket.rsp?id=2178)

GiuseppeChillemi

[18:25](#msg60008c7c252c0a6ded0e07f1)HF has just a couple of good ideas but he is totally changing the way Redbol languages works, without realizing the solid grounds, even neurological ones, Carl idea are based onto. Also, he is forgetting the importance of code/skill reuse (20 years of Rebol experience); and that everyone needs something stable to work with. I have seen different members suffering from this \*\*experimental stage\*\*. Red is now ready and it has its first commercial application. As things are now, we will see REN-C apps in another 5 to 10 years time frame. I will deliver my fist application \*made with red (tm)* just after the new \*Android+Ports* release.

[18:32](#msg60008e33fe007479e4106380)@toomasv This one `//: make op! :path` is the way to start with.

[19:42](#msg60009e9b787d8f79c800e49b)I have created a gist to show the application field of relative paths: https://gist.github.com/GiuseppeChillemi/93febe44dffd5dfae764b3cd6ad86988

[19:42](#msg60009eaf787d8f79c800e4cc)(Thank you @toomasv !)

toomasv

[20:43](#msg6000ad0814cec811ec9b5ee6):smile\_cat:

## Friday 15th January, 2021

greggirwin

[02:07](#msg6000f8d814cec811ec9c25f7)@Oldes' `resolve` on @GiuseppeChillemi's gist is very nice. It gives it a name, is very idiomatically Red, and is simple and elegant.

[02:08](#msg6000f92bfb85d46e04e1ded8)I did this a long time back, for the refinement issues @GiuseppeChillemi noted:

```
to-path: func [spec][
	; LOAD FORM is used to clean up specs that have refinements 
	; in them. Refinement values get their sigil doubled, which
	; FORM removes, so they are sanitized. More overhead, but we
	; could make that optional if this func lives on.
	load form append clear '_/_ spec
]
```

It's really heavy though, with both `form` and `load` being used, and was just a quick workaround at the time.

[02:09](#msg6000f953dc2e4809aa2281e3)@toomasv's `path` func is nice too.

[02:32](#msg6000fea45562a61e9aa7951c)I don't remember where the paren-in-path/computed-selector chat was, and can't find it just now, but it is important to note that we intentionally left it out of the `path!` docs, because it may be removed. @Oldes correctly points out a number of issues with it, and allowing parens as the first element in a path's lexical form is very, very unlikely to happen. Coming from @meijeru's notes, I am looking at things from the other direction; how can we simplify rules for lexical forms.

I think what @GiuseppeChillemi wants could be called \_indirect relative paths_ or even just \_indirect paths\_. Now, since words are already a level of indirection, they're really doubly indirect, but that's just more confusing to talk about.

An important aspect here is that paths themselves are not the problem, which we can see based on @Oldes and @toomasv finding other ways to express solutions. The only issue is the lexical form for `path!` values. @GiuseppeChillemi's suggestion of `/a/b` has a big problem in my mind in that \*nix paths starting with a slash mean they start at the root (i.e. aboslute), so having it mean relative is backwards to that meaning.

It's true that common cases like `p/(n + 1)` are handy but, unless we make paren path segments a special dialect, their unrestricted power can be abused and hurt readability. Forcing the use of get-word selectors can seem like more work, but the benefit is that the user then \*has to* give the selector a name, which is helpful.

So, @GiuseppeChillemi, no need to open a wish for this.

[02:35](#msg6000ff705562a61e9aa796bb)Nenad included paren support in paths for Rebol compatibility but, if we look at Red as a data format, with very tight and sometimes confusing lexical interactions, it does come with a cost.

GiuseppeChillemi

[06:54](#msg60013c20dc2e4809aa2312b9)@greggirwin Gregg, you have already asked time ago for examples that shows reasons to use parens and I did it. They are an essential part to have one line data structure selectors that summarize what needs more lines to be expressed. Everything can be abused and become hugly but it is the price of power. I remember me having written hugly parse expressions that made Ladislav gone grazy but the solution was not to restrict parse because it can be used to write such code, I have simply learned write neat and readable one. So, removing power from a language for this reason, is not the right way to go: we should teach how to use that power, instead of removing it because it can wrongly used!

[10:13](#msg60016addfb85d46e04e2fd42)@greggirwin Also, about parens "hurting readability", I totally disagree, it's the opposite. Every day I face the problem of having too much information off-screen. It confuses me because I have to move back and forth to find what-is-what in structures, words, and logic. It is nice to have "my-field" but coding is not just having a neat name, it is also defining and debugging its content, especially when your path accessor is not doing what it has been meant to do. When you have multiple data structures, it is really handy to have their access logic in one line because the information is all there. It is like function's specs, in the same line you have: `word [types!] "description"`; in this case, you have `name/(logic)`! No off-screen data, no scrolling headache, no large amount of new words, no risk of polluting the global context, and no minding about words context. This is what really hurts coding: too many elements to have in mind to understand what is happening and information scattered everywhere. Parens in paths (if done properly) solves this as Carl solved the problem of documenting the purpose of function arguments and types.

toomasv

[10:29](#msg60016e99fb85d46e04e3055a)@GiuseppeChillemi Another func you may like:

```
get-path: func [block [block! hash! paren! object! map!] path [path! block!]][
    forall path [block: block/(path/1)]
    ;foreach i path [block: block/:i]         ;This is slightly faster
]
a: [b [c [d e f g]]]
get-path a 'b/c/e 
;== f
get-path a 'b/c/2 
;== e
get-path [b [c [10 20]]] 'b/c/2 
;== 20
get-path [b [c [10 20]]] [b c 2]
;== 20
```

And of-course you can make it into op again.

greggirwin

[19:44](#msg6001f087252c0a6ded11bb72)Moving to red/red.

## Sunday 31st January, 2021

gltewalt

[20:32](#msg601713de9d5c644f6640581f)So here is a help-string writer script for function categories. Any of the `any-function!` types.  
https://gist.github.com/gltewalt/ff429d629b495ef9fc9bb139030afb78

[20:33](#msg6017140832e01b4f71672857)About 90% done, but still some duplication

[20:34](#msg60171458428d9727dd47b571)I haven't tested it on Windows, so I don't know if the checking for Windows works or not - yet

greggirwin

[20:38](#msg601715431ed88c58d810b7ef)Writes out help to other formats, like asciidoc and markdown.

gltewalt

[20:47](#msg6017174e063b6c68d52dc185)I started on an html template, but it gets messy quickly

## Monday 1st February, 2021

gltewalt

[21:41](#msg60187572428d9727dd4b70a4)https://github.com/gltewalt/help-writer

## Tuesday 2nd February, 2021

meijeru

[10:57](#msg6019303484e66b7f7ec82210)For HTML, have you tried &lt;pre&gt;? It is crude but probably OK for a quick result.

gltewalt

[16:45](#msg601981c7aa6a6f319dfd87f6)Not yet. Ill get back to the html template soon.

[19:04](#msg6019a25a4f7d1b68e5280326)Done.  
Others are welcome to improve the styling for the html template. (Or the code in general)

https://github.com/gltewalt/help-writer

## Wednesday 3th February, 2021

gltewalt

[01:50](#msg601a01625500a97f82e1562b)Not terrible.  
https://imgur.com/a/SlcaUpb

greggirwin

[02:14](#msg601a07184f7d1b68e5291dce)Nice. Is that rendered as MD, AD, or HTML?

gltewalt:matrix.org

[02:31](#msg601a0b059238c531ad1e7556)Html

## Thursday 4th February, 2021

gltewalt

[00:54](#msg601b45bb32e01b4f717268de)offset a bit with a border?  
https://imgur.com/y1v5svS

[02:21](#msg601b5a31aa6a6f319d028e19)https://imgur.com/izfPPtV

## Friday 5th February, 2021

gltewalt

[02:09](#msg601ca8bd55359c58bf222708)What is this? Is it something from the team?

https://red-language-documentation.readthedocs.io/en/latest/

greggirwin

[19:25](#msg601d9bac55359c58bf24cfbd)Interesting. I hadn't seen it. Looks experimental, and from almost 5 years ago. Doc is listed as the maintainer, but it's not in my head. It's a nice rendering, but I don't know what readthedocs maintenance involves. If you want to find out, post your thoughts here, that would be great. @x8x also has a really nice docs layout (https://w.red-lang.org/), but I think that requires manual upkeep as well.

gltewalt

[21:01](#msg601db2469238c531ad28e0e2)Ok, I will look into it tonight

greggirwin

[21:31](#msg601db9499238c531ad28f22b)Thanks!

## Sunday 7th February, 2021

gltewalt

[18:42](#msg60203486ae4b9b27c1a6fa4b)`readthedocs.io`

You can connect a readthedocs account to a github account, then can click import on a repostiory.  
Once imported it builds out the docs.  
Then you have to manually configure a webhook so that docs are updated with new changes.  
So, doesn't seem like much maintanance is required, or much manual work after everything is set up.  
Workload is mostly up front.

There are business accounts that probably give you more, but I didn't look at that.

I don't know the reasons for starting an account there and then abandoning it - possibly because at the time I believe the docs were in markdown?

Pros:  
Free doc hosting.  
Webhooks - when code is pushed with Git, docs are built. Stays in sync.  
Multiple docs versions - branch or tag with git.  
Can build multiple formats: pdf, ePub, html

Cons:  
Relying on (or tied to) Python.  
reStructuredText is the prefered markup (Part of Pythons javadoc-like attempt). No Asciidoc.  
Can use markdown but it is limited.

[19:06](#msg60203a299fa6765ef804ace2)Setting up a webhook on github and then using @x8x stuff (or other web dev) is an option.

[19:07](#msg60203a5c9238c531ad2ebc2b)https://docs.github.com/en/github-ae@latest/developers/webhooks-and-events/webhooks

greggirwin

[19:31](#msg60204027a0246860dc3a8a47)Thanks @gltewalt. Great info. Now that we're using AD, it will be more work to support it, from what you say. However, if people think there's value in having reflective help there, your recent work could emit MD.

How tightly are things tied to Python, or what parts are that would affect us and integrating with it?

gltewalt:matrix.org

[19:42](#msg602042a79d5c644f6658a431)Fairly tightly knit with python - have to use python locally, install sphinx and recommonmark through the package manager, and edit a .py config file. I'm not sure that the Red team wants to lean on python tooling, though there is a balance somewhere between being reliant on other things, and doing everything in house.

[19:44](#msg6020432baa6a6f319d0f9c82)A local docs directory would be the sphinx project scaffolding

greggirwin

[19:51](#msg602044cf55359c58bf2b0659)That's a bummer. Yeah, we may not want to do all that.

[19:52](#msg602044ea32e01b4f717f885c)@x8x do we have any other Python dependencies in our webhook chain for other stuff at this point?

gltewalt:matrix.org

[19:56](#msg602045e35500a97f82f20981)There is also asciidoctor which spits out htm from asciidoc by default.

https://asciidoctor.org

[19:56](#msg602045f532e01b4f717f8b25)Looks good to the viewer, pretty noisy when viewing source

## Monday 8th February, 2021

x8x

[19:16](#msg60218e2b063b6c68d5497463)We don't use Python for anything that I can think of.

greggirwin

[19:20](#msg60218ee4aa6a6f319d12e82d)Thanks @x8x. So we probably won't pursue that @gltewalt:matrix.org. If there's someone in the community that wants to host that process, knows Python, and all we need to do is provide content in a given format for them to pull, we could look at that.

## Wednesday 10th February, 2021

mxdpeep

[12:32](#msg6023d26e24cd6b60d82e6b00)&gt; There is also asciidoctor which spits out htm from asciidoc by default.  
&gt;  
&gt; https://asciidoctor.org

I use it daily from a docker container, works

## Thursday 11st February, 2021

gltewalt

[04:04](#msg6024acb20eed905f18a68460)I think asciidoctor is the best bet for right now - if you want html version of the asciidoc docs.

[04:06](#msg6024ad4755359c58bf363e7e)Their site is composed in asciidoc. The html that you see if from asciidoctor, with their own css style.

https://asciidoctor.org/

[04:07](#msg6024ad801ed88c58d8340106)Bonus - the headers are colored red

x8x

[12:07](#msg60251ded428d9727dd6c8670)@gltewalt we use asciidoctor since always.. and we also do SPA and PWA if that's the new buzz words.. :smiley:

gltewalt

[12:38](#msg602525459d5c644f66650c71)'We' as in?

x8x

[12:53](#msg602528cb4f7d1b68e5462149)&gt; https://docs.github.com/en/github-ae@latest/developers/webhooks-and-events/webhooks

Thanks! That looks like an interesting option! :thumbsup:

## Saturday 3th April, 2021

gltewalt

[23:54](#msg6069003c89446618e9848c7c)This could use some volunteers. Last touched in January.  
https://github.com/red/red/wiki/%5BHOWTO%5D-How-Do-I-Do-X-with-Red%3F

[23:56](#msg606900b21dbd860a232d7187)The common How-Tos could be factored out and used as a kind of parent class to the "How Do I", and the "Coming to Red from another language" writings

[23:57](#msg606900ed92a3431fd6731f3b)Cross referenced, at least

## Sunday 4th April, 2021

greggirwin

[02:54](#msg60692a6063fb5651c1ebfb78):+1:

## Monday 5th April, 2021

mikeparr

[07:49](#msg606ac10f15cd52559d7e3b95)@gltewalt I wonder if this 'CommonTasks In Series' material is any use? https://www.red-by-example.org/series.html#15

gltewalt

[11:12](#msg606af09815cd52559d7eabe7)Yes, good information. Should probably link to those from "How Do I"

rseger

[22:55](#msg606b954d63fb5651c1f17403)I added a suggested "potential gotchas" section to https://github.com/red/red/wiki/Coming-to-Red-from-Python. And added a note about namespaces (hopefully a helpful one) - feel free to tweak/remove as desired :)

greggirwin

[23:04](#msg606b978363fb5651c1f1788a)Good stuff @rseger , thanks!

Another thing you might hear is that "words carry their context with them".

rseger

[23:06](#msg606b97f256ddab18d72fd59a)my pleasure :)

## Thursday 29th July, 2021

gltewalt

[05:01](#msg6102361872c37b6f457c9df5)the "zipped" `Direct links to latest builds` links are dead on the download page

## Thursday 5th August, 2021

gltewalt:matrix.org

[15:08](#msg610bfefc8fc359158c54e8b5)Red by example still alive?

[15:08](#msg610bff034bfde341d9446080)\[Screenshot\_20210805-085148\_Samsung Internet.jpg](https://gitter.ems.host/\_matrix/media/v1/download/matrix.org/tYEsnOAHQbTZGHRDylQdqBFy)

greggirwin

[15:55](#msg610c0a054b7707158f67f4f4)It's an open effort now: https://github.com/red-by-example/red-by-example with @mikeparr and ArieVW as honorary advisors.

mikeparr

[19:34](#msg610c3d419484630efa21c623)Thanks Gregg

## Friday 13th August, 2021

toomasv

[08:01](#msg611626de3eec6d41d153d7f8)There is following proposition in `map` \[documentation](https://github.com/red/docs/blob/master/en/datatypes/map.adoc):

&gt; Trying to access a key not defined in a map will:  
&gt;* produce an error if the path syntax is used.  
&gt;* return a none value if select is used.

But on Windows accessing non-existing key with path syntax returns `none`, not error. Which is wrong, documentation or Windows' behavior?

greggirwin

[16:26](#msg61169d1c7bc44d0a471d935d)Documentation is wrong. That was the original behavior, and docs never got updated. Good catch, and please file a ticket for it.

## Saturday 14th August, 2021

toomasv

[07:50](#msg611775bbaedfa70f0d91ef81)Ok, will do.

## Sunday 26th December, 2021

pekr

[07:15](#msg61c8167d82a4667b2546a374)English is not my native language, but shouldn't `== Function attributs`be `== Function attributes`instead?

gltewalt:matrix.org

[19:56](#msg61c8c8fd9b470f389738e00c)Yep

## Monday 27th December, 2021

greggirwin

[19:05](#msg61ca0e79526fb77b314f758b)Thanks @pekr. Fixed.
