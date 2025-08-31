# Archived messages from: [gitter.im/red/docs](/gitter.im/red/docs/) from year: 2017

## Friday 6th January, 2017

dockimbel

[09:44](#msg586f66e5da229f8d5bee6852)FYI, I'm currently finishing converting the MD docs to Asciidoc format.

## Saturday 7th January, 2017

dockimbel

[13:12](#msg5870e943aa6be0472f1c9636)https://twitter.com/red\_lang/status/817720495214727168

[13:13](#msg5870e982aa6be0472f1c96c3)Big thank to @Tovim for doing the preliminary prototyping and conversion of MD files to asciidoc.

[13:20](#msg5870eb0bda229f8d5bf596d6)I didn't succeed in moving the styles/ folder at root level, I get a gitbook build error in such case: https://www.gitbook.com/book/dockimbel/red/build/5870e67ae9f3981100ae4d59

[13:21](#msg5870eb69aa6be0472f1c9f8b)Last thing, I find this \[online Asciidoc editor](https://asciidoclive.com) very helpful when writing/testing new docs.

## Wednesday 11st January, 2017

meijeru

[16:54](#msg5876634711e7a7f61d82548f)Welcome to the libRed documentation. Are we also going to get libRedRT documentation at a certain point, or perhaps a more systematic guide to using the various toolchain options?

## Thursday 12nd January, 2017

meijeru

[09:19](#msg58774a0b300f220a66da3a70)@dockimbel I did a quick check of the libRed doc table of contents. The following are implemented but not described: `redSetEncoding, redOpenLogFile, redCloseLogFile, redVString, redVFormError`. Furthermore, file `%libRed.def` overlaps with the `#export` directive in `%libRed.red`, \*except* that `redUnset(), redPair(), redMold()` are not in `%libRed.def`.

dockimbel

[09:27](#msg58774c00873d96e16d5a69cc)@meijeru Thanks. I forgot to update `%libRed.def`.

meijeru

[09:29](#msg58774c8dcbcb2817705cb2cd)What is its use anyway??

dockimbel

[09:30](#msg58774ca811e7a7f61d873c9b)It's required for generating the libRed.lib file for Windows platform (it's VisualStudio-specific).

meijeru

[09:30](#msg58774cc7873d96e16d5a6db1)Pity for the double work, which -- as is shown -- may lead to inconsistencies.

[09:31](#msg58774ce211e7a7f61d873d3c)Could you not generate the .def file from the .red file?

dockimbel

[09:33](#msg58774d5cdec171b811dbc674)Yes, but it might be overkill, it is just a copy/paste of the `#export` list. Though, maybe a smart Red macro could do the job... ;-)

[10:06](#msg5877551c11e7a7f61d87675f)&gt; Are we also going to get libRedRT documentation at a certain point, or perhaps a more systematic guide to using the various toolchain options?

I was planning to document that in the blog release article, though, I might add a section in the docs about the toolchain anyway.

meijeru

[16:14](#msg5877ab64873d96e16d5c91ac)@dockimbel Trying to understand more of libRed: why is `%libRed.red` a `.red` file, when all the code it contains is enclosed in `#system [...]`?

[16:21](#msg5877ad27873d96e16d5c9c29)Another question: why are such useful series manipulation actions like `at`, `next` and `back`not implemented?

## Friday 13th January, 2017

dockimbel

[09:09](#msg58789944300f220a66e1366e)@meijeru  
&gt; why is %libRed.red a .red file?

Because it needs to include the Red runtime library and Red modules (like View), which contain Red code.

[09:16](#msg58789ae5cbcb28177063ff2f)About your second question, the libRed API aims at being a simple glue for integrating Red into a host language/software. `redCall` can call any functions already, so the provided actions wrappers are just shortcut for the actions we think will be the most used. So `redSkip` already provides a navigation function, adding more brings no visible advantage to the user.

meijeru

[09:23](#msg58789caf300f220a66e148f2)OK Thanks.

[21:31](#msg58794749dec171b811e7792d)I was perusing the Gitbook and saw in the section on Reactive programming the following paragraph which I think has some formatting errors (and also a superfluous word `by`):

```
A reaction is removed by with the /unlink refinement and with one of the
following as a <source> argument: * The 'all word, will remove all 
reactive relations created by the reaction. * An object value, will remove 
only relations where that object is the reactive source. * A list of objects, 
will remove only relations where those objects are the reactive source.
```

[21:33](#msg587947c1873d96e16d65c5e3)The bullet items haven't come out right, I think...

## Saturday 14th January, 2017

dockimbel

[03:24](#msg587999d4300f220a66e69497)@meijeru Thanks, it should be fixed now.

meijeru

[07:54](#msg5879d91a074f7be763ccb11e)It looks fixed if you see it in the `/docs` repository itself, but the Gitbook is either not updated or it displays it differently (stilll no bullets).

dockimbel

[08:04](#msg5879db9ae836bf7010417539)The gitbook builds are failing since this one: https://www.gitbook.com/book/dockimbel/red/build/5878ab21e2f7511100a6bdb5

meijeru

[08:39](#msg5879e3c1300f220a66e7809b)Is this a question of .md/.adoc incompatibility perhaps?

dockimbel

[08:40](#msg5879e3e4074f7be763ccd4b8)It looks like a gitbook's processor bug to me, as it tries to interpret asciidoc tags from quoted text.

[08:53](#msg5879e708dec171b811e9fbae)I had to cripple my code example to make it pass the build... :sweat:

meijeru

[09:38](#msg5879f18f300f220a66e7b252)I see! The inlined text in fixed-width font seems a bit small relative to the surrounding text? Is that configurable?

dockimbel

[09:40](#msg5879f2036c1635643c296d4c)It should through CSS (`en/styles/website.css`).

## Sunday 15th January, 2017

meijeru

[14:22](#msg587b85c16c1635643c2ffecc)I notice some inconsistencies in the latest format changes: use of underscores vs. use of backticks

```
==== redLogic()
----
red_logic redLogic(long logic)
----
Returns an _logic!_ value. A _logic_ value of `0` gives a `false` value, all other values give a `true`.

==== redInteger()
----
red_integer redInteger(long number)
----
Returns an `integer!` value from _number_.
```

[14:24](#msg587b860c074f7be763d34097)Also: \*an* logic! value sould be \*a* logic! value

## Monday 16th January, 2017

dockimbel

[08:17](#msg587c81a3074f7be763d7a989)Thanks, those typos will be fixed in next commit.

## Sunday 22nd January, 2017

PeterWAWood

[23:30](#msg58854086cbcb281770a2b937)@dockimbel I am taking a quick look at the LibRed docs and came across:

"Ability to set/get a word's value from global or a local context."

Reading it pedantically, you could take that to mean that you can get and set words in the local context of a function. (I'm assuming that it is not possible to access a function's local context even with LibRed).

[23:32](#msg588540f5074f7be76304366b)Is it okay to change it to:  
"Ability to set/get a word's value from the global or an object's context."

[23:53](#msg588545fde836bf70107ab02d)@dockimbel If you call redOpen() a second time from a host program will the Red be re-initialised and all prior data lost?

[23:54](#msg58854643dcb66e4f769960b3)I'd like to add a note to the docs to state whether it does or not.

## Monday 23th January, 2017

PeterWAWood

[00:04](#msg5885487de836bf70107ab986)A question about redCall(). If the function requires no arguments, do you still need to pass

```
null
```

or

```
0
```

to signify the end of the function argument list.

```
redCall(redWord("f"))
```

or

```
redCall(redWord("f"), redInteger(0))
```

?

[00:12](#msg58854a66d43728124e8f62b4)Also, should the

```
null
```

or

```
0
```

be C values or Red ones?

## Tuesday 24th January, 2017

DideC

[08:45](#msg5887140fc0de6f017fe3bb58)(AFAIK, Doc is in France this week, so probably mostly offline).

## Wednesday 25th January, 2017

Tovim

[19:32](#msg5888fd65519afee26bb00911)@dockimbel :point\_up: \[December 30, 2016 4:16 PM](https://gitter.im/red/docs?at=58667a48c02c1a3959cc0a8b) Hi, I am sorry for my belated response. The md-to-adoc conversion I made with the Notebook++ and the AscidocFX editors. Now, I have unified the formatting of translated texts with the english origin and put them into the new repo at the github.com/Tovim/docs page, where you can take them. Also, you can see it at https://tovim.gitbooks.io/docs. I would suggest to remove the README.adoc\[Ownership System] link in en/SUMMARY.adoc to the end of the list, which will simplify the bottom-arrow navigation as you can see in the Czech version. The double language en/cs fork is still a little smut in the face of the nice red-docs presentation.

## Thursday 9th February, 2017

dockimbel

[10:19](#msg589c4236f045df0a2225fdcd)@Tovim Thanks, I have improved that and added more fixes. Are you referring to the en/cs front page? I'm not sure how we can improve it, as it seems the LANGS.adoc file support limited features...?

[10:20](#msg589c42841465c46a564071dc)@PeterWAWood Thanks for the edits, I added mines too. You need to pass a `0` or `null` value to mark the ending of an arguments list.

PeterWAWood

[10:45](#msg589c4866872fc8ce621204bf)@dockimbel Do you pass

```
redInteger(0)
```

or

```
0
```

?

## Friday 10th February, 2017

dockimbel

[10:44](#msg589d9997f045df0a222d1538)@PeterWAWood `0`.

PeterWAWood

[10:46](#msg589d9a076b2d8dd55226a1aa)Thanks.

## Monday 20th February, 2017

Tovim

[20:17](#msg58ab4ec7872fc8ce625fc084)Hello, I have translated libred.adoc and updated SUMMARY.adoc files, see the https://github.com/Tovim/docs page. Best wishes.

## Saturday 25th February, 2017

dockimbel

[11:31](#msg58b16afb00c00c3d4f871357)@Tovim Great work! Could you submit a PR for that on red/docs?

greggirwin

[20:07](#msg58b1e41de961e53c7f68a9fc)+1 @Tovim!

## Sunday 26th February, 2017

Tovim

[20:59](#msg58b341a0e961e53c7f6ee9c9)Sorry, just made it.

## Monday 27th February, 2017

dockimbel

[04:59](#msg58b3b22800c00c3d4f91a3a2)Merged, thanks!

## Thursday 30th March, 2017

Tovim

[18:18](#msg58dd4c08f22385553df1c697)Hello, I have updated the czech version of the post 0.6.2 documentation. PR sent.

pekr

[18:27](#msg58dd4e088e4b63533d7d4d9c)@Tovim I don't want to be harsh, but your translation of `face`being `piškot`(sponge cake) is imo just absurd and it makes me crazy each time I face it.

[18:28](#msg58dd4e568bb56c2d115c36a8)I already tried to explain to you, that face is simply a face, and R2 had even related "feel" aspects. I really can't understand why have you decided for such a translation?

[18:29](#msg58dd4e8c8e4b63533d7d5110)Maybe this is more a general question. We have not seen much translations in the Rebol ecosystem in the past. Would you translate and extensively use terms as face?

[18:30](#msg58dd4ed68bb56c2d115c397c)For me, personally, I would probably go in a reverse mode - use original english term and with the first mention I would provide the translation in a parens `face (tvář)`and since then I would probably use the original term.

[18:31](#msg58dd4ef24cb8d0917341d23c)Because - where do we stop? Do we trasnate draw, shape, etc. and use it across our docs?

greggirwin

[18:54](#msg58dd546dad849bcf4235f93a)If terms have a specific, technical meaning, they should probably not be translated. Sort of like "food" having a translation in all languages, "hamburger" having adaptations, and "Big Mac" always being the same.

## Friday 31st March, 2017

iArnold

[07:09](#msg58de00b9408f90be6673c8a2)If the term face will be consistantly translated that would be wrong. It is a technical term one will see used in docs other languages so leave it untranslated so readers become familiar with the term. Rather give one detailed explanation of the used term when introduced. "'Face is the term you can think of it as the visible presence of a widget in a window, like the face of a person on a group photo" (&lt;-- that is probably very incorrect ) as long as it is giving the reader a clear idea to work from I believe that is a much better approach.

pekr

[07:30](#msg58de05b38e4b63533d801b47)I absolutly agree with your point of view, Gregg and Arnold ...

DideC

[11:48](#msg58de42258fcce56b20b7bc86)@iArnold +10

Tovim

[14:13](#msg58de641c0e4137042acd58b8)Hi, @pekr , @greggirwin , @iArnold , glad to discuss with you.  
Face as a "sponge cake" (piškot) is certainly somewhat outrageous, I admit. Maybe I am wrong - the Red term face (short or interface) is what in some other languages is named as a "widget". Widget is a funny (meaningless) word in english but not so in czech.  
If a "face" is something like widget in english, why not "piškot" in czech?  
I agree with the view that technical terms should be translated with great consideration. I am going to revisit my translations and make corrections where necessary.  
@pekr , I´d like to consult my prospective linguistic issues with you, would you agree?

rebolek

[14:19](#msg58de655f0e4137042acd5e96)I agree that "piškot" for "face" is not very good pick.

pekr

[14:44](#msg58de6b420e4137042acd7bf3)I am open to any discussion in that regard. The quality of translation is really good otherwise and kudoz for that. Let's just not make it a PhD linguistic topic - it should be really mostly practical ...

rebolek

[14:50](#msg58de6cd18fcce56b20b8937a)Maybe we should create some Red/Czech channel for this discussion?

greggirwin

[16:26](#msg58de8337b52518ed4dc82cbd)Thanks for all your work on this @Tovim. I can't help with the Czech though. :^)

iArnold

[19:07](#msg58dea8e208c00c092a368dde)This just shows again that translation takes more than Google Translate. I'll leave the best Czech translations up to the specialists here. But this issue in itself is also valid for translations to other languages. As long as there are no better places to discuss the details I don't mind you proposing some better alternatives here. Perhaps there is also a wiki where a page can be edited?

[20:31](#msg58debc94408f90be667756ae)@DideC Merci bien!

## Saturday 1st April, 2017

Tovim

[09:19](#msg58df70b58fcce56b20bc4427)@rebolek +1: Red/Czech channel anywhere would be very nice and useful for me and us. Could you do something about it? Some issues are already at hand.

rebolek

[09:23](#msg58df71ab08c00c092a393ec1)@Tovim I tried to make new room, but without success. Maybe I do not have enough rights, I am not sure, as there was no error, nothing simply happened. @dockimbel could you please make that room for us?

pekr

[09:45](#msg58df76c24cb8d091734a4d9b)National channels would be useful even from that point of view, that there might be some users out there, not fluent with English much ... But - who knows, we don't want isolated communities on the other hand ...

PeterWAWood

[10:47](#msg58df854fbc370d964ed99950)@pekr @tovim @bolek @Oldes I've opened \[red/Czech](https://gitter.im/red/Czech) and added you to it. Ahoj away to your hearts content.

[10:53](#msg58df86b24cb8d091734a848a)Opps should have been @rebolek.

rebolek

[10:53](#msg58df86b8ad849bcf423e9a3a)@PeterWAWood thanks!

PeterWAWood

[10:57](#msg58df87968e4b63533d861115)I'l leave the channel to you as I have completely exhausted my Czech vocabulary ... unless paprika is a Czech word :-)

rebolek

[11:04](#msg58df89454cb8d091734a8c9a)It is :) but it comes from Hungarian, I think 😀

pekr

[12:23](#msg58df9bb4408f90be667a2e5e)And hnugarian have czech Rak word :-)

[12:23](#msg58df9bc2bc370d964ed9e490)Thanks a lot, Peter!

Tovim

[14:10](#msg58dfb4d58fcce56b20bd2fc5)Thank you, Peter!

## Friday 14th April, 2017

Scaremonger

[09:34](#msg58f097898fcce56b20ff6205)Morning! Is the github wiki indented for the Red team and developers only, for Beginners, Advanced or for everything? I've been looking at it and there is plenty of room for improvement. If you want this to remain for the Red team only, I could start a Red site for Beginners/Reference guide on Wikia.com instead. I have experience with wikis at work and through Wikia.com for other topics and feel that I have enough experience to contribute to Red in this way. Please let me have you thoughts on this.

dockimbel

[09:48](#msg58f09b06f22385553d3dfeff)@Scaremonger Hi! The wiki is currently informal, we (the Red team) just keep control of the home page for now, the rest is left open to contributors. We haven't decided yet what/how to do with this wiki in the long term. @PeterWAWood @greggirwin might give more info/suggestions about that.

geekyi

[12:05](#msg58f0bb0cf22385553d3e8064)@Scaremonger (adding to what doc said)  
&gt; Red site for Beginners/Reference guide

there are already some of those, I'm not sure if @mikeparr takes care of red-by-example ?

[12:06](#msg58f0bb3508c00c092a7dbbb1)What is missing is better coordination and more people with free time :p

Scaremonger

[12:09](#msg58f0bc00a0e485624203b921)@mikeparr: red-by-example is an awesome site: I've been referring to that regularly.

dockimbel

[12:42](#msg58f0c3a1bdf4acc1125c10e2)Red-by-example web site is getting better each time I take look at it. ;-)

greggirwin

[15:34](#msg58f0ec168bb56c2d11a9d500)@Scaremonger, if you don't mind using the github wiki for now, that will keep things in one place, or see if Mike wants to add a wiki area to red-by-example. It's good to have different resources, but it's also a problem when we're still a small community.

[15:35](#msg58f0ec4d8fcce56b2000be17)I haven't used Wikia to know what the benefits might be, but if the data can be extracted and moved (e.g. plain markdown), it should be pretty easy to repurpose later.

mikeparr

[20:32](#msg58f131f0ad849bcf428553e5)Yes, I still look after Red-by -example. Am putting a lot of the 0.62 words in it, will upload in a week or 2.

Scaremonger

[22:34](#msg58f14e8b69a692963eaf9b64)@greggirwin Ok, I'll make a start on it.

## Saturday 15th April, 2017

Scaremonger

[00:26](#msg58f168a069a692963eafe7ef)I have compiled all the links that I know about under various headings in a \[Sandbox page](https://github.com/red/red/wiki/Sandbox). Any comments?

gltewalt

[00:34](#msg58f16aad69a692963eaff06e)There's also a twitter feed

[00:40](#msg58f16be2f22385553d413809)And if you want to include Red/System, this is great documentation:  
http://static.red-lang.org/

[00:40](#msg58f16bfe408f90be66c007bf)http://static.red-lang.org/red-system-specs-light.html#section-1

[00:49](#msg58f16e20f22385553d413e06)@red\_lang

[00:50](#msg58f16e4b408f90be66c00e21)Sorry... I'm on mobile at the moment

mikeparr

[08:01](#msg58f1d37569a692963eb112b1)@Scaremonger Looks good, I'll link back to it from R-B-E in a week or so. Minor point - your link to Red Blog - this link is better: http://redlanguageblog.blogspot.co.uk/?view=flipcard The site is by Arie, not me (I just wrote one article)

angellom1

[08:35](#msg58f1db364cb8d091739185a5)i am subscribed to your blog mikeparr

Scaremonger

[21:38](#msg58f292df69a692963eb3c761)@gltewalt - I've added Red/System under Further Reading and added the Twitter feed under "feeds".  
@mikeparr - I've updated the link and author; Please don't link to the Sandbox page. Hopefully the Red Team will approve this to be the new homepage.

greggirwin

[22:11](#msg58f29aa4a0e48562420a3153)Nice work @Scaremonger.

gltewalt

[22:14](#msg58f29b4b69a692963eb3e50a):+1:

## Sunday 16th April, 2017

dockimbel

[04:11](#msg58f2eef6a0e48562420b3411)@Scaremonger Nice! You can replace the wiki's home page with that new one, it's much better.

## Monday 17th April, 2017

9214

[15:15](#msg58f4dc2a8bb56c2d11b707bc)Regarding `parse` documentation and books, \[this one](https://www.goodreads.com/book/show/1756599.Parsing\_Techniques) comed up in some Lobster article today, has anyone read it?

[15:21](#msg58f4dd75a0e485624211bf76)First edition is available for free \[here](https://dickgrune.com/Books/PTAPG\_1st\_Edition/BookBody.pdf), if anyone wants to skim through, ~300 pages.

greggirwin

[16:21](#msg58f4eb9c0ed3020c38258d6c)Thanks @9214. Always nice to have more resources.

Scaremonger

[17:27](#msg58f4fb12d32c6f2f091485ce)@dockimbel - Thanks, Just put it live.

iArnold

[18:34](#msg58f50a9808c00c092a8c93fd)So, @9214 we can call you Dick from now on?

## Tuesday 18th April, 2017

dockimbel

[07:13](#msg58f5bcb1f22385553d4fea13)@Scaremonger :+1:

Tovim

[13:30](#msg58f614ea8e4b63533ddd9eda)I have run across a little contradiction:  
\* In red/help, I can read that any-{block!, function!, type!}, default!, immediate!, internal! and scalar! are typesets.  
\* In Red-by-example (last updated 16. 1. 2017), there are not such typesets.  
Which source is correct?

9214

[13:40](#msg58f6173b0ed3020c382a2a38)@iArnold what you mean?

rebolek

[13:41](#msg58f6177cd32c6f2f0918d7c9)@Tovim if not sure, see console:

```
>> ? typeset!
     any-block!      :  make typeset! [block! paren! path! lit-path! set-path! get-path! hash!]
     any-function!   :  make typeset! [native! action! op! function! routine!]
     any-list!       :  make typeset! [block! paren! hash!]
     any-object!     :  make typeset! [object! error!]
     any-path!       :  make typeset! [path! lit-path! set-path! get-path!]
     any-string!     :  make typeset! [string! file! url! tag! email!]
     any-type!       :  make typeset! [datatype! unset! none! logic! block! paren! string! file! url! char! integer! float! word! set-word! lit-word! get-word! refinement! issue! native! action! op! function! path! lit-path! set-path! get-path! routine! bitset! object! typeset! error! vector! hash! pair! percent! tuple! map! binary! time! tag! email! handle! image!]
     any-word!       :  make typeset! [word! set-word! lit-word! get-word! refinement! issue!]
     default!        :  make typeset! [datatype! none! logic! block! paren! string! file! url! char! integer! float! word! set-word! lit-word! get-word! refinement! issue! native! action! op! function! path! lit-path! set-path! get-path! routine! bitset! object! typeset! error! vector! hash! pair! percent! tuple! map! binary! time! tag! email! image!]
     immediate!      :  make typeset! [datatype! none! logic! char! integer! float! word! set-word! lit-word! get-word! refinement! issue! typeset! pair! percent! tuple! time!]
     internal!       :  make typeset! [unset! handle!]
     number!         :  make typeset! [integer! float! percent!]
     scalar!         :  make typeset! [char! integer! float! pair! percent! tuple! time!]
     series!         :  make typeset! [block! paren! string! file! url! path! lit-path! set-path! get-path! vector! hash! binary! tag! email! image!]
typeset! is a datatype! of value: typeset!
```

Tovim

[14:14](#msg58f61f3a8e4b63533dddd17c)Thank you

iArnold

[14:37](#msg58f6249ea0e485624217088a)@9214 "Ninethousandtwohundredandfourteen" is such a long name.

dockimbel

[15:27](#msg58f6304e8e4b63533dde210b)@Tovim Red/help is correct, those typesets are just not in Red-by-example yet. You could add them there if you want, @mikeparr and @Arie-vw are welcoming contributions.

mikeparr

[18:31](#msg58f65b6abdf4acc1127034ad)Updated Red-By-Example with tag!, time! email! and their related functions, plus call.

toomasv

[19:15](#msg58f665d6ad849bcf42984e87)Is this correct hierarchy of basic types (typeset! derivates excluded): https://github.com/toomasv/red-type-hierarchy/blob/master/red-type-hierarhy.pdf

greggirwin

[19:17](#msg58f666398bb56c2d11bd8cf4)Go RBE, Go!

Scaremonger

[19:17](#msg58f666520ed3020c382b9e56)@toomasv - That is a very cool diagram.

greggirwin

[19:22](#msg58f6676d8e4b63533ddf1f88)@toomasv, there are some things in there that don't look right to me. e.g. char is not an integer, binary is not a string, vector is a block, file is not a url, func is not really a context.

[19:23](#msg58f667a4a0e48562421842cc)Here's what I drafted as text some time back.

```
any-type! [
		event!
		unset!
		any-function! [native! action! op! function! routine!]
		any-object! [object! error!]
		series! [
			any-block! [
				any-list! [block! paren! hash!]
				any-path! [path! lit-path! set-path! get-path!]
			]
			any-string! [string! file! url! tag! email!]
			binary!
			image!
			vector!
		]
		immediate! [
			any-word! [word! set-word! lit-word! get-word! refinement! issue!]
			scalar! [
				number! [integer! float! percent!]
				char!
				pair!
				tuple!
				time!
			]
			datatype!
			none!
			logic!
			typeset!
		]
	]
```

toomasv

[19:26](#msg58f6687308c00c092a924689)@greggirwin You start here from derivate types, ie. not basic types.

greggirwin

[19:30](#msg58f6693a69a692963ec1d61f)So you want to show the \*implementation* hierarchy. Got it.

[19:31](#msg58f669a1f22385553d53074c)For people contributing to Red, not for normal end users.

[20:34](#msg58f67861cfec91927250ddf2)Yes, very nice.

## Wednesday 19th April, 2017

dockimbel

[08:22](#msg58f71e5ff22385553d559ac1)@toomasv Nice work! Do you have a Draw version of it? ;-) You should make clear that it's an "implementation view" of the type hierarchy, which differs from the "logical view" from user's perspective.

toomasv

[11:03](#msg58f743f3cfec91927253cb5c)Here are both implementation and logical view of typeset hierarchy: https://github.com/toomasv/red-type-hierarchy/blob/master/Red-type-hierarchy2.pdf . I hope I got it all right.

[11:06](#msg58f744c1bdf4acc11273a67f)Here is commenting link https://drive.google.com/file/d/0B-TWj5PlEAOTcmRrWlVwbVJJZmc/view?usp=sharing (Seems not working)

[11:26](#msg58f7494a8fcce56b201789de)@dockimbel Yes, I have a Draw version, but I cannot make it shareable -- Draw complains that it is too big.

9214

[12:01](#msg58f75194d32c6f2f091db7f5)@toomasv good job, thank you!

toomasv

[12:19](#msg58f755e5ad849bcf429bdccf)@greggirwin It seems you have three types missing here ( :point\_up: \[April 18, 2017 10:22 PM](https://gitter.im/red/docs?at=58f6676d8e4b63533ddf1f88) ): `map!`, `bitset!` and `handle!` ;).

dockimbel

[15:43](#msg58f7859a8e4b63533de38eeb)@toomasv  
&gt; Draw complains that it is too big.

How so? How big is your draw content for such graphic?

greggirwin

[16:14](#msg58f78ce5a0e48562421cf06d)Thanks @toomasv. Will add those. Your diagram is amazing. Really nice idea on the dual visualization.

toomasv

[16:35](#msg58f791e33e27cac331a3b9f1)@dockimbel I use https://www.draw.io and here is svg: https://github.com/toomasv/red-type-hierarchy/blob/master/Red%20datatypes%20hierarhy.svg , in case it is of any use. (Can export pdf, svg, png, jpeg, html, xml and url with binary data. Which one you prefer?) I reordered types by color into more logical groups. Probably can be ordered still better.  
@greggirwin Thanks!  
BTW On the second diagram `point!` type is missing. Where should I put it? It is not in `any-type!`

greggirwin

[16:52](#msg58f795d88e4b63533de3e493)`Point!` will be like `pair!`, but is not implemented yet.

geekyi

[17:00](#msg58f797be8bb56c2d11c26b74)So one dimensional, I've wondered what's the 3D extension is for `pair`?

toomasv

[17:01](#msg58f797efa0e48562421d2248)@greggirwin Ok, thanks!

greggirwin

[17:01](#msg58f797f18fcce56b20190fc6)`Point!` will be the 3 element version of `pair!`.

geekyi

[17:17](#msg58f79bb28bb56c2d11c27e63)That's awesome!

[19:47](#msg58f7beeca0e48562421dd422)@toomasv so you have \*draw.io* but not a red native `draw` version :satisfied: the 2nd diagram is really cool btw

[19:57](#msg58f7c10c3e27cac331a49759)@geekyi takes a peak at @greggirwin's (incomplete? but interesting!) https://github.com/greggirwin/red-formatting/blob/master/formatting-functions.adoc

greggirwin

[20:02](#msg58f7c25f8e4b63533de4c155)SHHHhhhhhhh!

## Thursday 20th April, 2017

dockimbel

[06:53](#msg58f85ad008c00c092a9a08d5)There's an internal partial implementation of `point!` used by Parse engine (to expose some stack slots to users in Parse callbacks), though, it has no literal form, as reusing the pair form would lead to hardly readable values: `453x73235x2345 or 12.3434x3.56722x16533.234`.

[06:53](#msg58f85b03cfec91927258541b)Actually even allowing decimal values in `pair!` already leads to hard to read values, IMO.

greggirwin

[07:17](#msg58f8608c8bb56c2d11c563a7)While I agree that `453x73235x2345` isn't pretty, neither is `732352x534567`. Decimals do make it even worse. I'm not sure I want to extend the separator (e.g. `1920_x_1080`), but the real question is how often the bad cases come up. `10x12x15` isn't bad. `1x23x456` isn't great. `1234x56x789`...but, and this is another consideration, if you look at numbers like this regularly, they may not seem as bad. I can't say. It's a tough call. Need to make that call, though, and say what people \*should* use if we don't extend pair.

dockimbel

[07:33](#msg58f8644dcfec919272587d25)Small numbers are fine, but as soon you get decimals in, readability drops quickly. That's the reason I haven't implemented decimals support in pairs yet, I wanted to solve that issue first. Though, I should implement it anyway in the next days, as we need it for Draw...

rebolek

[07:35](#msg58f864cf8fcce56b201c0f85)Numbers like `[17.1018096 50.2095115]` will always be not very readable.

pekr

[07:36](#msg58f864fc3e27cac331a6eb1a)I wonder if there is any other easy to decide solution anyway?

dockimbel

[07:36](#msg58f864fd3e27cac331a6eb1c)The issue is visually parsing the beginning and end of each number. Having a space separator is the best option in such cases IMO.

pekr

[07:36](#msg58f865178bb56c2d11c577cb)Introducing another type with some other dimension separator, which would make it more readable?

DideC

[08:15](#msg58f86e16cfec91927258b05d)the only char that could help reading this except space is \_, but is `12.3434_3.56722_16533.234` really more readable ? Not sure.

[08:15](#msg58f86e3ed32c6f2f09226ec3)And it does not carry the implicit meaning of `x` !

dockimbel

[08:16](#msg58f86e49c1d3b501540130ee)Moving this discussion about pair/point syntax in red/red.

## Friday 21st April, 2017

toomasv

[09:01](#msg58f9ca7a3e27cac331acd0eb)Is this a mistake in help doc?

```
>> ? insert
...
ARGUMENTS:
     series   [series! bitset! map!] 
     value   [any-type!] 
...
>> insert #() [a b]
*** Script Error: insert does not allow map! for its series argument
*** Where: insert
```

9214

[14:22](#msg58fa15998e4b63533dee5acc)Looks like `split` has some undocumented obscure refinement

```
>> ? split

USAGE:
      split series dlm

DESCRIPTION:
      Break a string series into pieces using the provided delimiters. 
      split is of type: function! 

ARGUMENTS:
     series   [any-string!] 
     dlm   [string! char! bitset!] 

REFINEMENTS:

>> split/local
*** Script Error: split/local is missing its series argument
*** Where: split
>> split/local "123"
*** Script Error: split/local is missing its dlm argument
*** Where: split
>> split/local "123" space
*** Script Error: split/local is missing its s argument
*** Where: split
>> split/local "123" space 'what
*** Script Error: split/local is missing its num argument
*** Where: split
>> split/local "123" space 'what 1337
== ["123"]
>>
```

meijeru

[14:36](#msg58fa18e0d32c6f2f09297cf5)@toomasv Indeed; according to the source (the ultimate arbiter) `insert` is not defined for `map!` values. You might raise an issue.

9214

[14:37](#msg58fa19298e4b63533dee6d91)@9214 jeez, I'm too sleepy today, just get what `/local` means :(

meijeru

[14:38](#msg58fa1966881b89e10171729e)It is true that one can pre-set local variables by adding the /local refinement to the call, but it is not recommended :smile:

dockimbel

[15:23](#msg58fa23dfc1d3b5015408aeaf)@toomasv `help` is just extracting the info from functions, it doesn't rely on any document. So, what you see in `help`'s output is what is in the function (try `probe :insert`). And yes, `map!` should be excluded.

rebolek

[16:47](#msg58fa378dad849bcf42a8531d)@9214 `/local` is standard practice to define "local" words. See http://red.qyz.cz/safe-and-persistent-locals.html for some details.

9214

[16:47](#msg58fa37a812d2409935862aac)@rebolek I remember your article about it

[16:47](#msg58fa37b5881b89e101720876)ah, too late, you edited your comment :D

rebolek

[16:47](#msg58fa37bc8bb56c2d11cd5ff3):)

[16:48](#msg58fa37d3cfec91927260784f)yes, ctrl-v vs cmd-v :)

[16:51](#msg58fa38963e27cac331aeb56a)Anyway, `/local` is standard refinement as any other, it is just by convention ignored by tools like `help`.

## Thursday 27th April, 2017

9214

[08:34](#msg5901ad31cfec9192727cd1f7)\[DSL Engineering from Markus Voelter](http://voelter.de/data/books/markusvoelter-dslengineering-1.0.pdf), potentially useful `parse` and dialect -oriented book.

gltewalt

[22:48](#msg59027540cfec919272807445)Target for making Red jobs  
https://imgur.com/gallery/jeifK

geekyi

[22:55](#msg590276cfc1d3b50154298f92)How similar is `/refinement` to the term used \[formally](https://en.wikipedia.org/wiki/Refinement\_%28computing%29#Refinement\_types)?

greggirwin

[23:01](#msg5902782ecfec919272807dc9)Only to the extent of clarifying something.

## Saturday 29th April, 2017

GiuseppeChillemi

[09:31](#msg59045d736aea30763d5347b2)Hi Everyone, it is nice to be here !

[09:32](#msg59045daf6aea30763d5348a3)I see a lot of good work going on !

[09:32](#msg59045dc0d32c6f2f09505ed6)I have one simple question about RED/GUI

[09:33](#msg59045dd9587a245e245d3039)Do we have text tables ?

meijeru

[09:41](#msg59045fdc12d2409935ad0680)If you mean multi-column ones: not yet! :worried:

pekr

[10:00](#msg59046443d32c6f2f0950762f)@GiuseppeChillemi actually missing grid widget might be a show stopper for you, if you have DB related apps in mind. We should probably move the discussion to GUI channel. I wonder, how far could we get with custom, even simple R2 VID like list-view attempt ...

GiuseppeChillemi

[10:09](#msg5904663c8bb56c2d11f459fc)@pekr I am new here. Where do I find the GUI Channel ?

[10:09](#msg5904665acfec919272878daf)Found...

greggirwin

[10:30](#msg59046b2f6aea30763d537294)Welcome @GiuseppeChillemi !

dockimbel

[16:25](#msg5904be60cfec91927288b701)@gltewalt Thanks, interesting graph indeed.

GiuseppeChillemi

[18:56](#msg5904e1f76aea30763d551fc2)Thanks ! @greggirwin

BlackATTR\_twitter

[20:51](#msg5904fccf8bb56c2d11f681d1)@gltewalt Would be nice for Red to become the littlest language in Big Data.

## Wednesday 3th May, 2017

gltewalt

[22:37](#msg590a5bbe12d2409935c391df) https://github.com/gltewalt/red/blob/master/Red-Cloud9.adoc

[22:38](#msg590a5bee8bb56c2d110ad795)I don't remember how to submit the doc with git. (Nor is my repo in synch with the official Red repo)

greggirwin

[22:59](#msg590a60c58bb56c2d110aeae8)Nice @gltewalt. Thanks for writing that up.

gltewalt

[23:00](#msg590a60f708c00c092adf76f0):+1: I hope I did the pull request thingy right

[23:00](#msg590a6112f22385553da0ce53)Just stumbled through it. I don't use git enough to remember things. (I did synch repos)

## Friday 5th May, 2017

gltewalt

[23:32](#msg590d0ba3631b8e4e61a8b062)@greggirwin @Scaremonger  
https://github.com/red/red/wiki/Install-Red-in-Cloud9-IDE

PeterWAWood

[23:33](#msg590d0be6e2285d3b1631367a)Anybody know why this link doesn't take you to the #include section in the pre-processor doc? https://doc.red-lang.org/en/preprocessor.html#\_\_include

gltewalt

[23:38](#msg590d0ce02b926f8a6727cd45)dont know...

greggirwin

[23:39](#msg590d0d1d0a783b6c0a6c232a)@PeterWAWood, your link did, but @gltewalt's did not, for me.

[23:40](#msg590d0d6fac693c532ac562a4)@gltewalt, thanks for putting that in a wiki.

gltewalt

[23:41](#msg590d0db80a783b6c0a6c2562)My link was faulty. When I click on the link that @PeterWAWood pasted, it takes me to the page, but doesn't stay at #include

[23:51](#msg590d0fe69d90dc7a1c4e1e99)@greggirwin Nenad told me to make a wiki page and notify you with the link

## Saturday 6th May, 2017

greggirwin

[01:40](#msg590d298be2285d3b16318a28)Ah, yes. I thought you did it in the main Red wiki. I'll migrate it over.

gltewalt

[01:53](#msg590d2cb40dcaa48e6731aea1)I don't think any changes are accepted from non red team there, and I wasn't sure about which section it would fit in

dockimbel

[07:44](#msg590d7edd0dcaa48e6732903b)@greggirwin @Scaremonger I let you decide where to put the Cloud9 link on the wiki home page.

[07:50](#msg590d80400dcaa48e67329389)@gltewalt I added your link to the web site in http://www.red-lang.org/p/documentation.html

[07:51](#msg590d809a33e9ee771c7bf13f)@gltewalt If you can provide me with a nice screenshot or gif-anim (I can't find the one you posted anymore), I would be glad to tweet it with the link to your description.

## Sunday 7th May, 2017

dockimbel

[06:30](#msg590ebeea9d90dc7a1c5380bb)@gltewalt Sorry to bother you with that, but could you please make one shrinked horizontally, to remove most of the empty space in the middle? Also a high-resolution one is preferrable, so it can be zoomed by readers.

geekyi

[20:32](#msg590f846f9d90dc7a1c563c08)@gltewalt can you resize browser window to get rid of empty space without text?

gltewalt

[20:33](#msg590f84990dcaa48e6739937f)I dunno. Using snipping tool so I'm not sure it applies?

[20:43](#msg590f86f92b926f8a67300698)http://i.imgur.com/n15G3Yk.jpg

## Monday 8th May, 2017

dockimbel

[01:36](#msg590fcb86631b8e4e61b1e193)@gltewalt Thanks, I can crop it more now, no problem.

## Wednesday 24th May, 2017

meijeru

[20:29](#msg5925ed342b926f8a678c7c65)It has occurred to me that the native function `construct` is without any documentation (docstrings are missing). May we know what it is intended to do?

greggirwin

[20:37](#msg5925ef1b9f4f4ab05bf9bd5c)Makes an object without evaluating the spec. Safe for making objects from untrusted data.

## Thursday 25th May, 2017

meijeru

[07:26](#msg59268721f3001cd342588f2c)I see. And what does the refinement `/only` do?

greggirwin

[07:37](#msg592689bdf3001cd34258997d)Looks like it prevents logic and none words from being reduced:

```
>> probe construct [state: true value: none]
make object! [
    state: true
    value: none
]
== make object! [
    state: true
    value: none
]
>> probe construct/only [state: true value: none]
make object! [
    state: 'true
    value: 'none
]
== make object! [
    state: 'true
    value: 'none
]
```

dockimbel

[07:40](#msg59268a85631b8e4e610f618b)@greggirwin That's easily fixable.

meijeru

[08:58](#msg59269c9b2b926f8a678f3277)If you fix that, what remains the point of having `/only`?

geekyi

[11:21](#msg5926be41cb83ba6a41f9db58)@meijeru

```
>> ? construct
USAGE:
    CONSTRUCT block /with object

DESCRIPTION:
     Creates an object, but without evaluating its specification.
     CONSTRUCT is a native value.

ARGUMENTS:
     block -- Object specification block (Type: block)

REFINEMENTS:
     /with -- Provide a default base object
         object -- (Type: object)
```

One of the more useful functions to load options safely: \[rebol docs](http://www.rebol.com/docs/words/wconstruct.html)  
`/only` is an addition I didn't know about. Looks like it simply doesn't \[`reduce`](https://github.com/red/red/commit/d2b8caa4121bbb53bdf66ba7bb901fd25ab59414#diff-47bd63b2c65d7245defba4efb9d5e84dR534) logic and none values.  
I think maybe doc means there's others that can be added? (I somehow missed Gregg's reply. Does exactly as he says).

meijeru

[12:13](#msg5926ca5efa63ba2f767bde26)The help you showed comes from Rebol? It sure doesn't come from Red. If if is correct, may be someone can do a PR to add it...

greggirwin

[15:30](#msg5926f87afa63ba2f767cb573)I have a note to add doc strings to `construct`. @dockimbel, it's by design (from looking at the code), so nothing to fix. Maybe it was an experiment, hence no docs?

dockimbel

[15:52](#msg5926fdc8eec422e415eadfe3)I don't recall precisely how it was implemented, just that it was a minimalist implementation. I don't think we have any tests for it.

greggirwin

[15:58](#msg5926ff1600efc2bb3ea43145)`/only` just suppresses reduction of all the logic words and `'none`. I know using `construct` in R2 was confusing at times, when dealing with loaded data (e.g. config files), where it wasn't clear whether users needed to use lit-word syntax, or just words. I think the default behavior in Red is correct. `construct/only` doesn't appear to be used anywhere.

dockimbel

[16:03](#msg592700505e34568d5e8e64b5)@greggirwin It seems it changed a bit in R3, with some limited evaluation by default. Looks like a useful improvement a priori.

greggirwin

[16:08](#msg59270183fa63ba2f767ce575)Indeed. I didn't check R3. Same there.

meijeru

[19:33](#msg592731a6eec422e415ebcd8d)"`construct/only` doesn't appear to be used anywhere (in the toolchain I suppose)" I can confirm that with my grep

```
>> grep/quiet "construct/only" %/C/Projects/Red/sources/
done, checked 206197 lines in 480 files/urls in 3307 msec,
found 0 matches
```

dander

[19:49](#msg5927354900efc2bb3ea525c5)should also search for `construct/with/only` too, right? Doesn't look like it shows up either...

meijeru

[20:30](#msg59273eee9f4f4ab05bff29d5)Indeed!

## Friday 26th May, 2017

greggirwin

[00:18](#msg592774502b926f8a6792dd24)Good catch @dander. I also just grepped for `construct/only`.

## Wednesday 31st May, 2017

9214

[18:09](#msg592f06e700efc2bb3ec2e490)to @greggirwin and others: when writing wiki articles, you can enable syntax highlighting in code snippets by writing language name after first three backticks (e.g. `Red`)

greggirwin

[18:12](#msg592f078038b37b982843091b)Thanks!

## Tuesday 13th June, 2017

eranws

[02:11](#msg593f49d4f6a78eab4841f208)Hello redders, I think I have finally found the right place to share my thoughts in

[02:14](#msg593f4a97ca6d4ae80c0a1a52)I have made a small document with mostly links, i can share it here if anyone interested.

rebolek

[04:05](#msg593f646fc59bd9c4640e4d47)@eranws of course, share it, please

greggirwin

[05:23](#msg593f76e0142826e972ad1214)Yes, please!

## Thursday 15th June, 2017

eranws

[01:39](#msg5941e53bf6a78eab484cc7c4)Didn't mean to write an essay... https://docs.google.com/document/d/16BNzdBtaZX1I3D7EOn3cVdQ1WIQTfk7eRgYyjNdDH6w/edit?usp=sharing

[01:39](#msg5941e56d142826e972b7882f)@rebolek great articles in your blog! why did you stop?

greggirwin

[03:32](#msg5941ffd302c480e672464de1)Good thoughts @eranws. Thanks for posting them.

rebolek

[05:59](#msg5942224631f589c64fab5a89)@eranws Thanks! I didn't stop, I will certainly add something new.

## Thursday 29th June, 2017

koba-yu

[12:40](#msg5954f5576ae41d5d33991a50)Hi, I am now trying to translate Redbin format document to Japanese. At the beginning section, it says "The user interface for Redbin format access will be provided by load/binary and mold/binary".

[12:41](#msg5954f58511755ab05635409f)I guess not "mold/binary" but "write/binary", am I correct?

[12:42](#msg5954f5b5bf7e6af22c87141e)"mold" seems not to have the refinement.

9214

[12:43](#msg5954f5e65a1ab55f64394280)@koba-yu neither do `load`

```
>> ? load
USAGE:
     LOAD source

DESCRIPTION: 
     Returns a value or block of values by reading and evaluating a source. 
     LOAD is a function! value.

ARGUMENTS:
     source       [file! url! string! binary!] 

REFINEMENTS:
     /header      => TBD.
     /all         => Load all values, returns a block. TBD: Don't evaluate Red header.
     /trap        => Load all values, returns [[values] position error].
     /next        => Load the next value only, updates source series word.
        position     [word!] "Word updated with new series position".
     /part        => 
        length       [integer! string!] 
     /into        => Put results in out block, instead of creating a new block.
        out          [block!] "Target block for results".
     /as          => Specify the type of data; use NONE to load as code.
        type         [word! none!] "E.g. json, html, jpeg, png, etc".
```

koba-yu

[12:43](#msg5954f608ad9c781843b1afca)Ah...just not implemented yet?

dockimbel

[12:44](#msg5954f637329651f46e360fd2)@koba-yu Right, not implemented yet. It will be supported by `load/binary`, `mold/binary` and `save/binary`.

[12:46](#msg5954f69c5a1ab55f643945fd)@koba-yu It's great to see someone working on a Japanese translation! :+1: Is it the first part you're translating or, did you already translate some other pages already?

koba-yu

[12:46](#msg5954f6b36ae41d5d3399202f)@dockimbel Thank you, I just translate the sentence literally

[12:47](#msg5954f6e311755ab0563546ff)well, I translate the doc file alphabetically so,

[12:48](#msg5954f7084bcd78af565a0e71)draw, gui, libred, map, overview, ownership, preprocessor, reactivity,readme are done

dockimbel

[12:48](#msg5954f72311755ab0563548dc)That's fantastic! :clap: Let me know when you finish, so I can announce it on Twitter!

koba-yu

[12:52](#msg5954f827c101bc4e3a32dbf6)@dockimbel Thank you! Documents that are not translated yet look tough...They are big pages! but I want to keep tranlsating

dockimbel

[12:53](#msg5954f8654bcd78af565a160a)@koba-yu Feel free to ask any question about the docs content here.

koba-yu

[12:55](#msg5954f8a9ad9c781843b1bfe4)@dockimbel Thanks. I hope I can understand Red more by translating.

## Sunday 13th August, 2017

solisoft

[07:03](#msg598ff9c480d90ca024f382d8)H there, I'm following red since few months ... never took time to really use it

[07:03](#msg598ff9dc4bcd78af563b14cb)I'll try to create a lib for playing with arangodb database

[07:04](#msg598ff9f2bc464729747aab11)there is a simple RESTful API

rebolek

[07:06](#msg598ffa71614889d47542871c)Hi @solisoft , using REST is easy with Red.

solisoft

[07:06](#msg598ffa91162adb6d2eee729e)yes I saw it and arangodb is working on linux/osx/windows

[07:11](#msg598ffba6614889d4754289c5)I moved from osx to linux waiting GTK3 version now :)

koba-yu

[15:26](#msg59906f9ec101bc4e3a137ebc)@dockimbel Hi, I have just made pull request about Japanese translated documents. If there is something wrong, would you let me know please?

greggirwin

[17:45](#msg5990903080d90ca024f57264)Thanks @koba-yu! Team Red is in deep-code mode for a short time. Maybe @JerryTsai can connect with you at some point. I don't know what other Japanese speakers we have here, to help with reviewing and corrections. If anyone else would like to assist with that, please speak up!

koba-yu

[23:23](#msg5990df562723db8d5e9ede41)Thank you @greggirwin! deep-coding for next release? It is exciting! As far as I googling, it unfortunately seems we have few Japanese speakers interesting in Red so far...so getting the documents reviewed is a kind of problem. Maybe I should write some Japanese articles to get attentions in Japan.

greggirwin

[23:33](#msg5990e1e176a757f8089f7dc1)That would be great @koba-yu. In the meantime, you are our lead Japanese translator! Congratulations!

[23:36](#msg5990e2744bcd78af563e034e)Not that I have any authority. :^)

koba-yu

[23:39](#msg5990e345ee5c9a4c5fb96f05)@greggirwin Haha, thank you! Your congratulation is enough to get happy! :smile:

## Tuesday 15th August, 2017

geekyi

[13:34](#msg5992f86aee5c9a4c5fc1cce7)Regarding https://github.com/red/docs/pull/23#issuecomment-322466373 , would it be good to change all `syntax` blocks in the docs?

[13:35](#msg5992f8ab2723db8d5ea70cd7)From:

```
*構文*
----
title <text>
```

to:

```
.*構文*
[source,red]
----
title <text>
```

[13:36](#msg5992f8f5614889d4754dcf06)Looks like the more correct way even from the syntax highlighting here in gitter! :smile:

## Wednesday 16th August, 2017

koba-yu

[00:32](#msg59939288614889d47550bb34)Thank you @geekyi !  
I made test branch on my fork.

https://github.com/koba-yu/docs/blob/work/ja/vid.adoc

It seems work well! My local gitbook by this branch looks ok too.  
If this change would be approved, I can do change other language docs, it may not be difficult replacing.

geekyi

[07:09](#msg5993ef9c614889d47552316d)More details: :point\_left: \[August 15, 2017 5:38 PM](https://gitter.im/asciidoctor/asciidoctor?at=5992eb34210ac2692085c46e)

[07:10](#msg5993efdabc464729748a6e1d)\*\*tl;dr\** both use asciidoctor, but gitbook version is older js, github version is correct

## Thursday 17th August, 2017

koba-yu

[12:23](#msg59958ad076a757f808b3f4cc)Thank you very much for information, @geekyi !

[12:28](#msg59958bd2578b44a046bb9639)At least Japanese document should be modified. Well...both adding a blank line and use "." can be a solution?(sorry, I could not perfectly understand the conversation between you and Dan)

## Friday 18th August, 2017

geekyi

[13:31](#msg5996ec24ee5c9a4c5fd41db1)@koba-yu sorry for the late reply, yes, I'd recommend adding `.`, instead of blank line

[13:32](#msg5996ec8b80d90ca024114545)`[source ..]` part is optional, I guess not relevant here as it isn't exactly \*Red syntax*

[13:33](#msg5996ec9fbc4647297498c134)Looks nice tho

koba-yu

[14:36](#msg5996fb83614889d47560a122)@geekyi No problem, I appreciate your help. I would make a pull request for this problem, maybe adding `.` only for now (I like `[source ..]` but its purpose is diffrent; not to avoid parser confusion).

## Saturday 19th August, 2017

maximvl

[02:52](#msg5997a7d3210ac269209b6217)

```
s: declare struct! [
   a   [integer!]
   b   [c-string!]
   c   [struct! [d [integer!] e [float!]]]
]
In this example, the struct value has 3 members: a, b, c, each with a different datatype. The c member is a struct! value pointer, it needs to be assigned to a struct value to be used. So a correct initialization for the c member would be:

s/c: declare struct! [d [integer!]]
```

[02:52](#msg5997a7edc101bc4e3a32ebcc)am I missing something? where did `e` field of `c` go?

[03:33](#msg5997b1a2a7b406262da41cfb)found a typo here:  
&gt;This is most useful with imported C \*functiosn* that relies on cdecl convention

9214

[05:39](#msg5997cf07162adb6d2e0fb305):point\_up: \[19 августа 2017 г., 07:52](https://gitter.im/red/docs?at=5997a7d3210ac269209b6217) http://static.red-lang.org/red-system-specs.html (for quick reference)

## Wednesday 30th August, 2017

mikeparr

[08:00](#msg59a670a876a757f808fa8690)Incorrect?? info in official docs on Draw. https://doc.red-lang.org/en/draw.html  
It says: draw top-left bottom-right  
but it also works with bottom-right to top-left, and top-right to bottom-left etc.

greggirwin

[17:28](#msg59a6f5bdb16f264642eae6d6)Can you give an example @mikeparr? I'm not clear on what you mean.

mikeparr

[18:07](#msg59a6fec78f4427b462b63eda)This code produces 3 (almost) identically-positioned boxes:

```
Red [needs 'View]
view[
    canvas: base white 200x200 draw[
     box 0x0 100x100   ;TL  BR
     box 97x97 2x2     ;BR  TL
     box 95x3 0x95     ;TR  BL
    ]
]
```

greggirwin

[18:28](#msg59a703b6614889d475a31ba1)Got it. Thanks. We could call them `point-1/2`. Using an image makes it clear that what is considered TL/BR has a distinct effect:

```
img: load https://pbs.twimg.com/profile_images/501701094032941056/R-a4YJ5K.png
view [
    canvas: base 200x200 draw [
        image img 100x100 0x0
    ]
]
```

[18:29](#msg59a7040676a757f808fd717c)Imagine you have a physical box, and you mark a corner `TL`. No matter how you transform or orient the box, the same corner is always marked `TL`.

## Thursday 31st August, 2017

mikeparr

[07:50](#msg59a7bfd9b16f264642ee2c43)I was also thinking about words such as : 'coordinates of a diagonal of the box'. (BTW @greggirwin I noticed the behaviour in your paint code, when creating/dragging a box around.)

## Saturday 23th September, 2017

mikeparr

[08:02](#msg59c614f832fc8b7e40305a1b)I'm looking at the Red Wikipedia page - references.  
2\. Softwarefreedomday - page is empty.  
4\. Red Alert - 'Bad Gateway'  
5\. Devcon 2012 'Bad Gateway'  
I'm thinking that the page looks rather old, does not reflect the current Red.

## Sunday 1st October, 2017

mikeparr

[14:54](#msg59d101c3f7299e8f53951284)On the Redlang.org Documentation page, the link to  
Community-provided learning material:  
Parse expressions (Rebol wikibook)  
Does not now exist.

9214

[15:10](#msg59d1054bbac826f0541fedda)@mikeparr it's still on wikibooks, but wiki name was changed by someone from `REBOL_Programming` to `Rebol_programming`

[15:11](#msg59d105b3614889d4756039d7)\[here's new link](https://en.wikibooks.org/wiki/Rebol\_programming/Language\_Features/Parse/Parse\_expressions)

geekyi

[15:36](#msg59d10b8c614889d475605369)Was just about to point that out. Looks like ladislav (started to?) \[change it in jan 2016, but was only really moved in August](https://en.wikibooks.org/w/index.php?title=Rebol\_programming&amp;action=history&amp;year=2017&amp;month=8&amp;tagfilter=)?

9214

[15:38](#msg59d10be8210ac26920944904)@geekyi yes, I remember that all links in wiki were broken as they pointed to old pages

## Friday 13th October, 2017

gltewalt

[00:22](#msg59e00734e44c43700a27b8dd)@greggirwin  
https://github.com/red/red/wiki/REBOL-Core-Users-Guide-and-Red

One chapter so far

[03:25](#msg59e03232f7299e8f53df361e)Two chapters. 3, 4

greggirwin

[16:13](#msg59e0e62b5c40c1ba79985c8d)Wonderful! Thank you @gltewalt !

rebolek

[16:19](#msg59e0e7a7614889d475ae9615)@gltewalt cool!

[16:21](#msg59e0e80ef7299e8f53e2f7e5)btw some of the examples will also produce error in Rebol, they are not meant to be run, just to illustrate a point. I.e.: `if time > 10:30 [send jim news]` etc

gltewalt

[19:29](#msg59e1142101110b7231b1a915)Yeah, I pointed that out in one section. Some examples are "For example"

[19:58](#msg59e11ad4b20c642429fc179c)Or I thought that I did. I may have taken that out.

## Sunday 15th October, 2017

gltewalt

[22:21](#msg59e3df61177fb9fe7e818a68)@greggirwin 3, 4, and 6  
https://github.com/red/red/wiki/REBOL-Core-Users-Guide-and-Red

## Monday 16th October, 2017

Phryxe

[04:58](#msg59e43c66e44c43700a3a134d)That page is empty.

gltewalt

[06:41](#msg59e454a1b20c642429095916)Ahh, changed the title. Fix it when I get home.

[07:48](#msg59e4646a210ac26920ef9e2c)https://github.com/red/red/wiki/REBOL-Core-Users-Guide:--A-walkthrough-with-Red

greggirwin

[17:56](#msg59e4f2b0e44c43700a3e4088)More good work @gltewalt ! In §8.2 the `join/append` change in the switch example is probably OK, but not exactly the same behavior. That is, `join` will copy the source each time, while `append` will modify it.

gltewalt

[19:24](#msg59e5075fbbbf9f1a386b7966)I'm hoping some of the veterans can make edits if I have things wrong, or if I'm not being clear

greggirwin

[20:37](#msg59e51873177fb9fe7e87ff2d)I'm not reviewing in deep detail, but will in the future. Getting the foundation there, for later tweaking, is \*great\*.

gltewalt

[21:36](#msg59e52668614889d475c216f4)Do I skip chapters like 13, 14, 15?

greggirwin

[22:01](#msg59e52c38e44c43700a3f95b0)For now, yes. For parse, you can include an entry in the wiki that points to Red parse docs.

## Tuesday 17th October, 2017

greggirwin

[18:10](#msg59e6479b614889d475c82153)https://github.com/red/red/wiki/Reactivity

## Wednesday 18th October, 2017

girliechicago

[01:25](#msg59e6ad78e44c43700a478f97)Hello

greggirwin

[01:34](#msg59e6afa2614889d475ca480c)Hello @girliechicago.

## Wednesday 8th November, 2017

gltewalt

[02:12](#msg5a026819d6c36fca31ec47d3)@greggirwin Might be as far as I go on the Walkthrough with Red document for now. I think it should be added to and/or amended by other reducers, first.  
Also, not sure how to make it show up in the list of links on the wiki homepage.

greggirwin

[16:36](#msg5a0332787081b66876c748a8)Thanks @gltewalt! I updated the main wiki page.

## Monday 20th November, 2017

githubnyn

[05:10](#msg5a1263deba39a53f1abf20f3)http://www.red-lang.org/p/getting-started.html on this page the \*reference documentation* link is broken

## Saturday 25th November, 2017

mikeparr

[13:06](#msg5a196accba39a53f1ae26e83)Red-By-Example now has a page on parse:  
http://www.red-by-example.org/parse.html  
It is aimed at beginners. I'm sure there are errors and misunderstanding in it. Please give me some feedback.

9214

[13:42](#msg5a19734fffa3e37919ba87f3)@mikeparr good job! I quickly skimmed through first chapter:  
\* &gt; The 'parse' facility of Red \*\*provides\** helps us  
\* in your first example, perhaps it should be `parse/case`? Otherwise, say, `c3` will be accepted too  
\* to be specific, all `series!` values are parse-able, except for `image!` and `vector!`

[14:37](#msg5a198019541a6f0337116eef)* &gt; For case-sensitive matching, use the \*\*/trace\** refinement.

mikeparr

[15:02](#msg5a19861a232e79134dce380c)@9214 /case, of course. Thanks -will fix. And other stuff as well!

greggirwin

[19:46](#msg5a19c8adffa3e37919bbffb3)Great stuff @mikeparr !

&gt; In fact most of the literal types are recognised.

At the block level, \*all* literal types are supported. You are parsing at the value level.

&gt; REBOL users please note...

Maybe include that `parse` in Red is the same as `parse/all` in Rebol.

&gt; We block input, things are different

\*With* block input, things are different

&gt; §1.8 Also, what it we wanted to change our calculator

Also, what \*if* we wanted to change our calculator

&gt; §1.8 Most literal types (e.g. ...

\*All* literal types (e.g. ...

\- Looks like you have 2 §2.3 entries.  
\- Not sure about the terms `invent` and `absorb`, but will think more about it.  
\- §2.6 I believe `collect` and `keep` are considered keywords, just as `copy` and `set` are, even though they have same-named funcs in Red proper.

mikeparr

[21:04](#msg5a19dad971ad3f87362cd081)@greggirwin thanks Gregg - will fix as appropriate. Re 'all types are recognised' I can't get binary - e.g. #2{11110000 1111 0000} to work.

## Sunday 26th November, 2017

greggirwin

[03:44](#msg5a1a389bffa3e37919bdfd30)

```
>> bin: 2#{1111000011110000} 
== #{F0F0}
>> parse reduce [bin] [binary!]
== true
```

[03:46](#msg5a1a3904df09362e6752f2ff)

```
>> bin:  2#{11110000 11110000} 
== #{F0F0}
>> bin:  2#{11110000 1111 0000} 
*** Syntax Error: invalid binary! at "2#{11110000 1111 0000}"
*** Where: do
*** Stack: load
```

Red has slightly stricter lexing rules on binary than Rebol. Something to pose to @dockimbel when he comes up for air.

mikeparr

[08:23](#msg5a1a7a16232e79134dd22e20)@greggirwin thanks re binary!

[10:22](#msg5a1a95e26b5080350f303c2e)@9214 @greggirwin RBE Parse updated. Gregg: 'invent' 'absorb' in section 2.3 now re-worded

ghost~5585eedf15522ed4b3e236ae

[12:58](#msg5a1aba80df09362e6754b8ae)Hello. In Getting Started With Red page of http://redprogramming.com, the `form` word is used a lot of time without explanation.

mikeparr

[13:25](#msg5a1ac0cfe606d60e340e0e5b)form - try: http://www.red-by-example.org/#form

ghost~5585eedf15522ed4b3e236ae

[13:57](#msg5a1ac8486b5080350f310c2c)Thanks mikeparr

9214

[16:43](#msg5a1aef228b3a9e2c0c1d0ad2)@lkppo learn how to use `?` and `??` functions

ghost~5585eedf15522ed4b3e236ae

[17:03](#msg5a1af3fee606d60e340ee9ad)OK. I will use them. It's just to point a hole in this good doc.

## Tuesday 28th November, 2017

toomasv

[18:18](#msg5a1da868232e79134de2911d)There are some typos in examples of `binary!`:

```
;base 2, with spaces
red>> #2{11110000 1111 0000}
== "11110000 1111 0000"
;base 64
red>> #64{ffff"}
== {ffff"}
```

`#2{...}` should be `2#{...}` and `#64{...}` `64#{...}`. Currently `== ...` shows only string `{...}`. Correct values for those examples are:

```
>> 2#{11110000 1111 0000}
*** Syntax Error: invalid binary! at "2#{11110000 1111 0000}"
>> 64#{ffff"}
*** Syntax Error: invalid binary! at {64#{ffff"}}
```

[18:28](#msg5a1daad1ffa3e37919cef008)Actually:

```
>> 2#{11110000 11110000}
== #{F0F0}
>> 64#{ffff}
== #{7DF7DF}
```

greggirwin

[18:49](#msg5a1dafa0ba39a53f1af6487f)@toomasv, do you mean on Red-by-example? If so, I think Mike has those on his fix-list already.

toomasv

[18:49](#msg5a1dafc4ffa3e37919cf0f58)Yes, it is in Red-by-example

## Wednesday 29th November, 2017

mikeparr

[08:37](#msg5a1e71ceffa3e37919d2e055)@toomasv Binary - RBE - I will investigate. Thanks

## Wednesday 13th December, 2017

Phryxe

[11:11](#msg5a310ac8a2be46682896e0e0)Link to \*specification* document about map! datatype on page http://www.red-lang.org/2015/06/054-new-datatypes-exceptions-and-set.html is dead. It's an old page, but might be good if the links work.

greggirwin

[17:23](#msg5a316226cc1d527f6b2984ec)Not sure if old blogs will get updated. Maybe the best thing we can do is make sure to point people to https://doc.red-lang.org/ for official docs.

## Friday 29th December, 2017

mikeparr

[21:53](#msg5a46b97703838b2f2a4de3f9)Minor changes/additions done to Red-by-example - rejoin added, popup dialog demos in Vid section.

greggirwin

[22:41](#msg5a46c4a868d092bb62035b6c)Cool. Thanks for the update Mike.
