# Archived messages from: [gitter.im/red/docs](/gitter.im/red/docs/) from year: 2022

## Saturday 22nd January, 2022

gltewalt

[01:51](#msg61eb632846529077f59892a5)I saw the `split` comparison doc. Surprised you didn't look at haskell.  
https://hackage.haskell.org/package/split-0.2.3.4/docs/Data-List-Split.html

greggirwin

[16:43](#msg61ec344a46529077f59a032c)We can add it. Just can't cover everything. I, personally, didn't think of Haskell because any time I look at Haskell examples, it seems they don't use words. :^)

[16:45](#msg61ec34c7526fb77b319148f2)Link added.

[16:53](#msg61ec36905ee4df335af9eac3)And when they do use words, they're things like "strategy transformers" and "derived combinators". I'm just a simple man. `splitWhen` is a really nice name though, using "when" for "When you encounter...".

gltewalt:matrix.org

[20:58](#msg61ec70059b470f38977d6f8a)Yeah, I've only made it to understanding about 50% of the egghead stuff, but their utility functions mostly make sense, and that community geeks out with 50 different ways of solving everything.

greggirwin

[22:07](#msg61ec801b46529077f59a9261)&gt; that community geeks out with 50 different ways of solving everything.

They're catching up to us! ;^)

## Sunday 23th January, 2022

GiuseppeChillemi

[21:49](#msg61edcd5646529077f59cd01d)Red is a readable language, you understand what it does since the first reads.

## Monday 24th January, 2022

gltewalt

[00:10](#msg61edee8146529077f59d099e)Depends on how you write.

meijeru

[12:35](#msg61ee9d2646529077f59e4758)@dockimbel @greggirwin  
In the most recent blog post I read (to my satisfaction) the planned work item:  
Red Language Specification (Principles, Core Language, Evaluation Rules, Datatype Specs (including literal forms), Action/Native specs, Modules spec.  
Let me reconfirm that the work I have put into the specification document \[here](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc) is fully available for use in progressing this work item, in whatever way is thought appropriate.

greggirwin

[20:44](#msg61ef0fa5bfe2f54b2e34d22e)@meijeru absolutely. I imagine that will be the foundation we work from. We want to a) make it clear what parts of Red have a hard, unchanging (as much as we can), spec; b) firmer style guidelines for things like custom datatypes (not including new lexical forms) and how to make sure contributions (including those from the team), align with the big design picture. Finally, c) I'd love to be able to treat specs as data where we can, for more interactive tools, including analysis for new work. e.g. if we have specs we can apply as rules, how do we do that?

In any case, your work will be an important aspect, and we'll certainly reach out to leverage your knowledge and expertise.

## Saturday 19th February, 2022

meijeru

[12:18](#msg6210e00b257a357825f071d4)I just (re-)discovered https://w.red-lang.org/en/. What is the status of this doc-site now?

Red-Beginner

[17:51](#msg62112e0699d94f5f0c13446d)@meijeru It looks like a fan site. Probably it copied from the original documents.

greggirwin

[18:53](#msg62113c9cd1b64840db2cd291)That was @x8x's work, but doesn't seem to have been kept up to date.

meijeru

[21:04](#msg62115b45d1b64840db2d0bfe) It seems to be derived from https://github.com/red/docs/tree/master/en/, which I hope IS up-to-date. Maybe @x8x can tell us what the status is.

## Sunday 20th February, 2022

greggirwin

[05:04](#msg6211cbe7f43b6d783fc5ab42)Yes, I just don't know if it's kept up via automation.

## Tuesday 4th October, 2022

dsunanda

[14:52](#msg633c48b4133b6458ca0f7dec)I do all my Red development under Windows. But now I want to compile/encap a GUI app, and then run it on Linux (Fedora initially, probably).

Is there a handy, easy, how-to type guide for such things? (All I can find is how to install a dev environment under Linux - not want I want; just want a runtime environment).

Thanks!

rebolek

[15:16](#msg633c4e60cb3b243528fd66a7)just add `-t Linux` when compiling

[15:17](#msg633c4e762a06f4566b1ebea0)`-t` means `target`

dsunanda

[18:50](#msg633c807ea72aed016619a309)Thanks .... And then just copy over the executable? No libraries need? That simple!?

greggirwin

[18:53](#msg633c810ca72aed016619a450)Be sure to set the executable bit for the binary on the target system.

dsunanda

[18:53](#msg633c813f683a5c58c71da09a)Thanks. So that simple +1 bit :)

greggirwin

[18:54](#msg633c81560b8c9518d7d97622)If you don't add any external dependencies, that's the magic of Red. It does still need 32-bit support libs from the OS, if you're Linux doesn't include them you'll need to install those.

## Tuesday 18th October, 2022

gltewalt:matrix.org

[15:53](#msg634ecbf2cf41c67a5cb8c763)https://roadmap.sh/

GiuseppeChillemi

[22:02](#msg634f2284f00b697fec4a7254)Nice link

## Tuesday 29th November, 2022

loziniak

[12:30](#msg6385fb70326f06602c6e30ee)Hi! I added links to GitHub repo in Red-By-Example . Can someone from the team publish the site?  
https://github.com/red-by-example/red-by-example/commit/a95eeac11157043fdc1398ea60f6eafc17702213

greggirwin

[19:14](#msg63865a0e326f06602c6ef3a6)I don't remember who is doing that job now.

loziniak

[21:58](#msg638680814fee72663c9a8442)At the time of transitioning from Arie and Mike you \[↑wrote↑](https://gitter.im/red/docs?at=5e5303dcdafa3029f64ca385) about @x8x .

greggirwin

[22:39](#msg63868a31473cf966480af1c2)OK, he's not around much these days, so if he doesn't respond we'll have to figure out a new plan.

## Saturday 10th December, 2022

mikeparr

[09:19](#msg63944f388bdea01368ac1a63)Let me know if I can help.

## Monday 12nd December, 2022

greggirwin

[03:48](#msg6396a4a1b9b68753418e1a23)Will do. Thanks.
