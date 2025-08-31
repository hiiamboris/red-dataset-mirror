# Archived messages from: [gitter.im/red/sandbox](/gitter.im/red/sandbox/) from year: 2018

## Monday 1st January, 2018

gltewalt

[01:22](#msg5a498d4f0163b028109ae64c)Need an Owl for a mascot

[01:23](#msg5a498d7e29ec6ac311a48051)Rufus the Red 🦉

greggirwin

[22:51](#msg5a4abb760163b028109f8116)We're on HN again! https://news.ycombinator.com/item?id=16046218

## Tuesday 2nd January, 2018

9214

[08:05](#msg5a4b3d5668d092bb6213f2a2)triple kill

gltewalt

[19:18](#msg5a4bdb005355812e5743a1fc)Gregg Irwin had a blog. And said the same things that I think but am afraid to say to people

9214

[19:19](#msg5a4bdb3468d092bb62173056)Gregg is just a Greg who grew a `g`, yo

gltewalt

[19:19](#msg5a4bdb480163b02810a49ad2)Evolution

greggirwin

[19:20](#msg5a4bdb75edd223081104baa8)I am older. Maybe you'll get another `g` someday @gltewalt.

gltewalt

[19:25](#msg5a4bdc9268d092bb6217372e)Yeah, if I mind my Ps and Qs

greggirwin

[19:25](#msg5a4bdcb65355812e5743ab2e)Dot your `I`s and cross your `T`s.

9214

[19:32](#msg5a4bde545355812e5743b297)@gltewalt it should be `jpegg` though

greggirwin

[19:33](#msg5a4bde84b48e8c356691292e)Watch what you're sayingg!

9214

[19:33](#msg5a4bde900163b02810a4ad40)gee :eyes:

gltewalt

[19:51](#msg5a4be2cc232e79134dba6dfc)It should be, but the rest of the world disagrees

9214

[19:53](#msg5a4be31f0163b02810a4c5d3)if you have a program that  
\* in the (very) best-case scenario is used once in 1-2 years for less than 30 seconds  
\* have relatively readable sources

is it worth the effort to go all fancy and rewrite everything from scratch using all the tricks I've learned?

gltewalt

[19:55](#msg5a4be3b6232e79134dba733c)I think it is, because you'll probably learn more things

greggirwin

[19:57](#msg5a4be412b48e8c3566914ba0)@9214, if it makes you happy, or if you want to write it up as a "then and now" article or something.

9214

[20:07](#msg5a4be6960163b02810a4da68)it's just that coming up with data format and maintaining fanciness/ease-of-rewrite balance is hard :confused:

gltewalt

[21:33](#msg5a4bfabfb48e8c356691c49b)Hey it doesn't look like `save/as` with none works correctly either

greggirwin

[21:37](#msg5a4bfba65355812e57445630)Doesn't work how?

gltewalt

[21:38](#msg5a4bfbdd5355812e57445777)It prints none in the text file

[21:38](#msg5a4bfbee68d092bb6217da93)(writes none)

[21:39](#msg5a4bfc25b48e8c356691ccdf)`/as => Specify the format of data; use NONE to save as plain text.`

greggirwin

[21:41](#msg5a4bfc8429ec6ac311af2bf4)And what do you think it \*should* do?

gltewalt

[21:46](#msg5a4bfd9bb48e8c356691d6af)Save the data as plain text

[21:46](#msg5a4bfdb903838b2f2a62bc8a)In which case don’t need `save/as`

greggirwin

[21:46](#msg5a4bfdba84fb74b9402dd74c)Isn't that what "none" is? Or maybe I don't understand.

gltewalt

[21:48](#msg5a4bfe4529ec6ac311af344a)The way I read it, should be able to do this  
`save/as %test “aaaaaa” none`

[21:49](#msg5a4bfe64232e79134dbb0304)And have %test have the content “aaaaaa”

greggirwin

[21:51](#msg5a4bfec9b48e8c356691dd3b)Correct, you don't need `/as` then, but it can make things easier sometimes. Propagating refinements can lead to more complex code. By having a refinement that lets you \*optionally* include an arg (effectively), any wrappers can just always use `/as`.

[21:51](#msg5a4bfee168d092bb6217ead4)Is that not what it does (your example)?

[21:52](#msg5a4bff155355812e5744658d)AH! Now I get it! Yes, bug.

[21:53](#msg5a4bff60b48e8c356691e07f)\*Really* good catch.

gltewalt

[21:56](#msg5a4c002968d092bb6217f2ea)But I caught that one ‘after’ I did my PR

greggirwin

[21:57](#msg5a4c002eb48e8c356691e489)Looks like `either as` should be `either all [as word? format]`

[21:57](#msg5a4c0047232e79134dbb0e09)That's fine. If you do another PR while this one is open, same branch, it should add to it.

[21:58](#msg5a4c008468d092bb6217f4a5)Then the `if word? format` check can go away.

gltewalt

[22:02](#msg5a4c018a68d092bb6217fa7c)Out driving around atm

[22:05](#msg5a4c02435355812e574477f7)Can I edit my own PR later?

greggirwin

[22:06](#msg5a4c0267b48e8c356691eeef)Yes. Your next PR should add to this one, if it's still open.

gltewalt

[23:01](#msg5a4c0f39b48e8c3566922c56)`/all` is TBD

[23:01](#msg5a4c0f4f5355812e5744b8bf)did you mean `either as [as word? format]`

## Wednesday 3th January, 2018

gltewalt

[00:18](#msg5a4c213d68d092bb62188855)Similar thing with `load/as` but it returns `none` if the codec isn’t supported. And `load/as %my-file none` works

greggirwin

[04:37](#msg5a4c5dfb5355812e5745fb90)I meant `all` as in the standard function, which is a good catch, as it would need to be `system/words/all` due to the refinement of the same name.

[07:07](#msg5a4c814868d092bb621a0fc8)I'm working on this now @gltewalt, so it we don't forget your find.

gltewalt

[07:09](#msg5a4c81930163b02810a778f7)Qxtie already pulled in the one change, so I guess it will be an additional

greggirwin

[07:09](#msg5a4c81b903838b2f2a64f1d3)Yes, but that's OK.

[07:14](#msg5a4c82cfba39a53f1acdab8a)Now my turn to mess with git.

## Thursday 4th January, 2018

gltewalt

[03:17](#msg5a4d9cc85355812e574c63e7)Is GUI writing console-cfg.red in rich text?

[03:19](#msg5a4d9d2403838b2f2a6a956f)Looks malformed in notepad, even though it works .

greggirwin

[05:53](#msg5a4dc16e84fb74b940364b56)Uses LF for line term, not CRLF, don't know why they aren't localized. Notepad is simple, and doesn't know what to do.

## Friday 5th January, 2018

gltewalt

[02:41](#msg5a4ee5f20163b02810b3c32b)I don't understand this. From Carls `makedoc2.r`

```
emit: func [data /line] [
	; Primary emit function:
	insert insert tail out reduce data newline
]
```

[02:42](#msg5a4ee60b232e79134dc9c452)What's `/line` for? It isn't used in this func block

[03:06](#msg5a4eeb9cb48e8c3566a07332)New entry in script error table:

```
script: object [
				code:				300
				type:				"Script Error"
				wat:     ["wat?"]
				no-value:			[:arg1 "has no value"]
				need-value:	       [:arg1 "needs a value"]
```

greggirwin

[12:42](#msg5a4f72bf03838b2f2a73ab13)@gltewalt, could just be a change in the make-doc code that never got cleaned up, as it won't cause an error.

gltewalt

[22:28](#msg5a4ffc1c232e79134dcf3a66)I'm ahead of @9214 in the contributors listing :sparkles:

[22:29](#msg5a4ffc306117191e612e9915):dancer:

[22:30](#msg5a4ffc7fba39a53f1adf3858):clap: Your fix is now in there @greggirwin

## Saturday 6th January, 2018

9214

[06:22](#msg5a506b3803838b2f2a787652)@gltewalt uuuuuunstopable :horse\_racing:

gltewalt

[20:24](#msg5a5130615355812e575d8ea8)So much more activity

## Sunday 7th January, 2018

9214

[08:10](#msg5a51d604ba39a53f1ae67630)how do you guys feel about all the people popping around in `/blockchain`, asking about crypto but having absolutely zero interest in language itself?

greggirwin

[08:11](#msg5a51d626ce68c3bc748a51e1)Unsurprised. :^\\

9214

[08:11](#msg5a51d63ece68c3bc748a5230)@9214 grumble-grumble

[08:39](#msg5a51dcdbce68c3bc748a695b)I also feel that I might miss a lot of opportunities while ignoring all the hype around RCTs and upcoming ICO

[08:40](#msg5a51dcfe232e79134dd69a83)need to sat down and learn a bit about these technologies, but don't have much time for that

rebolek

[08:41](#msg5a51dd3f0505ad8b45c42d2e)I will certainly miss a lot of opportunities because of the stupid asynchronous javascript callback hell.

9214

[08:42](#msg5a51dd8a0505ad8b45c42db2)@rebolek why you're in JS land?

rebolek

[08:43](#msg5a51dda1ba39a53f1ae68cde)Because I'm trying to make stats bit nicer.

gltewalt

[09:26](#msg5a51e7e30505ad8b45c452c1)Can’t do stuff like `emit` in `makedoc2.r` ?

[09:28](#msg5a51e844290a1f45615b6b01)How do they wind up in /blockchain without seeing the main articles? Is it linked to that room in twitter or Facebook posts?

rebolek

[09:48](#msg5a51ece4b48e8c3566ad8915)Probably because of https://globenewswire.com/news-release/2017/12/28/1275069/0/en/Red-open-source-project-goes-on-blockchain-a-new-full-stack-toolchain-for-smart-contract-development.html

9214

[17:40](#msg5a525b8b0505ad8b45c635b6)### Julia vs Python: Julia language advantages  
...  
\* Metaprogramming

\### Python vs Julia: Python advantages  
...  
\* Julia arrays are 1-indexed

Jeez, what a price! Awesome whichever way you look at it :joy:

gltewalt

[17:43](#msg5a525c31ba39a53f1ae89c9b) Off by one errors are an advantage? :smile:

9214

[17:45](#msg5a525cbdba39a53f1ae89ea8)they have an interesting \[`Docathon!`](https://github.com/JuliaLang/julia/projects/8) github project which IMO we should adopt sooner or later

## Wednesday 10th January, 2018

gltewalt

[01:13](#msg5a5568c5ae53c15903cb7af7)I think I’m about to sign on to do phone work - tech support for military contract, but I don’t wanna do phone work and I don’t want to mess with Security+ recertification. :worried:  
Somebody save me.

[01:22](#msg5a556ac9ce68c3bc749c2ca5)Someone really knows their html+css stuff for https://ico.red-lang.org  
Looks awesome

[05:44](#msg5a55a8446117191e6149417c)bootstrap and fontawesome ftw

9214

[10:31](#msg5a55eb74b48e8c3566c1d1a7)&gt; Red is a simple but powerful core, used to build specialized languages for each domain, from metal to meta

I really love "from metal to meta" part, this should be our go-to slogan

[13:36](#msg5a5616ecce68c3bc749f5018) 1 ETH = 76,854.12 RUB

welp

greggirwin

[17:14](#msg5a564a0d5a9ebe4f756e787d)It was noted that the ETH minimum was to keep them from being too overloaded, since the KYC is a manual process.

9214

[17:15](#msg5a564a4fb48e8c3566c408fe)@greggirwin I just counted how many months of total non-existing (only breathing and lying on the floor) I need to get 1 ether :D

[17:17](#msg5a564aadb48e8c3566c40ba9)so for me "go RED" :point\_right: "go PVS" :leaves:

[17:18](#msg5a564aebb48e8c3566c40cd8)nevermind, I'm actually more intereted in what will come after ICO

[17:30](#msg5a564d9a232e79134deda855)s/intereted/interested/ dang

greggirwin

[17:50](#msg5a5652575a9ebe4f756eb044)I have to wait for secondary markets as well.

## Thursday 11st January, 2018

gltewalt

[00:53](#msg5a56b5706117191e614f1f39)A rectangle is an angle that has been reduced to a state of ruin

[02:02](#msg5a56c5a1ae53c15903d2c95f)What the heck? I wonder why this has stalled?  
https://github.com/jneen/rouge/pull/818

[02:03](#msg5a56c5e8ba39a53f1aff60c9)At least @rebolek could use it for gitlab since gitlab uses rouge for syntax hilighting

[02:03](#msg5a56c60a61a861c927fb6d39)And I could have mastered the little dsl and made it way better by now if I knew it was just going to sit there for months

9214

[13:14](#msg5a57633bb48e8c3566c99428)@gltewalt maybe we can comment on PR to speed up the process or something?

gltewalt

[16:11](#msg5a578ca0d0514c785b1a784b)maybe

## Friday 12nd January, 2018

are1000

[11:35](#msg5a589d875a9ebe4f757a8162):tada: :sparkles:

[11:36](#msg5a589db4ba39a53f1a088b9b)continuing: I'm going to create a Red dialect, that allows you to program with emojis

rebolek

[11:38](#msg5a589e3b290a1f45617d6df6)That sounds extremely useful

are1000

[11:38](#msg5a589e52b48e8c3566cfbeb6)\*\*extremely\**

PeterWAWood

[11:39](#msg5a589e77b48e8c3566cfbf30)@are1000 Are you really going to create a dialect or sneakily use macros?

[11:39](#msg5a589e7e6117191e61587c63)From the blog

One possible use of macros can then be word-aliasing, for example translating words at compile-time (using French words here):  
#macro si: func \[]\['if]  
#macro affiche: func \[]\['print]  
#macro vrai: func \[]\['true]

si vrai \[affiche "Vive Red !"]  
will result in:

```
if true [print "Vive Red !"]
```

are1000

[11:40](#msg5a589e9883152df26d611f30)I can't imagine writing Dapps and Red/C3 contracts without Red/☺️

9214

[11:40](#msg5a589e9c6117191e61587d3a)you can just `emoji: :function`

are1000

[11:40](#msg5a589ec7b48e8c3566cfc03e)@PeterWAWood @9214 macros and substitution is for weak, this will be a full blown dialect with new, emoji-friendly syntax!

9214

[11:41](#msg5a589edf290a1f45617d70ee)@are1000 we need a sales pitch for our private investors!

[11:41](#msg5a589eed1dcb91f177406940)this is gonna be BIG

are1000

[11:41](#msg5a589ef31dcb91f177406948)it will be called 🅱️ed dialect

PeterWAWood

[11:42](#msg5a589f0aba39a53f1a0891f0)Will it be statically typed? That's all the rage these days.

9214

[11:42](#msg5a589f1aae53c15903dbdeef)JS interop please

are1000

[11:42](#msg5a589f36b48e8c3566cfc222)Of course, with built-in types like :pizza:!

9214

[11:42](#msg5a589f3783152df26d6122f2)I wonder if there's a J variation with emojis...

are1000

[11:43](#msg5a589f4d61a861c92704a22a)There is that https://github.com/anowell/emoji-lang

PeterWAWood

[11:43](#msg5a589f56290a1f45617d728d)I hope you will have a 🎦 type in Full HD

are1000

[11:44](#msg5a589f9d290a1f45617d73d4)Definitely! Type unions will be there as well

[11:45](#msg5a589fddb48e8c3566cfc520)🎦❗: 🎥❗ + 💰❗

PeterWAWood

[11:45](#msg5a589fef5a9ebe4f757a8c2b):clap:

[11:46](#msg5a58a009ae53c15903dbe3fd)@rebolek Will want both of these - 🎹 and 🎤

are1000

[11:46](#msg5a58a01cb48e8c3566cfc61c)Of course, built in support for tags and mentions

[11:47](#msg5a58a04a290a1f45617d776f)By the way @PeterWAWood, did you have a chance to check out https://redbot.iama.re? Or maybe did you miss it in the torrent of messages?

9214

[11:47](#msg5a58a056ba39a53f1a089971)allow be to butt in a little :alien:

```
,.([:<@:|.1{.~])"0>:i.5
┌─────────┐
│1        │
├─────────┤
│0 1      │
├─────────┤
│0 0 1    │
├─────────┤
│0 0 0 1  │
├─────────┤
│0 0 0 0 1│
└─────────┘
```

rebolek

[11:47](#msg5a58a0615a9ebe4f757a8e97)@PeterWAWood :bangbang:

PeterWAWood

[11:48](#msg5a58a0a05a9ebe4f757a9016)@rebolek Is that good or bad - I'm a real newbie at these emojis

9214

[11:49](#msg5a58a0dd61a861c92704ab49)@PeterWAWood it's the sound that @rebolek makes when he squeaks out of joy

PeterWAWood

[11:55](#msg5a58a22661a861c92704b487)@Are1000 I haven't looked at it yet (too busy getting nothing done). Gregg and I discussed the bot and Gregg has asked the ICO people to confirm that they are happy to have the bot. There has been no response yet.

are1000

[11:58](#msg5a58a2cf61a861c92704b6ca)@PeterWAWood it's ok! I just wasn't sure if anything is going on - I am aware that there may be refusal - and it's ok! :D I have made this bot for the community :) (I just want to know because it is currently residing on a server with limited resources)

rebolek

[11:58](#msg5a58a2f05a9ebe4f757a9d85)@9214 exactly

9214

[12:01](#msg5a58a39961a861c92704ba51)@9214 \[s/be/me/](https://gitter.im/red/sandbox?at=5a58a056ba39a53f1a089971)

are1000

[12:44](#msg5a58adc5ae53c15903dc2dbd)I was also thinking of making a bot that (with a proper command) evaluates Red code on gitter

[12:45](#msg5a58adedba39a53f1a08e710)But the longer I think about it, I'm more and more concerned about all those hackers that would try and circumvent all safety measures (looking at you @9214 )

9214

[12:45](#msg5a58adfcba39a53f1a08e78f):neckbeard:

rebolek

[12:49](#msg5a58aee35a9ebe4f757adfe4)https://github.com/rebolek/gritter/blob/master/redbot.red

are1000

[12:52](#msg5a58af881dcb91f17740c661)That is great! Although not very safe? :P

rebolek

[12:52](#msg5a58af8f6117191e6158da38)No :)

are1000

[12:52](#msg5a58afa86117191e6158dae0)One could just eat up all of your resources because of lack of GC (or is it one instance of Red for every message?)

rebolek

[12:52](#msg5a58afa983152df26d618205)It should start another process with `call`and kill it when not responding.

9214

[12:52](#msg5a58afaaba39a53f1a08f376)@9214 rubs his hands

are1000

[12:53](#msg5a58afc4b48e8c3566d01da1)or read all of your sensitive data?

rebolek

[12:53](#msg5a58afdbb48e8c3566d01e73)I have POC somewhere.

are1000

[12:54](#msg5a58aff583152df26d6182d8)People of color?

rebolek

[12:54](#msg5a58affa83152df26d6182ed)Of course it redefines things like `read`, `write`or `call` to none.

[12:54](#msg5a58b0021dcb91f17740c925)Proof of concept

are1000

[12:54](#msg5a58b004ae53c15903dc3a8d):P

[12:54](#msg5a58b019ba39a53f1a08f635)One frame before you responded I did a mental facepalm and remembered what is POC

rebolek

[12:55](#msg5a58b03261a861c92704fd0c)I finally found my rPi, so I have hardware where the bot can live.

[12:55](#msg5a58b03aba39a53f1a08f746)(those damn small computers)

are1000

[12:56](#msg5a58b075ba39a53f1a08f86c)What model do you have?

rebolek

[12:56](#msg5a58b0811dcb91f17740cb75)rPi 2

are1000

[12:56](#msg5a58b09161a861c92704fff4)I could definitely imagine Red/OS for RPi

[12:57](#msg5a58b09c290a1f45617dd466)that would be absolutely cool, like absolute zero cool

rebolek

[12:57](#msg5a58b0a1b48e8c3566d02301)It was very great buy, week before rPi 3 was announced.

are1000

[12:57](#msg5a58b0c31dcb91f17740cced)Imagine Red being the operating system

[12:58](#msg5a58b0dd290a1f45617dd568)The amount of tomfoolery that you would be able to do is mindblowing

rebolek

[12:59](#msg5a58b12dae53c15903dc40e1):)

[12:59](#msg5a58b1395a9ebe4f757aeb99)That's the original idea behind Rebol

[12:59](#msg5a58b148ce68c3bc74ac57c8)1) develop language  
2\) write OS in it

9214

[14:58](#msg5a58cd306117191e61598569)then develop a language on that OS

are1000

[14:59](#msg5a58cd4161a861c92705acd7)Redception

9214

[14:59](#msg5a58cd566117191e6159867a)https://inception.davepedu.com/

ne1uno

[16:41](#msg5a58e54c83152df26d62c3cd)

[16:41](#msg5a58e54cba39a53f1a0a3363)\*9/

greggirwin

[23:53](#msg5a594a825a9ebe4f757e3bda)As @PeterWAWood noted, we haven't gotten a response from the team, but I feel it's safe to post what was suggested, knowing it's not officially sanctioned.

&gt; The "official" Telegram chat is Public. It is open to anybody with a Telegram account. Any bots used to gather and re-publish information from Telegram are outside the purview of the Red team, and so are neither endorsed nor restricted by the team, but should honor any rules or limitations Telegram imposes for bots and content extraction. If you operate a bot against a Telegram room, it would be polite to inform the members of that room of the bot's existence. People are discussing ICO transactions and other potentially sensitive information, possibly based on current room membership, not with the expectation that it will be made more public.

[23:54](#msg5a594aa083152df26d64e021)As you might all guess, the team is very busy. :^)

## Saturday 13th January, 2018

gltewalt

[00:55](#msg5a59591061a861c927089a45)Just remember that I warned you all almost a year ago about the Rails effect.  
https://youtu.be/lmuKsI5kcKw

## Monday 15th January, 2018

gltewalt

[05:41](#msg5a5c3ef55a9ebe4f7589a019)https://www.damiencosset.com/trying-understand-blockchain-making-one/

9214

[16:23](#msg5a5cd56dba39a53f1a1a87e9)Okay fellas, I finally rewrote my stuff (decoder) from scratch - the main idea was to decouple \[specification](https://github.com/9214/daruma/blob/master/src/datasheet.red) from \[implementation](https://github.com/9214/daruma/blob/master/src/decoder.red). It turned out as an interesting design challenge, but in the end I'm proud that project is now re-organized, looks fancier and runs as fast as before.

[18:05](#msg5a5ced77ae53c15903eeac13)How can I call a situation when server allocates all its resources to one user but dismisses all other users? Bottleneck?

ne1uno

[18:06](#msg5a5cedc1ae53c15903eead80)prioritize

greggirwin

[18:13](#msg5a5cef445ade18be397c0a10)@9214, does the server do that on purpose, or just not protected from a single user consuming all resources?

[18:14](#msg5a5cef7c6117191e616b6685)I'm excited to read your new code. I remember the project, but also, I think, that I didn't take time to understand it all.

9214

[18:14](#msg5a5cef7d5ade18be397c0c07)@greggirwin kinda in between (it's not a real situation, just a narrative I'm coming up with \*wink-wink* ;))

greggirwin

[18:17](#msg5a5cf051290a1f45619038ff)Ah, right. "Preferential treatment" is a way to say some people are given preference. "Bottleneck" implies it's not in the servers control, as in not being the chokepoint by choice. If it's by choice, it's like a "gatekeeper", or whatever they call the people who let you into the dance club, or not, based on how sexy you are.

dander

[18:18](#msg5a5cf07bb48e8c3566e2c043)@9214 maybe "the resource is drained by the user"? But I think what @greggirwin was implying that if it is on purpose, it might be more like "resources are allocated to user x"

9214

[18:19](#msg5a5cf09a5ade18be397c158e)Thanks! I just wonder if there's one technical term for that situation or not.

dander

[18:19](#msg5a5cf0b1290a1f4561903bb9)bouncer?

greggirwin

[18:23](#msg5a5cf185ae53c15903eec4a5)@dander, I was thinking that, but they never let me in, so I haven't been able to ask.

[18:23](#msg5a5cf1acce68c3bc74be7974)@9214, if it's the server's choice, "favoritism" is a good word.

9214

[18:24](#msg5a5cf1e3ce68c3bc74be7ad5)\*technical* term which tech-savvy persons use

greggirwin

[18:29](#msg5a5cf326b48e8c3566e2d049)You keep making the question harder! ;^)

9214

[18:30](#msg5a5cf3465ade18be397c22b1)\[!\[images.duckduckgo.com.jpeg](https://files.gitter.im/red/sandbox/L8fo/thumb/images.duckduckgo.com.jpg)](https://files.gitter.im/red/sandbox/L8fo/images.duckduckgo.com.jpeg)

greggirwin

[18:30](#msg5a5cf352ba39a53f1a1b40ad)@ne1uno may be right then, `priority`.

9214

[18:31](#msg5a5cf380ae53c15903eed0fa)so, troubles with priority management... will do, thanks @ne1uno !

greggirwin

[18:32](#msg5a5cf3b95ade18be397c24e7)"Fair queueing" is a term used in scheduling systems as well, but doesn't exactly roll off the tongue.

ne1uno

[18:39](#msg5a5cf56b1dcb91f1775355f9)I think it happens more often in the reverse, slower connections getting less access so they timeout. they should get less data more often. with net neutrality out the window, that is never going to happen. servers will know who has a higher priority and may have to cater to them or pay the consequences.

gltewalt

[19:41](#msg5a5d03dc5a9ebe4f758e0e3a)RAP

9214

[19:41](#msg5a5d03fcce68c3bc74bedefe)ting go skrra

gltewalt

[19:42](#msg5a5d04175a9ebe4f758e100d)Resource Allocation Policy

9214

[19:43](#msg5a5d0452517037a212ad36e3)life will never be the same

## Wednesday 17th January, 2018

9214

[10:50](#msg5a5f2a84ba39a53f1a26bd53)Luna goes beta  
http://www.luna-lang.org/#Overview

are1000

[10:51](#msg5a5f2a991dcb91f1775ebf93)Finally!

[10:52](#msg5a5f2b0b6117191e6176fa4a)(although for a language that tries to be as human readable/visual as possible, they sure don't care about accessibility)

Phryxe

[12:31](#msg5a5f4209b48e8c3566eef52d)It would be nice to include Red in listings package (https://en.wikibooks.org/wiki/LaTeX/Source\_Code\_Listings) for LaTeX so we can use syntax coloring in PDF documents.

are1000

[14:06](#msg5a5f586f290a1f45619ce789)Does anyone here is familiar with a concept of transducers?

9214

[14:29](#msg5a5f5dda6117191e617834b1)all I know is that it's some Hickey stuff

greggirwin

[17:30](#msg5a5f88415ade18be398a29be)@are1000, I've looked into them a bit. Can't say they grab me yet.

[17:34](#msg5a5f89121dcb91f177612763)@Phryxe, what would be involved? The format doesn't look hard from the examples there, but details are often the death of us. Need someone to take the lead on it. While it might be nice, it's not going to bring anyone new to Red, for us to spend core resources on it right now.

Phryxe

[21:46](#msg5a5fc444b48e8c3566f255cf)@greggirwin Well, I now see at the bottom of the page I linked to that \*minted* package is an alternative that uses \*Pygments* which supports 300 languages, including Red and REBOL.

greggirwin

[21:52](#msg5a5fc583290a1f45619fafbf)Great! https://github.com/red/red/wiki/Editor-Integrations may not be exactly the right place to note that, but if you add a note there, we can always move it later.

gltewalt

[21:58](#msg5a5fc7011dcb91f17762b331)That reminds me - thanks @9214 for commenting on the rouge commit.  
She left a little response but I don’t think anything has changed

[21:58](#msg5a5fc712517037a212bca978)Er, rouge PR

## Thursday 18th January, 2018

Phryxe

[09:23](#msg5a60679cae53c15903016fcb)@greggirwin I added it to the wiki. I mentioned `listings` even though it doesn't support Red, as this package doesn't require extra installations. Maybe someone in the future adds Red to its supported languages.

greggirwin

[18:51](#msg5a60eccb6117191e6181a1fd)Thanks!

gltewalt

[23:43](#msg5a613131290a1f4561a7a9c8)This might be an interesting project to see if it can be done withe view/vid:  
"keystroke dynamics measures the pattern and rhythm as a user types on a keyboard. It measures details such as speed, dwell time, and flight time. Dwell time is the time a key is pressed, and flight time is the time between releasing one key and pressing the next key. Many security professionals refer to this as behavioral biometrics because it identifies behavioral traits of an individual."

greggirwin

[23:58](#msg5a6134b0290a1f4561a7b9bd)

```
key-log: copy []

log-key: func [key dir][repend key-log [now/precise key dir]]

view [
    area hint "What are your thoughts?"
    on-key-down [log-key event/key 'dn]
    on-key-up   [log-key event/key 'up]
    button "Show Log" [print mold new-line/skip key-log on 3]
]
```

## Friday 19th January, 2018

greggirwin

[00:00](#msg5a613507517037a212c4e75a)I guess `hint` doesn't work on `area`.

gltewalt

[00:01](#msg5a613553ae53c15903068066)Did you already have this?

greggirwin

[00:01](#msg5a613557ae53c1590306809f)Nope.

gltewalt

[00:01](#msg5a6135605a9ebe4f75a5a573):clap:

[00:02](#msg5a613592ba39a53f1a32a863)The other part might get hairy though. Identifying someone based on that

greggirwin

[00:03](#msg5a6135d06117191e61834ec0)Well, yeah, but now you have data. I have old aggregator funcs which might be useful in this, but you need a set of rules to start. e.g. dn-up pairs vs dn-dn\*/up-up* runs, avg vs quantize, etc.

[00:04](#msg5a6136205a9ebe4f75a5a98e)That is, turn those rules and timings into a pattern signature. When you see a new message, you run through the same rules and compare to all the people-patterns you have, looking for the closest match.

are1000

[14:57](#msg5a62073dce68c3bc74da2885)I wonder how hard would it be to create a Red interpreter in BASIC.

9214

[14:57](#msg5a62074c290a1f4561abece3)@are1000 let's see...

are1000

[14:57](#msg5a620760ba39a53f1a36da0f)Specifically some kind of "embarrasing" BASIC, like SmileBASIC

rebolek

[14:57](#msg5a620764ba39a53f1a36da15)harder than doing BASIC interpreter in Red.

9214

[14:57](#msg5a6207669cdc721e4fa0d203)http://www.red-lang.org/2016/12/entering-world-of-macros.html

[14:57](#msg5a62076ce014122650662cc3)scroll down to "A DSL compiler"

are1000

[14:58](#msg5a6207aa9cdc721e4fa0d38f)@9214 in the opposite direction :P

9214

[14:59](#msg5a6207b85a9ebe4f75a9fb5d)ah, misread

greggirwin

[21:36](#msg5a6264e6e0141226506886ae)@are1000, start with the lexing. How hard to do numbers and strings? Does it have structs or objects? At a glance SmileBASIC doesn't seem to, so how are you going to represent "compound" types? Lex all those. Now you can `load` all Red data, including nested blocks and objects, cool! How hard was that? Now all you have to do is implement all the datatypes to handle their actions, and natives. From their it's as easy as any other interpreter for a multi-paradigm language that uses definitional scoping. ;^)

[21:39](#msg5a6265996117191e6189f22e)Maybe look at it like this, Rebol was the best and easiest language with which to build Red. Eliminate the compiler from Red, and you have a working model. That is, I don't think it can be any \*easier* than the current Red interpreter, and likely a lot harder.

What you need to ask then, is how much you can remove, to start small.

## Saturday 20th January, 2018

gltewalt

[02:04](#msg5a62a3b4ae53c159030e37bc):smiley\_cat:

```
>> system/console/history: ""
== ""
>> "hi"
== "hi"
>> system/console/history
== "^G^@^@^@^@^@^@^@ð1^M^B^@^@^@^@^G^@^@^@^@^@^@^@Ø1^M^B^@^@^@^@"
>> clear system/console/history
== ""
>> type? system/console/history
== string!
```

greggirwin

[07:28](#msg5a62efade0141226506aabe4)Enough rope to blow your foot off.

## Sunday 21st January, 2018

gltewalt

[00:03](#msg5a63d8e86117191e61903149)Search on Quora "What is the best programming language for text processing?"

greggirwin

[07:30](#msg5a6441b0ce68c3bc74e3e071)I guess I should give Haskell a closer look. I had no idea it could give REXX a run for its money.

## Tuesday 23th January, 2018

9214

[20:00](#msg5a67945f517037a212e4e5e9)are there any explanations on how AltMe works, aside from http://www.altme.com/guide/ ?

rebolek

[20:01](#msg5a6794850ad3e04b1b5c9d20)you download it and request an account

9214

[20:01](#msg5a6794b2c95f22546dd6d89f)and configs are all in Rebol, right?

[20:02](#msg5a6794bf98927d574528cfc0)jeez, I miss old days :(

[20:02](#msg5a6794cd5a9ebe4f75c5cc1f)wish I was older

greggirwin

[20:02](#msg5a6794dc98927d574528d099)It's Rebol all the way down.

[20:04](#msg5a67953be01412265081e40a)Data, configs, mods/extensions, client, server.

## Wednesday 24th January, 2018

gltewalt

[00:17](#msg5a67d08398927d57452a14f0)@toomasv are you around?

[01:50](#msg5a67e6660ad3e04b1b5e4a0e)Man... I'm super unhappy. Can't get anywhere when standing in shifting sand.

[02:27](#msg5a67ef080ad3e04b1b5e6c74)I got it.

[02:27](#msg5a67ef18ce68c3bc74f6cbc8)It's `unless sub? [stack/set-last stack/top]`

toomasv

[04:06](#msg5a6806560ad3e04b1b5ebd0c)@gltewalt Yes, Greg?

gltewalt

[04:09](#msg5a6806e3e014122650840219)Are you using Win10 or Win7? I forget

toomasv

[04:09](#msg5a680704e014122650840286)W10

greggirwin

[05:14](#msg5a68161e0ad3e04b1b5ef954)If you've nailed it @gltewalt, that's a great fix. You'll be a hero.

gltewalt

[05:16](#msg5a6816bce014122650844086)Yeah but I can’t test it cuz my tests are broken

[05:17](#msg5a6816e66117191e61a553df)I can do ‘another’ PR and break things again if it doesn’t pass

[05:19](#msg5a681774d9f895c360530ab2)`unless sub? [stack/set-last stack/top]` fixes all the examples I could find in 3156, 3128, and your closed 3098.

greggirwin

[05:21](#msg5a6817c1d9f895c360530c37)Let's hope you can get the tests working then. I feel your pain.

gltewalt

[05:22](#msg5a6818246117191e61a55ab1)Is there a way to grab rebol 2.6?

ne1uno

[05:51](#msg5a681ee198927d57452b573a)http://web.archive.org/web/20081001000000\*/http://rebol.com/download.html

[05:56](#msg5a68200698927d57452b5c0b)2.62 http://web.archive.org/web/20070224001323/http://rebol.com/download.html

gltewalt

[06:23](#msg5a68264a5a9ebe4f75c88bdd)got it after some fighting on a rickety Tower that has Win10

PeterWAWood

[07:43](#msg5a683937c95f22546dd9e272)@gltewalt I'm sorry, I typed 2.6 instead of 2.7.6 which you can get from http://static.red-lang.org/build/rebview.exe

9214

[10:31](#msg5a68609f517037a212e8e781)@gltewalt who are you and what have you done to cuttlefish?

[10:35](#msg5a686189ce68c3bc74f8e375)@gltewalt I can check out tests with your fix if you still need it (once I get home)

[10:47](#msg5a6864530ad3e04b1b609163)you just fixed it by trial and error after looking at all `either sub? [stack/push parent][stack/set-last parent]` in the code?

ne1uno

[15:48](#msg5a68aae3517037a212eaccfd)just for the record, rebol-view v262 from webarchive can't even start to run tests or build red. invalid path near: copy functions/-\**

9214

[15:50](#msg5a68ab606117191e61a8a967)I believe Nenad uses custom baked Rebview because of some cryptic bug in 2.7.8

rebolek

[15:51](#msg5a68ab9d517037a212ead256)No, you can't custom-bake Rebol. IIRC, he uses 2.7.6

9214

[15:52](#msg5a68ababae53c159032c1cf8)yeah, my bad

[15:52](#msg5a68abb9ae53c159032c1d18)I just recall something in the lines of "custom version"

ne1uno

[15:52](#msg5a68abcace68c3bc74faa69f)could that be why I get random hangs when running the tests? the stock rebol view or core build red gui console ok and the test hello and console

[17:22](#msg5a68c0bf98927d57452f1f72)rebview.exe 276 also random hangs running tests so it must be something el;se. I use `call` and never had it not work that I noticed

gltewalt

[17:41](#msg5a68c5516117191e61a95f0e)A little bit of trial and error - after looking at other comments in the source, and sub? With my limited debug statements in console.  
Kind of a goose chase - I had it right the first time except exactly backward because I’m dumb and unless tripped me up

greggirwin

[17:42](#msg5a68c598d9f895c36057146e)I dislike `unless`.

gltewalt

[17:43](#msg5a68c5b40ad3e04b1b62fe68)I had unless sub? \[stack/push...blah blah]. Needed unless sub? \[stack/set-last....]

[17:48](#msg5a68c6f298927d57452f4987)Ended up more like old time Diffing because the tests are broke on my win7

ne1uno

[18:09](#msg5a68cbc4517037a212ebb5bd)would it make sense to add one or more tests for each ticket closed? to give an indication that they pass and continue to pass

9214

[18:09](#msg5a68cbe9ae53c159032d09b4)makes sense

ne1uno

[18:17](#msg5a68cdb46117191e61a998e2)I see random hangs on win7 but sometimes they do run through without error. I don't think clean is doing what it should. after the first time 0 files are generated

gltewalt

[19:52](#msg5a68e3fbc95f22546dde203b)@9214 You can run tests if you like.  
Appveyor got stuck after `56 ok - not-compile......................................1 / 1`.  
Tests passed on this perilous Win10 tower.

[19:52](#msg5a68e4024a6b0dd32b41a289)I mean....

[19:52](#msg5a68e40c98927d57452ff7fa)@9214 Ack! Ack!

9214

[19:55](#msg5a68e4b4517037a212ec611d)@gltewalt just `do %run-all.r` from R2?

gltewalt

[19:55](#msg5a68e4be0ad3e04b1b63c9da)I did

[19:55](#msg5a68e4cb0ad3e04b1b63ca33)Oh, yeah. Do that

[19:56](#msg5a68e4f6c95f22546dde2782)Takes a long-ass time to run though on a fresh pull

9214

[19:58](#msg5a68e5550ad3e04b1b63ccec)apparently there's some problem with tests on my machine

[19:58](#msg5a68e566ce68c3bc74fc222a)bash can't find some `./r2` directory and because of that all test fails

[20:00](#msg5a68e5f5c95f22546dde2d04)in fact it tries to find a directory with a name of rebol executable

gltewalt

[20:01](#msg5a68e6355a9ebe4f75cd3308)Hmmm

[20:02](#msg5a68e6520ad3e04b1b63d4cf)@PeterWAWood said he hasn’t changed any of the test suite stuff for months

[20:03](#msg5a68e6794a6b0dd32b41b589)Very stressful when tests don’t work right or lie

rebolek

[20:04](#msg5a68e6c90ad3e04b1b63d77c)I had my moments with test suite...

gltewalt

[20:04](#msg5a68e6de517037a212ec6d70)I have a mint Linux tower that I might be able to get to tonight. But I’m kind of fried with fighting tests

[20:05](#msg5a68e7126117191e61aa3d13)Linuxmint I guess is the proper name

9214

[20:13](#msg5a68e9020ad3e04b1b63e4fc)

```
text
** - Complete Red Test Suite**********************34057 / 34269 **
       in 0:02:45.292298
```

[20:14](#msg5a68e91f0ad3e04b1b63e544)failed tests haven't passed because of the bash error

[20:15](#msg5a68e954ae53c159032dc1bf)

```
text
/bin/bash: ./rebol: No such file or directory
```

[20:16](#msg5a68e985ce68c3bc74fc3b82)should I add rebol interpreter in some specific path?

[20:19](#msg5a68ea51c95f22546dde477b)with your fix I think it's better to wait for a review from Doc than to rely on tests

[20:19](#msg5a68ea6b517037a212ec85cf)because obviously there weren't any tests that would catched this regression

gltewalt

[20:26](#msg5a68ebe86117191e61aa5df4)Right. I expect a review and I’m fine with a “No”.  
But folks aren’t even supposed to submit unless their local tests pass, and I don’t expect test suite hell

[21:02](#msg5a68f47f6117191e61aa9624)I thought Rebol was supposed to be able to run from any path

[21:04](#msg5a68f4c55a9ebe4f75cd97c5)Maybe it expects ./rebview, like it shows in the appveyor console

9214

[21:05](#msg5a68f52c98927d5745306e4e)huh http://www.red-lang.org/

[21:05](#msg5a68f530c95f22546dde9338)logo changed

[21:07](#msg5a68f5ab98927d57453071ce)per quick-test docs

&gt; This must be a REBOL/View console session under Windows.

[21:09](#msg5a68f6085a9ebe4f75cda016)okay, now it works flawlessly

[21:09](#msg5a68f60e517037a212ece08c)under Wine

PeterWAWood

[22:27](#msg5a69086b517037a212ed4a82)\[!\[Screen Shot 2018-01-25 at 06.26.42.png](https://files.gitter.im/red/sandbox/Uyip/thumb/Screen-Shot-2018-01-25-at-06.26.42.png)](https://files.gitter.im/red/sandbox/Uyip/Screen-Shot-2018-01-25-at-06.26.42.png)

gltewalt

[22:51](#msg5a690e036117191e61ab290d)the `call` issue was something I stumbled onto, and Qxtie just made a change. I never made a ticket

## Thursday 25th January, 2018

PeterWAWood

[02:32](#msg5a6941c2ce68c3bc74fe0983)@gltewalt The Red &amp; Red/System test suites are regression tests. We don't have unit tests for the toolchain or the runtime. (This is not uncommon for programming languages. Lua does not have unit tests. Its regression tests are extremely rigorous though. \[We need a big effort to improve our regression tests.]

It might be worth trying some local testing on your changes and only running the regression tests once you think your changes are working.

gltewalt

[02:40](#msg5a6943abce68c3bc74fe10cb)I did a bunch of manual testing. Then hit a wall with the run-all stuff.

[03:09](#msg5a694a860ad3e04b1b65c369)I still have lists of all the functions, ops, actions, etc. I think I will make a function that just fires off ever one of them

## Friday 26th January, 2018

9214

[18:26](#msg5a6b72e75a9ebe4f75db69b3)never thought that refactoring could be so addictive

```
n=: 5
   (!2*n)%(!n)*(!n+1)
42
   (!2*n)%(n*&:!n+1)
42
   (!2*n)%([*&:!+&1)n
42
   (([:!2&*)%[*&:!+&1)n
42
   (!@:(2&*)%[*&:!+&1)n
42
   (!@+:%[*&:!+&1)n
42
   (!@+:%[*&!>:)n
42
   (!@+:%[*&!>:)i.10
1 1 2 5 14 42 132 429 1430 4862
```

https://en.wikipedia.org/wiki/Catalan\_number

## Monday 29th January, 2018

9214

[14:23](#msg5a6f2e66ae53c159034c4b6c)is there any way I can subscribe to `red` tag on SO questions?

rebolek

[14:24](#msg5a6f2e8e494bd0f5303c7d60)Edit your favourite tags

9214

[14:25](#msg5a6f2ec640259f1a33c01064)@rebolek

[14:25](#msg5a6f2eca98927d57454e4e67)\[!\[image.png](https://files.gitter.im/red/sandbox/D5HH/thumb/image.png)](https://files.gitter.im/red/sandbox/D5HH/image.png)

rebolek

[14:25](#msg5a6f2ee2e217167e2c151219)@9214 yes, that should be it

9214

[14:27](#msg5a6f2f51e217167e2c15150f)guh, only email notifications?

[14:27](#msg5a6f2f5c40259f1a33c014d0)I want just an indicator on SO site

[14:29](#msg5a6f2fb8ae53c159034c53ab)nevermind, found RSS feed

rebolek

[14:29](#msg5a6f2fc140259f1a33c018e3):+1:

## Friday 16th February, 2018

9214

[12:01](#msg5a86c82e10f501211af0cb13)\[The Cuttlefish, a Master of Camouflage, Reveals a New Trick](https://www.nytimes.com/2018/02/15/science/cuttlefish-camouflage-neurons.html?rref=collection%2Fsectioncollection%2Fscience&amp;action=click&amp;contentCollection=science®ion=rank&amp;module=package&amp;version=highlights&amp;contentPlacement=2&amp;pgtype=sectionfront)

[12:01](#msg5a86c832da468f7539f35d06)@gltewalt

greggirwin

[17:13](#msg5a871151da468f7539f5ac8a)I'm sure I saw that behavior in an older documentary. Maybe they mean learning more about how the process works. Or how @gltewalt uses it to remain low profile in coffee shops.

gltewalt

[19:54](#msg5a8736f6cd1c60032336415b):smile:

## Saturday 17th February, 2018

9214

[20:53](#msg5a88963ee4ff28713a8e8013)trying to cope with @toomasv's fanciness, I implemented traffic light in 8051 assembly

[20:54](#msg5a88968e35dd17022eb9e14f)\[!\[Peek 2018-02-18 01-51.gif](https://files.gitter.im/red/sandbox/mdET/thumb/Peek-2018-02-18-01-51.gif)](https://files.gitter.im/red/sandbox/mdET/Peek-2018-02-18-01-51.gif)

toomasv

[20:56](#msg5a889714c3c5f8b90dcc2086) :hushed: :+1:

## Sunday 18th February, 2018

greggirwin

[01:32](#msg5a88d7b3888332ee3a98ed12)@greggirwin thinks @9214 may be gearing up to work on new Red back ends.

9214

[05:55](#msg5a89156935dd17022ebbf8f0)@greggirwin was it before or after you started to drool on keyboard?

PeterWAWood

[07:52](#msg5a8930d7888332ee3a9a48f4)@9214 The output looks cool. Aren't you going to share the Red code with which you generated the assembly code?

9214

[09:42](#msg5a894a9f0202dc012e4dda08)@PeterWAWood Red code that emits assembly currently resides in my cerebral cortex :smile:

PeterWAWood

[10:32](#msg5a895657a2194eb80d7bf2a9)So Gregg was correct!! You have come up with a Red back end that emits cerebral code ;-)

9214

[11:37](#msg5a896577888332ee3a9b4053)ceRedral code

PeterWAWood

[12:03](#msg5a896b8bc3c5f8b90dcfccd8):-)

greggirwin

[19:37](#msg5a89d5eea2194eb80d7ebeda)Insert tokens, out comes code.

gltewalt

[23:03](#msg5a8a06240202dc012e51fda1)I can't see where the error should be fired from with `to float! ""`. It does get fired with a string of length 1 or greater.

[23:03](#msg5a8a0636a2194eb80d7fd869)There is no error checking at all in string/to-float

[23:03](#msg5a8a0646c3c5f8b90dd33d72)Errr, no error throwing

[23:08](#msg5a8a078435dd17022ec10ff8)I either never knew that there was a `none!` or I forgot... hmmm

## Monday 19th February, 2018

greggirwin

[01:32](#msg5a8a2912c3c5f8b90dd3e4d1)I believe the `to float! ""` issue is a regression. Haven't dug in to look at the causal source though.

## Tuesday 20th February, 2018

9214

[11:44](#msg5a8c0a0a6f8b4b99469a12fc)\[Problem 21](https://projecteuler.net/problem=21)

```
+/(#~(2 3$1 0)-:"2[:="1([:+/i.([#~0=|)])^:(<3))"0 i.1e4
```

after this line of code I was like, \[well...](https://www.youtube.com/watch?v=cB\_AnteqNJ0)

toomasv

[11:49](#msg5a8c0b56c3c5f8b90ddebd50) :hushed:

9214

[16:01](#msg5a8c46628f1c77ef3a30f0b1)How do you guys manage to crave some time for personal projects? (@toomasv :exclamation:) Whenever I have free time on my hands I either want to sleep more than to live or need to work other things out :(

toomasv

[16:22](#msg5a8c4b2f35dd17022ece35d0)@9214 I have to be careful here, tending to ignore other thing, when I get involved in something. This can be dangerous.

greggirwin

[17:44](#msg5a8c5e6c8f1c77ef3a319299)I feel out of balance at times, but try to be aware of when it's happening. There are times when I'll dive deep into something, and other times when I'll, for example, take time to do a show and then feel like I'm out of balance the other way, and need to code again. Changes and stages in life too. It's just a flow and you have to accept it. There are times when I feel like I am the least productive dev on the planet, and other times when the joy and pleasure of creating makes me proud of what I accomplished. I want to do some more of the hundreds of fun ideas I have, but time is always against us.

If you need to sleep, sleep. Staying healthy is important. There were times in the past when I worked \*far* too much, and that wasn't good. Accept your humanity (even you @9214) and all that comes with it.

9214

[18:03](#msg5a8c62e60202dc012e5fc974)it's just the part where you need to prototype a lot of things and in the end nothing really works that saddens me

greggirwin

[18:12](#msg5a8c651153c1dbb743543ff5)Things that don't work are just waiting for their day in the sun. I have loads of partially implemented ideas, or things I thought would change the world (or at least my life). Sometimes they rise at unexpected moments. All those snippets I post? Yeah. :^)

dander

[18:15](#msg5a8c65cfc3c5f8b90de14472)Even if they aren't finished, or no one has ever seen them, they have still contributed to your personal growth. Still there is some pain when things don't reach their potential

[18:21](#msg5a8c673c6fba1a703a7a52e2)Over the past few months I've been realizing that lack of sleep was really negatively affecting me. And on top of that, when I'm sleep deprived, it's harder for me to notice the effect or have the self control to get myself to bed, as weird as that sounds. I've been trying to find a better balance lately.

ne1uno

[23:11](#msg5a8cab2a6fba1a703a7bf114)you can eat better to make up a little sleep but you have to do one or the other faithfully

## Wednesday 21st February, 2018

gltewalt

[00:42](#msg5a8cc08653c1dbb7435662f6)Could you make a camera based sign language interpreter ?

[00:44](#msg5a8cc0e96fba1a703a7c5aa3)@9214 I’m more of a pruner, scripter, figure-out-er.  
I’ve never done big projects

[00:44](#msg5a8cc10bc3c5f8b90de35809)At least not what I’d consider a big project

ne1uno

[01:13](#msg5a8cc7a0e4ff28713aa59500)OHR, optical hand recognition

gltewalt

[01:13](#msg5a8cc7d0c3c5f8b90de3748f)But I also have the thing where if I’m into something, I’ll zone out forever and do that instead of tending to other life things.  
Problem is I don’t get a lot of alone time when I’m home, and it takes awhile to get into the zone out phase

ne1uno

[01:16](#msg5a8cc8656f8b4b99469ebbc8)hospitals put doctors &amp; nursers on insane 36 hour shifts and get away with it. absorbing the cost of mistakes apparently worth it to them

[01:17](#msg5a8cc8afc3c5f8b90de37afe)helps to be young too

gltewalt

[01:28](#msg5a8ccb2253c1dbb743568e60)Any of you try supplements that are supposed to boos the brain?

[01:28](#msg5a8ccb2a0202dc012e622381)Boost

greggirwin

[05:00](#msg5a8cfd04c3c5f8b90de44cc7)Caffeine is one of the best. A good diet, exercise, and sleep are also reasonable substitutes.

toomasv

[06:51](#msg5a8d170d6f8b4b9946a009ae):wine\_glass:

9214

[07:09](#msg5a8d1b2c0202dc012e638042)@gltewalt music :notes:

greggirwin

[08:40](#msg5a8d30648f1c77ef3a35beec)A little wine, a little music...it's downright romantic in here.

9214

[08:40](#msg5a8d308cc3c5f8b90de564cc)`red/sandbox` is gentlemans club after all

greggirwin

[08:41](#msg5a8d30bb35dd17022ed309dc)Indeed. Perhaps @toomasv is drinking cognac or whiskey, neat.

9214

[10:10](#msg5a8d458635dd17022ed38fd2):beer: :bear: @rebolek

rebolek

[10:21](#msg5a8d48288f1c77ef3a364b73):)

9214

[10:24](#msg5a8d48cc53c1dbb74358f2b3)our bear is two months old btw

[10:24](#msg5a8d48d56fba1a703a7f0046)was reported on 21 Dec

rebolek

[10:30](#msg5a8d4a3c888332ee3ab11ce6):(

toomasv

[11:15](#msg5a8d54c66f8b4b9946a179e1)If 21 Dec was hir's birthday, then hir's conception may be mourned on 1st Dec.

rebolek

[11:17](#msg5a8d552dc3c5f8b90de64567)6th Nov IMO.

toomasv

[11:20](#msg5a8d560ec3c5f8b90de64a66)Gee, do these bears have a long gestation time!

rebolek

[11:22](#msg5a8d5668e4ff28713aa86628)They also live very long!

9214

[11:22](#msg5a8d56696fba1a703a7f587e)I'm a half-breed now, neither :japanese\_ogre: nor :alien:

[11:22](#msg5a8d566ac3c5f8b90de64d1e)\[!\[изображение.png](https://files.gitter.im/red/sandbox/YrVQ/thumb/\_\_\_\_\_\_\_\_\_\_\_.png)](https://files.gitter.im/red/sandbox/YrVQ/\_\_\_\_\_\_\_\_\_\_\_.png)

[11:22](#msg5a8d569053c1dbb743594465)sorry to butt in your bear talk

rebolek

[11:23](#msg5a8d56ca6f8b4b9946a18700)you should write Jed

9214

[11:24](#msg5a8d56e035dd17022ed40000)what would that be?

rebolek

[11:24](#msg5a8d56ee0202dc012e64f518)J dialect for Red?

9214

[11:24](#msg5a8d570ae4ff28713aa86aaf)IMO it's more reasonable just to call one from another

rebolek

[11:25](#msg5a8d57236f8b4b9946a188ad)have you tried that?

9214

[11:25](#msg5a8d5730888332ee3ab16c34)Q is more adequate target for a dialect, it's more readable

[11:25](#msg5a8d57426f8b4b9946a18918)not yet, I have a few ideas though :)

toomasv

[11:26](#msg5a8d5756888332ee3ab16cf0)@greggirwin What do you mean: "\*\*a little\** wine"?

greggirwin

[18:00](#msg5a8db3c76fba1a703a81ec3b)Well, it was only one glass. My wife works at a winery.

9214

[19:41](#msg5a8dcb5c53c1dbb7435c4d74)http://red.qyz.cz/stats/

[19:41](#msg5a8dcb5ea2194eb80d95de68)https://www.youtube.com/watch?v=CwnsPLn6hdY

rebolek

[19:43](#msg5a8dcbec6f8b4b9946a494b2)Oh.

[19:43](#msg5a8dcbfac3c5f8b90de97431)That must be some kind of bug, I guess ;)

9214

[19:44](#msg5a8dcc0c8f1c77ef3a39cde7)my thought too, this was unexpected

[19:44](#msg5a8dcc150202dc012e6816e5)are you sure that no one hacked your blog \*again\*?

rebolek

[19:45](#msg5a8dcc3c53c1dbb7435c51fc)Red/System article is not deleted from index, so I think it's safe ;)

[19:46](#msg5a8dcc80888332ee3ab4763b)OTOH Nenad wasn't here for some time, so it's understandable that he's lacking.

greggirwin

[20:48](#msg5a8ddb0c6fba1a703a82eac3)@9214, you've been very active lately.

9214

[20:49](#msg5a8ddb580202dc012e6875ab)it's more of a habit than anything

[21:04](#msg5a8dded5a2194eb80d964f69)https://trello.com/b/tCypaglW/ideas-for-red-contributors

[21:04](#msg5a8ddedd6fba1a703a830148)why it's stalled? :(

greggirwin

[23:02](#msg5a8dfa996fba1a703a839dfc)Why is \*what* stalled?

## Thursday 22nd February, 2018

gltewalt

[04:28](#msg5a8e47060202dc012e6a82e9)I didn’t know about bugs room

PeterWAWood

[04:53](#msg5a8e4cc8a2194eb80d986033)@9214 It is stalled because the people who created it, for a variety of reasons, are no longer involved with Red.

gltewalt

[04:56](#msg5a8e4d6335dd17022ed9a42d)What happened to the JavaScript guru guy?

PeterWAWood

[04:56](#msg5a8e4d9b53c1dbb7435ebe15)Who was the JavaScript guru guy?

gltewalt

[04:58](#msg5a8e4e08a2194eb80d9865f1)Uhh... that guy that helped out with the red stats site. Can’t remember the name.

PeterWAWood

[05:00](#msg5a8e4e7f888332ee3ab6e6dc)red stats site? I can't remember that.

gltewalt

[05:20](#msg5a8e5336a2194eb80d988085)are1000

rebolek

[07:03](#msg5a8e6b54888332ee3ab7704e)I don't know, he rewrote my JS code and then disappeared.

9214

[07:39](#msg5a8e73ba6f8b4b9946a7d0fc)I wonder why @are1000 disappeared too, he seemed to be really interested in Red

gltewalt

[07:49](#msg5a8e75f66f8b4b9946a7dbdf)He touched your sight then mysteriously disappeared. Hmmm

[07:49](#msg5a8e76008f1c77ef3a3d0f7a)Site

rebolek

[07:49](#msg5a8e7619888332ee3ab7ae4f)I should probably insept the code for hidden miners and other stuff ;)

are1000

[12:21](#msg5a8eb5c00202dc012e6cf0d3)I'm here (kinda)! I just had a really tough January/February and didn't have much time left for Red :(

9214

[12:21](#msg5a8eb5d36fba1a703a8757f5):tada:

are1000

[12:21](#msg5a8eb5e20202dc012e6cf14c)But I'm not going to disappear! I'm not going to leave @9214 &lt;3

[12:23](#msg5a8eb6376f8b4b9946a95344)btw, what is wrong with the Red Chat Stats?

rebolek

[12:23](#msg5a8eb6440202dc012e6cf458)ha, cool!

are1000

[12:23](#msg5a8eb6446f8b4b9946a953d3)@rebolek I can fix it since I broke it?

rebolek

[12:23](#msg5a8eb656c3c5f8b90dee5054)@are1000 I'm afraid you can't fix it. @9214 is first now.

[12:25](#msg5a8eb6b2a2194eb80d9ac017)also, the links `[by messages] [by characters]`do not work now, but that's not such big problem as @9214 taking first place ;)

are1000

[12:27](#msg5a8eb71bc3c5f8b90dee54b3)Trust me - I can fix your EVERY problem. At least as long as it begins with `J` and ends in `avaScript`. And involves manipulating data so @9214 is accidentally filtered out.

[12:27](#msg5a8eb73053c1dbb743610863)Of course, I would never do it. But I could.

rebolek

[12:28](#msg5a8eb785c3c5f8b90dee576d)I think that you can add the code to filter @9214 out, but not enable it, so I can trust you.

are1000

[12:31](#msg5a8eb80d53c1dbb743610f13)And I could also put a mechanism that enables the "Grand Filtering" by correct key combination, pixel-perfect scroll positions and a payment in RED tokens.

rebolek

[12:31](#msg5a8eb835e4ff28713ab07719)that's the spirit!

are1000

[12:32](#msg5a8eb85453c1dbb743611136)"Tired of @9214 chat domination? Trying really hard but you just can't seem to beat him? Donate NOW to fix this problem once and for all!"

9214

[12:38](#msg5a8eb9d50202dc012e6d0cc3)Didn't know that I bother everyone so much

are1000

[12:39](#msg5a8eb9ff6f8b4b9946a96c15)You don't @9214 :(

[12:40](#msg5a8eba26888332ee3ab946e2)It's us who are failures...

rebolek

[12:40](#msg5a8eba3c0202dc012e6d1089)@are1000 let's just focus on fixing the buttons for now, we don't want to lose @9214

9214

[19:34](#msg5a8f1b608f1c77ef3a412962)just a side note about \[J's IDE](http://prog21.dadgum.com/48.html), to which I can highly relate, it's easily customizable and feature complete, both as an editor and learning environment

[19:35](#msg5a8f1b896fba1a703a8a1f3d)and Red certainly can take an inspiration from that

[19:36](#msg5a8f1bc7e4ff28713ab33748)oh, and DrRacket of course

gltewalt

[20:51](#msg5a8f2d540202dc012e70276f)@greggirwin I have a good business for ya.  
Develop gps tracker for special needs kids that isn’t essential big rubber encased cell phone

[20:51](#msg5a8f2d5ea2194eb80d9df2f4)Essentially

greggirwin

[21:22](#msg5a8f3497888332ee3abc6a74)@gltewalt, 'round here we just use a cowbell, which works for anyone.

Is there really not something out there already that does that?

[21:24](#msg5a8f3517c3c5f8b90df1a08c)Nice to see you again @are1000! I think the only adjustment we need to make is to subtract digit based username values from the total. Or maybe weight things by age, so you young guys have to work harder. ;^)

gltewalt

[21:56](#msg5a8f3c72c3c5f8b90df1cd24)There are a few smart watch type of devices but they’re more limited than the AngelSense trackers.  
Problem with AngelSense is that the devices are so big. Their app is pretty good, but their devices and accessories aren’t so good.

The smallest things are Bluetooth which will not help you track down anyone if they run off

[21:58](#msg5a8f3d036f8b4b9946acc085)If something unobtrusive could be invented that worked reliably that had as good of software as AngelSense - it would be a godsend

[21:59](#msg5a8f3d430202dc012e708860)Remind me when I go to return your book and I’ll bring the device and stuff

greggirwin

[22:15](#msg5a8f41186fba1a703a8b0bd0)Sounds good. IoT wearables seem like a great fit for this kind of thing.

gltewalt

[22:55](#msg5a8f4a5b6fba1a703a8b3f70)Maybe next week sometime if you’re un-swamped

## Saturday 3th March, 2018

gltewalt

[09:26](#msg5a9a6a61c3c5f8b90d29b7f9)The biggest, silliest thing for me with JS or some other mainstream language - I revert back to trying to set variables (er, words) with `=` when I jump back over to Red

rebolek

[12:10](#msg5a9a90a10202dc012ea8d3b8)@gltewalt

```
>> =: make op! func [this that][set this that]
== make op! [[this that]]
>> 'x = 1
== 1
>> x
== 1
```

gltewalt

[18:05](#msg5a9ae3cc458cbde557ef9bbe)lol, I don't wan't to do 'x = 1

greggirwin

[22:17](#msg5a9b1ef3e4d1c63604badbdd)@rebolek -1 token for you!

## Friday 9th March, 2018

9214

[18:27](#msg5aa2d21a0a1614b712ffe427)https://crime.team/~hypercard/ looks interesting

[18:31](#msg5aa2d30cf3f6d24c6857c8d5)\[grumble-grumble](https://redmonk.com/sogrady/2018/03/07/language-rankings-1-18/) :^/

greggirwin

[19:03](#msg5aa2da73888332ee3a1b95ac)Ah, Hypercard.

9214

[19:03](#msg5aa2da910a1614b712000d92)@greggirwin lol, we "Ah"-ed synchronously in two separate rooms :^)

greggirwin

[19:09](#msg5aa2dbd835dd17022e3f077b):^)

PeterWAWood

[23:44](#msg5aa31c6a6fba1a703aeba761)\[Hypercard's Liveliest Descendant](https://livecode.com)

## Sunday 11st March, 2018

Phryxe

[10:24](#msg5aa503e335dd17022e4720f9)Trello/Kanban stuff on Github ... https://www.gitkraken.com/glo

greggirwin

[20:32](#msg5aa5926353c1dbb743cd9977)Wow, that is some slick marketing. Lovely.

## Monday 12nd March, 2018

Phryxe

[07:27](#msg5aa62bcc0a1614b7120ceaf3)I thought so.

Oldes

[12:21](#msg5aa670af53c1dbb743d157e8)I'm now forced to write some objective-c code and I cannot help myself and write my feelings here: it is SO ugly language! I really wonder what drugs their were using when they were defining its syntax.

9214

[12:22](#msg5aa670f4f3f6d24c686639b0)@Oldes subjective opinion on objective C, I like your style ;)

Oldes

[12:23](#msg5aa6714b8f1c77ef3aaf720a)Is there anybody who likes objective-c? Is something like that possible?

rebolek

[12:24](#msg5aa6718727c509a77452ee75)Apple fanboys?

Oldes

[12:25](#msg5aa671aca60157d62fd994e6)Real apple fanboys don't know, what is Terminal.

9214

[12:25](#msg5aa671cae4ff28713a21aa2a)Let it out. Let it aaaaaaaall out.

Oldes

[12:28](#msg5aa6727cc3c5f8b90d61278d)I would like to, but it is so obscure that I really must know, WHY it was designed as it is.

[12:40](#msg5aa67522f3f6d24c68665206)If \[in Objective-c](https://en.wikipedia.org/wiki/Objective-C) is:

```
- (return_type)instanceMethod2With2Parameters:(param1_type)param1_varName param2_callName:(param2_type)param2_varName;
```

same like this in C++:

```
return_type instanceMethod2With2Parameters (param1_type param1_varName, param2_type param2_varName=default);
```

What is purpose of the `param2_callName`?

[12:41](#msg5aa6757353c1dbb743d17433)Ok.. I will let it out.

[12:42](#msg5aa675a7a60157d62fd9a7cc)\_interleaving of selector segments with argument expressions_

[12:42](#msg5aa675d153c1dbb743d176e0)I will have to make job fast and quit as soon as possible.

gltewalt

[14:59](#msg5aa695e227c509a77453c718)Trying to mash C syntax together with smalltalk syntax?

rebolek

[18:42](#msg5aa6ca1e0a1614b712107a65)So, können wir sprachen hier на разных языках?

[18:43](#msg5aa6ca510a1614b712107afa)I would love to dust off my German and Russian.

9214

[18:43](#msg5aa6ca53c3c5f8b90d633d75)If you're слегка не в себе, はい

toomasv

[18:43](#msg5aa6ca66f3f6d24c68686192)@rebolek Did it mean something like: If I spoke in my native language, I am afraid nobody would understand my native tongue. (?)

9214

[18:44](#msg5aa6ca8d0a1614b712107c57)It could be useful, at least for naming - sometimes I'm looking for some catchy words and wonder how they sound in other languages.

rebolek

[18:44](#msg5aa6ca92e4d1c63604f0623b)@toomasv basically yes, it's a dialect of Czech that most Czechs don't understand :)

[18:45](#msg5aa6cad927c509a77454ff41)@toomasv but it's interesting that most Czech Redbolers do.

toomasv

[18:46](#msg5aa6caf80a1614b712107f2d)Nay, it is more like: "That I would speak in .."

rebolek

[18:46](#msg5aa6cb1ec3c5f8b90d634305)@toomasv did you found some hantec translator?

toomasv

[18:47](#msg5aa6cb250a1614b712107fd3)Nay

9214

[18:47](#msg5aa6cb368f1c77ef3ab1ae11)oh, interesting  
https://en.wikipedia.org/wiki/Hantec\_slang

toomasv

[18:47](#msg5aa6cb3853c1dbb743d38e21)But I have an interest in languages

9214

[18:47](#msg5aa6cb4435dd17022e4f7915)me too, although a casual one :)

rebolek

[18:49](#msg5aa6cba0e4d1c63604f06a9a)@9214 yep, it's a mix of Czech, German, Yiddish and also Gipsy. Basically everyone who lived here contributed.

[18:50](#msg5aa6cbe927c509a7745505e2)Also, HanTec sounds like some evil company from William Gibson's novel.

BeardPower

[19:05](#msg5aa6cf61c3c5f8b90d636052)@lepinekong\_twitter Sorry, here I am :D

9214

[20:32](#msg5aa6e3faf3f6d24c6868f1f6)@rebolek for some reason, \[this track](https://www.youtube.com/watch?v=Rv-6kVUht5M) strongly reminds me about Czech and you :)

[20:33](#msg5aa6e40f53c1dbb743d41b49)title and cover are slightly rude though, no offense here!

BeardPower

[20:39](#msg5aa6e58ef3f6d24c6868f9b3)So sandbox is "do whatever you want", right?

9214

[20:40](#msg5aa6e5b0e4ff28713a2475b1)it's anarchy here, though, @greggirwin is still watching over his kids :^)

BeardPower

[20:40](#msg5aa6e5c4e4ff28713a247648):baby\_chick:

[20:42](#msg5aa6e6216f8b4b99461c40dd)I thought it was about testing out some Red code :D

9214

[20:44](#msg5aa6e6928f1c77ef3ab2447b)let's pretends that we're using a dialect

BeardPower

[20:44](#msg5aa6e6a3f3f6d24c6868fe62):+1:

greggirwin

[21:27](#msg5aa6f0a7a60157d62fdc9982)All good here. Small group for now, so we can be free.

@Oldes, I feel your pain just a bit. I had to do some ObjC work a few years back and even just ramping up to do some testing and debugging was painful.

BeardPower

[21:31](#msg5aa6f1c68f1c77ef3ab27b43)I just went through he Blend2D giitter room, examples, screenshots. This thing is really amazing :)

[21:32](#msg5aa6f1d6e4ff28713a24be33)This also caught my attention:  
&gt;There are more companies interested about this as well, so I'm working hard on releasing the lib

[21:32](#msg5aa6f2078f1c77ef3ab27d99)The more I think about the more I feel that "AGG" should return to Red as Blend2d :D

[21:33](#msg5aa6f22aa60157d62fdca668)A Vulkan backend is also considered.

greggirwin

[21:40](#msg5aa6f3e235dd17022e5058ea)Indeed. Very nice work.

BeardPower

[21:41](#msg5aa6f41f0a1614b7121166fa)I will collect the screenshots in the wiki entry as well.

[21:44](#msg5aa6f4b2a60157d62fdcb467)Regarding a binding. The lib does not use exceptions, only error messages, which is good. Need to look into it.

## Tuesday 13th March, 2018

lepinekong\_twitter

[07:49](#msg5aa7827ac3c5f8b90d669847)@Oldes I'd really have the concept of message sending at runtime (without the ugly objectiveC syntax) integrated with a language not even having actor/concurrency stuffs.

## Wednesday 14th March, 2018

gltewalt

[02:48](#msg5aa88d686f8b4b9946245bd1)How come @9214 doesn't show up on contributors data?

[02:48](#msg5aa88d9627c509a7745dabce)https://github.com/red/red/graphs/contributors

greggirwin

[05:17](#msg5aa8b064a60157d62fe51998)Shows commiters only, not thousands of chat messages.

PeterWAWood

[05:22](#msg5aa8b1ae8f1c77ef3abaf111)Harsh

greggirwin

[05:34](#msg5aa8b4766f8b4b994624eb5f):^) Indeed.

gltewalt

[06:04](#msg5aa8bb74458cbde5573100f9)😂

[06:07](#msg5aa8bc31e4ff28713a2d95c8)He used to be on there. Is it because he changed his name?

9214

[07:09](#msg5aa8cab66f8b4b9946254a56)@gltewalt I think github tracks contributions based on e-mail, I changed mine not so long ago and disappeared

[10:24](#msg5aa8f840f3f6d24c68730a7c)and because I'm not cool, @gltewalt unfollowed me :wink:

lepinekong\_twitter

[11:38](#msg5aa909d0e4d1c63604fb4353)Crazy distributed database https://gun.eco interview of the guy here https://changelog.com/podcast/236 I don't even understand how it works in principle but I like the idea of no server, do you think it would be easy to reimplement in red :smile:

gltewalt

[19:55](#msg5aa97e4c27c509a774627166)I didn’t unfollow

BeardPower

[20:04](#msg5aa9803c458cbde55735388d)@lepinekong\_twitter  
&gt;Crazy distributed database https://gun.eco interview of the guy here https://changelog.com/podcast/236 I don't even understand how it works in principle but I like the idea of no server, do you think it would be easy to reimplement in red :smile:

There is no such thing as "no server". Every node is a server, it's master-to-master replication.  
Should not be a problem with ports.

[20:04](#msg5aa9805c8f1c77ef3abf3973)And thanks for sharing :D

lepinekong\_twitter

[21:35](#msg5aa995bef3f6d24c68766fab)@BeardPower as I understand no central server in traditional sense ;)

BeardPower

[21:37](#msg5aa9961b0a1614b7121e8c3b)Yes. There are many "instances" running, which will synchronize through P2P with a consensus algorithm based on strings.

[21:40](#msg5aa996b2f3f6d24c6876751e)Like a decentralized open source Firebase/RethinkDB.

[21:40](#msg5aa996e5c3c5f8b90d71974e)It's implemented in JS.

greggirwin

[21:50](#msg5aa9991d27c509a77462f8e4)&gt; Crazy distributed database ...I don't even understand how it works in principle...do you think it would be easy to reimplement in red

Really hard to answer without digging in, but it's a small graph database written in JS, so should be possible. Anytime the words `crazy distributed database` appear, `easy` doesn't come to my mind when playing word association.

The real question is not how hard, but how valuable.

BeardPower

[22:04](#msg5aa99c8ba60157d62fea0e20)It's time we drop ancient http/html and come up with some new tech :smile:

lepinekong\_twitter

[22:14](#msg5aa99ec00a1614b7121eb60b)Another crazy one https://medium.com/@aboodman/noms-init-98b7f0c3566 :smile:

[22:16](#msg5aa99f2b27c509a7746314de)@greggirwin there is some explanation here https://gun.eco/distributed/matters.html

BeardPower

[22:16](#msg5aa99f3fa60157d62fea1a1a)@lepinekong\_twitter All I would need is \[RRDtool](https://oss.oetiker.ch/rrdtool/) :)

lepinekong\_twitter

[22:20](#msg5aa9a02453c1dbb743e1d2a7)@BeardPower what I need is a distributed knowledge management system ;)

BeardPower

[22:21](#msg5aa9a07935dd17022e5dc5e3)The internet? ;-)

## Thursday 15th March, 2018

toomasv

[04:31](#msg5aa9f73c8f1c77ef3ac1299e)@lepinekong\_twitter Have you exhausted \[semanitc web](https://www.w3.org/standards/semanticweb/)?

lepinekong\_twitter

[07:21](#msg5aaa1f0dc3c5f8b90d73b657)@toomasv at the moment I'm not focused on semantic yet, I'm more on collecting, storing, organizing, publishing and sharing knowledge.

## Saturday 17th March, 2018

lepinekong\_twitter

[10:57](#msg5aacf48fa60157d62ff940a0)If it is of any interest for Red ;) https://github.com/google/kythe as for me I'm building some facilities to analyze my own red code but with red kythe seems too a giant beast for me but it should become a standard maybe !

## Monday 19th March, 2018

gltewalt

[22:41](#msg5ab03ca2bb1018b37a0263c3)Is this the result of a handful of motor mouths, or a major increase in activity from last year?

https://imgur.com/a/zcgHl

dander

[22:48](#msg5ab03e3ee4d1c636041b67d7)@gltewalt I think there is a little bit of both :wink:

rebolek

[23:24](#msg5ab046a9f3f6d24c6893516f)@gltewalt I will update stats and you can decide for yourself :)

[23:26](#msg5ab0470827c509a774802459)I would love to provide stats automatically, but that's not possible, until https://github.com/red/red/issues/3223 is fixed :(

## Tuesday 20th March, 2018

greggirwin

[23:54](#msg5ab19f18bb1018b37a0936bd)@dander +1. And it will probably grow throughout the upcoming year quite a bit.

## Wednesday 21st March, 2018

gltewalt

[00:04](#msg5ab1a18e6f8b4b99464dac46)He said you can use `load` instead or `read` for the 3223 problem

## Sunday 25th March, 2018

gltewalt

[23:37](#msg5ab832c1bb1018b37a24ab30)@greggirwin I would have liked to have stayed for all of the talks, but I had to run and tend to the kid. I had about 2 hours of 'get-out-of-jail-free' time.

[23:38](#msg5ab832e6e4ff28713a72a03e)I don't think I got to relax once from 11:30 until 10:00pm

## Monday 26th March, 2018

greggirwin

[18:10](#msg5ab9377c7c3a01610d783b74)I'm glad you made it at all. We'll get together soon.

9214

[18:10](#msg5ab937997c3a01610d783bcc)@greggirwin wrong chit-chat :smirk:

gltewalt

[18:13](#msg5ab93847c4d0ae8007030db8)You should tell everyone how packed it was since you associated the talk(s) with blockchain

greggirwin

[18:27](#msg5ab93b907c3a01610d784df5):^) Only the first talk was packed, the others were lightly attended. Head of BSU Comp Sci was in the first talk, too, and stayed the whole time.

9214

[18:28](#msg5ab93be0e4ff28713a775ce7)@greggirwin did you burn the tapes?

gltewalt

[18:29](#msg5ab93bfbc4d0ae8007031f88)Wasn't the second talk blockchainy?

greggirwin

[18:33](#msg5ab93cf5e4ff28713a7762c1)@9214 I ate the SD card, but it was full size so...

[18:33](#msg5ab93d0b27c509a774a6eaf8)@gltewalt, yes, but on FOSS tokenomics, so few people cared. :^\\

9214

[18:34](#msg5ab93d252b9dfdbc3a24bf8a)&gt; so few people cared

@greggirwin did you burn them?

gltewalt

[18:34](#msg5ab93d2a35dd17022ea192f1)Oh, is it the cryptocurrency allure?

greggirwin

[20:20](#msg5ab9561cbb1018b37a29e9dc)Yes, crypto is the key.

[20:21](#msg5ab9564835dd17022ea2186f)Call your talk "One weird trick to get rich with blockchains" and you'll sell out.

BeardPower

[20:22](#msg5ab95683e3d0b1ff2c6dfeb1)Buy low and sell high? :smile:

[20:22](#msg5ab95692e4ff28713a77e670)The trend is your friend?

[20:22](#msg5ab9569bbb1018b37a29ebff)Never buy the tops, but the dips?

[20:22](#msg5ab9569e35dd17022ea219bf);-)

9214

[20:24](#msg5ab956fcf3f6d24c68bb1282)Puuuuuuuuuump!

BeardPower

[20:25](#msg5ab95720e3d0b1ff2c6e0237)And dump, yep.

## Friday 30th March, 2018

gltewalt

[17:49](#msg5abe78bf7c3a01610d8faccf)yijjjjjjjjjjj

[17:50](#msg5abe78dbe3d0b1ff2c85513c)jj

BeardPower

[17:52](#msg5abe79635f188ccc15139c27)Not hot, will not invest.

gltewalt

[17:53](#msg5abe797c2b9dfdbc3a3c6318)Sorry - my son grabbed the laptop

BeardPower

[17:54](#msg5abe79ecc574b1aa3e4d9d07)😄

9214

[17:57](#msg5abe7a6c92f5d62057790488)GRT/YIJ is low

[17:57](#msg5abe7a7cc574b1aa3e4da00b)on which exchanges?

[17:58](#msg5abe7adc27c509a774bea706)Market promoting this project. Everything is SON

[17:59](#msg5abe7af15f188ccc1513a328)it should be SON/YIJ tho'

[18:00](#msg5abe7b3c27c509a774bea88c)When Initial Laptop Grabbing?

BeardPower

[18:01](#msg5abe7b7a7c3a01610d8fb965)It should definitely be on Loopring.

gltewalt

[18:01](#msg5abe7b7cc574b1aa3e4da65f)Already happened

BeardPower

[18:02](#msg5abe7bc67c3a01610d8fbaa3)SON/CAT is definitely interesting as well.

9214

[18:06](#msg5abe7c95bb1018b37a414033)let's bring son to the moon

rebolek

[19:25](#msg5abe8f29e4ff28713a8f9c04)my wife is hodling son until July, cat is available thought, but very cautious

## Wednesday 16th May, 2018

toomasv

[19:08](#msg5afc81c11cfca775e114253f)A \[date-picker](https://gist.github.com/toomasv/1234d616d8e43a4e49efaa7c1a06c9c9) (Warning: loads `range` from web):  
\[!\[date-picker](http://vooglaid.ee/red/date-picker.gif)](http://vooglaid.ee/red/date-picker.gif)

greggirwin

[20:53](#msg5afc9a5052194a4a67ee9cad)Niiiice!

dander

[22:12](#msg5afcacb85a1d895fae4694a0)really great! It's so nice having all these useful examples from you, @toomasv

x8x

[22:40](#msg5afcb34b56aa881cea61f8ec)lovely! :+1:

greggirwin

[22:48](#msg5afcb5362df44c2d06333d93)When I dust off my requestors gist, that's the next thing I'm going to steal...er...leverage.

## Thursday 17th May, 2018

toomasv

[02:51](#msg5afcee47a2d9513633473d87)Thanks guys!

rebolek

[05:28](#msg5afd131a52194a4a67efe713):+1:

BeardPower

[08:56](#msg5afd43aa1cfca775e116983b)Very nice!

## Saturday 19th May, 2018

toomasv

[14:28](#msg5b003478bd10f34a6815b34b)For some time already I have thought about a diagramming tool. Now decided to try. Here is a first skech:  
\[!\[diagram](http://vooglaid.ee/red/diagram.gif)](http://vooglaid.ee/red/diagram.gif)

ne1uno

[15:06](#msg5b003d9352194a4a67fa37e4)untitled? graphwizard?

[15:07](#msg5b003dc3d332ee5fad2fba9b)graphwiz for short

x8x

[15:12](#msg5b003ecf7788e83a40aba868):+1:

BeardPower

[15:50](#msg5b0047c1a2d95136335237ea)Nice.

gltewalt

[17:03](#msg5b0058dcbd10f34a68161513):fire:

greggirwin

[22:02](#msg5b009f08b84be71db91e04cb)Nice, again, @toomasv !

## Sunday 20th May, 2018

rebolek

[08:46](#msg5b0135d41cfca775e1228323):+1:

## Tuesday 22nd May, 2018

toomasv

[17:06](#msg5b044e12f04ce53632fa3cd2)Interludium  
\[!\[diagram2](http://vooglaid.ee/red/diagram2.gif)](http://vooglaid.ee/red/diagram2.gif)

dander

[17:30](#msg5b0453b0e1cf621dba3d1233)@toomasv as always, your work is really interesting. I've been recently looking at ways of processing structured log data, and I've found that Windows Performance Analyzer has some very powerful graphing capabilities, but seems limited to ETW events. Anyway, I guess it's probably not the use case you are thinking of, but this made me think of that.

toomasv

[17:55](#msg5b04598ce0b50c2d05e2cdb5)@dander Thanks! I'll look into this WPA. Seems interesting.

dander

[17:58](#msg5b045a305a1d895fae5e4fe9)it definitely has a bit of a learning curve. This guy has a lot of good info on the topic https://randomascii.wordpress.com/2015/09/24/etw-central/

toomasv

[18:12](#msg5b045d81f04ce53632fa7ef4)@dander Thanks for the link, very interesting!

dander

[21:05](#msg5b04860296af8f1186c08279)\[!\[image.png](https://files.gitter.im/red/sandbox/OMnj/thumb/image.png)](https://files.gitter.im/red/sandbox/OMnj/image.png)

[21:08](#msg5b0486d15f3e6b40fad874ab)This is an example with WPA where I was looking at the performance of doing a multi-part download from S3. You can see where 'chunk 3' hung the transfer for a significant amount of time because it was going so slowly...  
These graphs are generated using 3 events for chunk started, chunk completed, and number of bytes that were read into the read buffer

[21:09](#msg5b048700fb0f4a0bfe612779)it has really opened my eyes to the possibilities of structured logging

## Wednesday 23th May, 2018

toomasv

[03:49](#msg5b04e4ce6309af743d07922c)@dander Thanks! LG-WT :)

dander

[05:08](#msg5b04f73a5f3e6b40fad9c796)LG-WT?

toomasv

[05:46](#msg5b0500515f3e6b40fad9e369)Looks great - will try

## Saturday 26th May, 2018

toomasv

[19:29](#msg5b09b59fb6eece791db62684)Do you have your `reduce-in-place` funcs? Not sure how useful it is but here is one thought:

```
reduce-in-place: func [block [block!] /local pos][
   while [not empty? block][
      block: change/part block do/next block 'pos pos
   ] head block
]
>> reduce-in-place b: [does [print "hi"] f: func [a][a + 2] "probe [me]" f 1 b/2 3]
== [func [][print "hi"] func [a][a + 2] "probe [me]" 3 5]
>> b/1
hi
>> :b/1
== func [][print "hi"]
>> :b/2
== func [a][a + 2]
>> do b/3
[me]
== [me]
```

[20:15](#msg5b09c04c16f6496124e26f2f)Version with `/deep`:

```
reduce-in-place: func [block [block!] /deep /local pos][
	while [not empty? block][
		block: either all [deep block? block/1][
			change/only block reduce-in-place/deep block/1
		][
			change/part block do/next block 'pos pos
		]
	] head block
]
>> reduce-in-place/deep b: [does [print "hi"] [func [a][a + 1] [b/2/1 7]]]
== [func [][print "hi"] [func [a][a + 1] [8]]]
```

greggirwin

[21:37](#msg5b09d38316f6496124e29b42)Nice one @toomasv.

## Sunday 27th May, 2018

toomasv

[04:44](#msg5b0a37ad352b9e1a4b36c8ef)@greggirwin Thanks! Third line should be `block: either all [deep block? :block/1][` though. Then this works too:

```
>> reduce-in-place/deep b: [does [print "hi"] [func [a][a + 1] 3 [b/2/1 7]]]
== [func [][print "hi"] [func [a][a + 1] 3 [8]]]
>> reduce-in-place/deep b
hi
== [unset [4 [8]]]
```

[04:58](#msg5b0a3aefb6eece791db748b1)What would be a good name for such func? `evaluate`? Or just `valuate`?

[06:09](#msg5b0a4b8ca7abc8692ee93afd)Settled with \[revalue](https://gist.github.com/toomasv/90c9c85431ea9bcdb7f26b36599e1f37)

greggirwin

[23:21](#msg5b0b3d85a7abc8692eeba26b)`Revalue` is fun, especially since `replace` is taken. :^) `Reassess`?

gltewalt

[23:23](#msg5b0b3de093dc78791c8db3c3)rip

## Monday 28th May, 2018

toomasv

[03:24](#msg5b0b767bedd06f7d15eb2758)Thanks! `reassess` is good too.

## Tuesday 29th May, 2018

toomasv

[06:29](#msg5b0cf335352b9e1a4b3e9614)Back to incrementation funcs:

```
inc: func ['val][set val (get val) + 1]
dec: func ['val][set val (get val) - 1]
incr: func ['val step][set val (get val) + step]
decr: func ['val step][set val (get val) - step]
++: make op! :incr
--: make op! :decr
increment: func ['val /by step][set val (get val) + any [step 1]]
decrement: func ['val /by step][set val (get val) - any [step 1]]
>> e: 0
== 0
>> inc e
== 1
>> incr e 5
== 6
>> decrement e
== 5
>> increment/by e 22
== 27
>> e ++ 3
== 30
>> e -- 28
== 2
>> e
== 2
>> e: 1-May-2018 loop 5 [print also e inc e]
1-May-2018
2-May-2018
3-May-2018
4-May-2018
5-May-2018
>> e: #"a" loop 26 [prin also e inc e]
abcdefghijklmnopqrstuvwxyz
```

dander

[18:47](#msg5b0da03e4eaffb692d66093f)@toomasv interesting use of `op!`

greggirwin

[19:18](#msg5b0da782e26c847ac89f23f0)Can't remember if mine are in a gist @toomasv, but we should charge this banner forward.

9214

[19:25](#msg5b0da91616f6496124ee0c78)@BeardPower :smirk:

BeardPower

[19:25](#msg5b0da92d99fa7f4c062b99bb)@9214 Damn, he saw my BS :smile:

9214

[19:25](#msg5b0da945e26c847ac89f2ab2)@BeardPower just enough RED will seal my mouth forever :japanese\_ogre:

BeardPower

[19:27](#msg5b0da99e16f6496124ee0e86)@9214 :rocket: :full\_moon\_with\_face:

9214

[19:27](#msg5b0da9b916f6496124ee0ed2):hotsprings: :chart\_with\_upwards\_trend:

[19:28](#msg5b0da9ca16f6496124ee0ee9):clock3: :car: :question:

BeardPower

[19:28](#msg5b0da9d193dc78791c95cdf6)lol

[19:29](#msg5b0daa30b6eece791dc23342)Master of Pictionary

## Sunday 10th June, 2018

toomasv

[11:45](#msg5b1d0f74659aad4a32654b58)Playing with range shorthand:

```
system/lexer/pre-load: func [source part /local int i1 i2 i3 blk len][
	int: charset [#"0" - #"9"] 
	parse source [
		some [
			ahead [some int ".."] 
			s: [copy i1 some int ".." copy i2 some int (i3: 1) opt [#"|" copy i3 some int]] e: (
				i1: to-integer i1 i2: to-integer i2 i3: to-integer i3 
				blk: make block! len: i2 - i1 / i3 + 1 
				change/part s repeat i len [mold append/only blk i1 + (i - 1 * i3)] e
			) 
		| 	skip
		]
	]
]
>> foreach i 0..10|2 [print i]
0
2
4
6
8
10
>> reduce [5..9 4..8|2 reverse 3..15|3]
== [[5 6 7 8 9] [4 6 8] [15 12 9 6 3]]
```

[15:07](#msg5b1d3ec0d7b4f6288cbdcc5d)Two corrections:

```
int: charset [#"-" #"0" - #"9"]
```

and

```
mold repeat i len [append/only
```

...

```
>> -1..5
== [-1 0 1 2 3 4 5]
>> -1..5|2
== [-1 1 3 5]
>> 10..5|-2
== [10 8 6]
```

gltewalt

[17:36](#msg5b1d61a6ddd61d08e545292d)That’s 😎

toomasv

[20:24](#msg5b1d88e5ddd61d08e545a4f3) :recycle:

## Monday 11st June, 2018

greggirwin

[17:46](#msg5b1eb591ebf21755ca288e5f)Very nice @toomasv.

## Wednesday 13th June, 2018

toomasv

[06:33](#msg5b20baa14fbf4449eb121797)Made \[short-range](https://gist.github.com/toomasv/fcceab33fb88c80a8c3a4ecff97587cd) variable:

```
try: does [foreach i a..b|c [print i]]
>> a: 5 b: 15 c: 3 try
5
8
11
14
>> a: 15 b: 5 c: -3 try
15
12
9
6
```

greggirwin

[16:42](#msg5b21498637a2df7bed39e33f)Very nice @toomasv. That addresses (kind of like my `intupelate`) one of my big issues with the value of literal ranges. They are literal. We do use those, but they're not nearly as useful as parameterized ranges.

toomasv

[21:02](#msg5b21864a86343c3a320276ee)@greggirwin Thanks! Yes, without variability it would not be of much use.

## Wednesday 20th June, 2018

gltewalt

[04:19](#msg5b29d5c3467bd7268c1eaf23)`system/console/eval-command "1"`

[04:20](#msg5b29d629ad21887018c9649b)In cli console

```
>> system/console/eval-command "1"
*** Script Error: set does not allow error! for its word argument
*** Where: set
*** Stack: load
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== ""
```

But in GUI Console, stack overflow

```
>> system/console/eval-command "1"
*** Internal Error: stack overflow
*** Internal Error: stack overflow
*** Where: set
*** Stack:  

== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== 1
== ""
>> 
*** Script Error: value out of range: 37
*** Where: poke
*** Stack: ask do-events do-actor do-safe
```

greggirwin

[17:04](#msg5b2a8909aeb8fa0c072c9483)That should not be exposed. I think there's a ticket for that already. If not, please note it.

## Wednesday 27th June, 2018

rebolek

[12:33](#msg5b33840faeb8fa0c07469027)Unofficial builds page is running for a month now, so it's time for some basic stats, here are downloads by system:

```
linux: 304
    win: 57
    macos: 178
    rpi: 108
```

BeardPower

[13:21](#msg5b338f53be98b142240d68a0)Wow, so most users are \*NIX people.

rebolek

[13:37](#msg5b339315aeb8fa0c0746bfc2)Most downloads from that page, to be precise.

[13:38](#msg5b3393465862c35f47ccae3c)I also should filter bots, to get better results, I doubt the high numbers for rPi.

BeardPower

[19:45](#msg5b33e9535862c35f47cdb718)Yeah, that one is a little suspicious.

## Friday 6th July, 2018

toomasv

[19:59](#msg5b3fca1860c387078364046e)Basic logic-gates:  
\[!\[logic-gates](http://vooglaid.ee/red/logic-gate1.gif)](http://vooglaid.ee/red/logic-gate1.gif)

BeardPower

[20:22](#msg5b3fcf8a9b82c6701ba8d274)@toomasv great

[20:22](#msg5b3fcf8bbd92d807829a2a35)

x8x

[21:00](#msg5b3fd8842f8ed24d3cf316a8)@toomasv Wow!! :thumbsup:

## Saturday 7th July, 2018

greggirwin

[02:28](#msg5b40253733b0282df4071c54)Wow indeed! Very cool @toomasv !

toomasv

[04:33](#msg5b4042817e23133ecb38aa70)Thanks! \[Code is here](https://github.com/toomasv/gates) (buggy still). I started tinkering with logic gates while reading biography of \[Claude Shannon](https://www.goodreads.com/book/show/32919530-a-mind-at-play) (thanks Gregg!). Never delved into these before. Any ideas for interesting circuits? Resources? Suggestions for improvement? (Plannning to griddify the canvas and make connections orthogonal)

greggirwin

[05:21](#msg5b404ddfbd92d807829ae56b)Shannon, woohoo! It's a good read.

gltewalt

[06:43](#msg5b40612a3572e970c17d3079)How about a railroad diagram generator that we can use for docs?

[06:52](#msg5b40633a33b0282df40764c9)https://imgur.com/a/qekAwzr

[06:54](#msg5b406392bd92d807829b00bc)Or a drag-n-drop railroad diagram maker

toomasv

[08:03](#msg5b4073ed9b82c6701ba9c8b8)@gltewalt Hmm.. Another graph-project

BeardPower

[10:31](#msg5b40969133b0282df407b5d3)@toomasv create a d-flip-flop, half- and full adders, LEDs and prepare a CPU :smile:

[10:35](#msg5b40976a81816669a437fc54)Red needs some SPICE simulator.

ne1uno

[12:30](#msg5b40b27289db5e701ca9714a)netlist input output

toomasv

[17:58](#msg5b40ff2da99e1e52b71e6ca4)Three half-adders (should add labels):  
\[!\[logic-gates2](http://vooglaid.ee/red/logic-gate2.gif)](http://vooglaid.ee/red/logic-gate2.gif)

gltewalt

[19:39](#msg5b41170560c3870783662822)Very cool

greggirwin

[21:04](#msg5b412ae1a99e1e52b71eb7f2)@toomasv, less than 200 LOC for this. So cool. It reminds me that the `remove find` idiom is common enough that `delete` could be implemented for series values to do that. `Delete` is informally categorized as an I/O action, but what do others think about that?

[21:18](#msg5b412e2d3572e970c17e8d40)@gltewalt @toomasv, a RR diagram generator has been on my wish list for a long time. For ren-data.org I used http://www.bottlecaps.de/rr/ui (which is great), but I think it could be very useful in Red, because of dialects. It will help people document their dialects.

[21:19](#msg5b412e69f1664406612210c6)@toomasv, this logic gate example is definite showcase material.

## Sunday 8th July, 2018

toomasv

[19:54](#msg5b426bf5f16644066123e054)@greggirwin  
As `delete` is taken already, I implemented `expunge` :-)

```
expunge: func [face /from pane][pane: any [pane face/parent/pane] remove find pane face]
```

greggirwin

[20:02](#msg5b426dd281816669a43ae0ef)@toomasv, nice. :^)

[20:03](#msg5b426e0889db5e701cac295a)It would be an issue for `delete`, because of the arity. Unless we add something like a `/part` refinement.

[20:04](#msg5b426e62bd92d807829e49fd)Then we could also just use `remove` and add the refinement there.

toomasv

[20:15](#msg5b4270c77e23133ecb3c0396)About showcase - I put it now into \[Projects showcase](https://github.com/red/red/wiki/Projects-showcase-(links-to-remember)) but it is raw still.  
BTW, it seems using panethesis in link names is not good for referencing, as above. Should be https://github.com/red/red/wiki/Projects-showcase-(links-to-remember)

greggirwin

[20:19](#msg5b4271e833b0282df40a8a8d)The link syntax always messes with me, beyond simple single-word values.

toomasv

[20:35](#msg5b427594f16644066123efe2)^ "panethesis" hi-hi

[20:38](#msg5b42764789db5e701cac3721)It would be nice to have `delete` for face-deleting also -- less to remember.. Want to delete something? -- `delete`

## Monday 9th July, 2018

greggirwin

[00:58](#msg5b42b33270efc60660b7b12e)Except you need to know the series holding the reference to &lt;it&gt;. That's the catch.

## Tuesday 24th July, 2018

toomasv

[14:44](#msg5b573b3163cf1636bdeb7536)Exploring the rgb-cube:  
\[!\[rgb-cube](http://vooglaid.ee/red/rgb-cube.gif)](http://vooglaid.ee/red/rgb-cube.gif)

9214

[14:44](#msg5b573b6bb2411177a26a4cda)@toomasv https://github.com/red/red/wiki/\[LINKS]-Projects-showcase-(links-to-remember)  
:+1:

toomasv

[14:49](#msg5b573c6aee530e4aac949869)@9214 Needs some work still, rotations are tricky. These three sides work well though. (And cover all the color-space)

greggirwin

[21:57](#msg5b57a0d4ee7b230b44653365)Very cool @toomasv !

## Friday 17th August, 2018

toomasv

[18:31](#msg5b771481dd0b74601e202ca8)From today's discussion in help room - function with memory:

```
memorize: function [arg1 arg2 /recall n][
   history: [] 
   if recall [return new-line/all/skip case [
      n = 'all [history] 
      n = 'last [at history (length? history) - 1] 
      block? n [copy/part at history 2 * n/1 - 1 2 * n/2] 
      integer? n [copy/part at history 2 * n - 1 2]
   ] true 2] 
   append append history arg1 arg2 
   [do something with args]
]
memorize 1 2
;== [do something with args]
memorize 3 4
;== [do something with args]
memorize 5 6
;== [do something with args]
memorize 'a 'b
;== [do something with args]
memorize/recall none none 'all
;== [
;    1 2 
;    3 4 
;    5 6 
;    a b
;]
memorize/recall none none 'last
;== [
;    a b
;]
memorize/recall none none 2
;== [
;    3 4
;]
memorize/recall none none [2 2]
;== [
;    3 4 
;    5 6
;]
```

9214

[18:32](#msg5b7714cfe7971d5f109826c6)@toomasv conventionally, `memoize` should accept a function and return its memoized version.

[18:33](#msg5b7714f0dd0b74601e203050)At least that's the way I've learned the concept in functional programming.

toomasv

[18:38](#msg5b77160e087c4c20b5f83090)Ah, yes, memoization ... didn't rememoiz that.

greggirwin

[19:45](#msg5b7725cde40fdf5fb15243bb)@9214, have you written a function memoizer for Red?

toomasv

[20:11](#msg5b772c0ecda86f5fb26cc8c6)Tried direct memoization for factorial:

```
factorial: function [n][
   values: [1.0] 
   either val: pick values n + 1 [val][
      while [
         n + 2 > l: length? values
      ][
         append values l * val: last values
      ]
   ] 
   val
]
```

gltewalt

[20:14](#msg5b772cbbe026575f0f89f722)How can you do optional?

[20:15](#msg5b772ccfe7971d5f1098b6c5)`memorize: function [/opt arg1 arg2 /recall n][`

toomasv

[20:20](#msg5b772e14087c4c20b5f8b58e)Optionals \*per se* can be added without problem, but how to memorize calling without arguments... Have to record counting incrementals AND optionals. Needs some meditation

gltewalt

[20:25](#msg5b772f320825690ea2e4f2e9)Or optional if `/recall`

toomasv

[20:27](#msg5b772fb7157b9d34ef9fd9b3)Order of magnitude quicker:

```
factorial: function [n][
   values: make hash! [1.0]
   ...
]
```

greggirwin

[22:43](#msg5b774fae7a178641253f9dcc)A memoizer would be a pretty cool example, because of Red's free ranging evaluation, refinements, and reflective abilities. Good challenge for some big brain.

## Saturday 18th August, 2018

toomasv

[03:34](#msg5b7793d2e7971d5f109ac018)And with map it is 3x faster than with hash:

```
factorial3: function [n][
   values: #(1 1.0) 
   either val: values/(n + 1) [val][
      while [
         n + 2 > l: length? values
      ][
         values/(l + 1): l * val: values/:l
      ]
   ] 
   val
]
```

gltewalt

[04:11](#msg5b779c65087c4c20b5fae259)Yeah, associate arrays should be O(1)

[04:11](#msg5b779c76592121412483396e)For lookup

toomasv

[04:32](#msg5b77a172087c4c20b5fafd41)Oops! `make hash!` was plain stupid as it makes new one on each run :flushed:  
Otherwise, block is only slightly slower than map, probably because the size of block/map is small.

gltewalt

[04:36](#msg5b77a241a158fd0ea373f920)I believe it is because of the size

[04:36](#msg5b77a25c070fa234ee7b98ce)You could fill it up with 1000 values and run the profiler on it

[04:39](#msg5b77a2f37a178641254122cb)Or 100 values. Might be waiting awhile for 1000

greggirwin

[04:44](#msg5b77a412e40fdf5fb154cb42)For small sizes, blocks are fine. At some point, we could profile to determine guidelines for when to think about switching.

[04:45](#msg5b77a44ce2e48a20b4754f0b)e.g., I don't know if `hash!` has different performance characteristics when used with `parse`.

gltewalt

[05:04](#msg5b77a8ef592121412483750f)I'm also dumb... time isn't going to be the issue. Number size is

[05:07](#msg5b77a9afe2e48a20b4756535)Run in to 1.#INF at `factorial3 171`

9214

[07:28](#msg5b77ca94802bc42c5f36af22)@greggirwin I wrote ad hoc versions here and there, but it's a bit tricky to do in general case, because you must know in advance which argument to memorize.

[07:28](#msg5b77caa8087c4c20b5fbc991)e.g. in `func [a b][...]`. is it `a`, `b`, or combination of both?

[07:29](#msg5b77cac0e026575f0f8cf9b0)Should refinements play their role?

[07:33](#msg5b77cbb3796f7b601d5af108)In the simplest case it's just

```
map: #()
any [
    map/:arg
    map/:arg: foo arg
]
```

greggirwin

[07:39](#msg5b77cd45e40fdf5fb155a287)@9214 could be interesting for `memoize` to take a list of args to act on. e.g. `/with`, where the default is to memoize all args.

9214

[07:42](#msg5b77cdf6e40fdf5fb155a4f7)@greggirwin that's what I'm thinking too. Problem is that with list of args you won't get perfomance of map and hash, because they explicitly forbid series as keys.

dander

[16:41](#msg5b784c457a17864125448e67)@9214 what about using nested maps?

9214

[17:09](#msg5b7852b2157b9d34efa58d0e)@dander either this or a simple block of key / value pairs with `select/only/skip ... 2`, where keys are reduced argument lists and values are associated results, previously returned from a function.

I'm swamped without a trusty working station right now and leave it for curious minds to figure out.

[17:09](#msg5b7852dedd0b74601e267bf9)I believe list of arguments is called \*domain* of a function?

[17:43](#msg5b785ab3802bc42c5f398ed4)@dander and how nested maps would work anyway? Arguments can be of any datatype, even those that can't be used as map keys.

gltewalt

[17:48](#msg5b785bd5d7901b2c6057bc93)The only many-to-one option we have is the block setup you mentioned

9214

[17:55](#msg5b785d74802bc42c5f399900)Take a function, clean up its spec from docstrings and typesets, convert refinements to words, handle lit- and get- arguments. Reduce this block and check if its a key in your "memo" - if it is then return associated value, otherwise extend "memo" with key / value pair and return value &lt;-- this logic should be embedded in a newly constructed version of a function that you should return back.

## Sunday 19th August, 2018

dander

[00:35](#msg5b78bb6a087c4c20b500a2f6)@9214 good point on the data types issue. That would defeat the single level map too wouldn't it? Was there some discussion about more general support for key types in maps? I suppose you could hash the values yourself and use that to look up values.

## Tuesday 21st August, 2018

toomasv

[15:27](#msg5b7c2f58e5b40332abdabe45)How about adding `/only` refinement to `to-block`?

```
to-block: func ["Convert to block! value" value /only][
    either only [append/only copy [] :value][to block! :value]
]
to-block "c"
;== [c]
to-block/only "c"
;== ["c"]
to-block [c]
;== [c]
to-block/only  [c]
;== [[c]]
```

greggirwin

[15:51](#msg5b7c351aa491f459177ea724)`To-` functions are automatically generated, so it's not as easy as just changing that one func.

I'm also not sure it makes sense in the context of converting values. That is, `to-*` should be idempotent if the arg is already the target type (ignoring `copy`ing), where your last example would create deeper and deeper nestings with `/only`.

What is the use case behind it? Your ideas most often come from real world use, so let's look at that.

toomasv

[16:19](#msg5b7c3b85d8d36815e56d77ea)I'm thinking about `remove-from-map` by values, by keys, by datatypes. Will show soon. The question above was a by-product, not vital. Thanks for explanation!

greggirwin

[16:20](#msg5b7c3bb51d3a5711b67ac3d8):+1:

toomasv

[17:32](#msg5b7c4ccbe5b40332abdb775c)@greggirwin Here it is:

```
remove-from-map: function [map vals /keys /local skp1 skp2][
	unless block? vals [vals: append copy [] vals]
	set [skp1 skp2] either keys [[0 -2]][[1 -3]]
	block: skip body-of map skp1
	forall vals [
		while [
			block: find/skip/tail block vals/1 2
		][
			put map first skip block skp2 none
		]
		block: skip body-of map skp1
	]
	map
]
>> remove-from-map #(a 1 b 2 c "c" d g "e" :f 1 10) "c"
== #(
    a: 1
    b: 2
    d: g
    "e" :f
    1 10
)
>> remove-from-map #(a 1 b 2 c "c" d g "e" :f 1 10) get-word!
== #(
    a: 1
    b: 2
    c: "c"
    d: g
    1 10
)
>> remove-from-map #(a 1 b 2 c "c" d g "e" :f 1 10) [1 10]
== #(
    b: 2
    c: "c"
    d: g
    "e" :f
)
>> remove-from-map #(a 1 b 2 c "c" d g "e" :f 1 10) reduce [string! get-word!]
== #(
    a: 1
    b: 2
    d: g
    1 10
)
>> remove-from-map/keys #(a 1 b 2 c "c" d g "e" :f 1 10) set-word!
== #(
    "e" :f
    1 10
)
>> remove-from-map/keys #(a 1 b 2 c "c" d g "e" :f 1 10) [1 "e"]
== #(
    a: 1
    b: 2
    c: "c"
    d: g
)
>> remove-from-map/keys #(a 1 b 2 c "c" d g "e" :f 1 10) reduce [string! integer!]
== #(
    a: 1
    b: 2
    c: "c"
    d: g
)
```

## Wednesday 22nd August, 2018

greggirwin

[04:42](#msg5b7ce9b0f86b741b05a63157)Thanks! Will try to review tomorrow, after meetings.

## Tuesday 4th September, 2018

toomasv

[05:25](#msg5b8e173411b41f69dbb911fe)I wonder if `within?` works correctly. E.g. following pic is from the code

```
>> view/no-wait [box 101x101 draw [b1: box 0x0 100x100 pen red b2: box 0x0 10x10 b3: box 90x90 100x100]]
== make object! [
    type: 'window
    offset: 902x505
    size: 130x121
== make object! [
    type: 'window
    offset: 902x505
    size: 130x121
    te...
>> 
>> within? b2/3 b1/2 b1/3
== true
>> within? b3/3 b1/2 b1/3 - b1/2
== false
>> within? b3/3 - 1 b1/2 b1/3 - b1/2
== true
```

\[!\[image.png](https://files.gitter.im/red/sandbox/DAIN/thumb/image.png)](https://files.gitter.im/red/sandbox/DAIN/image.png)

[05:29](#msg5b8e183e60f9ee7aa4d4dadf)`within?` is currently defined as

```
within?: func [
    {Return TRUE if the point is within the rectangle bounds} 
    point [pair!] "XY position" 
    offset [pair!] "Offset of area" 
    size [pair!] "Size of area" 
    return: [logic!]
][
    to logic! all [
        point/x >= offset/x 
        point/y >= offset/y 
        point/x < (offset/x + size/x) 
        point/y < (offset/y + size/y)
     ]
]
```

Problem is `<` in last two comparisons, instead of `<=`.

rebolek

[05:29](#msg5b8e18571d3a5711b6dfb340)Is it?

[05:30](#msg5b8e186260f9ee7aa4d4db20)https://doc.red-lang.org/en/draw.html#\_box

[05:30](#msg5b8e1877e5b40332ab3fdd24)You don't define box' size, but it's bottom right corner

toomasv

[05:34](#msg5b8e1974d8d36815e5d27a93)Sorry, corrected my example. Problem is still same.

rebolek

[05:37](#msg5b8e19fd11227d711d115f1f)You are computing size as `b1/3 - b1/2`. Let's have a small box that starts at `1x1` and goes to `2x2`. If I compute size as you do, I will get that the size is `1x1`. That's obviously wrong.

toomasv

[05:40](#msg5b8e1ade58a3797aa3fd221f)So, you suggest that size should be calculated as `end - start + 1`?

rebolek

[05:41](#msg5b8e1af111b41f69dbb9281e)Yes.

toomasv

[05:46](#msg5b8e1c1cac25fd11b5d9d6ce)Then to find `end` from `start` and `size`, which I would intuitively do as `start + size`, should instead be calculated as `start + size - 1`?

rebolek

[05:48](#msg5b8e1ca511227d711d116caf)Intuition isn't always right :) See the `1x1 - 2x2` example. If you count it as `end - start`, you get `1x1` size and if you count it as `start + size`, you'll get `3x3` as end.

toomasv

[05:56](#msg5b8e1e9ec9500b4bab7c3545)OK, that's also why to see whole `box 0x0 100x100` face shoud be one px bigger, e.g. in `view [box 101x101 draw [box 0x0 100x100]]`, for box's size is 101x101. Got it. Thanks :)

rebolek

[05:58](#msg5b8e1f1dd8d36815e5d299e6)you're welcome!

[06:00](#msg5b8e1f67ac25fd11b5d9e65e)We are so used to indexing from 1 in Red, that the fact that images are indexed from 0x0 can throw us bit off rails ;)

toomasv

[16:15](#msg5b8eaf9fcff55e5617a7df8a)Cryptic dir-tree, just for fun:

```
dir-tree: function [][p: :parse a: :append c: :copy o: c {} pr: c [] d: :read e: :either m: :remove h: :change-dir
p p d %. r: [collect some [s: keep file! [if (dir? s/1) keep (h s/1 p d %. r) (cd ..) |]]] 
r: [some [s: file! (a o a e dir? s/1 [also a c pr s/1 a pr #"^-"][a c pr s/1] #"^/") | block! (p s/1 r) (m pr)]] o]
```

greggirwin

[16:18](#msg5b8eb048c2bd5d117a1b1bb1)@toomasv, I'll have to come back to that, after a brain transplant. ;^)

toomasv

[16:19](#msg5b8eb087cff55e5617a7e5ad)Don't worry, I'll be waiting.

## Tuesday 18th September, 2018

toomasv

[10:58](#msg5ba0da59d655361f761897d8)Parsing backwards. Handy e.g. if you bump on some value in draw block and want to know which keyword it is attached to:

```
backward-rule: [collect some [l: keep word! to end | [pair! | integer! | end] (l: back l) :l]]
parse tail [box 1x1 2x2 10] backward-rule
;=[box]
parse skip [line 1x1 2x2 10x20 1000x600] 4 backward-rule
;=[line]
```

Or if you want to check wether it is certain kind of thing:

```
parse tail [line 1x1 2x2 10x20 1000x600] [some [l: 'line to end | [pair! | integer! | end] (l: back l) :l]]
;== true
parse tail [box 1x1 2x2 10x20 1000x600] [some [l: 'line to end | [pair! | integer! | end] (l: back l) :l]]
;== false
```

greggirwin

[17:22](#msg5ba134471ee2ca650235c606)I don't think I've seen anyone do that before @toomasv. It opens up new ways of thinking about debugging parse rules.

## Wednesday 19th September, 2018

toomasv

[13:49](#msg5ba253f7b4990c30eedaaf26)Example of usage. Play with clickin' and draggin' w/wo ctrl:

```
view [
	box snow 300x300 draw [
		fill-pen 0.0.0.254 box 50x50 250x250 
		fill-pen 0.0.0.254 box 100x100 200x200
	] 
	on-down [
		set [series				failing							ending] 	reduce either event/ctrl? [
			[tail face/draw		[(l/-1: 0.0.0.254 l: back l) :l]	[if (head? l) to end | (l: back l) :l]]
		][
			[face/draw			[(l/-1: 0.0.0.254)]				[skip]]
		]
		parse series [
			some [
				l: 'box set s pair! set e pair! [
					if (within? event/offset s sz: e - s + 1)(
						ofs: event/offset - s
						l/-1: 'red
					) break 
				| 	failing
				] 
			|	ending
			]
		]
	]
	all-over on-over [
		if event/down? [
			l/2: event/offset - ofs
			l/3: l/2 + sz
		]
	]
]
```

greggirwin

[17:02](#msg5ba2810afcba1254fadd2a8c)Wow! I love how you think outside...inside...and around the box.

BeardPower

[17:02](#msg5ba28135d655361f762328e3) @greggirwin There is no box :-)

9214

[17:03](#msg5ba2814cf7e1580625f53977)@BeardPower there is no 'there'.

BeardPower

[17:05](#msg5ba281d6a56b215c9760a4a1)@9214 Who said that? :-)

greggirwin

[17:05](#msg5ba281edd655361f76232d80)It clearly wasn't me.

9214

[17:06](#msg5ba28201b9531f2dfa8e964e)@BeardPower whom are you talking to?

BeardPower

[17:06](#msg5ba28218fcba1254fadd3185)@greggirwin That's what the Illuminati would say.

[17:06](#msg5ba2822ef7e1580625f54021)@9214 It's my daily rant ;-)

## Saturday 22nd September, 2018

toomasv

[18:09](#msg5ba685411043315947cd8496)POC of live layout editing  
\[!\[layout-editor](http://vooglaid.ee/red/lay-tree.gif)](http://vooglaid.ee/red/lay-tree.gif)

greggirwin

[18:12](#msg5ba68619b9531f2dfaa64bff)Woohoo! Very cool.

toomasv

[18:32](#msg5ba68ab933da0f649e3aa78a):smile:

dander

[18:40](#msg5ba68cb0f7e15806250cce13)wow, really neat!

toomasv

[19:41](#msg5ba69ace7dca3065033d0610)Thanks!

rebolek

[22:00](#msg5ba6bb721043315947cea2b8)@toomasv :clap:

## Wednesday 26th September, 2018

toomasv

[20:02](#msg5babe5ee4d320a463bfabfaa)Some developments:  
\[!\[lay-tree2](http://vooglaid.ee/red/lay-tree2.gif)](http://vooglaid.ee/red/lay-tree2.gif)

rebolek

[20:49](#msg5babf0c17bd81c5b9dbae842)really nice

greggirwin

[23:08](#msg5bac11517bd81c5b9dbbbc21)"Some" developments he says, as if it's not almost an IDE. OK, I know it's \*not* almost an IDE, but almost an IDE for building a live coding IDE. ;^)

These examples really show the power of Red. So cool.

## Thursday 27th September, 2018

dockimbel

[01:01](#msg5bac2bea56877c463a8cfd60)@toomasv Very cool, great job! :+1: You should re-post it in red/red, so that everybody can see how flexible GUI can be.

toomasv

[03:24](#msg5bac4d8b7bd81c5b9dbd13ec)Thanks all! :smile: I'll repost it then.

BeardPower

[17:10](#msg5bad0effaedb375b9c56fb00)@toomasv Nice GUI designer!

## Wednesday 17th October, 2018

x8x

[12:32](#msg5bc72bcfdb022f757af4b624)Always great stuff @toomasv ! Congrats! :thumbsup:

toomasv

[12:37](#msg5bc72d1f1e23486b93d3768d)@x8x :point\_up: \[October 2, 2018 9:54 PM](https://gitter.im/red/red/gui-branch?at=5bb3bed4c7bf7c3662a6e110)

## Thursday 25th October, 2018

toomasv

[11:43](#msg5bd1ac5064cfc273f9221dc7)Micro browser:

```
ws: charset reduce [space newline tab]
rule: [
	remove thru {<div class='blog-posts hfeed'>}
	some [
		remove [{<div class='blog-pager' id='blog-pager'>} thru end]
	|
		remove [
			"<script" thru "script>" 
		| 	"<style" thru "style>" 
		| 	#"<" thru #">"
		] 
	| 	change " " #" "
	| 	change "&" #"&"
	|	change ["&#" s: to [e: #";"]] (to-char to-integer copy/part s e) 
	| 	skip
	]
]
view/flags [
	on-resizing [
		foreach-face face [
			either face/type = 'field [
				face/size/x: event/window/size/x - 20
			][
				face/size: event/window/size - face/offset - 10x10
			]
		]
	]
	below 
	field 400 default https://www.red-lang.org focus on-enter [
		parse tx: read face/data rule
		parse tx [some [2 newline change [newline some ws] newline | skip]]
		ar/text: tx
	] 
	ar: area 400x400 wrap
] 'resize
```

greggirwin

[15:42](#msg5bd1e46c271506518d6b7f1c):+1: I tried http://www.rebol.com and got quite a bit of markup in it though. Might need a few more lines of code. ;^)

toomasv

[15:58](#msg5bd1e83364cfc273f923c008)@greggirwin Nope, there were too many lines :wink: (I added some site-specific criteria to above). Following works ok with rebol.com (and in general, I hope):

```
Red [Needs: View]
ws: charset reduce [space newline tab]
rule: [
	;remove thru {<div class='blog-posts hfeed'>}
	some [
	;	remove [{<div class='blog-pager' id='blog-pager'>} thru end]
	;|
		remove [
			"<script" thru "script>" 
		| 	"<style" thru "style>" 
		| 	#"<" thru #">"
		] 
	| 	change " " #" "
	| 	change "&" #"&"
	|	change ["&#" s: to [e: #";"]] (to-char to-integer copy/part s e) 
	| 	skip
	]
]
view/flags [
	on-resizing [
		foreach-face face [
			either face/type = 'field [
				face/size/x: event/window/size/x - 20
			][
				face/size: event/window/size - face/offset - 10x10
			]
		]
	]
	below 
	field 400 default http://www.rebol.com focus on-enter [
		parse tx: read face/data rule
		parse tx [some [2 newline change [newline some ws] newline | skip]]
		ar/text: tx
	] 
	ar: area 400x400 wrap
] 'resize
```

greggirwin

[16:05](#msg5bd1e9e6c7bf7c36626b471d):^)

## Sunday 28th October, 2018

toomasv

[15:52](#msg5bd5db2cc7bf7c36628395d6)Poor man's micro-browser vol2:  
\[!\[nano-browser](http://vooglaid.ee/red/micro-browser.gif)](http://vooglaid.ee/red/micro-browser.gif)

x8x

[17:54](#msg5bd5f7ce3a42fa76532ed617):thumbsup:

BeardPower

[18:10](#msg5bd5fb8f271506518d84dab3)@toomasv :+1: But can it run Crysis? ;-)

toomasv

[18:21](#msg5bd5fe4664cfc273f93d2c84):joy\_cat:

BeardPower

[18:23](#msg5bd5fe9a6e5a401c2de4e4cf)We need a great Browser in Red. I hate this Firefox, Chrome, Edge etc. bloat. "All" we need would be a great and W3C standard conform layout engine.

toomasv

[18:24](#msg5bd5fec5069fca52a5ab4756)Well, my 200 LOC is far cry from this.

BeardPower

[18:25](#msg5bd5fefdae7be94016ce9174)Well, it's great for what it is.

[18:25](#msg5bd5ff1c600c5f642320ab63)Any stats on resource usage?

toomasv

[18:32](#msg5bd600d2069fca52a5ab5918)But there are some daring steps toward the goal \[picbrowser.red](https://github.com/toomasv/learning/blob/master/browser/picbrowser.red):  
\[!\[picbrowser](http://vooglaid.ee/red/picbrowser.gif)](http://vooglaid.ee/red/picbrowser.gif)

x8x

[18:35](#msg5bd60162aed22a514b61f3ca)Smart and useful! :thumbsup:

toomasv

[18:45](#msg5bd603d6069fca52a5ab6991)\[!\[image.png](https://files.gitter.im/red/sandbox/sjWk/thumb/image.png)](https://files.gitter.im/red/sandbox/sjWk/image.png)

[18:45](#msg5bd603dac08b8b306788f5d5)@BeardPower I'm bad on this. Suggest, how do I measure it. CPU usage (three pikes are fetching new pages):

[18:46](#msg5bd60420c08b8b306788f6d2)No change in memory consumption, as far as I can tell.

BeardPower

[18:49](#msg5bd604b2271506518d851982)@toomasv You can just open the Task Manager and click on the "Red Browser" process.

toomasv

[18:51](#msg5bd605413844923661b190ba)12MB CPU 4,6% on feching new page.

[18:59](#msg5bd60723ab17df263105abca)Firefox is curently taking 3 giga, but gee, I have tons of pages open :flushed:

ne1uno

[19:04](#msg5bd608451c100a4f29fb177b)gc versions eat some few percent CPU doing nothing now, so that's not much different than idle. scripts/js css eat memory

BeardPower

[19:04](#msg5bd6085664cfc273f93d70f6)&gt; 12MB CPU 4,6% on feching new page.

Thanks!

toomasv

[19:06](#msg5bd608d11c100a4f29fb193e)Nie-za-što!

[19:37](#msg5bd60ffe069fca52a5abbdf7)@x8x Thanks! :smile:

dander

[20:14](#msg5bd6188a600c5f6423214ba6)@toomasv as always, very interesting demos! Sidenote: for very detailed process information, https://processhacker.sourceforge.io/ is fantastic.

toomasv

[20:44](#msg5bd61f9f600c5f6423217440)@dander Thanks! This shows 17,4 MB (initially starting from ~12), max CPU 9,4% and 1MB I/O on feching new page.

BeardPower

[20:57](#msg5bd622a7ef4afc4f28e82f5a)@toomasv I also recommend https://docs.microsoft.com/en-us/sysinternals/downloads/process-explorer

## Monday 29th October, 2018

dander

[02:33](#msg5bd6716f069fca52a5ae0a60)@BeardPower yeah, both are great. I think process hacker has quite a bit more information in the single app (though not so much if you combine the other sysinternals tools)

ne1uno

[02:38](#msg5bd67299069fca52a5ae10c9)process explorer has the old regmon/filemon builtin for tracking registry and file access/requests. it's worth having just for those

dander

[02:40](#msg5bd67330c7bf7c3662876334)@ne1uno do you mean sysinternals? Those are separate tools in the suite, right?

ne1uno

[02:44](#msg5bd67423c7bf7c366287677d)@dander: not sure about the suite, last I remember they rolled those tools that stopped working after Xp into process explorer. at some point microsoft bought them out, I haven't really kept up

dander

[02:53](#msg5bd6763cef4afc4f28ea27c7)Maybe I just didn't notice them in there. Anyway, there are several gems. It's worth noting that though Microsoft did buy them out, it's still maintained somewhat by the same authors.

ne1uno

[03:13](#msg5bd67af41e23486b9333f888)@dander: it looks like procmon is what I was thinking of, I must have installed the suite, it's been awhile since I thought about it

[03:16](#msg5bd67b7d600c5f6423239639)https://docs.microsoft.com/en-us/sysinternals/downloads/procmon

dander

[03:41](#msg5bd6815ec7bf7c366287b2ad)There are some cool demos using procmon and some other tools in the \[case of the unexplained](https://docs.microsoft.com/en-us/sysinternals/learn/webcasts) videos. I have found procmon to be a bit intimidating to use in the past

ne1uno

[03:51](#msg5bd683bd1c100a4f29fdfbc1)it's a little shocking when you first see how much goes on in a few seconds

[03:52](#msg5bd683e9bbdc0b2505b77aa6)need to filter well

toomasv

[04:37](#msg5bd68e8b600c5f6423240208)@dander @BeardPower @ne1uno Great tools all! Thanks!

greggirwin

[17:13](#msg5bd73fc6bbdc0b2505bc46a9)@toomasv, if possible, we should set aside some RedCon time for the team to talk about a Red "Browser" project.

[17:14](#msg5bd73fdaef4afc4f28eef535)As always, really exciting to see what new things you ad overnight.

toomasv

[17:18](#msg5bd740eaab17df26310d305e)@greggirwin Jawohl.

## Wednesday 7th November, 2018

toomasv

[14:31](#msg5be2f7477a36913a9a065850)Playing with a stick:  
\[!\[stick1](http://vooglaid.ee/red/stick1.gif)](http://vooglaid.ee/red/stick1.gif)

BeardPower

[14:43](#msg5be2fa12c0e6da07feebf5eb)@toomasv So this is THE stick to poke things with :smile:

toomasv

[14:43](#msg5be2fa27d001b9172022b938)It is!

BeardPower

[14:44](#msg5be2fa6abb88787474908a0f)Nice experiments :+1: Is it snapping to the center of the circles?

toomasv

[14:45](#msg5be2fa884e7ca145206b2564)Nope. You have to drive the other end EXACTLY on the point.

BeardPower

[14:45](#msg5be2faa59600d10e64723831)Pixel exact?

toomasv

[14:46](#msg5be2faae62866f747360e77b)Oui

BeardPower

[14:46](#msg5be2fac462866f747360e819)When Appstore? ;-)

toomasv

[14:48](#msg5be2fb3c92b7d11721508b97)My personal \[appstore](https://gist.github.com/toomasv/d687889418ebb3c21c03e1745bbbb47f)

ne1uno

[14:48](#msg5be2fb5262866f747360ec22)stick based gui testing?

toomasv

[14:49](#msg5be2fb623102f1452164818a):smile\_cat:

BeardPower

[14:58](#msg5be2fdab2138723405cd2557)Next: beating a dead horse ;-)

## Monday 12nd November, 2018

greggirwin

[21:07](#msg5be9eb84f1b8753404b74d15)I sense a game...

## Tuesday 13th November, 2018

BeardPower

[09:57](#msg5bea9ffcbb06d73a99685175)@greggirwin The game title "The Stick of Truth" is already taken, unfortunately.

greggirwin

[14:50](#msg5beae4a462866f747391a3fd)`Divining Rod`?

## Friday 16th November, 2018

9214

[16:11](#msg5beeec3780e46b4266bf9faf)Here's my first draft of \[memoization](https://github.com/9214/whatnot/blob/master/red/memoize.red). It doesn't handle `'quoted` arguments well, raises a couple of design questions (order of refinements in function call, treating series arguments with `same?` comparator), but overall seems quite robust (although I haven't check anything much).

```
inspect: func [function][
    probe new-line/skip 
        get in context? first select body-of :function 'any 'memory
        on 2
]

factorial: memoize func [n][
    if n <= 1 [return n]
    n * factorial n - 1
]
```

```
>> factorial 10
3628800
== 3628800
>> inspect :factorial
[
    [1] 1 
    [2] 2 
    [3] 6 
    [4] 24 
    [5] 120 
    [6] 720 
    [7] 5040 
    [8] 40320 
    [9] 362880 
    [10] 3628800
]
```

Will appreciate any stress-testing :)

greggirwin

[17:14](#msg5beefae8f9993b42671cecef)Very cool. :+1:

## Monday 26th November, 2018

geekyi

[09:03](#msg5bfbb6c8ed6bcf1ef860c055)Hi all!

rebolek

[09:06](#msg5bfbb7a5baf43f2b9b767f29)Hi @geekyi

geekyi

[09:14](#msg5bfbb958fa7bbb3fe006f205)@rebolek Have to catchup with all the cool stuff you guys have done!

rebolek

[09:38](#msg5bfbbf13a115c91ef794e79b)@geekyi Cool! If you have any questions, feel free to ask!

9214

[15:08](#msg5bfc0c6ad24f9324d257cc89)Hey @geekyi, glad to see you again.

## Tuesday 27th November, 2018

greggirwin

[17:42](#msg5bfd81f4ed6bcf1ef86c8dc0)Indeed!

## Thursday 29th November, 2018

gltewalt

[02:19](#msg5bff4cc8ced7003fe1a0ad17)Biggest downfall of gitter... no stickers

[02:21](#msg5bff4d287d26db1e8310e47c)@geekyi Were you off working at that company that was using Rebol?

## Monday 3th December, 2018

geekyi

[21:41](#msg5c05a30e9aec405095c0d9f1)@gltewalt no, had changed tact and been using R for some time.

## Monday 10th December, 2018

toomasv

[12:59](#msg5c0e632d178d7860a1b43572)AoC Day 10 Viz:  
\[!\[d10](http://vooglaid.ee/red/day10.gif)](http://vooglaid.ee/red/day10.gif)

rebolek

[12:59](#msg5c0e634c8d4f3a2a7c9cd8a1):)

## Wednesday 12nd December, 2018

toomasv

[21:22](#msg5c117c068b656e2b0404f045)AoC Day 12  
\[!\[day12](http://vooglaid.ee/red/day12.gif)](http://vooglaid.ee/red/day12.gif)

greggirwin

[21:32](#msg5c117e6911bb5b2504a5af30)Go @toomasv, go!

## Thursday 20th December, 2018

toomasv

[15:03](#msg5c1baf4641637902415c6b91)AoC d20 maze:  
\[!\[maze](http://vooglaid.ee/red/maze.gif)](http://vooglaid.ee/red/maze.gif)

Phryxe

[15:24](#msg5c1bb4392a66862cc95c800d)Cool stuff :)

toomasv

[16:16](#msg5c1bc047f4043314193e9858):smile:

greggirwin

[17:47](#msg5c1bd5a24e0d6621ba23bc8d)@toomasv Woohoo!

[17:47](#msg5c1bd5cadab2222ab3c5903d)It's like a Zen river.

toomasv

[17:50](#msg5c1bd65341637902415d7384)It is zen er.. consciousness :innocent: (-lessness)

## Friday 21st December, 2018

dander

[16:34](#msg5c1d162293cce97d3b7819d3)mesmerizing. I watched the whole thing

## Saturday 22nd December, 2018

BeardPower

[00:52](#msg5c1d8ad98d31aa78b1db3b08)Nice!

gltewalt

[19:46](#msg5c1e94966649aa1f82b6477f)http://www.businessinsider.com/high-resolution-photo-lets-you-zoom-in-on-peoples-faces-2018-12

greggirwin

[20:53](#msg5c1ea42d5064a51f835f6ec6)We talked about doing something like that for iBEAM. Not quite at that scale, but that was because of cost. You pay for precision, but panning and stitching isn't rocket science.

[20:53](#msg5c1ea4453c4093612c48e433)And you can use zoom-tiling, like maps do.

[20:58](#msg5c1ea55b2863d8612b744499)Their demo pic and UI is really nice. I can't remember the project, but more than one of the big 3 were doing stuff with contributed pics, stitching and creating 3D simulations based on camera position projections. I don't see the use of images slowing down.
