# Archived messages from: [gitter.im/red/chit-chat](/gitter.im/red/chit-chat/) from year: 2019

## Tuesday 1st January, 2019

abdllhygt

[12:26](#msg5c2b5c6837975e7ca95838ea)@koba-yu thank you, i will text you if need help

## Monday 14th January, 2019

GiuseppeChillemi

[21:23](#msg5c3cfdb9cb47ec3000437be5)22:50 here, I am coding in RED while playing "Steve Miller Band - Abracadabra" \[Abracadabra](https://www.youtube.com/watch?v=7QyoRzZrF00) just to share this moment of 80s joy with you

endo64

[21:39](#msg5c3d01968318994524ed34c4)Nice :)

greggirwin

[22:06](#msg5c3d07c895e17b4525506e20):^)

## Tuesday 15th January, 2019

rebolek

[14:00](#msg5c3de7910721b912a583b1f3)Crash testing our new hardware http://umru.cz/mox-crash.gif

Oldes

[16:11](#msg5c3e061a39596c372be70e78)And the result is?

rebolek

[16:13](#msg5c3e069ef780a1521f14f1e1)Just few scratches, everything can be put back together and the device works. Just like Nokia 3310.

Ungaretti

[16:22](#msg5c3e08e195e17b452556f30b)I deeply respect your scientific approach.

rebolek

[16:46](#msg5c3e0e7d1cb70a372ae2b740)@Ungaretti :smile:

[17:07](#msg5c3e13581cb70a372ae2db40)

greggirwin

[19:43](#msg5c3e37e80721b912a5860ab2)@rebolek Wow! =8^@

rebolek

[19:54](#msg5c3e3a6120b78635b62b7498)Of course it runs Red :smile: (almost - see the musl debate in another room)

rcqls

[20:17](#msg5c3e3fc30999400604f7fb97)@rebolek I understand better that you want a rock solid small linux distribution inside this router with a lot of muscle (musl)!

rebolek

[20:24](#msg5c3e41678ce4bb25b8b8bb36):smile:

## Sunday 20th January, 2019

GiuseppeChillemi

[17:10](#msg5c44ab69c45b986d118fe47f)Is there any editor which is able to show a list of functions for each object and object list itself ?

## Monday 21st January, 2019

gltewalt

[00:09](#msg5c450dc81cb70a372a0ef782)Stashed note for later:

https://stackoverflow.com/questions/1761626/weighted-random-numbers

rebolek

[06:46](#msg5c456add35350772cf64e2df)@GiuseppeChillemi my \*Values* editor can do it.

## Tuesday 22nd January, 2019

greggirwin

[21:47](#msg5c478f5a0a491251e33bc8fe)@GiuseppeChillemi I have UltraEdit set up so it shows both objects and functions in its function list, but they are separate groups in the list. It doesn't show the object and the functions it contains together.

GiuseppeChillemi

[22:31](#msg5c4799b78318994524311819)@greggirwin I am using it, also I think I am using your wordfile too. The problem arise because I don't have the object they belong to near the functions, so I have to create function names with a suffix to remember the object they belong to.

greggirwin

[22:44](#msg5c479ce51cb70a372a1fc4e9)That's where I end up breaking things across files, to help organize. We're all anxious for Red-centric tools built in Red that will make this easier.

## Wednesday 23th January, 2019

GiuseppeChillemi

[08:19](#msg5c4823997a0f4d5b19f36c94)@greggirwin I have already many ideas but I have not the skill nor the time to implement them.

nedzadarek

[14:39](#msg5c487cb435350772cf790121)@GiuseppeChillemi It's good to at least try. If you know English good enough to understand written language then there are many, easy to understand, posts about lots of things.

GiuseppeChillemi

[20:20](#msg5c48cca80721b912a5c96030)@rebolek  
&gt; @GiuseppeChillemi my \*Values* editor can do it.

Where is it ?

dander

[21:41](#msg5c48df6c0721b912a5c9e1df)@GiuseppeChillemi https://gitlab.com/rebolek/values

## Thursday 24th January, 2019

rebolek

[07:57](#msg5c496fe435350772cf7f37e3)thanks @dander

## Wednesday 30th January, 2019

Oldes

[21:18](#msg5c5214c378e1ed4103b6bb00)Something for \_old-schoolers\_: https://github.com/steffest/BassoonTracker

BeardPower

[21:20](#msg5c5215327b68f94102455f26)&gt; Something for \_old-schoolers\_: https://github.com/steffest/BassoonTracker

When released for/ported to Red? ;-)

[21:45](#msg5c521ae193fe7d5ac018afed)

```
audio//
```

where are you? :-)

## Thursday 31st January, 2019

rebolek

[12:57](#msg5c52f0c078e1ed4103bc2c5c)Right, where is `audio://` ? I've ported my PM-101 synth to Red and would like to hear it :)

Phryxe

[13:15](#msg5c52f4dc54f21a71a1d686be)I've now seen images of PM-101 in Rebol. What does it look like in Red?

rebolek

[13:19](#msg5c52f5daceb5a2264f6f295e)@Phryxe right now it's just a bunch of functions that run in console.

Phryxe

[13:26](#msg5c52f7741b62f126507ca43c)@rebolek :metal:

rebolek

[13:31](#msg5c52f8c27b68f941024b3b4e)I've separated individual modules better and I'd like to add some dialect for connecting modules. Adding GUI on top of it would be nice, but is non-essential now.

BeardPower

[21:48](#msg5c536d121b62f12650801195)@rebolek We still need to discuss on

```
audio://
```

.

[21:49](#msg5c536d81f04ef00644bb858b)There is a plethora of audio APIs on each supported platform, so we need to choose wisely.

rebolek

[21:50](#msg5c536d9341775971a0b7004c)Asynchronous, multi-device, sample-precise.

[21:50](#msg5c536da8ceb5a2264f728f1d)Yes, but there are some OS standards.

BeardPower

[21:50](#msg5c536dbe54f21a71a1d9ecb9)That would mean using the core APIs.

rebolek

[21:51](#msg5c536dc713a2814df6fbe681)Like with GUI.

BeardPower

[21:51](#msg5c536dcd93fe7d5ac021c0b3)Yes.

rebolek

[21:52](#msg5c536e08454aad4df7d44814)There may be specialized services for graphics/audio, but the core Red should stick to OS-level stuff.

BeardPower

[21:52](#msg5c536e2fceb5a2264f729213)E.g. Windows offers a lot of audio APIs. From raw to core to middleware-like.

[21:54](#msg5c536eac454aad4df7d44e06)macOS/iOS/Android lack what some Windows API is offering, so we would need to implement features in Red / Red/System to offer the same level of features.

rebolek

[21:55](#msg5c536eb5c2dba5382ebd7f34)OK, what I think is important is to be able to send bytes at exact time to any device available and to be able to read bytes from any device. And having MIDI r/w available would be nice bonus that's actually much simpler than audio.

BeardPower

[21:56](#msg5c536f21975714406b7391a8)This is supported by every API. The thing is, that Windows supports great effect and DSP APIs which other OSs are lacking. So do we offer just the basic stuff or advanced stuff as well? Just offer it on Windows?

[21:57](#msg5c536f4a78e1ed4103bfad64)I wanted to buy a new keyboard so I need MIDI as well ;-)

rebolek

[21:57](#msg5c536f5d975714406b739398)Basic stuff. DSP can be added later in Draw-like manner. HW accelerated where supported and CPU-done, where not.

BeardPower

[21:58](#msg5c536f7f454aad4df7d45360)Where should we discuss on audio? Telegram?

rebolek

[21:58](#msg5c536f8dca428b06453411c9)I don't know :)

BeardPower

[21:58](#msg5c536f9f9221b9382df40593)And who is going to be part of the "team"?

[21:59](#msg5c536fc21b62f1265080251f)There was some nice DSL made by some member here, but can't remember who it was.

rebolek

[21:59](#msg5c536fc78aa5ca5abf639214)For DSP stuff, having FFT in-build would be nice. But that would require 2D vectors or matrices.

BeardPower

[22:00](#msg5c536fef454aad4df7d4567f)FTT/IFFT is a must-have.

[22:00](#msg5c537019ca428b06453413ef)We have a lot of work todo :-)

greggirwin

[22:01](#msg5c5370211b62f126508027b3)I thought we had an audio group, but it seems not. Should we do that, or make it audio-video?

BeardPower

[22:01](#msg5c537042454aad4df7d45a06)@greggirwin We discussed about it prior to the token sale (IIRC) but never follow through.

rebolek

[22:01](#msg5c53704454f21a71a1d9fb27)@greggirwin separate groups, please.

nedzadarek

[22:01](#msg5c53704d9221b9382df40a48)http://chuck.cs.princeton.edu/release/

BeardPower

[22:01](#msg5c53705113a2814df6fbf98e)I agree.

[22:03](#msg5c5370b41b62f12650802ab9)@nedzadarek Thanks. Yes, chuck is nice but there was a DSL for REBOL (IIRC).

rebolek

[22:03](#msg5c5370cfc2dba5382ebd8d85)@greggirwin there is audio group according to \[stats](https://rebolek.com/stats)

BeardPower

[22:04](#msg5c5370f313a2814df6fbfd0b)Ah, you mean on gitter? I thought you are refferring to telegram.

greggirwin

[22:04](#msg5c5370f313a2814df6fbfd0d)Just posted there. Gitter wasn't showing it. https://gitter.im/red/audio

nedzadarek

[22:05](#msg5c53710e454aad4df7d45f27)@BeardPower I mean the Chuck could handle all low level stuffs as fair I can see.

[22:05](#msg5c53711778e1ed4103bfbb13)DSL could use it.

BeardPower

[22:05](#msg5c537128975714406b73a0f8)Ah, yeah. The DSL was mad by @Oldes.

[22:06](#msg5c537156f04ef00644bb9d37)@nedzadarek Sure, but remember: no dependencies ;-)

nedzadarek

[22:09](#msg5c537215c2dba5382ebd98a5)@BeardPower so someone has to do it from 0?

BeardPower

[22:10](#msg5c53725678e1ed4103bfc3a2)@nedzadarek Yes.

## Friday 1st February, 2019

maximvl

[09:30](#msg5c5411a3c2dba5382ec183d5)check this out

[09:30](#msg5c5411a413a2814df6fff3c2)http://fizzygum.org/

gltewalt

[10:09](#msg5c541ac4f04ef00644bfa8b4)Coffeescript?

BeardPower

[14:11](#msg5c5453adceb5a2264f7846eb)I have to say it again: Oberon.

nedzadarek

[14:34](#msg5c5458fc7b68f94102545c7b)@BeardPower Few questions about it:  
\- Is it actively maintained?  
\- Does it have same/similar capabilities as fizzygum (e.g. visualisation)?  
\- Does it run on major operating systems: Windows, MacOs, Linux?  
\- 32 and/or 64 bit?  
\- in the fizzygum's website I can read that I do not need programming (at least for simpler tasks) - how about the Oberon?

[14:35](#msg5c5459291b62f1265085fe07)@gltewalt in the Coffeescript they have changed a syntax and some things to be (subjectively) more user friendly. The Coffeescript to the Javascript is like the Elixir to the Erlang.  
The p5.js would be better to mention.

gltewalt

[14:45](#msg5c545b6e975714406b797f03)Oberon?

BeardPower

[14:56](#msg5c545e10ca428b06453a19e6)@nedzadarek  
\* Yes  
\* Yes  
\* No. It's a Operating System itself.  
\* 32- and 64-bit  
\* No programming

[14:56](#msg5c545e147b68f94102547e3b)@gltewalt https://en.wikipedia.org/wiki/Oberon\_(operating\_system) https://en.wikipedia.org/wiki/Bluebottle\_OS

[15:10](#msg5c54618241775971a0bd240e)But Oberon (the development system) will run on the major OS.

[15:12](#msg5c5461f5975714406b79b0ea)Everything is a hyperlink.

[15:14](#msg5c54624e54f21a71a1e00815)E.g. if you write compile.this -&gt; this will be a hyperlink. If you click it, it will compile your program. Every keyword you type is a hyperlink, showing you the documentation, API, web-search, files, whatever you want through pie-menus or so called "inter-clicks". Those clicks can be double-clicks, triple-clicks, left+right, double-click left + one-click right would do X and so on. You can add any content everywhere you like. E.g. inserting an image in your source-code or even an mp3 player.

[15:17](#msg5c546314c2dba5382ec3c583)It's UI is called TUI (text user interface) and it also has a zoming UI. https://en.wikipedia.org/wiki/Zooming\_user\_interface

[15:22](#msg5c5464279221b9382dfa2cb4)https://zircleui.github.io/docs/

[15:27](#msg5c546553454aad4df7da756a)http://josephernest.github.io/bigpicture.js/bigpicture.html

[15:27](#msg5c54657ac2dba5382ec3d31c)Red/OS will use a zooming UI ;-)

nedzadarek

[15:43](#msg5c546924f04ef00644c1ba0f)@BeardPower BigPicture -&gt; nice!  
I have checked the OS and I can find only version from 2005. The newest website does not work.

BeardPower

[15:45](#msg5c54699a54f21a71a1e03e28)@nedzadarek Yes. It's pretty "old" but they still work on it.

[15:45](#msg5c5469a19221b9382dfa5292)They have a new one.

[15:45](#msg5c5469b013a2814df60242d4)http://www.barrelfish.org/

[15:48](#msg5c546a3041775971a0bd6556)Here you can see the hyperlink stuff and so on: https://www.youtube.com/watch?v=Pe0ZdzO\_urU

[15:48](#msg5c546a4a8aa5ca5abf69df88)http://www.radiar.ch/c/index.html

[15:56](#msg5c546c3c78e1ed4103c5f332)https://www.youtube.com/watch?v=UTIJaKO0iqU

nedzadarek

[16:06](#msg5c546e88ca428b06453a8cad)&gt; Yes. It's pretty "old" but they still work on it.

It does not mean it is good (not that it is bad).

&gt; http://www.barrelfish.org/

And compile on your own... well, thank you.

It looks interesting - the RedOS will take the influence and work on most common devices... then It would be nice. I prefer the Red/Rebol's syntax and "plug and play" motto (well, not motto, but you can download executable and just run scripts - no complex installation needed).

BeardPower

[19:41](#msg5c54a0dc1b62f12650881415)@nedzadarek It's great once you get the hang of it.

[19:41](#msg5c54a0f0f04ef00644c34754)@nedzadarek Compiling your own means you are in control.

moliad

[19:42](#msg5c54a11c1b62f1265088154a)(until it doen't compile ;-)

BeardPower

[19:42](#msg5c54a1261b62f12650881559)Hehe.

[19:42](#msg5c54a13393fe7d5ac029919f)True that.

rebolek

[20:38](#msg5c54ae56ca428b06453c5843)You are in control even if it does not compile :) You just need to fix your bugs...

greggirwin

[22:39](#msg5c54ca9493fe7d5ac02aa385)Oberon was a great OS, but needs a refresh. We can do that, first as an app. :^)

@maximvl FizzyGum must have come up before, as I remember seeing it. There's a catch, though. Do you all notice? http://fizzygum.org/docs/saving/ And, as an OS...it's not. An OS doesn't imply word processing, presentation, or graphs. But that's OK, because the idea of interactive software is long overdue for success.

nedzadarek

[23:24](#msg5c54d54a975714406b7ce5eb)@greggirwin  
&gt; The Fizzygum team hence decided to withhold this functionality from public until we can package an open turn-key solution that minimises misuse and sub-par experiences.

So it's not that bad...unless the planned feature will be bad.

greggirwin

[23:28](#msg5c54d61d54f21a71a1e323ed)How well do browsers usually do when it comes to storage?

nedzadarek

[23:33](#msg5c54d72cf04ef00644c4b5ea)@BeardPower  
&gt; @nedzadarek Compiling your own means you are in control.

No. To be in control you need to know used software. In such cases uses a compiler A, with a download manager B (to download libraries) to download 10+ libraries.  
And I have to know all above to program in something potentially very different.  
The last, good surprise was compiling the Red from the Rebol.

[23:33](#msg5c54d75f41775971a0c056db)@rebolek  
&gt; You are in control even if it does not compile :) You just need to fix your bugs...

It's not my bugs.

[23:37](#msg5c54d82078e1ed4103c8eeea)@greggirwin I don't know.

greggirwin

[23:41](#msg5c54d912c2dba5382ec6eefe)@nedzadarek it was a trick question. They don't. If they could, there would be a lot of risk. They only have their own local storage, and can't interact with your OS's file system like a desktop app.

## Saturday 2nd February, 2019

gltewalt

[00:41](#msg5c54e735454aad4df7ddfea3)Are you sure? Node can interact with file system.

dander

[01:05](#msg5c54ecddca428b06453de371)@greggirwin there is this "writable files" \[draft spec](https://wicg.github.io/writable-files/) which my gut tells me is a terrible idea...

BeardPower

[02:55](#msg5c550697c2dba5382ec802e1)@nedzadarek How is knowing the software to be in control? Compiler A installs a trojan, download manager B installs malware.

[02:58](#msg5c55073e454aad4df7deae23)I can look into the source and check if they do such things. I can decide/control how stuff get's compiled, downloaded and linked.

[02:58](#msg5c550759c2dba5382ec805ed)100% control of everything every time.

nedzadarek

[20:31](#msg5c55fe1741775971a0c7b960)@BeardPower  
You can have source but it is compiled by another language/program (as you said trojans, malwares etc).  
So even if you have sources of everything it is not feasible to read everything... at least not for "average Joe".

[20:37](#msg5c55ff898aa5ca5abf7413dc)@greggirwin something like \[c9](https://aws.amazon.com/cloud9/?origin=c9io) (I haven't been using it for a long time so something might changed) seems fine:  
\- install different programming language compilers/repl  
\- have different text files

So if they support their own set of files I think it's feasible.

BeardPower

[21:50](#msg5c5610a913a2814df60d0bac)@nedzadarek The point is that you can. If you don't do it you know whom to blame. You also have source code access to the compiler.

[21:53](#msg5c56114bf04ef00644cc6742)It's always better to have an option compared to have none.

[21:53](#msg5c561164f46373406a41f049)There is no excuse if you are too lazy.

gltewalt

[21:54](#msg5c5611801b62f1265091290c)Where do old languages go?  
Why didn’t Lisp or Smalltalk take over?  
Why do people like stuffy, bureaucratic, “forms filled out in triplicate” languages like Java?

[21:55](#msg5c5611d28aa5ca5abf748bad)Government red tape languages

BeardPower

[21:55](#msg5c5611e2975714406b849d08)Anyway, I'm not here to convince people to take the option instead of the black box being shoved down their throat.

gltewalt

[21:57](#msg5c561237454aad4df7e54865)You have to be able to understand all of the sources

hiiamboris

[22:36](#msg5c561b5e93fe7d5ac032d00f)&gt; Where do old languages go?  
&gt; Why didn’t Lisp or Smalltalk take over?  
&gt; Why do people like stuffy, bureaucratic, “forms filled out in triplicate” languages like Java?

It's a general principle. Humanity as a system inhibits it's own technological adaptation. Otherwise we would have had a global civil war that would put an end to all technology for good.

nedzadarek

[23:05](#msg5c56222bf04ef00644cccd64)@BeardPower Nobody is lazy if s/he doesn't want to read millions (if not more, I don't know) of lines of code in a few potentially different languages.  
I want to amaze people, do something that helps people and learn something new.. not waste time on things that I won't use.

[23:06](#msg5c562286454aad4df7e5ad0f)&gt; black box being shoved down their throat

What is "shoved" is just complexity... it's almost like "black box" if you don't have time.

BeardPower

[23:11](#msg5c56238b975714406b850ce4)@nedzadarek A person is lazy if not willing to put time into something which is advantages to it.

[23:12](#msg5c5623fb1b62f12650919d45)Providing source code has the potential to amaze people. To help them learn something new. I don't get why reading source code would be wasting time. It's learning.

nedzadarek

[23:14](#msg5c562458f04ef00644ccdc5d)@gltewalt old language could:  
\- evolve - e.g. C  
\- combine into new language - e.g. the Ruby took objects from Smalltalk

Everything is connected.

BeardPower

[23:15](#msg5c56248278e1ed4103d0f287)Complexity of what? Just because you don't have time to spend it on it does not render it a black-box. Complexity is not shoved down but the black-box is.

nedzadarek

[23:30](#msg5c562813ca428b064545c782)@BeardPower  
&gt; A person is lazy if not willing to put time into something which is advantages to for it.

No, creating something new (or learn something new) might have more advantages. So s/he \*\*might\** be smart.

&gt; Providing source code has the potential to amaze people. To help them learn something new. I don't get why reading source code would be wasting time. It's learning.

Learning but what? How X people structure their code? Language's quirks? Sure, you learn something new but I prefer to read 10 articles about different topic than read it in a one, "messy" (messy as you don't know what, how etc) code.

&gt; Complexity of what? Just because you don't have time to spend it on it does not render it a black-box. Complexity is not shoved down but the black-box is.

That's why I said \*\*almost\*\*. It's not something you can read and understand in 1 day. The result is the same for people that want to avoid reading long source.

BeardPower

[23:34](#msg5c562902975714406b8532e8)@nedzadarek Doing something advantages is creating/learning something new. Every change is because of something new. You don't have to be smart to create something new. Programming is just craftsmanship.

[23:37](#msg5c5629b854f21a71a1eb4053)Yes, you learn programming by reading other's people code. Even an article can be messy and maybe you don't know what the article is all about. If you are able to read and understand something in a day is a personal thing. Some are able to others are not.

[23:40](#msg5c562a73f04ef00644ccfe2b)That's the difference: the result differs based on what they do. You have no other choice with a black-box. If you don't read the code it's the same outcome but you have the possibility to read the code. That's the big difference. You have an option.

[23:41](#msg5c562aa6f04ef00644ccff4d)Take the blue pill vs. Take the blue or the red pill.

## Sunday 3th February, 2019

greggirwin

[01:11](#msg5c563fbb975714406b85b166)@nedzadarek, I haven't used C9. There are pros and cons to cloud-based IDEs. Just as with any app that doesn't have an offline mode.

nedzadarek

[16:16](#msg5c5713f641775971a0ce6452)&gt; @nedzadarek Doing something advantages is creating/learning something new. Every change is because of something new. You don't have to be smart to create something new. Programming is just craftsmanship.

I mean smart as in "choice better source of knowledge". You can read implementation of the Voronoi diagram but an article can show you much more in much quicker time.

&gt; Yes, you learn programming by reading other's people code.

Yes, and you learn certain styles (defined by programming language and person that writes a code). It's nice to have another point of view.

&gt; Even an article can be messy and maybe you don't know what the article is all about.

But I would rather waste time reading 10 pages than hundreds/thousands pages of "potentially alien code".

&gt; If you are able to read and understand something in a day is a personal thing. Some are able to others are not.

One day was just an example. You can get a gist about a topic when you have read an article. Reading whole source is more time consuming and even you read it, it doesn't even mean that you will get a main idea.

&gt;That's the big difference. You have an option.

What's the point of an option (for "average Joe") if you cannot take advantage of it? I have tried and learned many things but I haven't bothered with reading the source because it was at least few times bigger than "a thing" I want to learn.

## Tuesday 5th February, 2019

Phryxe

[07:37](#msg5c593d45f46373406a562f1b)Haven't been able to use Red for 11 days now because F-secure is blocking/deleting the exe :thumbsdown:

rebolek

[07:38](#msg5c593d7054f21a71a1feeb6c)@Phryxe have you reported it to F-secure? Is there some option in F-secure to ignore the exe?

Phryxe

[07:39](#msg5c593dcc9221b9382d191480)Yes, reported several times. They say it has been whitelisted, but it's still blocked :angry:

rebolek

[07:40](#msg5c593de754f21a71a1feef96):(

Phryxe

[07:40](#msg5c593e019221b9382d191578)I don't think I can set it to ignore the exe.

toomasv

[08:13](#msg5c5945b878e1ed4103e499c9)@Phryxe In my version there is "Tools" section on main window of F-Secure, where you can access "Quarantine and exclusions". I have excluded Red catalogue and all Red-related quarantined files there, and don't have currently any problems.

Phryxe

[09:13](#msg5c5953b8ceb5a2264f987b97)@toomasv OK, thanks, I'll check that at home. I don't have access to the setting at work.

[12:38](#msg5c5983d413a2814df622f9f5)The latest executable differs than the ones we had previously whitelisted. The latest executable is not harmful, and our security products have been updated to rate the file as clean, which should be automatically reflected through F-Secure's Security Cloud (otherwise known as ORSP).

To prevent a recurrence, we recommend that any executable files should be digitally signed with Authenticode (using at least SHA-256 encryption). By doing so, we can use the signing key to identify your software and automatically fix any future false positive that may inadvertently occur.

Should the developers decide to sign their software, please directly send us two or three signed files so that we can take the necessary steps.

More information can be found here:

http://msdn.microsoft.com/en-us/library/ms537359%28VS.85%29.aspx  
http://msdn.microsoft.com/en-us/library/ms537364%28VS.85%29.aspx  
http://www.tech-pro.net/code-signing-for-developers.html

Below is the list of Certificate Authorities (CA) that can provide Authenticode certificates:  
http://www.verisign.com/code-signing/content-signing-certificates/microsoft-authenticode/index.html

[12:40](#msg5c59844af04ef00644e28b67)- - - - - - - - - - Above sent from F-secure

## Monday 11st February, 2019

moliad

[21:39](#msg5c61eb87126af75deb8d2c34)hi guys, anyone got Red to compile directly from Pine64 ARM boards?

[21:40](#msg5c61ebc14003460b2d348213)I got the rebol to start, but I get xwindows issues, even though X is installed.

[21:40](#msg5c61ebdb4003460b2d348242)(32 bit libs) I've gotten linux to work very well on i386

[21:41](#msg5c61ec0bdc3f0523cc9ba884)maybe there are extra things to setup on ARM?

[21:41](#msg5c61ec1d126af75deb8d2e7a)when I try to run from the desktop (still on ARM), I get a segfault.

[21:42](#msg5c61ec2e8328315decda70e0)I don't know how to debug the root problem... a bit stuck at this point.

[21:43](#msg5c61ec6f8328315decda734e)the rebol\_core version seems to work, but it misses a lot of required features for me, like .so support and more...

[21:50](#msg5c61ee2cadf6cb0b2ca140c6)(using linux ubuntu 16LTS with MATE desktop)

rebolek

[21:52](#msg5c61ee91ecef85660b8c53e3)@moliad I believe Red is untested on ARM and may not work. I have problems on some ARM boards, while it's working on others.

moliad

[22:04](#msg5c61f18616e468225998a9d1)does Bo come around here often?

greggirwin

[22:12](#msg5c61f33aecef85660b8c7965)Bo isn't on here much.

## Friday 15th February, 2019

Oldes

[14:41](#msg5c66cfa05095f6660cfbeb90)Interesting reading: https://motherboard.vice.com/amp/en\_us/article/43zak3/the-internet-was-built-on-the-free-labor-of-open-source-developers-is-that-sustainable

BeardPower

[15:32](#msg5c66dbaaadf6cb0b2cc3daa2)Amen!

9214

[22:24](#msg5c673c034bafd97ca3fbbfa8)@moliad And how do you specify how each node responds to events? With a dialect? Can it describe / generate a group of nodes (subgraphs)?

moliad

[22:25](#msg5c673c68253c2b5ea31c89e0)liquid views nodes as an atomic entity. conceptually they are as atomic as word! values. though they are smart and spread messages a bit like the reactor system in Red

[22:26](#msg5c673c9f7502282258f1159f)nodes are first order values, so you can model, create, and store them.

[22:27](#msg5c673ce8dc3f0523ccc1380e)creating graphs can be done manually like you'd create things in a rebol script, or you can build dialects, which will represent a graph, and do all the manual labor for you (just like VID)

9214

[22:28](#msg5c673cfcecef85660bb19371)So you just have certain types of atomic nodes, but how do you specify in what direction they should propagate an event? Reminds me of CSP a bit.

moliad

[22:28](#msg5c673d005095f6660cff0444)liquid has a protoype dialect called fluid which is not too bad.

[22:29](#msg5c673d2eadf6cb0b2cc69717)its a directed graph, and the concept is to see everything as a dependency. so you know on what data you, as a node, depend and you are concerned with nothing else.

[22:29](#msg5c673d4d4003460b2d59cb1e)by linking up nodes together, you end up with a functional graph.

[22:29](#msg5c673d625095f6660cff06ff)and the implementation itself, has lots of advanced features.

[22:30](#msg5c673d8e126af75debb2740c)lazyness is achieved by caching data while dependencies have not changed.

hiiamboris

[22:31](#msg5c673dc316e4682259ad0bd2)is this reactivity system synchronous or async like in Red?

moliad

[22:32](#msg5c673dfc16e4682259ad0e18)is Red's system really async?

[22:32](#msg5c673e17dc3f0523ccc1415f)(the refresh of the ui is... but the actual internal system is a push engine... no?)

[22:33](#msg5c673e2b126af75debb279a5)(liquid is 100% async)

hiiamboris

[22:33](#msg5c673e2c253c2b5ea31c95e9)well it's sort of mixed. It's async when you change something from within a running reaction, but sync outside of reactors code

[22:34](#msg5c673e8b253c2b5ea31c995b)I've had an example somewhere, sec

[22:42](#msg5c67405780df6804a1b03ef7)found it

```
reactor: func [spec] [make reactor! spec]

f: does [
	prin "START..."
	loop 10 [a/x: 1 + a/x]
	print "FINISH"
]
a: reactor [x: 0 n: is [[0] x n + 1]]
b: reactor [x: 0]
? a/n
react/later [
	b/x
	f
]
react/later [print ["a/x =" a/x "a/n =" a/n]]
b/x: 1
f
```

[22:42](#msg5c6740654003460b2d59e1a0)

```
START...FINISH
a/x = 10 a/n = 0
a/x = 10 a/n = 1
START...a/x = 11 a/n = 2
a/x = 11 a/n = 2
a/x = 12 a/n = 3
a/x = 12 a/n = 3
a/x = 13 a/n = 4
a/x = 13 a/n = 4
a/x = 14 a/n = 5
a/x = 14 a/n = 5
a/x = 15 a/n = 6
a/x = 15 a/n = 6
a/x = 16 a/n = 7
a/x = 16 a/n = 7
a/x = 17 a/n = 8
a/x = 17 a/n = 8
a/x = 18 a/n = 9
a/x = 18 a/n = 9
a/x = 19 a/n = 10
a/x = 19 a/n = 10
a/x = 20 a/n = 11
a/x = 20 a/n = 11
FINISH
```

[22:43](#msg5c67409dd1e3093ab529bbff)in the end: `b/x` triggers a reaction in async mode, `f` triggers it in sync mode

[22:44](#msg5c6740b64003460b2d59e3ce)`a/x` is just a watched value, `a/n` counts how much changes it detected on `a/x`

[22:47](#msg5c6741705095f6660cff21c4)@moliad wanted to ask smth else...  
I'm in the making of a Red reactivity visualizer app. I plan to have a few table representations in it, but also at least 2 graph representations seem useful. I wonder if I could (and if it's worth to) borrow some parts of that graph editor's code for the GUI? Not that it'll take me long to make a simple version for my needs, just exploring a possibility...

## Saturday 16th February, 2019

greggirwin

[18:09](#msg5c6851f74003460b2d606d81)@Oldes, thanks for that FOSS link. Great read and links to other good resources for us to learn from. Much appreciated.

## Monday 18th February, 2019

moliad

[12:18](#msg5c6aa27880df6804a1c4f41b)@hiiamboris it currently isn't in a state to be shared... I woudn't have time to explain all the details.

hiiamboris

[13:38](#msg5c6ab53f253c2b5ea331e41f)okay, no problem :)

## Wednesday 13th March, 2019

GiuseppeChillemi

[22:15](#msg5c8980f2bf7990126e9b461a)Coming back from work after a stressfull day and after an our programming in RED and REBOL I feel relaxed and ready to sleep. I would go MAD using any other language if I would try to code with it after 19 hours asleep !

greggirwin

[23:46](#msg5c89965bf895944c088e398f):+1: I think many of us feel that way.

## Friday 15th March, 2019

BeardPower

[14:58](#msg5c8bbd7a1314c277618de2d1)Which way do you guys prefer naming your words?

```
pixel-position, string-length, inner-count
```

or

```
position-pixel, length-string, count-inner
```

[14:58](#msg5c8bbdb01314c277618de4e9)Object-Property or Property-Object.

rebolek

[15:01](#msg5c8bbe631314c277618deabf)first choice. See http://rebol.com/docs/core23/rebolcore-5.html#section-5.2

dander

[17:39](#msg5c8be36ff8066c18ce52f418)Definitely the first versions. The second set of examples seem like they are totally different things to me. `position-pixel` and `count-inner` in particular sound like actions to take "position the pixel", "count the inner things"

greggirwin

[18:30](#msg5c8bef2aa28d73296cf15e16)I agree with @rebolek and @dander.

BeardPower

[19:29](#msg5c8bfd0a4844137f83357465)@dander That's a valid point. In Objective-C it would be more clear: positionThePixelAt ;-)

[19:30](#msg5c8bfd524844137f8335780e)I'm using the former myself.

9214

[20:07](#msg5c8c06113dd8171149f89565)@BeardPower why not just `position`, `length`, `count`?

## Saturday 16th March, 2019

BeardPower

[10:33](#msg5c8cd0f98126720abcf011d0)@9214 Because there are multiple positions, lengths and counts.

9214

[10:36](#msg5c8cd1c952c7a91455a36c14)@BeardPower can't this information be inferred from a context?

BeardPower

[10:39](#msg5c8cd26b52c7a91455a3701b)@9214 Yes, but sometimes you have different lengths in the same context. But you are right, you can come up with better wording. I'm just used to it because of the camelCase languages.

[10:41](#msg5c8cd2d29d9cc8114accb7e2)Like startPosition and endPosition. Just use start and end.

9214

[10:41](#msg5c8cd2e2a21ce51a206c9928)

```
text
>> sin? 'camelCase
== true
```

BeardPower

[10:42](#msg5c8cd308ec203c59b7abf597)But then you have a timer in the same context. The starting time is call what? begin?

PeterWAWood

[10:43](#msg5c8cd34b49fdaa0d81c341c9)`starting-time` seems pretty obvious.

BeardPower

[10:44](#msg5c8cd3990d71905057139656)Absolutely.

PeterWAWood

[10:44](#msg5c8cd39bf3dbbd230c65a8ee)Though many people would shorten it to `start-time`

BeardPower

[10:45](#msg5c8cd3d48126720abcf02638)Why use start-time but not pixel-position?

PeterWAWood

[10:50](#msg5c8cd4eb9d9cc8114accc632)Because, as @9214 suggested, the `position` is usually inferred by the context. However, if you were handling colours of individual pixels, it would seem to make sense to me to use `pixel-pos` and `pixel-colour`.

[10:53](#msg5c8cd5bd2f6ded0abbf092bd)As for the choice between, `pixel-position` and `position-pixel`. To me, the first suggests a co-ordinate value, the second suggests a function value. Similarly for `inner-count` and `count-inner`.

[10:56](#msg5c8cd66b6a3d2e230dd317b4)As for camelCase:

```
>> good? lisp-style-names
== true
```

BeardPower

[16:55](#msg5c8d2a85ec203c59b7ae1fbe)Thanks for all the valuable input!

## Sunday 17th March, 2019

GiuseppeChillemi

[16:47](#msg5c8e7a1e2f6ded0abbfae053)I am experiencing a stange issue: when I create a code which runs without problems at first or second attempt, I start it a few times because I don't believe in it. Does this happen to you too ? :-)

toomasv

[17:37](#msg5c8e85de49fdaa0d81cdfc13)I have this issue very rarely, because I seldom manage to write it correctly on first few tries. :-(

nedzadarek

[18:12](#msg5c8e8e082fb6800d8036921a)@PeterWAWood  
I'm used to OOP so the `pixel-position` looks like a `pixel/position` (where `pixel` is a map, an object or something like this). Is the `position` (or the `pixel-position`) a function or some value? I don't know. What matters for me it gives me some kind of value (in this case I would expect `pair!`).  
@BeardPower  
&gt; Because there are multiple positions, lengths and counts.

Can't you group related words into an object / a map / a block?

[18:20](#msg5c8e9001ec203c59b7b6d93b)@GiuseppeChillemi yes, I had many problems with locality when I have been using `func`. Now I use `function` in "more serious" codes. It cover more cases automatically than normal `func`.  
Except this I had rarely such problems. If it runs once it should run more times.

## Monday 18th March, 2019

BeardPower

[19:33](#msg5c8ff28f49fdaa0d81d77413)@nedzadarek Sure. I was reading on naming conventions so I was interested in other's naming.

topcheese

[20:24](#msg5c8ffe6ad0133e21e5d73ec8)So what are the plans for Red and OpenXR support? https://www.roadtovr.com/openxr-0-9-provisional-release-microsoft-oculus-collabora-implementations/

nedzadarek

[20:49](#msg5c9004666a3d2e230de74e1d)@BeardPower pd. I sometimes use the Hungarian notation `https://en.wikipedia.org/wiki/Naming_conventions_(programming\)#Hungarian_notation` for parse's rules (no path syntax allowed there) but I don't find it very good.

## Tuesday 19th March, 2019

rebolek

[20:33](#msg5c91522cdfc69a1454bfd21a)Gee, always making problems... ;)

```
*** Syntax Error: invalid character in: "9214"
```

nedzadarek

[20:54](#msg5c9156eda21ce51a208a19c1)@rebolek what's wrong with 9214 ?

rebolek

[21:02](#msg5c9158e7fcaf7b5f73e00626)can't be loaded as word :)

nedzadarek

[21:04](#msg5c91597a8126720abc0dbea1)@rebolek ah :D

## Wednesday 20th March, 2019

greggirwin

[01:02](#msg5c91911a8126720abc0f1acc)@topcheese no plans for VR at this time. Though I saw that Dirac has a number of open positions while looking at audio stuff. Red could be a good fit, as they use Qt for UI it seems.

topcheese

[12:55](#msg5c9238318aa66959b63fca21)Thanks Gregg! I know this might be a sore subject, but there was a brief discussion on deployment and installation methods. What ever happened to Rebol IOS, and could/would that be a possibility? Is that possibly one of the "warts" nobody wants to talk about? I just don't get it because it seemed so promising.

pekr

[14:43](#msg5c92519e0d719050573772a1)Rebol/IOS was later replace by Rebol/Services - not as a product, but as a messaging "protocol". It never took off though. Rebol/IOS itself, was not part of open-sourcing Rebol 3 though. It is still a property of Rebol Technologies and I doubt it would get released or ported to Red, if that was the question?

greggirwin

[16:56](#msg5c9270b88126720abc14f869)Rebol/IOS was not for public deployment of apps, but for internal, corporate use. I still have a server running it. It was great, but not a money-maker for RT. That, along with AltMe, were more things ahead of their time. Look at how similar many chat systems are to AltMe today, but bloated in comparison. And compared to SharePoint, Groove, etc., IOS was a breeze. Both were simple, and not perfect, to be sure, but they got a lot of things right.

topcheese

[22:35](#msg5c92c015dfc69a1454c9adfb)I saw on the Internet where some of you had to reassure people that Red/Rebol had commercial level applications, but most of them don't seem really visible. I was just shocked that there were so many fine examples of applications, and how advanced they are. The WebApp thing never became a real standard, and now "they" want to run the App in the cloud. I guess keeping a couple of aces up the sleeve is a good thing, and you've been gambling on it, so I'm not the one to try and come in and school you. I think it's good to know such things exists. Thanks for the info!

[22:36](#msg5c92c080fcaf7b5f73e97110)You know they also have the Friend network? https://friendup.cloud/

[22:43](#msg5c92c21b3dd8171149245f7d)And I don't want to offend anyone, but I think you just might be slacking. Perhaps it should have been open-sourced. It just seems another missed opportunity.

PeterWAWood

[23:54](#msg5c92d2b15547f774483ac92f)@topcheese You seem to be misunderstanding the relationship between Red and Rebol. Red is very heavily influenced by Rebol but has been developed completely separately. Red is open-source and the copyright is owned by Red Foundation, a non-profit organisation. Rebol, AltME, IOS are all products of Rebol Technologies Inc, a for profit organisation.

Nobody involved in the Red project has any influence over the decisions or work of Rebol Technologies.

Your comment about slacking is inappropriate and unwarranted.

## Thursday 21st March, 2019

topcheese

[12:58](#msg5c938a762fb6800d80582d57)@PeterWAWood, What's unwarranted are the extra sensitive developers that seem to want to drive people away from the project. I can start to see why it's not so popular. Some of you just can't seem to take criticism. You all seem poised and ready to jump on every word.

[13:03](#msg5c938b97d0133e21e5ef3242)I didn't misunderstand anything. I made an observation, and I'm sorry if it wasn't the praise you were looking for.

9214

[13:57](#msg5c93983ffa5b721a1fc74407)1. Y'all slacking because you haven't opensourced project X over which you never ever had any control or stackeholding. I didn't misunderstand anything. I made an observation.  
1\. Y'all overly sensitive because you have a natural defensive reaction to the above nonsensical claim.  
1\. Such tendency to defend project and its developers scares off potential community members from healthy and proactive collaboration.  
1\. Project Y is unpopular because of the above. You are extremely poor at handling my fair criticism and managing expectations about my (completely unasked for) praise.

So far so good.

topcheese

[15:57](#msg5c93b4778aa66959b649e80d)@9214 Thank you that about sums it up. Instead of actually trying to figure out what I was trying to say, it seems you'd rather spend the time trying to twist my words. I understand that you'd rather not listen to what everybody has to say about your project. I see all of these other technologies out in the mainstream, then I happen to stumble upon Red ... well at least now I get to learn first-hand why it remains some obscure language. The whole open-source thing is a sticky subject, but instead of having a healthy dialog on it I get criticized. I can already see how this going to turn out looking for help in this community. Thanks I wish you all the best!

pekr

[16:17](#msg5c93b9238126720abc1d9aa6)You've just got bad impression about Red's community by just talking to some Red reps ....

[16:20](#msg5c93b9cd52c7a91455d13c5d)What you might actually miss is, that some of RT's products (IOS, AltME, R2) were not part of the open sourcing process. There were some rumours, that it might be also related to some former investors involvement. It was pure decision of RT and the community, nor the Red team, could just do anything about it. Those products were closed source, so there was really no chance, of how to carry on the torch. And you can bet, that some of us, tried to talk to RT about open-sourcing even those other products ....

9214

[16:34](#msg5c93bd248aa66959b64a2a2a)@topcheese

&gt; you'd rather spend the time trying to twist my words

I merely made an observation :wink:

Insulting and lashing out on people for no good reason doesn't really influence a healthy dialog, so as questioning project's open-source ethics. Even if your remark was addressed at Rebol Technologies and Carl (who isn't in this room) - I believe he had his reasons for keeping IOS closed, in which you can't possibly have any insights, since you aren't a historical old-timer. And, again, none of the people presented here had any influence on RT and its business processes - I've got an impression that you blame us for this, and apologise if I got it all wrong. In my defense, I'd say that your message didn't provide enough context to interpret it non-ambigiously, and even raised Peter's hackles up.

I'd rather listen to constructive criticism and fair, apples-to-apples comarison, accompanied with suggestions and possible improvements. "You are uber-sensitive slackers and Red has warts because it's still in development" doesn't really point out the ways we can improve and get better, don't you think?

greggirwin

[16:47](#msg5c93c014d0133e21e5f0a9a8)Let me step in, and see if we can clear up any misunderstandings.

&gt; I think you just might be slacking. Perhaps it should have been open-sourced.

@topcheese \*who* was slacking (maybe), and \*what* should have been open-sourced?

Can we be sensitive when someone says we might be slacking? You bet. When you work your tail off and someone implies that's not enough, it's easy to take it personally. I hope this is a misunderstanding we can work through.

## Friday 22nd March, 2019

topcheese

[16:21](#msg5c950b99a21ce51a20a33428)@greggirwin I'm afraid I can't work through this. It's not any reflection on you or any of the other good people on here who work so hard to help build a community. I'm just shocked that after praising many of you in a different thread, then the next thread I'm jumped on for calling them slackers. I got smacked down a couple of times for asking about what I guess is "proprietary/commercial" code in an open-source project.

If the experienced developers are already shooting down my questions and clowning me over them, then there's no future in this language for me without having to pay for it. I even said no offense, but some of you just had to go there.

Perhaps if it has a nice community around it when it hits 2.0 I may look at it again, but right now with the only real resources being here. So of you can't see any problems or "warts" in your alpha project.

I really do wish you all the success with it. I just don't see this project as being that open. I'll find a project where they won't mind my silly questions.

moliad

[16:28](#msg5c950d1249fdaa0d81fa678a)@nedzadarek I read your comment about using hungarian notation for PARSE. we use a word decoration based mechanism, which is only possible in Rebol . basically we decide on a distinctive word decoration and apply to all words used for a specific purpose. For example, any word which is wrapped in a set of '=' is a parse rule. so when you look at a large block, you immediately see what is a PATTERN, what is a variable or a parse statement. we also standardized on using a prefix '.' for any PARSE managed variable. lets see this in action:

[16:29](#msg5c950d515547f7744849f0a0)

```
[copy .digits some =digit=]    

; as opposed to
[copy digits some digit]
```

[16:33](#msg5c950e6352c7a91455da85ea)scale this up to a single rule which ends up being broken up in to 100 sub rules and 5000 lines of code, and it makes it a hell of a lot easier to determine what is going on. also when running the code within a paren, you can separate `.value` from `value` one being the parsed value and the other the actual value you want to extract or process in your function or object.  
it allows easy to understand things like: `[copy .digits some =digit=] (digits: to-integer .digits)` much easier to see, since it's obvious the `.digits` was the matched text.

obviously I used extra ambiguous word names in the example above, but sometimes, its exactly like this (especially when doing NLP or dataset parsing and extraction).

[16:41](#msg5c95103f6a3d2e230d09a2cd)now the actual decoration specification is highly subjective in taste and style but I sense you get the idea... I've used many unorthodox characters like `& + ~` in the past for disambiguation of word usage in many different contexts... parsing, xml transformation, EDI message handling, etc.

nedzadarek

[16:45](#msg5c951135dfc69a1454d9985a)@moliad I think @lepinekong\_twitter might be using similar naming system.  
I have been writing smaller codes (up to few hundreds LOC) so my more verbose `_rule` was ok. I want to use such system but I don't know which symbols to use. There is a problem with infix vs prefix vs outfix notations as well.  
I had to check what is possible, natural and easy to use.

moliad

[16:47](#msg5c9511bf8126720abc26d83e)and, as hungarian notation shows, you can join different meanings. one thing I do for many of the charset based parse patterns is build a list of rules for any charset pattern (let's say we takle the newline and call it eol ... `=newline= =newline?= =newlines= =newlines?= =not-newline= =not-newline?= =not-newlines= =not-newlines?= !new-line!` this last rule is a standardized decoration for a look-ahead assertion that there is new-line, without consuming it.

[16:48](#msg5c9511e86a3d2e230d09af5e)now this is not a standard hungarian notation, but its a spiritual equivalent.

[16:49](#msg5c95122349fdaa0d81fa8e11)I like the `=word=` because it looks like a label on a jar. :smile:

pekr

[17:01](#msg5c9514ef8126720abc26edca)@topcheese - What's so difficult to understand upon my explanation for e.g.? Have you ever tried to negotiate with Rebol Technologies? I am Rebol community veteran (not a good coder) and I acutally do remember the background to many situations. So once again - there was no possibility for this community or any other individual I know of, to get the sources of R2, IOS and AltME RT's proprietary products. There were some investors obligations. The only thing being open-sourced was the semi-finished R3.

9214

[17:26](#msg5c951ad38126720abc27158e)As for "why Red picked closed-sourced R2 as a bootstrapping language instead of open-sourced R3?" - I believe both @pekr and @greggirwin can elaborate on that at length.

[17:31](#msg5c951bfb9d9cc8114a03fecd)&gt; I'm just shocked that after praising many of you in a different thread, then the next thread I'm jumped on for calling them slackers

And I'm shocked that even after 3 different people explained to you why your assertion is wrong, you still bend that line of reasoning and escalate unnecessary drama.

[17:39](#msg5c951dc2f3dbbd230c9cf0b1)Are we slackers? "Yes", at times, just like anyone else, but "No" when it comes to Red - personally, I dedicate all my spare time and effort to Red, to the degree that I got into trouble with my master's degree program.

Does Red has warts (whatever definition of "wart" is in your point of view)? Yes, and we are very well aware of it, more than anyone else.

Did you give any logical justification for calling us slackers? No, not even after people have called you out on it. Have you listed "warts" of the project in detail, so we can sit and talk over them? No, you've just made a general claim about Red being an alpha software and somewhat obscure language - which doesn't tell me anything new.

greggirwin

[18:07](#msg5c95247dfcaf7b5f73f985ff)@topcheese sorry to see you go. Chat and email communication can be difficult at times.

[18:14](#msg5c9525f28aa66959b653afc1)@moliad my naming convention for parse-related vars, which Nenad doesn't care for, is to add `=` to the end of words for rules, because it looks a bit like BNF production rule syntax, and to add `=` to the beginning of values set by `parse`, because it mirrors the rule...rule and then also mimics set-word/get-word syntax.

Rules and conventions are most helpful in larger systems and when multiple developers work on code. Something to consider for PitL projects, but probably won't be in official Red code.

moliad

[18:31](#msg5c9529ed2fb6800d8063b784)@greggirwin you and I usually agree on these things in principle. (and not so much with Nenad ;-) one thing I hope for Red is for it to grow beyond only the Red team's vision. being open source it actually can. I hope there will be serious spin off projects which can contribute to extending Red's original mission, while sharing the same core and collaborating back on some level.

[18:33](#msg5c952a80fcaf7b5f73f9b563)if you look at Python it has a few of these and they benefit all python coders since people who use a language and add a new arm to it also use the core language and promote it.

greggirwin

[18:36](#msg5c952b288aa66959b653d4fb)Us old timers have overlapping agreements in various areas. :^) I think that comes from our varying backgrounds and, ultimately, makes Red better (if we can work through our differences).

nedzadarek

[21:04](#msg5c954de03dd8171149359e4e)@moliad  
&gt; I hope there will be serious spin off projects which can contribute to extending Red's original mission, while sharing the same core and collaborating back on some level.

I think it's easy to to contribute on a \*mezzazine level\*. Red/System and/or lower level stuffs are more complex. I'm afraid only very dedicated people can afford it.

## Saturday 23th March, 2019

topcheese

[01:34](#msg5c958d180d719050574d5341)@pekr Yes I do get it and in hindsight it does seem a poor choice of words. I didn't mean anything personal, but I can see how you would take it personally. I can see that Red has a great community, but that the problem was me. I guess I just don't understand the "politics" of Open-Source, as if the rest of the industry isn't grappling with the same issues.

I'll just sum it up. I run into an article about Rebol IOS, and then I find a landing page for it here. http://www.rebol.com/ios/ios-intro.html . After that I find an empty repo where it says "Examples might be the source code to Rebol/IOS and its apps, etc." I get the might be in case some of you want to try and jump on that for any reason.https://github.com/rebol/projects

With that being said I've used some platforms in the past that claimed to be the first Internet type cloud OS. I even dropped a link to one that you can play with today complete with apps, but let's be clear that I believe Red could/would run circles around them. I've always been able to play with the actual SOURCE with all of those projects, except for with Red/Rebol I'm told to go "negotiate with Rebol Technologies" for those features.

I don't think I'm the one missing the point, although I may have been a little insensitive to others myself. I need to apologize if you felt I was talking to you about something outside your control. It's unfortunate they were for whatever reason unable to release it, but I guess fortunately you can recreate all of it in Red. That seems a fair deal and no argument there. I think Ol Ben Kanobi said it best! "Use the source Luke!"

I think you have a winner so I understand you not agreeing with my opinion. I just think something's wrong with it, so I'm moving on where I'll be able to learn much more quickly by being able to use plenty of for .. uh er source. Seeing that this project is in alpha is also a factor. I really should be bringing "source" code to the project at this stage instead of asking, so as I said at the beginning I understand where some of you are coming from.

I just hope I can come across without any of you feeling like I'm making you out to be a villain. I think that I would just get in the way at this point and stage in the project ... more like a disturbance in the "source" Luke. hahaha

Seriously though case in point, but I thank each and every one of you for reaching out to me. I do understand how I may have offended some people, but it wasn't intentional.  
~Peace!

greggirwin

[04:39](#msg5c95b879dfc69a1454ddccb0)@topcheese, believe me, or us, when I say that we all wish Rebol had been open source from the beginning. However, it may never have come to fruition if that had been the case. So R2 will always be closed, but man it's great. R3 forked in a few ways, and Carl hoped others would carry it forward by making in open source. Open source is hard, and Red went on its own, using Rebol's most important design elements, but none of its open source code base, intentionally, as it was written in C and Red is intended to self host, so there are no outside dependencies. Until then, we do still use R2 as our one dependency.

pekr

[06:13](#msg5c95ce8a8aa66959b657eb6b)@topcheese as for me, no need to apologize, myself, I was not offended, just felt pitty for the missunderstanding. As for RT, I might put you into more prespective - RT, back then, in 1996, was the company of let's say 6 employees, investors involved (R1 times). But, later on, R2 times, it was mostly a one man show. And if you would know Carl, you would know, that it was not easy to get him organised, pushed him to anything, etc. And several ppl or even the whole community was several times burned by aproach RT took, in terms of the communication and efforts.

IOS - I myself was a customer. It costed 2K USD. The averages salary here in CZ was something like 800 USD back then, or even less. I wanted to push it on the Czech market. Asked RT to translate it, but they refused to provide me with the sources even if I offered them to sign an NDA. Robert Munch tried to create IOS 2.0, called it x-peers. But he was burned too, as RT stopped to communicate with him. While IOS was fantastci product, it had one bad impact though - during those times, R2 was left without a release for something like 18 months! It affected community badly imo and several ppl left Rebol ecosystem.

Dockimbel tried to bring in an open-source alterantive - R#. Once Carl found out, he asked him to stop and offered there would be R3. Hence the R3 project started. But - after 6 or so years, we were still far from beta. We have seen many distraction. E.g. Carl tried to create Rebol own ticketing system - took 3 months, then Carl went into his typical cave mode - usually 3 or more months, without a signle line of communication. Ditto for R3 communication protocol, ditto for R3/Services, ditto for web redo ... and years were passing by and R3 still could not do, what R2 was possible to do.

Once the situation lead to nowhere, Dockimbel decided to offer RT a help - to go into US and work on R3 directly. I don't remember exactly, if he even received any reply. So Doc started a Red project. Later on, Carl decided to open-source R3. The community asked for for open-sourcing of R2, IOS, AltME too. But RT's reply was pointing into some possible investors obligations, etc.

And maybe that's what could be felt as a bit offensive to us, as many of us just tried to do anything, to get our hands on those other Rebol related products. Red still uses R2 for the compilation process. And if there is some bug (mostly memory leaks) in R2, we can't do anything about fixing it, just trying to find some workarounds. Hence myself, I rellay look forward for the Red to become 1.0, to become self hosted.

As for Red itself - we all wish the progress would be faster. But as for the longevity of the project, it has to be financially backed. Some ppl can see ICO / blockchain stuff as a distraction, I can see it as an oportunity to catch some niche market. Ppl need to pay their bills, you know. Yes, sometimes I can feel, that Red staff / coworkers are a bit strict to ppl, there are some community rules, etc. I don't remember anything like it for 20 years being part of Rebol community. Imo good community and friends don't need any rules. But Rebol was special - many ppl, Amiga friends. And once you grow big, you actually do need some rules.

So, yes .... ~peace~ :-)

rcqls

[06:45](#msg5c95d5f0a21ce51a20a83169)@pekr Thanks for this really informative history about Rebol…

hiiamboris

[09:31](#msg5c95fcdd9d9cc8114a098435)Enlightening indeed! :+1:

pekr

[09:53](#msg5c960208a21ce51a20a949a9)Well, maybe there are still some remnants of my former Czech Amiga Review magazine behind-the-scenes coverings :-)

rebolek

[10:03](#msg5c9604788aa66959b6593654)@pekr I still have have some issues and I believe it's published online somewhere.

[10:09](#msg5c9605bc8126720abc2cd4f3)http://amigareview.amiga.sk/amiga-review-27/lava-rebol

BeardPower

[11:31](#msg5c9618fb49fdaa0d810127de)It's not that people don't want to contribute and work on getting Red 1.0 out ASAP. It's just that the day only has 24h and, as mentioned above, we all have to pay our bills. Once this issue is out of the way, contributors are willing and able to re-route their time (mostly spare-time) to projects like Red.

GiuseppeChillemi

[12:42](#msg5c9629b98126720abc2dba86)@respectech  
I am interested into your experience using REBOL to automate your company. What have you automated and in which way ?

greggirwin

[16:26](#msg5c965e49a21ce51a20ab904b)@pekr, good summary, thanks for posting that.

pekr

[18:40](#msg5c967d92f3dbbd230ca5e348)Well, actually it might not be accurate at some points. e.g. initially, RT was not a one-man show, during the R2 phase, but later on. As well as Doc's decision to stop R# was not related to R3, but the preceeding promisse of RT to bring in "language plugins", or something like that. But well, generally the context of my message stays :-)

moliad

[21:12](#msg5c96a1538126720abc30e4ed)I can chip in with R3 level history since I was directly involved in some ways behind the scenes.

[21:14](#msg5c96a1c8a21ce51a20ad50e4)R3 was funded by a group also behind blackberry investments. they want to replace the aging blackberry experience with a simple front-end which would be really easy to program for.

[21:15](#msg5c96a1faa21ce51a20ad51d5)Rebol was already designed like an OS, Carl from RT is/was a skilled OS engineer so it was a logical fit.

[21:16](#msg5c96a22efcaf7b5f7302f7e2)ultimately, it took too long, was not polished enough so it fishtailed.

[21:17](#msg5c96a25e8aa66959b65d314b)my part was in getting the WHOLE R3 opens sourced. before it was just an extension system.

rebolek

[21:20](#msg5c96a31cd0133e21e503c791)Interesting. R3 was announced in ~2006 and finally open sourced and abandoned in ~2013, some 6-7 years later.

moliad

[21:20](#msg5c96a33b5547f7744854398c) I got to realize that some of my contacts, where aware of Carl (having met him long time ago) and where also working with the same investors. so after a few weeks/months by constant annoyance I indirectly accelerated the process by getting people to get to speak together which ultimately led the investors from allowing Carl to go full open source.

[21:21](#msg5c96a349a21ce51a20ad5a88)it probably would have happened eventually, but not as quickly.

[21:22](#msg5c96a37bdfc69a1454e3b6d8)like I said, the process was already a possibility but I helped it go a bit quicker when it became inevitable.

rebolek

[21:24](#msg5c96a42adfc69a1454e3bb79)I see.

## Sunday 24th March, 2019

GiuseppeChillemi

[14:21](#msg5c97926edfc69a1454e96e36)@rebolek  
&gt;@BeardPower fragmentation is inevitable. That's why I'm working on my chart styles and you are working on your own, even if we could work together.

Fragmentation ? Enrichment, multiplication, diversification, increasing in the number of developers...

[16:19](#msg5c97ae0bd0133e21e50a3400)It seems Atronix changed REBOL3 graphics library with \[Skia](https://skia.org/)

BeardPower

[17:54](#msg5c97c44652c7a91455eb986e)@GiuseppeChillemi If developers can't agree on something projects will split. It's questionable if abandoning of a splitted project is adding to diversification.

greggirwin

[18:37](#msg5c97ce865547f774485b8291)Coming from red/gui-branch group. On FOSS, there are alternatives, but rarely used. You can have proprietary software with the ability to purchase or escrow the source code.

GiuseppeChillemi

[20:53](#msg5c97ee653dd817114945fd68)@BeardPower  
Closed source develpers leave the company without the possibility to apply their idea and later merge it to the original one. People which leave can't further improve the original or a similar project because they are often tied from non-compete clause.  
Open source developers will add a variant to the original project. The team split but the project doubles and enrich itself. Close source project developer won't find people which already know the source. Open source developer have plenty of people with valuable knoledge.  
It is important to not remain stuck to a negative view but find the value in what we have.

[21:02](#msg5c97f0673dd8171149460a33)@greggirwin Greg, yes, it is an apportunity. But when this happen it is costly and usually happen when the project is in a bad situation.  
Open source project are agile, could adapt, morph, evolve. A company can partecipate to it and a single developer could do the same. The project does not make difference if you are rich or you are poor. Being open means everyone could make the little change he needs and make project a better one. You don't have to wait for NDA, you don't need permission, the owners can't say "no we have no the time", no you can't sell a better module because we have a shitty one to make money form; you have not to wait years for the encrypted email to be fixed becaue the owner has abandoned it child and you are stuck and you can't do anything. You can pick the source up in the middle of the night and apply your idea.

[21:04](#msg5c97f0c98aa66959b66558ac)Also, instead of thinking about developers splitting I would like to see when developers join and contribute and our one man project becomes 2, tree, four, 10 men project ! And this usually happens without adding a cent form our pockets.

[21:05](#msg5c97f12b0d719050575c52e8)There are many business models which could be used while maintaining the source open. We have only to choose a good one.

## Monday 25th March, 2019

moliad

[02:30](#msg5c983d5a52c7a91455ee8d66)it is exceedingly hard to make money with an open source product. it's probably the reason most who are successful sell something else using their software or sell SaaS versions of their things in clouds or custom corporate installs.

[02:34](#msg5c983e260d719050575e291b)gitlab used to be 100 % opensource, license free. look at it today. The moment an open source project gets important Capital investment 10M+, it ceases to be free... and the "openness" often disappears entirely.

[02:34](#msg5c983e520d719050575e29e2)it is normal, there are bills to pay and investors to reimburse, so giving things away doesn't make any business sense anymore.

[02:39](#msg5c983f6749fdaa0d810ebd1c)if a project is not the core business of a company, it can easily remain open and free. most developer oriented tools fall into this category. Databases are somewhere in between, they often have one major corporate sponsor who relies on it, so it can remain mostly open and free. but actual end-user applications are very hard to leave open source cause the moment it starts getting costly,  
you just install one yourself.

pekr

[06:18](#msg5c9872bf52c7a91455efe29c)+1

BeardPower

[13:51](#msg5c98dccbfcaf7b5f7311459a)Don't forget to watch the Apple event today https://www.apple.com/apple-events/

rebolek

[13:53](#msg5c98dd5e3dd81711494bfd4b)10:00 AM? I've already missed that. :stuck\_out\_tongue\_winking\_eye:

BeardPower

[14:40](#msg5c98e8650d7190505762a4aa)@rebolek 10:00 AM PST

[14:41](#msg5c98e8ab9d9cc8114a1c4a3c)UTC -7:00

[14:42](#msg5c98e8d481b15c5e4b8465d2)I don't expect that you are currently in California.

rebolek

[14:44](#msg5c98e9519d9cc8114a1c4f92)No, I'm not, but they shouldn't expect everybody is, so they could include timezone on the page, it's just three letters.

BeardPower

[14:44](#msg5c98e964a21ce51a20bbf33d)Hey, this is Apple ;-)

[14:45](#msg5c98e9810d7190505762acf4)They provide a link "Add to your calendar".

rebolek

[14:45](#msg5c98e98a8126720abc3f818a)so, let me guess...it's less useful without TZ, but looks nicer?

BeardPower

[14:45](#msg5c98e9a42fb6800d807ba31a)No, they just use ics files.

[14:46](#msg5c98e9be6a3d2e230d223212)Those will be converted to your local time.

[14:46](#msg5c98e9db0d7190505762ae65)And it also has all the details: Live from the Steve Jobs Theater in Cupertino.

[14:46](#msg5c98e9e36a3d2e230d2232cd)in Cupertino!

[14:47](#msg5c98ea138126720abc3f886a)If the TZ is left out it means local time.

GiuseppeChillemi

[15:38](#msg5c98f5f28126720abc3fe3b5)@moliad  
Max between a 10M+ fund for a project and a develper without money to pay his bill there is a group of users sending him from 10 to 100 euro each months, or more. Also there could be paid development, sponsorship, patrons and a lot more.  
I am learning to not thing black and white but with color degrees in the middle.

[15:42](#msg5c98f6d5d0133e21e512c121)Here are few notes

https://itsfoss.com/open-source-funding-platforms/  
https://gitfund.io/tav/gitfund  
https://opensource.guide/getting-paid/

But the develper can start with a simple paypal or patron account.

[15:43](#msg5c98f7305547f77448632ebc)A last wikipedia article on business models:

https://en.wikipedia.org/wiki/Business\_models\_for\_open-source\_software

Oldes

[16:28](#msg5c99019a49fdaa0d81141027)@GiuseppeChillemi I'm a little bit lost... what is point of this debate?

GiuseppeChillemi

[16:47](#msg5c99062ca21ce51a20bcc934)@BeardPower is considering the source for his charting code. I told him that as company I prefer adopting open solutions and his project could benefit too from openess. BeardPower think that a developer could not live of open source coding and I have argumented in the opposite direction. I have then ended up writing some business models and foundations for open source software.

[17:59](#msg5c99170cd0133e21e513aa29)Ops ... \*Beard power is considering the licence for his charting code.

Oldes

[17:59](#msg5c99170da21ce51a20bd44eb)Hm... actually I understand @BeardPower. I could not be working on open source projects if I would not be paid from paid (closed source) projects. If you know someone who lives just from making open source, than good for him, but I think that there will not be living many such individuals.

GiuseppeChillemi

[18:01](#msg5c9917626a3d2e230d239180)I agree. No one could live for free but a programmer could adopt a viable business model for open source software.

Oldes

[18:03](#msg5c9917db0d7190505763f9dd)Btw.. I like @pekr 's history sum-up. I would just add that if my rusting mind is not wrong... Carl considered to keep closed Rebol and him still be active (in the way how he was active - sometimes coming out of cave), or open sourcing Rebol with the price, that he will vanish, what actually happened.

GiuseppeChillemi

[18:05](#msg5c99186c49fdaa0d8114b9d1)@Oldes Closed source is the wrong way for a company: open source a costant flow of money is the way to go.

Oldes

[18:06](#msg5c9918c00d7190505763ff69)That is true, but the thing is, that you must be first big enough to have the constant flow.

GiuseppeChillemi

[18:07](#msg5c9918c92fb6800d807d0f4a)1000 supporters giving 5 euro each month and you have 5.000 each 31st.

[18:08](#msg5c99191af3dbbd230cb6ace1)A good marketing strategy will help.

Oldes

[18:10](#msg5c9919a40d7190505764040b)I'm not good marketer and I'm sure it is not easy.. who has 1000 supporters which will pay you 5 bucks every month for charting code?

GiuseppeChillemi

[18:12](#msg5c991a293dd81711494dc2d7)I am not talking specifically about BeardPower code....

[18:13](#msg5c991a588aa66959b66d561c).... but If I would establish my work using his project, I would share not 5EUR but part of my monthly income.

greggirwin

[18:13](#msg5c991a623dd81711494dc54a)@GiuseppeChillemi we have to find new ways to make it work. FOSS has proven to be a failure as making money for those who build it.

[18:14](#msg5c991a82f3dbbd230cb6b4ad)We all wish your plan would work, but it doesn't.

GiuseppeChillemi

[18:14](#msg5c991a93a21ce51a20bd5f26)@greggirwin have been searched the reasons for the failures ?

greggirwin

[18:16](#msg5c991ae8f3dbbd230cb6b73f)Yes, many articles have been written about it through the years. But the basic reasons are really easy to understand. Almost nobody will pay for something if they don't have to, and if others can exploit free work (users and corporations), they will.

GiuseppeChillemi

[18:16](#msg5c991b0b9d9cc8114a1db7e0)Maybe a one time payment has been adopted when the "supporter" model with repeating payment should be the right one.

greggirwin

[18:17](#msg5c991b2fdfc69a1454f3f3af)And FOSS creators burn out, because you need to feel valued, and if most people just take your work, giving nothing back, it's very hard psychologically.

GiuseppeChillemi

[18:18](#msg5c991b7ffcaf7b5f73131088)I can understand it because you feel like giving without receiving and it is mentally stressfull.

[18:21](#msg5c991c3cfcaf7b5f7313153c)But don't forget there are a lot of other marketing levers that could be used.

[18:23](#msg5c991ca86a3d2e230d23b346)As company I would pay to remain free from closed source solutions.

greggirwin

[18:23](#msg5c991cb63dd81711494dd791)Every variant has been tried through the years, and it just doesn't work. Blockchain offers a possibility, but that's also very new, and impossible to say if that part of our plan will work out. Beyond that, it has to be a commercial approach. Believe me, we \*really* wish it would work for FOSS to be sustainable.

I admire your optimism, but if you think we haven't put a huge amount of time and effort intro looking for ways to make it work, you are wrong. Just wanting it to be so isn't enough.

GiuseppeChillemi

[18:24](#msg5c991ce849fdaa0d8114d718)I am not a blind optimist, I have ideas. It is different.

[18:24](#msg5c991cfaf3dbbd230cb6c766)If one would not work I would modify it or try another one.

[18:25](#msg5c991d2d49fdaa0d8114d8f1)Even evil ones...

greggirwin

[18:26](#msg5c991d608aa66959b66d6c44)Then please do. Set up a FOSS support system of some kind for Red. We're happy for all the help we can get.

GiuseppeChillemi

[18:27](#msg5c991d8ed0133e21e513dd56)Like inserting a clause where if you want to use my open source product you have to register this in the board of adopters together with your donation to support freedom.

[18:29](#msg5c991e1a8126720abc41043f)Oh, yes, I would see how "BIGCOMPANY &lt;name&gt;" would adopt your software and have his name as "NOT DONATING ADOPTER" in the board.

[18:30](#msg5c991e53f3dbbd230cb6d4d2)]:-]

greggirwin

[18:31](#msg5c991e888126720abc410801)Now you're entering GPL territory, and you end up fighting legal battles with companies that have money, power, and lawyers.

GiuseppeChillemi

[18:32](#msg5c991eb049fdaa0d8114e2be)GPL has lawyers too....

[18:32](#msg5c991ed68126720abc410b36)GPL with chart. yes, thats an idea.

[18:33](#msg5c991eea81b15c5e4b85f152)I am liking it and it is modifying in my mind.

[18:34](#msg5c991f1fdfc69a1454f40fc4)Also I have some other.

[18:35](#msg5c991f5b3dd81711494de54b)@greggirwin  
&gt; Then please do. Set up a FOSS support system of some kind for Red. We're happy for all the help we can get.

We could talk about it when the shitstorm in my company and life will be less intense.

greggirwin

[18:35](#msg5c991f7081b15c5e4b85f624)Again, you are free to support Red (without changing legal terms of course) and we appreciate it. Let us know how it goes. But please know that we are making the best choices we can, and will put our own resources into the best options we find.

GiuseppeChillemi

[18:36](#msg5c991fb2dfc69a1454f41610)@greggirwin I know you are doing the best and you have alread got some good funding results.

[18:37](#msg5c991fd60d71905057642e61)I will come back on this topic later when I'll be more free.

BeardPower

[18:56](#msg5c99245c8126720abc4132bc)@rebolek Apple knows how to sell their stuff...

[18:57](#msg5c992499dfc69a1454f43bc6)How much do you think will Apple's CC made out of titanium cost? ;-)

[19:03](#msg5c9926020d71905057645b92)@GiuseppeChillemi Sorry to wake you up from this dream but as @greggirwin already stated: it does not work!  
There are a lot of licenses (GPL, BSD, MIT). Some where people need to share their code where others allow you to take the code without giving anything back.  
Do you really think that big companies give a damn about taking your code and using it without a license/payment? Good luck with spending your money on 10years+ legal battles. If a developers sells his app, the company has to buy it. Of course they can RE the code, but it's harder and more time-consuming to do than just buying the damn app.  
There might be a few people donating to your project but it's very hard to get to those numbers of yours. The current generation expects everything to be free (developers have to use ads and IAP to get something out of it). No one likes to do that but it became a necessity to make a living.

[19:03](#msg5c992614f3dbbd230cb7139c)But please, show me how it can be done!

rebolek

[19:04](#msg5c99263fd0133e21e5142318)re: open source. I work for a company that does do not only open source software, but also open source hardware. But that's because it's main source of income is being CZ domain registry and they can afford it. Also some companies like Comcast or Cloudflare pay for support for open source software made by us.

BeardPower

[19:04](#msg5c99265a6a3d2e230d23f113)Look at some examples. E.g. Haiku or even Wikipedia. They struggle with money every single year.

[19:06](#msg5c992699d0133e21e5142664)Millions if not billions of people use Wikipedia. Why do they struggle so much? Because it does not work! If something is free, the majority of the people will use the free tier.

rebolek

[19:24](#msg5c992ad052c7a91455f5375e)@BeardPower  
&gt; Apple knows how to sell their stuff...

True. People outside of California timezone can't afford it anyway.

BeardPower

[20:00](#msg5c99335f9d9cc8114a1e6297)@rebolek We will get there!

rebolek

[21:08](#msg5c9943390d71905057653a70)&gt; How much do you think will Apple's CC made out of titanium cost? ;-)

Kidney and firstborn and my eternal soul I guess.

nedzadarek

[21:29](#msg5c99482fd0133e21e515113c)&gt; Do you really think that big companies give a damn about taking your code and using it without a license/payment? Good luck with spending your money on 10years+ legal battles

That's depressing.

GiuseppeChillemi

[21:39](#msg5c994aa381b15c5e4b87345f)@BeardPower I have written there are different marketing levers. As developer you do not need to write everything for free. You could also improve "on demand"; you could create something close for a company that recognize you for the open one. Also you can support your product and be paid for this. There are a lot of side activities could araise from your product. The company @rebolek is working for makes open hardware too and, well, if I use their project and I need an improved version of it, then I would not develop it by myself but ask the develper and pay for this.

[21:41](#msg5c994af68aa66959b66ec187)So, while the main project is not directly funded it is indirectly paid from the related activities.

## Tuesday 26th March, 2019

moliad

[03:43](#msg5c999fed2fb6800d80807b37)which is an example of what I wrote above where some companies will want to share the cost of development tools since its not their core business. but if the tools ARE your core business, its much harder to force users to pay you.

[03:44](#msg5c99a01e0d7190505767a10e)and by force, I mean it in a soft way... it could be donations, sponsored development and such.

[03:45](#msg5c99a04d8aa66959b670ce85)which is why most companies now do what is called OpenCore. there are different approaches to it, but this is probably the direction Red is taking.

[03:46](#msg5c99a07ca21ce51a20c0dceb)provide the core tech for free and provide more advanced or time saving features for a price which complement the core offer.

[03:47](#msg5c99a0e5d0133e21e5174601)(faster modules, direct support, server-side modules, enterprise features which are not part of the core, paid hosting, Roadmap alignment, etc.)

[03:49](#msg5c99a16149fdaa0d81184d89)offering hosted SaaS versions of their tools is one way many currently compete with their Open Source offerings. even MS is going that route with the FOSS .net Core. they hope you will host your stuff on Azure, since you have all the back-end tightly integrated in the .net environment.

[03:50](#msg5c99a172a21ce51a20c0e16a)Mongo DB, I've read is doing the same.

[05:15](#msg5c99b5552fb6800d8080f9da)hi all, I am currently working on a much improved function spec dialect. its been brewing in my head for years but now its in the process of being implemented.

[05:15](#msg5c99b57f8126720abc44ff93)here is a snippet of it in use

```
funcs [
	"test funcs"
	a [
		dir! ; a user defined pseudo-type, which has to pass an identity function verification
		string! [some ["a" | "b"]] ; block after a type is a parser
		issue! (a: to-file a) ; paren after a type is executed 
	] "test args" ; standard doc string.
	b [
		integer! 
		string! (integer? attempt [b: to-integer b]); expressions must return truthy value
	]
	c [integer! float!] (c > 4) "blah" ; expression is valid for both types.
][
	?? a
	?? b
	?? c
]
```

[05:16](#msg5c99b5ba6a3d2e230d278ce8)do you guys have any extra ideas?

[05:20](#msg5c99b6958126720abc45053b)I've already got the parser all done, I properly identify all the tokens in the above. just wondering if I've forgotten something glaring that I could add to the system while I've got my hands dirty. :smirk:

[05:24](#msg5c99b79c2fb6800d808103fb)note that I've got the pseudo type engine already finished. it can already be used to define user types for a few things like parse rules `parse data [some mytype!]` , and stuff like `mytype?` , `to-mytype`as well as being useable directly within the `'FUNCS` function builder above

[05:27](#msg5c99b845a21ce51a20c176f8)the above is a quite heavy example which shows all the functionality, but it will be used more like in the following:

```
funcs [
    data [block! [some [integer! | float]]]
][
    counter: 0
    foreach value data [ add counter value]
]
```

[05:28](#msg5c99b89249fdaa0d8118e6ac)you can see how it dramatically increases readability of input validation.

[05:29](#msg5c99b8d62fb6800d80810c0f)if we give the function a block with anything else than `integer!` or `float!` values inside it will raise an error about inputs being wrong, before even starting the loop. also note that in this case we do not accept empty blocks!

[05:31](#msg5c99b9248126720abc45148e)btw, all of this will be released in one to two weeks.

rebolek

[06:25](#msg5c99c5d6dfc69a1454f84d8a)@moliad default values for locals, `url!` for detailed documentation

9214

[06:34](#msg5c99c7e03dd8171149520633)@rebolek your function and refinements are set-oriented (intersection, exclusion), and `/skip` implies some sort of "spatiality", as if you work with series and need to skip N elements.

[06:34](#msg5c99c7ed81b15c5e4b8a5243)So it doesn't fit very well either.

rebolek

[06:35](#msg5c99c81c2fb6800d80817866)Then `/omit` is still the best choice.

moliad

[06:46](#msg5c99caccf3dbbd230cbb3d84)@rebolek url! for doc is a great idea!  
default values are a bit tricky, they are part of my plan, but not totally sure yet how to fit them with the rest. `funcs` is a local by default builder, like `function` in Red. maybe if I add `set-word!` values in the spec (it seems like a natural fit for refinement args) it would make sense

rebolek

[06:47](#msg5c99cb189d9cc8114a222a07)@moliad yes, `set-word!` makes sense. `/local a b: 5 c`

moliad

[06:48](#msg5c99cb4dfcaf7b5f73177c54)`/refinement a: 5 [integer!] b: "default"`

rebolek

[06:49](#msg5c99cb7849fdaa0d811962f4)I've been thinking about better function specs for some time too, current dialect is great, but can be improved in may areas I believe http://red.qyz.cz/dependent-types.html

moliad

[06:51](#msg5c99cc0e6a3d2e230d281fd9)yep, just add `paren` around those examples and you've got the same idea

rebolek

[06:52](#msg5c99cc27fcaf7b5f73178189)`paren!`makes more sense, right

9214

[06:52](#msg5c99cc3adfc69a1454f877b1)@moliad soft/hard quoted arguments (`'word` and `:word` respectively), integration with dialects (e.g. I'd like function's body to be evaluated with `math`), some support for logging and tracing.

moliad

[06:53](#msg5c99cc7f5547f7744868cb3e)logging and tracing management, as well as simple form of profiling are already integrated into the engine.

[06:54](#msg5c99ccb3a21ce51a20c1ff81)@9214 soft/hard quoted arguments ... can you elaborate, not sure I 'get' it

9214

[06:56](#msg5c99cd335547f7744868d0a1)@moliad about profiling: some built-in optimizations (like e.g. memoization, I made a \[crude prototype](https://github.com/9214/whatnot/blob/master/red/memoize.red) some time ago), some big-O heuristics, memory consumption, etc.

moliad

[06:57](#msg5c99cd4781b15c5e4b8a7695)I'll be back tomorrow guys, continue with the ideas... I'll compile all of them tomorrow.

9214

[06:57](#msg5c99cd68a21ce51a20c20432)&gt; can you elaborate, not sure I 'get' it

```
>> foo: func ['soft :hard][]
== func ['soft :hard][]
```

rebolek

[06:58](#msg5c99cd9b3dd8171149522ee2)@9214 I believe @moliad is more interested in what should it mean.

9214

[06:59](#msg5c99cdc02fb6800d80819cbe)Details are covered \[here](https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#literal-arguments-and-get-arguments).

moliad

[06:59](#msg5c99cdc36a3d2e230d282af5)ah ok I get it... red already does lit-word quoted args... these will be passed thru.

[06:59](#msg5c99cddd6a3d2e230d282b71)will read that tomorrow ... :smile:

gltewalt

[07:11](#msg5c99d09b5547f7744868ea74)@rebolek Ah, like guards allowed in function spec

[07:11](#msg5c99d0a99d9cc8114a224d7a)https://hexdocs.pm/elixir/master/guards.html

rebolek

[07:15](#msg5c99d17d2fb6800d8081b75f)@gltewalt something like that, even this looks more like \[pattern matching](http://red.qyz.cz/pattern-matching.html).

```
def foo(term) when is_integer(term), do: term
  def foo(term) when is_float(term), do: round(term)
```

could be rewritten using my dispatcher as

```
foo: dispatcher [term]
dispatch :foo [integer? term][term]
dispatch :foo [float? term][round term]
```

gltewalt

[07:15](#msg5c99d1ab49fdaa0d811987db)Nice.

9214

[07:16](#msg5c99d1e26a3d2e230d28439e)Oh! @moliad ML-like pattern-matching.

[07:17](#msg5c99d210d0133e21e5187714)OTOH, it's not about function's spec, but function's body...

gltewalt

[07:26](#msg5c99d4405547f774486903f8)Called `pattern guards` in Haskell, looks like.  
https://wiki.haskell.org/Pattern\_guard

[07:35](#msg5c99d63f2fb6800d8081d81c)I should make a habit of reading red.qyz.cz

rebolek

[07:36](#msg5c99d66049fdaa0d8119ac75)with the frequency of updates it's easy to forget it exists :smile:

gltewalt

[07:44](#msg5c99d8726a3d2e230d28718a)You’ll just have to write one article a week

rebolek

[07:46](#msg5c99d8c22fb6800d8081e97c)That's 18x more frequent updates!

gltewalt

[07:46](#msg5c99d8dd9d9cc8114a228381)🎉

hiiamboris

[09:40](#msg5c99f3a00d7190505769d229)@moliad +1 for default values for locals and refinements ☺  
And here's another idea: make 2 flavors of it: `funcs` for runtime function building and `#funcs` as a macro to relay the extra work to the preprocessor. The former is more useful when working in console, the latter when you need faster code.

9214

[10:02](#msg5c99f8d2d0133e21e5197f23)@moliad another thing regarding function's bodies: make it easy to "embed" values in them. For example, if I write `charset [...]` in body, I don't actually create a `bitset!` value, but defer its creation to function's runtime. But with e.g. `#inline charset [...]` this expression will be evaluated at function's creation time and yield the value as-is.

nedzadarek

[10:23](#msg5c99fdb88aa66959b67330f7)@moliad what about `/refinement a [integer! 5] b ["default"]`. A block will contain types and a default value.  
ps. you can detect (infer) type of an argument so you don't have to specify it... but I guess you already know it.

@9214 sadly your and \[mine](https://github.com/nedzadarek/Red-Memoi) memoizations suffers from stack limits (not sure about `bind`'s name but it's similar thing). If I (or someone else) can figure out how to rewrite functions so that they won't contain another recursive calls then only limitation is the type (e.g. I was able to calculate 1476th (or 1477th with different starting position) Fibonacci number using `float!`- when I tried 1477 I got infinity (`1.#INF` to be precise)).

9214

[10:45](#msg5c9a02b6dfc69a1454f9fc0a)@nedzadarek care to elaborate?

nedzadarek

[10:45](#msg5c9a02de5547f774486a4cc2)@9214 what do you mean - what do you don't understand?

9214

[10:47](#msg5c9a03346a3d2e230d299789)How exactly my implementation suffers from "stack limits", whatever that means.

nedzadarek

[10:55](#msg5c9a05080d719050576a41e4)@9214 let me run a code and copy errors.  
btw. you run it like this:

```
fib: func [n] [
     either  n < 2 [
        return n
    ] [
        return ( (fib (n - 2) ) + (fib (n - 1) ) )
    ]  
]

mfib: memoize :fib
mfib 30.0
```

[10:58](#msg5c9a05bd3dd817114953b3a8)

```
>> mfib 1000.0
*** Internal Error: stack overflow
*** Where: fib
*** Stack: mfib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib fib
```

9214

[11:00](#msg5c9a0643fcaf7b5f731905bd)@nedzadarek so you call a memoized function which in turn calls an unmemoized version... cool.

nedzadarek

[11:07](#msg5c9a07ff0d719050576a55f8)@9214  
I am sorry I have not really looked at your `memoize` as I do not have good enough pc to run it smoothly. I assumed `bind` without really looking at the error. Again I am sorry for the confusion.

9214

[11:11](#msg5c9a08f1a21ce51a20c38d75)I've no idea why you think `bind` is in any way related to stack overflow, which, in fact, happens because Red has no tail-call optimization. Depth of one recursive call exceeds stack limit (which is expected with such large numbers), so you should rather build it up gradually, e.g.:

```
do https://raw.githubusercontent.com/9214/whatnot/master/red/memoize.red

fib: memoize func [n][
    either n < 2 [n][
        add fib n - 2 fib n - 1
    ]  
]

boost: does [
    foreach x [100.0 400.0 700.0][fib x]
]

boost 
probe fib 1000.0
```

BeardPower

[11:17](#msg5c9a0a4d0d719050576a68e2)@GiuseppeChillemi I don't want to know what possibilities are there. I want you to show me projects that DID turn out great with your suggestions.  
@rebolek 's company is only doing it because they can afford it!  
@moliad mentioned OpenCores. Yes, it's a nice thing and they take the approach of "get basic features for free, get advanced features for cash".

No single FOSS is surviving on donations from end-users. They all have some sort of funding by big companies.

[11:18](#msg5c9a0aa38126720abc4750c9)If you get funding/sponsoring by a company, the release of the source code also depends on the sponsoring company. Some are only sponsoring your project if you don't release the sources.

[11:21](#msg5c9a0b4aa21ce51a20c3a18a)Someone was even saying this about FOSS: if FOSS projects would get big money, they probably wouldn't even know what to do with it.

[11:22](#msg5c9a0b6c8aa66959b6738ce0)You can count high quality FOSS projects with your fingers.

nedzadarek

[13:20](#msg5c9a272752c7a91455fb7a5b)sdf

[13:21](#msg5c9a27472fb6800d8083c76b)@9214  
&gt; so you should rather build it up gradually

That's why I have been doing but it's hard to know arguments (`[100.0 400.0 700.0]`) in your case. Sure, we can compute what is an argument for Fibonacci (or Fibonacci n-step number sequences in general) but:  
\- it requires end-user to do this  
\- there're problems where it's harder to compute (or even guess) an argument

GiuseppeChillemi

[14:18](#msg5c9a34ba52c7a91455fba59c)@BeardPower Not every closed source product has success. Often they are a failure...

[14:33](#msg5c9a3820f3dbbd230cbd6956)But for close source projects it seems people prefer to see all the giants around us but not the dead one in their grave (and the dead companies using their closed solution)

nedzadarek

[14:33](#msg5c9a3898dfc69a1454fac658)@9214  
&gt; so you should rather build it up gradually

That's why I have been doing but it's hard to know arguments (`[100.0 400.0 700.0]`) in your case. Sure, we can compute what is an argument for Fibonacci (or Fibonacci n-step number sequences in general) but:  
\- it requires end-user to do this  
\- there're problems where it's harder to compute (or even guess) an argument

BeardPower

[14:33](#msg5c9a38555636de703de49c12)@GiuseppeChillemi Point is, they get money at the first sale.

GiuseppeChillemi

[14:34](#msg5c9a3878fcaf7b5f7319a25e)I do not know why it is dark pink but it was not my itention

gltewalt

[22:14](#msg5c9aa43081b15c5e4b8fd7f8)FOSS is not a failure if you gain a user base and then sell out or partially sell out in the future.  
Red Hat

BeardPower

[22:29](#msg5c9aa7dd82e11735c67dc2f1)@gltewalt Nobody said that FOSS is a failure. RH makes his money with services, not Open Source. It's also a public traded company.

[22:31](#msg5c9aa850e820b6470b6b62a2)They contribute to Open Source because they can afford it.

[22:32](#msg5c9aa88136704f6eddda8363)Which brings us back to the beginning: Open Source does not work. Selling software and services does.

[22:55](#msg5c9aadcb1f74fc4d4ca25219)FOSS is just not a good business model.

gltewalt

[23:13](#msg5c9ab23082e11735c67e01ac)They started open source

BeardPower

[23:14](#msg5c9ab26536704f6edddac319)They started with selling Linux and Unix accessories.

gltewalt

[23:27](#msg5c9ab54c5c7a815f27d361a5)Are you sure they didn’t do I t for about 6 years and then go to RHEL?

BeardPower

[23:29](#msg5c9ab5d12fb6800d8087c105)They sold the stuff in the first year. In the second they worked on their Linux distribution. They went IPO shortly after that.

[23:32](#msg5c9ab67e36704f6edddadc01)Well, it was a merger. The guy that sold the accecories bought the business of the RH guy.

[23:33](#msg5c9ab6bee7341060cae9a602)Yes, they went IPO after 6 years.

[23:35](#msg5c9ab72436704f6edddae18c)They offered paid support.

## Wednesday 27th March, 2019

gltewalt

[04:57](#msg5c9b02a052c7a91455011854)I thought you guys were saying that FOSS was a failure.

[04:58](#msg5c9b02ea36704f6edddcac56)Anyway, in 2019, ‘as a service’ is king, yep

GiuseppeChillemi

[07:47](#msg5c9b2a768aa66959b67a9a59)@BeardPower

&gt; @gltewalt Nobody said that FOSS is a failure. RH makes his money with services, not Open Source. It's also a public traded company.  
&gt; They contribute to Open Source because they can afford it.

You are missing one point: the open source project created the services needs, the fame, attracted the customers, the funds. This is the whole business model where open source is part of it.

BeardPower

[09:48](#msg5c9b46d60d71905057725a72)@GiuseppeChillemi I'm aware of that point. People are buying the services, not the Open Source thingy. The only difference in their cloud services and other is that their stack runs on Open Source software. In the beginning they offered software services. Again, customers bought the software service, not the Open Source thingy. Which fame? It was just another Linux distribution out of another hundred. The Open Source project did not create the service needs (except tech support because of the crappy software) but the customers demand for services.

[09:54](#msg5c9b485240b32b4c4fa2ee93)RH's focus was on business customers. It worked because they offered guarantees and SLAs. The first thing companies ask for, if they decide to use Open Source software, is who they can sue/hold reliable if something goes wrong. RH was accountable for it, but only if you are buying their service. If you are using their alternative free version you are on your own. Similar to Qt's dual license. This is something where Open Source works but it's very similar/if not the same to/as offering a commercial product.

[09:57](#msg5c9b49121f74fc4d4ca6581f)@gltewalt Absolutely. People are not buying the Open Source thingy but the services/commercial products.

moliad

[19:12](#msg5c9bcb168126720abc534a9c)got my preliminary implementation for pseudo types and input guard working... I can already type contents of blocks as argument requirements... its REALLY a big step forward.

[19:15](#msg5c9bcbe936704f6edde2781f)there are still a few rough edges, but I've even got automatic coercion of data when using pseudo-types.

so if you use a `block-of-numbers!` type, then you can automatically convert any viable values to a number in your type's `make` function and coerce it on the fly on a function call. it will validate if the given data CAN be viable once coerced, if it the given data isn't currently viable.

greggirwin

[19:28](#msg5c9bced98126720abc536762)On FOSS, ultimately running \*any* sustainable business is hard. FOSS makes it harder. It's not that you can't find a handful of successful FOSS-based companies, but your chances of succeeding that way are much smaller. Being ethical and not greedy (focused on the money) makes it harder still. So if you just want to run a business and make money, pick something easy to sell, or that has a higher statistical chance of success. Sell something people need. Something they can't do without, or that is legally mandated. That's good business.

Red is like vegetables. People \*should* eat them. They are good for them. But we are up against soft drinks and fast food. Entrenched, rich, powerful, and intent on maintaining that status.

While it's fun and entertaining to exchange opinions on this, it's unlikely we've missed a silver bullet to success. What would be helpful are hard facts. Numbers, studies, information on who is paying how much for what software tools.

[19:38](#msg5c9bd14d2fb6800d808fa2cb)@moliad thanks for posting about your work, good stuff. @gltewalt I think Hoare gets credit for the original guard concept. @rebolek's approach is very nice too. Many years ago, both Maarten Koopmans and I did Design By Contract experiments for R2. My son did a cool variant of arg checking in JS, where objects are often passed around, to reduce the number of args to funcs. He called it `pass-muster` and I've tinkered with a variant I call `vet` for Red.

We do probably want something like this in Red, though it's a BIG design space. All experiments in this area are good, and helpful. We don't want everyone to create their own incompatible system, but we also don't want to complicate the basic func spec dialect and more than necessary.

Do we have a wiki page for DbC, dependent types, or other things that fall under this category of work?

moliad

[19:39](#msg5c9bd17a52c7a9145506ea83)actual source code example:

```
sum: FUNCS [values [numbers!]][
	total: 0
	foreach value values [total: total + value]
	total
]
result: sum [1 2.0 1:00 none]
?? result

== result: 3603.0
```

in this case the numbers! pseudo-type accepts `integer! float time! none paren! word!`types and attempts to reduce and convert everything it can.

greggirwin

[19:39](#msg5c9bd18a40b32b4c4fa70a34)https://github.com/red/red/wiki/%5BPROP%5D-User-defined-types-(UDT)-and-dependent-types is the closest I found.

[19:42](#msg5c9bd23ccf786a56c78ac5c5)@moliad one of the key parts of the design is to identify whether it is to make things more or less forgiving.

moliad

[19:42](#msg5c9bd24236704f6edde2a590)where the above example really gets useful is with this further example:

```
sum ["aaa" 1 2]

== make object! [
    code: 800
    type: 'user
    id: 'message
    arg1: {given 'VALUES data doesn't comply to required format for NUMBERS! pseudo-type}
    arg2: none
    arg3: none
    near: none
    where: 'do
    stack: 38531744
]
```

[19:44](#msg5c9bd28052c7a9145506f0c7)the key is more EXPLICIT. Implicit states and functionality kills larger projects.

[19:46](#msg5c9bd32036704f6edde2ab20)in a short while, I'll re-implement the error generation using integrated Red error system with extensions to the error table and it will pop-up better (here I just printed the error from a `try` trap).

greggirwin

[19:47](#msg5c9bd36652c7a9145506f72e)This is tricky, though. To me, `numbers!` is very explicit, and would \*not* support `none` or `word` values. That is, it will not keep you from producing bad data, because it is more forgiving. It is not more explicit if those details are hidden somewhere else.

moliad

[19:48](#msg5c9bd377e820b6470b73b136)we can also already define the pattern directly, using parse rules in the spec... and its very readable .

rebolek

[19:48](#msg5c9bd3a30d7190505776824f)`numbers-and-some-random-stuff!` would seem more appropriate, I guess.

moliad

[19:48](#msg5c9bd3a70d71905057768257)but that's your definition of `numbers!` in your own code, so this level of detail is up to you. just like any function you write. I'm just giving the toolkit to allow you to use your own types

[19:51](#msg5c9bd4306a3d2e230d35f64e)it was a more advanced test which controls coercion explicitely the way you want it. also note that all of this code would have to be added to your function anyways, if you wanted to support these extended values as valid numbers... its just that now, instead of having repeated boilerplate data conversion and verification with multiple fallbacks and a lot of nested error handling, its totally abstracted away in a clean interface.

[19:51](#msg5c9bd4558aa66959b67f9de9)and, btw, we still support the normal types as-is, with no extra code added to the result function if you don't use the extra functionality. :smile:

greggirwin

[19:52](#msg5c9bd462cf786a56c78ad920)And this is where it gets tricky, because now you have "datatypes" that could vary widely in their behavior. Of course we want to use the DRY principle, and modularize, but it comes back to balancing abstractions.

moliad

[19:52](#msg5c9bd49452c7a9145506ff5c)as-such I will not provide any types in my engine, just the engine itself, and people can build datatype libs for their own processes.

rebolek

[19:54](#msg5c9bd4f11f74fc4d4caa6485)@greggirwin using `numbers!` in @moliad's `funcs` is no different than what Red can do today:

```
>> some-stuff!: make typeset! [word! string! float! none!]
== make typeset! [none! string! float! word!]
>> f: func [x [some-stuff!]][x]
== func [x [some-stuff!]][x]
>> f "a"
== "a"
>> f 3.14
== 3.14
>> f 3
*** Script Error: f does not allow integer! for its x argument
*** Where: f
*** Stack: f
```

greggirwin

[19:54](#msg5c9bd50f81b15c5e4b9819ae)I'm not sure we want to conflate standard datatypes with dependent types. Maybe there's room for a `dependent-type!!` syntax. ;^)

moliad

[19:55](#msg5c9bd5345636de703df02fc4)in my database I use `pair!` values as index keys, but they have a few specific constant keys that cannot be used ... so I can always verify with a `keys!` type that these are never supplied. it's a uniform concept in the whole database engine... it will be much more explicit than saying `block!`.... which could be filled with anything, not just keys.

[19:56](#msg5c9bd56a40b32b4c4fa72801)I call them pseudo-types everywhere. cause they are just functional typing added to the current argument spec.

[19:58](#msg5c9bd5f240b32b4c4fa72c69)@rebolek that's a good example of showing that I'm just trying to extend an already built-in idea.

greggirwin

[19:58](#msg5c9bd5f70d7190505776938a)While we're using func specs as the context there, this applies to the \*really* big picture of messaging, and where patterns beyond simple typeset matching are applied. Another reason it's not easy. We really want a general purpose validation and pattern matching dialect, higher level than `parse`, maybe specific ones for different contexts.

moliad

[19:59](#msg5c9bd63f5636de703df03669)Red's PARSE is already MUCH higher level than Rebol2... I've been using it for a few weeks now and rules are sooooo much simpler for all the advanced rules I've had to handle.

greggirwin

[20:00](#msg5c9bd64740b32b4c4fa72ef7)For example, matching tuples in a tuplespace.

[20:01](#msg5c9bd6a936704f6edde2c63f)And, ultimately, boils down to advanced unification. @9214 probably has something up his sleeve in that area. ;^)

hiiamboris

[20:16](#msg5c9bda227160b4228524ea40)@moliad Any way we can use the strength of this type checking at development stage and then just disable it for release (as parsing every incoming block wholly is quite an overhead) with a flag or something?

dander

[20:18](#msg5c9bda7a08f8e7361a59dcf5)I think even the existing function dialect is deceptively simple. I used to think it was just for specifying types and docstrings of arguments, but from things like @rebolek's example, and running across the spec for `parse` which includes a function callback signature, it certainly goes deeper. Being somewhat newer to the language family, it was surprising (not in a confusing, but more "oh, cool!" way), and feels like a really natural progression of growing into the language features. Not needing to know all the details at first, but discovering that there is more power there. @moliad's extension of this sounds really nice to me so far

moliad

[20:20](#msg5c9bdb277160b4228524f204)@hiiamboris we probably could. there is an overhead, yes. I guess it depends how &amp; why you are using the type system. I'll add it to my list of future features.

if you are actively using type coersion, then this could not be disabled, but we could have a per type spec so some types would become invisible (just keeping the base type in the `function` spec)

[20:24](#msg5c9bdc19b7e27d2f0592598d)@greggirwin I am actively thinking about a second proposal related to dispatchers like in some functional languages. rebol may not use them for the same reason (as we do not require recursion for looping) but they can still be very useful to segregate implementation of functionality based on different argument constraints. They REALLY simplify recursion.

[20:40](#msg5c9bdfc5b6711251983a7531)@hiiamboris some of the reason for the pseudo-types idea and input data pattern value and pattern verification is based on provability of a specific purpose. when accepting user-data, you want a strong input interface in order to relax the background interface and possibly accelerate the code by knowing , absolutely, that there is no invalid inputs in the unpure part of your functionality (i/o, in general)

hiiamboris

[20:42](#msg5c9be033e2245b5109c1a5fc)I understand. I just thought about \*wrapper around a wrapper around a wrapper...* scenario ☺ And each one will do the checking...

moliad

[20:42](#msg5c9be04eb6711251983a7782)Because I know that no invalid block is supplied in the function, unequivocally, I can just use a direct loop with accumulator. I don't even need to try and convert data which I know I can ignore (as per my design) , that has already be done in advance... so my loop is much faster. if I had to do all the type checking and data conversion as part of the loop, it would be much slower.

[20:43](#msg5c9be065b6711251983a7829)(overall)

[20:43](#msg5c9be0751324252286c7ed75)I may also be forced to quit mid-way.

[20:46](#msg5c9be12a5349305a4c7ca8bc)another unseen advantage here is that you can use multiple pseudo-types, just like normal types... even ones with the same base type like `block!` ! so you could uniformise your data to two different types of data (block of `integer!` block of `pair!` ) and make sure you get just one or just the other and possibly use two different accumulation mechanism.

[20:47](#msg5c9be16ce422d1519922d8e7)you could raise an error on `empty?` blocks (something that's often required).

nedzadarek

[21:12](#msg5c9be75108f8e7361a5a4029)@greggirwin  
&gt; @moliad one of the key parts of the design is to identify whether it is to make things more or less forgiving.

why not both: 1) function that is strict and 2) another function that "forgive" you

@hiiamboris I'm not sure if I understand it correctly. You don't need \*wrapper around a wrapper around a wrapper\*. @rebolek in his \[afunc function](http://red.qyz.cz/dependent-types.html) and in my proposal (mentioned by @greggirwin ) - we're just adding simple conditions at the head of the body. Not sure how @moliad is doing it.

@moliad your \*pseud-types* sounds interesting.  
You said we can create our own types. So, let's say, I want to accept an `integer!`, a `float!` and a `string!`. I want to convert everything to an `integer!`:  
\- `integer!` -&gt; no change  
\- `float!` -&gt; call `to-integer`  
\- `string!` -&gt; some parse code

This is doable in your code. Am I right?

moliad

[21:30](#msg5c9beb8fe422d15199232bb9)@nedzadarek yes, basically a pseudo-type definition is an `object!` with 2 functions(is? + make) and a name. All the rest is done in the FUNCS builder (which also just inserts code in the function body).

when you build your pseudo-type, recognizable functions are created for you from the object functions: `to-yourtype` and `yourtype?`... `yourtype!` also becomes usable within FUNCS

[21:35](#msg5c9bec9f51353e5a4da64179)the data coercion is done in `yourtype/make` and validity is managed by `yourtype/is?` from within the FUNCS . The interesting bit I added late yesterday is that `is?` now can return `'coerce`. This means we can know if given data is a direct match for our type OR if it is valid only after `yourtype/make`. with this information, FUNCS will apply coercion or not.

gltewalt

[22:43](#msg5c9bfc89a100047111cd81a5)`guardset!`

greggirwin

[23:36](#msg5c9c08e3e422d1519923ee4f)@nedzadarek we already have the forgiving version.

nedzadarek

[23:59](#msg5c9c0e4ddfcacf510aae7c44)@greggirwin I have created a \[wiki](https://github.com/red/red/wiki/Links-about-types) to keep links about types.

## Thursday 28th March, 2019

nedzadarek

[00:03](#msg5c9c0f540b3b8749f4d3948e)@moliad I see, makes sense.  
If you have any news about your implementation feel free to edit mentioned above \[wiki](https://github.com/red/red/wiki/Links-about-types). Thank you.

moliad

[02:41](#msg5c9c343d8df8b02f04705b8b)ok

[02:41](#msg5c9c3460dfcacf510aaf7cb3)when released it will be fully documented.

nedzadarek

[10:18](#msg5c9c9f9308f8e7361a5f08f7):+1:

## Monday 8th April, 2019

GiuseppeChillemi

[00:35](#msg5caa97397ecbdc29ca194a01)Has VS Code editor the ability tu build a list of function/objects like ultra Edit does?

## Friday 26th April, 2019

GiuseppeChillemi

[00:17](#msg5cc24e373d78aa6c03961611)Wasn't http://issue.cc rebol related? It is for sale!

[00:18](#msg5cc24e70375bac747006d335)@moliad, @greggirwin ?

[00:23](#msg5cc24f722e2caa1aa6bcc5b9)Yes, I remember, it hosted something related to curecode

ne1uno

[00:24](#msg5cc24fa83b6cb0686a53734d)wayback machine has it redirecting to http://curecode.org/none/ticket.rsp?id=

GiuseppeChillemi

[00:25](#msg5cc24fe08446a6023e78a9d3)@dockimbel maybe we should warn him

greggirwin

[00:33](#msg5cc251eb3b6cb0686a537fcb)I doubt it's worth maintaining that domain just to redirect at this point.

GiuseppeChillemi

[00:58](#msg5cc257a51cd0b8307d731ac1)I have just raised a warning for the interested, no words on the importance of the domain.

greggirwin

[02:04](#msg5cc267252e2caa1aa6bd5968)Thanks.

## Thursday 2nd May, 2019

abdllhygt

[13:49](#msg5ccaf56d1cd0b8307dadb0a4)hey!

[13:53](#msg5ccaf66fa4ef097471382555)i maked a facebook group for my conlang, i want to publish news about the language and the translation engine (by Red). if you want to join: https://www.facebook.com/groups/2681335155227347/

[13:55](#msg5ccaf6df6a84d76ed831b467)!\[lewaja](https://i.ibb.co/M1cjkpp/rect995.png)

[13:56](#msg5ccaf6f68790b0307e3c06f2)- free word order  
\- logic  
\- simple grammar

greggirwin

[22:44](#msg5ccb72e31cd0b8307db14bd7)Thanks for the update @abdllhygt.

## Friday 3th May, 2019

nedzadarek

[08:49](#msg5ccc00a61cd0b8307db4dca3)I have pushed \[few docs](https://github.com/nedzadarek/docs) but I have questions (more git/github related):  
\- It shows "pl/datatypes". When I click it it goes straight to the "datatypes" directory. Is it good behaviour? I haven't added "styles" and other files from the "en" folder so maybe that's why? Will I fix it by adding "styles" and other files?  
\- I edit some other files by mistake so I have to do `git checkout filename.adoc` to delete changes. Can I somehow prohibit changes for some files/directories? I want this feature to be easily turnable (e.g. if I want to push quick fix for doc from other language: I turn this feature off, commit changes, turn it on again).

dander

[16:27](#msg5ccc6bfb3d78aa6c03dbcd27)@nedzadarek maybe make them readonly? I don't know if that is any better than reverting the changes

endo64

[21:05](#msg5cccad251cd0b8307db9f0e4)&gt; It shows "pl/datatypes". When I click it it goes straight to the "datatypes" directory. Is it good behaviour?

I think it is because there is no file inside the `pl` folder, if you put some files into it then probably it will show it as `pl`.

&gt; Can I somehow prohibit changes for some files/directories?

Can't you make those files `readonly` to prevent any edit attempt? I don't think there is a way to do it in Git.

[21:09](#msg5cccae0f4b4cb471d9a1aff4)Your master branch is 1 commit ahead, 30 commits behind from red's master. You are working on your local copy, making changes and commit to your fork, but it seems you didn't fetch/pull from upstream. It would better to fetch the latest remote changes into your copy.

gltewalt

[21:16](#msg5cccafa73d78aa6c03ddb24f)I do not know offhand is the styles directory has anything to do with that, but you should copy that directory into your `pl`

## Saturday 4th May, 2019

GiuseppeChillemi

[08:49](#msg5ccd521f8790b0307e4c4247)FOY: I have made a little remote query executor using dropbox as exchange. Writing here, executing there, and getting a file as result here, takes 9 seconds on 100 mbit lines. 98% of the time is dropbox sensing the requested file, syncronizing and doing the same when the remote writes its answer.

[08:50](#msg5ccd52653b6cb0686a9eda3d)In the next days I'll try using google and onedrive .

greggirwin

[17:03](#msg5ccdc5ddb489bb6ed715a97c)Cool.

nedzadarek

[20:44](#msg5ccdf9bfb489bb6ed7172096)@dander @endo64 Wouldn't it change `readonly` attribute for all people after I create pull request? And I see some files are readonly... I don't want to mess up.

@endo64 yes, I have forgotten about pulling. Just before your message I have pulled. I need to check what files have been edited and if I should edit something. I think I have seen some command to compare forks (I'm going to check in my history).

&gt; I think it is because there is no file inside the pl folder, if you put some files into it then probably it will show it as pl.

I see.

Thank you both.

## Monday 6th May, 2019

dander

[04:11](#msg5ccfb409990feb45185d7c55)@nedzadarek I think you may be right. I didn't test it out myself. What git tools are you using? Some front ends will do thing like auto-fetch changes and make it easier to compare different branches. Maybe you just need to find a nice front-end/workflow that works well for you. Some that have seemed nice to me are \[GitKraken](https://www.gitkraken.com/), \[Git Lens](https://gitlens.amod.io/) (VS Code plugin), maybe \[Fork](https://git-fork.com/)

gltewalt

[06:55](#msg5ccfda5f3d78aa6c03f25dad)I use VSCode with asciidoc plugin for editing and previewing my work, and git command line.

After you open your local clone of `docs` in your editor of choice, you can make a `pl` folder and then copy everything from inside the `en` folder.  
As long as you `git add` files individually, the files that you haven’t translated yet won’t get pushed to your fork.

Just don’t do `git add .` or it will stage all files for pushing and you’ll have a mess on your hands.

[06:56](#msg5ccfdaa7a4ef09747158f2a1)I hope that made sense

endo64

[10:58](#msg5cd01361b4700e023d2ebeee)&gt; Wouldn't it change readonly attribute for all people after I create pull request?

@nedzadarek You're right, adding individual files as @gltewalt suggested is a better option.

## Monday 13th May, 2019

viayuve

[13:14](#msg5cd96da2b149ca5098845ef0)Hello Everyone Any news on ports?

[14:21](#msg5cd97d8679d700509964919d)cool none I guess.

rebolek

[14:26](#msg5cd97e7ff251e60ffa7545ff)@viayuve there's a version in works, it takes time to finish it.

## Tuesday 14th May, 2019

nedzadarek

[14:31](#msg5cdad1500824230a77338885)@dander I'm using Atom and/or git command. I'll try GitKraken &amp; Fork.  
@gltewalt adding files individually (`git add filename.ext`) might be good however copying everything from `en` might be confusing as I won't know what I need to translate and what I don't need to translate.

Thank you both for the answers.

[14:33](#msg5cdad19f5d48a24fd0c879d6)I don't know what room to post so I'll use this room. If anyone is interested in the Voronoi diagrams check \[this](https://github.com/nedzadarek/Vor-o-noi).

## Wednesday 15th May, 2019

moliad

[14:30](#msg5cdc228f8fcdb05d47de4331)the diagrams are really cool btw

GiuseppeChillemi

[14:45](#msg5cdc2611f52a2375163800a1)Any good tool to create diagrams, tables and schemas ? Open Source would be good.

moliad

[14:56](#msg5cdc28a56fd7c11cd8c148b8) draw.io. free, online or desktop and has all the essentials without the clutter.

GiuseppeChillemi

[15:01](#msg5cdc29db79d700509976c0fc)I forgot a special requirement: I shuld be ablet to create diagrams via script.

ne1uno

[15:22](#msg5cdc2eb9f251e60ffa88136b)graphviz, @toomasv was working on a dialect?

## Tuesday 21st May, 2019

GiuseppeChillemi

[22:29](#msg5ce47bc475d9a575a6208091)I had to add only one line, a small one,... and I got full text editing for 20 text areas in child windows and have updated to the caller one on close... that's power. Now I can sleep.

## Thursday 23th May, 2019

PierreChTux\_twitter

[19:58](#msg5ce6fb7d13e9854e3355ad39)&gt; I forgot a special requirement: I shuld be ablet to create diagrams via script.

Hi, it seems that you may well appreciate gnuplot:  
http://www.gnuplot.info/

GiuseppeChillemi

[20:08](#msg5ce6fdcaef853135c80fdc3f)@PierreChTux\_twitter gnuplot creates math based diagrams. I am interested in schemas, like visio ones. Maybe I have used the wrong terms.

dander

[20:37](#msg5ce704849d64e537bcfcdef5)@GiuseppeChillemi https://yuml.me/diagram/plain/class/draw is pretty simple, and text-based. Similar to graphviz, but online, and simpler. I think it's possible to feed text to it, if you don't want to go the graphviz route

greggirwin

[21:30](#msg5ce7110aecdf942b4c3457a2)http://asciiflow.com/ and https://textik.com are others.

[21:32](#msg5ce71150ef853135c8106f1b)I'm pretty sure @toomasv can tinker something up, which could then tie to his other drawing tools, to export as ASCII, vector, or image format.

[21:33](#msg5ce711a70ac9852a952c3995)With `draw` we have the commands needed, and draw-to-ascii could be an interesting experiment.

dander

[23:26](#msg5ce72c297c363c75a7314ad8)Yeah, it would be great to have @toomasv graphing stuff easily accessible in Red. Graphviz is great, but it's ~115 MB

## Friday 24th May, 2019

toomasv

[04:21](#msg5ce7713eef853135c812c538)I have thought of a diagramming dialect extending VID with `node` and `connect`, each having appropriate description of attributes in dialect, which would translate into VID `base` faces with corresponding attributes. Something like

```
view diagram [
    below center
    think: node "Think of the problem"
    connect arrow 
    node "Experiment"
    connect arrow
    node diamond "Clear?"
    connect arrow to think "No"
    connect arrow "Yes"
    node "Implement"
]
```

greggirwin

[06:13](#msg5ce78b9063dea422b4d6cce8)Wow. It took me only one pass of "huh?" and re-reading it to visualize the diagram from that. Complex diagrams would be much harder, but as a notation to generate, it's very clear and compact.

toomasv

[06:33](#msg5ce7903f7c363c75a733b736)@greggirwin There will pop up problems with this, sure. E.g. to draw connector from "Clear?" back to `think` the path has to be computed, which may become a highly complicated problem in itself if we try to produce nice diagrams. But easier way is to provide description of path (at least partly), e.g. `connect arrow to think "No" path [horizontal -50]`. Here `path` is given ony the first segment of snakeline, the rest of it is easy to infer. But `path` may also be quite complicated (as snake example in \[article](https://github.com/toomasv/article)).

[06:45](#msg5ce7932363dea422b4d70343)Meanwhile, a very simple example how to mimic tables with fixed cell size:

```
view [panel black [origin 1x1 space 1x1 
	style c: text wrap center white 50x32 
	c bold "Row 1" c "Cell 1.2" 
	c "Cell 1.3" c "Longer text" return 
	c bold "Row 2" c "Cell 2.2" 
	c "Cell 2.3" c "Cell 2.4"
]]
```

\[!\[image.png](https://files.gitter.im/red/chit-chat/LXt6/thumb/image.png)](https://files.gitter.im/red/chit-chat/LXt6/image.png)

[06:57](#msg5ce795c813e9854e335989df)To have some flexibility:

```
; Longer fourth column
view [panel black [origin 1x1 space 1x1 
    style c: text wrap center white 50x16 style c4: c 80x16 
    c bold "Row 1" c "Cell 1.2" c "Cell 1.3" c4 "Longer text" return 
    c bold "Row 2" c "Cell 2.2" c "Cell 2.3" c4 "Cell 2.4"
]]

;Higher first row
view [panel black [origin 1x1 space 1x1 
    style c: text wrap center white 50x16 style r1: c 50x32 
    r1 bold "Row 1" r1 "Cell 1.2" r1 "Cell 1.3" r1 "Longer text" 
    return c bold "Row 2" c "Cell 2.2" c "Cell 2.3" c "Cell 2.4"
]]
```

greggirwin

[07:05](#msg5ce797a5ecdf942b4c37aca4)R2 had a `list` style, which used its iterator concept for virtual faces. The layout spec you gave it was for a "row" in the list, which would be created on demand as items scrolled into view.

[07:05](#msg5ce797ccad024978c61cd767)There were some limitations, but in many ways it was a wonderful design.

toomasv

[07:07](#msg5ce798267c363c75a733e6eb)@greggirwin I see, thanks! I'll look it up.

## Saturday 25th May, 2019

toomasv

[19:48](#msg5ce99bf075d9a575a643a29b)PoC:

```
view dia [
	diagram "Diagram example" [
		pad 60x0 
		node ellipse water font [color: white style: [bold italic] size: 12] "One" 
		return 
		node "Two" 
		node diamond 60x50 "Three" 
		return
		pad 60x0 node box 50x30 "Four" node "Five" return
		pad 250x-250 n6: node ellipse 40x40 "Six"
		connect data [node1 node2] 
		connect data [node1 node3]
		connect data [node3 node4]
		connect data [node3 node5]
		connect data [node5 n6]
	]
]
```

\[!\[image.png](https://files.gitter.im/red/chit-chat/kyqK/thumb/image.png)](https://files.gitter.im/red/chit-chat/kyqK/image.png)

greggirwin

[19:57](#msg5ce99e0f879f4478c7dfa828)Oh man, so cool.

toomasv

[19:59](#msg5ce99e9863dea422b4e4f6c3)Arrowheads and guided connections still to go :)

GiuseppeChillemi

[20:24](#msg5ce9a496879f4478c7dfd2a9)@toomasv you are a genius!

[20:26](#msg5ce9a4f983ae782aeecddc66)Tables with headings, columns and rows would be good.

[20:27](#msg5ce9a53775d9a575a643e65d)Oh, yes, I have seen above you are implementing them

endo64

[21:53](#msg5ce9b9716366992a941f53e4)That is awesome @toomasv !

## Sunday 26th May, 2019

toomasv

[04:19](#msg5cea13bd0ac9852a95405a52)Thanks @greggirwin, @GiuseppeChillemi, @endo64! It is pure joy.

BeardPower

[10:38](#msg5cea6c977c363c75a7469829)@toomasv Nice! It would be greate if could automatically create a flow-graph or sequence diagram out of code.

toomasv

[13:19](#msg5cea92449d64e537bc1443b8)@BeardPower I'm afraid this will be good for manual/fixed generation only (well, VID block can be generated dynamically of course). For dynamic generation `ast` may be developed further.

BeardPower

[13:54](#msg5cea9aacd22ba766a2020bc0)It would add huge value for generating documentation.

greggirwin

[17:42](#msg5ceacff78f019114aebe4ca6)@BeardPower you could do that. @toomasv's dialect would just be what you generate when you do the code analysis.

rebolek

[17:51](#msg5cead21becdf942b4c4d196a):+1:

toomasv

[19:03](#msg5ceae2f5ecdf942b4c4d9d1d)

```
view dia [
	diagram vertical beige 200 "Problem workout" [
		space 20x20
		origin 80x10 
		below 
		node {Think about^/the problem}
		node "Experiment"
		node diamond "Clear?"
		node "Implement"
		connect node1 node2
		connect node2 node3
		connect node3 node1 hint [horizontal 60] pen red
		connect node3 node4 pen leaf
	]
]
```

\[!\[image.png](https://files.gitter.im/red/chit-chat/1a4F/thumb/image.png)](https://files.gitter.im/red/chit-chat/1a4F/image.png) \[!\[image.png](https://files.gitter.im/red/chit-chat/tNiU/thumb/image.png)](https://files.gitter.im/red/chit-chat/tNiU/image.png)

[19:14](#msg5ceae58d0ac9852a9545e9eb)\[!\[image.png](https://files.gitter.im/red/chit-chat/RDTh/thumb/image.png)](https://files.gitter.im/red/chit-chat/RDTh/image.png)

greggirwin

[19:45](#msg5ceaece0ecdf942b4c4de32c)Cool! So `hint horizontal` can override `below`?

[19:48](#msg5ceaed7b75d9a575a64c1e07)I imagine you're planning `set-word!` support, to name nodes.

toomasv

[19:53](#msg5ceaeec613e9854e336f2034)Yes, `below` organizes nodes, `vertical/horizontal` does that for connections. `vertical` just after `diagram` sets default direction for connections. Set-word is there from the beginning, as e.g. in first example `n6`.

greggirwin

[20:35](#msg5ceaf880ef853135c82a55ec)Indeed, I missed those. Thanks!

[20:36](#msg5ceaf8b0ecdf942b4c4e3659)How do `vertical` and `below` relate to each other?

[20:36](#msg5ceaf8d59404bf2aedb421d2)Vertical for connections and below for nodes?

## Monday 27th May, 2019

toomasv

[03:15](#msg5ceb5637879f4478c7ea954a)Yes, currently I have to track vertical/horizontal for connections separately from below/across for nodes, because I need to keep `connect`s in the end and cannot insert these between `node`s. Otherwise some connection-lines will remain visible above nodes (they run from centers to centers). I hope to get rid of this limitation.

greggirwin

[05:16](#msg5ceb72ac83ae782aeed94917):+1:

BeardPower

[12:30](#msg5cebd8649404bf2aedb9eab5)@greggirwin Yes, but it would be great if his stuff has that feature already ;-)

greggirwin

[19:05](#msg5cec34eed22ba766a20d356e)Even if he does it, it's a separate thing entirely. It's not \*part of* the dialect. That's my main point.

toomasv

[20:06](#msg5cec4329ecdf942b4c572d9e)Right, this one is only extending VID with some styles and little preliminary adjustment. Todays feats are arrowheads and some additional formatting:

[20:06](#msg5cec432e8f019114aec89757)\[!\[image.png](https://files.gitter.im/red/chit-chat/5r5a/thumb/image.png)](https://files.gitter.im/red/chit-chat/5r5a/image.png)

[20:17](#msg5cec45f3ef853135c833614f)

```
view probe dia [
	below
	diagram vertical beige "Diagram example" [ 
		space 40x40 
		pad 60x0 
		node ellipse water font [color: white style: [bold italic] size: 12] "One" 
		return 
		node "Two" 
		node diamond 60x50 "Three" 
		return
		pad 75x0 node box 50x30 "Four" 
		node "Five" 
		return
		pad 250x-250 n6: node ellipse 40x40 
			border [line-width: 5 pen: gold] font-color red "Six"
		connect node1 node2 arrow closed
		connect node1 node3 arrow closed
		connect node3 node4 double
		connect node3 node5 double line-width 2
		connect node5 n6 hint [horizontal] line-width 2 pen brick arrow
	]
	pad 0x40
	diagram border [pen: 'gray] "Problem workout" linen [
		style step: node border gray font-color black
		style chk: node diamond border gray font-color black
		space 20x20
		origin 40x10 
		think: step {Think about^/the problem}
		below step "Experiment"
		across chk "Clear?" 
		pad -200x0 step "Implement"
		connect node1 node2 line-width 3 pen gray arrow 
		connect node2 node3 hint [vertical 40] line-width 3 pen gray arrow 
		connect node3 think hint [vertical 40 -160] line-width 3 pen red arrow
		connect node3 node4 line-width 3 pen leaf arrow
	]
]
```

greggirwin

[20:52](#msg5cec4e1a7c363c75a753cac5)Nice! I was going to suggest `link` in place of `connect`, but you may want to add a link facet for URLs when clicking on a node.

BeardPower

[23:53](#msg5cec7875ad024978c63d8301)@greggirwin My point was: when code analysis tool which generates the output using his dialect?

## Tuesday 28th May, 2019

toomasv

[03:15](#msg5ceca7bf75d9a575a657f90e)@greggirwin Good suggestion about `link`! I didn't think of it yet. Any more suggestions?

dander

[19:25](#msg5ced8b46bf4cbd167cf16777)It's pretty exciting to see the json codec getting merged into master 😀. I was pleasantly surprised I could `load` a url like this:

```
>> j: load https://httpbin.org/get
== #(
    "args" #()
    "headers" #(
        "Accept" "*/*"
        "Con...
```

I was wondering if there is a more 'Red' way of interacting with the result than

```
>> j/("url")
== "https://httpbin.org/get"
```

greggirwin

[19:29](#msg5ced8c17481ef4167b91243e)@dander the next update will automatically make the keys words, rather than strings. Just need to make sure we have a fallback option for the rare cases when people really need strings there.

dander

[19:30](#msg5ced8c459b50f6393543e07d)nice 😊

greggirwin

[19:30](#msg5ced8c629b50f6393543e103)In the meantime, you can use `select`, which is a little nicer:

```
>> select j "url"
== "https://httpbin.org/get"
```

[19:30](#msg5ced8c72b76eac527a6556ce)Paths are better for nested data though.

dander

[19:31](#msg5ced8c9ce41fe15e75d40eb2)That's what I was thinking too. Any consideration about the values? Some things would make sense to be loaded as well, like urls, but I could see some cases being harder to deal with

[19:32](#msg5ced8cdb65392c3b607f9002)like the `Accept: */*` would be a valid `path!`, but maybe that case would be better to keep as a `string!`

greggirwin

[19:33](#msg5ced8cf1faac64393401015a)It's all tradeoffs. Auto conversion to Red types will add overhead, and `load` may not always produce the type you want. So we'll likely use a schema application step, where you can define the target types and run the raw result through that.

dander

[19:35](#msg5ced8d65f3a60a79a416cae2)That sounds interesting. Well, this will be fun to play with. Go Red team go!

greggirwin

[19:43](#msg5ced8f4b702b7e5e76ef4498)I've done systems like that for both XML and JSON in the past, so we know it's doable. Easy for the most part, with wrinkles we need to figure out for generality. I built specific systems before, e.g. for AWS Dynamo JSON or MSProject XML. Fairly general, but we need to think broader for standard Red use.

ne1uno

[19:56](#msg5ced927565392c3b607fb6bf)what about ignore keys with null values? the reference implementation does, the new codec does not. (could be just a bug) I didn't see a way to control the option

greggirwin

[20:12](#msg5ced9619ff3f016baa684666)`Map!` was changed to support `none` values, so they wouldn't just disappear. They will now properly round trip. We don't want a lossy codec.

[20:13](#msg5ced966a5de053468bd4bd71)To determine a key's existence, use `find` as with blocks. This allows path access to return `none` and gives you a way to tell if a key is there or not.

dander

[20:26](#msg5ced995afaac6439340152c1)@greggirwin maybe something like this? Anything without a rule would default to strings. I don't know about the parse rule, but that could be cool. That field for me shows up as a pair of IP addresses with a comma between them.

```
json-schemas: #(
    https://httpbin.org/get #(
        origin: [collect [any [keep tuple! | skip]]]
        url: url!
    ) 
)
```

## Wednesday 29th May, 2019

rebolek

[05:23](#msg5cee17436f530d3b61fe3a30)Parse makes sense to me. Another possibility is to go thru all values, try to load them and if it fails, keep a string. Probably not the fastest way, but easiest for user.

dander

[07:29](#msg5cee34f0bf4cbd167cf5a24e)@rebolek that was my first thought too, but when I was looking at just that one sample, I was kind of surprised that a lot of the values in there were loadable, but I would prefer them as strings. Mostly things that would be loaded as `path!`, like the 'content-type' or ones that would load as `word!`might also be awkward to work with. I don't think that quite makes it wrong, but I sort of questioned it.

[07:32](#msg5cee358465392c3b6083bf01)I just realized that my parse example is sort of invalid, because it's applying block parsing rules to string input... Though that would be a pretty useful capability too

greggirwin

[13:59](#msg5cee905a6f530d3b61016e71)I got your intent @dander. And I don't use `load` in a schema scenario, but `to`, because the user is telling us what type they want. \*However\*, we can provide an example loader, and we should. People new to Red won't know the power of datatypes to start, and this will clue them in.

GiuseppeChillemi

[18:45](#msg5ceed34d7c1dab468c6a3f59)@toomasv from a simple request you made a great tool. Thanks. Waiting for it to be available.

toomasv

[18:55](#msg5ceed5bb6fc5846bab2c47d1)Little patience more. It grows: added styling, links, different connectors, rich text, etc:  
\[!\[diagram-style](https://toomasv.red/images/Diagram/diagram-style.gif)](https://toomasv.red/images/Diagram/diagram-style.gif)

rcqls

[18:57](#msg5ceed6125de053468bdcfbcb)@toomasv It’s kind of magic (as usual)! :clap:

toomasv

[19:39](#msg5ceedfd69b50f639354ccfa3)@rcqls :) I'm learning a lot while trying to implement these ideas.

rcqls

[19:48](#msg5ceee1fbbf4cbd167cfa5934)@toomasv I fear the next challenge on linux/GTK if you’re learning too much! :smiley:

toomasv

[19:50](#msg5ceee286481ef4167b9a034a) :cold\_sweat:

endo64

[20:33](#msg5ceeec905de053468bdd9201)&gt; I'm learning a lot while trying to implement these ideas.

@toomasv And you have full of great ideas! :)

nedzadarek

[20:54](#msg5ceef18065392c3b6088cd9d)@rcqls I get the feeling that @toomasv will invent or implement lots of amazing stuffs before he is going "low level programming".

@toomasv so, instead of opening a default web-browser (I assume) you can load text or image. That's sounds amazing. Now we need somehow "parse" user's code into your dialect and we have "functions' dependency graph".

## Thursday 30th May, 2019

toomasv

[09:52](#msg5cefa7e86fc5846bab316ac6)@nedzadarek

&gt; you can load text or image

You can do in diagram dialect whatever you do in usual VID, i.e. define actions/interactions on and between nodes and connectors. They are just faces with default draw appearances.

[11:55](#msg5cefc4c5cea8295279c31771)@endo64 :)

nedzadarek

[11:57](#msg5cefc5335de053468be2dccd)@toomasv great :+1:

## Friday 31st May, 2019

toomasv

[09:16](#msg5cf0f1065de053468bea6596)\[!\[taiji](https://toomasv.red/images/Animations/taiji.gif)](https://toomasv.red/images/Animations/taiji.gif)

rebolek

[09:19](#msg5cf0f1936f530d3b6111457e):)

GiuseppeChillemi

[18:27](#msg5cf17214e41fe15e75ede9fd)@nedzadarek  
&gt; @toomasv so, instead of opening a default web-browser (I assume) you can load text or image. That's sounds amazing. Now we need somehow "parse" user's code into your dialect and we have "functions' dependency graph".

I thought exactly the same !

greggirwin

[20:49](#msg5cf19371e41fe15e75eec93b)Woohoo!

I would have responded sooner, but I was hypnotized.

## Saturday 1st June, 2019

toomasv

[18:31](#msg5cf2c484bf4cbd167c13d6ac)@GiuseppeChillemi Would this be something for you?

```
files: read %. 
texts: copy [] 
foreach file files [
    modified: query file 
    append texts reduce [
        mold file 
        modified/date 
        rejoin [modified/hour ":" modified/minute]
    ]
]
table/tight/colors/th [[] [center] [right]] append [
    [gray white bold "File"] [gray white bold "Date"] [gray white bold "Time"]
] texts [silver white]
```

\[!\[image.png](https://files.gitter.im/red/chit-chat/QMlJ/thumb/image.png)](https://files.gitter.im/red/chit-chat/QMlJ/image.png)

[18:48](#msg5cf2c88a65392c3b60a1f9b6)

```
table/tight [[beige][][right]][
    "2000" "This year we just started" "3.00" 
    "2010" "Some real income" "60'000.00" 
    "2020" "Now we are talking" [red white bold "900'000.00"]
]
```

\[!\[image.png](https://files.gitter.im/red/chit-chat/IfXL/thumb/image.png)](https://files.gitter.im/red/chit-chat/IfXL/image.png)

hiiamboris

[19:05](#msg5cf2cc89f3a60a79a438cae5)Great!

[19:07](#msg5cf2cce77c1dab468c84542b)@toomasv where can we see the `table` source?

rcqls

[19:09](#msg5cf2cd6d7c1dab468c8458ac)@toomasv :thumbsup:

greggirwin

[19:16](#msg5cf2cf145de053468bf6dad0)Nice!

BeardPower

[19:17](#msg5cf2cf49481ef4167bb38e59)@toomasv Great! Is it/will it be interactive?

rebolek

[19:19](#msg5cf2cfa665392c3b60a2267c)@toomasv is it virtual table?

toomasv

[19:27](#msg5cf2d1965de053468bf6ed88)@hiiamboris Soon. Some holes to patch.  
@BeardPower By interactive do you mean editable? Not now but it can easily be made such.  
@rebolek Sorry, I don't know exactly what is virtual table, so I guess it is not. It is VID manipulation (again).

pekr

[19:31](#msg5cf2d28ffaac643934236767)Virtual table - most probably the ability to display infinite amount of data. In the past, cyphre created a table style, which did not require redoing of the original data block (being e.g. a result of a db query), ditto for virtual columns, whose rearrangement did not require to shuffle the data. Simply the style, which is a "window" to the data source :-)

rebolek

[19:32](#msg5cf2d2c8b76eac527a87fa58)@toomasv yes, "infinite" amount of data. How does it handle scrolling? For example 10 000 lines?

toomasv

[19:33](#msg5cf2d323ff3f016baa8ac4b5)@pekr Ah, thanks! So, it's definitely not. Doesn't handle scrolling at all (now). Its for small data.

rebolek

[19:35](#msg5cf2d37f7c1dab468c847d36)I see. `text-table` renders only visible lines so huge amount of data isn’t problem, probably you can do something similar.

toomasv

[19:38](#msg5cf2d43d481ef4167bb3b116)Thanks. I have to delve into `text-table` then, if I'm going to make it for bigger data. But I knew your `text-table` is powerful, so I didn't try to do something comparable, but a small thing, 100 LOC.

hiiamboris

[20:03](#msg5cf2da2b82c2dc79a53453fe)I made a text-list variant recently, based on rich text, which only renders the data that is visible. 10000 lines not a problem, 100k already lags a bit. I used it as 2-column table (icon + text) as it provides the ability to define a custom renderer for each datatype. And I will clearly require a more or less versatile table style for the reactivity visualizer project when I finally get to it.  
The showstopper for now is that Red simply isn't stable enough to handle this project. But I'm mentioning this mostly to underline that we all seem to be feeling the same - Red badly needs a table style ☻

GiuseppeChillemi

[20:32](#msg5cf2e0cd7c1dab468c84cba1)@toomasv nice. Could you let diagram arrows point to a specific row/column?

[20:32](#msg5cf2e0f4b76eac527a8851ad)And also start firm a specific row/column?

[20:33](#msg5cf2e0ff481ef4167bb40782)\*from

[20:34](#msg5cf2e164ff3f016baa8b1e1d)And, could arrows have text on it or in it (breaking them)?

[20:35](#msg5cf2e1a9ff3f016baa8b1f8c)I think the whole community owes you something for such great works.

nedzadarek

[20:49](#msg5cf2e4d3e41fe15e75f72b56)@hiiamboris why does it lags at more lines if you only render visible data?

hiiamboris

[20:59](#msg5cf2e746702b7e5e761271f7)@nedzadarek the height of each line is determined by it's content. Ideally I need to leverage the deep-reactor and write handlers for all the events it supports, and cache the size of each cell and maybe sizes of whole groups of cells. But I didn't bother to do it, so I just iterate thru the whole list on each redraw attempt, skipping everything that won't be seen. Still, iteration over 100k items is costly.

greggirwin

[21:05](#msg5cf2e8afcea8295279d7bc92)People don't realize all the tricks Excel and other big spreadsheets use to be responsive and not eat all your resources. In Red, we can have both: a simple model that uses faces, giving us a lot of power easily. That won't scale, though, so we need to find the limits, be creative, and also offer a virtual table. And one of the simplest tricks is making all rows the same height. And 100K items isn't bad. We got by with 64K rows for a long time in Excel. So it's another case of not forcing things into a mold that isn't right for them. Maybe there's a better way to handle vast data. Humans can't consume 100K rows of data visually.

nedzadarek

[23:16](#msg5cf30763bf4cbd167c156fa2)@hiiamboris I still don't get why you need to iterate over whole list. You just need to hide previous rows and show current rows.

## Sunday 2nd June, 2019

greggirwin

[02:12](#msg5cf33097f3a60a79a43b433e)If your rows are not all the same height, as you scroll, you don't want the thumb/dragger jumping around. That is, you can't just scroll up "one row", but have to know the height of \*every* row to scroll smoothly and consistently.

[02:14](#msg5cf330ea7c1dab468c86c8b8)So if your scroller can cover the whole range, and they drag from top to bottom, you have to, effectively, calc the height of every row, which means every cell, which means either rendering and caching, or rendering dynamically.

[02:14](#msg5cf33122ff3f016baa8d2c0a)Think of it as if the scroller has to know the virtual height of the entire table.

[02:16](#msg5cf331896f530d3b611ff0fb)In a fixed height row scenario, which can cover a lot of ground, you \*can* be much more efficient about it, but still have to render what is shown, which may only be for a split second as they scroll past. That's where the clever and tricky tradeoffs and optimizations come in.

nedzadarek

[08:26](#msg5cf388406f530d3b61220969)@greggirwin ah, I see. Thank you.

[08:27](#msg5cf38859f3a60a79a43d5937)Now it makes sense why @hiiamboris approach lags.

hiiamboris

[08:48](#msg5cf38d4665392c3b60a6b4f6)Yes, that sums it up. Even to obtain the size and position of the scroller's thumb one requires to know how the size and offset of displayed data relates to the whole virtual table size.

[08:53](#msg5cf38e74bf4cbd167c18b214)And well, ideally each row's height may depend on the table's width, which accounts for visibility of the scroller itself :)

BeardPower

[12:37](#msg5cf3c3146f530d3b61238bbb)@toomasv Yes, or sortable.

[12:38](#msg5cf3c328ff3f016baa90d260)Did you test performance as well?

toomasv

[13:22](#msg5cf3cd85481ef4167bb9d14e)Sortability is good idea. Thanks! No need for performance tests IMO, it's for small data, page-long at most. I read somewhere that VID is like government spending. :)

GiuseppeChillemi

[13:38](#msg5cf3d165bf4cbd167c1a6fb7)@toomasv how is government spending?

toomasv

[14:31](#msg5cf3ddc4faac6439342a1c24)A lot.

greggirwin

[14:38](#msg5cf3df62faac6439342a2624)Many years ago, Carl said that the View core was really efficient, saving every penny, then VID squandered it all like government spending.

[14:39](#msg5cf3df92ff3f016baa919692)So you could write large UIs that were still very efficient, if you programmed them at the low level. Using VID was much easier, but also came with more limits.

nedzadarek

[14:45](#msg5cf3e0f9481ef4167bba529a)@hiiamboris :+1:

toomasv

[15:38](#msg5cf3ed68faac6439342a8947)@greggirwin Yes, that's it! But I wonder, does it apply to Red? Or rather to Red vs Res/System?

BeardPower

[16:06](#msg5cf3f3ea82c2dc79a53b7f7a)@toomasv I see. So what to use for huge amounts of data?

toomasv

[16:08](#msg5cf3f4836f530d3b6124e0c9)@GiuseppeChillemi Do you mean statical arrows, defined in text, or dynamically, like this:  
\[!\[table-arrow](https://toomasv.red/images/Table/table-arrow.gif)](https://toomasv.red/images/Table/table-arrow.gif)  
@BeardPower @rebolek's `text-table`.

greggirwin

[16:09](#msg5cf3f4a2481ef4167bbad0fb)Because Red is native UI only right now, the rules are different, but the ideas will always be the same. The more the system handles for you...no, that's not accurate. Systems can do a lot for you and still be efficient. The more a system \*has to* handle, the less efficient it's going to be at runtime. But perhaps much more efficient to develop with.

There are multiple facets to this. You're better off having an expert write a runtime system that is designed and implemented well, and efficiently, rather than having average programmers redundantly build them. e.g. string handling. The more specifically you optimize something, the bigger the gain can be, but the less applicable in other contexts. Array languages like APL, K, or J are good examples. Massive gains, but at a cost of generality and accessibility to non-experts.

We complain about bloat in other systems, and it makes me crazy to see apps that are tiny in code, but loaded with MBs of graphic assets just to look shiny. That can be a memory wasteful, but processor efficient approach. In R2, the face system was enormously flexible, and it was fantastic. But making it easy to use meant condensing things into features like the `effect` pipeline, `edge` facet, etc. and that made each face much more work to render.

As always, the goal is to be as fast as needed, but not more. :^) Put the effort into the things that make a difference.

In the early days of VB (1991-92), when I proposed using it, there would be pushback because of "performance issues". "You can't write it in VB, it would be too slow. C will be much faster." First, that wasn't always true, because the VB runtime was better code than the average C dev would write. But I took 2 different tacks when responding. The first was "OK, I'll just prototype it in VB, and then we can build the real system in C." Once the prototype was done, generally in a short time:

Gregg: "Now we can rewrite it in C. It will take 18 months or so."  
Customer: "But it looks like the prototype works."  
Gregg: "It does, it's the complete app, with the features. Just in VB, not C."  
Customer: "So why would we rewrite it? It seems fast enough."

The other approach was:

Customer: You can't use VB. It will be too slow.  
Gregg: My VB app will be a lot faster than the other guy's C app. Probably 12-18 months faster.

[16:10](#msg5cf3f505b76eac527a8f2378)R/S is good for very specific things, but requires very different skills, means a lot more work, and is more error prone at the "this can crash your app with a segfault" level.

toomasv

[16:14](#msg5cf3f5f0481ef4167bbad920)Thanks @greggirwin! I guessed something like this. :)

hiiamboris

[17:45](#msg5cf40b4d65392c3b60aa1654)&gt; Probably 12-18 months faster.

:D lovely

GiuseppeChillemi

[18:23](#msg5cf41432702b7e5e761a102b)@toomasv I mean the arrows that connect 2 objects should have a text so you can add YES/NO to the lines coming out from the edge of a diamond shape; or another text on the lines of any other shape to another.  
The specification "they should point to a row/column and/or generate from a row/column" is meant to connect a value in a cell to another value located in a cell of another table or in the same table. Think about a database diagram where you connect a field to a foreign key to mark the relationship and adding a description or a symbol, at the start, the middle or the end of the connetion line.

toomasv

[18:25](#msg5cf414a565392c3b60aa5fed)Something like UML or IDEF?

GiuseppeChillemi

[18:31](#msg5cf415f6cea8295279df4ae2)Yes, something like  
\[!\[image.png](https://files.gitter.im/red/chit-chat/qTDN/thumb/image.png)](https://files.gitter.im/red/chit-chat/qTDN/image.png)

[18:31](#msg5cf415fa65392c3b60aa6710) for text on lines

[18:32](#msg5cf416337c1dab468c8cbc59)Or like

[18:32](#msg5cf416369b50f639356ea604)\[!\[image.png](https://files.gitter.im/red/chit-chat/Qx2R/thumb/image.png)](https://files.gitter.im/red/chit-chat/Qx2R/image.png)

[18:32](#msg5cf4164e65392c3b60aa6811)to have a specific start point/end point in a table

[18:36](#msg5cf41742702b7e5e761a2317)\[!\[image.png](https://files.gitter.im/red/chit-chat/szfX/thumb/image.png)](https://files.gitter.im/red/chit-chat/szfX/image.png)

[18:37](#msg5cf417589b50f639356eace3)(Above is another diagram with text on or near lines)

[18:38](#msg5cf417c3faac6439342bbc8b)@toomasv Your example:  
&gt; @GiuseppeChillemi Do you mean statical arrows, defined in text, or dynamically, like this:  
&gt; \[!\[table-arrow](https://toomasv.red/images/Table/table-arrow.gif)](https://toomasv.red/images/Table/table-arrow.gif)  
&gt; @BeardPower @rebolek's `text-table`.

Is really good for internal arrows for cells of the same table in case yu don't want an outside connection.

endo64

[18:47](#msg5cf419a5481ef4167bbbd95c)I do think those features are a bit too much for a table, at least we should have a basic table first and then we may add fancy features. So better to have a list of features of a basic table like column headers, copy cell content to clipboard, sorting etx.

[18:48](#msg5cf41a166fc5846bab4eab22)then a second list of nice to have features like, column select, roe select, arbitrary selection and copy of multiple cells, inline edit &amp; paste into (multiple) cells.

[18:50](#msg5cf41a72f3a60a79a4414206)And last the fancy features, connect table directly to a db table or result of a query just like the old vb tables that can connect directly using ado.net or oledb.

toomasv

[20:06](#msg5cf42c405de053468bffd7a4)@endo64 :+1:  
@GiuseppeChillemi I added some lines to `diagram-style`. Not updated online yet.

[20:06](#msg5cf42c4582c2dc79a53d0d1a)

```
view dia [
	style cell: node box 50x20 0
	diagram [
		below origin 0x0 space 0x-1
		t1k1: cell "key1"
		t1k2: cell "key2"
		cell "field1"
		cell "field2"
		cell "field3"
	]
	pad 30x30 diagram [
		below origin 0x0 space 0x-1
		t2k1: cell "key1"
		cell "key2"
		cell "field1"
		cell "field2"
		cell "field3"
	]
	pad 30x-20 diagram [
		below origin 0x0 space 0x-1
		t3k1: cell bold "primary"
		cell "field1"
		cell "field2"
		cell "field3"
	]
	
	connect arrow from :t1k2 to :t2k1
	connect arrow from :t1k1 to :t3k1 hint 75
]
```

\[!\[image.png](https://files.gitter.im/red/chit-chat/DYj4/thumb/image.png)](https://files.gitter.im/red/chit-chat/DYj4/image.png)  
I'll work on edge labels in coming week.

GiuseppeChillemi

[20:29](#msg5cf431a79b50f639356f5b76)@endo64 There my bounty for a list-view (text-table). While @rebolek wase developing it another used proposed contribute to the bounty to make a more complete list-view. While writing the specification sheet I had suddenly to change my priorities thanks to my company difficulties which drained time and willingness, so I have not completed the specs. The project has been stopped and the bounty half paid.

[20:31](#msg5cf43230faac6439342c5ee8)@rebolek Has great experience regarding it has he developed a text-table for R3. Spec have been provide from Robert Munchen and they where based on Herik Michael Cristensen (HMK) List View for VID extension kit (a very powerful list view).

[20:34](#msg5cf432b8e41fe15e75ffa604)The best thing to do is to prosecute into developing a on R3 Text List and VID Extension Kit List-View as they are the standard in the REBOL scenery and there is a deep analisys on it. I currently find them very useful but they have both some limits.

[20:35](#msg5cf433076f530d3b6126b4b6)@endo64 If you whish to join force, or anyone else, either economically and as tech specs we all would gain so desired VID component.

[20:37](#msg5cf43379b76eac527a90deac)Currently the Bounty has been raised to 500USD: 250 by me, other 250 from another partecipant but I do not know if he still is around.

[20:37](#msg5cf4338aff3f016baa93d842)125 (If I remember correctly) have already been payed.

[20:42](#msg5cf434b5cea8295279e01828)I would honor to the original 250USD and anyone could partecipate to push the project to the new level which is R3 Text table + VEK ListView + basic DB interface (Boleslav proposed REDIS). I propose a total bounty of 600 USD. (I could rise mine to 300)

[20:45](#msg5cf4356365392c3b60ab3128)@toomasv Great ! I admire things are so easy for you to implement. Great skill. About text it should be not limited to the edge but it should be somehow on the line, either orizzonal or vertical. But on the edge is already enough if it is to difficult to implement on a position of the line (but is seems it VID and GFX Geometry have no secrets to you, so I ask !)

[20:48](#msg5cf4361d702b7e5e761af464)(Note: text position could be on a % regarding the start of the line, so the middle is 50%, the end 100% and the start 0%.)

[20:49](#msg5cf43655faac6439342c78c2)I think that thanks to your work RED will be able to build diagram of its code and data structure.

greggirwin

[20:50](#msg5cf4368a702b7e5e761af7cd)We plan to sponsor table work, which should use spreadsheets as its basic model for features.

GiuseppeChillemi

[20:55](#msg5cf437c3bf4cbd167c1d29a9)@greggirwin yes, that's the basic. In day to day work there are some needings that Vid Extension Kit list view has fulfilled like row fitering, sorting, cell coloring, subcells, list in list, buttons, images in cells. VEK and R3 Text table should be the base as they have been built on a common ground and on real applications. Standard model for data should be BLOCK of BLOCKS \[\[ROW]\[ROW]]. VEK inplemented an object based model, a block of blocks model and a flat model. The first is more flexible for column selection but BLOCK of BLOCK with headers on the FIRST line is easier to handle and should be used..

[21:24](#msg5cf43ea2ff3f016baa9422a4)(@viayuve was the other sponsor but I don see activity from him since december)

## Monday 3th June, 2019

rebolek

[06:25](#msg5cf4bd4af3a60a79a44546ce)@GiuseppeChillemi Redis was more an example what I may implement first, because it's DB I know best. And now I've got it working in Red also, so it would be really easy. But connections to other DBs are of course possible too.

GiuseppeChillemi

[07:21](#msg5cf4ca7b9b50f63935732a0d)@rebolek Yes, I remeber you proposed REDIS to have a basic connection model and later expand it to other databases. Text-Table(list-view) seems now a need for the whole community. I'll try to force myself to not write here and dedicate my time to completing the specs so we can move on from this stagnation, you time permitting.

endo64

[08:15](#msg5cf4d73a5de053468b043682)We can have more than one table component as well, in old VB days I remember 2 or 3 different tables I was using according to my needs. MSFLEXGrid was pretty fast, able to merge rows and columns just like Excel, others can directly connect to db and edit cells.

[08:16](#msg5cf4d7659b50f639357380a4)So after having a feature list we can divide the features into multiple table components.

[08:17](#msg5cf4d7a1e41fe15e7503b2ca)For filtering, sorting etc., we might use Ashley's `munge`.

nedzadarek

[08:28](#msg5cf4da2b481ef4167bc0ad15)@greggirwin  
&gt; Because Red is native UI only right now, the rules are different, but the ideas will always be the same.

So, for current supported OS' - is it UI good enough?

BeardPower

[08:54](#msg5cf4e035bf4cbd167c2161b6)@toomasv @greggirwin @rebolek I followed @rebolek's table implementation. Wasn't it getting slow with a lot of data? Speaking of a sponsored tabled/spreadsheet implementation: a good and often used data structure for that is a DAG. Should we implement a fast DAG in R/S as a data-type?

rebolek

[08:56](#msg5cf4e0d265392c3b60af8aa8)@BeardPower how many is lots? It was fine with few thousand lines, I haven't touched it for some time, so I'm not sure it works with hundreds of thousands.

BeardPower

[08:59](#msg5cf4e159bf4cbd167c2168dd)@rebolek Its in that ball park: about 1k lines. Thanks!

[08:59](#msg5cf4e178702b7e5e761f1bb2)They would be updated in a certain interval: &lt; 1 second.

rebolek

[09:00](#msg5cf4e1c15de053468b04830c)@BeardPower my main test file was list of all coins on coinmarketcap, so some 1000-2000 lines and update time was around 0.015 sec.

[09:01](#msg5cf4e1f66fc5846bab53a064)Of course, just 10-20 were visible.

BeardPower

[10:02](#msg5cf4f023702b7e5e761f8472)@rebolek Sounds good.

[10:02](#msg5cf4f032bf4cbd167c21cf66)Are you streaming the data?

rebolek

[10:22](#msg5cf4f4d6e41fe15e750483a1)No, this was tested on local data. `read` would be much slower than text-table rendering.

greggirwin

[16:45](#msg5cf54ea66f530d3b612e1513)@endo64 my favorite was TrueGrid. :^)

[16:50](#msg5cf54fbe702b7e5e76223f8e)@BeardPower DAG seems like it would be better done as a dialect, which could then use a block or hash as its underlying structure. Certainly useful, and should consider reactivity. Not only great for a spreadsheet engine, but also a MAKE/build system.

[16:50](#msg5cf54fe5702b7e5e762240bf)What do you see at the benefit of making it a datatype, and how would standard actions apply to it?

GiuseppeChillemi

[17:29](#msg5cf558ebfaac64393433f9f6)@BeardPower DAG stands for ?

rebolek

[17:30](#msg5cf55939481ef4167bc41b81)DAG is TLA :stuck\_out\_tongue:

[17:30](#msg5cf55953faac64393433fdf6)And TLA is PIA.

pekr

[17:38](#msg5cf55b0b6f530d3b612e6dd9):-)

greggirwin

[17:43](#msg5cf55c51faac643934340fd1)DAG = Directed Acyclic Graph

GiuseppeChillemi

[17:53](#msg5cf55ead7c1dab468c955c5d)@greggirwin is it a chemical compound? 😁

[18:00](#msg5cf560539b50f63935775273)In our company we usually produce about 15000 lines per year. We make a lot of searches on it using different fields. It's a common value for small companies working on distribution. Bigger one could reach million hundred an million of lines per year. I think that the list view should be able to filter quickly on a set 100-200k lines. But that's my need and opinion. Fell free to request rapid queries on 1M lines.

greggirwin

[18:13](#msg5cf5634f9b50f639357767f7)Thanks for the numbers @GiuseppeChillemi. Very helpful. The thing we have to remember is that the data doesn't all have to be \*in* the list. So we need to manage the data, filter, etc., then display results effectively.

GiuseppeChillemi

[19:14](#msg5cf571a2bf4cbd167c259ab0)@greggirwin yes, a multisteps step approach where displayed data is subsets of a buffer of filtered data coming from the main data source.

[19:18](#msg5cf5727c6fc5846bab57c2a0)Example:

Displayed 30 Rows  
^  
Buffer 1000 Rows  
^  
(filtering on the main dataset per field or from position to position)  
^  
Main data set 300.000 Rows

BeardPower

[19:59](#msg5cf57c1b481ef4167bc50e68)@GiuseppeChillemi Directed Acyclic Graph

[20:01](#msg5cf57c88e41fe15e75085365)@greggirwin Being a data-type we could have spreadsheets as a battery-included. Standard actions like find, insert, append, remove etc. can be applied. It's also great for having reactive features.

nedzadarek

[20:04](#msg5cf57d59f3a60a79a44aaf2e)DAG sounds like it's Neo4j thing.

greggirwin

[20:08](#msg5cf57e34481ef4167bc51ab5)@BeardPower, we can include it as a dialect as well, like `[parse vid draw math]`.

I aksed about actions because a graph is not linear, so how are series operations applied? Just a mockup of ideas, how you see it working, would be great. Doing that at the mezz level is faster and easier, and then we can see if it's worth porting to R/S and how it would work as a datatype.

## Tuesday 4th June, 2019

BeardPower

[20:25](#msg5cf6d3b965392c3b60bd604c)@greggirwin I will write something together.

[20:33](#msg5cf6d589b76eac527aa2b8b4)A DAG can be made linear through linear extensions or an empty DAG. A DAG is also useful for compiler optimisations, compression and a lot more.

[20:34](#msg5cf6d5decea8295279f21b84)A linear DAG is just having each vertex's edge pointing to the next vertex.

[20:35](#msg5cf6d601cea8295279f21c74)Ring-buffer, double linked list behaviour etc.

[20:35](#msg5cf6d611cea8295279f21c93)Spreadsheet updating it's cell values.

## Wednesday 5th June, 2019

toomasv

[13:37](#msg5cf7c599ff3f016baaabd5f0)Some arrows with labels  
\[!\[image.png](https://files.gitter.im/red/chit-chat/YTKz/thumb/image.png)](https://files.gitter.im/red/chit-chat/YTKz/image.png)

BeardPower

[15:09](#msg5cf7db259b50f63935880280)What the heck https://www.theverge.com/tldr/2019/6/4/18652484/microsoft-xbox-lynx-body-wash-axe-lifestyle-gaming-products

toomasv

[16:53](#msg5cf7f38fff3f016baaad42e4)VID is amazing  
\[!\[VID-arrows](https://toomasv.red/images/Diagram/VID-arrows.gif)](https://toomasv.red/images/Diagram/VID-arrows.gif)

```
view dia [
	space 50x20
	fld: field focus on-enter [append list/data face/text]
	connect arrow label start "<Enter>" list: text-list data []
	connect arrow label [mid right] "<Press>" button "Check" [
		chk/data: (last list/data) = chk/text
	] return
	connect arrow hint vertical to right
	chk: check "Amazing?"
]
```

Oldes

[17:27](#msg5cf7fb97b76eac527aaa794f):-)

[18:31](#msg5cf80a6fe41fe15e7519bd1a)How to name a function, which would convert string like `{\u0027Spiky moss\u0027}` into `{'Spiky moss'}`?

greggirwin

[18:59](#msg5cf8110265392c3b60c5b3cf)Very cool @toomasv. So many possibilities for how to use these things.

[19:02](#msg5cf811cb3dcdab4003f64c18)@Oldes converting unicode chars, quote conversion only, or general substring replacement?

Oldes

[19:03](#msg5cf811fc65392c3b60c5bc08)I need to convert these unicode escaped chars into utf8 now, but could probably handle also cases like `\n`

greggirwin

[19:13](#msg5cf8146c3dcdab4003f65f58)`unescape`, with refinements, or args, for more precise control?

GiuseppeChillemi

[23:21](#msg5cf84e75481ef4167bd8221f)@toomasv 😍😍😍!!!

[23:22](#msg5cf84e9b3dcdab4003f7d8ee)2 questions

[23:22](#msg5cf84ecbcea8295279fc57e0)Could a small images be used in place of geometric shapes?

[23:23](#msg5cf84f0465392c3b60c74d27)Could the drawing be bigger than the visible area of the window?

[23:25](#msg5cf84f609b50f639358b406f)Next week I'll be back from my travel and I'll go deep on your dialect.

## Thursday 6th June, 2019

AlexanderBaggett

[19:02](#msg5cf96333faac6439344f7b43)@toomasv , I love your demos. Always so cool.

toomasv

[19:05](#msg5cf9640b3dcdab4003ff592a)@AlexanderBaggett Thanks!

## Sunday 9th June, 2019

GiuseppeChillemi

[21:18](#msg5cfd7799f3a60a79a4811433)@greggirwin yes, possibilities are infinite! I am on travel. This week end I'll be back and I will finally try his diagram dialect.

## Monday 10th June, 2019

toomasv

[10:44](#msg5cfe3479bf4cbd167c60223f)Added `drag` and `wheel` keywords to `diagram` style to turn diagrams easily into dragable/wheelable. Two examples:  
\[arrow-demo](https://toomasv.red/images/Diagram/VID-arrows-drag.gif) and \[type-hierarchy](https://toomasv.red/images/Diagram/type-hierarchy.gif) recreated with `diagram` style.

Phryxe

[10:59](#msg5cfe382984c08f54140a60de)@toomasv Love the GIFs ... I see you seldom use `title:` :ticket: Any special reason? :smile:

toomasv

[11:38](#msg5cfe4140e41fe15e754370a6)@Phryxe Nope. Good reminder, will try to remember.

greggirwin

[17:27](#msg5cfe9302e41fe15e7545e8e7)I often guess wrong when navigating maps or large photos, because there's little consistency in wheel handling. Sometimes it scrolls, sometimes it zooms. Have any UIs solved this, to offer affordances and provide hints? I can imagine people wanting to make interactive, drag-and-drop diagram editors. As with GUI editors, it's a tradeoff. Much easier to generate absolute positions, rather than VID or smart diagram dialect. I did a hybrid experiment many years ago, where you could write VID, and then it would use the generated face tree for the DnD editor. So there was no way to round trip, but you could use VID as a dev, and then hand off your layout to a designer. I think @toomasv and others have gone beyond that with their GUI experiments in the past two years.

toomasv

[18:00](#msg5cfe9ab93dcdab4003223003)I thought of adding zoom with shift-wheeling. Currently normal wheel scrolls up/down, and ctrl-wheel left/right. Don't know yet how to offer hints.

greggirwin

[18:02](#msg5cfe9b3be41fe15e754625bc)Hints are often just text on the screen. :^)

My wheel also does left-right, but we don't have those events yet.

[18:03](#msg5cfe9b6884c08f54140d577b)Another way to do it is with an option widget in the UI, that determines whether to scroll or zoom. Then it's a visible affordance as well.

nedzadarek

[21:57](#msg5cfed2474dfb424004b326f8)@toomasv how about wheel-scrolls =&gt; up/down, middle button hold + movement =&gt; scrolling in certain direction:

```
view [
    do [
        mid-offset: none
    ]
    base all-over 
    on-mid-down [mid-offset: event/offset] 
    
    on-over [
        if mid-offset [
            change-offset: event/offset - mid-offset
            probe change-offset
        ]  
    ]
    
    on-mid-up [mid-offset: none]
]
```

and zooming with ctrl+scroll

## Tuesday 11st June, 2019

viayuve

[06:12](#msg5cff463484c08f5414120782)@GiuseppeChillemi @rebolek I am just waiting for ports to come in, to make life bit easier. Waiting for new "UPDATEs" @greggirwin If we can get at least sqlite support in built would be nice too.

[06:16](#msg5cff474de41fe15e754ab5ff)I am still open to finance

[06:16](#msg5cff475b481ef4167b075362)table

[06:18](#msg5cff47d2b76eac527adbfc97)I guess with android support sqlite support will come in.

rebolek

[06:22](#msg5cff48a665392c3b60f70e03)There are SQLite libraries for Rebol, so I guess when we'll get ports, it's just a matter of time.

[06:23](#msg5cff48db84c08f54141217a6)If someone's interested, it's possible to start today with current version of ports.

viayuve

[06:30](#msg5cff4a6be41fe15e754aca9d)@rebolek did you found any time to make updates on text-table? I still don't understand why table is not default face with scrolling. VB do have nice table support. I tried QT and It have table support on almost all platform.

rebolek

[06:35](#msg5cff4b9bf3a60a79a48dd6c0)@viayuve Scroller needs to be attached manually now, as it's separate style and there's no inbuild scroller in VID yet. But I'll lake a look at it, it wouldn't be hard to add it. It will just add some unnecessary lines to code.

toomasv

[07:10](#msg5cff53e46fc5846bab9b0163)@nedzadarek I enable wheeling and dragging separately and use `drag-on` option for dragging. The kind of thing you propose I have used for drawing, but to drag things around with middle button, the easy way is

```
view [size 100x100 base options [drag-on: mid-down]]
```

GiuseppeChillemi

[07:20](#msg5cff5644d4e3840c6968b9fe)@toomasv, do the diagram objects have actors so you can act on click/double click/alt click on them?

toomasv

[08:08](#msg5cff6198f3a60a79a48e6d34)@GiuseppeChillemi You can add actors to these as in normal VID

[08:22](#msg5cff64d684c08f541412c69f)But they don't accept `on-click` (only `button` does), and I have to think of better usage for `on-down` (it's currently waiting for `url` address for `link`).

GiuseppeChillemi

[09:23](#msg5cff730782c2dc79a589b2f9)@toomasv other questions: when you drag an object of the diagram it changes its original position. Is there a way to get it and restore later ? Either absolute or relative one.

toomasv

[09:54](#msg5cff7a58702b7e5e76677071)@GiuseppeChillemi Do you mean dragging `loose` face or dragging with `drag` keyword on `diagram` style? In latter case the original offset is 0x0. To put it back to 0x0 is possible, but a bit convoluted. Like e.g. here:

```
view dia [
    style ring: node ellipse 30x30 
    diagram 70 drag beige with [
        append body-of :actors/on-up bind [
            face/offset: 0x0 show face
        ] :actors/on-up][
        ring connect pad 50x0 ring
    ]
]
```

With `loose` faces you can use menu, as e.g. here:

```
view dia [
    size 200x200 
    node "Hi" loose with [
        menu: ["Record pos" record "Restore pos" restore]
    ] 
    on-menu [
        switch event/picked [
            record [pos: face/offset] 
            restore [face/offset: pos]
]  ]  ]
```

The last one is general, not specific to `diagram`. Should be possible to use with `drag` also, I didn't try yet.

nedzadarek

[13:21](#msg5cffaadf60d850045707c53d)&gt; @nedzadarek I enable wheeling and dragging separately and use `drag-on` option for dragging. The kind of thing you propose I have used for drawing, but to drag things around with middle button, the easy way is  
&gt;

```
> view [size 100x100 base options [drag-on: mid-down]]
>
```

@toomasv I mean moving something up &amp; down by moving wheel up &amp; down feels natural but using key + wheel to move left &amp; right is not natural. Hence, I suggested only middle button (as in the Firefox) as it is less thing to remember.  
ps. you have to hold middle button... it's not bad. And it nice snipped, I will save it.

greggirwin

[16:29](#msg5cffd6cc4dfb424004b9e73b)@viayuve there are a \*lot* of design decisions that have to be made for a `table` style. It's not a native widget we can wrap that will work consistently on all platforms. It's a biiiigggg task. But we can start with simple things and experiment. Just be aware that it may change.

## Wednesday 12nd June, 2019

viayuve

[06:07](#msg5d00968aa30be21ff9f57035)@greggirwin thank you sir, I can understand. that is why I am patiently waiting. good news? https://www.zdnet.com/article/programming-languages-python-predicted-to-overtake-c-and-java-in-next-4-years/ instead of python I would like to see "RED"

[06:07](#msg5d009697051da7532d8413fc):)

nedzadarek

[08:53](#msg5d00bd7c2d3f89045fa7303f)@viayuve it's long way before the Red could think of taking top spots.

Respectech

[19:16](#msg5d014f7f209ae3263ab97b44)I think it would be awesome to figure out how to code for Godot in Red: https://godotengine.org/features (see the section called "SCRIPT WITH FULL FREEDOM")

Oldes

[19:42](#msg5d01559772e57326078dce58)@Respectech Looks quite complicated. Lua, Squirrel and Python failed as is noted here: https://docs.godotengine.org/en/3.1/getting\_started/scripting/gdscript/gdscript\_basics.html

[19:44](#msg5d01560dc5386926f6dacf21)Having more time, I would rather played with Sokol: https://github.com/floooh/sokol (for HW rendering) and Blend2D: https://blend2d.com/ (for SW rendering)

greggirwin

[20:35](#msg5d01620ac12fd52664f7c704)@Respectech that sounds like a huge task. If you wanted to experiment, libRed is the place to start. But you still need to know Godot in depth to integrate anything. Unless I'm missing something. And then we have to ask what the win is for Red, in how it makes us more sustainable.

We can learn a \*lot* from various game engines and tools. Especially the types they need and bindings they use. But people building them are laser focused on that area, and we are not.

## Friday 14th June, 2019

nedzadarek

[19:31](#msg5d03f5f4f5cf1f10bc718ee0)@Oldes As per \[site](https://godotengine.org/article/godot-getting-more-languages) they call themselves "experts" but I wonder whenever or not they are truly experts. People managed to do game engines in \[the Python](https://docs.blender.org/manual/en/latest/game\_engine/introduction.html#use-cases-and-sample-games) or in \[the Lua](https://www.gamefromscratch.com/post/2018/09/06/Lua-Game-Engines.aspx) so it's not that those languages are bad.  
ps. I am not saying they Godot developers are stupid. I just am saying that those languages are capable of doing 3d things. Whenever or not they are good choice for Godot - it is another thing.

## Saturday 15th June, 2019

Oldes

[07:27](#msg5d049deba8d9871b328e6d09)@nedzadarek they don't claim that these languages are bad and not capable.. just that using them for binding was slow and complex work.

[07:27](#msg5d049df8ecc6a91b31eaaf64)\_Lua is fast, but creating bindings to an object oriented system (by using fallbacks) was complex and slow and took an enormous amount of code._

nedzadarek

[13:30](#msg5d04f3112313502d38491e2f)@Oldes :+1:

## Tuesday 18th June, 2019

nedzadarek

[10:54](#msg5d08c2c9e527d95addfc858c)@Oldes yes, people are pushing 4k, 8k etc so I don't expect size goes lower.

BeardPower

[10:54](#msg5d08c2f8a8d9871b32b2d7c8)100GB for a Game is the standard in the upcoming years.

[10:56](#msg5d08c36426477710bbd75b58)Who needs 8k? You cannot see any pixels in 4k. If you are not able to see a dust-particle you will not see one twice as small ;-) It's all about posing. It makes no sense except for some 100'' TV and up...

nedzadarek

[10:59](#msg5d08c3f76f0ec85ade334a8e)@BeardPower for 4-8k data I heard it's more about having more data (pixels) to optimize images for smaller screens.

BeardPower

[11:00](#msg5d08c43826477710bbd76fd9)@nedzadarek It will not make any sense as 2k would hold enough data to shrink it down. Shrinking is not an issue as you throw away data, upscaling is.

[11:00](#msg5d08c4668e050f62aa440fe7)Deep learning can do MAGIC to upscaling.

[11:01](#msg5d08c4808e050f62aa44139f)4k and especially 8k is just a posing game.

nedzadarek

[11:01](#msg5d08c484a8d9871b32b2f984)@BeardPower you are not throwing data... it's more you are merging few pixels.

BeardPower

[11:01](#msg5d08c492fbcc305cc4983405)5k Monitors, 6k... no normal users needs that.

[11:03](#msg5d08c4ee26477710bbd77cbe)&gt; @BeardPower you are not throwing data... it's more you are merging few pixels.

Of course you are thrwoing away data. 4k has more pixels than 2k so you throw them away. Sampling the pixels is just that: throwing away imformation by averaging.

[11:03](#msg5d08c51b26477710bbd78112)2 + 2 +3 + 5 -&gt; 4 values sampled to 1.

nedzadarek

[11:05](#msg5d08c57cfaf70031f93d4331)I mean that for 4 pixels you are not just picking 1 pixel, but you are combining them together... in the simplest algorithms

BeardPower

[11:10](#msg5d08c689f5cf1f10bc9a51b4)Yes and that's loss of information.

[11:10](#msg5d08c6a5325b465cc354a13a)You cannot pour 2 litres of water into a 1 litre bottle.

[11:11](#msg5d08c6e6fbcc305cc49864f1)Red Red Green Blue -&gt; mashed together. You are losing the information of Red Red Green Blue.

[11:11](#msg5d08c6ffecc6a91b310f6c30)You are not able to get back Red Red Green Blue -&gt; loss of information.

nedzadarek

[11:12](#msg5d08c70e950f1062a9978436)Yes, we are losing information but

BeardPower

[11:12](#msg5d08c7348e050f62aa444b23)But?

nedzadarek

[11:13](#msg5d08c7408e050f62aa444b64)you are making 4k better

BeardPower

[11:13](#msg5d08c75da8d9871b32b33678)How? You are mashing together pixels.

[11:14](#msg5d08c779a8d9871b32b3397a)It's just a better "compression".

[11:14](#msg5d08c787bc56c731f8e51161)You will get artifacts.

[11:14](#msg5d08c7a4faf70031f93d725d)How would 8k compressed to 4k make a better image if you already cannot spot a pixel in 4k?

[11:14](#msg5d08c7b2bb789747fb2e6d1e)It makes zero sense.

[11:15](#msg5d08c7cea8d9871b32b340ac)You already HAVE a perfect picture in 4k because you cannot see any pixels.

nedzadarek

[11:17](#msg5d08c84bfbcc305cc4987ecd)I am good with "full HD" resolution but taking this aside, it's not that as simple as mashing pixels together. They are using other, more sophisticated techniques.

[11:18](#msg5d08c869ecc6a91b310f8bb6)"Mashing pixels" was just simple example.

BeardPower

[11:18](#msg5d08c895f5cf1f10bc9a80aa)All techniques boild down to mashing together multiple pixels to 1 pixel.

[11:18](#msg5d08c8a0e527d95addfd0a52)That's how those algorthms work.

[11:19](#msg5d08c8b9fbcc305cc498886a)muliple pixels go in -&gt; mashing algorithn -&gt; 1 pixel comes out

[11:20](#msg5d08c8e2ecc6a91b310f95b0)Mashing/mixing/interpolating.

[11:20](#msg5d08c8f9325b465cc354cde2)It's just a filter.

nedzadarek

[11:20](#msg5d08c915ecc6a91b310f98a6)But the harder thing is "how". You can just take an average of 4 pixels and call it a day. But it may be more complicated.

BeardPower

[11:21](#msg5d08c930f5cf1f10bc9a8ce7)The "how" is meaningless. It still is a filter.

[11:21](#msg5d08c9482313502d386b3e1e)It can be the most sophisticated filter of all times, it still is a filter.

nedzadarek

[11:22](#msg5d08c965a8d9871b32b3650a)It's meaningful - one technique can be better than other.

BeardPower

[11:22](#msg5d08c97cd100e447fc3ea4e3)The definiton of a filter is REMOVING things.

[11:23](#msg5d08c99d8e050f62aa44809e)I never said that it's not meaningful, I said it's information loss, which you denied.

[11:23](#msg5d08c9b2ecc6a91b310fa3d4)8k downsampled to 4k is meaningless because you cannot spot any difference!

nedzadarek

[11:23](#msg5d08c9bbecc6a91b310fa447)&gt; The "how" is \*\*meaningless\*\*. It still is a filter.

BeardPower

[11:23](#msg5d08c9be950f1062a997bd7c)You cannot see a single pixel in 4k.

[11:24](#msg5d08c9d7950f1062a997c049)All those techniques are lossy.

nedzadarek

[11:24](#msg5d08c9f7faf70031f93da8e7)&gt; which you denied.

no

BeardPower

[11:25](#msg5d08ca2a8e050f62aa448ad5)&gt;@BeardPower you are not throwing data...

You did.

[11:25](#msg5d08ca47bc56c731f8e54abd)A filter is always throwing away data. That's what a filter does.

nedzadarek

[11:27](#msg5d08ca8dbc56c731f8e553b9)^^ well, I should write "simply throwing"

rebolek

[11:27](#msg5d08ca9326477710bbd7f279)well, resonant filters are also adding data to sound at least :-)

nedzadarek

[11:30](#msg5d08cb3efbcc305cc498bd00)^^ I'm not good with sound stuffs so I have to believe you.

BeardPower

[11:30](#msg5d08cb6be527d95addfd401c)@rebolek Made with a filter that takes things away. But I guess we agree that pixels are not exploitable to resonance ;-)

rebolek

[11:31](#msg5d08cba52313502d386b6f13):)

[11:32](#msg5d08cbb826477710bbd80ec0)It could be nice experiment though :)

BeardPower

[11:32](#msg5d08cbe0f5cf1f10bc9acb38)So let's try to get twice as red by resonating red :-)

[11:33](#msg5d08cc056f0ec85ade33f14e)Would be difficult because there is only red.

[11:33](#msg5d08cc2726477710bbd816dd)red + red = red

nedzadarek

[11:35](#msg5d08cc6c325b465cc3551201)@BeardPower you could change only Red channel or change color into HSV and change Saturation.

BeardPower

[11:40](#msg5d08cdc8325b465cc3552f30)@nedzadarek You would not get red, but a different color.

[11:41](#msg5d08cdd92313502d386b9950)Red is 255.0.0 in RGB.

[11:41](#msg5d08cddf8e050f62aa44cfa0)Everything else is NOT Red.

[11:41](#msg5d08ce06faf70031f93e0852)The color Red has a clear defintion.

[11:42](#msg5d08ce2b325b465cc3553674)There is only ONE pure Red.

rebolek

[11:43](#msg5d08ce4ed100e447fc3f1245)You can overflow to green

BeardPower

[11:43](#msg5d08ce54e527d95addfd7fcf)There is also only one White, one Black etc.

[11:43](#msg5d08ce716f0ec85ade341de6)@rebolek Only in the virtual world but not the real world.

rebolek

[11:44](#msg5d08ce876f0ec85ade342164)who cares about real world ;)

BeardPower

[11:44](#msg5d08ce978e050f62aa44dade)I see you will play as Netrunner in Cyberpunk 2077 ;-)

rebolek

[11:45](#msg5d08cedbe527d95addfd8a7a)I doubt that Cyberpunk 2077 runs on Intel 4600 gfx :-) But there are good old 90's cyberpunk games that do :)

BeardPower

[11:45](#msg5d08ceedf5cf1f10bc9b0b3b)Yeah, the old ones are nice as well.

[11:46](#msg5d08cf0a6f0ec85ade342be0)Buy some new upcoming Intel/AMD. They have a very decent integrated GPU!

[11:47](#msg5d08cf3dfbcc305cc499116f)But scrap it, get some Apple monitor stand instead ;-)

rebolek

[11:50](#msg5d08d0006f0ec85ade34421b)For new CPU I would need to replace my motherboard too. And 4790k is still very decent CPU. So I'll buy some second hand RX580 instead when I'll need better gfx.

BeardPower

[11:51](#msg5d08d04dfbcc305cc499248e)Sounds like a plan. I hate that you have to buy new MOBOs with new sockets all the time.

rebolek

[11:53](#msg5d08d0a88e050f62aa4505f1)I hate it too, but unfortunately there's no other way. The MOBO logic needs upgrades too.

BeardPower

[11:53](#msg5d08d0d6bc56c731f8e5dd1d)There is a way: Mill ;-)

rebolek

[11:54](#msg5d08d0eefbcc305cc499326f)Ok, send me a link to some shop ;-)

BeardPower

[11:54](#msg5d08d10f2313502d386bdd8e)Everything has a catch.

[11:55](#msg5d08d121d100e447fc3f4d88)Still no news.

rebolek

[11:56](#msg5d08d1622313502d386be633)So I'll keep using Intel then :-(

pekr

[12:05](#msg5d08d391faf70031f93e75f5)Is RISC-V more real than Mill?

rebolek

[12:05](#msg5d08d3a6a8d9871b32b4468a)you can buy RISC-V board right now

[12:06](#msg5d08d3c2bb789747fb2f5e2b)there is office full of guys working on RISC-V next doors to me

nedzadarek

[12:21](#msg5d08d7444e8f972d37479f5a)@rebolek X in the X.0.0 is the "red channel" not red color. If wikipedia is a good \[source](https://en.wikipedia.org/wiki/Red) then:  
&gt; Red is the color at the end of the visible spectrum of light, next to orange and opposite violet. It has a dominant wavelength of approximately 625–740 nanometres.\[1]

So it's not only one value.

And even then, RGB is not the best model for colors.

rebolek

[12:22](#msg5d08d79afbcc305cc499bab3)But it's an integer, so I can overdrive it into green!

nedzadarek

[12:23](#msg5d08d7d2f5cf1f10bc9bc106)@rebolek if you are using RGB and programing language type is "good enough" then you cannot. HSV on the other hand...

rebolek

[12:24](#msg5d08d813fbcc305cc499c363)programming language that won't let me overdrive red value is not good enough for me!

[12:26](#msg5d08d85efaf70031f93ee4b9)I just wonder what should happen when I'm full on red, green, blue and also alpha, but I still want to add more power...

nedzadarek

[12:26](#msg5d08d88e950f1062a998fd26)@rebolek I mean if you have `r.g.b` value like `1.1.1` and you add `999.0.0`, Green &amp; Blue shouldn't changed (they should still have 1 &amp; 1 value).

rebolek

[12:26](#msg5d08d892d100e447fc3fe950)we need new color mode, one that goes to eleven https://www.youtube.com/watch?v=4xgx4k83zzc

nedzadarek

[12:27](#msg5d08d8cfbb789747fb2fc6ad)&gt; I just wonder what should happen when I'm full on red, green, blue and also alpha, but I still want to add more power...

You could go to the colors not visible by human eyes... but that's not very useful.

[12:34](#msg5d08da38bc56c731f8e6b27a)&gt; we need new color mode, one that goes to eleven https://www.youtube.com/watch?v=4xgx4k83zzc

There're many color models, so far I have tried RGB(A), HSV/HSL and CMYk. There are other that are harder to convert so I haven't tried them.  
HSV/HSL is nice.

rebolek

[12:37](#msg5d08dafe26477710bbd940c6)I did some HSV/HSL conversion functions for my color picker.

nedzadarek

[12:38](#msg5d08db2d8e050f62aa45dc1c)I have done it too.. I am not sure if it's uploaded or not.

[12:39](#msg5d08db71faf70031f93f257b)https://github.com/nedzadarek/red-colors

BeardPower

[12:39](#msg5d08db8becc6a91b31113737)@pekr Yes. There are some boards and CPUs but nothing high-performance. You can run Linux etc. on some boards but those will cost you 1k USD.

rebolek

[12:39](#msg5d08db97d100e447fc402a8a)That's a lot of conversions, nice.

BeardPower

[12:41](#msg5d08dbe8bc56c731f8e6d6dd)More, I want more! ;-)

rebolek

[12:41](#msg5d08dc0ca8d9871b32b4f7f0)These are the RISC-V guys next door https://codasip.com/

BeardPower

[12:42](#msg5d08dc26e527d95addfea22d)Nice.

nedzadarek

[12:42](#msg5d08dc30325b465cc35659ec)As fair I remember, I have converted most to the RGB and converted from RGB to other models. So it might not be very precise but it was easier.

BeardPower

[13:39](#msg5d08e99d325b465cc3576cad)Thanks for your work!

nedzadarek

[15:46](#msg5d09076d325b465cc359e00b):smile:

## Thursday 20th June, 2019

GiuseppeChillemi

[18:21](#msg5d0bcea2cedb297a818635f0)It was supposed to be an help room for newbies and all the pros are here heping each other!

[18:21](#msg5d0bceb8d4535e477a6c1651)😄

greggirwin

[18:43](#msg5d0bd3d9fd4aa914b50f5da3)Everyone needs help sometimes. :^)

nedzadarek

[20:45](#msg5d0bf051cedb297a81875d0f)@GiuseppeChillemi \*pro* doesn't mean that you cannot be \*dumb\*, make mistakes or just starting to learn something new (maybe out of your comfort zone).

[20:47](#msg5d0bf0f2007cff7a82e7dd06)And I prefer things like gitter because in stack-exchange sites people are being to strict and you cannot ask "complex questions".

GiuseppeChillemi

[22:07](#msg5d0c039fd1aaa16964d9d8d6)@nedzadarek It's good, I enjoied the discussion !

[22:09](#msg5d0c04165bc3210bb768d2ab)@greggirwin Yes, we are all here to help you learning RED. Please ask any question and don't be afraid of making stupid requests ! :)

## Saturday 22nd June, 2019

greggirwin

[17:15](#msg5d0e623c007cff7a82fc39f6):^)

## Tuesday 25th June, 2019

pekr

[04:32](#msg5d11a3d280f91e2d3e899b52)New Raspberry Pi 4 is out, bringing 3x more performance and some nice updates - https://www.raspberrypi.org/products/raspberry-pi-4-model-b/

BeardPower

[08:34](#msg5d11dc8554a9d54980050b40)It's great but limited to 4GB of RAM.

rebolek

[08:34](#msg5d11dcaa95efec2d3d052e94)That's 4x more than Pi3.

AlexanderBaggett

[14:24](#msg5d122eb9ede27801bc8dbbf3)I see on the red trello board that the "Actions for 0.6.5" is completed. Is 0.6.5 coming out soon? Are actions the main addition of the 0.6.5 version?

viayuve

[14:32](#msg5d12308fede27801bc8dcf6e)waiting for 7 to come in.

nedzadarek

[15:22](#msg5d123c4ae9a49c3dabf57155)@BeardPower what would be good amount of RAM for such machines?

BeardPower

[15:28](#msg5d123d9cb03bdb29310390fa)@nedzadarek It depends on what you want to use i for. 4GB could be enough for running \*NIX and use it for browsing, email, a CNC machinc and so on. For other applications you would need 8GB or even 16GB.

[15:29](#msg5d123dbe7c83cf48c3757928)E.g. ZFS needs a lot of RAM (about 2GB).

nedzadarek

[15:35](#msg5d123f2af68cef3827c2d13a)@BeardPower so it's like my laptop - well, thank you for informations.

Respectech

[17:01](#msg5d12535887ca0b48c4963a95)&gt; New Raspberry Pi 4 is out, bringing 3x more performance and some nice updates - https://www.raspberrypi.org/products/raspberry-pi-4-model-b/

The Raspberry Pi 4 is finally is catching up a little. However, I'm pretty sure people are going to have a lot of trouble with the microHDMI ports. Hardkernel (ODROID) moved away from microHDMI ports because of this reason. RPi4 is available for preorder on our webstore: https://ameridroid.com/products/raspberry-pi-4-model-b

## Wednesday 26th June, 2019

BeardPower

[08:23](#msg5d132b8f501ea60f12486345)@Respectech What about http://rockpi.org/? It seems to beat the new RPi 4 ;-)

rebolek

[08:28](#msg5d132c9538c2bf757dbb24c9)It's more expensive and who knows what level of support do you get.

viayuve

[08:53](#msg5d13329ed65dae046f8ed087)how about lattepanda alpha

[08:54](#msg5d1332bd11ba925f6a2789e3)linux and windows

BeardPower

[10:49](#msg5d134dcbb3f22a4b2a3bbfa0)Lattepanda is nice but quite expensive as well.

GiuseppeChillemi

[12:49](#msg5d1369e96fb02f5f6935014a)@rebolek We are discussing about mind mechanism here and I should answer with another question: I have associated the config file under direct control of the extension. Why it happened ?

nedzadarek

[12:50](#msg5d1369fd11ba925f6a29ae48)@BeardPower if win 10 is like 8.1 then I wouldn't buy the Lattepanda. 4GB for integrated graphic card is like bare minimum. Win 8.1 for my laptop eats 2GB.  
Not sure how it would run with a Linux.

BeardPower

[17:47](#msg5d13afa7aacbfb5fb7d1ae5a)@nedzadarek Depending on your distribution 1GB is enough RAM to run.

AlexanderBaggett

[18:09](#msg5d13b4cf11ba925f6a2c7bd1)@toomasv , I would like to talk to you about your syntax highligher.

toomasv

[18:09](#msg5d13b4e6d92cb54b297dc7d1)@AlexanderBaggett PM me

nedzadarek

[19:23](#msg5d13c63f11ba925f6a2d282b)&gt; @nedzadarek Depending on your distribution 1GB is enough RAM to run.

@BeardPower but have you count memory shared with integrated graphic card?

BeardPower

[22:31](#msg5d13f247d65dae046f95ea79)@nedzadarek Good point but you don't run Crysis on that thing, do you? ;-)

## Thursday 27th June, 2019

nedzadarek

[08:30](#msg5d147eac38c2bf757dc70ffb)@BeardPower I'm not sure what those kind of machines are used for. It might be enough RAM for intended usage - I'm just speaking from my personal Win8.1 + laptop usage.

BeardPower

[10:39](#msg5d149ce0b3f22a4b2a479317)@nedzadarek Cheap office SBCs.

[10:39](#msg5d149cef501ea60f1255c089)Office, browsing.

[10:40](#msg5d149d03f040bc5fb6d554af)Development/Hacking/Tinkering/Makers

Respectech

[23:24](#msg5d155048490abf627a2cc862)@BeardPower We've been looking at carrying the RockPi4. It uses the same SoC as the ROCKPro64 and the Khadas VIM2, so support should be pretty good. https://ameridroid.com/products/rockpro64

## Saturday 29th June, 2019

nedzadarek

[07:39](#msg5d1715cda611a04ff19c3e62)@BeardPower that's seems reasonable... and if you need more power you can make "a proper" machine.

BeardPower

[08:17](#msg5d171eb0da128007c68f476a)@Respectech Nice! Do you also carry the "black pill"? Can't find it.

viayuve

[09:47](#msg5d173397da128007c68ffef4)@BeardPower i know you are doing red os can you tell me how I can put red program on direct EFI using gnu-efi basically I want to run red app on pc without os?

BeardPower

[15:53](#msg5d17897a9cbde24b2f3eb0c8)@viayuve You can only use Red/System as you need to get rid of the every run-time and generate a raw binary or an ELF executable.

[15:56](#msg5d178a104db9b92ce36f09f5)Red is using the OS API. You need to get rid of all of it which makes Red pretty useless as you can't use any of it's features anymore.

## Monday 1st July, 2019

AlexanderBaggett

[15:12](#msg5d1a22faffd4b84a8fe9470b)Edit: nevermind that. That was a year ago.

Respectech

[21:23](#msg5d1a79bfa611a04ff1ba09aa)@BeardPower We don't sell the "black pill." Check with the incel community for that.

BeardPower

[21:43](#msg5d1a7e9203d62b4d28c72ef1)@Respectech Thanks!

## Tuesday 9th July, 2019

rebolek

[17:42](#msg5d24d1f1d0e06b667575df40)@9214 Anim-GIF format is pretty easy so it theoretically \*could* be added. But I think most anims are in WebM or something like that anyway.

## Wednesday 10th July, 2019

nedzadarek

[17:58](#msg5d26274cd0e06b66757fb706)Does the gitter broke its right menu (with list of "All conversations")? I cannot hide it.

greggirwin

[18:42](#msg5d2631950c8c4114d90876ea)I've seen some changes too, but don't know if they're intentional or bugs on their end.

dander

[18:47](#msg5d2632b517cc7b05caa7388f)\[!\[UE7PNZZCjb.gif](https://files.gitter.im/red/chit-chat/TOyX/thumb/UE7PNZZCjb.gif)](https://files.gitter.im/red/chit-chat/TOyX/UE7PNZZCjb.gif)

[18:47](#msg5d2632c80c8c4114d9087e6f)Did you perhaps click on this thing?

[18:48](#msg5d263316cdb70805c971d19c)I find myself periodically needing to ctrl-R reload the page to fix its state (especially when switching between different computers)

nedzadarek

[20:50](#msg5d264fadb0027d2b19abbabf)&gt; Did you perhaps click on this thing?

@dander I don't know but clicking closes the left menu. The menu still opens after I reload... I'll play with caches and stuffs tomorrow. Thank you.

abdllhygt

[21:20](#msg5d265683b0027d2b19abeefe)hey!

[21:20](#msg5d265689270d2b1bfa744222)how are you all?

[21:25](#msg5d2657dbf867ec1687e6e72a)i have a new project again haha

## Thursday 11st July, 2019

loziniak

[09:42](#msg5d27049b270d2b1bfa78e11e)Hi guys. I've come across a V language:  
https://vlang.io/  
The toolchain and purpose are similar to Red: Small footprint, cross-compilation (they also work on Android), no dependencies, cross-platform gui, REPL.  
Adding to this self-hosted copiler, hot code reloading, code safety (immutables, generics, no globals), built-in web framework, we get quite an interesting platform.  
It's been recently open-sourced (june). Has anybody used it? What do you think aboit it?

endo64

[10:11](#msg5d270b48eab1bd15a83ea9ff)@loziniak It currently doesn't do what it promised, it transpiles to C and compiles using a C compiler. When it open sourced it comes with a bunch of issues (cannot be compiled on Windows, hard coded file paths etc.)

abdllhygt

[10:16](#msg5d270c90b0027d2b19b0e79a)is there a compiler? i guessed it's scam.

9214

[10:54](#msg5d271554d0e06b6675863af8)@loziniak V is nothing but a buggy C transpiler and copycat of Go, on a level of rushed compiler course assignment project. All of the claims on V's website turned out to be either plain wrong or misleading (see \[here](https://github.com/vlang/v/issues/35) and \[here](https://christine.website/blog/v-vaporware-2019-06-23), although author appended "soon", "WIP" and "TBD" to most of them right before the release). Until recently you couldn't even compile "Hello, world" on Windows or some Linux distros without getting segfault or stumbling on hardcoded paths.

Taking aggressive PR campaign (read \[this](https://news.ycombinator.com/item?id=20250990) thread, esp. the very first message from one of HN moderators) and lack of any tact and skill on author's side into account, I'd say that it's a con scheme on a whole new level. Heck, even binary analysis of his Volt chat client (allegedly written in V) shows that it's a C app compiled with XCode, even author's AppleID is clearly visible in `.data` section.

loziniak

[12:23](#msg5d272a4198934d15a738957a)Thanks, guys! Seems like still a long way to go for a language author. One of the conclusion of the whole situation is that Red is going right path, looking at V's announced features, as \[somebody noticed](https://news.ycombinator.com/item?id=20234006).

## Friday 12nd July, 2019

GiuseppeChillemi

[06:30](#msg5d2829213b41924785a5076a)A piece of history just appeared on Github, the source code of Deluxe Paint 1: https://github.com/DutchmanDavid/DeluxePaint

## Monday 15th July, 2019

nedzadarek

[04:03](#msg5d2bfb0af4fe9439710d2575)@GiuseppeChillemi removed ^^

## Friday 19th July, 2019

abdllhygt

[18:53](#msg5d3211b1f9af9a44ed5619a1)hey!

[18:53](#msg5d3211c4c898801347298ae9)i want to ask about donation

[18:54](#msg5d3211d4985141668731a3fa)which ways do you advice for accept donate?

greggirwin

[18:59](#msg5d3212fdec5abe7bbc129ab2)We don't currently have a donation pipeline in place, but we appreciate the thought!

abdllhygt

[19:00](#msg5d3213658285d81daa24c9f8)@greggirwin what do you mean?

[19:01](#msg5d3213a7b2db751dab933bbb)in the future, i want to take donations for \[my project](https://github.com/abdllhygt/qaja)

greggirwin

[19:09](#msg5d321578b2db751dab93484e)Ah, I thought you meant donating to Red. My mistake.

abdllhygt

[19:10](#msg5d3215a18285d81daa24d9e3)@greggirwin Red team earn by `RED`?

greggirwin

[19:11](#msg5d3215e0d1cceb1a8d87df29)Eventually, yes.

abdllhygt

[19:16](#msg5d3216f4a0351b1a8c61f0e4)thanks for info

## Monday 22nd July, 2019

abdllhygt

[11:21](#msg5d359c2bb2db751dabab3ff8)hi!

[11:21](#msg5d359c52ec5abe7bbc2a4c25)how can i call these determiners;

[11:23](#msg5d359c97b2db751dabab435c)

```
Red
firstgroup: ["a/an" "the" "this" "that"]
secondgroup: ["some" "every" "all"]
```

[11:23](#msg5d359cc4d1cceb1a8d9fb53d)i want to find names for these two group

toomasv

[12:33](#msg5d35ad0509580b7bbb8745a2)@abdllhygt "articles" and "quantifiers"?

abdllhygt

[12:45](#msg5d35afdbc89880134741e6c1)thank you, i mixed them. because, "these some houses" looks useless.

[22:17](#msg5d3635eb808425671cce5b8e)!\[qisau qaja](https://i.ibb.co/yYWkXKv/qisauqaja.png)

[22:18](#msg5d363635808425671cce5e5f)my conlang's name (qisau qaja) means the translation language

[22:25](#msg5d3637f78fe53b671dbc7914)short info...  
there are 4 main blocks in a sentence;  
\- o (phrases) hello, yes, no, okay...  
\- i (subjects) nouns  
\- e (object) nouns  
\- a (verbs) go, learn, eat...  
And meaning of words change by the blocks. example;  
\- o haha (haha)  
\- i hehaha (funny) `he- = adjective`  
\- a haha (laugh)

[22:29](#msg5d3638d5ec5abe7bbc2ed581)and it's free word order, example;  
\- `o no` `i na` `a hama` `e hama`  
\- `a hama` `o no` `e hama` `i na`  
\- ...  
\= no, he eats the meal

## Tuesday 23th July, 2019

endo64

[06:01](#msg5d36a2c25ea6e644ec030151)it feels like I am spelling a magic and when I finish the words I will summon a creature from another dimension :)

GiuseppeChillemi

[07:27](#msg5d36b6d1a0351b1a8c8184d9)@endo64 here I am

endo64

[11:35](#msg5d36f11ee2d1aa6688f517f2)@GiuseppeChillemi :)))

## Wednesday 24th July, 2019

nedzadarek

[17:36](#msg5d389738808425671cdf92da)@endo64 that is the beauty of another constructed language... or, in general, language.

## Sunday 28th July, 2019

abdllhygt

[18:17](#msg5d3de6c5ce271b4acd225733)@9214 hi!

[18:17](#msg5d3de6c8ce271b4acd225736)how are you

9214

[18:24](#msg5d3de86cc356af25e044bb54)Hey @abdllhygt, I'm ok. Nice work on new conlang BTW :wink:

abdllhygt

[18:46](#msg5d3ded93d254cf27df951f43)@9214 thank you, did you understand its logic?

9214

[22:25](#msg5d3e20e0840e2871806231b6)@abdllhygt not really :smile: although it's interesting that you use "mamazo" for "father". In Russian, "mama" is an informal version of "mother".

abdllhygt

[22:27](#msg5d3e2161bdfdb22bbb609ba7)mama = parent, you can pronounce it "baba" or "mama", because m = m/b.  
\-zo = masculine, -po = feminine. so "mamazo" = "father", "mamapo" = "mother"

[22:29](#msg5d3e21c7ce271b4acd23e778)there are blocks for subjects, objects, verbs... so we can write/read free order. example:  
\- `i mama` `e he`  
\- `e he` `i mama`  
\= the parent is good

[22:29](#msg5d3e21ddecf3bf7b1a543036)and parsing is so easy haha

9214

[22:29](#msg5d3e21e72136933a870a4e4b)And "baba" is "grandmother", typically used in the form "baba &lt;name&gt;".

abdllhygt

[22:30](#msg5d3e21fd840e2871806238f7)baba is "father" in turkish and chinese

## Tuesday 30th July, 2019

BeardPower

[19:00](#msg5d4093dfecf3bf7b1a661293)Baba means good buy.

nedzadarek

[19:13](#msg5d4096cba9200c242826e246)In Polish, "baba" can mean female regardless of age too. There are other meanings too.

## Saturday 3th August, 2019

BeardPower

[09:59](#msg5d455af2e939ab2447eac739)Geez. Just noticed my typo: good by 😊

## Thursday 29th August, 2019

Respectech

[01:07](#msg5d67253449ac051923cbbe2d)I have a bit of a problem that I'd like to use Red to help solve.

[01:07](#msg5d6725644b1189084e80f26e)We have about 20 employees. We use time-logging software to allow the employees to log their time.

[01:08](#msg5d67257edbf5ae2d42e127e7)Unfortunately, they are not very accurate (either intentionally or unintentionally). We need to come up with a solution to help audit their entries.

[01:09](#msg5d6725ca3c1aba311bec1c86)One idea I had was to use Bluetooth and WiFi beacon logging to learn which devices correspond to which person, so we can cross-check when their devices are present and gone.

[01:09](#msg5d6725de68406739f99ece25)Of course, we could just use old-fashioned time cards, but this is 2019 and we have Red.

[01:11](#msg5d6726559b381b084f110bce)Unfortunately, `bluetoothctl`, `hcitool`, `hcidump`, `btmon`, and `tcpdump` aren't working reliably to detect the presence / absence of a device.

[01:13](#msg5d6726a207d1ff39f89fa2ec)`tcpdump` is pretty reliable, but it requires that their WiFi is turned on and we have 4 different WiFi networks here for different roles at the company. That means I'd have to figure out how to listen on all 4 WiFi networks.

greggirwin

[17:44](#msg5d680ee4ce6f764db2fc9573)Having a device that calls out seems more reliable, without access to the cell network and location. Maybe a small Red app (once Android build is ready again) that runs on their phone and pings a service every 5/10/15 minutes for presence info. Prototype with a little SBC device where Red runs today.

pekr

[17:48](#msg5d680feced0bf6683aaafe1c)Isn't it easier to employ the people you can trust? :-)

greggirwin

[17:50](#msg5d68105979fc6f3f9efc4da2)He did say it was sometimes unintentional. I'm bad at that myself. For years I've thought about writing a utility to monitor what apps are active as I work, counting time and using title bar text for keys, which may include filenames or other info.

GiuseppeChillemi

[18:42](#msg5d681c7fed0bf6683aab60cb)@Respectech I have exactly the same problem. I need to check the start and stop of activities and monitor them.  
However I have not understood the specific problem you have. Do employes manually enter the start time and end time ? Do they enter data on each other device ?

9214

[18:46](#msg5d681d7106e77851a3135416)@Respectech I would imagine something like GPS or Bluetooth tracking stickers (sorry @greggirwin). Do a research on various BYOD policies and see how people pull this out.

Respectech

[19:52](#msg5d682ce1f94e7d10a163e3cb)I'd prefer to not have to assign something to the employees, like an RFID tag or something. I'd prefer to just be able to audit their coming and going using different methods, and not require them to be running any specialized apps on their devices.

[19:52](#msg5d682d112f10da7cb3578317)One idea I have is using facial recognition with our Red-powered surveillance cameras. It doesn't have to be perfect. It just needs to cut down the amount of data that we need to monitor.

[19:54](#msg5d682d6e5d01296ff540ebdb)@GiuseppeChillemi The employees log their time. Sometimes they work from home on specific projects, travel to a customer site, and then come into the office. I know it will be hard to monitor what they are doing at home and what time they arrive/leave the client. However, the client is more likely to complain if the employee overstates how much time was spent at the client's location as it will increase the cost billed to the client.

9214

[19:54](#msg5d682d77ed0bf6683aabd33a)@Respectech you should check if facial recognition at workplace is somehow regulated. It's getting a big push right now.

Respectech

[19:55](#msg5d682d9879fc6f3f9efd28a1)@pekr I WOULD prefer to hire employees I trust. However, sometimes it is hard to find out who is "gaming the system" unless you have a way to catch them gaming the system.

[19:57](#msg5d682e3bbee75051a41b838f)@9214 Thanks for the reminder to check regulations. Here in California, it seems like the main concern is leaking that biometric information to 3rd parties. If we implement it ourselves, that will be unlikely to happen.

https://www.californiaemploymentlawreport.com/2016/06/1936/

9214

[19:59](#msg5d682ea385a9157cb4472b3d)@Respectech yes, the common scenario is biometric data leakage which results in all sorts of deepfake-driven nasty things. Not to mention ethical concerns from your employees.

## Friday 30th August, 2019

Ungaretti

[10:52](#msg5d68ffff38499c13a66d9795)@Respectech You may find the links at the bottom of \[this](https://github.com/kalanda/esp8266-sniffer) page useful. HOWEVER, recently all smartphone OS began to encript/obfuscate/hidesomehow the identification of the user, so all that information is dated.  
In fact, I know a company specialized in tracking customers in stores that went out of business because they could not overcome this new privacy policy.  
If you find a way, let me know.

## Saturday 31st August, 2019

temperfugit

[18:46](#msg5d6ac06fb156cd5e75b891c5)@Respectech What if you wrote a helper app in Red that would become part of their workflow, maybe something to mitigate a set of annoyances employees have with the current process? Or could you potentially replace the time tracking software with a Red app? These new apps could help you better track activity.

## Tuesday 3th September, 2019

Respectech

[17:58](#msg5d6ea9b58b7327421de84eb8)@temperfugit The time tracking software is already written in Rebol2 and is available as a standalone app and via a web service that they can access on their phone. At one point, I even created a transcription process where they could call a number and dictate their notes, but it was rarely used. The problem is with having the discipline to log their time and notes in a timely manner. The employees don't have any annoyances with the current process other than that it doesn't just happen automatically without any effort on their part.

[17:58](#msg5d6ea9b8375cc34fde0bf227)Sad, but true.

## Thursday 5th September, 2019

GiuseppeChillemi

[05:51](#msg5d70a24aae44a8412481952f)@Respectech connect the logging with their wage in a way they will get a rise if they log properly or a decrease if they don't, or both.

[05:52](#msg5d70a28d54e7c649d48d2f39)Note: an app in Rebol2 running on Android??

Respectech

[07:48](#msg5d70bdbb3b1e5e5df15608cb)@GiuseppeChillemi That is a good suggestion. However, California has very difficult labor laws and I will have to see what kind of limitations they have on that type of system.

[07:48](#msg5d70bdd732e48c5df23e3f31)By the way, the r2 app runs on Android via browser and CGI.

GiuseppeChillemi

[18:35](#msg5d715586b9abfa4bd356ff46)@Respectech Here we have the same difficulties. As a general rule, you can link their logging to economic benefits but not on a penalties. If they won't do proper logging they will loose the benefits and also you can write down on their personal notes and they will be somehow blocking to carer steps.

## Saturday 14th September, 2019

GiuseppeChillemi

[18:09](#msg5d7d2cbebda39316948045d6).... The good habit of closing a debug or coding session in a "final state" (whenever possible) is something to adopt. You go to sleep with a sense of peace and accomplishments and less thoughts, and also you don't go crazy trying to reload everything in your mind. (Just ended a coding/debugging session)

## Tuesday 24th September, 2019

Oldes

[11:46](#msg5d8a022c8521b34d91819c17)How to name such a `???` function?

```
???: func[a [pair!] b [pair!]][ not any [a/x > b/x a/y > b/y] ]
```

Used to find if coordinate is within a range (image in real life)?

```
>> ??? 1x1 2x2
== true
>> ??? 1x3 2x2
== false
```

rebolek

[11:47](#msg5d8a02642438b53a640b142e)`within?` ?

Oldes

[11:51](#msg5d8a034c2438b53a640b1bf4)Hm... and would not it be better to have it as a 2 pair! comparison? Instead of current:

```
>> 1x1 < 2x2
== true
>> 3x1 < 2x2
== true
```

rebolek

[11:52](#msg5d8a0384c77f285fb1d4c244)I have different result:

```
>> 1x1 < 2x2
== true
>> 3x1 < 2x2
== false
```

[11:53](#msg5d8a039dbe709e39d1844ab7)Today's build

Oldes

[12:14](#msg5d8a0895ab4244767bf7f3f4)I see: https://github.com/red/red/commit/5e5fe39ea0e749a36209adafd5fbdda2d2bc4a52 Good to know.

[12:23](#msg5d8a0abfbe709e39d1847697)Although it threats pairs as a series now:

```
>> 3x1 < 2x2
== false
>> 1x3 < 2x2
== true ;<---- not correct answer for my use case
```

[12:25](#msg5d8a0b32be709e39d18479d5)@dockimbel is above result really what most people would need?

hiiamboris

[13:11](#msg5d8a161a5d24375b3e107d07)@Oldes One should expect that if `a <= b` is false then `a > b` is true. Think about it :)

[13:15](#msg5d8a16f9e45b6d47324b3c3a)Regarding https://github.com/red/red/commit/5e5fe39ea0e749a36209adafd5fbdda2d2bc4a52 that's interesting. Now we have an "x before y" comparison. Think vertical scan-lines. Weeeeiird.

pekr

[15:17](#msg5d8a338fa38dae3a63ad8765)@Oldes - R2 has `within?`function for that:

```
>> help within?
USAGE:
    WITHIN? point offset size

DESCRIPTION:
     Return TRUE if the point is within the rectangle bounds.
     WITHIN? is a function value.

ARGUMENTS:
     point -- XY position (Type: pair)
     offset -- Offset of area (Type: pair)
     size -- Size of area (Type: pair)
```

toomasv

[15:27](#msg5d8a35d3a38dae3a63ad975a)@pekr Red has it too ;)

pekr

[15:32](#msg5d8a37012438b53a640cb629)Don't tell me, tell them .... but most propably I have misunderstood :-)

## Saturday 28th September, 2019

GiuseppeChillemi

[05:37](#msg5d8ef1830e829f60473d63d9)Happy 2019 coding

[05:37](#msg5d8ef187bf625112c0f458d4)https://hackernoon.com/how-it-feels-to-learn-javascript-in-2016-d3a717dd577f

## Monday 30th September, 2019

abdllhygt

[18:53](#msg5d924f199d4cf17360470535)hi

[18:53](#msg5d924f22fb131014e7166047)long time no chat

[19:13](#msg5d9253f6d97d8e3549de7763)my news; i bought qaja.org for my translation engine

toomasv

[19:37](#msg5d92596e6d4b2512c142ba35)Congratulations, @abdllhygt !

greggirwin

[19:42](#msg5d925aa366c8b4512246960c)Nice to see you again @abdllhygt.

abdllhygt

[21:02](#msg5d926d5947de0a719d3cd644)@toomasv @greggirwin thank you

## Monday 7th October, 2019

Oldes

[13:58](#msg5d9b44940e67130aae2df10f)\[Little Red Riding Hood](https://www.youtube.com/watch?v=iKbWdgW6sD8) ... And Now for Something Completely Different ... \[Crash Ensemble's Red Run](https://www.youtube.com/watch?v=YGHReOSparU)

[14:05](#msg5d9b461d940b4c2fc08efdeb)(warning both probably hard to understand in the us of a)

hiiamboris

[14:24](#msg5d9b4a9204592546720cf23b)It's great actually. Both links :)

[14:27](#msg5d9b4b5e04592546720cf8d2)Have some retro for a change though ☺ \[The Reducer](https://youtu.be/YbkYXORRzVk)

Oldes

[14:27](#msg5d9b4b6fb385bf2cc68ce176)Hard to believe that Pythons are there over \[50 years already](https://www.youtube.com/watch?v=eJBZ1\_NcrDc).

greggirwin

[18:31](#msg5d9b8488874aeb2d23063c6b)Great stuff. I'm going to play The Reducer on repeat for 24 hours and see what happens.

hiiamboris

[18:51](#msg5d9b89247aa5602ffc875735)You'll get lost in the dream of eighties likely :D

greggirwin

[18:53](#msg5d9b898e874aeb2d23065eff)SORRY! I CAN'T HEAR YOU!

hiiamboris

[18:57](#msg5d9b8a9f92920c36a12b5a39):D

## Tuesday 8th October, 2019

Respectech

[00:20](#msg5d9bd647464b432fc1da8013)@hiiamboris That's some good synthwave / retrowave!

hiiamboris

[14:07](#msg5d9c981b973587467319b8ad)@Respectech sure, Mega Drive is like an apostle of retrowave ;) If you're into this cyberpunk vibe as it was back in the day (not the shiny stuff they're selling now), Mega Drive will totally guide you. What a clear vision...☺ But also \[Sung](https://youtu.be/s0W6eBJklLk). Think AI, VR, cyborgs, implants, shady deals, corp-owned world and an always on the run hacker protagonist ☺

There's also an even older retrofuturistic dream expressed in retrowave though - when people saw deep space exploration age coming, almost at hand. Think alien contact, colonization, space anomalies research and on ☻ Check out \[Moskva-Kassiopeya](https://youtu.be/zfH2QEMkM7I) and \[Volkor X](https://youtu.be/UIY1fO\_sPeA)

rebolek

[16:54](#msg5d9cbf5949c7720aaf89f4f8)Cyberpunk to me means Blade runner as a movie, Neuromancer as a book and Rise of the dragon as a game.

hiiamboris

[17:36](#msg5d9cc92d3220922ffb4f711d)Now I see where @9214 avatar comes from :)

rebolek

[17:40](#msg5d9cc9f4fcf7602cc55419e8):smile: :dragon:

Respectech

[18:55](#msg5d9cdb980459254672183a71)@hiiamboris I've been into that music genre since the 80s, and pretty much for those reasons. I was deep into sci-fi at the time. I've also been into futurism studies since then, so the music matches well.

BeardPower

[19:20](#msg5d9ce173b385bf2cc69867d6)@hiiamboris How could you miss that this avatar is the apartment in Rise of the Dragon?

hiiamboris

[19:34](#msg5d9ce4af3220922ffb503c8e)@BeardPower Yeah right. Live and learn ☻

[19:46](#msg5d9ce79ce8de6f3ca061dcc9)I gotta admit, they made no effort for the script of this one. Good gfx though, atmospheric.

[19:48](#msg5d9ce7f097358746731c0808)@Respectech anything fascinating you've encountered in those futurism studies?

Respectech

[20:25](#msg5d9cf0b95173c33ca1900128)@hiiamboris Too much to mention.

[20:26](#msg5d9cf0e049c7720aaf8b6046)It is more of a general analysis of trends in technology and society. But there are wildcards that cannot be forecast, and it's those wildcards that have a big impact at times.

[20:28](#msg5d9cf15c49c7720aaf8b63fd)Some things that I knew were coming at least 10 years in advance that would make a big impact on society were evolution of Arpanet into the Internet, smartphones, and AI, among many other things.

[20:29](#msg5d9cf1c6b385bf2cc698d89b)The next 10 years are really going to be a wild ride with technology, automation, power generation, and society's response to those things. But sometimes I think things are coming sooner than they actually get here. That's part of the challenge.

[20:30](#msg5d9cf1f37aa5602ffc91535a)BTW, I designed (on paper) an Amiga-based smartphone in 1995. Too bad I didn't follow through with an actual working prototype and subsequent production. But my past is littered with missed opportunities...

hiiamboris

[20:35](#msg5d9cf323b385bf2cc698e23e)Wildcards yeah... "Black swans of progress" as one guy calls them. Most dangerous yet most awe-inspiring processes ☺

[20:36](#msg5d9cf348045925467218e7d0)What's your opinion of our current world economy though?

## Wednesday 9th October, 2019

Respectech

[00:03](#msg5d9d23dd49c7720aaf8ccfe1)@hiiamboris My opinion: The global economy, in the absence of large modifiers, goes through waves of positive and negative economic cycles. The global economy has been riding a positive cycle for quite some time. This could be due to the recovery from the "Great Recession" ca. 2008 or due to policies that are keeping the economy high (like low and even negative interest rates). The longer that the economy is forced to stay high without going through a natural correction cycle, the larger the correction will be.

## Friday 11st October, 2019

Oldes

[08:53](#msg5da0430a80e62056e4e5085a)This is cool and scary machine learning practical use: https://youtu.be/5rPKeUXjEvE

Respectech

[16:59](#msg5da0b4f680e62056e4e84963)He's a pretty good impressionist. Especially with the slight facial morphing.

## Saturday 12nd October, 2019

GiuseppeChillemi

[13:25](#msg5da1d42fc87a1d28ac9869b9)Small anecdote while coding with RED on a dual monitor setup.  
For some strange reason in my dual monitor setup WIN10 swapped the input. I have one touch screen and one regular screen. The secondary, regular, screen is the target of my touches on the first one, so when I press on the first one, the cursor is instantly moved on the secondary one.  
Today, while coding, a white full circle appeared on secondary monitor with absolutely no one touching the primary one. Also, I was alone so I instantly thought about some hardware fault or interference. To solve the situation I did what it is not supposed to work: put my finger on the white spot which appeared on the regularly non-touch monitor... And it worked !!! I was happy but which magic happened to solve the situation? \*Quantum touch migration* ? \*Breaking of the interference cloud* ?  
I had the answer just 2 minutes ago: there is a fly in my room and I was not able to spot it because I have a dark background. So, my finger has not done not anything other than scaring the fly landed on the first monitor (the touch one) which has flied away!

hiiamboris

[14:20](#msg5da1e14789acff6ff5e27394)Must've felt like you're in a dream. Or in the wrong universe ;) Like one of them Sliders.

GiuseppeChillemi

[15:04](#msg5da1eb8865dd8569a0c4af40)@hiiamboris Yes, I felt like "something new and incredible" was happening and "I have to inform the whole world": "I have a fly on my screen !" :-!

[15:07](#msg5da1ec4b57c2517c6af70460)It is like you are in a car and starting the engine the steering wheel turns left !

## Tuesday 15th October, 2019

GiuseppeChillemi

[05:14](#msg5da555be39d0c70757b05a22)https://www.theregister.co.uk/2019/10/15/bug\_python\_scripts/

[09:46](#msg5da5955f39e2ef28ade6940d)Waiting for the day we will be there:

[09:46](#msg5da59563f1c89c0758f11b35)https://m.youtube.com/watch?v=Og847HVwRSI&amp;feature=youtu.be

greggirwin

[17:35](#msg5da60345158cfd6735377621)Good links. The first is \*great\*, and we need to archive things like that for future reference. The second was interesting, but I became skeptical when JS rose so quickly in ~1996.

## Wednesday 16th October, 2019

ralfwenske

[03:55](#msg5da694a28e2e9a7c6b06cffd)@hiiamboris Coincidences regarding your first link: inspired by Apple’s moves (and recent discussions here) I yesterday installed a W10 VM on a Linux machine. Then from there I run a Red program which works as expected on Mac. The source sits in a Dropbox folder which I accessed from W10.  
Lo and behold I get different results. So far I have pinned it down to my 'object database' which allows to dynamically sort objects based on any object-field(s) (asc or desc). On the W10 an index that normally is ascending - and thus allows objects to be found - the index is reversed (descendingbased on two fields) …. So the app didn’t find what it was supposed to find and procuces different results.  
Obviously I have to attempt to isolate the cause but I guess it might take a while.

[04:21](#msg5da69aae8e2e9a7c6b06f64d)…I have come closer. My Red version on Mac was of 6-Oct. Just tested with latest and now I have on Mac the same undesired results as on W10. I keep digging to find what changed…  
( I still have 28-Sep version on MacBook and there the same source - Dropbox based - works as expected).

[04:33](#msg5da69d99809de9699f46a45e)@hiiamboris Sorry - I meant to respond to @GiuseppeChillemi : with my latest find the connection to your linked article: different behaviour on different OS has dissolved into a simple version difference

[06:33](#msg5da6b9ca158cfd67353c8ca6)I think I have found it: `sort/compare` provided with `func [a b][ a > b]` must have been changed during the last week with the effect of reversed logic. Can someone confirm this?

greggirwin

[07:25](#msg5da6c5f5158cfd67353ce82e)`sort` is now fixed, yes.

GiuseppeChillemi

[07:38](#msg5da6c90939d0c70757bad122)@greggirwin Phyton problem must be inserted into a "watchlist of things to look for"... a warning database of dangerous areas.

[07:39](#msg5da6c92239e2ef28adef4d52)An entry on our main wiki could be added.

Respectech

[23:45](#msg5da7ab99809de9699f4e4dd3)It would be cool if https://rebolek.com/builds/ was added to the Red downloads page as "unofficial community nightly builds". I always have to go search for it when I need it. It would be really great if I could just go to red-lang.org to find the link.

## Thursday 17th October, 2019

endo64

[05:54](#msg5da802198e2e9a7c6b112102)+1 @Respectech

rebolek

[06:01](#msg5da803d3809de9699f50a0d5)Thanks you find it useful!

Respectech

[15:23](#msg5da8875839d0c70757c76771)@rebolek I do! Just a note that the ARM nightly builds are not working since Oct 10.

rebolek

[15:23](#msg5da8878939e2ef28adfba293)@Respectech Thanks for report. GUI or CLI?

Respectech

[15:24](#msg5da887a7894dee56e55d0340)Both

rebolek

[15:25](#msg5da887d339d0c70757c76a72)The server was moved on Oct 10, so there may be some building problems I missed.

[15:26](#msg5da8883a1e314c04672660f7)I see the builds are not there at all...I think it will be some permissions problem.

greggirwin

[18:19](#msg5da8b0be39d0c70757c89c7c)@x8x can we add that link, as @Respectech suggests?

SmackMacDougal

[22:18](#msg5da8e8a44afd703a4efab9fc)Hey all. .

[22:18](#msg5da8e8bc8e2e9a7c6b17ba1e)First time discovering chit-chat, which is great, because can I chat. ;-)

[22:25](#msg5da8ea6b2d59854e7f201298)So I am a long time data scientist of sorts, long before people in the marketing world starting calling marketing research guys "data scientists."

Anyway, there are a couple of REPL langs, the longstanding R and the upstart Julia. The syntax / grammars of both are bloody awful.

I'm toying with the idea of writing a DSL parser to convert R scripts into Red ones.

And thus, I am here to talk with more comp sci guys about the idea as I expect none of you to be domain specialists like myself (other than comp sci domain specialists).

And well, when I think back to the R2 world led by Carl, perhaps the biggest failing was the lack of marketing appeal by REBOL Technologies to appeal to practical users. I'd say he even missed the boat of not appealing to Linux sys admins. That hurt uptake of REBOL certainly.

Anyway, if I could meet with success with this project, I suspect that uptake of Red would be helped, perhaps significantly.

In the R world, most are "statisticians." Actually most are in academic domains as specialists (e.g., psychologists, biologists, ecologists, economists, etc.) who are neither great stats mathematicians nor great coders / programmers.

R is a slow interpreter with REPL environment with some of the worst syntax I've ever seen.

[22:55](#msg5da8f17c39e2ef28adfe9a16)The two bits of the foregoing is this:

1\. Building a better mousetrap is useless if people do not understand how a better mouse trap improves their living (the REBOL trap, maybe the Red trap)  
2\. What would be good approaches to writing a transpiler? I was reading about Red #macros and intuitively I get the feeling that putting some of the code there would be a good idea; but perhaps not.

greggirwin

[23:12](#msg5da8f556894dee56e56037ef)Code generation is easy in Red. I wouldn't worry about macros if you're transpiling. If you're interpreting R scripts, the big hit will probably be numeric performance, in which case you win by identifying key parts to write in R/S and make available. Do the easy thing first, and optimize later.

[23:13](#msg5da8f5b58e2e9a7c6b18139c)You can mix and match, to leverage different aspects of Red. e.g. if you start with the R grammar, you can put actions in your parser to either interpret them or generate code. You can also then test one against the other for correctness.

SmackMacDougal

[23:34](#msg5da8fa7580e62056e4229295)Yeah, this transpiler project would be done to appeal to others through the expressive beauty of the Red language while making it easier for practical work in data analysis, analytics, stats.

When I say R is slow, I mean slow. The Julia people are trying to poach the huge population of R users. But R has a package system and thousands of already made works, i.e., much like the rebol.org script library, but of course, in the domain of stats.

To be able to convert those and show that REPL work in Red is faster would be a boon to promoting Red.

I understand that Mr. Rakocevic Red is far from hist optimization goals. And when it comes to compiling code, people expect near C like performance.

The big players in this field are R, Python (NumPy), Matlab (a commercial product). Julia is the upstart and growing because of its JIT.

Julia's designers tried to copy and mix R and Matlab. If Red could boast Julia speed with its language ease, Red could muscle its way into this space. I am on board to make it happen.

[23:37](#msg5da8fb56c87a1d28accb3d8c)I should have added that most who are R users are not good C coders as most who are Python users are not good C++ coders. Yet those are the avenues for both sets of users to speed up their number crunching work on large data sets.

I see now that Rust and even Swift could be options for them, but I want compiled Red to be their option, i.e., one language to rule them all, or at least one way of thinking about problems without having to learn other langs and the compiling tools.

## Friday 18th October, 2019

hiiamboris

[08:32](#msg5da978808e2e9a7c6b1b85e3)Have you discovered the reason why R is so slow in the first place? I mean it's a vector-oriented lang through and through. It shouldn't be slow, unless used improperly.

SmackMacDougal

[14:59](#msg5da9d36fe3646f24c74b263b)The interpreter is slow. It is a single-threaded app. Perhaps the coders were not that great. For those who have interest, I suppose they could read the source code.

hiiamboris

[15:18](#msg5da9d7e2253dce0537ba38e7)What about the \[other implementations](https://en.wikipedia.org/wiki/R\_%28programming\_language%29#Implementations) of R?

SmackMacDougal

[15:31](#msg5da9dae1253dce0537ba5060)What about those?

hiiamboris

[15:32](#msg5da9db1dea0d6159fd889169)Apparently they have been trying to solve just that - the performance and parallelism problems.

SmackMacDougal

[15:40](#msg5da9dce124af474d28d248cf)Like most interpreter driven langs, e.g., Python, Ruby, Lua, the long-standing practice has been to write CPU-intensive routines in a compiled language, typically C.

The Java designers introduced JIT to the larger comp sci world.

R is little different. It is a program that takes a specialized batch language, likely referred to as a "scripting language" to make it seem more contemporary.

Interpreters are merely programs that abstract away an aspect of computing so as to obviate the need for compiling.

rcqls

[15:42](#msg5da9dd57c864f365060ef106)I don’t think that R is a slow language since it has a C API like any other languages. Most of important packages relies on this C API or on `Rcpp` package which is a way to use the C API in a simpler way. Also, R is a Lisp-like language as julia is (but not Python, Ruby,…).

SmackMacDougal

[16:02](#msg5da9e22b253dce0537ba8a80)R isn't a language. R is an interpreter with a language, the same as REBOL. The interpreter chokes on large datasets.

That is why routines get coded in C and processing gets offloaded to those routines. That has been happening for decades for interpreters with languages.

[16:12](#msg5da9e46324af474d28d284f7)There is a table on this page that shows how slow R is vis-a-vis Julia, pure Python, Python/ Numba, Fortran, C, Scala, Matlab and IDL.

\[Basic Comparison of Python, Julia, R, Matlab and IDL](https://modelingguru.nasa.gov/docs/DOC-2625) R is often 10 times slower and sometimes a whopping 1,000 slower than other means.

R is like a junky family station wagon from the 1970s while everyone else drives shiny new Ferraris.

9214

[16:20](#msg5da9e66afa637359fc9f8170)@SmackMacDougal this community isn't the place for language flamewars; keep your criticism to the point and refrain from insulting remarks.

SmackMacDougal

[16:21](#msg5da9e690c86aec24c666b1b1)@9214 You have mental problems, dude. This is the second time you have harassed me. Go away.

[16:23](#msg5da9e6eb714b8b053816e80a)&gt; red/chit-chat "A place for the Red community to talk about whatever they want, to keep other rooms clean."

Good luck!

greggirwin

[16:24](#msg5da9e747a28cd16529bca8ae)@SmackMacDougal, @9214 just asked you to be nice, but your response is a personal attack. Consider this a warning.

The real question is whether we should write a Fortran dialect in Red.

hiiamboris

[16:25](#msg5da9e78778e4974ace7b662c)Wow that's real slow numbers there ☺

[16:26](#msg5da9e7bfea0d6159fd88f788)IMO this can't be the issue with the language or interpreter, but rather with the implementation of a specific algorithm.

SmackMacDougal

[16:26](#msg5da9e7bf24af474d28d29e80)@greggirwin Agreed as to the question. The guy attacked me the other day. He doesn't like me for whatever reason.

His interpretation of my previous comment was flat out wrong. HE is the one should be warned.

Is this an insular cult or an open forum? Please let me know as my time is too valuable to be wasted on people with hang ups.

greggirwin

[16:29](#msg5da9e875f3f2b34d27b9e0bc)We strive to be an open and welcoming community, but it's a two way street. I didn't see him "attack" you here, but you responded with a personal attack. You're free to go as you wish. While you're here, be civil.

9214

[16:30](#msg5da9e88c24af474d28d2a234)&gt; The guy attacked me the other day

You attacked the project yourself, in GTK room, and personally insulted me after calling you out on that. All messages are now conveniently deleted, of course.

SmackMacDougal

[16:32](#msg5da9e91e3e33a9652af0afeb)I did not attack the project. Stop lying.

[16:33](#msg5da9e95678e4974ace7b7077)You insulted me first. What are you, like 18 or 20? I have better things to do than to teach what your parents should have done, how to be behave.

Good luck.

[16:33](#msg5da9e97778e4974ace7b70a7)My GTK post was a kind one based on a view of concern about the project.

[16:35](#msg5da9e9c724af474d28d2ab6a)@hiiamboris Maybe. Maybe not. You will need to investigate it further if that suits you.

greggirwin

[16:36](#msg5da9e9f23e33a9652af0b746)Final warning @SmackMacDougal.

pekr

[16:39](#msg5da9ead2714b8b05381708ef)I think that English probably is not his native language, so sometimes it is easy to use such a wording :-) It makes me more to smily, than to go angry. Reminds me of myself being an ass in an early Rebol years :-) Still I am sometimes ....

BeardPower

[16:55](#msg5da9ee6ef3f2b34d27ba14f7)Some people take the existence of a room like this as a carte blanch to insult people and get away with it.

GiuseppeChillemi

[21:16](#msg5daa2bcba28cd16529beba65)The python story whose link I have posted triggered me memories.  
Time ago a friend of mine told me 2 enginers started a project where ATAN2 Excel function was heavly used. Well, that function was known to return wrong results (even Microsoft knew about it). Well, they had to throw in the trashcan months of works and money when they discovered the problem.

[21:26](#msg5daa2debc86aec24c668d690)Math errors are one of the most dangerous to have in a language but if you have stories and opinions about other parts of a language being more important that math I will be happy to read.

Respectech

[21:31](#msg5daa2f2df3f2b34d27bc0881)@pekr Funny you should mention that. I remember when I worked at Rebol on tech support that you sometimes came across as a troublemaker. But I knew you were from Europe and English wasn't your first language. We eventually learned that although you had criticisms, it was because you were interested in Rebol being a really great language. I remember sometimes even Carl seemed to get frustrated with you. :D

[21:41](#msg5daa3176714b8b0538193715)@SmackMacDougal The Rebol and Red groups are generally very welcoming and friendly groups, especially compared to many other groups that I've been involved with online. That means that sometimes our Russian bouncer friend @9214 has to lay down the hard line. This sometimes hurts the feelings of a few, but for the benefit of many. Vlad is not just a bouncer, but also a very knowledgeable developer.

## Saturday 19th October, 2019

GiuseppeChillemi

[10:35](#msg5daae6e078e4974ace82852b)Here we have seen a queue of the happenings on GTK chat (I have not read it). I have read twice @SmackMacDougal on data science languages and there are no such terrible and unacceptable expressions that he should stop (Or if any, please point them me privately) and in my opinion the moderation action was not needed. On the other side I have read \*unacceptable* words about mental health of Vladimir and @SmackMacDougalI while you have good reasons to be upset I think an apology from you would be very welcome.  
Also @9214 , while you are trying to maintain this a good place you are doing it in a manner that triggers newcomers personal wars against you and flames all over. Believe me when I say I understand that being a moderator is an difficult role and I appreciate your continuous enormous work on the community. But if your goal is to have Red gitter a good place, with maximum respect I kindly ask you to reconsider your sequence of words during moderation as there are flames all over ! Change your words with gentler ones on the first instance and this will turn in more moderation action accepted and not into flames and personal wars. This will help you achieve better results and let all continue peacefully together in this wonderful adventure called RED.

Oldes

[21:27](#msg5dab7fa7714b8b0538226210)Imho I also think that Vlad's action here was not appropriate. For my gusto he is too often responding as a bouncer and there should be no need to have bouncers in the chit-chat room. @SmackMacDougal sorry for this experience.

## Sunday 20th October, 2019

Senenmut

[12:28](#msg5dac52e1c86aec24c677c839)hello. i have a programmers joke. wanna hear ?

[12:41](#msg5dac561324af474d28e3f376)i guarantee you have never heared it. wanna hear ?

nedzadarek

[12:48](#msg5dac579c24af474d28e3fbfc)@Senenmut no, don't post it... just kidding... just post it already.

[12:53](#msg5dac58b90fdc4b6507201e2c)@Oldes I thought you meant \[Vlad the Impaler](https://en.wikipedia.org/wiki/Vlad\_the\_Impaler)... well, that was little funny.

Senenmut

[13:02](#msg5dac5af624af474d28e4107b)one morning a weel suited programmer is wondering about the activities of the microsoft MONO programmers. he was really taken with the LOGO of the MONO project . a MONKEY symbol. some days later he had a "good idea" for how to make theese programmers a little surprise. IF they have the Monkey as symbol it could be possible that they are "monkeys in their mind". And what are monkeys like the best ? bananas. Thus he organizes a couple of banana bundles and make himself ready for "the mission". He entered the microsoft programmers bureaus as a cleaning man and just in front of the main office he assured himself that "in this programmers bureau are only MONKEY programmers. NOW the joke steps further from the point of view of the MONO programmers : "We saw that suddenly the door is opening and a man smashed a huge range of banas bundles in the room. Wonder WHY and what the man want to say with this action. Then we find a little piece of paper on one banana "Hallo Monkey programmer - here is a good friend - this is a little present for the respect of coding - hope that the bananas taste good - i'll be back to the zoo."

nedzadarek

[13:04](#msg5dac5b5f0fdc4b6507202ed2)\*chuckle*

Senenmut

[13:13](#msg5dac5d8cf3f2b34d27cb64fd)"We have seen a man that is smashing single bananas with a tennis racket through the open window of the office" "You have seen nothing" "Yes, we see it"

[13:28](#msg5dac6101a28cd16529ce33f1)If a new apprentice programmer in the company wants to open the window the chief officer says "No, don't open the ""windows"" " ; "Why" ; "Because of the bananas!" " Because of WHAT ???"

[13:36](#msg5dac62d1253dce0537cc5f89)joke is complete now. thank you and bye. SM

nedzadarek

[13:36](#msg5dac62f20fdc4b6507206206)nice

9214

[20:24](#msg5dacc27b3e33a9652a04f0b5)I had my reasons to suspect that @SmackMacDougal is a fake account of @TimeSeriesLord - an old-time community troll. Here's the timeline of what actually happened:

\* @SmackMacDougal popped up in `/help` on \[30th August](https://gitter.im/red/help?at=5d695ad6375cc34fdee7279f). This particular message that I referenced, before the edit, was written as follows (@BeardPower can confirm, as he saw it)  
&gt; yeah, I don't know about that @9214. Cockiness tends to go in hand with extreme autism stupidity

This was reported by me to @greggirwin, but I gave him (@SmackMacDougal, that is) the benefit of the doubt.

\* @TimeSeriesLord returns back from slumber on \[2th September](https://stackoverflow.com/questions/56512086/how-to-get-a-formatted-date-and-time-string-from-now/57797844#57797844).  
\* Both Github accounts were created around August - September of 2016 (\[1](https://github.com/SmackMacDougal?tab=overview&amp;from=2016-08-01&amp;to=2016-08-31), \[2](https://github.com/TimeSeriesLord?tab=overview&amp;from=2016-09-01&amp;to=2016-09-30)).  
\* Between September and October, he posted Linux-related questions, slightly implying in the process that Red treats Linux users as 3rd-class citizens (AFAIK @TimeSeriesLord did the same), and answering coding-related questions in the form "no, previous answer has A Grave Desing Flaw, here's my version: (\[example](https://gitter.im/red/help?at=5da8f6eb89acff6ff5147fc6)) - kinda the same like @TimeSeriesLord's SO answer referenced above.  
\* On 10th October he yet again posted passive-aggressive message in `/GTK` room, about "slow pace of Red development, Rebol's and Carl's superiority, Red should've implemented GTK backend before releasing Windows and macOS ones, yada-yada", to which @rebolek responded with \[this](https://gitter.im/red/GTK?at=5d9f6c685173c33ca1a19617) and me with \[this](https://gitter.im/red/GTK?at=5d9f738d0e67130aae4c09b7); after that, @SmackMacDougal personally insulted me, refuted @rebolek's point with the same passive-aggressive tone, and deleted both messages. I reported this to @greggirwin.  
\* After that, he proceeded to attack me in PM to @rebolek, which he reported to @greggirwin; to my and @rebolek's reports Gregg responded  
&gt; Give me info when the time comes and I will deal with it. Private assaults on the team are good enough for me, but having public evidence is even better.  
\* On 11th October, a desugared version of @SmackMacDougal deleted message \[appeared](  
https://forum.rebol.info/t/rebol-3-compared-with-red/192/21) in one of the Rebol forum's threads which I periodically check for trolling and FUD with regards to Red; this message was posted by newly created account and contains the exact same rhetoric that @SmackMacDougal used. This, once again, was reported by me.

\---

At this point there were way too many coincidences to let it go unchecked, so I decided to bait @SmackMacDougal on the next occasion and provide public evidence of his behavior (as @greggirwin requested in his response) - this is what you saw above.

I did that, for what it's worth, wanting to defend @rcqls, because I know that he's R user, and @SmackMacDougal's

&gt; R is like a junky family station wagon from the 1970s while everyone else drives shiny new Ferraris.

for me implied that R community is a junky family. Call it whatever you want - the language barrier, me being "bouncer", defensiveness (I myself worked with R a little bit), I did what I think was the best for the community, wanting to protect one of our most productive contributors.

[20:25](#msg5dacc2a1714b8b05382b22c9)In any case, at this point @greggirwin received 2 reports and 2 public shreds of evidence of @SmackMacDougal attacking me, including PMs written in the same tone as they were written to @rebolek. The funny thing is that, as of now, he's still not banned from all rooms. And then I expressed my surprise on that, all I got from @greggirwin in response was (emphasis mine)

&gt; This is not acceptable behavior (\_me baiting @SmackMacDougal, thus providing a solid reason to ban him, and expressing surprise after he was not banned, despite having more than enough evidence to do so\_), or a good use of me or my time.

So, yeah, this is what it takes to bring any kind of decisive action in community management - to throw oneself on crenel and play dirty, being framed as a malicious actor in the process.

Looking at all the people above who took their time to ostracize me and to publicly express (completely unasked for) opinions on my persona, I see that what I did wasn't worth it - in the end, despite all the time and energy I dedicate to the project, I'm the ferocious bad seed who eats newcomers and gives everyone heart attacks by merely breathing in their direction; despite me semi-officially being a part of the team, being personally attacked (and writing multiple reports to official community manager about that) is not enough to bring any sort of protection from one of my employers - on the contrary, the reasoning is such that "you're little jackanapes, so when someone jumps down up your throat for no good reason, that's solely your problem".

Fine then, point taken - you don't like me, you want me to STFU and go away. If you want this place to be overrun by crackpots and nutjobs, and prefer their company rather than mine (\[as I write this](https://gitter.im/red/help?at=5dacb49bf3f2b34d27cdd36c) @SmackMacDougal brags about Red's flawed design in `/help`, lashing out on another community member on the verge of swearing), so be it. I know I can be problematic at times, but that's simply too much to put up with. Go find yourselves another whipping boy.

BeardPower

[21:01](#msg5daccb20e3646f24c7608dec)I have to agree with @9214 points. He's helping out the community and tries to keep the groups clean. People feel offended by him trying to set some rules, and the result of it is people getting personal on him without any reason. Some are going even further by doing the same thing, harassing other community members, they claim other people are doing to them. Sorry, but is this a kindergarten? I don't get that logic. The nastiest thing about the whole situation: those who try to help other people are bad seeds, but those who are getting personal and all that even get goodnight kisses. Seriously? What's that? Please explain that to me because I don't get it.

## Monday 21st October, 2019

greggirwin

[01:07](#msg5dad04ba4bc69e6b660f6d40)Dear Community. This is being addressed. Please don't drag the issue out.

pekr

[06:38](#msg5dad526278e4974ace9385d1)I did not expect any such self-defending post by @9214 and I am sorry he finds himself in any such situation. The way the other guy was behaving here, was absolutly unacceptable. If it is the same user as TimesSeriesLord or Vexcerciser, my experience in the past was, that writing even a polite message privately to such person resulted in myself being called a licking ass idiot. For such guys, any opposing reactions to their opinions are always going to be considered idiotic by nature. Such users should be banned, as those attacks just anyone here.

As for Vladimir and maybe why e.g. Oldes propposed for some a bit different tone to the beginners in general, I think the topic is kind of deeper. During the old AltMe years, we were basically mostly a friends. The base of the Rebol community formed around Carl and Amiga. AltMe was also not a public forum too, so it just stayed behind the closed doors.

So we are here, in a more open space, with the community supposed to grow much larger, than with Rebol. It might require some formalism. But - we should be careful. During the long Red years, few ppl wrote to me, which felt our space being a bit restrictive. Sometimes even a simple question to the schedule, or why some things are done in some ways rather than others, provoked kind of dismissive reactions or the questions were found being insulting, for no apparent reason imo.

So once again - please let's find some balance between keeping this place under control, allowing a community to grow, but not creating an atmoshphere, where ppl rather stay silent instead of asking what could be eventually considered being silly, naive or uneducated questions ...

NjinN

[06:44](#msg5dad53db253dce0537d2fec9)@pekr AGREE

hiiamboris

[09:14](#msg5dad76e4acb9fb4eaf19e401)@9214 Look bro. Communication is an art. No one is perfect, not even Gregg (although he has almost mastered it ☻). We like you, and though we don't often find a moment to state it, we deeply appreciate everything you do for the community and Red. You know it, don't you? Don't let a little misunderstanding and a troll's play at self-importance cloud that vision ;)

Regarding that guy, what's the point of painting him a personal enemy? He's just very lonely. Craving for attention in the only form that's available to him. Understand why he is what he is. As both a man of considerable wit and a russian speaker you may find \[this material](https://commerage.ru/gadania/78-dverej-taro-karta-rycar-mechej-knight-of-swords#mcetoc\_1cnmfp5ak2) thought provoking.

rcqls

[11:09](#msg5dad91d9e886fb5aa2cb52fe)@9214 BTW, thanks last time for wanting to defend me. Actually, I quickly stop discussing on R with him since IMHO he did not know very well `R` which is maybe normal since it is difficult to invest on all languages. Every `R` users know that `for` loop is not well suited. So comparing `R` language with other languages based on (interpreted even byte-compiled) loop is of course not fair at all. And as a note, I am in the `R` (French) community the guy who claims for long that `Julia` (and not Python) is really the next language at least for statistical computing.  
It’s also always fun for me to read you when you share your knowledge on `red` and also on any other technical topics.

GiuseppeChillemi

[11:42](#msg5dad99b93d669b28a0acda88)@9214 Vladimir, we have nothing against you.  
You help people understand RED,  
maintain and create documentation,  
face people attacks on RED defend it in foreign forums (reddit, as example),  
moderate gitter.

Your great work is under the eyes of everyone.

Personally I keep an archive with the link to all your invaluable message which I read on those dark days, especially when facing "contexts".

Maybe I have expressed badly in my past too, so here is my apology. I have just an observation of your moderation technique: sometimes you are (involuntarily, I think) capable of letting people, especially, newcomers feel really bad. So, while your moderation action appropriate, a different sequence and type of words could be needed. You would reach the moderation goal without causing adverse reactions from the moderated person. A simple "go away" could be changed to "please, move to a different area" repeated a couple of times with slight modifications. Also, there is another characteristic in your moderation: you often mix the critique of what the user has written together with the moderation and this creates an amplification effect to the receiver. Keeping things separate, the moderation message won't be charged from the extra negativity caused by the critique of the user thought.  
So please, continue your good contribution while taking note of these observations. I am 100% sure will help you reach even better results in your commitment into RED.

nedzadarek

[19:08](#msg5dae021ca03ae1584fe404dd)@hiiamboris I think Gregg is/was a teacher. A good teacher.

## Friday 1st November, 2019

GiuseppeChillemi

[21:32](#msg5dbca48410bd4128a1a1be74)Something found in the wild:  
https://mind42.com/mindmap/eca403e3-7c65-4d08-bee0-fd87a2290458?rel=gallery

[21:33](#msg5dbca48e2a6494729c7ec9b3)Don't know the author

greggirwin

[21:49](#msg5dbca87b2f8a0343571b8ace)Fun.

## Thursday 7th November, 2019

Senenmut

[19:02](#msg5dc46a2ae469ef4358deb4d9)why not be a mono programmer and get bananas for free ?

[19:27](#msg5dc4703ff26ea4729d711085)they have stronger muscles as other programmers for this reason.

[20:10](#msg5dc47a42a3f0b17849058d4c)why need they stronger muscles ? wanna hear ?

[21:01](#msg5dc4860f7477946bad4826ff)because of the next martial art competition against the " .net programmers " . who wins get a bonus on salary.

## Friday 8th November, 2019

Senenmut

[09:23](#msg5dc534074adf071a84f0c09d)but the show goes on with the .cloud programmers as third party. they put every application and database plus even the programming IDE's in the CLOUD. computing and programming ALL in the cloud. wonder what food this "cloud team" to offer for preparing to the martial art competition ? he he he

GiuseppeChillemi

[14:03](#msg5dc5759fadd5717a88cfcb99)Yesterday I made a paid advertisement on Facebook for our store page. The result was really incredible: we had about 10.000 interactions from mobile and about 100 from the desktop. I share those numbers to you because they are important feedback which could give the RED community an idea of the direction we should concentrate the forces.

pekr

[17:24](#msg5dc5a4c8add5717a88d127c0)I might believe in your statistic, but I don't believe it at the same time at all. For general web, it might work, but as for e-shops, either I am too old requiring more real estate, or I am a special type of a user :-)

## Monday 11st November, 2019

greggirwin

[17:39](#msg5dc99cd04adf071a840f652b)Coming from :point\_right: \[red/parse](https://gitter.im/red/parse?at=5dc95f316ba2347d2d743451). It's OK for people to move on to new things, but also natural for us to feel a sense of loss in our community. It's all good an healthy, and not likely to change. What I hope we achieve with Red is that people don't leave for the wrong reasons. That means the technology has to be useful to them, and the community also needs to be a place people want to be part of. Not just for pure Reducers, but for those who keep it in their toolbox with everything else they use.

GiuseppeChillemi

[21:24](#msg5dc9d17bca778c1fbfe685da)@pekr But is BrianH who left for Ruby ?

## Tuesday 12nd November, 2019

pekr

[04:26](#msg5dca348ae75b2d5a19b889bc)I think so.

[04:26](#msg5dca348eadd5717a88f0c65d)What group would you suggest to discuss for stuff like small boards (I've been in Beagle boards long time ago), embedded, stuff like face recognition, car id recognition, AI frameworks, etc?

Senenmut

[08:03](#msg5dca6765091dd14a0ea5ea02)hello @GiuseppeChillemi !!! Would you like a bundle of bananas for that amazing effort ???

[08:46](#msg5dca717c5eb2e813db0d1eb5)ruby isn't a compiled language.

pekr

[09:01](#msg5dca74cee75b2d5a19ba540a)nor was Rebol back at the times. Well, Rebol still is not, in fact .... :-)

GiuseppeChillemi

[10:47](#msg5dca8db7ea7d147cb3657d82)@Senenmut  
&gt; Would you like a bundle of bananas for that amazing effort ???

Which effort ?

Senenmut

[11:44](#msg5dca9b0bfd6fe41fc06e39bd)facebook = paidadvertisement \[\[Red \[directions] #define mobile : let interactions(mobile) = 10000 : #define desktop : let interactions(desktop) = 100 ] sharenumbersfeedback = concentrateforces++]

GiuseppeChillemi

[12:27](#msg5dcaa526ca778c1fbfec5a67)@Senenmut 😁

Senenmut

[12:36](#msg5dcaa74992a84f79fe52f10c)RED \[needs view] \[#define (dataconcepts) : let include(dataconcepts) = global allkindofdata : dataconceps = (go, java, mono, net, monkeys) : #define (transformallconcepts) : let transformallconcepts = mastertransformer ] function transform \[ transform all to RED lang ] : \[RED compiler &gt; realize transformation ]

[17:02](#msg5dcae5b2eeb63e1a839ec722)18.00 mez greanwich time : RED compiler ready. Executable compiled in 4 hours and 24 min &gt; files in folder : SUPERNOVA.red

[19:45](#msg5dcb0bedc26e8923c4123a51)20 karat gold on the hard disk.

[19:49](#msg5dcb0ccdeeb63e1a839fea5f)no, here we have 24 karat on the hard disk. 24 karat RED in gold.

greggirwin

[21:39](#msg5dcb268950010612b2a8d0e2):point\_up: \[November 11, 2019 9:26 PM](https://gitter.im/red/chit-chat?at=5dca348ae75b2d5a19b889bc) red/sandbox may be best to start @pekr. If things focus on Red specifics, red/red is fine.

## Friday 15th November, 2019

loziniak

[23:15](#msg5dcf317cea7d147cb387c225)Hi, @greggirwin , I found your \[Wiki entry](https://github.com/red/red/wiki/%5BNOTES%5D-AltME-Reloaded) about an alternative to AltME. I think \[Riot.im](https://alternativeto.net/software/riot-im) could be what you are looking for.

## Saturday 16th November, 2019

greggirwin

[05:38](#msg5dcf8b6b091dd14a0ecb5229)Thanks @loziniak. I will check it out.

hiiamboris

[08:34](#msg5dcfb49492a84f79fe77c8fa)riot.im is crap, that seems to never improve during the years. Just as matrix.org having lags of many hours all so often. I suspect their business model is feeding crap to make everyone jump to paid options.

GiuseppeChillemi

[16:47](#msg5dd028275eb2e813db36d74d)@hiiamboris any other option you respect?

endo64

[17:00](#msg5dd02b4050010612b2cd2a59)zulip looks good, but I didn't use it.

hiiamboris

[17:05](#msg5dd02c51e75b2d5a19e3ede3)I'll try it

[17:08](#msg5dd02cffadd5717a881c9624)Robot translation :D

[17:08](#msg5dd02d05fd6fe41fc096b112)that's fun

GiuseppeChillemi

[17:19](#msg5dd02fb668ad1c4a0fd9e3b1)Also I am struggling for a remote support solution like TeamViewer which is not ultravnc

hiiamboris

[17:27](#msg5dd03164ea7d147cb38eb7b2)Zulip looks like a relatively lightweight clone of slack. Lightweight is good. What I don't like:  
\- Web app doesn't work in my Pale Moon, not in a way that lets one use it. Works in Waterfox though  
\- Desktop client is basically just a stripped down browser. Absolutely not customizable.  
\- I already found a way to override the funny but useless translation: by deleting all other language files ;)  
\- No alternate clients at all?

greggirwin

[17:48](#msg5dd03681fd6fe41fc096fa08)So the search continues. Thanks all, for the helpful feedback.

hiiamboris

[17:55](#msg5dd0382c92a84f79fe7b8211)Well, matrix's Synapse server should already be okay if you stick with a single private server instance. What's missing is a working client written in Red ;) And if you need cross-server collaboration, it'll likely take years before they make it usable. Right now cross-server room synchronization can take hours and will likely thrash the message log.

GiuseppeChillemi

[18:22](#msg5dd03e73eeb63e1a83c57537)"Also I am struggling for a remote support solution like TeamViewer which is not ultravnc". I mean an open source one.

## Sunday 17th November, 2019

hiiamboris

[14:06](#msg5dd153db92a84f79fe831439)One more observation on Zulip desktop client: went into stable 100% cpu core load after some time while sitting idly in tray ;) Pathetic electron bloat...

## Tuesday 19th November, 2019

LFReD\_twitter

[21:49](#msg5dd46369eeb63e1a83e3689d)@GiuseppeChillemi How's this for a story... (bear with me, there's a point :)

Back in 1998, I found some time on my hands (having just left a company I founded which did a $10M IPO on the OTC-BB exchange), moved to L.A., and became interested in chat bots. I worked with Neuromedia and Dr. Walter Alden Tackett and built an 'Ask Mickey" chatbot. This thing new everything (or would have known everything) regarding Disney. I did pitch this idea to Disney, and while they showed some interest, it was too early... too bleeding edge, and the discussion dropped off. Besides, I was more focused on the development.

That same year, I was dissatisfied with the limitations of chat bots, and wanted more of a virtual assistant that could actually do something, which would require that I learned to program, and as I said earlier, I simply could not get my head wrapped around C++ or Java, and wasn't keen on spending a few years learning it.

That is, until I came across Rebol. To cut a long story short, I used Rebol to build a virtual assistant name LFReD, but LFReD went a step beyond. I bolted on some speech recognition (Dragon dictate based) and text to speech (windows 'agents' and others). You could talk to LFReD and even call LFReD on the phone and do the usual "How tall is Mount Everest" and operate light switches, turn on the kettle etc. (we're talking over 20 years ago now!)

But LFReD was more conversational. I entered it into the big chat bot contest at the time, and it came in first that year. As it turns out, Benioff from Salesforce must have read about the contest, and called me up one day and was interested in incorporating it into his platform. Again, it was an interesting call, but never really went anywhere, which was fine as there was a ton of development still needed. The biggest issue was the quality of the speech recognition. Even with 95% accuracy , there's nothing more frustrating than a bot missing every 20th word. We built a v small company, raised around $200K, and continued development, but what started out as a virtual assistant became more about automation algorithms, and up until a few years ago, had been my bread and butter.

But now I'm semi-retired, and bored :), and I want to get back to the roots of the LFReD project, and now that tech has finally caught up with speech recognition and bots that don't sound like. well, bots, I'm thinking there's room for an Open Source Alexa and Google Home challenger (yes there's others out there) that's built on Red. I've done development work with Alexa and Google Home, and frankly, they suck. LFReD was way more powerful even 20 years ago. For one thing, you can do in one line of Red code what takes Alexa etc and ton of hoop jumping using their Dialogflow and other various systems.  
Anyway, there ya go. I know that Red is still Alpha, but so is this LFReD project :P

[22:18](#msg5dd46a20add5717a883b9f21)"So the search continues..."

This OS project just popped up recently.

https://www.chatwoot.com/

[22:19](#msg5dd46a5c091dd14a0eee3f35)"Opensource alternative to Intercom, Zendesk, Drift, Crisp etc."

GiuseppeChillemi

[23:33](#msg5dd47bd1add5717a883c14b9)@LFReD\_twitter Nice experience. If you bring back your project I am sure this time will have a broader success. Times have changed, also technology and there is a giant user base to apply them.

[23:35](#msg5dd47c28add5717a883c188b)Which engines are actually available as Voice TTS (I were a fan of Loquendo voices) and for voice recognition ? Are there good open source one ?

LFReD\_twitter

[23:59](#msg5dd481fdeeb63e1a83e443ad)@GiuseppeChillemi Not much has changed with TTS other than Google's Wavenet option, which is world class. Then there's the voice cloning AI coming out of late.. crazy! Here's some examples of what you can do now with a single five second sample of a human voice.

https://google.github.io/tacotron/publications/speaker\_adaptation/

## Wednesday 20th November, 2019

GiuseppeChillemi

[00:02](#msg5dd4827b091dd14a0eeeed24)@LFReD\_twitter So, no choice if you search for an open source voice tts ?

LFReD\_twitter

[00:05](#msg5dd48360ea7d147cb3ab6256)Plenty of options there. I haven't looked at any of late.

[00:11](#msg5dd484b568ad1c4a0ff95e90)@GiuseppeChillemi Flite has been around for a long time.  
http://www.festvox.org/flite/

GiuseppeChillemi

[00:30](#msg5dd4893deeb63e1a83e4731f)@LFReD\_twitter I find LFRed very interesting. Could I experiment with it as now?

[00:31](#msg5dd4895cea7d147cb3ab8974)Also, have you done task automation with REBOL?

LFReD\_twitter

[01:03](#msg5dd490cb35889012b13c5f2b)@GiuseppeChillemi Sure, go ahead? Start with the Q repository, and check out the read me first.txt, then check out the Q manual in the docs folder. Again, this is really old stuff. There's been a number of updates, but mostly in php.

Oldes

[06:55](#msg5dd4e354fd6fe41fc0b88d70)\[Red language](https://images.app.goo.gl/S5ACPp5FkXddsmr8A)

GiuseppeChillemi

[07:35](#msg5dd4ecd0bc163f62b6305b84)@LFReD\_twitter Tried. A lot is not working but I am able to do very basic things like opening a web page via command. Also I have looked at the sources and I see there is not so much to change to have back to a fully functional state. Internet part is probably broken by outdated REBOL cyphers; some exectutables have problem with windows 10 and must be changed with something else.

[07:36](#msg5dd4ece2bc163f62b6305c15)Also I receive this messages from my antivirus...

[07:36](#msg5dd4ecf5bebeec417b95adcc)\[!\[image.png](https://files.gitter.im/red/chit-chat/ZGB3/thumb/image.png)](https://files.gitter.im/red/chit-chat/ZGB3/image.png)

[07:36](#msg5dd4ed0dbebeec417b95ae35)I can't find autpilot.vbs in the UniQ folder.

[07:37](#msg5dd4ed23c3a0a43b89852bcf)Why is it trying to access kasperky antimalware\_provider.dll ?

[07:37](#msg5dd4ed50b5e589513e1fe5f7)I I give it permission:

[07:37](#msg5dd4ed547a4c62147b1f6a63)\[!\[image.png](https://files.gitter.im/red/chit-chat/eAqY/thumb/image.png)](https://files.gitter.im/red/chit-chat/eAqY/image.png)

[07:38](#msg5dd4ed61c3a0a43b89852c91)(Can't find script file autopilot.vbs)

LFReD\_twitter

[14:27](#msg5dd54d3b4941f9513fc28418)@GiuseppeChillemi Yeah, like I said, it's old and needs to be ported rather than spend two minutes fixing any of it.

GiuseppeChillemi

[14:30](#msg5dd54e032c9bf5413e633404)I am 100% sure you will do this.

[14:31](#msg5dd54e52e7cce550f58edb02)@LFReD\_twitter What is that autopilot.vbs file Q/Rash seaching ? How could I provide it ?

[15:11](#msg5dd557afefffeb3b8a100be9)\[27 eye opening website statistics](https://www.sweor.com/firstimpressions)

[15:13](#msg5dd5581cf54b9b6c1928e18d)And some \[notes](https://conversionxl.com/blog/10-useful-findings-about-how-people-view-websites/) on people perception while interacting with the web.

LFReD\_twitter

[17:45](#msg5dd57bcb23300564a64b567c)@GiuseppeChillemi autopilot.vbs is gone.. it was replace with the AutoIt.dll

GiuseppeChillemi

[18:09](#msg5dd581752c9bf5413e64c999)@LFReD\_twitter it's not so old. It's well written and porting it should be an easy task.

## Thursday 21st November, 2019

LFReD\_twitter

[22:37](#msg5dd711afafacdc4de44fe3da)Hey! My Redol (see what I did there ;) is really really rusty, and I'm stuck on what seems to be a simple problem...

Say I have a series of integers..  
i: \[1 2 3 4 2 3 5 2 3]  
which are sets of triples... 1 2 3, 4 2 3 and 5 2 3

Now I want to find the 4 2 3 of i (which is a unique set) by locating the 4 and the 2, and replace the 3 with say the number 9. Replace doesn't seem to work, and I can't seem to find the index? of the 3, as everything seems to choke on integers.

Any ideas?

[22:44](#msg5dd7135fb010e62276483007)This is the equivalent SQL "update $table set v = '$v1' where s = '$s1' and p = '$p1'";

greggirwin

[22:49](#msg5dd71488c4fca14de3c7e874)`replace i [4 2 3] [4 2 9]` should work. Something like `forall i [if all [i/1 = 4 i/2 = 2][i/3: 9] i: skip i 2]` is another way.

[22:50](#msg5dd714a5afacdc4de44ff79b)Where you said Redol, we say Redbol; sounds like Red Bull. :^)

[22:51](#msg5dd714e3986060548956ad7f)You could also achieve your goal with `parse`. The best choice depends on your exact needs.

lucindamichele

[23:09](#msg5dd7190d55bbed7ade1ffe9d)&gt; Where you said Redol, we say Redbol; sounds like Red Bull. :^)

You mean it sounds like regret? lol.

greggirwin

[23:10](#msg5dd71980986060548956cadb)Well, I suppose "redol" could also mean we smell (are redolent) of Rebol. :^)

lucindamichele

[23:11](#msg5dd719b099dfe74c95847e4a)gak.

LFReD\_twitter

[23:25](#msg5dd71ce0afacdc4de450332b)@greggirwin I considered the first method, but I'm concerned that even though each triple is unique, it may be possible to cross them (ie : 1 2 3 1 3 2 3 1 2) where it's possible to find 2 3 1 twice.

However the second method will work great, thanks!

## Friday 22nd November, 2019

toomasv

[07:23](#msg5dd78ce5f977187add90d325)@LFReD\_twitter One possibility:

```
>> i: [1 2 3 4 2 3 5 2 3] change skip find/skip i [4 2 3] 3 2 9 i
== [1 2 3 4 2 9 5 2 3]
```

[07:34](#msg5dd78f77ac81632e65e12357)

```
mychange: func [series [series!] what [series!] where [integer!] value][
    change at find/skip series what length? what where value
]

>> i
== [1 2 3 4 2 9 5 2 3]
>> mychange i [4 2 9] 3 3 i
== [1 2 3 4 2 3 5 2 3]
>> mychange i [4 2 3] 2 4 i
== [1 2 3 4 4 3 5 2 3]
>> mychange i [4 4 3] 2 [2 9] i
== [1 2 3 4 2 9 5 2 3]
```

LFReD\_twitter

[09:04](#msg5dd7a4ad4517d002b2d0cc7f)@toomasv So many options now. Anymore and I'll be tempted to benchmark them!

[15:20](#msg5dd7fccbc4fca14de3ce0e38)As mentioned on Red/red, I've created an initial gist of Atomica for Red here

https://gist.github.com/LFReD/af286d491d18052d55a4833478b006e0

[15:21](#msg5dd7fd0e9d72cd02b3261180)I set up a room AtomicaDB for discussions here https://gitter.im/AtomicaDB/community

[15:22](#msg5dd7fd3cafacdc4de4560a95)I guess it's working :P

[15:25](#msg5dd7fe0298606054895cfdfa)Atomica for Red

Atomica for Red is a flat-file triple store smart database

Features

Runs in memory for blazing performance.  
Eight simple functions perform 95% of database interaction.  
Strong Semantic Network / Graphing capabilities  
Dead simple to learn.  
100% Red code, no dependencies.  
4kb in size  
Maps to SQL DBs with ease, using the same functions. No need to learn SQL

[15:33](#msg5dd7ffd4f977187add94001e)I've added a Getting Started doc in the Gist comments. Will create a proper repository soon.

[15:40](#msg5dd8016fb010e622764ea8a8)This stems from my Rebol Virtual Assistant project started in 1998!

While the assistant languished due to technical limitations, this database method was used in more and more projects.

For example, I was hired to bring the University of BC's student exchange application system into the 21st century, tens of thousands of applications with 120 data points each, handled perfectly using a version of Atomica for the DB.

rebolek

[15:49](#msg5dd803a5d2c92c2275d8ae7c)That sounds great!

LFReD\_twitter

[15:52](#msg5dd80445f3ea522f264b3e59)It's a semantic network database management system

A good primer is this Wikipedia article

https://en.wikipedia.org/wiki/Semantic\_network

[16:44](#msg5dd8108b98606054895d8b1d)Half a dozen functions replace SQL. These functions are the same in every language, and can integrate with a single table MySQL datastore or a key/value store etc.

dander

[18:31](#msg5dd8297e4517d002b2d49ec1)@LFReD\_twitter looks like a really neat project!

LFReD\_twitter

[18:52](#msg5dd82e59c52bc74c9671e6ce)@dander very simple, very powerful!

[18:53](#msg5dd82ebab010e622764ff801)On the dozens of major projects, I've hit no limitations.

[20:10](#msg5dd840afc4fca14de3cffcc4)In other words , the six functions are CRUD functions.

lucindamichele

[21:02](#msg5dd84cdcf977187add964a4a)@LFReD\_twitter Semantic computing has fascinated me for a while now...because it's so akin to the workings of the mind. The sheer power of processing human knowledge in this way would yield insights of which we can't even conceive...  
In my previous work elsewhere I have been flummoxed as to why world-class engineers didn't see semantic linking as worth further experimentation...or maybe they did, but were convinced their search algorithm would handle all that work for them (it never could). And I suppose the idea of a semantic web was daunting. It could be complex, I'm sure, but there have to be ways to allow the system to learn on its own, so the engineers didn't have to account for every little permutation of a given (linguistic) expression.

LFReD\_twitter

[22:35](#msg5dd862b7c4fca14de3d0f244)@lucindamichele yeah, it's just too hard to get even a small minority to structure their data.

## Saturday 23th November, 2019

GiuseppeChillemi

[09:09](#msg5dd8f73a89fce12f25afb6a9)Found this:

[09:09](#msg5dd8f74155bbed7ade2d3398)\[!\[image.png](https://files.gitter.im/red/chit-chat/MqL5/thumb/image.png)](https://files.gitter.im/red/chit-chat/MqL5/image.png)

[09:09](#msg5dd8f75dd2c92c2275df34c8)Someone is listening your private conversations !

hiiamboris

[09:15](#msg5dd8f8a7ac81632e65eb2216):D

pekr

[09:52](#msg5dd901594517d002b2da51e6):-)

hiiamboris

[18:09](#msg5dd975caac81632e65ee8e6e)@LFReD\_twitter a few tips on Atomica ☺  
\- you can use hyphen `-` between words in your function names for readability  
\- `trim replace/all s1 " " ""` can be `trim/all s1` (note that both work in place, not on a copy)  
\- subsequent calls to `trim replace/all s1 " " ""` in your foreach do nothing  
\- you can write the whole `atomexists?` as `not none? find/skip db reduce [s1 p1 v1] 3`  
\- same for other foreach/forall loops there  
\- `append db reduce` is `repend db`  
\- `return x` at the end of the function can be just `x`

LFReD\_twitter

[18:18](#msg5dd977fd89fce12f25b34be1)@hiiamboris thanks for the tips!

I knew the all lower case for function names would come up, but years ago I was getting tired of having to remember who's using what type of camel case or whatever in their naming conventions LikeThis or like-this or likeThis, so i settled for all lower case likethis  
ipersonallyhavenoproblemreadingthis but i can see creating a map for whatever convention you prefer.

[18:23](#msg5dd9792798606054896766e1)Just to add, that original Atomica was pretty lazy coding. I'm already tearing it apart, but my Redbol is rusty as.

endo64

[19:31](#msg5dd9891ef977187add9efb45)And for most of `foreach [sub pred val]` parse `find/skip` is shorter and works faster.  
Also `insertatom` function could work incorrectly since you use `forall`, it doesn't treat db as records:

```
>> db: [1 2 3 2 0]
>> s1: 1 p1: 2 v1: 1
>> forall db [if all [db/1 = s1 db/2 = p1][db/3: v1]]
>> db
== [1 2 1 2 1]
```

The last value (zero) is expected to change?

LFReD\_twitter

[19:39](#msg5dd98b0b89fce12f25b3e326)I'm in the process of gutting the block method and replacing it with some hashing! and other indexing methods.. stand by :)

endo64

[19:43](#msg5dd98bf2c4fca14de3d907fd)* `foreach [sub pred val]` "parse" -&gt; "parts"

LFReD\_twitter

[19:47](#msg5dd98cbbb010e6227659683d)For deeper Atomica conversation..  
https://gitter.im/AtomicaDB/community

endo64

[19:52](#msg5dd98e0cf977187add9f227b)Joined!

## Sunday 24th November, 2019

pekr

[11:50](#msg5dda6e9455bbed7ade375fa7)I would like to point you out to the http://dobeash.com/ , the site of the cool reboller, Ashley Trutter. Back then, he created a RebDB, in memory database, later on, he added a RebSM storage manager engine too. Maybe he was inspired by SQLite, which has some kind of experimental engine too (SQLite 4).

GiuseppeChillemi

[14:20](#msg5dda91aa4517d002b2e50131)It is 1 hours I keep trying calling a function putting the refinement together with arguments.

I had built a small test on the REPL and I was amazed it didn't work too.

```
>> f: func [one two /rr three] [print "three ->" three]
>> f 1 2 /rr 3
```

It is the side effect of having used for more than a week the following syntax passing arguments.

```
f [server-name  <value> connection-string <value>]
```

I had mixed feeling, from "I have found a bug !" (I was calling my FORDATA function recursively with a block of code as argument), to "my mind is gone"...

Back to normal working. This is an effect of the persistence that comes from using something for long time.

toomasv

[15:00](#msg5dda9b2689fce12f25bb4311)@GiuseppeChillemi If I got your intention right:

```
>> f: func [one two /rr three] [print ["three -> " three]]
== func [one two /rr three][print ["three -> " three]]
>> f/rr 1 2 3 
three ->  3
```

GiuseppeChillemi

[15:16](#msg5dda9eb3f977187adda65862)Yes, I have written my message because after 1 week using the other technique I

[15:16](#msg5dda9ee9f977187adda65920)... I have started using refinement in the middle of the function, totally forgetting the standard way!!!

[15:30](#msg5ddaa211afacdc4de468676d)I meant, putting the refinement switch in the middle of the function arguments, just before the refinement argument.

toomasv

[15:45](#msg5ddaa5939d72cd02b3389a24)A convoluted example (NOT suggested):

```
f: func [one two ref three /use] [
   either use [
      do reduce [one three two]
   ][
      do compose [(to-path reduce ['f to-word ref]) one two ref three]
   ]
]

>> f 1 2 /use '+
== 3
>> f 1 2 /use '*
== 2
>> f 1 2 /use '**
== 1
```

GiuseppeChillemi

[17:33](#msg5ddabee21bf5192e6698ed4e)@toomasv could you show me different and unusual ways to create functions?

[17:33](#msg5ddabefd55bbed7ade398488)And also contexts/objects

[17:34](#msg5ddabf439d72cd02b3395202)Something outside the classic way. Just to understand the different techniques that you can apply.

[17:37](#msg5ddabfdb5b3db9548ae379e0)Just... All the ways you know! I wish to learn them and create a page.

[17:38](#msg5ddac002afacdc4de4693c1a)You and anyone else providing examples will be cited.

LFReD\_twitter

[17:42](#msg5ddac0ee5b3db9548ae382b7)Red - Easy to learn just enough to be dangerous.

toomasv

[18:21](#msg5ddaca42afacdc4de469885e)@GiuseppeChillemi :smile: I think it is not something that you know and remember. It is more about understanding how to transform things into other things and then use fantasy to get a desired result.

E.g. pretty useless one

```
op: "+-*/%"
surprise: func [a b][o: get to-word random/only op a o b]
loop 10 [prin rejoin [surprise 2 3 " "]]
;2 -1 -1 -1 2 5 5 0 5 5
```

GiuseppeChillemi

[19:57](#msg5ddae0b0ac81632e65f8807d)@toomasv I remember function with the `context` word and `load/do`, something eye opening but I am not finding them

toomasv

[20:49](#msg5ddaecd4f977187adda87dbe)@GiuseppeChillemi Figure this:

```
>> context [res: none set 'is added to make op! func [a b][res: add a b print "OK."] set 'What is the result? does [res]]
== make object! [
    res: none
]
>> 1 is added to 3
OK.
>> What is the result?
== 4
```

hiiamboris

[20:58](#msg5ddaeef399dfe74c959f687d)unicode spaces? :)

toomasv

[21:03](#msg5ddaf016c52bc74c96852ffb):)

hiiamboris

[21:07](#msg5ddaf0f889fce12f25bd954f)A powerful obfuscation trick ☺ I like it

GiuseppeChillemi

[21:31](#msg5ddaf6ba89fce12f25bdc4f6)I am selling my mind on ebay, need a new one.

hiiamboris

[21:37](#msg5ddaf8365b3db9548ae50b0c)Any discounts for Red veterans? ;)

GiuseppeChillemi

[22:03](#msg5ddafe3155bbed7ade3b3b2a)@hiiamboris no discounts to the people that ruined it!

hiiamboris

[22:04](#msg5ddafe7b5b3db9548ae533e8):D

## Monday 25th November, 2019

greggirwin

[04:38](#msg5ddb5aacac81632e65fbc459)Devilish...downright... You could take user input, replace standard spaces in permutations, see if the result is an `op!`, and... The road to Hell is paved with this kind of thing. ;^)

toomasv

[05:09](#msg5ddb621e9d72cd02b33d8ac4) :scream:

[08:32](#msg5ddb919bf977187addacf253)@GiuseppeChillemi Another possibility to get loose refinements. Again, possible but not recommended, unless you just can't live without it :)

```
system/lexer/pre-load: func [src][
	ws: charset reduce [space tab newline] 
	ws+: [some ws] 
	dig: charset "0123456789" 
	num: [some dig] 
	parse src [any [
		"myfunc" s: ws+ 2 [num ws+] 
		any [i: ["/r3" | "/r4"] ws+ num ws+ (
			move/part i s 3 
			s: skip s 3
		)] 
	|   skip]]
]
myfunc: func [one two /r3 three /r4 four][
	case/all [
		r3 [print ["three ->" three]] 
		r4 [print ["four ->" four]] 
		true [print ["args ->" one two]]
	]
]
```

```
>> myfunc 1 2 /r3 3
three -> 3
args -> 1 2
>> myfunc 1 2 /r3 3 /r4 4
three -> 3
four -> 4
args -> 1 2
>> myfunc 1 2
args -> 1 2
```

pekr

[12:57](#msg5ddbcf9cafacdc4de470c500)@dockimbel and eventually @Respectech - I was asked by my (next year be my) wife about choosing some Christmas present :-) I would like to look into some small boards again, to have some fun. In the past, I have used Beagle Bone Black board, but I was not present in that area for few years. I am a bit versed upon where to start and it can go into various directions:

\- What kind of minimal HW support is required, to get Red running on? 32 bit ARM on mostly a whatever Linux?  
\- I would like to get myself into some sensors area, but I expect anything Arduion related being out of the game for Red even in a longer term?  
\- Robotics - Beagle Bone Blue, Odroid Go, RPi with GrovePi+ boards?  
\- Higher level AI - face recognition, car ID numbers OCR, etc. stuff - nVidia Jetson Nano?  
\- Is there any eventual library / framework of sensors out there, which we could eventually start to slowly port to work with Red?

Can you guys see any oportunity in any of the above areas?

LFReD\_twitter

[13:22](#msg5ddbd5ae986060548977aa88)There's no end to the opportunities out there. I had a client that rented large electrical transformers to movie studios, and they paid based on how long the transformer had been running that week. So every week, a tech would need to drive across town (town being Vancouver worst traffic ever) and read how many hours the machine had been running, then back again.. So I built them an Arduino that connected to the on/off switch, and had a pay as you go phone sim.. it would call home, and leave a message for the accountant with the hours used, or you could call it up. Saved the company $12,000 / yr, and allowed the tech to work on something else instead. So yeah, there must be 1000s and 1000s of problems like this.

BeardPower

[17:41](#msg5ddc125198606054897976a3)@pekr There are a ton of hats etc. for RbP and others which all come with drivers. If not, the community created one. You could port those to R/S. Implementing I2C and SPI for R/S will cover 90% of sensors.

[17:43](#msg5ddc12b25b3db9548aecec54)7-segment and dot-matrix displays etc. Just create some old-school hardware drivers ;-)

[17:44](#msg5ddc1304f3ea522f2667db32)A nice 50 Mhz oscilloscope also makes a decent present.

greggirwin

[23:21](#msg5ddc6204d2c92c2275f7744f)@toomasv make sure you save all your experiments. :^)

lucindamichele

[23:22](#msg5ddc622389fce12f25c7e451)Yes indeed!

## Tuesday 26th November, 2019

Respectech

[01:54](#msg5ddc85da4517d002b2f2f0d5)@pekr Agreed, that would be fun. Any SBC running Linux should work for Red.

toomasv

[05:15](#msg5ddcb4d4f977187addb55359)@greggirwin I do! :neckbeard:

GiuseppeChillemi

[06:15](#msg5ddcc31fb010e622766fd796)@greggirwin I am already saving them, as I am doing for Vladimir messages too.

LFReD\_twitter

[06:20](#msg5ddcc436f3ea522f266c9847)Hmm, just realized you can have rebol and red run the same script by adding both headers

Red\[]  
Rebol\[]

[06:22](#msg5ddcc48d9d72cd02b3478364)Just need to add a new header Redbol\[] :)

pekr

[06:37](#msg5ddcc846afacdc4de477e002)Thanks guys for the tipcs. I will devide my efforts into two streams - lower level and higher level boards. I will start with where my most defficiency comes from - the low level. I have found nice educator Arduino Starter Kit - https://store.arduino.cc/genuino-starter-kit containing 15 basic projects to go thru. Looking into the Processing - https://processing.org/reference/ I was quite suprprised e.g. 2D primitives look much like our Draw dialect.

LFReD\_twitter

[18:46](#msg5ddd730d05eec2433d871462)我觉得有趣的是，语言只是您和我都同意具有含义的一堆符号。

[19:31](#msg5ddd7dac55066245981e82a5)All language, including programming languages, consist of only three types of sentences.  
\- Declarations  
\- Queries  
\- Commands

Declarations are stored as data. Queries access those declarations, and program languages execute commands using that data.

The other thing is all sentences have nothing more than a subject, a predicate and an object, including all commands. Lastly, we use symbols to represent subjects predicates and value. In order to communicate we must agree what 'meaning' any particular symbol has.

That it. That's the basic of language in a nutshell.  
a: "hello world" &lt;- command

[19:33](#msg5ddd7deed64a052fb66aad2d)"Let the symbol a point to the symbol "hello world"

[19:33](#msg5ddd7e2740f1940ca9da66ef)or "a" "points to" "hello world"

[19:34](#msg5ddd7e59d75ad3721d07a531)Why we don't use more Triple stores for computation boggles my mind.

[19:57](#msg5ddd83bf26eeb8518f1fbee6)Forget Esperanto, what we need are universal symbols to represent subjects and predicates.

[20:09](#msg5ddd8664c3d6795b9fd75735)Take the command "Join two strings together"

"+" - Javascript, python, Java  
join \["one" "two"] - Red  
strcat("one" "two") - C  
(concatenate 'string "one" "two") - Lisp  
etc

Even in English we can't agree on the symbol.. "join", "concatenate", "append", "combine", "conjoin" and fifty others.

So many symbols, so few predicates.

[20:10](#msg5ddd869905eec2433d87b7c4)"end rant" "insert" "here"

Oldes

[20:30](#msg5ddd8b6005eec2433d87ded0)@LFReD\_twitter it is not `join ["a" "b"]` but `rejoin ["a" "b"]`!

LFReD\_twitter

[21:51](#msg5ddd9e671659720ca8b0e41f)yeah, right!

[21:52](#msg5ddd9e846a85195b9eaf1b9f)I'll add Rebols.. join "one" "two"  
:P

Oldes

[22:19](#msg5ddda506f65fec1c8e76691a)I don't see what's a problem? That is programming. You may add `.` in PHP, `spaced` and `unspaced` in Ren-C etc...

[22:20](#msg5ddda54355066245981fa872)Red/Rebol is mainly just about `append copy`, the rest is a mezzanine code to handle all the types.

rebolek

[22:21](#msg5ddda5668e906a1c8d22129e)btw, `append` itself was a mezzanine for `insert tail` ;-)

Oldes

[22:21](#msg5ddda5756a85195b9eaf4f16):)

LFReD

[22:38](#msg5ddda94ef65fec1c8e768bc6)I rest my case.

## Wednesday 27th November, 2019

Oldes

[14:57](#msg5dde8ee7f65fec1c8e7d08bf)And this is how works Google today..:

[14:57](#msg5dde8ef0d75ad3721d0f8f2a)\[!\[image\_from\_ios.jpg](https://files.gitter.im/red/chit-chat/6EQa/thumb/image\_from\_ios.jpg)](https://files.gitter.im/red/chit-chat/6EQa/image\_from\_ios.jpg)

pekr

[14:59](#msg5dde8f5e9319bb51909dc236)The world has gone awry ....

Oldes

[14:59](#msg5dde8f6140f1940ca9e24b81)USofA is very close to be like China soon.

greggirwin

[19:20](#msg5ddecc715ac7f22fb51d2877)If it weren't for alcohol, we'd probably all be dead.

LFReD

[19:32](#msg5ddecf3505eec2433d914f60)Alcohol, the third leading preventable cause of death in the USA

[19:34](#msg5ddecfbdb065c6433cf7d2e6)1 out of every 4 adults in the US reported they binge drank in the last month.

1/3 of all traffic fatalities involve a DUI

Coming from experience.. I had five DUI charges before I was legally allowed to drink. What's prison like? Boring.

GiuseppeChillemi

[19:49](#msg5dded34ad64a052fb6747984)What's DUI?

LFReD

[20:39](#msg5ddedf175ac7f22fb51db2f5)"Driving under the influence" aka "Impaired driving" aka "Driving while intoxicated" etc

[20:50](#msg5ddee1956a85195b9eb8c515)On a more cheerful note, new Atomica for Red update 0.2.0

https://gist.github.com/LFReD/af286d491d18052d55a4833478b006e0

## Thursday 28th November, 2019

LFReD

[15:53](#msg5ddfed779319bb5190a7b249)A thought seeing we're being chitty chatty here!  
The shortest sentence, thus the shortest piece of data you could store would be 0 1 in binary, where 0 would mean "I" in English, and 1 would mean "am", or "I am".

What I find most interesting is when Moses met God in the wilderness, and sent him to the Israelites to deliver them out of Egypt, Moses asked God "Who shall I tell them has sent me?" To which God replied "Tell them I Am has sent you."

lucindamichele

[22:55](#msg5de050649319bb5190aa8c5e)@Oldes  
&gt; And this is how works Google today..:  
They'll censor your alcohol and gambling...but they're happy to insert "Black Friday" into my google calendar. Pretty sure it's about time for me to invest in these:  
https://returntonow.net/2019/10/17/artist-designs-face-jewelry-to-block-facial-recognition-technology/

## Friday 29th November, 2019

loziniak

[09:22](#msg5de0e33bf65fec1c8e8d7cc9)0=I, 1=am, 01=I am? 10, 11, 00 are just as short. And why 1=am, and not 1=cat?

LFReD

[10:21](#msg5de0f13ef65fec1c8e8de48d)Well, the shortest English sentence would be "I am" 3 bytes, 2 symbols. If we set one bit to represent "I" and another to represent "am" 1 0, the we have 2 bits / 2 symbols. You could go 0 1..same thing, but not 1 1 or 0 0.

loziniak

[10:30](#msg5de0f353b065c6433c06ceac)BTW `.org` is sold to a company:

https://www.theregister.co.uk/2019/11/20/org\_registry\_sale\_shambles/

https://savedotorg.org/

[10:33](#msg5de0f3f008d0c961b7bb6407)@LFReD why not 00 or 11? And what does "I am" mean in this language, where you have only 2 words? Do they mean the same as in English? How to say "I love you" in this language? :-)

LFReD

[16:42](#msg5de14a5b1659720ca8cb7609)I love you. 0 1 00

[16:47](#msg5de14b8eb065c6433c099df9)&gt; BTW `.org` is sold to a company:

I remember a time when domain names were free, they were all there for the taking and nobody wanted them. I had superman.com, ombudsman.com, moorage.com and others.

[16:49](#msg5de14c2108d0c961b7be1820)That, and the time I put 3,333 bit coins into a shopping cart, and after entering my CC, deciding that I'm probably wasting $100 and cancelled it.

[16:56](#msg5de14da99319bb5190b1b691)@loziniak "I am" means "jestem"

[16:57](#msg5de14dddd75ad3721d22ea20)Let's you and I agree that the bit 0 = "jestem", so every time you see that bit, you'll know the 'meaning' in your mind.

[16:59](#msg5de14e711659720ca8cb9459)Written language is nothing more than you and I agreeing that certain symbols have particular meanings. You notice this as you teach children to read. While you teach them that written symbols have a particular meaning, you're at the same time teaching them the equivalent symbols used in speaking.

[17:02](#msg5de14f245ac7f22fb52ee974)0 going to get a coffee!

loziniak

[23:27](#msg5de1a95908d0c961b7c0b2cb)I must admit I don't quite understand the concept :-) Probably has something to do with NLP, right? Coding words using binary system other than ASCII seems strange. Probably the idea is that you encode meaning of a word, which is not possible to divide, like into letters.

[23:27](#msg5de1a97df65fec1c8e933729)Have a tasty coffee!

## Saturday 30th November, 2019

LFReD

[00:50](#msg5de1bcecd75ad3721d2601b1)One could say that "I am" isn't actually a sentence. Sure I am.. I exist. But our brains are inferring meaning. Others would say "I am what?" To avoid confusion; "I" "exists" "true"

lucindamichele

[00:54](#msg5de1bdc632df1245cbb5df0d)"Am" is a conjugation of the \[highly irregular] English "to be," which is different than "to exist." It could be splitting hairs, or if you meditate regularly, you may find them to be different. ;)

[01:09](#msg5de1c1635ac7f22fb5320b90)I love to tell people that "No" is a complete sentence; "I am" is one as well, I believe. That's what makes the statement so powerful. By stripping away extra refinements or specificity, it becomes much vaster than a mere reference to an action ("existing").

LFReD

[03:54](#msg5de1e7ec05eec2433da734c2)@lucindamichele Let me try... 'Ommmmmmm...'

[03:55](#msg5de1e81ef65fec1c8e94ddf7)...ommmmmmmm... ' Nope, not feeling it ;)

viayuve

[05:43](#msg5de20188f65fec1c8e958544)@LFReD She said regularly :wink:

## Sunday 1st December, 2019

abdllhygt

[16:21](#msg5de3e89d8e906a1c8d4eadbc)Hi! what's news?

[16:22](#msg5de3e8b68e906a1c8d4eaf20)i started the translation engine again from zero

LFReD

[17:25](#msg5de3f79cc3d6795b9f051ab4)With AtomicaDB, It's theoretically possible to store 16,777,215 sentence declarations (think rows in a db) using just 3 bytes.  
111 132 1ab 1©t 1pg 1q¢ 17┐1¾§

That's the first name, last name, email, phone number, street, city country for a single person.

It takes only 17mb to store those 16,777,215 rows of data. (although, i suppose the space character needs to be taken into consideration)

[17:34](#msg5de3f99a5ac7f22fb5417688)That's all the computer needs to provide you with say a list of everybody and their email addresses, what pets they have and so on.  
However, there's a limit of 254 subjects , 254 predicates (which is a ton) and 254 values.

Adding one more byte to the start and one on the end for 5 bytes ups that to 65,536 subjects and values. It also has the potential to store 1,099,511,627,776 declarations or rows of data. That would fit on a single SD card.

A triple eg 111 has hidden data available, and that's the index of each byte.

red: "abc"  
red/2  
\== #"b"

hiiamboris

[18:41](#msg5de4094b05eec2433db62ca7)Where these numbers come from?

## Monday 2nd December, 2019

LFReD

[18:06](#msg5de552add75ad3721d3f6029)Any decisions on save/all ?  
/all =&gt; TBD: Save in serialized format.

greggirwin

[18:38](#msg5de55a298e906a1c8d591793)It will come, but isn't a top priority right now. It really depends on `mold/all`, which has to be done for every type, meaning design decisions on serialized syntax.

LFReD

[19:27](#msg5de565955ac7f22fb54ba6e2)Another question :)  
Is it possible to determine whether I'm using Rebol or Red. My script works the same on both with one exception. If I could catch that, I could add an if Rebol? type switch.

`about` gives the info, but it can't be parsed.

I guess one way would be to `try` something that doesn't work in red, then set a variable :)

hiiamboris

[19:29](#msg5de5660f8e906a1c8d59718c)Word `rebol` is defined in Rebol :)

ne1uno

[19:29](#msg5de56632550662459856f2f0)'length? system/words\` ;?

hiiamboris

[19:31](#msg5de5667c32df1245cbcf912c)Also I suggest you look at this script http://dobeash.com/files/munge3.r  
It's very pragmatic and portable

ne1uno

[19:31](#msg5de566ab46397c721c74d142)`print [split form os-info newline]`

LFReD

[19:32](#msg5de566c408d0c961b7db22f9)Rebol2  
'length? to-string rebol  
\== 308469

Red  
'length? to-string rebol  
\== 5

Oldes

[19:32](#msg5de566cb9319bb5190cecd1b)`either rebol [print "rebol"][print "red"]`

[19:35](#msg5de56793550662459856fd27)@LFReD in Rebol `rebol = system` so doing `to-string rebol` is very bad way how to check it!

[19:37](#msg5de567f1d75ad3721d400201)@LFReD and because you are very active in these room, it's probably good time to teach you something... please check this little button:

[19:37](#msg5de567f532df1245cbcf97dd)\[!\[image.png](https://files.gitter.im/red/chit-chat/61vg/thumb/image.png)](https://files.gitter.im/red/chit-chat/61vg/image.png)

[19:38](#msg5de5683546397c721c74dbb2)It is in the bottom right corner of the text area where we write a text.

LFReD

[19:38](#msg5de5685132df1245cbcf99b5)Yeah, I've seen it. I'm guessing you're referring to highlighting all `code`?

[19:39](#msg5de56868f65fec1c8eada738)Personally I don't think it's necessary all the time. I can't stand code highlighting in editors either, too distracting.

[19:45](#msg5de569cef65fec1c8eadb082)But what I did just find is the gitter backslash escape character!  
\\&gt;&gt;

[23:06](#msg5de598f8d64a052fb6a491d3)Functions to save and load hash! blocks in Redbol scripts (scripts that run without changes in both languages :)

```
saveit: does [
	either rebol [
		save/all %db.txt db
	][
		dbsave: to-block db save %db.txt dbsave dbsave: copy []
	]
]
```

```
loadit: does [

	either rebol [
		either not exists? %db.txt [
			db: to-hash []
		][
			db: load %db.txt
		]
	][
		either not exists? %db.txt [
			db: to-hash []
		][ 
			db: load %db.txt
			db: to-hash db
		]
	]
]
```

[23:08](#msg5de5995d05eec2433dc1b041)Probably should use `clear` instead of copying empty block

Oldes

[23:11](#msg5de59a11c3d6795b9f10cf07)Sorry for stupid question, but why do you have such an ugly line:

```
dbsave: to-block db save %db.txt dbsave dbsave: copy []
```

when you can write just:

```
save %db.txt to-block db
```

[23:12](#msg5de59a595ac7f22fb54d3122)or:

```
save/all %db.txt to block! db
```

endo64

[23:15](#msg5de59af6c3d6795b9f10d677)

```
either not exists? %db.txt [
            db: to-hash []
```

part can also go before `rebol` check.

## Tuesday 3th December, 2019

LFReD

[00:35](#msg5de5ade7f65fec1c8eafad73)&gt; Sorry for stupid question, but why do you have such an ugly line:

Thought process..  
\- need to convert to a block without resetting db  
\- need to save that converted block  
\- need to clear that block so as to not eat the memory

[00:37](#msg5de5ae6726eeb8518f59d449)I don't dream in Rebol as many here ;)

[00:40](#msg5de5aeed05eec2433dc24101)I'm just quickly scratching these things out, so don't even think of being concise as there's a good chance of ripping it apart anyway (this is the fourth or fifth iterations of these two functions)

[00:41](#msg5de5af1e1659720ca8ea79d2)“I didn't have time to write a short letter, so I wrote a long one instead.” - Mark Twain

[00:44](#msg5de5afdb1659720ca8ea7f02)I know for a fact that it's going to change again when I add a DB namespace system...  
:db is replaced by, say atom-db where atom is a connection to a particular data silo, which can be mixed and matched with MySQL, flat-file like this or whatever.

[00:45](#msg5de5b01146397c721c76d4f9)which is why I'm not too worried about naming conventions at the moment either.

[00:45](#msg5de5b031b065c6433c28d37e)I mean.. db as a global word? Really?

[10:05](#msg5de6334c08d0c961b7e14085) My Redbol script to save and load multiple databases for use in a single script that works with Red or Rebol without modification. (lightly tested)

```
Red []
Rebol []

;db names and paths, creates blank or loads existing.
data: [dbs %dbs.txt red %red.txt] 

loadit: does [
	foreach [name path] data [
		either not exists? path [
			set :name name: to-hash []
		][
			either rebol [
				set :name name: load path]
			[
				set :name name: to-hash load path
			]
		]
	]
]

saveit: does [
	foreach [name path] reduce data [
		either rebol [
			save/all path name
		][
			save path to-block name
		]
	]
]
```

Checks if DB already exists, creates if not, loads it otherwise.

[10:05](#msg5de6336b5ac7f22fb5519402)Any optimization is appreciated!

Oldes

[12:23](#msg5de653a446397c721c7ba0bb)Don't you see that `set :name name:` looks really strange? You can reduce it to just:

```
set :name load path
```

[12:38](#msg5de6572ec3d6795b9f165a4e)Also avoid using `reduce data`, instead use:

```
saveit: does [
    foreach [name path] data [
        either rebol [
            save/all path get name
        ][
            save path to-block get name
        ]
    ]
]
```

[12:41](#msg5de658018e906a1c8d60904a)Or:

```
saveit: has [db][
    foreach [name path] data [
        db: get name
        unless rebol [db: to block! db]
        save/all path db
    ]
]
```

LFReD

[16:35](#msg5de68ed4b065c6433c2f71eb)&gt; Don't you see that `set :name name:` looks really strange?

yeah, really strange but it worked ;)

I knew this, but couldn't recall 'get' if my life depended on it. Language is easy, syntax is hard. Language, use it or lose it.

## Thursday 5th December, 2019

Respectech

[02:57](#msg5de8720c32df1245cbe5e305)So, we have built four microcontroller prototypes that operate in much the same way as the old 8-bit computers of yore, such as the Commodore 64 and Apple II. Each uses their own micro version of a programming language such as BASIC, Ruby, Perl, and Javascript. Each can store four programs in flash and one of those programs can be set to run at boot.

If only we knew someone who could make a simple version of Red or R/S to run on these... ;-p

https://twitter.com/ameridroidSBC/status/1202401787455524865

pekr

[06:34](#msg5de8a4dbd64a052fb6bac95b)Red missing on IoT / AI wave is imo one of the most missed oportunities ....

LFReD

[07:14](#msg5de8ae3e32df1245cbe77b75)@pekr +1

[07:20](#msg5de8afab5ac7f22fb5637d23)And in that light, I don't understand how ports aren't the priority?

pekr

[07:43](#msg5de8b5079319bb5190e4c118)I think they are still a priority. However, and seeing the latest blog post, Red (the company) is finishing some product, which we publicly know nothing about. So that acutally might be a higher priority. Next is the 0.6.5, followed by ports ....

viayuve

[07:44](#msg5de8b551c3d6795b9f276559)may be next year.

pekr

[07:44](#msg5de8b57b5ac7f22fb563ab55)I am a CTO for a company letting 43K of appartments (flats). And we are looking into a SmartHome area, sensors, etc. I will try to build a LoRA network based upon a Mikrotik to collect some IoT stuff ... now looking into platforms like ThingsSpeak, etc.

dander

[19:28](#msg5de95a70f65fec1c8ecaa967)oh, I hadn't seen that post yet. Was it announced anywhere?

LFReD

[19:59](#msg5de961ab1659720ca8056250)@greggirwin "Now, a challenge! In the coming new year we'll be needing beta testers willing to lend their expertise in refining a new product built with Red. "

What sort of beta testing? Is there even a hint as to what the product is? What industry even?

[20:23](#msg5de9673532df1245cbeceb5c)... from red/help re: dynamic code generation

I see the Redbol languages as perfect for this sort of work. 'word is just a symbol, an English one at that. Why can't it be a single bit?

[20:23](#msg5de9675a26eeb8518f7206d9)0 = 'word  
1 = 'print

[20:27](#msg5de96820b065c6433c446c1e)I mean, what is that symbol: word ? From the Rebol3 docs "Words are the symbols used by REBOL."

dander

[20:29](#msg5de968c21659720ca805981f)sure, you just run out of different symbols you can use pretty fast (if it's just a bit)

LFReD

[20:30](#msg5de968cf5506624598744a4d)"  
Symbol def: a mark or character used as a conventional representation of an object, function, or process,

[20:30](#msg5de968f408d0c961b7f8d773)@dander so, add another bit.

dander

[20:31](#msg5de9691e32df1245cbecfb9e)yeah, for us humans, a whole alphabet is nice to have. A machine certainly doesn't need one

LFReD

[20:33](#msg5de9699b6a85195b9e04633b)Humans don't need an alphabet either.. it's just the way things have, and will continue to be, done.

dander

[20:34](#msg5de969bdc3d6795b9f2cc7bf)How familiar are you with the whole notion of words/bindings/contexts?

[20:35](#msg5de969f705eec2433dddca50)It sounds like you are toying with that question

LFReD

[20:35](#msg5de96a1755066245987450a1)No, that's just syntax.

[20:36](#msg5de96a406a85195b9e046676)There's no such thing as words/bindings/contexts. Those are just symbols that have a meaning that you and I agree on.

dander

[20:38](#msg5de96ace32df1245cbed07cd)Are you talking about language abstractly? Or with respect to Red?

LFReD

[20:44](#msg5de96c235506624598745c18)It relates to both of those contexts. With Red, Im more interested the aspect I discussed in red/help

dander

[20:52](#msg5de96e14d64a052fb6c09b61)Ahh, okay. Well I wasn't sure what you meant by passing arguments to a function that you dynamically create, but everything in Red is a value, and all values are anonymous until you interpret them

[20:53](#msg5de96e6426eeb8518f7234ff)most newcomers when they see `blah: func[][...]` think this is an assignment for a `blah` variable to a declaration of a function, but it's really just a bunch of values and blocks

[20:57](#msg5de96f229319bb5190e8fed6)I'd like to continue, but I need to leave in a couple minutes

greggirwin

[20:57](#msg5de96f40c3d6795b9f2cecad):point\_up: \[December 5, 2019 12:59 PM](https://gitter.im/red/chit-chat?at=5de961ab1659720ca8056250) We'll need feedback on usability, and bug reports of course. We already have a long feature list, and some things that may move to another product. Identifying the minimal feature set that provides value is needed, along with application in the target areas. I hope that's vague enough. ;^)

We'll leak more information over time.

LFReD

[21:06](#msg5de9714405eec2433dde02a9)@dander Yuo cna porbalby raed tihs esaliy desptie teh msispeillgns.

It's not about syntax, it's about meaning.

[21:12](#msg5de972cc6a85195b9e04a1c2)Anyway, that's why I'm here. I've been lurking Red since before day 1. Checking in every couple of years. I'm placing my bet on Red 'getting things done' and yeah, I struggle with Redbol syntax at lower levels, or even 'print :P so I'm of little help in development, and not interested in laborious chores like doc updates (no offence to those who do, you're the real champs!) but simply have ideas like this one, Atomica, and other product ideas using Red. i have an ERM that I would like to port as well.

[21:13](#msg5de973108e906a1c8d772615)Think SAP when you think ERM

[21:15](#msg5de9735432df1245cbed475f)@greggirwin Tell me your new project isn't an ERM!

[21:15](#msg5de9738205eec2433dde10fb)https://www.macrotrends.net/stocks/charts/SAP/sap-se/net-worth

greggirwin

[21:16](#msg5de973bdd64a052fb6c0c744)It's not.

LFReD

[21:16](#msg5de973c65ac7f22fb5692b9a):)

[21:18](#msg5de9742b8e906a1c8d772ca3)Imagine an OS ERM that compares to SAP. No end to the revenue streams there.

[21:18](#msg5de97435b065c6433c44c077)built on Red of course! :)

[21:23](#msg5de9753ab065c6433c44c6d8)As for my points in red/red regarding the goal of Red.. it's not to create the "world's first full stack language"

[21:24](#msg5de975738e906a1c8d7735da)The goal should be "To convince developers that there's a better way to develop"

[21:24](#msg5de9758308d0c961b7f9312a)Do that, and the language will build itself.

[21:28](#msg5de97666b065c6433c44d0dd)My last full time job was with Automattic, the parent company of WordPress. WP was a fork of the OS project b2. Sure, the code needed to be developed, but that wasn't the goal.

[21:30](#msg5de976fb5ac7f22fb569469e)WP is OS too! Anyone can build their own company around it. There's no money in the code, it's what you do with it that matters. Sounds like the Red team understand this with the announcement of their new product, whatever that is :)

henrikmk

[21:30](#msg5de977005ac7f22fb56946a0)"To convince developers that there's a better way to develop" - I remember that one for REBOL. Didn't work. Have coded in REBOL for 19 years now and am convinced it's the better way to develop, but found it extremely hard to convince anyone else beyond "wow, that's interesting" and have given up advocating it.

If the goal could be to let the the technology of Red speak for itself, that would work for me. That's how REBOL won me over, initially.

LFReD

[21:31](#msg5de9772505eec2433dde2652)Right.. you need to shovel a ton of dirt to find 1 gram of gold.

[21:31](#msg5de9774308d0c961b7f93fa3)Rebol didnt just fall in your lap.. you heard about it.. it was somehow marketed to you.

[21:33](#msg5de97796d64a052fb6c0e5fe)If the goal is to convince developers there's a better way (and in return, get developers into the community like yourself and otherss) then budget should be spent on marketing, not developers.

henrikmk

[21:34](#msg5de977c95ac7f22fb5694ca5)I heard about REBOL, because I knew about Carl Sassenrath, who coded parts of my favorite operating system. Downloaded REBOL/View and tried out the demos in the Viewtop and tried doing my own layouts and was immediately sold. It made things easy that were difficult before. That's how you sell me things.

LFReD

[21:34](#msg5de977cd08d0c961b7f94215)So if that's the real goal (which again, is my opinion) then what is the bottleneck?

[21:34](#msg5de977f85ac7f22fb5694d5a)@henrikmk ok.. doesn't matter how you heard about it, just that you did.

[21:38](#msg5de978ba550662459874c0a0)Most of the guys here have been around for decades.. the true Redbol zealots. There's 1000 more zealots out there that have never heard of it OR, and more importantly, once they check it out, leave due to a number of obvious reasons.

[21:39](#msg5de978f626eeb8518f72727a)So then, the real bottleneck is not being able to turn potential developers into proselytes.

[21:39](#msg5de978fff65fec1c8ecb942f)Anyway, there's my two bits.

[21:40](#msg5de97943c3d6795b9f2d36de)(That's 25 cents in N. America syntax)

[21:50](#msg5de97b88f65fec1c8ecba472)One thing I would encourage to clear this bottleneck. Don't get defensive with the critics or the nay-sayers. Often these are the ones that becomes the biggest fans. It's human nature to question new things. Even Jesus knew this... "No man also having drunk old wine straightway desireth new: for he saith, The old is better."

[21:51](#msg5de97bedd75ad3721d5e8804)No doubt some of you are thinking "Jesus? How did he get into this conversation?!?"

That's exactly the same reaction some would have of Red.

hiiamboris

[22:17](#msg5de981e81659720ca8064a2e)Now you make me wonder how I learned of Rebol ☻ I do not recall :D

[22:19](#msg5de9825a5506624598750d98)Most likely I was browsing wikipedia. They have those lists of languages, paradigms they follow, etc. I had this idea - solve every new task in a new language ;) Must be wikipedia where I've got the link...

LFReD

[23:12](#msg5de98ecd8e906a1c8d77ee38)DeepSpeech 0.6: Mozilla’s Speech-to-Text Engine Gets Fast, Lean, and Ubiquitous - Open source and runs on Raspberry pi 4

https://hacks.mozilla.org/2019/12/deepspeech-0-6-mozillas-speech-to-text-engine/

[23:13](#msg5de98f275ac7f22fb569f5fb)How much does a bounty hunter want to make this work on a raspberry with Red?

[23:17](#msg5de99013b065c6433c458953) I would imagine DSL and speech rec as a no brainer.

## Friday 6th December, 2019

GiuseppeChillemi

[00:22](#msg5de99f3fb065c6433c45fd61)Redbol let me see my ideas being projected in my internal giant wall.

[00:24](#msg5de99fc5c3d6795b9f2e45d6)I have literally seen an email being sent on the very first chapters of Rebol. If you do this and add other advantages other people will come.

[00:30](#msg5de9a110550662459875d79e)As written to Gregg and also Nenad about `select` used as a full access mechanism for blocks seen and manipulated as tables, developers must be able to project their ideas realized through Red in their respective inner projection wall. If this happens he will come onboard. Also, another mechanism letting him dream that our language gives: time, simplicity, access to new tecnology, they are all drivers for the adoption of Red. Also leaders are important. Carl attracted me thanks to having been innovative with amiga, so I thought its language should be innovative too.

viayuve

[04:30](#msg5de9d95dd64a052fb6c372b5)6

## Saturday 7th December, 2019

LFReD

[04:10](#msg5deb26449319bb5190f362f9)This is an interesting project if you haven't checked it out yet.. https://brave.com/

[04:15](#msg5deb27568e906a1c8d835a4c)Created by Brendan Eich

[04:28](#msg5deb2a5ad75ad3721d6aa078)This is one fast browser.. with built in crypto wallets.

[09:57](#msg5deb778e1e0b827cc8b7c026)Ok.. so. I'm abandoning my multiple DB Atomica plans for now, as I have a better idea. Atomica now uses a default db named \*ahem* `atomica`. Atomica can be used for personal use , but will also contain the info to drive Atomica itself. So, instead of a data file with dbs and paths, in the future, the way to create a new db will be as simple as adding a triple to the default atmoica db like this.

"mynewdb" "isa" "atomicadb"

The system will use the sofpandv crud function to collect the subjects ("mynewdb" in this case), and load it if it already exists, or create it if it doesn't and set up the necessary functions.

[09:59](#msg5deb78171e0b827cc8b7c481)How easy is that?

[10:04](#msg5deb7933d64a052fb6cf01ae)3 functions to create, insert and read...

```
insertatoms "mynewdb" "isa" "atomicadb"
insertatom "bob" "email" "bob@example.com" "mynewdb"
theemail: singlevalue "bob" "email" "mynewdb"
\>> "bob@example.com
```

The current atomicadb doesn't require the db argument.

[10:06](#msg5deb799a9319bb5190f59aee)Updated atomica.red file here  
https://gist.github.com/LFReD/af286d491d18052d55a4833478b006e0

[10:10](#msg5deb7a8e1e0b827cc8b7d442)Atomica discussion room here: https://gitter.im/AtomicaDB/community

GaryMiller

[14:37](#msg5debb91a32df1245cbfd3d49)@LFred Are you planning on adding Bayesian probabilities to Atomica. Or how would you use Atomica to represent a statement such as...  
50% of the American public wants to impeach Donald Trump for blackmailing Ukraine but 47% want to give him a pass because the economy is good.  
I would assume that the knowledge engineer would need to decompose this sentence into multiple simple sentences linking them together. Will you be working on a graphical editor to add, update and show these interrelationships graphically as hypergraphs?

LFReD

[18:56](#msg5debf5d86a85195b9e162895)Trying to break down random sentences using AI seems over the top. eg "Bleep bloop she told me so".  
Good luck with that.

[18:59](#msg5debf69b8e906a1c8d89135f)I think there's a compromise where language needs to become standardized.. I have some old experiments with "LFReD Standard English" This old Rebol project uses some of those experiments.  
https://github.com/LFReD/Rebol-Q

[19:00](#msg5debf6bb5ac7f22fb57af927)and this folder in particular https://github.com/LFReD/Rebol-Q/tree/master/UniQ/bin/datu

[19:01](#msg5debf6f4d75ad3721d7015c6)In that sentence example you gave, it's a compound sentence that needs to be broken down at 'but'

[19:02](#msg5debf73cc3d6795b9f3ecd20)"50% of the American public wants to impeach Donald Trump for blackmailing Ukraine "  
"but 47% want to give him a pass because the economy is good."

[19:05](#msg5debf8031659720ca817beb4)Every sentence is subject, predicate and object (i prefer 'value')

[19:07](#msg5debf86a32df1245cbfef987)"American People" "number that want to impeach Donald Trump for blackmailing Ukraine" "50%"

[19:08](#msg5debf8a5550662459886b1ad)"American People" "number that want to give him a pass.. " "47%"

[19:35](#msg5debfef19319bb5190f91aec)Thing is, those sentences are symbols designed to put an idea into the consciousness of humans. There could be (but will never happen) a more precise language.. a 'standard' language.. a standard set of symbols that represent subjects, predicates and values.

But if you're storing this data, the computer could care less about your language. Let's say a = American People, 1 = "number that desire to impeach Donald Trump for blackmailing Ukraine" d = 50% and ° = "number that want to give Donald Trump a pass from impeachment for blackmailing Ukraine" ╔ = "47%"

Now you can understand this;

a 1 d  
a ° ╔

[19:42](#msg5dec00ac8e906a1c8d895f25)But what about the sentence are you trying to store, and why? Do you want to be able to recall the actual sentence?

"sentence 23453" "text" "50% of American... " That would work, and you can do a find on the sentence, and return the subject "sentence 23453".. and look up other data.. like  
"sentence 23453" "creationdate" now  
"sentence 23453" "author" "Bob"

[19:45](#msg5dec01626a85195b9e167d25)But, if you start to break it down into sub, pred and val..  
"donaldtrump" "isa" "person"  
"donaldtrump" "isa" "potus"  
"donaldtrump" "chargedwithimpeachment" "true"  
"billclinton" "chargedwithimpeachment" "true"

[19:55](#msg5dec03ca26eeb8518f826668)A db is for queries, so ask yourself what you want to know, and declare those things.

GaryMiller

[21:27](#msg5dec195f1e0b827cc8bc5545)A good semantic database for representing natural language though should be capable of representing the English equivalent in a graph that can be converted back into English without losing any meaning. There are many open-source graph databases out there now but as you say many of them are missing features that ease the life of the knowledge engineer such as being able to go to a Node on a hypergraph and visually examine all the connections. This is useful for both mind mapping and knowledge entry and just navigating the hypergraph is sometimes a much easier way to get answers than writing a query.

LFReD

[22:30](#msg5dec27ec5ac7f22fb57c66f5)&gt;A good semantic database for representing natural language though should be capable of representing the English equivalent in a graph that can be converted back into English without losing any meaning.

Right, there's two ways to do that. .use human readable strings for subs pred and vals, or have a dictionary

[22:35](#msg5dec2949c3d6795b9f403976)dict: \[1 "email" 2 " is a"]  
chinesedict: \[1 "电子邮件" 2 "是一个"]

[22:36](#msg5dec29528e906a1c8d8a8423)Same.

[22:40](#msg5dec2a6ef65fec1c8ede8e47)Meaning is nothing more than symbols that you and I agree represent some 'thing' be it a noun, a verb etc.

[22:43](#msg5dec2af926eeb8518f835ec9)Imagine if there were no symbols. There would be zero way to communicate, you could be thinking "hey, let's get something to eat", but have no way of communicating it. That's one bizarre world.

[22:50](#msg5dec2cb3d64a052fb6d3ee73)I've used a number of mind maps etc, but I've found they get cumbersome pretty quickly.. Imagine the number of connections that would be pointing to Donald Trump! Queries could help filter it, and show the results. In Atomica, it would be something like `persons: vofsandp "Donald Trump" "has associate"` would return a list of subjects. From that list you could say find out which are lawyers, or over 55, or lawyers and over 55. '`foreach person persons [print sofpandv "isa" "lawyer"]`

[23:04](#msg5dec2feb8e906a1c8d8ab24d)BUT the \*\*real\** power lies with inference.  
&gt;An inference is a conclusion that you draw about something by using information that you already have about it.

[23:13](#msg5dec32238e906a1c8d8abeea)For example, Donald Trump. By simply making the declaration "Donald Trump" "isa" "potus"  
"potus" "isa" "US Citizen"  
"potus" "age" "30+"  
"potus" "hassecurity" "true"  
"potus" "gender" "male"  
etc etc etc

This could be used in a DSL. By simply stating that Donald Trump is a president of the US, we can \*infer* that he's a male, over the age of 30 etc.

You could take if way way deeper.. Make a declaration that trump is president and ask Would it be safe to rob donald trump, and have the system say 'No."

[23:16](#msg5dec32bc26eeb8518f838b7a)Where general knowledge AI has hit the wall since the 60s is the number of rules you need to make all those inferences There's literally trillions of them BUT in a DSL, they're manageable.

[23:16](#msg5dec32e0b065c6433c580901)You guys know any software out there that's good with DSL's?

[23:17](#msg5dec33081659720ca819728c)Atomica - more than the world's simplest DB.

[23:18](#msg5dec332932df1245cb00888d)(Let me know when I've sold you!)

## Sunday 8th December, 2019

GaryMiller

[03:52](#msg5dec737732df1245cb0229bb)My AI does not use a DSL but when it matches a pattern it makes the same inferences that a human would and stores the results in short term memory. Right now it does not use a long term memory other than the patterns and inference rules that are executed as a result of the patterns. It uses the Levenshtein Algorithm to pick the correct pattern so that it can handle misspellings and phrasing differences and still find the closest pattern,

[04:11](#msg5dec77f955066245988a161e)What you are demonstrating in your example is that gender can be inferred by a male first name. I'm doing that also. And that by declaring Donald Trump a POTUS that you will inherit the other attributes that POTUS class has to Donald Trump. I don't have a specific inheritance mechanism yet but patterns that have repeated sets of inferences can have functions created to reduce their repetition. I also infer He, She, They, It, Then and There variables in short term memory if a pattern is matched so later patterns matched can refer to them by their inferred values. Each pattern matched keeps inferred value in the AI's mind in an AI object and information the user give or is inferred about him in an User object.

CD: lev ShortestDist UserInput/text "Are you a citizen of the United States?"  
if CD &lt; ShortestDist [ShortestDist: CD  
either AI/BirthCountry = "the United States"  
\[AIResponse: copy "Yes, I was born in the United States."]  
\[AIResponse: rejoin \["No, I was born in " AI/BirthCountry "."]]  
AI/Memories: \[AI/There: copy "the United States"]]

LFReD

[06:35](#msg5dec999c26eeb8518f862af7)The inference I made regarding potus is There's never been a female president , they must be born in the US, you must be at least 30 years old, and presidents are provided security for life.

[06:53](#msg5dec9dff1e0b827cc8bfc742)Your method reminds me of the Cyc project https://en.wikipedia.org/wiki/Cyc

[07:31](#msg5deca6cb5ac7f22fb57fb45c)Creating an Atomica inference DB for these Red Gitter rooms is trivial. Crawl through each room, and grab each post. Run these posts through Google's Natural Language API, and add the results to the AtomicaDB as atoms

For example, take this post from Gregg;  
:point\_up: \[December 5, 2019 12:57 PM](https://gitter.im/red/chit-chat?at=5de96f40c3d6795b9f2cecad)

If you go to https://cloud.google.com/natural-language/ you can drop that post into the demo. It returns 12 entities. syntax, sentiment and categories.. for the entities..

```
insertatom "uid093" "is" "gitterpost"
insertatoms "uid093" "hasentity" "usability"
insertatoms "uid093" "hasentity" "feedback"
insertatoms "uid093" "hasentity" "bugreports"
insertatoms "uid093" "author" "Gregg"
```

and the 9 other entities, as well as whatever other metadata you want.

Boom! Done. If you want to go crazy, work with the syntax.

With that you can create a graph with 'View, tag the conversations automatically, and add inference rules like  
(pseudo) "if gitterpost hasentity "feedback" and "bugreports" send gitterpost to red/bugs (or whatever, you get the idea_

[07:48](#msg5decaae09319bb5190fd7a16)That post is about 250 characters. 4 posts that size = 1 unit or 1,000 chars. The first 20,000 posts that size are free, after that it's $1 per 4,000 posts (again, that size), all per month.

[07:57](#msg5decaced9319bb5190fd87ea)Looks like Gitter has a nice restful api https://developer.gitter.im/docs/messages-resource

dander

[08:39](#msg5decb6cc9319bb5190fdce2b)@LFReD, @rebolek has a nice wrapper around that api: https://github.com/rebolek/gritter/blob/master/gitter-api.red :smile:

Oldes

[08:43](#msg5decb79955066245988bcfb1)Is it just me who finds @LFReD 's word combining in his code posted in these chats to be very confusing? What about choosing something from this article? https://medium.com/better-programming/string-case-styles-camel-pascal-snake-and-kebab-case-981407998841

[08:56](#msg5decbacc05eec2433df525f7)And this is also highly recommended reading for someone like @LFReD http://www.rebol.com/r3/docs/concepts/scripts-style.html

LFReD

[10:01](#msg5decc9dc05eec2433df590b6)@dander Cool!

@Oldes There's a method to the madness. A value can be anything, long piece of code or string.. whatever, but subjects and predicates need to be distinctive. Red is case insensitive, but that's not the 'case' everywhere (case.. get it :), so I stick with lowercase.

A subject can also be a predicate or value: `"bob" "is a" "person"` `"person" "is a " "human"` `"is a" "is a" "predicate"` So when you see a subject as a value, how do we know it's also a subject? Even the system doesn't know unless it checks.

[10:12](#msg5deccc7355066245988c50ad)What I've done in the past is tag subjects with symbols =bob= to identify it. That tells me (and Atomica) that's a subject, and probably has more data associated with it. I'm still of two minds whether to use this still or no, so for now i combine the words to make it clearish, mostly by habit. Also by combining, I know sub and preds are always single symbol, so I don't have to think about it.

[10:15](#msg5deccd3c05eec2433df5a930)As for say, using whole words in function etc.. don't know about that. I would hate to have to type `x: value-of-subject-and-predicate "bob" "haspet"`

[10:22](#msg5deccedcf65fec1c8ee2e753)@Oldes From the article above "There is no best method of combining words. The main thing is to be consistent with the convention used, and, if you’re in a team, to come to an agreement on the convention together."

[10:25](#msg5deccf9ad75ad3721d75deb8)So many options, so few standard. It's my personal choice to use combinedwords. You say pick a convention, just not this one.

[10:27](#msg5decd00cb065c6433c5c53a8)I mean, are you seriously telling me thisIsBetter ? or thisisbetter

ne1uno

[10:35](#msg5decd203b065c6433c5c6001)this-is-arguable-objectively-better-in-spite-of-some-being-abke-to-edrd-it-nyaway

[10:42](#msg5decd38a26eeb8518f87b42b)`saveit` probably not improved much `save-it` but ask any 10 people what `vofsandp` might be vrs `v-of-s-and-p`

[10:43](#msg5decd3b8c3d6795b9f4497b1)3 months from now it just gets worse

[10:53](#msg5decd61f26eeb8518f87c460)translate to human as well as abrev . `vsp: v-of-s-and-p: :vofsandp`

GaryMiller

[12:52](#msg5decf212c3d6795b9f456bf5)My goal has been to keep everything in English with normal spacing and punctuation except the variable names that contain the English which is named descriptively in snake case. The generation of new inferences in English and output to the user can then be done in natural language with a minimum of grammatical rules applied. Collections of similar entities like MaleFirstNames are stored in Blocks so that they can easily be searched or picked by sequence as in PresidentsOfTheUnitedStates. Keeping track of context is important as well. If we are talking about a science fiction show like Star Trek. The data facts we are representing are only true in that context. Time is also an important context is we represent "Leeches are a good way of curing disease by purifying the blood." then the data has to reflect the AI/CurrentTopic: copy "medical beliefs in the 1800s" to qualify it. It is this level of representation that will prove the most challenging and what AGI refers to as the cognitive model. The underlying graph database is just the physical storage model where we need to worry about speed and scalability. The data should also be tracked as far as how it was inferred so that the data in no-monotonic. So that if we later find out that a fact was false then we should be able to reverse all inferences that were made as a result of that fact, and any inferences made from those inferred facts as well.

[12:58](#msg5decf37326eeb8518f888abf)Relational databases such as SQLite can also be used to create in-memory databases to represent the same graph data structures but lack the memory localization optimization of a true graph database. Also, a NoSQL database can be made to scale across many servers if the AGI is capturing data from 10s of thousands of web conversations at the same time.

[13:09](#msg5decf620c3d6795b9f458b02)I also don't like just tacking a number onto the end of a subject to differentiate identically spelled subjects them because it does not upon visual inspection let you know which one you are dealing with. For instance "fish (the noun)" and "fish (the verb)" in this case (the noun) and (the verb) are constraints necessary to know which subject fish we must examine. So I think that Atomica would need some type of constraint to distinguish between all the "John Smiths" in the world if the goal is to build a system robust enough to store a true world model.

GiuseppeChillemi

[15:55](#msg5ded1cd71e0b827cc8c33053)It has happened again. I am near the competition of my project and I have started restructuring the core function. It will take another week.

LFReD

[17:27](#msg5ded327a32df1245cb074599)When I threw that original Atomica gist up there, it was a quick copy and paste from an old file. I left it as it was as we need to have this very discussion before changing all the naming conventions over and over.

Whatever the function names end up being, they need to be changed for every language I developed this for, as well as those in the future. When you're working on your own code, and you're fairly certain it won't be public, then who cares? @oldes provided a code example (thanks) that used the term 'ctx'. I can only guess that meant context?

[17:43](#msg5ded3657d64a052fb6db3619)Whatever the function names end up being, they need to be changed for every language I developed this for, as well as those in the future.

There's eight main functions in Atomica that are used over and over, so you memorize them fairly quickly.

insert-atom  
insert-atoms  
single-value  
value-of-subject-and-predicate  
subject-of-predicate-and-value  
subject-of-predicate  
value-of-predicate  
delete-atom

You tell me which is the best.

An `atom` is the smallest unit of language that can be created. It's composed of a single subject, predicate and value (object)

[17:52](#msg5ded3854d75ad3721d78d84b)Found a gitter bug.. it choked on my last post, then repeated the last post with the new.

## Monday 9th December, 2019

rebolek

[08:33](#msg5dee06e39319bb5190065555)&gt; you tell me which is best

[08:34](#msg5dee070d1659720ca8266d39)There is Rebol style guide that deals exa tly with this topic

LFReD

[09:39](#msg5dee165cd64a052fb6e17b72)@rebolek Well, how would you reduce this one..

`get-all-the-values-when-you-know-the-subject-and-the-predicate`

Oldes

[09:39](#msg5dee165f1659720ca826d9f6)The style guide was already mentioned.. and nothing from above is the best. And it's not only about function names, but also your use of strings... like `"haspet"` or `"potus"`. Which may be fine for @LFReD when he writes it, but requires some mental processing from readers what it really is. And @LFReD should also know, that `"haspet"` will consume same amount of memory like human friendly `"has pet"`.

LFReD

[09:41](#msg5dee16e1d64a052fb6e17fa8)Values can be strings, subjects or predicates, but subjects and predicates \*\*must be\** unique symbols. So to help (for now) I use combined words to recognize s and p

[09:44](#msg5dee1761b065c6433c654dd5)If a Chinese person uses `是一个` as a predicate, are you going to tell them no? (That's "is a" in Chinese)

It doesn't matter.. use whatever symbols you want, that' s the whole point.. you don't need to use the subject and predicates that I use.

[09:44](#msg5dee179955066245989576e6)I can see the case when it comes to function names, and the jury is still out on that one.

[09:46](#msg5dee180e9319bb519006c502)I plan on using individual bytes for the subject and predicate and possibly values, then have a dictionary for speedy lookup.

Oldes

[09:47](#msg5dee182f05eec2433dfeb81e)@LFReD From the \[style guide](http://www.rebol.com/r3/docs/concepts/scripts-style.html)

&gt;Of course, you don't have to follow any of these suggestions. However, scripting style is more important than it first seems. It can make a big difference in the readability and reuse of scripts. Users may judge the quality of your scripts by the clarity of their style. Sloppy scripts often mean sloppy code. Experienced script writers usually find that a clean, consistent style makes their code easier to produce, maintain, and revise.

Feel free to write whatever you want, but I consider your coding style to be ugly, bad and confusing. Sorry, but that is how I feel it.

LFReD

[09:48](#msg5dee18795ac7f22fb589f3f1)Forget about naming conventions. what would be nice is having a standard set of symbols for predicates. What are the odds of teaching the world that when you see the symbol ╔ that it means email?

[09:49](#msg5dee189346397c721cb2ed2d)Excuse me, but I need to check my ╔

[09:49](#msg5dee18a2f65fec1c8eebde23)Ha. now you can't un-see it!

[09:51](#msg5dee19041e0b827cc8ca31fa)Although, yeah, my coding is what it is, and is way better than when I first started, I wasn't planning on sharing it, and the computer couldn't care less.

[09:52](#msg5dee196ac3d6795b9f4da1b3) 2 bytes can represent over 65,000 predicates.

[09:56](#msg5dee1a5af65fec1c8eebeb49)What I've done in the past is bracket subjects and predicates (a predicate is a subject as well) like =this= Then both I and the system know that's a subject. I have a JS script that can parse html looking for -=bob:fname=- and sends that to a server that replaces it with the value "Robert"

[09:57](#msg5dee1aa0b065c6433c6561e3)You can load up an entire db this way using a napkin and some OCR.

[10:13](#msg5dee1e3bf65fec1c8eec0885)@Oldes  
&gt;Feel free to write whatever you want, but I consider your coding style to be ugly, bad and confusing.

Here's my latest atomica function.. this creates an key/value block of of all predicates and values of a particular subject, and makes an object (of sorts) out of it.

```
sobject: func [s1][

	out: []
	
	foreach [s2 p1 v1] atomica [
		
		if s1 = s2 [
			
			append out reduce [to-word p1 v1] 
		] 
	]
]
```

Is there a better way to do this? I don't know.. probably, but you can't tell me it's confusing, bad and ugly.

Oldes

[10:14](#msg5dee1e939319bb519006f0b3)I can. It should be:

```
sobject: func [s1][
    out: copy []
    foreach [s2 p1 v1] atomica [
        if s1 = s2 [
            repend out [to word! p1 v1] 
        ] 
    ]
]
```

LFReD

[10:15](#msg5dee1ea926eeb8518f90072f)And to use it..

bob: sobject "bob"

```
>>bob/email
== "bob@email.com"
```

Oldes

[10:17](#msg5dee1f3bb065c6433c65821f)Never mind... this is really your thing.

LFReD

[10:17](#msg5dee1f49d75ad3721d7f3024)What the hell is repend?

Oldes

[10:18](#msg5dee1f6226eeb8518f900ed4)`? repend`

LFReD

[10:19](#msg5dee1f94550662459895b61a)So it does the same as append out reduce.. ah i see.

[10:19](#msg5dee1fcc26eeb8518f901067)By the way, I don't copy out for a reason.

Oldes

[10:19](#msg5dee1fced64a052fb6e1bfc0)But I should not, that `append out reduce` will be faster. Still, in your code you have double line breaks, which is confusing. And missing `copy`, which is a serious bug.

LFReD

[10:20](#msg5dee1fe2550662459895b790)By what, one trillionth of a second?

[10:22](#msg5dee204846397c721cb3312f)I actually added the line breaks to make it clear for you! You can see the original in the Atomica room.

[10:22](#msg5dee207d26eeb8518f901493)I don't want to copy.. Normally I'm appending to an out block using multiple functions, and finally sending it on it's way.

[10:24](#msg5dee20d146397c721cb3357d)I've built up entire web pages on the fly, then send the code 'out' via an Apache or Cheyenne 'keep-alive' tcp connection.

hiiamboris

[10:27](#msg5dee218205eec2433dfefec0)@Oldes interesting thing is, `repend` is slower than `append reduce` https://github.com/red/red/issues/3340#issuecomment-547436501

Oldes

[10:27](#msg5dee21978e906a1c8d985288)@hiiamboris  
&gt; But I should not, that append out reduce will be faster.

[10:27](#msg5dee21ac5ac7f22fb58a3497)`repend` is slower, because it is not a native, so it is not too interesting. Maybe I should just fix `note` instead of `not` in my previous message.

hiiamboris

[10:29](#msg5dee22261659720ca8272f17)Right :)

Oldes

[10:36](#msg5dee2398d75ad3721d7f5b9a)@hiiamboris what is interesting is, why `reduce/into` is so slow and why the issue is closed.

[10:40](#msg5dee24a2f65fec1c8eec3f19)Ok... I found it.. there must be: `reduce/into ['a 'b] tail b` to have it same as `repend` with good speed.

hiiamboris

[10:47](#msg5dee26301659720ca8274fa4)Yes

[11:06](#msg5dee2a9cd64a052fb6e21621)It's the same thing I'm criticizing `remove-each` for: O(n^2) asymptotic complexity.

LFReD

[11:31](#msg5dee30af8e906a1c8d98c41d)

Or why using `find/skip` on a large hashed block is 10,000 times slower than Rebol 2.&gt;

hiiamboris

[11:49](#msg5dee34c01e0b827cc8cb01c9)Yes. I filed the ticket for you about that.

LFReD

[18:57](#msg5dee992b8e906a1c8d9c1d81)Alright, so using inference, I've determined that the new product that Gregg needs beta testers for is Red/pro. Of course, inference is never 1.0, but .87 is a pretty good guess :)

[19:05](#msg5dee9af48e906a1c8d9c2a0e)I suspect most people here know that already!

[19:14](#msg5dee9d0a9319bb51900a47ab)Personally, I've been waiting rather patiently for ports in Red (0.7.0 milestone), which were supposed to be out this year.

"With the integration of async I/O and ports, we will be able to complete the wrapping of the Android API using decent human-friendly abstractions. We need to advance Android support to at least beta level by the end of this year." - Jan 6, 2019

[19:23](#msg5dee9f1b26eeb8518f934bda)Hopefully I'm wrong, and the ports/android support is the project in question.

Senenmut

[19:35](#msg5deea210d64a052fb6e5f300)red is cloning the whole android system and running it on it's own in another OS environment as " bendroid" "hello ben"

[19:36](#msg5deea24032df1245cb11ee92)"Hello World" "Hello Bendroid"

GaryMiller

[20:48](#msg5deeb3079319bb51900ae8b8)If the beta test is for the new Fast Lex branch then I'm in! I'd get like 30 minutes a day back just wait just waiting for loads to finish!

LFReD

[21:21](#msg5deebac25ac7f22fb58f2fdd)Going back to the symbols for Atomica, 3 bits can hold 8 'symbols', but only 1 at a time. I'm looking forward to quantum computing becoming mainstream, then 3 qubits can hold 8 'symbols' at the same time! "Where we're going, we don't need words!"

dander

[21:25](#msg5deebbad6a85195b9e2a53bb)@GaryMiller the \[fast-lexer branch is public](https://github.com/red/red/tree/fast-lexer), so you can test it if you build it yourself. If you haven't done that before, it's not too hard. I don't know how stable it is, but doesn't hurt to try. I'm sure they wouldn't mind any feedback about it :smile:

LFReD

[21:45](#msg5deec06e1e0b827cc8cf91da)"If you add more bits to a regular computer, it can still only deal with one state at a time. But as you add qubits, the power of your quantum computer grows exponentially. For the mathematically inclined, we can say that if you have “n” qubits, you can simultaneously represent 2n states.)" correction, 3 qbits = 16 symbols.

8 qbits (a qbyte?) can store 3.4 0e + 38 symbols.

[21:57](#msg5deec34af65fec1c8ef14026)Google's quantum computer is currently 1.5 \*trillion* times faster than the most powerful supercomputer in the world.

But hey, keeping working on those lexer optimizations.

ne1uno

[22:05](#msg5deec541b065c6433c6ac102)RSN

LFReD

[22:06](#msg5deec55bf65fec1c8ef15429)Which brings me to another question. Back when Rebol came out, the average computer had 32 - 64 mb of ram, and a high end hd was what, 300mb? So boasting that Rebol &lt; 1mb was a thing.

23 years later, Is it still relevant that Red is 1.2mb? I mean, why not let your hair down a bit, and add those features to the main language rather than insist on mezz?

ne1uno

[22:06](#msg5deec5705ac7f22fb58f88ec)google has lotts of things most of us never will

LFReD

[22:09](#msg5deec6156a85195b9e2aa0a1)@ne1uno Moore's law, baby!

[22:10](#msg5deec64d32df1245cb1312fd)Imagine shared hosting on a Quantum computer!

ne1uno

[22:11](#msg5deec67b26eeb8518f9454f9)it's not absolute. 2 becomes 4 years 4 becomes 8. still pie in the sky in our lifetime

LFReD

[22:14](#msg5deec7638e906a1c8d9d9194)Not in qubit land, 2 becomes 4, 4 becomes 16 and 16 becomes 256 ;)

ne1uno

[22:20](#msg5deec8a846397c721cb88cf9)less code, less places for bugs to hide.

LFReD

[22:22](#msg5deec91d1e0b827cc8cfe02a)A 5 qubit quantum computer could run a foreach type of process on a block with 4,294,967,296 strings simultaneously. And trillions of times faster than a modern computer could run foreach on a block with a single entity.

[22:23](#msg5deec94ab065c6433c6ae29e)Big O notation needs to up its game :)

hiiamboris

[22:28](#msg5deeca948e906a1c8d9daa2b)Don't tell us that you're buying all this quantum hoax :)

GaryMiller

[22:30](#msg5deecb0a1659720ca82c82c0)Quantum algorithms are the only types of algorithms that Quantum computers can run quickly. They are not the type of processing that is normally run on regular computers by regular users. Here is the definitive list of known quantum algorithms. https://quantumalgorithmzoo.org/

[22:32](#msg5deecb878e906a1c8d9db005)https://www.quantamagazine.org/quantum-computers-struggle-against-classical-algorithms-20180201/

LFReD

[22:53](#msg5deed05446397c721cb8ca80)@Oldes  
"Don't Learn to Code, Learn to Automate"  
https://daedtech.com/dont-learn-to-code-learn-to-automate/

"Coders like to code, but writing code ought not to be a first class goal when there are problems to be solved."

[22:58](#msg5deed1a432df1245cb1361f9)@hiiamboris Point is, it's one thing trying to create an in-memory db when you have a total of 32mb of ram to run everything, but that changes when 16gb of blazing ram (compared to 1997) costs $80. Same with 7200rpm drives vs SSD. It was dropping Atomica into MySQL on an SSD when things went from 'inefficient' to 'preferred'.

No doubt there's a relentless path of performance between here and quantum hard drives.

[23:08](#msg5deed3e0c3d6795b9f537f8c)@Oldes I don't want to spend how ever long it's going to take to become a Rebol guru like everyone else here (I recognize your names from two decades ago!). I want to create a bot that does the coding for me.

[23:16](#msg5deed5d532df1245cb138230)@GaryMiller I'll have one of these please "Algorithm: Graph Collision" (from the article)

## Tuesday 10th December, 2019

pekr

[06:33](#msg5def3c2b05eec2433d074b3d)@LFReD nice quantum ideas, but I suggest keeping our legs on the ground. Of course, if we find some area, where Red is something like 10K times slower than Rebol (which is interpreted + native), it is surely worrying and should be addressed. I see no reason, why some stuff could not become native over time. What I would prefer even more, was e.g. native (first class) arrays support, so that we can get R/S down to less powerfull hw. I like R/S :-)

GiuseppeChillemi

[08:45](#msg5def5b20d64a052fb6eb4c7a)When I sit in front of my code I usually realize after some time that I have done everything else but working on my To Be Done list.

[08:45](#msg5def5b2dc3d6795b9f57082e)I don't know if this happens to you too.

LFReD

[08:54](#msg5def5d3705eec2433d082737)"Now, a challenge! In the coming new year we'll be needing beta testers willing to lend their expertise in refining a new product built with Red. " - Gregg

My question is, what product can be in beta if it's a 'new product built with Red' given Red's current alpha state?

GiuseppeChillemi

[08:57](#msg5def5de026eeb8518f982898)Red will be in beta, so beta with beta elides and we will have a release !

greggirwin

[09:00](#msg5def5eb51e0b827cc8d3d8ea)@LFReD, the state of your factory does not define the state of the things it produces.

LFReD

[09:01](#msg5def5ee105eec2433d0836be)That's just it. I have no idea of the state of the factory, just what it produces. This is a nine year old project.

greggirwin

[09:02](#msg5def5f3146397c721cbccfed)Red is the factory. Open to the public.

LFReD

[09:04](#msg5def5fa71659720ca8307f90)Red, as described in the blog, will become the 'community' version of the factory.

[09:06](#msg5def5ffcd75ad3721d889186)Correct me if I'm wrong, but it sounds like /pro is a fork of Red.

[09:07](#msg5def60568e906a1c8da19343)You can do whatever, no one has the right to even suggest otherwise, but whatever you do has an effect on the 'community'.

[09:07](#msg5def6064f65fec1c8ef57018)This is where Rebol jumped the shark.

[09:10](#msg5def610005eec2433d0846ab)Carl ran out of cash, and had to get a real job. Been there more than once. And here we are, 9 or whatever years later, still picking up where he left off.

[09:12](#msg5def616a8e906a1c8da19e8c)In short, if I had to pay developers to develop, would I put my resources towards a viable product, or a free, as in beer, community product?

pekr

[09:16](#msg5def62675ac7f22fb593aba8)@LFReD we don't know, what is Red/Pro supposed to be. Maybe it is about new compile targets, so that I will be able to use it on some 32 bit arduiono? I would not speculate nor I suggest to compare it to Rebol/Pro.

LFReD

[09:18](#msg5def62d326eeb8518f984741)Maybe it's 64-bit version, if you have the $$$.

[09:18](#msg5def62eb46397c721cbce882)I purchased the Rebol/SDK and command. What a mistake that was.

[09:22](#msg5def63ec32df1245cb176dfa)@pekr going back to that debate earlier on the client/server vs app model, it's a no brainer. 5G is going to be ubiquitous. Global coverage by Musk's satellites, quantum computing is never going to make it onto an app. Well, maybe in 50 years.

[09:23](#msg5def642fb065c6433c6f3dfc)The toolchains for mobile are everywhere.

pekr

[09:24](#msg5def64441e0b827cc8d4002a)Rebol Technologies strategy was a mistake. Trying to capitalise on something like a shell access and loading libraries, was a fatal mistake for the language claiming being an universal glue ....

[09:25](#msg5def648f6a85195b9e2ee2ad)You can say about most of the areas, that those are already crowded with available solutions. I am looking into IoT, robotics, etc., Python everywhere. Even MS is adding Python to the PowerBI reporting apart to R statistical language ....

[09:26](#msg5def64d532df1245cb177674)But - I still believe in what Reichart and other said - Redbol as a secret weapon. It just needs to deliver its infrastructure. Hence ports, protocols, databases, widgets. Some of that might be a community work. I can imagine our company "sponsoring" some effort, as I plan to use Red for some thing in an IoT area ...

LFReD

[09:33](#msg5def6663f65fec1c8ef5993a)But what 'secret weapon'? I can't even imagine.

[09:34](#msg5def66a98e906a1c8da1c261)If there was/is a secret weapon with Rebol and Red, it would be one word. Abstraction.

[09:35](#msg5def66f426eeb8518f985fe7)"As you can see, with Rebol, coding barriers are lowered to a \*critically low* point of simplicity. That critically low point of simplicity is far below any other software development tool, and is in fact easy enough for anyone willing to learn. " - Carl

[09:36](#msg5def671c05eec2433d087659)That was the case 20 years ago. Since then the whole world has jumped on the abstraction wagon. Adobe PhoneGap, and a bajillion others.

[10:02](#msg5def6d4426eeb8518f9887e3)@pekr  
&gt;Rebol Technologies strategy was a mistake.

The biggest issue with Rebol, and I remember discussing this with you way way back, was community size.

Check out the size of this audience.  
https://youtu.be/Vhh\_GeBPOhs

pekr

[10:06](#msg5def6e111659720ca830eccb)What was your name/nick on AltME? :-)

LFReD

[10:06](#msg5def6e349319bb51900f9fbc)Terry (just don't tell @Gregg I'm here :)

pekr

[10:07](#msg5def6e7f1e0b827cc8d44977)Ah, Terry, who was doing some mysterious super search engine and later on was banned for dragging in some religion stuff? :-) Not laughing, just smiling :-)

[10:08](#msg5def6eab5ac7f22fb593fc9d)Strange thing, that after those cca 20 years, even if (as you say) bajilliion of other solutions exist, we still try to use Redbol .... Why then? :-)

[10:09](#msg5def6eef05eec2433d08b000)btw - some cca year ago Bo told us on altme, that Carl was working on Rebol 4, but nothing concrete. Of course, as we were used with Carl, he vanished once again :-)

LFReD

[10:10](#msg5def6efb8e906a1c8da1fc6c)Yep.

[10:10](#msg5def6f17f65fec1c8ef5d74a)And Red said in January 'ports coming this year'

pekr

[10:11](#msg5def6f5dd75ad3721d88fa64)So, from all the Rebol continuation / fork projects, Red, even if moving forward slowly (publicly) is imo still the project to follow. Ren-C tries to solve some language design stuff on the low level, so it gets traction of few ppl too, but for me Red still has the potential .... we just wan those pesky ports to arrive in the mainline, don't we? :-)

LFReD

[10:12](#msg5def6f7146397c721cbd4cc9)Yep

[10:12](#msg5def6f855ac7f22fb5940191)I check in every couple of years waiting for it.

pekr

[10:12](#msg5def6f9bf65fec1c8ef5db48)Should we send a terminator back the pipe? :-)

LFReD

[10:12](#msg5def6fa5c3d6795b9f57976a):)

[10:14](#msg5def700bf65fec1c8ef5dced)I've basically retired, and going back to some projects that I had to shelve for one reason or another (like having to feed a young family)

[10:16](#msg5def706bd75ad3721d890188)So I need an engine. Something that handles language well, can parse easily. Fast, like really fast that can crawl large datasets of strings.

ne1uno

[10:18](#msg5def70e2c3d6795b9f579e07)`get open`

LFReD

[10:19](#msg5def711a46397c721cbd57ed)Well, ports and protocols ;)

ne1uno

[10:20](#msg5def71516a85195b9e2f47b2)some `port!` is in nightly but no info on how to use them?

LFReD

[10:20](#msg5def71611659720ca8310400)Well they have the eth:// port thang.

[10:23](#msg5def7217f65fec1c8ef5ef62)@pekr As I said earlier, the failure of Rebol was lack of community. Like you said "Python everywhere.." They have an estimated 4.3 million users.

[10:31](#msg5def741b55066245989fb0a5)@pekr  
&gt;we just wan those pesky ports to arrive in the mainline, don't we?

That my concern now, if Red/pro gets all the attention, then the community is too small to take up the slack in the 'community' version of Red.. not just ports, but anything else.

[10:32](#msg5def74418e906a1c8da22a3c)I personally can't help at all.

[10:33](#msg5def74891659720ca8311c14)Of course, this is just speculation, but we have nothing else to go on other than a few blog posts and some hints.

[10:35](#msg5def74de9319bb51900fd2d4)As you said, with Rebol, we had \*no idea where he was at.* He would pop his head up every month or so, then every two months.. then three..."

[10:35](#msg5def74fb05eec2433d08e37c)That's no way to run a community.

pekr

[10:35](#msg5def750e1659720ca8311eec)We really don't know what the Red/Pro is going to be about. We are just spoiled by the idea of Rebol/Pro, which prohibited certain language capabilities like shell, library, sound, db from free usage. That is not going to happen imo again. I can't imagine Red/Pro having ports, protocols, whereas free version being without them ....

[10:36](#msg5def7538d75ad3721d892481)I would suggest to wait and stop our speculation. We should think positively :-)

[10:37](#msg5def75531e0b827cc8d47d2c)I am e.g. eager to see, what the Direct2D linked Draw backend allow :-)

LFReD

[10:37](#msg5def75559319bb51900fd43d)That's what everyone said about Rebol when I argued these points.

pekr

[10:37](#msg5def758655066245989fba8c)Remember that Doc delivered MySQL and Postgress protocols via Softinnov, so he is hardly going to hurt Red that way ;-)

[10:39](#msg5def75cd46397c721cbd871d)But maybe you should register for Red/Pro beta, maybe you will get preliminary info/access, so that you can have calm Christmas :-)

loziniak

[10:39](#msg5def75fe55066245989fbcb7)Or Easter ;-)

LFReD

[10:40](#msg5def7627c3d6795b9f57cded):point\_up: \[December 10, 2019 2:39 AM](https://gitter.im/red/chit-chat?at=5def75fe55066245989fbcb7) +1

loziniak

[10:42](#msg5def7679b065c6433c6fc4fb)Best way to stop people speculating is giving them information.

pekr

[10:44](#msg5def772326eeb8518f98d247)Maybe it is a very secret. World is not ready yet to realise, both Google and Apple are going to switch to Red :-p

LFReD

[10:51](#msg5def78a79319bb51900fed24)Where can I buy some shares of Red in that case!

[10:53](#msg5def792d46397c721cbda303)Look, it doesn't matter. I've got a few things on the go as well that I may port to Red one day, but then again we'll have to see. So no point in going too deep.

[10:56](#msg5def79faf65fec1c8ef62e1c)eg: I have a killer product identification and scanning system that uses Atomica built for equipment rental companies as part of an ERP (built on Atomica as well) just sitting there.

[11:03](#msg5def7b74b065c6433c6fe911)This particular company rented heavy electrical cables and other equipment to the movie production industry here in Vancouver. These cables would be dragged through ice and snow, blackberries and wire fences, driven over.. you name. I used bar codes, where each code was a unique subject in Atomica and the tags were virtually indestructible. 1000s of them, and not one ever failed.

loziniak

[11:06](#msg5def7c4e46397c721cbdb8f3)You mean indestructible physically, or in software (erased from database or corrupted)?

LFReD

[11:07](#msg5def7c6c1e0b827cc8d4b62a)physically, but never had a problem with software either.

[11:08](#msg5def7cc51659720ca83156ca)In that particular case, I used a single table in MySQL with three columns, can you guess the names of the columns? :)

loziniak

[11:09](#msg5def7cdff65fec1c8ef643dc)x, y, z?

[11:09](#msg5def7ce46a85195b9e2f9c5f);-)

LFReD

[11:10](#msg5def7d13b065c6433c6ff5d5)well that would work too

[11:10](#msg5def7d33f65fec1c8ef646f0)as well as ╩, ═, Ð

[11:15](#msg5def7e37f65fec1c8ef64de1)I guess I should have said "the names of the columns that English speaking people could understand"

[11:16](#msg5def7e8af65fec1c8ef65236)@loziniak for you...

temat, orzeczenie i wartość

loziniak

[11:16](#msg5def7ea1b065c6433c700192):-) thanks!

LFReD

[11:17](#msg5def7ebe46397c721cbdcbb2)Don't thank me, thank symbols and meanings!

loziniak

[11:17](#msg5def7ec71e0b827cc8d4c61f)Semantic web and RDF is on my list of things to dig into.

LFReD

[11:18](#msg5def7ee96a85195b9e2faa4f)Semantic web is interesting stuff, but pretty much an abandoned project. Tim Berners-Lee was way ahead of the rest of us.

loziniak

[11:21](#msg5def7faed64a052fb6ec57ec)There's a project I follow, \[SAFE Network](https://safenetwork.tech/), which in turn have plans of structuring data similarly to Tim Berners-Lee's \[Solid](https://solid.inrupt.com/) project, using RDF, ontologies and all this stuff.

[11:22](#msg5def7ffa1e0b827cc8d4d044)https://safenetwork.tech/roadmap/#rdf-support

hiiamboris

[18:53](#msg5defe9ac5506624598a33c10)So, gitter is done for, or is it just me?

LFReD

[20:19](#msg5deffdeff65fec1c8efa30b3)@loziniak That's an interesting project! I was considering how it may be prudent to use the blockchain for something like that. Encrypt the data and provide trusted sources access. using it as a sort of 'checksum' for the integrity of the declaration.

[20:35](#msg5df001779319bb519013986b)But, judging by @hiiamboris comment, even chit-chat isn't the place to discuss possible uses of Red. Nope, it's all about the syntax.

Don't worry, @hiiamboris , I'm heading out soon.

hiiamboris

[20:41](#msg5df003018e906a1c8da65ef1)☻ Don't worry good old @LFReD , my comment was about gitter not switching rooms (seems to have been fixed 2hours ago), not showing activity tab (fixed an hour ago), and not searching anything or indicating new messages in rooms

LFReD

[21:56](#msg5df0147105eec2433d0da8d6)Never-the-less.

## Wednesday 11st December, 2019

loziniak

[11:54](#msg5df0d8fdac14cc652c651752)Never! :-)

GiuseppeChillemi

[18:16](#msg5df13271e7265623012863df)The Less!

LFReD

[18:30](#msg5df135e042784416abcd7001)Problem is, Red's still alpha, and there's little I can do to push that forward.

GiuseppeChillemi

[18:34](#msg5df1369be47fb31eb7957b46)LFRed, there are 3 kinds of alpha: alpha which could be called "draft", alpha which is really alpha, and alpha that could be called "beta". I think we are in the last scenario.

LFReD

[18:37](#msg5df137630995661eb8caeabe)I wouldn't call it beta, not when it's 4x slower than Rebol2 in a number of areas (mainly dealing with large blocks, the lexer issue etc, no ports/protocols)

[18:57](#msg5df13c2bac14cc652c67d54a)I've spent some time trying to determine if there's a way to quickly CRUD triples without using indexes, as well as skipping the slow foreach type crawls. What would be great is using paths or pick which is 100,000x faster. My gut feeling is it's there somehow?

[18:59](#msg5df13c8d2cc1b31e34003bf9)Maybe there's some b-tree method? My conclusion is, as memory and processing power increases, it will be a moot point to use foreach type algos.

Just not with Red, at least not today :)

GiuseppeChillemi

[18:59](#msg5df13cadce2b2e652bbb61be)We have 95% of datatypes implemented, new datatypes, a better parse, a modern GUI, a DIAGRAM engine, new instructions, full support from the authors.

[19:00](#msg5df13cd155d9392300f34df4)The time is now.

LFReD

[19:12](#msg5df13f9b2bca3016aa6224f3)There's more to a language than the engineering. I thought, DIAGRAM engine, for Red? What's that.

[19:12](#msg5df13fa0ac14cc652c67ef05)Try to find the answer.

[19:17](#msg5df140b57ce7ea1e35688e2f)Just randomly, I thought I would try to find a tut on say Red and `map!` on Youtube "Red-lang map" compare that with "python map".

[19:25](#msg5df142aa072446515d8c9953)Correct me if I'm wrong, but there must be millions of $ invested into Red in one way or another. Someone with the skillset of Nenad should be making $100/hour USD min! Take every hour he's put into it, and multiply by $100. (Carl realized this.)

Same for everyone else. Then there's developer costs, conference costs, travel, blah blah blah...

[19:27](#msg5df1431755d9392300f37ae9)As I said before, if the goal is to build 'the greatest programming language on earth' then you're right on track!

[19:28](#msg5df14376ce2b2e652bbb962f)However, if the goal is to build a large community of Red developers, you tell me how you think you're doing.

[19:33](#msg5df144970dc628523e1b7344)Look, I love Rebol/Red. You would think that Red code http://rosettacode.org/wiki/2048#Red compared with all the other languages would make developers sit up a bit.

[20:43](#msg5df155042cc1b31e3400e898)You guys are smart, you know all this. I was watching the 2018 red devcon, and it's the first thing mentioned! I don't think you need to hire a graphics designer next, it should be a marketer.

GiuseppeChillemi

[21:41](#msg5df16285f1cc6c27ea322245)@LFReD we all need to be together, helping each other. This is the real strength of a small community and that aptitute can make the difference. Nenad and the other developers live for their passion and dreams other than money. So, even if he could gain 100usd/h I am sure he will prefer 10 usd and follow other values. So it's up to us to keep our spirit high and and support those people and their whole project, becouse it will be the house where we will spend the following years. This can be done with simple things.

[21:49](#msg5df164722bca3016aa632635)Personally I have chosen mine: I will prepare some products for prime time when the Android version will be complete and give the community the opportunity to sell them. Also I will try to write documentation in a way people will be able to reach the "there is no spoon state" to avoid them leaving us; I will develop some dynamic coding techniques and share them with the community; money permitting, I will fund some projects and help newcomers in my spare time.

[21:53](#msg5df1654a072446515d8da4b3)Have seen your code, you are more experienced than me. If you stay here I am sure you can make great things and be a valuable member of our community. But it is up to you to take this road, I can't convince you. I can just share to you my way of being helpful, grateful and contribute.

hiiamboris

[21:57](#msg5df16648c6ce6027eba503f2)@loziniak is it possible to farm on safe network already?

GiuseppeChillemi

[22:07](#msg5df1689be47fb31eb796e452)@LFReD \[Diagram Dialect](https://github.com/toomasv/diagram).

[22:09](#msg5df1692fc6ce6027eba51cb9)It's from @toomasv . Another crazy and generous man like many other developers in this community. I asked if it would be possible to build diagram with Red and he came out after few weeks with a full diagram engine !

LFReD

[23:10](#msg5df177492bca3016aa63acd6)@GiuseppeChillemi Sounds fantastic! What is it? Where is it? How does this solve my problem? Where's the docs?

What other secrets about Red am I missing?

I heard there's this thing called Red/System??

[23:11](#msg5df1778f0616d6515e2239f7)(PS - Don't answer those questions here, I found toomas's repo. Answer them in a wiki or something)

## Thursday 12nd December, 2019

LFReD

[00:46](#msg5df18dd72cc1b31e340276d7)@pekr  
&gt;Ah, Terry, who was doing some mysterious super search engine...

I was building this: https://cloud.google.com/natural-language/  
but ran out of $$

[00:52](#msg5df18f3d42784416abcff271)You can see some early experiments using it with this Rebol project: https://github.com/LFReD/Rebol-Q

[01:08](#msg5df192f62cc1b31e34029a21)There's an NLP dialect in there for drawing svg (2001) "Draw a 2 inch by 3 inch blue rounded rectangle with a drop shadow and write "Hey there"

[01:18](#msg5df195570995661eb8cd850e)@pekr Here's a sample bit of user code `Q [H "cat" H "possess" H "number"][O "I know, and they use every one."]`

The H function means "if you hear" And "cat" "possess" "number" are the entities that would be returned by Google NLP (check out the demo in that link above). In short, if you find anything like "cat", "kitten", "feline" AND "has" "possesses" "owns" etc AND "number" "1" "one" then it triggers the O (output)

[01:20](#msg5df195d52bca3016aa6475f8)Now, I would use Atomica and add "feline" "isa" "cat", "Whiskers" "isa" "cat", "own" "isa" "possesses" "has" "isa" "possesses" etc.

[01:21](#msg5df196090995661eb8cd8d6d)Like I said, still works.. download and have a play. (Windows)

[01:22](#msg5df19642ac14cc652c6a49ec)If you have any questions.. https://gitter.im/AtomicaDB/community

[01:23](#msg5df196870616d6515e23054c)Try typing "cats have 9 lives" into the input box

loziniak

[12:09](#msg5df22de0e47fb31eb79c200a)@hiiamboris currently not. It's like Red's Android "we're almost there!" :-)

hiiamboris

[12:47](#msg5df236d8c6ce6027ebaab6c8)(:

Respectech

[23:28](#msg5df2cd1142784416abd8cc1a)I've been thinking about a Red framework that would allow apps to update on-the-fly and easily work in a multi-processing environment (clusters, etc.). Does anyone have any ideas on something like this already?

[23:29](#msg5df2cd62c6ce6027ebaee2ce)When I say on-the-fly, I mean that the app would not have to restart when updated. A thought that popped into my head was that if there was an extremely minimal "launcher" for the app, then all the functions could be updated and referenced by that launcher without having to reload the launcher.

[23:30](#msg5df2cd8bf1cc6c27ea3c2832)The only time the app would have to reload would be if the launcher itself needed to be updated. So keeping the launcher as minimal as possible could reduce required updates to being extremely infrequent.

[23:35](#msg5df2cea60616d6515e2b82b1)The multi-processing part could be added to this concept after the launcher framework was hashed out.

greggirwin

[23:48](#msg5df2d1cc55d9392300fe726a)There is nothing like that...yet. There is a model for this, but if there is any state involved in an element that updates, that has to be addressed. It's hard to design for, as a general solution, because the rules themselves are soft and system specific. Yes, you want to roll out silent bug fixes, but what about UI changes? If the system is modular to facilitate this, inconsistencies or conflicts can creep in easily.

Imagine an empty framework. A Red browser if you will. The bookmark manager is a module. A hot-key changes in an update, which now conflicts with another hot-key in the system. You make a (known) breaking change to its API, and all the plugins that use it stop working. It's a systemic design issue.

That said, you can go a long way if you're doing it just for yourself, and we can do experiments easily. Since we can `load` and `do` code, updating those externally is easy as well.

Invariably, when I have built systems for clients, there is a Control Center that launches other things, so they can all be separate apps, thus not requiring full system updates.

[23:49](#msg5df2d223ce2b2e652bc6d236)Even for something as simple as https://github.com/greggirwin/7guis/tree/master/Red I added a launcher.

## Friday 13th December, 2019

dander

[00:10](#msg5df2d6da2bca3016aa6d3fe0)I've been imagining an editor inside your application that can inspect and change its state, but also synchronizes changes back to source code, so you could build your application while running it. It seems like smalltalk is something like that, but I haven't explored it that much, and I don't know how it manages your sources (or if it does). Because of intermittent breakages, it would be necessary to be able to roll forward and back changes, and sometimes restart altogether, but hopefully in a way where you pick of where you left off. I have found find myself putting in a gui field that just lets me do whatever is typed there for debugging purposes

[00:16](#msg5df2d8692bca3016aa6d4c60)I updated my \[gist for searching patterns in Red sources](https://gist.github.com/dander/47d10aa43d04bfcd27080ba6f3cf04ba) with a bunch of improvements. Mainly it doesn't have any hard-coded paths/values anymore, so it can be run without any edits, and I turned the search into a function that displays better status and added a couple examples

greggirwin

[00:30](#msg5df2dbb455d9392300feb197):+1:

The idea of a system image has been around as long as Rebol I think. Maarten Koopmans and I talked about is long ago. Basically, if you can snapshot the state of the system, you should be able to serialize it, send it somewhere and make it a call with continuation. The live coding part is also not difficult at the simplest level. One trick, of course, is that things like GUI editors generate very different VID code than a human would. But that's something than can be an option. That is, you have simple constraints in place that generate idiomatic VID, but also the option to turn them off and drag-drop how you want, generating `at` code instead.

[00:32](#msg5df2dc07e47fb31eb7a1097a)For in-house R2 tools and apps, I quite often had a `halt` option, which is crude, but being able to drop into a console, with the current state in tact, could be very handy.

LFReD

[00:41](#msg5df2de550dc628523e26c40d)@greggirwin Updated this Wikipedia as well https://en.wikipedia.org/wiki/Comparison\_of\_programming\_languages\_(syntax)

There's some bits missing, if you could answer them, I'll edit the page.

[00:57](#msg5df2e1e6578ecf4b1f933e9b):point\_up: \[December 12, 2019 4:16 PM](https://gitter.im/red/chit-chat?at=5df2d8692bca3016aa6d4c60)

Is there a single list for Red projects like this?

dander

[01:07](#msg5df2e44042784416abd95a3f)@LFReD there are a lot of things to follow from here: https://github.com/red/red/wiki/Examples

Respectech

[01:37](#msg5df2eb550dc628523e2714dc)@dander @greggirwin Thanks for the feedback. There are so many ideas that can be pursued using Red that aren't natural to us old-school programmers limited by old-school programming tools and applications developed by others.

[01:38](#msg5df2eb83e47fb31eb7a16af6)I think something like a live update system, portability, and live code editing could be a killer feature, at least for my purposes. Which means it probably would be for others as well.

GiuseppeChillemi

[10:22](#msg5df366640995661eb8da513f)Are they talking of the same argument ? Do other languages have contexts ?

[10:23](#msg5df366ad7d382b523f6cfbe8)\[!\[image.png](https://files.gitter.im/red/chit-chat/jCgf/thumb/image.png)](https://files.gitter.im/red/chit-chat/jCgf/image.png)

rebolek

[13:53](#msg5df397ca55d939230003d207)Meaning of word \*\*context\** depends on its \*context* :smirk:

pekr

[13:54](#msg5df39815578ecf4b1f9843de):-)

GiuseppeChillemi

[13:58](#msg5df398fc2cc1b31e3410ac22)@rebolek  
&gt; Meaning of word \*\*context\** depends on its \*context* :smirk:

I which context should I consider your answer ?

pekr

[14:04](#msg5df39a7b0995661eb8dbbed1)Just bind it to the context of your will :-)

rebolek

[14:10](#msg5df39bee42784416abde4b09):smile:

GiuseppeChillemi

[14:14](#msg5df39cd60616d6515e311120)

```
bind 'reply system/replies/chit-chat
```

greggirwin

[17:03](#msg5df3c44a7d382b523f6fab4d):point\_up: \[December 13, 2019 3:22 AM](https://gitter.im/red/chit-chat?at=5df366640995661eb8da513f) @GiuseppeChillemi so. It just means they use concrete examples, rather than abstract bits of code. That's my take from reading the synopsis.

GiuseppeChillemi

[17:21](#msg5df3c8b3ac14cc652c79c5ae)@greggirwin "RED in Context" would have a multitude of meanings!

GaryMiller

[17:40](#msg5df3ccf6e7265623013ad083)@GiuseppeChillemi I looked inside the book Python Programming in Context on Amazon and it seems like just a another beginner Python book with nothing really tieing the subtitle Programming in Context to the content. In my experience Context is called scope in other programming languages but is more limited and can be defined as something that has a specific meaning in a portion of the program but not in other portions. When two variables or functions are defined with the same same name they must exist in different scopes or one scope must take precedence over the other. So that when you reference the variable or function you get the correct one value for that scope. Functions can also be distinguished by their parameters so some languages allow overloading the same function name with different parameters and can figure out at compile time or runtime (polymorphism) which variation of the function to use. Namespaces are another way in other languages of specifying scope. so if you import a new package into a separate namespace and its authors used some of the same variable names ans yours you won't get errors. Red is more flexible though because you can define and redefine the syntax of the language also so context becomes more powerful and dangerous should you decide to do that because internal Red code may be depending on the standard syntax and redefining a word in that syntax could introduce errors.

GiuseppeChillemi

[20:09](#msg5df3eff2578ecf4b1f9abc37)Thanks.

## Sunday 15th December, 2019

TheHowdy\_gitlab

[09:16](#msg5df5f9d4578ecf4b1fa84100)@GaryMiller One of my favourite goodies to show other people is doing `true: false` or `false: true`. One crashes, the other works fine and... Does some fun stuff.

GiuseppeChillemi

[13:11](#msg5df631022cc1b31e3421db55)@TheHowdy\_gitlab Bad Boy!!!

TheHowdy\_gitlab

[21:40](#msg5df6a847e7265623014e01f6)Hehehe

```
>> false: true
...
>> 1 = 2 = false
== false
```

## Saturday 21st December, 2019

dander

[07:28](#msg5dfdc9b1d2dadb389352c22a)I've been listening to this podcast for a while now, and I think this has been my favorite, or at least most interesting episode to me, and there are a lot of great episodes https://changelog.com/podcast/353  
A lot of discussion about business models with open source

greggirwin

[20:20](#msg5dfe7e96d2dadb3893576f08)I've read a few of the transcripts. Very good indeed.

[20:20](#msg5dfe7ea73e3f133894d52593)Thanks for the link.

GiuseppeChillemi

[20:21](#msg5dfe7ed9090f1379682bc773)@lucindamichele we are waiting for a Christmas message form Red Foundation ! Please, don't forget our gift !

GaryMiller

[23:28](#msg5dfeaa9dcf771f77080abe0e)We appreciate all your hard work guys! Thanks so much for creating something unique and making your vision come true! Merry Christmas and Happy New Year!

greggirwin

[23:30](#msg5dfeaafac0c8ef301bf10392)Thanks @GaryMiller. :^)

GiuseppeChillemi

[23:31](#msg5dfeab36b1701e50ca64b2f3)I don't appreciate their work, I love it!

greggirwin

[23:31](#msg5dfeab47e0131f50c9842c8e)Thanks to you too @GiuseppeChillemi.

GiuseppeChillemi

[23:44](#msg5dfeae5cc0c8ef301bf11ad1)@greggirwin We are on Christmas but it seems the Thanksgiving day! 😊

## Saturday 28th December, 2019

GiuseppeChillemi

[18:24](#msg5e079dd60fd3413f4c6c5c7b)I have a confession to make.
