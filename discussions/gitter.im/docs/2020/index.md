# Archived messages from: [gitter.im/red/docs](/gitter.im/red/docs/) from year: 2020

## Wednesday 1st January, 2020

vazub

[17:53](#msg5e0cdc8107a1a67d1d959ab4)By the way, since you touched the issue of licenses. I have adopted myself and strongly recommend anyone interested to consider using Blue Oak Model License - https://blueoakcouncil.org/2019/03/06/model.html. This is a modern permissive license in vein of BSD, but with an explicit patent grant and, even more important - with its contents written in HUMAN language, instead of typical "legalese". However, it is written by professional lawyers, so the risk of "new and untested" stigma can be remedied to some extent here. And additional fun reason - it is intended to simplify licensing and improve legibility for all parties involved, which seems to align quite smoothly with the reported Red's goal of "REDucing complexity" :)

## Thursday 2nd January, 2020

greggirwin

[01:43](#msg5e0d4ac30c3aeb107d8db138)Looks interesting. Not being a lawyer, one thing (twice) is not intuitive to my layman's mind. The phrase "would otherwise infringe" is legalese to me. Why not "does not infringe"?

Certainly it's clearer than the big final para in BSD3, but it still has 8 sections. Each has a clear purpose, which is nice.

vazub

[07:14](#msg5e0d986d8ba16b107c0b0cee)@greggirwin  
&gt; Looks interesting. Not being a lawyer, one thing (twice) is not intuitive to my layman's mind. The phrase "would otherwise infringe" is legalese to me. Why not "does not infringe"?

In case of your suggested wording : "(do everything) ...that does not infringe... (copyright/patent)", makes little sense, because you don't need to give permission to do something that doesn't require such permission in the first place. On the other hand, "(do everything) ...that would otherwise infringe... (copyright/patent)" refers to all applicable effects on the covered items that do require preliminary permission in order to comply. "Otherwise" here means "in case there is no explicit permission/license provided". "Would infringe" refers to the fact, that according Copyright Law, you are violating the copyright by default, if there is no provision by the copyright holder to allow you to do something.

mikeparr

[19:04](#msg5e0e3ea0833c373f4d9b0740)Hello all, what do you wish me to do?

greggirwin

[20:21](#msg5e0e50e7eaa2cd096fe2ee5a)Hey @mikeparr!

1\) Confirm that BSD3 license is OK, or let us know which you prefer if it's not. (We can keep blueoak in mind for the future)  
2\) I'll need the domain name(s) and transfer auth code for each we want the Foundation to take over registration for.  
3\) I think @loziniak has all the sources transferred, so new hosting can be handled after that, and just answering questions we may have in getting things up and running.

Please confirm @loziniak.

## Friday 3th January, 2020

loziniak

[09:56](#msg5e0f0fc5316c1473270a1f32)Confirmed. Most important is the license (pt. 1) to allow any modifications. Temporarily it can be hosted by GitHub Pages.  
pt. 3 – I have all the sources, also uploaded it to GitHub: https://github.com/redbyexample/red-by-example

[10:52](#msg5e0f1cfb016ca663c181f53d)temporary (?) red-by-example home: https://redbyexample.github.io/

greggirwin

[16:14](#msg5e0f684e4e9ea12051ab1276)Excellent, thanks. :+1:

vazub

[17:02](#msg5e0f73be4e9ea12051ab5f7e)Does anyone have permissions to upload images to rosettacode.org? I've implemented a task for drawing Voronoi diagrams there (https://rosettacode.org/wiki/Voronoi\_diagram#Red), but can not upload the output image :(

hiiamboris

[18:18](#msg5e0f8588f6ee9c3e8efe6937)@vazub

```
>> random white
== 160.36.66
>> random 500x500
== 151x113
```

vazub

[18:29](#msg5e0f8813be6bab58cd69fbdc)@hiiamboris updated! thanks)

hiiamboris

[18:31](#msg5e0f887c316c1473270da1ca):+1:

## Monday 6th January, 2020

tdorzhi

[13:38](#msg5e133838016ca663c19d3fdd)hello

[13:39](#msg5e133879cbd2c97eff9cea0b)anyone tried to get red + vscode working on NixOS? what I have not working is LSP and compilation

[13:40](#msg5e1338c8c23234403cdac574)I tried with red 0.6.3 (from nix packages) and red daily build (05-jan-2020) to no avail

hiiamboris

[13:48](#msg5e133a9b14328863c01e1f4c)Just curious, how do you run nightly builds on NixOS?

tdorzhi

[13:48](#msg5e133abf1c3a592052decc16)downloaded from website

[13:49](#msg5e133acf865af87363caae1a)there ain't daily builds in nix packages :(

hiiamboris

[14:06](#msg5e133ec8a769bf30fd48c21e)Hmm. AFAIK NixOS does not allow you to run normal ELF executables without patching/packaging/virtualization. I wonder what's your method.

tdorzhi

[14:10](#msg5e133fdb1c3a592052deebb2)Oh I understand the question now, and no, nightly build doesn't run, bash says that executable of red not found, although it's right there...

hiiamboris

[14:11](#msg5e134007a769bf30fd48c6e8)I see. Thanks

[14:12](#msg5e13406bc23234403cdaf6a8)Personally I haven't invested enough time into the problem to deal with it. But it got me curious what were the developers of NixOS thinking, making so much trouble out of nowhere ;)

[14:15](#msg5e13411bc23234403cdafa3b)Ask in https://gitter.im/red/red maybe there are some NixOS guys around there.

tdorzhi

[14:16](#msg5e134152809bc77efefac31f)@hiiamboris thanks, Boris, will do

hiiamboris

[14:16](#msg5e13415af6ee9c3e8e16f86b):+1:

## Wednesday 8th January, 2020

mikeparr

[09:02](#msg5e159aad810a1042cb84984e)@greggirwin sorry for delay re RBE site stuff - I'm discussing with Arie now.

loziniak

[10:17](#msg5e15ac3fbdcaea1891187a75)Another RBE news – I've got \*red-by-example* username released, so we can use it for a GitHub organisation.

[10:46](#msg5e15b32155975518903fec8e)So now we have: https://github.com/red-by-example and https://red-by-example.github.io/

greggirwin

[17:07](#msg5e160c509c13050f1f9758ad)Thanks to both of you!

dander

[18:12](#msg5e161ba9e0f13b70c9537b88)That's great! So presumably, the red-by-example.org domain \[could also be used for the GitHub host](https://help.github.com/en/github/working-with-github-pages/configuring-a-custom-domain-for-your-github-pages-site), correct?

endo64

[20:14](#msg5e16383209534142ca31ac30)@dander Yes, it should be.

## Sunday 12nd January, 2020

GiuseppeChillemi

[23:59](#msg5e1bb2ee65540a529a0789a8)I propose to add an entry the \[RED/REBOL differences wiki page](https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol) based on this:  
https://gitter.im/red/help?at=5e1b3974dbacf55b3df4d4c4

It should be good as point 4 but I do know the correct terms to write it. I would express such idea:

"In REBOL a function could be passed as value if you precede the argument name with `:`. In RED this operation passes the unevaluated word. To pass a function as value to another function, precede it with `:` when calling a function as `:print`"

Do you think its is generally correct ? If yes, I would modify the wiki and later someone could extend/revise it.

## Monday 13th January, 2020

greggirwin

[04:04](#msg5e1bec630e65654fa0d3e865)I think there are notes somewhere that detail lit-word/get-word params, written by @9214 or @hiiamboris perhaps.

GiuseppeChillemi

[10:53](#msg5e1c4c160aba1f0d802747cd)@greggirwin So it's not a hallucination, I remember these notes to from Vladimir, but I can't find them.

dockimbel

[15:57](#msg5e1c936b0aba1f0d80292ad1)@GiuseppeChillemi As @hiiamboris told you already in red/help, it's a difference between Rebol2 and Rebol3. Red just follows Rebol3 on that. Moreover, this behavior might be changed in the future. Also, please learn to spell "Red" language name properly (it's not "RED").

GiuseppeChillemi

[16:34](#msg5e1c9c19a859c14fa1dc2102)@dockimbel It's a difference it is worth documenting. We could write it could be subject to change. As for RED - &gt; Red, I will try to get the new habit. I am still writing REBOL, old behavior is difficult to change but not impossible.

dockimbel

[16:49](#msg5e1c9fa28d9f831bc520dec5)https://github.com/red/red/wiki/\[DOC]-Guru-Meditations#literal-arguments-and-get-arguments

GiuseppeChillemi

[17:30](#msg5e1ca950c6897e1bc6282f03)@dockimbel Thanks, we should add a link to the Red/Rebol differences wiki entry or copy the whole text. I will do it after 24h from the current message if no one will reply otherwise.

dockimbel

[18:07](#msg5e1cb1fb8d9f831bc5215891)@greggirwin I leave that matter to you to deal with. :-)

GiuseppeChillemi

[18:38](#msg5e1cb932a859c14fa1dce654)Poor Gregg !

hiiamboris

[22:48](#msg5e1cf3a8dbacf55b3d00e2fd)Personally I see that Rebol/Red differences page as a sandbox where pioneers can leave a mark and feel happy about it. The point of it in raising community spirit by letting some involvement. In reality there are so many differences between R2 and R3, R3 and Red, R2 and Red, that there will never be a document that covers them all. Why even care what's written on that page? ;)

greggirwin

[22:56](#msg5e1cf598b990d50d81aa29ad)It is mainly for Rebolers who may trip over the same common issues.

## Tuesday 14th January, 2020

GiuseppeChillemi

[09:33](#msg5e1d8af56be93b6b36dca869)Yes Gregg, I am working on code which runs un both Red and Rebol and having those differences is important.

dockimbel

[11:22](#msg5e1da45a1cf5106b351b4e21)@hiiamboris  
&gt; Why even care what's written on that page? ;)

It's part of the red/red repo, so we do care about what's there because ultimately, we are the one responsible for that content (both morally and legally). If the info there is not to be moderated by us, we should just close it and let others mirror it on their own repo, where they can happily fill it with inaccurate or useless info. Another option is to restrict the wiki write access to repo members only.

## Friday 17th January, 2020

hiiamboris

[20:16](#msg5e221616ad195a0f6726dde3)`view [origin 100x50 text red "test"]`  
!\[](https://i.gyazo.com/75b5a27826299462b844ed556e6e8c23.png)  
I've nothing against symmetry ;) But is this documented anywhere that `origin` also sets bottom-right padding?

greggirwin

[21:17](#msg5e22246a3ea53f0f663fdc30)That should be added to docs, as it is by design. Though `origin` could do what the name says, and `margin` could be a new word that provides symmetry.

## Saturday 18th January, 2020

henrikmk

[12:33](#msg5e22fb005cd79646606f9d95)margin should indeed provide the symmetry, not origin.

dockimbel

[17:19](#msg5e233e1f000f4978991ba803)@hiiamboris `origin` applies to the bottom-right window side too, as it does in R2/View (see also #1981). I agree with the `margin` proposal.

## Thursday 23th January, 2020

meijeru

[17:02](#msg5e29d1b0a9b30639e2d3413e)I notice (for once?) that the documentation is ahead of the implementation: tristate check boxes await review by @dockimbel. Would be nice if this received go-ahead.

[17:17](#msg5e29d513cd53a80aac11a7c0)I also notice the pull request introducing the `reactor` and `deep-reactor` functions. Their sources lack doc-strings, so far. Something to remedy? compare `object`.

greggirwin

[17:52](#msg5e29dd46da04a624f46dccf4):+1:

dockimbel

[18:04](#msg5e29e0153482927279163712)The `reactor` and `deep-reactor` functions were enabled only recently. The examples in the Reactivity doc should not have been changed. The `make reactor! ...` shows that we are building just an object, while `reactor ...` makes it a black box... Moreover, I am not sure to keep those functions, so documenting them was premature. Last thing, there is a 0.6.5 branch for new changes, as the current branch is there for documenting the last release (0.6.4)...

greggirwin

[18:13](#msg5e29e24df85dba0aab010de4)We can undo doc updates as needed then.

dockimbel

[18:41](#msg5e29e8c1e177666195b77b5e)Just keep in mind that we have several translators that are tracking the changes on master branch, to update their translation. So be sure about what goes into master.

greggirwin

[18:43](#msg5e29e96cf85dba0aab013db5)Yes, balanced with things piling up or not knowing what should be held back from merging.

dockimbel

[18:49](#msg5e29eac2183449313bc6439c)Commiting in 0.6.5 branch is safer, as only master branch seems to be tracked by the translators.

## Monday 10th February, 2020

GiuseppeChillemi

[18:07](#msg5e419bff340a8019bbb3c27f)Another difference to document:

Rebol

```
>> reduce first words-of make object! [b: 22]
== b
```

Red

```
>> reduce first words-of make object! [b: 22]
== 22
```

It seems `first` is returning an unbounded word in Rebol. I prefer Red way of doing things.

endo64

[20:03](#msg5e41b723ecfa4461c050d2a9)It's not unbounded on R2 actually:

```
R2> reduce reduce [first words-of make object! [b: 22]]
== [22]
```

GiuseppeChillemi

[20:51](#msg5e41c26fc900d747abf854ce)First returns the word which should be bound, reduce should return the contained value. I do not understand the needing for additional block and the double reduce.

greggirwin

[20:58](#msg5e41c400c900d747abf857a9)This is the tricky part of all language details not being documented as to their expected behavior. e.g., `reduce` takes any value, but in R2's case, we don't know how it treats them all. Since Red can also take any type, we may want to tweak the doc string.

GiuseppeChillemi

[21:05](#msg5e41c591c900d747abf85bc9)I'll do further tests to understand more.

hiiamboris

[21:39](#msg5e41cd813716b919ba0daa15)Rebol recently tripped me on this thing ☻:

```
>> a: quote 'x
== 'x
>> type? a
== word!
```

[21:39](#msg5e41cd8f19597421f3bf2efe)Very dangerous language compared to Red ;)

## Tuesday 11st February, 2020

endo64

[11:39](#msg5e429285b612cc7bb15dc720)Also:

```
; R2
a: quote 'x
type? get first [a]
; == lit-word!
 reduce [a]
; == [x]
```

```
; Red
type? get first [a]
; == lit-word!
reduce [a]
; == ['x]
```

GiuseppeChillemi

[19:56](#msg5e4306fb37545d247d32a01e)It should be a bug and not a feature

## Saturday 22nd February, 2020

hiiamboris

[15:28](#msg5e5148a1dafa3029f6483f44)

```
>> ? mold
...
     /flat        => TBD: Exclude all indentation.
...
```

Should it still be marked as TBD?

greggirwin

[16:56](#msg5e515d40ff00c664eedc56b2)Good catch. Seems to work for blocks and maps.

## Sunday 23th February, 2020

greggirwin

[22:59](#msg5e5303dcdafa3029f64ca385)red-by-example.org is now hosted by the Red Foundation. License updates being worked out now.

Thanks to ArieVW and @mikeparr for their efforts, and to @loziniak and @x8x for the technical transition. The source is now available \[here](https://github.com/red-by-example/red-by-example), so others can contribute.

## Monday 24th February, 2020

loziniak

[09:02](#msg5e5391118b2d4664ef20b477)Does it mean that \*red-by-example.github.io* can be taken down? I think it's not good with G\\\*\\\*\\\*le having same content in two places.

meijeru

[11:22](#msg5e53b20b1be0ff01d5a61b70)That site is already unreachable (Error 404).

hiiamboris

[12:10](#msg5e53bd2f3e6ef64161701292)both sites work for me

meijeru

[13:07](#msg5e53caadfa9f20553b4a2209)I originally had redbyexample without hyphens. That one does indeed not exist (anymore?). However, the one with hyphens on Github says:

```
Your connection is not private
Attackers might be trying to steal your information from www.red-by-example.github.io (for example, passwords, messages, or credit cards).
```

[13:08](#msg5e53cac83e6ef64161704744)So, the one on .org is preferable.

hiiamboris

[13:25](#msg5e53ceae101adb4160c2cec6)`www.red-by-example.github.io` doesn't open for me either. No www/ folder on that site it seems

greggirwin

[23:27](#msg5e545bf53e6ef64161722d88)red-by-example.github.io comes up for me, and via https so no warning. We can, and probably should, take it down though, so there's only one.

## Tuesday 25th February, 2020

loziniak

[00:22](#msg5e5468ce1ec15e02119bd7e3)Ok, just took it down. Now it's 404 no matter what :-)

greggirwin

[00:25](#msg5e54697fd7bb4e179c9cfb85)There can be only one! :^)

## Wednesday 4th March, 2020

rebolek

[09:38](#msg5e5f770d7fef7f2e899d5859)I believe that Linux info on https://www.red-lang.org/p/download.html should be switched.

Currently, it shows instruction for Debian 7/Ubuntu 13.10 first and info for recent distros later. However, people are inattentive and will blindly copy what they see as a first instruction (source: my friend who wants to try Red did this and was pissed that libcurl3 uninstalled libcurl4 from his system).

x8x

[09:49](#msg5e5f79c6b04b464854484d88)ok inverted :-)

rebolek

[09:51](#msg5e5f7a19b873303e277b0add)Thanks :)

## Thursday 5th March, 2020

pekr

[18:06](#msg5e613fb0cb91b5224f1250e4)b bbb bb b bb b bb bb b b b bb b ; b b b ; b b b b bb b b b b bb b b bbbb b bbb ; b b b b b ; b b bb ; ; b bb bb ;bb ccbbbbbb cbbccbbcbbbcbbb cvbcbbbbbbbbbvbbcbbcb;bbcb;bbbbbbcbcbbbbbbbbbbb ccbbbbbbcbbbcb bbbcb cbcbc bb; b

[18:09](#msg5e61404290a82958240931cb)oh gee, pbone in the car and stuff over the display, sorry ...

Respectech

[18:20](#msg5e6142ea376d882250d3595b)I thought you were making poetry or rapping...

pekr

[19:08](#msg5e614e18cb91b5224f127847)Maybe it is a Brainfuck language code, I have to check :-)

endo64

[23:27](#msg5e618ada90a82958240a0bc6)I thought it's an ASCII art :)

GiuseppeChillemi

[23:29](#msg5e618b47ff6f6d2e888a1e17)For a moment I have though the output of @toomasv :point\_up: \[script](https://gitter.im/red/sandbox?at=5e6167b5cb91b5224f12c767) and Petr "art" were related.

## Monday 16th March, 2020

9214

[10:22](#msg5e6f534c65758a0f97f70b2c)@Tovim I've deleted your wiki page stub entry on `to` vs. `make`, as we already have one with the \[same name](https://github.com/red/red/wiki/%5BDOC%5D-%60to%60-vs-%60make%60) and filled-in content. You can add changes to an existing page if you want to.

## Monday 23th March, 2020

GiuseppeChillemi

[01:57](#msg5e7817793d7dd7196bd40132)Which markup language is the one used for the wiki?

greggirwin

[01:58](#msg5e7817ad9cc9d03f279e4f7b)Markdown.

GiuseppeChillemi

[02:04](#msg5e78193d677c311b0ab5d7e5)@greggirwin Thanks

## Sunday 29th March, 2020

GiuseppeChillemi

[22:33](#msg5e81222d922e6e03310f751f)How do you edit this?

[22:33](#msg5e812231c1880d2c9b4c50ad)https://doc.red-lang.org/en/view.html

[22:34](#msg5e8122626eb8380abce4934f)I mean, is the source somewhere on github?

## Monday 30th March, 2020

greggirwin

[04:31](#msg5e8176062725b83acd535af5)https://github.com/red/docs

GiuseppeChillemi

[05:27](#msg5e818359a5702b1caa7b2db1)So we use markdown for the wiki and ascidoc for this documentation?

endo64

[17:49](#msg5e82311f8b14736a7735d868)Yes, correct.  
Additionally you can freely edit the wiki pages on red/red repo, but you need to fork, edit locally (or in your fork) then make a pull/merge request to the main repo from your fork, if PR accepted only then your edits become part of the documentation (sorry for redundant info if you already know these)

GiuseppeChillemi

[20:10](#msg5e825250bd09254f83e89a36)@endo64 I am trying to understand how the whole process. I need to know if wiki pages could be seen as repository files and be forked, modified, merged and also if they can be uploaded remotely.

[20:11](#msg5e8252632ba6e313142fec10)\*how the whole process works

endo64

[21:10](#msg5e8260410df831244c295c15)Wiki pages is a repo, you can clone it with https://github.com/red/red.wiki.git which is different than the main repo (https://github.com/red/red.git).  
You can create a branch, edit locally, merge it to master and push to the repo, since it is available to publicly editable, no need to fork &amp; make PRs.

[21:12](#msg5e8260c345eca63245f41740)But working locally on wiki pages then push is harder than editing online, because someone else may updates, then you need to take those updates solve the conflict (if any), merge locally and push.

[21:13](#msg5e8261059d63a8535c5cc65e)Here are some (not much) help: https://help.github.com/en/github/building-a-strong-community/adding-or-editing-wiki-pages#adding-or-editing-wiki-pages-locally

## Wednesday 1st April, 2020

meijeru

[17:15](#msg5e84cc3f8bb4966bc49c6e58)Is it correct to say that `stats` is so far undocumented? And is `stats` given information \_only_ on memory usage?

## Thursday 2nd April, 2020

greggirwin

[18:51](#msg5e86342f03e7ae30edc45447)Yes.

## Tuesday 7th April, 2020

TheHowdy\_gitlab

[08:56](#msg5e8c403cf87c5956a240dbbb)Is it just me, or why does docs.red-lang.org redirect to doc.red-lang.org, only to give me a server not found?

hiiamboris

[10:03](#msg5e8c4fd53a85536c43133d5b)just you

TheHowdy\_gitlab

[11:02](#msg5e8c5dc2cc370f0b07caa24f)@hiiamboris weird. I can access it using my mobile traffic, but not using my lan.

hiiamboris

[11:12](#msg5e8c60229316f34b8d8693d3)could be DPI blocking you ;)

## Friday 24th April, 2020

loziniak

[09:01](#msg5ea2aadbf6a6e5397972d592)Hi, on \[ref! vs issue! wiki page](https://github.com/red/red/wiki/%5BDOC%5D-issue%21-vs.-ref%21) in summary table, one thing is not clear to me – that "Unique values peruse the same symbol identifier" in `issue!`. I thought it's one ID per value.

## Sunday 26th April, 2020

hiiamboris

[19:05](#msg5ea5db925d245d59f31cbfc5)Do we have some kind of equality rules matrix for all datatypes somewhere? `==/=?` are somewhat trivial, but I'm interested in `=`.

GiuseppeChillemi

[19:10](#msg5ea5dcb1501f8f72a5074352)@hiiamboris Very interesting topic. I have in my (long) to-do list this and other tables.

greggirwin

[19:19](#msg5ea5ded81eb8bd3978f8a04b)@hiiamboris  
\- https://github.com/red/red/wiki/%5BDOC%5D-Comparison-of-aggregate-values-(block!-vector!-object!-hash!-map!)  
\- https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#comparison-of-values

I thought there was a matrix somewhere, but can't find it right now.

[19:21](#msg5ea5df2e3ea9b172a4900b95)@meijeru has notes in his spec about comparison rules.

hiiamboris

[19:22](#msg5ea5df77a634f42f7a04f0fd)First link is a comparison in the sense of "what's best for my case" though ;)

[19:31](#msg5ea5e1a594ac2758e30d135f)Rudolf has gathered some good info :+1:. I didn't know about this for example:

```
>> 100% = 0:0:1
== true
```

greggirwin

[19:40](#msg5ea5e3c41eb8bd3978f8ad9e)True on aggregate comparison. Sorry for the false positive.

## Tuesday 28th April, 2020

GiuseppeChillemi

[21:49](#msg5ea8a50514b48f069898aff9)I have found another difference worth documenting between Red and Rebol: the former is able to convert an object to block, the latter isn't. Do you confirm this?

Rebol

```
>> probe to-block context [a: 1 b: 2]
[make object! [
        a: 1
        b: 2
    ]]
== [make object! [
        a: 1
        b: 2
    ]]
>>
```

Red

```
>> probe to-block context [a: 1 b: 2]
[a: 1 b: 2]
== [a: 1 b: 2]
```

Could I enter it writing exactly:  
Red `to-block` is able to convert objects but Rebol isn't  
?

dsunanda

[22:05](#msg5ea8a8a23d58de7a38e12581)Rebol can do it - but a different way:

```
probe third context [a: 1 b: 2]
[a: 1 b: 2]
```

GiuseppeChillemi

[22:14](#msg5ea8aac2347bd6163041ed86)Thanks, so it's worth documenting it but in a different way.

Oldes

[22:18](#msg5ea8abc8b6dd2306979274c7)@GiuseppeChillemi have you noticed, that there is multiple Rebol versions? In Rebol3 it is possible:

```
>> to-block object [a: 1 b: 2]
== [
    a: 1
    b: 2
]
```

[22:20](#msg5ea8ac2f7975db7ebfd0947b)also:

```
>> body-of object [a: 1 b: 2]
== [
    a: 1
    b: 2
]
```

GiuseppeChillemi

[22:55](#msg5ea8b463b6dd230697928812)Yes, I have noticed. It's Rebol2 which can't handle object to do in to-block

## Wednesday 29th April, 2020

meijeru

[08:25](#msg5ea939f1d898fe7a37543258)Inspired by this I tried `to-path and it worked (should not, in my opinion). I have raised issue #4420 for this. GiuseppeChillemi 09:53Page not found! meijeru 10:10It is an issue in red/red repository, not in red/docs, so the link that github makes for free is not useful. Just go to the main repository. hiiamboris 13:11Found an undocumented feature: https://github.com/red/red/issues/4418#issuecomment-621183984 continue works on W7 for me, stop and done don't. Although View docs say: ![](https://i.gyazo.com/d2d26e6be76ca9402fea76ed145e3448.png) 13:12Is this something unofficial/undecided or just missing in documentation? Monday 4th May, 2020 dockimbel 12:12@hiiamboris Changed several times, the version in the code is the right one for now. Still needs some extra work. toomasv 12:19done has worked for me on W10. hiiamboris 12:24Oh. You're right, done is working too. modal just hides the window after closing so probably didn't notice it was still in the taskbar :D Tuesday 5th May, 2020 meijeru 08:16On ref! documentation: Doc just re-allowed / in ref! literals (commit 9fc4896) so this needs to be updated, I think. greggirwin 16:08Yes. Tuesday 19th May, 2020 loziniak 14:33Hi! Is it just me or the the official Red docs are down? ping doc.red-lang.org ping: doc.red-lang.org: Temporary failure in name resolution hiiamboris 14:38just you Monday 25th May, 2020 GiuseppeChillemi 20:17Any help brings you to the wrong conclusion that if a value is not none or false than it is true (logic). >> help any USAGE: ANY conds DESCRIPTION: Evaluates, returning at the first that is true. ANY is a native! value. ARGUMENTS: conds [block!] >> any [false 22 33] == 22 ...*Evaluates, returning at the first that is* **true**. But in Redbol logic: >> true = 22 == false >> I would suggest changing this help text. greggirwin 21:53Agreed. We can use the text from R2 unless someone has a better suggestion. > Evaluates and returns the first value that is not FALSE or NONE. Please file a ticket for it @GiuseppeChillemi. 21:53And include all in there. endo64 22:56any : Evaluates and returns the first value that is not FALSE or NONE, (returns) NONE otherwise all : Evaluates and returns at the first FALSE or NONE, (returns the) last value otherwise And better to note (did [already](https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol#all) ) >> all [] == none ; Red == true ; R2 & R3 greggirwin 23:15Man, the wording is a challenge here. any : Evaluates and returns the first value that is not FALSE or NONE; otherwise NONE all : Evaluates and returns at the first FALSE or NONE; otherwise returns the last value any : Evaluates and returns either NONE or the first value that is not FALSE or NONE all : Evaluates and returns either NONE, at the first FALSE or NONE, or the last value Beyond this "truthy" starts creeping in as a shortcut. :^\ Tuesday 26th May, 2020 endo64 00:27 any : Evaluates and returns the first non-falsy value (or NONE) all : Evaluates and returns the last truthy value (or NONE) I don't know if falsy and truthy are real words. We can remove or NONE parts it is easy to guess it will return none if the explanation doesn't meet. greggirwin 01:06"returns at" is a little ambiguous, given at and series values. It's not terrible though, even the R2 strings. As you say, they aren't complex funcs and a quick test is a good learning exercise. 01:08I also thought to remove "Shortcut AND/OR", even though help can use them. Any/all will get buried in all the other results. GiuseppeChillemi 04:23done: https://github.com/red/red/issues/4469 Thursday 4th June, 2020 hiiamboris 09:36![](https://i.gyazo.com/4d490a5366e8ec8bf1a9106de13329d1.png) 09:38Later I had to add a certificate exception, which it issued to gitbooks, not for red-lang.org ;) toomasv 09:39[![image.png](https://files.gitter.im/red/docs/WDA5/thumb/image.png)](https://files.gitter.im/red/docs/WDA5/image.png) hiiamboris 09:40Yeah, similar thing 09:41But for some small time I couldn't even ping it - no IP address for the DNS name toomasv 09:45Yeah, it has troubled me few days already. Curiously, in Chrome it works ok. loziniak 11:41On [← doc.red-lang.org](https://gitter.im/red/help?at=5ed3c57e2c49c45f5ab39a5e) – I also cannot see it. Already mentioned that [↑ some time ago](https://gitter.im/red/docs?at=5ec3ee35940fa238d60136ba). @nedzadarek meijeru 12:38Same here. greggirwin 13:11@x8x, can you look into this? hiiamboris 14:37Yeah, died again :/ 14:37https://downforeveryoneorjustme.com/doc.red-lang.org x8x 14:51From what i see, [GitBook](https://www.gitbook.com/) has issues resolving in some areas. 15:24Google is their registrar, CloudFlare is their name server, which is pretty solid. They may be playing with configs, 10 minutes ago no NS records and a couple of origin servers where unreachable by IP. Now all seams to work from here. hiiamboris 15:33There was another mirror of Red docs on some site, but can anyone recall the address? 15:34Found 15:34https://red-language-documentation.readthedocs.io/en/latest/ Saturday 6th June, 2020 Oldes 21:52@hiiamboris I see that the docs in your link are using HLJS for color code (with wrong language)... here is my old HLJS for Red available: 21:52https://rebol.desajn.net/highlight/demo/ 21:53I have no time to push it into oficial repo... and maybe it would require some more work, if someone want to volunteer. Sunday 7th June, 2020 hiiamboris 08:02I don't even know if that mirror is maintained at all.. Monday 8th June, 2020 nedzadarek 13:45> On [← doc.red-lang.org](https://gitter.im/red/help?at=5ed3c57e2c49c45f5ab39a5e) – I also cannot see it. Already mentioned that [↑ some time ago](https://gitter.im/red/docs?at=5ec3ee35940fa238d60136ba). @nedzadarek @loziniak now it works. Monday 22nd June, 2020 ALANVF 13:47hey uh what's happening here? https://redlang.gitbook.io/red/ 13:48[![image.png](https://files.gitter.im/572d874bc43b8c6019719620/QPcK/thumb/image.png)](https://files.gitter.im/572d874bc43b8c6019719620/QPcK/image.png) hiiamboris 14:24https://doc.red-lang.org/docs/en/ 14:24Looks like someone's working on the docs! Nice. greggirwin 17:50Gitbook is problematic for us at times. We are indeed working on another solution. Friday 26th June, 2020 meijeru 10:13I have added a reference to the (very helpful) Lexer documentation in my spec document, notwithstanding the fact that the Gitbook is for the moment out of order... Actually, I am using the docs source directly [here](https://github.com/red/docs/blob/master/en/SUMMARY.adoc). I can't say the Gitbook is a definite improvement over just reading the .adoc files on Github! hiiamboris 10:32they plan to move to Github pages 10:35let's hope MS doesn't screw that up, as they seem to went nuts lately greggirwin 18:31@x8x's site may be even better. It has my vote over github pages. https://w.red-lang.org/docs hiiamboris 19:02I get a not allowed message only from this link greggirwin 19:43Try https://w.red-lang.org/docs/en/ 19:44Also, wear a carnation in your lapel and use the secret handshake. hiiamboris 19:44:D 19:45This one loads but does not react to attempts to expand any categories to the left. greggirwin 19:46After refreshing, I have the same problem. He must be working on it. 19:46Trust me, it's *amazing*. ;^) hiiamboris 19:46Oookay ;) TimeSlip 21:28@greggirwin That looks like a winner so far. Friday 10th July, 2020 meijeru 19:48I noticed that [DOC]-REBOL-Core-Users-Guide-__-A-walkthrough-with-Red is being updated. Point 9. says that money! does not exist in Red; it does now, so that point can be deleted. hiiamboris 19:56Vladimir fixed it before you reported ;) Saturday 11st July, 2020 toomasv 09:55Updated [types hierarchy pic](https://github.com/toomasv/red-type-hierarchy/blob/master/Red%20type%20hierarchy3.pdf) with money!, ref! and port!. 09:56[![Red type hierarchy3.png](https://files.gitter.im/572d874bc43b8c6019719620/hyus/thumb/Red-type-hierarchy3.jpg)](https://files.gitter.im/572d874bc43b8c6019719620/hyus/Red-type-hierarchy3.png) Respectech 16:17Wow @toomasv. Great job greggirwin 20:46:clap: It's a really nice vizualization. I hope your'e not drawing it by hand. ;^) GiuseppeChillemi 20:49@greggirwin It's an output of his DIAGRAM-DIALECT. Sunday 12nd July, 2020 toomasv 09:04Thanks! No, it was drawn in draw.io (which has become https://app.diagrams.net/). I did it once in diagram dialect too, but it was too much hussle. Probably it could be done on drawing-pad, but I am afraid recent changes have broken it (although it at least opens). greggirwin 21:22Future ideas. :^) Monday 13th July, 2020 TimeSlip 17:50@toomasv Nice. I was wondering where you went off to the last few days. I see you were busy. @greggirwin How is the Red Diagrammar product coming along? greggirwin 19:11We've gotten over a major hurdle, which had nothing to do with the codebase itself, but code signing the EXE. In the app itself, @toomasv has made great progress on another important metagrammar. It's down to logisitcs now, which is worse than debugging. :^) GiuseppeChillemi 21:16@greggirwin You are overusing ToomasV, stop! We need him too and in healthy conditions! :-) Thursday 16th July, 2020 loziniak 14:26↑ https://gitter.im/red/docs?at=5e5303dcdafa3029f64ca385 Hi! Are there any news on Red-By-Example license? @mikeparr @greggirwin greggirwin 16:38Good question. No. :^\ Do you remember if there was discussion on it after the post you linked to? Friday 17th July, 2020 loziniak 10:57No, I don't recall anything. Yesterday I've also contacted @mikeparr by e-mail and he replied that BSD license is ok for him. I think what has to be done to make it official? Probably the best would be if Mike made a commit with license file, but I remember him saying that he's not so familiar with git. Perhaps just him saying here on the chat that BSD is ok would be sufficient? What do you think? 11:02Here is the repository: https://github.com/red-by-example/red-by-example mikeparr 12:19I'm very happy with BSD for my Red-By-Example work. greggirwin 14:51OK, I'll put this on my list. Monday 20th July, 2020 greggirwin 21:45MIT seems best to me, since it covers both code and docs. Otherwise it may be BSD+CC-by-... Wednesday 29th July, 2020 loziniak 09:24For MIT we probably should ask @mikeparr to once again confirm it here officially? greggirwin 18:18@mikeparr ? Thursday 30th July, 2020 mikeparr 18:24Yes, I officially confirm MIT for red-by-example. greggirwin 18:26:+1: Thanks all. Monday 3th August, 2020 loziniak 13:58So now it's official :-) https://github.com/red-by-example/red-by-example/commit/5bc629da9bdb4c392499b90623e1e2b6c0aaa7d4 greggirwin 14:58:+1: dander 20:56:clap: Thursday 27th August, 2020 225559 09:15Hi, is anyone translating red/docs to Norwegian? If not, I would like to do it. endo64 12:33Also check https://github.com/red/red/wiki/Translations-of-the-documentations 225559 13:31:thumbsup: Sunday 30th August, 2020 greggirwin 16:56Thanks Sorn! That would be great. 225559 19:02My pleasure! Tuesday 1st September, 2020 kidd 19:50Not sure if it's the right channel, but I noticed there are links pointing to the mailing list on the red site and readme, but the mail list seems to not exist. is it a known thing? 19:51I could send a PR removing the references in the readme if that's the right thing. but https://www.red-lang.org/ would need some edits too Thursday 3th September, 2020 GiuseppeChillemi 13:40I have something which has given me confusion: what-dir returns the current directory path, which I consider it is the current Red executable path. If I run what-dir in a script which is located in a subdirectory, and I have started with do %scriptdir/myscript.red, then the current dir is the script subdirectory. When the script ends, it returns to be the REPL starting dir. What-Dir help does not return this in the help string, I think it is worth documenting this. 14:04correction: When the script ends, it returns to be the REPL current dir before the starting of the script rebolek 14:06WHAT-DIR: Returns active directory path. I think it clearly states what it does. It doesn't return Red executable path. GiuseppeChillemi 14:19Boleslav, which is the definition of "active directory path?" rebolek 14:19it's the directory you are currently in. GiuseppeChillemi 14:22Where is written that it changes running a script? rebolek 14:23how else could you run the script than switch directory? GiuseppeChillemi 14:23do %scriptdir/myscript.red 14:24The directory is the root one but the script is in the subdirectory. rebolek 14:25if you do this, directory is changed to %scriptdir GiuseppeChillemi 14:26Bingo! Where is this written? rebolek 14:27I'm not sure I understand, it's obvious it has to work this way. GiuseppeChillemi 14:28You can read a file without changing the current dir, that what are paths are meant for. rebolek 14:28the dir is changed only for the file in subdir 14:29Imagine you have #include or do %file.red in your script and the directory wouldn't be changed somehow. Then your script wouldn't work. GiuseppeChillemi 15:04Yes, I am not advocating the working of "active dir". The Current-dir concept you find in shells is usually a static value, and you change it manually with a change-dir like command. If you run a program in a subdirectory from a shell, the current shell dir does not change. Usually, other than the current-dir you have a program-dir which is the directory where the program resides. In Red the active dir is dynamic and script dependent. So, please think like a first time user of Red, what will he probably think trying to explain the help of what-dir (when a change-dir exists too) without any further explanation? 15:06Maybe a little change would help here: *"active dir"* -> *"current script dir"* ? *"current running script dir"*? rebolek 15:10You can find various paths in system/options and system/script. GiuseppeChillemi 15:16I am looking at them: 15:17 make object! [ title: none header: none parent: none path: none args: "" ] This is system/script (Printed out from a running script) rebolek 15:20Ok, maybe Red doesn't fill these fields properly yet :-) GiuseppeChillemi 15:28I had no header or title but path should be set. Returning to the topic: IMHO, the active script concept is not documented so it is worth extending a little the what-dir help Friday 4th September, 2020 ccmywish 07:44Hi, everyone. I'm here to express thanks to helpin.red . It's a really helpful site to guide me around the Red world as a new comer . Besides, I'm totally impressed by the 1MB size Red executable. Could someone tell me about how this was done? Or is there any doc i can find about that? rebolek 07:46Hi @ccmywish If you are interested how it was achieved, just read the sources ;-) Red isn't reinventing the wheel. Lot of functionality is already in the OS, so Red just uses it. ccmywish 07:50@rebolek Thanks to reply , I'll try reading the sources some time . ^O^ rebolek 07:54I think that the right question should be - how do others achieve such bloat? How can they make 100+ MB executable? That's the question we should ask. kidd 08:41@ccmywish , I'm also new and also going through that same path. here's what started my journey: https://news.ycombinator.com/item?id=24080254 . I'm happy to share any findings, but really , it seems the truth is out there in compiler.r and system/*. ccmywish 08:49@kidd Many thanks for your sharing! o(￣▽￣)ｄ Tuesday 8th September, 2020 loziniak 18:47@ccmywish 1MB (actually currently 1,4MB on my Linux) is due to compression. 18:48Although I don't know how big the executable would be uncompressed. 18:49@rebolek I wonder how big would an electron app be if compressed with same methods as Red executable? Wednesday 9th September, 2020 rebolek 04:49@loziniak I'm no expert in Electron apps, but a safe bet is 50-70% of uncompressed size. loziniak 10:40@rebolek still far beyond Red's scale :-) 10:52Anyway, regarding docs: Has there been any discussion about adding a "SEE ALSO:" section to built-in function docstrings? I think it would ease language exploration by learners. And sometimes you just forget the right word. For example case could have "SEE ALSO: switch, either". @meijeru 's specs [functions categories](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#functions) or [red-by-example's categories](https://www.red-by-example.org/#ix-cat) could be helpful with that. rebolek 11:46This is something that is available in R2 function docs (for example see Related: in http://www.rebol.com/docs/words/wunion.html ). It would be nice to have it built-in. I believe that the whole func dialect needs updating. Things like url! with link to documentation, default values and so on. Wednesday 23th September, 2020 greggirwin 21:16@kidd sorry for the delay in responding. The mailing list exists, at least I can still see it, though it's mostly dead. Only a few old Rebolers seem to use it. Editing it out of the readme makes sense. @x8x can you also remove it from https://www.red-lang.org/ ? If somebody disagrees, speak up. Since it isn't used, we shouldn't promote it as a main contact point. 21:23@loziniak see-also: functionality will be done outside of doc strings, simply because we have to draw the line somewhere on what goes into code versus what is best handled as metadata and tooling. In this case, documentation and learning tools can leverage other sources, rather than using reflection. I worked on some ideas for the data organization in this area a while back, and will try to find my notes. 21:29Found them. I had started working on an updated word-browser from the R2 days. Won't get back to it soon, but it's in my mind again now. 21:31[![image.png](https://files.gitter.im/572d874bc43b8c6019719620/KbuZ/thumb/image.png)](https://files.gitter.im/572d874bc43b8c6019719620/KbuZ/image.png) Thursday 24th September, 2020 loziniak 15:35@greggirwin nice piece of utility! red-by-example comes into my mind as a source of content, perhaps joining two projects together would be some kind of an idea. they share a common purpose. greggirwin 17:55Certainly we should be able to use RBE content to pre-fill many examples. Good idea. Tuesday 29th September, 2020 x8x 18:50@greggirwin , removed the link to mailing list, what about irc? @rebolek is a lone wolf in there ;-) I would also not advertise it, Gitter only! greggirwin 23:53Agreed. Wednesday 30th September, 2020 x8x 19:33It's gone. Monday 5th October, 2020 9214 12:00README also has been updated: https://github.com/red/red/pull/4665. greggirwin 15:54Thanks both! Monday 12nd October, 2020 meijeru 09:52I agree one should not overburden docstrings. Nevertheless, all built-in functions should have not only a docstring for themselves, but preferably also for their refinements, or where applicable, for the arguments belonging to those refinements. This is NOT the case for the following: ask /hide read /info register-scheme /native stop-reactor /deep write /info greggirwin 20:46@meijeru those should have *something* there, yes. Friday 16th October, 2020 pekr 05:38Where has the json stuff moved? In june blog post, there is the following link to json, which does not seem to be valid anymore? https://github.com/red/red/blob/master/environment/codecs/json.red endo64 06:05https://github.com/red/red/blob/master/environment/codecs/JSON.red 06:08Case sensitivity? 😲 pekr 06:08Have official docs moved? Previously I could see menu on the left side, prior to that, language selection was there. 06:09Well, it either did not work with the June blog article right from the start, or someone renamed the file later (more probable). endo64 06:09Docs temporarily moved to GitHub pekr 06:09As Blog is a useful resource, should be fixed imo. But who can do that? endo64 06:11It's renamed: FIX: properly uppercase codec names. dockimbel committed on May 15 Sunday 25th October, 2020 greggirwin 17:20@XANOZOID, thanks for the reviews of other docs. We have evaluated a *lot* of other lang docs, and we really do have a plan; it's just never come to fruition. It's a herculean effort, and requires a long term commitment, or at least enough commitment to lay out a foundation with some of the team that others can help carry it forward when the author inevitably gets busy. In the plan, there are four pillars: - Specification: This is @meijeru's spec, but finally to be pulled under our umbrella with him as the BLFL (Benevolent Lieutenant For Life :^). - Reference: This what we call official docs today. - User Guide: We point people to the Rebol Core Guide for this now, and need to write our own take on that. This is like the Dart Tour - Tutorial: These are focused examples, cookbook entries, one liners, etc. It looks like I have 22 bookmarks for other docs, and IIRC Scala was a key approach I liked. 9214 17:22[REP 3 — Red Documentation](https://github.com/red/REP/blob/master/REPs/rep-0003.adoc). greggirwin 17:23But there's this other approach, too. [Not long ago](https://gitter.im/red/docs?at=5f6bbe43aaff36059b515a7d) I posted a shot of a desktop doc tool. We also have some *-lab tools that are meant to help people learn a particular slice of behavior or domain. e.g. [Gradient Lab](https://gist.github.com/greggirwin/ec7e2b75bfd96edb45faf966a9e8016b). 17:24Thanks @9214! dander 17:53I really like the desktop doc tool idea. If the docs were defined in some red-based format (Ren perhaps?), then a translation tool could generate the web docs. I'm not clear on how much easier/harder that would be than what we currently have, but it would keep built-in docs in sync with web material. Or certainly the existing doc format could be parsed. Another thought I had was that if there is a documentation leader spearheading high-level topics for the User Guide (i.e. table of contents), it might make it easier for people to contribute content to that. It doesn't solve the problem of different styles. I don't have a lot of experience working with a documentation team. For Tutorials, there are lots of discussions and questions on Gitter which could be turned into tutorials. Perhaps we should have a process where we open a github issue on the docs or separate repo for a tutorial topic, and linking in the participants so they can discuss and build that up in a more formal way greggirwin 18:20IME, having tech edited and co-authored books, the User Guide will benefit greatly from having a single voice. Tutorials can and should be a collective, though it will help to have an editor and guidelines to maintain stylistic consistency. I always want to work from Red content and generate other things. My DictDoc mockup is largely to help think about content structure, and how various pieces can be combined. We need a lot of help, but as with other community resources, we need to control what is "official" and what is user content that may not be what we (the team) would say or recommend, but is valuable none-the-less. 18:21If anyone wants to help work on these ideas, let me know. GiuseppeChillemi 18:30@dander We share the same view. I am taking notes and ideas on this topic since the last year. They are still just written and not turned into code, but glad to see someone else is tuned on the same frequency. @greggirwin I like DictDoc. Its a simple and nice project. Would like to have the time to work on my ideas and something similar to DictDoc but my main money income is somewhere else, so I must work on them just during the night. ALANVF 19:25Maybe REON? (my Ren-like thing) 19:27it's similar to ren and can be translated to/from json seamlessly (idk if that's relevant but it might be?) dander 19:46@greggirwin That all makes sense. I'm just trying to think of ways that the bar could be lowered for community contributions. I would like to help more, but distance learning with 2nd / 4th graders really puts a hamper on my free time 😓 Monday 26th October, 2020 greggirwin 17:47@ALANVF we'll probably push forward with Ren, but should keep in touch about REON. The main value of Ren was to be portable across Redbol langs that may differ, but also be a richer format other langs can use, without being fully, deeply Red. ALANVF 19:45:thumbsup: Wednesday 28th October, 2020 JakubKoralewski 12:18Hello, everyone! I have a question regarding one of the helpin.red examples (http://helpin.red/Advancedtopics.html). The view/unview example: Red [needs: view] v1: view/options/no-wait [ backdrop blue button "unview blue"[unview/only v1] button "unview yellow" [unview/only v2] ][ ;options: offset: 30x100 ] v2: view/options/no-wait [ backdrop yellow button "unview blue"[unview/only v1] button "unview yellow" [unview/only v2] ][ ;options: offset: 400x100 ] First of all, it closes instantly for me if I don't add a do-events at the end. Once that is added at the end, there is a problem that clicking unview yellow on either of the windows closes both windows at the same time. I'm currently trying to figure out how to close one window from another so unview/only was a very nice find, but unfortunately it's not working correctly :/ Friday 30th October, 2020 TimeSlip 04:08I uploaded a video that shows how to bind a library in Red. [https://youtu.be/62Y1fHrvqa4] It was made for new Red users who have no idea how to bind libraries...ironically by someone who has little idea himself :-) Binds the libvlc.dll to play videos from Red. greggirwin 05:17James, you just made my day. Your video is *fantastic*. I'm going to figure out where it should go on a wiki page as a reference, but everybody should watch it to see what makes a great video. It's not about being perfect, but being genuine, fun, focused, accessible, and helpful. That it has polish and some cool transitions is icing on the cake. Thank you James! 05:21We can ref it from other places (@9214 is good at finding them), but I didn't see a page for binding related info, so created https://github.com/red/red/wiki/Library-Bindings-and-Routines. GiuseppeChillemi 08:57Nice! x8x 09:30@TimeSlip Very nice video! :thumbsup: (small note, your voice is on the left audio channel only) Respectech 14:58Wow, James! That was great! TimeSlip 15:12@x8x Ah, thank you for letting me know that. Thank you everyone else ( @GiuseppeChillemi @Respectech @greggirwin ). JakubKoralewski 16:14I thought it was great as well, but the font was too little to see on mobile. I found that if the font is so big that you feel like an old grandma then it's just the right size for anyone watching. Both IDE and in the browser. TimeSlip 17:38@JakubKoralewski Thank you. Yes, it was pretty small. I may make another version. I have a Zoom feature but I moved the mouse around too much so it became distracting. 9214 17:46@TimeSlip Nitpicking: RED is an ERC-20 token. Red is a programming language, and the name [is not an acronym](https://github.com/red/red/wiki/%5BNOTE%5D-On-naming-and-identity#whats-in-the-name). dander 18:09@9214 What a wonderful wiki article. Very nicely done! TimeSlip 18:53@9214 Thanks, I'll remember that. 9214 19:00@TimeSlip some feedback, in case you want to extend that to a dedicated tutorial series: 1. The important details of calling conventions and which one of them VLC library uses, and why you used stdcall over cdecl (I think the latter is correct, since it's a C library). 1. Describe how to convert low-level Red/System values to Red counterparts and how to pass arguments on evaluation stack; routines do that automatically only in the simplest cases (integer!, float!, logic!, maybe byte!). Briefly cover the Red runtime API, since that's the part that you'll end up using for any non-trivial task. 1. Your red_libvlc_new takes 0 as argc and none as argv, which are supposed to be pointers (in fact they do get implicitly coerced to pointers, likely to null ones). The same holds for the rest of the binding you have defined: passing random values instead of addresses will most likely lead to a crash. It's not critical for PoC examples, but should not be treated lightly. 1. as c-string! string/rs-head red-string is not the way to do such conversion: Red's string buffers are not NUL-terminated, you should've used [cache](https://github.com/red/red/blob/master/runtime/datatypes/structures.reds#L100) struct field, it contains UTF-8 encoded and NUL-terminated representation of the string. See p. 2 and p. 3. 1. Defining such thin layer on top of VLC API in high-level Red makes little to no sense actually; you should delegate all the bit-twiddling and byte-pushing to Red/System and reserve Red for a more expressive (perhaps even dialected) user-facing interface. @Oldes' [examples with SQL in red/code](https://github.com/red/code/blob/master/Library/SQLite/SQLite3-test.red) come to mind. How to design such binding APIs in Red is a broad and interesting topic. 1. Would be nice to mention the official [Red/System specs](https://static.red-lang.org/red-system-specs.html), specifically the [section about library imports](https://static.red-lang.org/red-system-specs.html#section-15.1). 1. Your Github repo is empty! TimeSlip 19:16@9214 #7! Thanks. You know that was my first attempt at using GitHub. I thought I had uploaded the files. They are there now. Now I know how to learn Red, just make a video. :-) Thanks for the input and for watching the video. I would like to later discuss some of items you wrote. Monday 2nd November, 2020 GiuseppeChillemi 19:41 @9214 We have a paradox: now that you have documented them, you can delete the [undocumented features page!](https://github.com/red/red/wiki/%5BDOC%5D-Undocumented-features) :D Tuesday 3th November, 2020 ALANVF 02:39wait when was this a thing https://github.com/red/red/wiki/%5BDOC%5D-Undocumented-features#copypart-with-pair 02:40I haven't seen it in the regular docs...? greggirwin 03:31IMO I should't be a thing. If we want ranges, and *that* has been discussed a lot, we shouldn't press pairs into service for it. Just a bad fit. That said, if you want to [copy part of an image](https://github.com/red/docs/blob/master/en/datatypes/image.adoc#manipulation), it's a great fit. Note that at also works for them. e.g. >> a: make image! [2x2 #{111111222222333333444444}] == make image! [2x2 #{111111222222333333444444}] >> at a 1x2 == make image! [2x2 #{333333444444}] Pick is easy to understand of course, but skip may not be quite as obvious to reason about. If someone wants to write up some notes on that, it would help others. Though I imagine RedCV is the big hammer people will (and should) wield for heavy image processing. ALANVF 03:33I think that having the pair thing is fine for indexing operations (pick/poke/copy/etc), but shouldn't be allowed for anything else 03:35(additionally, it'd be nice if we could use that feature in path literals :pray:) greggirwin 03:43Have you tried it? :^) ALANVF 03:43not yet..? greggirwin 03:44We love giving people happy surprises. ALANVF 03:44I was just looking at the specs the other day and I didn't see anything about it (entirely possible I skipped over it though lol) meijeru 13:51[This](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc) spec document is informative about the use of pairs in indexing. greggirwin 16:48Thanks @meijeru. Thursday 31st December, 2020 gltewalt 21:27It was an eye-opener to see someone record themselves trying to use the docs that are present. 21:28I did a lot of things wrong 21:28https://youtu.be/HDMa4gcgEgI 21:31You can save what to an html file replacing line breaks with <p>, but descriptions are truncated at a certain length greggirwin 21:41This came up some time back. We can improve things, and having better search is key, but a lot of this is on the user. Coming from other langs is hard, and I still want to have a "Red for X programmers" series. A quick intro for common tasks would also be good. 21:45Watching it again, and he notes this himself, he's just banging around *really fast*. Having examples at the bottom of datatype pages, e.g. for actions, could help too. 21:47Maybe add some text above the action/func area to note what actions are, because read, write was right there and he just didn't know what it was. 21:51I do love his reactions when things work. It's valuable feedback for us. 21:53See Also: links are also good to have. Lots of work to do. gltewalt 22:05Easiest: write %RedWords.adoc what/buffer 22:07Yes, I should have made links to the descriptions of the words instead of just plain text 22:08And apparently not evident that the console and help (should?) be the first stop greggirwin 22:09We just keep improving. Let's plan a small primer, which hits basic tasks new users will want to accomplish. gltewalt 22:09Having not looked back in yet, have you guys settled on asciidoc or markdown? greggirwin 22:10It's all ADOC now. 22:10And because of issues with github pages, it's just the raw repo, until we revisit @x8x's work, which would be a nicer official landing point for docs.`
