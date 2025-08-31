# Archived messages from: [gitter.im/red/chit-chat](/gitter.im/red/chit-chat/) from year: 2020

## Saturday 11st January, 2020

koba-yu

[14:10](#msg5e19d757b720fa5b3cf6d372)I have noticed using `?` to `image!` in GUI console opens window with the image. It's very useful!

greggirwin

[21:11](#msg5e1a3a18cb2aaa2d7820ab80)It's the little things. :^)

## Tuesday 14th January, 2020

BeardPower

[12:25](#msg5e1db33d65badf754d878491)That sometimes break your neck ;-)

## Friday 17th January, 2020

btiffin

[03:29](#msg5e212a115cd7964660635d96)Found. :-)

[03:36](#msg5e212bd73ea53f0f6639340c)So, why is it hard to like the number 288?

two gross

What did the fish say when it slammed into concrete?

Dam

## Sunday 19th January, 2020

btiffin

[00:51](#msg5e23a8270dbd9379ed5d53cf)Getting used to all the rooms. Someone needs to start planning a marriage and then open a red/wedding.

More seriously: Is there any news/gossip about 64bit Red?

[00:57](#msg5e23a9920289c83ba2c034e7)Oh, and is there a list of red/ rooms?

[00:58](#msg5e23a9ae3ea53f0f6649dbde)Search for red doesn't show the red/help room for instance...

toomasv

[05:30](#msg5e23e9603ea53f0f664b92e2)@btiffin There should be a globe on red ribbon in top-left, click this to get list of rooms.

btiffin

[05:33](#msg5e23ea3e0dbd9379ed5f0863)Thanks @toomasv. I'd been trying the magnifying glass search on the left side bar.

toomasv

[05:41](#msg5e23ebfca1dfaa3ba144171c)You are welcome! :)

pekr

[07:33](#msg5e2406384c1f9679ec0ff602)The globe is actually at the top-right, at least here :-)

toomasv

[07:47](#msg5e2409870dbd9379ed5fc624)Yeah, too early, I saw the world upside down :sleepy:

## Sunday 26th January, 2020

abdllhygt

[21:25](#msg5e2e03e5cd53a80aac2ed373)hi!

[21:26](#msg5e2e03f901914e3e04535578)how are you? what's news?

endo64

[21:27](#msg5e2e045701914e3e04535820)Hi @abdllhygt did you read the latest blog post, if not here it is: https://www.red-lang.org/

abdllhygt

[21:29](#msg5e2e04c7f196225bd6628984)i saw that, i meant about your projects, works.

## Monday 27th January, 2020

ne1uno

[03:01](#msg5e2e526f9ad22d5bd5e7d830)https://www.tiobe.com/tiobe-index top 100. they don't seem to link languages anywhere.

loziniak

[09:28](#msg5e2ead4f3482927279374e2d)Red is in first 100. Cool. And i seems we outperformed REBOL :-)

vazub

[09:37](#msg5e2eaf65f196225bd666fb8e)&gt; Red is in first 100. Cool. And i seems we outperformed REBOL :-)

That is cool! Although, to be quite honest, REBOL seems to be dead in the water for some time already.

hiiamboris

[10:02](#msg5e2eb54fa420263e03a93945)Instead of `red-lang` they use search term `red programming` and then divide the number of hits by 5

[10:03](#msg5e2eb555f85dba0aab21fa81)source: https://www.tiobe.com/tiobe-index/programming-languages-definition/#instances

## Tuesday 4th February, 2020

GiuseppeChillemi

[23:07](#msg5e39f9413aca1e4c5f640851)The strange habit of creating a library of functions and instead of using it, you rewrite the function needed for a script, being insecure of the library proper functioning. It should be some kind of pathology.

## Wednesday 5th February, 2020

Respectech

[23:43](#msg5e3b531e73ddad4acd958038)One of the fun projects I've been working on with Red is recreating a fictional name creator that I originally wrote in the 80s that "learns" from sample data, but not using neural nets. That's gotten me to wonder about experimenting with machine learning using a method other than neural nets.

[23:45](#msg5e3b5388bfe65274eae15a82)I originally wrote the program on a C64 in Basic as I was writing a lot of RPG missions and I needed an easy way to come up with believable names quickly.

[23:49](#msg5e3b5476bfe65274eae15c67)Here are some names randomly generated from my sample data set of male Viking names:

```
Muligbrærsven
Veli
Grig
Rinnbjorn
Benlei
Geinornko
Rilarth
Hrutmu
Biornthor
Farlæin
Nu
Rolfegg
Thigjar
```

hiiamboris

[23:54](#msg5e3b5599433e1d40399a7b99)Nice :) Did you extract n-grams frequency from the sample, and 1st and 2nd moments of name length, or what was the logic of "learning"?

Respectech

[23:57](#msg5e3b565b40da694c5e0daa28)I'm working on two different methods right now. One that identifies phonic sounds and isolates diphthongs, using syllables as the base for building names.

greggirwin

[23:58](#msg5e3b56c3d9895b17c3d3735b)I'm a Viking! `Grig`

## Thursday 6th February, 2020

Respectech

[00:01](#msg5e3b5758433e1d40399a7fab)The second method is agnostic to what characters mean and simply tries to recreate names based off observed relationship between characters. In order to make this method a little better, it would need to take into account 2nd and 3rd order relationships, and then implement an adversarial component to further refine the results.

[00:02](#msg5e3b578273ddad4acd958a85)@greggirwin Yes, you are! And it has also created `Bo` in testing as well.

[00:02](#msg5e3b579adc52c34ace4aadfb)Here are the results from the 2nd method, using Viking female names as the training data:

```
Haror
Thidnný
Lalfri
Thigd
Alfa
Mato
Thorgi
Hogey
Sthauny
Gauðnoll
Tolana
Higunfa
Hunau
Sthofral
```

## Friday 7th February, 2020

GiuseppeChillemi

[15:20](#msg5e3d80589f25c80638efedf7)https://medevel.com/14-new-programming-languages-to-keep-your-eyes-on/

vazub

[15:30](#msg5e3d827f57ada2392dafadd0)Eve is dead, D never got its momentum, V gets bad rep for being a scam (too many false promises).

[15:30](#msg5e3d8299f6ff343a272fd605)Idris is interesting, but not there yet

[15:33](#msg5e3d8342ef0bd00637790a66)Nim is actually quite good, but lacking good push. Pony has potential to become the new Go for those who didn't really marry into Rust. And Racket is the next best thing after Red :))

[15:35](#msg5e3d83ccdb14a95d5999f25e)that's all IMHO, by the way)

greggirwin

[23:52](#msg5e3df829f3718e705dec2f26)Nice to see Red at the top of the list. :^)

## Saturday 8th February, 2020

hiiamboris

[11:53](#msg5e3ea152340a8019bbacf0b8)I think I saw the author of that article recently on red/red...

GiuseppeChillemi

[21:23](#msg5e3f26ef62e9db4bf7881a33)Which are the programming languages/frameworks you would use to do full stack coding if Red/Rebol would not exist?

ne1uno

[21:51](#msg5e3f2d5455b6b04bf69e7576)delphi

GaryMiller

[23:17](#msg5e3f417462e9db4bf7884af6)I tried Nim a bit for my AI but not a large enough community working on it so a lot of the necessary frameworks don't exist. V has a lot of potential and the community has grown tremendously and it's attracted a lot of talent but I'm not going to spend the time porting anything until I see the code syntax has stabilized and the memory management works without leaking. I had a pypy version of my AI running but even though it was 17 times faster than regular Python it did not support a straight .exe or true multi-threading and with the GIL it maybe never will but with Guido gone I guess there's a chance now.

## Saturday 15th February, 2020

Respectech

[02:32](#msg5e4758560ec5ff431e93335c)It looks like @rebolek 's nightly build site has been down since around Feb 2. Does anyone know anything about it?

rebolek

[07:13](#msg5e479a27b3023d5025eff087)@Respectech My VPS was deleted (for alleged hacking) and I need to restore it (of course my backups are suboptimal). So please be patient, I'm working on it.

[07:14](#msg5e479a529d4c83598b906b44)I'll probably move it to a rPi or something like that later so I will have full control.

## Sunday 23th February, 2020

GiuseppeChillemi

[00:35](#msg5e51c8e589f30b1265245026)Rebol Forum from Nick Antonaccio is back http://rebolforum.com/index.cgi

[00:36](#msg5e51c909d97c107ed26d46d4)There has been a hoster property change and the whole CGI system has changed. Now it has been solved.

## Friday 28th February, 2020

GiuseppeChillemi

[15:14](#msg5e592e5f7fef7f2e898e7dd7)The more I learn Red and I have ideas, the more I find the solutions I am searching for on Rebol.org.r, pdf-maker.r, pdf-tables.r, pdf-barcode.r, and also Makedoc software suite... they are all jewels that needs to ported to Red. I am actually forced to use those script on Rebol2 but I hope they will be sooner or later available to Red.

[15:16](#msg5e592ecb4eefc06dcf2455ed)Also there are a lot of great sites which slowly disappears from the web. I am collecting the links to someday recover them using wayback machine.

[15:18](#msg5e592f4d53fa513e285c0efc)I hope I can contribute to preserving all those knowledge that, as successor/clone of R2, represent a gold mine for Red .

[15:20](#msg5e592fb78e04426dd0111351)Also old developers are really important. A lot of historical developers have gone but there is a strong community here. One day, having the right motivation they will come back.

greggirwin

[20:27](#msg5e5977b8ec379e558e9674fd)There are a \*lot* of great old resources out there.

## Monday 2nd March, 2020

Respectech

[21:55](#msg5e5d80e953fa513e2865d7d3)I'm having lunch with Carl on Thursday if anyone has anything they'd like me to pass on to him.

rebolek

[21:57](#msg5e5d813aa157485cb46cb90f)Just say hello and that I hope he'll have a good wine harvest this year :-)

endo64

[22:15](#msg5e5d85713ca0375cb3980d7a)Any chance to ask him to fix R2 SSL (v3) issue, if it's not too much to ask :)

```
>> read https://salesforce.com
** Command Error: SSL Error:  error:14077410:SSL routines:SSL23_GET_SERVER_HELLO:sslv3 alert handshake
```

greggirwin

[22:18](#msg5e5d864aec379e558e9fbc93)Or that 64-bit R2 build... ;^)

Respectech

[22:22](#msg5e5d8739376d882250c911db)I have made notes and hope to get his feedback.

Oldes

[22:40](#msg5e5d8b53b873303e27765ae3)I don't think he will be updating SSL/TLS in R2. It is too much work.

rebolek

[22:46](#msg5e5d8cc3376d882250c91c43):-)

dander

[23:01](#msg5e5d904653fa513e2866054f)I'm curious about making the R2 SDK available, though maybe that need would be obsolete before long...

ne1uno

[23:15](#msg5e5d9399376d882250c93198)there was news about releasing command sdk on rebol.org, doesn't appear to have happened

## Tuesday 3th March, 2020

GiuseppeChillemi

[21:50](#msg5e5ed119ff6f6d2e8882814e)When you make a software in 2 days doing a lot of spaghetti programming, not using local data... and after a month you need 5 days to have the code readable to understand where to make just a little change... DONE!

Oldes

[22:15](#msg5e5ed6fd53fa513e28693514)?

GiuseppeChillemi

[22:31](#msg5e5edacd3ca0375cb39b63b7)@Oldes I had to urgently make a little software and I worked day and night for a couple of days. Now I have to make a change and as code is not properly structured, words have different naming styles for same data and it jumps back and forth, I have spent the last 5 days restructuring it... Now it is ready to let me see where to do that little modification.

## Wednesday 4th March, 2020

endo64

[05:55](#msg5e5f42c4b873303e277a849f)life of a programmer.

## Thursday 5th March, 2020

Oldes

[13:06](#msg5e60f94c90a8295824081e46)@GiuseppeChillemi I've told you many time, that your coding patterns are strange and over complicated ;-)

GiuseppeChillemi

[13:09](#msg5e60fa142e398f46abe043b9)@Oldes My goal is to have a simpler code and more flexible code in the long run. In this scenario, the 2 night works has not been done using the "stange" tecniques but classic ones !

Oldes

[13:13](#msg5e60faff7fef7f2e89a1ba0f)Still your classic technique may be strange to someone else. But that is your fight. I just think that once you start to bind to different function bodies, you will very likely produce hard to debug code.

GiuseppeChillemi

[13:22](#msg5e60fd272e398f46abe04f93)@Oldes I know that during the exploration process everything seems messy but it is like every experiment lab! One of the reasons I am investigating those esoteric coding patterns is to have better tools at the end (I hope). Let's see !

Respectech

[22:57](#msg5e6183e5d045e25825185f65)Carl says "Hi".

[22:58](#msg5e61842ca157485cb4777b5c)We discussed putting the Rebol.org files on github. Carl seemed to think that was a good idea. That way, it could be hosted by one or more people and it could be forked and improved as well, plus he'd retain control of the original sources.

[23:00](#msg5e618476ff6f6d2e888a0ca1)Regarding the R2 SSL error, Carl said he didn't know what was causing it, but he did seem interested in potentially taking a look at it when his life settles down a bit.

[23:00](#msg5e618480d045e258251861a9)Same with the R2 64-bit issue.

endo64

[23:21](#msg5e618965d045e25825186bf4)Thanks for the update @Respectech much appreciated!

[23:22](#msg5e6189c33ca0375cb3a2da2d)SSL is about, SSLv3 is disabled on most servers due to security breaches found recently (few years ago) but I think R2 tries to use it during the handshake and fails.

GiuseppeChillemi

[23:24](#msg5e618a2bd045e25825186ebd)@Respectech Note: I like Rebol.org a lot. It is well built and organized and I think we will lose functionality when moving on GITHUB. If there is anything we could do for keeping it online I will help.

[23:24](#msg5e618a498e04426dd0261aec)Don't forget it is our history and our knowledge base. We must preserve it!

## Friday 6th March, 2020

Respectech

[00:41](#msg5e619c29d045e2582518a39f)@GiuseppeChillemi Putting it on Github would mean that anyone could fork it and put it on their own personal system for local access or a web-facing server for public access. Plus, anyone could play with it to improve it, enhance it, modify it, etc.

Oldes

[07:13](#msg5e61f828ff6f6d2e888b115e)@Respectech what does it mean that \_his life settles down\_?

[07:15](#msg5e61f8aaec7f8746aab77f6c)Btw.. it is not just that SSLv3 is disabled now. The minimal requirement is TLS1.2

endo64

[11:27](#msg5e6233b14599eb28644ae7eb)@Oldes Yes, correct. 1.0 and 3.0 should be disabled. But there are still 1.1 on some servers (and no 1.2 yet), so it could break if its disabled on client side. R2 should try 1.2 first then fallback to 1.1 if possible.

Oldes

[12:03](#msg5e623c27092e167804f56b6a)Supporting anything older than 1.2 is waste of time. All major browsers drop support for 1.0 and 1.1 this month and all the remaining servers will adapt soon. https://www.zdnet.com/article/browsers-to-block-access-to-https-sites-using-tls-1-0-and-1-1-starting-this-month/

[12:05](#msg5e623c87c366b32c9ae03cd6)Anyway.. I don't expect there will be any update in R2. As I said.. it is too much work... at least if there should be no external dependency.

pekr

[12:18](#msg5e623f7fc366b32c9ae04683)Just let's give us IO and ppl could forget R2 ;-)

Respectech

[20:02](#msg5e62ac524aa9482c9ba5e291)@Oldes He is selling his house in California right now. He has several decades of old stuff to get rid of including a lot of his old Amiga collection, design documents, prototypes, etc. I told him that if he autographs his Amigas, he could probably sell them to collectors. :-)

rebolek

[22:25](#msg5e62cdd44599eb28644d0a14)Certainly, I would buy one for sure, if I hadn't sell my firstborn to afford it :-D

GiuseppeChillemi

[22:26](#msg5e62ce1d5614985c97684491)@Respectech those changes frighten me. Why are they happening? Is everything ok in the life of Carl? (No need to anwer publicly, just some thoughts coming from my mind)

About his amiga items: the Museum of Working Informatic is interested in his stuff. The founder, Gabriele, an old friend of mine, is an informatician and also lover of HAM radio like Carl. His team has made great restorations on machines all around the Europe.  
They are specialized in restoring and \*preserving* historical machines, bringing them back into a woking state.  
Some links:

The museum:  
https://museo.freaknet.org/en/  
Some restorations:  
https://museo.freaknet.org/en/category/attivita/restauri/  
Old machines now online  
https://museo.freaknet.org/en/archivio-2/computer-online/

If you create a contact with me we could talk about those items as Gabriele asked me many times to get some Amiga hardware to create a section for this incredible machine.

greggirwin

[22:31](#msg5e62cf28e92458449ae191c8)Thanks @Respectech.

Respectech

[22:45](#msg5e62d29463d3f3203464b690)@GiuseppeChillemi No need to be afraid. I can't speak for Carl, but I believe he is just trying to have less clutter in his life now that he has moved to Nevada, and the house in California requires too much thought and maintenance.

[22:45](#msg5e62d29b4aa9482c9ba64aa0)I will forward the information you sent to Carl.

GiuseppeChillemi

[22:49](#msg5e62d3954aa9482c9ba64c93)@Respectech thanks.

## Monday 9th March, 2020

Respectech

[19:27](#msg5e669887f046a30bbe528bc5)Just FYI: Carl has read the comments about SSL on R2 - He hasn't made any promises about whether he can / will do anything about it.

endo64

[20:14](#msg5e66a38cff8bf14a5446cf5c)Thank you @Respectech

GiuseppeChillemi

[21:00](#msg5e66ae6da2ccef3232e1f6a5)I have read the beginning of a tutorial on Javascript. My eyes are blooding. I want to have Red in the browser!

rebolek

[21:09](#msg5e66b08b5348b33231b2b52f)@GiuseppeChillemi so you can start adding another target to compiler ;-)

hiiamboris

[21:13](#msg5e66b16ad17593652b72c721)maybe that's why he started learning it ;)

rebolek

[21:19](#msg5e66b2d1e203784a55990afa):-)

dander

[21:19](#msg5e66b2e9a2897318a99aa2f3)maybe skip Javascript and go straight to WebAssembly :smile:

GiuseppeChillemi

[21:33](#msg5e66b617f046a30bbe52efa0)I have a long term plan to create applications for the browser. Also: my curiosity wishes to know the reason why javascript is so widely used, apart from being embedded in the browser; Topaz emits Javascript code and Ren-C has some interaction with the broswer. It is enough to start exploring this world.

[21:34](#msg5e66b66347b424792538273f)I can also add another target to the Red compiler, but you have to wait 10 years. I suppose it would be faster if people that already know compiler technology does this in place of me.

## Tuesday 10th March, 2020

GiuseppeChillemi

[09:11](#msg5e6759aa80cc7b7924b5646c)@rebolek even chaos could be on topic, its a subspace of the chaos. Just consider all your thoughts regarding a topic taking shape.

[09:16](#msg5e675afde203784a559a9e70)This because this chaos is not really generic chaos, its elements are not fully random, there are forces driving them like the category of elements, the final goals, the theory and the rules governing the topic that exists before we discover.

rebolek

[09:32](#msg5e675ec5ff8bf14a5448ac84)While this is an interesting point of view, let's keep the rooms on topic, so others can see thru the chaos :-)

pierrechtux

[09:36](#msg5e675f8580cc7b7924b57380)@Respectech Please send Carl all the most respectful and kindest regards from Southwestern France, on my behalf.

[09:36](#msg5e675fb1ff8bf14a5448af21)@rebolek So chit-chat is not chaos?  
Why not make a red/chaos gitter room then?  
:-s

rebolek

[09:37](#msg5e675fdca2897318a99c39de)@pierrechtux on the contrary, chit-chat and sandbox are islands of chaos in the ocean of order :-)

pierrechtux

[09:38](#msg5e676000a2897318a99c3a0b)@rebolek chaoticly yours...

[09:39](#msg5e676049f046a30bbe54832c)I'm not too often connected to the Red world, and any time I come back here, I try to read what's going on, and, to be honest and frank, a certain feeling of chaos systematically invades me while trying to understand discussions!

rebolek

[09:40](#msg5e676078ff8bf14a5448b214)That means we should require staying on topic more strictly

[09:40](#msg5e67608980cc7b7924b5751f)Also when Gitter's threads move out of beta, it could help, I guess.

pekr

[09:40](#msg5e67608df046a30bbe5483b3)I think that Pierre might refer to the lack of official news maybe?

[09:41](#msg5e6760b38011bb652a043590)@pierrechtux Do you know of the following site? Nice to watch the overal progress - https://progress.red-lang.org/

pierrechtux

[09:41](#msg5e6760b402dbe022a17a1e0e)Well... I'm not sure that there's a proper way to unchaotize this linear discussion tool...

rebolek

[09:41](#msg5e6760ba5348b33231b46177)@pekr "Soon™" is not enough for you?

pekr

[09:41](#msg5e6760d295b8ff0bbfa74bad)@rebolek still waiting for an Amiga announcement of the next kernel to be used :-)

rebolek

[09:42](#msg5e6760fca2ccef3232e3a1d5)Isn't Amiga currently in some nonsensical legal battle between cloanto and hyperion?

pekr

[09:43](#msg5e6761348e423969577c2c47)Amiga is in chaos for quite some time already :-)

pierrechtux

[09:43](#msg5e67614da2897318a99c3d04)&gt; I think that Pierre might refer to the lack of official news maybe?

No, not really: I read the announcements whenever I can. But I must confess that sometimes I just don't fully understand... For instance the "lexer" word still bears a lot of mystery for me. "Fast" I can understand. Both words together are still quite unclear.

[09:44](#msg5e676163145f4d6956307ba8)&gt; Also when Gitter's threads move out of beta, it could help, I guess.

Y E S ! !

[09:45](#msg5e6761a947b424792539c30e)&gt; Just FYI: Carl has read the comments about SSL on R2 - He hasn't made any promises about whether he can / will do anything about it.

Carl Read?

Oops... #chaos

[09:46](#msg5e6761de145f4d6956307c76)Yes, the issue on Rebol 2 64 bits on GNU/Linux is quite annoying.

[09:48](#msg5e676285f046a30bbe54876a)During my daily Rebol coding, I often use the "REBOL Word Browser" (http://www.rebol.com/view/tools/word-browser.r), I find it extremely handy.

Is there already a Red version of it, or should I just make it?

rebolek

[09:49](#msg5e6762ad02dbe022a17a2231)I'm not sure there's already one, so it would be great if you'll do it.

pierrechtux

[09:49](#msg5e6762c2a2897318a99c405d)@rebolek Perfect. I'm starting right now.

rebolek

[09:50](#msg5e6762d2ff8bf14a5448b73b)@pierrechtux great! I'm looking forward to test it!

pierrechtux

[09:51](#msg5e676333a2ccef3232e3a6e6)My github repository is more related to geology; it is probably not the most appropriate place for such a tool.

[09:52](#msg5e67634747b424792539c75e)I guess that I'll just make up another repository. And I'll take this opportunity to flee away from that Crimosoft github, probably towards gitlab.

[09:52](#msg5e67636cd17593652b747787)@rebolek Thanks for your encouragements!

rebolek

[09:59](#msg5e6764fe145f4d6956308319)@pierrechtux gitlab is good, try it

Oldes

[11:25](#msg5e67790c8e423969577c7585)@GiuseppeChillemi problem is not \_charactes availability tightening\_, but real use cases which you would like to solve with your double char solution.

GiuseppeChillemi

[11:58](#msg5e6780d5a2897318a99ca508)The use case is implicit into the question.

Oldes

[12:40](#msg5e678ab695b8ff0bbfa7d99e)Than I don't understand what you are requesting ;-)

hiiamboris

[12:56](#msg5e678e6df046a30bbe551728)I think he just wanted to \*share his idea* of how lexical forms can be made infinite (though unpractically ugly), without having any concrete use for those forms ☻

rebolek

[12:58](#msg5e678ed8f046a30bbe551953)theoretically, every possible value is hidden somewhere in the π. So let's use it!

hiiamboris

[12:59](#msg5e678f2f47b42479253a6312):D

GiuseppeChillemi

[13:14](#msg5e6792cc145f4d6956312826)Let's end the lexical space and we will see another theorem in action: an ugly solution becomes fantastic once you have no other available choice. ;)

dander

[16:45](#msg5e67c40c02dbe022a17b6add)@pierrechtux the 'lexer' is the thing which takes raw text and converts it into red values/code. My understanding is that they are speeding up that process, but also adding new ability to do things like test some text to see what kind of value it is before loading it, which will largely help with giving more control for the Red internals - so it may be hard to see the benefits because the driving need is somewhat low-level. But beyond the ability to load large amounts of data much faster, there should also be new opportunities for different kinds of tooling. For instance, this should make it easier to build a line number index to show where in a file an error occurs.

[16:45](#msg5e67c42480cc7b7924b6cd96)I hope I've represented that well enough

Respectech

[17:21](#msg5e67cca28011bb652a05a8c6)@pierrechtux I have sent your regards to Carl, and reminded him about moving rebol.org to Github.

greggirwin

[20:19](#msg5e67f63fcc10be22a07a86e5)@pierrechtux https://github.com/red/code is a good place for a word-browser port.

[20:19](#msg5e67f66780cc7b7924b7642f)@toomasv has done some ports already (e.g. EasyVID, EasyDraw), which may provide some hints for you.

hiiamboris

[20:40](#msg5e67fb4b145f4d6956328460)&gt; EasyVID, EasyDraw

what are these?

greggirwin

[20:54](#msg5e67fe90e203784a559c9fdc)They are something Carl called "interactive documents". A live literate program if you will.

https://github.com/toomasv/makedoc

And, @toomasv, "Redaptor" makes me smile. :^)

[20:56](#msg5e67fefb80cc7b7924b777c3)We also have some old "Lab" tools for exploration and learning. My gists may be broken, as they are quite old now. Not sure if I put my Math-Lab out there.

[20:58](#msg5e67ff8380cc7b7924b7794d)\[fill-pen-lab.red](https://files.gitter.im/red/chit-chat/wafL/fill-pen-lab.red)

[20:58](#msg5e67ff8ad17593652b76746e)\[gradient-lab.red](https://files.gitter.im/red/chit-chat/PWmM/gradient-lab.red)

[21:00](#msg5e68000b85f81e18a8fa3f3d)\[math-lab-2.red](https://files.gitter.im/red/chit-chat/VbJS/math-lab-2.red)

## Wednesday 11st March, 2020

planetsizecpu

[09:41](#msg5e68b24b95b8ff0bbfab0222)@Respectech Thx for updates! I would also like to greet Carl, from the Mediterranean Sea, it would be a pleasure to see him here, after all we are living people, in 50 years we will not be able to, we will be raising mallows 😄

rebolek

[09:45](#msg5e68b331d17593652b781a0f)@loziniak I guess it's a historical artifact. `math` was put there very long time ago, I guess when parse was first released. GTK development started as a community project and only later was added into main Red tree. It's still in separate branch, but it will be merged into main sooner or later.

loziniak

[09:56](#msg5e68b5c847b42479253d7b10)@rebolek Android support \[started in 2013](https://www.red-lang.org/2013/08/033-released-shared-libraries-and.html), and last commit in \*android* branch is from 2015. And `math` was introduced in 2016: https://github.com/red/red/commit/4c01b64b628c92db8c16c8cd444195bc8647c5c7

rebolek

[09:56](#msg5e68b5e78011bb652a07eb0b)@loziniak Android development is done in private repo

loziniak

[10:03](#msg5e68b77df046a30bbe584950)And that's what \[I was talking about](https://gitter.im/red/bugs?at=5e68b19547b42479253d728c). Probably there are reasons for that, but they are not clearly communicated. This way or another, I regret it being like that.

9214

[10:05](#msg5e68b7efa2ccef3232e7503d)I smell some exaggerated claims here, again. The last public update on the state of Android branch was \[2 years ago](https://www.red-lang.org/2018/04/sneak-peek-at-red-on-android.html).

loziniak

[10:06](#msg5e68b80eff8bf14a544c6314)These are not claims, just my opinion.

9214

[10:08](#msg5e68b8a1d17593652b782a3b)@hiiamboris @proksi21 about the order of precedence: play around, study the implementation and give me examples where (in its current state) it bugs out. If `+ -` have the same precedence, then it doesn't really matter in which order you put them, as long as they come after `** * /` and such.

hiiamboris

[10:09](#msg5e68b8f080cc7b7924b9377e)OK ☻

proksi21

[10:09](#msg5e68b8f55348b33231b80766)+

9214

[10:11](#msg5e68b94480cc7b7924b93807)And yes, the idea was that you can extend the set of operators (e.g. add bitwise support), modify the associativity or shuffle the order around just by modifying the `order`.

proksi21

[10:12](#msg5e68b97402dbe022a17d7e74)Btw, does Red have any "ambassador project"? I mean like Golang - Docker, Elixir - Pleroma etc.

hiiamboris

[10:22](#msg5e68bbdc02dbe022a17d84cb)

```
>> e: [112 % 100 / 4 % 2]
== [112 % 100 / 4 % 2]
>> probe (probe math e) = probe do e
0
1
false
== false
>>
```

[10:23](#msg5e68bc38e203784a559e6806)

```
>> e: [10 / 2 * 2]
== [10 / 2 * 2]
>> probe (probe math e) = probe do e
2
10
false
== false
>>
```

loziniak

[10:24](#msg5e68bc72ff8bf14a544c6d86)@proksi21 I'm not aware of any.

[10:25](#msg5e68bca202dbe022a17d865c)Perhaps there are some notable Rebol apps.

9214

[10:30](#msg5e68bdbf85f81e18a8fc189c)@hiiamboris point taken.

[10:36](#msg5e68bf18145f4d695634601a)WRT `+` and `-`: they can actually be leaved out for `do` to process.

hiiamboris

[10:41](#msg5e68c06447b42479253d9abc)Fair enough

[10:51](#msg5e68c2b8cc10be22a07c43db)one way you can implement `math` is by simply returning a parenthesized form, which one can then `do` at one's will any number of times (with different values)

9214

[10:58](#msg5e68c473cc10be22a07c46f6)@hiiamboris I used this pattern with L-system implementation, where the interpreter returns a "seed" block which you can evaluate whenever you want, or do `loop iterations` to speed up the process. "Call-by-need" I guess.

The trick was that if you say `do` then it keeps track of the history, but `do last` returns only the last iteration.

hiiamboris

[11:00](#msg5e68c4db80cc7b7924b95b5f)nice ;)

greggirwin

[18:48](#msg5e693265145f4d695635bdac)Hmmm, on `math` here, the first example matches Boris' for me, but the second works:

```
>> e: [10 / 2 * 2]
== [10 / 2 * 2]
>> do e
== 10
>> math e
== 10
>> probe (probe math e) = probe do e
10
10
true
== true
```

[18:49](#msg5e6932cae203784a559fd434)And the `%` behavior is simply because `math` is a tiny example dialect. If we want to keep it, it should be extended.

hiiamboris

[18:52](#msg5e693373e203784a559fd618)@greggirwin I was testing the other `math`: :point\_up: \[March 11, 2020 12:52 PM](https://gitter.im/red/bugs?at=5e68b4e9a2ccef3232e74650)

[18:53](#msg5e69339e80cc7b7924bab5aa)You're reading it all in the wrong order ;)

9214

[19:03](#msg5e6935f995b8ff0bbfac9004)The interesting trick is that you can put `/` before `*` and it will be correct (ignoring `%` with `//` for now). Because e.g. `1 / 2` can be interpreted as a fractional number `0.5`.

greggirwin

[19:59](#msg5e694317cc10be22a07d6b53)Bah. :^\\

[20:06](#msg5e6944c05348b33231b9afa5)&gt; A "Let's put some immature code in official repo for others to try, explore, use and possibly improve" way.

From red/bugs, @loziniak if it were easy, everyone would do it. On the one hand, you say you want Android work out there, not private, but you don't want other things out there, like `math`. @9214 said it well, and we do the best we can. FOSS is hard, because you can't please everyone, no matter what you do. We choose to run the project in a certain way, with reasoning and goals behind that. Every FOSS project is different and, just as with development methodologies, there is no "one size fits all" solution.

GiuseppeChillemi

[20:40](#msg5e694cc48e423969578198c1)@9214 if you have some time it would be nice to have another public release of the Android version.

greggirwin

[20:42](#msg5e694d1f02dbe022a17eead2)There is no more time than there is. All is compromise.

GiuseppeChillemi

[20:45](#msg5e694dd7a2ccef3232e91ac9)Let's wait with (im)patience. I would like to help but I am not at the required level.

dander

[21:52](#msg5e695d9d02dbe022a17f12b4)Would `math` be better served as an external module, rather than being built-in? Seeing as there aren't modules yet, there wouldn't be anything to do right now, but maybe in the future it could be moved.

GiuseppeChillemi

[23:50](#msg5e69794b8e423969578203ad)When it's about 10 to 1 Am and, despite you are very tired, your total restructuring of a script works, it happens that you don't believe in it and think: "It can't be, I will check it tomorrow!"

[23:50](#msg5e69795eff8bf14a544ea766)Good night!

## Thursday 12nd March, 2020

Kus3\_gitlab

[02:21](#msg5e699ca385f81e18a8fe79b6)Any information on OSDev with Red?  
How would one write the initial bootloader/bootstrap to load a kernel?

[02:29](#msg5e699e8547b42479253ffe49)I'm looking to have a crossplatform loader that would work on most CPUs.

greggirwin

[02:51](#msg5e69a3cc145f4d695636d2ed)@BeardPower :point\_up:

Respectech

[15:21](#msg5e6a537b85f81e18a8008734)@GiuseppeChillemi It can happen!

GiuseppeChillemi

[19:48](#msg5e6a921e8dad05550a56e92d)@Respectech yes it worked 85% of the code, then I have found a bug and spent half day hunting it! 😁

## Monday 16th March, 2020

BeardPower

[13:23](#msg5e6f7ddbde52695245d9b2f8)@Kus3\_gitlab You need to strip the runtime from R/S and do some linker magic by hand.

[13:24](#msg5e6f7e1c391cb312fae19778)&gt; Any information on OSDev with Red?  
&gt; How would one write the initial bootloader/bootstrap to load a kernel?

There are various loaders that support this but I assume you want to implement them with Red? You need to use R/S for that.

## Wednesday 25th March, 2020

Respectech

[20:25](#msg5e7bbe1f3cf9de712dfc91f0)In the process of learning the OpenSCAD scripting language. I'm longing for the sanity of Red's simplistic syntax and language design. On the other hand, I'm happy that I can now generate 3D models without having to try to manipulate them with a mouse.

## Tuesday 7th April, 2020

Respectech

[19:23](#msg5e8cd3496823cb38acb76620)I know it isn't Red, but I'm hoping someone here will have some insight on how to possibly run Rebol2/View on a headless Linux system. I'd like to use VID to create some images that will be displayed via a webserver:

```
w# ./rebol
REBOL: cannot open X11 window (XOpenDisplay failed)

** User Error: Bad face in screen pane!
** Near: size-text self
```

[19:24](#msg5e8cd3769316f34b8d881d90)I've also tried `./rebol -cswq` with the same results.

[19:27](#msg5e8cd42a1aaf8e4b8e696d59)I'm thinking that maybe I'll have to look into `xvfb`.

9214

[19:27](#msg5e8cd433f450c25cc8c56d9a)@Respectech http://www.rebol.com/article/0545.html

henrikmk

[19:29](#msg5e8cd498fea5216d6963ee5f)I've sometimes wondered, if it was possible to embed a simple bitmap font in the REBOL executable as a fall-back measure for such problems.

Respectech

[19:30](#msg5e8cd4eff450c25cc8c56f76)@9214 Yes, I've already installed the fonts and missing libraries.

[19:31](#msg5e8cd50338198d56a1894da8)Here's the article that I'm writing regarding how to do this: https://ameridroid.com/blogs/ameriblogs/how-to-run-rebol2-scripting-language-on-debian-based-arm-systems

9214

[19:31](#msg5e8cd522e24b4d6c44f1fff6)@Respectech there's also \[this](https://stackoverflow.com/questions/24488331/how-to-start-the-rebol2-view-console-on-a-server).

Respectech

[19:33](#msg5e8cd580e24b4d6c44f2016d)Yes, that's what I'm trying now with `xvfb`. But I am getting a different error:

```
# xvfb-run r2 --noinstall -noviewtop
xvfb-run: error: xauth command not found
```

[19:33](#msg5e8cd58ce7ca460b0645ee37)I'm not sure why it needs `xauth`

[19:38](#msg5e8cd69c1aaf8e4b8e6973b5)Ah, figured it out. Just need to `sudo apt install xauth` and then it works fine.

[19:49](#msg5e8cd95ac52b6a38abceb97d)Updated my above-linked article to show how to do it. Hopefully this helps. This should also work for Red/View if it has similar issues.

GiuseppeChillemi

[22:03](#msg5e8cf8afe24b4d6c44f27402)Meanwhile in Rebol2 kindom:

```
** Script Error: Internal limit reached: parse
** Where: parse-code
** Near: parse text blk-rule: [
    some [
        str:
        newline |
        #";" [thru newline | to end] new: (probe copy..
```

Respectech

[23:41](#msg5e8d0fc51aaf8e4b8e6a18fc)That must be a really big parse.

## Wednesday 8th April, 2020

greggirwin

[01:45](#msg5e8d2ccf16f84f04616321b9)Or something in the parse rules that leads to non-advancing recursion.

GiuseppeChillemi

[09:45](#msg5e8d9d4d38198d56a18b553d)It this: http://www.rebol.org/ml-display-message.r?m=rmlKWMK

greggirwin

[18:37](#msg5e8e19f7e7ca460b0649a264)Hmmm, not coming up for me from that link.

GiuseppeChillemi

[19:14](#msg5e8e22835b98016d6a2245f6)I have used vid extension kit in its release versiono as argument

## Monday 13th April, 2020

PierreChTux\_twitter

[20:21](#msg5e94c9ac5b98016d6a32d3aa)&gt; I know it isn't Red, but I'm hoping someone here will have some insight on how to possibly run Rebol2/View on a headless Linux system. I'd like to use VID to create some images that will be displayed via a webserver:  
&gt;

```
> w# ./rebol
> REBOL: cannot open X11 window (XOpenDisplay failed)
> 
> ** User Error: Bad face in screen pane!
> ** Near: size-text self
>
```

For such issues, I usually run a Rebol/Core, it avoids quite a number of hassles.

I realized that all in all, I don't use /view that often.

If your machine is headless, why would you need view (forgive the absolute stupidity of my question...)?

Respectech

[20:23](#msg5e94ca41cc370f0b07e0d607)@PierreChTux\_twitter I need to create images from layouts. I don't want to display them, but I need to be able to save them as .png or .bmp.

[20:23](#msg5e94ca579316f34b8d9cbaca)I figured out how to do it by the way: https://ameridroid.com/blogs/ameriblogs/how-to-run-rebol2-scripting-language-on-debian-based-arm-systems

## Tuesday 14th April, 2020

PierreChTux\_twitter

[19:30](#msg5e960f4b5b98016d6a37819f)@Respectech Ah, okay. It now makes more sense.

## Friday 17th April, 2020

BeardPower

[12:24](#msg5e999ff5a9ca18620642c33b)Hey there. Does anyone know what is missing here? copy/deep is having the same effect. It does not create a copy:

```
>> a: context [f: make face! []]
== make object! [
    f: make object! [
        type: 'face
        o...
>> b: copy a
== make object! [
    f: make object! [
        type: 'face
        o...
>> a/f/offset
== none
>> b/f/offset
== none
>> a/f/offset: 119x22
== 119x22
>> b/f/offset
== 119x22
```

[12:25](#msg5e99a04674bfed5a1b423369)

```
>> a: context [f: make face! []]
== make object! [
    f: make object! [
        type: 'face
        o...
>> b: copy/deep a
== make object! [
    f: make object! [
        type: 'face
        o...
>> a/f/offset: 119x22
== 119x22
>> b/f/offset
== 119x22
```

rebolek

[12:26](#msg5e99a077a1284c4f20983e63)maybe `copy/deep` is not impelemnted for objects yet?

BeardPower

[12:30](#msg5e99a1705706b414e1d409d3)It is as it works without the context.

[12:30](#msg5e99a17aa412254f2190b30a)

```
>> a: make face! []
== make object! [
    type: 'face
    offset: none
    size: none
   ...
>> b: copy a  
== make object! [
    type: 'face
    offset: none
    size: none
   ...
>> a/offset: 119x22
== 119x22
>> b/offset
== none
```

[12:31](#msg5e99a1b6d65bcf75b5cadf08)Maybe it does not support nested objects?

9214

[12:32](#msg5e99a1d474bfed5a1b423a94)

```
text
>> a: object [b: object [c: 1]]
== make object! [
    b: make object! [
        c: 1
    ]
]
>> set in select copy/deep a 'b 'c 2
== 2
>> a
== make object! [
    b: make object! [
        c: 2
    ]
]
```

BeardPower

[12:33](#msg5e99a22a8e987f3a5e22750f)So what is the matter?

[12:34](#msg5e99a249d65bcf75b5cae29b)No implementation? A bug?

[12:49](#msg5e99a5ebd65bcf75b5caf26d)@9214 What does your example try to show?

[12:52](#msg5e99a686c7dcfc14e2c6b5f5) That it does not copy?

[12:52](#msg5e99a6a85706b414e1d42203)But why?

[12:53](#msg5e99a6dd5706b414e1d42284)Should I create a report?

9214

[13:09](#msg5e99aa94a9ca18620642f1f4)@BeardPower yes, let's confirm it in `/bugs` first.

BeardPower

[13:12](#msg5e99ab4ee920022432b052f4)Alright.

## Sunday 19th April, 2020

endo64

[18:42](#msg5e9c9b9da1284c4f20a2089b)@PierreChTux\_twitter moved from the /help room.  
IIRC rebol.r was loaded from the application path, so someone has write access to that file can inject a function there that can do anything in the system as your user if you execute Rebol with -s flag (no security). It could be difficult to find if rebol.r file has lots of functions in there (just as mine).  
Let's move to chit-chat

PierreChTux\_twitter

[18:45](#msg5e9c9c4d63e7b73a5febef79)Yes, true; my rebol.r is also loaded with tons of useful stuff. But on the other hand, it's my machine, it can do what I can do on it.  
If it's a server: fine, jail it somewhere.

endo64

[19:03](#msg5e9ca08ce920022432ba082c)It's also planned for Red, but it's not a priority and probably will be there after we have `secure` native.

PierreChTux\_twitter

[20:07](#msg5e9caf84d65bcf75b5d50cf8)Fine.

## Monday 20th April, 2020

rebolek

[06:05](#msg5e9d3bb263e7b73a5fee13a9)@PierreChTux\_twitter the preferred way for Red is to compile your own with all functions you need.

PierreChTux\_twitter

[09:06](#msg5e9d6600a9ca1862064f89fe)Fine; but there are not only functions that I usually put in my rebol.r: also objects, variables, connect to the databases I currently work on, etc. In fact, I stuff much of Rebol's magic in this rebol.r

pekr

[10:51](#msg5e9d7ebfd240da243388f1ae)So would it be problem to create a Red View or Core console, which would just run your init script? Just beware the security ...

PierreChTux\_twitter

[11:04](#msg5e9d81ae85b01628f0642943)@pekr No, that wouldn't be a problem.  
I just feel like I'm certainly not the only one to have such a need and to find this sooo convenient, so I guess other people would like to enjoy the same kind of Pure Joy that invades me whenever I launch my fully loaded Rebol.

As far as security is concerned, if I refer to the common uses in PostgreSQL (and they are \*really* touchy about security), similar solutions exist and are used daily, although they are possibly way more potentially dangerous.  
See something like .pgpass for instance: isn't it frightening? Well in fact no, if it's properly used (like anything).

pekr

[12:17](#msg5e9d92db0480c128efd2bf72)IIRC, @rebolek posted a link to a file, where you would inject loading such a file. Or was it something different?

greggirwin

[14:45](#msg5e9db57163e7b73a5ff0538f)I think there will be a wide mix of use cases, targeted at different needs and environments. Certainly a portable environment, with your personal toolbox ready to go, is valuable.

PierreChTux\_twitter

[15:36](#msg5e9dc1630480c128efd3b6e4)@greggirwin «portable environment» and «personal toolbox» are most probably the most adequate descriptions of the stuff that I'm thinking about (and that I'm using daily); although it comes physically as a mere initialisation file; the Rebol magic does all the rest.

greggirwin

[15:37](#msg5e9dc1af471108620548fcbb)Right now I use the same `--catch` trick as @hiiamboris, but I do agree that it's important to have, noting security considerations.

hiiamboris

[15:41](#msg5e9dc2ad8e987f3a5e311c31)Command line option would pose no security threat. And is not a global state, so one could at the same time run/compile scripts with and without the init script.

greggirwin

[15:45](#msg5e9dc38c85b01628f06571a2)It's \*less* of a risk, but not risk free. If someone can mod a file to include their code, they may be able to create a shortcut that uses `--init`. It also ties to a general `config` infrastructure that "scopes" or merges settings, from system env, to user, to config file, to CLI args. This is important in the modern world of devops and distributed agents.

[15:46](#msg5e9dc3d347110862054903f0)And, like CLI, the `config` module is something all Red users should have access to, and which Red uses itself. So all Red apps get it "for free", and we are our own guinea pig.

[16:01](#msg5e9dc759c38aa05a1a8b5937)There's a meta aspect, too, for configs used during the build and deployment process.

[16:02](#msg5e9dc79fe920022432bec7cc)Martin Sustrik had an article on this, and a Cartesian Product lib for configs. I might have tinkered with porting it...

[16:05](#msg5e9dc82f0480c128efd3d206)\[recombine.red](https://files.gitter.im/red/chit-chat/MNja/recombine.red)

hiiamboris

[16:08](#msg5e9dc912d65bcf75b5d99fa4)Hmm. How do you apply cartesian product to configs?

[16:09](#msg5e9dc93d85b01628f0658833)Or it's for config generation during testing?

greggirwin

[16:20](#msg5e9dcbbbd240da24338a6482)http://250bpm.com/blog:91

[16:21](#msg5e9dcbf874bfed5a1b50ca1b)Yes, for config generation, which may apply to deployment as well.

[16:22](#msg5e9dcc5fc7dcfc14e2d55d73)In the world of Infrastructure as Code, and orchestration, I imagine big systems almost have to do something like this.

[16:34](#msg5e9dcf25d65bcf75b5d9b50a)Since we're in chit-chat, I can bring up the Tuplespace model again. ;^) In the old Linda model, there was an `eval` command, so a tuple written to the space was "active", and could then turn into a passive tuple, basically executing data generating code \*in* in the space. In the School of Pirhanas model, agents wait around, and when data appears that they can "eat", they swarm. How you lay out the rules for those agents, their data, code they use, and locality in a modern setup, is up to you.

One idea here is that your pirhanas are all generic agents, or maybe think of them like Agent Smith in The Matrix. They can \*become* anything. Your generative Cartesian system spits out a list of environment specs, how many agents for each, etc.; a controller sees that, spins up the appropriate number of agents, pointing them to the list of specs, and each one `take`s a spec, configuring itself accordingly. The controller checks to make sure the list is empty, and maybe there's a heartbeat/monitoring system as well. You could do things like a supervision tree in Erlang, or have the agent runtime (assuming robustness) `put` a "clone me" tuple if it dies for any reason.

## Wednesday 22nd April, 2020

GiuseppeChillemi

[08:48](#msg5ea004c4727e88014a0b39a6)What can be done in 2 red cells. https://hackaday.com/2020/04/21/a-jaw-dropping-demo-in-only-256-bytes/?fbclid=IwAR3JQ30jN4qr3kY2nK9PPh-V6HBVtcC-B2qbyVWA3u9MVDe10DrVAxpg9so

hiiamboris

[11:13](#msg5ea026c4f8b37f6dac67bbe8)impressive ☻

pekr

[12:05](#msg5ea03313a3612210839747bb)We could embedd few of such demos into Red as an easter egg and noone would even notice :-)

Respectech

[15:57](#msg5ea0696471a34b0149024d63)I truly don't believe that could be done in 256 bytes. I would love to analyze the code.

GiuseppeChillemi

[18:48](#msg5ea0917f2fbcdb22ace62cf7)@Respectech Here is \[code analysis and source](http://www.sizecoding.org/wiki/Memories) (at the end).

greggirwin

[18:48](#msg5ea0918368c6dd2fbca7a232)It's all documented \[here](http://www.sizecoding.org/wiki/Memories)

The ASCII art at the end is astounding as well.

[18:48](#msg5ea09191aeb59a22add676cd)I'm too slow once again. :^)

GiuseppeChillemi

[18:49](#msg5ea0919e71a34b014902beff)@greggirwin It's incredible, we hit return at the same time !

[18:49](#msg5ea091bd35a35031bf7d2ffb)No, to me you were first:

[18:49](#msg5ea091c4989acc6ab7a90f32)\[!\[image.png](https://files.gitter.im/red/chit-chat/YrDc/thumb/image.png)](https://files.gitter.im/red/chit-chat/YrDc/image.png)

greggirwin

[18:49](#msg5ea091d6727e88014a0d58ad)Ha! That's really funny then. Parallel worlds.

[18:50](#msg5ea091f7aeb59a22add677a9)Looks like you were first in that 'shot too though.

GiuseppeChillemi

[18:50](#msg5ea091fc68c6dd2fbca7a2ff)We could ask for a packets arrival time recheck.

greggirwin

[18:52](#msg5ea09253727e88014a0d59c8)Reminds me of the old Dr. Dobbs challenges. They had one, timely as John Conway passed recently, on the Game of Life, which everybody broke the rules on, but produced amazing results.

GiuseppeChillemi

[19:00](#msg5ea09461f39e5c2fbb978441)Here is another review, but not from the author, and \[source code](https://github.com/cesarmiquel/memories-256b-msdos-intro) on GITHUB

hiiamboris

[19:22](#msg5ea0998c285b886ab88ea92a)@GiuseppeChillemi Red cell is 128 bit though, not 128 byte ;) So it's 16 of them

GiuseppeChillemi

[19:29](#msg5ea09b0b35a35031bf7d4c74)There should be some open doors on opposite sides of the universe.

[19:29](#msg5ea09b13be86d031befdd460)\[!\[image.png](https://files.gitter.im/red/chit-chat/3l5k/thumb/image.png)](https://files.gitter.im/red/chit-chat/3l5k/image.png)

[19:29](#msg5ea09b24dc6ae2132b438609)I have been just calculating it !

hiiamboris

[19:30](#msg5ea09b6e312a2d132c2b4318):D

Respectech

[20:18](#msg5ea0a68cbe86d031befdf4de)OK. After reading the code I'm very impressed. Memories is a very good name as I had to dig way back into my 6510 assembler days from the mid-80s to understand the code.

GiuseppeChillemi

[22:02](#msg5ea0befbdc6ae2132b43e63a)@pekr maybe our DNA is done this way. It has something embedded that no one can even notice. The day we will be able to see it we will be amazed!

endo64

[22:34](#msg5ea0c67ff6a6e539796dbb06)Latest update of Windows Terminal Preview solved the cursor keys problem, now Red/CLI can be used with it.

[22:34](#msg5ea0c683a634f42f7af7e867)\[!\[image.png](https://files.gitter.im/red/chit-chat/pEEB/thumb/image.png)](https://files.gitter.im/red/chit-chat/pEEB/image.png)

## Saturday 25th April, 2020

codenoid

[14:51](#msg5ea44e791e3d5e206343514b)hi folks

[14:51](#msg5ea44e7ba634f42f7a016c19)how things going

GiuseppeChillemi

[16:36](#msg5ea46724501f8f72a5040d11)Nice, Red Team has released an exciting update of Trello Tasks.

## Monday 27th April, 2020

PierreChTux\_twitter

[12:34](#msg5ea6d16211ffed12683a0071)@GiuseppeChillemi I suppose that you are referring to this page: https://trello.com/b/FlQ6pzdB/red-tasks-overview

GiuseppeChillemi

[17:55](#msg5ea71c812bf9ef1269aa0668)Yes I was.

## Monday 11st May, 2020

GiuseppeChillemi

[15:49](#msg5eb9742503af9f38ff66a195)Something for RedCV? https://www.zdnet.com/article/microsoft-and-intel-project-converts-malware-into-images-before-analyzing-it/

rebolek

[17:03](#msg5eb9857103af9f38ff66d8ae)@loziniak let me recap:  
1\) I have set `xforwarding` on server (rPi)  
2\) I connect from my notebook with `ssh -X`  
3\) in rPi ssh session, I do `export DISPLAY="0:0"` (I also tried localhost:0, 127.0.0.1:0 and :0)  
4\) in rPi ssh session I do `xterm`

This throws `xterm: Xt error: Can't open display: 0:0` which is basically the same error as I get when I run `view-console`

[17:04](#msg5eb985aa7312422a87db907d)I can run the console on rPi and get the window on my local machine, which is cool but not what I want, I want to run the GUI on rPi and show it on rPi. I just need to do it over ssh as the rPi has no input device.

loziniak

[17:17](#msg5eb988c6faa128031cc5e839)@rebolek it's `DISPLAY=":0.0"`, watch for the colon at the beginning and a dot between zeros.

[17:18](#msg5eb988e63f5b01031940b5dc)and you don't need X forwarding, these are 2 separate "techniques" :-)

rebolek

[17:41](#msg5eb98e56faa128031cc5f880)Ah, ok, sorry. I'll try it.

[17:43](#msg5eb98eb8f8ac2178073e5e53)@loziniak  
Same error:

```
sony@pitlyk:~ $ export DISPLAY=":0.0"
sony@pitlyk:~ $ ./view-console 
No protocol specified
Unable to init server: Could not connect: Connection refused

(view-console:1765): Gtk-WARNING **: 19:42:31.565: cannot open display: :0.0
```

[17:43](#msg5eb98edaa631562f52a3b013)`xterm` throws similar error:

```
sony@pitlyk:~ $ xterm
No protocol specified
xterm: Xt error: Can't open display: :0.0
```

loziniak

[18:09](#msg5eb994c97c04b92f53589613)Hmm I ran out of ideas then :-)

[18:10](#msg5eb9950a3f5b01031940dc2e)It works here when I `ssh` into `localhost`.

rebolek

[18:27](#msg5eb9991b5a0bc5394636b34e)maybe it's because you are `ssh`ing into `localhost` and not a remote machine?

[18:28](#msg5eb999412baa1918546208c3)Nevermind, that's for help anyway.

## Tuesday 12nd May, 2020

hiiamboris

[16:11](#msg5ebacaa8496be6031dfa2345)@Oldes 3 versions with results:

```
"Test: ♠ & ¢ <a> and Δδ"
"Test: ♠ & ¢ <a> and Δδ"
"Test: ♠ & ¢ <a> and Δδ"
Time                 | Memory      | Code
1.0x (33μs)          | 14687020    | [decode-html-entities3 {Test: ♠ & ¢ <a> and Δδ}]
1.15x (38μs)         | 18229792    | [decode-html-entities {Test: ♠ & ¢ <a> and Δδ}]
1.27x (42μs)         | 12405132    | [decode-html-entities2 {Test: ♠ & ¢ <a> and Δδ}]
Time                 | Memory      | Code
1.0x (33μs)          | 14731428    | [decode-html-entities3 {Test: ♠ & ¢ <a> and Δδ}]
1.15x (38μs)         | 17998048    | [decode-html-entities {Test: ♠ & ¢ <a> and Δδ}]
1.25x (42μs)         | 7373852     | [decode-html-entities2 {Test: ♠ & ¢ <a> and Δδ}]
Time                 | Memory      | Code
1.0x (33μs)          | 14642612    | [decode-html-entities3 {Test: ♠ & ¢ <a> and Δδ}]
1.14x (38μs)         | 12523368    | [decode-html-entities {Test: ♠ & ¢ <a> and Δδ}]
1.26x (42μs)         | 12461252    | [decode-html-entities2 {Test: ♠ & ¢ <a> and Δδ}]
Time                 | Memory      | Code
1.0x (33μs)          | 14555748    | [decode-html-entities3 {Test: ♠ & ¢ <a> and Δδ}]
1.14x (38μs)         | 18043864    | [decode-html-entities {Test: ♠ & ¢ <a> and Δδ}]
1.27x (42μs)         | 12461252    | [decode-html-entities2 {Test: ♠ & ¢ <a> and Δδ}]
Time                 | Memory      | Code
1.0x (33μs)          | 9203852     | [decode-html-entities3 {Test: ♠ & ¢ <a> and Δδ}]
1.15x (38μs)         | 12523368    | [decode-html-entities {Test: ♠ & ¢ <a> and Δδ}]
1.26x (42μs)         | 9203852     | [decode-html-entities2 {Test: ♠ & ¢ <a> and Δδ}]
```

```
set 'decode-html-entities func [
		{Creates a new string with possible HTML entities converted to chars}
		val [string!] {Input string}
		/local out s e char
	][
		out: make string! length? val
		parse val [
			any [
				s: some any-except-& e: ( append out copy/part s e )
				| #"&" [
					#"#" copy char 1 4 digits #";" (
						append out to char! to integer! char
					)
					| s: copy char 1 10 chars #";" e: (
						char: select/case html-entities char
						unless char [ char: #"&" e: :s ]
						append out char
					) :e
					| (append out #"&")
				]
			]
		]
		out
	]

	set 'decode-html-entities2 func [
		{Creates a new string with possible HTML entities converted to chars}
		val [string!] {Input string}
		/local out s e char buf
	][
		out: make string! length? val
		buf: clear "12345678"
		parse val [
			collect into out any [
				keep some any-except-&
				| #"&" [
					#"#" collect into buf [keep 1 4 digits] #";" keep (
						also to char! to integer! buf
						clear buf
					)
					| s: collect into buf [keep 1 10 chars] #";" e: keep (
						also any [
							select/case html-entities buf
							(e: :s #"&")
						] clear buf
					) :e
					| keep (#"&")
				]
			]
		]
		out
	]

	set 'decode-html-entities3 func [
		{Creates a new string with possible HTML entities converted to chars}
		val [string!] {Input string}
		/local out s e char buf
	][
		out: make string! length? val
		parse val [
			collect into out any [
				keep some any-except-&
				| #"&" [
					#"#" copy char 1 4 digits #";" keep (
						to char! to integer! char
					)
					| s: copy char 1 10 chars #";" e: keep (
						any [
							select/case html-entities char
							(e: :s #"&")
						]
					) :e
					| keep (#"&")
				]
			]
		]
		out
	]
```

greggirwin

[16:46](#msg5ebad2d1496be6031dfa42e7)@hiiamboris :+1: Now that you have μs formatting, maybe format memory too? :^)

[16:47](#msg5ebad31820eaac1853058da8)Also, for everyone, and to put in the community too, when multiple variations are more than a line or two, and very similar in much of their body, it can help to call out the differences.

[16:47](#msg5ebad33af25ee478069171cd)I might paste these into UltraCompare to make sure I don't miss something. :^)

hiiamboris

[16:49](#msg5ebad37cfaa128031cc95bf1)That's `profile-gab.red` over there ;)

[16:49](#msg5ebad387a631562f52a71327)But good idea

greggirwin

[16:49](#msg5ebad3b47312422a87df1c79)I think it was @toomasv who did some table formatting as well, when we come back to that project.

toomasv

[17:45](#msg5ebae0bdf25ee478069199cd)I did, yes. But it has a bit sloppy interface. Here is what it looks like:

```
>> ? table
USAGE:
     TABLE data columns

DESCRIPTION: 
     Formats block of strings into table. 
     TABLE is a function! value.

ARGUMENTS:
     data         [block!] {Block of strings to format, if there is block instead of 
              string it is interpreted as cell with special format.}
     columns      [block! integer!] "Block of formats for each column."

REFINEMENTS:
     /size        => 
        sz           [integer!] "Table width, default 700."
     /title       => 
        name         [string!] "Layout's title."
     /backdrop    => 
        bd           [tuple!] "Layout's backdrop."
     /flags       => 
        flgs         [block! word!] "Flags for view."
     /margin      => 
        mrg          [pair!] "Sets `origin` for layout."
     /head        => 
        th           [block!] {Table has head with common format. 
                 (`th` e.g [gray white bold ["Col1" "Col2" [right "Col3"]]]).}
     /tight       => Default width is ignored, size is calculated from cells.
     /rows        => 
        rws          [block!] "Block of rotating styles for rows."
     /conditional => 
        cnd          [block!] {Conditional format for specific cells, rows or arbitrary conditions.}
     /lines       => 
        bg           [tuple!] "Color of inter-cell lines."
     /arrows      =>
```

[17:48](#msg5ebae1763f5b0103194462f3)I think it would be better if developed into another DSL.

hiiamboris

[19:05](#msg5ebaf36d10d5ec031a021a83)@toomasv Why not just return a layout (like `layout` does), so it can be inserted into another layout (panel), and then one would be able to do the backdrop, flags etc. oneself?

toomasv

[19:49](#msg5ebafdd3f8ac217807423b4f)Yeah, may be indeed.

GiuseppeChillemi

[19:56](#msg5ebaff5d852efc0adad4649a)I am near the end of the creation of generic code to edit listview rows with input validation. (I am working on Rebol but with Red in mind). My code actually uses some techniques to reuse as much as possible code ed validate data.

To do this task I have had to:

Learn how face/tree works.  
Learn to move around the object (passing it to the line edit window)  
Store data in face/extra (user-data in vid extension kit)  
Build a set of rules to have SET-WORDS and all other data derived from the corresponding FIELD name  
Ideate a way to have these SET-WORDS unique via a panel/field ID, so that you can use the same code to open multiple independent windows  
Learn and face all the problems connected into reusing code  
Build a model to store columns configuration and retrieve them during compose phase  
Build a library of code segments to use via `SELECT` for composing  
Build a validation model, the validation object  
Build the validator library  
Learn how to have return values when a `VID` panel closes  
Define and rreate context and subcontext for functions and child functions

I have to admit that a newbie would be totally overwhelmed when trying to create something like this. We have to find something easier!

greggirwin

[19:57](#msg5ebaff962baa19185465c6af)Sounds like you're learning a lot. :+1:

[19:59](#msg5ebb000d7312422a87df9a50)What you're building is a DB tool, like MS Access or PowerBuilder. Indeed, we want to offer high level features and tooling for things like that.

GiuseppeChillemi

[20:06](#msg5ebb01b67c04b92f535c7eba)Yes Gregg, I have learned a lot, even subtle things like "no copy of objects on R2" (but copy/deep is possibile on Red). During the last days, I have even created a LOAD-LIBRARY script to load the BODY part of a group of functions and reuse those blocks as code segments for composing other code blocks like VID actors ( Also storing and retreiving specific objects prototype is possible).  
Very fun and difficult work (especially because I have not used `PARSE` I still do not manage so well).

[20:08](#msg5ebb022efaa128031cc9e026)This evening I had the VID sub panel working. It is column number and name independent. You give an object and it creates an editing panel that updates back the object and then the listview once closed.

[20:10](#msg5ebb02a93c51a11913f6ac9f)&gt; What you're building is a DB tool, like MS Access or PowerBuilder. Indeed, we want to offer high level features and tooling for things like that.

That is essential for companies. They live choosing records from lists and editing them in subpanels.

## Wednesday 13th May, 2020

toomasv

[15:00](#msg5ebc0b93faa128031ccc82fa)Table formatter \[table.red](https://github.com/toomasv/table/blob/master/table.red).

[15:00](#msg5ebc0b9a2baa191854686744)\[!\[image.png](https://files.gitter.im/red/chit-chat/SdaS/thumb/image.png)](https://files.gitter.im/red/chit-chat/SdaS/image.png)

pekr

[15:01](#msg5ebc0bb77312422a87e24329)Cool 😀

toomasv

[15:15](#msg5ebc0f048c044c19149ae56d)Not for infinite tables though :(.

GiuseppeChillemi

[18:45](#msg5ebc405e10d5ec031a057ddd)Wow!

greggirwin

[19:06](#msg5ebc452220eaac185309578b)Very nice @toomasv! Reminds me, looking at the code, that we need to dust off @rebolek's `stylize` PR and see if we can get that merged. Given the number of refinements, maybe just `/with` is a better option. I've had funcs that grew and got more refinements, and did the same thing. New code could use `/with` but old code still worked. Legacy support is a pain. :^)

I get:

```
*** Script Error: VIEW - invalid face type: none
*** Where: do
*** Stack: do-clip table on-face-deep-change* cause-error
```

The first example dumps a number of dates in the console before the error.

toomasv

[19:24](#msg5ebc49727312422a87e2f594)@greggirwin I don't get this error. Are you using fast-lexer? Date-dumping - yes there remained `probe` in this example. I'll remove it.

greggirwin

[19:28](#msg5ebc4a47f25ee47806954f38)Yes, I'm on fast lexer.

[19:28](#msg5ebc4a5d7312422a87e2f73d)I can try in an older master build.

[19:32](#msg5ebc4b6920eaac1853096918)Doesn't seem happy running in the GUI console. Will have to DL in a bit to test.

[19:33](#msg5ebc4b953c51a11913fa18da)It creates a blank window, hidden, then seems to hang.

rebolek

[21:17](#msg5ebc63dbf8ac21780745dc64)@greggirwin I believe `stylize` may need some changes to be mergeable with current code. I may take a look at it and do new PR.

[21:17](#msg5ebc63f5852efc0adad80202)It would be nice to have it included.

GiuseppeChillemi

[22:56](#msg5ebc7b2cf25ee4780695cdf3)Welcome to 2020 https://youtu.be/qC5KtatMcUw

## Thursday 14th May, 2020

cloutiy

[00:26](#msg5ebc9052852efc0adad86427)@GiuseppeChillemi Impressive, but can it `reduce`?

greggirwin

[00:33](#msg5ebc91f2852efc0adad866f3)Wow. @cloutiy it says it can. Billions of triangles to just 20M. :^)

cloutiy

[00:41](#msg5ebc93b57c04b92f5360a39a)lol

GiuseppeChillemi

[04:57](#msg5ebccfca852efc0adad8e23b)@greggirwin one day we will have the API bindings and to use it rendering engine, se we can REDUCE them!

planetsizecpu

[08:34](#msg5ebd02b2496be6031dfff187)@toomasv Impressive work on tables, keep doing.  
@GiuseppeChillemi It is nothing for our fast-lexer, I am sure we will overcome it soon, just⏳

toomasv

[12:04](#msg5ebd33e209f78877805a5073)@greggirwin It does not have scrolling yet, so you have to ensure there are not too many rows (which may easily happen with examples if you launch the example in a big folder).

[13:43](#msg5ebd4af95dcf0263d4e4a36d)With \[table-style.red]() it can be used now as VID style:

```
view [
	table data ["a" 2 3 "b" 1.5 13% "c" hi %file.red] extra [
		columns 3 
		head [orange white bold ["One" "Two" "Three"] line 3] 
		tight 
		lines [leaf 2x0] 
		border 3
	]
]
```

[13:43](#msg5ebd4affcbc4844096711a1d)\[!\[image.png](https://files.gitter.im/red/chit-chat/UIIs/thumb/image.png)](https://files.gitter.im/red/chit-chat/UIIs/image.png)

[13:47](#msg5ebd4bfbda74582e921b47c2)

```
files: collect [
	foreach file copy/part read %. 50 [
		mod: query file 
		keep file keep mod/date keep mod/time
	]
] 
view [
	table data files extra [
		columns [[left bold 110] [center 120] center] 
		head [gray white bold ["File" "Date" "Time"]] 
		lines 0x1 
		border 1 
		tight
	]
]
```

[13:47](#msg5ebd4bffe36f1840e5618855)\[!\[image.png](https://files.gitter.im/red/chit-chat/5Y12/thumb/image.png)](https://files.gitter.im/red/chit-chat/5Y12/image.png)

hiiamboris

[13:50](#msg5ebd4cad519b852e93f012af)fix the link ;)

toomasv

[13:55](#msg5ebd4db87606a5777f63c946)Ah, sorry: \[table-style](https://github.com/toomasv/table/blob/master/table-style.red)

hiiamboris

[13:56](#msg5ebd4e0009f78877805aa11a)When I double click the header of file table it shows me an edit field with white text on white background ;)

[13:58](#msg5ebd4e81cbc48440967123e5)liek this  
!\[](https://i.gyazo.com/00c8d315c6dda212af941b78a81a3489.png)

toomasv

[14:23](#msg5ebd54535dcf0263d4e4bf2c)But you can still see what's in the field if you select the text.

hiiamboris

[14:23](#msg5ebd54793052af350d689107)Yeah ;)

GaryMiller

[14:24](#msg5ebd54862ac6ef4e88c6edaf)Microsoft beginning to phase out 32 bit https://www.zdnet.com/article/microsoft-takes-a-step-toward-phasing-out-32-bit-pc-support-for-windows-10/

toomasv

[14:29](#msg5ebd55c158741e40952fcdc9)@hiiamboris OK, fixed. Thanks!

hiiamboris

[14:38](#msg5ebd57f27606a5777f63e919)For some reason it doesn't work on fast-lexer btw

[14:38](#msg5ebd57fc2ac6ef4e88c6f978)

```
*** Script Error: VIEW - invalid face type: none
*** Where: do
*** Stack: view layout table on-face-deep-change* cause-error
```

[14:40](#msg5ebd584d5dcf0263d4e4cc0b)I think Gregg reported this issue too

[14:48](#msg5ebd5a4c2ac6ef4e88c70072)boils down to this `v: view/no-wait [] append v/pane layout/only [base]`

greggirwin

[15:06](#msg5ebd5e8709f78877805ad3a1)Nice @toomasv. :+1:

@GaryMiller fortunately it doesn't mean 32-bit \*apps* won't run.

[15:08](#msg5ebd5ed819af2534f3b13da3)@toomasv we should sync up with @rebolek on his `table` style.

hiiamboris

[15:09](#msg5ebd5f4170997963d5584424)@toomasv  
!\[](https://i.gyazo.com/b1944ea3a30fef62b4f6119cdb730801.gif)

greggirwin

[15:10](#msg5ebd5f6a19af2534f3b13f81)@hiiamboris, that's cruel, beating up on his baby like that. ;^)

hiiamboris

[15:11](#msg5ebd5fbd70997963d558461f)The point is it only took to change 3-4 lines to make it stretch ;)

greggirwin

[15:13](#msg5ebd600d09f78877805ad84b)Oh! I thought you were showing resizing issues where no minimum size was enforced.

In that case, well done! ;^)

toomasv

[15:21](#msg5ebd61e52ac6ef4e88c7174a)@hiiamboris Mighty good!

Respectech

[18:38](#msg5ebd901dda74582e921c11ad)@GiuseppeChillemi Impressive rendering demo!

[18:38](#msg5ebd902528b531314906c5cd)@toomasv Great table style!

loziniak

[19:51](#msg5ebda146863019312a5d6659)@hiiamboris but how long these lines were? ;-)

hiiamboris

[19:57](#msg5ebda2ae13878c30b57cdd9f):D :D  
No, totally normal lines. Let me see...

[20:00](#msg5ebda3532ac6ef4e88c7da69)

```
anchors: [scale scale]   ;) in cell/template

template: [type: 'panel anchors: [fill fill]]   ;) in table

#include %elasticity.red   ;) globally

view/flags elastic [      ;) for the Views
   table #fill [...]
   ...
] 'resize
```

[20:00](#msg5ebda35decc55a312d028462)That's it ;)

## Sunday 17th May, 2020

GiuseppeChillemi

[06:16](#msg5ec0d6a020d9bf30576d3e56)Tonight I have dreamed of being at Carl Sassenrath house with him. We exchanged some words about Cindy and his sons, the we moved in a room with a bed for one and a table with a small notebook with many objects around. I have had the sensation it has not been opened from long time. It contained the R2 source. We have talked for a while, I was full of questions but I haven't had the courage to take the discussion. I have only told him "I have many bugs to be fixed but there is a particolar bug which is really important to me". I have left this dream and woke up with the desire of looking at the source with him to see he working on it. I am here to tell you about this dream.

hiiamboris

[07:41](#msg5ec0eabceb9b6f31622a070c)Haha. Those bugs must be really pressing for you ;)

GiuseppeChillemi

[07:57](#msg5ec0ee4d863019312a64e54b)It is just the https one but the to move totally to Red is near ;)

[07:57](#msg5ec0ee6c16ae6a315f235c93)* the time

## Tuesday 19th May, 2020

toomasv

[17:02](#msg5ec41108520b7a38fbde6d39)I had a horror dream:

```
>> func-fabric: func [fs [block!]][foreach [n f] fs [do [set n function [:args [paren!]] f]]]()
>> func-fabric [plus [sum args] prod [n: 1 foreach p args [n: n * p]]]()
>> plus(1 2 3 4 5)
== 15
>> prod(2 3 4 5)
== 120
```

greggirwin

[17:54](#msg5ec41d55940fa238d601bbc5)This is warped. What's weft to do?

[17:55](#msg5ec41d913854713815bb5e10)You know, @hiiamboris is going to rend this into HOF somehow.

[17:56](#msg5ec41de295576839186ca4e5)And if you get curry on this, it may not come out.

[17:57](#msg5ec41e0a6773a13b23ef2ab3)So there. You make me tease apart your code, and you have to tease apart bad puns in return. :^)

toomasv

[18:14](#msg5ec4221570f28c384b85bb4b)Dreaming on:

```
>> func-fabric [curry [i: args/1 foreach [f a] next args [i: do reduce [f i a]]]]()
>> curry(1 add 2 multiply 3 power 2 divide 3)
== 27
```

greggirwin

[18:50](#msg5ec42a716773a13b23ef4e42)Beware the luddites. They'll come after you.

hiiamboris

[19:39](#msg5ec436027da13f3a0ac3c1c0)The horror! The horror! ☻

[19:40](#msg5ec43624990d343a5f3a9cf0)Why not function constructors, and not blocks? ;) So warped...

toomasv

[19:48](#msg5ec4381f940fa238d60204b6)\[!\[image.png](https://files.gitter.im/red/chit-chat/erj8/thumb/image.png)](https://files.gitter.im/red/chit-chat/erj8/image.png)

hiiamboris

[19:49](#msg5ec4384b0c32623a4b441c83):D

GiuseppeChillemi

[22:49](#msg5ec4627f2f83c139ef904334)Do you suffer of tendinitis on fingers or wrist after intensive coding periods?

## Wednesday 20th May, 2020

toomasv

[08:30](#msg5ec4eabbb8869e38c49c7cb7)I don't have periods in coding, so there is no "after" :)

Respectech

[16:16](#msg5ec557f10fbf8b175882fdae)@toomasv I wish I had the time to try to figure out the black magic that is going on in there... :-o

greggirwin

[16:36](#msg5ec55c73d7f8a20ddf807f1e)@GiuseppeChillemi taking care of your body is important, and we don't always do that well as programmers. If you notice pain, especially on a regular basis, listen to your body, take breaks, do hand stretches, and other general exercise. Your hands will feel it first sometimes, but your general health can degrade if you aren't careful.

GiuseppeChillemi

[17:35](#msg5ec56a7e3d81ad775847faee)@greggirwin Thanks Gregg, my body is since ever under heavy pressure. I can only say thanks for having accompanied me in good health until know. I will keep listening to it.  
Maybe the first thing I do will be changing the keyboard as an elevated notebook is not so good.

greggirwin

[17:38](#msg5ec56b2ab761400e29d94ff9)While I dearly love my mechanical keyboard, my daily driver is an ergonomic split design.

GiuseppeChillemi

[22:19](#msg5ec5acdec6541c05d8ee2d99)@greggirwin I think I will try it the split design keyboard. Being a big man, my hands hit the keyboard with a greater angle thank thin people, so I have to rotate them and this requires more mechanical work to the tendons and wrists as they are not in their natural position.

## Thursday 21st May, 2020

toomasv

[20:08](#msg5ec6dfc9ff7a920a72032ecc)Yet another dream. Luckily not so dreadful  
\[!\[guitar](https://toomasv.red/images/Fourier/guitar.gif)](https://toomasv.red/images/Fourier/guitar.gif)

hiiamboris

[20:15](#msg5ec6e1754c9b0f060d167456)Cool path tracer there! :+1:

greggirwin

[20:29](#msg5ec6e49727513a72fba50a07)Nice!

toomasv

[20:40](#msg5ec6e74a2280c80cbfbde396)This was actually an experiment to write and draw automatically on console, but as it seemed too boring, I added jazz episode to wake you up..

hiiamboris

[20:42](#msg5ec6e7b87da67d06fac2ef04)That's why it shows guitar.red there ;)

GiuseppeChillemi

[21:44](#msg5ec6f65a3ffa6106f1c759e0)@toomasv :clap: :clap: :clap:

## Friday 22nd May, 2020

endo64

[00:42](#msg5ec71fe3b101510b200c9040)Cool!

planetsizecpu

[06:49](#msg5ec776149da05a060a235827)@toomasv I wanna dream too!

toomasv

[17:05](#msg5ec806522280c80cbfc0867e)Another, "comrades"  
\[!\[comrades](https://toomasv.red/images/Fourier/boys.gif)](https://toomasv.red/images/Fourier/boys.gif)

hiiamboris

[17:35](#msg5ec80d673ffa6106f1c9de82)magic ;)

GiuseppeChillemi

[18:06](#msg5ec8148a4c9b0f060d194bae)Nice

## Sunday 24th May, 2020

abdllhygt

[11:36](#msg5eca5c3ca91f120a6cbc9e5b)hello

[11:37](#msg5eca5c772280c80cbfc56b21)i want to ask a thing

[11:38](#msg5eca5ca84c9b0f060d1e10ff)i made a web based program for my customer before. now, he wants its gui version.

[11:39](#msg5eca5cd8549761730b544553)i want to make it by red, but i am not sure if red view is enough

[11:40](#msg5eca5d229da05a060a29a4eb)it will be data grid, searching, print document (by printer) too

[11:40](#msg5eca5d392280c80cbfc56d2a)what do you think?

pekr

[11:47](#msg5eca5eea9da05a060a29a8cd)Red maps to the native widgets, and with the more complex ones, there is a problem with the cross platform compatibility. So there is no data-grid yet. But Red supports draw dialect and events, so most probably we should be able to build our own one. There were already some attempts by @rebolek and maybe even others. As for the printing, you would most probably need either to wrap an OS printing API using Red/System, or generate some PDF or a website and get it printed via the browser.

[11:50](#msg5eca5f75549761730b544c53)btw - as a user of Office 365 and its Sharepoint, it contained basic lists. MS slowly advanced them and they have now separated them into a separate product. Reminds me of just a general list / iterator and the abilitiy to display just anything in terms of a cell. https://techcommunity.microsoft.com/t5/microsoft-365-blog/announcing-microsoft-lists-your-smart-information-tracking-app/ba-p/1372233

[11:50](#msg5eca5f97ff7a920a720ace0e)Maybe we could go a similar way - some scrollable list .....

hiiamboris

[12:08](#msg5eca63bf549761730b545736)I have a table prototype in the works, very flexible and easy to use, can render anything in a cell, allows two-way bindings between cells and data, native UI, VID-based.  
If grid is not big - will be nice, but for tens of thousands of rows it will be heavy as each cell is a face (2 faces actually)

pekr

[12:10](#msg5eca642927513a72fbaca315)Nice, thanks for the update on the situation, appreciated!

hiiamboris

[12:10](#msg5eca6442b101510b201398a8)@rebolek has a Draw-based prototype. Fast but will require a loooot of work to add features to it. And all colors have to be predefined.

[12:11](#msg5eca64682280c80cbfc57c99)I personally hate this kind of work: filling UI with colors ;)

[12:11](#msg5eca6472ff7a920a720ad898)This is what a computer should do for me

abdllhygt

[12:13](#msg5eca64d0ff7a920a720ada92)thanks for advicing @pekr @hiiamboris

[12:13](#msg5eca64f03ffa6106f1cec04f)@hiiamboris do you write that lib in red?

hiiamboris

[12:13](#msg5eca64fa3ffa6106f1cec059)Yes I do

abdllhygt

[12:13](#msg5eca6507b101510b20139a90)is this open source? can i see

hiiamboris

[12:15](#msg5eca6577a91f120a6cbcb391)It's a work in progress, I didn't upload it, only yesterday wrote a scrollable panel that would be able to wrap it around as a separate component.  
Some parts of it's design are still pending. But I'll upload something next week.

abdllhygt

[12:16](#msg5eca659d3ffa6106f1cec124)i see

[12:16](#msg5eca65b83ffa6106f1cec14b)i guess that object pascal can be more good for the project

[12:17](#msg5eca65c3f0b8a2053aadb4a2)but i enjoy to write red

hiiamboris

[12:18](#msg5eca661589941d051a1c653f)How big your data is? @abdllhygt

pekr

[12:18](#msg5eca6617ff7a920a720adc23)@hiiamboris maybe I missunderstood. Your model is face based? So no infinite data scrolling? :-)

hiiamboris

[12:18](#msg5eca66333ffa6106f1cec237)@pekr Nope ;) No way! :D

[12:19](#msg5eca6644225dc25f54a1544f)How would you sort infinite data anyway? ;)

abdllhygt

[12:21](#msg5eca66c64c9b0f060d1e25a6)not so big, like 2-3 entry weekly

[12:21](#msg5eca66e7b101510b20139ed0)an accounting program

hiiamboris

[12:22](#msg5eca671a549761730b545e73)@pekr You will be able to do that by declaring a (limited) table, mapping it to a block of data, and remapping it to other positions in that block inside `on-scroll` event

[12:23](#msg5eca67369da05a060a29ba0e)gotta go

abdllhygt

[12:24](#msg5eca67832280c80cbfc58748)on web version, there was no scrolling, but pagination

[12:26](#msg5eca680d3ffa6106f1cec60d)there is mail and printing too in the project

[12:27](#msg5eca68293ffa6106f1cec638)it was more easy on browser (printing) and server (mail by php)

pekr

[12:31](#msg5eca691c549761730b546243)@hiiamboris Yes, that was my idea, to use so called data-window, pointing to certain position of data. I can imagine even a virtual structure for columns, so that you don't need to rebuild the data from query, etc., just map it ... looks promissing. Once you need some tester, I might find some time to volunteer ....

hiiamboris

[14:14](#msg5eca8132549761730b549481)Yes, it already maps to objects (that's my primary need in Red View test system).

[14:14](#msg5eca814a4c9b0f060d1e61ab)&gt; Once you need some tester, I might find some time to volunteer ....

@pekr Great! I'll let you know ☻

## Monday 25th May, 2020

cloutiy

[16:52](#msg5ecbf7d689941d051a2025c6)In one of the last updates on the red-lang.org site, someone had made some talking points regarding Red use case in AI and ML. Saw this today: Model Generates Python Code (https://www.youtube.com/watch?v=utuz7wBGjKM) I certainly don't have the know-how, but I can certainly imagine Red and parse and code is data data is code get into this use case space.

## Tuesday 26th May, 2020

GiuseppeChillemi

[06:41](#msg5eccba337da67d06facfe2d8)The old habit to not delete anything saved my notes. My Red program I use to move my daily notes to the corresponding section (personal, red, commercial..) today had some of its faces empty. I suppose that in some round of loading/moving/saving the garbage collector or some other Red component has cleared face/text. My last backup was several months ago but I have all the original notes whose content I have processed in the meantime. I have to reprocess them again. This will take weeks but it is better than having lost everything. Hope I will find the cause of this data loss.

hiiamboris

[08:26](#msg5eccd2a7549761730b59f5ea)Good way to learn to back things up ;)

GiuseppeChillemi

[10:36](#msg5eccf114f0b8a2053ab3c0f0)... And to implement auto backup in your software!

[13:37](#msg5ecd1ba7f0b8a2053ab45a60)Today I have restored the old server backup I have made last month before moving to the new servers. I am very lucky: I have moved the note archive 1 month ago, just after the last "security backup". So I have to rework the last month and I have lost no more than 1% of notes.

hiiamboris

[13:40](#msg5ecd1c5c4c9b0f060d24c9da)Looks like you're very scrupulous about taking notes ;)

GiuseppeChillemi

[14:07](#msg5ecd22beff7a920a72118873)There I annotate any thoughts on the multiple areas of my life and projects and Ideas I have daily. Then I move them to each area of interest: Company, Red, Psychology, Informatics, Personal Note, Todo, and so on... About ideas I suppose I will need another life to make much of them a reality but it is worth annotating them in the case as humans we will have a way to extend our lifetime! Also, my whole Red path, made from my observations and your precious help is annotated there and it would be terrible if I lose it!

hiiamboris

[14:17](#msg5ecd2512778fad0b1328def7)&gt; I suppose I will need another life to make much of them a reality

Wow so much motivation ;) Keep it up! :+1:

GiuseppeChillemi

[19:34](#msg5ecd6f5fa91f120a6cc47b44)Thank you! I have not a wife, so I will have lot of free time for the rest of my life to work on those projects!

Respectech

[22:14](#msg5ecd94cc778fad0b132a7fe7)So this question isn't Red-related, but Rebol 3 instead. I've been using Nenad's mysql-protocol.r3 for quite some time, but the system it was running on (Debian Jessie) encountered filesystem corruption. So I'm setting up a new system. However, mysql-protocol.r3 on every system I try (Debian Jessie, Ubuntu, etc.) times out when running the `send-sql` command, where it didn't before.

[22:15](#msg5ecd94ebf0b8a2053ab60c71)I thought that maybe the problem was the version of mysql. Formerly, I was running v5.5, so I installed v5.5 on my new system and it is having the same problem.

[22:15](#msg5ecd95047da67d06fad2dc4b)Does anyone have any ideas?

[22:34](#msg5ecd9964ff7a920a72133ecf)I'm running the same version of `R3` on both systems, the same version of `MySQL`, and the same `mysql-protocol.r3`.

[22:44](#msg5ecd9bc827513a72fbb521e4)Funny thing is that the R2 `mysql-protocol.r` still works fine though. But all my scripts are written in R3 and would take a lot of work to convert to R2, plus R2 doesn't have some of the features that I need.

## Wednesday 27th May, 2020

rebolek

[06:06](#msg5ece037b9da05a060a332163)@Respectech have you tried Oles' version of R3? It should be fully compatible, with bugfixes and improvements. Maybe `mysql` driver would work better there? https://github.com/oldes/rebol3

GiuseppeChillemi

[12:45](#msg5ece60ef3ffa6106f1d94818)@rebolek I didn't know Oldes was doing this work. Thanks for this information.

pekr

[14:35](#msg5ece7ac5778fad0b132cdd02)IIRC, Red standed (stands) for Rebol enhanced dialect, or something like that ....

Respectech

[15:29](#msg5ece8774b101510b201e7f4b)@rebolek Thanks for the idea. I am running this on ARM systems, so I'd have to compile it for ARM I suppose. I'm not sure if there would be compatibility issues with the R3-ARM version I'm using right now, which I believe is the one from Atronix.

[15:32](#msg5ece87f79da05a060a34acda)What I did as a quick hack-fix for now to get back up and running was to build a bridge script where R3 calls R2 for the MySQL queries. My brain was fried after fighting with the whole production database being down for 12 hours yesterday.

Oldes

[16:51](#msg5ece9a87ff7a920a7216017b)@Respectech it is hard to help you, as you don't specify, which version you are using and how. Anyway.. as I reviewed \[Atronix's version](https://github.com/zsx/mysql-r3), I think that there is for sure a bug, that port state is not reset when error occurs..

There should be `pl/state: 'idle` before \[this line](https://github.com/zsx/mysql-r3/blob/d9493aa402d159afb26895ab72c91aac72549202/mysql-protocol-pre.r#L1475)

Respectech

[17:28](#msg5ecea3512c49c45f5aa6cdf0)@Oldes You are amazing.

I have a hard time knowing how much information is too much information. I could write a book on some of the problems I run into. :-)

[23:13](#msg5ecef4034c9b0f060d2aa581)I made the one-line change you suggested above `pl/state: 'idle` to the `mysql-protocol.r3` that I've been using, and it seems to have fixed the issue on Atronix's R3.

[23:13](#msg5ecef4089da05a060a363aad)Have I mentioned that you are amazing?

[23:48](#msg5ecefc3bff7a920a72174edb)On a related but different topic: It has been made clear to me that I am the single point of failure for our back office systems for two companies.

[23:49](#msg5ecefca24412600ccd713199)I've been wanting to rewrite the software that we've been using for both companies so that both companies can run off the same software. One company's solution has been in constant use and hackish development since 2003 using Rebol2 SDK with a VID interface. The other company's solution has been in constant use and hackish development since 2015 using Rebol3 with a browser interface.

[23:51](#msg5ecefd09ff7a920a72175039)One company is primarily break-fix and contract services with some inventory, and the other company is primarily inventory and web sales.

greggirwin

[23:51](#msg5ecefd1a4c9b0f060d2ab8be)It's amazing what one person can do, but that is also a risk.

Respectech

[23:56](#msg5ecefe3e4412600ccd71353b)If anyone would like to pick up some side work

```
if find [
  design
  UI
  modules
  db
  maintenance
  troubleshooting
] my-interest [
  send-gitter @Respectech "I'm interested"
]
```

I'd like to talk with you about working on this total redesign and rewrite together. I believe it is a product that could be sold along with a support contract for residual income.

[23:58](#msg5ecefebf89941d051a291d4b)I'm sure most here could fix any problems that would arise with my existing systems, but a rewrite is a better path forward.

## Thursday 28th May, 2020

Respectech

[00:00](#msg5eceff1d2280c80cbfd2392f)To be clear, this is a job offer and you would get paid for helping. :-)

[00:01](#msg5eceff5dff7a920a721755d3)I would also like to keep in mind that the code should be written in a way that allows us to migrate to Red as it matures.

GiuseppeChillemi

[09:06](#msg5ecf7f22ff7a920a7218873b)@Respectech I am too the single point of failure of two companies. It is not a good position, I can understand how you feel.

toomasv

[17:24](#msg5ecff3e84412600ccd73c851)Still slumbering:  
\[!\[draw-on-console](https://toomasv.red/images/Varia/draw-on-console.gif)](https://toomasv.red/images/Varia/draw-on-console.gif)

hiiamboris

[17:29](#msg5ecff4ec7da67d06fad9ac73):clap:

rcqls

[17:30](#msg5ecff53e778fad0b1331496f)Wouah!

Respectech

[17:30](#msg5ecff553549761730b63715b)Nice job!

GiuseppeChillemi

[17:41](#msg5ecff7e5a91f120a6ccbe9d1)Pazzesco!

[17:42](#msg5ecff7ec3ffa6106f1de101f)Incredibile!

[17:42](#msg5ecff7ee2280c80cbfd4dbf7)Stupendo!

[17:42](#msg5ecff7f73ffa6106f1de103d)Spettacolare!

pekr

[18:14](#msg5ecfff712c49c45f5aaad2d9)@toomasv I wonder how it is done :-) Well, Red GUI console uses View, right? So you put things into some face tree and it gets displayed and mixed with the console itself? Still very nicely surprising :-)

toomasv

[18:18](#msg5ed000723ffa6106f1de2f09)Thanks all!  
@pekr Yes, you have just to find right place where to insert 'em. Not sure, how useful it is, but interesting exercise nevertheless.

GiuseppeChillemi

[18:43](#msg5ed006552280c80cbfd50709)Usefull? I see a lot of applications there. Do you have also some access to the text data which is displayed on the console? I mean its content and position, text font size...

toomasv

[19:08](#msg5ed00c24549761730b63b998)Of course, everyone has :)

hiiamboris

[19:09](#msg5ed00c8127513a72fbbc20c6):D

pekr

[19:15](#msg5ed00dddff7a920a721a2aa0)In R2, console was a port. It could be manipulated, prompt could be changed, etc.

[19:16](#msg5ed00df13ffa6106f1de5653)Maybe it is similar in Red already too, even if we don't have ports right now ...

toomasv

[19:44](#msg5ed014ad27513a72fbbc3d02)\[!\[prompts](https://toomasv.red/images/Varia/prompts.gif)](https://toomasv.red/images/Varia/prompts.gif)

greggirwin

[19:52](#msg5ed01671f0b8a2053abd3d4e)A dream within a REPL. It's page one of a notebook. ;^)

GiuseppeChillemi

[20:06](#msg5ed019aeff7a920a721a4c26)@toomasv I mean after rendering access! You make me fooler than I am !!! :-)

endo64

[20:17](#msg5ed01c6e225dc25f54b0e730)I love watching @toomasv 's interactive lessons on gitter :)

[20:18](#msg5ed01c8e225dc25f54b0e769)That's reminds me Simon's Basic on C64 :)

toomasv

[20:21](#msg5ed01d44f0b8a2053abd4f1f)@GiuseppeChillemi Sorry, I didn’t mean that! I just didn’t understand you correctly.

GiuseppeChillemi

[20:28](#msg5ed01ef189941d051a2c1d1e)@toomasv unprecise wording lead to multiple interpretations of a phrase, you say something, the other receives another thing, so my phrase can let me appear more "stupid" than I am as I have written my question with multiple possible interpretations. Also, I know your words have always a positive spirit, so in no instant I took your phrase as offending, ever! No apologises will be accepted from me as there is nothing to apologize for.

## Friday 29th May, 2020

loziniak

[08:34](#msg5ed0c910225dc25f54b27736)That's what hacking is all about :-)

[08:37](#msg5ed0c9df778fad0b13334e6f)And I love this in Red. Other languages are like today's planned-obsolescence-dont-touch-yourself home appliances.

GiuseppeChillemi

[16:19](#msg5ed136067da67d06fadce377)@pekr  
&gt;&gt; Sometimes I also think, that there is a language barrier. And maybe, we need some devcons too, to actually have a beer ;-)

I would like a lot to partecipate to a devcon if it will be organized in Europe. Hope this could happen soon.

## Sunday 31st May, 2020

PierreChTux\_twitter

[17:16](#msg5ed3e67e9da05a060a42118b)&gt; @pekr  
&gt; &gt;&gt; Sometimes I also think, that there is a language barrier. And maybe, we need some devcons too, to actually have a beer ;-)  
&gt;  
&gt; I would like a lot to partecipate to a devcon if it will be organized in Europe. Hope this could happen soon.

Oh yes, me too!

## Monday 1st June, 2020

loziniak

[05:04](#msg5ed48c6989941d051a361c6b)My little Red popularization initiative around the Fediverse :-)  
https://quitter.pl/display/5f617517-535e-d11b-6a10-d6b881155807

A script to sort contacts in Friendica groups by frequency of posting. Scraping html with `parse`, requests with `curl`.

hiiamboris

[07:34](#msg5ed4afa2a91f120a6cd6caf0):+1:

cloutiy

[16:27](#msg5ed52c647da67d06fae5e608)@loziniak Quick question...`#include %http.red`. Where do we get http.red?

greggirwin

[18:28](#msg5ed548ccd1375137043321e1)Very nice @loziniak ! Is `scrap-group-into` a typo (vs `scrape-group-into`) or intentional? I don't see where `curl` is used thogh.

[18:29](#msg5ed549274c9b0f060d39edcc)@cloutiy I can't say for @loziniak 's script, but @rebolek has %http-tools.red in https://github.com/rebolek/red-tools.

rebolek

[21:02](#msg5ed56cd9225dc25f54bd82d8)@cloutiy It seens to be this script: https://github.com/loziniak/safenet.red/blob/master/http.red

[21:02](#msg5ed56ced4c9b0f060d3a4e10)(not mine :smile: )

GiuseppeChillemi

[21:21](#msg5ed5713cff7a920a7226f005)@Oldes Browsers are actually not suitable for different kind of tasks because of multiple issues. In ERPs, and other software, having multiple windows is important and the browser still has not full communication between windows. Also, games need high-performance GFX and low latency for server based GFX calculation, which are still far from being a browser characteristic. But a myriad of other applications are now browser-based and the tendency is towards all-in-browes working. When the characteristics needed for certain kinds of apps will be there, then the migration will start for that software area.

## Tuesday 2nd June, 2020

cloutiy

[01:04](#msg5ed5a59fb101510b2030393d)@rebolek @greggirwin Thanks for the links!. Will have a look.

GiuseppeChillemi

[06:49](#msg5ed5f663225dc25f54beb565)I would like to congratulate to the whole Red team for such a \[great promo](https://www.youtube.com/watch?v=ARsc\_\_5Buwo) of Red. I suppose the costs should have been really high but we have now a full Red commercial!

loziniak

[11:20](#msg5ed635e57da67d06fae889ea)@cloutiy @greggirwin @rebolek Thanks for feedback! Probably it would be even better to put `http.red` in \*red-scripts* repo instead of \*safenet\*. Good point with the scrap/scrape difference, I wasn't aware of that. There's certainly a lot space for improvements.

cloutiy

[14:04](#msg5ed65c76b101510b203215d5)@GiuseppeChillemi lol can't believe I fell for that

greggirwin

[15:49](#msg5ed674f39da05a060a4896e4)@GiuseppeChillemi, spoiler alert! Now we might as well cancel our upcoming blog post. ;^)

GiuseppeChillemi

[17:55](#msg5ed6927822dd444224f49c3c)I apologize, I didn't want to ruin the surprise!

[17:55](#msg5ed6927df0b8a2053acd11b8):-)

## Wednesday 3th June, 2020

toomasv

[08:13](#msg5ed75bb6778fad0b13436566)I continue my dozing in the \[sandbox](https://gitter.im/red/sandbox?at=5ed75b50b101510b2034c012)

## Friday 5th June, 2020

hiiamboris

[19:54](#msg5edaa2de7da67d06faf489a8)@pekr I've uploaded the table experiment here: https://gitlab.com/hiiamboris/red-mezz-warehouse/#graphics-reactivity so you can play with it and give your feedback  
You'll have to clone the whole repo for it to work.

[19:57](#msg5edaa3b4a3a1b13679cd00d7)It gave me enough food for thought, so I'll also write up a wiki page for design discussions later.

[19:59](#msg5edaa4223ffa6106f1f8ff57)An interesting peculiarity is that I raised 25 new issues during development ;) Clearly shows that Red is far from being ready for any complex enough View layout.

GiuseppeChillemi

[20:04](#msg5edaa53da3a1b13679cd042b):D Red will be, we will be, we will bill, we will kill bill!

[20:04](#msg5edaa55722dd444224ff5368)(Today has been a stressful day, I hope you will pardon my folies!)

hiiamboris

[20:13](#msg5edaa7553ffa6106f1f9063b)☻

GiuseppeChillemi

[20:21](#msg5edaa9327da67d06faf49c82)@hiiamboris

```
do %table.red
*** Access Error: cannot connect: https://gitlab.com/hiiamboris/red-elastic-ui/-/raw/master/elasticity.red reason: timeout
*** Where: do
*** Stack: do-file
```

hiiamboris

[20:37](#msg5edaad153ffa6106f1f9148f)OS?

GiuseppeChillemi

[20:57](#msg5edab1a1778fad0b134c4d17)Win10

hiiamboris

[21:03](#msg5edab334daf4cf366ee42de2)Well, you can always download it yourself. I don't know why it times out. On W7 it requires a patch, but on W10 it should work.

[21:12](#msg5edab53f778fad0b134c5656)@GiuseppeChillemi are you able to `do` other scripts from the web by the way?

[21:13](#msg5edab5687da67d06faf4bcbb)it could as well be some A/V or firewall junk that's blocking you

GiuseppeChillemi

[23:01](#msg5edaceb1f0b8a2053ad82a1d)@hiiamboris I think it is still the bug we have discussed time ago and related to page being in a different language than system.

```
>> probe read http://www.slashdot.org
*** Access Error: cannot connect: http://www.slashdot.org reason: timeout
*** Where: read
*** Stack: probe  

>>
```

While it works on national sites like www.repubblica.it

## Saturday 6th June, 2020

Oldes

[01:07](#msg5edaec5f3ffa6106f1f9a72e)@GiuseppeChillemi it works for me:

```
>> read http://www.slashdot.org/
== {<!-- html-header type=current begin...
```

[01:09](#msg5edaecac22dd444224fffa6a)btw... you can use `https://slashdot.org/` and awoid 2 redirections.

[01:22](#msg5edaefc7225dc25f54cbe590)@GiuseppeChillemi you may try to run `ping 216.105.38.15` from terminal/cmd to see if there is connection issue with the `slashdot.org` server

GiuseppeChillemi

[05:00](#msg5edb22d1a3a1b13679ce13c2)@Oldes I have the ping but not the sites on Red.

[05:09](#msg5edb24fb4c9b0f060d4952c1)@Oldes I have found the \[bug thread](https://gitter.im/red/bugs?at=5d9dc146874aeb2d2316102a) and a little script I have made to check multiple sites:

[05:09](#msg5edb25054c9b0f060d4952c5)You where in the thread too!

[05:09](#msg5edb2520778fad0b134d4fff)I have retried your UTF-8 character solution in READ with no success.

hiiamboris

[07:10](#msg5edb4148a91f120a6ce7ea89)Well, if `read` actually reported IO errors rather than always timeout... otherwise very hard to guess the problem

toomasv

[07:51](#msg5edb4b06225dc25f54cc9ef5)@hiiamboris Very interesting! (But a bit hard to follow without digesting the whole environment you have developed. :smile: )

hiiamboris

[08:54](#msg5edb59db778fad0b134dca7b)☻Well, biggest parts of the environment are: \[elastic UI](https://gitlab.com/hiiamboris/red-elastic-ui) and \[scrollpanel](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/scrollpanel.red)  
Both are not required, but of course I wanted to see how they all play together, and how far can I split the functionality.

[08:55](#msg5edb59ee4c9b0f060d49c99d)Everything else is slight helpers I think.

[08:57](#msg5edb5a609da05a060a5560fe)Oh well, also `map-each` :D but I guess it's trivial to see what it does

[08:58](#msg5edb5aba2c49c45f5ac71199)@toomasv try in the console something like `table/map-to t system` (or any other object or block instead of `system`) ;)

toomasv

[09:02](#msg5edb5b977da67d06faf61a49)Lot of clocking happens, but no table pops up. Should it?

hiiamboris

[09:26](#msg5edb615789941d051a47f52b)It maps to existing `t`. Or it should ;)

[09:28](#msg5edb61b29da05a060a55747c)It should work if you don't close the initially shown window. If not, then we have crossplatform issues

toomasv

[09:51](#msg5edb671f22dd44422400f79f)I closed initially shown table, but not window. This is the end part of what I see after entering `table/map-to t system`:

```
COLUMN AUTOSIZE
...
0.0 μs	[headers: any [headers compose [("#" when index) "Field" ("Type" when 
0.0 μs	[for-each [/i title] headers [columns/:i/text: title]]
13.9 ms	[if index [~column/map-to columns/1 map-each i len [i] columns: next c
11.9 ms	[~column/map-to columns/1 words]
13.9 ms	[if types [~column/map-to columns/2 map-each w words [type?/word get/a
11.9 ms	[~column/bind-to last columns words]
== none
>>
```

hiiamboris

[11:48](#msg5edb829a225dc25f54cd1cf3)it's just profiling leftovers

[11:49](#msg5edb82ae225dc25f54cd1d0a)don't close the table ;)

[11:56](#msg5edb846af0b8a2053ad9a794)theoretically you should be able make a new one, e.g. `view/no-wait [t: table]`, but that doesn't work ;)

[11:56](#msg5edb847b2c49c45f5ac7715e)it creates all the faces, but View doesn't show them for some reason

[11:57](#msg5edb84907f08394226cdf0d7)must be another auto-sync bug

[12:01](#msg5edb85b77da67d06faf674d9)as a workaround, write `do-unseen: :do` then create your tables

toomasv

[12:25](#msg5edb8b3d22dd444224014df8)OK, this works, thanks!

hiiamboris

[14:06](#msg5edba2ec9da05a060a5609e2)here goes bug 26 https://github.com/red/red/issues/4503 ;)

[14:06](#msg5edba2fc9da05a060a560a02)no shortage of their kind

proksi21

[14:30](#msg5edba8a2225dc25f54cd745c)Hi there

[14:31](#msg5edba8ad3ffa6106f1fb475d)Any news from March 20?

hiiamboris

[14:38](#msg5edbaa779da05a060a561b0f)lexer merged

[14:39](#msg5edbaa887da67d06faf6cc49)hi ☻

GiuseppeChillemi

[15:23](#msg5edbb4eb2c49c45f5ac7e488)Should I signal as Bug the problem I have ha MD?

[15:23](#msg5edbb4fd778fad0b134ea191)\*I have had

hiiamboris

[15:24](#msg5edbb52cdaf4cf366ee670cf)How would qtxie reproduce it?

GiuseppeChillemi

[17:59](#msg5edbd969a91f120a6ce95470)The script which is in the link

hiiamboris

[18:02](#msg5edbda3b778fad0b134ef86b)But it works for all of us

GiuseppeChillemi

[18:36](#msg5edbe21d3ffa6106f1fbcf01)@hiiamboris this one? https://gitter.im/red/bugs?at=5d9dd35b874aeb2d23169c87

hiiamboris

[18:38](#msg5edbe2b5a3a1b13679cfd1b6)

```
page:  http://www.repubblica.it  counter:  1  Success:  true
page:  http://www.repubblica.it  counter:  2  Success:  true
page:  http://www.virgilio.it/  counter:  1  Success:  true
page:  http://www.virgilio.it/  counter:  2  Success:  true
page:  http://www.slashdot.org  counter:  1  Success:  true
page:  http://www.slashdot.org  counter:  2  Success:  true
== true
```

GiuseppeChillemi

[18:43](#msg5edbe3e8ff7a920a7237746a)Which version are you using?

[18:44](#msg5edbe406ff7a920a723774a9)(I mean Red ;-))

hiiamboris

[18:45](#msg5edbe45b225dc25f54ce00de)`Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb` on W7

BaronRK

[19:16](#msg5edbeb79daf4cf366ee6eab0)Hopefully a fun question for this erudite group:

Assuming you could not program in Red or REBOL, what would be your next programing language of choice?

hiiamboris

[19:21](#msg5edbecb33ffa6106f1fbe5f8)@BaronRK hi ;) If not for Red, I would have just kept looking ☻

dsunanda

[19:21](#msg5edbecb73ffa6106f1fbe608)Hi Reichart! My previous language of choice before Rebol was Rexx. Right now, I'm dabbling in Haskell just for the fun of it.

Oldes

[19:32](#msg5edbef35daf4cf366ee6f3b2)@BaronRK it depends per purpose of the programming. And even with same purpose there are options... like if want to programm AAA games, you must choose between C# (Unity) and C++ (Unreal)... and if you want to write a web page, you probably don't want to programm it in pure C.

GiuseppeChillemi

[19:34](#msg5edbefd34c9b0f060d4b2f78)@BaronRK are you "that" Reichart?

BaronRK

[19:39](#msg5edbf0d84c9b0f060d4b31b5)LOL, one of my favourite languages (and value that it brought) was ARexx.  
I remember someone took a VT100 program and a light CAD program enabled with ARexx and made it do amazingly cool things like building a working vector UI for terminals. Just a few pages of ARexx to glue it together.

In fact I used to call Rexx 'Glue' and before REBOL was named (back when we called it Lava ) I suggested naming it 'Glu' (which was also sort of a play on Gnu which was pop at the time)

Yes, 'that' Reichart :)

[19:40](#msg5edbf131a3a1b13679cff4b3)@Oldes , if you pick 'C' for Websites, well, then just write a library first to pop out HTML/JS LOL right?

pekr

[19:46](#msg5edbf29aa91f120a6ce9907c)My team uses Angular Typescript and Flutter (Dart) for the mobile apps developments ....

Oldes

[19:47](#msg5edbf2b74c9b0f060d4b3522)I was using Python recently for some AI image processing... but I was not enjoying it much, although it did what I needed. I deleted all (I hope so) Pythons from my computer recently as I found it occupied several tens of GB and I was short in free disk space.

[19:48](#msg5edbf3019da05a060a56c61b)And I'm still using AIR, which has some fresh breath now when Adobe sold it to Harman (Samsung).

BaronRK

[19:54](#msg5edbf469a3a1b13679cffb0f)@pekr are you happy with those?

(funny:  
https://www.reddit.com/r/FlutterDev/comments/doav8h/can\_i\_use\_typescript\_with\_flutter/

'As the others mentioned, the short answer is no.' )

pekr

[19:54](#msg5edbf486a91f120a6ce993a9)@Oldes Did not know Adobe does not own it anymore ....

Oldes

[19:55](#msg5edbf4959da05a060a56ca00)And I would like to play with \[Sokol](https://floooh.github.io/) and \[Blend2D](https://blend2d.com/).

[19:55](#msg5edbf4bda3a1b13679cffc09)&gt; And I'm still using AIR, which has some fresh breath now when Adobe sold it to Harman (Samsung).

@pekr of course I know ;-)

pekr

[19:55](#msg5edbf4c67da67d06faf77a40)@BaronRK Website look nice, responsive, use Google material design, ditto for Flutter stuff, apps being ready in just weeks, supporting localisations, etc. We still can't make such stuff with Red, sadly ....

BaronRK

[20:00](#msg5edbf5d7b101510b20409b90)Indeed. this is a fun Question to ask this group since there are so many interests and fetishes (for lack of a better word) with this group.

There is no right or wrong, just insights!

Blend2D is very cool, my type of stuff.

## Monday 8th June, 2020

TimeSlip

[03:14](#msg5eddacf9f0b8a2053ade8826)@BaronRK I was just thinking about you the other day and hope all is well.

rebolek

[07:34](#msg5eddea1e9da05a060a5b28fa)Lua is nice. Small and compact, easy to learn but powerful.

GiuseppeChillemi

[21:40](#msg5edeb0384c9b0f060d51d97f)@rebolek How does LUA perform on WEB app side ?

rebolek

[22:12](#msg5edeb7d47da67d06fafe1eda)@GiuseppeChillemi I don't know, sorry, I don't care about web very much.

GiuseppeChillemi

[22:18](#msg5edeb91b9da05a060a5d5f68)I would like to adopt a second language for mobile and Web until Red will be ready. Just one, no more. I read about LUA, DART, Typescript but I don't know which would be good. I need one with good frameworks for both web and mobile and powerful and concise like RED.

rebolek

[22:21](#msg5edeb9f0f0b8a2053ae15426)I see. Lua is not a browser language (Although there are some Lua in browser projects). I would pick up Javascript, it's web's native language. Or Typescript, or whatever is cool these days. It changes to fast.

GiuseppeChillemi

[22:27](#msg5edebb4e22dd44422408e444)I have just made a search and it seems there is either Dart for Web and for Mobile.

[22:29](#msg5edebbb37f08394226d59e04)Also, I will do more research to understand how compares Javascript Vs. Typescript and if there are good frameworks for them to code on mobile.

## Tuesday 9th June, 2020

BaronRK

[02:36](#msg5edef5b3778fad0b13566ef4)It is so wonderfully insane we don't have a single language that works on all computers :)

GiuseppeChillemi

[06:57](#msg5edf32eb778fad0b1356f43b)One we had a language able to run on all platforms, it was called Rebol, do you know it?

greggirwin

[22:09](#msg5ee008a7035dfa12610e8140)@hiiamboris thanks for pressing and stressing things. :^) Will need to make time to read the code.

I opened the table to `system`, as you suggest, left it running while catching up on messages here, and at some point it died. Number 27?

## Wednesday 10th June, 2020

hiiamboris

[07:47](#msg5ee0901c7c64f31f11503ce5)@greggirwin likely #4505 (it started growing RAM to the limit in a minute or two)

planetsizecpu

[08:18](#msg5ee0975c7c64f31f11504ef4)@hiiamboris I don't know if it is related to, but my game freeze in the same time period as it never did before, just seen it today while testing, the same on interpreter o exe file, also noted using last automatic builds that the lifter and kart funcs to go slower than before, I'm trying to make some adjustments on timers and code.

[09:04](#msg5ee0a22ba85de3039404f477)I put `stats/show` on every action to see how it goes, then got this when already freezed:

[09:04](#msg5ee0a2387a7f8d2d63277c9e)\[!\[fff.jpg](https://files.gitter.im/red/chit-chat/xTRR/thumb/fff.jpg)](https://files.gitter.im/red/chit-chat/xTRR/fff.jpg)

hiiamboris

[09:07](#msg5ee0a2de013105125a274f0b)so 4GB

[09:07](#msg5ee0a2e11e099b0388b968f6)thought so

planetsizecpu

[09:08](#msg5ee0a3197b6da9126a871a03)But it could be some malfunction in my code that I had not noticed before.

## Friday 12nd June, 2020

BaronRK

[21:27](#msg5ee3f330ee693d6eb3bf0f55)I like that you're making a game :)

## Saturday 13th June, 2020

planetsizecpu

[10:00](#msg5ee4a3cd2cf2f36eae588b10)The learning process is more fun if you learn by playing :-)

GiuseppeChillemi

[10:36](#msg5ee4ac1f1e099b0388c3aafe)@planetsizecpu I agree

## Tuesday 16th June, 2020

BaronRK

[16:26](#msg5ee8f2c8013105125a3b869f)This is a REALLY interesting report.

https://info.hackerrank.com/rs/487-WAY-049/images/HackerRank-2020-Developer-Skills-Report.pdf

[16:28](#msg5ee8f34a2cf2f36eae6290f5)'Developers spend downtime listening to music and surfing the web'

I love when I'm looking through data, and notice a leading question, or a sample bias.

Top answer: Listen to music.  
Bottom answer: Never take a break from coding (LOL)  
Quality check: Play video games.

Missing question: PornHub.

GiuseppeChillemi

[16:33](#msg5ee8f4507c64f31f11649ee0)Thanks for this document.

hiiamboris

[16:37](#msg5ee8f55d24a3382d5d6e4baf)There's "watch video" there though ;)

GiuseppeChillemi

[17:05](#msg5ee8fbd7ef5c1c28f0285abb)One day will be there, I see it!

BaronRK

[18:19](#msg5ee90d3b7b6da9126a9ba8ac)Yeah, but you know programmers, if you don't ask a clear simple question, you don't get a clear simple answer.

Programmer thinking 'Video, what do they mean by video? do they include manga? No, if they wanted to know about manga, they would have just asked about manga.'

greggirwin

[18:24](#msg5ee90e4d035dfa126124b09f)Programmers have a hard time with clear and simple \*anything\*.

hiiamboris

[18:24](#msg5ee90e7724a3382d5d6e8e4f):D

TimeSlip

[21:37](#msg5ee93ba224a3382d5d6f0e7b)@BaronRK Maybe they like the adult soundtracks. :-)

## Wednesday 17th June, 2020

cloutiy

[13:47](#msg5eea1eef6ec4a26deaae1c23)One day `reduce` will be on the list.

planetsizecpu

[14:36](#msg5eea2a5e69879026ce0df318)They lied of course! They spend downtime on beers

&gt;Well, it's like this. A herd of buffalo can only move as fast as the slowest buffalo. And when the herd is hunted, it is the slowest and weakest ones at the back that are killed first. This natural selection is good for the herd as a whole, because the general speed and health of the whole group keeps improving by the regular killing of the weakest members!. In much the same way, the human brain can only operate as fast as the slowest brain cells. Excessive intake of alcohol, as we know, kills brain cells. But naturally, it attacks the slowest and weakest brain cells first. In this way, regular consumption of beer eliminates the weaker brain cells, making the brain a faster and more efficient machine! That's why you always feel smarter after a few beers. Cliff Calvin 🤣

## Friday 19th June, 2020

dsunanda

[12:02](#msg5eeca970c3362026a90a59b6)An example of why developing in Rebol is so much easier for us mere mortal coders - the code below simulates a stupid type! mistake in 25,000 lines of code:

```
Rebol []
Red []
mod1: context [var1: none]
mod2: context [fun1: func [x][x: x + 1]]
mod2/fun1 mod1/var1
```

Rebol's error message identifies the point of failure in a helpful way - WHERE and NEAR are meaningful:

```
do %test.red
** Script Error: Cannot use add on none! value
** Where: fun1
** Near: x: x + 1
```

Red not so much:

```
>> do %test.red
*** Script Error: + does not allow none for its value1 argument
*** Where: do
*** Stack: do-file
```

hiiamboris

[12:15](#msg5eecac78e6668d35db0b4cb0)I'm tired of this issue myself TBH ;)

[12:16](#msg5eecacaf3a0d3931faa01446)How about \[this](https://github.com/red/red/issues/4516) ? ;)

[12:18](#msg5eecad0c7ba3965373b8143b)I'm getting this error though in Red:

```
*** Script Error: + does not allow none for its value1 argument
*** Where: +                                                   
*** Stack: fun1
```

[12:19](#msg5eecad3c405be935cdadf854)Wait, I didn't use `do` ;)

[12:19](#msg5eecad58c223cc536a229d33)Report it so we don't forget.

dsunanda

[12:23](#msg5eecae57c3362026a90a59bb)@hiiamboris -Thanks ..... Happy to add that specific point as a git issue. My wider point remains - Red can learn a lot from Rebol in being app-dev friendly (and, one day, surpass it). Little things like PROTECT and PROTECT-SYSTEM can save days of debugging complex scripts. And that's more of a culture issue for the Red-dev team.

hiiamboris

[12:25](#msg5eecaeb4bb149531edbb05f0)One day we'll be there ;)

GiuseppeChillemi

[14:37](#msg5eeccdaab8152d3484501685)@dsunanda I agree I have found it difficult too to understand some error messages and find the right positions where the error has happened. Let's wait for the refinement process that should happen sometime near 1.0!

dsunanda

[14:39](#msg5eecce05e73f71694986869f)Thanks guys - reported as requested #4532

greggirwin

[20:08](#msg5eed1b27e0e5673398c267cd)Remember that Rebol was only ever interpreted, while Red can be compiled. Once compiled, it can't point you to the source. I'm hazarding a guess that an underlying commonality in the runtime is why it's vague in this case, but @hiiamboris has the pain himself, so we should see more on it soon. :^)

dsunanda

[23:33](#msg5eed4b63c3362026a90a5ab2)I appreciate that information may be lost when compiled - but that shouldn't prevent interpreted mode aspiring to have world-class debugging.

## Sunday 21st June, 2020

BaronRK

[16:54](#msg5eef90cd405be935cdb43d9c)I would take that even further...

\- that REBOL was able to contextualise an error and be helpful is proof it can be done. Therefore, do it.

\- that Red can be compiled is just a mode of output. But, should there be shades of grey, or things on a spectrum? Meaning, can't even compiled-code be done leaving debugging info inside it? We did this in C in the old days. The programs were larger, sometimes ran a little slower, but it worked great for finding those last odd errors. Again, there is proof this can be done. Therefore, do it.

\[ about a decade ago, I had invited several guests to a www.HIKEtheGEEK.com. At lunch after the hike, we got into a conversation about how Windows crashes to Blue Screen Of Death due to interactions with USB devices being plugged in or pulled out. One of our guests began defending MS in that they don't control the hardware. 3Rd parties are free to do as they see fit. This was met with a strong critical response from many of the hikers (who were also hackers). The MS person happened to be in charge of USB for MS at the time. One person started to counter the MS person with great specificity. And the debate heated. As it turned out, (ok, perhaps I had a hand in who was invited) the person countering was head of USB for ... Apple (indeed). There were about 15 of us, and we had taken over the back of a restaurant. The conversation actually went very well, as we deconstructed the problem, and reviewed how Mac manages to not crash, and try to view all USB devices as 'some sort of storage device' by default. Our MS guest, both outnumbered, and now realising he was set up, er, I mean invited for reasons other than his need to get outside and get some exercise, did well though. He was a trooper. Sadly, even today, I still deal with Blue Screen of Death often enough from plugging in or unplugging USB-C devices. The screen now features a QR-Code that is completely useless as best I can tell. It happened yesterday in fact. USB has now been in PCs for more than 2 decades. It is sad. We need debugging built into drivers, and deeper in the system still. ]

dsunanda

[16:58](#msg5eef91c14eb21134341b4b33)Good stuff! Debugging is a killer app for a programming language - and we sometimes overlook how good Rebol's was.

hiiamboris

[17:17](#msg5eef963c7ba3965373be58eb)I'm always of the same mindset - programs do not have to be stupid ;)

GiuseppeChillemi

[17:28](#msg5eef98cabb149531edc1658b)I have chosen the next language to learn until Red get it's android and web counterpart: Dart. Opinions are welcome.

[17:55](#msg5eef9f17c4bdd83475f91f4d)The other competitor was Javascript with React Native.

hiiamboris

[18:08](#msg5eefa21ac223cc536a290dda)I would stay as far away as possible from everything developed by Google ;)

[18:10](#msg5eefa2a0405be935cdb46dbf)What about Elm, Nim, CoffeeScript, Haxe? Have you considered these?

dsunanda

[18:12](#msg5eefa2f73baf5366e476c3e6)I've been playing around with Haskell - it's sufficiently different from anything I've done before to be interesting. If you've never come across it before, at least read the "An Intro to Lists" chapter to get an idea of how powerful Red blocks \*could* be - http://learnyouahaskell.com/chapters

hiiamboris

[18:14](#msg5eefa36cb8152d348456476b)Haskell is one of the coolest langs out there ;) That is... until you start needing side effects..

dsunanda

[18:14](#msg5eefa39cf99e8b38d27367d2)Onl y a computer scientist can live with out side effects - for those they use TeX :)

hiiamboris

[18:14](#msg5eefa3a3e0e5673398c793d3):D

BaronRK

[18:22](#msg5eefa571e6668d35db11de7c)'The other competitor was Javascript with React Native.'

I have plenty of work for those going down this path.  
I'm personally torn. I HATE IT ALL. Would rather have something like REBOL/Red of course.

But, JS/RN makes sense in terms of the lowest common denominator. Crappy, but easy to saw out code, pull form the huge collection of open-source, etc.

TimeSlip

[18:30](#msg5eefa73da813c72dcf001777)@BaronRK Thanks (again) for doing all the research. Living in my own Red/Rebol cave I don't often see what's outside in the real world but inside my cave I keep thinking that I would like to build things I can't yet.

GiuseppeChillemi

[19:25](#msg5eefb43be6668d35db11ff0b)@hiiamboris  
&gt;&gt; What about Elm, Nim, CoffeeScript, Haxe? Have you considered these?

I have started from the framework and then the language. I have not considered anything which does not let you work on an unique codebase for both web and mobile. A great number of packages was another requirement. Finally, I have taken a look to the language and I have found Dart to be simpler and more powerful than Javascript.

About the languages you have listed, I have not encountered them in my little research. They were not mentioned but if they could work with flutter o react native I could reconsider my choice.  
Which one would you suggest?

[19:26](#msg5eefb44c54d7862dc49e3237)(as Redbol professional)

hiiamboris

[19:28](#msg5eefb4c03a0d3931faa6b5a4)I have not coded in any of them ;) But they compile to JS (as an option or primarily) so should be interoperable with the existing JS codebase.

greggirwin

[20:34](#msg5eefc45eec4a341beedf0f4a)@dsunanda what, specifically, about Haskell lists makes more powerful than Red blocks?

GaryMiller

[20:43](#msg5eefc686e0e5673398c7deb5)Another cross platform language that transpiles to JavaScript and Java emerging from the shadows.

Has an IDE, graphics, GUI and database built in. Have not used it yet but have looked at the limited examples and it seems to have potential.

Dragon https://www.dragon-lang.org/

dsunanda

[20:47](#msg5eefc778f99e8b38d27367df)@greggirwin They have a wide range of ways to initialise content, eg:

```
Has: [1..10]  Red: [1 2 3 4 5 6 7 8 9 10]
```

Lists can be infinite, and lazily evaluated. In fake Red:

```
blk: copy [100 101 ..]
   print blk/200
   ==> 301
```

Check the link I gave above for list comprehensions. Effectively, like having an intelligent block that calculates its own next entries according to initialisation rules. A bit more like a Redbol port in some ways.

greggirwin

[20:51](#msg5eefc844405be935cdb4bd9e)We have a number of experiments on ranges and generators. Easy to do in Red. Haskell can't do heterogeneous arrays, can it?

[20:54](#msg5eefc9017ba3965373bed0bb)Another way to phrase my question would be "What can Haskell lists do that we can't do in Red, and the other way around?"

[20:55](#msg5eefc946c223cc536a2963d4)@GaryMiller thanks, I hadn't seen Dragon that I recall.

hiiamboris

[21:00](#msg5eefca5fa813c72dcf006461)Laziness at the language core allows it not to calculate unneeded stuff. You may define any number of transformations on a number of infinite lists/trees, and be able to work with this. It will only calculate what is needed to get the result.

BaronRK

[21:02](#msg5eefcacf6c06cd1bf4478c83)Of note, if I were young, I would probably be focusing on learning Google's Go for the back end.

I read this a few years ago, in fact I saved the link in my 'Programming Languages thread to watch'

https://medium.com/@kevalpatel2106/why-should-you-learn-go-f607681fad65

hiiamboris

[21:02](#msg5eefcad5ec4a341beedf1cb7)That facilitates the ability to write your program not in steps that build up, but backwards, from the final result.

dsunanda

[21:02](#msg5eefcad727fbeb24493fab50)Heterogeneous - don't know enough to say - but can have data structures, reminiscent of Red objects!  
You can do pretty much anything in any language. Haskell has some neat ideas that could work well in Red - and vice versa :)  
Another nice thing in Haskell is that you can have multiple FUNCs (again, fake Red) with the same name. Which one gets called depends on the type! of the arguments, eg (trivial example):

```
my-fun: func [x [integer!][print x]
my-fun: func [x [file!][print read x]
```

hiiamboris

[21:03](#msg5eefcb267ba3965373bed4bf)Haskell's lists can include any value ;)

[21:05](#msg5eefcbad3a0d3931faa6e0e2)@dsunanda http://red.qyz.cz/pattern-matching.html

dsunanda

[21:15](#msg5eefce0e27fbeb24493fab52)@hiiamboris Dispatch - cool work, thanks.  
Even cooler still, would be not having to write the word dispatch to call a pattern matchable function....In my dreams, there is a special type of object! that has Dispatch built into it, so I can write the code to define and use Factorial like this:

```
factorial: make dispatcher! [..hard stuff omitted..]
print factorial 10
```

hiiamboris

[21:17](#msg5eefce5347fdfd21edd90155)it'll be simpler to make your function constructor than an object ;)

[21:17](#msg5eefce62e0e5673398c7ed09)almost trivial ☻

[21:19](#msg5eefcee0e6668d35db123681)another possibility is `with-patterns [...]` where `with-patterns` is a DSL-providing function  
or `make patterns! [...]` where `patterns!` is an object prototype... if you define a function inside it, it will be pattern-matched and global

dsunanda

[21:20](#msg5eefcf11f99e8b38d27367e4)The hard part (which probably needs red/ssytem support) is specifying somewhere in Dispatch! that Factorial takes one arg......Your prototype finesses that by only ever taking one block as an arg.

hiiamboris

[21:21](#msg5eefcf4c7ba3965373bedcf9)Haskell has no variable arity either ;)  
No need in R/S to implement all these your wishes btw.

dsunanda

[21:24](#msg5eefd02a3baf5366e476c3f0)True but (eg)

```
factorial: make dispatch! [1 ....] ; takes one arg
complex: make dispatch! [2 ....] ; takes two
print factorial 4
print complex 4 5
```

Would not be easy to do in Red (I think!)

hiiamboris

[21:26](#msg5eefd07fc4bdd83475f989b6)Because you've chosen the suboptimal tool/approach ;)

[21:26](#msg5eefd08db8152d348456a2c6)Why objects? Objects are not for that

[21:27](#msg5eefd0b76c06cd1bf44798eb)Change `make dispatch!` to `make-dispatch` and you're good ;)

[21:27](#msg5eefd0d3fa0c9221fc511abc)It'll be an operator that modifies the function body, adding a new pattern

[21:30](#msg5eefd15de0e5673398c7f51b)Bolek's approach is inefficient too btw. I doubt he ever used it himself.

[21:30](#msg5eefd16ea813c72dcf007204)A good experiment nonetheless.

dsunanda

[21:30](#msg5eefd18bc3362026a90a5b7e)Re object bad.......On the other hand, doing it with some form of modified/intelligent Context would allow shared data between the pattern-matched functions.

greggirwin

[21:31](#msg5eefd199ec4a341beedf2b2c)The important thing is not for Red to look like, or work like, other languages, but to evaluate what their features accomplish in the end, and how best to support them in Red. It's a lot of "different but not better". I've never missed function and operator overloading in Redbol langs.

[21:31](#msg5eefd1c8fa0c9221fc511c3d)But that doesn't mean I'm right, or that others won't benefit from them. So this is a case where a dialect or other approach is a good fit.

hiiamboris

[21:32](#msg5eefd1fce0e5673398c7f5ea)&gt; doing it with some form of modified/intelligent Context would allow shared data between the pattern-matched functions.

Wrap those func definitions in a context. Define shared data in that context.

[21:36](#msg5eefd2ef613d3b3394fde8cb)@greggirwin I think such overloading is better &amp; clearer because it saves you a level of indentation and also helps you focus on the domain of definition and special cases first. But that's only good for a compiled language - it knows what's ahead.

greggirwin

[21:42](#msg5eefd4397ba3965373bee726)So you'd rather write a number of functions, which may share functionality in their bodies, with single types, rather than typesets and polymorphic data leverage? (I exaggerate a bit for effect ;^)

hiiamboris

[21:44](#msg5eefd4cac4bdd83475f991e2)Haskell has typesets ;) Even can add your own types easily. And not only you can dispatch on types/typesets, but also on the features of the type (e.g. can it be compared for equality? for less/greater? converted to something?).

[21:45](#msg5eefd4ef6c06cd1bf447a003)And it doesn't stop you from writing it all in Red-style, as a single function with checks ;)

[21:46](#msg5eefd53dfa0c9221fc5121ec)This syntactic sugar doesn't matter \*much\*. But still, a bit ;)

[21:51](#msg5eefd651e6668d35db124494)@dsunanda Btw, LYAH is a weak book. Look at RWH ("Real world haskell"). It's like 100 times deeper.

dsunanda

[21:52](#msg5eefd6a74eb21134341b4b44)Thanks - I've read both for a stereo view :)

hiiamboris

[21:53](#msg5eefd6d8ec4a341beedf35b9):+1:

GiuseppeChillemi

[23:01](#msg5eefe6d67ba3965373bf0988)Someone seems also to like LUA a lot. But I have not looked at it.

## Monday 22nd June, 2020

rebolek

[06:19](#msg5ef04d8ee6668d35db13296c)&gt; Bolek's approach is inefficient too btw. I doubt he ever used it himself.

True. :-) It was proof of concept for a blog article, I don't remember using it eleswhere ;-)

## Wednesday 24th June, 2020

Oldes

[13:13](#msg5ef3517547fdfd21ede17c2f)The Apple is really incredible... to be able \[develop on their new ARM based devices](https://developer.apple.com/programs/universal/) one must \*\*borrow\** a development kit for 500$.

hiiamboris

[13:29](#msg5ef35520c223cc536a32193d)It was always in their logo ;) A shortcut out of paradise into eternal slavery ☻

Respectech

[14:22](#msg5ef361a0b8152d34845f4f5d)@hiiamboris So true! We see it all the time. Our techs at our business deal with all types of users every day. Ask any one of them which users are the most difficult to work for and they will all respond with the same answer. Apple users.

greggirwin

[18:06](#msg5ef3963cd65a3b0292aa2062)@hiiamboris :^)

## Thursday 25th June, 2020

codenoid

[08:17](#msg5ef45d986c06cd1bf452b7bd)hi folks, it's 25-06-2020 how you doing, hope everything getting better

greggirwin

[19:01](#msg5ef4f4757ba3965373cb9f33)All is going well (mostly).

## Friday 26th June, 2020

BaronRK

[00:19](#msg5ef53f1c54d7862dc4abc96b)Interesting?

https://www.elegantobjects.org/

greggirwin

[02:02](#msg5ef5571954d7862dc4abfad8)Meh. He rants strongly against many things, using old tropes, from what appears to be a heavy Java focus. His goal seems to be "Do things on top of Java to make Java more how I want it." but without depth and breadth to back up his views and claims.

BaronRK

[04:44](#msg5ef57d19fa0c9221fc5f046c)Funny, as a professional ranter myself, my first complaint I posted about the page was exactly the same.

## Saturday 27th June, 2020

GiuseppeChillemi

[15:12](#msg5ef761ddfa0c9221fc639849)https://lemire.me/blog/2020/06/26/gcc-not-nearest/?amp

## Friday 3th July, 2020

hiiamboris

[15:01](#msg5eff48536c06cd1bf46e2e7b)Gutter eats messages for 2 days already. Is it just me or common problem?

greggirwin

[15:02](#msg5eff489a54d7862dc4c53367)I thought it was connection issues on my end. If something doesn't post right away, I copy it before it vanishes, just in case.

hiiamboris

[15:04](#msg5eff48ee405be935cddb1b1a)I see. Must be a typical "we got bored, let's break something for fun!" endeavor.

greggirwin

[15:08](#msg5eff4a01a813c72dcf2704a6)Welcome to the web.

## Wednesday 8th July, 2020

BaronRK

[04:19](#msg5f054953a9378637e8b447d7)A friend built this...

https://sifter.org/~simon/journal/20200706.html

greggirwin

[05:12](#msg5f0555b864ef9d04b29bfbef)Nice.

planetsizecpu

[07:02](#msg5f056f916e1b8050c3ddd6b1)Wow what a nightmare.

GiuseppeChillemi

[08:25](#msg5f05830dc7d15f7d0f7b3e6f)I piece of our history: the source code of Psygnosis game "Agony" ha been published.

[08:25](#msg5f0583133e4a827d19b010a0)http://aminet.net/package/game/shoot/YvesGrolet-sources

BaronRK

[16:01](#msg5f05edccbd3edf666fb92bdf)https://www.linkedin.com/posts/reichart-von-wolfsheild-986551\_what-i-learned-about-innovation-from-learning-activity-6686659598365159424-5Ua5

Impressively written article by a Lawyer about learning to program.

{I was surprised by how much time I spent writing in constraints on user behavior. Basic programs, for example, might force users provide a single type of input like a positive integer. Without these constraints a program would be vulnerable to crashing whenever a user inputted something unaccounted for by the code. Thus, a key part of learning how to code is learning how to constrain your user’s behavior.}

80/20 rule in play. we spend most of our time programming STOPPING humans from doing strange things.

As a counter to this, we should be making UI that is smarter and more forgiving. Real-world example:

I paid a bill online yesterday, it asked me for two pieces of information (2 input boxes): Account number, and Occupant number. But on my statement (paper) I saw but one number: 03216789-01.

Turned out, it wanted the part to the left of the '-' in the first input, and the '01' was my occupant number.

Worse, it was expecting a 7 digit code for the first part. So you are expected to REMOVE the '0', type in the next 7 digits, then copy the '01' to another field.

May we bring a class action case against this programmer for wasting our time?

http://www.slaw.ca/2020/07/07/what-i-learned-about-innovation-from-learning-how-to-code/

GiuseppeChillemi

[17:24](#msg5f06013a3c217837fd86a81a)@BaronRK I am reading it with great interest.

Respectech

[18:31](#msg5f061106c7d15f7d0f7d1c1b)@BaronRK I totally agree about the user constraint nonsense. I wrote the software for my companies. My employees work overtime to break it by doing stupid stuff. Error handling is the largest portion of my code.

dsunanda

[18:47](#msg5f0614c9ba4e030eeb8ba1a5)@BaronRK when ecommerce started, I remember trying to type my debit card number ASIS from the card (groups of 4 separated by spaces). Silly me. Even today, most card number fields won't accept it that way.  
Likewise, many forms that want a phone number can't handle a cut'n'paste of (say) 1-(123) 456-789 - Us poor humans have to remove all (or sometimes just some) non-digits by hand.

[18:48](#msg5f0614e49a0ef43111ce925d)It's as if Jakob Nielsen and Donald Norman lived in vain.

GiuseppeChillemi

[20:42](#msg5f062fa77a4e99049efa2a3d)Users is not the primary source of errors. If you don't create an UI being aware of how user mind combine elements and logic you can be the source of their errors.

BaronRK

[20:44](#msg5f06303e86ccb45b5993077d)Indeed, we are all spoiled even with REBOL (or Red) have smart types.  
I used to tell Carl, we could make a killing writing libraries using JUST the Parse command to fix stupid crap like that telephone number formatting or credit card formatting.

GiuseppeChillemi

[20:45](#msg5f06307d64ef9d04b29eb46c)If you read the usage guidelines of FB and WhatApp logos you will find rules on putting a distance between their logo and your graphic/names because under certain distances the mind start creating connections.

[20:46](#msg5f0630ad46c75b1e5e319698)So if you don't properly arrange your UI you can end up letting user thing you don't intend them let them think.

[20:48](#msg5f06311d7455046699e7d227)Also user come with their prior knowledge so they start using you GUI the way they think they should interact with it based on combination of input entering, gui elements, intuition.... It's not easy...

[20:50](#msg5f0631a18b72655b555cf9bc)Our minds creates hidden mental paths and then follows it while they see the screen and interact with the GUI. How this path is created and the rules to avoid unwanted paths it is the key to a successful UX.

[20:55](#msg5f0632a964ef9d04b29ebb25)On amiga we had "User Interface Style Guide" to avoid base errors. It is no more a current book in its content but a current one for its principles. Having a double "OK -------- OK" requester was common in Amiga era. User interface style guide has teached develpers to avoid this and put just one "OK" to avoid problems like:  
Support: How can we help you?  
User: Documentation ask to press OK but I see 2 OKs, which is the correct one ?

## Thursday 9th July, 2020

BaronRK

[00:49](#msg5f06699c7a4e99049efac6cc)exactly.

greggirwin

[01:21](#msg5f067102f6b741628420e808)There's a balance. One of the things that drives me crazy in some modern UIs, and is \*promoted* as good HCI, is dialogs that don't give you \*any* affordance for saving or canceling your edits. "Just click anywhere else" they say. That doesn't make it better than modality, or even truly modeless. It makes it "#%@! What did I change because now I can't \*not* save it!"

theSherwood

[03:27](#msg5f068ebd3e4a827d19b32ebd)I like the idea of modelling all application states as a traversible tree. Everything the user does ends up being on this tree. If a user makes a mistake, they simply navigate up and away from the leaf they are on. Making a ui that makes this kind of traversal intuitive seems like quite the challenge, though. I've never seen any software that actually achieves it. But then the user doesn't need to care about whether some state was saved or cancelled or whether they made a mistake. Just navigate back. That seems like the holy grail to me.

[03:29](#msg5f068f1846c75b1e5e3285f6)And when I say "all application states as a traversible tree" I don't mean all possible application states. I mean the tree is a tree of states the user has navigated into.

hiiamboris

[07:48](#msg5f06cbd4dbf01050ab628c71)Make full state snapshots before opening config and it might work.

theSherwood

[10:11](#msg5f06ed4c3c217837fd8926b5)"opening config"? I'm still new to red and rebol. Could you elaborate?

hiiamboris

[10:44](#msg5f06f51046c75b1e5e3390d3)I mean in your program ;)  
E.g. in Firefox if you go to `about:config` you will likely change a narrow group of settings and close it. If it could save it's state before letting you access it's config, it could let you undo it, and exactly as you see it - by undoing a branch of a tree.

[10:47](#msg5f06f5d5c7d15f7d0f7f7ce0)In Red, I would hold all state in an object and just save &amp; load that object. No ini files needed. Although some kind of protected load mode for better security would be nice to have.

rebolek

[10:48](#msg5f06f61bf6b7416284224789)like `construct` for example?

hiiamboris

[10:52](#msg5f06f6f786ccb45b5994f378)Yeah, good idea. If we have numbers &amp; strings in our state, `construct` will be nice.

GiuseppeChillemi

[11:41](#msg5f070285a9378637e8b9410f)@greggirwin  
&gt;&gt; There's a balance. One of the things that drives me crazy in some modern UIs, and is \*promoted* as good HCI, is dialogs that don't give you \*any* affordance for saving or canceling your edits. "Just click anywhere else" they say. That doesn't make it better than modality, or even truly modeless. It makes it "#%@! What did I change because now I can't \*not* save it!"

Yes Gregg, it is the most stupid thing I have seen in years. There is a difference between moving 1 slider and going back to the previous state than moving 10 sliders and then trying to remember which was the setup before your "Live Edits". I was near to write here about this and your message let me feel less alone.

theSherwood

[15:43](#msg5f073b053e4a827d19b510aa)@hiiamboris I think this approach of saving a snapshot of the entire app state gets tricky when the application state gets large. For example, if the application were a text editor, saving a complete snapshot could mean saving an entire document with every edit (or small set of edits). With small documents, that may be no problem, but with large documents, could be trouble.

hiiamboris

[15:45](#msg5f073b958b72655b555fb9ce)I'm sure there are limits. Although editors do save the files first, and state.. depends, e.g. Sublime easily recovers unsaved files after a power failure, but it will forget undo history.

theSherwood

[15:49](#msg5f073ca0f6b7416284231a1b)Right. It seems to me that if you could make application state generically git-able, then you could constantly be saving that history tree to disk without facing perf problems on account of only needing to persist small deltas.

[15:51](#msg5f073d087455046699ea96d4)Never need to save anything explicitly, never need to save different versions. Just navigate to different parts of the history tree. But to make it practical to persist that tree to disk, I think you would need to only save the deltas.

hiiamboris

[15:53](#msg5f073d7ac7d15f7d0f80537a)I believe recovering the state from hundreds of thousands of deltas will be a bottleneck :D

theSherwood

[15:54](#msg5f073dc3dbf01050ab63e08a)Ha. Fair point. You might need some routine that creates snapshots at a given distance in the tree.

[15:55](#msg5f073e077a4e99049efd0a92)Or maybe a routine that consolidates small deltas made close together (in time?) into larger deltas.

hiiamboris

[15:56](#msg5f073e1aa9378637e8b9fa78)The idea is interesting. Imagine having a (local) git-like state server that does all the caching etc. for you, and you only communicate with it to update and restore state, across multiple apps.

theSherwood

[15:56](#msg5f073e27a9378637e8b9fa81)Yes!

[15:57](#msg5f073e856e1b8050c3e32b57)I feel like something like that could allow us to make some very forgiving UI and UX and the user would be able to go forward with confidence that their content isn't lost but doesn't personally have to worry about making sure some state or other is preserved.

[16:02](#msg5f073f81f6b7416284232577)And it is too much developer labor (to my mind) to have each app trying to do this within the app. I want an api that any app can simply hook into, or if better if the caching can be done without the apps even needing to be aware of it. But I'm not sure how that would work.

hiiamboris

[16:10](#msg5f0741586e1b8050c3e3365c)Right. Let's wait for Red to obtain ports, and then play with this idea ;)

theSherwood

[16:11](#msg5f0741bea5ab931e4f768ac3)Sounds good to me.

[16:12](#msg5f0741dc8342f4627404d079):thumbsup:

GiuseppeChillemi

[16:23](#msg5f0744966e1b8050c3e34270)Also the idea of save states could be applied to our OSes too. Currently machines installed on VMs have shapshots but it would be really nice to have them at OS level with similar easiness of windows virtual enviromnent.

theSherwood

[16:25](#msg5f0744fb8b72655b555fdaeb)I agree. Ultimately, I think this would be a nice thing to have as close to the bedrock as possible.

[16:27](#msg5f07455df6b7416284233a5c)There are a couple other things I'd like to see at the OS level too. One of those being a graph database instead of a directory tree filesystem.

GiuseppeChillemi

[16:30](#msg5f074629f6b7416284233d07)Also with recent hardware VT-d virtualization is a reality and you can assign a board directly to a VM. vSphere kind of setups could be possible even for game machines and you can have mutiple OSs running at the same time. You run the hypervisor, it starts the virtual machines. So you play with one, run a Nas with another and work on linux with another one. There are enough core on moder CPUs to do this at full speed.

hiiamboris

[16:33](#msg5f0746f23e4a827d19b53b0f)&gt; There are a couple other things I'd like to see at the OS level too. One of those being a graph database instead of a directory tree filesystem.

Why?

theSherwood

[16:37](#msg5f0747e0c7d15f7d0f807546)Because graph databases are better for querying. I would like to be able to annotate some content with links to related content that doesn't necessarily fit a hierarchy. Tags get us part of the way there, but only part of the way. I want content related to the content I'm looking at to become available at the peripheries of my interface rather than having to search for it using text search or by traversing the directory tree.

[16:41](#msg5f0748c33e4a827d19b541b5)Say you've got some article about apple grafting (or whatever). You got it from your friend Jill. You might want to annotate it with something about apples, annotate it with something about grafting, and annotate it with something about Jill. That way it links to other collections of content that you have rather than being nested in your apple directory or your grafting directory or your Jill directory.

hiiamboris

[16:48](#msg5f074a51a9378637e8ba2a29)You can do that by creating a special directory with subdirs named for tags, and under each tag make links to each of the files you're annotating. Doable. I wanted to make something like that for my music library, but never actually got there, mostly because tag reading tools are all limited, buggy and hard to interface with.

[16:49](#msg5f074a8064ef9d04b2a1c258)You have to admit though that you need locality too. How would you navigate a database that has no tree hierarchy?

theSherwood

[16:53](#msg5f074b8d7a4e99049efd3d35)You can do it, but the friction seems too high to have it be worthwhile (to my mind). I want something that makes it easy and fast.  
I'm not sure how much you need directory-like locality if you have a way of visualizing the links between pieces of content.

[16:54](#msg5f074bbedbf01050ab641e32)I think it would be nice to be able to namespace content (and that could mimic a traditional directory structure), but you could also namespace it to multiple namespaces.

hiiamboris

[16:56](#msg5f074c4ddbf01050ab641fd2)Interesting ideas, thanks ☻

theSherwood

[16:56](#msg5f074c51a9378637e8ba3126)Then you could have some context that you are working in provide that sense of locality but still have your content available from anywhere you've linked it to.

[16:57](#msg5f074c68a5ab931e4f76acb2)Sure thing. Red seems like the right language for exploring a lot of these ideas.

greggirwin

[19:19](#msg5f076dc886ccb45b599676a2)@theSherwood would you please add at least \*some* avatar indicator. Without one, it makes it much harder to see where your posts lie in relation to others.

[19:32](#msg5f0770e4a9378637e8ba9e6c)On history and undo, there are precedents, which often come back to an underlying pattern (if you're a GoF fan). Some drawing programs have an Undo window, showing what commands were applied, allowing you to go back in time, but also cherry pick items, reapply them, etc. The problem with naively going back in time is that you may be forced to throw away changes that came later, which you want to keep.

The underlying GoF (GoF = Gang of Four = Design Patterns by Gamma, Helm, et al. I'm not a zealot about the book; but it is worth knowing about) pattern is \[Command](https://en.wikipedia.org/wiki/Command\_pattern), and I'm a fan of the general idea, but with a twist. Rather than sending a command to a specific receiver, commands are just messages that get passed around, in process and beyond. This makes it a natural IPC interface for ARexx style programming as well. The key is that you have a hub all messages go through, so they can be logged, replayed, etc. For Undo operations, the extra bit you need is the ability to create an inverse command, which is painful. The other way, which is nicer IMO, is to go back in time, replay, and simply skip over those items you want to "undo". That's not completely generalizable, but it's a big step up and saves users work who then just have to tack on metadata about change dependencies and such.

@hiiamboris, knows where this story leads for me. ;^)

theSherwood

[20:09](#msg5f07795e3e4a827d19b5da48)@greggirwin I added a white avatar when I signed up which worked (for me at least) because I was using dark mode. I've tried to change it a couple times but the gitter documented flow for changing your avatar doesn't seem to match what I'm seeing. So I haven't been able to complete it. I'll try again.

greggirwin

[20:12](#msg5f077a17bd3edf666fbd99e5)Bah, Gitter.

theSherwood

[20:13](#msg5f077a617455046699eb58ef)With regards to something like undo, I would think you would want something tree-like rather than a list so that you lose nothing. If the cursor moves to a node that isn't a leaf node and then changes are made, then you get a new branch off that node. Each node ought to have a unique address so you can query different versions without moving the cursor to them. I'm able to model this in my mind with deltas, but it's not immediately clear to me how to do this with Commands. I guess each command could simply refer to a previous command? A tree of commands? Is that what you're describing?

[20:14](#msg5f077ab27455046699eb5a38)I guess one thing I like about deltas and snapshots is that it feels somewhat more naturally data driven to me, which just clicks for me a little easier.

[20:18](#msg5f077b9aa5ab931e4f773be1)@greggirwin The gitter docs say to sign out and sign back in, at which point you should be able to update your info. But when I sign back in, I don't get any kind of ui that appears to be for that purpose.

greggirwin

[20:19](#msg5f077bc58342f46274058372)Commands are independent, but could be grouped. The only time I've seen normal people think in trees is when they're doing What If thinking. Using the Paint example, how do you know to start a new branch? That is, how does the user tell you? Now, this could be a cool new UI experiment, because how I do it now is I duplicate layers, turn on sets of them to composite, then merge to apply global filters. Each of those merged layers becomes a JPG/PNG, but I can go back and recreate new ones from other layers. Undoing across them is not possible that I know of, because the tool has no idea how I'm working.

hiiamboris

[20:20](#msg5f077c1f8342f462740584e9)@theSherwood Shouldn't you be changing avatar on GitHub instead?

greggirwin

[20:21](#msg5f077c4064ef9d04b2a25a4e)Since there's no profile option for avatars here, that's my next guess as well.

theSherwood

[20:21](#msg5f077c45f6b741628423e5f0)@hiiamboris what? I had not considered that. haha. that's probably the key.

[20:21](#msg5f077c4d7a4e99049efdd5d9)good grief.

hiiamboris

[20:21](#msg5f077c4e7a4e99049efdd5e0)☻

greggirwin

[20:21](#msg5f077c533c217837fd8addb0):^)

theSherwood

[20:23](#msg5f077cc2bd3edf666fbda303)Hmm. That doesn't seem to have done anything, unfortunately.

greggirwin

[20:23](#msg5f077cc67a4e99049efdd749)Interesting to think of trees versus lists for commands. Another advantage to commands, however they work internally, is that you basically get macro programming for free in apps, because you're just automating and grouping commands. The next step after that is parameterizing them.

[20:23](#msg5f077cdc64ef9d04b2a25c60)Caching may affect avatars too. Another guess.

theSherwood

[20:24](#msg5f077ce846c75b1e5e353473)Good point

greggirwin

[20:24](#msg5f077cfbdbf01050ab64ab30)Forcing a refresh gives me your new avatar. Yay! Thanks for doing that.

theSherwood

[20:24](#msg5f077d1386ccb45b5996a3a7)Haha. Thanks for pointing out how to do it.

[20:25](#msg5f077d3dbd3edf666fbda54b)That is a nice feature of commands. I hadn't considered that.

[20:27](#msg5f077da8a9378637e8bac138)In terms of UI, I think the tree structure could very quickly become intuitive if there was something like a zooming interface. You zoom out and you get a visualization of the tree with a preview of it. Hover over it and see a diff between it and where you currently are in the tree. Something like that.

[20:27](#msg5f077dcb6e1b8050c3e3ee59)\*A preview of each node. Hover over a node and ...

[20:30](#msg5f077e59bd3edf666fbda884)So some piece of content acts kind of like series do in red (only a tree instead of an array). You navigate to that piece of content and it takes you to where the cursor is in the tree. But all the other versions are just a zoom away.

greggirwin

[20:34](#msg5f077f66dbf01050ab64b135)That could be cool. Makes me think of another approach, which is more "declarative". Rather than thinking of an edit flow and a timeline, you select commands and add them to a group. Within that group you can reorder them, turn them on or off, apply by a weight, etc. Again, thinking Paint. As you adjust your "palette" , the image updates. Then you can create macro palettes, grouping subsets of actions. This could give you a really exploratory interface with instant feedback. What happens if I blur before adjusting curves? Is there a difference if I change HSV and alpha order?

Now, because my brain fires off in different directions, could you also apply this approach to data science?

theSherwood

[20:36](#msg5f077fbd7a4e99049efde019)So is it recomputing the full edit history?

hiiamboris

[20:38](#msg5f0780637455046699eb6b2e)That would be the slowest Paint on Earth ;)

theSherwood

[20:39](#msg5f07806ca9378637e8bac693)Or do you cache the results of commands along the way, similar to docker? Then you just recompute everything since the latest changed command. And then when you persist the "history" to disk it is just groups of commands?

[20:40](#msg5f0780c0a9378637e8bac7c4)The cached snapshots just live in memory and but everything is re-computable because you've still got the commands when you return to the application. Is that the idea?

greggirwin

[20:40](#msg5f0780ca6e1b8050c3e3f615)The edit history is the changes you make to palettes, which could be saved off themselves. So you can apply them to multiple images. Think batch processing 5'000 wedding photos. Once you have your palette set, it just renders according to that. Certainly optimizations could be made. But let's see how fast RedCV could make it first. ;^)

hiiamboris

[20:41](#msg5f0780f53c217837fd8aeb0e)Think rather screwing up 5'000 wedding photos :D  
(because you don't see them all 5'000 at once)

greggirwin

[20:41](#msg5f07810f3c217837fd8aeb3b)&gt; everything is re-computable because you've still got the commands when you return to the application

Yes. You can also cache the latest render of course.

[20:42](#msg5f07815186ccb45b5996af8c)@hiiamboris that's where the AI/ML opinionated reviewing system kicks in.

theSherwood

[20:43](#msg5f07815bf6b741628423f545)Interesting. So then you blur the lines between something like a brushstroke and the history of the painting.

[20:43](#msg5f07818646c75b1e5e354169)You can apply that brushstroke anywhere, but you can also deconstruct it, tweak it, and reapply it.

greggirwin

[20:44](#msg5f0781967a4e99049efde4cd)Correct.

theSherwood

[20:46](#msg5f078214dbf01050ab64b8cd)That seems really powerful within an application but if you wanted something like this at the OS layer it would require a lot of conformity from third-party software to integrate with that. Unless the system were built from the ground up to work that way and only that way (I think Urbit might be that way).

greggirwin

[20:46](#msg5f07822d64ef9d04b2a26a14)It's a fun thought experiment. How does a painter work? How does a convolving kernel create an ink sketch or oil painting effect? Totally different, right? Could you, and maybe they exist already, create a body of strokes which are then applied algorithmically?

theSherwood

[20:47](#msg5f078261c7d15f7d0f812840)Yeah, that's a powerful idea

hiiamboris

[20:48](#msg5f07828c3e4a827d19b5f386)It doesn't scale performance-wise. E.g. if your brush has a texture. But for simple round brushes Mischief is an example, that is very fast and allows you to zoom (like 100x) into your painting and out.

[20:48](#msg5f0782af64ef9d04b2a26af5)Doesn't allow you to edit strokes though, if memory serves me... ;)

greggirwin

[20:49](#msg5f0782c63e4a827d19b5f3e9)Well, think about how crazy it is that we think of "time saving automation" as things like auto inserting your email signature, or running a mail merge, and how the "advanced" versions of this are text expanders and shortcut keys (which are necessarily limited).

[20:50](#msg5f07831f3e4a827d19b5f4d9)Given examples like the Unreal Nanite engine and other real-time rendering systems, this should not be sci fi.

theSherwood

[20:51](#msg5f078351a9378637e8baceb5)Nanite obliterated my performance intuitions.

[20:52](#msg5f07837b8342f46274059afd)But how much of that GPU stuff could be ported to a lot of the stuff we do everyday, which seems CPU bound a lot of the time?

greggirwin

[20:53](#msg5f0783bf7455046699eb750d)I'll mention Anthropics again, though it didn't occur to me until just now that it's sort of what they do. You can turn sections on and off, working with each one.

theSherwood

[20:55](#msg5f07842f3e4a827d19b5f856)Anthropics?

greggirwin

[20:56](#msg5f078477a9378637e8bad23d)https://www.anthropics.com/

[20:57](#msg5f07849c7455046699eb76cc)I've only used a couple of their products, but they're pretty cool, for a non-artist like me.

theSherwood

[20:57](#msg5f0784d264ef9d04b2a26fcb)Thanks for the link

[21:02](#msg5f0785e46e1b8050c3e4017d)Have either of you used or checked out Urbit?

[21:02](#msg5f0785f87455046699eb7a80)https://urbit.org/

[21:03](#msg5f07862cc7d15f7d0f8130b8)If I understand it correctly, it is fundamentally command based and saves a history of all the commands. Reminds me somewhat of what you were saying, @greggirwin

greggirwin

[21:30](#msg5f078c7446c75b1e5e35611b)I have not. Will do so soon.

theSherwood

[21:34](#msg5f078d79f6b741628424160a)The gist is that it is a sort of OS (sort of?) that paves over Unix with a new set of abstractions that are supposed to create a new ground level for computing. So pretty lofty goals. It does a lot of very interesting things that I think are worth exploring. Spiritually(?) similar to the rebol ecosystem in that the goal is to reduce complexity to manageable levels. But very different in that their language, Hoon, is nigh unreadable.

[21:36](#msg5f078df06e1b8050c3e4179e)But Hoon compiles to another language, Nock, which is a kind of functional assembly language. That's how they are able to constrain everything in the system to their command system. All operations in Urbit run in Nock, which is designed around facilitating the command and history system.

[21:37](#msg5f078e2d8342f4627405ba2a)Some really interesting ideas. Ultimately it falls down for me because Hoon is no fun at all and about as fast as Python. Which doesn't seem fast enough to me to be the basis of an operating system.

[21:44](#msg5f078fd17a4e99049efe0a06)Apart from reducing complexity, a big driving motivator for Urbit is to have networking at a more fundamental level, peer-to-peer and encrypted.

greggirwin

[23:32](#msg5f07a9027a4e99049efe4c94)Thanks for the summary. Nock is Lisp, with APL/Forth syntax influences and stronger constraints (no cycles). But, boy, I can't read it, or their Hoon examples for that matter. Since it's so small, and they have implementation examples, it shouldn't be too hard to port to either Red or R/S, or both. Not something we'll sponsor right now though.

There are a lot of cool ideas and noble goals in there, which is great, including the ID system. I recently prodded the team about `mmap` for embedded DB use, but it could work like Smalltalk images for apps, or even suites of apps I imagine. Do we have any `mmap` experts in the community?

## Friday 10th July, 2020

theSherwood

[02:24](#msg5f07d156c7d15f7d0f81e94f)I hadn't thought of embedding it. I wouldn't want to write or read hoon more than absolutely necessary. I did one of their 6 week courses in Hoon, and am in no hurry to use it again. I was more thinking that there are some interesting ideas in there that might work even better in Red. Red wouldn't be able to create something so pure and tight as the urbit system but is likely a lot more pragmatic. It's more readable and R/S would allow for speed where necessary. Seems that an OS in Red and R/S could be just as thin as urbit, more performant, and wouldn't need to pave over Unix the way Urbit does. For some of Urbit's goals, Red seems better suited than Hoon.

greggirwin

[03:21](#msg5f07deac86ccb45b59979839)I wasn't thinking of embedding either, just experimenting. @BeardPower has already done bare metal OS experiments. It's just a lot of work, and where you get killed is drivers. Sooooo much work there.

[03:22](#msg5f07dee88342f462740686df)I agree that there are some neat ideas there, and we've looked at various things along the same lines. Rebol/IOS leaned in that direction as well.

hiiamboris

[15:03](#msg5f08833d7455046699ee3916)@theSherwood Great introductory writeup there on Urbit, with so much clarity. Blog is okay too (but I only looked briefly). Hoon is crazy though ;)  
Anyway, at the first glance they didn't give answers to important questions, like:  
\- Do they wanna create a new network or use whatever network underlying Linux machine supports?  
\- How do they plan to make a browser? I don't see any productive work today without it  
\- Is economy even considered within this project? What will stop businesses from building centralized services inside Urbit network and capitalizing it? Should Urbit become known enough, it will be immediately seen as a new market to conquer

[15:05](#msg5f0883afbd3edf666fc063b9)This is also something @BaronRK may be interested in btw. https://urbit.org/blog/urbit-for-normies/

theSherwood

[15:46](#msg5f088d4186ccb45b5999a170)Thanks! Hoon is bananas. There are some really great ideas in it, but the bad ones spoil it for me. It is basically a functional-style lisp, but because there are constraints on arity they don't have to bother with delimiters (most of the time) and can write in something like an imperative style. But the "runes" make it unreadable for me. Hoon also has a macro system that they use internally but don't expose to the user, which is something is dislike.

&gt; Do they wanna create a new network or use whatever network underlying Linux machine supports?

They have their own network built on UDP. Their network is one of the more interesting and controversial aspects of Urbit. It is very opinionated.

&gt; How do they plan to make a browser? I don't see any productive work today without it

I don't know if they intend anything quite like a browser. You can simply pull content from other network nodes' filesystems (permissions allowing) as your filesystem is being served on the network all the time. I don't know if they've quite worked out how to handle discovery though.

&gt; Is economy even considered within this project? What will stop businesses from building centralized services inside Urbit network and capitalizing it? Should Urbit become known enough, it will be immediately seen as a new market to conquer

Economy is a big part of the design. I think the idea is that the design makes it so easy to make applications and services in which users control their own data that services that expect to centralize data will not be able to compete with those which don't.

Disclaimer: I haven't done anything with Urbit in some months. So it is entirely possible that things have changed or that I misunderstood them in the first place.

hiiamboris

[15:51](#msg5f088e7986ccb45b5999a5ce)Thanks for the info. I need to process it for some time, maybe read more ;)

[15:53](#msg5f088f0ea5ab931e4f7a3f52)There was this \[Netsukuku](https://en.wikipedia.org/wiki/Netsukuku) UDP p2p network I stumbled upon recently. I think it died before it was born though.

theSherwood

[15:57](#msg5f08900786ccb45b5999ab2f)Interesting. What killed Netsukuku?

hiiamboris

[16:06](#msg5f08920e7455046699ee778e)The author didn't get the funding

[16:07](#msg5f08923fa5ab931e4f7a4ea1)But it seems, ideas once coined are there to live ;)

theSherwood

[16:08](#msg5f089282bd3edf666fc09b0e):thumbsup:

dander

[19:52](#msg5f08c6ff3c217837fd8e8aeb)The discussion about trees of commands or states seems like it maps really closely to the model of a Git repo. The interface depends a lot on how much detail a user needs about finding points in the graph they are interested in. For Git, even with all the effort put into building those interfaces, I'd say most are still pretty hard to use. It's probably different for each application, but I'm not sure how you move away from displaying the tree in some form. You need some way to avoid getting lost, as well as cleaning up or hiding abandoned branches. Here's another tree visualization for a completely different type of application https://sabaki.yichuanshen.de/

theSherwood

[20:14](#msg5f08cc37f6b7416284279d75)I think displaying the tree is essential for intuitive use. Getting that tree view right would likely take a lot of effort, but there are a lot of opportunities there: hover over a node a get a preview of the application or content; click on two nodes and get the diff; leave comments and metadata on nodes that can be seen in the tree view; have a sidebar with nodes that you have bookmarked as the current best alternative versions of your content for quick access; click to navigate; double-click to move the cursor (git HEAD) to a particular node; add or delete tree nodes from within the tree view; Shift+Scroll to leave/enter tree view; visually collapse long, non-branching lists of states; use document distance and other algorithms to spatially locate the biggest clusters of differences across the tree; query by date or other parameters like text search (eg: highlight all nodes which match this `parse` call); get statistics and data visualizations in various forms (eg: word count difference in timeline form for text documents).

Version control is so monumentally useful, it is kind of shocking we don't have it underpinning everything digital we do.

[20:17](#msg5f08cce9a5ab931e4f7b077a)And an interface to make that accessible to programmers and non-programmers seems like a powerful thing.

dander

[20:45](#msg5f08d35b6e1b8050c3e7c4af)I haven't ever experimented with this gist, but I remember some discussion about it a while back. An \[immutable copy-on-write](https://gist.github.com/numberjay/3df8f13044145c6dde1918ea2cdfe3b8) data structure (I think that's how this works) would be really useful for representing that kind of history

theSherwood

[20:52](#msg5f08d51064ef9d04b2a646a8)Oh I remember seeing that gist. There's some cool stuff there. Persistent data structures like that would be very useful in memory. Is it possible to do persistent data structures on disk?

dander

[21:01](#msg5f08d70f6e1b8050c3e7cf9d)I don't see why not. It's all just standard Red data structures under the hood, so they can be written/read like normal

theSherwood

[21:04](#msg5f08d7daa5ab931e4f7b29a3)Interesting. I was thinking deltas with the occasional snapshot, but if you could incrementally read and write persistent data structures to disk, that might be even better.

hiiamboris

[21:09](#msg5f08d8fd7a4e99049e01b360)You can map your memory to disk directly and let OS handle the writes ;)

theSherwood

[21:10](#msg5f08d953a5ab931e4f7b2d07)It wouldn't rewrite the whole structure every time? (I don't know much of anything about stuff on this level)

hiiamboris

[21:15](#msg5f08da71f6b741628427c4d2)No. There's a virtual memory space. It has lots of pages. Each page can be mapped ("swapped") to disk or to actual RAM. OS usually selects what to put where to achieve best balance of performance and RAM load, but it allows you to override this decision and specify a file on the disk. I guess it will still cache multiple writes to a single \*page\*, although it must be controllable somehow.

theSherwood

[21:30](#msg5f08de008b72655b5564709e)Interesting. I guess that could start getting messy if you are wanting to be able to comment or annotate some individual node. Would it then need to be in the data structure itself?

GaryMiller

[21:35](#msg5f08df2d86ccb45b599aa053)This kind of scheme is common in in-memory databases. lazy write - Computer Definition The effect caused by using a write-back cache. Data are written to the cache first and, later, during idle machine cycles or at some specified time, are written to disk if there is a disk cache or to memory if there is a CPU cache. SQL Server database has a process called Lazy Writer which keeps free buffers available by removing infrequently used pages from the buffer cache. Dirty pages are first written to disk. Eager writing. The eager write process writes dirty data pages associated with nonlogged operations such as bulk insert and select into.

hiiamboris

[21:35](#msg5f08df3486ccb45b599aa066)@theSherwood For the OS, memory is just a segment. How you arrange your data in memory is up to you.

theSherwood

[21:40](#msg5f08e05846c75b1e5e3928ff)Hmm. I really need to dig into all this low-level stuff. I'm out of my depth here. haha. I feel like I understand what you both are saying but don't have enough of a mental model to understand the implications.

hiiamboris

[21:46](#msg5f08e1a264ef9d04b2a66cbf)☻

theSherwood

[21:46](#msg5f08e1cf7a4e99049e01cb17)Thanks for all the info, folks. I've got my work cut out for me.

greggirwin

[22:26](#msg5f08eb0c3c217837fd8ef4d5)https://www.usenix.org/system/files/login/articles/login\_winter19\_08\_kelly.pdf

https://web.eecs.umich.edu/~tpkelly/papers/Failure\_atomic\_msync\_EuroSys\_2013.pdf

https://github.com/erthink/libmdbx

[22:29](#msg5f08ebc43e4a827d19ba0ac7)Persistent memory has no concept of historical changes however. But that's OK, a separate log works fine for that. Now, if you build your entire data store as a temporal DB, then you get it all...I think.

theSherwood

[22:35](#msg5f08ed173c217837fd8efa64)Thanks for the links. That's kind of what I'm thinking in terms of storage. Using a vaguely \[datomic](https://docs.datomic.com/cloud/index.html)-like database.

greggirwin

[22:35](#msg5f08ed1da9378637e8bed7a2)I'm all for everything have an audit trail and history. Version control is great, when it comes to minimizing redundancy in storage, by just tracking changes. Distributed version control comes with a cost, more then centralized version control. Benefits too, of course, but not universally better. If you just have a linear history, and can compare between points in that history, that's more than what we have now, and all most people need. If it's not easy. I mean really, really, really easy, people won't use it. Then it doesn't matter how fancy it is or what features it supports. Come up with a good UI \*first\*, no matter how ugly the underlying mechanism, \*then* make it powerful.

[22:36](#msg5f08ed6564ef9d04b2a68c2e)There is also no one-size-fits-all DB, and no free lunch. Something else to keep in mind.

theSherwood

[22:38](#msg5f08edec86ccb45b599ac592)For sure. To be clear, I mean datomic-like in the sense of the data model more than the architecture. I'm not so much interested in distributed version control as I am in datomic's highly queryable data model for local version control.

greggirwin

[22:40](#msg5f08ee7ba5ab931e4f7b65b3)Yes, but Datomic makes conscious tradeoffs to do that. Just as all the key-value DBs vie to be the fastest engine that helps you the least. :^)

theSherwood

[22:44](#msg5f08ef578b72655b55649cd1)Haha. Yes, I'm sure the datomic model isn't the fastest for most things. But it seems to lend itself well to discoverability, versioning, and interlinking content, which is where I think most users and workflows could do with the biggest lift.

[22:49](#msg5f08f0653e4a827d19ba15ec)I personally find myself saving multiple versions of content not infrequently. This has been alleviated somewhat by git. But git as an interface is not great for much for anything but entire repositories of code. What I would really like is to be able to track version histories for single files in a near frictionless manner. I think that would cover a lot of users' use cases.

BaronRK

[23:10](#msg5f08f55a46c75b1e5e396132)'The discussion about trees of commands or states seems like it maps really closely to the model of a Git repo.'

One day, we will find all models are the same, and we will reuse a base code system that just does everything.

## Sunday 12nd July, 2020

BaronRK

[19:44](#msg5f0b680946c75b1e5e3f7b63)\[!\[FastAPI.jpg](https://files.gitter.im/5aa6f8ced73408ce4f9110f7/Trf3/thumb/FastAPI.jpg)](https://files.gitter.im/5aa6f8ced73408ce4f9110f7/Trf3/FastAPI.jpg)

GiuseppeChillemi

[20:16](#msg5f0b6f87c7d15f7d0f8b7d05)🤦‍♂️

hiiamboris

[20:24](#msg5f0b71726e1b8050c3ee3523)Funny, so polished R2 couldn't serialize it's own errors:

```
>> c: context [x: try [1 / 0]]
** Math Error: Attempt to divide by zero
** Where: context
** Near: 1 / 0
>> mold/all/flat c
== "#[object! [^/x: error^/]]"
```

greggirwin

[21:08](#msg5f0b7bda7455046699f5d903)It's funny to me that I care deeply about correctness, but I'm fine with incompleteness.

[21:10](#msg5f0b7c56c7d15f7d0f8b9a77)Maybe it's the balance. How much useful work can we do relative to how many things we can't do.

## Monday 13th July, 2020

TimeSlip

[17:55](#msg5f0ca01a86ccb45b59a41844)@BaronRK Funny! It's so true that when the job market is a tight employers can ask for anything and when it's not, they will take anything. I was going to say that in the end it turns out the same but from what I have seen, I'd give the nod to the latter in terms of finding better employees.  
Thanks for sharing that.

BaronRK

[20:52](#msg5f0cc9758b72655b556e8f25)Of note ...

I started my first tech (hardware/software) company in 1985. A pattern emerged that I was even able to confirm.

I noticed that when the market was down, we did EVEN BETTER.  
When the market was great, we had to fight a little more to find contracts.  
This is even true today.

But why?

What I would notice is we were always being offered to come in and FIX a previous project. I formed a model, which is that:

In good times people are more nepotistic.  
When things get tight, they hire people that they know will come through, get the work done on time, and on budget.

I'm an abrasive person, so in general, people call on me only when they have to LOL. Truly, I know this, and even discussed this with people hiring my team.

## Tuesday 14th July, 2020

GiuseppeChillemi

[16:32](#msg5f0dde0d9c75aa256b3d870d)Does anyone know an interactive online presentation service to build slideshows. let people interact choosing the path, view video and eventually download some files? It would be good if I can remotely guide the user...

BaronRK

[22:00](#msg5f0e2b1826b22649721ea001)https://prezi.com/

## Wednesday 15th July, 2020

GiuseppeChillemi

[00:03](#msg5f0e47e91cc0436959630ea9)Thanks, I have found some on the same style, together with analytics...

[00:08](#msg5f0e48e60d37916fda762ca3)... But today I have discovered Chrome doing a very bad thing: I had a problem on my bookmark file, so I made 2 copies af the backup, just to be sure, and imported it. Well, opening the dir before importing, Chrome issued a `delete bookmark*` on the dir, deleting the \`bookmark copy.bak and ...copy2.bak"!!!!

[00:09](#msg5f0e4945e3505d7736fd9cff)Thanks God I had backupped the faulty bookmarks file in another drive, and at least I have this one but with mixed directories.

[00:10](#msg5f0e49721cc04369596312df)Si, the rule is: have at least 4 copies of a file in different locations!

[00:11](#msg5f0e49a9f253d22569d6b602)There where all findings on this topic. I will have to find where they are.

[00:11](#msg5f0e49b39aa33c5584290a43)\*there were

BaronRK

[04:36](#msg5f0e87d01cc043695963a38f)Scary. Indeed, I do back ups of such things every month as well.  
I really want a one way drive.

## Thursday 16th July, 2020

GiuseppeChillemi

[18:09](#msg5f1097e3fe59352799023922)@BaronRK I have looked at http://prezi.com It has a nice and clean inteface. I will go deep in the next days. I think I will use it for business presentations.

BaronRK

[20:16](#msg5f10b5b854d58c013a48ec6b)It is 'fun' but it lacks some REALLY SIMPLE tools and philosophy that would make it 10x better.

At least last time I played with it, you could not do branching.  
I want to create a path(s), and let you jump to random places, or move around more easily.

It seems to be just a single path you force people down.

dander

[21:13](#msg5f10c316e3505d7736048f58)Sort of like making a mind map into a presentation tool?

9214

[21:15](#msg5f10c38ed60398014655e0eb)@dander \[VUE](https://vue.tufts.edu/) from Tufts university does that.

TimeSlip

[21:21](#msg5f10c4e23fb51c4967a93a66)@9214 Hey thanks. That Vue looks good. I used to use Xmind. https://www.xmind.net/

BaronRK

[22:22](#msg5f10d335775d59377cf92419)When you get right down to it, ALL these tools could be ONE tool.

MindMaps, FlowCharts, etc.

Almost all vector rending systems are just that.  
The UI could be focused on things to make special operations work a specific way.

This is what annoys me, people confuse UI/UX with data models.

Why can't we just have MODES.

\- Vector draw  
\- Point draw  
\- Group move

Figma (Adobe XD, etc.) do all of these.

Mindmaps are just Groups that have rubber bands attached to them.

Why not just have:

\- MindMap Mode?

Respectech

[22:48](#msg5f10d93c8a9a0a08cba1de99)@BaronRK I was thinking a similar thing. Automation software basically boils down to task lists, and task lists are a more specific form of a generalized list.

GiuseppeChillemi

[22:49](#msg5f10d97f5ed1d53774651a89)@Respectech they are list with

[22:51](#msg5f10d9d8724012319baf00bb)data which specify additional properties. Red already ha everything to implement them, including sub lists.

[22:51](#msg5f10da01564e6b39f55f4e79)\*has (I am on mobile)

[22:58](#msg5f10db8b64b6213da141546e)@BaronRK There are other tools which seem enough interesting but I have to create a remote business presentation for the next week. I will use it and try the others later and report, if other have interest.

## Friday 17th July, 2020

BaronRK

[00:20](#msg5f10eed818ddba6ef5db3c29)yes!

## Saturday 18th July, 2020

hiiamboris

[15:52](#msg5f131ab764b6213da1471272)I have now messages from some rooms interleaved with messages from other rooms. So much progress at Gutter!

BaronRK

[17:10](#msg5f132cf3724012319bb4e27e)The whole Gitter UI is so strange to me.

you have 'ALL CONVERSATIONS' on the left side, but to get to MORE you click on the Globe on the upper Right side. Why?

Why not just put MORE directly before your list of threads, or make 'ALL CONVERSATIONS' into a button directly? Simple.

ne1uno

[17:13](#msg5f132d9d82ccdc78add07c30)1/2 screen branding?

[17:13](#msg5f132dd68a9a0a08cba7c3da)no accident or oversight

[17:24](#msg5f133032f8b05b39f9536401)on a narrower window, the huge left menu does hide, but otherwise limits conversation content window. I use the irc bridge which passes all the edits real time. including ninja edits

## Sunday 19th July, 2020

vazub

[14:58](#msg5f145fb082ccdc78add32e29)If anyone needs Rebol 2 for MacOS 64-bit, here is my docker project for it: https://github.com/vazub/rebol2-docker

I am also working to get Red on Docker, but there are some additional challenges to deal with first. WIP

9214

[15:39](#msg5f146934564e6b39f567f3f0)@vazub, @x8x has something regarding containerized Red, but it's not released yet.

GiuseppeChillemi

[22:47](#msg5f14cd6c64b6213da14aeb27)2 years here and I feel link being at 15% of what I should know.

## Monday 20th July, 2020

BaronRK

[01:10](#msg5f14eeec564e6b39f56932f4)I've been here for over 60 years, and I feel like everyone knows only 15% of what they should know.

TimeSlip

[05:31](#msg5f152c4e8e9a3a6ef0a25337)@GiuseppeChillemi @BaronRK Let's not fail to include what we did know and forgot. I'm in a constant state of mental erosion. That's why most of the programs I write are organizers and reminders. :-)

planetsizecpu

[06:32](#msg5f153a8d5ed1d537746fc34f)@TimeSlip +1 I'm one of those who do not remember more than five or ten pages above from the point I'm reading the book, coding and programming is a good mental exercise for me but I'm thinking of following the advice of Cheers-Cliff Calvin haha

&gt; beer makes you feel always smarter

GiuseppeChillemi

[08:59](#msg5f155cfd5ed1d53774701c86)&gt; I've been here for over 60 years, and I feel like everyone knows only 15% of what they should know.

The less I think I know, the more I have a mind open to learning.

vazub

[13:20](#msg5f159a31564e6b39f56ae2bd)I've dockerized Red for MacOS usage - https://github.com/vazub/red-docker-macos - should work as a drop-in replacement for the normal `red` executable. The docker image is rather fat atm (211 MB), but I am planning to trim it down in future. Enjoy!

rebolek

[13:35](#msg5f159d9f775d59377c04bda4):clap:

greggirwin

[17:55](#msg5f15da90b2dad248b6caccab)Thanks @vazub !

@planetsizecpu, so many great things from that show.

&gt; Carla: Which is heavier, a pound of Cliff's brain, or a pound of dead flies?"

&gt; Woody: Ha! A pound is a pound. Go ahead, ask me another one of Mr. Claven's brain questions.

GiuseppeChillemi

[20:58](#msg5f1605928a9a0a08cbaec712)21 years have since the last boot... how do I save and quit ? ESC+SA ESC+Q It was under my fingers like 20 years have never passed. Guess which software had this sequence?

greggirwin

[21:06](#msg5f160759b2dad248b6cb52dd)Can't say. My WordStar, WordPerfect, and VDE command days are long gone. :^)

GiuseppeChillemi

[21:12](#msg5f1608a6564e6b39f56c2986)A friend has asked to me to install a FS-UAE Amiga with SAS/C, I have had the need to edit the startup sequence. `SYSTEM:> ED S:startup-sequence` ...and my ESC+SA ESC+Q was there. It's incredible how our executive memory can remember such things from a very distant past.

BaronRK

[23:06](#msg5f16239364b6213da14e77e2)I did the same, ran Disney Animation Studio (Amiga) on an Android!

for a few moments, I was in Amiga mode, and even on a bloody cell phone, everything came back to me instantly. It was fun

It was also fun to see my slow painful cell phone suddenly become RIPPING FAST!

Like, everything popped up FASTER than it seemed my finger was even touching the screen.

## Tuesday 21st July, 2020

planetsizecpu

[08:10](#msg5f16a2f1361e295cf019d72c)Amiga questions? just ask @carls 🙄

BaronRK

[14:48](#msg5f170032361e295cf01ae272)Things I miss A LOT from Amiga (that Windows and Mac both do wrong.

\- MENUS - No taskbars or headers. I really miss having a CLEAN window/screen. I miss the simplicity of getting to the menus by moving the mouse to the top of the screen, Right-clicking, and having everything appear only when I want that stuff. Modern UI wastes SO MUCH REAL ESTATE!

\- MULTI-SELECT - On the Amiga, once a menu was open, you could select many things before you closed it. On Win/Mac you pick on thing at a time. I do this every day, pisses me off every day.

\- KEY CONTROLLED MOUSE POINTER - I always loved on the Amiga the ability to nudge the mouse pointer with the arrows keys.

\- S: FOLDER - Having a dedicated place to put all your startup scripts, and just knowing you could understand and set up your computer the way you liked. Modern OS make this a nightmare, and for no good reason.

\- INSTANT UI - That the amiga offered up 25% of the DMA hardware to ensure the UI came first. I REALLY miss this. Everything makes modern Win/Android slow down. At least iOS 'fakes' it (and they do fake it using tricks).

\- SCREENS: The Amiga trick of allowing you to change the resolution on the scan line was POWERFUL. It's not to have Screens AND Windows. Meaning, the ability to just say 'put the video on a dedicated screen of just 320x240, even if external.

\- SIMPLE LIBRARIES - The Amiga was conducive to simple coding, simple calls, simple libraries. We made a lib back in the 80s, and used it for a decade. It contained all the tricks we found ourselves doing over and over again. I miss that library. One example, it tool numbers, and simply made sure they had the proper ',' and '.' i.e. 65536 -&gt; 65,536 or 65.536. We constantly have to mess with this in JavaScript.

... those were off the top of my head.

Respectech

[14:55](#msg5f1701e09419f46bf5bd75b5)@BaronRK agreed.

pekr

[14:57](#msg5f1702667a668c64e9f7b653)So refreshing to read all those reasonings :-)

GiuseppeChillemi

[15:04](#msg5f1703e4a573e564fecb3cca)Rebol was just one of Amiga creators attempt to keep things simple.

hiiamboris

[15:13](#msg5f170618f0b3335ce1849e5b)&gt; KEY CONTROLLED MOUSE POINTER

Just a note. This is under 'accessibility' features on Windows. You can even sacrifice one of Num Lock states for that.

GiuseppeChillemi

[15:54](#msg5f170fd0a4905773bfb0f6ed)I still remember the DMA also had different levels and priorities:. here is an interesting page with DMA slot allocations. http://amigadev.elowar.com/read/ADCD\_2.1/Hardware\_Manual\_guide/node012B.html

BaronRK

[16:35](#msg5f17193b9419f46bf5bdb8fc)@hiiamboris yes!

... but, it pushes the mouse (force-velocity), the Amiga was pixel-accurate. That is the part I miss the most. The ability to ask the mouse to 'move over one pixel.'

That is what I meant by 'nudge'

hiiamboris

[16:35](#msg5f17196c43d5173b8c0cd6d9)I think it's possible with Ctrl or other modifier

[16:36](#msg5f1719a243d5173b8c0cd7ea)It's boring though, as there is no acceleration in it.

[16:38](#msg5f171a12a573e564fecb8245)It's like it was designed just to mark as "we have it" feature, not as "we want this usable".

GiuseppeChillemi

[16:53](#msg5f171d93f0b3335ce184ead8)Because we are talking about GUIs... I need to create a script that is activated when a window opens. Then it must search in its element (in a specific or multiple ones) for a particular value and react accordingly. Any suggestion on what could I use to tun a Red script at window open event, pass the Gui ID, and then start in it a scan for a content using Red with some inspection command?

greggirwin

[16:56](#msg5f171e5715e5e72fb368866d)If you mean other native windows, you'll need to use a number of APIs (OS specific), but it can be done. Will be quite a bit of deep work.

GiuseppeChillemi

[17:01](#msg5f171f6da4b25c73c1df2db0)I mean other native Windows 10 windows. Without using APIs I was thinking about a tool that could start a Red script at window open and then another a command line inspect program could be invoked to read and return the windows content as text file. Then the Red script will read this file.

hiiamboris

[17:05](#msg5f17203ef0b3335ce184f422)Looks like an RPA task ;)

[17:05](#msg5f1720676279c91f4203fa19)I don't think you can just inspect other windows' data, as it would be a security breach.

greggirwin

[17:20](#msg5f1723f4cb20727cfd3c90f5)There may be tools that do basically that. Given a window handle you enumerate the child windows and send a message to each, asking for the value(s) you want. I don't know what's different under Win10 though.

hiiamboris

[17:23](#msg5f17249943d5173b8c0cf9fa)You can send them messages but how do they answer? ;)

[17:25](#msg5f1724f7a4905773bfb132c1)Nevermind, you're right, might work

greggirwin

[17:25](#msg5f172505f583a47d15a1a8db)lParam.

hiiamboris

[17:27](#msg5f17258d7a668c64e9f81ef6)&gt; However, GetWindowText cannot retrieve the text of a control in another application.

[17:27](#msg5f1725999419f46bf5bde027)So they actually used their minds when designed this.

[17:29](#msg5f1726119419f46bf5bde120)And that's why RPA resorts to OCR for such a task.

greggirwin

[17:30](#msg5f1726229360cb1f465e3f7f)&gt; To retrieve the text of a control in another process, send a WM\_GETTEXT message directly instead of calling GetWindowText.

hiiamboris

[17:30](#msg5f17264b15e5e72fb368a05b)Oh great ;) And I was just starting to think good things about MS

BaronRK

[18:05](#msg5f172e4ecb20727cfd3caca5)(cont)

\- oh, and I miss the simple OCR exe that existed for the Amiga, where you could grab any part of a window (raster) and it would hand you back any text it found perfectly (as long as it could match the font).

GiuseppeChillemi

[18:27](#msg5f1733afa573e564fecbce75)\[This page](https://docs.microsoft.com/en-us/windows/win32/winauto/inspect-objects) has given me some hint it could be done. Windows has an accessibility API and it could contain text and othe gui element:

[18:28](#msg5f1733d3a15ff42fa8e21acb)@BaronRK I have never used an OCR on Amiga.

TimeSlip

[18:48](#msg5f173887f583a47d15a1e89d)@BaronRK One of the best features of the Amiga was being in a world ahead of its time and so counter-techno-culture. I admit that's the ego in me. I got to work for C= and I remember trying to explain multi-tasking to a PC-using business guy who he asked me, "Why would I want to do more than one thing at a time?"

For me, Rebol and Red have that same "rebelliousness" about them. Actually the comparison is more than that. Although we could do a lot of things others couldn't, there were always applications that seem to elude us. In the software sense (outside of your's of course :-) ) we didn't compete. WP and Basic perhaps being the exceptions. Had we had Lotus and dBase, that may have helped us break through. Or, selling the bridge card for cheap instead of costing more than a PC.

Of course it's water under the bridge now and I'm only speculating. IBM, Compaq, and Bill weren't just going to roll over. :-)

hiiamboris

[18:59](#msg5f173b17cb20727cfd3cd5d6)I just ran Inspect and it's a scary tool. It can see browser tabs, controls on Electron-based crappy apps, it even found an invocation to Chtulhu...

GiuseppeChillemi

[19:12](#msg5f173e1f361e295cf01b98f4):-D

[19:14](#msg5f173e7ecb20727cfd3cdff5)I have not run it but I have supposed it could be able to see a lot.

dander

[19:36](#msg5f1743a9f0b3335ce1856240)I hadn't seen that before either. Really interesting tool. I bet it's using \[one of these APIs](https://docs.microsoft.com/en-us/windows/win32/winauto/microsoft-active-accessibility-and-ui-automation-compared) under the hood

greggirwin

[19:42](#msg5f174508361e295cf01bb107)Interesting. We'll need to consider `rich-text` it seems, per their web content notes. More importantly, and this ties to HOFs for a tree model or `parse` for a dialected model, we should try to make this a \*lot* easier by focusing on UI as content/data. This comes back to interrogative interfaces as well.

GiuseppeChillemi

[20:27](#msg5f174fc715e5e72fb3692625)@greggirwin I have introduced this argument because one of my projects in the area of interface automation needs a bridge between Red and foreign UIs. I remember a discussion about Autoit and Red but this goes at a deeper level of interaction. I am not ready for windows API level works but if I will find a way to read the windows tree and content via command line and receive the window ID I will develop my solution. Otherwise I will need to wait to upper my skills. Another TODO entry in my notes ( that @hiiamboris is curious to see... But be sure it will happen! ) for future projects.

BaronRK

[23:46](#msg5f177e3ca4905773bfb23270)@GiuseppeChillemi yeah, it was a cool TRICK.

Since fonts were available to all apps, you could do a 100% match to any font on the screen that used these. Thus even if you could not get access to the text directly, you could do a screen shot and get it that way. This was 30 YEARS AGO! Amazing eh?

[23:54](#msg5f17803b43d5173b8c0df842)@TimeSlip so a bit of history...

'Had we had Lotus and dBase, '

I knew Mitchell Kapor, and I arranged for C= to meet with them. We all flew out together to Boston. Mitch thought C= (Amiga) was a game company not worth his time. Gail Wellington and I sat at the table, and when Mitch started asking questions, she slid a folder over to him containing C='s economics.

She played it so cool. Mitch, realised ................ C= was worth north of 2 Billion at that time, and we played it more like C= wanted to buy Lotus (which it really could).

Sadly, someone (we think both Gates and Jobs) talked Mitch out of it.

And on dBase, I knew Hal Ashton (real name Lashlee). Hal was a cool cat (drove an old pick up truck like mine at the time.

I tried to get him to consider the Amiga, but he was already out of the biz by then, and he just didn't care any more. He made some money and retired.

## Wednesday 22nd July, 2020

pekr

[06:39](#msg5f17df2f7a668c64e9fa02b8)Four things came to my mind as an addition to Reichart's list of unprecedented Amiga features:

\- LOCALE SYSTEM - abstracted way of the app translations. ATO (Amiga Translation Organisation), here in CZ has helped even MS to translate Win98. It was not unusual to deliver app with 10+ catalogues for various languages.  
\- CROSS APP SCRIPTING - Arexx port to each of your apps. I do remember seeing examples of launching an Apple emulation, gfx app in terms of MacOs, submitting it some photos and getting the result back. The infrastructure was mostly a commodity, so each dev could add an Arexx port to his/her app.  
\- DATATYPES - you have created an pps, which could handle the format, which was not eventually available at the time of its creation?  
\- Now the the really small one, but I wish Windows would have it - ALWAYS ON TOP WINDOWS. There are times, when I need to take my notes to small text window and I wish theat freaking window would stick over the document I take my notes from! Such a small thing and such a huge usability advantage! :-)

BaronRK

[08:01](#msg5f17f252a573e564fecdc999)- Arexx I miss Arexx a lot (I'm working on an API project that overlaps with that).

\- Always on top. There was a program 'QMouse' that did this on Amiga (and many other things.

One cool features was SunMouse

http://aminet.net/package/misc/fish/fish-0979

{QMouse

An unusually small and feature-packed "mouse utility". Was inspired by, but not derived from, the original QMouse by Lyman Epp. Features include automatic window activation (like WindX), top-line blanking for A3000/A2320 users, system friendly mouse blanking, mouse acceleration and/or threshold, "Pop-CLI", click-to-front/back, "SunMouse", "NoClick", "WildStar", Northgate key remapping, and more.}

VLC offers 'Always on Top.'

But, this brings up the BIG questions, why don't ALL windows simply have all of this?

\- Always on Top (or always behind)  
\- Remember to open in the same place next time.  
\- Transparency  
\- Move to size/location/monitor  
\- Suppress Title bar  
\- Scale (really powerful for running old programs that were designed for lower res)  
\- etc.

pekr

[08:14](#msg5f17f549f0b3335ce1872ce0)Perfect. Where do we send that? MS, Apple? Or do we somehow resurrect the Amiga? :-) It's unbelievable, how manking can waste an energy on things, which were once invented and worked quite well. When I was young, I have thought, that after the 2K year, there will be little space for innovations. Man, I was wrong :-)

hiiamboris

[08:45](#msg5f17fcc19360cb1f46607288)Dexpot can make any window topmost, based on rules you give it.

[08:48](#msg5f17fd66a4905773bfb3671e)AHK too

BaronRK

[14:55](#msg5f185361273e723b7ff9e2e6)One thing that is 'almost' impossible to do on Windows, is FORCE the task bar NOT to show up. There are several apps that claim to do it, they fail.

So simple, but soooooooooooooooo annoying.

2K year - LOL

https://patentlyo.com/patent/2011/01/tracing-the-quote-everything-that-can-be-invented-has-been-invented.html

hiiamboris

[15:47](#msg5f185f77f583a47d15a502dc)It's easy. Just use another shell, not Explorer.

ne1uno

[15:49](#msg5f186024cb20727cfd3fe44a)`taskkill /IM explorer.exe /F`

hiiamboris

[15:50](#msg5f186039a4905773bfb47c28)that's also a solution ;)

ne1uno

[15:51](#msg5f186078a573e564fecf0195)'Tesseract-OCR \\Clipboard01.tif clip.out\`

[15:52](#msg5f1860bea573e564fecf0297)`AlwaysOnTop.exe`

[15:54](#msg5f18614da4905773bfb47e5f)we need a config framework to remember position etc. for every action you need a way to turn the option off, someone will hate it.

greggirwin

[17:59](#msg5f187e879419f46bf5c17307)This all comes back to putting users in control instead of devs. If we (devs) actually knew what created a consistently better experience for users, that would be great. But a) we don't, and b) every user is different, so the best thing may be to let them do it anyway. This is where standards can really help. If every app is wildly different, using tricks and workarounds, \*trying* to be unique instead of useful, they don't play well with others.

theSherwood

[18:08](#msg5f18809415e5e72fb36c600b)I think an important part of that is making the system forgiving of mistakes. Devs feel they have to protect the user from themselves because we haven't provided ourselves or our users with reliable systems for recovering from mistakes and errors.

BaronRK

[18:10](#msg5f18810b361e295cf01ef505)I don't want to lose the task bar, I just don't want it when I don't want it.  
So I want a keyboard = bring it up/put it down which is the best solution.

Turns out there is a perfect key for this \[Windows]

Have PROOF another Shell will do this?

greggirwin

[18:31](#msg5f18861143d5173b8c10a8fd)@theSherwood agreed. The other thing we do now is take away the ability to do...much, e.g. phone apps. Users are strictly consumers.

theSherwood

[18:55](#msg5f188ba76279c91f4207d53d)@greggirwin That's something that I've been thinking about a lot with regards to Red. Seems like a RedOS could be quite small and could be isomorphic across devices (on account of Red's cross-compilation). One would need to handle the responsive GUIs intelligently and drivers for mobile-specific input hardware, of course. But how nice would it be to be able to run whatever script you want on your phone!

hiiamboris

[18:58](#msg5f188c40a4b25c73c1e30c09)&gt; Have PROOF another Shell will do this?

I haven't had the need for that on 24" monitor, ever. So Explorer is perfectly fine. Some years ago I used Blackbox (that was on Win98/WinME) as a shell and it could show/hide itself alright. I'm sure there's plenty of shells capable of that around.

[19:00](#msg5f188cde6279c91f4207d951)I don't autohide it personally, because it gives me a nice bird view of things.

greggirwin

[19:07](#msg5f188e6915e5e72fb36c858e)The first step I see down this path for Red is a container-app-as-guest-OS, a Red Browser if you will. It doesn't mean you have just one, or that they all work the same, just that the app's framework handles most of this for you automatically, including all those window settings. If we think of it like a microkernel OS, the task bar is just another user space app.

## Thursday 23th July, 2020

theSherwood

[02:52](#msg5f18fb7243d5173b8c11d23b)@greggirwin I love this idea. If it gets successful enough, and people start doing a high-enough percentage of their work (and play) within RedOS/Red Browser, then you can scrape out the OS underneath and have Red top to bottom. I think the browser is a good metaphor. For a lot of users, the OS is just something from which to launch their web browser. And the obvious reason for this is not the quality or speed of the programs they use on the web, but the distribution model of the web. If RedOS/Red Browser could have a distribution model that was competitive with the web but allowed for better experiences (such as less silo-ing of data, better persistence, easier sharing and publishing, better collaboration, better search, etc.), who knows?

GiuseppeChillemi

[12:52](#msg5f1987f0cb20727cfd42cab7)I need use the SQLCMD command to access a SQL Server from a Windows server. Result is: DOMAIN/USER is not allowed to access this server is the result. I am discovering that to access SQL I have to find the server which has the Domain Controller, learn how it works, discover if active directory exists, add the SQL Server to one or another, go to SQL server and add the Domain user. A simple login will need hours on DNS, Access Methods, DC, DA, Keys, configurations backup and pray that finally it will work! I'll spend at least 10 hours on this. "Keep it Simple" , I can hear the voice of Carl saying this.

[13:02](#msg5f198a71a4b25c73c1e58cdb)Note, the original version that was playing in my mind was full of censorable words.

pekr

[13:44](#msg5f199456a573e564fed22441)What about finding some way of talking to ODBC instead?

TimeSlip

[16:07](#msg5f19b5aea4b25c73c1e6070c)@BaronRK Thanks for that cool insight. You knew too then it was really the applications that mattered and not so much the hardware. Gates and Jobs were smart guys.

rebolek

[16:24](#msg5f19b9d7f583a47d15a89f8d)OTOH the hardware made such applications possible.

BeardPower

[16:26](#msg5f19ba2b361e295cf0223aa2)@TimeSlip For Jobs hardware was VERY important and it mattered a lot to him.

[16:26](#msg5f19ba4b6279c91f420ae5aa)Sometimes he even put hardware above all else.

GiuseppeChillemi

[17:11](#msg5f19c4a6cb20727cfd437a88)@pekr I use Munge, it relies on SQLCMD.

TimeSlip

[17:56](#msg5f19cf65273e723b7ffdeb43)@BeardPower Yes, I'm not saying it's not insignificant. It's just that one can have greatest hardware and not have success. That makes me wonder if the opposite is true.

BeardPower

[21:48](#msg5f1a05a777eccd0e146e9af7)@TimeSlip Absolutely. You can have the greatest software and not have success.

## Friday 24th July, 2020

TimeSlip

[04:29](#msg5f1a63bcb1409c060f7d8175)@BeardPower I know. That's what I keep telling myself after each app I write. :-)

## Saturday 25th July, 2020

GiuseppeChillemi

[20:44](#msg5f1c999a3eef7e1ffe336368)I am working on a powered up version of `SET`. I admit that the confusion coming from many nested `CASE` and working with similar names is something I have undermined. I am resolving with very distinctive word names, also having very different length, a lot of comments and with a couple more techniques as mirroring each `CASE` condition as comment just after the ending block bracket. Conditions have kept switching in my mind without any chance of stabilizing them until those good techniques have been applied. Does it happen to you too this kind of confusion with `CASE`?

ne1uno

[21:40](#msg5f1ca6e7f8dfed4382bc4539)debugging comments and names is hard to automate

[21:43](#msg5f1ca796c83e6242ed54ad7b)you can easily create test cases to show how a function reacts to input

GiuseppeChillemi

[22:43](#msg5f1cb5a8c1c0090e64a239e8)\[!\[image.png](https://files.gitter.im/5aa6f8ced73408ce4f9110f7/h1fu/thumb/image.png)](https://files.gitter.im/5aa6f8ced73408ce4f9110f7/h1fu/image.png)

[22:44](#msg5f1cb5cbbc41f3681724dd8a)This style with mirroring of the case coditions is very helpful with brackets.

[22:45](#msg5f1cb5fce906682005193e7d)Cases have been numbered too in their head comments to help understand where we are.

[23:12](#msg5f1cbc6bbc41f3681724ec35)I would like to see auto start bracket line mirroring in ending bracket line implemented in editors. Everything would be much easier.

## Sunday 26th July, 2020

BaronRK

[00:25](#msg5f1ccd73f8dfed4382bc91cf)Some of what you guys are talking about overlaps with a small project I'm working on.

(and stuff we were talking about literally 35+ years ago)

Variable names that are smarter  
Brackets that understand or reflect their general function.

My basic complaint is that visitors themselves have been about the same for the most part for the past 20 years. We need to move to the next level.

For example, yeah, those comments on ending brackets would be cool, but do we need to see them all the time? Could there be layers on Code? Code we have hover over on brackets? Or a button that brings to life comments or other ways of looking at your same code. Or constraints and scope to help you prevent mistakes?

GiuseppeChillemi

[00:33](#msg5f1ccf48277996680100327e)Reichart, they are nice and innovative but we need someone to implement those ideas. We could keep a list of them to use when such kind of editor+ could take birth.

BaronRK

[03:23](#msg5f1cf726c1c0090e64a2c521)Yup!

GiuseppeChillemi

[08:35](#msg5f1d4047c83e6242ed55f51c)We need another Rebolution!

[09:39](#msg5f1d4f58f8dfed4382bd8c52)A note on the process of writing this SET+ in my free time. I have rewritten it 2 times and parts of the second one in 4 versions. Redbol languages have so many ways of expressing your ideas!

## Wednesday 29th July, 2020

BaronRK

[09:33](#msg5f214253d50f2b289aa17e45)My guess is this group would enjoy this, esp. the Ras Pi lovers.

https://www.kickstarter.com/projects/hyper-mirror/hyper-mirror-5g-mm-wave-tech-0-latency-mirroring-device

BeardPower

[09:34](#msg5f2142bbc83e6242ed60115b)What's this zero latency BS? There is no such thing as zero latency.

[09:37](#msg5f214374c1c0090e64ad4d05)Do they also offer a big version? The standard receiver is so tiny I fear I could lose it...

[09:38](#msg5f2143a13eef7e1ffe3f686f)Sorry guys, I had to leave my receiver at the door as I don't get it through it...

[09:39](#msg5f2143dec83e6242ed601565)Does the receiver come with a 65'' screen?

[09:40](#msg5f21440377eccd0e14812a67):laughing:

[09:41](#msg5f214449fe6ecd28887f33e4)They forgot to mention that the receiver is also perfect for weight-training.

GiuseppeChillemi

[11:54](#msg5f216359b1409c060f8f7c63)I have my first full program ready. It is a TODO sequences manager especially aimed at helping people keeping focus and complete their daily work. It uses text lists so it is nice for TODO.TXT lovers. I am in the alpha phase but the basic features are here and I am starting to use it in my day to day work with benefits: when I am interrupted I no longer loose focus, forgetting what I was doing, and starting to work on something else. Also, its TXT nature lets you enter and edit entries very quickly.  
Well, I need it on ANDROID to five it to my whole company but I don't know of any Redbol language with GUI running on it. I remember someone having done this but I can't find it. Maybe it is a wrong memory. I am here to ask you if and ANDROID Redbol version exists somewhere.

[12:20](#msg5f21699449bae2060128c294)\*Well, I need it on ANDROID to give it...

BaronRK

[12:27](#msg5f216b213eef7e1ffe3fd2e5)= API =

Better tools

## Sunday 2nd August, 2020

GiuseppeChillemi

[15:35](#msg5f26dd304773811023389c39)If I open a blog on Red, could I publicize it here or is it totally forbidden? Do we have a gitter room to publish links onto?

rebolek

[15:56](#msg5f26e232b9bc40357bb1c605)How could it be forbidden? You're free to publish the link.

## Monday 3th August, 2020

greggirwin

[00:52](#msg5f275fc7b6f7406a74040ee8)There's a wiki page with links to other resources. You're free to tell people about what you're doing here of course

dsunanda

[14:36](#msg5f2820ddd3b4ec6a286267c2)Windows hates Red - again. Last week my PC updated itself to the latest Windows 10 bugfix. Today, it refused to run a freshly downloaded Red (31Jul version), just saying \*"This app can't be run"\*.

It seems they've Win10Sed the normal Win10 - and you now have to find an obscure setting to say you permit the running of "loose" files in addition to those from the Windows app store.  
\*While I was doing that, Windows helpfully deleted (not quarantined) the downloaded file.*  
And when I tried to download again, Firefox had got into the act: \*"This file is not commonly downloaded, and may not be safe to open".*

Ah, I remember the early promises that the Internet would make access "frictionless".

BaronRK

[17:13](#msg5f2845b047738110233c0ee9)We need trust networks.

dander

[20:54](#msg5f28796fa0bdc3101d4fba21)I'm not seeing it in my current 2004 Win 10 with security settings all enabled. But I always update using \[Scoop](https://github.com/red/scoop-bucket), so maybe it doesn't flag the exe the same way as a web browser download. That being said I have had Windows Defender quarantine Red a couple times, seemingly at random, and I will report the false-positive here each time: https://www.microsoft.com/en-us/wdsi/filesubmission  
I believe a human will look at each submission, and eventually maybe this would help with fixing their heuristics. Though I get the sneaking suspicion that part of their heuristic is randomness so that they only trigger a handful of users when the result is on the fringes. No idea if that is really true though

dsunanda

[21:00](#msg5f287ad66c99b70c0954a703)I also had 2004 Windows Defender quarantine my hosts file - it claimed the file might contain something malicious :) -- it contains entries to reduce/prevent telemetry by Microsoft and Facebook. Thanks, MS!

dander

[21:05](#msg5f287c2503d73b60ee648ea3)🤦‍♂️

## Tuesday 4th August, 2020

BaronRK

[15:59](#msg5f2985c710aa456255175d74)On the topic of the SCAM that is Certs from MS, here is a copy of a message from my team about the money I need to spend to CERT one of our Windows Products (a bloody screen saver)

\-----------------------------

NOTES from other discussion:

EV version of the code signing certificate vs what we have now:  
Pros:  
Supposed to pass "Windows Protected your PC" prompt  
Cons:  
\- Requires a more thorough validation steps.    
\- Uses a USB token hardware to sign so only one person can sign executables.  
\- More expensive  
1 Year @ $319.00/yr  
$399.00 You Save $80.00 (20%) Actual Total: $319  
2 Years @ $279.00/yr  
$698.00 You Save $140.00 (20%)  Actual Total: $558  
 Hot  
3 Years @ $266.00/yr  
$897.00 You Save $99.00 (11%)  Actual Total: $768  
\- Current one can't be updated anymore so this will require a new purchase

greggirwin

[16:39](#msg5f298f5586ad126839e9a9b7)Yup. Same here for us.

GiuseppeChillemi

[19:36](#msg5f29b8a699e92603432f46be)So we are hostage of authorization corporations and we have to pay to free our software from the blocking!

## Wednesday 5th August, 2020

dander

[03:41](#msg5f2a2a71c6dbab65123fb0e0)https://www.bleepingcomputer.com/news/microsoft/windows-10-hosts-file-blocking-telemetry-is-now-flagged-as-a-risk/amp/

PeterWAWood

[05:47](#msg5f2a4801a2fddd66442446b8)I saw this quoted on Twitter today:  
"A primary cause of complexity is that software vendors uncritically adopt almost any feature that users want."- Niklaus Wirth

It made me think of Red.

dsunanda

[10:36](#msg5f2a8ba3e29ec461af6f39eb)Not just software, Peter. In the words of a fake Henry Ford quote: "If I'd asked what they wanted, they'd've said faster horses."

[10:40](#msg5f2a8cade29ec461af6f39ee)@dander Thanks for that. Luckily, Windows Defender has an option to exclude folders/files from its scanning. That seems to have protected my hosts file from Defender's over-zealousness. So strange I have to protect my own files from the opsys...It's like it has become the very thing it swore to destroy.

GiuseppeChillemi

[12:17](#msg5f2aa343d0282f03367d2031)@PeterWAWood It is the difference from something made from a unique vision to something made implementing requests from different sources. In the former case, you have homogeneous structures, in the latter something that may be unrelated in its different parts.

BaronRK

[14:09](#msg5f2abd9987210f2e29b91424)= Complexity =

[14:13](#msg5f2abea2a8636a6f1691b02a)\[!\[Gitterbug1-2.jpg](https://files.gitter.im/5aa6f8ced73408ce4f9110f7/uKDc/thumb/Gitterbug1-2.jpg)](https://files.gitter.im/5aa6f8ced73408ce4f9110f7/uKDc/Gitterbug1-2.jpg)

## Thursday 6th August, 2020

BaronRK

[21:09](#msg5f2c717c93579d2e3463563d)= Offer to Fix Gitter=

GiuseppeChillemi

[22:35](#msg5f2c85c1e20413052e6ec41c)Search for "Intel Suffers Massive Data Breach" in Reddit. It has just been disclosed: 20gb of data which exposes microcode backdoors, various development tools and sensitive informations.

[22:38](#msg5f2c866a9b76045d5b81dfdc)I won't post the direct link here to the topic as it contains further link to direct downloads. Search for it and you will see by yourself what has happened.

[22:38](#msg5f2c8675e20413052e6ec5a6)Really bad times for Intel.

ne1uno

[23:03](#msg5f2c8c2679da21426f1adffe)https://www.zdnet.com/article/intel-investigating-breach-after-20gb-of-internal-documents-leak-online/ not quite so dire probably, they have other problems cutting corners now that Amd woke up

## Friday 7th August, 2020

GiuseppeChillemi

[03:54](#msg5f2cd08fd28b99685e49e93a)A good news for everyone flying with Emirates, hope everyone will do the same

[03:55](#msg5f2cd0a4d28b99685e49e964)https://www.forbes.com/sites/avidan/2020/08/02/in-a-twist-on-loyalty-programs-emirates-is-promising-travelers-a-free-funeral-if-infected-with-covid-19/#7d8a444843e3

codenoid

[05:55](#msg5f2cecd5b103e45c83ff5e16)Hello red folks, stay alive !

abdllhygt

[12:35](#msg5f2d4aa6b103e45c830062a7)Hello

[12:39](#msg5f2d4b77a4768b68567acffa)how are you?

[13:13](#msg5f2d535c9231d665df60e468)is there new projects?

BaronRK

[17:21](#msg5f2d8d97d4bc1a71bc869ce1)= FORMATTED POSTS =

OK,

I figured this out. this only works in the \*\*main thread\** for some reason.

To the right you need to change mode (so you see a keyboard)

Then you can edit and add returns. And use

```
CTRL + ENTER
```

to finally send.

why this is not also in the \*sub-threads* is odd to me.

pekr

[19:55](#msg5f2db1bf51bb7d3380d81add)Could we please .... turn off this threading stupidity? It is a complete mess ...

[19:57](#msg5f2db20dd28b99685e4c6cb8)I am not sure how others, but using FF here, I have to often press the F5 to reload the page. After reading recent messages, switching to other channel, the previous one is not marked as being already read ...

greggirwin

[20:48](#msg5f2dbe39733c00338ffabdf2)I have trouble tracking them too.

## Saturday 8th August, 2020

BaronRK

[04:44](#msg5f2e2dab88719865d94899dd)to me, this main channel is a thread, and replies are sub/threads (or branches.

Petr, are you saying you don't like the replies (branch) part?

pekr

[06:03](#msg5f2e401965e829425e6c9bf4)@Reichart - yes, exactly. Maybe I am not just used to that ... yet ...

BaronRK

[22:30](#msg5f2f276bb103e45c83053910)Agreed and understood.

We could describe Gitter as FORUM (Red) Topic (chit-chat), and then a primitive heading system.

Personally, I would like to the under ALL CONVERSATION a header that can be collapsed \[RED\_\[V]

Then under that - main topics (red, chit-chat, etc.)

Then under that in temporal order SUB-TOPICs (UI, pokemon, etc)

... and then allow threads to fold back onto themselves. So for example a deep subthread under 'chit-chat' could be a topic also under 'red'

## Sunday 9th August, 2020

9214

[01:53](#msg5f2f571cdca038052a58a3b1)&gt; The most interesting things in life happen when they are folded back onto themselves: nucleic acid secondary structure, gyrification, bent of sedimentary strata.

## Tuesday 11st August, 2020

abdllhygt

[12:04](#msg5f32895c9b76045d5b90ce04)hello

[12:06](#msg5f3289a879da21426f29e935)is there a plan for minimal web server like ruby sinatra?

GiuseppeChillemi

[12:39](#msg5f32919479da21426f29fb71)@abdllhygt Yes, they have plan to port Cheyenne, a web server for Rebol (from the same author of Red).

[12:40](#msg5f3291a3a4768b6856880e26)We should wait for ports

[12:40](#msg5f3291bd9b76045d5b90ea20)(planned for 7.0 but no ETA)

abdllhygt

[13:17](#msg5f329a83fe39ca5d6595cff4)@GiuseppeChillemi thank you, like i have to wait a lot

GiuseppeChillemi

[13:22](#msg5f329b9bb103e45c830dd8ea)There is branch which has ports partially implemented, it is not so far as you may think. Personally I think (and it is totally mine speculation) it will happen on the first half of the next year.

abdllhygt

[13:33](#msg5f329e2ba4768b685688372e)For now, my plan is using Ruby for server and using Red for database, html render and some mini apps of the project. I want to finish this before next year.

## Wednesday 12nd August, 2020

GiuseppeChillemi

[21:50](#msg5f34641ef3d6d26b0d90748f)I think that Redbol languages blocks fit perfectly to the Schrödinger paradox: they are both code and data at the same time and their content takes a shape only when the blocks are interpreted. We can publicize them as Schrodinger Code Blocks among the scientific community!

dander

[23:27](#msg5f347adaf3d6d26b0d90a9db)I don't know about that metaphor. Quantum mechanics has implications of uncertainty, but red is deterministic, unless intentionally introducing randomness. The Schrödinger paradox was also meant to convey how bizarre and unintuitive quantum mechanics is, which isn't the best message

greggirwin

[23:28](#msg5f347b2b1f13b45edb732b2b)I was going to express uncertainty as well. Nobody likes Heisenbugs.

## Thursday 13th August, 2020

GiuseppeChillemi

[08:16](#msg5f34f6cb17acb15fdf1a431d)Dave, I was thinking about externally understanding a script containing multiple levels of composed blocks, without executing it. . Being Redbol language capable of mutating themselves, without interpreting you do not know if you are looking at something used as code or data because you could also loose the original purpose of the word. Our uncertainty is not caused by flaws but from the power to forge the meaning and purpose of words anytime.

[08:25](#msg5f34f8e53b680170180e53bb)@greggirwin I like these new terms. Heisenbugs makes me smile when I read it. Vladimir @9214 uses an ample vocabulary containing many unknown (to me) words and made me Google multiple times to fully understand his discourses (and I liked doing this). I have discovered a new one sarching for Haxe programming language after having read it in Red.js: "cargo programming" and if you read the source of this definition you will die laughing!

[09:42](#msg5f350b1f79659c5fbfeeaf95)To be precise, it's \[Cargo Cult Programming] (https://en.m.wikipedia.org/wiki/Cargo\_cult\_programming)

## Friday 14th August, 2020

dander

[19:31](#msg5f36e696e8eb3939a4918cd9)@GiuseppeChillemi I think I see what you are saying, but I would prefer terms like malleability over uncertainty. I bet you would also like this list if you haven't seen it before: https://en.wikipedia.org/wiki/Anti-pattern (cargo cult is on there)

GiuseppeChillemi

[22:17](#msg5f370d6f5ccdf30c5847a1de)Wow, great article! There is a lot to learn and use.

[22:23](#msg5f370ec4aecae32e8ec33466)Also, my intention is not to publicize uncertainty, it is an observation for my friends here. I have written this because I have some "unloaded" scripts analysis ideas running in my mind and I am realizing that Redbol language are difficult for such tools.

[22:32](#msg5f3710fcba27767ee5ef98c6)I should have transmitted sarcasm but I think I have failed my intent :-D

## Monday 17th August, 2020

BaronRK

[02:32](#msg5f39ec27e8eb3939a49820e2)In the before time (late 80s) I created a language called MIDAS (which of course produced '.GOLD' files. MIDAS will sound like a Backronym, but in fact it was literally named first, and then it was realised it made a work.

Machine Independent Demonstration and Animation System.

It looked mostly like C, but had a very easy math system (inspired by Forth).  
It was not interpreted, it popped out P-code.

Back then, having data inside code was rare, or painful, I did a lot of 'words' that already had meanings and value (even as simple as pi, or screenwidth, which has prefilled with the given system it was running).

But it was also designed to suck in data from each machine to build the code itself (it ran on C64, Apple, IBM, Amiga, Mac) etc. So the C64 profile explained the 320x250, 8x8 tiles, sprites, etc.

I was playing with vector, and discussing how to deal with how to render things on vastly different resolutions. and so the code started to become more abstract, almost like Logo (pushing a relative turtle around), statistically, but the result looked like a recipe.

Fast forward, Carl showed me his first ideas for Lava, and first demo was a recipe, with 'just enough' code logic to 'execute' and pop out the measure in metric from English.

But I was really interesting a deep problem to do with what today is still there in SVG or rendering vector for UI.

For example, consider how a system can abstract resolution, but still work well from something like a watch (320x320) or up to something huge like 8K.

It turns out to be a deeper problem, but this is a good example where a language that abstracts things makes things better.

## Tuesday 18th August, 2020

GiuseppeChillemi

[11:48](#msg5f3bc024e51e85413392dfde)@BaronRK how long are in in the computing world?

BaronRK

[14:17](#msg5f3be2ff5d0f8f24407b9afa)\[!\[core.jpg](https://files.gitter.im/5aa6f8ced73408ce4f9110f7/Czyb/thumb/core.jpg)](https://files.gitter.im/5aa6f8ced73408ce4f9110f7/Czyb/core.jpg)

[14:27](#msg5f3be56c750a27413029cdf7)LOL ... before ALL of you!

I built my first computer from scratch (meaning, I also laid out and built what one might call a CPU prototype from transistors) in 1973. 4 Bits, but I only had 10 commands worked out, and then ran out of the energy to map out the other 6. One command was simply LED, which toggled an ............... LED. Hey, I was working out gates, and flipflops back then. I also wire wrapped my own core memory.

One thing I'm working on getting all my old photos scanned, but this (photo I added which went above because Gitter is plural for Git which means {an unpleasant or contemptible person.} ) happens to look a great deal like what I made back then. Although I was not as clean.

I started selling a device based on a strange custom piece of hardware (which I'm searching for). Written in pure ML (no Assm) that converted Feet/Film to Video/Dropframe. In late 1980, I moved it from ML -&gt; Basic on a TSR-80. I sold these for $500US, and got them from Tandy directly below retail (I recall eventually talking them down to about $160. It listed for close to $250).

Then out of nowhere, sales went through the roof. Not from movie studios, but from of all places, churches. Churches became the home of nerds/geeks messing with music (MIDI), and video desks (to exchange and record sermons I assume). But also people wanted to move their personal film (8mm,16mm) to this new video format, and it turned out Churches were teh first to have this equipment.

toomasv

[16:21](#msg5f3c000b07c30d132a96a825)@BaronRK Wow, I discovered the pleasure of playing with gates only recently :point\_up: \[March 27, 2019 2:28 PM](https://gitter.im/red/sandbox?at=5c9b6c7c0d71905057736bdf)

GiuseppeChillemi

[16:30](#msg5f3c024207c30d132a96acd1)@toomasv Toomas, have you published the work on console and word/areas highlighting? Also, I miss the link to your site with all the works you have done, could you plaase repost it?

toomasv

[16:37](#msg5f3c03b45d0f8f24407c0144)@GiuseppeChillemi It was published in June already :point\_up: \[June 9, 2020 7:48 PM](https://gitter.im/red/sandbox?at=5edfbd747b6da9126a844c81)  
I was stuck there and latest version is my local only, but I think the online one works too.

[16:40](#msg5f3c0472a8c17801765925d2)\*"works you have done"* You mean \[looking back](https://toomasv.red/Two-years.md.html)?

GiuseppeChillemi

[16:46](#msg5f3c05c93dac53434016143f)Thanks, every couple of months it seems my mind deletes some information. I have forgotten you have posted it in the Repo.  
And Yes, I was searching for "looking back"!

theSherwood

[17:39](#msg5f3c124ce51e85413393cf61)@toomasv Your "looking back" site is mind-blowing. Amazing stuff

toomasv

[18:15](#msg5f3c1ad2e51e85413393e95d)@theSherwood Red Joy :smile:

theSherwood

[18:33](#msg5f3c1f073dac534340166475)What I really enjoy about it is how diverse the projects are: animations, layout builders, inference engines, AST explorers, games, logic-gate simulators, database DSLs. It's a Red menagerie!

greggirwin

[18:37](#msg5f3c1feb3dac534340166602)It's all about the domain. :^)

toomasv

[18:39](#msg5f3c2054750a2741302a7df2)Just experimenting to learn different aspects of Red.

## Friday 21st August, 2020

planetsizecpu

[15:50](#msg5f3fed54d4f0f55ebbd03db2)And very well done @toomasv 👍

## Tuesday 25th August, 2020

GiuseppeChillemi

[17:12](#msg5f454675c3aa024ef99ddd8f)@pekr  
&gt;&gt; Nor BSD? Isn't recent Red licence just good enough? I am not sure I want LGPL

Which damages do you think a licence that requires to release just the enhancements to a specific component can give?

vazub\_gitlab

[17:26](#msg5f4549da4823780937414466)The damage of locking down your code in politics. Copyleft, even "weak" one, is cancer - once you go that way, there is no turning back. If at some point in future you decide to go with more permissive license - the whole effort of relicensing, getting consent from all the contributors over the years is just plain stupid. Therefore, lets frame the question in a different way: what is the problem with someone taking the code and not releasing their enchancement? Does the original code lose something? I don't think so. As long as the community is there and works on the project - nothing will be lost.

GiuseppeChillemi

[17:47](#msg5f454e9859ac794e02c66bef)While full copy-left licences represent an ideology that forces you to release (or don't use) your whole product, even if using a component, a licence which requires to give back to the community just some improvements, in something you are getting for free, is not comparable. They are 2 different planets.

&gt; what is the problem with someone taking the code and not releasing their enchancement?

Simply, I don't like greediness.

vazub\_gitlab

[17:52](#msg5f454fe4ddc2d041c0c80e78)Well, one can say that giving someone a present under condition of getting something in return is greediness as well.

dander

[18:22](#msg5f4556e0dfaaed4ef50c1d5d)Sometimes a third party would need a change for their own product which is not appropriate to be contributed back because it is not general enough or useful for everyone. In that case, it forces them to publish the sources somewhere and ensure they are up to date as a legal requirement. Situations like that make people give pause before even considering using a copy-left component in the first place. It may make you feel nice that no one is hording your work to themselves, but it also discourages people from participating who would be willing to give back otherwise, but don't want to take on legal obligations

rebolek

[18:40](#msg5f455b2eddc2d041c0c82bb2)@vazub\_gitlab there are dual-licensing schemes also - one for non-comercial use and one for comercial use. It's complicated stuff. While I prefer MIT/BSD, I can understand why some people chose (L)GPL. And let's be honest - look at the state of \*BSD systems vs GPL licensed Linux.

GiuseppeChillemi

[18:45](#msg5f455c66d4f0f55ebbde0106)@rebolek I do not know which is the state. Could you please give me an overview?

vazub\_gitlab

[19:10](#msg5f4562099566774dfe30e648)@rebolek The debate is largely pholosophical, and as old as GNU organization itself - what is freedom and if it should be enforced. There have been numerous holy wars on this topic already, not sure if we should start another one, because old arguments from both sides still hold. I am in BSD camp, I treat freedom as a precious value that should not be handled with force. If you want to benefit the community at large and share your work - you do that with no strings attached, even if that means some people will use your code for commercial purposes. The truth is, nowadays it pays off for any commercial entity to give back to the community, because that is where the upstream development happens anyway.

As for \*BSD vs Linux argument - it is incorrect in many respects, and I would argue that the success of Linux had nothing to do with licensing per se. Any success is a combination of many factors, like good timing, good PR, specific charismatic leaders etc. And don't forget, that there are lots of successful permissive-licensed products as well - take Docker for example. So no, GPL was not the major reason for Linux's success.

GiuseppeChillemi

[19:13](#msg5f4562ec49148b41c970e76f)@vazub\_gitlab Our legal system has something we call "conditioned gifts". I gift you of this house but I ask you to keep the garden curated and full of flowers; I give you the buildings and 1M dollar but 2 apartments should never be sold, because they must remain to the orphanage. They are fair deals until someone ask for something too costly in exchange like "here are 2 new brushes for your work, you have to paint my whole house as condition to receive the gift". I think that asking just to help the product you are using for free with some lines of code is not something we can call greedy.

vazub\_gitlab

[19:53](#msg5f456c279566774dfe30ff8d)What if a person who receives that house is disabled and can not afford curating the garden? What if there are no more orphans in the orphanage and the 2 apartments just rot? We can imagine any number of edge cases, if you will, and in the end it all comes back down to the question - why are you giving the gift away in the first place, what are you trying to achieve? In case of copyfree vs copyleft the resolution is quite simple: in the former case - you want anyone and everyone to benefit from your donation, in the latter - you are looking for some return payments on your investment. I say the latter is the very definition of greediness at its core. But sure, you are welcome to deal your software in any way you like.

rebolek

[20:00](#msg5f456dc6dfaaed4ef50c589b)@vazub\_gitlab Please, look at what I wrote, where am I incorrect? Anyway, a few comments:

&gt; "If you want to benefit the community at large and share your work - you do that with no strings attached, even if that means some people will use your code for commercial purposes."

GPL doesn't forbid commercial use. LGPL code can be used alongside proprietary code also. Just modifications to your code need to be shared.

&gt; "I treat freedom as a precious value that should not be handled with force."

This is very utopistic view of freedom. It would be really nice if the world worked this way.

Anyway, as I wrote, I prefer MIT/BSD-like licenses (or even public domain, if you look at my code, I don't attach any license to it usually and when I do, I just pick some permissive one randomly), but I understand why people choose (L)GPL and don't see the greed in it. Using other people's code without at least giving proper credit seems more greedy to me. But as I wrote, I'm not an expert in licensing, it's just my opinion.

vazub\_gitlab

[20:08](#msg5f456fd8d4f0f55ebbde34a3)&gt; Using other people's code without at least giving proper credit seems more greedy to me.

There seems to be some general misunderstanding here, because all well-known permissive licenses explicitly require keeping the original copyright notices. So the credit part is already covered for.

GiuseppeChillemi

[20:12](#msg5f4570c689cf2d584b76b237)Everyone receives something back, even the coder whose name is spread in copyfree licenses. And the concept of greediness is tied to the amount and value of things/services you get without giving back rather than the general concept of "receiving something as exchange".

vazub\_gitlab

[20:13](#msg5f4570cd89cf2d584b76b23c)By the way, here is some great resource, regarding licensing - https://tldrlegal.com/

GiuseppeChillemi

[20:31](#msg5f457531d4f0f55ebbde45da)Also, the mentioned cases does not fit the actual scenario. A company that has produced some code is not a "disabled one" which can't release some lines of code. They have already created them, they just don't want to release them ;-) (a disabled that fits you example, can't produce any code at all).  
However, like Boleslav I am of the idea that we are not in a utopic world. Someone has generosity, some others has not. And asking someone to give a contribution to the community is something which preservers our community. Here in Italy we have "citizen income" since the last year. It is a basic income for citizen who have lost their work. Guess what? With "freedom" no one has searched any alternate income. Now government is starting to ask them to do activities in the city as exchange, and also search for work, or they will loose government help. Something is now going to the right direction. So freedom is a nice concept but sometime you need guiding rails and rules to obtain it. The same is needed to have a wealthy and prosperous coding community.

pekr

[21:11](#msg5f457e7d49148b41c97132e3)I will not support GPL nor LGPL code, sorry ....

GiuseppeChillemi

[21:16](#msg5f457fb8c3aa024ef99e7bf4)@pekr please, answer to the above question to help me understand the reasons behind your position.

BaronRK

[21:16](#msg5f457fc0c3aa024ef99e7c05)I tend to sum it all up as:

\- Free (Stallman) - It MUST remain Free  
\- Open - do as you wish, including closing it again.

One you get past that, it can be summed up as:

\- Credit - Just give us credit.  
\- Strings - You will need to read a crapload of stuff.

That is about as simple as it gets, and thus, MIT wins.

pekr

[21:20](#msg5f4580b9482378093741dd6c)Because our country lived 40 years under communism and stuff was forced on ppl. When I donate, then I donate, use at your will. Once I decide to donate my money, I am at peace with it being eventually lost ...

[21:22](#msg5f45810addc2d041c0c88f6c)The more pragmatic point of view is - do you expect our small community effort being a rocket science? Thousands of ppl to capitalise on it? Why not just keep things simple?

GiuseppeChillemi

[21:27](#msg5f45823b49148b41c9713bcd)Pekr, I can hardly imagine what is to be under a totalitarian regime where nothing is your

[21:27](#msg5f458240765d633c54b1fc52)But

[21:30](#msg5f4582eb89cf2d584b76e485)Here is different: everything is free, everyone is free and just we make sure it does not end up like certain Apache 2.0 licensed products which the community had not improvements at all.

[21:33](#msg5f45838d89cf2d584b76e58f)You keep 98% of your product and give back 2%.

dander

[21:34](#msg5f4583cb765d633c54b200f2)Did someone use Apache as a base for a closed source product which out competed it or has its community just moved on to something else?

GiuseppeChillemi

[22:06](#msg5f458b5fdfaaed4ef50ca6cd)@dander I don't know but is is important to analize the context of each software. A small community and few developers can loose their product but some others with strong and ample roots would not have such kind of danger. Your question is worth a research as it gives an interesting perspective on the risks of being "too open".

dander

[23:28](#msg5f459e80c3aa024ef99ecf48)This is one of my favorite podcast episodes, which was about selecting a more open or closed license/business model (not exactly (L)/GPL), but I feel like it sort of touched on this kind of issue of having corporations who are building businesses on top of open source products without contributing back - https://changelog.com/podcast/353

## Wednesday 26th August, 2020

GiuseppeChillemi

[09:05](#msg5f4625ce49148b41c972e575)@dander Thanks, I am reading the transcript. It is really long and it is taking time.

BaronRK

[16:13](#msg5f468a3d48237809374496a4)This whole conversation in the podcast could be mapped to the two simple things I wrote above:

{ADAM JACOB

What they meant is that we’re no longer producing a free distribution of the source code. What most people think of when they think of open source is two components - they think of the software itself, the actual code, but they also think about a distribution that I can just go grab and do what I want with, without any friction. And we’ve explicitly stopped creating an open source distribution of the same. In the same way that Redhat – you can’t just grab Redhat and do what you want. If you wanna run Redhat Enterprise Linux, you’re gonna pay Redhat. You can have a free trial, but that distribution comes from them and you pay them for it. You could run Fedora, you could run CentOS, you’ve got a lot of options; but what you don’t get to do is run Redhat Enterprise Linux. If you wanna do that, you’re gonna have to pay Redhat some money. Same story.}

[16:14](#msg5f468a594823780937449750)Most conversations could be reduced to a simple flowchart that would remove all confusion.

[16:14](#msg5f468a7fdfaaed4ef50f4c3a)= NEW QUESTION =

Anyone know of a simple tool that looks at all your source code and generates a simple report that states everything is in good standing on the copyrights?

GiuseppeChillemi

[17:06](#msg5f46967c89cf2d584b79b821)Until I can rebuild something from the sources I consider it open. If it has dependencies on proprietary parts and can't be run without them, it is no more one source. I do not know the situation of RHEL but "Chef" can be built and used independently so it is open source.

dsunanda

[22:38](#msg5f46e4625580fa092b26ba22)@BaronRK &gt; Anyone know of a simple tool  
Most of the stuff around - like Fossa or Snyk - is designed for large corporates who want to check and/or sanitize the licenses of the code their developers have packratted from dubious internet sources. Not a lot (as far as I know) on a smaller scale.

## Sunday 30th August, 2020

GiuseppeChillemi

[16:38](#msg5f4bd5f8765d633c54c25920)A friend has sent this to me on Github and Microsoft maneuvers : https://drewdevault.com/2020/08/27/Microsoft-plays-their-hand.html

## Tuesday 1st September, 2020

Respectech

[19:28](#msg5f4ea0e8dfaaed4ef524de8b)I can't connect to the Rebol4 AltME world. Is anyone else having the same problem?

dsunanda

[19:37](#msg5f4ea31689cf2d584b8f7282)@Respectech Not working for me either.  
The link at http://www.altme.com to check if a world is up is also missing (it's usually on the support page).  
The actual page is http://www.altme.com/check.html - and that does not seem to work.  
Looks like Altme itself is having a bad day.

Respectech

[19:50](#msg5f4ea613ec534f584fd81ff2)Thanks for the confirmation, @dsunanda

PeterWAWood

[23:13](#msg5f4ed5b59566774dfe4a60c7)@Respectech Unless @greggirwin moved it to a new server, the one the Rebol4 AltME world used to run on has been off-line for almost a year. The hardware it runs on has been decommissioned.

## Wednesday 2nd September, 2020

Respectech

[00:25](#msg5f4ee684765d633c54cb28d3)@PeterWAWood Rebol4 was working yesterday...

PeterWAWood

[02:13](#msg5f4effc89bad075eacf1853c)@Respectech Gregg must have moved it to a new server.

loziniak

[11:42](#msg5f4f850d89cf2d584b91beb6)@rebolek  
&gt; I don't attach any license to it usually

this may interest you:  
https://choosealicense.com/no-permission/

rebolek

[12:03](#msg5f4f8a1f9bad075eacf2ee8c)@loziniak Intersting, thanks. So I probably should go thru my projects and attach some (MIT probably) license, so people can use it without fear.

loziniak

[12:04](#msg5f4f8a4bddc2d041c0e33f94)It seems so.

rebolek

[12:06](#msg5f4f8abf9bad075eacf2f19d)Or maybe BSL, if it's good for Red, it should be good for my tools also :-D

loziniak

[12:07](#msg5f4f8b0336e6f709fd1be8a2)There is also public domain, but looks like you have to explicitly state that.

## Monday 7th September, 2020

GiuseppeChillemi

[20:03](#msg5f56920e36e6f709fd2de04f)Which are the best articles/resources for Rebol2 TCP Ports?

## Thursday 10th September, 2020

greggirwin

[18:33](#msg5f5a718f3651184d30e1308f)Rebol4 world is back up. Red is hosting it now, and it was just a glitch.

endo64

[19:44](#msg5f5a8226df4af236f9fbeafc)&gt; Which are the best articles/resources for Rebol2 TCP Ports?

@GiuseppeChillemi This ones are good:  
http://rebol.info/forces/articles/protocols/  
http://www.codeconscious.com/rebol/rebol-net.html

GiuseppeChillemi

[22:30](#msg5f5aa8ffdf4af236f9fc4fce)@greggirwin Yes, I have read about Carl and Cindy relocating.

[22:32](#msg5f5aa995f51808513b35df99)@endo64 I was missing the first one, thank you.

BaronRK

[22:39](#msg5f5aab11b190f2328e65beda)= Flow Chart Protocols =&gt;&gt;

## Saturday 12nd September, 2020

GiuseppeChillemi

[11:08](#msg5f5cac275fde567ffa4138ec)Has someone trace of this page: http://www.rebol.net/wiki/Ports\_and\_Schemes:\_Issues ? I can't find it on ARCHIVE.ORG . It is cited here: https://stackoverflow.com/questions/14555961/how-to-handle-timeout-periods-in-rebol-3-schemes

ne1uno

[11:42](#msg5f5cb41389b38d09212251e7)https://github.com/revault/rebol-wiki/wiki maybe unlinked?

GiuseppeChillemi

[12:28](#msg5f5cbef33651184d30e6fdfd)Opening it from mobile I have found the page search engine at the bottom. While from desktop I have seen only the misto general one. I have found that page.

[12:28](#msg5f5cbef7a857200e6d569de9)Thanks

[12:28](#msg5f5cbf0ace5bbc7ffdbdcf1f)\*most

## Monday 14th September, 2020

Oldes

[07:24](#msg5f5f1abdf51808513b40e5e1)JIT compiler for the Erlang VM: https://github.com/erlang/otp/pull/2745

GiuseppeChillemi

[12:41](#msg5f5f64eda857200e6d5d1c49)Guess, what is this graph?

[12:41](#msg5f5f64f3603d0b37f42f6bb2)\[!\[image.png](https://files.gitter.im/5aa6f8ced73408ce4f9110f7/zhME/thumb/image.png)](https://files.gitter.im/5aa6f8ced73408ce4f9110f7/zhME/image.png)

## Tuesday 15th September, 2020

GiuseppeChillemi

[20:16](#msg5f612132603d0b37f4345d6f)Great! You are right

## Wednesday 16th September, 2020

GiuseppeChillemi

[22:05](#msg5f628c3a89b38d0921317c7d)It's so silent here these days, I can barely hear me typing... What is the Red team doing? I am curious! 🤭

dander

[23:55](#msg5f62a5f0b468994d0d33bbbd)@GiuseppeChillemi, have you looked at https://progress.red-lang.org/ recently? It doesn't have the whole team on there, so maybe there are some secret things going on, but qtxie seems to be expanding on ports support lately... The VS Code extension has been overhauled quite a bit by bitbegin.

## Thursday 17th September, 2020

theSherwood

[02:24](#msg5f62c8d6b468994d0d3404bd)@dander I was unaware of that site. That's great!

greggirwin

[17:02](#msg5f63969889b38d0921342f19)It's been holiday time for some, life events for others, and other work that we don't talk about much here. e.g. contract development to help pay the bills.

## Friday 18th September, 2020

GiuseppeChillemi

[23:58](#msg5f6549b5f51808513b51755f)Oh My God! Ports are moving on Qtixie repository!

## Sunday 20th September, 2020

GiuseppeChillemi

[22:07](#msg5f67d284f969413294fa703b)I am going creazy in nested `case/if/either/all/any` blocks even with description at the end of each one, it is hell on earth! The chain of conditions is very hard to maintain either written or in your mind. It would be really great to have and editor which is able to stack conditions and show the current active ones; also, it would be nice to have the colored blocks we have experimented with @toomasv in a VSCode like editor!

[22:09](#msg5f67d321f969413294fa7135)And I was able to track opening and closing bracket missing because I am developing this code on Rebol. I would have committed suicide with the "generic" Red errors positions.

## Monday 21st September, 2020

rebolek

[06:05](#msg5f6842b3c1d1a53705b6a8e9)If you have too many nested levels in your code, it's probably time to think about refactoring it.

GiuseppeChillemi

[06:21](#msg5f68466a603d0b37f445f92e)Boleslav, the code handles many combinations of input data and refinements. I have tried lowering the nested levels repeating top level conditions at each case but I don't like the idea of having a big first level case with a lot repeated checks.

rebolek

[06:24](#msg5f684729f969413294fb6a23)it's hard to do any suggestion without seeing the code, but when I see many combinations of data and refinements, it sreacms "I want to be a dialect!" to me ;-)

GiuseppeChillemi

[06:51](#msg5f684d8b3651184d30041d7f)I will publish it SOON(TM)

rebolek

[06:52](#msg5f684d994f19dd0933617031):)

cloutiy

[11:58](#msg5f68955bdf4af236f91f813b)Regarding color-coded blocks...not sure if this helps but I use this in VSCode https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2

## Tuesday 29th September, 2020

GiuseppeChillemi

[18:01](#msg5f7376621c5b0d210adc31db)LLVM backed for 680xx

[18:01](#msg5f73766bb8a99f4519b5bd7f)https://www.phoronix.com/scan.php?page=news\_item&amp;px=LLVM-Motorola-6800-Series-2020

## Wednesday 30th September, 2020

dander

[21:42](#msg5f74fbdafcce3e6c18e41ff3)This looks like it could be a pretty positive development for Gitter... thoughts?  
https://element.io/blog/gitter-is-joining-element/

## Friday 2nd October, 2020

greggirwin

[18:11](#msg5f776d55fcce3e6c18eabacf)I'll try to read it later @dander. Thanks for posting. In the meantime, a quick skim shows one of the main guys saying he doesn't get chatops either viscerally or intuitively. I find that interesting, because that looks straight at dialects and DSLs. The fact that every system is different is obvious. The key may be that people don't think they can work together to build languages that benefit everyone. With APIs you \*want* lock-in, and you build for yourself rather than the general domain case.

## Thursday 8th October, 2020

GiuseppeChillemi

[21:19](#msg5f7f824660efef1ec36c3779)Image if one day someone could buy Rebol and enforce copyright asking Red to stop development or taking money from Red developers. It could happen if Oracle wins in Supreme Court case Oracle VS. Google https://arstechnica-com.cdn.ampproject.org/c/s/arstechnica.com/tech-policy/2020/10/google-asks-supreme-court-to-overrule-disastrous-ruling-on-api-copyrights/?amp=1

[21:19](#msg5f7f82661cbba72b63ca897b)It will start tomorrow

BaronRK

[21:41](#msg5f7f878724a20801a8d5191d)https://twitter.com/ReichartsRant/status/1314297683755126787?s=20

GiuseppeChillemi

[22:02](#msg5f7f8c8643fa5d19e6fac2ad)@BaronRK Reichart why you don't publish some of your extension/fixes to REBOL? This would give life to us until everything will be on Red!

BaronRK

[23:10](#msg5f7f9c80a1c81d0a7ece260d)I won't argue with that, let me see what we have, more than happy to share.

## Friday 9th October, 2020

GiuseppeChillemi

[14:43](#msg5f8076f51cbba72b63ccf3fd)@BaronRK  
&gt; I won't argue with that, let me see what we have, more than happy to share.

Thanks.  
When I look at Rebol IOS and I see those wonderful widgets, the tasks management, I feel a sense of rage, because I desperately need those components and there is actually NO WAY to get them either with or without money.

henrikmk

[15:30](#msg5f80820643fa5d19e6fd49e3)@GiuseppeChillemi "Boleslav, the code handles many combinations of input data and refinements. I have tried lowering the nested levels repeating top level conditions at each case but I don't like the idea of having a big first level case with a lot repeated checks."

It's probably time to think in truth tables. Large blocks of multiple nested conditions are too hard to debug.

GiuseppeChillemi

[16:45](#msg5f8093a102e81701b00f97fc)&gt;&gt; It's probably time to think in truth tables

What are they?

BaronRK

[17:01](#msg5f80974faacbfa2248c93d22)Quick overview of how we have been dealing with updates over the past 15 years  
(we are getting to the end though, so we either move to REBOL 3, or 100% jump over to JS)

\- REBOL 2 Can only run on Linux OS that support 32bit applications so stayed away from 64bit.

\- REBOL 2 Does not support 64bit inodes of course. We had to use a wrapper to handle 64bit inodes from this site:

http://www.mjr19.org.uk/sw/inodes64.html

Basically replaces some library calls using this wrapper. This written in C# or something.

\- Rebol 2 does not support new TLS versions. Changed to 'curl' through the rebol 'call' command to read HTTPS URL links. I don't know what 'curl' is written in.

\---

curl-it: func ["Use curl to read websites"  
        url "url to read"  
        /param params "parameters that follows curl "  
        /binary  
        /verbose  
        /local toout cmd result v  
        ][  
        if not param \[params: ""]  
        v: "" if verbose \[v: " -v"]  
        toout: to-local-file rejoin \[gnomehome "sessiondata/curl" enbase/base checksum/secure rejoin \[url form now/precise] 16]  
        cmd: rejoin \["curl -s -k -o " toout v params " '" to-url url "'"]  
        log-probe \[cmd]  
        xcall cmd  
        either binary [  
            local: read/binary to-rebol-file toout  
            ][  
            local: read to-rebol-file toout  
            ]  
        ]

\---

After that, all our fixes were all things using modules already written in REBOL, such as stuff to fix file transfer packet size issues.

GiuseppeChillemi

[17:05](#msg5f80984d6e1aa94de7ebec84)@henrikmk I have ended up in the world of confusion so many times but I have actually the ideas to put me out of those worlds.  
I have tried many solutions but the best one is the following:

```
;<<<<<<<<< CASE: DEST(BLOCK!|OBJECT!) <- SOURCE(WORD!) /where WORD!  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;CASE [
;	ANY [
;	(block? destination-elements) and (not empty? destination-elements) 
;	(object? destination-elements) and (not empty? words-of destination-elements) 			
;	 ] [
;			.........
; 			forall block-destinations [
;			         .........
;	 				CASE true [
;			.                  ........	

							;----- Sets a single word in the destination block

							; Set the words in elements list as source words
							all [

								
								word? source-elements
								where = true  
								word? elements-list
```

I explicitly describe the case I am handling. Also, I repeat all the previous conditions and loop lines before the current one while compressing them, leaving out the code in the middle. This technique calms the minds and avoids the constant attempt to remind where we are, which stresses your neurons which often exchange one condition for another while trying to remind.

[17:11](#msg5f8099d907361f0cc63f68ac)(This is part of my `MULTISET` mezzanine with `WHERE` refinement)

[17:14](#msg5f809a8507361f0cc63f69c6)@BaronRK I see.

```
log-probe [cmd]
xcall cmd
```

You have also a different CALL. Well, you have been able to bypass the bugs with simple fixes. When Red will be complete and will be able to replace Rebol I suppose you will port your solutions here.

rebolek

[17:42](#msg5f80a0fb3775d02b5afd754a)&gt; I don't know what 'curl' is written in.

[17:42](#msg5f80a10207361f0cc63f7e77)I believe it's written in C.

Oldes

[19:12](#msg5f80b61c6e1aa94de7ec405e)Of course it is :-) https://github.com/curl/curl/tree/master/src

rebolek

[22:06](#msg5f80defa24a20801a8d89249)It was an easy guess ;)

## Saturday 10th October, 2020

henrikmk

[14:36](#msg5f81c6f43775d02b5a003684)@GiuseppeChillemi Truth tables are simply your condition logic unwound to tables, listing all possible inputs and outputs. The advantage is that you can describe rather complex logic this way just by making a table. The disadvantage is that truth tables can become very large with many inputs.

https://web.stanford.edu/class/cs103/tools/truth-table-tool/

dsunanda

[20:15](#msg5f82165a6e1aa94de7efa6eb)There used to be an entire programming language - FILETAB - that managed its logic flow via truth tables. It's long-gone now. But you can see just enough from the example here...  
https://rapidgen.com/filetab/  
...how you could make a Red dialect to do the same:  
The lines that end with Ys and Ns and \_s are the conditional statements.  
The lines that end with Xs and \_s are the actions to execute. They execute only if they have an X; and the Ys and Ns in the same column match. (the underscores mean the condition to that action is irrelevant).  
It can (not always but can) be a compact way of clearly expressing rules and actions in a way that embedded IFs and CASEs can't.

henrikmk

[21:48](#msg5f822c2e78d7f20c9fa03d83)Having generated quite large tables that take several minutes to build in REBOL, you'd probably need to use Red/System.

## Monday 12nd October, 2020

BaronRK

[07:14](#msg5f8402633775d02b5a05659e)You guys might enjoy this:

https://www.youtube.com/watch?v=ExwqNreocpg&amp;ab\_channel=MattKC

He hits on a lot of different fun topics.  
Why QR codes have not caught on everywhere I don't understand, but I think COVID19 will change this. Food places alone FINALLY putting their menus online and accessed via QR Codes will become the norm.

I use QR codes to slap troubleshooting and documentation onto devices around my houses. I plan to do way more of this type of thing going forward.

Respectech

[14:27](#msg5f8467d86e1aa94de7f52565)@BaronRK I like the idea of putting QR codes on things around the house. It makes a lot of sense. Thanks for the idea.

9214

[14:35](#msg5f8469bb24a20801a8e11040)\[Human-readable Quick Response code](http://hrqr.org/).

[14:36](#msg5f8469e9a1c81d0a7ed9bfe2)Also \[Dotsies](https://dotsies.org/).

BaronRK

[18:46](#msg5f84a49a07361f0cc649315e)Both of those are interesting, but sort of insane really LOL

(I should point out, I read more languages than I speak, and studied Phoenician, as well as Cuniform, Chinese, even Shorthand and other encoding systems. So I appreciate it all, but, yeah, I don't see the real value.)

I'm curious how well a QR reader would work on simply holes drilled in wood or metal. That is a great use case.

GiuseppeChillemi

[19:37](#msg5f84b06e78d7f20c9fa651a6)Do we have how to create and read qr code with red o rebol?

rebolek

[19:49](#msg5f84b34f60efef1ec379142f)I believe there was QR genrator for Rebol but I can't find it right now. it should not be hard to do, the specs are easy. For reading, maybe RedCV has some ace in its sleeve? Better ask @ldci

greggirwin

[21:06](#msg5f84c55778d7f20c9fa684d6)https://queue.acm.org/detail.cfm?id=3419941  
http://www.vpri.org/pdf/tr2015004\_cuneiform.pdf

Pictures being worth a kibiword (not a kiloword, since we're not talking to normal people here), it's funny that the dotsy system mentions limited phone real estate. Solve that instead perhaps. It's clever, though, and their eye chart tutorial is nice. I had to stop after a few lines when I developed a twitch.

Just as keyboards and more are limited in size reductions by human size, so too are things we need to see (even to see that they are there) with our eyes.

A cool hint from the youtube video is to Crinkler (https://github.com/runestubbe/Crinkler), though UPX is probably still better for Red apps. Have to test it to see though.

[21:07](#msg5f84c5971cbba72b63d7916c)If someone wants to play with that, encap mode, release vs runtime compiles, etc. that would be cool.

## Wednesday 14th October, 2020

dsunanda

[10:36](#msg5f86d49a1cbba72b63dce864)Interesting video of a programmer discovering Red:  
https://www.youtube.com/watch?v=HDMa4gcgEgI  
You'll wince as he misses some basics - but that's a challenge to improve the docs :)

endo64

[11:55](#msg5f86e71999e1ab4dd1fbc985)Nice :)

GiuseppeChillemi

[17:07](#msg5f873038cdb04d1ea081d083)@dsunanda Nice Catch!

[17:07](#msg5f87306307361f0cc64fc023)@endo64 If I install cheyenne, will it be able accept SSL connection?

greggirwin

[17:31](#msg5f8735df24a20801a8e88274)Thanks @dsunanda ! That's great. Very enlightening. We should really make step one in docs: Use the REPL and `help`. Aliasing common terms to Red terms will also help people find things. e.g. we rarely speak of HTTP "requests", at least until you need more control. And `get` in Red has no relation to HTTP GET as a verb. Even comment syntax should be in an initial primer. It's also true that people may look for docs because other langs don't have reflective help built in. He found RBE, and `read` in the docs, but didn't follow those to see how to read a url. Also interesting the conclusions he draws as he goes. I really appreciate him putting it out there, because watching someone bang around is fun itself, especially when he's surprised by something working. :^)

[17:32](#msg5f873639a605930a78ac4c95)Will finish watching later.

endo64

[22:40](#msg5f877e53dc95072254d8907c)@GiuseppeChillemi No, Cheyenne doesn't support HTTPS, you may need to setup `stunnel` (or similar, Nginx) as a reverse proxy in front of Cheyenne. Fortunately setting up a reverse proxy is easy.

## Thursday 15th October, 2020

planetsizecpu

[17:05](#msg5f888147bbffc02b581b229a)Cool @dsunanda just we need a lot of them :^)

XANOZOID

[17:38](#msg5f88892f955f6d78a92f1e1b)@dsunanda I saw that video too while trying to learn Red . . . I think that's both a good sign and a bad sign :). I also noticed later he's missing some things. I've also read this: https://andrewshitov.com/2019/12/19/red-at-a-glance/. It's nice and is a good "summary" - but it's not a great resource for exposing someone to the other layers of the "lake" Redbol is . . .

[17:42](#msg5f8889fdc7ef520fffa261d8)So it's a bad sign because lots of people like to learn a language by gathering lots of resources. And there are specific areas that people look these things up. Youtube is 100% a real place people start searching to learn something new - and as far as I can see, there's not much in-depth and good introductory material on Red (on Youtube\\\*). In fact when I was learning Red starting out I was just trying to "absorb" as much material as I could passively but finding stuff like that was hard to come by (through Audio or Video form that is\\\*). Finding material online was mostly a matter of jumping through links and links from various areas that I'd have to find over and over again (usually found through a combination of Red &amp; Rebol search) . . Google wasn't so streamlined. My biggest resource starting up was actually Rosetta Code* - I looked through it a lot. It's a great place to find lots of "snippets" of code . . . I think I'll start contributing some more beginner stuff there when I get the chance.

[17:45](#msg5f888aa257fe0a4f3011b353)The good sign is that . . . it's still a blank canvas. So figuring out and filling up the routes people take to search-up/learn and find Red learning material is perfect to start populating. I think Youtube is a great place to find an audience for people trying to learn some things - so I will be hopefully putting something helpful out once in a while. And the Red wiki is a great place of material, will definitely be continuing to contribute there - but also cross-posting the material to other areas with high traffic like dev.to 😀

GiuseppeChillemi

[17:53](#msg5f888c7feb82301c1a2a4fe7)@greggirwin have you seen the difficulties to get something useful from "Red language http request" for this first time user? Try "Rebol http request". I will (try to) stop here.

endo64

[17:55](#msg5f888d29c7ef520fffa26b9b)I always like Rebol Cookbook page, http://www.rebol.net/cookbook/ it is not ofcourse a complete documentation but many people will try those examples first.

greggirwin

[17:57](#msg5f888da47be0d67d27760bd6)Going fast is part of the issue, which people surely do. He had info right in front of him, but just didn't see it at times, or didn't try to understand something enough to remember it. I imagine many of us do the same thing as we bang around with something new. I know I do. :^)

Interesting, too, that he always went to the functions section in docs for a type, ignoring actions.

XANOZOID

[17:58](#msg5f888dc661007f7d1b72f6f9)Ah yeah! That's one of the resources I used :). I eventually found a good amount of resources over a span of a week or two . . . I got some favorites for sure. The Wiki and source are slowly starting to be more relevant to me as I go on. The biggest "lift" for me was probably a combination of the Rebol website and helpin.red 🙂

greggirwin

[17:58](#msg5f888dda955f6d78a92f2c3f)@endo64 examples are soooo helpful. Just looking at a few scripts that leverage a reasonable amount of basic functionality goes a long way.

endo64

[18:09](#msg5f88903ea0a3072b4383bc54)Those kind of goal-oriented examples are good educational resources because they show you some ideas/idioms, something working and some pieces to follow. For example this one http://www.rebol.net/cookbook/recipes/0012.html covers a lot concepts. Important point is, we should give deeper ideas (like series) just after these examples, otherwise some people would think "Ok, it has just a cute, different syntax"

XANOZOID

[18:28](#msg5f8894be7be0d67d27761f8b)@endo64 Yes I'm of a similar mindset. I was actually thinking about making an interactive "tutorial" that could be loaded into the Repl like `do url/tutorial.red` and then it would be an interactive series of tutorials that build you up to an intermediate level of understanding. Supplemented with contributing to more resources online, of course

## Friday 16th October, 2020

9214

[19:25](#msg5f89f38f61007f7d1b769586)&gt; https://www.youtube.com/watch?v=HDMa4gcgEgI

With https://github.com/red/red/issues/4678 and https://github.com/red/red/issues/4682 closed, and with https://github.com/red/red/issues/4684 impending, \[this](https://gist.github.com/9214/4b8d66800bfdebd6a4f2f00258f6cfc0) makes the world's smallest web scraper, which I already shared with the author.

greggirwin

[19:27](#msg5f89f426a7e77a0ff14fdcab):+1:

GiuseppeChillemi

[20:46](#msg5f8a06b761007f7d1b76c9f4)@9214 Nice, It's just the start. Red has the power to exceed Phyton scraping capabilities.

Respectech

[21:35](#msg5f8a1210270d004bcfcff2b3)@GiuseppeChillemi Doesn't Red already exceed Python in scraping by size of code?

greggirwin

[21:46](#msg5f8a14cf270d004bcfcff9b3)I imagine the wide world looks at libraries and ecosystems for common scraping tasks. Of course, we tend think more in terms of "build just what you need, with minimal dependencies", but people want existing solutions. Even tacking on a simple dispatcher to the minimal example might tip the balance for some people. e.g. have a `scrape` function that does what @9214's example does, and just add a `function!` parameter, whose arg is called for each link found, maybe with some metadata about the page.

GiuseppeChillemi

[21:47](#msg5f8a1504c7ef520fffa66786)@Respectech  
Yes, it has more power but on Phyton entire ecosystems exists. Scrapy, Beautiful Soup, are just the tip of the iceberg:  
https://www.scrapinghub.com/guides/python-web-scraping-libraries-and-frameworks/

[21:49](#msg5f8a1576a7e77a0ff15033be)https://scrapy.org/

[21:49](#msg5f8a1587ea6bfb0a9a3cc370)https://towardsdatascience.com/choose-the-best-python-web-scraping-library-for-your-application-91a68bc81c4f

[21:50](#msg5f8a15b361007f7d1b76f09c)https://www.scrapehero.com/open-source-web-scraping-frameworks-and-tools/

[21:51](#msg5f8a15e4ea6bfb0a9a3cc4d1)(Some links have a collection of scraping technologies for other languages)

greggirwin

[21:54](#msg5f8a1696a0a3072b4387a34b)Good start on resources for a web scraping wiki page.

## Saturday 17th October, 2020

XANOZOID

[00:06](#msg5f8a359aea6bfb0a9a3d0d5b)Interesting take: Red is a symbiotic environment/framework, not just a "symbiotic language". (imo)  
http://wiki.c2.com/?SymbioticLanguages

greggirwin

[19:34](#msg5f8b474461007f7d1b79abac)Red can be much more of a language ecosystem than other languages which rely only on libraries and a single language. There is no single language that lets you express things with the clearest intent, accuracy, and abstraction for all domains that have to be addressed. Just as humans rely on nomenclature and jargon to be more effective in specialized areas. When we can build truly distributed systems, then we can do things more organically, where "agents" each know their own language, but may be part of a larger microbiome.

XANOZOID

[23:14](#msg5f8b7ac3a0a3072b438ae873)It's a really enjoyable reality of the language, there's a lot to be explored as time goes on :). It's the only language that feels like it a "frontier" in itself instead of a culmination of different programming languages that act as parts of a frontier together

## Sunday 18th October, 2020

endo64

[06:42](#msg5f8be3bd57fe0a4f3019e6b2)Well said @XANOZOID :)

GiuseppeChillemi

[07:03](#msg5f8be8daea6bfb0a9a40ef65)@XANOZOID it is the only language capable of giving you The Matrix disconnection effect. If you pass the "red pill/blue pill" moment, you will be in another order of ideas.

## Monday 26th October, 2020

henrikmk

[16:41](#msg5f96fc34eb82301c1a4e8ebd)Watching the bugs channel, is there a way to run a code snippet in many (or all) different Red versions at the same time and have the result returned in a table?

dsunanda

[17:04](#msg5f9701a86c8d484be2acac50)@henrikmk I have an app that does that.....But it's big and messy and is written in R2 which limits it a bit. (would be easy to port to Red - it's just that Red was very basic when the app was written)/  
It'll let you set up scripts and "environments". An environment is any reasonably Red-compatible .exe (eg R2, R3, Red).  
It invokes all the environments to run the scripts, and then tabulates the results.  
Suggest we PM if you want to know more.

greggirwin

[17:43](#msg5f970ab56c8d484be2acc469)What about having a launcher with a config for the versions you want to run. Each of those version has a loop that checks a folder matching their name for requests, `do`es them, and writes the result to their matching output dir? Send `quit` to each of them when you're done.

BaronRK

[20:57](#msg5f973821bbffc02b58400fed)Any thoughts on doing am Red eConference?

I co-founded the BIL Conference. They now run constantly all over the world. Basically, BIL is to ted what a Dark Net is to Gitter.

But, ideally we would create a depository (PBwiki was good for this in the old days), and have everyone suggest topics, but also vote up/down the topics, and the magic trick is setting times for the talks.

For example, I'm sure we all would listen for hours to Nenad talk about Red architecture. But we would only want a 15 min or 30 min talk on 'Finding work working from home' etc.

theSherwood

[20:59](#msg5f9738c0c7ef520fffc79d56)That's an awesome idea!

greggirwin

[22:07](#msg5f97488bbbffc02b58403c73)I love the idea. Let's see if we can plan one to close out the year, or ring in the new. TBD:  
\- Organizer  
\- Content Management  
\- Streaming Platform  
\- Time and Timezone  
\- Host/Moderator  
\- Q&amp;A  
\- Archive

What else?

GiuseppeChillemi

[22:10](#msg5f974940ea6bfb0a9a5dfbe9)* Time Zone

greggirwin

[22:12](#msg5f9749d13d172d78b39dd97d):+1:

PeterWAWood

[23:29](#msg5f975bed6c8d484be2adb53a)* Recording &amp; Publishing Sessions

Respectech

[23:40](#msg5f975e6aeb82301c1a4fa56a)I'd be interested in a Red eConf as well

## Tuesday 27th October, 2020

greggirwin

[00:12](#msg5f9765ecc990bb1c393361a7)- Organizer  
\- Content Management  
\- Streaming Platform  
\- Time and Timezone  
\- Host/Moderator  
\- Q&amp;A  
\- Archive (Record and Publish Sessions)

rebolek

[06:01](#msg5f97b7b0a7e77a0ff1722b4b)That's a great idea! If I may, I have few suggestions:  
\* for ideas gathering, we probably can start Wiki on Github, it's easy and maybe an dedicated room here also. once we agree about details, website should be set up.  
\* streaming platform: I suggest Zoom or MS Teams, IIRC they support up to 100 users in free version, if we need advanced features,buying subscripscription for a month or so shouldn't be that expensive.  
\* timezone: if we start a dedicated room here and people who want to join will post their preferred timezone there, we can find some good compromise imo.  
\* archive: streaming platform must support recording and recorded videos should be put on youtube

pekr

[07:05](#msg5f97c6cc270d004bcff2427b)We ran over 300 users meeting with Teams, but we have O365 licenses here. Teams has also special mode for conferences, where there is a team to prepare the content, it can host 10K users, users can ask questions in a written form), watching via the browser, not needing the license at all.

rebolek

[07:39](#msg5f97ceaa57fe0a4f303808ab)@pekr thanks, good to know. I don't expect we will have more than 100 people there anyway :-)

pekr

[07:42](#msg5f97cf49c990bb1c39344a61)I can understand, however "regular" teams meeting has no special powers for organisers - anyone can start to present, anyone can turn-on their microphone, disturb, etc. It is mostly for internal teams, where ppl are well organised, not for meetings with public :-)

rebolek

[07:43](#msg5f97cf97631a250ab29598f1)Certainly. AFAIK Zoom also has special conference mode, but I never used it. If Teams is fine, let's go with Teams.

pekr

[07:43](#msg5f97cfa8270d004bcff2574e)As for our community, Teams are more than good enough though. Our dev guys tried something around the Slack meetings, but had really bad experience, so switched to Zoom. Google has something too, is that Meet?

[07:44](#msg5f97cff6631a250ab2959a45)I have brought O365 to two corporates already. Was something like beta-testing Teams Rooms and even one gold MS partner asked me about my experience here :-) We use HP Slice G2 units in all rooms, plus Ligitech Brio cameras.

rebolek

[07:45](#msg5f97d00198a7774f1b6c47a9)I'm not a fan of Slack and Google has great history of abandoning their products so there's no guarantee when we choose something today, it will be available by the time of the conference ;)

pekr

[07:45](#msg5f97d015eb82301c1a50a4aa)Teams rooms have even special content cameras, so that you can have your white-board camera, etc.

[07:46](#msg5f97d0703d172d78b39f087b)Also - not sure you know - each user can connect 2x to the same meeting. It becomes mutual exclusive. Not sure you know :-) So you can grab your phone, connect to meeting, go somehwere, show to audience and you decide, if you use micropohone /camera from your phone, or notebook ....

rebolek

[07:47](#msg5f97d086c7ef520fffc900fa)Nice.

pekr

[07:48](#msg5f97d0b8ea6bfb0a9a5f2c77)Yes, imagine some firstline worker, somehwere in the factory, or a product presentation. It is just that the picture can get shaky, if you don't have a stabiliser or ois in your phone. But nice options indeed ....

rebolek

[07:48](#msg5f97d0dc61007f7d1b996bda)I've only used Teams with our town hall information commision, there is like 5-6 of us, so I haven't got much experience with it.

[07:49](#msg5f97d0f6955f6d78a955735b)But it seemed OK.

pekr

[07:51](#msg5f97d18d631a250ab2959dd0)Teams is really good. Even in recent corona days, it can really help and there is special mode for schools. Btw - new feature just rolling-out - room split. You (organiser) can split ppl to micro teams, they have separate audio/video and then you can merge it back ...

[07:52](#msg5f97d1a8c7ef520fffc903a5)I know two companies switching form Zoom to Teams. So unless MS is a red flag for you, Teams is really a nice tool.

rebolek

[07:59](#msg5f97d3546c8d484be2aec105)If it works...

[08:42](#msg5f97dd6c57fe0a4f303829ed)Another alternative is using Jitsi which means setting up own server with good enough connection. I'm not sure if it makes sense for one-time event.

henrikmk

[14:58](#msg5f9835a3a0a3072b43aad13a)@dsunanda thanks. I think I'll hold off for the moment. it was just an idea.

dsunanda

[19:31](#msg5f9875a8955f6d78a9573c10)@henrikmk Thanks for reminding me of a project that fell off my back burner.  
Originally, it was an automated tool for mining differences between R2 and R3.  
I think it could be a useful tool once I get around to converting the core to run under Red (currently it's R2 driven).

GiuseppeChillemi

[22:07](#msg5f989a0f270d004bcff477fa)@henrikmk I have just released a script that is able to run itself to other instances of Red/Rebol to show if there are differences in the system/word context. If you want I can adapt it to output results in a table and run on as many versions of the interpreter you want.

## Wednesday 28th October, 2020

XANOZOID

[14:11](#msg5f997c1cf2fd4f60fc3c0895)Made myself a cup of coffee today . . . I'm late to the party making drinks at home lol. Looked at the price of a coffee I was charged for at quick stop places - jeez. $5+ USD per drink is insane!

greggirwin

[17:34](#msg5f99ab97b86f640704184480)Food delivery is also popular here now. Eating out is expensive to begin with, but then you pay to have it delivered too. Since the pandemic started, a lot of coffee places won't let you use your own cup or mug either. I don't go out much, so it's always a bit of sticker shock when I do.

Respectech

[18:36](#msg5f99ba31dc70b5159ada5437)Having owned an Internet cafe / coffee shop for 6 years (2006-2012), I can say that it is expensive to do so, and doesn't offer much in the way of an incentive to the owners. One employee at $13/hr. (minimum wage here in California) plus employment expenses runs about $135/day. Assuming $2 of that $5 drink accounts for the ingredients and waste (cups &amp; lids, wrong orders, expired milk, etc.), it takes 45 cups to just break even on one employee. That doesn't include rent, utilities, advertising, insurance, taxes, equipment maintenance, etc. which all has to be paid before the owner makes a penny. If you have 2 employees, you need to sell somewhere in the neighborhood of 200 drinks a day just to break even. That amounts to more than one drink every 4 minutes assuming the business is open for 12 hours a day. Better not have a slow time of the day, or a whole day that's slow!

dsunanda

[18:43](#msg5f99bbc1b4283c208a2ed6ef)@Respectech Tough business. I've kept the register in my peripheral vision a few times while in a coffee shop, and have not been able to square the lack of sales with the apparent ability to stay in business. Most likely scenario I've been able to dream up is: Money Laundering :)  
Except my local of course - but they double up as coffee bar and bicycle repair shop (same staff).

greggirwin

[18:45](#msg5f99bc3bc10273610ad00c93)Thanks for the analysis Bo.

[18:46](#msg5f99bc728a236947ba6f3000)@dsunanda I hope they wash their hands when changing gears!

[18:49](#msg5f99bd1d8a236947ba6f319e)You can see why shops can't make it on coffee alone, but food, trinkets, and more. Every little bit helps.

BaronRK

[18:49](#msg5f99bd50bf955735eb45c001)If only we had a single tool that was web-based that supported a fully interactive Calendar for planing talks down to the minute, had forums, files, and wikis..... hmmmm....

Well, for those of you new to this, we do, and it is written in REBOL, and still going strong.

I took the notes from this thread, and shoved them into a wiki, and syndicated it (shared):

https://www.prolific.com/qwiki.cgi?mode=previewSynd&amp;uuid=J46GXUWD6W7AWFQHL6J3X4AJX6QT

Shoot me your email if you don't already see an invite (all people from Rebol-Sig were automatically invited, that was almost 100 people right there).

Greg and Nenad have already been made LEADS, they can invite at will.

Once you sign up and accept that project's invite, you no longer need to log in, it works from Email. if you like, sort of like Gitter.

Please post a real name and photo, as it is a private system, it is only among friends (unlike Gitter).

Feel free to ask me anything.

greggirwin

[18:51](#msg5f99bdbab4283c208a2edc79)Thanks @BaronRK !

Respectech

[18:56](#msg5f99bed68a236947ba6f37a6)@dsunanda Our Cafe was part of our tech consulting and computer retail business, so it was a "loss leader" - get people in the door for the coffee, maybe they'll buy a laptop or some computer accessories (flash drives, SD cards, replacement power cord, etc.). I don't think it ever turned a profit on its own. And getting good employees was like finding a needle in a haystack. We did have a few exceptional employees, though! During one period, I'd show up to work and within 5 minutes Lucy would deliver a hazelnut latte and pastry to my desk without me even asking. (I'm still trying to lose the weight that I gained during that time.)

[18:58](#msg5f99bf59c6fe0131d4bfb9ed)My wife was the supervisor of the baristas, and she was personally trained by Heather Perry, a World Champion barista. And we served award-winning espresso beans, so our espresso was top notch.

[18:58](#msg5f99bf5ebf955735eb45c58c)Ah, the memories!

BaronRK

[18:59](#msg5f99bfa12a35440715ef375e)At some point, and by someone in charge (not me) we should notify other Red people one level up about this conf.)

## Thursday 29th October, 2020

GiuseppeChillemi

[06:24](#msg5f9a601906fa0513dd7cf9ff)@BaronRK I have not received the mail.

planetsizecpu

[12:09](#msg5f9ab10fc10273610ad26078)@Respectech Before corona, I usually went to have a snack at a slot machine type place / playground / bar / bakery: espresso with milk + croissant cost € 2 at breakfast time offer, I always wondered how they could do it. Add a lot of screens with music videos, propaganda, etc. It is still working today, after years.

@BaronRK Please email me the invite!

Respectech

[15:21](#msg5f9addee74152347c200886b)@planetsizecpu Maybe they made enough on the slot machines?

XANOZOID

[15:23](#msg5f9ade578a236947ba720b0e)@Respectech Loved to read about your experience! Kind of made me start thinking about if I'd ever do something like that in the future myself haha

TimeSlip

[15:23](#msg5f9ade85dc70b5159add3540)@BaronRK I may have deleted your invite by mistake. I do have an old account at Prolific (Qtask) and I just updated my email address. Thanks.

BaronRK

[19:13](#msg5f9b1447bf955735eb4926d9)About 20 people have already signed in which is nice.

## Friday 30th October, 2020

planetsizecpu

[07:54](#msg5f9bc6a806fa0513dd8083a5)@Respectech honestly, I have never seen many people going up to the senior area, but I always go early, you can take the tour \[here](http://pamadi.com/es-forn-de-porto-pi/) it is a large building.

Respectech

[18:27](#msg5f9c5b288a236947ba75e702)@planetsizecpu Looks like a place I'd like to go if I was in the area. :-)

## Saturday 31st October, 2020

XANOZOID

[01:19](#msg5f9cbbb2c10273610ad789f8)Haha . . what do you think of this? "Red: Really enjoyable dialects" 😆

greggirwin

[05:19](#msg5f9cf3d4d5a5a635f29062b2):^)

GiuseppeChillemi

[14:25](#msg5f9d73ce8d286f20767ef8d7)Here in Italy Cafeteria sells also a lot of good food for breakfast called "Tavola Calda" (Translated as "Hot Table") and Cappuccino, Espresso. Also during the Afternoon people used to meet to have a "Spritz", eat Gelato (Ice Cream) or Granita. So, the "production line" of caffetteria is always full and generating income.

pekr

[18:06](#msg5f9da7b92a60f731f728d0e2)Looking at some recent commits, I wonder why there is still Syllable amongst the listed OSes. Its website does not even exist anymore imo and the project is dead?

greggirwin

[18:18](#msg5f9daa7d2a60f731f728d735)Probably because it's an extra task to remove it. :^)

## Monday 2nd November, 2020

BaronRK

[19:29](#msg5fa05e0cdc70b5159aea0802)= Caricature =

[19:29](#msg5fa05e2af2fd4f60fc4ca053)\[!\[BRKVW-Cartoon-SideBySide-Ramirez.jpg](https://files.gitter.im/5aa6f8ced73408ce4f9110f7/jIor/thumb/BRKVW-Cartoon-SideBySide-Ramirez.jpg)](https://files.gitter.im/5aa6f8ced73408ce4f9110f7/jIor/BRKVW-Cartoon-SideBySide-Ramirez.jpg)

## Wednesday 4th November, 2020

GiuseppeChillemi

[19:59](#msg5fa308057cac87158f88497f)Slow code is better than no code

## Friday 6th November, 2020

GiuseppeChillemi

[12:51](#msg5fa546def2fd4f60fc593918)We should set simple goals for Red:

[12:51](#msg5fa546e8dc70b5159af6a933)\[!\[image.png](https://files.gitter.im/5aa6f8ced73408ce4f9110f7/Mcl9/thumb/image.png)](https://files.gitter.im/5aa6f8ced73408ce4f9110f7/Mcl9/image.png)

[12:52](#msg5fa5470006fa0513dd97bc8b)My target is the first one.

greggirwin

[20:48](#msg5fa5b69abf955735eb6377ea):^)

## Thursday 12nd November, 2020

GiuseppeChillemi

[21:10](#msg5fada4ad8d286f2076a6a8db)A Rebol inspired Parse implementation:  
https://bakpakin.com/writing/how-janets-peg-works.html

greggirwin

[22:42](#msg5fadba4ac10273610a00ae59)Thanks for posting that @GiuseppeChillemi !

GiuseppeChillemi

[23:12](#msg5fadc160d5a5a635f2b98da4)Today I was searching for parse answers and I have found it.

[23:13](#msg5fadc19d8d286f2076a6f47e)Rebol manual say `into` works on blocks but it works on paths too.

greggirwin

[23:21](#msg5fadc37ab86f640704497529)You should be able to `into` into any series, though I'm not sure about vector and image. You can even do things like this:

```
>> parse [a b #{63646364}] ['a 'b into [some [#"c" | #"d"]]]
== true
```

GiuseppeChillemi

[23:22](#msg5fadc39db4283c208a5fcf30)The most difficult thing I am facing is having a parse inside a function and parse rules defined outside the function. If I have to use an argument of the function inside `(.. Code..)` into nested rule, the I have to bind each code block to the function containing parse. I have ended wrapping all inside an object like it has been explained in Rebol manual. But I have to exercise to create a context for each code in nested rule. 💪

[23:23](#msg5fadc3ebc10273610a00c796)I like your example

[23:26](#msg5fadc4972a354407152027b5)From some time I am thinking that Red could parse AI structures and modify them. One day we will be there.

## Friday 13th November, 2020

rebolek

[07:37](#msg5fae37a8bf955735eb781217)@GiuseppeChillemi  
&gt; having a parse inside a function and parse rules defined outside the function.

That's what `context` is for.

GiuseppeChillemi

[12:07](#msg5fae76e7b4283c208a6168bb)I will reply to you in parse chat

## Saturday 14th November, 2020

Respectech

[01:10](#msg5faf2e69b86f6407044cf040)Petri Keckman released some interesting animations made with Rebol a couple of days ago. https://youtu.be/ToVdOzqRopo

GiuseppeChillemi

[01:15](#msg5faf2f948a236947baa3dc5b)Very nice!

toomasv

[05:24](#msg5faf6a25bf955735eb7b1282)Impressive!

pekr

[06:35](#msg5faf7abcb86f6407044d8ea1)IIRC he is the guy, who presents his animations in terms of some exhibition. Some nice animations are still available in terms of the R2 Desktop. There was once a competition, so ppl submitted various nice works ....

## Sunday 15th November, 2020

GiuseppeChillemi

[00:08](#msg5fb071697cac87158fa8abf9)Next: Carl or Nenad hired at Microsoft?

[00:08](#msg5fb071792a3544071526aa57)https://m.slashdot.org/story/378294

ne1uno

[02:42](#msg5fb0958a2a3544071526ed2a)google hijacked python first

## Tuesday 17th November, 2020

greggirwin

[02:48](#msg5fb33a0fb86f64070456882d)Please make sure Petri knows about us, so he can stress test `draw`. :^)

[02:51](#msg5fb33a95dc70b5159a182696)I doubt MS can woo Carl, but they would have to admit that Red has waaaayyyy better Windows GUI support than Python.

## Wednesday 18th November, 2020

hiiamboris

[19:21](#msg5fb57456f2fd4f60fc804961)!\[](https://i.gyazo.com/b0741e92a60ccf7f37d2067b6a857834.gif)  
Funny how \*modern* MS OneNote works on a \*modern* laptop. I draw a stroke in 3 secs, it takes 40 seconds to render it ;)  
I wonder, are we the only people who still \*test* their software before releasing? It seems like testing is out of style nowadays..

[19:23](#msg5fb574b37cac87158fb4cb70)I did the same thing in \*pure Red\*, it was realtime (truly) up to thousands of points, after that you have to smooth the stroke by removing points that are too dense.

dander

[20:35](#msg5fb585788d286f2076b9a95e)@hiiamboris Oh yeah, you don't have to do testing anymore because your customers will test it for you 🙃

Respectech

[21:23](#msg5fb590d4c10273610a13938e)But was Red uploading your thousands of points to the cloud for further analysis by Microsoft?

Oldes

[21:27](#msg5fb591cd8a236947bab35b1a)truly realtime analysis ;-)

hiiamboris

[21:28](#msg5fb591fddc70b5159a1e1229)@Respectech I actually had that thought :D Esp. since I'm on a mobile ;)

Respectech

[22:20](#msg5fb59e3e2a35440715338615)@hiiamboris First of all, MS shouldn't be uploading the points unless you are using it as a cloud application. Secondly, it should render first and send the points as a separate process.

hiiamboris

[22:44](#msg5fb5a3e0d37a1a13d6b54e57)Then let's start with the "shouldn't just scratch the old working code in every new release" ;)

[22:45](#msg5fb5a4128a236947bab38b2a)Isn't this what everyone's doing though?

[22:46](#msg5fb5a436bf955735eb8a42fd)Omg this code is so dusty, keep it away from me!!

[22:47](#msg5fb5a48ac6fe0131d4034d0b)Funny economy we live in.

## Thursday 19th November, 2020

GiuseppeChillemi

[06:27](#msg5fb610508a236947bab47909)@hiiamboris I have touch windows devices, I would like to try you code here)

hiiamboris

[14:46](#msg5fb68542d5a5a635f2cec220)I'm lazy to extract it, yet ;)

Respectech

[23:36](#msg5fb701718a236947bab6f615)It's too bad this just doesn't work by default:

```
>> 2.54 * [12 14 18]
*** Script Error: * does not allow block! for its value2 argument
*** Where: *
*** Stack:
```

[23:37](#msg5fb701d37cac87158fb8afcb)This kind of works:

```
>> 12.14.18 * 2.54
== 30.35.45
```

[23:38](#msg5fb701e3f2fd4f60fc84133e)Although it is rounded to the floor value.

greggirwin

[23:43](#msg5fb7033c7cac87158fb8b2d2)What result do you expect from the first one @Respectech? Beware on the second, because tuple segments are limited to byte values.

[23:45](#msg5fb7039b06fa0513ddc31974)Maybe you're looking for vector math?

```
>>  2.54 * make vector! [12 14 18]
== make vector! [24 28 36]
>>  2.54 * make vector! [12.0 14.0 18.0]
== make vector! [30.48 35.56 45.72]
```

## Friday 20th November, 2020

Respectech

[00:57](#msg5fb71472b86f6407046029de)On the first one, it would be an array multiplication.

[00:57](#msg5fb714802a60f731f766bf0d)I realize the second one is limited to values of 255. That's why I was hoping the first method would work.

greggirwin

[00:57](#msg5fb7148e06fa0513ddc33c00)Use vectors then.

Respectech

[00:59](#msg5fb714eb8a236947bab72272)What is the format for the vector! datatype?

greggirwin

[01:00](#msg5fb71510bf955735eb8de1d7)They don't have a literal form: https://github.com/red/docs/blob/master/en/datatypes/vector.adoc

Respectech

[01:02](#msg5fb715912a60f731f766c15b)OK. That's cool. My old Rebol brain didn't realize that was a thing. It looks like the vector has to be a decimal! in order for the vector to end up with decimal! results:

```
>> 2.54 * make vector! [12 14 18]
== make vector! [24 28 36]
>> 2.54 * make vector! [12.0 14.0 18.0]
== make vector! [30.48 35.56 45.72]
```

[01:02](#msg5fb715a2d37a1a13d6b8dfd4)I suppose that's by design.

[01:03](#msg5fb715edd5a5a635f2d0466b)But generally in mathematics, if either number is a float, the result is a float.

greggirwin

[01:03](#msg5fb715fcdc70b5159a21d2f5)Yes, otherwise it would have to potentially change the size of values in memory and move things around. Note the comments about modding in place in the docs.

[01:05](#msg5fb71645d5a5a635f2d04726)A primary goal of vectors is performance. Convenience comes second in their case.

Respectech

[01:08](#msg5fb71711d37a1a13d6b8e2d6)OK. Thanks.

pekr

[05:27](#msg5fb753d8fe857d71dc8355a2)Wouldn't something like `apply`help in such situation, when you need to apply some operation to the block of values? Red probably does not have it yet though ...

Oldes

[08:32](#msg5fb77f32477a8b480c0795e7)@pekr `apply` is for calling function with given set of arguments.. so it wouldn't in this case.

[08:34](#msg5fb77f91bba6a3778b6f9021)Example is `apply` use is R3' `repend`:

```
repend: make function! [[
    {Appends a reduced value to a series and returns the series head.}
    series [series! port! map! gob! object! bitset!] "Series at point to insert (modified)"
    value "The value to insert"
    /part "Limits to a given length or position"
    length [number! series! pair!]
    /only "Inserts a series as a series"
    /dup "Duplicates the insert a specified number of times"
    count [number! pair!]
][
    apply :append [series reduce :value part length only dup count]
]]
```

[08:35](#msg5fb77fc56697c7481f170352)versus R2's `repend`:

```
repend: func [
    {Appends a reduced value to a series and returns the series head.}
    series [series! port!]
    value
    /only "Appends a block value as a block"
][
    head either only [
        insert/only tail series reduce :value
    ] [
        insert tail series reduce :value
    ]
]
```

[08:37](#msg5fb7803e477a8b480c079859)R2 was not using `apply` in `repend`, because R2's `apply` is not a native and so it would slow evaluation.

[08:38](#msg5fb7807e0451324f1524ea17)Btw... R3's `repend` is also much slower than simple `append reduce`!

[08:39](#msg5fb780d4abf6a739a6a46257)

```
rebol
>> b: make block! 1000 v: 1 dt [loop 1000 [repend b [v]]]
== 0:00:00.000627

>> b: make block! 1000 v: 1 dt [loop 1000 [append reduce b [v]]]
== 0:00:00.000368
```

rebolek

[10:45](#msg5fb79e3b0451324f15252c25)Rebol's `apply` has really terrible design.

Oldes

[10:59](#msg5fb7a19033d7764bde7eccfc)Which Rebol do you mean?

toomasv

[13:43](#msg5fb7c7ecfe857d71dc84685d)In Red `repend` seems indeed to be slightly slower, but consumes significantly less memory:

```
>> recycle/off profile/show [[b: make block! 100000 v: 1 loop 100000 [repend b [v]]][b: make block! 100000 v: 1 loop 100000 [append reduce b [v]]]] recycle
Count: 1
Time         | Time (Per)   |      Memory | Code
0:00:00.057  | 0:00:00.057  |     6000312 | [b: make block! 100000 v: 1 loop 100000 [append reduce b [v]]]
0:00:00.08   | 0:00:00.08   |     1600468 | [b: make block! 100000 v: 1 loop 100000 [repend b [v]]]
```

It's probably due to intermediate block creation by `reduce`.  
Without block preallocation memory consumption of `repend` is similar to `append reduce`:

```
>> recycle/off profile/show [[b: copy [] v: 1 loop 100000 [repend b [v]]][b: copy [] v: 1 loop 100000 [append reduce b [v]]]] recycle
Count: 1
Time         | Time (Per)   |      Memory | Code
0:00:00.057  | 0:00:00.057  |     4400328 | [b: copy [] v: 1 loop 100000 [append reduce b [v]]]
0:00:00.083  | 0:00:00.083  |     4195164 | [b: copy [] v: 1 loop 100000 [repend b [v]]]
```

Is tis comparison flawed somehow?

hiiamboris

[16:19](#msg5fb7ec87abf6a739a6a57488)repend/append study is here https://github.com/red/red/issues/3340

greggirwin

[18:40](#msg5fb80d81bba6a3778b70fc9f)@pekr higher order functions can be used for this, yet. The equivalent func is generally called `map`. Our HOF R&amp;D got put on a back burner, but we will have it in the future.

## Saturday 21st November, 2020

henrikmk

[15:48](#msg5fb936d4fe857d71dc87c7a5)I've always felt that REPEND was a fairly useless way to shorten code, since my coding style is more to use COMPOSE. Better to have a small chain of interchangeable functions than to invent new words and create call overhead, sort of like a tool-pipe.

GiuseppeChillemi

[23:42](#msg5fb9a5fd477a8b480c0cc8dc)@hiiamboris I am lazy too, so I understand your laziness. Take your time!

## Sunday 22nd November, 2020

hiiamboris

[09:13](#msg5fba2bb6ba69631c74929e0e):D

## Friday 4th December, 2020

GiuseppeChillemi

[17:49](#msg5fca76a1d3779e2114be4ea6)I have saved a web page in HTML format, it belongs to my facebook page and it is the list of the group I am in:. What are the groups of characters like `pfnyh3mw`?

`href="https://www.facebook.com/groups/micros/" role="link" tabindex="0">Microcontrollori, Arduino, Atmel, Pic, MSP, ARM,Raspberry`

`
`

dsunanda

[19:06](#msg5fca88be3f3ba47d91bfd1dc)They are names of CSS classes. Somewhere in the header is likely to be a link to a CSS file - something like:  
&lt;link rel="stylesheet" type="text/css" href="my-css-file.css" /&gt;

loziniak

[21:06](#msg5fcaa4bd5d79da211949817b)Probably a method of obfuscation, or automatically generated by some framework.

greggirwin

[21:33](#msg5fcaab255be1fb21c5fc6543)Because we have to work to make things even less human friendly.

GiuseppeChillemi

[23:06](#msg5fcac10d4522810ca6359ac0)I would like to extract the name and links of all the groups I am subscribed to. While finding the link is easy, the rest of the file is no so.... readable!

greggirwin

[23:09](#msg5fcac18f8f68b80cb1a70fdb)They don't want you to do that. If you could, others could provide services to scrape people's FB data and help them move off the service.

dsunanda

[23:16](#msg5fcac350d3779e2114bf1b6c)It is theoretically possible to request your data from Facebook:  
https://www.itpro.co.uk/general-data-protection-regulation-gdpr/31330/how-to-reclaim-your-data-from-google-facebook  
Here's someone who tried, and seems to have given up:  
https://ruben.verborgh.org/facebook/

GiuseppeChillemi

[23:25](#msg5fcac5805be1fb21c5fca9a4)Too bad.  
I will scrape it in some way. I want to extract all my groups and aggregate them for same/similar topic. I want to control what I read, I don't want to be under the preferences of an alghorithm.

[23:26](#msg5fcac5b95be1fb21c5fcaa50)In the meantime this evening, I wanted to give a try to flutter....

[23:27](#msg5fcac5c554596159c63cf972)Happy reading: https://flutter.dev/docs/get-started/install/windows ! Simple, isn't it?

[23:35](#msg5fcac7bb56507459cc62ed31)Its size is comparable to Red one.

[23:51](#msg5fcacb794c1e954e644bb7bf)600MB Flutter + Dart  
\*Run: flutter doctor

You need the android SDK: 800MB download  
\*Run and install it:

You need to download something more:

[23:51](#msg5fcacb965be1fb21c5fcb93c)\[!\[image.png](https://files.gitter.im/5aa6f8ced73408ce4f9110f7/WSu0/thumb/image.png)](https://files.gitter.im/5aa6f8ced73408ce4f9110f7/WSu0/image.png)

## Saturday 5th December, 2020

GiuseppeChillemi

[00:12](#msg5fcad069d3779e2114bf3f12)It has asked me to install Flutter and Dart Plugin on Android studio. I did this and `flutter doctor` still reports that the plugins are not installed. Googling it:  
https://github.com/flutter/flutter-intellij/issues/4523  
BUG!  
I have to run:  
`flutter channel beta`  
`flutter updgrade`  
Another round of downloads has started

[00:12](#msg5fcad0824c1e954e644bc3ee)Again: `flutter doctor`  
Another round of downloads

[00:12](#msg5fcad08927085821da8aebc5)Another install  
Everything seems now fine

[00:18](#msg5fcad1e13f3ba47d91c0915c)This is what a multi-billion dollar company is able to do, and then we have Red, our "everything is included" 1MB installer, and the great team which has created this wonderful language.

[00:18](#msg5fcad1f37133e319cb50936f)I am going to sleep. My friends, see you tomorrow!

greggirwin

[05:22](#msg5fcb18f975f7397e29f4095c)Thanks for the report @GiuseppeChillemi. I have Flutter on my list, having looked at it some time back, but never had the bandwidth to install it.

pekr

[05:46](#msg5fcb1eb8ccac732a3a002f49)My team uses Flutter for mobile apps. It is just that the company that acquired us, leans towards the React stuff instead, so we will see.

GiuseppeChillemi

[08:32](#msg5fcb459fc5f7642d2ed8403b)This night I have left Vue.js which was installing itself and downloading other packages, next step will be React.js. This is my jump star on the web world I have never been, as I belong to the old school of coding.

[17:56](#msg5fcbc9d067bf4438e1281476)Important rules:

[17:56](#msg5fcbc9d667bf4438e128147b)https://thenewstack.io/greg-kroah-hartman-lessons-for-developers-from-20-years-of-linux-kernel-work/

[17:58](#msg5fcbca3b2b3e824d8c28b1b0)Do changes until we are in alpha stage. This will shield the project from the problems mentioned in the article.

[17:59](#msg5fcbca9275f7397e29f5a570)Rewriting VID? Do this now or create VID2 later mantaining the original VID

[18:01](#msg5fcbcb00cf3760558c0ddd58)Alpha and Beta stages are magical moments where quite everything can be changed, expecially the former one.

pekr

[18:01](#msg5fcbcb032d8b7c763843be4f)Is there a reason to rewrite VID, apart from possible GOB inclusion?

GiuseppeChillemi

[18:04](#msg5fcbcbabc5f7642d2ed97bad)I have recently read about this as hypothesis

greggirwin

[19:53](#msg5fcbe5292d8b7c763843fd6e)@pekr it's a question of whether VID can be extended while staying compatible.

## Sunday 6th December, 2020

Oldes

[01:21](#msg5fcc3217a03ad8762a00f621)Dialects don't have to be compatible.. just close to each other.

greggirwin

[04:32](#msg5fcc5edae979833582f2bdc3)Right. We don't want too many of them, but to add resizing, constraints, data-binding, etc. may be too much to force into VID. So we have Large Application Next-Gen UI Dialect, but there's no rush.

## Tuesday 8th December, 2020

rebolek

[07:29](#msg5fcf2b6f3a841040f84a19c5)Gitter now has a working Matrix bridge https://matrix.org/blog/2020/12/07/gitter-now-speaks-matrix#how-do-you-make-an-existing-chat-system-talk-matrix

hiiamboris

[09:46](#msg5fcf4b5f2e3275286a118048)Now I just need to figure out how to be in the Matrix from two accounts simultaneously inside the same browser :/

rebolek

[09:50](#msg5fcf4c69dbfccf1d7a2bbbc7):)

loziniak

[09:54](#msg5fcf4d503a841040f84a79d1)maybe just open a private window?

[09:58](#msg5fcf4e2df69c5c540c362fe7)or use \[Pidgin](https://github.com/matrix-org/purple-matrix/#readme) (didn't try it)

loza:matrix.org

[10:49](#msg5fcf5a4af69c5c540c36504d)https://github.com/vector-im/element-web/issues/2320

[10:50](#msg5fcf5a82fcbf697f7326b262)and hello from matrix!

hiiamboris

[16:37](#msg5fcfabcd8d1477540fad7a41)Hi @loza:matrix.org and thanks for the link. Upvoted ;)

hiiamboris:chat.weho.st

[17:24](#msg5fcfb6bd07439e1fc413158b)lol it took ~5 minutes to load the chat room

zentrog:matrix.org

[18:20](#msg5fcfc3d70d0bd11d7292f748)The web version? On the native app it's a lot faster for some reason

hiiamboris

[18:22](#msg5fcfc44f8d1477540fadc28d)yeah well, I figured the simplest way to go is use different riot web instances (element.io and weho.st), but turns out there are drawbacks to this idea :D

GiuseppeChillemi

[19:28](#msg5fcfd3f98cdd4340ff0ad44e)GoodBye CentOS: the Oracleization of RedHat?  
https://www.cyberciti.biz/linux-news/centos-linux-8-will-end-in-2021-and-shifts-focus-to-centos-stream/

[19:31](#msg5fcfd497fcbf697f7327fd95)They have also announced CentOS 8 as "Supported up to 2029", then: "Stepback, we changed everything!"

## Wednesday 9th December, 2020

dander

[00:39](#msg5fd01cbe03da931ac23e0bb6)There are a few interesting notes on the planned features off that matrix blog post. "Instant live room peeking (less than a second to load the webapp into a live-view of a massive room with 20K users!!)”

[00:40](#msg5fd01cf528a57c581bffe3dc)They must be doing some kind of work when first joining a room. Maybe some crypto stuff

[00:41](#msg5fd01d309700c07b17db6639)Also looking forward to “Excellent search-engine-friendly static content and archives”

henrikmk

[15:41](#msg5fd0f03582222960e4d59316)

```
find/index [a b c] 'b == 2
find/index [a b c] 'd == none!
```

Would be a nicer short hand than:

```
context [
  pos: none
  all [pos: find [a b c] 'b index? pos] == 2
  all [pos: find [a b c] 'd index? pos] == none!
]
```

rebolek

[15:50](#msg5fd0f23128a57c581b01fa01)I’m not sure if adding another refinement to an already overloaded function (`find` has 11 refinements) is the right way. But this is something that makes sense to support. I believe that making `none?` transparent is an easier solution. Are there any arguments against it?

toomasv

[16:28](#msg5fd0fb3a82222960e4d5b12d)These are not so bad either:

```
>> attempt [index? find [a b c] 'b]
== 2
>> attempt [index? find [a b c] 'd]
== none
```

hiiamboris

[16:30](#msg5fd0fbb903da931ac24045ae)+1 for `none = index? none`

toomasv

[16:32](#msg5fd0fc1567034a3e90fa1ef1)Yes, this would be better.

greggirwin

[18:43](#msg5fd11ae382222960e4d60b6b)It's an old idea. I've had this in R2 since I stole it from @giesse.

```
index??: func [
        {Returns the index number of the current position in the series.
        Differs from native INDEX? in that it returns NONE instead of
        triggering an error.}
        series [series! port! none!]
    ][
        attempt [index? series]
    ]
```

-1 for `find/index`

I think making `index?` pass `none` through safely makes sense.

Oldes

[18:58](#msg5fd11e5292aa1c4ef5ce1c6d)In R3 it's already legal:

```
>> index? find [a b c] 'd
== none
```

[18:59](#msg5fd11e9f3646a85814dc1111)Using `attempt` in such a case is quite expensive solution... especially closed in another mezzanine.

[19:02](#msg5fd11f4c91e8cb3e8cef3cb9)https://www.curecode.org/rebol3/ticket.rsp?id=1611

[19:18](#msg5fd122f71f36292125df6f4f)Current Red's state:

```
>> select none 1
== none
>> find none 1
== none
>> length? none
== none
>> empty? none
== true
>> index? none
*** Script Error: set does not allow none! for its series argument
```

greggirwin

[20:06](#msg5fd12e4428a57c581b02abcd)Should be an easy change, since a couple other actions already work the same.

[20:51](#msg5fd138e103da931ac241013a)I have good news and bad news. The good news is I had a quick chat with Nenad about it. The bad news is that the request may go the other way. There are 6 series actions that allow `none` today. Not quite 50%. The driving force for allowing it was `remove/select/find/take` for R3 compatibility.

[20:57](#msg5fd13a2891e8cb3e8cef906d)It's inconsistent today, giving us some comfortable shortcuts but weakening type safety in return. As Nenad noted, `none = remove none` doesn't make sense, especially if you're new to Red. For this reason, and foregoing R3 compatibility, all series action support will be removed from `none!`. Yes, it makes for a little more code, but improves consistency.

I'm sure this feature will rises again in chat, in the future. :^)

Apologies for any code it breaks.

[21:00](#msg5fd13b0782222960e4d669e6)I grepped a bunch of my old R2 code, and found just 2 instance of `index??` in production code.

[21:03](#msg5fd13ba728a57c581b02d1f1)`remove find` does appear in a few places in the red code base, so we have to do our own fixes as well.

Oldes

[21:10](#msg5fd13d3e0697c1210db01ded)I think it is a bad choice. There just will be more ill functions like `index??` or `index?find` from mentioned CC.

hiiamboris

[21:13](#msg5fd13deb92aa1c4ef5ce7aba)Most likely

Oldes

[21:15](#msg5fd13e6a67034a3e90faed19)Related Carl's CC https://www.curecode.org/rebol3/ticket.rsp?id=473

[21:15](#msg5fd13e8b67034a3e90faed6f)Hmm.. maybe not exactly related

greggirwin

[21:16](#msg5fd13ebd1f36292125dfc137)Possibly, but that's OK. It's easy to weaken the checks at the mezz level, but not the other way around.

And I don't \*think* that's Carl S. Probably Carl Read.

Oldes

[21:17](#msg5fd13ee791e8cb3e8cef9d5e)https://www.curecode.org/rebol3/ticket.rsp?id=1611

greggirwin

[21:18](#msg5fd13f3355c9c37b3056d45a)In looking at the `remove find` cases today, what the idiom \*doesn't* do is tell you whether it's expected to fail sometimes. Rather, by using `remove find`, you're saying "optionally remove the value if it was found." Maybe there's an opportunity there.

Oldes

[21:18](#msg5fd13f373646a85814dc720a)Ech.. that is the one from above... should not use mobile for such a task:(

greggirwin

[21:20](#msg5fd13f95c829e14ef284e2da)Here are our choices:  
\- Be inconsistent, for convenience in a few cases.  
\- Be consistent and allow it for all series actions.  
\- Be consistent and disallow it for all series actions.

Oldes

[21:23](#msg5fd1405103da931ac24115ac)So instead of allowing it for index? better to change/break existing one? I don't get it. 6% of battery.. ending today.

greggirwin

[21:26](#msg5fd140ef28a57c581b02df76)This is about the big picture. Yes, we'll break things if we think it's an improvement overall. This is a choice between consistency and convenience. I'm subject to wanting convenience too, all the time. But it doesn't come for free.

Oldes

[21:31](#msg5fd142253dd3b251a4f78a48)There is also HF's way of \_blank\_'s mutated into \_named voids\_.

greggirwin

[21:35](#msg5fd1431503da931ac2411c97)Let's not go there just now. :^)

hiiamboris

[21:44](#msg5fd145533dd3b251a4f7939d)lol

## Thursday 10th December, 2020

GiuseppeChillemi

[00:15](#msg5fd168a2c829e14ef2855522)SUPER LOL

[00:17](#msg5fd16933c829e14ef28556e5)I have already requested `none` transparency in the past for `index?` and I have received a similar answer. Nenad prefers throwing an error to catch possible errors in code.

henrikmk

[16:04](#msg5fd246fa55c9c37b305953e9)"There just will be more ill functions like index?? or index?find from mentioned CC." - Maybe then it would make sense to formalize functions that specifically work with indexes, and allow a few useful ones. INDEX? is the only one and seems kind of an incidental stepchild to series functions rather than its own family. INDEX? FIND Code pattern occurs too often to ignore it, IMHO.

BaronRK

[17:49](#msg5fd25faab6b8f41abb835d06)For my own curiosity, should there be a dedicated thread in Gitter/Red/ for feature requests/bugs?

Oldes

[17:53](#msg5fd2608fc829e14ef287c621)There is even repository for it: https://github.com/red/rep

greggirwin

[18:59](#msg5fd270180697c1210db323d9)https://gitter.im/red/bugs for bug reports here.

[19:00](#msg5fd2703f28a57c581b05d7e1)https://gitter.im/red/red is good for feature requests. It has the most people, so a wider audience.

## Saturday 12nd December, 2020

ne1uno

[18:48](#msg5fd5109203da931ac24a7c17)https://opensource.googleblog.com/2020/12/finding-critical-open-source-projects.html I couldn't find the actual list. geany is on it

Numeross\_\_twitter

[21:03](#msg5fd5302028a57c581b0c8de3)I just saw this, stampler, it has a very interesting workflow https://vimeo.com/392454807

## Sunday 13th December, 2020

greggirwin

[22:38](#msg5fd697cc91e8cb3e8cfc6458)There are some really nice ideas in there.

## Friday 18th December, 2020

loziniak

[20:36](#msg5fdd12e12084ee4b785bf9f9)&gt; Ah, Christmas, a time for technology to disrupt families. ;^)

Not only here, it turns out:

https://safenetforum.org/t/safe-network-dev-update-december-17-2020/33156

"Right up until these last few minutes today we have been pulling all the parts together with the aim of running a hosted public test network. \[...] We are still working on this to get that Christmas present for everyone."

hiiamboris

[21:15](#msg5fdd1c04dbb17f28c587ede6)Cool!

## Tuesday 22nd December, 2020

GiuseppeChillemi

[02:11](#msg5fe155e093af5216fc56a484)What's the worst that can happen to a programmer? Breaking his fingers and I did it! (Not All, I have lost the functionality of 3 of them for a month)

greggirwin

[03:02](#msg5fe161e222f12e449b053d8a)Nooooo! How did you manage that? Did you get caught under @planetsizecpu's wheel barrow? Heal quickly.

GiuseppeChillemi

[11:04](#msg5fe1d2bd93af5216fc57c58f)My finger has been caught by two rollers of a machinery and crunched. I was repairing it and made a mistake putting my hang in a place that I thought it was without moving parts instead there where a "lion" ready to eat my finger! Now I am at the hosplital, waiting to cast it.

toomasv

[11:22](#msg5fe1d6d997312f4b6be2c2ac)The bright side of it is that now you can concentrate on THINKING IT ALL TRHOUGH TWICE! (And maybe you can obtain some fluency in septet calculations.)

greggirwin

[17:49](#msg5fe2319ae7f693041f268b5c)Ouch!

[17:49](#msg5fe231ab63fe03449611d89a)Nobody uses base 7 @toomasv. ;^)

toomasv

[18:06](#msg5fe235ac63fe03449611e429)Then it is especially valuable, unique expertise!

dsunanda

[18:23](#msg5fe23997ac9d8e7463c68079)Western musical notaton is base-7: A to G :)

rebolek

[18:51](#msg5fe2403c69ee7f0422b9c8e2)@dsunanda :-D

greggirwin

[19:39](#msg5fe24b7be7f693041f26d8b1)I stand corrected. Every Good Boy Does Fine.

## Wednesday 23th December, 2020

planetsizecpu

[07:53](#msg5fe2f774c746c6431ccfecec)Well, my wheel barrow is a soft one at all, it crunch gently 😀  
@GiuseppeChillemi I hope you heal soon your finger.

GiuseppeChillemi

[09:21](#msg5fe30c1269ee7f0422bbb430)@toomasv the famous "septet notation" we should make a datatype!

Oldes

[15:22](#msg5fe360abe7f693041f298404)@GiuseppeChillemi you can still play a gittar like Django did! https://youtu.be/PQhTpgicdx4

## Tuesday 29th December, 2020

gltewalt

[00:46](#msg5fea7c54de608143154c1bf7)dont fotget about returning indices

[00:48](#msg5fea7cf469ee7f0422cc52e4)`index? find [a b z b e b] 'b`

[00:50](#msg5fea7d4e4eba353cdf04e4d1)indices?

[00:56](#msg5fea7eb463fe03449624a7e7)This gitter thing gets out of control. I think the community would fo better with one or two IRC channels

[00:56](#msg5fea7ebece40bd3cdb0a6901)Do better

greggirwin

[00:57](#msg5fea7ef369ee7f0422cc5783)All chat systems get out of control. Switching to IRC just means different tradeoffs.

[00:57](#msg5fea7efe69ee7f0422cc57ad)If only it were a solved problem

gltewalt

[01:18](#msg5fea83ea22f12e449b1a026a)What would the tradeoffs be?

[01:20](#msg5fea847322f12e449b1a0384)Anybody here ever have major burnout and not touch programming for months?

greggirwin

[01:26](#msg5fea85ab22f12e449b1a0570)Rather than answer that, because I can't, out of IRC ignorance in practical use, allow me to put the onus on you to say exactly why it would be better. e.g. does it help manage topics better? Integrate better with github? Support file uploads and sample code more naturally? Is it more accessible to new users? Better search? etc.

On burnout, not in general for me. On specific projects, I've had some slogs but it mainly meant I was much less productive because of partial burnout.

gltewalt

[01:37](#msg5fea8843de608143154c3ad9)Imo it manages topics better. Generally any samole code is in a pastebin, link used in the channel.

[01:38](#msg5fea88822084ee4b787a9e19)It's as accessible to new users via web front ends. It allows for transfer of files. Not synched up with github.

[01:38](#msg5fea88aec746c6431ce0e08c)I dont remember about the search

[01:41](#msg5fea89348bb73474695e7cc5)Mobile might be an issue. (Its not grreat here on glitter. Im fumbling via mobile right now.)

greggirwin

[01:41](#msg5fea894f8bb73474695e7cdf)So far we may have semi-parity, so my next question is what makes it better at managing topics?

Mobile is its own set of problems.

gltewalt

[01:42](#msg5fea898bce40bd3cdb0a8218)Chanserv, and bots keep things in order pretty well. And bots can reply to FAQs

[01:46](#msg5fea8a75acd1e516f8bd8710)Hmm.. I might have to talk to rebolek - I think at one point he was in favor of irc, and he might use it currently. I havent used it in a few years

[01:46](#msg5fea8a93ac9d8e7463d9143e)@rebolek

greggirwin

[01:47](#msg5fea8aa58bb73474695e809a)That's...very general. FAQs that come up here are not burdensome...yet.

Well, pfffffff. ;^) If you haven't used it in a few years, why are you recommending it?

[01:49](#msg5fea8b3522f12e449b1a103e)Changing to a new chat system is heavy. We have 800 people in our main room here now, so a new system has to be demonstrably and significantly better to make it worthwhile. All chat systems, I posit, are the Devil. And the Devil you know is (often, in this case) better than the Devil you don't.

OK, they're not the Devil. But, like our time here on Earth, we can make our own heaven or hell of them.

gltewalt

[01:50](#msg5fea8b7cdbb17f28c5a6bdfc)Because I've never seent a programming language sprawl out to 10 plus rooms on IRC. Usually one to three for the languages that have high interest

[01:52](#msg5fea8bd14eba353cdf0508a2)Thats the way it 'was' last time i used it regularly

greggirwin

[01:53](#msg5fea8c2e97312f4b6bf69632)But that's not Gitter's fault, as I just said. If this is Hell it is of our own making. We didn't \*have* to create all these rooms. If we hadn't, each room would have more overlap in topics, wouldn't it? This is about us using tools to make things how we want, or think we want, and whether they allow us to do that.

I haven't used IRC in much longer than you. It just never grabbed me, so I'll take some convincing.

[01:54](#msg5fea8c7097312f4b6bf69690)So when I ask why it's better, it's me trying to find how \*any* tool does this better. "This" being helping us to organize and manage information and communicate more effectively.

gltewalt

[01:57](#msg5fea8d0c69ee7f0422cc780a)Time for me to fire up HexChat tonight and see how irc stands these days, I suppose.

[01:58](#msg5fea8d4a22f12e449b1a150a)There has to be a reason that most open source projects have a presence on freenode. Tradition? Or something else?

[01:59](#msg5fea8d83ce40bd3cdb0a8a34)I imagine REBOL side stepped the whole thing with it's ecosystem

[01:59](#msg5fea8d8ade608143154c45fd)Its

greggirwin

[02:04](#msg5fea8eb169ee7f0422cc7b4d)I think it's the same reason some people still use vim and emacs, and how few try to make software development (by which I mean personal computing) more accessible.

[02:07](#msg5fea8f4663fe03449624cd61)But it's also cultural for some, and simply using tools they're familiar with.

rebolek

[07:09](#msg5fead61097312f4b6bf73dc7)@gltewalt I use IRC daily, I am present on the red-lang channell if anoyone there need helps (but it’s zombies mostly) but I’m not cdonvinced it would make sense to switch to IRC from Gitter. We would need to write some bots to get the functionality we now have here like history and search (even if serach on Gitter sucks, it’s better than no search).

dander

[07:32](#msg5feadb8322f12e449b1ac798)Gitter is in the process of being merged into \[Matrix](https://matrix.org/) anyway, which seems to me to have some similarities with IRC, it's federated and open, lots of clients written for it (mostly just Linux though). The main one seems to be \[Element](https://element.io/), which is an Electron app, so not exactly light-weight, but it is quite snappy, and runs on many platforms. It's the best experience I've had trying to use Gitter on mobile. There doesn't seem to be any way to log in with the gitter credentials on the Matrix side right now, so that's one down side. But I am having positive feelings about this overall.

rebolek

[07:34](#msg5feadbebaa6bb528c37a176b)@dander right, Matrix seems fine and I believe this is a good thing for Gitter.

hiiamboris

[10:00](#msg5feafe38acd1e516f8be966b)I think the main reason 99% of people have abandoned IRC is because you can't read what was written while you were offline. Now add to that the fact that mobile client is almost never online except for some moments, and the fact that IRC often loses messages due to connection problems without any warning and you get the big picture.

[10:03](#msg5feaff072084ee4b787bb4a2)I also think there will be no point in migrating anyplace that doesn't have integration with Github.

pekr

[10:50](#msg5feb09ecc746c6431ce20aa3)+1

rebolek

[11:03](#msg5feb0cf12084ee4b787bd405)You can use bouncer to be able to read offline conversation. But it’s an additional step, of course.

## Wednesday 30th December, 2020

GiuseppeChillemi

[10:04](#msg5fec50b0ac9d8e7463dd3cc4)Another year with Red and all of you is coming to end but every end is the start of something new. I am looking forward for another one together in this exciting road.

## Thursday 31st December, 2020

GiuseppeChillemi

[22:58](#msg5fee57a1ac9d8e7463e235b6)Midnight is coming...

[23:00](#msg5fee580693af5216fc74ac82)2021 has landed in Italy just now!

[23:00](#msg5fee5817acd1e516f8c6b4a6)Happy Reducing 2021!

[23:01](#msg5fee582d2084ee4b7883cddf)The year of Red pandemy?!
