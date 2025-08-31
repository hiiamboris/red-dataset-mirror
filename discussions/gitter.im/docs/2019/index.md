# Archived messages from: [gitter.im/red/docs](/gitter.im/red/docs/) from year: 2019

## Friday 4th January, 2019

toomasv

[19:50](#msg5c2fb90b93cce97d3be8ec3b)In red-by-example parse chapter \[2.5. Remove, Insert, Change](http://www.red-by-example.org/parse.html#16) examples include `in:` set-word, which will effectively kill the console. E.g. `in: "XXX-------"`. I suggest changing `in:` there to e.g. `inp:` or some other (set-)word that is not disturbing the system.

greggirwin

[20:24](#msg5c2fc0ffe6d89641ef8fdfb1)@toomasv +1

mikeparr

[22:15](#msg5c2fdb1873360b4d55bbd075)@toomasv thanks re parse - I will update, but not immediately.

loziniak

[22:28](#msg5c2fddf31948ad07e8ecc9be)@Arie-vw @GiuseppeChillemi I've spotted a mistake in Red-By-Example site, I missed a lot a \*pull request* possibility that https://github.com/red/docs repo gives to me. Trusted users can have a direct commit/push rights and all other people could still contribute by making a pull request.

[22:29](#msg5c2fde581948ad07e8eccd93)@GiuseppeChillemi if somebody wants features they have to pay in Professional version of red, they can always fork and implement them by themselves.

## Saturday 5th January, 2019

greggirwin

[01:56](#msg5c300ec973360b4d55bd0f80)@gltewalt would you look at §6.1, the first set of text alignment keywords, and think about how best to note that the `text`doesn't support them all, per https://github.com/red/red/issues/2735. Thanks.

gltewalt

[01:59](#msg5c300f856370df0b91901962)Does text face only support `left` and `right`?

GiuseppeChillemi

[02:10](#msg5c3012065ec8fe5a8502e3b7)@loziniak Despite the fact I can afford a professional version of RED, I can tell you 1) my company in now investing only in open source software for hundred of reasons, so I prefer donating and funding only open features 2) I have always seen closed REBOL SDK/Command as an obstacle to wide adoption. People tend to give back in some way what they receive (if they have used it ).

[02:10](#msg5c30122e12db9607e73a9ea4)(Let's move to chit chat)

greggirwin

[04:06](#msg5c302d3caac7082e6fd73859)@gltewalt I believe all horz alignments work, but not vertical. If someone can confirm on Mac, that would be great.

```
view [
	style text: text 100x100 black yellow
	text left "left"
	text center "center"
	text right "right"
	text top "top"
	text middle "middle"
	text bottom "bottom"
]
```

## Tuesday 8th January, 2019

cookyzed

[04:42](#msg5c342a2a1491b27876da30fd)There is a `request-http` method in runtime/simple-io, how can I use it in my code?

endo64

[06:04](#msg5c343d536370df0b91a91946)@cookyzed Why do you need it? `read` and `write` should be enough for simple HTTP operations.

[06:04](#msg5c343d6e73360b4d55d63610)Better to move /help room.

cookyzed

[11:32](#msg5c348a301d1c2c3f9cde245c)@endo64 Thanks! I'm new to Red, wondering how to use it to make calls to HTTP APIs.

rebolek

[11:35](#msg5c348b1e8b6399655e275f9b)@cookyzed I guess you want to know how to do POST request, right?

cookyzed

[11:36](#msg5c348b2ebd592b2e6e6ef4f7)@rebolek yeah

rebolek

[11:37](#msg5c348b8982a6c30b90a3128c)@cookyzed `write/info http://server [POST data-here]`

[11:38](#msg5c348bac357dd7655d36782a)Or you can use my `send-request` function that tries to make this stuff easier https://github.com/rebolek/red-tools/blob/master/http-tools.red#L181

cookyzed

[13:28](#msg5c34a579357dd7655d3739e7)@rebolek I'll try it. Thanks a lot!

rebolek

[13:29](#msg5c34a5b926d86e4d5644ca9a)@cookyzed You're welcome! There are some REST APIs in that repo that use this function, so you can take a look at them and if you have any questions, feel free to ask.

endo64

[14:51](#msg5c34b8d726d86e4d56454b95)@cookyzed Also look at https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#how-to-make-http-requests  
Welcome to the Red community! Feel free to ask your questions! (but not in /docs room, /help or /welcome is better suilted :) )

## Wednesday 16th January, 2019

meijeru

[12:22](#msg5c3f221e32a8370605de3a1b)Is the following difference between Red and R2 noted anywhere? NB R3 is like Red.

```
R2:
>> select/skip [a 1 2 b 3 4] 'b 3
== [3 4]
R3 & Red:
>> select/skip [a 1 2 b 3 4] 'b 3
== 3
```

endo64

[12:57](#msg5c3f2a428318994524fb5bac)I remember that this has been discussed before, but it is not noted in the wiki.

meijeru

[13:08](#msg5c3f2cd0f780a1521f1c85f6)Another tricky one (you can see that I am converting an old Rebol program -- it makes a very interesting experience)

```
R2:
>> - 5
== -5
R3 & Red:
>> - 5
*** Script Error: - operator is missing an argument
;; use negate for unary minus
```

rebolek

[13:11](#msg5c3f2d79f780a1521f1c89c2)I like R3/Red behaviour better.

endo64

[13:39](#msg5c3f33fdba355012a44a638e)Yes it should be an error. Does it also work inside a script or just on console?

rebolek

[13:47](#msg5c3f35e639596c372beeca0e)Inside a script also. If you mean R2.

[13:48](#msg5c3f364b32a8370605decb07)It's exception just for `-`, other op!s throw an error.

greggirwin

[20:21](#msg5c3f9257cb47ec30005462e2)For `select`, I remember chat, too, but not where it was. The new behavior is more consistent, and matches the doc string better, though I wouldn't say it's more useful. The catch, of course, is that I didn't use that behavior very often in R2. It's usefulness comes at a cost.

endo64

[21:41](#msg5c3fa51cba5936605bcf28cc)I remember that Carl said that when using `/part` in `select` it switches to records mode so what you select is the record (a block of values) instead of a single value in the block.

```
>> select/skip [1 2 3 4 5 6] 1 3
== [2 3]
```

Here the block `[1 2 3 4 5 6]` treated as `[1 [2 3] 4 [5 6]]`, so `select` can return only `[2 3]` or `[5 6]` by selecting 1 or 4 (others will return `none`)  
And of course it returns a copy of the part of the block, not a position.  
From that point of view it makes more sense.

[22:43](#msg5c3fb3af32a8370605e234b0)Also added to https://github.com/red/red/wiki/%5BDOC%5D-Differences-between-Red-and-Rebol#select-skip

## Monday 21st January, 2019

GiuseppeChillemi

[21:45](#msg5c463d75746d4a677aed1e87)Note: \[Programming RED](http://programming.red) will be read only for some time. I am structuring it.

## Saturday 26th January, 2019

meijeru

[13:18](#msg5c4c5e43ca428b064505a7ed)I am using the `text-list` face for displaying formatted source text, rather than using `area`. The precise reasons for this are immaterial, but I found out that the `text-list` face ignores tabs when displaying the items in the `data` facet. They are not even replaced by spaces, but simply suppressed. This is missing in the GUI documentation.

endo64

[22:00](#msg5c4cd88254f21a71a1af2eab)@meijeru Could it be ignored by the OS? I saw some texts on internet that Windows listbox control doesn't keep and simply ignores tab character (or any other control chars).

meijeru

[23:04](#msg5c4ce76ef04ef0064490277c)@qtxie could probably inform us. If it is OS-related, it still could be mentioned in the docs.

endo64

[23:07](#msg5c4ce83c7b68f94102236988)&gt; it still could be mentioned in the docs.

Agreed.

## Sunday 27th January, 2019

qtxie

[00:22](#msg5c4cf9aa454aad4df7aa21c7)It is ignored by Windows listbox control. I need to check how macOS and GTK handle it.

## Tuesday 29th January, 2019

greggirwin

[05:47](#msg5c4fe907975714406b5baabc)That will be good to know, as using a text list for columnar data is a well known use case.

## Saturday 23th February, 2019

mikeparr

[13:20](#msg5c7148819155d45d905fc3a0)Red-By-Example: I've taken it over from Arie, who is not well. We both think it would be worthwhile to convert it into a wiki, to make it more open. Any suggestions?

endo64

[23:03](#msg5c71d1489e430b3086b6a612)@mikeparr I like it's current form, one page, easy to use, well categorized.  
If we convert it to a wiki, I would like to keep those features.  
What about adding it's whole content into one page under Red's wiki? https://github.com/red/red/wiki

[23:08](#msg5c71d286c4da4a11f5a4f58f)And I hope Arie will get better soon.

## Sunday 24th February, 2019

mikeparr

[14:45](#msg5c72ae17a378ef11f631270d)@endo64 - yes, agreed abut the one-page thing. Would the use of the github/red site be allowed? (Because the RBE stuff is unofficial.)

endo64

[15:01](#msg5c72b1c8c82c68509e2b6363)@mikeparr How currently RBE content organized? It looks like you are generating the whole content from something (Red/Rebol block?). In that case converting it to wiki is not difficult but editing wiki won't be as easy as its current form.

Red's wiki page can be edited by community, so no worries about being unofficial, we can also ask @greggirwin to add RBE in the right-side-bar, or we might replace the current Examples page (https://github.com/red/red/wiki/Examples) with RBE, as current one doesn't have much use.

mikeparr

[16:28](#msg5c72c639c776985d8f467532)@endo64 Currently, there are a lot of text files, one per word. Arie's Red program generates an index and html. Ideally I would want 'proper' wiki - separate files - for ease of editing - as you say - but would also generate the big page as well.

## Monday 25th February, 2019

greggirwin

[23:32](#msg5c747b100bd37b4835cac64a)First, @mikeparr, thanks for taking it over. I also hope @Arie-vw gets better soon.

I'm not sure about adding it to the github wiki. A big issue there is that wikis are hard to organize and search, and github's wiki has caused us some pain the past. Wikis are good for getting contributions though.

Let me think on it.

## Wednesday 27th February, 2019

dander

[21:25](#msg5c77003453efa9120387b284)An in-between option could be to expose the sources in a Git repo, so that people could make PRs to it. The page generation could be hooked up with CI stuff. Probably easier that migrating everything to a wiki format, but a little more friction to contributors. I've really appreciated having this great resource, and used it many times, so thanks for all your work @Arie-vw and @mikeparr, and I hope Arie feels better

## Friday 15th March, 2019

topcheese

[12:11](#msg5c8b9679b1a04977607c979a)What would be nice is getting access to some of the older Rebol books and documentation so they can be updated. That helps me to learn by troubleshooting old code. Are any of you aware of resources available, or should there be one set up?

9214

[12:37](#msg5c8b9ca5a28d73296ceefb3d)@topcheese books and documentation are written by people, so you should at the very least gain their consent regarding modifications and updates, since it is their intellectual property. All official Rebol documentation belongs to Carl and RT, and I don't recall him endorsing its copying or even updating.

We have a \[wiki page](https://github.com/red/red/wiki/\[LINKS]-Learning-resources) with learning resources, all Rebol books there are freely available. If you want to help on docs side, read \[REP-0003](https://github.com/red/REP/blob/master/REPs/rep-0003.adoc) and figure out which part of it matches your skills and interests, then cooperate with other contributors. But I'd suggest to learn the actual language first, before trying to educate others - happily, we have enough tutorials and active community members to help you with that.

mikeparr

[14:59](#msg5c8bbdbef5841318cdf4af77)'There is also a published book on Red listed there, by Ivo Balbaert

topcheese

[15:03](#msg5c8bbebfc627612ffda0ab2c)@9214 I think I said educate myself, but I was just seeing if any those people were around. Thanks for the excellent resources. I have the Red book, and those links will make the perfect resource for me!

9214

[15:31](#msg5c8bc54c3519ca08c7b1efda)@topcheese sorry, I've got an impression that you want to port / update content of Rebol books and documentation to Red and learn something in the process. Nevermind.

burque505

[16:48](#msg5c8bd752c627612ffda1634e)The link \[Red/System Implementation Todo-list](https://github.com/dockimbel/Red/wiki) on \[the Documentation page](https://www.red-lang.org/p/documentation.html) gets forwarded to \[the wiki](https://github.com/red/red/wiki). Might it be worth renaming the link?  
Regards, burque505

9214

[16:51](#msg5c8bd8212b6075296bceed89)Red/System spec already has section with possible features. There's also a \[wish list](https://github.com/red/red/wiki/%5BNOTES%5D-Red-System-v2-Wish-List) for R/S v2.

burque505

[19:08](#msg5c8bf843c25d677f842f1765)@9214, actually I meant renaming `Red/System Implementation Todo-list` to `Wiki`, since that's where it points.

9214

[20:11](#msg5c8c06ebf3dbbd230c60bb76)@burque505 I don't follow - this link is obsolete and should either be changed to point to a wish list or removed entirely. And there already exists a link to Red wiki on this page.

burque505

[21:04](#msg5c8c135a8aa66959b618028e)@9214: agreed. Point it to a wish list (presumably that was the link that now gets forwarded) or remove it.

9214

[21:50](#msg5c8c1e392f6ded0abbec3aa7)@greggirwin :point\_up:

## Saturday 16th March, 2019

topcheese

[06:05](#msg5c8c92238126720abcee8be3)@9214 Well yes more or less, so thanks for correcting me. I was thinking of something informal on a wiki page, but you're right I would have to get in touch with the original authors. I also need to finish the book that I have, and worry about contributing later.

9214

[10:16](#msg5c8ccd1a49fdaa0d81c31a2f)@topcheese something like \[this](https://github.com/red/red/wiki/%5BDOC%5D-REBOL-Core-Users-Guide-\_\_-A-walkthrough-with-Red)?

CoteGerard2\_twitter

[14:40](#msg5c8d0ae48aa66959b61dd391)Just a drop to pinpoint some minor change to do to the official Red-lang website Getting started page (https://www.red-lang.org/p/getting-started.html).

There is a broken link (marked as View "reference documentation") on the last line above the entitled paragraph "Compiling a Hello World" . It is now pointing to : https://doc.red-lang.org/gui/View.html but is supposed to point to the official View reference documentation, which seems having been reorganised since the original making of the post. The new link should be written as : https://doc.red-lang.org/en/view.html. Thanks for the follow-up.

greggirwin

[16:19](#msg5c8d220e0d719050571596f7)@x8x, can you look at the docs page on red-lang.org? Should be an easy fix.

## Monday 18th March, 2019

x8x

[20:11](#msg5c8ffb7737b02602f055d26a)@CoteGerard2\_twitter Thanks for the detailed description, link updated!

## Tuesday 19th March, 2019

topcheese

[19:37](#msg5c9144e249fdaa0d81e07139)@9214 Yes exactly! That already looks nice, but I'm not quite there yet. I was also under the impression from reading articles that Rebol was dead, but it seems to still be alive and thriving. I still have a lot to learn, and you were right. Thanks for calling me out AND for pointing me in the right direction.

Respectech

[19:50](#msg5c91480152c7a91455c06a95)@topcheese Yes, Rebol in its many forms is still quite alive and well. I call it my "secret weapon." I own two successful businesses that greatly benefit from automation provided by Rebol2/3/Red and hopefully Ren-C soon.

[19:50](#msg5c91481b8126720abc0d41b8)http://respectech.com and http://ameridroid.com

rebolek

[20:24](#msg5c915011fcaf7b5f73dfcce2)Ren-C's problem is that it's changing too much. You can't be sure if a feature introduced today won't be removed tomorrow.

Respectech

[20:38](#msg5c915351fcaf7b5f73dfe173)@rebolek Yes, and by HostileFork's own admission, he doesn't create products and doesn't publish release schedules. I'm looking into Ren-C running locally within the browser with DOM control (like JS does currently), but I've been warned against it by the Ren-C folks until some later date. The progress so far is pretty cool, though. (I'd like to move this to red/chat, but I don't see a group for that.)

rebolek

[20:40](#msg5c9153b8dfc69a1454bfdc6c)@Respectech there's chit-chat group

## Wednesday 20th March, 2019

topcheese

[11:28](#msg5c9223f99d9cc8114aef92b2)@Respectech That's good to hear, and thanks for sharing. I just watched a video on the Amiga OS a couple of weeks ago, so I was really excited when I ran into Rebol and found out Carl Sassenrath created it. Now it's kind of hard looking at other languages.

Respectech

[17:04](#msg5c927283d0133e21e5e7c6ae)@topcheese My wife and I owned one of the largest Amiga mail order stores in the US from 1994-1997, and then I worked for Carl from 1998-2001 at Rebol Technologies in the Quality Assurance and Technical Support departments. All his children (3) worked for us at one point or another, and his wife worked as our Office Manager from 2010-2018. I still see Carl several times a year, but he now lives about 5 hours from us (by car) in the more free state of Nevada.

topcheese

[21:40](#msg5c92b342fa5b721a1fc1511b)@Respectech That's awesome you got to work with him and his family. The Amiga was a winner, and it's too bad it wasn't more successful, but I did notice the OS still seems to be going strong. I can't help but feel honored being in the company of such great minds at work. I see that Red has a very interesting and solid history. Thanks for sharing!

## Friday 12nd April, 2019

nedzadarek

[15:50](#msg5cb0b3cdc55bd14d35d2e710)If someone want to translate documentations (e.g. \[this](https://doc.red-lang.org/en/datatypes/error.html)) how s/he should do it? Fork \[the repository](https://github.com/red/docs/) and add a directory with \[country code](https://abbreviations.yourdictionary.com/articles/country-abbreviations.html) (+ files from other language)?  
I can see \[gitbook](https://www.gitbook.com/). Should I use it (any information how it would work with the Red's documenations would be helpful).  
Or is there an another way?

rebolek

[15:57](#msg5cb0b54e759abc043cadd7ea)@nedzadarek @Tovim is the best person to ask, he did first translation to Czech.

nedzadarek

[16:23](#msg5cb0bb8c20fbe911eea3fc10)@rebolek thank you - I have messaged him.

greggirwin

[18:31](#msg5cb0d99493fb4a7dc21abdfa):+1: Chatting here about it is great, too, and add notes to the wiki, for future reference.

nedzadarek

[22:13](#msg5cb10d758148e555b2955345)@greggirwin I have messaged him to post answer here.  
Sure, I will add the information to the wiki.

gltewalt

[23:04](#msg5cb1198e3ebbdc55b3a9fb96)Fork the repository.  
Then clone to your computer.  
Then make changes to your local copy.  
When you’re ready git push to your fork then click to create a Pull Request.

Make sure your local docs are up to date first by pulling from the original repository.

[23:06](#msg5cb119e9759abc043cb08acb)I use VSCode with asciidoc preview plugin

[23:07](#msg5cb11a2a93fb4a7dc21c7a23)I don’t use any of the VSCode git capabilities, though. I use command line.

## Saturday 13th April, 2019

greggirwin

[06:01](#msg5cb17b340aad635019760701)Thanks @gltewalt and @nedzadarek.

Tovim

[14:10](#msg5cb1ede8759abc043cb5bf12)@nedzadarek , sorry for not being present here yesterday. @gltewalt has answered your question instead of me perfectly. Thank you, Greg T.  
I would only add, that it could by useful to discuss the intention to translate the Red documentation with somebody at the head of the team in advance.

endo64

[16:20](#msg5cb20c68759abc043cb6a0d4)Just note that fork/edit/push/pull request is useful for the first time, for subsequent (relatively smaller) edits use GitHub's online editor. Otherwise someone from the team should accept the pull request everytime, and if somebody else is already edited some of the pages you need to pull and merge locally before pushing.

[16:22](#msg5cb20cb225686a7dc3256682)For short, for the first step fork is ok, next continue online.

gltewalt

[19:33](#msg5cb2396c20fbe911eeadb6f5)Gregg has been the one to watch it and accept pull requests

nedzadarek

[20:45](#msg5cb24a8525686a7dc3271be8)@gltewalt  
&gt; I use VSCode with asciidoc preview plugin

I'm using notepad++ (RedEditor-11) but I haven't found yet asciidoc preview plugin. I have Atom and it seems it have asciidoc preview. So I will find something.

@endo64 so, by using Github's online editor I don't have to be accepted (pull request accept) any more (assuming that I had been accepted once)?

So for each short page like \[this](https://doc.red-lang.org/en/datatypes/binary.html) I should just edit -&gt; commit -&gt; push -&gt; pull request.  
What about some bigger one like \[vid](https://doc.red-lang.org/en/vid.html)? Should/can I create bunch of commits/push and pull request after whole page is translated? Or should I translate some part -&gt; commit -&gt; push -&gt; pull request?  
What to do with partial translations -&gt; so I copy English documentation -&gt; rename folder to my country code -&gt; translate some pages. Some pages are in the English &amp; some pages would be in my language. Is this acceptable? Or should my country-directory contain only translated pages?

@gltewalt so I should ask @greggirwin for a permission to translate (to polish)?

ps. is there some list of translator/pages that are being translated to given language? I don't want to translate already-translated-texts.

gltewalt

[21:00](#msg5cb24e040aad6350197b7a87)Country directory should only contain translations

[21:01](#msg5cb24e2df851ee043db17597)You don’t need permission, he merely oversees Pull Requests.

[21:02](#msg5cb24e6db34ccd69e7b317cd)When you clone the fork to your computer you will be able to see the way directories are laid out, and see the non English directories

[21:04](#msg5cb24ec0b34ccd69e7b31a70)I would commit and push as you get each doc translated

[21:06](#msg5cb24f5a20fbe911eeae417b)Or commit with a message each time you complete a section and then push when the doc is done

[21:07](#msg5cb24f9920fbe911eeae4304)Editing online is good for correcting minor mistakes without out going through the whole git process

[21:20](#msg5cb2529df851ee043db19408)I’m not aware of any Polish translations

[22:20](#msg5cb260b293fb4a7dc224ab83)You can message me if you have questions on any of the steps. The way I do it isn’t necessarily ‘the way’ to do it, but I’ve been adding docs for awhile

## Sunday 14th April, 2019

endo64

[13:33](#msg5cb336b3f851ee043db72243)&gt; @endo64 so, by using Github's online editor I don't have to be accepted (pull request accept) any more (assuming that I had been accepted once)?

@nedzadarek , Sorry, I was wrong about that comment, I confused with the wiki pages. You can't edit the file directly on GitHub without fork/clone. (Well you can edit online your own fork, not the main red/doc repo as you don't have permission to do that)  
You need to fork https://github.com/red/docs repo first, clone locally, copy the `en` folder to a new one and rename it to 2 letter language code, `pl` for Polish (http://www.lingoes.net/en/translator/langcode.htm),  
Start translating, you can make any number commits locally, and push it to your fork, and make a PR to the main repo. You can make PR after finishing all the translations or for each section separately as Greg suggested.

[13:38](#msg5cb337bc759abc043cbdb3be)VS Code also has an extension for previewing Markdown.

greggirwin

[16:34](#msg5cb3612b1f6e900d5e3153af)Thanks for stepping up @nedzadarek. Translations are always welcome.

## Monday 15th April, 2019

gltewalt

[02:06](#msg5cb3e72cb34ccd69e7bd144b) Local gitbook server can come in handy for seeing how things will look online. Useful if you are doing a lot of document writing.

https://gchq.github.io/stroom-docs/dev-guide/gitbook.html

[02:07](#msg5cb3e77793fb4a7dc22e6068)Just make sure you don't accidentally `git add` the `_book/` and `node_modules` files

toomasv

[03:21](#msg5cb3f8c293fb4a7dc22ecb62)Sorry if this was suggested already -- it would be good to have HOW-TO with these instructions.

endo64

[05:54](#msg5cb41ca720fbe911eeb9b5fb)@toomasv Thanks for reminding, I'll check and add to the wiki.

dander

[07:49](#msg5cb437a525686a7dc3331707)@gltewalt would it help to add those to `.gitignore`?

nedzadarek

[11:07](#msg5cb465ed016a930a45c2617c)@gltewalt I haven't used it for a long time so I'll stay away from the Node... I might destroy something by accident.  
@endo64 @gltewalt @greggirwin @Tovim well, thank you for the informations!  
@endo64 I was going to create a wiki with the instructions but I'm busy... so you might be faster.

[13:54](#msg5cb48cf8a0790b29c9bed458)@endo64 I have created \[the wiki](https://github.com/red/red/wiki/Translations-of-the-documentations)

9214

[14:20](#msg5cb49341759abc043cc6bbaf)@endo64 I think it makes more sense to:  
\* create a readme file in `/docs` repository  
\* move list of ongoing translation initiatives to `/docs` wiki, link to language-specific Gitter rooms that we have and/or active contributors  
\* additionally mention all resources related to \[REP-0003](https://github.com/red/REP/blob/master/REPs/rep-0003.adoc)

[14:35](#msg5cb496aef851ee043dc04f4c)I also disagree with pitching of any specific workflow, because it entirely depends on number of translators, degree of their coordination and, well, writing / translating skills. If you are alone and are fluent in English like @gltewalt, it's easier to pull everything locally and work in cave mode; some people collaborate on organizational level (e.g. \[red-china](https://github.com/red-china)), others might use draft PRs (Github new feature IIRC) and collect feedback in the process, some might be bi-lingual as well and translate from, say, French to Spanish.

[14:42](#msg5cb49860759abc043cc6e19a)The common baseline is that first PR should cover all official documentation ATM, and all subsequent PRs should address newly added sections.

endo64

[16:12](#msg5cb4ad760aad6350198b1cc3)Thanks for the inputs @9214

gltewalt

[19:13](#msg5cb4d7dea0790b29c9c106c4)@dander Yes, .gitignore can be used. I was keeping it as simple as possible - The minimum commands that a person will have to use with git command-line are `git pull`, `git add`, `git commit -m`, and `git push`.

[19:24](#msg5cb4da88f851ee043dc23a6f)After `git clone` of course.

dander

[19:59](#msg5cb4e2adc55bd14d35ee9bcf)@gltewalt What I meant was - would it be beneficial to add it to the main repo, since that way you wouldn't need that caveat for newcomers?

nedzadarek

[20:15](#msg5cb4e66a759abc043cc91303)@9214 @endo64  
&gt; The common baseline is that first PR should cover all official documentation ATM, and all subsequent PRs should address newly added sections.

and

&gt; You can make PR after finishing all the translations or for each section separately as Greg suggested.

That confuses me. Would you clarify it?

&gt; I also disagree with pitching of any specific workflow

Then what would you suggest?

endo64

[21:23](#msg5cb4f662c55bd14d35ef1d14)@nedzadarek Currently there are 58 files in the `en` folder of the main repo, so if you decide to translate into another language you should copy all those files.  
Then, if you are alone you can translate them all and then make a PR, or coordinate with the others and make several PRs for each translation (hence there is no specific workflow).  
It depends on how many people will work on the translation and how they are communicate.

[21:24](#msg5cb4f6a5016a930a45c6722e)For example, there are 56 files in `fr`, 2 files are missing: `datatype.adoc` and `typeset.adoc`

[21:36](#msg5cb4f96893fb4a7dc235d5f0)@dander Adding those files/folders into `.gitignore` would be good, but gitbook server is not required to work with, hence they are not added. If you add those files accidentally, PR won't be accepted by the owner.  
VSCode's Asciidoc extension could be used as well.

greggirwin

[21:56](#msg5cb4fdf7759abc043cc9afd6)@9214's bullet points are good, especially having a readme there. Let's use the Docs repo for all things docs, but also make sure we have a clear pointer to it somewhere in the main repo, so people know to go there.

I also agree that we don't want to enforce workflow, but we can provide at least enough info, on one way to do it, so people can get started.

endo64

[22:17](#msg5cb502e9a84e0c501a398a7c)Keeping the list of missing parts of the translations and informing the contributors is another issue. For example Japanese translation have 42 missing files, should we add the missing files from `en` or keep them missing? Is @koba-yu available to continue his contribution?

greggirwin

[22:20](#msg5cb503bc25686a7dc338d871)It can be nice to have a baseline set of files, but as soon as we add a new one, it's out of date again. I think we can leave them out for now, and maintainers can choose how best to move forward with each language. I don't know if gitbook lets us set a custom 404 result for missing pages, which would be best for users, so they know what's going on.

## Tuesday 16th April, 2019

nedzadarek

[09:03](#msg5cb59a6ff851ee043dc6fccb)@Tovim in the \[binary! doc - section 6](https://github.com/red/docs/blob/master/cs/datatypes/binary.adoc#6-komparace) should it be `operátory` instead of `oprátory`? I'm not Chech but google translator fixes this for me that way.

rebolek

[10:14](#msg5cb5ab0af851ee043dc77d86)yes, that is certainly typo

## Wednesday 17th April, 2019

Tovim

[12:31](#msg5cb71ca597dcb371d8c9747b)Thank you everybody. Has been corrected.

## Friday 3th May, 2019

gltewalt

[21:26](#msg5cccb20f1cd0b8307dba1477)Should readme addition in `en` be made into a separate top level readme in `red/docs`?

endo64

[21:33](#msg5cccb3a41cd0b8307dba1ffb)I think it was supposed to be in top level readme file, not in `en`

gltewalt

[21:34](#msg5cccb3ec8446a6023ebfa3f3)I can create a top level README, and remove the addition from `en`

[21:35](#msg5cccb42d4b4cb471d9a1de8b)Or edit it and move it from `en`, as the other languages do not seem to have readme files

endo64

[21:36](#msg5cccb46eb4700e023d194548)Other langs also have readme files, but they all different, `cs` already translated your `en/readme.adoc` file.

[21:37](#msg5cccb499375bac74704ea606)`ja` and `fr` have completely different readme.adoc files.

[21:38](#msg5cccb4dd4b4cb471d9a1e1ef)I think best would be, remove the part after`Howto for documentation translators`, put it into top-level readme in `en` and `cs`.

[21:38](#msg5cccb4efe416b845192642fa)Leave `ja` and `fr` as it is.

## Saturday 4th May, 2019

greggirwin

[03:03](#msg5ccd00fa3b6cb0686a9ce1b9)Merged @gltewalt's changes. Let's see how it looks once it renders.

Tovim

[09:55](#msg5ccd61ac8446a6023ec3ca14)Hi, I´ve just made a `pull request` with your latest modifications translated. I have not translated the text in TRANSLATION. adoc and did not include it in the `cs` folder, because whoever wants to translate the english documentation into his own language, he must be comfortable with the english version of "how to".

gltewalt

[15:28](#msg5ccdaf8f3d78aa6c03e429a7)Yes. Thanks Tovim.

[15:34](#msg5ccdb106a4ef0974714b1043)Looks like it hasn’t updated yet @greggirwin

greggirwin

[17:02](#msg5ccdc5932e2caa1aa60ab633)Hmmm. We've had the CI fail before. @x8x, is the change github made to IP addresses possibly affecting this as well?

## Tuesday 7th May, 2019

Intey

[20:07](#msg5cd1e59e6a84d76ed86111f9)Hi. I detect that docs site update recently, and now concrete datatype page inaccessible. Francais is only ok. Where to submit issue?

greggirwin

[20:49](#msg5cd1ef3c8fcdb05d4797041e)I commented on your issue. It seems OK here. Can anyone else confirm?

[21:26](#msg5cd1f7fe0824230a77f67c52)Ah, I see what you mean now, yes, same problem here. Datatype page is fine itself, but not links \*from* it.

[21:27](#msg5cd1f8280f381d0a767804e1)Looks like we have an extra `/datatypes/` segment in the link paths.

Intey

[21:29](#msg5cd1f8a8bdc3b64fcf08d053)yep, my English can be better =)

greggirwin

[21:32](#msg5cd1f9736fd7c11cd87b2ba3)Not your fault at all. Context switching too quickly on my part.

gltewalt

[21:56](#msg5cd1ff02f52a237516f225a6)I think it’s a bug. It prepends the directory with each click.  
Investigating.

[22:28](#msg5cd2068b0f381d0a767868b8)Going to have to put all the links back in SUMMARY.

greggirwin

[22:52](#msg5cd20c3cda34620ff90183c5)So it's their rendering of the links that goes bad. Grrrrr.

gltewalt

[23:33](#msg5cd215b15a887e1cd9abdd58)Apparently... any files not linked to from summary do not get rendered to html - which makes gitbook 'bug out' when sub-links are clicked on that are not in summary.

greggirwin

[23:37](#msg5cd216c6252dbb75151abfb4)Interesting (and frustrating) limitation. :^\\

[23:54](#msg5cd21aa1da34620ff901e9c3)@gltewalt jumped right on it, and his fix has been merged.

## Wednesday 8th May, 2019

Tovim

[14:05](#msg5cd2e212f251e60ffa47c038)@greggirwin (may 07 23:26) ... datatypes page contains no links...  
Me seems that this is OK because the selection of particular types can be made in the front page as well.  
In conclusion to this fact it is possible to held the existence of the Datatypes page (as it is now) as obsolete -  
\*\*unless\** the Datatypes page would again contain links to particular datatypes and the front page would contain no such ones.

gltewalt

[21:33](#msg5cd34b210f381d0a7681a0fb)It will eventually contain an introduction before the list.  
Might turn the list into links, but haven’t decided yet.

## Thursday 9th May, 2019

greggirwin

[01:16](#msg5cd37f83252dbb751524c588)What if we hack our way around it.Have `Datatypes`, the heading, as a link to the datatypes page, where it is now. But have a second one at the end of the nav bar, after `Coding Style Guide`, call it `Datatype List` or something, and have the individual datatypes there, so they still render, but the long list of them is now out of the way, and not obscuring the GUI and other content. Then the datatypes page has links to the individual pages as well.

gltewalt

[04:07](#msg5cd3a7945a887e1cd9b6fa47)Done.

greggirwin

[04:11](#msg5cd3a87b0824230a77027c86)Merged.

Tovim

[09:37](#msg5cd3f4c45d48a24fd0993736)Great.  
It´s nice to have the datatype listing permanently opened when browsing through various types.  
It would still be nicer, were the `Datatype listing` header contractable and expandable in place. I do not know that this is possible in Asciidoc.  
The `Datatypes` page may not need to contain another links to datatypes. Maybe, it would become to this page if it contained some clever introduction to the whole Red datatypes system.

greggirwin

[15:29](#msg5cd447468fcdb05d47a81849)Collapsible sections would be great, but gitbook doesn't support it.

## Friday 10th May, 2019

Tovim

[15:16](#msg5cd595b05a887e1cd9c4e165)From another keg. In the help for `as`:

```
>> ? as
USAGE:  AS  type  spec
type       [datatype! block! ...]
...
```

the `datatype!` type should not be presented, as there existsts (haven´t found any) no value, which could be to this datatype converted.

greggirwin

[19:34](#msg5cd5d23356271260f93d04ac)

```
>> as block! quote ()
== []
>> as integer! quote ()
*** Script Error: cannot coerce paren! to integer!
*** Where: as
*** Stack:
```

## Saturday 11st May, 2019

Tovim

[09:46](#msg5cd699dff52a237516124e73)OK, `integer!` is not presented as a possible type for `as`, while `datatype!` is. Nevetheless:

```
>> as datatype! quote()
*** Script Error: cannot coerce paren! to datatype!
```

meijeru

[13:13](#msg5cd6ca880f381d0a769a2fcc)Aren't we confusing levels here? `datatype!` is a possible type of the first argument to `as`, which means that any \_value_ of type `datatype!` is allowed, including but not limited to `datatype!` itself. However, the result may not be defined for every combination of first and second argument type. See the spec document \[here](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#casting-of-values-as).

Tovim

[15:03](#msg5cd6e435f52a2375161463c9)Exactly as it is written \[here](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#casting-of-values-as ): "The type of the second argument should be in the same \*\*group\** as the (type of the) first argument."  
Type `datatype!` refers to all existing types. "Not all possible related types have their component values stored in identical fashion."  
Had all possible related types of `datatype!` have their component values stored in identical fashion, there would be enough to declare types of both arguments as `datatype!` or maybe more consistently as `any-type` - which is not our case.

greggirwin

[17:26](#msg5cd705ddf52a237516154d46)&gt; Type datatype! refers to all existing types.

That is not correct. All existing types are \*values\*, but if you look at a type hierarchy, `datatype!` is not at the top. See https://github.com/toomasv/red-type-hierarchy/blob/master/Red%20datatypes%20hierarhy.pdf or https://github.com/toomasv/red-type-hierarchy/blob/master/Red%20type%20hierarchy2.pdf

That said, what is your concrete suggestion for improving the problem you see?

Tovim

[18:40](#msg5cd717085d48a24fd0af42fd)Just to omit the therm `datatype!` in the help for \*\*as\** (&gt;&gt; ? as).

greggirwin

[19:09](#msg5cd71dedf251e60ffa65c2fc)Can you show exactly what you mean?

[19:10](#msg5cd71e1d252dbb75153dc11f)That is, mock up the `help` output with what you think would be better.

## Sunday 12nd May, 2019

Tovim

[07:26](#msg5cd7cac3f52a2375161a4bd2)Well:

```
>> ? as

USAGE :  AS  type  spec

DESCRIPTION :  Coerce a series into a compatible datype without copying it. AS is a native! value.

TYPE :     [block! paren! any-path! any-string!] "The datatype or example value."
SPEC:      [block! paren! any-path! any-string!] "The series to coerce."
```

meijeru

[15:32](#msg5cd83c880824230a7721e8c6)This will not work if the first argument is the literal `block!` for example, because the literal `block!` is a value of type `datatype!`. So the typespec of the first argument MUST contain `datatype!`.

greggirwin

[17:50](#msg5cd85d005a1d435d462d5cdb)What @meijeru said.

## Monday 13th May, 2019

Tovim

[13:32](#msg5cd971e45a887e1cd9de97b6)When it is true that by `literal block` has been meant a block, created by using literal syntax then the outcome could by even more interesting:

```
>> dt: [one 2 "three"]
== [one 2 "three"]
>> type? dt
== block!

 >> as dt string!
*** Script Error: as does not allow datatype! for its spec argument
```

\* `dt` is a block! in one situation and a datatype! in another  
\* the `as` procedure fails because its second argument (string!) is in the error message interpreted as datatype!

[14:15](#msg5cd97bfb0824230a772a31db)As it shows, the target format of the `as` procedure is not the second but the first argument:

```
>> as string! dt
*** Script Error: cannot coerce block! to string!
```

Well, I am taking this into account. Will try to set up a relational table.

rebolek

[14:29](#msg5cd97f4b5d48a24fd0bf5461)@Tovim `as` is for related types. It doesn't do conversion, it just changes representation. So you can change i.e. `paren!` to `block!` or `string!` to `tag!`, but not `block` to `string!`. See `any-` types.

Tovim

[19:01](#msg5cd9bef25d48a24fd0c144c4)I see, thank you. Nevertheless - back to my "another keg" at May the 10th: I guess that the word datatype! should not be listed as one of possible arguments in the help message for `as`.  
Me seems that this word is often used as a "shebang" in situations, where there is no proper error message at hand as it is in this example:

```
>> as [any all first]  file!
*** Script Error: as does not allow datatype! for its spec argument
```

The simple truth is that the arguments are incompatible.

greggirwin

[19:10](#msg5cd9c12abdc3b64fcf3e91f3)&gt; I guess that the word datatype! should not be listed as one of possible arguments in the help message for as.

But datatypes are allowed as the first argument. In your last example, Red sees that you passed an invalid type, per the function spec, so that's the error message you get. It hasn't gotten to the point of evaluating the function, to see that the types are incompatible, because the function call itself is invalid.

```
>> as [any all first]  file!
*** Script Error: as does not allow datatype! for its spec argument
*** Where: as
*** Stack:  

>> as block! file!
*** Script Error: as does not allow datatype! for its spec argument
*** Where: as
*** Stack:  

>> as integer! file!
*** Script Error: as does not allow datatype! for its spec argument
*** Where: as
*** Stack:  

>> as 1 ""
*** Script Error: as does not allow integer! for its type argument
*** Where: as
*** Stack:  

>> as integer! ""
*** Script Error: cannot coerce string! to integer!
*** Where: as
*** Stack:
```

Does that help?

Tovim

[19:34](#msg5cd9c6a98fcdb05d47cdf0b6)Thank you too, your first paragraph is very instructive for me and at the same time it reasserts what I have said concerning the "shebang".  
Your examples are illustrations of one comon reason: incompatible arguments.  
This doesn´t work too:

```
>> as datatype! block!
>> as block! datatype!

*** Script Error: as does not allow datatype! for its spec argument
```

greggirwin

[19:42](#msg5cd9c8bae7f42160fa830634)There are cases where values rendered as text are visually indistinguishable (at least until we have mold/all). Datatypes are perhaps the most affected by this, and often trip people up when used with `switch`.

## Monday 27th May, 2019

Tovim

[14:42](#msg5cebf7717c363c75a7515b43)Hi, @gltewalt. I hope it´s you, who commited last changes of the`map.adoc` file. If that is not true, the following post is intended for somebody else engaged. Well:  
\* The example at the line 221 doesn´t work:

````
*** Script Error: remove has no refinement called key
 ```
* Examples in lines 240, 243, 246 produce wrong results:
````

== true ; not ´b, ´a or ´A  
\`  
My applications are Windows 10 and Red-25may-19.

9214

[17:00](#msg5cec1797ecdf942b4c55f931)@Tovim might be a good idea to update your toolchain to the latest release first, and to follow the main branch of development more closely.

greggirwin

[19:08](#msg5cec35c775d9a575a6551465)@Tovim, @dockimbel updated the map docs, as he had the best knowledge of the new changes. The updates are based on commits in the past couple days. As @9214 said, you are probably just out of date a bit.

Tovim

[19:55](#msg5cec40977c363c75a75371f4)I am glad the things has been explained. Now I have the latest Red-27may-19 and the `remove/key` idiom works. Neverthless, differences still exists between the output of the interpreter and the text in the map.adoc file, which I am making the author of the original friendly aware of:  
\* The command in the line 221 (remove/key m 'b) returns

```
== #( a: 1   "c" 3   d: 99)
```

whereas in the text, there is written:

```
== #(   a: 1)
```

\* Examples in lines 240, 243, 246 produce outputs `b, a, A` respectively, whereas in the text, there is written`'b, 'a, 'A`.

greggirwin

[20:56](#msg5cec4eeb879f4478c7f184e4)Confirmed. The examples need to be corrected. @gltewalt would you take care of that?

[20:56](#msg5cec4efb9404bf2aedbd746d)Thanks @Tovim! Will get your PR merged shortly as well.

gltewalt

[22:40](#msg5cec6763d22ba766a20e8823)I’ll take a look

[23:16](#msg5cec6fc483ae782aeee07ece)@greggirwin PR with fixes sent

## Sunday 9th June, 2019

nedzadarek

[15:54](#msg5cfd2bb082c2dc79a57a14ca)As I'm translating \[email doc](https://doc.red-lang.org/en/datatypes/email.html) there is no mention about accessors:

```
>> system/catalog/accessors/email!
== [user host]
```

maybe we can add

```
== Field accessing / accessors (not sure how to name it)

Username:
`` `red
>> e: user1@domain1.com
== user1@domain1.com
>> e/user
== "user1"
`` `

Host value:
`` `red
>> e: user1@domain1.com
== user1@domain1.com
>> e/host
== "domain1.com"
`` `
```

before `== Comparision`?

[15:55](#msg5cfd2bff702b7e5e7657a017)ps. I added space inside 3 backticks so gitter will parse it.

greggirwin

[16:16](#msg5cfd30fb6fc5846bab8c722c)Good catch @nedzadarek. We can model it on date and image, and also need to add a Path Accessors section to pair, time, and event. @gltewalt is quite busy at the moment, but we should probably do the English version first, then translate.

nedzadarek

[16:20](#msg5cfd31c3d4e3840c695a236f)@greggirwin yes, I meant English version first but as I'm not native speaker I want somebody to check (and/or give opinions).

greggirwin

[16:32](#msg5cfd34b7b76eac527acdcb96):+1:

## Monday 10th June, 2019

nedzadarek

[14:50](#msg5cfe6e31e41fe15e7544d0ae)In the \[float doc](https://doc.red-lang.org/en/datatypes/float.html#\_conversion):  
&gt; to binary! interprets the first 8 bytes as a floating point number.

I'm confused. Why should `to binary!` return `float!` (interprets as floating point number). Even if it means "using first 8 bytes" why not just something like this:  
&gt; to binary! will use the first 8 bytes

greggirwin

[17:51](#msg5cfe98bfbf4cbd167c632093)That section could use some cleanup. Converting to and from should be clearer.

The any-list part could remove some prose.

&gt; An any-list! value must contain two numbers. The result will be the first number multiplied with the value of 10 to the power of the truncated second number. `first-number * (power 10 second-number)`

Could be

&gt; An any-list! value must contain two numbers. The result will be `first-number * (10 ** second-number)`

The binary example is backwards from the text. It described `to float!`. And your new text seems better. Beyond that, an example of what happens with truncated data (less than 8 bytes) should either be included, or we should say that's not supported.

gltewalt

[18:44](#msg5cfea516481ef4167b02fbc2)Uhhh.... @greggirwin could you make those changes? (I know you’re already very busy)

I added the accessor part for email! but I can’t tend to float soon

greggirwin

[18:48](#msg5cfea617e41fe15e75467d6c)I'll make a ticket for it in the docs repo, so we don't forget. First one to get to it wins. :^)

gltewalt

[20:06](#msg5cfeb844702b7e5e76625c88):+1:

## Tuesday 11st June, 2019

mikeparr

[08:56](#msg5cff6cae84c08f541412f647)I've just updated Red-by-example, with around 200 new entries. Some of the new entries for functions are simply the docstrings (sorry), and the recent version of Red simplified the automation of this. The main index page is even more massive, and mostly I use the brower 'find' to search it. (Actually, I like the single page, but think that it could be split as well.) http://www.red-by-example.org/index.html

rebolek

[08:58](#msg5cff6d22ff3f016baadfdd26):+1:

toomasv

[10:07](#msg5cff7d5a702b7e5e766785ef):clap:

greggirwin

[16:00](#msg5cffd00abf4cbd167c6b5bdf)Thanks @mikeparr !

[16:01](#msg5cffd04b82c2dc79a58c1d98)It's a long page, but loads instantly for me.

dander

[17:19](#msg5cffe2b018e85b354be626c9)Thanks @mikeparr! I like the single page format, and it's a terrific resource for me.

## Sunday 14th July, 2019

nedzadarek

[15:25](#msg5d2b4962d14e297762ce0158)In the `red_docs\docs\en\datatypes\get-word.adoc` there is missing \*r* in the \*retieves* (line 7 after \*Abstract\*).  
ps. I would push that change myself but I've forked the repo and I've pushed some translations already... so it would be mess.

## Monday 15th July, 2019

gltewalt

[04:06](#msg5d2bfbb801621760bcb7ac3b)Fixed

[04:16](#msg5d2bfe15202bb93f00a5e5e0)@greggirwin The binary example is backward?

[04:17](#msg5d2bfe473b41924785bf4e66)

```
* `to binary!` interprets the first 8 bytes as a floating point number. If there are fewer than 8 bytes, #{00} bytes are prepended.
```

red  
&gt;&gt; to binary! 42.3  
\== #{4045266666666666}

```

```

## Tuesday 16th July, 2019

nedzadarek

[17:43](#msg5d2e0ccad14e297762e260dd)thank you

greggirwin

[19:06](#msg5d2e2049d14e297762e2ef75)@gltewalt backward meaning that floats should always contain 8 bytes? Or that zero bytes are not prepended?

[19:09](#msg5d2e20f3eab6cd77637e26db)@dockimbel, should floats convert to `char!`? I know it's easy, but what is the use case?

## Thursday 18th July, 2019

nedzadarek

[04:51](#msg5d2ffabe54d3383937291ffd)@greggirwin I think he meant "as floating point number" part.

## Thursday 25th July, 2019

Phryxe

[13:14](#msg5d39ab420bb0ac39beb1e902)The link from "The source code for the `gpio://` scheme can be found there." in latest article shows a 404 error.

[13:17](#msg5d39abf86ece3c31b3f909c6)There is another dead link to the same file in the end of the article.

endo64

[13:19](#msg5d39ac480bb0ac39beb1f227)Thanks @Phryxe  
Correct URL should be https://github.com/red/red/blob/master/environment/schemes/GPIO.red I'll inform the team.

9214

[13:22](#msg5d39ad312e5e4a3e9f6c157b)@Phryxe thanks, fixed. Article was written prior to `port-type` branch being merged into master.

## Wednesday 31st July, 2019

ralfwenske

[03:56](#msg5d411171e2802b67909e9396)In `https://doc.red-lang.org/en/preprocessor.html` is this example

```
Red []
#macro pow2: func [n][to integer! n ** 2]
print pow2 10
print pow2 3 + pow2 4 = pow2 5
```

last line should be:

```
print [pow2 3 "+" pow2 4 "=" pow2 5]
```

greggirwin

[05:49](#msg5d412bdeb0bf183ea371a695)@gltewalt :point\_up:

endo64

[06:53](#msg5d413ad77bcc41678f030966)@ralfwenske I think not, when you compile your script, the output is as below: (different from running the script in REPL)

```
D:\test.exe
100
true
```

[06:55](#msg5d413b4f5a72fc7ba4cb1a48)And you can see the details by using `expand-directives`:

```
Red []
#macro pow2: func [n][to integer! n ** 2]
print pow2 10
print pow2 3 + pow2 4 = pow2 5
probe expand-directives [pow2 3 + pow2 4 = pow2 5]
```

Output:

```
100
true
[9 + 16 = 25]
```

ralfwenske

[07:01](#msg5d413cb25a72fc7ba4cb23cf)Thanks @endo64 I start to realise that preprocessing for interpreter doesn’t make that much sense.  
(… would be nice though if we could say what runs interpreted runs compiled - and vice versa :) )

endo64

[07:12](#msg5d413f7120f75e7ba5594677)Yes, that is a limitation, but may be change in the future.  
2 other points:

You can also see the expanded version of your script by using `--show-expanded` argument during the compilation, for easier debugging:

```
Red []
#macro pow2: func [n][to integer! n ** 2]
print pow2 10
```

Output:

```
Compiling D:\Projects\Red\red\build\bin\test.red ...
...using libRedRT built on 30-Jul-2019/13:43:21
[
    print 100
]
...compilation time : 29 ms
```

[07:19](#msg5d41411dc4aca715b28af459)And you may examine `system/lexer/pre-load`, default value is `none` but if you put a function there it will be called during the scanning (on REPL only, no effect on compiled exe)

```
>> system/lexer/pre-load: func [s] [replace s "*" "+"]
== func [s][replace s "*" "+"]
>> 3 * 5
== 8
```

It can be used to extend to replace macros on REPL. There are better examples for use of `pre-loader` from @toomasv and others.

9214

[09:05](#msg5d4159f502abe16c6489e129)&gt; would be nice though if we could say what runs interpreted runs compiled - and vice versa

Everything wrapped in `do [...]` is interpreted, the rest is statically compiled. With `-e` everything is interpreted.

[09:09](#msg5d415ab645775115b370f93a)@endo64 I would argue against suggesting `pre-load` to newcomers (and pretty much everyone else), not until we get a decent reader macros support.

And you don't need compilation with `-s`, using `expand` from console is enough for quick experiments.

ralfwenske

[09:18](#msg5d415cdec4aca715b28bc65a)Thanks @endo64 @9214 It all is a great learning experience - and I enjoy very much the language (Rebol/Red) plus this great helpful community. Thank you all.

## Thursday 1st August, 2019

endo64

[07:46](#msg5d4298f27c87746165ef40e1)@9214 You are right, promoting `pre-load` is not a good idea, I just mention it because @ralfwenske said that he wants to learn &amp; play with different aspects.

## Wednesday 21st August, 2019

meijeru

[16:02](#msg5d5d6b0e5ba4a84f6966db8a)An interesting feature emerged from discussion of issue #3359: it is allowed to `make` action and native values. This is basically because the toolchain itself uses `make` to pre-define all actions and natives, and it was not deemed necessary or useful to forbid this feature after the initialization phase. However, (1) only existing actions and natives can be (re)made, and (2) the function spec has to be suppplied and if you get that wrong, a crash may occur. In "my" spec document, I have added wording to the effect that this is not recommened. Apparently, R3 alllowed it, but R2 did not.

greggirwin

[17:56](#msg5d5d85ccb059db27dfb7b6b4)The above link should be https://github.com/red/red/issues/3359

meijeru

[20:17](#msg5d5da6bf8e8dde63d813d987)Correct. Any comments on the substance?

greggirwin

[23:20](#msg5d5dd1b28e8dde63d814fb8c)Nenad's comment on the ticket itself seems sufficient.

## Friday 23th August, 2019

meijeru

[14:52](#msg5d5ffd9c07d1ff39f86e1baa)Something to note somewhere: a comma `,` is allowed as replacement for the decimal point. Now because floating point numbers starting with a decimal point are allowed, and on the other hand a decimal point is also allowed in a `word!` value, one has the following possibilities:

```
>> b: load "a,1" print [mold b type? b]
[a 0.1] block
>> b: load "a.1" print [mold b type? b]
a.1 word
```

It appears that a number starting with a comma does not need to be separated from a preceding word by whitespace.

9214

[15:41](#msg5d60090de403470ab6c36f1f)@meijeru https://github.com/red/red/issues/3569

## Saturday 24th August, 2019

meijeru

[08:35](#msg5d60f6b410bb5d2db06022ac)My point is different from that in the issue quoted: it is about the need for separation...

[08:35](#msg5d60f6e6048bfd2d419bb0c7)Also, it is not a bug/issue, just a note worth documenting.

[11:12](#msg5d611b9438f9c27238c56386)Another gotcha: in order to check if a function refinement has been specified in the call, the function body can do an `if` but when the refinement carries further arguments, one sometimes sees a check on those directly: `if`. I could cite various lines in the Red toolchain code. This works most of the time, since optional arguments which are not present in the call are initialized to `none`. However, when the type of the optional argument is `logic!` and it IS present in the call as `false`, this `if` breaks down.

9214

[11:14](#msg5d611c1510bb5d2db0610a21)Are there any functions in Red codebase that use more than single argument for their refinements?

meijeru

[11:15](#msg5d611c6da498b6723789b712)Do you mean like `func [... /a b c ...]` ?

9214

[11:16](#msg5d611c74a080d70ab572060a)@meijeru yes.

meijeru

[11:18](#msg5d611d0f3c1aba311bc28565)That has no bearing on my above remarks. The problem starts when you do, inside the body of the function: `if b [... use b ...]` instead of `if a [ ... use b ...]` and `a` happens to be `true` i.e. specified, and `b` happens to be `false`. Then the first coding idiom is dangerous.

9214

[11:26](#msg5d611edaa080d70ab57216bd)@meijeru my point was - why separation between refinements and their arguments exist in the first place, if, as far as I know, most refinements use only one argument? You can, in theory, just use refinement value itself as an argument.

```
func [/refinement argument][if refinement [use argument]] ; refinement is just a flag, argument bears the actual value
```

vs

```
func [/refinement][if refinement [use refinement]] ; refinement carries the value AND serves as a flag of its presence
```

Your example is a "desync" of `refinement` and its `argument`. In what I described above there's nothing to synchronize in the first place, but... cases where `refinement` is `logic!` or `none!` are still tricky.

[11:31](#msg5d612000e403470ab6caa163)What your idiom states is "first check refinement, which is always `logic!`, then check and use its argument(s), which, by design, may or may not be an actual `logic!` or `none!` value(s)".

meijeru

[11:33](#msg5d61206c048bfd2d419ccd54)This is an interesting design point. But how would you do this lexically? In order to specify the expression which is the value of the refinement, before making the call, you would have to do something like `/refinement:`, introducing a "refinement set-word".

9214

[11:34](#msg5d6120e235f914538d79b3f6)@meijeru uhm... there's no need for additional lexical forms. You just don't specify arguments and use refinement itself as a (typed) argument. Nevermind though, it's unrelated to our discussion. But it's worth checking R2, R3 and Red code for presence of more than single argument for refinements - that would actualize the language design point. Functions with more than 3 arguments (both mandatory and optional) is already a code smell, so, we need some baseline to argue when it comes to library implementations and coding style.

meijeru

[12:05](#msg5d6127f34b1189084e579ae3)@dockimbel What do YOU think?

greggirwin

[18:48](#msg5d61867c048bfd2d419f7fe5)I don't know of any standard funcs that take more than one refinement arg, but I have written funcs like that myself in the past. There is no problem, and nothing special about logic args. You have to code for them just as you would anywhere else, when a value can be none or false.

## Sunday 25th August, 2019

meijeru

[09:17](#msg5d62521410bb5d2db068d8cc)@9214 I find the discussion about refinement usage worth pursuing a bit more, but have addressed it in a private message.

[19:58](#msg5d62e86610bb5d2db06cd734)@gregg See `layout` in `VID.red`. It is the only example in the whole codebase with a refinement (`/parent`) that has 2 arguments... How I know? I did an exhaustive search by program, which is just a variation on the different programs like the concordance that I have previously written..

## Monday 26th August, 2019

9214

[14:09](#msg5d63e7fedbf5ae2d42ca31e6)@meijeru it's interesting how this pattern parallels common Forth idiom - use no more than 3 cells on a stack; something to note on "Red for X" pages.

greggirwin

[21:50](#msg5d645438f2821072aa1c413b)Thanks for the research @meijeru !

dander

[22:33](#msg5d645e3cf2821072aa1c9165)should the properties with spaces such as `line width` \[here](https://doc.red-lang.org/en/draw.html#\_default\_values) be hyphenated instead?

## Sunday 1st September, 2019

nedzadarek

[15:12](#msg5d6bdff5d3fda15e74493233)Is it worth linking to the \[url wiki definition](https://en.wikipedia.org/wiki/URL) (or its translations) in the url documentations?  
I mean this line:  
&gt; == Abstract  
&gt;  
&gt; An `url!` value represents a reference to a network resource and allows for directly expressing Uniform Resource Locators.

greggirwin

[21:08](#msg5d6c3344d3fda15e744b89f2)I don't think so. Either we choose a single ref, or clutter with multiple links to wikipedia, IETF specs, etc.

## Thursday 5th September, 2019

9214

[22:26](#msg5d718ba0a08e2b4bd29471d1)\[Culprit](https://github.com/red/docs/commit/df368110e1c459638669dc2d89b62b3cdc3dc892#diff-515f3e4ae2eee59d93282f995e795df3L447)

[22:31](#msg5d718ccaae44a8412488aa95)@greggirwin https://github.com/red/docs/pull/190

greggirwin

[23:48](#msg5d719eb850508949d3e3b0d0)Thanks!

## Friday 6th September, 2019

hiiamboris

[17:54](#msg5d729d3f54e7c649d49c1859)Regarding https://github.com/red/red/issues/3337#issuecomment-528502174 (the last @dockimbel's comment), I believe it should be noted in the \[reactivity docs](https://doc.red-lang.org/en/reactivity.html) that `deep-reactor!` tracks changes not only in series but also in composite scalars (pairs, tuples, date, time). In contrast to `reactor!` that does not.

greggirwin

[18:12](#msg5d72a196b9abfa4bd36082a8)@hiiamboris agreed. Would you please open a ticket in the red/docs repo for that?

hiiamboris

[18:28](#msg5d72a55d3b1e5e5df1647992)mkay

## Thursday 10th October, 2019

TheHowdy\_gitlab

[08:40](#msg5d9eee8a874aeb2d231e7288)Just wanted to note that the "Getting Started" guide on the Red website (https://www.red-lang.org/p/getting-started.html) is out of date; the documentation says that the GUI -Systemis still Windows only, and the first "Going further..." link is dead (redprogramming.com does not seem to be online)

lucindamichele

[22:36](#msg5d9fb2605173c33ca1a38545)@TheHowdy\_gitlab Thank you, and we know...there are a number of changes we are working on.

## Saturday 19th October, 2019

GiuseppeChillemi

[20:32](#msg5dab72f1ea0d6159fd940611)Hi, this link gives error: https://doc.red-lang.org/Map!.html . I took it from here: https://www.red-lang.org/2015/06/054-new-datatypes-exceptions-and-set.html  
It should be changed to this: https://doc.red-lang.org/en/datatypes/map.html

## Sunday 20th October, 2019

greggirwin

[18:14](#msg5daca41924af474d28e5f902)Thanks! @gltewalt, can you patch that at your convenience?

## Monday 21st October, 2019

loziniak

[14:36](#msg5dadc2739825bd6baca0d166)

```
>> a: object [b: "test"]
>> find a 'b
*** Script Error: find does not allow object! for its series argument
*** Where: find
*** Stack:  

>> ? find
USAGE:
     FIND series value

DESCRIPTION: 
     Returns the series where a value is found, or NONE. 
     FIND is an action! value.

ARGUMENTS:
     series       [series! bitset! typeset! any-object! map! none!] 
[...]
```

Should `find` accept objects or not?

9214

[14:50](#msg5dadc598fb4dab784adc1ed9)@loziniak https://github.com/red/red/commit/7b1eeb76a6eb2c5c31e8407637fea5664ace61c2

## Saturday 16th November, 2019

loziniak

[12:58](#msg5dcff2675eb2e813db355905)@rebolek perhaps it would be nice to mention `#get` and `#in` directives in this document?: http://red.qyz.cz/red-system-from-red.html

## Sunday 1st December, 2019

mikeparr

[20:24](#msg5de421871659720ca8df4744)Future of http://www.red-by-example.org/  
Over the past few years, Arie and myself (more recently) have operated and updated the pages. Currently Arie is quite ill, and I am not particularly inspired to do much updating. Also, Arie pays to host the site, and he wishes to stop paying.  
So, we are looking for someone to:  
\- rehost the site  
\- maintain it (I can advise, initially)  
Any offers?

GiuseppeChillemi

[20:44](#msg5de426396a85195b9eddc63d)Great project. It would be good to convert it to a wiki so the community can maintain it.

[20:45](#msg5de4264c05eec2433db6fe69)My blessings go to Arie.

## Monday 2nd December, 2019

greggirwin

[02:54](#msg5de47d0326eeb8518f50eee8)My best to Arie as well. We all appreciate the effort both of you have put into it. Ping me in a week if I don't reach out before then.

mikeparr

[09:18](#msg5de4d6f305eec2433dbb9a94)Thanks for the comments re Red BY Example. The initial crucial issue is hosting.

endo64

[21:05](#msg5de57c935ac7f22fb54c588e)@mikeparr &amp; Arie, thanks for all your efforts. Hope Arie will get better.

## Monday 9th December, 2019

loziniak

[14:55](#msg5dee6050f65fec1c8eee1c17)What infrastructure does hosting require? What are the costs? Can it be moved to another place?

[14:57](#msg5dee60f79319bb519008bf76)@mikeparr ↑↑↑

[15:01](#msg5dee61c8550662459897c3e1)I could host it on my Linux VPS, if somebody provided a (sub?)domain.

## Tuesday 10th December, 2019

mikeparr

[19:07](#msg5defecea05eec2433d0c98bb)@loziniak Red-by-example. It is a relatively simple website - a few HTML pages and images. I'm not sure if anyone wants to do major updates to it, but new pages are generated by editing offline and running a Red program to generate new indexes etc.

## Wednesday 11st December, 2019

loziniak

[11:15](#msg5df0cfcfe47fb31eb792625b)That's fine for me. @mikeparr would you mind if a GitHub repo was created with all the sources and Red scripts, so anybody could fork it and make PRs? My plan is I would set-up a cron on my server to pull the sources from GitHub, and generate HTML to be served.

I can host it under subdomain of my personal domain, but probably it would be best of somebody in posession of a Red-related domain could make a sub-domain for RBE. Does anything comes to anyone's mind? @greggirwin ?

greggirwin

[23:59](#msg5df182e2f1cc6c27ea330f23)@loziniak a github repo sounds fine, but it doesn't need to be under an official Red domain. We can sponsor the cost for domain registration of red-by-example.org though.

## Thursday 12nd December, 2019

dander

[00:22](#msg5df1882af1cc6c27ea3331f9)I wonder if something like GitHub pages could host it

loziniak

[11:48](#msg5df228f77ce7ea1e356ef50a)@dander not bad idea, this could be `red-by-example.github.io`. This would require creating a GitHub organisation called \*red-by-example\*, and anybody could be a part of it if added to it's "people". The problem I see is that somebody could make PRs or issues in repo dedicated for rendering output, instead of source repo. But perhaps it's not a big problem, and these people could be redirected to the right place. Also there could be info in README.md, that it's not the right place for contributions.

[11:50](#msg5df2297ee7265623012f3503)A solution that @greggirwin proposes has benefit of keeping the original site's address and domain. But perhaps it's not as transparent as GitHub pages?

[11:52](#msg5df229f80995661eb8d19e19)@greggirwin you mean year-by-year costs? I think Red Foundation would be best for the domain's owner.

greggirwin

[22:32](#msg5df2c0050dc628523e25f380)Yes on costs.

Github pages is fine, if it works. Then it's just a repo as well.

## Friday 13th December, 2019

mikeparr

[08:17](#msg5df34936ce2b2e652bc9ecee)Thanks @greggirwin @loziniak for red-by-example ideas. I don't understand most of it (not into GIT) . The official Red docs have improved over the years, I'm not sure if anyone would wish to continue updating RBE.

loziniak

[09:25](#msg5df359257d382b523f6c9a61)Official docs lack functions description and, mostly, examples! I had a couple updates in mind myself. Surely somebody else will also have.

[09:31](#msg5df35a58ce2b2e652bca639d)I'll go with GitHub pages, and we'll see how it works. Perhaps we'll have some time to change our minds and go with original domain + my hosting, until @mikeparr takes his site down :-)

greggirwin

[17:07](#msg5df3c562e47fb31eb7a734bb)Thanks @loziniak. Let us know what help you need.

@mikeparr RBE is very different than reference docs right now, and I don't want to see it just vanish.

mikeparr

[17:18](#msg5df3c7ff578ecf4b1f99a6d0)Thanks @loziniak - I'm away for the weekend, back Mon.

## Friday 27th December, 2019

loziniak

[14:32](#msg5e0616160c3aeb107d5fdf7c)Hello. I've got the RBE sources from @mikeparr . Unfortunately, `red-by-example` organization name is already taken. If anybody knows the owner, I'd like to contact him/her. Meanwhile, I create new one. `redbyexample`.

[14:33](#msg5e061630d5a7f357e68e6c2c)https://github.com/red-by-example

[14:36](#msg5e0616e0eaa2cd096fae73c0)https://github.com/redbyexample

[15:16](#msg5e062069b4ed68096ee9a0f2)@mikeparr it's important to decide on license. I suggest GNU GPL3: https://choosealicense.com/licenses/

[15:37](#msg5e06254ad5a7f357e68ed3fa)I added a simple \*readme\*, and the rest is uploaded in unchanged form:  
https://github.com/redbyexample/red-by-example

dander

[18:34](#msg5e064eb90c3aeb107d616cad)Since the code snippets will tend to be copy-pasted by people, and could end up in users' applications, it seems like GPL might be too restrictive

mikeparr

[20:44](#msg5e066d450fd3413f4c64d3b3)http://www.red-by-example.org/ is owned by Arie.

greggirwin

[20:47](#msg5e066df7eaa2cd096fb0d37d)Thanks for moving on this @loziniak. I agree with @dander that GPL may not be a good fit, for the reason he cites.

mikeparr

[20:56](#msg5e066ff707a1a67d1d6d0385)Yes, thanks @loziniak - Arie wants to stop paying for hosting, I guess registration of rbe name can be transferred?

dander

[22:29](#msg5e0685cd04a1900497c07b9c)According to the \[GitHub policies](https://help.github.com/en/github/site-policy/github-username-policy), usernames are expected to be actively used. I presume this would apply to organization names as well. To paraphrase, it says that you should first try to use the rename feature, then contact GitHub support to ask the name to be transferred.

## Saturday 28th December, 2019

Nomarian

[19:58](#msg5e07b3d30fd3413f4c6ce48a)choose a copyfree license

[19:58](#msg5e07b3e66ff7ae03fc625aa5)the entire library of rosettacode is completely useless for this very reason

## Sunday 29th December, 2019

loziniak

[12:33](#msg5e089cfd6ff7ae03fc67eb58)@greggirwin \[said](https://gitter.im/red/docs?at=5df182e2f1cc6c27ea330f23) they can pay for the domain, so domain can be transferred to Red Foundation (if I understand everything well). Hosting can be safely stopped by Arie, since we already have all the sources.

I think the last thing Arie and you have to do is decide on the license. @dander @greggirwin @khwerz maybe you could suggest something more permissive that could suit better? Another thing connected to this, that keeps me wondering – how important is that a commit that changes a license is made by @mikeparr ? I invited him to the GitHub organisation, but @mikeparr said he's not familiar with Git, so do you think that it's ok if I add the license with a link to the Gitter post, where @mikeparr will decide on license?

@dander thanks for suggestions, I'll try with rename and unsquat `red-by-example` account.

greggirwin

[19:53](#msg5e0904446ff7ae03fc6a82ce)The foundation will cover domain costs, and hosting if necessary. Just need registrar info to transfer I think.

License, yes, if @mikeparr chimes in here, we can point to this chat so people know we're abiding by his and Arie's wishes, and not trying to co-opt their efforts.

Is there a reason not to use BSD3, as we do with Red itself? It would eliminate confusion over docs vs code sample reuse.

## Tuesday 31st December, 2019

Nomarian

[17:31](#msg5e0b860c0c3aeb107d82909b)I know there was a reason for rms to make and use the GFDL, but all that's rusty info for me

[17:36](#msg5e0b871cd31dba03fdd69383)but red is a strange language, because the code is documented, you don't have a help file which could use another license, also BSD itself licenses the documentation using another license as you can see https://www.freebsd.org/doc/en\_US.ISO8859-1/books/handbook/legalnotice.html

[17:37](#msg5e0b875e0c3aeb107d8296ca)of course, I might be incredibly confused on the matter, also this is well above my pay grade

[17:38](#msg5e0b87af833c373f4d89c040)you can tell the gpl is a problem, a good example is toybox, which was made as a relicensing of busybox

greggirwin

[20:08](#msg5e0baaacb4ed68096e0cb2ee)We probably need to look at official doc licenses as well, but BSD should be applicable to any media. Should be less confusing than mixing special purpose licenses, if there's not a strong need for them.
