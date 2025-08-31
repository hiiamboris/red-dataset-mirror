# Archived messages from: [gitter.im/red/docs](/gitter.im/red/docs/) from year: 2018

## Thursday 4th January, 2018

Phryxe

[04:47](#msg5a4db1fa0163b02810ad85e5)@mikeparr Maybe add \*\*exclude\** to \*Category: Sets\*?

mikeparr

[08:27](#msg5a4de5860163b02810ae67ac)@Phryxe exclude - noted!

## Friday 2nd February, 2018

JiaChen-Zeng

[06:17](#msg5a740260ac509d207daaf908)\[!\[image.png](https://files.gitter.im/red/docs/xRHN/thumb/image.png)](https://files.gitter.im/red/docs/xRHN/image.png)

[06:19](#msg5a7402f5ce68c3bc74355894)\[!\[image.png](https://files.gitter.im/red/docs/ycLK/thumb/image.png)](https://files.gitter.im/red/docs/ycLK/image.png)

[06:21](#msg5a74035da3447aac752f3c79)\[!\[image.png](https://files.gitter.im/red/docs/G1PF/thumb/image.png)](https://files.gitter.im/red/docs/G1PF/image.png)

[06:22](#msg5a74039a7dcd63481f09a305)I find inconsistent formating in red/docs. Would it be better to make it consistent?

[06:28](#msg5a7404f4a3447aac752f42bf)I am translating the documents. Sometimes it is not easy to know whether it refers to the code, which makes me unsure if it is good to translate it or keep it as is.

[06:29](#msg5a740543ce68c3bc743563bd)\[!\[image.png](https://files.gitter.im/red/docs/QZMJ/thumb/image.png)](https://files.gitter.im/red/docs/QZMJ/image.png)

[06:29](#msg5a7405524a6b0dd32b7ba3f2)\[!\[image.png](https://files.gitter.im/red/docs/UOh6/thumb/image.png)](https://files.gitter.im/red/docs/UOh6/image.png)

[06:31](#msg5a7405ae36de78850cdec80c)And it has already caused inconsistency across different translations of the documents.

[06:36](#msg5a7406dbce68c3bc74356bfd)As above shows, "Options" is translated in Japanese translation but not in Cesky one. In my opinion, it is better to keep it as is in Chinese translation in this case.

[06:38](#msg5a7407607dcd63481f09b463)I think it is better to be written as `option`(formatted as a code block).

rebolek

[06:50](#msg5a740a34ac509d207dab1d23)I agree that it's better to keep it as "Options" as @Tovim did it in Czech translation. He put very lot of thoughts to the translation and while I may not agree with some of his decisions, I still think it's very great job.

gltewalt

[07:32](#msg5a741403e217167e2c30f3de)I think it is time to organise and trim the fat on some of the documentation. Wiki is sprawling out of control. (To me)

[07:33](#msg5a74142d7dcd63481f09fc8b)And probably rewrite some entries

[07:33](#msg5a74145998927d574569b18a)Awesome list might be better than Wiki

Phryxe

[07:40](#msg5a7415d1ce68c3bc7435b63a)You always have to organize a wiki, with categories (incl. category index) and/or with custom pages with links. Search isn't enough, IMHO.

koba-yu

[13:30](#msg5a7467f4ce68c3bc74377c0f)@AT-Aoi Thank you for your suggestion! I agree with `Options` because it is actual field name. (I also feel `options` is another choice for language without capitalizing, like Japanese and Chinese...isn't it more accurate?)

9214

[13:39](#msg5a7469faac509d207dad1f6d)since @gltewalt mentioned it and ICO dust is settled, maybe it's time to consider Discourse as second community platform, @greggirwin ? IMO it's better suited for categorized discussions and body-of-knowledge maintaining

rebolek

[13:39](#msg5a746a24e217167e2c32dd8e)&gt; ICO dust is settled

why do you think so?

9214

[13:40](#msg5a746a4e6117191e61e67dba)what, are you saying there will be next round? :D

rebolek

[13:41](#msg5a746aa2a3447aac75317afc)it will be over when we will start seeing new commits in GitHub ;)

9214

[13:43](#msg5a746af17dcd63481f0bdb20)too bad there's no :salt: emoji

JiaChen-Zeng

[13:44](#msg5a746b53ce68c3bc74378e4b)I asked @qtxie about this question. He says I can change that formating in Chinese translation.

koba-yu

[14:44](#msg5a74795fe217167e2c3339c3)@AT-Aoi Could you add comment on \[this issue](https://github.com/red/docs/issues/31) if you find something wrong on Japanese document?

JiaChen-Zeng

[14:50](#msg5a747ab06117191e61e6dd9b)@koba-yu OK. I will do if found.

koba-yu

[14:51](#msg5a747ad4a3447aac7531dc03)@AT-Aoi Thank you :smile:

greggirwin

[23:22](#msg5a74f29f4a6b0dd32b810830)@gltewalt @Phryxe I don't generally like wikis because they are often difficult to organize, in that it's a separate step. The way I've tried to use the wiki so far is to gather information that would otherwise be lost in chat, so we can extract it into "real" documentation later. Docs are \*very* high on our priority list, as we think there will be a flood of new users when the Android release hits. Also high on our list is laying out some base rules for token rewards, so we can encourage people to take on this task.

dander

[23:51](#msg5a74f96aac509d207db04665)@greggirwin I'm curious about what you consider to be the main distinctions between a wiki and a "real" documentation system. All I can think of is the access model being different, so you have more people editing the wiki, but I'm probably missing the main points. I've been thinking about this a lot lately for my day job for generally trying to promote sharing and organization of information, but it seems like a challenging problem

BillDStrong

[23:53](#msg5a74f9ffac509d207db04912)I would say a Documentation system can have similar access models to the wiki, but the main thing is that Documentation should be highly curated.

[23:56](#msg5a74fab3b3c4a0d376d3dbce)And Documentation has expected forms of hierarchy that a wiki is not required to follow. A wiki's main UI is always intended to be search, which is a poor interface if you are wanting to learn a new domain, such as a programming language or API.

dander

[23:58](#msg5a74fb114a6b0dd32b812d60)Those are good points, but is there any reason the wiki couldn't be highly curated? Is it just a matter of not enough work being put into it? Or not having an overarching design guideline or wiki manager keeping things clean/organized?

## Saturday 3th February, 2018

BillDStrong

[00:00](#msg5a74fba736de78850ce44db7)Certainly those can help mitigate these issues. It doesn't really solve the interface issue.

[00:01](#msg5a74fbd736de78850ce44e94)And @greggirwin will probably have other issues that he can point out.

gltewalt

[00:02](#msg5a74fc2f6117191e61e9dd68)Well, in my experience, github wiki search is... not good

dander

[00:04](#msg5a74fc977dcd63481f0f1e05)sure, the platform limitation certainly seems valid

[00:14](#msg5a74fedf98927d57456ee73e)So to @BillDStrong's point, the wiki pages are created in a flat layout with no built-in hierarchy, but there could be a wiki page (or tree of pages) which contain that hierarchy, like a table of contents. It seems like the main page is moving toward that model more and more (as things get harder to find, someone steps forward to organize some of that information)

[00:15](#msg5a74ff2f4a6b0dd32b814251)@greggirwin I wonder if the main difference is that a documentation project probably starts with the organization and grows top-down, where a wiki typically starts with lots of small notes, and grows bottom-up?

BillDStrong

[00:16](#msg5a74ff6eac509d207db060f0)Yes, but that is the inherent format for Documentation. That hierarchy is built in, ant doesn't require that extra step of wading through all the other stuff to decide if it is useful or needed.

[00:17](#msg5a74ff8898927d57456eeabb)^^ You beat me to it.

greggirwin

[02:07](#msg5a7519776117191e61ea4990)You're all on track with my thinking. If you start at https://www.wikipedia.org/, where do you go from there? Yes, it's big and general, but also has a huge number of editors willingly contributing to it. I applaud them with all my might.

Drill down to https://en.wikipedia.org/wiki/Outline\_of\_computing. Don't search for it, navigate to it with links. I'll wait.

On that page, do the entries make sense to you? Can you discern a pattern that makes it clear why something was included, and in the order they are? I'm not criticizing Wikipedia in any way. I use it, and I support it with donations. It's a valuable resource I use quite often. But does it look like it was \*designed\*? Is that important? Do things that are carefully designed work better? Do we like them more? Are they more appealing? If so, why?

Can you build a wiki that is designed and organized, with a TOC, a clean hierarchy, curated content, and a consistent "voice"? Yes. Is it easy? No. People want to write about what interests them, but not many want to do the grunt work, even if they are able to, in that area. And the organizer needs to know the material, in order to collate it effectively. Organizing a wiki is like documenting someone else's code. We might also analogize it to writing a novel versus being an editor curating a collection of essays or short stories. The latter may have excellent content, but they don't tell a story. It's very hard to co-author material. This I know from experience.

There is also a palpable difference between poor, mediocre, and great writing (of any kind). We got to talk with Carl a bit about documentation, and he reminded us that writing just The Core Guide for Rebol was months of focused work. It set a high bar that we still refer to because of that.

Growing docs bottom up is hard. Is that how we tell people we write software? "Yeah, I just write some things that are on my mind, you know, do some research and make notes, write some functions, kind of all over the map with what comes up. Then I pull all that together into an application. I don't know what it will look like when it's done, or even what it will do, but it's got all these great pieces in it."

I'm reading a book now, about Claude Shannon, and the key point that there's a difference between \*information* and \*meaning\*.

Most important, and this is very difficult now because of how things are judged, but I believe that quality is much more important than quantity. We don't need \*more* documentation, necessarily, we need \*better* documentation. Nenad has given us some examples, if you look at the content on https://doc.red-lang.org. He is following in Carl's footsteps, but it takes a lot of time and effort. This is an area we really need help in, and where others can contribute a lot of value. To that end, I think the wiki is a great place to make notes, collecting information. Those should then be used as reference material for authors who want to create \*real* ;^) documentation, and we can then link the wiki pages to those.

PeterWAWood

[04:45](#msg5a753e66a3447aac7535aecb)One big issue with the Github wiki is that authorisation is on/off for the whole wiki. If you have a GitHub account, you can updated the wiki. This makes curating the wiki impractical.

JiaChen-Zeng

[07:34](#msg5a75661b6117191e61eb5170)https://doc.red-lang.org/en/libred.html#\_redblockvb

[07:36](#msg5a756660ce68c3bc743c2cf4)

```
vb
redProbe redBlockVB(42, "hello")   ' Creates the [42 "hello" hi] block
```

Where does the `hi` come from?

rebolek

[08:16](#msg5a756ff7ac509d207db1e5a6)I believe that's an error in documentation.

## Sunday 4th February, 2018

BillDStrong

[01:11](#msg5a765dc036de78850ce9f9c4)Another way to look at the Documentation vs Wiki issue is the difference between "know how" and "know that". Wikis are useful for users that are ramping up to the know how stage of knowledge, which is foundational to know that. (You need to know how to program a simple function before you can start reading complex functions. )

[01:16](#msg5a765ee9b3c4a0d376d96e78)Documentation excels at know that type of knowledge, such as "Red has a built-in color type that is three or four 8bit numbers! seperated by periods."

[01:17](#msg5a765f3ee217167e2c3bdd0a)Wikis can be used for both more easily, which is one of the reasons they tend to have less of one single "voice" as compared to documentation.

[01:19](#msg5a765fb24a6b0dd32b86be25)Which is one of the reasons that Wikipedia is great as a starting point for users new to a subject, but experts usually look down upon it.

greggirwin

[19:36](#msg5a7760c5a3447aac753ea18e)Wikipedia, being an Encyclopedia, is great when you know what you're looking for. Dictionaries suffer the same problem. How do I look up how to spell a word I don't know how to spell?

gltewalt

[19:47](#msg5a77635ee217167e2c3ffe66)If I remember right, search in the Wiki doesn’t seem to work if you aren’t searching from the root page

[19:50](#msg5a7763ecce68c3bc7444756b)I’m not too picky about design, I just think it’s time to hit the pause button and reign in documentation sprawl

## Friday 9th February, 2018

mydoghasworms

[11:33](#msg5a7d86fde217167e2c61a825)To lend weight to @greggirwin's argument about wikis (although I dearly love them), please compare https://code.kx.com/wiki/Main\_Page with http://code.kx.com/q/. Kx moved their whole body of documentation from MediaWiki to MkDocs. While, presumably, you could have created a similar front page on MediaWiki, you would be terribly lost to browse the documentation by topic.  
Confluence (Atlassian's wiki product) organizes pages hierarchically and therefore provides a similar navigation structure, but it's not free! (Though you should maybe see whether they offer free versions to open source projects). What Confluence has got going for it is a really good editor.  
But in the end, it is probably about who you trust to edit the pages. If not everyone is on the same page (excuse the pun) in terms of content and structure, you will end up with a shambles, regardless of how good the tool is. (We have Confluence at work but no thought has been given to governing the structure. The result is the proverbial dog's breakfast).  
What is good about having an existing wiki is that it can serve as input to whatever new body of documentation is finally built.

greggirwin

[16:12](#msg5a7dc871f283b8e5463edf98)+1

## Thursday 22nd February, 2018

meijeru

[14:44](#msg5a8ed7456f8b4b9946aa30b3)I seem to remember a previous drive to make all docstrings of functions etc. end in a full stop `.` - if confirmed, I am happy to provide a full list of functions (Rebol Red and Red/System alike) that have a docstring NOT ending in a full stop. This is a by-product of some internal technical documentation work I have been doing.

rebolek

[14:46](#msg5a8ed7c2e4ff28713ab15adc)I'm never sure if I should end my docstrings with full stop, or not. What if `help` took care of it and added full stop when it's missing?

dander

[17:32](#msg5a8efeada2194eb80d9cb52e)I thought that was already the case. Actually I seem to remember Nenad commenting that it's preferable to leave off the full stop in the definition, but the `help` function should handle both cases

9214

[17:33](#msg5a8efee58f1c77ef3a40749d)yes, I think this is covered in coding style guide

rebolek

[17:34](#msg5a8eff35a2194eb80d9cb992)

```
>> fn: func ["no dot"][]
== func ["no dot"][]
>> fd: func ["dot."][]
== func ["dot."][]
>> help fn
USAGE:
     FN 

DESCRIPTION: 
     no dot. 
     FN is a function! value.

>> help fd
USAGE:
     FD 

DESCRIPTION: 
     dot. 
     FD is a function! value.
```

[17:34](#msg5a8eff3ce4ff28713ab2794c)@dander so you're right

9214

[17:35](#msg5a8eff686fba1a703a8963d9)&gt; Docstrings start with a capital letter and do not require an ending dot (it’s added automatically when printed on screen by help function).

[17:35](#msg5a8eff6e35dd17022eddef55)https://doc.red-lang.org/en/style-guide.html#\_function\_definitions

rebolek

[17:36](#msg5a8effa353c1dbb74362fdbe)OMG, I've just violated style guide!

dander

[17:36](#msg5a8effb06fba1a703a89667f)right, but too lazy to check it for myself

rebolek

[17:37](#msg5a8effde888332ee3abb275c);)

9214

[17:37](#msg5a8effe7e4ff28713ab27db1)@rebolek don't forget to update your blockchain with withdrawal of 5 coins

rebolek

[17:40](#msg5a8f00a5888332ee3abb2c67)@9214 Well, my blockchain was actually in memory only, so hasn't survived closing the window. I'll probably stick to banknotes and real coins, at least I can pay bills with them.

[17:43](#msg5a8f013f6fba1a703a897243)At least until I finish my trading bot that will turn blockchains into real money ;)

JiaChen-Zeng

[18:21](#msg5a8f0a280202dc012e6f4ed7)Just a comment. As a Chinese, I don't like that automatically added dot, because if I am writing docstring in Chinese and going to put an ending dot, I will use Chinese `。` instead of `.`.

rebolek

[18:26](#msg5a8f0b5ee4ff28713ab2c8cb)@AT-Aoi thanks. I think things like this should be covered when designing localization subsystem for Red.

[18:27](#msg5a8f0b8e35dd17022ede3f90)I mean, your docstrings are in Chinese, but `help` is not (yet).

greggirwin

[22:20](#msg5a8f422e888332ee3abcbc2a)`Help` was updated for this, but localization was clearly not considered. Thanks for bringing that up @AT-Aoi.

## Friday 23th February, 2018

meijeru

[14:53](#msg5a902adbe4ff28713ab8cf49)For information, here is the list of functions whose docstring DOES end in a full stop.

```
alg-digest-size function runtime/crypto.reds "Return the size of a digest result for a given algorithm."
alg-from-symbol function runtime/crypto.reds "Return the algorithm ID for a given symbol."
also function environment/functions.red "Returns the first value, but also evaluates the second."
arctangent2 native environment/natives.red "Returns the angle of the point y/x in radians, when measured counterclockwise from a circle's x axis (where 0x0 represents the center of the circle). The return value is between -pi and +pi."
arg-info function environment/console/help.red "Returns name, type, and doc-string for the given word in the spec."
collect-exports function system/formats/ELF.r "Collect a list of exported objects: symbol, type, offset and size. As         the object size is not yet stored in the symbol or exports table, we         have to compute it here."
CRC32 function runtime/crypto.reds "Calculate the CRC32b value for the input data."
doc-string function environment/console/help.red "Returns the doc string for a function."
form-struct function system/utils/virtual-struct.r "Serialize a virtual struct! and returns a binary! value."
func-spec-words function environment/console/help.red "Returns all words from a function spec."
help function environment/console/help.red "Displays information about functions, values, objects, and datatypes."
help-string function environment/console/help.red "Returns information about functions, values, objects, and datatypes."
known-method? function runtime/crypto.reds "Return true if the given symbol is supported."
layout-binary function system/formats/ELF.r "Given a file structure and file layout commands, generate a full file         "layout". A file layout collects the type, offset, address, size,         metadata and data for each element in the file's structure."
make-struct function system/utils/virtual-struct.r "Returns a new virtual struct! value built from a spec block."
OS-call function runtime/call.reds "Executes a DOS command to run another process."
OS-call function runtime/call.reds "Executes a shell command, IO redirections to buffers."
parse-func-spec function environment/console/help.red "Parses a function spec and returns an object model of it."
rejoin function environment/functions.red "Reduces and joins a block of values."
show-function-help function environment/console/help.red "Displays help information about a function."
show-object-help function environment/console/help.red "Displays help information about an object."
struct? function system/utils/virtual-struct.r "Returns TRUE if the argument is a virtual struct!."
```

greggirwin

[16:40](#msg5a90440b53c1dbb74369d754)Thanks @meijeru! A lot of those are in my `help` implementation, and the `checksum` stuff, because I'm more used to using it. Not \*all* mine though.

## Sunday 18th March, 2018

9214

[14:39](#msg5aae7a2e5f188ccc15cc49ae)per \[RedBin specification](https://doc.red-lang.org/en/redbin.html#\_context\_a\_id\_context\_a)  
&gt; A context contains two consecutive tables

Shouldn't it be "context is represented as two-column table" or something like that?

meijeru

[21:32](#msg5aaedb046f8b4b99463feb88)The way I read it, "consecutive" refers to the physical placement of the tables in the RedBin record. As such, it seems a correct formulation.

## Monday 19th March, 2018

9214

[05:54](#msg5aaf507cfa066c532546923e)@meijeru right, thanks!

## Tuesday 20th March, 2018

greggirwin

[23:50](#msg5ab19e55bb1018b37a093360)Could we just omit the word 'consecutive? That is, the text portion is informative, while the structure spec is normative, yes?

## Wednesday 21st March, 2018

meijeru

[08:12](#msg5ab213d55f188ccc15dd0f3d)I think the word consecutive is very suggestive of the fact that you first have all the field names (words) and then all the values, instead of them being interspersed (field1 value1 fiedl2 value2 etc.).

dockimbel

[09:00](#msg5ab21f2ae4d1c63604242264)As Rudolf said, `consecutive` expresses the physical placement of the tables in the Redbin payload. If the word is incorrect in English, we can replace it with a better one.

9214

[09:01](#msg5ab21f76fa066c532554aeb3)@dockimbel no, my confusion came from the fact that in documentation it's "two consecutive tables", while in your explanations it was "one table with two columns".

dockimbel

[09:36](#msg5ab22782458cbde5575c3318)@9214 Maybe we can improve it by replacing: `A context contains two consecutive tables` by `A context structure in Redbin contains two consecutive tables`

greggirwin

[11:03](#msg5ab23bec5f188ccc15ddda74)I don't think `consecutive` hurts anything, unless it implies "contiguous in memory" and that doesn't hold true due to padding.

## Monday 26th March, 2018

toomasv

[16:52](#msg5ab9253ac4d0ae800702a65c)Words missing from \[GUI (VID) dialect words](http://www.red-by-example.org/) in "Red by example":  
\*\*Container settings\**  
backdrop  
size  
title

\*\*Keywords\**  
space  
hint  
with

\*\*Colors\**  
glass  
sienna  
silver  
sky  
snow  
tanned  
teal  
transparent  
violet  
water  
wheat  
white  
yello  
yellow

9214

[16:52](#msg5ab9256ae4ff28713a76e6f9)@mikeparr :point\_up:

rebolek

[17:39](#msg5ab93055e4ff28713a772287)There's `yello` color? Cool!  
https://www.youtube.com/watch?v=PeNIpWT-3vk

## Saturday 31st March, 2018

mikeparr

[19:24](#msg5abfe07ae3d0b1ff2c8a6f06)@toomasv re missing words - thanks

toomasv

[22:45](#msg5ac00f93bb1018b37a47155b)@mikeparr You are welcome!

## Saturday 7th April, 2018

Ungaretti

[22:33](#msg5ac9471d1130fe3d36b22834)@dockimbel I am making a new and improved version of Red Language Notebook that I may turn in to a website. All free and non-profit. Is it OK to copy and paste parts of Red's official documentation?

greggirwin

[23:53](#msg5ac95a0b080a3850530aa4df)@Ungaretti, small portions, and attribution for larger portions are fine, but bulk copying and re-branding is not allowed. To be clear, we know \*you* are not going to do the latter, and that want to use it to make your work more helpful and accurate. We appreciate that greatly. The message is for the internet at large, and is something we should include in the documentation itself.

## Sunday 8th April, 2018

Ungaretti

[00:16](#msg5ac95f7427c509a774eb1118)@greggirwin Thanks.

[14:17](#msg5aca2474109bb043329e22c8)Ok. I think it's up an running: \[helpin.red](http://helpin.red)  
It's under development, of course. Not only a website, but it has many formats available for download. The main focus is to be a guide and a reference for beginners.  
@greggirwin I copied and pasted a bit here and there from Red's official documentation, but more blatantly the syntax and descriptions of the Draw dialect. It would be quite silly to rewrite it in my own words (is that even possible for syntax?). This page, for example, is mostly copy and paste: http://helpin.red/2Dtransforms.html  
There are other places where a good copy and paste from documentation would complete the work nicely.  
The whole project (HelpNDoc project) is available for download under a very permissive licence and, as far as I'm concerned, it may even be turned into part of Red's official documentation. The HelpNDoc format is the best I found so far.

toomasv

[15:23](#msg5aca33fd6bbe1d2739c47971)@Ungaretti Great work again! :+1:

mikeparr

[19:10](#msg5aca691e2b9dfdbc3a6bd516)@Ungaretti Excellent help stuff!

Ungaretti

[19:17](#msg5aca6ad292f5d62057a873c8)@mikeparr @toomasv Thanks! I'm glad you liked it, you both have helped me a lot!  
So far is just the Red Notebook with some improvements. Ideally it should be somehow like a wiki or a git, where everyone could make improvements. Hopefully I'll figure out a way to do that.

greggirwin

[19:40](#msg5aca7032270d7d3708a6f88c)@Ungaretti, wonderful! I will try to review in detail this coming week, but send me a reminder if I don't post more thoughts, as we're busy on many fronts right now. Documentation is \*vitally* important, so we want to encourage all work in this area. Tokens coming soon! ;^)

&gt; I would not suggest it as an educational language for kids.

I'm curious why you think this?

The 17-LOC spreadsheet may also benefit from more explanation as to its purpose. Early in an introduction, as you have it, might give the impression that it's good and idiomatic Red style, which clearly not the case. :^)

Thank you \*so much* for your enormous effort on this. I've set up https://github.com/red/red/wiki/Documentation so we can link to top-line doc resources more easily. The support of people like you, @mikeparr, Arie, and more is humbling and inspiring. So much work goes into these efforts, too often unheralded.

[19:41](#msg5aca707a270d7d3708a6f9ac)Feel free to remove the link to your prior notebook work, if this new work obsoletes it.

[19:45](#msg5aca71522b9dfdbc3a6bf18a)I'll also check out HeplNDoc.

mikeparr

[21:04](#msg5aca83c1270d7d3708a748aa)@greggirwin thanks - much appreciated.

Ungaretti

[22:42](#msg5aca9aec27c509a774ef3fca)@greggirwin Thank you, I'm very glad that you liked it. And yes, I can imagine the Red team is quite busy now.  
I have many immediate refinements to do on the new text. I agree that the spreadsheet example does not fit there, nor does the subjective comment about Red language. I believe it will take me another week to publish a more mature version.  
I'm specially interested in finding a way to make it more collaborative, ideally making it a collective work.

## Monday 9th April, 2018

greggirwin

[08:38](#msg5acb266cdf3e0fb547b99769)Sounds great!

DideC

[11:53](#msg5acb5441080a38505311bb8d)@Ungaretti Very nice work !!

## Sunday 15th April, 2018

meijeru

[19:41](#msg5ad3aadb270d7d3708cdb8c7)Guru Meditations #14 (Keeping the CLI console open) says that there is a --catch option for the compiler. This is not mentioned on the main README. What does it do exactly, and why is it not documented? Cross-posted in red/help.

9214

[20:42](#msg5ad3b9392b9dfdbc3a934973)@meijeru I think it's pretty self-descriptive  
https://github.com/red/red/blob/master/red.r#L710

[20:42](#msg5ad3b9491130fe3d36de13d1)https://github.com/red/red/blob/master/red.r#L342

## Monday 16th April, 2018

meijeru

[06:00](#msg5ad43bef102fac7b7b178929)Thanks but those lines do not say what it DOES. Anyhow, @greggirwin answered in red/help.

## Wednesday 18th April, 2018

Ungaretti

[14:55](#msg5ad75c7e6d7e07082b09edbe)\[Helpin.red](http://helpin.red) is updated and I think now is pretty complete for begginers and useful for intermediate users. Is mobile-friendly and has downloads not only of other formats (pdf, word, chm), but for a zip with a complete setup for Notepad++.  
Next steps will be rich-text and full I/O when available , but suggestions and contributions are always welcome.  
If anyone sees weird formatting, try cleaning the browser's cache.

## Thursday 19th April, 2018

endo64

[06:19](#msg5ad835036bbe1d273900917b)@Ungaretti It's very useful thank you!

DideC

[09:30](#msg5ad861ce1130fe3d36f2df21)`construct` doesn't have any embeded doc, why?

```
>> help construct
USAGE:
     CONSTRUCT block

DESCRIPTION: 
     CONSTRUCT is a native! value.

ARGUMENTS:
     block        [block!] 

REFINEMENTS:
     /with        => 
        object       [object!] 
     /only        =>
```

rebolek

[09:50](#msg5ad8664a6d7e07082b0e67b8)@DideC oversight, I guess. You can add PR for it.

greggirwin

[17:25](#msg5ad8d1255f188ccc158152ce)`Object` is also missing a doc string. Good catch @DideC. I'll add something for those real quick.

[17:54](#msg5ad8d7d75f188ccc158175c1)Done. Quick is relative when you find you have to think about what to say. :^\\

DideC

[18:01](#msg5ad8d95d6bbe1d273903fdd1)Exactly, especially for a foreign language as English is to me. Would have just copy the rebol one ;-)

greggirwin

[21:27](#msg5ad909ac102fac7b7b2e11b7)You may remember how good my French is, so I'm happy to help. :^)

[21:34](#msg5ad90b8227c509a7742db8ec)Wonderful @Ungaretti ! Thanks so much for keeping us posted, and adding more material. There's great stuff in there. The colored blocks showing layout behavior is a great idea.

As we work on our bounty list, for the foundation, I'm planning to include bounties for people who review and support work like yours, red-by-example, and more community documentation efforts.

Ungaretti

[21:58](#msg5ad911057c3a01610dfdf1f7)Thanks @greggirwin ! Indeed I'm pleased with the way it's turning out. If not a comprehensive work (yet) at least is all in ONE place. Makes life a lot easier for beginners. If I may say so, the parse chapter there may prove to be specially helpful for them (us). Everybody keeps mentioning how incredible parse is, but I had a miserable time trying to figure it out using the documentation available. I believe (hope) I "translated" it into proper beginners' language... and in ONE place.

greggirwin

[22:33](#msg5ad9191e5f188ccc1582aa1c)Indeed, the introductory part, showing exact matching, makes it very approachable.

[22:35](#msg5ad9199e15c9b03114158acd)`to/thru/ahead` may need some more details, to clarify why we have each of them, but that's also a very important section to have.

[22:38](#msg5ad91a6b2b9dfdbc3aab63cc)Might also benefit from a new section on range/count matching, which covers `m n` rules, and `opt any some`, since they are all related. There is also overlap, so up to you how explanations match best with the rest of the parse docs.

Ungaretti

[23:05](#msg5ad920cf102fac7b7b2e6c72)Duly noted. Version 8.0 shall have it.

[23:08](#msg5ad921716bbe1d2739053b21)I mean 0.8.

greggirwin

[23:09](#msg5ad921c0270d7d3708e61a50):^)

## Friday 20th April, 2018

mikeparr

[09:03](#msg5ad9acd1109bb04332e068e5)I just updated Red-By-Example. Thanks to all who reported errors, omissions etc.

rebolek

[09:27](#msg5ad9b28f5f188ccc1584ebe9)@mikeparr :+1:

Ungaretti

[09:31](#msg5ad9b38e270d7d3708e84e68)@mikeparr I can't thank you enough for all the help I get from Red-By-Example!

DideC

[09:50](#msg5ad9b7ee6bbe1d273907889a)@Ungaretti in http://helpin.red/Shapesub-dialect.html there is a typo at the end of the `arc` part : 2 times &lt;radius-x&gt;.  
Also, the bullet are weird there:

[09:50](#msg5ad9b7f37c3a01610d0062d4)\[!\[image.png](https://files.gitter.im/red/docs/ynJ8/thumb/image.png)](https://files.gitter.im/red/docs/ynJ8/image.png)

[09:51](#msg5ad9b8136bbe1d27390789df)(HTML view, did not check PDF)

Ungaretti

[10:02](#msg5ad9bad07c3a01610d00728c)@DideC Thanks, fixed in the project. May take a few days for changes to go on-line.

rcqls

[10:18](#msg5ad9be58109bb04332e0bf47)@Ungaretti In `Datatype -> string! -> 3rd example` I guess that the second `{` is a mistake.

Ungaretti

[11:18](#msg5ad9cc927c3a01610d00c871)@rcqls Thanks! It is not really a mistake, it's how the console actually shows it (try!) . But, it may confuse others too, so I'll add a note.

rcqls

[11:22](#msg5ad9cd605d7286b43a4bb015)@Ungaretti When I copy-paste in the console this lines

```
a: {my 
{ string}
```

I need to add the last `}` to execute the code. Maybe I miss something...

9214

[11:22](#msg5ad9cd8b270d7d3708e8c52a)@rcqls

```
>> a: {my
{    string}
== "my^/string"
```

[11:22](#msg5ad9cd925d7286b43a4bb141)Type it by hand.

rcqls

[11:23](#msg5ad9cd975d7286b43a4bb15a)Ok! I see….

[11:23](#msg5ad9cdb715c9b03114184d41)@9214 Thanks… I was just trying that...

[11:24](#msg5ad9cded62316e0505df11bb)So it is confusing...

Ungaretti

[11:26](#msg5ad9ce596bbe1d273907f500)@rcqls I see what you mean... It may cause confusion indeed. I guess have to think about how to improve the description of this kind of console typing.

rcqls

[11:30](#msg5ad9cf4a6d7e07082b150234)@Ungaretti forget what I said, it is something that I did not notice before when using console. Thanks… Maybe with different colors for the prompt and the data it could be easier to read but it is not a priority. Good job!

DideC

[11:56](#msg5ad9d5556d7e07082b1520cc)@Ungaretti Maybe you can make appear differently code and console output. I would suggest light gray on black for console output (like code is here).

meijeru

[15:06](#msg5ada01ee270d7d3708e9e83a)I permit myself a comment on the Wiki (where else should I do that): in the Learning Resources, the link to `Mindmap on Red and related topics; maintained by Sabu Francis` is dead.

9214

[15:07](#msg5ada0218270d7d3708e9e8d7)@meijeru indeed, thanks for noting this!

[15:07](#msg5ada024415c9b03114196ced)In fact it's no dead, it's just that URL contained a trailing space.

Ungaretti

[15:11](#msg5ada0319270d7d3708e9ef52)@rcqls @DideC Yes, thanks, I was thinking of something like that, different colors for console input and output.

greggirwin

[19:21](#msg5ada3da9109bb04332e3402d)It's so wonderful to see activity on the docs side. So much great work, with each voice and approach adding value. We're looking for people to help in more ongoing, official ways too, organizing wikis, adding more datatype docs to the official side, etc. If anyone is interested in that, or knows someone who might be, let me know.

## Wednesday 25th April, 2018

gltewalt

[19:14](#msg5ae0d388270d7d370806d918)This wiki link is broken:  
https://github.com/red/red/wiki/Install-and-Get-Started

greggirwin

[19:16](#msg5ae0d4157c3a01610d1e8e9b)@gltewalt, should be https://github.com/red/red/wiki/Installing-Red-and-Getting-Started

gltewalt

[19:18](#msg5ae0d4742b9dfdbc3acbd897)Link fixed

## Sunday 29th April, 2018

meijeru

[11:53](#msg5ae5b22fb01085166cd24a13)I posted a suggestion to update a Guru Meditation in the `red/red/system` room.

greggirwin

[20:05](#msg5ae6259e109bb04332141abe)I responded there.

## Saturday 5th May, 2018

Ungaretti

[13:45](#msg5aedb568db299d4004d36cb3)I'm trying to define a word for all the "reserved words" of Red, but they are not "reserved" at all. I mean the words you get when you type `what` on console. `? what` says `what` " Lists all functions, or search for values".  
Would the word "commands" be semantically appropriate for "all functions, or search for values"?

9214

[14:12](#msg5aedbbd3da323a7c04fbd6af)@Ungaretti dictionary, built-ins, natives and mezzanines.

Ungaretti

[14:23](#msg5aedbe636f9af87e04458937)@9214 You think there is no single word to refer to them all? Do you see any flaw in "commands"?

9214

[14:24](#msg5aedbe8b03cafa797b2bdd47)@Ungaretti "builtins" perfectly sums it up and is a single word.

[14:28](#msg5aedbf8ddb299d4004d38e09)"Commands" is a too broad term and isn't commonly used in Redbol. Besides, I don't think ad-hoc terminology is necessary when you can use well established jargon, that way programmers can communicate one with another using "lingua franca".

Ungaretti

[14:28](#msg5aedbfa100dc4888049923ed)@9214 Sounds good, but would a text like " `rejoin` is a builtin that..." be understandable for all?

9214

[14:29](#msg5aedbfd497e5506e049cefd0)Why you need to draw this distinction anyway?

Ungaretti

[14:34](#msg5aedc10203cafa797b2be29b)@9214 I often find the need to refer to "builtins", like the example above. Is "builtin" considered "lingua franca" for functions+actions+operators+etc ?

9214

[14:36](#msg5aedc1506f9af87e044590b5)@Ungaretti http://www.rebol.com/docs/core23/rebolcore-9.html#section-1

[14:37](#msg5aedc1a21eddba3d04d4f9f0)They are all functions, in a sense that they receive arguments and return results, the difference is in implementation only.

Ungaretti

[14:41](#msg5aedc29859a0578004a8a769)@9214 calling them "functions" sounds confusing, as those would be `func`, `has`, `function` etc.  
Red's official documentation often refers to &lt;commands&gt; in syntax description. Why do you consider it ad-hoc terminology? I mean, as a general description of "builtins".

9214

[14:44](#msg5aedc34297e5506e049cf6ff)`func`, `has` and `function` are words, for a start ;) I saw "commands" only in Draw dialect documentation, and they make sense in such context. Draw is a \*declarative* DSL, and "command" implies that user \*declare* something.

[14:44](#msg5aedc36697e5506e049cf787)Ah, and in VID too.

Ungaretti

[14:46](#msg5aedc3abda323a7c04fbf0fd)@9214 Indeed I was looking at Draw.  
So, unless someone else has a better idea, "builtins" they become.

9214

[14:47](#msg5aedc4146d98e53e0454a921)The final word is after @greggirwin and @dockimbel, I just threw in my 2 cents.

gltewalt

[16:04](#msg5aedd6251eddba3d04d5331d)Predefined words

[16:05](#msg5aedd642b37eab7d046d202e)Pre bound?

[16:05](#msg5aedd650db299d4004d3ce16)Initial words

meijeru

[17:03](#msg5aede3eeff26986d0835ca5e)I vote for pre-defined instead of built-in, because they are re-definable (in some cases at your peril). However, this does not solve the question of using "function" to indicate what is actually the typeset `any-function`...

[17:04](#msg5aede42803cafa797b2c4046)But since actions, natives and routines behave like functions, there is not much confusion caused, perhaps.

Ungaretti

[20:08](#msg5aee0f27da323a7c04fcba23)@meijeru @gltewalt I like "predefined word" . " `rotate` is a predefined word that ..." . Sounds good.  
More suggestions anyone?

greggirwin

[21:27](#msg5aee21ac5cf0b830045c49d8)I don't remember if we ever decided on this term, but we should. "Pre-defined" and "built-in" are fine, if hyphenated. "Standard" has also been suggested in the past.

Ungaretti

[21:39](#msg5aee2477f2d2d53704671488)@greggirwin Google tells me the hyphenated form is less used, why do you prefer it?

greggirwin

[21:40](#msg5aee24d153ceca3604b5157c)@Ungaretti age working against me? ;^) Predefined is fine, builtin just looks like a typo to my eye when reading.

Ungaretti

[21:41](#msg5aee251e6f9af87e04468dc5)@greggirwin agreed!

## Sunday 6th May, 2018

GiuseppeChillemi

[13:43](#msg5aef069297e5506e049faa68)How do you write documentation for RED/REBOL projects ? I mean: which format, software and/or online wiki platforms you prefer for documenting your programs ?

gltewalt

[16:00](#msg5aef268097e5506e049ffe20)Asciidoc for official Red documentation.  
Most of Red Wiki is in markdown right now, so if you do a wiki page, markdown is ok

Ungaretti

[16:54](#msg5aef335359a0578004abe768)@GiuseppeChillemi I recently fell in love with \[HelpNDoc](https://www.helpndoc.com/). It is easy to use and generates all sorts of outputs (pdf, doc, html etc.) . My \[helpin.red](http://helpin.red/) website is entirely made with it. For a less formal format, github offers some nice features.

GiuseppeChillemi

[19:42](#msg5aef5a99da323a7c04ff9b0c)@gltewalt , so this documentation: https://doc.red-lang.org/en/ has been written in AsciiDoc ?

[19:55](#msg5aef5dbe1eddba3d04d8b800)@Ungaretti I like your website. I had already taken a look at it.

gltewalt

[20:09](#msg5aef610797e5506e04a0970d)Yes it’s .adoc

[20:10](#msg5aef611e1eddba3d04d8c023)https://github.com/red/docs/tree/master/en

## Thursday 10th May, 2018

meijeru

[12:56](#msg5af44170e1cf621dba0c18ee)Did anyone know that `query` on file! values is already implemented, and that it yields the data and (UTC) time of last modification?

9214

[12:57](#msg5af4419ef04ce53632c86834)@meijeru https://github.com/red/red/pull/3209

meijeru

[13:10](#msg5af444ce52194a4a67d4ed6a)Yes, that's where it comes from, but unless one follows the commits assiduously, this remains somewhat hidden. That was my point.

9214

[13:12](#msg5af44529ea553a33ea52bec8)It's a partially implemented feature that works only on Windows - enough reasons to be hidden and undocumented, if that's what you mean.

meijeru

[13:14](#msg5af4459e5666c42eb6fe729f)Correction: it works also on the other OSs. But it is in `simple-io` so that is perhaps enough reason. Let's wait for 0.7 then to come out with it.

9214

[13:15](#msg5af445e3862c5e33e9245ae4)Yes, I missed a commit with POSIX support.

greggirwin

[22:55](#msg5af4cdfd862c5e33e9266584)It is an interim solution, I think done because it was needed, maybe for @x8x's new work on `about/debug`. Can't recall.

## Thursday 17th May, 2018

GiuseppeChillemi

[20:16](#msg5afde31cb84be71db915ece4)This link doe not work

[20:16](#msg5afde3208c24fe61eaf2ff41)https://github.com/red/red/wiki/Why-do-I-have-to-copy-series-values%3F

[20:16](#msg5afde3315a1d895fae4ae951)Tried: https://github.com/red/red/wiki/Why-do-I-have-to-copy-series-values

[20:17](#msg5afde3561cfca775e11923a9)Took it from: https://github.com/red/red/wiki/Reactivity

greggirwin

[20:58](#msg5afded0ab84be71db9160ebe)Wiki page changed name: https://github.com/red/red/wiki/Why-you-have-to-copy-series-values

[20:59](#msg5afded195a1d895fae4b122e)Unfortunately, improving names also breaks all links to them.

[20:59](#msg5afded2ad332ee5fad28b9d6)I often search for a single word I think might be in the title.

## Friday 18th May, 2018

gltewalt

[00:05](#msg5afe18d7a2d95136334b99ba)I added "Why you have to copy series values" to the `Deep Dives` page in the Wiki.

greggirwin

[01:51](#msg5afe31905666c42eb61db05d)Thanks.

GiuseppeChillemi

[06:23](#msg5afe7144b84be71db9177c61)You are welcome

## Tuesday 29th May, 2018

loziniak

[14:15](#msg5b0d60784eaffb692d64f11f)hi, I'm reading http://www.red-by-example.org/parse.html and spotted a few problems in the text. is there a github repo where I could make a pull request?

9214

[14:32](#msg5b0d646ca7abc8692ef2a0b9)@mikeparr :point\_up:

loziniak

[14:48](#msg5b0d6857ba1a351a68d27c25)and a more general question - why `tag!`s are like "&gt;tag&lt;" instead "&lt;tag&gt;" there?

greggirwin

[19:14](#msg5b0da67d52e35117cdef563e)@loziniak, there's no repo for it, but @mikeparr is the lead maintainer and quite responsive.

gltewalt

[22:35](#msg5b0dd5a64eaffb692d66c55b):rage1:

mikeparr

[23:12](#msg5b0dde68352b9e1a4b424468)@loziniak Yes, I'm here, thanks for your Parse comments - I'm on holiday though, will fix in 2 weeks

## Saturday 9th June, 2018

greggirwin

[21:27](#msg5b1c46446023754a317ebfb2)@gltewalt et al, for our nice new wiki category pages, should we order things by importance, or just alphabetically?

gltewalt

[21:40](#msg5b1c493a144c8c6fea83d6d8)Importance, or Frequently Needed

[21:41](#msg5b1c49999ca98417e2592fb8)Others may really like a strict alphabetic order

## Wednesday 13th June, 2018

meijeru

[19:05](#msg5b216ae6a0161836cb18b301)A query about `pick` - the help info is:

```
>> help pick
USAGE:
     PICK series index

DESCRIPTION: 
     Returns the series value at a given index. 
     PICK is an action! value.

ARGUMENTS:
     series       [series! bitset! pair! tuple! date! time!] 
     index        [scalar! any-string! any-word! block! logic! time!] 

RETURNS:
     [any-type!]
```

but as far as I can see, only the following types qualify for the `index`:  
`integer!` and `logic!` for all types of the first argument, additionally `pair!` for `image!` and `char!` and `string!` for `bitset!`  
Where does the enormous range of `index` types come from? Besides, `time!` is already included in`scalar!` so it would not have been needed separately.

## Thursday 14th June, 2018

greggirwin

[01:41](#msg5b21c7cafd5b835b2d59f0ea)Good question @meijeru. Will take some digging.

## Saturday 16th June, 2018

meijeru

[17:42](#msg5b254c061c7d4214379df01c)I have looked at the treatment of component types for "composite" types (series! bitset! pair! and tuple!).

[17:53](#msg5b254eb3e87f0c7bee90f8d8)In particular the treatment of getting and setting the components. For pair! (integer! components), any-list! (any-type! components), vector! (char! or number! components) and image! (tuple! components) there are no remarks -- setting is allowed for the component types only. For tuple!, setting to integer leads to limitation (i.e. &lt;0 =&gt; 0, &gt;255 =&gt; 255), whereas for binary!, setting to integer leads to taking the AND with 255 (e.g. -1 =&gt; 255, 257 =&gt; 2). Moreover, for binary!, a char! value can be supplied (code point value also ANDed with 255). For bitset!, not only a logic value can be supplied -- values of all other types are converted, using make logic! (0, 0.0, #{00} =&gt; false, all else =&gt; true. The checking of component type when setting, is not implemented for pairs, tuples, images, and possible others. For pairs and tuples I have already launched an issue. The other peculiarities merit documentation, unless someone thinks the anomalies are too great and an issue needs to be launched (e.g. difference of treatment between tuples and binaries)

[17:54](#msg5b254ee24fbf4449eb1c2009)PS For any-string! (char! components) there are no remarks either.

9214

[17:56](#msg5b254f58d128fa71f66f3f80)Thanks @meijeru , interesting observations.

meijeru

[19:45](#msg5b2568c482b1b355c95dadd4)Correction on bitsets: only none, false and integer zero are unsetting the bit, all other values, including e.g.0.0 are setting the bit. I raise an issue for this.

greggirwin

[19:48](#msg5b256975eed8d06673b78199)I have to head out soon, but will try to look at this in detail tomorrow @meijeru. Thanks for posting.

## Sunday 17th June, 2018

Tovim

[09:36](#msg5b262b894a5db82dd58f82db)Hi, @greggirwin , I am informing you, that @Ungaretti has uploaded my czech tranlastion of his \*\*Helpin´Red\** at http://helpin.red/cs/index.html.

## Tuesday 19th June, 2018

greggirwin

[03:13](#msg5b2874ce62ad3112a576f4cc)Thanks @Tovim (and @Ungaretti)!

## Wednesday 20th June, 2018

Ungaretti

[09:12](#msg5b2a1a68ad21887018c9faf3)Thanks @Tovim!

Tovim

[13:45](#msg5b2a5a67ad21887018caa080)Thanks @Ungaretti

## Monday 25th June, 2018

Oldes

[22:12](#msg5b3168b1ce3b0f268d42e34e)In this \[blog article](https://www.red-lang.org/2014/08/) are mentioned functions `arcsin`, `arccos` and `arctan` but these are now actually named `asin`, `acos` and `atan`.

## Tuesday 26th June, 2018

Ungaretti

[09:04](#msg5b32018559799e70174291c6)@Oldes I believe all the trigonometric functions with long names (arccosine, cosine etc) use degrees as default, but accept the refinement /radians to use this unit. The short name versions (acos, cos etc.) take radians as arguments and require it to be a number!

rebolek

[09:11](#msg5b320358d2abe466888af295)@Ungaretti but the long variant is not `arcsin`, `arccos` and `arctan`, but `arcsine`, `arccosine` and `arctangent`.

Ungaretti

[09:28](#msg5b32074359799e701742a168)@rebolek So there was once things like `arcsin` that was indeed removed from the language?

[09:29](#msg5b3207790168e70c08ef5ef0)Sorry @Oldes , I see your point now.

rebolek

[09:50](#msg5b320c4e6ceffe4eba33fb0c)@Ungaretti maybe it's just a typo.

## Wednesday 27th June, 2018

9214

[05:18](#msg5b331e3b72b31d3691f6eef3)There are `toc` markers at the end of every section in some datatype documentation pages, namely `map!`, `char!` and `date!`.

gltewalt

[05:19](#msg5b331e75960fcd4eb926b047)Yeah, because the are long docs

9214

[05:22](#msg5b331f026ceffe4eba367f3c)So? Documentation pages in GUI system section are much longer and don't have them. I'd rather created a separate button to scroll to the top of a document, instead of putting the same link under every paragraph.

gltewalt

[05:22](#msg5b331f150168e70c08f20b78)A navigation aide experiment

[05:23](#msg5b331f58a288503b3de2a481)A button on a sidebar, or some such thing?

9214

[05:24](#msg5b331f87b9c2fb25570eab73)Put design and UX aside for the time being and concentrate on content creation instead.

gltewalt

[05:28](#msg5b3320607da8cd7c8c71187b)That was done a long time ago. And to paraphrase Gregg, “I’m not sure about that. You can leave them in those three docs for now, and see if people like it or not”.

[05:28](#msg5b3320917da8cd7c8c7118f0)It’s an easy change to do away with them

rebolek

[06:10](#msg5b332a65479ca2668982f40e) One friend just reported that the instructions for Ubuntu installation on https://www.red-lang.org/p/download.html should be changed to:

```
apt-get install libc6-i386 libcurl3 lib32ncurses5
```

Oldes

[08:50](#msg5b334fd70168e70c08f282bf)why ncurses?

rebolek

[08:51](#msg5b335001960fcd4eb92725ba)That's what Filip Oščádal wrote, I'm just passing that info.

## Monday 2nd July, 2018

greggirwin

[23:30](#msg5b3ab5ae60c387078358221c)If someone can confirm the best info to put there, we'll get it changed.

## Sunday 15th July, 2018

toomasv

[05:02](#msg5b4ad57c582aaa63076b8489)Currently the Draw \[documentation](https://doc.red-lang.org/en/draw.html#\_arc\_2) for Shape dialect commands describes `angle` parameter of `arc` as

&gt; &lt;angle&gt; : angle between the starting and ending points of the arc in degrees (integer! float!).

This is incorrect. `angle` indicates rotation of the arc's underlying ellipse by degrees.

\[MDN doc](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d#Path\_commands) says this about svg path's `elliptical arc curve`:

&gt; `angle` represents a rotation (in degrees) of the ellipse relative to the x-axis

And \[W3C doc](https://www.w3.org/TR/SVG11/paths.html#PathDataEllipticalArcCommands) says this:

&gt; `x-axis-rotation`, \[...] indicates how the ellipse as a whole is rotated relative to the current coordinate system

greggirwin

[14:24](#msg5b4b591e95e03e3d7b4e06d0)The current docs are accessible, if not exactly correct. What if we leave the text that's there, and add a "more specifcially, ...". https://doc.red-lang.org/en/draw.html#\_arc also needs to be updated to match, yes? Also need to change our text from `circle` to `ellipse`.

The exact wording is tricky, without adding more information, like W3C does, like how the radius values are used to calc the center point. I'm not opposed to that in any way.

toomasv

[19:58](#msg5b4ba760866e0c6b15acba2a)@greggirwin Yes, draw's `arc` would benefit from `circle`-&gt;`ellipse` change. But "angle" as it appears there --

&gt; &lt;begin&gt; : starting angle in degrees (integer!).  
&lt;sweep&gt; : angle between the starting and ending points of the arc in degrees (integer!).

-- is correct.

Problem is that `angle` in shape's `arc`is altogether different thing. Initially I tried to follow current wording and was confused - why to specify angle between starting point and ending point when both of these are already given and angle between these can be calculated but not changed with additional parameter. Only after some experimenting I saw that the `angle` parameter has nothing to do with angle between starting and ending points but only with rotation of ellipse underlying the arc. Later checked with svg specs and got confirmed. Try it out on \[arcodrome](https://gist.github.com/toomasv/01817e797fdb38d277d4c01dad89b326). :&lt;)

gltewalt

[20:24](#msg5b4bad80866e0c6b15acd606)Fork docs and submit a PR?

greggirwin

[20:24](#msg5b4bad899a612333aa64d686)If you can contrive some wording that is correct, that would be \*fan\*tastic. I'm sure @gltewalt will appreciate the help.

[20:26](#msg5b4bade79a612333aa64d7ad)Can't wait fro `Velodrome`, that combines an elliptical track and your other bicycle model (IIRC, @toomasv ).

[20:27](#msg5b4bae15c02eb83d7c78ee48)I might suggest more than single letter style names, but I know this lets you move fast while playing. ;^)

toomasv

[21:58](#msg5b4bc39c582aaa63076e3979)@greggirwin Lenghtified style names, sparingly ;&lt;)

greggirwin

[23:00](#msg5b4bd1f3c02eb83d7c798037)Perfectly spare.

## Monday 16th July, 2018

toomasv

[15:47](#msg5b4cbe03582aaa63077100bc)@greggirwin Added \[exercise](https://gist.github.com/toomasv/01817e797fdb38d277d4c01dad89b326). Should add levels of difficulty.

## Tuesday 17th July, 2018

greggirwin

[04:30](#msg5b4d70e4623cc3040b27780e)Nice. I can see code based puzzle games are going to be a thing.

## Wednesday 25th July, 2018

mark-summerfield

[13:57](#msg5b5881bec0fa8016e7378edb)I'm reading the helpin red docs. In http://helpin.red/Stoppingcode.html for the quit/return it says " I could not find an example of how to retrieve this value.". On windows if you compile a red app that uses e.g., quit/return 55 after running the .exe enter 'echo %errorlevel%' and it will print 55 (or whatever you set)

[14:27](#msg5b5888dd32d98c2ed2b402dc)The above should have been directed to @Ungaretti

## Thursday 26th July, 2018

Ungaretti

[00:43](#msg5b591948bd17b96159037b62)@mark-summerfield Thank you Mark. I quoted you literally on the text, I hope you don't mind. I'll update the website in few days.

greggirwin

[00:49](#msg5b591ab2d2f0934551d0778d)Note, @gltewalt, with @endo64'assistance, has put in a lot of work to add category tags to wiki page names, in an attempt to make organization easier. The changes are out now, but some links may be broken and external links will need to be updated.

gltewalt

[01:20](#msg5b5921d2e5fc191d959db06b)Links should all work now. Let me know if you run in to a broken link.

greggirwin

[01:21](#msg5b59220832d98c2ed2b5da53)Thanks @gltewalt !

[23:05](#msg5b5a53a6a31e386158b4dcf7)Seems at least one other wiki page was deleted, as it wasn't in @gltewalt's repo. I'll add that back now, but keep your eyes peeled for others.

## Saturday 28th July, 2018

amreus

[09:04](#msg5b5c31bb966e803950266c71)Is there a way to view the wiki doc diffs online? I have a local clone of the wiki and currently use `git log` or a git gui to view the changes. I was just curious if it can be done through github?

gltewalt

[10:36](#msg5b5c4749bf75446606699a69)Haven’t seen it on github. Wikis aren’t separate repos, so it makes some things difficult

amreus

[16:54](#msg5b5c9fd517c942036b7c1980)I believe it is a separate repo. Here's a way to see the wiki history using this special link: https://github.com/red/red/wiki/\_history although the history page doesn't have links to the diffs, you can see them by selecti a revision checkbox and pressing the Compare button.

[16:57](#msg5b5ca09617c942036b7c1b62)\[!\[00546.png](https://files.gitter.im/red/docs/iXp9/thumb/00546.png)](https://files.gitter.im/red/docs/iXp9/00546.png)

[16:59](#msg5b5ca0d7966e803950276dc1)Oops. I meant to add that image to a new post. The arrow shows a bad link from the Red Language Homepage - specifically from this page: https://www.red-lang.org/p/documentation.html

[17:04](#msg5b5ca227bf754466066a61c8)There is a "Clone" button on the bottom-right of wiki landing page - that's why I think it's a separate repo.

endo64

[17:14](#msg5b5ca46b12f1be713760d688)@amreus Thank you, @greggirwin Can you update the link on https://www.red-lang.org/p/documentation.html page (Learning resources list (wiki)) to point https://github.com/red/red/wiki/%5BLINKS%5D-Learning-resources

greggirwin

[18:06](#msg5b5cb0badefc9823f5208b8c)@endo64 I don't think I have rights there, but will check.

[18:08](#msg5b5cb11f12f1be713760f6f5)Github wikis \*are* repos, but treating them as such, rather than just editing, is a bit of a pain, because github has to make some design choices for their default structure.

gltewalt

[19:06](#msg5b5cbebf95988830b0844b16)The interface isn’t full repo-d. It doesn’t show up under red like red/red, red/docs, etc, and there’s no option to only Fork the wiki

[19:07](#msg5b5cbef212f1be713761172c)Sun-repo?

[19:08](#msg5b5cbf1a3cc39566072bccde)Errr Sub-repo  
(Sorry, breaking my mobile rule)

## Sunday 29th July, 2018

mikeparr

[20:17](#msg5b5e20f33e264c71384bf384)I wonder if Ivo Balbaert's book 'Learn Red – Fundamentals of Red' should be mentioned somewhere on red-lang.org? It might help to make Red look more mature.

greggirwin

[23:52](#msg5b5e534b17c942036b7faf81)I thought we had it in resources somewhere.

## Monday 30th July, 2018

meijeru

[07:55](#msg5b5ec45f95988830b0888a0b)It is \[here](https://github.com/red/red/wiki/Unofficial-Tutorials-and-Resources)

greggirwin

[17:49](#msg5b5f4fa0966e8039502ece07)Thanks @meijeru !

[17:50](#msg5b5f4fd995988830b08b61b6)@mikeparr, we have new web sites in the works, and can look at where best to note commercial resources like Ivo's book.

## Friday 3th August, 2018

PeterWAWood

[07:56](#msg5b640ab4945df30dc1490ebc)@gltewalt The wiki looks much, much better. Thanks!

gltewalt

[08:43](#msg5b6415c26d45752f9882298c)Thanks, Peter.

## Thursday 16th August, 2018

greggirwin

[20:41](#msg5b75e18ca158fd0ea36a3a07)@gltewalt @endo64, we're moving @meijeru's spec doc out of the shadows, unofficially. It's at https://github.com/meijeru/red.specs-public and we should add links from wiki community resource pages. The goal now is to get more eyes on it and align it with other doc initiatives.

dander

[21:21](#msg5b75eae47a17864125377820)Wow! 🤯 Looks super impressive so far!

meijeru

[21:55](#msg5b75f2bd157b9d34ef989a3a)Thanks for the compliment, but improvements are still needed and any suggestions are welcomed.

[21:55](#msg5b75f2c8e2e48a20b46bbb76)See the README

dander

[22:21](#msg5b75f8cc796f7b601d511ff1)I just wanted to remark on the amount of content in there. I think I will be chewing on it for a while 😀. About linking to other sources, will the eventual goal be to migrate the information into the official docs? For example, while the parse blog article is great, it would be nice to have an up-to-date spec to refer to. How will this relate to docs.red-lang.org? I mean how is the scope for each documentation location defined?

greggirwin

[22:45](#msg5b75fe6f0825690ea2ddefdf)Rudolf's spec has been around for a long time, lurking. Because communicating exact needs is difficult, and docs have different goals, we've been thinking about how to move everything forward. There is unfortunate overlap at times, and a lot has happend very quickly of late. We have @gltewalt and @endo64 tackling wiki issues, @9214 and @beardpower working on specialized docs, @gltewalt adding to official docs, @PeterWAWood putting forth a doc plan I need to review and weigh in on), and @dobeash agreeing to help lead doc efforts and work on a user guide.

The goal, then, is to get everybody rowing in the same direction, figure out where each piece fits, reduce wasted effort, and see what works and what doesn't.

rcqls

[22:49](#msg5b75ff85e40fdf5fb14b8e2f) @meijeru Many thanks for this very informative and then helpful document!

## Friday 17th August, 2018

toomasv

[04:47](#msg5b76537de7971d5f10937bb3)@meijeru :clap:

meijeru

[08:55](#msg5b768d7ee40fdf5fb14e7e83)Let me repeat here what I have said bi-laterally to the docs team: the contents of the specs document is for usage as the docs team sees fit. Until we have a doc plan I will continue to add to it as the language evolves, without duplicating other efforts.

## Tuesday 21st August, 2018

meijeru

[17:21](#msg5b7c4a28cff55e56173f14ab)Meanwhile, I have put up (on Gregg's request) a document on the specs repository outlining my suggestions for the structure of the Reference document (as foreseen in the documentation plan, REP 003). This document is a self-contained .html file created using Markdeep, yet another approach to document preparation which has some interest.

## Wednesday 22nd August, 2018

greggirwin

[04:42](#msg5b7ce9c838a12915e4db2610)Thanks Rudolf!

Franktic2

[07:49](#msg5b7d1585e5b40332abdfc1c3)I was unsuccessfully looking for a way to convert a string, "13/2/1970", to a date when I tried to do something else:

[07:49](#msg5b7d159994f8164c1781fbdc)&gt;&gt; d: "13/2/1970"  
\== "13/2/1970"  
&gt;&gt; type? d  
\== string!  
&gt;&gt; d: do d  
\== 13-Feb-1970  
&gt;&gt; type? d  
\== date!  
&gt;&gt;

[07:50](#msg5b7d15cac53ee54c1886c6a6)It appears that do not only evaluates but converts as well. It does the same with strings that look like integers.

9214

[08:08](#msg5b7d1a0bff445156161f55ab)@Franktic2 `do` is the same as `do load`. In this case `load` scans string input and produces a block of Red values, i.e. does the conversion. `do` itself returns the last result from expression.

Franktic2

[08:34](#msg5b7d20061d3a5711b67fc885)Got it. Thanks

Tovim

[09:44](#msg5b7d3096ff445156161fd9d7)Hi, @greggirwin . I have just sent a pull request from tovim/docs to red/docs. I have a problem with the term path-head. Could you shortly explain its meaning to me please?

9214

[10:08](#msg5b7d362a94f8164c1782bba5)@Tovim can you show where you've found this term in documentation?

meijeru

[10:14](#msg5b7d378ffd3c641b06f276aa)It's in the `path!` datatype description where it has been taken from the specs doc section 5.2.13. Its use is in explaining the evaluation of a path value.

9214

[10:15](#msg5b7d37cf1d3a5711b680558e)Then I surmise that "path-head" is just the first element of `any-path!`.

meijeru

[12:37](#msg5b7d5917e5b40332abe14ca1)No, it is any sequence of path elements from the first up to the last element. As you progress along the path you have to evaluate every element in the light of all that preceded.

[12:41](#msg5b7d5a03c53ee54c18885831)Instead of defining as `{/}+` I chose to give a recursive definition,  
`::=/` where `::=|`

[12:42](#msg5b7d5a37d8d36815e573b2a7)The purpose is to be able to talk about the semantics in terms of path-head + selector.

9214

[12:42](#msg5b7d5a4ec53ee54c18885a40)@meijeru :+1: wise choice.

meijeru

[12:45](#msg5b7d5ad0f5402f32aa76a662)`@Greg T` took this over in the Gitbook. I leave it up to the docs team to finally determine whether such formal ways of saying things are appropriate for the Reference document...

[13:25](#msg5b7d645fc53ee54c18889aea)This conversation made me think again of my explanation of path evaluation. It is now more complete.

Tovim

[14:01](#msg5b7d6c9dac25fd11b57b5f53)@meijeru It depends of what kind of user this Reference document is meant for. Let me refer to an example in "Rebol 3 Datatypes: Path!" (multiple blocks:: USA: [CA ... ).  
Which part of the path in the command "print USA/CA/Ukiah/population" is a path-head and which is a selector?

greggirwin

[14:17](#msg5b7d708d4be56c59187de8a3)@meijeru @9214, is the BNF accurate though? I worked with @gltewalt on the informative text for it in the docs, but the path head is \*only* the first element. Everything that follows is a selector based on that (syntactically).

9214

[14:19](#msg5b7d710afd3c641b06f3ce89)I agree that we need a different phrasing. Concept itself is IMO important.

[14:20](#msg5b7d7139e5b40332abe1ebea)Something like left-context in CF grammars?

[14:21](#msg5b7d71584be56c59187dedeb)CS* grammars, sorry.

meijeru

[14:23](#msg5b7d71d6f5402f32aa773233)I repeat: as one proceeds with evaluation of a path value, the part that has already been evaluated is the (current) path-head, and the next element is to be treated as a selector in relation to that path-head. After evaluation of the indexing/selection as the case may be, the result becomes the next path-head in the evaluation. Or one has to find an other word for "part of the path already evaluated".

[14:25](#msg5b7d7262a491f4591785cb4e)If and when the current section 7.3.5 of the specs doc gets converted into the reference document, such rewording may take place. But not by me...

greggirwin

[14:29](#msg5b7d735ca491f4591785d4ef)@meijeru correct me if I'm wrong, but the way you've described it defines the syntax in terms of the evaluation rules, correct?

[14:31](#msg5b7d73be58a3797aa39f119f)This may be the norm in your spec. I need to go through it again, as it's been a while.

[14:33](#msg5b7d743038a12915e4de54cc)Purely syntactically, this is a correct path definition, yes?

```
path=: [path-head= some path-selector=]
path-head=: word!
path-selector=: [integer! | word! | get-word! | paren!]
```

meijeru

[14:57](#msg5b7d79dec53ee54c1889283c)Purely syntactically you are right. My approach allows a "procedural" explanation of the evaluation rules, in terms of a loop, where the non-terminal &lt;path-head&gt; is a "variable" in the loop. That is why I said: conversion of this to a description fit for a Reference doc is still to be done.

[15:18](#msg5b7d7ed7c53ee54c188948bb)Incidentally, this procedural explanation mirrors to some degree the way it is programmed in the toolchain.

greggirwin

[20:35](#msg5b7dc919cff55e561747d74f):+1:

gltewalt

[21:09](#msg5b7dd10594f8164c1786860f)I get the procedural explanation (at least I think I do) but I’m not sure how to explain it in a more newbie friendly way, or if it needs to be newbie friendly

[22:25](#msg5b7de2c360f9ee7aa4799bc5)The selector is the last word. (Or itself if there is only one word).  
You can't get to the selector if any of the nodes along the way do not exist, so effectively the whole path except for the last word is the &lt;head&gt;.

[22:25](#msg5b7de2f7fd3c641b06f694ee)

```
>> towns/ukiah/web
== http://www.ukiah.com

>> towns/-/web
*** Script Error: path towns/-/web is not valid for none! type
*** Where: catch
*** Stack:  

>> towns/ukiah/foo
== none

>> towns/ukiah: none
== none

>> towns/ukiah/web
*** Script Error: path towns/ukiah/web is not valid for none! type
*** Where: catch
*** Stack:  

>> towns
== [
    Hopland [
        phone #555-1234 
        web http://www.hopland.ca.gov
    ] 
    Ukiah none
]
```

[22:28](#msg5b7de37260f9ee7aa4799f4b)Selector fetches the value referenced by the word and returns it, or returns none

[22:28](#msg5b7de38f58a3797aa3a1b5af)If it doesn't exist it blows up

[22:30](#msg5b7de420c53ee54c188bba4d)Maybe "last word used in the path that is typed"

[22:32](#msg5b7de46638a12915e4e11183)In the original code, if ukiah is the last word used:

```
>> towns/ukiah
== [
    phone #555-4321 
    web http://www.ukiah.com 
    email info@ukiah.com
]
```

greggirwin

[22:33](#msg5b7de4a038a12915e4e1130f)Here's how Carl described them (excerpted): "Paths are expressed relative to a root word by providing a number of selection expressions."

gltewalt

[22:34](#msg5b7de4fca491f459178892a7)Why does this happen then?

[22:34](#msg5b7de508f86b741b05ac196d)

```
>> towns/ukiah/-
== none

>> towns/-/web
*** Script Error: path towns/-/web is not valid for none! type
*** Where: catch
*** Stack:
```

greggirwin

[22:35](#msg5b7de51bfd3c641b06f69f4c)I think something like that, which may be a minor adjustment to what we have now, is good for the reference docs. The specs can go into evaluation detail.

gltewalt

[22:35](#msg5b7de531fd3c641b06f69fb2)That suggest that the terminal word uses `select`?

greggirwin

[22:36](#msg5b7de57ccff55e5617487992)"Selection expressions" is just as they are described in our current ref docs IMO.

gltewalt

[22:37](#msg5b7de5a2e5b40332abe4bffd)Well, I'm fine with however you want to do it.

greggirwin

[22:39](#msg5b7de619e5b40332abe4c286)Why it happens is because it does this: `select select towns '- 'web`, so you can easily view a path in reverse as a bunch of `select/pick`calls.

[22:39](#msg5b7de63ba491f45917889857)And if one of those intermediate results returns `none`, the buck stops there.

[22:45](#msg5b7de77cf5402f32aa7a040b)What probably sets my brain off, with @meijeru's recursive defintion that is bound to evaluation rules is that Red is first, and foremost \*data\*. A path evaluated by normal Red rules may not hold that definition for a path used in a dialect. None of these definitions are incorrect, but we have some overlap, where we may want to clearly separate syntax from semantics.

gltewalt

[22:50](#msg5b7de8a460f9ee7aa479b8b3)You can't get to the final word unless a value other than none is returned, so that effectively means that &lt;head&gt; is all/words/before and &lt;selector&gt; is the final word used.  
Is this wrong? ^

[22:51](#msg5b7de8e2e5b40332abe4d431)all/words/before/&lt;selector&gt;  
all/words/&lt;selector&gt;  
all/&lt;selector&gt;  
&lt;selector&gt;

[22:53](#msg5b7de977e5b40332abe4d743)Remind me to stick in Carls description. (Paraphrased)

greggirwin

[22:55](#msg5b7de9e094f8164c17871cc8)&lt;head&gt; is whatever we define it to be in this case because it's a new term constructed for this purpose. i.e. not the same as `head` for a series.

My point is that the evaluation of the path has nothing to do with the syntax, and the \*successful* evaluation even less. The question then is whether we can and should, or \*how* we should name these things. There is no &lt;head&gt;, there is no recursion, syntactically. There are only the parse rules I posed above.

gltewalt

[22:56](#msg5b7dea31e5b40332abe4d9d1)Well, parse rules seemed an ok idea to me, but I thought it was grumbled about

greggirwin

[22:57](#msg5b7dea42c53ee54c188bde24)Which I should simplify:

```
path=: [word! some path-selector=]
path-selector=: [#"/" [integer! | word! | get-word! | paren!]]
```

[22:58](#msg5b7dea7a94f8164c178720e2)Doesn't matter if it's BNF or `parse` (I would like to use `parse` outside the spec, but understand the spec is for implementors coming from outside).

[22:59](#msg5b7deabef5402f32aa7a1750)

```
<path-literal> ::= <word-literal>/<selector>+
<selector> ::= <integer> | <word-literal> | :<word-literal> | <paren>
```

[23:04](#msg5b7debf8d8d36815e5774e82)Sorry, no Kleene stars in straight BNF. But then should `/` be part of the selector production rule?

gltewalt

[23:05](#msg5b7dec3658a3797aa3a1e18e)There's no "one or more" in base BNF?

greggirwin

[23:05](#msg5b7dec4dff44515616244aa9)No, it's in EBNF and others.

gltewalt

[23:06](#msg5b7dec5d94f8164c1787298a)EBNF is a no go?

greggirwin

[23:06](#msg5b7dec84f5402f32aa7a2049)IIRC, Peter said Nenad preferred straight BNF for this. Certainly we can and should offer various grammars to help people.

gltewalt

[23:10](#msg5b7ded65a491f4591788bca7)See if you can get the go-ahead for parse or ebnf (for examples in addition to the main bnf example)

[23:54](#msg5b7df7d1ac25fd11b57eaee9)word/selector/ is an invalid path, isn't it?

[23:55](#msg5b7df7fee5b40332abe51eed)`//` wouldn't work

## Thursday 23th August, 2018

greggirwin

[00:17](#msg5b7dfd0e60f9ee7aa47a2643)Correct.

toomasv

[10:21](#msg5b7e8aa2d8d36815e57aa4c7)I wonder if following in the spec doc is correct:

```
| /<word-literal>                          ; refinement!
             | #<word-literal>                          ; issue!
```

In case of both issue and refinement, differently from &lt;word-literal&gt; as explained in \[5.2.5](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#525-word), they may also start with number and ' (although such refinement cannot be used in function).

Also, it may be worth mentioning that while `<` and `>` may appear in words, `<>` can only form stand-alone word; neither can `<...>` be part of any word.

meijeru

[15:19](#msg5b7ed098a491f459178df12f)@toomasv You are right on refinement and issue. I will need to be more subtle there. Also the remarks on &lt; and &gt; are to the point.

[15:25](#msg5b7ed1d6d8d36815e57c69f6)@greggirwin Evaluation rules for Red values occurring in a user-defined dialect are of necessity themselves user-defined. Therefore they have no place in a Reference or Spec document. The user \*may* wish to define the dialect semantics using a combination of formal syntax and procedural evaluation rules (although other approaches are quite possible as well) and in that case will probably opt for their own syntax which I can't prejudge.

[15:27](#msg5b7ed255cff55e56174ddf85)@gltewalt @greggirwin Coming to think of it, using "parse syntax" in the Reference document would be a good publicity for parse, and it is at least as readable as (E)BNF.

greggirwin

[16:16](#msg5b7eddc5e5b40332abea4be9):+1:

[18:42](#msg5b7efffe60f9ee7aa4800dd5)The Community link on the main wiki page goes to a non-existent Gitter-Room-Index page. Can you look at that @gltewalt?

gltewalt

[20:15](#msg5b7f15e6c53ee54c1892c74f)Fixed

greggirwin

[20:52](#msg5b7f1e83d8d36815e57e4ced)Thanks.

[21:41](#msg5b7f2a0360f9ee7aa4810af4)@gltewalt, I merged updated Česky docs from @Tovim, but the summary page isn't showing all the TOC contents, as if it hasn't updated. Do you know what the cause might be?

gltewalt

[21:56](#msg5b7f2da2c53ee54c18934ef8)His summary looks right, but it stops rendering at unset!

[21:58](#msg5b7f2de894f8164c178eaf21)Could be something stuck with updating, but I'm combing through it, trying to find a typo

[22:04](#msg5b7f2f60cff55e5617501b51)Try #75

## Friday 24th August, 2018

gltewalt

[00:22](#msg5b7f4fb458a3797aa3aa0467)Datové typy (Data type, I assume) is not indented as it should be in gitbook, and it doesn't function as a link.  
It looks as it should, here: https://github.com/gltewalt/docs/blob/404ff8136f08c482e687648a80e40b0b52c2a0ac/cs/SUMMARY.adoc

[00:24](#msg5b7f504894f8164c178f6bf7)My only guess is that gitbook has a problem with that text? Maybe `Datove typy` or `Datovetypy` would work.

greggirwin

[00:27](#msg5b7f50d5f5402f32aa820cb7)Thanks for digging in.

gltewalt

[00:29](#msg5b7f516f94f8164c178f711b)I can try a test in local gitbook server

[00:42](#msg5b7f547cd8d36815e57f715e)Works on local gitbook server as Datové typy, and the formatting looks fine, so... scratching my head

Tovim

[12:34](#msg5b7ffb5938a12915e4ed2fcf)I have sent the whole whatnot to my local GitHub page, consequently to my local gitbook server (https://tovim.gitbooks.io/docs-cs/content/cs/) and everything seems to be OK.

meijeru

[15:22](#msg5b8022c158a3797aa3aecbb7)@toomasv I supplied new definitions of refinement and issue, but there is a lot of duplication of information now. The whole treatment would benefit from the introduction of a pseudo literal called "symbol" or similar. Then words would be symbols not starting with 0-9 and ', and refinements and issues would be symbols preceded by / and #. How would that sound?

9214

[15:28](#msg5b8024021d3a5711b6917d05)@meijeru wouldn't that overlap with internal `symbol!` datatype?

meijeru

[15:41](#msg5b8027334be56c59188dd736)The symbol! datatype is indeed internal and the reader of a Reference or Spec document does not need to know about its existence. On the other hand, and more importantly, the concept of a word's symbol is used in the explanation of section 6.1 of the Specs and this is precisely what is common between words, refeinements and issues. I would welcome some more comments from others (@greggirwin, @PeterWAWood) before making the change, though.

9214

[15:43](#msg5b8027bdf5402f32aa86e60a)Giving that they are all members of `all-word!` typeset, I very much welcome such conceptual unification. :+1:

[15:45](#msg5b80280b1d3a5711b6919a72)But it's a little bit confusing in my view, since 'symbol', as a term, to me associates with something that has 'referential capacity', which neither `issue!` nor `refinement!` have.

meijeru

[15:55](#msg5b802a7158a3797aa3af0078)The use of symbol in this context was not initiated by me, but I have taken it from some text by @dockimbel only I don't remember where I found it ;-)

[15:57](#msg5b802aebd8d36815e58442e6)To go even further, I could envisage `all-word!` to be renamed `symbolic!`...

toomasv

[15:58](#msg5b802b2d4be56c59188df48c)@meijeru IMO using would be good choice. It would be somewhat similar to how `series` implementation type is reflected by `series!` typeset.

9214

[15:59](#msg5b802b654be56c59188df624)&gt; To go even further, I could envisage `all-word!` to be renamed `symbolic!`...

I leave it to someone with PhD in semiotic studies to rule out :smile:

toomasv

[16:08](#msg5b802d8cfd3c641b0603da0f)@9214 In a broad sense all lexemses are symbolic as they represent something binary deep down and also something conceptual high up. In much stricter sense I see what you mean by referencial capacity. Some might also prefer :laughing:

meijeru

[16:22](#msg5b8030b6fd3c641b0603eda1)In the Lisp world (notably Scheme and Racket) they have symbols too, and the explanation there is: "a symbol is like an immutable string that happens to be interned so that symbols can be compared with eq? (fast, essentially pointer comparison). Symbols and strings are separate data types."  
I offer that as a support for the terminology, even though Red is different in many respects...

9214

[16:24](#msg5b803122e5b40332abf21718)@meijeru in that sense issues and refinements can be considered as interned strings (i.e. symbols in Lisp parlance). But words are interned strings + other interesting things.

[16:25](#msg5b80317bf5402f32aa872e8f)I'm ok with that as long as there is a clean explanation of the terminology and generally accepted glossary.

meijeru

[18:04](#msg5b8048bb58a3797aa3afb930)Went ahead with the changes. Have a look! Specs sections 3.2 and 5.2.5 notably.

9214

[18:09](#msg5b8049e4f86b741b05ba1708):+1:

toomasv

[19:01](#msg5b8055ffff44515616327b3a)@meijeru Great! (There is typo in \[5.2.16](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#5216-issue) `#` character on first line is not visible)

mikeparr

[19:15](#msg5b805966ff44515616329190)@meijeru - In section S111 - " An &lt;integer-literal&gt; is written as a signed integer number ... " then the example shows unsigned numbers - confusing?

meijeru

[19:30](#msg5b805ce7a491f45917971b98)@mikeparr The examples are: Examples: 123 -123 +0001 1'000. There is one negative number, isn't there?

[19:37](#msg5b805e6458a3797aa3b03388)@toomasv Thanks, will be corrected.

mikeparr

[19:46](#msg5b8060ac60f9ee7aa4880262)@meijeru I assumed 'signed' to mean a + or - is compulsory.

meijeru

[19:52](#msg5b8061e34be56c59188f369b)I meant signed to mean spanning negative and positive ranges. If that is confusing I can omit the word, because the range is explicitly indicated. Should I add "a + sign is allowed but not compulsory"?

[19:52](#msg5b80620ca491f459179739e8)Same thing for floats BTW

mikeparr

[20:00](#msg5b8063fb94f8164c1795c3a1)@meijeru Ah, I understand. Personally, I think it is clearer to insert the "a + sign is allowed..etc"

meijeru

[20:07](#msg5b80659e38a12915e4efc8e2)Done.

greggirwin

[20:30](#msg5b806af3ff4451561632f629)A good an interesting topic. Thanks to all for giving it due thought. `Symbol!`, AFAIK is an implementation detail and, as @meijeru said, not part of the language proper. Whether we can safely leverage that term without confusion I don't know. It would be nice, as it's a strong word.

Refinement and issue types both stem from word today (pun somewhat intended), but the lexer uses `symbol` terminology in a couple word-related rules. As we know, those two types simply don't enforce the same limitation on the starting chars. That is when lexing, not post-processed to identify types. `begin-symbol-rule` vs `symbol-rule`.

I like @meijeru's change here, and think we're on fairly solid ground to justify it.

mikeparr

[20:51](#msg5b806fc1fd3c641b0605782b)@meijeru In the whole spec, there are 3 mentions of 'id.' I'm not sure what this means - value perhaps?

gltewalt

[21:10](#msg5b807437a491f4591797a5c3)symbol! seems to have been a datatype at one point, or at least considered for a datatype. I remember seeing a datatype chart that had symbol

9214

[21:10](#msg5b80746058a3797aa3b0ab9e)@gltewalt it's an internal datatype, as @meijeru and I already pointed out :point\_up:

gltewalt

[21:11](#msg5b80746bcff55e5617577563)Oh! sorry :-)

[21:17](#msg5b8075eae5b40332abf3b655)https://doc.red-lang.org/cs/

Is showing correctly now.

greggirwin

[22:59](#msg5b808dd64be56c59189022ca)Woohoo! Nice work @tovim and @gltewalt.

## Saturday 25th August, 2018

PeterWAWood

[04:24](#msg5b80da084be56c591891a3d1)@meijeru Personally, I see word! values much like Ruby symbols that are guaranteed to be unique and "singular" in that they are same in any context in which they appear. I don't feel the analogy to variables in other languages is appropriate for a Reference Manual. (I'm not even convinced that such an analogy is good to use with beginners.)

I see it that words can be bound to values and provide a means to refer to those values.

[04:32](#msg5b80dbc2a491f4591799bc46)In my view, words are not bound to contexts. A word may exist in any context and be bound (or not) to a different value in each context that it is defined.

```
a: 1
o: make object! [a: 2]
f: func[][a: 3]
```

The word `a` is used in three contexts in the code above, it is bound to a different value in each context.

meijeru

[08:11](#msg5b810f2658a3797aa3b39db1)@PeterWAWood There was a discussion (with @greggirwin I think) on terminology previously. The upshot was: words \_refer_ to some value in some context to which they are \_bound\_. You propose an alternative terminology. The Reference doc should use one consistent terminology, whichever.

[08:13](#msg5b810fc160f9ee7aa48b84fe)@mikeparr `id` is a field of `error!` values. See Specs 12.1 and 16.

mikeparr

[16:08](#msg5b817f19a491f459179d1753)@meijeru - id - ok, got it. In 12.1.1 I suggest deleting the full-stop after the 2 "id." occurrences. None of the other content items has a full-stop. Also there is an id. in 4.1, in the percent! description.

meijeru

[19:36](#msg5b81afb894f8164c179c79fd)@mikeparr The id. with full stop is an abbreviation for idem, i.e. ditto. If this gives confusion, I will rephrase.

mikeparr

[21:12](#msg5b81c644fd3c641b060c3e6e)@meijeru re id. yes, please (I was confused!)

PeterWAWood

[22:39](#msg5b81daa7f5402f32aa8ff0e5)@meijeru @greggirwin The concept of binding values to symbols is not unique to Rebol or Red. I believe that it originates from Lisp. I feel that it is misleading to refer to words being bound to a context.

My understanding is that words exist in one or more contexts, in fact with all except the global contexts they must be defined to be in the context when the context is created. With the exception of the global context, words are always bound to variables. Evaluating set (or a set-word) results in the word being bound to the subsequent value).

I don't see how words are bound to a context. Which context would you consider the word a to be bound in the following example?

```
>> 
>> a: 1
== 1
>> o: make object! [a: 2]
== make object! [
    a: 2
]
>> get in system/words 'a
== 1
>> get in o 'a
== 2
```

[22:42](#msg5b81db5df5402f32aa8ff3b9)I also feel it is wiser to use "standard" terms (even if they are only de-facto standards) in our documentation to make them more accessible to people new to Red.

greggirwin

[22:45](#msg5b81dbf2a491f459179efa1a)If we say words are bound to values, not contexts, we have a lot of changes to make. Consider `bind`, and the recurring question of "words \*refer to* values, values are not \*assigned to* words."

You can have multiple instances of words, which is how I'd explain your example above.

[22:47](#msg5b81dc66fd3c641b060cadff)Certainly, something like unification in Prolog has a very strong history of how Peter wants to use "binding".

[22:50](#msg5b81dd4260f9ee7aa48fbf85)If we repurpose binding to mean a word's association with a value, not a context, what do we use to describe the association of a word to a context? Words carry this association with them, they do not carry any association with them about a value they refer to. They can \*only* refer to a value in a context, and all they know is their relation to a context.

[22:56](#msg5b81deb2ac25fd11b5948374)

```
>> o: make object! [a: 1]
== make object! [
    a: 1
]
>> oo: make object! [a: 2]
== make object! [
    a: 2
]
>> w: bind 'a o  get w
== 1
>> w: bind 'a oo  get w
== 2
```

&gt; Evaluating set (or a set-word) results in the word being bound to the subsequent value).

That isn't how it works though. You bind a word to a context. The word then "remembers" that context, and \*its position* in the context, which is then used to find the associated value at the same position.

[22:59](#msg5b81df3a58a3797aa3b7d903)If you ask a word "What value are you bound to?", it would say "Let me ask my context."

## Sunday 26th August, 2018

PeterWAWood

[00:53](#msg5b81f9ec1d3a5711b69b2bcc)I still see it as you having bound a word to a value. In this case, the word 'w' is bound to a word value 'a' in the `o` context and then to the word `a` in the `oo` context.

```
>> a: 1
== 1
>> o: make object! [a: 2]
== make object! [
    a: 2
]
>> oo: make object! [a: 3]
== make object! [
    a: 3
]
>> w: bind 'a o
== a                          <-- w is bound to a in o
>> get w
== 2                          < a in o is bound to 2
>> w: bind 'a oo
== a                         <-- w is now bound to a in oo
>> w
== a
>> get w
== 3                         <-- a in oo is bound to 3
```

greggirwin

[01:51](#msg5b8207b094f8164c179e3d30)My use of `w` didn't come across as intended, so I'll resort to the age-old example.

```
>> a: 1
== 1
>> o: make object! [a: 2]
== make object! [
    a: 2
]
>> oo: make object! [a: 3]
== make object! [
    a: 3
]
>> blk: reduce ['a bind 'a o bind 'a oo]
== [a a a]
>> print blk
1 2 3
```

I'll ask this question again:

&gt; If we repurpose binding to mean a word's association with a value, not a context, what do we use to describe the association of a word to a context?

Next up would be names of related funcs: `bind in context? set`

Ultimately, though, it comes down to how things really work. And how they really work is that words are bound to contexts. That's the design.

PeterWAWood

[02:07](#msg5b820b65ac25fd11b5954ca9)To answer your question, I see a context is simply a list of word values. Semantically it consists only of words. (Internally, I assume it consists of a word and a reference to a value).

[02:20](#msg5b820e5760f9ee7aa490aed4)Another difficulty, I have with the concept of "words are bound to contexts" is that it is imprecise. A word gets bound to a word in the context.

I can only bind when the word already exists in the context.

```
> ooo: make object! [b: 1]
== make object! [
    b: 1
]
>> a: bind 'a ooo
== a
>> context? 'a
== make object! [                       <-- still global context
    datatype!: datatype!
    unset!: unset!
    none!: none!
    logi
```

[02:21](#msg5b820eb6d8d36815e58e0c7b)For me, `bind` does exactly what it says, it binds a word or list of words to the in the specified context.

[02:36](#msg5b82122e4be56c591897c465)My paradigm even helps me make sense of Carl's trick example in the Rebol Function Dictionary:

```
>> settings: [start + duration]
== [start + duration]
>> schedule: function [start] [duration] [
;-- start & duration are defined in the schedule
;-- function context
[    duration: 1:00
[    do bind settings 'start
;-- binds `start to `start in the function context
;-- + does not exist in the function context so 
;-- remains bound to its value in system/words
;--binds' duration to duration
[    ]
>> schedule 10:30
== 11:30
```

gltewalt

[02:39](#msg5b8212fb1d3a5711b69b9ef7)“For practical purposes, words are internally represented by three items: a pointer to a context, an index in a symbol table which contains the symbol, and an index in the context which facilitates retrieving the value the word refers to.” - Rudolf Meijer

PeterWAWood

[02:43](#msg5b8213c2fd3c641b060da50c)Rudolf is referring to the implementation there.

[02:46](#msg5b82149b4be56c591897cf96)I understand that as there are many different ways to solve a problem in Red, there are probably an equal number of ways to understand it. My way of understanding suits me though I fully accept that it may not be widely held and so should not be used in the documentation.

gltewalt

[02:50](#msg5b82158f1d3a5711b69babd3)I’m still catching up.

greggirwin

[03:14](#msg5b821b311d3a5711b69bc552)&gt; A word gets bound to a word in the context.

That's not correct, though you can \*also* do that. `a` in `context [a: 1]` is not bound to a word, it is only "bound" to the context. However, it is true that words \*contain a reference to* a context. This is what we call the binding. We have also said that words "carry a reference to" their context at times, which is a nice, less technical explanation.

```
red-word!: alias struct! [
	header [integer!]	;-- cell header
	ctx		[node!]		;-- context reference
	symbol	[integer!]	;-- index in symbol table
	index	[integer!]	;-- index in context
]
```

Words and values in contexts are 2 separate things:

```
red-context!: alias struct! [
	header 	[integer!]	;-- cell header
	symbols	[node!]		;-- array of symbols ID
	values		[node!]		;-- block of values (do not move this field!)
	self			[node!]		;-- indirect auto-reference (optimization)
]
```

If words are bound to a value, we should be able to ask what value they are bound to, yes? But we can't. Not directly, as I noted earlier.

The terminology was set by the designer (Carl) and carried forward. If we want to change that, including related function names (which will break all kinds of stuff), we need a clear and concrete proposal that we all agree is better. Then we'd have to convince Nenad.

I'm pushing back pretty hard on this, because it's \*really* important. It's a key element of understanding, docs, explanations, and implementation.

[03:34](#msg5b821fced8d36815e58e5f33)On the OS GUI Metrics subject, if someone wants to take it upon themselves to go through the blog entries and note what to extract, with target docs, that would be \*fan\*tastic.

gltewalt

[04:29](#msg5b822c96d8d36815e58e9bee)I assumed it was already in docs. I’ll take a gander.

9214

[06:48](#msg5b824d58e5b40332abfd28e1)I'm with @greggirwin on the bound/refers subject. Word is characterized by 2 things: how it looks (index in symbol table), and what it means (context reference + index in this context). It never refers to value directly, and it never 'knows' what it means.

If you'd ask a word 'hey word, what's your meaning?' it would answer 'hell if I know, sir, check out dictionary at page X (check out context I refer to at index X). Symbol table is involved in the process too, but this simple explanation sufficed for me in the past.

## Monday 27th August, 2018

meijeru

[12:25](#msg5b83edb2f86b741b05ccf0ae)In my effort to document as many features of Red as possible I found the reflective property `'owned` which is defined in `%series.reds` and inherited by `block! paren! any-path!`. @dockimbel has agreed to have it inherited by other types (see #1957 and comments to commit \[6f06015](https://github.com/red/red/commit/6f0601549eae8217e060d321d7ac6a606d4e399c)). My question now is: what does it represent?? Inspection of `%ownership.reds` does not enlighten me enough :frowning: .

9214

[12:26](#msg5b83ede8d8d36815e597d8b7)@meijeru I think it's related to object ownership model, which is yet to be fleshed out and documented.

[12:28](#msg5b83ee80d8d36815e597dc0b)This and many other properties should be controlled by `modify` action... in theory.

[12:28](#msg5b83ee82d8d36815e597dc2b)https://github.com/red/red/issues/3393

meijeru

[12:29](#msg5b83ee8f1d3a5711b6a55d01)Of course, that is why I looked in the source text, but I need a narrative explanation. The system is sufficiently fleshed out I think.

[12:31](#msg5b83ef25e5b40332ab05978e)From your cited issue I assume that series do not get "automatically" owned on creation. My question is thus, in what circumstances do series get owned (if not manually)?

9214

[12:31](#msg5b83ef2b60f9ee7aa49a68cc)@meijeru basically, owner (an object) of a series will react to changes in that series according to code in `on-deep-change*`.

[12:32](#msg5b83ef6e1d3a5711b6a561ec)@meijeru inspect the output of

```
print mold/all make deep-reactor! []
```

for specific hints.

meijeru

[12:32](#msg5b83ef7694f8164c17a822a6)Yes I know, but in your example, the series was not owned until you did it manually. Does one always have to set the owned property manually?

9214

[12:33](#msg5b83efb11d3a5711b6a5642f)@meijeru I copypasted this example from the body of `deep-reactor!`s `on-deep-change*` function.

[12:34](#msg5b83efdd1d3a5711b6a565ed)@meijeru yes, it is done manually (or automatically if you rely on reactor prototypes).

meijeru

[12:36](#msg5b83f0301d3a5711b6a5672e)I understand now, owned is only used by the system for the reactivity facility, and otherwise the user has to set it manually.

[12:36](#msg5b83f040f86b741b05ccffe1)I learned something! Tx

9214

[12:36](#msg5b83f059ac25fd11b59f6673):muscle: :mortar\_board:

meijeru

[17:47](#msg5b843917d8d36815e599c906)I have added some explanation of on-(deep-)change* and the owned property to the Specs. Of course, the total picture is only obtained by taking into account the GUI and reactivity documentation.

greggirwin

[18:44](#msg5b8446824be56c5918a39bd9)The only docs I know of are in https://www.red-lang.org/2016/03/060-red-gui-system.html

[18:45](#msg5b8446c158a3797aa3c4cf06)&gt; Ownership is set automatically on object creation if on-deep-change* is defined, all referenced series (including nested ones), will then become owned by the object. modify action has been also implemented to allow setting/clearing ownership post-creation-time.

meijeru

[19:17](#msg5b844e637649b9063e115717)Thanks, that is an additional useful reference.

## Saturday 22nd September, 2018

Tovim

[08:11](#msg5ba5f926f7e158062509a649)Tov-1:  
The red-lang's GitHub repository red/docs, the red/docs/cs/datatypes.adoc file lists error!, percent!, time!, ... datatypes.  
The https://doc.red-lang.org/cs/datatypes web page does contain error! and time! but not percent! datatype.  
The left side TOC column of the https://doc.red-lang.org/cs/ page does not contain error!, percent! and time! datatypes, so there is not possible to access to these pages.  
Why do these discrepancies exist?

[08:15](#msg5ba5fa3bb4990c30eef05a6c)Tov-2:  
The bottom line of the TOC column reads "Published with GitBook", which is a link to the https://www.gitbook.com that leads to the new version of GitBook. This version declares that it does not support asciidoc source files any more.  
Should not the link be https://legacy.gitbook.com instead, that leads to the legacy version of GB that does support the ~.adoc files?

## Tuesday 25th September, 2018

9214

[01:26](#msg5ba98ed77bd81c5b9dab8209)@meijeru \[5.4.2](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#542-target-type-logic)

&gt; The function `to-logic` yields `true` for any argument value except \*\*`false` or\** `none`.

[02:18](#msg5ba99aedfe37781110f225c2)\[5.2.10](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#5210-email)  
&gt; An is written as \_two or more_ characters containing one `@` but not beginning with it.

```
>> type? @
== email!
```

greggirwin

[02:59](#msg5ba9a48798245f4ae07c269a)That's just a current lexer issue, not by design.

## Friday 28th September, 2018

meijeru

[17:40](#msg5bae6780c7bf7c3662877dba)@9214 For a while, I did not get your problem with to-logic.But now I suppose you prefer \*and* to \*or\*. It will be done.

[17:50](#msg5bae69eb271506518d89e358)@9214 Also, thanks for your close reading of the specs document. I like your attention to detail and to consistency (one of my dadas too). Of course, all this is just in preparation for the "real" reference doc that may borrow from the specs, but have its own style, order of presentation etc. Still, what I wanted to offer is something which is \*right* and rigorously presented, and you are helping there. Thanks again.

greggirwin

[17:55](#msg5bae6b2eef4afc4f28ecf2ba)And we appreciate \*both* of you and your attention to detail on this.

## Saturday 29th September, 2018

9214

[01:29](#msg5baed5746e5a401c2deb3bf3)@meijeru you misunderstood me - there was no part about `false` being "falsey" at all.

[01:39](#msg5baed7e55a52b440159e336e)To clarify - it is there now because I've made a PR, which @greggirwin accepted.

meijeru

[09:17](#msg5baf43205af485306834b9de)Aha, so it was you notifying me of a change you \*made* instead of a change you wanted \*me* to make. Now I have made it even more pedantic :smirk:

9214

[13:48](#msg5baf82a05af485306836059b)@meijeru I notified you of a desired change... and then made the change :smirk\_cat:

## Thursday 4th October, 2018

meijeru

[11:27](#msg5bb5f922c7bf7c3662b4907a)One thing I miss in the documentation is the precise mechanism for argument and return value passing between Red code and routines ("Red/System code in a Red jacket"). All that has been descxribed is the correspondence between the types on both sides (`string! <-> red-string!` etc.). Where do you get your 1st, 2nd etc. argument from? Where do you leave your result?

9214

[11:29](#msg5bb5f9b282893a2f3b9aa154)@meijeru from/on internal evaluation stack.

meijeru

[11:33](#msg5bb5faa2c7bf7c3662b49cde)I suspect, but what is needed for those who wish to write decent routines, is to have an exact recipe. E.g. what is the name of the stack, and how are the arguments arranged (from the top or bottom?).

9214

[11:52](#msg5bb5fef31e23486b938867d4)From what I know, the common answer to this is "wait until after 1.0".

meijeru

[11:58](#msg5bb6005dbbdc0b2505e51dac)I don't think that such basic mechanisms will change much. Moreover, without the recipe, how can one write a decent routine?

9214

[12:00](#msg5bb600c8271506518db6620a)All of this comes to interaction with runtime library, which is highly undocumented as of now, because "this is all a throw-away code which will be tossed out after bootstrapping phase".

meijeru

[12:16](#msg5bb604943844923661e25e6a)As far as I understood, it is the \_Rebol_ code which will be thrown away, not the Red/System runtime code. That would be an enormous waste!

9214

[12:16](#msg5bb604b5600c5f6423513b30)Yes, but runtime architecture will change significantly on the way to 2.0.

[12:17](#msg5bb604d7e65a63433680ee5b)Anyway, no one can give you answers, except for @dockimbel and @qtxie.

meijeru

[12:18](#msg5bb60508c7bf7c3662b4e467)That makes the routine feature much less valuable...

greggirwin

[17:11](#msg5bb649dfc7bf7c3662b6bc03)We have to find a balance between helping people use and evaluate Red, while at the same time, making it clear that many things \*will* change, based on what was learned in building this version of Red. The lower level you go, the closer you are to internals, the more likely it is that things will break.

meijeru

[17:47](#msg5bb65232bbdc0b2505e7696b)So routines remain something for the initiated...

greggirwin

[17:49](#msg5bb652a95331811c2e4d082d)It would be nice to have more examples, but the core team can't do that anytime soon.

## Friday 5th October, 2018

loziniak

[00:21](#msg5bb6ae91e65a634336855a27)I spent some time digging in runtime code. I think passing arguments is done by allocating a memory on stack and then passing pointers to `red-*!` structs as routine's function's arguments. Allocating memory is done by R/S code generated by compiler, and deallocating memory used for params does not need to be done by person who writes the routine.

[00:22](#msg5bb6aeaf82893a2f3b9f38fc)Returning value is also done by returning a pointer to `red-*!` struct. But here I think that memory for a returned value should be allocated inside routine. Most probably it will be deallocated on routine's exit by code generated by compiler. This is done by `stack/unwind` function, I think.

[00:22](#msg5bb6aecc1e23486b938d012a)I wrote a simple code that assumes that all of this is true, and it works as expected:

```
Red []

next-char: routine [
	c [char!]
	return: [char!]
] [
	c/value: c/value + 1
	return c
]

print #"a"           ; a
print next-char #"a" ; b
```

[00:24](#msg5bb6af41271506518dbadbad)Compiling Red to R/S also taught me a lot: https://github.com/red/red/wiki/%5Bzh-hans%5D-Compile-Red-code-to-Red-System-and-learn-something

greggirwin

[15:42](#msg5bb7866b1e23486b93923490)Thanks for posting your findings @loziniak.

## Saturday 6th October, 2018

meijeru

[09:01](#msg5bb879f8ef4afc4f28287f23)As some of you may have noticed, I have trouble editing the `.adoc` for the specs document on one particular point: within backticks \\`, the`#`sign sometimes disappears, and has to be superquoted with a`\\\`

[09:03](#msg5bb87a511e23486b9397c58d)This is not only very inconvenient, but it is also erratic, at least I have not found the rules governing this behaviour. Anyone has experience/solutions?

9214

[09:10](#msg5bb87c0cae7be940160cda1a)@meijeru \[this](https://www.methods.co.nz/asciidoc/faq.html#\_how\_can\_i\_selectively\_disable\_a\_quoted\_text\_substitution)?

meijeru

[09:27](#msg5bb87ff0435c2a518e5d6214)Thanks, I found some good explanations.

## Tuesday 9th October, 2018

GiuseppeChillemi

[22:55](#msg5bbd31dd435c2a518e7c1d71)There have been nice discussuon on RED gitter chats. Is there an index and topics list created somewhere ?

## Wednesday 24th October, 2018

BeardPower

[16:21](#msg5bd09c1964cfc273f91b5084)@mikeparr  
Hi, there is a typo/error:  
http://www.red-by-example.org/#dehex

```
red>> dehex "%41BC"                     
== "ABC"
; 41 is hex for B

it should state:
; 41 is hex for A
```

vandot

[17:34](#msg5bd0ad1abbdc0b25059303e2)I am completely new to RED and I am stuck right at the beginning, in some example I found example to read random images with `read https://source.unsplash.com/random/310x200` but request timeouts, from browser or curl it works but it takes more then 1s to get a response, is it possible to increase timeout for a request in RED?

9214

[17:35](#msg5bd0ad6bae7be94016acddc5)`until [attempt [read ...]]`, but watch for infinite loop.

rebolek

[17:41](#msg5bd0aec6069fca52a58a1790)@vandot also, you should use `/binary` refinement - `read/binary https://source.unsplash.com/random/310x200`

greggirwin

[17:47](#msg5bd0b014c08b8b306767c5f1)@vandot, also, what OS are you on. The Linux build doesn't have full image support yet.

rebolek

[17:47](#msg5bd0b02bbbdc0b25059316d7)Which doesn't mean you can't read them :)

greggirwin

[17:47](#msg5bd0b045435c2a518efbaed1)Correct, just pre-emptively looking ahead.

[17:48](#msg5bd0b069069fca52a58a21e8)But we can move to red/help to continue, since this isn't doc related.

## Saturday 3th November, 2018

GiuseppeChillemi

[21:34](#msg5bde1480a9c55b2574a1f802)I admit I am finding difficult having answers on RED from google.  
It returns results on multiple domains but rarely about RED as programming language. You should retry the queries many times until you find the correct one.  
Does this happen to you too ? How do you solve this ?

ne1uno

[21:52](#msg5bde18a96eb1e3597aa7042a)add some text to the search string, `rebol/red` some search engines can understand `site: red-lang.org` or some other site.

[21:53](#msg5bde18d440449151f4f2c7cb)http://www.red-by-example.org/index.html http://helpin.red/ https://github.com/red/red/wiki/%5BLINKS%5D-Unofficial-Tutorials-and-Resources

gltewalt

[23:52](#msg5bde34c3076992347ab09cc2)I search “red language”

## Sunday 11st November, 2018

GiuseppeChillemi

[17:04](#msg5be861377326df140eed4ff7)How do you colorize RED code for HTML publishing ? (Blogspot, wikis...)

Ungaretti

[17:30](#msg5be8671b7326df140eed758a)I presume you mean syntax highlight. I had difficulty with that, as wikis, for example, require a code highlighter that usually don't include Red. I have been using a plugin for Notepad++ called NppExport to export or copy HTML to clipboard. I added this plugin to Rededitor, so you may give it a try with the options available. But I believe you will have to insert the HTML in the page's HTML, I mean, cut and paste to the page itself may not work. Hope this helps. Good luck!

gltewalt

[18:17](#msg5be87227d001b9172044b49d)That depends on the service. If they have plugins which use regex for code highlighting, you could borrow the regexs from the Red plugin for Visual Studio Code.

GiuseppeChillemi

[18:37](#msg5be876e1d001b9172044d67a)Blogger

gltewalt

[18:41](#msg5be877f247217e07ff08116a)Here a little tutorial on Blogger code highlighting, but an extension would have to be made for Red. Looks like they use Regex via JavaScript

[18:41](#msg5be877f5f1b8753404ae6255)http://oneqonea.blogspot.com/2012/04/how-do-i-add-syntax-highlighting-to-my.html

Oldes

[19:43](#msg5be886442138723405ef9d94)&gt; How do you colorize RED code for HTML publishing ? (Blogspot, wikis...)

I would recommend using this: http://rebol.desajn.net/highlight/demo/

[19:47](#msg5be8874cd001b917204542b7)I don't remember why it is not in official version.

[19:49](#msg5be887cabb88787474b339e0)Ah... here it is... https://github.com/highlightjs/highlight.js/pull/988 If someone wants to volunteer to move it far, I would be more than happy as I don't have much time for it.

[19:51](#msg5be8884a47217e07ff0878d9)Or you can just use my version as the problems were mostly related to language autodetection.

## Tuesday 20th November, 2018

meijeru

[11:31](#msg5bf3f082951402310a77f358)For information: I consider the hex-bigint branch sufficiently evolved to start tracking it in the specs document. Perhaps some comments will emerge. Where I have to second-guess the design I will hopefully get some answers.

rebolek

[11:44](#msg5bf3f38addad8777ef926676):+1:

greggirwin

[20:05](#msg5bf468f6fa7bbb3fe0d97c9f)That's fine, but know that it's an early work in progress, so may see changes.

meijeru

[20:33](#msg5bf46f80b6c07010525ed9c1)I did the bare minimum, and in reading the code I see many gaps, so I keep this as the skeleton for later additions.

greggirwin

[20:40](#msg5bf47127f59704348ed9267d):+1:

## Wednesday 21st November, 2018

BeardPower

[11:03](#msg5bf53b92ced7003fe161432f)@meijeru Is the available EBNF spec of Red/System up to date?

meijeru

[15:46](#msg5bf57dc287c4b86bccf53e2a)@BeardPower Short answer: no. Longer answer: I am working (on and off) on the update; about 90% finished. Hope to finish before end of year.

BeardPower

[17:08](#msg5bf590f16621313894f7c2c0)@meijeru :+1:

## Sunday 25th November, 2018

amreus

[15:11](#msg5bfabba8958fc53895e97bcb)Why does Github wiki search return non-existing and duplicate pages? Bit annoying. Not sure what can be done since it's a Github problem. Example search which returns 9 results where only 2 or 3 are correct: \[walkthrough](https://github.com/red/red/search?q=walkthrough&amp;type=Wikis)

ne1uno

[15:19](#msg5bfabd99e25cc274053fa89b)https://www.google.com/search?q=walkthrough site:github.com/red/red/wiki

amreus

[15:39](#msg5bfac244b6c070105286da97)@ne1uno Thanks. \[Your link](https://www.google.com/search?q=walkthrough site:github.com/red/red/wiki) gives better results. Wish I didn't need to remember a work-around.

ne1uno

[15:43](#msg5bfac331f048fa10511f4f25)I think anyone who can edit the front page could add a search box. there is the \[github advanced search too ](https://github.com/search/advanced?q=walkthrough)

gltewalt

[15:51](#msg5bfac4f7b6c070105286ec7b)If you’re in the Wiki, you can search under Pages. No duplicates.

https://imgur.com/a/Snof1th

9214

[16:12](#msg5bfac9e3d24f9324d24ff751)@meijeru any idea what that is?

```
>> type? point!
== datatype!
```

meijeru

[16:31](#msg5bface6ff048fa10511f90c4)It is a future datatype for three-dimensional coordinates, whose name has already been defined, but that is all, no implementation yet. In the specs document, it figures as TBD.

## Tuesday 27th November, 2018

Phryxe

[09:56](#msg5bfd14d5d24f9324d25e7c6e)\*Red/System Implementation Todo-list* on Documentation page links to start page of the Wiki. I don't see the todo-list there ...

endo64

[10:06](#msg5bfd172d958fc53895f86b78)Todo list removed (archived may be) from the wiki. We need to update the R/S docs.

[10:10](#msg5bfd181fd24f9324d25e9552)Team notified to update the web site, thanks for pointing that out.

## Tuesday 4th December, 2018

dockimbel

[06:34](#msg5c061feebc1a693e3a524c81)@9214 `point!` is a datatype introduced to expose specific info (a slot with 32-bit integers) from Parse's internal stack in Parse event functions. It's a WIP, and meant primarily in its future final form for 3D representation (and eventually coordinates if a suitable literal format is found).

9214

[12:38](#msg5c0675596c3c565096d0f51d)@dockimbel cheers Doc.

[18:07](#msg5c06c27b99ad1556db073ff7)@meijeru cannot find this in your conversion matrix:

```
>> to integer! #abcd
== 43981
```

[18:08](#msg5c06c2b099ad1556db0740dd)Hex-like issues can also be converted to `binary!`

```
>> to binary! #abcd
== #{ABCD}
```

meijeru

[19:47](#msg5c06d9c6464b6c0fd68f288b)`to integer!` is described in the specs section 5.4.5; `to binary!` is indeed missing -- thx for pointing that out, I will add it

[20:02](#msg5c06dd641c439034af1ae153)BTW in the specs document there is no conversion matrix as such -- if you really referred to one, I suppose you mean the one in `red/docs/conversion-matrix.xlsx` made by dockimbel; that is not maintained by me, so if you want that kept up-to-date you should make an issue in the `red/docs` repository

9214

[20:24](#msg5c06e29799ad1556db0819ff)@meijeru thanks, I should've checked your spec more closely; now I also see that `binary!` conversion is covered in 5.4.10.

## Tuesday 11st December, 2018

meijeru

[20:13](#msg5c101a573de4e816e2476e72)I am reviewing the argument-types for all built-in functions. I will report here about findings. The first finding is the following -- not a new issue, but something to be observed: argument types for routines are severely restricted, namely they may only be the \_single_ word `any-type!` or else a \_single_ type name that is either`integer!` `float!` or `logic!`, or one that has a Red/System `struct!` alias defined that describes a value slot of that type. I had already raised issue #2642 in this connection, but now I have seen a new consequence: a routine that works for both `word!` and `lit-word!` arguments, must have `any-type!` for its argument, and do the type check in R/S in the body; thus the routine spec block has less documentation effect, if you see what I mean.

[20:16](#msg5c101b1280986419d576c9b9)Second finding: the argument type for the `source` function is `any-word!` and `any-path` but in the body of `source` the argument is supplied to `get/any` which only allows `word!` and `path`. Thus `source` can restrict its argument also to these two types. Is this worth an issue?

[21:35](#msg5c102d8ce4787d16e3806b64)Third finding: `absolute` is defined on `char!` values -- this makes no sense. Note that `sign?`, `positive?` and `negative?` are NOT defined on `char!` values. Again, worth an issue?

[21:45](#msg5c102ff280986419d577518e)Fourth finding: `reduce` accepts `any-type!` i.e. including `unset!` and `compose` accepts only `default!` i.e. without `unset!`.

gltewalt

[21:45](#msg5c102ff626de6f0822bc9afe)If you can do arithmetic in char!, they should all be defined

meijeru

[21:46](#msg5c10302680986419d57752f0)So according to you, either all of absolute, positive, negative and sign, or none of them?

gltewalt

[21:46](#msg5c103037f992693c7a5bec4f)Yes, or none of them

meijeru

[21:46](#msg5c103041e4787d16e3807a78)Will you make the issue?

gltewalt

[21:47](#msg5c10305ff4880a60a26368cb)I can, yes

rebolek

[21:48](#msg5c1030c428907a3c7b055bf7)`char!` was always (silently) considered (unsigned) `integer!`.

meijeru

[21:56](#msg5c103296e4787d16e3808afa)Fifth finding: `to-pair` with a single percent value is accepted, but with a block of two values they may not be percent. Is this inconsistency disturbing anyone?

gltewalt

[21:58](#msg5c103322178d7860a1c048a3)Get "Math or number overflow" with char! arithmetic, when going negative, so your first suggestion would be the correct one - remove `absolute`

[22:12](#msg5c10364080986419d5777dde)@meijeru I think you got char! added to `absolute` #2700

[22:14](#msg5c1036af28907a3c7b0583e9)Single percent value seems to always give 0x0

meijeru

[22:57](#msg5c1040ef8d4f3a2a7ca93da9)I did not remember. @dockimbel added absolute to char! in order to avoid a problem with mod(ulo). That single percents always give 0x0 comes from truncation, of course. Try `to pair! 100%` it will give 1x1.

## Wednesday 12nd December, 2018

endo64

[09:09](#msg5c10d062e4787d16e38434ee)This room is for docs repo hence # 2700 goes to issue 2700 on docs repo which is not exists. https://github.com/red/red/issues/2700 is the correct link.  
`and`, `or`, `xor` also works with `char!`

meijeru

[09:12](#msg5c10d1113de4e816e24bcd9d)All operations on integers that have not got to do with sign are OK.

[09:13](#msg5c10d13e11bb5b2504a11565)For char! I mean

greggirwin

[23:02](#msg5c11936d8336e22a7d230917)On routines, thanks @meijeru. @gltewalt would you start a page for `routine!` values, or a wiki page where we can note things that are outside the scope of the spec doc?

[23:02](#msg5c119386e4787d16e38961c5)I've commented on @meijeru's other tickets directly.

[23:14](#msg5c11964ae4787d16e3897067)Seems a lot of new questions raise design points, as with `char!` here. Technically, `zero?`, `positive?`, and `sign?` can return plausible results. That doesn't mean they're useful. So we're faced with the question, again, of whether allowing/supporting actions that \*might* make it easier to deal with some edge cases is preferable to enforcing stronger semantics based on standard type usage.

If there's not a strong and clear case for big savings, and low risk, I prefer the latter. Some coercing can be very helpful, and even safer and cleaner overall, but there's a line where you effectively become "untyped", and lose the value that all our wonderful types provide.

## Thursday 13th December, 2018

gltewalt

[02:49](#msg5c11c8bff4880a60a26dad17)You want a doc on routine!, or a wiki entry?

[02:50](#msg5c11c8ef1e86c308236ce77b)Might be better to start on a doc page

greggirwin

[07:46](#msg5c120e471e86c308236e873d):+1:

9214

[15:58](#msg5c1281918d4f3a2a7cb7b19e)Isn't it the time to bump documentation's version too?

greggirwin

[20:12](#msg5c12bd4972f31355cd4e904f)We can, yes. Can someone confirm if we just need to update https://github.com/red/docs/blob/master/book.json, and if we just create a tag for the value in a new entry there? I don't know why the last one is different than the rest.

gltewalt

[23:02](#msg5c12e521ae1ab5539ee0eac1)Was it changed 6 days ago ?

[23:05](#msg5c12e5b5e86b0460b3938b06)Looks like a new link was added “Red Programming Language”

[23:06](#msg5c12e5e6392d8c6f8e5942aa)So, might want to ask Nenad

greggirwin

[23:08](#msg5c12e666ae1ab5539ee0f0b8)In the repo, for me, it looks like it hasn't changed since last march.

gltewalt

[23:09](#msg5c12e6bbb4c74555ccc3718b)Ok, that was the gitbook that changed 6 days ago then. Let me look at it with laptop

[23:36](#msg5c12ed0572f31355cd4fbdf6)I believe he has to save current work as v0.6.3, because past versions are part of an url. `http://doc.red-lang.org/v/v0.6.2/`

[23:37](#msg5c12ed21ca317a0e25c24832)Then you can make a new entry for 0.6.4 that mirrors the current 0.6.3

[23:43](#msg5c12ee91ca317a0e25c2534a)Ping him and see what he did for the past versions

[23:55](#msg5c12f16ec428e9539d351681)I'll do a PR in a moment to test it - the versioning plugin may take care of it.

## Friday 14th December, 2018

toomasv

[16:47](#msg5c13de99987052387ee670d1)In "VID Dialect" doc in para \[6.1.20. react](https://doc.red-lang.org/en/vid.html#\_react) there is still \*"Note | Reactors are part of the reactive programming support in View, which documentation is pending..."* But `react` doc is already out there. May be link to it?

endo64

[17:05](#msg5c13e2c5e86b0460b399b597)I think yes, it should be updated. I get `504 - Timeout` for the link, site is temporary down I think.

toomasv

[17:07](#msg5c13e338ca317a0e25c865df)Yeah, I get some error messages too, somebody is active there :wink:

greggirwin

[18:22](#msg5c13f4f9539aca60b20db813)Linking to the react docs would be great. :+1:

## Friday 21st December, 2018

AlexanderBaggett

[17:12](#msg5c1d1effd945b96882d543e5)@nedzadarek, and I just figured out the hyphen `-` used in the official red documentation for `view` is not the 45th ascii character and would not work when pasted directly.

nedzadarek

[17:14](#msg5c1d1f596649aa1f82ad949c)@AlexanderBaggett good catch, I have done the same: \[/help](https://gitter.im/red/help?at=5c1d1e61babbc178b2b93c6e).

9214

[17:23](#msg5c1d219dbabbc178b2b950ee)That's a broad statement. So far I can reproduce it only with event names from \[this](https://doc.red-lang.org/en/view.html#\_event\_names) table, the ones that use bold style.

AlexanderBaggett

[17:24](#msg5c1d21c58d31aa78b1d88d11)@9214 , good catch. Appreciate your help in narrowing it down.

9214

[17:29](#msg5c1d230192cf4d2242d3d533)There are 20 such characters on View documentation page, all can be found in bold text in tables with `Ctrl+F` and `‑` as a search target.

nedzadarek

[17:29](#msg5c1d230d93cce97d3b787193)@9214 Yes, I have only found 20 occurrences of it in this document (by search -&gt; copy-paste).  
You are to fast...

[17:31](#msg5c1d235923323d58bd04582f)Well, but is this character useful/meaningful? Can we just change all occurrences of it with the ASCII's 45th character?

9214

[17:35](#msg5c1d246623323d58bd045f61)The problem might be in Gitbook rendering. I doubt that people who wrote documentation sporadically switched to non-breaking hyphen (`U+2011`) on all these 20 occasions.

nedzadarek

[17:47](#msg5c1d273d3c4093612c3ff298)@9214 What I can see is that some "elements" are wrapped in the `block and some are not.`

`greggirwin 18:31In the %.adoc source, those are indeed ‑. I wonder if the bold markup (*) gets confused if there's a standard hyphen. meijeru 20:56Despite heroic efforts, there are still 4 functions in the source that have no docstring: alert, recycle, red-complete-input, stop-reactor. 21:00BTW there are two functions alert. This I will bring up in the red/gui-branch room. gltewalt 22:51@Tovim If you are around, check your private messages`

`Saturday 22nd December, 2018 Tovim 20:08I am sorry, what "my private messages"? gltewalt 20:10Direct message on Gitter Tovim 20:14Do you mean to sign in in this room? rebolek 20:47@Tovim Users can send you private messages, those messages are not bound to any room. It's direct communication between you and another user. I'll send you one also. Wednesday 26th December, 2018 amreus 12:47On [this post](https://www.red-lang.org/2018/12/064-simple-gc-and-pure-red-gui-console.html) from the Red blog, it looks like something is missing from the rich-text example. Maybe some html tags got eaten? 12:48[![00555.png](https://files.gitter.im/red/docs/rU8V/thumb/00555.png)](https://files.gitter.im/red/docs/rU8V/00555.png) Arie-vw 16:15@GiuseppeChillemi Sorry for the late reply :) I am still not sure if the Wiki is the best way to go with red-by-example. I am trying how to do things with Miraheze, but find it quite discomforting that there are no real straightforward docs. Creating pages and formatting can be found easily. However, one of the most important things is to let only approved users edit the Wiki. For such questions I can't find straight answers. I'd really like to have a simpler and straightforward system. Anybody have better ideas for this? GiuseppeChillemi 16:40[![image.png](https://files.gitter.im/red/docs/MjVH/thumb/image.png)](https://files.gitter.im/red/docs/MjVH/image.png) 16:40@Arie-vw: First select the permissione page, then select a group and SUBMIT 16:42[![image.png](https://files.gitter.im/red/docs/L18n/thumb/image.png)](https://files.gitter.im/red/docs/L18n/image.png) 16:44[![image.png](https://files.gitter.im/red/docs/CCHr/thumb/image.png)](https://files.gitter.im/red/docs/CCHr/image.png) 16:45The you can manage permissions for the USER group You will find a lot of permissions, here are some of the most important Remove them for basic users and add them to the group you whish to give edit permissions. (There are other permission too but I don't want to fill this group) dsunanda 17:01@amreus The code as published seems to be missing a font and a /font - this seems to work: view [ rich-text data [ "Hello" font 24 red " Red " /font blue "World!" ] rich-text data [i b "Hello" /b font 24 red " Red " /font blue "World!" /i] rich-text data [i [b ["Hello"] red font 24 [" Red "] blue "World!"]] rich-text data [i/b/u/red ["Hello" font 32 " Red " /font blue "World!"]] ] amreus 17:04@dsunanda I think the blog ate the html-style tags & and & dsunanda 17:06rich-text does not *need* html-style tags - words like b and /i work just as well. The rich-text dialect is flexible enough to recognize html-style tags, so you can use <b> and </i> if you prefer. amreus 17:08@dsunanda Yep, but the blog needs to escape the html-style tags. That's what I'm trying to say. dsunanda 17:09Agreed - the blog needs an edit. amreus 17:12I'll try to be more precise next time. :grimacing: dsunanda 17:15Using English as a messaging language may not be the best choice :) Can you raise a github issue? Then the bloggers will see it. [Red Issues](https://github.com/red/red/issues) amreus 18:05The official docs server seems to be down? http://doc.red-lang.org/ And now it's back. Friday 28th December, 2018 GaryMiller 18:36Any information on Red Professional yet. I understand that there will be a for pay product as well as the Open Source version. Just interested in what the major feature set differences will be and approximate price point so that if I make the investment in time and effort to learn Red well that I won't need to switch to something else if it turns into an expensive product, becomes cloud based or yearly subscription or licensing fees model. I kind of saw that happen with Julia even though they still have an Open Source version the JuliaPro and JuliaTeam professional versions are much nicer but expensive. Saturday 29th December, 2018 dockimbel 05:30@GaryMiller No information yet. The open source Red will still be there and continue on its roadmap. greggirwin 23:09@amreus @dsunanda thanks for catching that. Some formatting was lost between edits. Code can be copy-pasted now, though the formatting is a bit off visually for the moment. 23:13Fixed. Sunday 30th December, 2018 GiuseppeChillemi 00:01@dockimbel > @GaryMiller No information yet. The open source Red will still be there and continue on its roadmap. I am strongly against it but I recognize how importat money is. I would prefer donate constantly to the foundation to support an open and free RED so that everyone could access it. greggirwin 00:25@GiuseppeChillemi, if you can donate enough, we won't need to sell a Pro version. ;^) GiuseppeChillemi 13:08@greggirwin a continuous donation in the range 200 to 1500 USD each year is what I think send to fund RED foundation. The former is the amount I can give just now, it this moment of deep difficutly for my company, the latter when we will financially recover . 13:11Open and free (Liber!) does not mean everyone should take without giving, but helping in any way and amount he can to maintain good exchange between receiving and donating. pekr 15:52I think that donations should be still possible via a Red Foundation, or something like that. Foundation could use donations to sponsor some selected development activities. Wrong group anyway .... Monday 31st December, 2018 greggirwin 07:25Yes, @pekr, thanks for catching that.`
