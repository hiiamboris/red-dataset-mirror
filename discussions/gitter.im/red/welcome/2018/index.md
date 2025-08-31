# Archived messages from: [gitter.im/red/red/welcome](/gitter.im/red/red/welcome/) from year: 2018

## Monday 1st January, 2018

BeardPower

[00:02](#msg5a497aacba39a53f1ac0be9e)@greggirwin Yeah, people always want to go the path of least resistance. Learning new things? Wut? 😲 I never heard of REBOL before, but if I did, I would have been using it, that's for sure. I need high performance code, so REBOL was out of the question, but now Red is here and I don't want to use any of the bloated stuff. I though Haxe and Nim is great, but nothing comes close to the (upcoming) features of Red

[00:03](#msg5a497adbedd2230811fa815c)Happy New Year, everyone!

[00:04](#msg5a497b01b48e8c356686fc2d)🍾

gour

[07:39](#msg5a49e5c084fb74b9402463ae)@9214 If I do that (iow. choose Racket), the reasons are, I believe, pretty obvious: 64bit support, nice GUI DSL for creating multi-platform desktop apps, excellent docs, decent performance, ability to create (kind of) stand-alone apps, package management, "batteries included", editor support integrated IDE is very nice, but not killer feature, organized community... i understand that most/all of those things are on Red's TODO list, but Racket does provide it today. moreover, Linux in Red is 2nd or 3rd class citizen which sucks a bit.

[07:43](#msg5a49e6955355812e573adaaf)@RnBrgn nice link

[07:52](#msg5a49e8b30163b028109c061c)@RnBrgn i mean, commnent are even better :wink:

[07:53](#msg5a49e8f40163b028109c073f)to me it looks that with every new buzzword/hype its lifespan is becoming shorter :smile:

[08:46](#msg5a49f571232e79134db19fb7)@BeardPower what went wrong with Nim for you, just curious?

BeardPower

[16:03](#msg5a4a5be0edd2230811fdb105)@gour  
&gt; @BeardPower what went wrong with Nim for you, just curious?

Nim is a great language and I thought about using it for some TCP server implementation.  
What went "wrong" for me/I don't like:  
\* The python-like indentation: I don't want to be restricted in how my code structure hast to look; one single misplaced space and your code does not work: CR/LF issues because of various platform differences.  
\* It needs a third party C++ compiler: I don't want to install bloat to get my code running.  
\* The lack of an integrated UI: libUI seems to be the route they decided on, but the project is not active since a year; another dependency you have to care for.  
\* The syntax still looks like the others (C++, Java etc.) we used to (unnatural bracket-function style): it does not has this clear, human readable and natural form of REBOL/Red.  
\* Meta-Programming is good, but it still has the feel of some complicated, unnatural style.

gour

[16:49](#msg5a4a66a2232e79134db3848d)@BeardPower thanks.  
\* I played with Haskell and indentation did not bother me. Moreover, I thought that indentation in Nim is not so sensitive as in Python due to NIm's lexical analysis  
\* as far as UI, I was also asking since long time ago to focus more on GUI and provide something. I know about libUI from Go, but I thought that these days there is more focus on \[nimx](https://github.com/yglukhov/nimx)  
\* Red's syntax is really cool and I've a feeling that one can really do a lot with less code  
\* I agree with meta-programming and here I'm more with Racket's style  
Btw, what is your most used platform/OS for Red?

greggirwin

[16:56](#msg5a4a684fedd2230811fdeebd)Great input @gour. Thanks so much. For me, Windows is the main OS I target.

gour

[16:58](#msg5a4a68a9ba39a53f1ac42a6c)\[This](http://sprylang.org/) might be interested for some, although I am not sure how active it is these days.

BeardPower

[17:12](#msg5a4a6bfd5355812e573d0b2d)@gour nimx is not really usable for a project. It's just a PoC.

&gt;Btw, what is your most used platform/OS for Red?

Right now it's Windows, as it has the best UI support right now. Hoping to switch to one of the \*BSDs, once the UI support is mature enough.

gour

[17:13](#msg5a4a6c40b48e8c35668a8e13)Win XP was the last Windows I had license for...BSD? i tried few times to migrate, but now settled on Fedora

BeardPower

[17:16](#msg5a4a6cd6b48e8c35668a9074)@gour Sprylang is also nice, but all these languages come with some weird syntax like

```
'to:do: =
```

. Reading something like this feels so strange to me.

[17:20](#msg5a4a6de6232e79134db3a572)@gour Yes, I like to use an OS as a whole, not something like GNU/Linux, where every distribution out the thousand different ones, is doing it's own thing.  
There is only one FreeBSD, one DragonFlyBSD etc., so I am using DragonFlyBSD and FreeBSD.

If working with GNU/Linux, I'm using Slackware and Arch, but I hope Redox turns out great :)

gour

[17:22](#msg5a4a6e3c5355812e573d15c7)@BeardPower have you tried hammer2? i was/am interested for DragonFly on the desktop

[17:23](#msg5a4a6ea503838b2f2a5b7eb9)@BeardPower and if you like OS as a whole, what about Pharo/Smalltalk?

[17:24](#msg5a4a6ee9b48e8c35668a9d3e)@gour is investigating Red's resources listed in the wiki

9214

[17:26](#msg5a4a6f5868d092bb6210b24e)@gour https://github.com/red/red/wiki/Learning-resources

ghost~5585eedf15522ed4b3e236ae

[17:27](#msg5a4a6f9b03838b2f2a5b847e)@gour http://serv.peterme.net/cross-platform-guis-and-nim-macros.html

gour

[17:36](#msg5a4a7185ba39a53f1ac455a0)@lkppo thanks. i read it...always admired wxwidgets, but these days i'm looking for something simpler (and not JS-crap), iow. something offered by languages like Racket/Red...

ghost~5585eedf15522ed4b3e236ae

[17:38](#msg5a4a720fedd2230811fe1c32)JS-crap?

gour

[17:38](#msg5a4a722cba39a53f1ac458df)Javascript-powered solution

ghost~5585eedf15522ed4b3e236ae

[17:39](#msg5a4a726484fb74b94026b1f5)There are JS in wxWidget?

[17:40](#msg5a4a729184fb74b94026b272)iow?

gour

[17:41](#msg5a4a72c629ec6ac311a7e335)iow. Node-stuff, Electron etc....no,wx is OK, but these days when one mentions GUI apps. most of the people just suggests browser-related solutions...that's why i like that Red (Racket) are not in the same league

[17:42](#msg5a4a7308ba39a53f1ac45d7f)btw, what are popular editors for writing Red code?

[17:42](#msg5a4a730e0163b028109e30bd)@gour is using vim

rebolek

[17:42](#msg5a4a731db48e8c35668ab248)I use VSCode

9214

[17:43](#msg5a4a732c68d092bb6210c506)@gour VSCode with Red plugin, but, ya know, it's written with Electron :eyes:

gour

[17:43](#msg5a4a733b29ec6ac311a7e5da)@gour nods :smile:

9214

[17:43](#msg5a4a734e29ec6ac311a7e65e)https://github.com/red/red/wiki/Editor-Integrations

ghost~5585eedf15522ed4b3e236ae

[17:44](#msg5a4a7386232e79134db3c600)Making desktop app with web technologies is just crazy.

rebolek

[17:44](#msg5a4a739b232e79134db3c66e)it is, but VSCode works surprisingly well

ghost~5585eedf15522ed4b3e236ae

[17:45](#msg5a4a73ae84fb74b94026b795)and imitating app desktop in web browser is also crazy.

gour

[17:45](#msg5a4a73ba0163b028109e33be):+1:

greggirwin

[17:45](#msg5a4a73c2ba39a53f1ac46123)I think someone else uses UltraEdit. Maybe I should connect with them and get our word files and tool configurations into the list.

ghost~5585eedf15522ed4b3e236ae

[17:45](#msg5a4a73cd29ec6ac311a7e964)I use EditPad Pro

[17:47](#msg5a4a741903838b2f2a5b9ab7)There are syntax colors for Red et Rebol

[17:49](#msg5a4a74b429ec6ac311a7ed8a)Not yet navigation plugin for Red and Rebol with EditPad Pro, but you can launch the REPL from the editor with a custom command.

are1000

[17:56](#msg5a4a763503838b2f2a5ba3cd)@lkppo how is this crazy?  
I'm using Sublime Text 3 for everything, but there is a plugin for Red

gour

[17:57](#msg5a4a767229ec6ac311a7f517)@are1000 but Sublime is native app, right?

are1000

[18:26](#msg5a4a7d6f03838b2f2a5bc376)@gour yep, it is.

BeardPower

[20:42](#msg5a4a9d3e232e79134db489e1)@gour  
&gt;have you tried hammer2? i was/am interested for DragonFly on the desktop

Unfortunately not in production use, as I'm using zfs, but it's the real deal from what I experienced so far! DragonFly is really great. Hybrid kernel :smile:

&gt;and if you like OS as a whole, what about Pharo/Smalltalk?

I barely read into it, but it reminds me of ETH-Oberon (Oberon System 4), which I used in my 20ties :smile:  
Such systems are hard to grasp at the beginning and it often boggles your mind. When looking back or when you get it, you really see why they are so great and you really don't want to use anything different than these systems.

[20:44](#msg5a4a9db329ec6ac311a8acd3)Same with REBOL/Red. The more you use it, the more you think about, why you wasted your time with this "other" crap ;-)

## Tuesday 2nd January, 2018

KimRoach143\_twitter

[05:21](#msg5a4b16c50163b02810a0c718)Sublime User Here for Red

gour

[09:38](#msg5a4b533084fb74b9402a4a03)@BeardPower glad to hear you like DfBSD. which DE/WM you use with it? yes, zfs is cool...on linux i gave up on btrfs (using xfs) and zfs is a bit pain to setup. I also have feeling that I could have great experience with Red which could led to question why spending time with "other crap". what do you use Red for? simple utility stuff or do you plan something bigger?

[09:39](#msg5a4b536284fb74b9402a4ab6)i also wonder about Red's FFI...how easy/hard is to call 3rd party C libs or providing Red bindings for them? is there any helper to automate things a bit?

are1000

[09:40](#msg5a4b5389ba39a53f1ac7de52)http://static.red-lang.org/red-system-specs-light.html#section-15.1

[09:41](#msg5a4b53b568d092bb6214591d)Red/System can already (by spec) load external shared libraries

gour

[09:43](#msg5a4b543184fb74b9402a501f)@KimRoach143\_twitter are you happy with it?

[09:55](#msg5a4b571bedd223081101dcd6)how does Red deal with type-safety, NullExceptions etc.?

9214

[10:02](#msg5a4b58a45355812e5740f15b)@gour we don't have null exceptions ;) you can use optional type checking in function's specs

[10:02](#msg5a4b58c20163b02810a1df90)@maximvl can butt in and tell you about his typed dialect

gour

[10:03](#msg5a4b58dd5355812e5740f274)so type checking is not part of 'standard' Red?

maximvl

[10:03](#msg5a4b58f45355812e5740f2b8)&gt;NullExceptions

rebolek

[10:03](#msg5a4b58fb5355812e5740f310)It is, but it's not strictly required.

maximvl

[10:03](#msg5a4b58fcb48e8c35668e6111)there is no Null so there are no Null Exceptions ;)

are1000

[10:05](#msg5a4b5975b48e8c35668e6306)NoneException? :P

gour

[10:06](#msg5a4b599c29ec6ac311abacdc)there is no Null even with type-checking?

rebolek

[10:06](#msg5a4b59b303838b2f2a5f545d)@gour every value has its type and crazy stuff like `1 + "1"` is not possible.

gour

[10:07](#msg5a4b59e4b48e8c35668e645b)what one gets when trying that?

maximvl

[10:07](#msg5a4b59e5b48e8c35668e6468)null is something which should not exist at all, and it does not in pretty much any modern language

[10:08](#msg5a4b5a0129ec6ac311abae24)today it's just a horror legacy of the past and should rest in peace

rebolek

[10:08](#msg5a4b5a1203838b2f2a5f55aa)@gour `1 + "1"` gets you an `error!`

gour

[10:08](#msg5a4b5a1484fb74b9402a6a95)@maximvl heh, tell me more about that, iow. list those 'modern' languages which are safe in regard :smile:

9214

[10:08](#msg5a4b5a1f84fb74b9402a6b04)@gour that you can't add apples and oranges

maximvl

[10:08](#msg5a4b5a2184fb74b9402a6b08)haskell?

[10:08](#msg5a4b5a2b232e79134db774a5)rust? coq?

[10:09](#msg5a4b5a5b29ec6ac311abafa9)there are any number of them

gour

[10:09](#msg5a4b5a5cb48e8c35668e668f)haskell is cool in that regard. iirc, some long thread where it was discussed that even Ada has some unsafe stuff...

maximvl

[10:09](#msg5a4b5a665355812e5740f929)sorry, I meant agda

gour

[10:09](#msg5a4b5a700163b02810a1e6e8)anyway, i'm glad Red is included, somehow

9214

[10:10](#msg5a4b5a7b5355812e5740f963)i.e. you can, but only if you'll design a dialect for that :smile:

maximvl

[10:10](#msg5a4b5a8eb48e8c35668e674a)so in the sense you are asking Red is like Python

9214

[10:10](#msg5a4b5aaa29ec6ac311abb0d7)thankfully it's not

maximvl

[10:10](#msg5a4b5ab1edd223081101ec4f)there is little compile-time checking and due to dynamic nature very little is possible

[10:12](#msg5a4b5afe68d092bb62147d21)pure Red is a very dynamic language which gives you as much freedom as possible, I'm working on `typed` dialect which will have static type checking and type inference

gour

[10:13](#msg5a4b5b44232e79134db77a96)@maximvl i am interested to see type checking/inference in Red...why not taking advantage when having native compiler to reduce runtime problems

maximvl

[10:13](#msg5a4b5b58ba39a53f1ac802f0)so it's just a library which can change the semantics of the language (which is the power of DSL)

[10:14](#msg5a4b5b7cba39a53f1ac80381)with Red it is possible to write your own type checking implementing it the way you want it

gour

[10:15](#msg5a4b5ba629ec6ac311abb4b2)huh...quite nice...too bad that Linux support is not on the par...still, maybe i should try with some simple cli scripts/utilities,,,

maximvl

[10:15](#msg5a4b5bc85355812e57410072)@gour for Linux I personally use Wine - cross compilation works fine with it

[10:15](#msg5a4b5bdb68d092bb62148264)for GUI and stuff

rebolek

[10:17](#msg5a4b5c2429ec6ac311abb70e)@maximvl does networking work for you under Wine?

maximvl

[10:17](#msg5a4b5c32232e79134db77ede)afaik neworking has problems, yes

[10:17](#msg5a4b5c3a5355812e574102ad)but we don't have any real networking yet ;)

gour

[10:17](#msg5a4b5c3c84fb74b9402a74af)support for console stuff is same as with other OS-es?

9214

[10:17](#msg5a4b5c4803838b2f2a5f5fac)@gour yup

rebolek

[10:20](#msg5a4b5cda232e79134db782ed)@gour Linux CLI Red is same as Windows or macOS version.

[10:20](#msg5a4b5cfa0163b02810a1f272)@maximvl HTTP/S is real enough for me ;)

maximvl

[10:21](#msg5a4b5d395355812e5741084d)yeah, well this is what I have on Wine:

```
>> read http://red-lang.org
*** Access Error: cannot connect: http://red-lang.org reason: timeout
*** Where: read
*** Stack:
```

rebolek

[10:22](#msg5a4b5d495355812e57410893)same here

gour

[10:22](#msg5a4b5d6729ec6ac311abbcb5)ohh, i'm glad to hear i can safely pursue evaluating Red on Linux, at least for CLI

maximvl

[10:22](#msg5a4b5d7eedd223081101fa6b)I suspect it's using some strange API which is not well supported by Wine

[10:23](#msg5a4b5d91edd223081101faee)

```
fixme:winhttp:winhttp_request_QueryInterface interface {06f29373-5c5a-4b54-b025-6ef1bf8abf0e} not implemented
```

rebolek

[10:23](#msg5a4b5d9ab48e8c35668e74a2)@gour I devolep in Red mainly on Linux and everything works just fine

maximvl

[10:23](#msg5a4b5d9eb48e8c35668e74c0)which shouldn't be the case once real networking comes

gour

[10:25](#msg5a4b5e29edd223081101fdf0)@rebolek nice to meet someone on Linux even with Electron-powered editor :wink:

koba-yu

[10:25](#msg5a4b5e2eb48e8c35668e7766)@gour  
&gt; i also wonder about Red's FFI...how easy/hard is to call 3rd party C libs or providing Red bindings for them? is there any helper to automate things a bit?

not sure it is the easiest in the world but I personally perefer Red's FFI to that of C#. I do not know any helpers so far, but Red's syntax is so simple that you can make out some kinds of automation, I guess.

maximvl

[10:26](#msg5a4b5e6929ec6ac311abc0fe)Red's FFI should be quite easy

gour

[10:27](#msg5a4b5e7c03838b2f2a5f6b45)@koba-yu well, i was mostly thinking in the context of type-safety, iow. providing thick-bindings for the library and not just thin wrapper over C API

rebolek

[10:27](#msg5a4b5ea8ba39a53f1ac811bd)@gour I used Sublime but it stopped working and installing VSCode was simpler than solving it ;) And Vim is fine for some small editing but I would spend years memorizing all the shortcuts required for anything useful. :)

gour

[10:29](#msg5a4b5f19b48e8c35668e7cc5)@rebolek i also have license for ST3, but it would be nice to have nice vim bindings and take advantage of neovim's feature. have you tried \[ActualVim](https://github.com/lunixbochs/ActualVim)?

rebolek

[10:35](#msg5a4b60695355812e574117c2)@gour No, I take a look at it. IIRC, someone did some Rebol vim bindings.

[10:36](#msg5a4b609884fb74b9402a85eb)There's this https://github.com/Prosumma/vim-rebol it can be adapted for Red I guess.

gour

[10:37](#msg5a4b60cc5355812e574119da)i installed this one: https://github.com/ruchee/vim-red

rebolek

[10:42](#msg5a4b62030163b02810a20bd6)This one seems more active https://github.com/NDxTreme/vim-rebol

gour

[10:46](#msg5a4b630168d092bb6214a5bd)in any case, i hope Red will become popular enough to deserve decent (n)vim bindings

BeardPower

[13:08](#msg5a4b846b29ec6ac311ac810c)@gour  
&gt;which DE/WM you use with it?

bspwm

&gt;what do you use Red for? simple utility stuff or do you plan something bigger?

For now just utility stuff, as I need features like full I/O and concurrency, but I'm in the planning phase of bigger projects.  
I want to use Red for everything, from utilities to trading/charting software to games. Even for an OS once Red/OS is there ;-)

gour

[14:00](#msg5a4b907b68d092bb62158ba7)@BeardPower what is the status of other DEs on DFBSD, liek GNOME/XFCE? for myself, i'd be happy with e.g. i3 - probably similar to bspwm, but need something more user-friendly for my other family members :laughing:

BeardPower

[14:12](#msg5a4b9355232e79134db8ad88)@gour Gnome, KDE, Xfce are all supported.  
bspwm is using binary space partitioning. It's more nerdy than i3 :smile:

[14:13](#msg5a4b93a703838b2f2a606a38)I need to look into Redox for running Red.

greggirwin

[19:14](#msg5a4bd9f9ba39a53f1acab2a1)When we get FFI at the Red level, it may be a basic interface to it, as in Red/System. From there we can wrap things how we want. I wrote a dialect over the R2 FFI, though Red may do something higher level like that out of the gate.

## Wednesday 3th January, 2018

mikeyaunish

[04:42](#msg5a4c5f3ab48e8c3566937ea8)@greggirwin I am using UltraEdit. I use the Rebol syntax highlighting. On Windows I am using Auto Hotkey so that I only every press one key to close my old Red instances, save my current edits and run the Red file. If everyone saves a few mouse clicks and key presses on every test cycle we could all recover multiple man/woman years.

greggirwin

[04:52](#msg5a4c617ab48e8c35669386e1)I have tool shortcuts to save/run/compile as well.

mikeyaunish

[05:06](#msg5a4c64d2b48e8c35669394b4)I just noticed your message about someone else using UltraEdit that may want some assistance.

greggirwin

[05:25](#msg5a4c6952232e79134dbcda2e)We should add notes to the wiki editor integration page. Have to see if there's a way to extract the tool config info, but the word file will be easy enough to post.

PeterWAWood

[05:36](#msg5a4c6bf084fb74b9402faf4a)@greggirwin or should I say "crazy evangelist" - fun for the team really put a smile on my face. :-)

greggirwin

[06:11](#msg5a4c741a5355812e574656a1):^) Thanks.

meijeru

[08:00](#msg5a4c8db268d092bb621a437d)Am I missing something? Where is what interview with whom?

greggirwin

[08:24](#msg5a4c9333232e79134dbd9eca)Somewhere, sometime, perhaps, all will be revealed.

BillDStrong

[13:09](#msg5a4cd61f0163b02810a9212d)&gt; This one seems more active https://github.com/NDxTreme/vim-rebol This one hasn't been well tested yet, and I am new to vim bindings, but any feedback (as well as pull requests) are welcome :)

[13:13](#msg5a4cd6e8b48e8c356695b7a8)Also, how do you newline on here?

[13:13](#msg5a4cd7150163b02810a9261b)Compose mode?  
There we go.

[16:11](#msg5a4d00b10163b02810aa20ef)Just pushed a fix to detect .red &amp; .reds files, if anyone has tried it.

[16:14](#msg5a4d016629ec6ac311b417e6)Q: would folks prefer a seperate Red/System definition, or different highlighting to distinguish it from everyday Red? Would that even be useful?

meijeru

[17:05](#msg5a4d0d515355812e57498025)^ Interesting question! Lexically, Red/System is indistinguishable from Red.

BillDStrong

[17:29](#msg5a4d12e703838b2f2a67ede5)Aren't there certain things only available in Red/System? C-Types! ?

rebolek

[17:52](#msg5a4d1876b48e8c3566973eda)@BillDStrong Red/System should be separate IMO, there are keywords, unlike in Red.

greggirwin

[18:00](#msg5a4d1a450163b02810aab22a)Separate is good in this case, as Red/System is a dialect of Red. Exploring how to identify and highlight dialects will be important going forward.

rebolek

[18:04](#msg5a4d1b3884fb74b9403345e9)It's very easy in case of Red/System. But identifying something like `parse` block would be quite a challenge.

meijeru

[18:18](#msg5a4d1e605355812e5749e4f0)Syntactically, everything inside the block following `Red/System` is in R/S dialect, and so is everthing in the block following `#system` or `#system-global` as well as in the body-block of a `routine`. But the word/path following the `#call` directive and the arguments, if any, of the called Red function are in Red. In the latter case, it might be difficult to know how many those arguments are....

greggirwin

[18:19](#msg5a4d1ea0ba39a53f1ad0fd8f)A challenge, yes, but not impossible. Like many things with Red, it may not be 100% in all cases, because we can do things in so many ways, but you could statically scan for values used as inputs to `parse`. Also useful for standalone tools, where all you are writing is parse rules, e.g., in a Visual Dialect Editor.

## Saturday 6th January, 2018

ghost~5585eedf15522ed4b3e236ae

[00:15](#msg5a5015336117191e612f127b)@are1000 : crazy to use web technology for desktop app? You have to build you own GUI with HTML / CSS / JS / glue language of you chose in backend and try to imitate rich widgets. You can do it by yourself or use a rich but heavy toolkit with a standard design, or yet compile a lot of external components. At the end you have a big ball of dependencies backed with 4 languages, which once is described by it's author as inherently flawed (JS https://www.youtube.com/watch?v=\_DKkVvOt6dk). This code is really fragile, and not ubiquitous like a website. In fact it's just this mood to imite rich app with web techs which is crazy. Web standards give poor widgets because there are document oriented, your have to emulate them and it's horrible. Browser should implement stylable treeview, listview, panel... and offer a native dual way document / app.

are1000

[00:18](#msg5a5015cd5355812e57590d02)I don't agree. I think that the combination of HTML+CSS+JS is really powerful and allows you to do so many beautiful, creative and functional applications.

[00:19](#msg5a501619232e79134dcfbae1)JS is flawed, but at the same really expressive and powerful in the hands of experienced programmer.

[00:20](#msg5a50165ab48e8c3566a660b8)It is also not true that you have to use heavy toolkits, or imitate widgets, there are many ways to accomplish things with each having its own advantages and disadvantages

[00:22](#msg5a5016b103838b2f2a773e0a)It also feels natural to use the same languages from frontend in native development, because it just works well with people and you don't have to invest money into native technologies when you have your frontend engineers.

[00:22](#msg5a5016c50505ad8b45bd4ce7)Not every company and organisation can afford a desktop programmer.

ocket8888

[00:23](#msg5a5016e6b48e8c3566a66322)speaking just about electron: I think it’s horrifying that running what’s essentially an entire operating system just for a chat program or something has become the norm.

are1000

[00:23](#msg5a5017176117191e612f1a48)Also, JavaScript has grown into something much more than the creator originally created, and is one of the most popular languages, while it's ecosystem is really diverse and growing.

[00:24](#msg5a501742ce68c3bc7483b0c7)@ocket8888 entire operating system? Wut?

[00:25](#msg5a50176a290a1f45615471ae)Electron is chromium+node.js, that's it

ghost~5585eedf15522ed4b3e236ae

[00:25](#msg5a501771ba39a53f1adfb1a6)I tried one time a sass or less tool coded with electron and it was very slow, it crashed.

are1000

[00:27](#msg5a5017d6ce68c3bc7483b32c)While I agree that it is a resource hog, it doesn't have to. VSCode is a great example of a well written electron app

ocket8888

[00:27](#msg5a5017d85355812e575914b0)Chromium implements a database, filesystem, users, process management, a virtual machine, device controllers, and allocation/rendering of screen space for sub applications. Then it slaps node.js in there, which is totally uncalled for imo, and provides it with similar hooks to the host

ghost~5585eedf15522ed4b3e236ae

[00:27](#msg5a5017f6232e79134dcfc14f)@are1000 In my opininon, yes, those techs have there merit but they are pushed too far from their original purpose.

are1000

[00:28](#msg5a50181cba39a53f1adfb4b1)I'm not sure if electron has users or process management just like Chrome

ocket8888

[00:28](#msg5a50181d232e79134dcfc1f9)VSCode uses like 5x the memory of sublime text to run 3 times slower

[00:28](#msg5a50182a6117191e612f1d5d)it certainly has process management

[00:28](#msg5a50183303838b2f2a7744b0)I may be wrong about users though

are1000

[00:28](#msg5a50183c232e79134dcfc249)While being x5 better in being an IDE (which Sublime text is not)

[00:30](#msg5a5018a06117191e612f1f71)Webstorm is also way slower and more memory consuming that st3 but I don't hear people comparing that much those two?

[00:30](#msg5a5018bd6117191e612f1fd7)Tho it is also way more complicated than VSCode

[00:31](#msg5a5018f1290a1f456154759f)The conclusion is - if you don't want to to use electron apps, use the web apps. 90% of the time, an app has both.

[00:32](#msg5a501914290a1f4561547611)I think that electron is a great step forward into compatibility of desktop applications and webapps.

ocket8888

[00:32](#msg5a5019216117191e612f2170)I’m pretty sure vscode is just a text editor

[00:32](#msg5a501925ba39a53f1adfb96d)webstorm is an ide

are1000

[00:32](#msg5a501934ba39a53f1adfba14)VSCode is a Typescript IDE

[00:33](#msg5a501943232e79134dcfc545)It has a debugger, intellisense

ocket8888

[00:33](#msg5a5019585355812e575919b4)maybe for typescript. Idk, I’m not that familiar.

ghost~5585eedf15522ed4b3e236ae

[00:33](#msg5a501964b48e8c3566a66cda)I think we are one two different way. For myself I never use IDE, just an editor and some others tools for one purpose only each. I dislike app with a lot of feature.

are1000

[00:34](#msg5a5019906117191e612f22ea)Don't get me wrong, I code in Sublime Text

ghost~5585eedf15522ed4b3e236ae

[00:34](#msg5a5019a16117191e612f2327)I like to go to the basics.

are1000

[00:36](#msg5a5019fb6117191e612f24b8)And I understand that! Let's just stop saying that people who think differently are "crazy", everyone is entitled to their own preferences about the amount of RAM consumed by a code editor :P

ghost~5585eedf15522ed4b3e236ae

[00:45](#msg5a501c1d290a1f4561548023)crazy is a hyperbole but I still think it's a very bad idea to use technos out of their field. If there is a lack, you have to invent new technos, not to divert others. Otherwise it gives what we see, a huge loss of resources, fragile bazaars. It's doing research on the back of users, not offering a stable and proven system.

gltewalt

[01:02](#msg5a5020226117191e612f3dc7)Electron is huge and slow.  
I like the concept, but “it ain’t there yet”, in my opinion.  
I agree that html+css can be beautiful

[01:14](#msg5a5022edce68c3bc7483dc2f)I would use it if needed, but don’t need to right now

PeterWAWood

[01:50](#msg5a502b61b48e8c3566a6b29a) I binned VSCode because

[01:53](#msg5a502c00b48e8c3566a6b4a5)It can’t handle permissions on macOS. If you run as a standard user, it tries to auto-update and fails silently as it doesn’t request admin credentials.

[01:54](#msg5a502c390505ad8b45bd9eaa)The bug was reported more than 12 months ago but they either can’t or can’t be bothered to fix it.

[01:57](#msg5a502cf0232e79134dd00fb4)I suspect that it’s probably not electron but the developer as it also has a very crass installer that assigns it as the default for a number of file types without seeking the user’s permission.

[01:57](#msg5a502d2403838b2f2a779686)Perhaps they’re better examples of good Electron applications.

gour

[07:39](#msg5a507d1b29ec6ac311c56906)@gour is happy that Red is not so much into pushing JS-stuff all around

are1000

[11:00](#msg5a50ac58290a1f4561567fd8)Pushing JS-stuff? :laughing:

rebolek

[13:06](#msg5a50c9da29ec6ac311c69990)stupid JS callbacks

gour

[15:47](#msg5a50ef7d0505ad8b45c08073)@are1000 well, today it seems that most of the devs are incapable to write anything without touching Javascript...i'm especially angry by pushing Javascript to the desktop, but it seems that nowadays most of the people just do not complain and are happy with any crap sold to them for any price :worried:

are1000

[17:16](#msg5a510463232e79134dd3579c)I'm especially angry that people talk about something when they have little knowledge about it. You could say the same about Java, C# or any other language that is popular. Its just pointless flame war, that right now is focused on JavaScript, because it is easier to get started with.

9214

[17:24](#msg5a5106560505ad8b45c0f03e)Guys, please keep this chat on topic and respect each others opinion. :love\_letter:

[17:25](#msg5a510684ba39a53f1ae34f1d)Or @greggirwin will come and start to stare at you with `:^)` face

greggirwin

[18:19](#msg5a5113250505ad8b45c12bea):^)

[18:19](#msg5a51134a0505ad8b45c12c70)Listen to @9214. This is my stern face. :^|

[18:24](#msg5a5114500505ad8b45c13247)We can get back on topic by noting that Red hopes to address the complexity that grown over time, and also that JS and Red have some shared heritage. It can be fruitful to discuss differences, and learn how to avoid mistakes of the past, addressing the biggest problems with what we have learned in the past 20 years. We can also learn from the successes. What makes things popular, and accessible? And if we make that a goal, can we also remain true to our vision?

[18:26](#msg5a5114d7290a1f4561584e47)If we want to do that, it shouldn't be in the Welcome room though.

[18:37](#msg5a51174e290a1f4561585aa9)On the subject of great looking UIs, check out the red/gui-branch room to see some work @rgchris did in R2.

## Sunday 7th January, 2018

vulnz

[02:21](#msg5a518420232e79134dd567ac)hello guys. do you have any idea how to run red under macos aftr i downloaded it? what action should i do in order to start it

[02:22](#msg5a518466b48e8c3566ac1cd8)wow guys, please put it in gide that on macos you should chmod 777 it before running ;)

[02:24](#msg5a5184c0232e79134dd56951)you wrote about new ide, please see mine ;) https://github.com/vulnz/redide easy, but can give you some ideas

greggirwin

[02:44](#msg5a5189975355812e575edcba)@vulnz, thanks. I've added https://github.com/red/red/wiki/Install-and-Get-Started, and a link to it in the main readme. Please add any helpful hints there. We don't have an IDE page or section, but we should think about where to put links to tools like yours, @virtualAlan 's work, etc.

[02:46](#msg5a5189f25355812e575ede3e)I'll try to check out your IDE soon. \*Really* busy here lately, as you've seen.

x8x

[04:45](#msg5a51a6065a9ebe4f7556a324)@vulnz ‘chmod +x red-bin’ would be more correct (‘+x’ = add execution privilege)

gltewalt

[05:29](#msg5a51b0495a9ebe4f7556c811)https://imgur.com/a/dWYKv

9214

[07:06](#msg5a51c70d6117191e6135a50d)@vulnz I thought it's pretty obvious for \*nix users that you should `chmod` any file that you downloaded from the net?

BillDStrong

[08:16](#msg5a51d747290a1f45615b2a0e)@9214 Do most Mac users consider themselves Unix users? Also, being explicit in these steps is important to decrease the number of pain points to get started. I would want Red to die from a thousand paper cuts.

greggirwin

[08:17](#msg5a51d78c6117191e6135dd7a)@BillDStrong, certainly more do now. :^) I agree that it can't hurt to be helpful in this regard.

9214

[08:17](#msg5a51d78d232e79134dd68406)@BillDStrong perhaps it should be "wouldn't"?

BillDStrong

[08:17](#msg5a51d7b25a9ebe4f7557537d)right :smile:

greggirwin

[08:18](#msg5a51d7c15a9ebe4f755753cb)Still time to edit it!

9214

[08:18](#msg5a51d7f2ce68c3bc748a59d7)then it might be worth to extend readme with installation/launching instructions

greggirwin

[08:20](#msg5a51d83ace68c3bc748a5b27)Use the new wiki page and integrate later? It may be a lot to put in the readme, but may be better there contextually.

9214

[08:21](#msg5a51d86cce68c3bc748a5b6c)@greggirwin "if you have troubles with launching toolchain, consuls such and such instructions"

greggirwin

[08:21](#msg5a51d88e5355812e575fe7d2)Well, I did link to it right under the Download and Install link.

9214

[08:26](#msg5a51d9ca232e79134dd68c19)@greggirwin \[here](http://www.red-lang.org/p/getting-started.html)? I meant `README.md` on github

greggirwin

[08:27](#msg5a51da08290a1f45615b3572)Ah, sorry, I added it to https://github.com/red/red/wiki

vulnz

[21:31](#msg5a5291a56117191e6139020f)Thank yoo for your feedback guys. Will it be any Red made server? Because i did not find any. It will be great to see anything like simple http server + get post handler. Any ideas?

rebolek

[21:35](#msg5a5292bbba39a53f1ae997f6)@vulnz For Red server you have to wait for 0.7.0 when full IO will come.

[21:36](#msg5a5292eb03838b2f2a813a14)You can run Red as CGI on i.e. Apache already, there are get/post handlers available also.

vulnz

[21:50](#msg5a5296180505ad8b45c743b9)@rebolek thank you.

rebolek

[22:13](#msg5a529b90232e79134dd9dc7a)you're welcome

## Monday 8th January, 2018

vulnz

[00:19](#msg5a52b907290a1f45615ee501)https://github.com/vulnz/redide4mac made a version for mac. Lite one ;) for people who are using mac and it is hard for them to run it in term. have a good day.

greggirwin

[00:48](#msg5a52bfd06117191e6139c240)@vulnz, nice. Out of curiosity, what needs to be different for each OS?

vulnz

[00:59](#msg5a52c27d290a1f45615f0c21)For some reason, it did not compile previous version for mac. Also compilation process little bit different. Red should be red for mac ;) and maybe i optimized it little bit for mac and fixed bugs, but, even i did so when i compile app it gave me "low resolution unchecked mark" and for some reason app can not load files it used to load before. Need to figure it out and learn red better ;)

[01:01](#msg5a52c2e783152df26d427eca)I'm waiting for IO, because i'm web developer ;) will try to do some usefull things for web on Red ;)

[01:03](#msg5a52c34903838b2f2a820728)basically i did mac version of red+ide for begginners to start, because it is hard to run in term everything for beginner, specially on mac

greggirwin

[01:09](#msg5a52c4dcba39a53f1aea66de)Keep notes. One of the goals is to make things work the same on all platforms, as much as possible.

9214

[06:36](#msg5a53116c290a1f4561603858)@vulnz next time try use `-e` flag during compilation

luis-rj

[14:34](#msg5a538159b48e8c3566b4b3e1).

9214

[14:35](#msg5a5381a2ba39a53f1aede2a3)...

## Sunday 14th January, 2018

Senenmut

[01:44](#msg5a5ab605517037a212a2d118)Hi there, does red crosscompile to a android .apk file right now? Or is it planned in the future?

greggirwin

[02:37](#msg5a5ac266ba39a53f1a11a126)There was early work done on Android, as proof of concept, but it is not up-to-date with current releases. The ICO pulled focus, but Android \*was* near the top of the priority list. That may change now, but tokens may also open up a way to support community members who want to work on it.

BillDStrong

[14:10](#msg5a5b64f1ce68c3bc74b7300c)I remember @dockimbel had said recently the current plan for the main releases were for the initial Android support to be in the release after next. I forget where he said that, though.

greggirwin

[16:27](#msg5a5b850aae53c15903e7f2e9)It was planned to be soon, but that was before C3 came on the scene. Priorities \*may* be changing, but I'm sure we'll hear some thoughts on that before too long.

## Monday 15th January, 2018

gltewalt

[03:05](#msg5a5c1a64ce68c3bc74ba1b1e)I kind of wish I could do this as an `action!`

```
select-back: func [series value /local tmp][
    tmp: copy [] 
    append tmp series 
    reverse tmp select tmp value
]
; select-back [a 1 b 2 c 3] 2
```

toomasv

[06:22](#msg5a5c48a61dcb91f1774f8664)Can't help with `action!` but could be simplified to:

```
select-back: func [series val][select reverse copy series val]
```

gltewalt

[06:30](#msg5a5c4aa1517037a212a90971)Ah, I had the order wrong and copy wasn’t working for me. So I made a clumsy version

toomasv

[07:28](#msg5a5c5829517037a212a94592)You have always interesting ideas!

greggirwin

[07:42](#msg5a5c5b765ade18be3978936f)Or even `select-back: func [series val][first back find series val]`?

toomasv

[07:45](#msg5a5c5c151dcb91f1774fddb3)Tried this, but:

```
>> select-back2 [a 1 b 2 c 3] 'a
== a
```

Sould be `none`

greggirwin

[07:47](#msg5a5c5c8b6117191e6167fd8d)Good catch!

[07:49](#msg5a5c5cfd6117191e6167ffce)How about this?

```
select-back: function [series val][all [pos: find series val  pick pos -1]]
```

toomasv

[07:55](#msg5a5c5e68ae53c15903eb63b8)Contra:

```
select-back3: function [series val][pick any [find series val []] -1]
```

greggirwin

[07:56](#msg5a5c5ec1ce68c3bc74bb2ed2)Add another arg for the offset and we have a general `select-at/select-from` mezz.

[07:57](#msg5a5c5ef96117191e61680805)Curses! I'm out-optimized again. Hmmmm.

[07:58](#msg5a5c5f366117191e61680912)Man, yours is so much nicer. :^\\

toomasv

[07:59](#msg5a5c5f65b48e8c3566df5f30) :relaxed:

Senenmut

[12:52](#msg5a5ca410ba39a53f1a19603a)Hi Gregg -Ready for a high level Programmers joke ?

[12:56](#msg5a5ca4fe290a1f45618e72c3)ok. Begin. HIGH LEVEL PROGRAMMING JOKE !

[13:03](#msg5a5ca6846117191e6169a11a)This Example posting IS the joke. Hope that you like it. POST : "Hello. I am new in programming and currently working on the building of graphical users interface GUI. For this i have spoken with an INSIDER of the language UAHHH. UAHHH is object oriented language. This programming INSIDER told me strongly to use a Library RAPPER for building a GUI in UAHHH. For many weeks i am posting many questions on the Forum of UAHHH and everyone is saying that i have to use a LIBRARY WRAPPER such like gtk-linui-qt for buildung a GUI. But i need a RAPPER not to WRAPPER. So my question is HOW to get a RAPPER - Library to download for GUI building. Only a RAPPER - not a Wrapper. Need help from professionals in GUI design."

[13:13](#msg5a5ca901b48e8c3566e103f2)Red programmer are not only programmers. They also have a good ense of humor every top-level programmer needs. ha

9214

[14:40](#msg5a5cbd671dcb91f1775210b0)ba dum tss

BeardPower

[14:55](#msg5a5cc0f2ba39a53f1a1a0a40)https://www.youtube.com/watch?v=lYIOk1I0cgs

Senenmut

[18:12](#msg5a5cef22ce68c3bc74be6cc3)oh. that really open new horizont for me. thank you to close the issue. problem solved. ready for new coding !

gltewalt

[20:01](#msg5a5d0888ae53c15903ef5545)I was thinking of a doubling linked map without having to be a map. Just data in blocks. It would make translation between code fragments or written words easy

[20:01](#msg5a5d08925a9ebe4f758e274a)Doubly linked

greggirwin

[20:20](#msg5a5d0d18ba39a53f1a1bc86a)Yup. Translation tables like that are fairly common.

gltewalt

[20:24](#msg5a5d0df2b48e8c3566e3657b)Or extend `map`

```
>> my-map: #(a: 1 b: 2 c: 3)
== #(
    a: 1
    b: 2
    c: 3
)
; my-map/2  == b
;my-map/all/2 == b: 2
```

greggirwin

[20:28](#msg5a5d0eef290a1f456190ef71)

```
>> m: #(a: 1 2 3)
== #(
    a: 1
    2 3
)
```

What does `m/2` return?

gltewalt

[20:29](#msg5a5d0f0f1dcb91f17753dfe0)1 2 3

greggirwin

[20:29](#msg5a5d0f47290a1f456190f124)That doesn't make sense to me.

[20:30](#msg5a5d0f6eba39a53f1a1bd628)You'll need to write your behavior spec in detail.

gltewalt

[20:31](#msg5a5d0f8aba39a53f1a1bd683)How about `map/key` and `map/value`, with `/key` being optional?

[20:31](#msg5a5d0f9b1dcb91f17753e29e)Default is `/key`

9214

[20:31](#msg5a5d0fa8290a1f456190f32d)and what if map is not assigned to a word?

[20:32](#msg5a5d0fc2ae53c15903ef7ff6)then we should extend all series' `action!`s

gltewalt

[20:32](#msg5a5d0fcc1dcb91f17753e35f)Why?

9214

[20:32](#msg5a5d0ffb6117191e616c1919)

```
text
>> select #(a 1) 'a
== 1
>> select #(a 1) 1
== none
```

greggirwin

[20:33](#msg5a5d10156117191e616c1984)What is the win here @gltewalt?

gltewalt

[20:33](#msg5a5d102c5ade18be397cc0c2)Easy Translators

9214

[20:33](#msg5a5d102f5ade18be397cc170)so we should define `/back` refinement for `select` or something like that, so that `select/back #(a 1) 1` would return `a`

[20:34](#msg5a5d105bce68c3bc74bf1d87)well, maybe not all `series!` actions but `map!` ones

greggirwin

[20:34](#msg5a5d1061517037a212ad7f88)Making one thing easy often makes other things harder. Is it worth it?

[20:35](#msg5a5d1093b48e8c3566e37352)Again, write it up. Show how it's done today, and how it will be better.

gltewalt

[20:35](#msg5a5d1096517037a212ad810b)I like `select/back` Is it worth it? I don't know

greggirwin

[20:40](#msg5a5d11a8b48e8c3566e37ad7)What is the clearest way you can think of to define and use a translator? Start there.

## Wednesday 17th January, 2018

PolywickStudio

[05:00](#msg5a5ed869290a1f45619a2750)is there a way to capture stdin/stdout?

[05:00](#msg5a5ed880517037a212b7037f)example: I want to sudo apt-get. There is a passwod prompt that needs to be entered.

greggirwin

[17:07](#msg5a5f82cd290a1f45619e03a4)@PolywickStudio, `call` is what you're after. Use `help call` to see all the options. For more detailed notes, here are some old Rebol docs. Red aims to be highly compatible, but also tries to improve things. If you keep notes while you're doing this, about what works and what doesn't, we can start a wiki page for this.

\- http://www.rebol.com/docs/shell.html  
\- http://www.rebol.com/article/0004.html  
\- https://stackoverflow.com/questions/41889113/rebol-3-reading-stdin-efficiently-line-by-line-to-make-awk-like-tool

Note that any references to `system/port`, e.g., in the R3 SO notes, won't work, as we don't have ports and full I/O yet. Soon though.

[17:09](#msg5a5f833bb48e8c3566f0ae33)Make notes here: https://github.com/red/red/wiki/Redirection:-STDIN,-STDOUT,-STDERR

ocket8888

[17:10](#msg5a5f83855a9ebe4f759bacfd)does red have support for hiding text input for passwords? I’m pretty sure you could fake it by just writing `*`’s to a text box as the length of user input changes, but I was wondering if there’s a native solution

greggirwin

[17:13](#msg5a5f84341dcb91f1776103b6)No password hiding yet.

## Thursday 18th January, 2018

zinid

[05:23](#msg5a602f3d517037a212be8308)I wish password hiding never existed

greggirwin

[06:11](#msg5a603aacba39a53f1a2caedb)For now you have your wish.

## Saturday 20th January, 2018

lpvm

[11:26](#msg5a632748ae53c1590310231a)Hi, I need to use the Red version for windows with wine in Linux because of GUI. When I run it, it opens a console, but I'm used to my Vim editor. How can I use wine Red to load my script edited not in red's console but apart with another editor?

9214

[11:27](#msg5a63279bba39a53f1a3c341f)@lpvm `wine ~/path/to/red.exe script.red` ?

lpvm

[11:35](#msg5a6329805ade18be399d8556)0056:err:winediag:ODBC\_LoadDriverManager failed to open library "libodbc.so": libodbc.so: cannot open shared object file: No such file or directory

[11:35](#msg5a6329986117191e618d0969)maybe I need libodbc 32 bits

[11:36](#msg5a6329beae53c1590310317e)installed it but same problem

9214

[11:36](#msg5a6329cc9cdc721e4fa63ce9)for me GUI window flashed for millisecond and then disappeared with

```
fixme:dwmapi:DwmIsCompositionEnabled 0x33fdc0
fixme:wincodecs:PngDecoder_Block_GetCount 0x175ca0,0x33fa68: stub
```

[11:37](#msg5a6329f1ce68c3bc74df8727)I usually just `do %script.red` directly in GUI console

lpvm

[11:52](#msg5a632d66ce68c3bc74df94a2)Besides RED [  
needs 'view  
] what do I need to put in the header?

9214

[11:53](#msg5a632daaba39a53f1a3c53b2)It should be `Red [Needs: View]` though. Nothing else is required, but you may put any info you wish. `Needs: View` tells compiler to include View module.

lpvm

[12:15](#msg5a6332f3290a1f4561b16e7b)In http://www.red-lang.org/2016/03/060-red-gui-system.html, there's the lines with label, were their syntax changed recently?

9214

[12:17](#msg5a63335c290a1f4561b173c1)what do you mean by "lines with label"?

lpvm

[12:18](#msg5a63338de0141226506bc88a)group-box "Person" 2 [  
origin 20x20  
label "Name" name: field 150  
label "Age" age: field 40  
label "City" city: field 150  
err-msg "Age needs to be a number!" react later [  
face/visible?: not parse age/text \[any digit]  
]

9214

[12:19](#msg5a6333b89cdc721e4fa669a1)if you scroll up a little and look carefully, there's this line

```
style label: text bold right 40
```

[12:19](#msg5a6333e99cdc721e4fa66aa9)https://doc.red-lang.org/en/vid.html#\_styling

lpvm

[12:20](#msg5a633401ae53c15903105ea5)I'm very rusty in Rebol, trying to adapt to Red...

9214

[12:20](#msg5a633427517037a212cee33b)take your time :) I believe styles were in R2 too, no?

lpvm

[12:21](#msg5a63343c517037a212cee39e)maybe, but never went GUI before!

9214

[12:21](#msg5a6334555a9ebe4f75afb650)brave new world awaits ahead! :rainbow:

lpvm

[12:29](#msg5a6336369cdc721e4fa67600)oh yeah! Do you know if across works inside a group-box?

9214

[12:32](#msg5a6336daae53c15903106b58)@lpvm why won't you check yourself?

[12:34](#msg5a63375dae53c15903106dce)

```
text
view [group-box [style test: text "test" below test test across test test]]
```

lpvm

[12:36](#msg5a6337d9517037a212cef484)I tested my example before asking, sure, but was not performing

9214

[12:37](#msg5a633809517037a212cef556)\[!\[image.png](https://files.gitter.im/red/red/welcome/EV8T/thumb/image.png)](https://files.gitter.im/red/red/welcome/EV8T/image.png)

lpvm

[12:37](#msg5a633811ba39a53f1a3c7da2)yes i ran it

[12:47](#msg5a633a74ae53c15903107a29)for a field https://doc.red-lang.org/en/view.html#\_field is there a way to allow only a maximum number of chars in it?

9214

[12:51](#msg5a633b6a290a1f4561b198f7)@lpvm yes, though not an easy one

lpvm

[12:54](#msg5a633c1f517037a212cf0612)ok

9214

[12:56](#msg5a633c92ba39a53f1a3c90cf)@lpvm here's an example

```
Red [
    Needs: View
]

system/view/capturing?: yes
view [
    f: field center 200x20 hint "10 chars limit" on-detect [
        attempt [
            keycode: to integer! event/key
            all [
                10 <= length? f/text ; specified length
                08 <> keycode        ; backspace
                13 <> keycode        ; enter
                'stop
            ]
        ]
    ]
]
```

lpvm

[12:57](#msg5a633cb4ce68c3bc74dfd2d4)thanks @9214

9214

[12:57](#msg5a633cb9ce68c3bc74dfd2f4)you're welcome

lpvm

[12:58](#msg5a633cdbe0141226506bf24e)you are very helpful. I'm trying to end this very small script in a few hours, that's why I'm in a hurry ;-)

9214

[12:59](#msg5a633d3e6117191e618d5b3e)let's speed up things a little then ;)  
https://www.youtube.com/watch?v=aNQDCcqQu2Q

lpvm

[13:00](#msg5a633d50ae53c1590310878b)In Rebol there's `set-facet` and `get-facet`, but don't seem to find them in the VID or VIew docs.

[13:00](#msg5a633d785ade18be399de962)I want a field to be updated when the user presses a button with some calculation made over some input fields written by the user

9214

[13:01](#msg5a633d9ece68c3bc74dfd7c6)you can get and set values of facets with traditional path notation

[13:01](#msg5a633da8e0141226506bf5bc)say, `f/text: "blah"`

lpvm

[13:02](#msg5a633deaba39a53f1a3c95ed)good!

[13:04](#msg5a633e606117191e618d6005)I'll be back in some minutes with more questions for sure! Thank you very much @9214

[14:37](#msg5a6354146117191e618dcda7)in the console, something like `dd: either error? d: try [to-integer dia] [view alert "ss"] [2]` complains about view.

[14:37](#msg5a635423ce68c3bc74e0419b)how to load `View` in the console?

9214

[14:37](#msg5a6354426117191e618dce0d)@lpvm Linux console?

lpvm

[14:38](#msg5a63544fce68c3bc74e04258)windows console, had to give up Linux

9214

[14:38](#msg5a63547c5ade18be399e557f)what is `alert "ss"`? `view` expects VID block as its input

lpvm

[14:40](#msg5a6354c65a9ebe4f75b050c6)&gt;&gt; alert "ss"  
\*\** Script Error: alert has no value  
\*\** Where: catch  
\*\** Stack:

9214

[14:41](#msg5a635508ba39a53f1a3cfe85)Red doesn't have built-in `alert` function as in R2

lpvm

[14:43](#msg5a63557bae53c1590310f032)I wanted to call `alert` if the user inputs something wrong. I guess, that I need to call a function to verify inputs from within the button block in `view` then, right?

9214

[14:43](#msg5a63558c9cdc721e4fa6fe0d)@lpvm correct

[14:48](#msg5a6356c55ade18be399e601b)you can implement `alert` by yourself if you want, something like

```
alert: func [message][view/flags [below text bold message button "OK" [unview self]] 'no-buttons]
```

lpvm

[14:56](#msg5a6358b45a9ebe4f75b06465)humm, in a `button` block, `if error? try [to-integer (trim dia/text)] [alert "dia num"]`, \*\** Script Error: alert has no value  
\*\** Where: if  
\*\** Stack: do-file view do-events do-actor do-safe

9214

[14:57](#msg5a6358db290a1f4561b226a2)uhm, have you actually defined `alert` function?

[14:57](#msg5a6358ea5ade18be399e68cc)again, it's not built-in as in Rebol

lpvm

[14:57](#msg5a6358f35a9ebe4f75b0659d)no, I misread then

[14:58](#msg5a635907e0141226506c7785)I thought I'd need to implement it outside of the `view` block only

[14:58](#msg5a6359085ade18be399e68f2)sorry

9214

[14:58](#msg5a635932e0141226506c7839)wait, you defined `alert` but the line above still gives you an error?

lpvm

[14:59](#msg5a6359575a9ebe4f75b06802)no, I'm defining it now, I was calling `alert` from inside the `view`block

[15:00](#msg5a63599a517037a212cf8a53)works now!

[15:01](#msg5a6359d8517037a212cf8b95)one step beyond https://www.youtube.com/watch?v=N-uyWAe0NhQ

9214

[15:04](#msg5a635a6b6117191e618ded15)https://www.youtube.com/watch?v=Bxc0OiewHcw

abdllhygt

[15:07](#msg5a635b4e290a1f4561b231f9)Hi!

[15:08](#msg5a635b5cba39a53f1a3d19a2)How are you

9214

[15:08](#msg5a635b6ce0141226506c84a8)@abdllhygt hey there, how is it going with your scripting language?

abdllhygt

[15:09](#msg5a635bbc5a9ebe4f75b07692)@9214 i can't start now. i need to start learning `parse`.

[15:10](#msg5a635bd5e0141226506c86f2)I will start when i finished `parse`

[15:10](#msg5a635bffae53c15903111148)Do you interest crypto moneys?

9214

[15:12](#msg5a635c489cdc721e4fa71d80)@abdllhygt no, not really, but I would like to understand this field a bit, since Red went into that direction

lpvm

[15:14](#msg5a635cb8ba39a53f1a3d1f8c)`dd: 0`

[15:14](#msg5a635cc25ade18be399e7e15)`if (dd < 1) or (dd > 31) [print join dd " is not between 1 and 31"]`

[15:14](#msg5a635cd1ce68c3bc74e0687b)`join has no value...`

9214

[15:14](#msg5a635ceeba39a53f1a3d20d8)@lpvm try `rejoin [dd space "is not bewteen 1 and 31"]` instead

[15:15](#msg5a635d085a9ebe4f75b07d38)as in case with `alert`, `join` is not built-in by default in Red

abdllhygt

[15:15](#msg5a635d0d517037a212cf9d82)I want to learn dev-tools of a crypto moneys. So, i want to learn them; send transfer, receive and security with a programming language. I studied iota, but i didn't undertand :/

lpvm

[15:15](#msg5a635d16ae53c159031116f7)ok

9214

[15:16](#msg5a635d469cdc721e4fa72205)@abdllhygt maybe @BeardPower will be kind enough and share something interesting with us, he's our local crypto-guru ;)

abdllhygt

[15:17](#msg5a635d7e517037a212cf9f4b)I will talk him :) thanks

[15:17](#msg5a635d8b517037a212cf9f64)when is he online?

9214

[15:17](#msg5a635da6ae53c15903111c16)@abdllhygt he'll pop up here eventually and hopefully will notice that we've mentioned him

abdllhygt

[15:18](#msg5a635dcf6117191e618dff5e)i will wait with happy

lpvm

[15:29](#msg5a636052e0141226506c9c87)@9214 when a user inputs an error, my checks are working, but I need the logic of the program to not advance beyond those checks while the input is not corrected. I can think of more than one way to do this: each check is attributed to a variable and then `unless check a and check b and check c` the logic doesn't advance

[15:29](#msg5a63606b5ade18be399e8d6d)is there any simpler idea you can think of?

9214

[15:34](#msg5a6361995a9ebe4f75b0904e)@lpvm I'd use `unless all [check a check b ...][alert "blah-blah" ...]`

lpvm

[15:35](#msg5a6361a5ba39a53f1a3d3531)fine

[15:50](#msg5a63655ce0141226506cb4c4)https://gist.github.com/lpvm/4b483a18107d85fbd6974b8990ef95cd

[15:51](#msg5a636587ba39a53f1a3d48d6)I'm not able to have the control go back to the view, so that the user can correct the input so that the flow can continue

[15:51](#msg5a6365995a9ebe4f75b0a50c)@9214 can you give me an hand on this one as well?

9214

[15:53](#msg5a6365f96117191e618e283f)perhaps it should be `formulario: layout [...]` and `unless all [...][view formulario]`?

[15:54](#msg5a636646290a1f4561b2660e)as I understand, you want user to input a date which lies in some pre-defined bounds?

lpvm

[15:55](#msg5a636683ba39a53f1a3d4ce8)yes

[16:04](#msg5a63689ce0141226506cc2dc)now I get a `>> do %numero.red *** Syntax Error: missing #"]" at {"end"} *** Where: do *** Stack: do-file expand-directives load`

[16:04](#msg5a6368a8ce68c3bc74e0a4f4):-(

9214

[16:05](#msg5a6368c5ce68c3bc74e0a562)well, it says what it says - you're missing closing `]` somewhere in a script

lpvm

[16:05](#msg5a6368ddce68c3bc74e0a591)yeah...

[16:07](#msg5a6369576117191e618e383f)a commented line that had the closing `]`

[16:10](#msg5a6369ee5a9ebe4f75b0bbbe)in that suggestion of yours, do I need to do `unview formulario` before calling it again?

9214

[16:13](#msg5a636aa4ba39a53f1a3d62b2)@lpvm idk if this is helpful, but here's my take:

```
Red [
    Needs: View
]

alert: func [message][
	view/flags [
        below text bold message button "OK" [unview self]
    ] 'no-buttons
]

view [
    title "Date calc"
    style input: field center 

    year: input month: input day: input return
    click: button "Calculate" [
        date: attempt [
            make date! reduce [day/data month/data year/data]
        ]
        either all [
            date
            date > 01-01-1920
            date < 31-12-2018
        ][
            alert "Good job!"
        ][
            alert "No way sir, try again."
        ]
    ]
]
```

[16:15](#msg5a636b2fce68c3bc74e0b0cc)&gt; I'm not able to have the control go back to the view, so that the user can correct the input so that the flow can continue

not sure what you mean, can you clarify?

[16:19](#msg5a636c05ce68c3bc74e0b645)or maybe

```
alert 
    pick ["Good job!" "No way sir, try again."] 
    to logic! all [
        date
        date > 01-01-1920
        date < 31-12-2018
    ]
```

BeardPower

[16:36](#msg5a637026e0141226506ce642)@abdllhygt

&gt; I want to learn dev-tools of a crypto moneys. So, i want to learn them; send transfer, receive and security with a programming language. I studied iota, but i didn't undertand :/

What exactly? E.g., the IOTA foundation provides a JS API and also a Sandbox, which allow you to interact with the wallet and the Tangle. As it's a REST API, you can also develop in Red.

[16:50](#msg5a63736de0141226506cf420)I meant JS lib. There is also a python lib. The libraries are considered early beta. You can also use curl, node.js etc.

[16:53](#msg5a6374085a9ebe4f75b0ed2f)The IOTA wallet is based on Electron, so this calls for a wallet implemented in Red ;-)

lpvm

[17:11](#msg5a6378519cdc721e4fa7a7eb) @9214 maybe I went through the previous problem. Now, inside `view`, what's the best way to show a number? ex: `n-vida: text font-size 40` `n-vida/text: result_of_some_funcion_as_number`?

9214

[17:12](#msg5a63787cba39a53f1a3da752)`n-vida/text: form`

[17:13](#msg5a63789d5ade18be399f08e1)our you can try `n-vida/data:` instead

[17:14](#msg5a6378f5e0141226506d0f3e)though it should be wrapped inside a reaction block or whatever it's called

[17:14](#msg5a637904290a1f4561b2c4a3)or you want to include this number directly into VID block?

lpvm

[17:15](#msg5a637931ce68c3bc74e0ebb4)I guess the second, since I want it to be shown at the bottom of the gui interface

9214

[17:16](#msg5a637960e0141226506d117a)@lpvm

```
>> my-number: does [42]
== func [][42]
>> view compose [text data (my-number)]
```

[17:17](#msg5a6379929cdc721e4fa7adde)read up about `compose` and figure out how to apply it in your situation

abdllhygt

[17:22](#msg5a637ac76117191e618e8b40)@BeardPower i read in https://iota.readme.io and i know nodeJs, python and curl.

[17:22](#msg5a637ae4ba39a53f1a3db185)i need examples

BeardPower

[17:23](#msg5a637b039cdc721e4fa7b430)@abdllhygt Then you need to go to the IOTA developer hub https://dev.iota.org/ On the top: Documentation Reference

abdllhygt

[17:25](#msg5a637b7f5ade18be399f12ee)is it necessary running iri when i try iota sandbox?

BeardPower

[17:26](#msg5a637bd7517037a212d02e1d)No. The Sandbox is a remote IRI.

[17:29](#msg5a637c776117191e618e93da)IRI only stands for IOTA Reference Implementation. The Sandbox is there to try out stuff instead of installing and running the IRI (the IOTA ledger called Tangle) locally.

[17:30](#msg5a637cc8ae53c1590311b7cd)The POW (proof of work) is done on a GPU cloud from the IOTA foundation.

abdllhygt

[17:32](#msg5a637d2a5a9ebe4f75b1160d)i see thanks i try now

lpvm

[17:53](#msg5a63820a9cdc721e4fa7d5ca)what do I need to do to have "sss" (or a result of a function) to be shown? `text bold font-size 40 center react [face/text: "sss"]`

9214

[18:00](#msg5a6383a56117191e618eb815)...to be shown after what?

[18:00](#msg5a6383d4ba39a53f1a3ddb22)

```
text
view [text bold center on-over [face/text: "sss"]]
```

[18:01](#msg5a6383f5ae53c1590311d64d)or, to rephrase, what action should trigger the text appearance?

lpvm

[18:04](#msg5a638493517037a212d05881)when the button is clicked

9214

[18:07](#msg5a6385775a9ebe4f75b13a46)

```
text
view [t: text button [t/text: "abracadabra"]]
```

lpvm

[18:14](#msg5a6386eee0141226506d5050)it works..

9214

[18:14](#msg5a6386f8ba39a53f1a3de926):O

lpvm

[18:15](#msg5a638756290a1f4561b308fc)for the `text` facet there's a font-size, that I want big. But the number is not shown entirely. Tried a `size` but doesn't work to make the facet larger to accommodate the text. How to do this?

9214

[18:18](#msg5a638802ce68c3bc74e12bc8)it doesn't fit in a window?

[18:21](#msg5a6388b2ae53c1590311ebaa)I guess you can place width/height `pair!` value in the description of text

[18:22](#msg5a6388cfce68c3bc74e12e86)`text 100x100`, say

lpvm

[18:23](#msg5a6389176117191e618ed03e)fine!

[18:24](#msg5a63894ece68c3bc74e1307c)well the gui part is done, just a little tweak. Thank you very much @9214 You've done it, not me. Now, on to the logic part, easier for me

9214

[18:25](#msg5a6389875ade18be399f5719)@lpvm :+1:

[18:25](#msg5a6389ac9cdc721e4fa7f56d)gtg then, ciao!

lpvm

[18:33](#msg5a638b8dae53c1590311f834)bye bye

abdllhygt

[18:33](#msg5a638b95ce68c3bc74e13b84)@BeardPower which crypto-money is good for beginner? doc of iota isn't good for me :/

lpvm

[18:33](#msg5a638b97ce68c3bc74e13b88)have a nice day/evening/night

abdllhygt

[18:41](#msg5a638d5d517037a212d07fa8)finally i find `sendTransfer()` func. This is bad doc, i need a teacher :/

lpvm

[18:52](#msg5a638fd95ade18be399f7349)is there a `cond` (of lisps) to evaluate multiple conditions?

ne1uno

[19:03](#msg5a63927dba39a53f1a3e1a5e)case looks similar

BeardPower

[21:02](#msg5a63ae6ace68c3bc74e1d81b)@abdllhygt You mean for development or trading/investing?

abdllhygt

[21:03](#msg5a63aea2517037a212d1165e)development @BeardPower

[21:04](#msg5a63aedf517037a212d11856)i want to know "send, history, balance..." with a programming language

BeardPower

[21:13](#msg5a63b0f89cdc721e4fa8a9ad)IOTA does not have the best docs, but it's very simple. You can check out Neo, Nem or Cardano.

[21:13](#msg5a63b10b517037a212d120d4)They have better docs and more libs.

[21:20](#msg5a63b284ae53c1590312a289)https://iota.readme.io/v1.2.0/reference

[21:24](#msg5a63b398e0141226506e10d1)attachToTangle, getBalances, getTrytes, findTransactions

[21:37](#msg5a63b6b4ba39a53f1a3eb39e)You can also use postman.

are1000

[21:40](#msg5a63b73f9cdc721e4fa8c3e7)@BeardPower two addresses generated from the same seed point to the same account?

BeardPower

[21:48](#msg5a63b92dae53c1590312bea6)@are1000 Yes, as the address is the same. IOTA wallets are directly generated based on the see. The seed is your passphrase.  
See here: https://iotaseed.io/

[21:50](#msg5a63b998517037a212d14543)It's the same like a random generator: it will always generate the same "random numbers", with the same seed. That's why you always have to init a seed based on time, background noise, radiation, any real randomness.

[21:57](#msg5a63bb499cdc721e4fa8d482)You can check out this fine video on seeds and their specialty. It's possible to increment the seed, so you only see a part of your receiving wallet addresses.  
https://www.youtube.com/watch?time\_continue=88&amp;v=olOgzNWJk8Q

[22:06](#msg5a63bd489cdc721e4fa8db65)BUT this is how IOTA works:  
https://matthewwinstonjohnson.gitbooks.io/iota-guide-and-faq/getting-started/dl-wallet/what-is-my-seed.html

[22:11](#msg5a63be9b6117191e618fb746)&gt;The addresses generated to receive and transfer are associated with your seed and increment the first character by their index, so when you increment it manually you will be able to access the addresses with indexes 1 - 10, not anymore 0 - 10.

Someone would need to guess the seed of your wallet address, which is highly improbable.

greggirwin

[22:42](#msg5a63c5e7ce68c3bc74e2354a)For continued chat on specific assistance, maybe move to red/help. Red/welcome is a good place to start, but for deeper, ongoing work, red/help is better.

[22:43](#msg5a63c5fcba39a53f1a3ef886)Looks like @9214 has an MVP streak going!

BeardPower

[22:51](#msg5a63c7d7517037a212d18239)@greggirwin Agreed. This topic should be continued in red/blockchain. It's not really related to Red, but a general information on blockchain development.

greggirwin

[22:52](#msg5a63c81c9cdc721e4fa90868)Right, that's the best room for that. The View/GUI stuff could move to red/help.

## Sunday 21st January, 2018

lpvm

[01:07](#msg5a63e7d69cdc721e4fa990bc)hi, when compiling a script, there's some files `libRedRT.dll` `...defs.r` `...-include.red`. I want to send the compiled program to another person, do I need to send all these files or just the `.exe`?

BillDStrong

[03:56](#msg5a640f58ba39a53f1a400532)@lpvm What compilation mode do you need? If you are compiling using -c, or development mode, then you nee to ship the dll. If you are compiling in -r, or release mode, the dll code will be built into the exe file.

[03:57](#msg5a640fbfba39a53f1a40068d)Currently, -c is a way to cut down compilation time during development, since the code in libred.dll won't change unless you update the compiler.

9214

[08:07](#msg5a644a39290a1f4561b5fbbd)@lpvm if you want a stand-alone executable, use `-r` flag rather than `-c`. And if current beta (alpha?) compiler can't produce a working exe, add `-e` option.

[08:08](#msg5a644a6aae53c1590314ca4e)for cross compilation use `-t` flag, you can see the list of available targets with `red -h`

abdllhygt

[13:01](#msg5a648f25e014122650716193)@BeardPower thank you, i research now

lpvm

[22:20](#msg5a651237ce68c3bc74e789a5)Thanks @9214 and @BillDStrong .

## Monday 22nd January, 2018

gvolk0

[04:10](#msg5a6564196117191e61967165)Hi! Red n00b (rube?) here. What's the debugging story in Red? Just `probe` and `print`?

gltewalt

[04:29](#msg5a65689c6117191e61968086)`probe` `print` `??`

[04:30](#msg5a6568e8ae53c1590319aea6)https://github.com/red/red/wiki/Debugging

toomasv

[04:32](#msg5a6569646117191e61968362)@gltewalt :+1:  
@Cpt0r And if console tends to crash then `save`/`write` also.

gvolk0

[04:47](#msg5a656cd6517037a212d863a8)Ah geez... how'd I miss that. Been perusing all other links...

[04:58](#msg5a656f655ade18be39a73cf1)Is a stepping debugger in the pipeline? I'm surprised it doesn't exist, seems like it would be trivial given Red's expressive power.

greggirwin

[05:53](#msg5a657c5a5ade18be39a77364)More debugging tools will certainly come. When you find `parse` and start playing with that, you'll see that there may be specific ways to debug in domains as well.

Red's design makes some things very easy, and other things...a little trickier. That is, we can't think of it like we would just any other language. We can play around with `do/next` and think that's all it would take, but there's more to it or, you're right, it would already be there.

gvolk0

[06:23](#msg5a6583535a9ebe4f75b98dc4)Interesting, thanks.

9214

[07:20](#msg5a6590a45ade18be39a7d07b)`trace` should be enough IMO, line-by-line stepping ain't really fit (as there no lines, strictly speaking)

endo64

[12:20](#msg5a65d6f398927d57451eb9e9)I remember that there was `trace` flag in 68000 CPU's status register, that when set, stops and calls an exception handler after each instruction that CPU executed, hence it was so easy to debug assembly codes using an monitor/debugger like AsmOne, AsmPro, Trash'mOne or similar, line by line while keeping an eye on the registers and memory.. Lovely days

greggirwin

[13:48](#msg5a65ebc55ade18be39a9f041)I would like to see something like DTrace capabilities, so we can instrument and query.

We have different environments. Languages that are purely interpreted or purely compiled can look at things only one way. Red has to look at things in both ways, as a start. And then we should step back for a moment and ask if a step debugger is what we really want. If it's easy, and doesn't conflict with anything else, sure. It will make people comfortable, and we can limit its features to keep it simple. e.g., in some langs you can edit code while stopped on a breakpoint, in others you have to restart. In VB it was added later to allow continuing.

dander

[18:59](#msg5a6634a098927d5745212474)I think that for experienced developers, tracing/instrumentation is likely enough, but for people who are exploring/learning, there are huge gains to shortening the test/observe cycle as much as possible. I think that going as far as we can toward live-coding could be a killer feature of Red. I think there are some overlaps with that and a debugger (the edit and continue feature). Sometimes it's hard to understand what's going on without being able to explore the state of an application, so the ability to pause and step can be very useful, but it's hard to say how essential it is without the other parts in place. I do think many people would expect it, but that doesn't mean they \_need_ it.

greggirwin

[19:44](#msg5a663f055a9ebe4f75be3ff4)Right, and we can provide tools that cover a lot of basic use cases, which may not work for gurus doing dynamic binding, but are fine for people using it like they would VB.

## Tuesday 23th January, 2018

geekyi

[17:34](#msg5a6772136117191e61a20ae7):eyes:

9214

[17:34](#msg5a67723f0ad3e04b1b5bcfea)`( o)( o)`

geekyi

[17:46](#msg5a6774f0e0141226508113c5)As a newbie to Red this year, wondering what's new :^)

greggirwin

[17:59](#msg5a6778080ad3e04b1b5bf5ac)@geekyi, you're not \*really* new. But the newest thing, as I think you've seen, is the blockchain work and the ICO which garnered enough interest that we feel Red can move forward with confidence, and more resources.

[18:00](#msg5a677847ce68c3bc74f46696)There's a lot of planning to do now, but the dust should settle soon, and we'll get more info.

rebolek

[18:01](#msg5a67785e98927d5745281d30)let’s hope that’s true

9214

[18:01](#msg5a67787e98927d5745281e06)@geekyi

Let me tell you a story about a little language that could.  
Once upon a time, deep deep in the bloatware swamp, there was a little language that could. He was interpreting his way across all the &gt;1MB mess... `bind` `bind`, `parse` `parse`. This little languages' mission was to take some DSLs and a homoiconic pay`load`, over the mountain to the `1.0` release. Needless to say, there was plenty of opposition! You think that stopped the little language that could? No siree bob. He just kept interpreting along...`bind` `bind`, `parse` `parse`. Not even when they climbed aboard the issue tracker and breeded all kinds of bugs, and hacktoberfest and sleepless nights with gdb were drippin out of Fullstack office windows. Think that stopped the language that could? Damn skippy... he just kept interpreting along... `bind` `bind`, `parse` `parse`...

Wasn't until @dockimbel rigged the roadmap with blockchain announcement as the little language was making his way across the `0.6.3`. :boom: ...an `ICO`splosion happened! And tears of joy, and happiness, and praising, and :rainbow: was everywhere. @greggirwin come crawling out the back with both ICO rounds missing. VB community's baby boy, and he looked up and me and he said," @9214 I can't feel my REDs!." And I said," @greggirwin , \*\*they aint there\*\*." And I looked down and ICO website's little red bar was all at 0. And I said," @greggirwin , its 4 major releases to the nearest Linux GUI support, and unless you can fix the #3156 you aint gonna make it!" All of the sudden, newcomers were all over the place. Just me and my REPL, and I had no other alternative, but to help everyone...  
https://www.youtube.com/watch?v=mrhSEdLOD5M

dander

[18:16](#msg5a677bf8c95f22546dd63e8a):clap: :clap:

greggirwin

[18:21](#msg5a677d18e014122650814815)@9214, I haven't seen the movie, but that made my day. I'm off now to create some static web content... `markdownhugomarkdownhugo` for the post ICO aftermath. When the smoke clears from the blockpocalypse, just enough to see @dockimbel emerge, defiant, and the bloatwares all quail at the sight.

https://www.google.com/url?sa=i&amp;rct=j&amp;q=&amp;esrc=s&amp;source=images&amp;cd=&amp;cad=rja&amp;uact=8&amp;ved=0ahUKEwiXr7Tc2e7YAhVG16QKHQQ-A90QjRwIBw&amp;url=http%3A%2F%2Fhaphazardstuff.com%2Fmovie-cliches-the-explosion-walk%2F&amp;psig=AOvVaw1XNabvXJlUxKbTmqYP\_wF2&amp;ust=1516817966015518

rebolek

[18:33](#msg5a677ff36117191e61a25faf)I hope the smoke clears very soon and we can get some bugfixes and improvements.

greggirwin

[18:35](#msg5a678063c95f22546dd65d00)Yes, there are a couple outstanding things that are important to fix. Bad timing for that regression to slip in.

9214

[18:35](#msg5a67807b6117191e61a2623a)@greggirwin maybe we should just revert the commit for now?

greggirwin

[18:36](#msg5a67809a98927d5745284e2d)I thought about that too. Will propose it do Doc.

9214

[18:36](#msg5a67809f517037a212e4658a)IMO the bug with parens that this commit fixed ain't that critical than what we have now

[18:36](#msg5a6780aece68c3bc74f49923)or just comment it out and set TODO

rebolek

[18:37](#msg5a6780fd5a9ebe4f75c54cc4)It’s not just \*that* bug (even if it's very serious IMO), but I guess I’m not the only one, who can’t wait for simple GC.

9214

[18:38](#msg5a67810dc95f22546dd660a1):D

[18:38](#msg5a678112517037a212e46953)here he goes again

rebolek

[18:40](#msg5a678198ae53c1590325db27)Well, doing the stats, I hit the limit too often and have to do some tricks.

greggirwin

[18:40](#msg5a6781b15a9ebe4f75c550b2):^) Yeah, we're all anxious. Tough when a couple things are so close. I imagine it's even harder for Doc. After the ICO work is wrapped up, we should hear some plans and maybe get an updated roadmap and timelines.

[18:41](#msg5a6781c8c95f22546dd6641f)I think GC will be very important for new people showing up as well.

rebolek

[18:41](#msg5a6781d6c95f22546dd66482)And don’t let me start on load/save bug that forces to fix one file manually \*every* time.

[18:41](#msg5a6781e50ad3e04b1b5c2d88)But I understand the importance of ICO.

[18:42](#msg5a6782090ad3e04b1b5c2e47)It’s just those little things that bugs me :)

greggirwin

[18:43](#msg5a67823c5a9ebe4f75c55363)Which load/save bug @rebolek? I can't find it in a quick search.

rebolek

[18:54](#msg5a6784cac95f22546dd676cd)@greggirwin it’s not reported yet, I haven’t got time to isolate it. Basically there’s a situation, when `{` in `"` does not get escaped and can’t be loaded back. I don’t want to talk about it until I isolate and report it.

greggirwin

[19:11](#msg5a6788c9517037a212e499b6)OK, thanks.

gltewalt

[19:50](#msg5a67921b6117191e61a2cd6f)Could just comment out the line in 3156. stack/set-last is wrong. That’s for root level. Not for nested.  
It says as much in comments in another function in interpreter.reds

9214

[19:51](#msg5a679251ae53c159032645b9)@gltewalt how is your beard growing on?

gltewalt

[19:52](#msg5a6792910ad3e04b1b5c922f)Better than I thought but I still have wild hairs

9214

[19:54](#msg5a6792e6c95f22546dd6cc42)`comb select hairs-of beard 'wild`

Rebolforces

[22:44](#msg5a67bae8517037a212e5cf0d)hello.  
Lost sheep is returning home  
\--Allen K  
:-)

greggirwin

[22:45](#msg5a67bb0d5a9ebe4f75c6b577)Alllllllleeeeennnnn! WELCOME! Great to see you.

Rebolforces

[22:45](#msg5a67bb1fae53c159032735ed)Hi Gregg, good to see you.

[22:46](#msg5a67bb63517037a212e5d1c4)I missed the float due to travel, but will try and get in before end of month at least.

## Wednesday 24th January, 2018

PeterWAWood

[03:27](#msg5a67fd24ae53c15903284db0)Welcome @Rebolforces

endo64

[06:57](#msg5a682e72c95f22546dd9aada)@Rebolforces It's always nice to see old Rebolers joining to Red (even I didn't meet anyone in person, I know most of you guys way back from 2001), I hope BrianH, Ladislav, Gabrielle and others will join too.

[09:45](#msg5a6855d2d9f895c360544562)@Ungaretti I see that you updated Red Notebook, is there any change or commit log in Gitbook to see what part of the document updated?

geekyi

[16:19](#msg5a68b217517037a212eb023c)@9214 such poetry!

toomasv

[16:56](#msg5a68bad8d9f895c36056cee6)@9214 Ye are a literary man!

9214

[16:57](#msg5a68bb0c5a9ebe4f75cc2240)@greggirwin might say for sure, since he partially knows what I'm up to ;)

greggirwin

[17:11](#msg5a68be4dd9f895c36056e4e7)I say yes. Though I deny knowing \*anything\*.

9214

[17:12](#msg5a68be76d9f895c36056e6da):hear\_no\_evil: :see\_no\_evil: :speak\_no\_evil:

greggirwin

[17:12](#msg5a68be946117191e61a92e7a)No, no. I mean \*anything\*. At all.

maximvl

[17:16](#msg5a68bf5c517037a212eb6460)@greggirwin well, apparently you know how to type ;)

greggirwin

[17:19](#msg5a68c00aae53c159032cbb13)I deny it.

[17:19](#msg5a68c018ae53c159032cbb66)But I've been wrong before.

9214

[17:19](#msg5a68c0340ad3e04b1b62d1b9)you're extremely mysterious today

maximvl

[17:21](#msg5a68c080ce68c3bc74fb34a2)so you know what's wrong and what's right if you claim you've been wrong ;)

[17:21](#msg5a68c08ace68c3bc74fb34c4)you know too much, Gregg

greggirwin

[17:23](#msg5a68c12eae53c159032cc4c9)I hope someday to be an \*international* man of mystery. OK, that's not true, I don't enjoy traveling all that much. Back to work now!

9214

[17:25](#msg5a68c16cd9f895c36056fa6c)\[!\[uuF9q.jpg](https://files.gitter.im/red/red/welcome/99Ot/thumb/uuF9q.jpg)](https://files.gitter.im/red/red/welcome/99Ot/uuF9q.jpg)

greggirwin

[17:27](#msg5a68c1fac95f22546ddd39c0)In my best Jack Nicholson: Where does he get those marvelous memes?

toomasv

[17:34](#msg5a68c3b7ce68c3bc74fb4ca3)@9214 Literate programming?

9214

[17:36](#msg5a68c401c95f22546ddd46af)well, kinda, btw I'm surprised that Gregg considered my post as an example of LP

greggirwin

[17:39](#msg5a68c4e598927d57452f3c20)LP, for me, has an artificial requirement about intermixing the content. I don't think it should have to be that way. One reason I want a `ref!` type, is so we can cross ref and link between "views".

Ungaretti

[19:19](#msg5a68dc50ae53c159032d7038)@endo64 I'm not aware of any commit log in Gitbook, I'll check. Anyway, it was a minor change. I removed a comment about the usefulness of layouts . I found good use for them after all.

[19:26](#msg5a68ddd55a9ebe4f75ccfff6)I have to say I'm a bit disappointed with Gitbook.

greggirwin

[21:38](#msg5a68fcebd9f895c360587548)@Ungaretti, when you find a great publishing setup, let us know. We're all looking.

nd9600

[21:41](#msg5a68fd91c95f22546ddec3ce)How would I go about catching an `EOF` in a prompt that's running in a `forever` block? Something along the lines of http://www.rebol.net/cookbook/recipes/0060.html ?

[21:41](#msg5a68fd9f4a6b0dd32b424af5)The loop's just `forever [print ask "user>"]`

9214

[21:43](#msg5a68fe01ce68c3bc74fcc4f9)@nd9600 `forever [print input: ask "user>" if input = newline [break]]` ?

nd9600

[21:51](#msg5a68ffd80ad3e04b1b646b49)`input: ask "user>"` == "q" apparently, if you press CTRL-D

[21:51](#msg5a68ffeac95f22546dded478)or CTRL-C

9214

[21:51](#msg5a68fffeae53c159032e5664)yeah, this was discussed some time back (@maximvl ?)

[21:52](#msg5a6900175a9ebe4f75cddec0)these key combinations seems to be mapped to `q` (`quit` shortcut) function

[21:52](#msg5a690035517037a212ed1ea9)might be worth a ticket if it isn't reported already

nd9600

[22:00](#msg5a690217517037a212ed28ec)It means it's impossible to exit a forever loop as far as I can tell

9214

[22:01](#msg5a6902294a6b0dd32b4263ac)@nd9600 uhm, have you tried to press escape?

nd9600

[22:01](#msg5a690248ae53c159032e6148)Yep

9214

[22:02](#msg5a69027c98927d574530c1bd)yeah, I see

nd9600

[22:04](#msg5a6902f2c95f22546ddee6c0)You can check if the character == "^[" there though

[22:04](#msg5a6902fa517037a212ed2e11)That works ok

[22:29](#msg5a6908b9c95f22546ddf0380)Can you suppress the banner that gets printed everytime you open the console?

[22:29](#msg5a6908c20ad3e04b1b64a1b5)https://github.com/red/red/search?utf8=%E2%9C%93&amp;q=no-banner&amp;type=

[22:39](#msg5a690b2a0ad3e04b1b64afa7)`system/options/quiet: true` at the top of the script seems to do it

gltewalt

[22:56](#msg5a690f09517037a212ed7090)Can’t you use `until` instead of forever?

nd9600

[22:56](#msg5a690f1aae53c159032eac37)I suppose so

[23:11](#msg5a69128c4a6b0dd32b42be64)The Red implementation of https://github.com/kanaka/mal will have to wait

gltewalt

[23:18](#msg5a691447ae53c159032ec88f)I think @maximvl did one. Or was working on one

nd9600

[23:47](#msg5a691b0c4a6b0dd32b42e94f)Maybe he's just not pushed it to https://github.com/maximvl/mal yet

[23:50](#msg5a691bd84a6b0dd32b42ecd3)It seems like issues https://github.com/red/red/issues/543 , #1547 , #2356 and #2531 combine to make this hard to do because the mal test harness either can't pass input to the Red script, or isn't getting the output back for whatever reason

gltewalt

[23:52](#msg5a691c206117191e61ab725d)He did run into issues but I can’t remember which issues

## Thursday 25th January, 2018

maximvl

[09:16](#msg5a69a069ce68c3bc74ffa9b9)I have some stuff done, yes, I ran into problem with running tests because the way they run Red it crashes right away

[09:16](#msg5a69a084c95f22546de1b08e)maybe it was fixed, I need to check on latest versions

nd9600

[18:12](#msg5a6a1dfcce68c3bc7402b1e8)@maximvl I was able to run the tests fine, but they all fail

[18:12](#msg5a6a1e26ae53c15903345801)take a look at `run` and `red.sh` in https://github.com/nd9600/mal/tree/master/red

[18:13](#msg5a6a1e3c6117191e61b0cf92)You have to run red through a script to fix the encap issue

maximvl

[20:02](#msg5a6a37d15a9ebe4f75d4a68c)@nd9600 yeah, I think this is what stopped me the encap issue and script

## Friday 26th January, 2018

towny802

[03:19](#msg5a6a9e32517037a212f5af3f)Can we get this on brew?

9214

[08:25](#msg5a6ae5df0ad3e04b1b6e2a45)@towny802 there're instructions in readme on how to install Red with brew, if that's what you mean

nd9600

[21:34](#msg5a6b9f0298927d57453ebfce)Can you evaluate when you define it, without having to assign it to a variable first?  
Like `function [x][x + 1] 2` to give `3`

9214

[21:35](#msg5a6b9f234a6b0dd32b509fd9)@nd9600

```
>> do reduce [func [x][x + 1] 2]
== 3
```

nd9600

[21:36](#msg5a6b9f4b98927d57453ec168)Shame the syntax is slightly awkward for that

9214

[21:36](#msg5a6b9f704a6b0dd32b50a0e9)@nd9600

```
>> apply: func [f x][f x]
== func [f x][f x]
>> apply func [x][x + 1] 2
== 3
```

nd9600

[21:37](#msg5a6b9f804a6b0dd32b50a144)perfect, thanks

9214

[21:37](#msg5a6b9fb4c95f22546ded1660)@nd9600 note that it's defined only for monadic functions

[21:39](#msg5a6ba00040259f1a33b065d0)

```
text
>> apply: func [f args][do head insert args 'f]
== func [f args][do head insert args 'f]
>> apply :add [40 2]
== 42
```

nd9600

[21:40](#msg5a6ba0625a9ebe4f75dc7381)I'm always amazed with what you can do with Red

[21:43](#msg5a6ba0fe494bd0f5302c9d4a)`apply: func [f args][do append copy [f] args]` might work there too

9214

[21:44](#msg5a6ba13dce68c3bc740af527)`[do compose [f (args)]]`

[21:45](#msg5a6ba171ce68c3bc740af66c)whatever floats your boat

## Saturday 27th January, 2018

towny802

[07:34](#msg5a6c2b945a9ebe4f75deb3e2)@9214 oops thanks!

9214

[10:06](#msg5a6c4f26ce68c3bc740da615)@towny802 actually not in readme, but \[here](https://github.com/red/Homebrew-red)

Ungaretti

[12:53](#msg5a6c7641e217167e2c08bec4)@endo64 I added a log of changes (starting today) on the introduction of "Red Language Notebook". I didn't realize I had subscribers that were notified of every change.

nd9600

[14:23](#msg5a6c8b605a9ebe4f75e05188)Should `[make object! []] == reduce [context []]` be false?  
I found last night that defining a block to have an object in it from the start behaves different from appending the object

[14:23](#msg5a6c8b705a9ebe4f75e05196)The LHS there has 3 elements, the RHS just 1

9214

[14:24](#msg5a6c8b830ad3e04b1b763667)@nd9600  
uhm

[14:24](#msg5a6c8b8dae53c15903407336)you're not defining object in a block in the first case

[14:24](#msg5a6c8b92494bd0f53030692a)you're creating block of 3 values

[14:24](#msg5a6c8ba14a6b0dd32b5464e4)`reduce [make object! []]`

nd9600

[14:25](#msg5a6c8bd1ce68c3bc740ea6f2)Oh right

9214

[14:25](#msg5a6c8bdb5a9ebe4f75e053b6)obviously, block with 2 words and 1 block ain't equal to block with one object

nd9600

[14:25](#msg5a6c8bef494bd0f530306a37)They just happen to look the same without reducing

[14:26](#msg5a6c8bf84a6b0dd32b5465b6)Ok that seems very obvious in hindsight

toomasv

[19:27](#msg5a6cd29598927d574543cc83)This seems to work:

```
>> (reduce [make object! []]) == reduce [context []]
== true
```

As well as this:

```
>> (make object! []) == context []
== true
```

9214

[19:28](#msg5a6cd2d3ae53c1590341bd9d)

```
text
>> ?? context
context: func [spec [block!]][make object! spec]
```

toomasv

[19:29](#msg5a6cd32a6117191e61be34de)The affirmation is about parens :wink:

9214

[19:31](#msg5a6cd3815a9ebe4f75e1a550)ah, okay

endo64

[23:44](#msg5a6d0ef540259f1a33b68bb0)@Ungaretti I get email for each change :)

## Sunday 28th January, 2018

towny802

[01:04](#msg5a6d21b16117191e61bf7d9a)Does Red have a non-mutating string concatenation? I'm reading http://redprogramming.com/Getting%20Started.html#section-3.5 , which says append is the concatenating function, but actually operates on its first argument. The other option is to do something like \[ print \[ str1 str2]] but that leaves a space between them. Just thought I'd ask what the right way to do that is, thanks!

9214

[01:05](#msg5a6d21ca98927d5745451152)@towny802 `copy`

towny802

[01:05](#msg5a6d21d76117191e61bf7e32)Awesome, I figured it was something, thanks

9214

[01:05](#msg5a6d21ea5a9ebe4f75e2f77d)@towny802

```
>> x: "str"
== "str"
>> y: "ing"
== "ing"
>> append x y
== "string"
>> x
== "string"
>> x: "str"
== "str"
>> append copy x y
== "string"
>> x
== "str"
```

towny802

[01:06](#msg5a6d21fdae53c159034303b3)Let me show you what I did, one sec

[01:08](#msg5a6d2294494bd0f530330b64)&gt;&gt; letters: \["a" "b"]  
\== \["a" "b"]  
&gt;&gt; foreach a letters \[ foreach b letters \[ print \[append a b]]  
\[ ]  
aa  
aab  
baab  
baabbaab  
&gt;&gt;

[01:08](#msg5a6d22a9e217167e2c0bb17c)ohhh wait

[01:09](#msg5a6d22b9ae53c15903430619)I see, thanks

[01:09](#msg5a6d22bb40259f1a33b6d64a)that's clever

nd9600

[19:55](#msg5a6e2ac34a6b0dd32b5b56c2)I'm having a bit of a problem with a map! inside an object! :

```
e: make object! [m: make map! []]
a: make e []
b: make e []

a/m/x: 1
probe b/m/x ; == 1
```

[19:56](#msg5a6e2add40259f1a33bb13a7)The map! inside 'b is changed, when I've only added to 'a

[19:56](#msg5a6e2af1ac509d207d8b1d37)I've tried putting `copy` everywhere but it hasn't made a difference

[19:57](#msg5a6e2b27e217167e2c0ff5f9)It seems to specifically be an issue with `map!`:

```
e: make object! [m: []]
a: make e []
b: make e []

append a/m 1
probe b/m ; == []
```

[19:57](#msg5a6e2b3098927d57454948e1)this doesn't have the same issue

endo64

[20:19](#msg5a6e305f40259f1a33bb2dfa)Same issue exists for `hash!` type:

```
>> e: make object! [m: make hash! [x: 1]] same? get in copy/deep e 'm get in copy/deep e 'm
== true
```

nd9600

[20:21](#msg5a6e30b198927d5745496763)

```
e: make object! [m: make map! []]
a: make e []
b: make e []

append a/m [1 2]
probe a/m
probe b/m
```

behaves as you'd expect in Rebol

[20:24](#msg5a6e319140259f1a33bb347d)

```
same? make e [] make e [] ; == false
```

though, so it looks like just the `map!` is the same

[20:38](#msg5a6e34e040259f1a33bb4668)The same problem happens if you make 'b from 'a: `b: make a []`

[20:43](#msg5a6e35f4ac509d207d8b51a3)

```
e: [make object! [m: make map! []]]
a: do e
b: do e
a/m/x: 1
probe b/m/x ; ==  none
```

So if you enclose making the object inside a block and then `do` the block, it's fine

[20:46](#msg5a6e36a15a9ebe4f75e78d2f)It's also fine if you return the `object!` from a function

endo64

[21:40](#msg5a6e4342ac509d207d8b9149)Nice findings, I couldn't find an issue on github, may be we should raise a ticket

## Monday 29th January, 2018

nd9600

[13:25](#msg5a6f20dcce68c3bc741a29a4)I've made #3218 for it

endo64

[15:41](#msg5a6f40a74a6b0dd32b60e898)@nd9600 Great, thanks.

## Tuesday 30th January, 2018

nd9600

[20:56](#msg5a70dbe14a6b0dd32b6a5339)How would you go about parsing an any-function! inside a block, like `parse [add 3 4] [any-function! integer! integer!]` ?

[20:56](#msg5a70dc01ce68c3bc7424534c)I can't figure out how to match any function at all, rather than just specific ones

rebolek

[20:57](#msg5a70dc1ce217167e2c1f3834)@nd9600 `add` is not a `function!`, but `word!`. You have to evaluate the word to get the function.

nd9600

[20:57](#msg5a70dc4498927d574558498d)Ah right. So many intricacies in Red

JacobGood1

[20:58](#msg5a70dc5fe217167e2c1f3a15)try `type? first [add 3 4]`

nd9600

[20:59](#msg5a70dcaae217167e2c1f3d1e)Yeah that'll get the type normally, I was just wondering how you would do it with `parse`

[20:59](#msg5a70dcc1e217167e2c1f3d75)Making a UFCS macro might be too big a task yet

endo64

[23:18](#msg5a70fd34e217167e2c2000f5)@nd9600 `>> parse reduce [:add 3 4] [any-function! integer! integer!]` would work.

## Wednesday 31st January, 2018

towny802

[03:08](#msg5a713333ac509d207d9b86a4)So, if anyone knows, can you tell me, is there a version of charset for iterating across a range? Or maybe just a num-to-char function I could use instead? Thanks!

ne1uno

[03:20](#msg5a713609ac509d207d9b9482)https://gist.github.com/toomasv has a nice range

towny802

[03:37](#msg5a713a0836de78850ccf3644)thanks!

toomasv

[04:39](#msg5a7148717dcd63481ffa82d6)@towny802 \[range](https://gist.github.com/toomasv/0e3244375afbedce89b3719c8be7eac0)

```
>> range #"a" #"f"
== [#"a" #"b" #"c" #"d" #"e" #"f"]
```

[05:05](#msg5a714eb4ac509d207d9bfcba)@towny802 Or you can use this for strictly increasing ranges:

```
chars: func [c1 c2 /local c][collect [repeat c 1 + to-integer c2 - c1 [keep c1 + c - 1]]]
>> chars #"a" #"h"
== [#"a" #"b" #"c" #"d" #"e" #"f" #"g" #"h"]
>> chars #"h" #"w"
== [#"h" #"i" #"j" #"k" #"l" #"m" #"n" #"o" #"p" #"q" #"r" #"s" #"t" #"u" #"v" #"w"]
```

Or this for both increasing and decreasing ranges:

```
chars': func [c1 c2 /local c d][
   collect [
      repeat c 1 + absolute d: (to-integer c2) - (to-integer c1) [
         keep either d > 0 [c1 + c - 1][c1 - c + 1]
]]]
>> chars' #"h" #"a"
== [#"h" #"g" #"f" #"e" #"d" #"c" #"b" #"a"]
>> chars' #"a" #"h"
== [#"a" #"b" #"c" #"d" #"e" #"f" #"g" #"h"]
```

[05:17](#msg5a71515936de78850ccf9c0e)Also, for increasing ranges:

```
chars'': func [c1 c2 /local c i][
   c: charset compose [(c1) - (c2)] 
   collect [repeat i length? c [if c/:i [keep to-char i]]]
]
```

9214

[06:17](#msg5a715f8398927d57455ab6ef)@nd9600

```
>> parse [add 3 4][set f word! (all [any-function? get f arity: 2]) arity skip]
== true
```

[06:18](#msg5a715fa57dcd63481ffaef8d)https://github.com/9214/pants/blob/master/red/arity-of.red

[06:19](#msg5a715fe6ce68c3bc7426c26b)@rebolek you did something similar to UFCS some time ago I believe?

[06:19](#msg5a715ffbe217167e2c21d04b)with path notation, a la `[1 2 3]/reverse/next`

rebolek

[06:23](#msg5a7160d7ce68c3bc7426c783)@9214 yes, almost.

[06:27](#msg5a7161e56117191e61d56a64)There are some limitations, `path!` must start with word, so above example won't work.

9214

[06:28](#msg5a71620298927d57455ac39c)well, you can call it with `ufcs stuff my/fancy/path`

rebolek

[06:29](#msg5a7162324750541917473dc2)😀

[06:29](#msg5a716256ce68c3bc7426ce88)I also did `parse` variant that doesn't have these limitations.

9214

[06:31](#msg5a7162d436de78850ccff1fb)@toomasv you don't need to explicitly convert chars to integers btw

[06:34](#msg5a71638e98927d57455acbfb)though, I'm not sure if this one is a bug or a feature (the second case)

```
>> #"a" + 1
== #"b"
>> 1 + #"a"
== 98
```

rebolek

[06:55](#msg5a716856ce68c3bc7426eba6)IMO feature

endo64

[06:57](#msg5a7168d24750541917476123)it could be "safer" if it would return `char!` for both cases, `to integer!` can be used to when necessary.

toomasv

[07:00](#msg5a7169ab36de78850cd01394)@9214

&gt; you don't need to explicitly convert chars to integers btw

```
>> #"b" - #"a"
== #"^A"
>> #"a" - #"b"
*** Math Error: math or number overflow
*** Where: -
*** Stack:  

>> repeat i #"b" - #"a" [probe i] 
*** Script Error: repeat does not allow char! for its value argument
*** Where: repeat
*** Stack:
```

9214

[07:01](#msg5a7169be475054191747673e)hmmm

toomasv

[07:16](#msg5a716d4798927d57455afd62)&gt; There are some limitations, path! must start with word

You can to some limit fool it:

```
>> p: to-path [1 2]
== 1/2
>> type? p
== path!
>> p
== 1/2
```

But what is going on here?

```
>> m: #(1 [c d])
== #(
    1 [c d]
)
>> m/1/2
== d
>> to-path reduce ['m p]
== m/1/2
>> get to-path reduce ['m p]
== none
>> type? to-path reduce ['m p]
== path!
>> g: to-path reduce ['m p]
== m/1/2
>> g
== m/1/2
>> :g
== m/1/2
>> get g
== none
>> m/1/2
== d
```

9214

[07:18](#msg5a716da9ce68c3bc74270521)@toomasv here `1/2` counts as one element of the path

[07:18](#msg5a716db8e217167e2c22167c)they're not flatten-out, so to speak

toomasv

[07:19](#msg5a716df7e217167e2c221851)Ok, but why doesn't this part of path work? What's wrong there?

9214

[07:19](#msg5a716e0a494bd0f530495a05)because you're looking for literal `1/2` element

[07:19](#msg5a716e156117191e61d5ac2a)not `second thing of first element`

[07:22](#msg5a716eb3ac509d207d9c9a53)

```
text
>> x: compose [[this] (to path! [1 1]) that]
== [[this] 1/1 that]
>> x/1/1
== this
>> p: to path! [1 1]
== 1/1
>> get to path! reduce ['x p]
== that
```

toomasv

[07:23](#msg5a716ef26117191e61d5b0b1)Got it. Thanks!

9214

[07:35](#msg5a7171c8494bd0f530497110)@rebolek :neckbeard:

```
>> to path! [[1 2 3] 4]
== [1 2 3]/4
```

rebolek

[07:36](#msg5a7171f3e217167e2c222e3c):)

[07:39](#msg5a7172bf4a6b0dd32b6d2ff9)That is very practical ;)

greggirwin

[08:43](#msg5a71819b36de78850cd0a3c5)Interesting. Nenad and I talked a bit about this very path topic with a wise language designer just recently. :^)

rebolek

[08:46](#msg5a7182666117191e61d62308)anything more you can tell us about it? ;)

9214

[08:46](#msg5a71827ce217167e2c228e7a)wise language designers don't speak

[08:46](#msg5a718280475054191747f487)they, well, design

mydoghasworms

[08:47](#msg5a718289494bd0f53049d473)@rebolek That information will cost you some coin :-D

[08:47](#msg5a7182967dcd63481ffbb232)What is the currency used in the community now?

9214

[08:47](#msg5a7182a036de78850cd0ab34)emojis

[08:47](#msg5a7182a36117191e61d624e7):red\_circle:

rebolek

[08:47](#msg5a7182a6ce68c3bc74277933)@9214 then it must have been very interesting talk

9214

[08:48](#msg5a7182cc36de78850cd0ad38)@rebolek yes, basically, Nenad and Gregg asking some question, then Carl designs a dialect in which they can come up with an answer all by themselves

rebolek

[08:48](#msg5a7182d2e217167e2c2290f0)@mydoghasworms the only currency I have is code ;)

9214

[08:48](#msg5a7182d3475054191747f655)\*very* practical

greggirwin

[08:57](#msg5a7184f54a6b0dd32b6d974d)@rebolek, I can say we had some great chat, and learned some of Carl's current thoughts on language design. As we know, a few things changed when he did R3, based on what was learned from many years of watching Rebol is production use. There are some more changes he thinks could be made, and other things that he feels strongly about that should not.

It appears that Carl, like the rest of us, can't let Rebol go from his mind, even when working on other things.

9214

[08:58](#msg5a71853498927d57455b80c8)from his mind or from his heart?

greggirwin

[08:58](#msg5a7185387dcd63481ffbc2a1)I'm not trying to be mysterious, just respectful of him talking to us casually.

[08:59](#msg5a718562e217167e2c229f40)@9214, good point. I know Rebol will never leave \*my* heart, and it's not my baby.

rebolek

[09:00](#msg5a7185b94750541917480614)That's what I'm interested in, his thoughts on what can be done differently.

greggirwin

[09:01](#msg5a718603e217167e2c22a395)Some small things, and some bigger things. Maybe we could get him to write some thoughts down for us in the near future.

viayuve

[09:30](#msg5a718ca86117191e61d65eba)Hello newbie here how are you all...... ☺️

9214

[09:30](#msg5a718cbbe217167e2c22ce88)@viayuve alive and kicking

[09:30](#msg5a718cbd7dcd63481ffbf688)welcome ;)

viayuve

[09:45](#msg5a71901c36de78850cd0f8f5)I am trying few codes from different sites. Can anyone tell me how can I access gpedit.msc on windows.

9214

[09:48](#msg5a7190dd494bd0f5304a313e)@viayuve why are you asking it here?

viayuve

[09:48](#msg5a7190f398927d57455bc5be)where should I ask

9214

[09:49](#msg5a719110e217167e2c22e968)I mean, how gpedit is related to Red, why you need to get access to it?

viayuve

[09:50](#msg5a7191837dcd63481ffc14cd)very simple I am server admin so mostly I use is .bat to enable or disable some part of system now If I can just use red to access gpedit than I can make my life bit easier

rebolek

[09:52](#msg5a7191e5ac509d207d9d65d9)@9214 why not?

9214

[09:52](#msg5a7191fa494bd0f5304a38cd)@rebolek it wasn't clear what the problem is

[09:54](#msg5a71924d494bd0f5304a3c70)idk, depends on there `gpedit` is located, you might try to use `call` function

viayuve

[09:55](#msg5a719277ac509d207d9d68ed)I am thinking about to create small app that can handle all my task.

[09:55](#msg5a71928d494bd0f5304a3e11)okay let me try than

9214

[09:56](#msg5a7192c56117191e61d68952)our you can create a wrapper on top of batch scripts

viayuve

[09:58](#msg5a7193456117191e61d68c63)guys sample would be nice I am not a programmer.

9214

[09:59](#msg5a719368ce68c3bc7427e19b)`call "your shell command here"`

[09:59](#msg5a71937447505419174861de)e.g. `call "ping 8.8.8.8"`

rebolek

[09:59](#msg5a719392494bd0f5304a4621)I would like to help you, but I'm not using Windows fortunately. Is there a way to use `gpedit` from shell, or do you need to do everything with mouse?

9214

[10:00](#msg5a7193d16117191e61d68ff5)or maybe `call/show`

[10:02](#msg5a719419475054191748662c)it could be scripted from cmd I suppose  
https://msdn.microsoft.com/en-us/library/windows/desktop/aa814151(v=vs.85).aspx

viayuve

[10:03](#msg5a719456494bd0f5304a49de)yes you can access it and use .bat file to enable or disable some features. for clients.

[10:03](#msg5a71948d98927d57455bde59)why my antivirus not letting me run red ??

rebolek

[10:04](#msg5a71949ae217167e2c22fbfc)then you can write simple GUI with something like `view [button "delete all users" [call "delete-all-users.bat"]` I suppose.

9214

[10:04](#msg5a71949b36de78850cd11638)@viayuve it's a known problem with some AV vendors

[10:04](#msg5a7194b77dcd63481ffc27c5)I agree with @rebolek , I'd just created a GUI wrapper on top of existent batch scripts

[10:05](#msg5a7194d1ac509d207d9d781b)@viayuve https://github.com/red/red#anti-virus-false-positive

viayuve

[10:05](#msg5a7194d236de78850cd11800)okay let me try

9214

[10:05](#msg5a7194edac509d207d9d7942)rather `call "cmd your-batch-script.bat"` or something like that

[10:06](#msg5a71950b4a6b0dd32b6e00fb)ah, no, `call` already executes shell command

rebolek

[10:07](#msg5a71957298927d57455be4c6)Someone who uses Windows should have know better than me.

mydoghasworms

[10:12](#msg5a7196abe217167e2c23076a)@viayuve I thought you are trying to start gpedit.msc from Red. Is that it, or are you trying to change some settings to allow you to run Red?

[10:13](#msg5a7196c6e217167e2c23080c)I'm just asking because I have tried different incantations of `call` to bring up mmc with gpedit.msc and couldn't get it to work.

[10:13](#msg5a7196e07dcd63481ffc3458)@rebolek What OS are you running?

viayuve

[10:14](#msg5a7196fe7dcd63481ffc3553)nothing only gui used code view \[button "try" \[call "path to file"]]

rebolek

[10:15](#msg5a71975c98927d57455bf248)@mydoghasworms Linux at work and on my home laptop and macOS on my home desktop. I also have W10 in VM at home, to work on Red styles, because unfortunately Windows are best supported by Red.

viayuve

[10:16](#msg5a7197617dcd63481ffc37f1)@mydoghasworms if can access gpedit via red than I don't need to run lot of .bat file I guess or the solution @9214 gave use it as wrapper and call it using button might do trick

[10:17](#msg5a7197bcce68c3bc7427fddd)call is not executing .bat file @rebolek

[10:19](#msg5a7198317dcd63481ffc3d1d)if I just run call ".bat file path" it gives ==3728 nothing else

rebolek

[10:20](#msg5a719874ce68c3bc74280431)3728 is process ID, you should use something like `call/output "file.bat" s: ""` and then you can find output from call in `s`.

9214

[10:23](#msg5a71992bce68c3bc742806d1)`call/show`

[10:23](#msg5a719938e217167e2c23166b)or `call/shell`

[10:24](#msg5a7199424a6b0dd32b6e1798)dunno which is supported on Win

mydoghasworms

[10:26](#msg5a7199e236de78850cd13867)@rebolek Is it you that is doing the GTK bindings for Red for Linux?

9214

[10:26](#msg5a7199ef4a6b0dd32b6e1bc7):D

viayuve

[10:27](#msg5a719a0b4a6b0dd32b6e1c53)call/show opens up the exe and closes it. call/shell does same as call nothing only process ID the .bat file contain path to the .exe file to run it with different parameters like "demo1.exe -a -p x" so call/something able to run that exe with those parameters is it possible.

9214

[10:27](#msg5a719a11e217167e2c231b29)no, it's @rcqls

[10:28](#msg5a719a37494bd0f5304a6bde)@viayuve not sure what you mean

[10:28](#msg5a719a644750541917488df0)`call "system/specific/path/to/demo1.exe -a -p x"`? (or `call/shell` `call/show`, idk)

viayuve

[10:31](#msg5a719ae9ac509d207d9d9af2)call "path to exe -a -p x worked" cool

[10:31](#msg5a719b026117191e61d6bb44)but why .bat is not working ??

9214

[10:31](#msg5a719b15494bd0f5304a706d)@viayuve `call "cmd file.bat"`?

viayuve

[10:32](#msg5a719b2636de78850cd13ff8)ok now How can stop that process ??

9214

[10:32](#msg5a719b3fe217167e2c23227b)kill it by ID I guess

[10:33](#msg5a719b5e98927d57455c08ba)again with some specific Windows `call`

viayuve

[10:33](#msg5a719b7347505419174894d9)tried kill 3236 err kill has no valuer

9214

[10:33](#msg5a719b817dcd63481ffc4e91)uhm, not from Red

[10:33](#msg5a719b95ce68c3bc74281651)`call "some-windows-specific-command-to-kill-processess your-process-id"`

[10:34](#msg5a719bc8e217167e2c2325f8)http://tweaks.com/windows/39559/kill-processes-from-command-prompt/

[10:35](#msg5a719be96117191e61d6c29c)something like `call "taskkill /PID 3236 /F"`

viayuve

[10:38](#msg5a719cb74750541917489f01)call "cmd file.bat" is not working

9214

[10:40](#msg5a719d0fce68c3bc74282114)what about just `call "file"`?

[10:40](#msg5a719d306117191e61d6cab1)assuming you're in a directory where this file resides

[10:41](#msg5a719d754a6b0dd32b6e3006)or maybe this https://ss64.com/nt/start.html

viayuve

[10:44](#msg5a719e2198927d57455c1a86)call "file" worked

[10:45](#msg5a719e5b475054191748abf9)how can I catch that process id and put it in text box to kill it afterwards

9214

[10:47](#msg5a719eb54a6b0dd32b6e3913)@viayuve for example

```
view [t: text button "click" [t/data: call "ping 8.8.8.8"]]
```

[10:48](#msg5a719ee398927d57455c1f62)you can place two buttons for each process I think, one to launch and one to kill by saved PID

viayuve

[10:51](#msg5a719fb8494bd0f5304a8d17)thanks @9214 I will try it now

9214

[10:52](#msg5a71a005475054191748b69d)or "stateful" button, on first click it launches, on second it kills

viayuve

[10:53](#msg5a71a020ce68c3bc7428357c)how ??

[10:55](#msg5a71a094494bd0f5304a92ff)does space matter in program

9214

[10:55](#msg5a71a0a498927d57455c2b87)space?

viayuve

[10:55](#msg5a71a0b136de78850cd16423)like tabs and space

9214

[10:56](#msg5a71a0dbce68c3bc74283a5a)well, you can format code any way you want, but in some places at least one space should be used as separator

[10:56](#msg5a71a0e67dcd63481ffc6ed8)`1 + 2` is ok but `1+2` is not

[10:59](#msg5a71a18c36de78850cd16950)@viayuve

```
view/no-wait [
    b: button extra [flag: #[false]] "click" [
        print pick ["on" "off"] b/extra/flag: complement b/extra/flag 
    ]
]
```

rebolek

[11:07](#msg5a71a35836de78850cd175aa)@mydoghasworms no

viayuve

[11:09](#msg5a71a3f66117191e61d6f6db)view/no-wait [  
b: button extra \[flag #\[false]] "click" [  
t:text t/data\[pick \["on" "off"] b/extra/flag: complement b/extra/flag]  
]]  
why its not working t has no value

9214

[11:10](#msg5a71a41a36de78850cd17b14)you put `t: text` in the wrong place

[11:10](#msg5a71a42536de78850cd17b3b)try to move it above `b: button`

[11:11](#msg5a71a47498927d57455c45bf)you can use `face` instead of `b` and get rid of `b:`

```
view/no-wait [
    t: text
    button extra [flag: #[false]] "click" [
        t/text: pick ["on" "off"] face/extra/flag: complement face/extra/flag 
    ]
]
```

mydoghasworms

[11:18](#msg5a71a5f87dcd63481ffc928a)@rebolek OK, I was just curious. I run Linux where I can and Windows where I have to. I cannot wait for GUI support for Linux, if that ever materializes.

rebolek

[11:19](#msg5a71a650ac509d207d9de835)@mydoghasworms I hope it will. When there will be Red wallet, I expect higher demand for Linux version.

mydoghasworms

[11:23](#msg5a71a72b494bd0f5304abdb4)It seems like it's going to take forever :worried:

rebolek

[11:24](#msg5a71a767494bd0f5304abedc)We must hope! :)

9214

[11:24](#msg5a71a77498927d57455c58a1)and tip

viayuve

[11:30](#msg5a71a8e26117191e61d7153b)how can  
&gt; you can use `face` instead of `b` and get rid of `b:`

```
view/no-wait [
    t: text
    button extra [flag: #[false]] "click" [
        t/text: pick ["on" "off"] face/extra/flag: complement face/extra/flag 
    ]
]
```

how can I add call to it and where what I am getting is only err

9214

[11:31](#msg5a71a8f8e217167e2c238054)@rebolek :point\_up: https://gitter.im/red/red/welcome?at=5a7185b94750541917480614  
&gt; \*\*Carl:\** drop all this crypto stuff. Listen to Bolek, he knows what he says. Linux GUI. 64 bit support, custom styles and all that.

rebolek

[11:31](#msg5a71a927e217167e2c238181)please...

9214

[11:33](#msg5a71a9a1ac509d207d9dfdca)@viayuve something like

```
view/no-wait [
    t: text
    button extra [flag: #[false]] "click" [
        either flag [
            t/data: call "launch your stuff and get the PID"
        ][
            clear t/data
            call rejoin ["taskkill /PID" space t/data space "something idk"]
        ]
        face/extra/flag: complement face/extra/flag
    ]
]
```

[11:35](#msg5a71a9ea475054191748f6c3)perhaps it should be `flag: #[true]` instead

mydoghasworms

[11:36](#msg5a71aa4698927d57455c6d94)@9214 Here you go: :red\_circle:  
&gt; and tip

[11:36](#msg5a71aa57494bd0f5304ad287)What the heck. I'm feeling generous today: :red\_circle: :red\_circle: :red\_circle: :red\_circle:

[11:37](#msg5a71aa5c475054191748fa2f)Go buy yourself something nice.

rebolek

[11:37](#msg5a71aa6398927d57455c6e34):)

9214

[11:37](#msg5a71aa84ac509d207d9e02c6)yeah, let me just print out this red pebbles and convince people that this is our money of the future

[11:38](#msg5a71aa9c36de78850cd1a4e6)perhaps I should use 3d printer instead...

viayuve

[11:39](#msg5a71aafa7dcd63481ffcb23a)Script Error: flag has no value  
\*\** Where: either  
\*\** Stack: do-actor do-safe

9214

[11:40](#msg5a71ab2fe217167e2c2391b8)@viayuve and you just copied my code above?

viayuve

[11:41](#msg5a71ab4d494bd0f5304ad7e0)yes but changed line 3 where it was false

9214

[11:41](#msg5a71ab59475054191749013c)perhaps `#[...]` syntax is not supported in older versions

[11:41](#msg5a71ab8336de78850cd1aaef)you've changed it to `flag: true` or to `flag: #[true]`?

viayuve

[11:42](#msg5a71aba5ce68c3bc74288113)flag: #\[true]

rebolek

[11:43](#msg5a71abdfac509d207d9e0a77)tipping makes no sense if it's not recorded in the blockchain:

```
>> redchain: func [chain action][append chain checksum mold chain 'SHA256 append/only chain action]
== func [chain action][append chain checksum mold chain 'SHA256 append/only chain action]
>> chain: []
== []
>> redchain chain [tip @9214 10 coins]
== [#{
4F53CDA18C2BAA0C0354BB5F9A3ECBE5ED12AB4D8E11BA873C2F11161202B945
} [tip @9214 10 coi
```

9214

[11:44](#msg5a71ac374750541917490592)@viayuve could you please try with latest build from http://static.red-lang.org/dl/auto/win/red-latest.exe ?

viayuve

[11:45](#msg5a71ac4f36de78850cd1afca)with flag: true its still &gt;&gt; \*\** Script Error: flag has no value  
\*\** Where: either  
\*\** Stack: do-actor do-safe

[11:45](#msg5a71ac51ac509d207d9e0df5)sure

[11:46](#msg5a71acade217167e2c239ba4)same error &gt;&gt; \*\** Script Error: flag has no value  
\*\** Where: either  
\*\** Stack: do-actor do-safe

mydoghasworms

[11:47](#msg5a71ace436de78850cd1b454)@rebolek :-) :+1:

9214

[11:48](#msg5a71acf84750541917490b6e)@viayuve does this prints something in Red console when you click on button?

```
view/no-wait [
    button extra [flag: true] "click" [
        probe face/extra/flag
    ]
]
```

viayuve

[11:49](#msg5a71ad2d4a6b0dd32b6e9290)why do i have to close red console after errs

9214

[11:49](#msg5a71ad3b6117191e61d7372a)you don't have to

viayuve

[11:49](#msg5a71ad48e217167e2c239fa6)printing true

[11:50](#msg5a71ad684a6b0dd32b6e93fa)on windows 10 pro latest build

9214

[11:50](#msg5a71ad6fe217167e2c23a0d6)ah, jeez

[11:50](#msg5a71ad774750541917490eae)there's a mistake in my code, sorry

[11:50](#msg5a71ad827dcd63481ffcc1e0)`either face/extra/flag` instead of just `either flag`

[11:51](#msg5a71adb7475054191749106b)i.e. something like

```
view/no-wait [
    t: text
    button extra [flag: true] "click" [
        either face/extra/flag [
            t/data: call "launch your stuff and get the PID"
        ][
            clear t/data
            call rejoin ["taskkill /PID" space t/data space "something idk"]
        ]
        face/extra/flag: complement face/extra/flag
    ]
]
```

you'll need to finish `call` parts by yourself

viayuve

[11:51](#msg5a71adde4a6b0dd32b6e9718)so i just used your core it printed true not there is no &gt;&gt; so I have to close console and reopen it

9214

[11:51](#msg5a71addf6117191e61d73b0f)`rejoin` just assembles a string from `taskkill ...` and PID that you've saved in `t/data`

[11:52](#msg5a71ae0147505419174911f6)@viayuve can't you just close the GUI window?

[11:52](#msg5a71ae0b98927d57455c85dc)the one with a button?

[11:53](#msg5a71ae1e7dcd63481ffcc4fb)and press `Ctrl + L` in Red console, in case you want clear everything

viayuve

[11:53](#msg5a71ae4736de78850cd1bd19)Script Error: complement does not allow word! for its value argument  
\*\** Where: complement  
\*\** Stack: do-actor do-safe

9214

[11:53](#msg5a71ae48ce68c3bc742894c2)ah, wait, and remove `clear t/data` thing

[11:54](#msg5a71ae6998927d57455c877f)oh jeez

[11:55](#msg5a71ae9d36de78850cd1bf5e)then it should be `flag: #[true]`

[11:55](#msg5a71aeb14a6b0dd32b6e9b49)I wonder why `extra` content isn't reduced :confused:

viayuve

[11:55](#msg5a71aeca7dcd63481ffcc925)Script Error: complement does not allow word! for its value argument  
\*\** Where: complement  
\*\** Stack: do-actor do-safe

9214

[11:56](#msg5a71aeeece68c3bc74289849)@viayuve have you changed the `flag:` part?

viayuve

[11:58](#msg5a71af6e4750541917491b28)ok worked but now .bat is not doing anything

9214

[11:58](#msg5a71af8398927d57455c8da3)can you show the code?

viayuve

[11:59](#msg5a71af927dcd63481ffccdc0)view/no-wait [  
t: text  
button extra \[flag: #\[true]] "click" [  
either face/extra/flag [  
t/data: call "C:\\Windows\\one\\One\\clay\\got"  
][  
call rejoin \["taskkill /PID" space t/data space "/F"]  
]  
face/extra/flag: complement face/extra/flag  
]  
]

9214

[12:01](#msg5a71afff36de78850cd1c8fa)hmmm

[12:01](#msg5a71b0157dcd63481ffcd0df)well, but `call` opens it?

viayuve

[12:03](#msg5a71b09c7dcd63481ffcd456)if i use red.exe in that path and just type red "got" than it works

[12:04](#msg5a71b0b97dcd63481ffcd4ef)call "C:\\Windows\\one\\One\\clay\\got" not working

[12:04](#msg5a71b0c736de78850cd1ce5f)call ''got" works

9214

[12:04](#msg5a71b0e96117191e61d75088)maybe there's some specific batch syntax for calling scripts by full path

viayuve

[12:05](#msg5a71b1276117191e61d7525d)you mean in red ??

9214

[12:06](#msg5a71b13cac509d207d9e2e11)no, I mean in windows shell

viayuve

[12:09](#msg5a71b2176117191e61d7572f)cool I don't know why but call "pathto file.bat" is working now :confused:

9214

[12:10](#msg5a71b2496117191e61d7583a)well, maybe omission of file type is allowed only for batch scripts in working directory

[12:11](#msg5a71b26ce217167e2c23bff7)i.e. `cd path/to/script` and then just `script` instead of `path/to/script.bat`

viayuve

[12:14](#msg5a71b30d494bd0f5304b093e)i think I will put all my scripts with red so path should not be an issue.

[12:18](#msg5a71b4127dcd63481ffceb0c)okay solution added two lines in batch

[12:18](#msg5a71b41798927d57455caacf)cd/

[12:18](#msg5a71b422e217167e2c23ca10)cd to path

9214

[12:18](#msg5a71b42698927d57455cabdb):+1:

viayuve

[12:19](#msg5a71b442ac509d207d9e40ff)thank you so much @9214

9214

[12:19](#msg5a71b45036de78850cd1e2e7)@viayuve you're welcome :)

viayuve

[12:30](#msg5a71b6f56117191e61d775bd)one more problem when we start process one pid is assigned to cmd and one for the program.exe that is running so when I kill the pid it only closes cmd not the program.exe

9214

[12:32](#msg5a71b77b36de78850cd1f816)hmm

viayuve

[12:34](#msg5a71b7cdce68c3bc7428d145)do we have awesome where I can use drag and drop widget and build interface

9214

[12:34](#msg5a71b7d8494bd0f5304b2572)unfortunately not yet

[12:34](#msg5a71b7ea6117191e61d77d8d)VID dialect is rather easy to write by hand

[12:36](#msg5a71b845494bd0f5304b27d2)if `cmd` is a parent of `program.exe`, perhaps there's some option for `taskkill` to kill both cmd AND all its child processes?

[12:38](#msg5a71b8bb494bd0f5304b2a47)https://ss64.com/nt/taskkill.html

[12:38](#msg5a71b8c5ce68c3bc7428d882)looks like `/T` options might be useful

[12:38](#msg5a71b8d2e217167e2c23ea5f)

```
text
/T                     Tree kill: terminates the specified process
                       and any child processes which were started by it.
```

[12:40](#msg5a71b93498927d57455cc92a)so its `taskkill /PID 1234 /T`, not sure if `/F` is really needed

viayuve

[12:40](#msg5a71b94c494bd0f5304b2f97)I think /F is for forced kill

9214

[12:41](#msg5a71b97598927d57455ccb93)then `/T /F` or `/F /T`, whichever way it works

viayuve

[12:43](#msg5a71b9e54a6b0dd32b6ee58b)and...... it worked now I have to through 362 files and list it in red thanks again for help @9214

[13:01](#msg5a71be43ce68c3bc7428ffe0)anything like table or tree widget

9214

[13:02](#msg5a71be53ac509d207d9e837e)@rebolek :point\_up: ?

rebolek

[13:03](#msg5a71bebdac509d207d9e8835)They are available. You just need to use Red that hasn't got MEBIR disease.

9214

[13:04](#msg5a71bedd98927d57455cea02)is it me :bear: or me :beer: though?

rebolek

[13:09](#msg5a71bff07dcd63481ffd3e67)hm

[13:09](#msg5a71bffb6117191e61d7b1ca)interesting question

9214

[13:12](#msg5a71c0da475054191749915a)we can rename it in drunken bear

[13:13](#msg5a71c0e136de78850cd2375f)because it just lies there on bug tracker

[13:13](#msg5a71c0e46117191e61d7b94d)for month or so

[13:13](#msg5a71c103ac509d207d9e9ab2)and people stumble on it

rebolek

[13:17](#msg5a71c1ec98927d57455d01bd):)

9214

[13:18](#msg5a71c2154a6b0dd32b6f1cae)and then they do he wakes up and starts a drunken debauch and crushes everything

[13:18](#msg5a71c23e6117191e61d7c4e8)though there was one brave cuttlefish who knocked him down in some parallel universe

toomasv

[13:58](#msg5a71cb8fac509d207d9ee4f8) :joy:

viayuve

[15:16](#msg5a71ddc77dcd63481ffe0ad2)guys any plan for table face or tree face ??

9214

[15:16](#msg5a71dddd6117191e61d8853a)oh, right

[15:16](#msg5a71dde2e217167e2c24e8e2)@rebolek :exclamation:

rebolek

[15:17](#msg5a71ddeece68c3bc7429ceb4)@viayuve custom-made are here https://gitlab.com/rebolek/red-styles/

[15:17](#msg5a71ddf598927d57455dc173)\*\*BUT\**

9214

[15:17](#msg5a71ddfd47505419174a615f)you'll need an older version of Red

viayuve

[15:17](#msg5a71de1198927d57455dc1f6)and how do I get that

rebolek

[15:17](#msg5a71de1a6117191e61d886e5)there's also that https://github.com/red/red/issues/3156

9214

[15:18](#msg5a71de2a98927d57455dc2a5)@viayuve http://www.red-lang.org/p/download.html

[15:18](#msg5a71de2f6117191e61d8872e)grab last stable

rebolek

[15:18](#msg5a71de4298927d57455dc332)I don't know if it works with last stable.

viayuve

[15:23](#msg5a71df6536de78850cd30c97)how I can use it in my program

[15:23](#msg5a71df8d4a6b0dd32b6fee22)in any program I mean

[15:24](#msg5a71dfa57dcd63481ffe1919)do I have to install it ??

rebolek

[15:24](#msg5a71dfade217167e2c24f734)take at look at the demo, how it's used there. I am working on tutorial that should be ready soon

[15:24](#msg5a71dfca4a6b0dd32b6ff025)no, you don't need to install anything, just copy the files and `do` them from your script...let me find my notes...

viayuve

[15:25](#msg5a71dffde217167e2c24fa8e)you mean like #include filename ??

rebolek

[15:26](#msg5a71e01d6117191e61d89553)If you compile it, then `#include`, if you run it from interpreter, then `do` it.

viayuve

[15:26](#msg5a71e03847505419174a73dd)which is better??

rebolek

[15:27](#msg5a71e04447505419174a742a)@viayuve this is taken from `%text-table.red`, where is basic documentation:

```
do %text-table.red
window: [
	<your VID here>
]
insert window text-table-style
view window
```

[15:27](#msg5a71e0606117191e61d8977b)@viayuve I prefer to run it from interpreter, it's simpler.

viayuve

[15:27](#msg5a71e07247505419174a75bc)good, I will try it now

[15:28](#msg5a71e09436de78850cd3177d)can I put button in table??

rebolek

[15:29](#msg5a71e0cb7dcd63481ffe2364)No, it's just for text data. It \*could* be extended to handle more, but it takes time.

9214

[15:29](#msg5a71e0e14a6b0dd32b6ff7f0)you can `#include` in any case

[15:30](#msg5a71e0f87dcd63481ffe24b7)when interpreted, `#include %file` is substituted by preprocessor with `do %file`

rebolek

[15:30](#msg5a71e1277dcd63481ffe2654)wow, cool

viayuve

[15:32](#msg5a71e19f6117191e61d8a110)is node-red and red are related

9214

[15:33](#msg5a71e1ac7dcd63481ffe2a7b)what's node-red?

viayuve

[15:33](#msg5a71e1cee217167e2c250834)https://nodered.org

9214

[15:33](#msg5a71e1de6117191e61d8a2c4)no, they're not

viayuve

[16:35](#msg5a71f03e4a6b0dd32b705d8c)@rebolek \*\** Access Error: cannot open: %../red-tools/xml.red  
\*\** Where: read  
\*\** Stack: do-file when I open demo.red

[16:48](#msg5a71f34ece68c3bc742a5e04)@rebolek I added red-tools from your GitHub repo now I am getting this err

```
*** Script Error: VID - invalid syntax at: [on [gp/extra/mode: 'spline gp/extra/redraw gp] radio]
*** Where: do
*** Stack: layout layout layout cause-error
```

[16:49](#msg5a71f37db3c4a0d376c32bd3)I am using 0.6.3 stable

rebolek

[16:54](#msg5a71f4acb3c4a0d376c335e7)@viayuve I see. The `on` problem is 0.6.3 specific, delete it from layout and it should work.

viayuve

[16:59](#msg5a71f5f7e217167e2c259a0f)yep 👍 thanks its working now I can list all my .bat files in one list

[17:01](#msg5a71f64fe217167e2c259cc1)@rebolek is the text face on the top is for search if yes than its not doing anything

[17:06](#msg5a71f79398927d57455e7a2b)@rebolek I don't think those cryptocurrency data are right if you are fetching it from some market are those live data ??

[17:12](#msg5a71f8eb47505419174b245b)sorry 😐 I dint red it was offline

[17:14](#msg5a71f980e217167e2c25b461)how can I access files from shared folder from network could not find any sample for it.

9214

[17:15](#msg5a71f9b8ac509d207da02fc6)I don't think Red can do that as of now

[17:15](#msg5a71f9c036de78850cd3d0d8)we have very basic I/O functionality

viayuve

[17:16](#msg5a71fa08e217167e2c25b834)really thats sad 😞

[17:17](#msg5a71fa344a6b0dd32b70ac7c)also why gui is not working with mint

9214

[17:18](#msg5a71fa4bb3c4a0d376c3630f)because Linux GUI backend is a work in progress and not officially supported

viayuve

[17:20](#msg5a71faf598927d57455e94b5)oh.... shoot me. I red on some article that red have everything cross platform

9214

[17:21](#msg5a71fb22b3c4a0d376c3688c)perhaps you've missed the part where it says that we're still in development ;)

[17:22](#msg5a71fb45e217167e2c25c6af)somewhere in the middle of alpha (or is it beta?) stage

[17:22](#msg5a71fb726117191e61d95bd9)you should take everything what is written about programming languages in development with a grain of salt

viayuve

[17:23](#msg5a71fb92e217167e2c25ca35)so can we get our hands on nightly dev builds ??

[17:23](#msg5a71fbaace68c3bc742a9b7c)oh sure lot of salt then :smile:

rebolek

[17:24](#msg5a71fbb536de78850cd3dd4f)#

9214

[17:24](#msg5a71fbd136de78850cd3de0d)builds are automatically rolled out after each commit on github

[17:24](#msg5a71fbddce68c3bc742a9d2d)you can poke around other branches if you want

[17:24](#msg5a71fbe97dcd63481ffee41a)some of the work is done in private repositories though

rebolek

[17:25](#msg5a71fc077dcd63481ffee4a4)@viayuve data are offline, but you can change it in code to get online data. Default mode is offline, to get it working in wine

viayuve

[17:27](#msg5a71fc79b3c4a0d376c371ee)not sure I poke on some branches because its 4th day with red and lots to sync in.

rebolek

[17:28](#msg5a71fcad47505419174b4107)The text field at top does nothing yet 😀it's meant lfor editing cells. Search is also good idea, but it would probably need some support in table

viayuve

[17:31](#msg5a71fd766117191e61d96b43)if you do add search add filtering and sorting too like a to z, Something like that if you get enough time.

9214

[17:32](#msg5a71fd967dcd63481ffeeed4)@viayuve you want just to list batch files?

[17:32](#msg5a71fda3ce68c3bc742aa97e)in some specific directory or across some directories?

rebolek

[17:33](#msg5a71fddb47505419174b4866)If you have just one column, then \`text-lis

[17:33](#msg5a71fdf64a6b0dd32b70c9ee)Inbuild `text-list` is enough.

[17:33](#msg5a71fe0336de78850cd3ef1c)(Sorry, phone

viayuve

[17:34](#msg5a71fe1f6117191e61d96f10)I have small database in sqlite too. I would like to put small gui interface to handle it.

rebolek

[17:35](#msg5a71fe71ac509d207da05069), ok, I .see.

viayuve

[17:35](#msg5a71fe7436de78850cd3f24b)like small data entry app with filtering and sorting ability to present report at end

9214

[17:36](#msg5a71fe8b4a6b0dd32b70cd80)@rebolek your speech starts to look like J code :D

rebolek

[17:37](#msg5a71fef4ce68c3bc742ab3be)Gee, the phone is terrible thing. I wanted to write that it's good to have tester for the styles 😀

viayuve

[17:40](#msg5a71ff8347505419174b54cf)have you guys tried Bento. I want to build something like that

[17:47](#msg5a7201176117191e61d98384)I use mostly ms access and it have many features but its bulky too.

rebolek

[17:48](#msg5a720155ce68c3bc742ac37c)I don't know Bento. I will take a look at it.

viayuve

[17:50](#msg5a7201e6e217167e2c25f841)Bento is apple's product for database management like filemaker it was very light but old and now its discontinued by apple

rebolek

[17:53](#msg5a7202a347505419174b6baf)I see, I remember FileMaker, it was nice

viayuve

[18:04](#msg5a72051eac509d207da0890f)does red support drag and drop ?

9214

[18:09](#msg5a72066836de78850cd43356)@viayuve rather no than yes

viayuve

[18:16](#msg5a7207fbac509d207da09d21)cool 😎 I will try some example.

[18:20](#msg5a7208e37dcd63481fff4088)just tested 2 example can you guys can explain to me in simple words what is reactive programming?

9214

[18:22](#msg5a72094a98927d57455f0701)instead of tracking (and reacting to) changes in some state manually program does this for you

[18:23](#msg5a7209976117191e61d9c502)i.e. you said that `x` is a sum of `y` and `z`, when you update either `y` or `z` you need to re-calculate `x` by hand

[18:23](#msg5a7209b1ce68c3bc742b0175)but program might react to this changes by itself and do recalculation for `x` on the fly

viayuve

[18:24](#msg5a7209dc6117191e61d9c65d)spot on thanks 🙏

9214

[18:26](#msg5a720a3be217167e2c2638e8)@viayuve

```
>> a: object [y: 1 z: 1 x: y + z]
== make object! [
    y: 1
    z: 1
    x: 2
]
>> a/y: 2
== 2
>> a/x
== 2
>> a/x: a/y + a/z
== 3
>> r: make reactor! [y: 1 z: 1 x: is [y + z]]
== make object! [
    y: 1
    z: 1
    x: 2
]
>> r/y: 10
== 10
>> r/x
== 11
```

viayuve

[18:27](#msg5a720a9698927d57455f0e34): means = right in red also how to comment

9214

[18:28](#msg5a720ab4e217167e2c263ba0)`; everything after ";" is a comment`

[18:28](#msg5a720aeb7dcd63481fff4d2c)or `comment` function, which just eats its argument and doesn't return anything (well, almost)

[18:30](#msg5a720b4798927d57455f1375)you can treat `:` as an equivalent of `=` in mainstream languages, for a start

[18:30](#msg5a720b5f7dcd63481fff4fc8)though it's not a separate operator, it's a part of a "variable" on the left

[18:31](#msg5a720b6fce68c3bc742b0a8c)i.e. writing `y : 1` is a syntactic error

viayuve

[18:32](#msg5a720bd3b3c4a0d376c3e06f)yep did that y:1 , y : 1 both err only y: 1 works

[18:34](#msg5a720c3336de78850cd4573f)t: text means t is variable and it can store only text value right ??

[18:35](#msg5a720c6cb3c4a0d376c3e3d9)like int a;

9214

[18:35](#msg5a720c7f36de78850cd4591f)no, in terms of VID dialect (stuff what you've wrote not so long ago) it means that you're creating text field and referring to it as `t`, sort of a shortcut

[18:36](#msg5a720ca536de78850cd45b72)it's specifically for describing GUI interfaces

viayuve

[18:37](#msg5a720ce5ce68c3bc742b1577)oh I thought its variable lol 😂

[18:38](#msg5a720d417dcd63481fff59a0)how to define variable than

9214

[18:39](#msg5a720d4f6117191e61d9db5d)nohow

[18:39](#msg5a720d60e217167e2c264bcd)because, strictly speaking, there're no variables in Red

viayuve

[18:39](#msg5a720d7b36de78850cd4606c)isn't that x:1 is variable

9214

[18:40](#msg5a720d886117191e61d9dd14)you can \*treat* it as a variable, but it's not

[18:40](#msg5a720d9ee217167e2c264d12)variable is a named portion of memory, which you want to be of a specific type

[18:41](#msg5a720dd6ac509d207da0be34)in `x: 1`, `x` is an identifier of type `word!` which kinda "points to" a value `1` of type `integer!` in current "namespace"

[18:41](#msg5a720dd97dcd63481fff5f78)it's tricky and hard to explain to a beginner :D

viayuve

[18:42](#msg5a720e2e36de78850cd46379)okay, so x: 1 can be x: a and it will change based on value given instead of define x and int or char??

9214

[18:44](#msg5a720e71ac509d207da0c195)sort of

[18:45](#msg5a720ed86117191e61d9e48a)basically, "variable" can hold value of any type and you can't restrict it (for now at least) to hold value of some specific type(s)

[18:47](#msg5a720f5f4a6b0dd32b714656)if you really want to learn Red, the best advice I can give is to forget everything you know about programming :D

viayuve

[18:48](#msg5a720f6b47505419174bc076)word!(x)0x12345 ==&gt;integer!(1)0x56789 right ??

9214

[18:48](#msg5a720f834a6b0dd32b71475a)well, yeah, only without addresses

[18:49](#msg5a720fad7dcd63481fff6b2d)imagine that there's a special dictionary which holds such pairs of `word ==> its value` links

viayuve

[18:49](#msg5a720fd0ce68c3bc742b24d7)I am not a programmer at all few things I learned during c/c++ seminars nothing fancy

9214

[18:49](#msg5a720fd5ac509d207da0caea)what you're doing with `x: 1` is just changing such link for word `x` in one of those dictionaries

[18:50](#msg5a721010b3c4a0d376c3fbe0)and there could be many dictionaries like this one, and `x` might mean completely different things in each one of them

viayuve

[18:51](#msg5a721038ac509d207da0cca5)oh now it make sense

9214

[18:51](#msg5a72103c6117191e61d9ec31)but each `x` "knows" to which dictionary it belongs, and so it "knows" own meaning

[18:52](#msg5a7210674a6b0dd32b714d0d)you can, however, "convince" `x` that now its meaning resides in some other dictionary, and so from that moment this `x` might mean something else

[18:53](#msg5a7210b47dcd63481fff70d9)i.e. you can change the meaning of `x` in its dictionary or convince it that from now on its meaning is in some other dictionary

[18:53](#msg5a7210b67dcd63481fff7100)kinda like that

[18:54](#msg5a7210e736de78850cd4747e)say, word `rock` might mean "music genre" in dictionary of musical styles

[18:54](#msg5a7210fe4a6b0dd32b71519f)or it might mean "the solid mineral" in dictionary of nature

viayuve

[18:55](#msg5a7211364a6b0dd32b715304)got it

9214

[18:56](#msg5a7211654a6b0dd32b7153cf)the trick is that you can have both rocks at the same time in one place

viayuve

[18:58](#msg5a7211dde217167e2c2667c4)only rock knows where to point 😆

9214

[18:58](#msg5a7211f0e217167e2c266841)as funny as it sounds, but yeah :D

viayuve

[19:02](#msg5a7212b2ce68c3bc742b38f7)food time see you guys after some time have fun

9214

[19:02](#msg5a7212cf47505419174bd6c4)bed time :zzz:

viayuve

[19:03](#msg5a72130f4a6b0dd32b715d09)than good night @9214 drive lembo in your dream :car:

rebolek

[19:19](#msg5a7216d54a6b0dd32b71731f):joy:

## Thursday 1st February, 2018

viayuve

[11:39](#msg5a72fc67b3c4a0d376c8e872)how can I generate auto-number like t1,t2,t3 etc?? and show it on text face

9214

[11:42](#msg5a72fd2d36de78850cd9394a)@viayuve

```
view collect [
    keep 'below
    repeat i 10 [
        keep reduce ['text rejoin ['t i]]
    ]
]
```

viayuve

[11:44](#msg5a72fd93b3c4a0d376c8ee5a)can I Have unlimited like on button and every time it will generate next unique number

[11:45](#msg5a72fde17dcd63481f044084)and it will show it on text face like once I click on button it will show on text face t1 next time when I press button again t2 like that

9214

[11:46](#msg5a72fe1f36de78850cd9416e)@viayuve you mean like a counter?

viayuve

[11:46](#msg5a72fe234a6b0dd32b763746)yes

[11:47](#msg5a72fe43475054191750ad2c)and than I will store that in my sqlite db for new unique entry I guess

[12:24](#msg5a730704e217167e2c2b7ac0)I guess we do not have counter face

9214

[12:25](#msg5a73071fb3c4a0d376c9277a)gee, no one dared to come up with something?

[12:26](#msg5a73076e475054191750ea7b)@viayuve

```
view [
    button "increment" [
        t/text: rejoin ['t t/extra: t/extra + 1]
    ]
    t: text extra 0
]
```

viayuve

[12:33](#msg5a730931475054191750f48e)its working like a charm let me connect to my databse

[12:40](#msg5a730ab5e217167e2c2b90a4)@9214 can you point me on some demo where can I see how I can connect red with sqlite could not find anything here https://github.com/red/community

9214

[12:40](#msg5a730ad4475054191750fc59)I don't think it's possible with limited I/O we have

rebolek

[12:41](#msg5a730b0ab3c4a0d376c93e5a)@viayuve see https://github.com/kealist/RS-fossil-mirror/tree/master/SQLite/ but it's bit old so I'm not sure if it works.

viayuve

[12:42](#msg5a730b25b3c4a0d376c93f1e)let me try that fossil :smile:

rebolek

[12:42](#msg5a730b2bb3c4a0d376c93f2f):)

viayuve

[12:42](#msg5a730b457dcd63481f048e44)thats 3-4 year old

rebolek

[12:43](#msg5a730b6b98927d57456454d9)yes

viayuve

[13:06](#msg5a7310da98927d5745647330)./red -c -u do-sql.red

[13:07](#msg5a7310fe98927d57456473ec)

```
*** Compilation Error: invalid datatype name: sqlite! 
*** in file: /Users/admin/Desktop/top/demo/testbill/RS-fossil-mirror/SQLite/examples/do-sql.red
*** near: ["Log SQLite error." 
    db [sqlite!]
]
```

[13:10](#msg5a7311c136de78850cd9c233)is it right way to compile??

[13:17](#msg5a73137e4a6b0dd32b76c0e4)

```
Compiling /Users/admin/Desktop/top/demo/testbill/RS-fossil-mirror/SQLite/examples/do-sql.red ...
...using libRedRT built on 1-Feb-2018/18:44:13+5:30
*** Compilation Error: invalid datatype name: sqlite! 
*** in file: /Users/admin/Desktop/top/demo/testbill/RS-fossil-mirror/SQLite/examples/do-sql.red
*** near: ["Log SQLite error." 
    db [sqlite!]
]
```

9214

[13:39](#msg5a73188bac509d207da63b0e)maybe you should add `#include %../SQLite.reds` at the top

rebolek

[13:42](#msg5a73193b4750541917514f35)I believe there were some changes in Red that prevent the binding from compiling without any changes.

viayuve

[13:49](#msg5a731b064750541917515979)

```
*** Preprocessor Error in #switch 
*** Script Error : OS has no value 
*** Where: [#switch] 
*** Near:  [OS]
```

9214

[13:55](#msg5a731c59b3c4a0d376c9a816)maybe @Oldes' version is more stable  
https://github.com/red/code/tree/master/Library/SQLite

[13:56](#msg5a731caae217167e2c2bfaaa)though, there's same `#switch` as in fossil repo  
https://github.com/red/code/blob/master/Library/SQLite/SQLite3.reds#L9

rebolek

[14:07](#msg5a731f3fb3c4a0d376c9bc45)at least you can ask @Oldes for support

viayuve

[14:11](#msg5a73200036de78850cda196e)finally I can see its working 😅

rebolek

[14:11](#msg5a7320297dcd63481f050bce):+1:

viayuve

[14:12](#msg5a73203be217167e2c2c15ed)Now I have to figure out how can I put those data from test.db into your text table 😝

rebolek

[14:18](#msg5a7321a46117191e61dfb015)data for text-table is block of blocks for each row

viayuve

[14:48](#msg5a7328c3ce68c3bc7430f8e3)Hello guys what editor you use on Mac and linux on windows I am using notepad++

rebolek

[14:51](#msg5a732978e217167e2c2c4f61)I use VS code, Sublime is also great (but not free).

viayuve

[15:36](#msg5a7333f7ce68c3bc74314d66)how to configure vs code for red??

[15:36](#msg5a733402e217167e2c2c9720)in mac

9214

[15:37](#msg5a73342b6117191e61e02c50)have you read instructions? https://github.com/red/VScode-extension

viayuve

[15:38](#msg5a73347336de78850cdaa4ca)nothing for mac

9214

[15:38](#msg5a73348f98927d5745655ab6)how mac is different from any other OS?

[15:39](#msg5a7334c87dcd63481f059dbd)just install the extension and that's it, I believe

rebolek

[15:39](#msg5a7334cfac509d207da6e94a)@viayuve there's nothing specific for mac

9214

[15:40](#msg5a7334d6ce68c3bc7431546a)tweak configuration if needed, rebind keys, etc

rebolek

[15:40](#msg5a7334d7ce68c3bc7431546c)the extension is universal

[15:40](#msg5a7334eb7dcd63481f059f27)I use it on both mac and linux without problems

viayuve

[15:40](#msg5a7334f96117191e61e03096)I mean section like linux , Mac , windows ok I will try that

9214

[15:41](#msg5a73351b4a6b0dd32b77a285)doesn't make sense to create dedicated sections for extension which works the same on all big-3 OSes

viayuve

[15:41](#msg5a73353136de78850cdaaa33)@rebolek red is not working on linux @9214 you guys told me

9214

[15:41](#msg5a73353eac509d207da6ec7f)I didn't say that

rebolek

[15:41](#msg5a7335434750541917520c76)@viayuve only GUI

viayuve

[15:42](#msg5a73355136de78850cdaaac8)oh okay 👌 my mistake

rebolek

[15:42](#msg5a7335574750541917520cbf)Red is working just fine on Linux, if you don't need GUI.

[15:42](#msg5a7335647dcd63481f05a185)no other features are missing

viayuve

[15:49](#msg5a73372747505419175216da)just search through plugin panel and installed it its better looking than my Mac text editior

rebolek

[15:50](#msg5a733744e217167e2c2cacd3)@viayuve what are you using as editor on Mac?

viayuve

[15:53](#msg5a7337e2e217167e2c2cb126)nothing textedit so far just installed vscode and figuring out my way to compile and run the program.

[15:55](#msg5a73387b4750541917521f28)@rebolek where is the option to compile the file

9214

[15:56](#msg5a7338ace217167e2c2cb5c0)https://github.com/red/VScode-extension#shortcuts

viayuve

[15:59](#msg5a7339616117191e61e04cf1)where is settings.json file

[16:01](#msg5a7339d198927d5745657b68)No Red compiler! Please configure the `red.redPath` in `settings.json`

9214

[16:01](#msg5a7339e5ac509d207da709ff)`Ctrl + ,`

viayuve

[16:03](#msg5a733a666117191e61e051e3)that does nothing

[16:04](#msg5a733a7ece68c3bc743177d8)do I have to create file name settings.json in folder ??

9214

[16:04](#msg5a733a8536de78850cdac9c7)`File > Preferences > Settings`?

rebolek

[16:06](#msg5a733af7ac509d207da70f2c)If `Ctrl + ,` does nothing, you should try `Cmd + ,`

viayuve

[16:08](#msg5a733b65b3c4a0d376ca70a2)command + ,

rebolek

[16:08](#msg5a733b9947505419175232c0)or select setting from menu, as @9214 wrote

viayuve

[16:11](#msg5a733c28e217167e2c2cd171)holy moly it worked finally I am able to compile yes 😎

rebolek

[16:13](#msg5a733c8cb3c4a0d376ca7773):+1:

viayuve

[16:13](#msg5a733c9aac509d207da71c1f)after compilation the binary file is made but how to run it do I have to type in command or any shortcuts key

rebolek

[16:13](#msg5a733cb998927d5745658f7f)you can open console directly in VS code and then run it from there

9214

[16:13](#msg5a733cbee217167e2c2cd611)`chmod +x ./file && ./file`

[16:14](#msg5a733cfa4750541917523f12)perhaps permission settings could be omitted

viayuve

[16:16](#msg5a733d5eb3c4a0d376ca7cd2)how to exit from red terminal

9214

[16:16](#msg5a733d69ce68c3bc74318c84)`q`

viayuve

[16:17](#msg5a733d857dcd63481f05d179)./filename works fine

[16:32](#msg5a734134b3c4a0d376ca97b8)so far what I am able to do with sqlite binding is to create database print it on terminal I store it in result: exec "SELECT * FROM tablename"

[16:35](#msg5a7341c6e217167e2c2cf40c)figuring out the way to print result in some face like text or dropdown list but before that I want to know that how blocks are stored in result like 2d ??

[16:59](#msg5a73476b98927d574565da54)like in array??

9214

[17:00](#msg5a7347ae6117191e61e0a9ed)I don't get the question

viayuve

[17:21](#msg5a734c90ac509d207da78085)how data are stored in memory block like 2d cells or like comma separated data \[1,2,3,4] or \[1 2 3 ]

9214

[17:21](#msg5a734cb636de78850cdb3a7c)memory block..?

[17:24](#msg5a734d30475054191752a647)if you're asking how Red values are stored in memory - details are here, I believe  
https://github.com/red/red/blob/master/runtime/allocator.reds

viayuve

[17:24](#msg5a734d514a6b0dd32b783175) \[1 2 3]  
result =&gt;\[1 2 3]  
\[1 2 3]

[17:25](#msg5a734d92b3c4a0d376cae651)okay it does store in array cool thanks 🙏

9214

[17:26](#msg5a734daa4a6b0dd32b78333e)it's just a bunch of bytes and nothing more

[17:27](#msg5a734e067dcd63481f0632b5)AFAIK all values are boxed, i.e. represented as a 128bit cell with 32bit header

[17:27](#msg5a734e1cce68c3bc7431f9ad)in remained 96 bits locates actual data specific for the value at hand

[17:29](#msg5a734e61e217167e2c2d3f99)then there're series buffers

viayuve

[17:30](#msg5a734ecd6117191e61e0d6a2)cool good to know

[17:56](#msg5a7354ccb3c4a0d376cb14ce)

```
*** Compilation Error: undefined symbol: zerofill
*** in file: %/Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/SQLite3.red
*** at line: 9567
*** near: [
    zerofill dbs-head dbs-tail
    close-dbs: func [
        /local
        p [pointer! [integer!]]
    ] [
        p: dbs-head
        while [p < dbs-tail] [
            if p/value <> 0 [
                print-line ["closing db: " as pointer! [integer!] p/value]
                sqlite3_close as pointer! [integer!] p/value
                p/value: 0
            ]
            p: p + 1
        ]
    ]
    get-db-ptr:
]
```

[17:57](#msg5a735511475054191752d851)compiling .red file gives err but If I compile .reds and run binary it works

[17:58](#msg5a73553bb3c4a0d376cb166c)https://github.com/red/code/tree/master/Library/SQLite

[17:58](#msg5a735558b3c4a0d376cb177b)any idea how to compile those red files ??

[17:59](#msg5a73558f6117191e61e0fe68)typing ./red -c SQLite3-test.red produces that err

9214

[17:59](#msg5a73559936de78850cdb7472)@Oldes :point\_up:

viayuve

[18:01](#msg5a735612ac509d207da7ba76)@Oldes but If I type ./red -c SQLite-test.reds it produces binary and I can run it without any issue.

9214

[18:02](#msg5a73564fce68c3bc743230af)can you try with `-r` instead of `-c`?

viayuve

[18:06](#msg5a735723ac509d207da7c30b)worked but why ??

[18:06](#msg5a73572a98927d5745663e51)-r ??

9214

[18:08](#msg5a73578898927d5745663fe1)AFAIK `-r` links everything together

viayuve

[18:08](#msg5a7357a8475054191752e7f1)you mean in one file ?

[18:33](#msg5a735d6ae217167e2c2d9ef2)finally I am able to wrap my mind around this sqlite library 📚 thanks @9214 good night sleep 😴 tight

9214

[18:41](#msg5a735f5d4a6b0dd32b78a6a5)I'll stick for a while, too caffeinated :grin:

Oldes

[19:05](#msg5a7364f04750541917533ab9)@viayuve that is because `-c` is using pre-compiled Red runtime library, where the `zerofill` function is not included. If I'm not wrong.

## Friday 2nd February, 2018

virtualAlan

[00:36](#msg5a73b2aa4a6b0dd32b7a61fc)Just updated my site, added some more examples - apps - and more:  
http://www.mycode4fun.co.uk/About-Red-Programming  
http://www.mycode4fun.co.uk/red-apps  
http://www.mycode4fun.co.uk/red-beginners-reference-guide  
http://www.mycode4fun.co.uk/example-scripts

greggirwin

[00:55](#msg5a73b6e6e217167e2c2f7cf4)Thanks to everyone for holding down the fort. Many messages to catch up on.

[00:55](#msg5a73b706ce68c3bc7434320d)@viayuve, if you would like to collect your SQLite notes in a wiki page, that would be great!

toomasv

[04:11](#msg5a73e4fc36de78850cde451b)@greggirwin Welcome back! (err.. Are you back?)  
@virtualAlan :+1:  
@viayuve Your notes would be most appreciated!

endo64

[14:46](#msg5a7479c74a6b0dd32b7e39c7)@virtualAlan Great!

viayuve

[15:16](#msg5a7480c7ce68c3bc743816f2)I will try my best to write good wiki page @toomasv @greggirwin

mikeparr

[16:46](#msg5a7495e3e217167e2c33fb8b)@virtualAlan Great stuff!

Ungaretti

[23:24](#msg5a74f310a3447aac75349b79)@virtualAlan Thank you! Great work!

greggirwin

[23:32](#msg5a74f4fbe217167e2c362629)@toomasv, yes, I'm back. Had some work to do today, to get my main machine working. More reboots than in the past 5 years combined, but back online now.

## Saturday 3th February, 2018

toomasv

[04:36](#msg5a753c454a6b0dd32b820ee1)@greggirwin !\[I am](http://vooglaid.ee/red/Tom.png) :+1: !\[you](http://vooglaid.ee/red/Gregg.png) :computer: :running: !

greggirwin

[05:23](#msg5a75473698927d57456fe9a6)Wow. The ancient Egyptians would love you.

toomasv

[05:25](#msg5a7547c84a6b0dd32b823785)I love 'em 'oo.

greggirwin

[06:48](#msg5a755b26ac509d207db19af2)`'oo` must be an emoticon, but I can't parse it right now. Not a cat. Not spectacles. Is it the sphinx?

viayuve

[06:51](#msg5a755befac509d207db19dc0)Cat Mat\\rix maybe 😂

9214

[06:52](#msg5a755c2636de78850ce59eec)Bender?

viayuve

[06:54](#msg5a755ca36117191e61eb2f0f)Live Avatar the last air 💨 Bender lol 😂 😝

[09:06](#msg5a757bae36de78850ce613cc)How to reduce time of -r every time I compile or link

[09:18](#msg5a757e7798927d574570aa53)compilation time : 2815 ms

planetsizecpu

[10:40](#msg5a7591b536de78850ce672d1)@virtualAlan :+1:

viayuve

[10:46](#msg5a7593106117191e61ec0578)guys please help this compilation time is killing me

[10:48](#msg5a75938bb3c4a0d376d602cb)after small change in program I have to wait for 2871 ms any fast way to do it

[11:15](#msg5a7599c698927d5745712338)...compilation time : 82819 ms  
...linking time : 686 ms

toomasv

[11:51](#msg5a75a227b3c4a0d376d63ad4)@viayuve Sorry, I have no experience with compiling :cold\_sweat:

PeterWAWood

[12:04](#msg5a75a566e217167e2c38b76e)@viayuve If you are not changing SQLite3.red, you could try compiling your program with the `-u` option. (As I understand, this will updated libRedRT with the Red/System code in SQLite3.red). After having done so once, you should be able to compile with the `-c` option.

viayuve

[12:32](#msg5a75abdfb3c4a0d376d661f3)

```
Red [
	Title:   "Red Read DB"
	Author:  "viayuve"
	File: 	 %readdb.red
    needs: 'view
]

#include %SQLite3.red
result: make block! 32
result1: make block! 32
drop1-selection: function [] [;;;;;;;;;ok
    either drop-down1/selected = none [
        print "drop-down1: no selection yet"
    ] [
        print ["Drop-down1: " mold pick drop-down1/data drop-down1/selected]
    ]
]

;SQLite section

SQLite/do [
    db1: open %test.db
    trace 3
    use   :db1
    result: exec "SELECT * FROM Cars ORDER BY name" 
    result1: exec "SELECT Name FROM Cars"  
]
foreach [row name] result1 [name 8]
view [
    t: text 200x200
    
    ;data [mold SQLite/query "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name"]
    ;button "Table Schema" [t/data: mold SQLite/query "SELECT * FROM sqlite_master"]
    button "click" [t/data: result]
    button "Raw Data" [t/data: mold result lf]

    ; drop down
    drop-down1: drop-down 
    
    [drop-down1/data: result1]
    button-drop-down1: button "Drop-down selection is..." [drop1-selection]
    return
    ]
SQLite/free
```

[12:33](#msg5a75ac1eac509d207db2dc46)any one like to help I can not load data from sql query to drop-down

[12:34](#msg5a75ac56ce68c3bc743d4305)-u -c produces \`  
Compiling to native code...  
\*\** Compilation Error: undefined symbol: zerofill  
\*\** in file: %/Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/SQLite3.red  
\*\** at line: 9567  
\*\** near: [  
zerofill dbs-head dbs-tail  
close-dbs: func [  
/local  
p \[pointer! \[integer!]]  
] [  
p: dbs-head  
while \[p &lt; dbs-tail] [  
if p/value &lt;&gt; 0 [  
print-line \["closing db: " as pointer! \[integer!] p/value]  
sqlite3\_close as pointer! \[integer!] p/value  
p/value: 0  
]  
p: p + 1  
]  
]  
get-db-ptr:  
]

[12:34](#msg5a75ac6fb3c4a0d376d66595)only -r works so far

[12:36](#msg5a75acdee217167e2c38d62d)@Oldes

PeterWAWood

[13:00](#msg5a75b2526117191e61ec88cd)Did you compile with `-u` once and then compile with `-c`? (not `-u -c`)

viayuve

[13:01](#msg5a75b2abe217167e2c38ee5b)let me try

[13:01](#msg5a75b2b998927d574571875b)I did -u -c

[13:02](#msg5a75b2d998927d574571888e)\*\** Internal Error: contains Red/System code which requires compilation  
\*\** Where: do  
\*\** Stack: do-file

[13:02](#msg5a75b2e4b3c4a0d376d68265)with just -u

PeterWAWood

[13:10](#msg5a75b4bf98927d5745719138)I also tried with a smaller program and got the same error. I think it might be a bug. I will check in the red/bugs channel.

viayuve

[13:14](#msg5a75b59f36de78850ce712b0)only -r works with this program whole day in compiling no production lol 😂

[13:14](#msg5a75b5c1ac509d207db305fb)--r is for release right ??

PeterWAWood

[13:17](#msg5a75b67236de78850ce7174b)Yes `-r` is for release, it includes the Red runtime in the compilation. The `-c` option doesn't compile the runtime but links to LibRedRT instead. I thought the `-u` was meant to update LibRedRT with those parts of the runtime that are needed by your program but not included in the standard LibRedRT. I was either mistaken or it is a bug.

viayuve

[13:23](#msg5a75b7e87dcd63481f11da6b)@PeterWAWood Have you tried that sqlite binding before to bring those data from db to face only text is working for me so far

PeterWAWood

[13:32](#msg5a75b9ed6117191e61eca8cb)@viayuve I have not tried the sqlite binding.

lpvm

[16:42](#msg5a75e69398927d5745726625)Hi, for this script https://gist.github.com/lpvm/9d0b69835073010c9618b3f3d525c714 after the user inputs the day, month and year value and presses the button, there's an error saying "Script Error: calculate-num-vida has no value".

[16:43](#msg5a75e6c6e217167e2c39d13d)The return from the case in calculate-num-vida is not being handed to the form?

9214

[16:44](#msg5a75e6dbce68c3bc743e4337)@lpvm try to move `view ...` call to the very bottom of script

lpvm

[16:45](#msg5a75e72598927d5745726a92)@9214 spot on. As always!

[16:47](#msg5a75e799b3c4a0d376d760a1)I didn't find any documentation about pressing the TAB key to be able to move from input to input field. Is there support for it?

9214

[16:48](#msg5a75e7d6b3c4a0d376d76155)@lpvm there's no built-in way to do that AFAIK, but I guess it's doable

lpvm

[17:04](#msg5a75ebb6ac509d207db3f607)Let's see if it's added to the language, it's necessary for fast user input, in my opinion. Thanks for the help!

[17:05](#msg5a75ebc96117191e61ed87e5)language... vid dialect

gltewalt

[18:09](#msg5a75fac3ac509d207db43e04)He’s happy you got your computer running

[18:14](#msg5a75fc08e217167e2c3a3808):corn: :cop:

## Sunday 4th February, 2018

viayuve

[07:43](#msg5a76b9b1e217167e2c3d1101)how to store data from source into array ??

[07:47](#msg5a76ba944a6b0dd32b87f3d1)or something similar to array in red

9214

[09:34](#msg5a76d3b94a6b0dd32b885668)@viayuve it depends on the source and data format

[09:35](#msg5a76d3cde217167e2c3d795b)usually `load` should be enough

viayuve

[09:39](#msg5a76d4d9ac509d207db784a8)@9214 have you tried my program I am trying to put data from query into dropdown list

[09:41](#msg5a76d5424a6b0dd32b885be8)\`  
Audi  
Mercedes  
Skoda  
Volvo  
Bentley  
Citroen  
Hummer  
Hummer

[09:42](#msg5a76d57f4a6b0dd32b885d39)out put using this loop

```
foreach [row name] result1[ print [name]]
```

[09:43](#msg5a76d5b2e217167e2c3d7f97)instead of printing it I want to put those data in dropdown list

9214

[09:43](#msg5a76d5beb3c4a0d376db1653)https://doc.red-lang.org/en/view.html#\_drop\_list

[09:43](#msg5a76d5dcb3c4a0d376db168e)it accepts block or hash of strings, e.g. `["a" "b" "c"]`

[09:46](#msg5a76d67c98927d5745761598)

```
text
result: [
    1 "Audi"
    2 "Mercedes"
    3 "Skoda"
]

view [
    drop-list with [data: extract/index result 2 2]
]
```

viayuve

[09:54](#msg5a76d871ce68c3bc7441ff63)@9214...using libRedRT built on 3-Feb-2018/13:31:59+5:30  
\*\** Syntax Error: Invalid Red program  
\*\** in file: /Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/abc.red  
\*\** line: 1  
\*\** at: {result: [  
1 "Audi"  
2 "Mercedes"

9214

[09:55](#msg5a76d8aeac509d207db794ba)have you placed Red header at the top of the script?

viayuve

[09:56](#msg5a76d8c34a6b0dd32b886b33)oops 😬

[09:58](#msg5a76d92b6117191e61f134ad)

```
admins-MacBook-Pro:SQLite admin$ ./abc*** Script Error: VID - invalid syntax at: [with [data: extract/index result 2 2]]
*** Where: do
*** Stack: layout cause-error
```

9214

[09:59](#msg5a76d9706117191e61f135a7)update from http://static.red-lang.org/dl/auto/mac/red-latest and try again

viayuve

[10:11](#msg5a76dc3898927d5745762b62)okay it worked

[10:12](#msg5a76dc724a6b0dd32b887a77)let me try it on my sqlite program

[10:23](#msg5a76df334a6b0dd32b88864f)do compiler have some option for fast compiling like use 6 threads or more something like that example --threads 6

9214

[10:24](#msg5a76df4d6117191e61f14d9a)no, no such option yet

viayuve

[10:24](#msg5a76df79ce68c3bc74421b65)they should implement it

9214

[10:27](#msg5a76e0114a6b0dd32b8888e3)let's see... try to run `./red clear`

[10:29](#msg5a76e0a3ac509d207db7b40b)then try to compile your script with just `-u` flag

viayuve

[10:30](#msg5a76e0a998927d5745763bd9)

```
Raw data result: [
    1 "1" "Audi" "52642"
    2 "5" "Bentley" "350000"
    3 "6" "Citroen" "21000"
    4 "7" "Hummer" "41400"
    5 "8" "Hummer" none
    6 "2" "Mercedes" "57127"
    7 "3" "Skoda" "9000"
    8 "4" "Volvo" "29000"
]
```

9214

[10:30](#msg5a76e0b8b3c4a0d376db4386)and on each subsequent compilation use only `-c` flag

viayuve

[10:30](#msg5a76e0c67dcd63481f16877f)that is raw data from query using mold

9214

[10:30](#msg5a76e0db36de78850cebda7e)only block or `Raw data result:` part too?

viayuve

[10:32](#msg5a76e145e217167e2c3dae6c)that is raw data I guess from query

[10:33](#msg5a76e183e217167e2c3daf33)drop-list with \[data: extract/index result 2 2] what is 2 2 for

9214

[10:33](#msg5a76e194ac509d207db7b80c)index to start from and how many items to skip

viayuve

[10:35](#msg5a76e1db36de78850cebde5c)I can not use -u

[10:35](#msg5a76e1df7dcd63481f168d27)err

[10:35](#msg5a76e1ebb3c4a0d376db48ec)only -r works

9214

[10:37](#msg5a76e2736117191e61f15a6e)and you don't want to check whenever what I propose works or not?

viayuve

[10:38](#msg5a76e293a3447aac753c4e5b)sorry 😐 let me check

9214

[10:40](#msg5a76e30336de78850cebe2ae)assuming that data returned from SQL library is just a block

```
result: [
    1 "1" "Audi" "52642"
    2 "5" "Bentley" "350000"
    3 "6" "Citroen" "21000"
    4 "7" "Hummer" "41400"
    5 "8" "Hummer" none
    6 "2" "Mercedes" "57127"
    7 "3" "Skoda" "9000"
    8 "4" "Volvo" "29000"
]

view [
    drop-list with [data: probe extract/index result 4 3] select 1
]
```

unfortunately `drop-list` makes visible only first 5 items

[10:41](#msg5a76e375ac509d207db7c154)per http://www.red-lang.org/2017/03/062-libred-and-macros.html  
Such fast compilation mode also works for Red scripts that embed Red/System code. Two cases are possible:  
1\. Red/System code does not contain any call to Red runtime library.  
2\. Red/System code contains one or several calls to Red runtime library.

In the first case, nothing needs to be done, the usage rules described above apply.

In the second case, a custom version of libRedRT is required, but the toolchain will take care of the process, it just requires the user to compile once using -u option, then simply use -c for next compilations. If new functions from the runtime library are called, then a new custom library needs to be rebuilt.

When compiling a custom run-time library, cleaning libRedRT files is needed to get rid of any outdated versions. The toolchain provides a red clear command which will remove all current libRedRT related files. Note that when upgrading the red binary to a newer version, it will automatically upgrade libRedRT on first invocation.

Any Red user code can be compiled in development mode, with the exception of objects with multiple inheritance, which is not supported by libRedRT (so can only be compiled in release mode).

viayuve

[10:42](#msg5a76e3a136de78850cebe60f)

```
admins-MacBook-Pro:SQLite admin$ ./red -u readdb.red
Compiling Red console...
*** Internal Error: contains Red/System code which requires compilation
*** Where: do
*** Stack: do-file
```

9214

[10:44](#msg5a76e4277dcd63481f1698e9)that's weird

viayuve

[10:45](#msg5a76e44ce217167e2c3dbb45)tell me all about it :wink:

9214

[10:45](#msg5a76e45a36de78850cebe943)

```
text
    -u, --update-libRedRT          : Rebuild libRedRT and compile the input script
                                      (only for Red scripts with R/S code).
```

[10:46](#msg5a76e48b4a6b0dd32b889b0c)and `-u -c` still bails out with error?

viayuve

[10:47](#msg5a76e4a7b3c4a0d376db5317)

```
admins-MacBook-Pro:SQLite admin$ ./red -u -c readdb.red

-=== Red Compiler 0.6.3 ===-

Compiling /Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/readdb.red ...
...compilation time : 3551 ms

Target: Darwin

Compiling to native code...
libRedRT-extras.r file generated, recompiling...

Compiling /Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/readdb.red ...
Compiling libRedRT...
...compilation time : 3014 ms

Compiling to native code...
...compilation time : 95409 ms
...linking time     : 1028 ms
...output file size : 966656 bytes
...output file      : /Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/libRedRT.dylib

...compilation time : 198 ms

Target: Darwin

Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : Cannot use add on none! value
*** Where: emit-stack-align-prolog
*** Near:  [all [
args/1 = #variadic
fspec/3 <> 'cdecl
offset: offset + 12
]
call-arguments-size? args/2
]
```

9214

[10:47](#msg5a76e4c536de78850cebea7b)well, at least now it's different

viayuve

[10:47](#msg5a76e4d37dcd63481f169b08)err is different

9214

[10:48](#msg5a76e4f2e217167e2c3dbd68)but it works with `-r`, right?

viayuve

[10:49](#msg5a76e556ce68c3bc74423412)yep like a charm but compiling time after small change is killing me :cry:

[10:52](#msg5a76e5e736de78850cebef7e)almost more that a 1 min every time

9214

[10:57](#msg5a76e7187dcd63481f16a467)well, perhaps there's some bug in compiler which you uncovered

[10:57](#msg5a76e733ce68c3bc74423dfb)@PeterWAWood @greggirwin :point\_up: is it worth a ticket?

viayuve

[10:58](#msg5a76e75cb3c4a0d376db5f41)raw data output first using form and second using mold

```
Raw data result: 1 1 Audi 52642 2 5 Bentley 350000 3 6 Citroen 21000 4 7 Hummer 41400 5 8 Hummer none6 2 Mercedes 57127 7 3 Skoda 9000 8 4 Volvo 29000


Raw data result: [
    1 "1" "Audi" "52642"
    2 "5" "Bentley" "350000"
    3 "6" "Citroen" "21000"
    4 "7" "Hummer" "41400"
    5 "8" "Hummer" none
    6 "2" "Mercedes" "57127"
    7 "3" "Skoda" "9000"
    8 "4" "Volvo" "29000"
]
```

[10:59](#msg5a76e77836de78850cebf4e9)which one will be good to extract data

9214

[10:59](#msg5a76e77c36de78850cebf4eb)is it a string or a block?

[10:59](#msg5a76e791a3447aac753c6277)i.e. you apply `mold` and `probe` to string or to block?

viayuve

[11:00](#msg5a76e7ca4a6b0dd32b88a86d)it is block

```
result: make block! 32
```

9214

[11:00](#msg5a76e7eab3c4a0d376db60e4)then you need just to extract the table (`table: result/4`) and adapt the script I showed you

[11:01](#msg5a76e7eeac509d207db7d399)with `extract` and such

[11:01](#msg5a76e800ce68c3bc74423fbf)https://gitter.im/red/red/welcome?at=5a76e30336de78850cebe2ae

viayuve

[11:01](#msg5a76e804ce68c3bc74423fc4)print \["^/Raw data result:" mold result lf]

9214

[11:01](#msg5a76e8246117191e61f170ae)you confused me :smile:

[11:02](#msg5a76e83f98927d5745765b1b)well, then you already have your table-block and can just use the script

viayuve

[11:03](#msg5a76e86898927d5745765b94)table ?? do we have that I thought its not

[11:03](#msg5a76e87dac509d207db7d53a)sorry new comer

9214

[11:03](#msg5a76e87fe217167e2c3dce92)you just said that `result` is

```
[
    1 "1" "Audi" "52642"
    2 "5" "Bentley" "350000"
    3 "6" "Citroen" "21000"
    4 "7" "Hummer" "41400"
    5 "8" "Hummer" none
    6 "2" "Mercedes" "57127"
    7 "3" "Skoda" "9000"
    8 "4" "Volvo" "29000"
]
```

[11:03](#msg5a76e89e7dcd63481f16aa16)even if it's just a plain block, we can treat it as 2d table with rows and columns

viayuve

[11:04](#msg5a76e8ada3447aac753c67d0)I Mean table face

[11:04](#msg5a76e8bc36de78850cebfa95)oh okay

9214

[11:04](#msg5a76e8c96117191e61f1734b)you said that you need `drop-list`?

viayuve

[11:05](#msg5a76e8edb3c4a0d376db647a)ahhhh table would be way better 😉

9214

[11:05](#msg5a76e8efa3447aac753c6901)@rebolek showed you his custom table face and IIRC told that format is a block of nested blocks

viayuve

[11:06](#msg5a76e919a3447aac753c69f5)yep I know but native table would be great

9214

[11:06](#msg5a76e94b6117191e61f174dc)if you want to adapt your data to @rebolek's format, then

```
result: [
    1 "1" "Audi" "52642"
    2 "5" "Bentley" "350000"
    3 "6" "Citroen" "21000"
    4 "7" "Hummer" "41400"
    5 "8" "Hummer" none
    6 "2" "Mercedes" "57127"
    7 "3" "Skoda" "9000"
    8 "4" "Volvo" "29000"
]

table: parse result [
    collect some [keep 4 skip]
]
```

[11:07](#msg5a76e981b3c4a0d376db6759)@viayuve the thing is that Red strives to keep things the same across all OS-es, and that table-like widgets aren't built in some of them

[11:08](#msg5a76e9a27dcd63481f16aeb1)so, at least on first iterations it won't be included

[11:08](#msg5a76e9c0ac509d207db7dac4)i.e., say, Win might have built in table, and Mac might not

viayuve

[11:08](#msg5a76e9c96117191e61f176ab)no....... 😢 😭

[11:09](#msg5a76e9e6a3447aac753c6c74)do you use some kind of snippet manager

9214

[11:09](#msg5a76e9f098927d57457660d6)for what?

[11:10](#msg5a76ea1236de78850cec00d7)@viayuve http://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html

viayuve

[11:10](#msg5a76ea2bb3c4a0d376db6a29)like to store quick solutions that can hold code snippet

9214

[11:10](#msg5a76ea4298927d574576624d)@viayuve https://gist.github.com/

viayuve

[11:12](#msg5a76ea8e36de78850cec029f)wow that excel looks way easy than @rebolek code

9214

[11:15](#msg5a76eb3836de78850cec04bd)well, his styles are more feature-complete, I believe

[11:15](#msg5a76eb5398927d574576663b)and spreadsheet is not quite the same as a table of indefinite size

viayuve

[11:15](#msg5a76eb67ce68c3bc74424cd9)👌 I will try both and let you know which one works for me

[11:21](#msg5a76ec9c98927d5745766fa3)@9214 what I am doing wrong here 'drop-list with \[data: extract/index table: result/4]'

9214

[11:22](#msg5a76ecfba3447aac753c7af2)sigh

[11:23](#msg5a76ed17e217167e2c3de3fd)

```
text
result: [
    1 "1" "Audi" "52642"
    2 "5" "Bentley" "350000"
    3 "6" "Citroen" "21000"
    4 "7" "Hummer" "41400"
    5 "8" "Hummer" none
    6 "2" "Mercedes" "57127"
    7 "3" "Skoda" "9000"
    8 "4" "Volvo" "29000"
]

view [
    drop-list with [data: probe extract/index result 4 3] select 1
]
```

[11:23](#msg5a76ed244a6b0dd32b88c17d)your `result` is everything you need

[11:23](#msg5a76ed4336de78850cec11d6)I got confused because you've mentioned `Raw data result:` part without telling me that it's just a string that you used during printing

viayuve

[11:24](#msg5a76ed7d36de78850cec1293)oh okay so sorry 😐 I am idol

[11:24](#msg5a76ed89e217167e2c3de621)nop idiot 😂

9214

[11:25](#msg5a76eda6e217167e2c3de6a7)you don't need to apologize, we should just work on our communication skills ;)

viayuve

[11:26](#msg5a76edff6117191e61f18d5e)will this work with other faces? 'data: probe extract/index result 4 3' cool I will take cs 101 than from Lynda :wink:

9214

[11:28](#msg5a76ee4936de78850cec1541)if they support similar data format, then yes

viayuve

[11:37](#msg5a76f05eb3c4a0d376db8731)

```
view [
    drop-list with [data: probe extract/index result 4 3] select 1
    text-list with [data: probe extract/index result 4 3] select 1
    drop-down with [data: probe extract/index result 4 3] select 1
    a1: area  white  font [name: "Consolas" size: 10 color: black]
    {data}                                                                       
    return
]
```

can not make it work with area

[11:37](#msg5a76f08a7dcd63481f16cce6)@9214

9214

[11:39](#msg5a76f0e236de78850cec2171)

```
text
result: [
    1 "1" "Audi" "52642"
    2 "5" "Bentley" "350000"
    3 "6" "Citroen" "21000"
    4 "7" "Hummer" "41400"
    5 "8" "Hummer" none
    6 "2" "Mercedes" "57127"
    7 "3" "Skoda" "9000"
    8 "4" "Volvo" "29000"
]

view [
    area with [
        text: mold/only new-line/all extract/index result 4 3 on
    ]
]
```

[11:41](#msg5a76f1514a6b0dd32b88d5c4)or

```
view [
    area with [
        text: replace/all form extract/index result 4 3 space newline
    ]
]
```

viayuve

[11:42](#msg5a76f1b636de78850cec2522)why not form

[11:43](#msg5a76f1da36de78850cec25a2)I red that it removes " and / and [ etc

9214

[11:45](#msg5a76f24d7dcd63481f16d243)`mold` is an obverse of `load`and used to convert values to string form without loss, while `form` is just for user-friendly printing

viayuve

[11:46](#msg5a76f287ac509d207db80051)okay 👌 also how can I add more columns right now it is printing only 3 tried 2,3

9214

[11:48](#msg5a76f325b3c4a0d376db9229)`extract` is just for one "column" extraction

viayuve

[11:49](#msg5a76f360e217167e2c3dfe68)so what should be for more that one column?

9214

[11:50](#msg5a76f37336de78850cec2a78)I think either `collect/keep` or `parse`

```
view [
    area with [
        text: replace/all form probe parse result [
            collect some [1 skip keep 2 skip 1 skip]
        ] space newline
    ]
]
```

viayuve

[11:55](#msg5a76f4a1e217167e2c3e02ad)so is there any way to print like

```
1 audi
```

instead of 1 new line audi in next line

9214

[11:55](#msg5a76f4c0ce68c3bc744276c6)?

```
>> print [1 'audi]
1 audi
```

[11:56](#msg5a76f4dfce68c3bc74427729)ah, I see

viayuve

[11:56](#msg5a76f4e336de78850cec3065)I mean in text area

[11:59](#msg5a76f5b1a3447aac753ca6bc)also how can I call terminal or cmd in vid any idea about that?

9214

[12:02](#msg5a76f639e217167e2c3e08e0)use `call` as usual

viayuve

[12:02](#msg5a76f6734a6b0dd32b88e963)no way to put it in window like its in vscode

9214

[12:04](#msg5a76f6b098927d57457699ce)there should be, with `area`

[12:04](#msg5a76f6df6117191e61f1b42c)or do you mean separate window?

viayuve

[12:05](#msg5a76f6f9ac509d207db81423)how about both

[12:05](#msg5a76f7114a6b0dd32b88ed6d)like live terminal or cmd but inside window or area

9214

[12:06](#msg5a76f73eb3c4a0d376dba637)you can use `area` or `field` for input, not sure about output

[12:08](#msg5a76f7a26117191e61f1b6fd)`call/output` I think

viayuve

[12:08](#msg5a76f7c1b3c4a0d376dba833)so call/input for input may be

9214

[12:08](#msg5a76f7d298927d5745769e4e)well, yeah

[12:09](#msg5a76f7f2e217167e2c3e1145)though using same series as both input and output would be too error-prone

viayuve

[12:20](#msg5a76faa998927d574576a9b3)how to extract data from area and store it in block

9214

[12:21](#msg5a76fad5ce68c3bc74429553)use `/text` or `/data` facets

viayuve

[12:49](#msg5a77015de217167e2c3e37c3)

```
admins-MacBook-Pro:SQLite admin$ ./red terminalcmd.red
[]
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Common/ChunkCompression.cpp:50: Error: unsupported compressor 8
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Libraries/CompressData/CompressData.c:353: Error: Unknown compression scheme encountered for file '/System/Library/Frameworks/AppKit.framework/Resources/Base.lproj/NSTextTouchBarItems.nib'
admins-MacBook-Pro:SQLite admin$ ./red terminalcmd.red
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Common/ChunkCompression.cpp:50: Error: unsupported compressor 8
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Libraries/CompressData/CompressData.c:353: Error: Unknown compression scheme encountered for file '/System/Library/Frameworks/AppKit.framework/Resources/Base.lproj/NSTextTouchBarItems.nib'
admins-MacBook-Pro:SQLite admin$ ./red terminalcmd.red
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Common/ChunkCompression.cpp:50: Error: unsupported compressor 8
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.30.2/Libraries/CompressData/CompressData.c:353: Error: Unknown compression scheme encountered for file '/System/Library/Frameworks/AppKit.framework/Resources/Base.lproj/NSTextTouchBarItems.nib'
```

[12:49](#msg5a77016dce68c3bc7442b0e7)Red [  
Title: "Red Read DB"  
Author: "viayuve"  
File: %terminalcmd.red  
needs: 'view  
]  
view [  
text-field: field "enter name"  
]

[12:49](#msg5a7701774a6b0dd32b89167b)why those errors

9214

[12:50](#msg5a7701af98927d574576c55f)something to do with new APFS

[12:51](#msg5a7701c298927d574576c5a9)I think it was reported at some point (@qtxie ?)

viayuve

[13:13](#msg5a7706f5e217167e2c3e4ff2)@9214 what I am doing wrong

```
view [
	t: text
	result: field "enter name"
	button "text" [t/data: result]
]
```

9214

[13:14](#msg5a770733b3c4a0d376dbec05)`t/data: result/data`

[13:14](#msg5a770739ac509d207db8595f)or `t/text: result/text`

[13:14](#msg5a770752ac509d207db859dc)or `t/data: result/text` :D

viayuve

[13:15](#msg5a77076c36de78850cec7f2e)cool 😎

[13:16](#msg5a77079da3447aac753cf19e)anything like pop up message face something

[13:16](#msg5a7707b0ac509d207db85b17)like enter your name here

[13:16](#msg5a7707baa3447aac753cf26d)but in popup

9214

[13:16](#msg5a7707c84a6b0dd32b892fd1)you can make it yourself if you need

[13:17](#msg5a7707d8b3c4a0d376dbee8e)@planetsizecpu have some similar examples  
https://github.com/planetsizecpu/alert

viayuve

[13:19](#msg5a770844e217167e2c3e5644)what is that ; Icons static definition

[13:19](#msg5a770860e217167e2c3e5694)😱

9214

[13:19](#msg5a77086ce217167e2c3e56c1)he embedded images directly in script instead of using files

[13:24](#msg5a7709a6e217167e2c3e5b24)@viayuve

```
pop-up: function [text][
    view [
        f: field hint text [unview self]
    ]
    return f/data
]

view [
    t: text
    button "Ask user input" [
        t/data: pop-up "type something"]
]
```

viayuve

[13:31](#msg5a770b397dcd63481f1734d9)awesome cool

[13:31](#msg5a770b494a6b0dd32b894149)now I am introduced to function cool

[13:56](#msg5a771128e217167e2c3e7a04)

```
view [
    t: text
    result: field
    button "text" [t/data: result/data]
	button "clear text" [clear t/data]
	button "call" [t/data: call/input result/data]
]
```

can not clear data also why input call is not working

9214

[14:01](#msg5a77125736de78850cecae98)`clear t/text`

[14:03](#msg5a77129498927d5745770c5d)and try `call/input result/text`

viayuve

[14:05](#msg5a771329a3447aac753d24f9)

```
*** Script Error: call/input is missing its in argument
*** Where: call
*** Stack: view do-events do-actor do-safe
```

I don't think 🤔 call is interacting with terminal directly

9214

[14:05](#msg5a771342b3c4a0d376dc2320)it requires two arguments

[14:06](#msg5a77134a36de78850cecb3e4)you supplied only one

[14:06](#msg5a771362b3c4a0d376dc23db)`call/input`

viayuve

[14:07](#msg5a771394ce68c3bc744302e5)example please

[14:07](#msg5a7713ae4a6b0dd32b8969d0)call/input ls -r

[14:08](#msg5a7713c94a6b0dd32b896a8c)call/input rm -r

9214

[14:08](#msg5a7713d16117191e61f22e19)I don't think `ls` needs any input

[14:08](#msg5a7713dbb3c4a0d376dc26bf)just `call "ls"`

[14:09](#msg5a7714324a6b0dd32b896bf8)for `call/output`

```
>> call/output "ls" out: ""
== 0
>> print out
4-1
aoc
code.desktop
daruma
desktop
docs
graph.red
I08
linden
local
parse.org
parse.org~
profile.red
public
r2
r2.exe
r3
rebview.exe
red-063
red.exe
redlang
scratchpad.red
```

viayuve

[14:10](#msg5a77144cce68c3bc74430689)worked here too

[14:10](#msg5a771455ce68c3bc744306a3)I mean input

9214

[14:10](#msg5a771461ce68c3bc744306de)`/input` needed if command that you call reads something from stdin

viayuve

[14:22](#msg5a771708e217167e2c3e9634)

```
view [
    t: text
	v: text
    command: field
    input1: field
    button "command" [t/data: command/data]
	button "input1" [v/data: input1/data]
	button "clear command" [clear t/text]
	button "clear input" [clear v/text]
	button "call" [t/data: call/input t/text v/text]
]
```

call is not working

[14:24](#msg5a7717947dcd63481f176d2c)its making t/text 0 dunno why

9214

[14:24](#msg5a7717bbce68c3bc74431486)because `call` returns `0` if command successfully finished

[14:25](#msg5a7717c3e217167e2c3e98d8)which means that it works

viayuve

[14:25](#msg5a7717e0a3447aac753d3c3c)why not list of files

[14:25](#msg5a7717e898927d574577299a)ls -a

9214

[14:26](#msg5a771801ac509d207db89e37)it listed them in stdout, which you haven't redirected anywhere, so it just disappeared

viayuve

[14:26](#msg5a77181fe217167e2c3e9a95)call/output ??

9214

[14:26](#msg5a77182fac509d207db89ebb)yes

viayuve

[14:29](#msg5a7718bd6117191e61f2426a)call/output is missing its out argument

9214

[14:29](#msg5a7718dece68c3bc74431972)well, because you haven't supplied that argument?

viayuve

[14:30](#msg5a771912b3c4a0d376dc40d3)button "out" \[t/data: call/output t/text]

9214

[14:31](#msg5a7719377dcd63481f17747a)type `? call` and read some documentation

viayuve

[14:31](#msg5a77195d7dcd63481f177523)? call

9214

[14:32](#msg5a771967ac509d207db8a40e)jeez

[14:32](#msg5a77196ace68c3bc74431b9a)in Red console

[14:32](#msg5a77198ace68c3bc74431c62)

```
text
>> ? call
USAGE:
     CALL cmd

DESCRIPTION: 
     Executes a shell command to run another process. 
     CALL is a native! value.

ARGUMENTS:
     cmd          [string! file!] "A shell command or an executable file".

REFINEMENTS:
     /wait        => Runs command and waits for exit.
     /show        => Force the display of system's shell window (Windows only).
     /console     => Runs command with I/O redirected to console (CLI console only at present).
     /shell       => Forces command to be run from shell.
     /input       => 
        in           [string! file! binary!] "Redirects in to stdin".
     /output      => 
        out          [string! file! binary!] "Redirects stdout to out".
     /error       => 
        err          [string! file! binary!] "Redirects stderr to err".

RETURNS:
     0 if success, -1 if error, or a process ID.
     [integer!]
```

[14:33](#msg5a7719ae6117191e61f2474d)`/output` refinement requires another argument (string, file, binary) there output will be redirected

[14:33](#msg5a7719bf4a6b0dd32b8984d4)`call` itself will return either `0`, `-1` or PID in any case

viayuve

[14:34](#msg5a7719e96117191e61f24861)so no way to see output

9214

[14:34](#msg5a771a11b3c4a0d376dc4482)e.g. `less` applied to `scratchpad.red` file in my working directory, output is redirected to `out` string

```
== "scratchpad.red"
>> call/input/output "less" %scratchpad.red out: ""
== 0
>> print out
Red []

pop-up: function [text][
    view [
        f: field hint text [unview self]
    ]
    return f/data
]

view [
    t: text
    button "Ask user input" [
        t/data: pop-up "type something"
    ]
]
```

viayuve

[14:37](#msg5a771aade217167e2c3ea8bf)ohhh.... 😮 eye opener

[14:45](#msg5a771c7998927d5745773b74)

```
area with [
        text: replace/all form probe parse result [
            collect some [1 skip keep 2 skip 1 skip]
        ] space newline
```

[14:46](#msg5a771cb5e217167e2c3eb1ed)how to make '1 audi' instead of just next line everytime

9214

[14:47](#msg5a771cf87dcd63481f1787bc)I don't quite remember what input and output were

viayuve

[14:48](#msg5a771d227dcd63481f17885e)

```
result: [
    1 "1" "Audi" "52642"
    2 "5" "Bentley" "350000"
    3 "6" "Citroen" "21000"
    4 "7" "Hummer" "41400"
    5 "8" "Hummer" none
    6 "2" "Mercedes" "57127"
    7 "3" "Skoda" "9000"
    8 "4" "Volvo" "29000"
]
```

[14:48](#msg5a771d267dcd63481f178876)input

9214

[14:50](#msg5a771dc698927d57457740e3)

```
text
result: [
    1 "1" "Audi" "52642"
    2 "5" "Bentley" "350000"
    3 "6" "Citroen" "21000"
    4 "7" "Hummer" "41400"
    5 "8" "Hummer" none
    6 "2" "Mercedes" "57127"
    7 "3" "Skoda" "9000"
    8 "4" "Volvo" "29000"
]

view [
    area with [
        table: parse result [
            collect some [skip keep 2 skip skip]
        ]
        text: rejoin collect [
            forall table [
                keep reduce [form table/1 newline]
            ]
        ] 
    ]
]
```

viayuve

[14:52](#msg5a771e25ac509d207db8bb87)wow 😲 you are awesome

[14:55](#msg5a771ecb36de78850ceceae7)what is better absolute path or relative

9214

[14:55](#msg5a771eebb3c4a0d376dc5d2c)well, it depends

[14:56](#msg5a771f0ca3447aac753d6145)if you want to be absolutely specific - absolute, if you want flexibility - relative

viayuve

[15:00](#msg5a771ff27dcd63481f17960f)can I use view more than one time

9214

[15:01](#msg5a77202c98927d5745774add)yes, though, first `view` will stuck in event loop and second `view ...` windows won't open until the first one is closed

[15:01](#msg5a7720347dcd63481f17971d)so you'll need to use `view/no-wait` instead

viayuve

[15:01](#msg5a772049e217167e2c3ec504)got it

[15:08](#msg5a7721e96117191e61f26cec)absolute for now, I am going to put the output from that sql block into @rebolek table. 😓

[15:11](#msg5a772299b3c4a0d376dc6f64)missing my coffee

[15:14](#msg5a77235aa3447aac753d7665)invalid syntax at: \[parse result \[collect some \[keep 4 skip]]]

[15:15](#msg5a7723897dcd63481f17a8b2)

```
Red [
	Title:   "Red Read DB"
	Author:  "viayuve"
	File: 	 %readdb.red
    needs: 'view
]

do %/Users/admin/Desktop/top/demo/red-tools/xml.red
do %/Users/admin/Desktop/top/demo/red-tools/html-tools.red
do %/Users/admin/Desktop/top/demo/red-tools/json.red
;/Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/readdb.red
;/Users/admin/Desktop/top/demo/red-styles/demo.red
do %/Users/admin/Desktop/top/demo/red-styles/scroller.red
do %/Users/admin/Desktop/top/demo/red-styles/text-table.red
do %/Users/admin/Desktop/top/demo/red-styles/chart.red

#include %SQLite3.red
result: make block! 32

SQLite/do [
    db1: open %test.db
    trace 3
    use   :db1
    result: exec "SELECT * FROM Cars ORDER BY name"  
]
view [
        table: parse result [
        collect some [keep 4 skip]
    ]
    ]
SQLite/free
```

9214

[15:16](#msg5a7723b54a6b0dd32b89b43f)`table with [data: parse ...]`

[15:16](#msg5a7723d3ce68c3bc74434bc2)wait, you're not using any face for output

viayuve

[15:16](#msg5a7723ea4a6b0dd32b89b52c)😐

[15:17](#msg5a7723f87dcd63481f17aa36)let me read docs

[15:20](#msg5a7724d436de78850ced0960)

```
view [ window: [
        table with parse result [
        collect some [keep 4 skip]
    ]
    ]
    insert window text-table-style
view window
]
```

[15:20](#msg5a7724d8b3c4a0d376dc793d)like this

9214

[15:22](#msg5a772552ce68c3bc744351c3)ah wait, I read @rebolek examples

[15:23](#msg5a77255ce217167e2c3edb77)first snippet should work, theoretically

[15:23](#msg5a77256136de78850ced0b89)https://gitlab.com/rebolek/red-styles/blob/master/text-table.red

[15:24](#msg5a7725beb3c4a0d376dc7cd5)perhaps it should be `text-table with [data: ...]`

viayuve

[15:34](#msg5a77281d6117191e61f28a6c)

```
view [ 
    window: [
        text-table with [data: probe extract/index result 4 3]
        
        ]
    ]
    insert window text-table-style
view window
]
```

[15:34](#msg5a7728236117191e61f28a6e)running this

9214

[15:36](#msg5a772869ac509d207db8e8e7)you have superfluous `]` for a start

[15:36](#msg5a7728774a6b0dd32b89c933)and you can't execute arbitrary code inside VID block

[15:38](#msg5a7728ffce68c3bc74435f49)something like that, per @rebolek's examples

```
do %text-table.red
window: [
	text-table with [
        data: parse result [
            collect some [keep 4 skip]
        ]
    ]
]

insert window text-table-style
view window
```

viayuve

[15:39](#msg5a77294cce68c3bc74436132)without view

9214

[15:40](#msg5a77295fe217167e2c3eed08)what?

viayuve

[15:40](#msg5a77297298927d57457771da)

```
view [
```

[15:40](#msg5a772985e217167e2c3eed8d)let me try

[15:44](#msg5a772a5a36de78850ced21e3)\*\** Script Error: VID - invalid syntax at: \[parse result \[collect some \[keep 4 skip]]]  
\*\** Where: do  
\*\** Stack: layout cause-error

9214

[15:45](#msg5a772aa74a6b0dd32b89d5fa)dump your code here

viayuve

[15:46](#msg5a772ac1ce68c3bc74436725)

```
Red [
	Title:   "Red Read DB"
	Author:  "viayuve"
	File: 	 %readdb.red
    needs: 'view
]

do %/Users/admin/Desktop/top/demo/red-tools/xml.red
do %/Users/admin/Desktop/top/demo/red-tools/html-tools.red
do %/Users/admin/Desktop/top/demo/red-tools/json.red
;/Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/readdb.red
;/Users/admin/Desktop/top/demo/red-styles/demo.red
do %/Users/admin/Desktop/top/demo/red-styles/scroller.red
do %/Users/admin/Desktop/top/demo/red-styles/text-table.red
do %/Users/admin/Desktop/top/demo/red-styles/chart.red

#include %SQLite3.red
result: make block! 32

SQLite/do [
    db1: open %test.db
    trace 3
    use   :db1
    result: exec "SELECT * FROM Cars ORDER BY name"  
]
window: [
    text-table with [
        data: parse result [
            collect some [4 skip]
        ]
    ]
]

insert window text-table-style
view window
SQLite/free
```

9214

[15:48](#msg5a772b3a98927d57457779df)hmm

[15:50](#msg5a772bb1ce68c3bc74436ab3)how about

```
window: compose/only [
	text-table (
        parse result [collect some [keep 4 skip]]
    )
]
```

viayuve

[15:53](#msg5a772c7436de78850ced2a5e)

```
*** Script Error: VID - invalid syntax at: [parse result [collect some [keep 4 skip]]]
*** Where: do
*** Stack: layout cause-error
```

9214

[15:59](#msg5a772df8b3c4a0d376dc9f9f)let's wait for @rebolek, maybe we're doing something wrong

[16:00](#msg5a772e0fce68c3bc744373f3)though `compose/only` should yield block of blocks anyway

[16:00](#msg5a772e167dcd63481f17d35c)and it works for me

viayuve

[16:00](#msg5a772e3ba3447aac753da84a)cool lets wait for @rebolek

[16:10](#msg5a773072ac509d207db90da1)@9214 what is the difference between

```
view window
```

and \`view\[]

9214

[16:10](#msg5a77308e4a6b0dd32b89ef97)zero difference

viayuve

[16:11](#msg5a77309536de78850ced3e7b)👌

9214

[16:11](#msg5a7730a4e217167e2c3f0ca9)`window` is just a word bounded to VID block

rebolek

[16:21](#msg5a7732f9ac509d207db91902)@viayuve @9214 what's the problem?

9214

[16:24](#msg5a7733d136de78850ced4db4)@rebolek can you check if this example with `text-table` works for you?

```
result: [
    1 "1" "Audi" "52642"
    2 "5" "Bentley" "350000"
    3 "6" "Citroen" "21000"
    4 "7" "Hummer" "41400"
    5 "8" "Hummer" none
    6 "2" "Mercedes" "57127"
    7 "3" "Skoda" "9000"
    8 "4" "Volvo" "29000"
]

do %text-table.red
probe window: compose/only [
	text-table (
        parse result [collect some [keep 4 skip]]
    )
]

insert window text-table-style
view window
```

[16:25](#msg5a7733e1ac509d207db91e8f)or

```
window: [
    text-table with [
        data: parse result [
            collect some [keep 4 skip]
        ]
    ]
]
```

rebolek

[18:57](#msg5a7757af98927d5745784d83)I see, that doesn't work.

9214

[18:58](#msg5a7757c96117191e61f36cb9)any tips then?

rebolek

[18:58](#msg5a7757cda3447aac753e7681)First example can't work, because block following style is an action, not data.

[18:58](#msg5a7757e76117191e61f36d49)I'm not sure why the second example doesn't work, I will take a look at that.

9214

[18:58](#msg5a7757f036de78850cee0121)can you clarify on the first one?

[18:59](#msg5a775810ac509d207db9c169)`paren!` is composed and table-block is returned

rebolek

[18:59](#msg5a7758177dcd63481f18a0e3)@9214 `layout [button "click me" [this is action - not data]]`

9214

[18:59](#msg5a77582698927d5745784fb4)ooh, got it

[19:00](#msg5a77583498927d5745785003)so it should be `data (...)`?

rebolek

[19:00](#msg5a7758436117191e61f36ea9)Anyway, to use `text-table` you can't provide data in layout (at least currently).

9214

[19:01](#msg5a775872ce68c3bc74443d7b)how can one display an external data then?

rebolek

[19:01](#msg5a7758827dcd63481f18a2aa)You must set them outside layout with `my-table/data: [data here] my-table/extra/redraw my-table` or `my-table/extra/set-data my-table [data here]`.

[19:02](#msg5a7758b14a6b0dd32b8ab485)I'm not sure if the second example is in main branch already.

9214

[19:02](#msg5a7758e3ce68c3bc74443f49)@viayuve :point\_up:

greggirwin

[20:03](#msg5a77671da3447aac753ec1d5):point\_up: \[February 4, 2018 3:57 AM](https://gitter.im/red/red/welcome?at=5a76e7187dcd63481f16a467) @9214 @viayuve there are so many messages, and I haven't used the SQLite binding, that I don't know if I can help right now. I'm still catching up from the trip and have a long to-do-list. The main thing is to narrow it down and see if someone else can reproduce the exact issue.

[20:04](#msg5a7767644a6b0dd32b8af785)Or start with the most basic things and work up to where you hit a problem. e.g., can you compile OK without any SQLite involved?

[20:10](#msg5a7768b6ac509d207dba128d)@viayuve, I suggest that you spend some time learning more Red fundamentals. I know you're anxious to dive into things, but it will help you go faster if you start small, build confidence and understanding about the basics, then add pieces. It will also help people answer your questions more effectively, because they'll be more focused.

PeterWAWood

[23:14](#msg5a7793c97dcd63481f19bae5)@9214 @greggirwin There seems to be an issue with the `-u` option either on macOS or when the source being compiled is not in a sub-directory under red. I will raise an issue as I have a simple example.

[23:47](#msg5a779b96b3c4a0d376dea396)#3219

greggirwin

[23:53](#msg5a779cdd4a6b0dd32b8beb10)Thanks @PeterWAWood !

## Monday 5th February, 2018

viayuve

[08:22](#msg5a78143ace68c3bc74476ca6)@greggirwin So far I have tried many program and most of them works with -c option or just ./red demo.red works out of the box. About learning basics I am doing it in my spare time. About err I am getting it with sqlite only, without library most program are working fine(I only tried sqlite lib because I needed it to integrate in my work about other libs I dunno ). Some GUI does produce strange output even with single click on it. I do ask lot of questions because it produces better outcome for me. Working demo is better than example :wink: many time I do put myself in silent mode and just chew on lot of red.

rebolek

[08:24](#msg5a7814d14a6b0dd32b8de951)@viayuve Have you got text-table working with your data? I wasn't online very much yesterday, sorry.

viayuve

[08:26](#msg5a78152de217167e2c4315db)So far no I woke up and opened my Mac and going through mails and messages with my ☕️

rebolek

[08:26](#msg5a7815397dcd63481f1bc9ae)Ok, I see :)

[08:26](#msg5a78153f7dcd63481f1bc9ce)Just let me know then.

viayuve

[08:27](#msg5a78155c98927d57457b85af)If you are here for while I can open my vscode and type some code

rebolek

[08:27](#msg5a78157636de78850cf13bf8)Yes, I'm here, but can check it on Wine only. Shouldn't be problem though.

viayuve

[08:28](#msg5a7815a2ce68c3bc744774c4)are you using wine on Mac ?? why??

rebolek

[08:29](#msg5a7815e836de78850cf13e8f)I'm on Linux now.

viayuve

[08:30](#msg5a78163db3c4a0d376e0acec)oh I thought you are on Mac 🖥 you wrote that you are using vscode on Mac I am using it too now

[08:31](#msg5a781667b3c4a0d376e0ae1d) very nice editor

rebolek

[08:33](#msg5a7816c4ac509d207dbd009a)@viayuve I am on Mac or Linux. I agree that VS code is really nice.

viayuve

[08:38](#msg5a7817f5ce68c3bc74477fbd)Just giving you heads up below is the whole code I am working with

[08:38](#msg5a781807ac509d207dbd08fe)

```
Red [
	Title:   "Red Read DB"
	Author:  "viayuve"
	File: 	 %readdb.red
    needs: 'view
]

do %/Users/admin/Desktop/top/demo/red-tools/xml.red
do %/Users/admin/Desktop/top/demo/red-tools/html-tools.red
do %/Users/admin/Desktop/top/demo/red-tools/json.red
;/Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/readdb.red
;/Users/admin/Desktop/top/demo/red-styles/demo.red
do %/Users/admin/Desktop/top/demo/red-styles/scroller.red
do %/Users/admin/Desktop/top/demo/red-styles/text-table.red
do %/Users/admin/Desktop/top/demo/red-styles/chart.red

#include %SQLite3.red
result: make block! 32

SQLite/do [
    db1: open %test.db
    trace 3
    use   :db1
    result: exec "SELECT * FROM Cars"  
]
; window: [
;     text-table with [
;         data: parse result [
;             collect some [keep 4 skip]
;         ]
;     ]
; ]

window: compose/only [
    text-table (
        parse result [collect some [keep 4 skip]]
    )
]
insert window text-table-style
view window
SQLite/free
```

rebolek

[08:40](#msg5a78189736de78850cf14d38)Ok, change it to something like:

```
window: [
    t: text-table 
]
insert window text-table-style
view/no-wait window
t/data: parse result [collect some [keep 4 skip]]
t/extra/draw-table t
do-events
SQlite/free
```

viayuve

[08:42](#msg5a78190eb3c4a0d376e0bb59)compiling or releasing .....

[08:44](#msg5a781974b3c4a0d376e0bc7f)basically I can not use it in window hmm... 🤔

rebolek

[08:46](#msg5a7819f1a3447aac7541c805)I'm not sure I understand. You can use it in window, you just can't put the data directly in layout.

[08:47](#msg5a781a27ce68c3bc74478b55)Maybe it could be possible with `layout [text-table data [[some][data][here]]]`, but that's untested.

viayuve

[08:48](#msg5a781a6eac509d207dbd1506)

```
*** Script Error: VID - invalid syntax at: [parse result [collect some [keep 4 skip]]]
*** Where: do
*** Stack: layout cause-error
```

rebolek

[08:49](#msg5a781a81a3447aac7541cbea)there will be `text-table/extra/set-data` function that will simplify setting the data a bit, but that's available in `table-styles` branch only yet.

9214

[08:55](#msg5a781beae217167e2c433a5b)can you try `-r -e`?

viayuve

[08:55](#msg5a781bfb98927d57457bae55)sure I would love too

[08:56](#msg5a781c256117191e61f6c348)

```
Compiling /Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/readdb.red ...
*** Preprocessor Error in #switch
*** Script Error : OS has no value
*** Where: [#switch]
*** Near:  [OS]
```

9214

[08:56](#msg5a781c3ca3447aac7541d384):confused:

viayuve

[08:58](#msg5a781caa4a6b0dd32b8e14c0)what -e does

PeterWAWood

[08:59](#msg5a781cd54a6b0dd32b8e1557)@9214 The -u option will work with the latest git master except :point\_up: \[February 5, 2018 7:47 AM](https://gitter.im/red/red/welcome?at=5a779b96b3c4a0d376dea396)

9214

[08:59](#msg5a781cf436de78850cf16597)@PeterWAWood thanks Peter

viayuve

[09:00](#msg5a781d11ce68c3bc744799ad)😮.....

```
admins-MacBook-Pro:SQLite admin$ ./red -r -t Darwin -e readdb.red

-=== Red Compiler 0.6.3 ===-

Compiling /Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/readdb.red ...
*** Preprocessor Error in #switch
*** Script Error : OS has no value
*** Where: [#switch]
*** Near:  [OS]
```

9214

[09:00](#msg5a781d13ce68c3bc744799b3)@viayuve forces script to be interpreted rather than statically compiled

viayuve

[09:00](#msg5a781d456117191e61f6c9f4)

```
admins-MacBook-Pro:SQLite admin$ ./red readdb.red
*** Internal Error: contains Red/System code which requires compilation
*** Where: do
*** Stack: do-file
```

[09:02](#msg5a781d95e217167e2c434336)how to force -f ??

9214

[09:02](#msg5a781da14a6b0dd32b8e1980)that was an answer to "what is `-e`" question, I'm not asking you to interpret script

[09:03](#msg5a781dc4ac509d207dbd25e4)https://github.com/red/red/commit/3ccd217b7ca62ec38619db8a0a2cb6743ee3e794#diff-79938e092d331e67d7ce1e29b39d6045

viayuve

[09:04](#msg5a781e1dce68c3bc7447a0bd)hmm 🤔 let me try it with -e and -c

[09:06](#msg5a781e9836de78850cf16f64)where can I request for multi thread compiling

9214

[09:06](#msg5a781eaa36de78850cf16fa5)lol

[09:08](#msg5a781f0be217167e2c434bd8)I doubt that it will be implemented before Red is self-hosted, since current compiler is written in R2 which doesn't have any multi-threading support AFAIK

viayuve

[09:08](#msg5a781f147dcd63481f1c00c2)

```
admins-MacBook-Pro:SQLite admin$ ./red -c -e -t Darwin readdb.red

-=== Red Compiler 0.6.3 ===-

Compiling /Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/readdb.red ...
Compiling libRedRT...
...compilation time : 4519 ms

Compiling to native code...
...compilation time : 124759 ms
...linking time     : 1236 ms
...output file size : 962560 bytes
...output file      : /Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/libRedRT.dylib

*** Preprocessor Error in #switch
*** Script Error : OS has no value
*** Where: [#switch]
*** Near:  [OS]
```

[09:11](#msg5a781fa86117191e61f6d556)more than 2 min to compile 😂

9214

[09:12](#msg5a781ff8a3447aac7541ea5b)libRed was created to tackle with long compilation times, it takes 2 minutes in your case because you're using `-r` instead of `-c`, which, in turn, doesn't work as expected because of https://github.com/red/red/issues/3219 or something related

viayuve

[09:20](#msg5a7821f94a6b0dd32b8e311a)@PeterWAWood thanks for posting lot of bugs and improvements

[09:22](#msg5a7822616117191e61f6e35f)I dunno where red will be self hosted but If I understand it correctly using reds you can write system ??

9214

[09:24](#msg5a7822b698927d57457bd39d)Red/System is a low-level dialect of Red, it's a C-like language suitable for system programming

[09:24](#msg5a7822e3ce68c3bc7447bf74)you can embed R/S code in Red and vice versa

[09:25](#msg5a7822f7b3c4a0d376e0f1bb)since SQLite library uses R/S, it requires compilation

[09:25](#msg5a78230698927d57457bd5a9)while Red itself can be either interpreted or comiled

PeterWAWood

[09:25](#msg5a78231ace68c3bc7447c08e)@viayuve The Red runtime and interpreter are written in Red/System. The bootstrap compiler is written in Rebol. The self-hosted compiler will be written in Red.

viayuve

[09:28](#msg5a7823aaac509d207dbd4889)@rebolek any solution for problem I guess, I should test it on windows

[09:28](#msg5a7823bf7dcd63481f1c1cb2)may be red is not yet ready for mac

rebolek

[09:28](#msg5a7823c436de78850cf18dcb)@viayuve have you tried the code I posted?

viayuve

[09:29](#msg5a7823e1a3447aac7542002b)yes err

[09:29](#msg5a7823ebce68c3bc7447c622)I posted that above

rebolek

[09:29](#msg5a7823f9e217167e2c4368e2)This one? `VID - invalid syntax at: [parse result [collect some [keep 4 skip]]]`

viayuve

[09:29](#msg5a7824046117191e61f6ec91)yes

rebolek

[09:29](#msg5a782410b3c4a0d376e0f95a)Strange, I will try it and let you know.

viayuve

[09:30](#msg5a782427a3447aac7542024f)okay 👌 I will wait and try some other red code

[09:31](#msg5a78245898927d57457bddf2)@9214 so If I understand it correctly you can write os in red thats awesome

rebolek

[09:32](#msg5a7824cb36de78850cf1931f)@viayuve can you paste me some example data?

viayuve

[09:33](#msg5a7824fca3447aac754205f4)

```
result: [
    1 "1" "Audi" "52642"
    2 "5" "Bentley" "350000"
    3 "6" "Citroen" "21000"
    4 "7" "Hummer" "41400"
    5 "8" "Hummer" none
    6 "2" "Mercedes" "57127"
    7 "3" "Skoda" "9000"
    8 "4" "Volvo" "29000"
]
```

[09:35](#msg5a78256b36de78850cf196d0)using print \["^/Raw data result:" mold result lf]

rebolek

[09:37](#msg5a7825c998927d57457be681)ok, thanks.

viayuve

[09:49](#msg5a7828967dcd63481f1c3800)

```
Raw data result: [
    1 "1" "Audi" "52642"
    2 "5" "Bentley" "350000"
    3 "6" "Citroen" "21000"
    4 "7" "Hummer" "41400"
    5 "8" "Hummer" none
    6 "2" "Mercedes" "57127"
    7 "3" "Skoda" "9000"
    8 "4" "Volvo" "29000"
]
```

[09:49](#msg5a78289fe217167e2c438569)sorry I forgot to paste this one

rebolek

[09:49](#msg5a7828c1a3447aac75421bb7)@viayuve on the `table-styles` branch it works with `t/extra/set-data t parse result [collect some [keep 4 skip]]`. On master branch I get an error, but different than yours. I will update master branch this evening so you can use `set-data`.

viayuve

[09:50](#msg5a7828d936de78850cf1ab7a)cool 😎

rebolek

[09:50](#msg5a7828deac509d207dbd6633)Are you compiling it, or running it from interpreter?

viayuve

[09:50](#msg5a7828eaac509d207dbd666b)-r

[09:50](#msg5a7828f9ac509d207dbd6681)only that option works for me

rebolek

[09:51](#msg5a78293db3c4a0d376e1173a)So compiling. Because the error is strange, I got `*** Script Error: foreach does not allow none! for its series argument`which is kind of expected, because current `master` version need to have headers set manually (that's solved in the `table-styles` branch and will be pushed to master today).

viayuve

[09:53](#msg5a7829adb3c4a0d376e119a0)thanks @rebolek and @9214 for your hard work

rebolek

[09:55](#msg5a782a20e217167e2c438dec)@viayuve Thanks for using `text-table` ;)

viayuve

[09:57](#msg5a782a856117191e61f70fc8)Really man!!! Don't tell me I am first user I will cry 😭 😂

9214

[09:58](#msg5a782ad7a3447aac7542290d)@rebolek just politely asks you for a tip :smirk:

rebolek

[09:58](#msg5a782ade6117191e61f712e4)No, that honor belongs to @GiuseppeChillemi . So second? :)

[09:59](#msg5a782b0336de78850cf1b70a)@9214 there actually was a bounty for writing `text-table`.

viayuve

[10:00](#msg5a782b4ece68c3bc7447f0c8)by who doc may be ??

rebolek

[10:01](#msg5a782b6698927d57457c06db)by Giuseppe

viayuve

[10:01](#msg5a782b88ce68c3bc7447f1f0)and you made it congratulations on your success

rebolek

[10:02](#msg5a782b9fce68c3bc7447f25e)first half, it still needs some improvements

viayuve

[10:02](#msg5a782bce98927d57457c0986)I don't have some token but it I will get some on exchange market I will tip you both ;)

[10:04](#msg5a782c20e217167e2c439a3f)anyway any news on that @greggirwin

[10:12](#msg5a782e274a6b0dd32b8e773f)any library 📚 to access excel??

[10:14](#msg5a782e936117191e61f7294e)or ms access

PeterWAWood

[10:16](#msg5a782f10e217167e2c43ae37)Yes. Ashley Trütter's \[Munge](http://www.dobeash.com/munge.html) is widely reported as being excellent. It is Windows only and, if I remember correctly, runs under Rebol 2, Rebol 3 and Red.

[10:18](#msg5a782f6cce68c3bc74480af7)I think that it has support for SQLite and SQL Server but not MS-Access. (Though from a quick look at the docs, it might be able to read Access DBs.)

[10:19](#msg5a782fc17dcd63481f1c67c6)Ashley takes a lot of care in documenting his software.

viayuve

[11:02](#msg5a7839cbb3c4a0d376e18160)is that possible to see what code is being called when we we use some function like when I type print \[something] it will show what code print is using ??

9214

[11:03](#msg5a7839fd7dcd63481f1ca718)it's possible only for non-native functions

[11:04](#msg5a783a2f36de78850cf21155)because they're compiled and you can't examine machine code directly, only R/S code in Red repository which defines them

[11:04](#msg5a783a4db3c4a0d376e18480)I think either @rebolek or @greggirwin implemented a function that fetches native's source from github repo

rebolek

[11:05](#msg5a783a7136de78850cf21221)Yes, I wrote such function.

9214

[11:06](#msg5a783aa64a6b0dd32b8ec902)@viayuve

```
>> source append
APPEND is an action! value, so source is not available.
>> source rejoin
rejoin: func [
    "Reduces and joins a block of values." 
    block [block!] "Values to reduce and join"
][
    if empty? block: reduce block [return block] 
    append either series? first block [copy first block] [
        form first block
    ] next block
]
```

rebolek

[11:12](#msg5a783c156117191e61f77f1c)https://gist.github.com/rebolek/dc1bb8c17f0c97e4dbf918126fcab6f1

viayuve

[11:12](#msg5a783c1aac509d207dbde191)thats sweet thanks @rebolek

rebolek

[11:15](#msg5a783cdfac509d207dbde4cb)Doesn't work for `action!`s though.

meijeru

[14:45](#msg5a786dfdb3c4a0d376e2e174)@PeterWAWood I was interested in Munge and downloaded it from Ashley's site. Upon running with the Red interpreter, I discovered an error -- which is totally independent of Munge -- that probably has to do with leaking names:

```
>> about
Red for Windows version 0.6.3 built 18-Jan-2018/10:51:41+01:00
>> platform: system/platform
== Windows
>> platform
*** Script Error: platform has no value
*** Where: catch
*** Stack:
```

Am I overlooking something or is this worth reporting as an issue??

[15:03](#msg5a78722736de78850cf37b76)Further research indicates that the binding is not done, and only in this particular case. The setword is arbitrary.

```
>> platform: 1
== 1
>> platform
== 1
>> platform: system/platform
== Windows
>> platform
== 1
>>
```

rebolek

[15:18](#msg5a7875c56117191e61f8fcad)I can't reproduce it with my old build. Seems like another victim of MEBIR:

```
>> platform: 1
== 1
>> platform: system/platform
== Linux
>> platform
== Linux
```

[15:21](#msg5a787660ce68c3bc7449ca41)With newly built console using latest sources, I can reproduce it. Definitely MEBIR thing:

```
>> platform: 1
== 1
>> platform: system/platform
== Linux
>> platform
== 1
```

meijeru

[15:30](#msg5a787881ac509d207dbf7593)Sorry! What's this MEBIR thing?

9214

[15:30](#msg5a78789e93be87284d7afe66)@meijeru https://github.com/red/red/issues/3156

[15:31](#msg5a7878d0a3447aac75443165)also known as "Most Evil Bug In Red" or "drunken bear"

meijeru

[15:32](#msg5a7878fd4a6b0dd32b90523b)That would need to be solved with priority, then.

rebolek

[15:39](#msg5a787ac67dcd63481f1e44fd)There is PR by @gltewalt that seems to fix it.

[15:42](#msg5a787b64b3c4a0d376e33d24)@meijeru maybe you can add this example to comments, so it can be added to regression tests later.

meijeru

[16:19](#msg5a78841b93be87284d7b58c7)Done.

viayuve

[16:35](#msg5a7887e9e217167e2c460106)

```
Compiling /Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/dbread.red ...
*** Compilation Error: undefined word text-table-style
*** in file: /Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/dbread.red
*** near: [text-table-style
    view/no-wait window
    t/data: parse result [collect some [keep 4 skip]]
    t/extra/draw-table
]
```

[16:36](#msg5a78880ea3447aac7544a556)@rebolek dunno why but syntax issue

[16:37](#msg5a7888304a6b0dd32b90c41d)I am just playing with your demo.red

9214

[16:38](#msg5a788869ce68c3bc744a5123)@viayuve add to Red header `Config: [red-strict-check?: off]` and retry

viayuve

[16:39](#msg5a7888bcce68c3bc744a5393)I am using new build and -r is not working 😂

[16:41](#msg5a788930e217167e2c460cdf)you mean like this

```
Red [
	Title:   "Red Read DB"
	Author:  "viayuve"
	File: 	 %dbread.red
    needs: 'view
    [Config: [red-strict-check?: off]]
]
```

[16:42](#msg5a7889716117191e61f985b6)

```
Compiling /Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/dbread.red ...
*** Compilation Error: undefined word text-table-style
*** in file: /Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/dbread.red
*** near: [text-table-style
    view/no-wait window
    t/data: parse result [collect some [keep 4 skip]]
    t/extra/draw-table
]
```

9214

[16:42](#msg5a7889784a6b0dd32b90cc97)no, without block

viayuve

[16:42](#msg5a78898ea3447aac7544ae4b)okay

[16:45](#msg5a788a134a6b0dd32b90cf7c)

```
admins-MacBook-Pro:SQLite admin$ ./red -r dbread.red

-=== Red Compiler 0.6.3 ===-

Compiling /Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/dbread.red ...
...compilation time : 4014 ms

Target: Darwin

Compiling to native code...
*** Compilation Error: undefined symbol: ~text-table-style
*** in file: %/Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/dbread.red
*** at line: 9567
*** near: [~text-table-style
    actions/insert* -1 -1 -1
    stack/unwind
    stack/reset
    stack/mark-func
]
```

[16:45](#msg5a788a404a6b0dd32b90d07a)

```
admins-MacBook-Pro:SQLite admin$ ./red -r -e dbread.red

-=== Red Compiler 0.6.3 ===-

Compiling /Users/admin/Desktop/top/demo/testbill/code/Library/SQLite/dbread.red ...
*** Preprocessor Error in #switch
*** Script Error : OS has no value
*** Where: [#switch]
*** Near:  [OS]
```

[16:46](#msg5a788a7fe217167e2c46170c)now nothing works -r -c -e all in kill me 😢

[16:50](#msg5a788b3ece68c3bc744a699e)I think I will wait for @rebolek new release of text-table

[16:55](#msg5a788c7ca3447aac7544c2db)@rebolek are you using latest red build if not please provide your build for Mac thanks

[17:04](#msg5a788eb8a3447aac7544d2f1)@9214 which build are you using

9214

[17:05](#msg5a788ed87dcd63481f1ed42d)don't remember

[17:05](#msg5a788ee04a6b0dd32b90f208)

```
text
>> about
Red for Windows version 0.6.3 built 25-Jan-2018/23:52:32+05:00
```

[17:05](#msg5a788ef736de78850cf4508e)some of the recent ones

viayuve

[17:06](#msg5a788f2136de78850cf45139)Red for macOS version 0.6.3 built 4-Feb-2018/16:08:26+05:30 🕠

rebolek

[17:09](#msg5a788fc24a6b0dd32b90f7c6)@viayuve ok, I will. I am not using latest from obvious reason.

endo64

[19:26](#msg5a78b000a3447aac7545bc41)This is also interesting, only the last one doesn't get assigned with the value.

```
>> a: b: c: system/platform
== Windows
>> a
== Windows
>> b
== Windows
>> c
*** Script Error: c has no value
*** Where: catch
*** Stack:
```

meijeru

[20:52](#msg5a78c40293be87284d7d0195)The net tightens around MEBIR :smile:

gltewalt

[20:55](#msg5a78c4b17084124a343d4860)Wish I knew "yay" or "nay" if my fix is correct.

## Tuesday 6th February, 2018

viayuve

[03:42](#msg5a79242fb3c4a0d376e721b4)guys do we have FFmpeg support or lib with red ??

gltewalt

[05:41](#msg5a79400f93be87284d7f3ca6)I think @Oldes might have created something like that

Phryxe

[05:57](#msg5a7943b97dcd63481f22a20d)&gt; guys do we have FFmpeg support or lib with red ??  
http://redlcv.blogspot.se/2017/11/reading-video-files-with-red.html

viayuve

[06:11](#msg5a794703b3c4a0d376e7adb3) thanks @Phryxe

[08:13](#msg5a79638dce68c3bc744ed7fe)@endo64 confirmed on Mac \`  
\== macOS  
&gt;&gt; a  
\== macOS  
&gt;&gt; b  
\== macOS  
&gt;&gt; c  
\== macOS  
&gt;&gt; d  
\*\** Script Error: d has no value  
\*\** Where: catch  
\*\** Stack:

GiuseppeChillemi

[09:20](#msg5a7973496117191e61fe6092)&gt; No, that honor belongs to @GiuseppeChillemi . So second? :)  
We are all moving torward a good direction.

viayuve

[14:49](#msg5a79c07ab3c4a0d376ea85d1)

```
rary/Frameworks/AppKit.framework/Resources/Base.lproj/NSTextTouchBarItems.nib'
2018-02-06 20:15:51.375 abc[4038:757614] Error loading //System/Library/PrivateFrameworks/MobileAsset.framework/MobileAsset:  dlopen(//System/Library/PrivateFrameworks/MobileAsset.framework/MobileAsset, 265): no suitable image found.  Did find:
        //System/Library/PrivateFrameworks/MobileAsset.framework/MobileAsset: mach-o, but wrong architecture
        /System/Library/PrivateFrameworks/MobileAsset.framework/Versions/A/MobileAsset: mach-o, but wrong architecture
```

[16:06](#msg5a79d2767dcd63481f25ef73)when I click on face

9214

[16:06](#msg5a79d2a1a3447aac754c1220)could you be more specific?

viayuve

[16:10](#msg5a79d36f6117191e6100b367)

```
Red [
	Title:   "Red Read DB"
	Author:  "viayuve"
	File: 	 %readdb.red
    needs: 'view
]
result: [
    1 "1" "Audi" "52642"
    2 "5" "Bentley" "350000"
    3 "6" "Citroen" "21000"
    4 "7" "Hummer" "41400"
    5 "8" "Hummer" none
    6 "2" "Mercedes" "57127"
    7 "3" "Skoda" "9000"
    8 "4" "Volvo" "29000"
]

view [
    drop-list with [data: probe extract/index result 4 3] select 1
    text-list with [data: probe extract/index result 4 3] select 1
    drop-down with [data: probe extract/index result 4 3] select 1
    area with [
        text: mold/only new-line/all extract/index result 4 3 on
    ]
    area with [
        text: replace/all form extract/index result 4 3 space newline
    ]
    area with [
        text: replace/all form probe parse result [
            collect some [1 skip keep 2 skip 1 skip]
        ] space newline
    ]

    area with [
        table: parse result [
            collect some [1 skip keep 2 skip 1 skip]
        ]
        text: rejoin collect [
            forall table [
                keep reduce [form table/1 newline]
            ]
        ] 
    ]
]
```

[16:14](#msg5a79d4646117191e6100bd3e)click on second area widget and you will get error in console also when I run binary how to hide console

9214

[16:15](#msg5a79d49c4a6b0dd32b9819f7)I won't get any error, because it's MacOS-specific warnings

[16:16](#msg5a79d4c0a3447aac754c1f88)not sure what you mean by "hide console"

viayuve

[16:16](#msg5a79d4c94a6b0dd32b981b2c)oh I should ditch myMac 😂 now and get windows

9214

[16:16](#msg5a79d4da6117191e6100bf84)@qtxie could you please take a look at warnings above? :point\_up:

viayuve

[16:18](#msg5a79d5404a6b0dd32b981e58)it shows that data in terminal I mean those warnings when I run binary I would like to hide terminal

9214

[16:19](#msg5a79d57bb3c4a0d376eb1d0f)you mean that when launching exe with double click a terminal window pops up?

[16:19](#msg5a79d5987dcd63481f260176)on MacOS?

viayuve

[16:19](#msg5a79d5a24a6b0dd32b9820e2)yes

9214

[16:20](#msg5a79d5b5a3447aac754c2671)try to specify `-t macOS` flag during compilation

viayuve

[16:20](#msg5a79d5cbe217167e2c4d5d9b)I do ./abc to run binary and it starts that app

[16:20](#msg5a79d5d493be87284d82a91e)with terminal in background

9214

[16:21](#msg5a79d5f0ce68c3bc74519450)so you're running it from terminal after all, not double-clicking..?

viayuve

[16:23](#msg5a79d672a3447aac754c2c36)both way with double click it opens up terminal with gui

[16:24](#msg5a79d6b34a6b0dd32b982887)also if other terminals are open and minimised it opens all them on desktop thats weird

9214

[16:24](#msg5a79d6c2ce68c3bc745199a3)does `-t macOS` help or not?

[16:25](#msg5a79d70bb3c4a0d376eb281f)@rebolek can you fire up your Hackintosh and check this? :point\_up:

viayuve

[16:27](#msg5a79d78c6117191e6100d003)wow that worked -t macOS what is the difference -t Darwin it produced abc.app cool

[16:28](#msg5a79d79be217167e2c4d6a7d)without terminal

9214

[16:28](#msg5a79d7c493be87284d82b625)well, maybe because you have macOS and not Darwin?

[16:29](#msg5a79d80293be87284d82b720)or maybe it's like MSDOS / Windows dichotomy

viayuve

[16:30](#msg5a79d8127dcd63481f260ed5)On official website its -t Darwin to target Mac OS

9214

[16:30](#msg5a79d82ca3447aac754c38d7)where specifically?

viayuve

[16:31](#msg5a79d866e217167e2c4d70aa)http://www.red-lang.org/p/getting-started.html find -t Darwin

9214

[16:32](#msg5a79d8844a6b0dd32b983251)why do you think it's about macOS?

[16:32](#msg5a79d896e217167e2c4d7233)&gt; Want to cross-compile to \*\*another supported platform\*\*?

[16:33](#msg5a79d8bf36de78850cfb81b6)there like 10-12 platforms aside from Big-3 Win/Mac/Linux which Red supports

viayuve

[16:33](#msg5a79d8ca7084124a3443002c)Isn't Darwin is from Apple May be thats why I guessed

9214

[16:34](#msg5a79d8fd93be87284d82be40)macOS an Darwin are Apple's OSes, but I believe they're different, yet compatible

viayuve

[16:35](#msg5a79d941b3c4a0d376eb3644)phew 😅 I will keep that in Mind if I correct Hacking tosh does use Darwin kernel am kext

[16:35](#msg5a79d94536de78850cfb8557)I guess

BillDStrong

[16:36](#msg5a79d997a3447aac754c41bc)Darwin is the name of the Mac OS X kernel. It is Open Source, and so the Hackintosh folks have used it to make OS X work on systems Apple doesn't support.

viayuve

[16:36](#msg5a79d99f4a6b0dd32b983993)I am waiting for IO I would like to access local pc and control them

9214

[16:37](#msg5a79d9b77084124a344305f7)@BillDStrong thanks for clarification :+1:

BillDStrong

[16:38](#msg5a79d9f5a3447aac754c44e2)Also, it is the kernel for iOS.

viayuve

[16:38](#msg5a79da18e217167e2c4d7bcd)cool always new things to learn

[16:48](#msg5a79dc64e217167e2c4d88e2)Mac users do you guys dual boot or use bootcamp

[16:49](#msg5a79dc81a3447aac754c5376)or vm

BillDStrong

[16:56](#msg5a79de4bb3c4a0d376eb5ab5)Depends on use case. ( I don't use Mac anymore, but did for years). VMs are useful for things like compiling on a clean system, program interop, baric tasks and light gaming But BootCamp is much better for 3d apps that are Windows only, such as 3ds Max, and heavy gaming.

Phryxe

[17:38](#msg5a79e80593be87284d831e10)According to the linked page above.

```
Darwin       : macOS Intel, console-only applications
macOS        : macOS Intel, applications bundles
```

9214

[17:39](#msg5a79e8374a6b0dd32b989d33)@Phryxe eagle's eye :+1:

Phryxe

[17:39](#msg5a79e850b3c4a0d376eb9e2e):eyeglasses:

## Wednesday 7th February, 2018

qtxie

[00:59](#msg5a7a4f6586ef1bb14179099b)@9214 I have no idea how to fix it. :sweat\_smile: I saw those warnings before. Apple changes the OS too often, On macOS 10.9, no warnings, On macOS 11, the console output lots of warnings, but on macOS 12, it's fixed. Maybe I should find a way to disable the warning. "Out of sight, out of mind" then. ;-)

viayuve

[03:59](#msg5a7a799c6117191e61045628)@qtxie you should put option like --err to see error If someone want to see it

qtxie

[04:04](#msg5a7a7ab186ef1bb14179c166)Yes, that's better.

BillDStrong

[04:07](#msg5a7a7b754a6b0dd32b9bb0f3)@qtxie Could those errors be a precursor to Apple removing 32bit support? Are you sure there are 32bit versions of those apis?

[04:07](#msg5a7a7b97b3c4a0d376eeb564)Could it be an issue of Rebol on those versions of OS X?

[04:09](#msg5a7a7be84a6b0dd32b9bb328)Since Rebol2 hasn't been updated since 10.6 or so, and Apple is famous for breaking vendor software between releases.

qtxie

[06:49](#msg5a7aa181e217167e2c51a326)It just we don't use any NIB files as xcode does, the app loader complains it with those warnings.

BillDStrong

[07:04](#msg5a7aa50b86ef1bb1417a78aa)@viayuve try running this under terminal. It will tell you what arch are supported. Red is currently only i386, so if that is not listed, that is the issue. lipo -info /System/Library/PrivateFrameworks/MobileAsset.framework

[07:05](#msg5a7aa536f283b8e5462d601d)You might need to use sudo.

viayuve

[08:12](#msg5a7ab4d47dcd63481f2a92fe)any news about token sale on exchange

rebolek

[08:15](#msg5a7ab5a6b3c4a0d376efc6f2)From the Telegraph group:

&gt;&gt; Giovanni Gualuca  
&gt;&gt; We haven't officially worked with any exchange yet on listing. The one in negotiation is still waiting for confirmation.

viayuve

[08:16](#msg5a7ab5c893be87284d873dde)hoki doki

[08:16](#msg5a7ab5dd7dcd63481f2a996f)have you updated table yet ??

rebolek

[08:17](#msg5a7ab61e4a6b0dd32b9cbef7)Sorry, haven't got time. But I guess I can merge the branch to master right now and fix possible bugs later, it seems to work good enough.

viayuve

[08:18](#msg5a7ab6454a6b0dd32b9cc053)cool I will test after some coffee ☕️ and nice shower 🚿

rebolek

[08:23](#msg5a7ab78193be87284d874716)Ok :) Changes from `table-styles` should be merged now.

viayuve

[08:29](#msg5a7ab8eb93be87284d874eb9)awesome very fast man

9214

[08:29](#msg5a7ab9017dcd63481f2aabe8)&gt; very fast

Speedy Gonzalez is his name :mouse:

rebolek

[08:30](#msg5a7ab90c93be87284d874f37)It was just a merge, I haven't wrote a single line ;)

9214

[08:31](#msg5a7ab9687dcd63481f2aae26)@rebolek btw, in your top20 stats "by messages"/"by characters" options seems to be broken

viayuve

[08:31](#msg5a7ab97686ef1bb1417ae926)don't look like speedy from Arrow though 😂

[08:32](#msg5a7ab98ef283b8e5462dcab1)@9214 whats that top20

9214

[08:32](#msg5a7ab99f93be87284d875228)@viayuve http://red.qyz.cz/stats/

rebolek

[08:32](#msg5a7ab9aeb3c4a0d376efde6f)@9214 I know, it happened after update to @are1000 's JS code, must be just some simple problem. I will fix it when I get to it.

9214

[08:33](#msg5a7ab9f0e217167e2c5225fb)@are1000 come back to us :couple:

viayuve

[08:34](#msg5a7aba05ce68c3bc74564423)chat stats cool is that written in red does red support web too how do I don't know that.

9214

[08:34](#msg5a7aba2693be87284d87562b)no, it's JS

viayuve

[08:34](#msg5a7aba32e217167e2c522854)oh....o.O

9214

[08:35](#msg5a7aba3c86ef1bb1417aed05)I believe @rebolek used Red to fetch stats

viayuve

[08:35](#msg5a7aba637084124a34479887)red channel?? for what

rebolek

[08:35](#msg5a7aba65ce68c3bc745645c8)Statistics are collected and processed in Red, then uploaded to server in CSV/JSON and displayed using D3.js

[08:36](#msg5a7aba7e6117191e61058692)@viayuve this channel for example :)

9214

[08:36](#msg5a7aba95f283b8e5462dd047)@viayuve you mean \[this](https://gitter.im/red/red)?

viayuve

[08:37](#msg5a7abab84a6b0dd32b9cd9c2)oh they are just chat rooms for different topic I guess

rebolek

[08:37](#msg5a7abac1b3c4a0d376efe4d8)exactly

viayuve

[08:37](#msg5a7abacf7dcd63481f2ab681)can I join ? am I allowed?

rebolek

[08:37](#msg5a7abad693be87284d875a22)of course

[08:38](#msg5a7abae9e217167e2c522bb2)the stats are for all public rooms

9214

[08:38](#msg5a7abaf07dcd63481f2ab6b9)@viayuve https://gitter.im/red/home ;)

viayuve

[08:39](#msg5a7abb3393be87284d875c74)on welcome channel cool just red it I will join all suggested channel

[08:40](#msg5a7abb65b3c4a0d376efe8a4)`New to Red language? Ask any question about it here, move to red/help room for deeper help with your Red code.`\`

[08:42](#msg5a7abbec7084124a34479f57)joined red and help group next time I will ask in help instead of flooding this channel

rebolek

[08:43](#msg5a7abc244a6b0dd32b9ce23f)No problem, if the discussion is too off-topic, participants are politely asked to move to more appropriate room usually.

viayuve

[08:53](#msg5a7abea27dcd63481f2acd32)I dunno but can I run program as service in Mac I use nssm for windows not sure how to do it on Mac

[08:54](#msg5a7abedbf283b8e5462dea4f)is that possible with red

## Thursday 8th February, 2018

CodeTortoise

[07:41](#msg5a7bff14f283b8e54634f4a9)Maybe I will get an answer if I search hard enough, but the answer seems to be no support for the graphical functions on linux. Is that still correct?

BillDStrong

[07:41](#msg5a7bff3a7084124a344eaf97)That is currently correct.

CodeTortoise

[07:42](#msg5a7bff524a6b0dd32ba40199)I keep leaving and coming back to this language. I am fascinated, but I no longer use macOS or Windows in any capacity.

[07:42](#msg5a7bff696117191e610cc0f8)Well, macOS as backup if I do something stupid to all of my computers.

[07:43](#msg5a7bffa7b3c4a0d376f73241)@BillDStrong Are there any documented efforts to supporting linux? Are the problems with desktop environments? Or something lower level?

BillDStrong

[07:44](#msg5a7bffc2b3c4a0d376f73282)Linux is on the very near radar, being worked on by @qtxie but I don't know when it will come out. There are several using wine while they wait.

ghost~5680c5f416b6c7089cc058a5

[07:44](#msg5a7bffd393be87284d8e6180)Well, hopefully linux GUI support will come soon as Team Red is soon going to recruit new team members so someone will be very soon working on it.

CodeTortoise

[07:45](#msg5a7c0035f283b8e54634fab1)@nc-x Neat! I feel the ambition of Red is worth supporting.

ghost~5680c5f416b6c7089cc058a5

[07:46](#msg5a7c003d6117191e610cc528)https://github.com/red/red/pull/2960 This PR adds some more GUI stuff for linux, but still quite a lot of work remains to be done.

[07:46](#msg5a7c00567084124a344eb517)@CodeTortoise Yeah! :smile:

BillDStrong

[07:46](#msg5a7c005e6117191e610cc594)Each OS uses a different GUI system. On Linux that is compounded by the shear number of options. I believe they have settled on a gtk backend, but since it is different from the other, and @qtxie is learning it as he goes, it is taking some time.

CodeTortoise

[07:47](#msg5a7c008d7084124a344eb651)Well, if I want Red on linux, I better do something about it.

rebolek

[07:48](#msg5a7c00b3f283b8e54634fd8c)@CodeTortoise see RedGTK project

mydoghasworms

[07:49](#msg5a7c0112ce68c3bc745d6b7d)@BillDStrong Rebol somehow approached this differently. It had a cross-platform GUI that worked on Linux as well, where it must have interfaced directly to X/X.org, I suppose. The drawback was that it did not achieve a native look on any platform.

BillDStrong

[07:49](#msg5a7c0114f283b8e54634ff5f)Your help would be quite welcome, I am sure. https://toltex.u-ga.fr/RedGtk This is an experimental version, but I don't use Linux, so I have no idea how well it is working. Also, you might look at the Red Trello page to see what is still needed.

CodeTortoise

[07:50](#msg5a7c01487dcd63481f31e5a4)Yes, I feel it is an interesting language to consider building an operating system.

[07:51](#msg5a7c01817084124a344ebcc5)I can imagine having a unified programing language/shell/interface language be a fantastic experience

BillDStrong

[07:52](#msg5a7c01a5f283b8e546350322)Rebol addressed this the same way, and did have a native look, for the time it was initially created. On Linux Rebol chose to write to X, rather than one of the toolkits, which isn't a great option now that Wayland is a thing.

CodeTortoise

[07:52](#msg5a7c01b686ef1bb141823187)Maybe it would be interesting to build a display server from the ground up to work with Red.

[07:52](#msg5a7c01be4a6b0dd32ba41002)Or, as Red.

PeterWAWood

[10:31](#msg5a7c27047dcd63481f32c3d6)@BillDStrong As far as I know, @qtxie is not currently working on a GTK+ backend. Most of the work done so far has been by community members. The GTK+ backend is not yet scheduled to be included in a release.

The GTK+ backend is currently behind Android Support, Full I/O, Modules. CG and Concurrency in the pre-ICO roadmap. The roadmap has yet to be adjusted to fit in the Red/CCC dialect.

greggirwin

[17:35](#msg5a7c8a77ce68c3bc7460b306)Rebol used AGG internally, and used all its own styles rather than native widgets. Pros and cons. I imagine we'll see something like that for Red in the future as well, but it's not on the roadmap at this time. And the reason Linux GUI hasn't been a priority is because it wasn't deemed valuable from a business perspective. At least not as much as other features.

rebolek

[18:01](#msg5a7c906c93be87284d91ec8b)Rebol used AGG internally only after 2005 (View 1.2 or 1.3 I believe), just to be precise.

greggirwin

[18:01](#msg5a7c9090f283b8e546387cb7)Thanks for clarifying @rebolek, I do remember that now.

dander

[18:02](#msg5a7c90c1e217167e2c5cfb62)just to clarify, are you guys referring to \[this](https://en.wikipedia.org/wiki/Anti-Grain\_Geometry)?

9214

[18:03](#msg5a7c90d7b3c4a0d376facc8d)@dander yes

rebolek

[18:03](#msg5a7c91097dcd63481f35752c)@greggirwin I do not want to nitpick, it's just that it was outside project at first, done by Cyphre, that was accepted to Rebol. Just for those who are interested about the history :)

[18:05](#msg5a7c916cb3c4a0d376fad176)I remember him showing me some alpha, that went from 2-3fps to 20-30fps. It was amazing :fire:

dander

[18:06](#msg5a7c9199f283b8e5463883cf)Thanks, that is interesting. Is there a similar layer in Red, or is it not really equivalent to anything there now?

9214

[18:06](#msg5a7c91b17084124a34523af1)@dander read @greggirwin's message above

greggirwin

[18:07](#msg5a7c91d97084124a34523b8b)@rebolek, all good. I can't wait until we hook Cyphre into Red. :^)

rebolek

[18:07](#msg5a7c91e14a6b0dd32ba78f74)It is related to Draw.

[18:08](#msg5a7c92207084124a34523d3f)I think that current OSes are much better than 2005 versions, so the need for such library is much lower ;)

[18:10](#msg5a7c9286b3c4a0d376fad9bf)@greggirwin That would be cool :)

dander

[18:14](#msg5a7c937f86ef1bb14185d772)@9214 I think I didn't quite understand from his message. I guess what I really want to know is whether Draw is a complete replacement for it, or if they don't quite fit the same niche.

greggirwin

[18:15](#msg5a7c93c5ce68c3bc7460f153)With `draw` and eventually an effect pipeline, you can draw all your own widgets. R3 added a `gob!` (graphic object) type, which Red could as well, which is designed to be lightweight and composable.

BeardPower

[19:08](#msg5a7ca010b3c4a0d376fb2f4e)Having gob! in Red would we 😲🤓😎

pekr

[19:24](#msg5a7ca3d393be87284d926bb0)Doc imo confirmed, that some lower level construct is comind due to the games development efforts, etc.

haiitch

[19:33](#msg5a7ca5f86117191e6110bfd2)@greggirwin @rebolek Re: GUI stuff. AGG is awesome (in C++ and another old implementation in Pascal) I've used it in the past. Unfortunately it was a terrible decision to hardwire Rebol's GUI stuff to software rendering. Part of the reason I'm writing my own stuff using OpenGL acceleration from the get go. I may still use the API design for inspiration in some cases, mainly because I'm still not a real Rebol/Redlang programmer, more of a pragmatic tourist at this time.

[19:42](#msg5a7ca83cce68c3bc74616e48)\[!\[hypermedia-06.png](https://files.gitter.im/red/red/welcome/Txjs/thumb/hypermedia-06.png)](https://files.gitter.im/red/red/welcome/Txjs/hypermedia-06.png)

[19:51](#msg5a7caa44ce68c3bc746179bd)Rebol's GUI just wasn't a good match. But the good news is I'm aiming to make this GUI stuff scriptable using Red, or a Red-like language.

rebolek

[20:05](#msg5a7cad787dcd63481f3618f8)@htrob in the hindsight you're right, but 13 years ago the situation was different. Original Rebol graphics was extremely slow and AGG was huge improvement (as I mentioned, by factor of 10) and it was small enough to bundle it with Rebol. Also state of 3D APIs at that time was bit different from today. Cyphre had OpenGL version of Rebol later, but that was never released because R3 somehow died.

haiitch

[20:11](#msg5a7caef97084124a3452e3c2)@rebolek I know. I don't mean to be critical of Rebol, but trying to see how things can be made better. You can't make things better if you convince yourself that everything is fine and every design decision was right. You're telling this to someone who made the exact same mistakes. But the experience was useful because not everything is easily accelerated using OpenGL anyway.

[20:12](#msg5a7caf104a6b0dd32ba8447f)I'm interested in getting more things right in the future, not in justifying the past.

BeardPower

[20:23](#msg5a7cb1d76117191e6111023a)@pekr That would be great. Does anyone know something more about it?

greggirwin

[23:30](#msg5a7cddaae217167e2c5eb523)@htrob, more nice pics. You have style.

## Friday 9th February, 2018

gour

[10:15](#msg5a7d74ac7dcd63481f399a92)morning

9214

[10:15](#msg5a7d74ca6117191e61148b5d)@gour :wave:

gour

[10:15](#msg5a7d74d84a6b0dd32babd9cc)do you consider that atm Red could be used instead of e.g. Python for writing simple/small text-manipulation utilities?

[10:16](#msg5a7d74f493be87284d96345d)parsing text files, regex-based transformations etc.?

9214

[10:16](#msg5a7d74f6f283b8e5463ced59)yes, though it depends on size of the input

[10:16](#msg5a7d750eb3c4a0d376ff156e)we don't have GC yet, so large files might blow everything up

gour

[10:16](#msg5a7d750f4a6b0dd32babdb05)@9214 what is the current scope for the size?

[10:17](#msg5a7d751d93be87284d96356b)couple of MBs?

9214

[10:17](#msg5a7d752c7dcd63481f399d6e)I can't say specific numbers, @rebolek have experience with processing bulky data, he might know

gour

[10:17](#msg5a7d7544ce68c3bc7465110d)ok, will wait for @rebolek's reply then

rebolek

[10:18](#msg5a7d755bce68c3bc74651189)@gour what do you want to know?

gour

[10:18](#msg5a7d75637dcd63481f399f2a)i must admit i'd like to see/have some nice static-site-generator (ala Hugo) written in Red

9214

[10:18](#msg5a7d757b86ef1bb1418a138c)@rebolek has something to show you ;)

gour

[10:18](#msg5a7d758dce68c3bc74651208)@rebolek hello, well whether it would be convenient to learn and use Red instead of Python for writing smaller text-utility scripts?

rebolek

[10:19](#msg5a7d75a4b3c4a0d376ff1802)Of course, why not? :)

9214

[10:19](#msg5a7d75ba7dcd63481f39a058)@gour remember we have dedicated TDPL parser

gour

[10:19](#msg5a7d75c586ef1bb1418a1536)i'm fascinated with the idea of Red, waiting to see Linux GUI support, but wonder whether I can already start learning/using it \*\*today\**

9214

[10:19](#msg5a7d75c693be87284d963884)if you want to stay on text-level, it's a one stop shop

rebolek

[10:20](#msg5a7d75e14a6b0dd32babdf42)You can write text-utilities on Linux right now.

gour

[10:20](#msg5a7d75f06117191e61149206)@rebolek the size of the text input is meantioned as possible showstopper, so wonder what are some practical limits atm?

9214

[10:20](#msg5a7d75f2f283b8e5463cf369)but if you want to process data, e.g. number crutching, then Red might lag behind a bit, because `load` currently is implemented as a mezzanine, not a native, and slows things down

rebolek

[10:21](#msg5a7d7616f283b8e5463cf4f0)If you want to process text data, `read`is enough and fast.

9214

[10:21](#msg5a7d7633f283b8e5463cf558)@rebolek I told that without GC things might blow up, and that you already experienced that with your `text-table`, is that correct?

[10:21](#msg5a7d7640ce68c3bc746516d4)and is it applicable to text processing with `parse`?

gour

[10:21](#msg5a7d7644e217167e2c614fbf)text files of few MBs are not problematic?

rebolek

[10:22](#msg5a7d76657dcd63481f39a572)@9214 that's correct, but it's because text table creates draw block 30x per second, that eats the memory.

9214

[10:22](#msg5a7d7666b3c4a0d376ff1d7b)and I recall that someone already had some problems with parsing large files, but can't remember exact details

rebolek

[10:22](#msg5a7d7672f283b8e5463cf6ed)@gour they are fine.

gour

[10:22](#msg5a7d767d7084124a34567456)@rebolek ok, thank you

rebolek

[10:23](#msg5a7d7699ce68c3bc74651913)@gour if you have something specific on mind, I can point you in the right direction.

gour

[10:24](#msg5a7d76c5f283b8e5463cf854)learning Red seems as worthy investment of my (limited free) time, since it is supposed to address concurrency stuff in the future as well...

9214

[10:24](#msg5a7d76d693be87284d963e30)I think I parsed files ~2MB in size and everything was fast enough

[10:24](#msg5a7d76f6b3c4a0d376ff20c9)specifically searching for unknown byte sequence

gour

[10:26](#msg5a7d774286ef1bb1418a1d66)@rebolek i've program that generates text files with specific, but regular format and would like to parse it, extract data (calendar entries) and then be able to e.g. add that data to several gnome-calendars which i sync with my Android phone via DAVdroid...that's e.g. one use-case

[10:26](#msg5a7d774c86ef1bb1418a1da6)there are other similar ones

9214

[10:27](#msg5a7d77826117191e61149a78)@gour start reading up on `parse` and ask specific questions here or in `/help` room

[10:27](#msg5a7d778c7dcd63481f39ab99)we will help as you go

gour

[10:27](#msg5a7d77a4b3c4a0d376ff2531)i' d also like to e.g. import CSV date generated by (h)ledger - #plaintextacconting and then do some graphical thingis (gui charts) with that for reporting

rebolek

[10:28](#msg5a7d77ce7084124a34567c48)You can either parse CSV manually or use my CSV tool https://github.com/rebolek/red-tools/blob/master/csv.red

gour

[10:28](#msg5a7d77d9ce68c3bc74651f80)what is recommended docs to start learning Red?

9214

[10:28](#msg5a7d77da86ef1bb1418a20e8)or http://www.dobeash.com/munge.html

[10:28](#msg5a7d77e47dcd63481f39ad25)@gour https://github.com/red/red/wiki/Learning-resources

rebolek

[10:29](#msg5a7d77f57084124a34567d43)@9214 munge is for Excel integration, I'm not sure it is usable on Linux

9214

[10:29](#msg5a7d77f64a6b0dd32babebe2)I suggest to start with Rebol/Core guide in parallel with @Ungaretti's notebook

[10:29](#msg5a7d780cf283b8e5463d001a)@rebolek I thought it can be used to parse/load csv files?

gour

[10:30](#msg5a7d78417084124a34567e89)@rebolek libreoffice and import/export Excel stuff

9214

[10:30](#msg5a7d784493be87284d9645c0)@gour but you won't learn Red by learning `parse` or vice versa :D

gour

[10:30](#msg5a7d785393be87284d9645f2)@gour nods :smile:

9214

[10:30](#msg5a7d785ff283b8e5463d0295)though knowing basics will help you to extract and process data

gour

[10:31](#msg5a7d78804a6b0dd32babee5e)@9214 where is the above-mentioed Rebol/Core guide?

9214

[10:31](#msg5a7d788ce217167e2c615b26)http://www.rebol.com/docs/core23/rebolcore.html

rebolek

[10:31](#msg5a7d78996117191e61149ebe)@9214 I believe it's very Windows-oriented and uses Excel and other tools for file manipulation.

gour

[10:32](#msg5a7d78b0ce68c3bc7465235b)thanks a lot!

9214

[10:32](#msg5a7d78d286ef1bb1418a25eb)@gour you should read it with a grain of salt, so to speak, because R2 isn't 100% compatible with Red

[10:33](#msg5a7d78fa93be87284d964927)@gltewalt left some remarks that address incompatibilities  
https://github.com/red/red/wiki/REBOL-Core-Users-Guide:--A-walkthrough-with-Red

[10:36](#msg5a7d799a93be87284d964c0a)`parse` docs:  
\* http://www.red-lang.org/2013/11/041-introducing-parse.html  
\* https://en.wikibooks.org/wiki/Rebol\_Programming/Language\_Features/Parse/Parse\_expressions

[10:39](#msg5a7d7a6186ef1bb1418a2d6f)@gour be sure to take notes as you learn, it's important for us to get feedback from newcomers

gour

[10:40](#msg5a7d7a9e93be87284d9652f3)@9214 will do...any hints in regard to editor's support - (n)vim, ST3...?

[10:41](#msg5a7d7ae37084124a34568f0d)there is, afaict, some old package for ST3...

9214

[10:41](#msg5a7d7aeece68c3bc74652f17)@gour https://github.com/red/VScode-extension

[10:42](#msg5a7d7b01b3c4a0d376ff3840)there're a couple of emacs packages IIRC, and vim bindings

[10:42](#msg5a7d7b18b3c4a0d376ff38c5)https://github.com/red/red/wiki/Editor-Integrations

gour

[10:47](#msg5a7d7c3a7084124a345697ad)i've found vim support [here(https://github.com/ruchee/vim-red) and ST3 one...both look ok

[10:48](#msg5a7d7c6d93be87284d965bd8)taking into consideration all those links provided, it seems there is some work ahead of me :clap:

9214

[10:48](#msg5a7d7c8d7084124a34569976)enjoy the ride :car:

gour

[11:03](#msg5a7d800ce217167e2c6182aa)should i download master or stable (linux)?

rebolek

[11:04](#msg5a7d80276117191e6114cbd1)That's the question.

9214

[11:04](#msg5a7d802a93be87284d967384)start with stable, since there're a couple of regressions in recent builds

gour

[11:05](#msg5a7d806e6117191e6114cd58)does executable still have to be in the same folder where the source file is located?

9214

[11:05](#msg5a7d807f4a6b0dd32bac1a87)@gour can you clarify?

rebolek

[11:06](#msg5a7d80a6e217167e2c6187f1)just run the executable and the you can `do %/path/to/your/script.red`

gour

[11:06](#msg5a7d80cf7084124a3456b621)iirc, there was problem with the Red in the past, that it was not enough that Red executable to be on the PATH, but it had to be in the same folder as the source file

rebolek

[11:07](#msg5a7d80e56117191e6114d0cf)Hm, can't remember such issue.

9214

[11:08](#msg5a7d81447084124a3456b8b7)@gour something to do with shell

[11:09](#msg5a7d815bb3c4a0d376ff5f88)&gt; Note: Running the Red toolchain binary from a $PATH currently requires a wrapping shell script (see relevant tickets: #543 and #1547).

rebolek

[11:10](#msg5a7d818b93be87284d967d54)I have red in `/usr/local/bin` and it runs fine.

gour

[11:15](#msg5a7d82eae217167e2c618ffa)yes, it's #543

[11:18](#msg5a7d83a0e217167e2c6194a1)and #1547 since i'm using fish-shell

[11:21](#msg5a7d843af283b8e5463d485e)creating fish functions solves it

rebolek

[11:22](#msg5a7d8468b3c4a0d376ff72e9)So Red runs fine for you?

gour

[11:24](#msg5a7d84db86ef1bb1418a6d82)yes, after i put executable in ~/bin/red-063 and creating:

```
function red
    ~/bin/red-063 $argv
end
```

as ~/.config/fish/functions/red.fish

[11:27](#msg5a7d859fe217167e2c61a039)@rebolek how does your CSV parser work, iow. i compiled the code and have some file.csv...

rebolek

[11:28](#msg5a7d85c17084124a3456d24a)`csv/decode read %file.csv`

[11:28](#msg5a7d85dd4a6b0dd32bac37b1)you don't need to comile, it's much faster to do testing in interpreter

gour

[11:30](#msg5a7d866918f388e626807ad3)@rebolek that worked. how to do it via compiled code?

rebolek

[11:38](#msg5a7d883c7dcd63481f3a0dc9)@gour same way, just `#include %csv.red` and then you can `read` your file.

gour

[11:40](#msg5a7d88b8e217167e2c61b27a)@rebolek i did compile `csv.red` as it is...

rebolek

[11:41](#msg5a7d88df7084124a3456e3a0)Ah, no. You need to add it to your program.

[11:41](#msg5a7d890193be87284d96a84e)It just provides `csv/encode` and `csv/decode` function and does nothing by itself.

gour

[11:43](#msg5a7d895718f388e626808bef)ok, got it

[11:43](#msg5a7d89687084124a3456e594)iow. i need 'main', right?

rebolek

[11:43](#msg5a7d897e4a6b0dd32bac4e5a)Yes, something like that.

[11:45](#msg5a7d89c0f283b8e5463d694a)There's no `main` in Red, it just executes all code. So you need something like

```
Red[]
#include %csv.red
data: csv/decode %file.csv
print mold data
```

gour

[11:47](#msg5a7d8a4b4a6b0dd32bac520c)@rebolek great. Red seems to be very simple from one side and, still \*\*very\** powerful from the other side

[11:47](#msg5a7d8a517084124a3456e96e):+1:

## Saturday 10th February, 2018

viayuve

[06:57](#msg5a7e97f4e217167e2c66f334)Hello guys any news on token trading ??

[07:01](#msg5a7e98bcce68c3bc746aa620)@gour thanks for asking those questions

rebolek

[07:18](#msg5a7e9cd1ce68c3bc746ab58c)@viayuve see blockchain room, there are two exchanges listing RED.

gour

[08:14](#msg5a7ea9d34a6b0dd32bb1d8c4)@viayuve well, they're quite natural for me while considering whether to invest my time into learning Red or fiddling with some other languages like Python/Go...just curious what is the plan for Red in regard to parallelism/concurrency issues?

greggirwin

[18:42](#msg5a7f3d11e217167e2c69c3dd)@gour, Red will get concurrency, though I don't think the model is frozen in design yet. There are a lot of ways to do it.

gour

[21:51](#msg5a7f694f18f388e626895bb3)@greggirwin so, it will be possible to compete with the Go(lang) on that field?

BillDStrong

[22:09](#msg5a7f6d98b3c4a0d376086aca)What has mostly been discussed is the actor model, but that doesn't rule out other concurrency schemes. The fact that Red's strong suit is working on series maens there is a lot of room for many types of concurrency.

greggirwin

[22:46](#msg5a7f764cb3c4a0d376088e19)@gour, I imagine we'll see (as @BillDStrong says) more than one model implemented over time. The important thing is finding an underlying model that can be used to build all the others, for leverage. Since the reactive model in Red is a dataflow model, and actors are intended to help with coordination, those ideas could influence the core elements as well.

## Sunday 11st February, 2018

virtualAlan

[02:22](#msg5a7fa8df18f388e6268a4188)I have added some new things here: http://www.mycode4fun.co.uk/red-apps  
and here: http://www.mycode4fun.co.uk/rebol-exe-maker  
Will also be adding a Mac page to my site soon ....

greggirwin

[05:50](#msg5a7fd9b618f388e6268ada9a)Thanks Alan, though I'm not sure about RedRoulette. Red is much safer than that. :^)

gour

[08:31](#msg5a7fff6ce217167e2c6c983c)morning

[08:32](#msg5a7fffb4ce68c3bc74704b21)running factorial example from \[Wikipedia page](https://en.wikipedia.org/wiki/Red\_(programming\_language) blows stack with `n = 13`. it is lack of GC reason for that or something else as well?

9214

[08:33](#msg5a7fffdf86ef1bb14195a364)lack of tail-call optimization I'd say

gour

[08:34](#msg5a80002ff283b8e546483c88)@9214 hmm, for `n=13` i bet it should be able to handle it even without it

ne1uno

[08:35](#msg5a80004cb3c4a0d3760a64a6)hitting integer limit?

9214

[08:35](#msg5a80005c93be87284da15771)yes if you'd rewrote this factorial in non-recursive style

[08:35](#msg5a80006f18f388e6268b5980)otherwise you're blowing up the stack

rebolek

[08:36](#msg5a80007a4a6b0dd32bb7442f)`*** Math Error: math or number overflow`

9214

[08:36](#msg5a800080ce68c3bc74704df1)I doubt that TCO would help here actually, since it's not an iterative recursion

rebolek

[08:36](#msg5a800084f283b8e546483e60)So it's math overflow, not stack overflow.

[08:37](#msg5a8000d27084124a3461ba44)Changing the code to accept floats also makes it working:

```
>> fac: func [x][either zero? x [1][x * fac x - 1]]
== func [x][either zero? x [1] [x * fac x - 1]]
>> fac 13.0
== 6227020800.0
```

[08:38](#msg5a80010db3c4a0d3760a66f6)You will hit stack limit at 131:

```
>> fac 131.0
*** Internal Error: stack overflow
```

9214

[08:38](#msg5a80011b93be87284da15ae8)someone should edit wiki, these are extremely poor examples

gour

[09:01](#msg5a80066fce68c3bc74706471)@rebolek thanks. i mixed it with another language, considering that Integers are going to grow according to the need

rebolek

[09:02](#msg5a80068d93be87284da16cb0)We are limited to 32bit integers currently

gour

[09:09](#msg5a80082f7084124a3461d498)ahh, right. forgot there is no 64bit port available yet and that i'm running 32bit version...

[09:09](#msg5a800863ce68c3bc74706c8c)btw. in which league of languages one can expect to put Red in regard to performance, iow. something like Java/Go, closer to C or?

9214

[09:10](#msg5a80087a86ef1bb14195c126)IIRC 5-6 times slower than C

[09:10](#msg5a800897d74ee9f50dad40ce)and Red/System is slower 3-4 times

[09:11](#msg5a8008a418f388e6268b7773)bear in mind that we have absolutely no optimization layers

gour

[09:11](#msg5a8008a7ce68c3bc74706d5a)that's atm, right?

[09:11](#msg5a8008b5f283b8e546485f5e)that's quite well then

[09:11](#msg5a8008de4a6b0dd32bb765ec)...leaving lot of room for improvement

rebolek

[09:17](#msg5a800a2c18f388e6268b7bb7):)

[09:18](#msg5a800a61ce68c3bc747073fa)yes, that's ATM. Optimization will be there after compiler will be rewritten to Red from Rebol. It doesn't make sense to add optimization to current compiler.

gour

[09:19](#msg5a800ab0e217167e2c6cc300)that's scheduled as post-1.0?

rebolek

[09:19](#msg5a800ab8f283b8e546486773)right

[09:20](#msg5a800ae5ce68c3bc747076be)I guess that work on new compiler can start after 0.7.0, because all required features will be there.

gour

[09:21](#msg5a800b2418f388e6268b7f89)there will be another 0.6.x release?

9214

[09:21](#msg5a800b37f283b8e5464869fa)`0.6.4` and `0.6.5` are planned AFAIK

rebolek

[09:22](#msg5a800b4193be87284da18049)We will see :)

gour

[09:23](#msg5a800baee217167e2c6cc607)in any case, plan for Red looks terrific promising to (again) bring some fun into computing/programming

greggirwin

[17:06](#msg5a8078134a6b0dd32bb9420b)We also have to decide if we want to compete on micro-benchmarks. For many things, Red will be faster, as with most HLLs, when you account for dev time. Back in the early 90s, I often told people my VB apps would be much faster than their C apps, usually by a factor of 6-12 months.

gour

[18:06](#msg5a808637b3c4a0d3760cb153):laughing:

## Tuesday 13th February, 2018

JohnPeoplefox

[07:12](#msg5a828fe3d74ee9f50db9a108)Does anybody have information on Red/view backend for Linux? I started experimenting with it on Windows and quite like it.

9214

[07:14](#msg5a829047ce68c3bc747ca1a8)@JohnPeoplefox Linux backend is highly experimental (that is, not officially shipped with Red) and currently being developed by community members  
https://toltex.u-ga.fr/RedGtk

BillDStrong

[07:14](#msg5a829054e217167e2c7931a8)It is in the roadmap, but we are currently waiting for an updated roadmap.

9214

[07:15](#msg5a82909d8c71e5e01d8afc6c)AFAIK it's a very low priority right now, aimed to post-1.0 releases

[07:15](#msg5a8290a2ce68c3bc747ca408)https://trello.com/b/FlQ6pzdB/red-tasks-overview

[07:16](#msg5a8290b58c71e5e01d8afcd6)https://trello.com/c/aoO1zUGr/156-gtk3-gui-backend

rebolek

[07:17](#msg5a8291134a6b0dd32bc3fa6b)There's going to be Red wallet and if enough people will complain it's not available on Linux, we may expect raising the Linux GUI priority ;)

9214

[07:18](#msg5a82913993be87284dadfbf3)I don't think that will be a wise move from business perspective

rebolek

[07:18](#msg5a82914f7084124a346e2f64)serving your customers?

9214

[07:19](#msg5a8291774a6b0dd32bc3fd53)no, wasting time on another GUI backend before 1.0 release

rebolek

[07:19](#msg5a82919ace68c3bc747ca9c3)is it really wasting time? It can be developed in parallel and outsourced to community with some bounty

9214

[07:20](#msg5a8291be4a6b0dd32bc3fe3f)it all depends on lots of factors of course, we'll see

[07:20](#msg5a8291c98c71e5e01d8b02a3)not to mention that /C3 comes first

rebolek

[07:21](#msg5a829202b3c4a0d376173f36)I can run stats to see what is the first question of newcomers and I bet Linux GUI will win.

9214

[07:22](#msg5a82921ff283b8e546550b87)@rebolek why not `copy` or `bind`? :P

mydoghasworms

[07:22](#msg5a82923218f388e6269809eb)Who is working on the GTK backend? Because that is a community effort, right?

&gt; is it really wasting time? It can be developed in parallel and outsourced to community with some bounty

rebolek

[07:22](#msg5a8292427084124a346e33de)@mydoghasworms AFAIK no one, currently.

9214

[07:23](#msg5a82926018f388e626980a95)@rcqls and @honix started a great job, but stumbled onto some problems unfortunately

[07:23](#msg5a82928b8c71e5e01d8b06e6)https://gitter.im/red/red/welcome?at=5a33c01cffa3e379193eb858

mydoghasworms

[07:24](#msg5a8292c2ce68c3bc747caefb)Because I, too, would love to see the GUI for Linux. That, and GC are the two things I am waiting for most.

rebolek

[07:25](#msg5a8292da8c71e5e01d8b0886)Simple GC should be in next release.

9214

[07:25](#msg5a8292f44a6b0dd32bc40431)@mydoghasworms then you better have enough tokens to through in monitor for magic to happen ;)

mydoghasworms

[07:26](#msg5a82930bf283b8e546550fa3)Either you must have tokens or patience. I have the latter... ;-)

JohnPeoplefox

[07:49](#msg5a8298747084124a346e52f8)@9214 Oh, thanks

greggirwin

[19:50](#msg5a83416818f388e6269c69ab)Linux GUI can be incentivized with tokens, but it doesn't have much business value. If the goal is to attract Linux devs, then it has value, but where is the business win there?

pekr

[20:58](#msg5a83516118f388e6269cc7b2)If all we are after is a business win, then we as well might be doomed :-)

rebolek

[21:12](#msg5a8354b6f283b8e54659dd36)Well, it's a programming language. Developers are main target IMO.

greggirwin

[22:17](#msg5a8363dd4a6b0dd32bc95eda)How do we sustain development without a business plan? The goal is to make Red a success, yes? To do that, we need to stay alive, yes? I imagine plans could be suggested by anyone here, and considered, honestly. If someone takes the time to think through a plan, write it up, and put effort into it, I will personally commit to evaluating it and discussing it with them.

[22:20](#msg5a8364a54a6b0dd32bc9632a)There is no single, right answer here. Yes, developers are our primary users, but even that's too broad as a target audience. Developers who build...what? Developers who support Red...how? Developers who need Red because...why?

[22:24](#msg5a8365a44a6b0dd32bc96955)If this was easy, everybody would be doing it, and winning. For every language that has become popular, how many have failed? Can we say why, exactly, in all cases? Can we reproduce that success on demand? If not, what \*can* we do to increase our chances of success?

It's a new world, and a lot has happened in the past 10...7...4 years.

[22:26](#msg5a8365f94a6b0dd32bc96ab1)What do you think will be important to developers in 2, 5, or 8 years?

ne1uno

[23:08](#msg5a836ff28c71e5e01d908a61)128 bit

BeardPower

[23:12](#msg5a8370f27084124a34737f67)128 bit would be pointless. I don't think there will be any 128 bit memory model anywhere in the next 20 years. 64 bit can address 16 exabytes of memory :D

gltewalt

[23:19](#msg5a83728f93be87284db34946)8 bits is plenty

[23:25](#msg5a837405e217167e2c7ec35c)Plenty of real programmers here who could team up and do Linux GUI. Probably in short order.  
But... the powers that be have to take the time (or make the time) to review it, and it might not be in alignment with their ideas

JacobGood1

[23:29](#msg5a8374e17084124a347390db)@greggirwin writing their will?

BeardPower

[23:29](#msg5a8374e9d74ee9f50dbf298b)Deciding on the Window Manager is not easy without flame-wars.

[23:31](#msg5a8375474a6b0dd32bc9b084)I think Linux Desktop is just a niche product. Only GREAT exclusive apps/games would change that. Concentrating on Mobile would be more beneficial.

greggirwin

[23:41](#msg5a8377c318f388e6269d9b84)@JacobGood1, yes, on the blockchain. :^)

[23:43](#msg5a8378298c71e5e01d90b29e)Let me refine a bit.

What do you think will be important to developers in 2, 5, or 8 years,and \*why\*?

JacobGood1

[23:47](#msg5a8378f693be87284db367c9)same thing as now; safety, correctness, efficiency, and ease of development

greggirwin

[23:47](#msg5a837916e217167e2c7ee2c7)Too vague.

JacobGood1

[23:49](#msg5a83797cb3c4a0d3761cf271)using the term developers is vague as well, since there are so many different kinds

greggirwin

[23:50](#msg5a8379cfb3c4a0d3761cf5a0)If you think of Red as a product, what makes it marketable? How do you compare it to the alternatives?

@JacobGood1, yes, which comes back to

&gt; Developers who build...what? Developers who support Red...how? Developers who need Red because...why?

JacobGood1

[23:51](#msg5a8379ece217167e2c7ee751)What is important to a chemical engineer, a game developer, a nerf herder? All very different developers...

gltewalt

[23:52](#msg5a837a3dd74ee9f50dbf4253)Moores law is failing. Handling that fancy multicore multichip stuff will probably be a mandatory feature

greggirwin

[23:52](#msg5a837a5af283b8e5465aaf68)In this way, Android is a clear, well-defined target and need. Even if you don't care what people build on the platform, the pain of building \*anything* there is something we can solve.

[23:56](#msg5a837b24f283b8e5465ab339)@gltewalt, that's already a problem, and has been for some time.

## Wednesday 14th February, 2018

gltewalt

[00:00](#msg5a837c2193be87284db3765a)RAIG  
Random Array of Inexpensive GPUs

greggirwin

[00:01](#msg5a837c3cf283b8e5465ab71a)We can make this a little easier though, because this is really hard, yes? The easy thing is that we have a roadmap. It will get an update to incorporate C3, but we know the next few releases and their feature targets. Those are the core team's targets, and we'll try to add resources to help with them. Beyond that, people need to make a strong case for their requested features. With that we can look at allocating bounties and incentives from the resources we have.

guraaku

[10:39](#msg5a8411f35cc1872645395ec5)Hi, a question about compiling code - I have some code which works fine at the Red console, but gives me a compilation error. Specifically, just this line of code

[10:39](#msg5a8411f47084124a34768214)to-set-path 'hello 5

[10:40](#msg5a841211f283b8e5465d8cab)it doesn't seem to know about to-set-path when compiling. Am I doing something wrong ?

9214

[10:40](#msg5a84121818f388e626a07da8)@guraaku try to compile with `-e` flag

[10:40](#msg5a8412365cc18726453960c7)and welcome btw, I'm glad to see you here :)

guraaku

[10:41](#msg5a84126cf283b8e5465d8ed5)ah ! thanks !

[10:41](#msg5a84126fd74ee9f50dc22dbf)good to see you

[10:42](#msg5a841279f283b8e5465d8f44)Thanks again for your help before, 9214 !

[10:42](#msg5a84127e18f388e626a08022)I've been making steady progress

[10:42](#msg5a841287f283b8e5465d8f69)ok, just compiled again with -e

[10:42](#msg5a8412884a6b0dd32bccb746)got

[10:42](#msg5a841289ce68c3bc74851940)Compiling C:\\Software\\Red\\Playing.red ...  
\*\** Compilation Error: undefined word to-set-path  
\*\** in file: %/C/Software/Red/Playing.red  
\*\** near: [  
to-set-path 'hello 5  
]

9214

[10:43](#msg5a8412c8e217167e2c81c690)@guraaku I answered your questions on SO \[here](https://stackoverflow.com/questions/48454538/how-to-parse-and-translate-dsl-using-red-or-rebol#comment84218824\_48480711), because I don't have enough reputation to comment on answers :(

[10:43](#msg5a8412e5f283b8e5465d9119)@guraaku can you dump whole code in a snippet?

[10:44](#msg5a8412fbce68c3bc74851c55)and what version of Red are you using, last stable or automatic build?

guraaku

[10:44](#msg5a841323e217167e2c81c7c4)last stable, 063

[10:45](#msg5a84132cb3c4a0d3761fea89)ah yes, I saw your answer, thanks :)

[10:45](#msg5a841344e217167e2c81c81d)yep, that's the whole code, apart from the Red block at the start

[10:45](#msg5a84135518f388e626a084c3)Red [  
Title: "Just experimenting"  
]

to-set-path 'hello 5

9214

[10:45](#msg5a84135618f388e626a084c5)I see, perhaps encapping mode isn't implemented in stable releases

guraaku

[10:45](#msg5a84135c18f388e626a084d7)that's it

[10:45](#msg5a841363d74ee9f50dc2331c)ah

[10:46](#msg5a841368b3c4a0d3761feb63)what is encapping mod?

[10:46](#msg5a84136bd74ee9f50dc23344)mode

9214

[10:46](#msg5a8413707084124a34768ac5)try to add `Config: [red-strict-check?: off]` to Red header and try again

guraaku

[10:46](#msg5a84137bce68c3bc74851ef6)ok, just a sec

9214

[10:47](#msg5a8413caf283b8e5465d97b3)current comiler is quite picky and has some limitations

guraaku

[10:48](#msg5a8413f7e217167e2c81cc5f)ok, that actually got further

[10:48](#msg5a8413f97084124a34768d93)Compiling to native code...  
\*\** Compilation Error: undefined symbol: ~to-set-path  
\*\** in file: %environment/reactivity.red  
\*\** at line: 1  
\*\** near: [~to-set-path  
stack/reset  
word/push ~hello  
stack/reset  
integer/push 5  
]

[10:48](#msg5a8413fc4a6b0dd32bccc073)but still failed

9214

[10:48](#msg5a84141018f388e626a08956)what about `to set-path!` ?

guraaku

[10:48](#msg5a84141b93be87284db656e4)hang on

[10:49](#msg5a84142bb3c4a0d3761fee8a)you mean, instead of to-set-path ?

PeterWAWood

[10:49](#msg5a84142e18f388e626a08a1a)What do you expect `to-set-path 'hello` to evaluate to?

9214

[10:49](#msg5a84143393be87284db657b5)yes

guraaku

[10:49](#msg5a8414397084124a34768e64)ok hangon

[10:50](#msg5a8414895cc1872645397166)that worked !

[10:51](#msg5a84149a7084124a347690f3)Peter: I'm using that because I pass in a word to a function

9214

[10:51](#msg5a8414a0d74ee9f50dc2398e)@PeterWAWood :point\_up: worth a ticket?

guraaku

[10:51](#msg5a8414a218f388e626a08c9a)and I want to set it to a value

[10:51](#msg5a8414aef283b8e5465d9e0b)this is just simplified code isolating the problem

PeterWAWood

[10:51](#msg5a8414bc93be87284db65a12)Then why didn't you use `to set-word`

9214

[10:52](#msg5a8414e293be87284db65b2a)in fact I compiled your script with older build just fine

guraaku

[10:52](#msg5a8414fb5cc18726453974ec)oh

[10:52](#msg5a84150bce68c3bc74852aae)ok, I just took out that config thing from the header, and compiled again, that also worked

[10:53](#msg5a8415155cc1872645397561)so, the to set-path! works

9214

[10:53](#msg5a841515ce68c3bc74852ac6):confused:

guraaku

[10:53](#msg5a841527b3c4a0d3761ff2c5)by the way, are you usually in here ? or am I just lucky to catch you at this time ?

9214

[10:53](#msg5a841542ce68c3bc74852b96)sometimes I sleep ;)

guraaku

[10:54](#msg5a84154ad74ee9f50dc23cea)haha

[10:54](#msg5a84154e18f388e626a0902c)yes, you should, sometimes

[10:54](#msg5a841569e217167e2c81d3e7)ah, sorry, I didn't really know to set-word!

[10:54](#msg5a841578ce68c3bc74852c4d)I was stealing 9214's code from an example he did before :P

9214

[10:55](#msg5a84159318f388e626a091b5)you want to pass word to a function and then set it to some value?

guraaku

[10:55](#msg5a84159d7084124a34769668)it was working fine at the console, so I was surprised when it didn't work when compiling

[10:55](#msg5a8415a693be87284db65e3e)yes

9214

[10:55](#msg5a8415b85cc187264539791f)

```
text
>> foo: func [x][set x 1337]
== func [x][set x 1337]
>> foo 'bar
== 1337
>> bar
== 1337
```

guraaku

[10:56](#msg5a8415d0b3c4a0d3761ff62d)ah, but I'm passing the word in not with a quote

[10:56](#msg5a8415d4b3c4a0d3761ff654)this is coming from my DSL

[10:56](#msg5a8415dd7084124a34769790)so I don't want the user to have to put a quote

[10:56](#msg5a8415e218f388e626a0935d)this is the code

[10:56](#msg5a8415e4f283b8e5465da4ab)SL\_SetField: function \[parmblock] [  
field: parmblock/1  
value: parmblock/2

if type? value = word! [  
value: do value  
]

print \["old value" field "=" reduce field]  
do reduce \[to-set-path field value]  
print \["new value" field "=" reduce field]  
]

[10:56](#msg5a8415ef93be87284db65fe0)sorry, how do I get code formatting like that ?

[10:56](#msg5a8415f818f388e626a093eb)ah, indent or something ?

9214

[10:57](#msg5a84160de217167e2c81d7f4)@guraaku press `Ctrl + Shift + M`

[10:57](#msg5a84163118f388e626a0956c)

```
text
>> foo: func [:x][set x 42] 
== func [:x][set x 42]
>> foo bar
>> bar
== 42
```

guraaku

[10:58](#msg5a84163ed74ee9f50dc24301)ah

[10:58](#msg5a8416424a6b0dd32bcccbdd)that looks a lot simpler

[10:58](#msg5a841655d74ee9f50dc24333)I think I did play around with that kind of thing, but somehow didn't get that working

9214

[10:58](#msg5a84165893be87284db66140)@guraaku https://github.com/red/red/wiki/Guru-Meditations#literal-arguments-and-get-arguments

guraaku

[10:58](#msg5a84166bd74ee9f50dc24381)thanks I'll have a look at that

[10:58](#msg5a84167218f388e626a096e3)may I ask, where abouts are you located ?

PeterWAWood

[10:59](#msg5a841686f283b8e5465da910)@guraaku You should take a look at \[literal arguments](http://www.rebol.com/docs/core23/rebolcore-9.html#section-3.2) too.

guraaku

[10:59](#msg5a841693d74ee9f50dc24433)ah, ok I think I didn't try putting :x in the parameter list

9214

[10:59](#msg5a841697b3c4a0d3761ffa43)you mean geographically? :)

guraaku

[10:59](#msg5a84169b18f388e626a097a0)yep

[10:59](#msg5a8416a3e217167e2c81dbd4)thanks Peter

9214

[11:00](#msg5a8416b218f388e626a09808)Russia/Yekaterinburg

guraaku

[11:00](#msg5a8416b95cc1872645397ed4)I'm on a steep learning curve here ! but having fun :)

9214

[11:00](#msg5a8416c6ce68c3bc748535e8)@9214 @rebolek :eyes: :exclamation:

guraaku

[11:00](#msg5a8416c95cc1872645397f39)ah ok, Australia here

9214

[11:00](#msg5a8416de5cc1872645397f9e)@guraaku enjoy the ride :car:

guraaku

[11:00](#msg5a8416e7e217167e2c81dd76)yep !

rebolek

[11:01](#msg5a8416ece217167e2c81ddb0)what is going on?

guraaku

[11:01](#msg5a8416fa7084124a34769e6c)I had a 3000 line C# translator, I've got a basic version working ofin 100 lines of Red :)

rebolek

[11:01](#msg5a841702e217167e2c81de0f)Ah! :)

[11:01](#msg5a841706e217167e2c81de1e)cool!

guraaku

[11:01](#msg5a84170bd74ee9f50dc247b2)so, a good start I think !

[11:01](#msg5a841721d74ee9f50dc2487a)I think my next issue though is going to be nice error messages

[11:02](#msg5a84173b4a6b0dd32bccd285)hey, gotta go, will come back a bit later

[11:02](#msg5a8417485cc1872645398211)thanks for your help :)

rebolek

[11:02](#msg5a84174b7084124a34769fb0)That will be harder, `cause-error` is messy stuff.

guraaku

[11:02](#msg5a841750f283b8e5465dace9)yes :(

9214

[11:02](#msg5a84175a7084124a34769fcf)agreed, Red is a bit off in this regard

guraaku

[11:02](#msg5a84175f4a6b0dd32bccd377)the nice error handling is probably what a lot of the 3000 lines are...

[11:02](#msg5a8417605cc187264539829b)so.....

[11:03](#msg5a84176ef283b8e5465dad9d)it's always the last 20% that takes up 80% of the code !

[11:03](#msg5a841787e217167e2c81e0c2)but, it's interesting, am learning a lot

[11:03](#msg5a84179118f388e626a09dbc)will soon see how viable this is :)

rebolek

[11:03](#msg5a8417975cc187264539843d)And I guess it won't get better, because, as with Linux GUI, there is no market for better error handling, right @greggirwin ?

guraaku

[11:04](#msg5a8417b3e217167e2c81e190)with a DSL to be used by business clients.... Id nice error handling...

rebolek

[11:05](#msg5a8417ea18f388e626a09f3c)Actually simple wrapper on top of `cause-error` would make it much easier and won't be that hard to do.

guraaku

[11:32](#msg5a841e38f283b8e5465dd867)by the way, is this chat persistent ?

9214

[11:32](#msg5a841e42b3c4a0d3762026d3)@guraaku ?

[11:32](#msg5a841e567084124a3476c5e5)you can chat here whenever you want

guraaku

[11:32](#msg5a841e62f283b8e5465dda08)I mean, if I asked a question, but then had to leave, and someone answered while I was away, could I come back and see the response ?

9214

[11:32](#msg5a841e6418f388e626a0c182)there's plenty of \[other Red rooms](https://gitter.im/red/home) btw

rebolek

[11:33](#msg5a841e6ef283b8e5465dda48)@guraaku of course

guraaku

[11:33](#msg5a841e78e217167e2c8207a9)oh

9214

[11:33](#msg5a841e7c5cc187264539ab03)@guraaku yes, usually the person who answered mentions you directly

rebolek

[11:33](#msg5a841e84e217167e2c8207ce)you can download archive of all chat messages, if you want.

9214

[11:33](#msg5a841e8a7084124a3476c7ab)and message indicator turns orange

guraaku

[11:34](#msg5a841eaa18f388e626a0c326)ah ok

[11:34](#msg5a841ec118f388e626a0c3ec)sorry, am new to this - so, would help channel be a better place to be asking questions ?

9214

[11:34](#msg5a841ed25cc187264539ac46)@guraaku either in `/help` or here, yes

rebolek

[11:34](#msg5a841edc93be87284db690f0)Only if you have enough experience points to make it to level 2.

guraaku

[11:35](#msg5a841eeee217167e2c820a4a)ah ok, I'll have to work my way up :)

9214

[11:35](#msg5a841ef1f283b8e5465ddcb2)`/help` is usually for code reviewing and solving specific problems

rebolek

[11:36](#msg5a841f2193be87284db6924e)@guraaku I guess that turning 3000 lines of C# to 100 lines of Red takes you level 3 at least ;)

guraaku

[11:36](#msg5a841f27e217167e2c820b43)haha

[11:36](#msg5a841f3d18f388e626a0c6bd)well, with the help you guys have given me tonight, I may be able to present something usable to my team tomorrow :)

rebolek

[11:36](#msg5a841f50b3c4a0d376202c5b):+1:

9214

[11:36](#msg5a841f51e217167e2c820c20)

```
text
>> 3000 / 100
== 30
```

guraaku

[11:37](#msg5a841f79f283b8e5465ddf1e)actually, though, I somehow doubt that we would make the move to Red, for real production stuff, at this stage

[11:37](#msg5a841f844a6b0dd32bcd0237)but, ..... gotta start somewhere !

9214

[11:38](#msg5a841faa7084124a3476cd69)it's pretty damn good for pet projects and prototyping at this stage

guraaku

[11:38](#msg5a841fb7d74ee9f50dc2741c)yes, definitely

rebolek

[11:38](#msg5a841fc04a6b0dd32bcd0406)Right, Red is still in alpha, it's probably not the right time to make switch, but getting people hooked on, that's important right now.

9214

[11:39](#msg5a841fdce217167e2c820f8b)spread the virus :japanese\_ogre:

guraaku

[11:39](#msg5a841fe7f283b8e5465de099)even at this early stage though, yes, I think it could be definitely used for prototyping stuff

[11:39](#msg5a841fea4a6b0dd32bcd054f)testing out ideas

[11:39](#msg5a841ff8b3c4a0d376202fff)even if in the end we end up using some other language to implement the real thing

[11:40](#msg5a84201fd74ee9f50dc276e2)or, even to use it on some utilities

[11:53](#msg5a84234c18f388e626a0da76)oh :(

[11:53](#msg5a842354f283b8e5465df549)I got another similar issue

[11:55](#msg5a8423955cc187264539c70c)I have a View, in which I define use request-file to allow the user to chose a file

[11:55](#msg5a8423c84a6b0dd32bcd1bc8)

```
button "library" [fname/text: to-string libfile: request-file]
```

[11:56](#msg5a8423dbe217167e2c82256f)and then in a function, I refer to libfile

[11:56](#msg5a8423e37084124a3476e0be)again, at console it is fine

[11:56](#msg5a8423ed93be87284db6ac1a)but doesn't know about libfile when compiling

rebolek

[11:58](#msg5a842455d74ee9f50dc28e41)Compiler is much stricter, I would add `libfile: none` somewhere at top level.

9214

[11:58](#msg5a842472f283b8e5465dfaeb)or use one of @rebolek's builds and compile with `-e` flag

[11:59](#msg5a8424bff283b8e5465dfe1f)gtg

guraaku

[12:05](#msg5a842620ce68c3bc74859227)hey, thanks again !

[12:06](#msg5a842638b3c4a0d37620568b)yep, I just put the libfile: none at the top, and that did the trick

[12:08](#msg5a8426a3ce68c3bc74859502)with that, I now have a little exe which can translate my DSL into Red code, then I can compile that generated Red and it does what the DSL says it should do ! :)

rebolek

[12:09](#msg5a8427084a6b0dd32bcd2d01):clap:

guraaku

[12:10](#msg5a84272e18f388e626a0f18d)I think that will do me for tonight's work :)

[12:11](#msg5a84277ace68c3bc748598de)in general, would you expect that the compiler will behave differently to interpreter ? or is the goal that what runs in the console should also compile ?

DideC

[13:21](#msg5a8437bd93be87284db7268d)Rebol was said to be "not compilable" by his creator (Carl S.).  
Dockimbel prove thats its not undoable, but there is some parts that can't be compiled at all (generated code) so must be interpreted by the executable. `layout` is one case where the code is generated (convert "VID" dialect to faces, and their accessors are generated funcs), so the compiler can't pick your `libfile:` word as a variable, cause its just data at the compile time. Then you have to "declare" it manually before.

9214

[16:16](#msg5a8460e5d74ee9f50dc41c94)@guraaku the goal is that both interpreted and compiled behavior should be the same, but Red is too dynamic in its nature to be fully compiled to machine code, and, as @DideC said, some parts should be interpreted.

Current compiler was designed for bootstrapping phase specifically and isn't feature complete. As I understand, JIT compilation and new stack model (dyn-stack ?) will mitigate most of compiling issues in the future. For now we have experimental encapping mode, which, instead of compiling script down to machine code, wraps it up in Redbin format (if I'm not mistaken) and interprets it on launch as calls to runtime.

[16:17](#msg5a8461105cc18726453b696e)I'm out of my league with technical details, @greggirwin should pop up here soon and hopefully he'll explain that part in a more detail

greggirwin

[17:11](#msg5a846dd45cc18726453bc758):point\_up: \[February 14, 2018 4:03 AM](https://gitter.im/red/red/welcome?at=5a8417975cc187264539843d) @rebolek...hey now. ;^) I was going to suggest the same thing about wrapping `cause-error`, especially if the error handling in the dialect is consistent.

rebolek

[17:13](#msg5a846e257084124a3478d42a):innocent:

greggirwin

[17:13](#msg5a846e2ff283b8e54660028c)&gt; I guess that turning 3000 lines of C# to 100 lines of Red takes you level 3 at least

@rebolek, but we're 1-based, so @guraaku may be level 4! Anyone know how many levels there are?

9214

[17:13](#msg5a846e30e217167e2c8423d7)@greggirwin idea about error-handling dialect was proposed quite a few times

[17:14](#msg5a846e74b3c4a0d376225c20)@greggirwin according to my scientifically correct calculations, there are:

```
>> to integer! to binary! red
== 16711680
```

levels

greggirwin

[17:16](#msg5a846ef3f283b8e5466006c0)&gt; in general, would you expect that the compiler will behave differently to interpreter ? or is the goal that what runs in the console should also compile ?

@guraaku the goal is to have the same behavior, but we can do all kinds of funky things in Red that may be tricky for the compiler to handle, hence, `-e` mode makes a single EXE, but interprets everything internally. As you find things that don't compile, or don't work when compiled, see if there's a ticket and make one if not. That's helpful, because even if they take time to fix, people know what to expect.

[17:18](#msg5a846f5dce68c3bc7487828a)I don't know that I can add more details to what @DideC and @9214 said already. But, chances are, you will be able to \*do* everything you want and have it work the same, your code may just not be as idiomatically Red, or dense. :^)

[17:21](#msg5a847010b3c4a0d376226b19)On production readiness, we don't have GC, but that will come soon. Lack of full I/O limits some things too. Other than that, if your code works, you're probably in OK shape. For things like dev tools and code generators, there is virtually no risk, unless you're doing it via some webhook and given user input. But even there, the risks of a bug affecting things are probably equal between you and Red.

rebolek

[18:32](#msg5a8480be93be87284db925ee)@greggirwin  
&gt; Anyone know how many levels there are?

We need something like \[VIM adventures](https://vim-adventures.com/) to determine user's level.

BeardPower

[18:51](#msg5a848519f283b8e546609f13)VIM adventures is awesome!

[18:52](#msg5a84855118f388e626a37cde)But is it possible to create interactive websites with Red? It does not support html5 right now.

rebolek

[19:18](#msg5a848b9ab3c4a0d376232c43)@BeardPower not interactive websites, but interactive redlets

[19:19](#msg5a848bc4e217167e2c84f139)http://www.rebol.com/reblets.html

BeardPower

[19:26](#msg5a848d607084124a3479a38a)Is this already available in Red?

rebolek

[19:36](#msg5a848fccf283b8e54660e60a)Well...

[19:38](#msg5a849048ce68c3bc74885fc6)basically yes, it can be.

[19:40](#msg5a8490a1e217167e2c85114c)reblets were nothing more than simple GUI apps connecting to server.

[19:44](#msg5a8491a418f388e626a3cb17)The whole Rebol IOS was like ...iOS or Android. Apps.

greggirwin

[21:20](#msg5a84a824f283b8e546617ff9):point\_up: \[February 14, 2018 11:32 AM](https://gitter.im/red/red/welcome?at=5a8480be93be87284db925ee) @rebolek @BeardPower, Doc and I talked about things along these lines on our trip. We think it's a \*very* good idea. We can reward people with tokens for learning Red, and also have them build reputation and skill lists based on what they've achieved.

9214

[21:27](#msg5a84a9b5e217167e2c85a449)though locking up community functionality behind points (like on SO) or tokens IMO is a bad idea

greggirwin

[21:29](#msg5a84aa41ce68c3bc748900bc)It doesn't mean they would be locked. The blockchain is a data store. Unless we specifically make a private one, it's a public ledger. We could also easily extract the data and present it in different ways. It does need to be usable.

[21:30](#msg5a84aa62e217167e2c85a876)What are the alternatives we can compare against?

rebolek

[21:34](#msg5a84ab814a6b0dd32bd0acfb)@greggirwin I love Infocom games and always wanted to port Z-machine to Red, but never got the time. Anyway, I did some prototype of Red game/tutorial, where you have one datatype as start and once you learn how to use it, you will get another, or actions/functions as bonus to continue with the supposed tutorial.

greggirwin

[21:35](#msg5a84abbace68c3bc74890a87)@rebolek, me too. I have a lot of IF notes around. One of my first Rebol apps was Hunt The Wumpus. And surely we can port this: https://www.softinnov.org/rebol/rebox.shtml

[21:36](#msg5a84abf818f388e626a468fa)IF puzzle challenges, where you have to solve the problems with code.

rebolek

[21:38](#msg5a84ac58d74ee9f50dc6069f)exactly.

BillDStrong

[21:38](#msg5a84ac5d4a6b0dd32bd0b2ca)All of the education focused languages, such as Scratch and Racket have examples we can pull from. They might also have metrics we can use to see what works best. Then there are the programmer challenges like project euler, that are useful for more advanced users.

9214

[21:40](#msg5a84accaf283b8e546619bdc)&gt; It does need to be usable.

BillDStrong

[21:40](#msg5a84accece68c3bc74890f09)Not to mention we could pull ideas from these 24 hour game jams, and could provide some support for using Red in those situations. (Red should be very good at quick one offs.

9214

[21:40](#msg5a84acd7e217167e2c85b7eb)CVs, resumes

[21:41](#msg5a84ad2018f388e626a4702a)"lvl 1337 Red wizard, will conjure spells and stink code smells for food"

greggirwin

[21:42](#msg5a84ad32d74ee9f50dc60c10)There are a lot of things to learn from, yes. I was just talking about this recently, that we don't just want to copy "tech" solutions, but go back to revisit the ideas behind these teaching tools.

rebolek

[21:43](#msg5a84ad6d7084124a347a650b)you can spent few lives on revisiting teaching

BillDStrong

[21:43](#msg5a84ad79d74ee9f50dc60dfe)Which is why I mentioned metrics that these sites might have. They could help inform a useful direction.

greggirwin

[21:44](#msg5a84adc6e217167e2c85bd5a)Yes, the problem we have now is not a lack of information, but too much of it. How to find the signal in the noise.

BillDStrong

[21:45](#msg5a84ae1093be87284dba4b7e)Actually, have you tried HabitRPG? That is similar to the VimAdventures Example.

[21:46](#msg5a84ae4ace68c3bc74891889)Yes, there is too much noise. We only need about 70db to be creative, I wonder if there is a similar figure for information.

greggirwin

[21:48](#msg5a84aeabb3c4a0d376241390)It would be cool to find the optimum "input level", though it will vary widely by person. I have a friend who works best with lots of input at the same time, which doesn't work at all for me.

BeardPower

[22:07](#msg5a84b315d74ee9f50dc62c67)I think a live coding project like this would also be a great way to learn: https://handmadehero.org/

[22:13](#msg5a84b49318f388e626a4966f)A project like this takes a lot of money, planning and dedication to keep a consistent level of high quality. The best learning experience is through a fun and interesting project, with increasing level of skills needed. These skills will be learned throughout the project. There are even projects, which create an OS from scratch.

[22:17](#msg5a84b58018f388e626a49b3b)Like Minix.

greggirwin

[22:28](#msg5a84b800ce68c3bc74894f75)HandmadeHero looks very cool. I saw another one recently that was like SimCity, but one guy doing it all and posting updates as he did. The commitment is huge, but we hope the RED token, and how we use it, can help us learn new ways to support people who want to work on something, because they care deeply about it. Whether it's a big game, a library, tutorials, artwork, or anything else.

BeardPower

[22:32](#msg5a84b9094a6b0dd32bd0f80f)Citybound? 😎 http://cityboundsim.com/

greggirwin

[22:33](#msg5a84b952ce68c3bc748954ef)Yes! Thanks for finding that.

BeardPower

[22:42](#msg5a84bb3ff283b8e54661e7fd)You're welcome. Red tokens offer alternative ways to support content providers, like Patreon or similar. I really like the approach of Lewis Lepton on his Kha tutorials. They are informative, fun and professionally produced. Having something like that for Red would reach a lot of beginners. https://youtube.com/playlist?list=PL4neAtv21WOmmR5mKb7TQvEQHpMh1h0po

## Saturday 17th February, 2018

viayuve

[12:43](#msg5a8823830202dc012e47b4b2)Interrupt Descriptor Table any way to access

## Tuesday 20th February, 2018

abdllhygt

[08:13](#msg5a8bd8aa6f8b4b99469900ff)hi!

rebolek

[08:27](#msg5a8bdc0535dd17022ecb55fc)@abdllhygt hello!!!

BeardPower

[11:19](#msg5a8c045cc3c5f8b90dde92ea)@viayuve IIRC R/S does not expose it. What are you trying to do?

9214

[11:20](#msg5a8c048e6f8b4b994699f31f)@BeardPower https://gitter.im/red/help?at=5a883213888332ee3a950bc7

BeardPower

[11:24](#msg5a8c056f0202dc012e5d4485)Ah, still about a kernel. I'm also thinking about implementing an exokernel and a libOS in R/S. Can't wait for the Mill development boards 😎

[11:28](#msg5a8c0663e4ff28713aa0d99b)To develop a kernel/OS, you need to wait for Red/OS, as the OS dialect, IIRC, is for implementing and OS in Red.

9214

[11:30](#msg5a8c06d235dd17022ecc4b7f)

```
text
>> os/bells/whistles [exokernel bug-free] yes yes
== make os! [...]
```

BeardPower

[11:38](#msg5a8c08d135dd17022ecc5841)🏆

9214

[12:14](#msg5a8c11176f8b4b99469a3aeb)yay, \[Kestrel project](http://sam-falvo.github.io/kestrel/) is revived

viayuve

[12:50](#msg5a8c19a5888332ee3aaa44dc)@BeardPower so for now I can not make kernel I was working on bootoader but I guess I have to stop now

[12:53](#msg5a8c1a5cc3c5f8b90ddf1ea5)Red/system is like c right if I can make kernel in c why not in red

[13:57](#msg5a8c2961a2194eb80d8bf1a7)@greggirwin is it possible to write kernel just using r/s I already wrote boot loader

BeardPower

[13:58](#msg5a8c298f6f8b4b99469aceb6)@viayuve Yes, R/S is compiled to native code and you have to do memory management yourself. But even in C, it is not possible to write a kernel 100% in C.

viayuve

[14:00](#msg5a8c29e0e4ff28713aa1b597)So no kernel with red for now

BeardPower

[14:00](#msg5a8c29f96f8b4b99469ad2c7)From my understanding, no.

viayuve

[14:00](#msg5a8c2a13a2194eb80d8bf57a)Asm was fun and very fast first time user

BeardPower

[14:01](#msg5a8c2a1c6f8b4b99469ad3e7)R/S would need to expose everything the hardware offers.

rebolek

[14:01](#msg5a8c2a568f1c77ef3a3013fc)That depends how deep you want to dive. You need to write dialect that would output stuff R/S can't.

BeardPower

[14:02](#msg5a8c2a5f6fba1a703a789064)C/C++ has assembler intrinsics, which R/S does not have.

rebolek

[14:02](#msg5a8c2a7ba2194eb80d8bf78a)Yes, so you need to implement it yourself.

BeardPower

[14:03](#msg5a8c2ac953c1dbb7435286a4)You would need Assembler code to achieve it. Gates, privileged mode, portals, TLB etc.

rebolek

[14:06](#msg5a8c2b4b6f8b4b99469adadd)Yes, that's the dialect I was talking about.

viayuve

[14:06](#msg5a8c2b5b6fba1a703a7896fb)Can I remind that my background is not programming. What I usually do is take your chat and put it in goodle to understand many terms.

BeardPower

[14:06](#msg5a8c2b78a2194eb80d8bfe93)@9214 Kestrel sound great, but will it run Crysis? ;-)

[14:07](#msg5a8c2b9f0202dc012e5e2ef5)@viayuve What is your background, as you want to implement a Kernel?

rebolek

[14:07](#msg5a8c2ba3888332ee3aaab4a0)@viayuve ok, than let's forget about kernel :)

BeardPower

[14:08](#msg5a8c2be86f8b4b99469adf66)@rebolek Well, he already coded a boot loader :)

viayuve

[14:08](#msg5a8c2be935dd17022ecd38bd)server operator MCSE

[14:10](#msg5a8c2c736fba1a703a789eb7)@rebolek I can read and understand you know :smile:

BeardPower

[14:12](#msg5a8c2cb70202dc012e5e3732)I see. Well, no Kernel without a little Assembler. A Bootloader and a Kernel are not the parts, which take a lot of time, but drivers are. Which architecture are you targeting? x86/x64, Risc-V, Mill, REX?

[14:13](#msg5a8c2ceda2194eb80d8c07d0)Red is only 32-bit for now, so no 64-bit kernel in Red for you.

viayuve

[14:13](#msg5a8c2d00888332ee3aaabc59)for now x86 I know 32-bit

rebolek

[14:14](#msg5a8c2d37c3c5f8b90ddf9525)@viayuve @BeardPower wow, sorry, I haven't been following the discussion very closely.

viayuve

[14:14](#msg5a8c2d45888332ee3aaabe67)what is Crysis

BeardPower

[14:15](#msg5a8c2d7fe4ff28713aa1d13c)You can only use, what R/S offers right now. It exposes some CPU stats, but you need everything exposed for a Kernel, which you have to add yourself into R/S or even come up with R/OS.

[14:15](#msg5a8c2d868f1c77ef3a3028db)@rebolek No worries :)

viayuve

[14:15](#msg5a8c2d896f8b4b99469aea5a)during my research on boot loader and kernel I found about rust is it good??

BeardPower

[14:16](#msg5a8c2dbf8f1c77ef3a302a31)@viayuve Crysis is a PC Game. It needed a LOT of resources to run, so this was kind of a running gag.

viayuve

[14:16](#msg5a8c2dcba2194eb80d8c0d09)and how I do that any book that can show how to write dialect guessing not available

[14:17](#msg5a8c2e056fba1a703a78ab17)oh never played that on will download it and play it to see what that eats

BeardPower

[14:18](#msg5a8c2e2fe4ff28713aa1d640)@viayuve Yes. \[Redox-OS](https://www.redox-os.org/) is implemented in Rust. It's using a micro-kernel and a capabilities based OS, like Plan 9 from Bell Labs.

[14:22](#msg5a8c2f1053c1dbb74352a641)There is Crysis 1+2+3. In 4k it needs Nvidia GTX Titan x3 (Tri-SLI) for &gt;60fps.

viayuve

[14:23](#msg5a8c2f47a2194eb80d8c172d)@BeardPower I read somewhere micro-kernel is no good that is why major linux distro uses monolithic kernel.

BeardPower

[14:23](#msg5a8c2f5e888332ee3aaacb68)@viayuve Documentation is very sparse, because Red is still in Alpha. Rebol has more documentation on that.

viayuve

[14:26](#msg5a8c302d888332ee3aaad0a2)rebol is dead lang or is it still running.

BeardPower

[14:27](#msg5a8c303f53c1dbb74352aedb)@viayuve Well, this is mostly not true. A micro-kernel is using IPC to communicate with the privileged servers. There was a lot of research in making IPC really fast. SEL4/L4 is an example of that. To make it faster, you can use a hybrid approach, running some privileged code in the kernel, like a monolithic kernel does.  
The Mill architecture would be great for a micro-kernel, as there is no task switching and IPC involved, as it communicates through portals.

If you really want performance and flexibility, use an exo-kernel.

[14:28](#msg5a8c3084a2194eb80d8c20f9)Rebol is still running, as it's now open source. E.g. Rebol v3. But @greggirwin could give you the best information on that one.

viayuve

[14:41](#msg5a8c337ee4ff28713aa1fdfb)I will do research on exo. Every time when I try to make something with red I mostly hit dead end don't know why either its incoplete or some bug So far on putting data from sqlite to Text works fine for me

9214

[14:47](#msg5a8c34e8e4ff28713aa208d0)It would be \*really* interesting to see Forth-like sub-dialect for Red/System

[14:47](#msg5a8c350835dd17022ecd8327)meta-assembler of some sort

BeardPower

[14:47](#msg5a8c350a35dd17022ecd833d)@viayuve You should check out \[Return Infinity](http://www.returninfinity.com/), \[RI](https://github.com/ReturnInfinity), \[BareMetal-OS](https://github.com/ReturnInfinity/BareMetal-OS), \[Xok, Aegis and ExOS](https://pdos.csail.mit.edu/archive/exo/)

9214

[14:48](#msg5a8c35350202dc012e5e7c89)with complete control over hardware, the basement of our Babel tower

viayuve

[14:49](#msg5a8c3564e4ff28713aa20c5b)@toomasv nice paint app

BeardPower

[14:49](#msg5a8c3577c3c5f8b90ddfd8d1)@9214 I always wanted to run Windows, macOS and UNIX at the same time without a VM :D

9214

[14:49](#msg5a8c3593e4ff28713aa20d32)@BeardPower I also dream about HDL dialect :D

toomasv

[14:50](#msg5a8c35a90202dc012e5e80b3)@viayuve Thanks! Rewriting it now.

BeardPower

[14:51](#msg5a8c35dc0202dc012e5e826a)@9214 That would be nice indeed. So when do you release it? ;-)

9214

[14:52](#msg5a8c3610888332ee3aab0092)soon™

viayuve

[14:52](#msg5a8c361b888332ee3aab00cd)@BeardPower I wanted that too no host or guest system

BeardPower

[14:53](#msg5a8c365fa2194eb80d8c532a)@viayuve You can do that with an exo-kernel. There is a github repo, which targets exactly that goal https://github.com/gwoplock/ExOS

viayuve

[14:57](#msg5a8c37760202dc012e5e8d31)@BeardPower wow that is super-cool

BeardPower

[14:58](#msg5a8c379053c1dbb74352ec28)But what I'm really looking for is R/S and R/OS and some "tutorial" on "how to implement the next generation Amiga OS" with Red on the Mill :D

[14:59](#msg5a8c37e16fba1a703a78fb6f)Maybe a 2050 goal ;-)

viayuve

[14:59](#msg5a8c37efc3c5f8b90ddfef2c)amiga os?? what is that

BeardPower

[15:02](#msg5a8c3876a2194eb80d8c64ef)\[AmigaOS](http://www.amigaos.net/) is a micro-kernel based OS for the commodore Amiga and AmigaONE personal computers.

[15:04](#msg5a8c38ecc3c5f8b90ddff69a)\[HaikuOS](https://www.haiku-os.org/) is another micro-kernel OS, a rewrite of the BeOS. Unfortunately, it's not easy to get Red onto it, as it's written in C++.

viayuve

[15:04](#msg5a8c38f035dd17022ecda787)Dead it says on wiki are we reviving rebol in red and than Amiga

BeardPower

[15:06](#msg5a8c3978c3c5f8b90ddffa7c)Yes. There are a few Amiga-like OSes. Some are binary compatible, some API compatible. Unfortunately all of them are abandoned or kind of dead. I'm sure there are plans, or at least "wet dreams" for a Red Operating System :)

[15:07](#msg5a8c39be35dd17022ecdb0b4)As you might know, Rebol was created by Carl Sassenrath, which was also creating the kernel for the Commodore AmigaOS.

[15:11](#msg5a8c3a9b6f8b4b99469b546e)Rebol is an interpreted language. Red is Rebol on steroids, as its also possible to compile to native code.

[15:12](#msg5a8c3ac36f8b4b99469b55f8)IIRC Red is about &gt;90% compatible to Rebol.

Note, that I'm not a Rebol/Red expert :)

viayuve

[15:17](#msg5a8c3c1fc3c5f8b90de013c3)What is llrc

pekr

[15:21](#msg5a8c3cf46fba1a703a7927e6)If I Remember Correctly

viayuve

[15:22](#msg5a8c3d2753c1dbb743532054)I saw video of @dockimbel on YouTube and it says that you can go os lvl or low lvl so I thought I might able to do some kernel stuff

[15:23](#msg5a8c3d578f1c77ef3a30abcc)Oh ii not ll lol thanks @pekr

BeardPower

[15:28](#msg5a8c3e9f8f1c77ef3a30b64e)Yes, you can go low level with R/S. You have to deal with pointer arithmetic, memory management and all the other fancy "C" headaches yourself. @dockimbel mentioned Red/OS some while ago, so I think he was referring to what is possible, if there is the appropriate dialect for it.

[15:30](#msg5a8c3f1c8f1c77ef3a30b9e9)I read on the wiki or gitter, that R/S or another dialect will expose Assembler like bare metal to the language in the future.

[15:36](#msg5a8c408135dd17022ecde94f)@viayuve You have access to the following hardware entities (CPU registers, fpu, etc.): http://static.red-lang.org/red-system-specs.html#section-13

viayuve

[15:36](#msg5a8c409ac3c5f8b90de04181) That would be great. I used some VB recently and connecting to sqlite it was like so easy. And in VB there was no seperate lib for sqlite why in red we need separate libs

9214

[15:37](#msg5a8c40d3e4ff28713aa26bf2)@BeardPower https://gitter.im/red/help?at=5a882e1e8f1c77ef3a1a60c5

BeardPower

[15:40](#msg5a8c417c888332ee3aab6310)@9214 Thanks! I did remember, that you posted this somewhere, but I'm really desperate with the search functionality of the gitter app.

[15:40](#msg5a8c417fc3c5f8b90de04750)&gt;Support for accessing more registers (like status registers) will be added in the future.

9214

[15:41](#msg5a8c41a16fba1a703a7950b8)@BeardPower IIRC Doc also has plans for SIMD support

BeardPower

[15:41](#msg5a8c41aa8f1c77ef3a30cf1b)Great!

viayuve

[15:42](#msg5a8c41de6fba1a703a7952cc)And what is SIMD

BeardPower

[15:42](#msg5a8c41e535dd17022ecdf331)I remember, that we discussed about Red/OS, but unfortunately I don't know the future goals.

9214

[15:43](#msg5a8c420be4ff28713aa2758e)@BeardPower I don't really remember Red/OS talk, though I monitor this chat almost on a daily basis :(

BeardPower

[15:44](#msg5a8c42710202dc012e5ee656)@viayuve Single Instruction Multiple Data. Modern CPUs have special registers and multiple processing elements, to perform the same operation on multiple data(points) simultaneously.

[15:47](#msg5a8c43046f8b4b99469b9f76)E.g. you can split a matrix multiplication into different segments, and each of the processing element calculates it's own region at the same time. Instead of a sequential operation you are now executing the operations in parallel.

[15:47](#msg5a8c431235dd17022ecdfd0d)Like a GPU does.

viayuve

[15:48](#msg5a8c433b888332ee3aab7113)noted is there any way to download chat

9214

[15:48](#msg5a8c4357a2194eb80d8cc011)@rebolek to the rescue

BeardPower

[15:48](#msg5a8c43576fba1a703a795f2e)You get a linear speedup in theory :)

[15:49](#msg5a8c439de4ff28713aa28042)@9214 I need to do a search on it. It was not really a talk, but he mentioned Red/OS, after there was some question about implementing an operating system in Red.

9214

[15:50](#msg5a8c43b7e4ff28713aa28122)aah, I recall something among the lines of ReactOS and such

viayuve

[15:50](#msg5a8c43cfc3c5f8b90de05745)Making is different than theory in my experience

BeardPower

[15:51](#msg5a8c441a6f8b4b99469ba7b3)@9214 Exactly. @dockimbel pointed out, that he "does not really understand", why everyone is using a system language for application work or the like.

[15:53](#msg5a8c449335dd17022ece0a5d)It was also about RedoxOS and HaikuOS.

9214

[15:54](#msg5a8c44aca2194eb80d8cca53)or maybe it was about RedoxOS... :D

[15:54](#msg5a8c44c06f8b4b99469bab2c)it started with R for sure

BeardPower

[15:56](#msg5a8c4524e4ff28713aa28b21)Yeah, hehe.  
Maybe there is a surprise in the upcoming blog article.

[15:57](#msg5a8c454fa2194eb80d8ccf43)Aren't the Commodore/Amiga rights still unused? For sale, so to speak? :D

viayuve

[15:58](#msg5a8c45bea2194eb80d8cd3b8)Like red/os or red/db or red/ffmpeg or red/asm or red/put your mind here

BeardPower

[15:59](#msg5a8c45d2a2194eb80d8cd4e7)Exactly!

[16:00](#msg5a8c4628c3c5f8b90de06787)The newest member, which is being worked on, is Red/CCC (R/C3), for implementing smart contracts on distributed ledgers.

viayuve

[16:01](#msg5a8c4642888332ee3aab856c)Red/game will be awesome

BeardPower

[16:01](#msg5a8c466035dd17022ece1899)Red/world-domination and Red/make-us-rich are also very welcome ;-)

viayuve

[16:06](#msg5a8c4780888332ee3aab906b)When I was working on my patent I found you can not implement everything based on book because book is some knowledge written down, in reality you might have to work with objects that are available to you. So outcome can be very different.

BeardPower

[16:07](#msg5a8c47a66fba1a703a797cd8)Some "brainstorming" what a game/OS/AI/&lt;put in your research field&gt; is striving for, would be very beneficial. I will do some write-up, when I have time.

[16:08](#msg5a8c47ea888332ee3aab92d7)@viayuve Absolutely. Or invent some new objects :smile:

9214

[16:08](#msg5a8c47ec6fba1a703a797e75)@BeardPower from the business perspective, blockchain and ML are on the peak of hype wave, in this regard Nenad made a smart decision with ICO and /C3 project

BeardPower

[16:10](#msg5a8c4865c3c5f8b90de07977)@9214 Absolutely. Everyone and his mom want's to put everything on the blockchain. ML is the next billion dollar thing. Google just released it's TPU, so Red is definitely on the "hype train" :+1:

viayuve

[16:13](#msg5a8c49220202dc012e5f1874)Sure make new object if you have some nano refinery and big R&amp;D lab

BeardPower

[16:14](#msg5a8c4957888332ee3aab9c93)There is also a lot going on in the EU, becoming independent of the US and China in regards of Supercomputing, CPUs, Security and other tech. They want to implement the worlds fastest super computer in the next few years and there are many funding programs around. As the Red foundation and the Red company wants to incorporate in the EU (in France according to the recent blog post), it will open a lot of business opportunities and additional funding.

viayuve

[16:15](#msg5a8c49b50202dc012e5f1d10)Sure EU have migrant problem too specially Germany and Poland

BeardPower

[16:16](#msg5a8c49d035dd17022ece2d8f)Another big business is FinTech!

[16:16](#msg5a8c49f0a2194eb80d8cf4fb)As Red being a data series oriented language, it would fit great for FinTech.

viayuve

[16:18](#msg5a8c4a51c3c5f8b90de0858f)@BeardPower you mean kill COBOL hahabhahahahah

BeardPower

[16:18](#msg5a8c4a706fba1a703a799137)@viayuve Definitely! COBOL and CICS are the two main reasons, that I'm nearly bald ;-)

viayuve

[16:24](#msg5a8c4bae6fba1a703a799980)Thank god my hair are still on my head balding is nightmare for me haack no kill cobol and cics I don't mind at all.

BeardPower

[16:24](#msg5a8c4bb9c3c5f8b90de090ea)The end-user does not care about the language, a killer-app is implemented in, but developers and managers care about time to market. If Red can shorten the development times, but keeping high quality promises, offering great documentation and tools, chances are high, people migrate to it.

[16:25](#msg5a8c4bf36f8b4b99469be332)COBOL is still a big thing, because no one wants to touch code from the 70ies.

[16:28](#msg5a8c4ca2a2194eb80d8d084d)Fortran offers great parallelism constructs, Erlang self-healing and high reliability. Red needs to offer features, you cannot waive.

viayuve

[16:29](#msg5a8c4ce5888332ee3aabb696)So as COBOL developer your demand will skyrocket in 2050 congratulation on that part

BeardPower

[16:33](#msg5a8c4def0202dc012e5f38e3)One thing is for sure: IBM will not go out of business anytime soon.

[16:35](#msg5a8c4e6d6f8b4b99469bf5ad)COBOL is not so bad, if you think about it. It's also very expressive. It's a nightmare, if you come from other languages like C or Java. It needs time until it "clicks". Same with Rebol and Red. Once it "clicks", you don't want to go back.

viayuve

[17:37](#msg5a8c5cc56fba1a703a7a0a27)I am waiting for that clicks

9214

[17:42](#msg5a8c5e0653c1dbb743540e66)https://devops.com/the-beauty-of-the-cobol-programming-language-v2/amp/

greggirwin

[19:08](#msg5a8c7214c3c5f8b90de199cf)So much great chat!

\- Rebol2 is a closed, now frozen language.  
\- Rebol3 lives on in 3 different forks, which you can follow and contribute to.  
\- Red is highly Rebol compatible, but not 100%.  
\- I love microkernels, as I am almost always willing to trade performance for clean design.  
\- Red emits machine language directly, so no ASM layer. In that sense, it \*could* emit anything, as others said. Just not a priority today. If you look at how it works, and I know Nenad has ideas for the V2 design, thinking of your output as data is a powerful model. ASM does that too.  
\- I want to see more language examples in Red, and would also love to see a Forth approach. Rebol1 was written in Scheme, and I think it would be cool to look in both directions. How would you implement Red in Forth, Scheme, etc., and how would you implement Forth, Scheme, etc. in Red?

BeardPower

[19:57](#msg5a8c7da635dd17022ecf922d)Speaking of functional languages: If anyone is interested in a special deal, there is a current \[Humble Book Bundle for functional programming by O'Reilly](https://www.humblebundle.com/books/functional-programming-books?hmb\_source=humble\_home&amp;hmb\_medium=product\_tile&amp;hmb\_campaign=mosaic\_section\_2\_layout\_index\_2\_layout\_type\_twos\_tile\_index\_1)

greggirwin

[20:07](#msg5a8c7fe6c3c5f8b90de1f081)Thanks @BeardPower

## Wednesday 21st February, 2018

dsgeyser

[05:13](#msg5a8cffed6f8b4b99469f9a87)https://github.com/froggey/Mezzano

An operating system written in Common Lisp, and still actively being developed.

[05:21](#msg5a8d01c58f1c77ef3a34cab0)I am not Italian. But in Italian "mezzano" means "pimp". Please pimp my OS.... ;-)

[06:16](#msg5a8d0ecc6fba1a703a7da7fc)Also:  
https://github.com/froggey/Iota

LLVM to Common Lisp transpiler.

BeardPower

[10:54](#msg5a8d4fec6f8b4b9946a1585b)I just finished watching every video and reading the papers on the new Mill architecture. If it can keep its promises, the big boys will be toast. It's hardware is designed for micro-kernels, super fast IPC, no context switches, hardware sandboxing, hardware threads... just WOW. It would definitely be the architecture for a new Amiga, running an OS in Red 😉 Their roadmap is "in sync" with Red, which means, that once Red 1.0 is released, there will be hardware. They are also searching for partners. Could this be a perfect opportunity? 😎🤓

greggirwin

[18:16](#msg5a8db7626fba1a703a82061c)Thanks for following up @BeardPower. I really enjoyed the talk I watched. I'll add that to my list of possible bounties.

## Thursday 22nd February, 2018

mpchean

[17:39](#msg5a8f004ae4ff28713ab28226)Is the new pyramid image on the red-lang page available for download somewhere as an icon?

9214

[17:40](#msg5a8f008853c1dbb743630482)\[!\[red-logo.svg](https://files.gitter.im/red/red/welcome/jOoO/thumb/red-logo.jpg)](https://files.gitter.im/red/red/welcome/jOoO/red-logo.svg)

rebolek

[17:42](#msg5a8f011453c1dbb74363088b)where's Draw source for it? ;)

9214

[17:43](#msg5a8f013ca2194eb80d9cc9f2)\*yells* @toomasv :exclamation:

toomasv

[17:45](#msg5a8f01d68f1c77ef3a408737)@9214 Beautiful! :+1: :+1:

9214

[17:46](#msg5a8f01e56f8b4b9946ab5d3a)guys, I didn't draw it

[17:46](#msg5a8f01ee6fba1a703a897694)it's just an icon from Red site :D

rebolek

[17:47](#msg5a8f0216888332ee3abb3475)nevermind, still beautiful :small\_red\_triangle:

toomasv

[18:11](#msg5a8f07cee4ff28713ab2b2e9)@9214 "These things ... they take time!"

greggirwin

[23:21](#msg5a8f5060a2194eb80d9ebf71)Draw logos to be improved. Gradients TBD: https://gist.github.com/greggirwin/d2613a75c32042521cee472dbf0748e4

## Friday 23th February, 2018

rebolek

[05:38](#msg5a8fa8d553c1dbb7436651c9)nice!

[11:30](#msg5a8ffb500202dc012e742b08)Live version: https://gist.github.com/rebolek/efc2f02a2636b20421aef49c62f1aa00

toomasv

[11:38](#msg5a8ffd460202dc012e74366c)Hilarious!

rebolek

[11:39](#msg5a8ffd576f8b4b9946b068ba):)

[12:39](#msg5a900b8b8f1c77ef3a45e259)Random nonsense changed to partial rotation.

DideC

[14:23](#msg5a9023ea6fba1a703a8f739a)A little more 3Dish https://gist.github.com/DideC/035f5faff08c42e015a105d5850a11b8

rebolek

[14:26](#msg5a9024896fba1a703a8f768a):clap:

BeardPower

[14:29](#msg5a9025566fba1a703a8f7ab8)Nice. :+1:

rebolek

[14:38](#msg5a902760888332ee3ac13c6b)I've updated my version, it's still the ugly one, but now it's dialected!

```
anim: [
    rate 30
    frame frames/1 morph to frame frames/2 in 0:0:1
]
```

BeardPower

[14:39](#msg5a90278ac3c5f8b90df6987a)Marvelous!

[14:40](#msg5a9027dfa2194eb80da304a3)Just a suggestion: wouldn't it be more "natural", if it was: `morph frames/1 to frames/2 in 0:0:1`?

[14:41](#msg5a9028270202dc012e754baa)As I understand, a good DSL should reflect human language?

9214

[14:42](#msg5a902854a2194eb80da30705)it should reflect domain language

BeardPower

[14:42](#msg5a902868c3c5f8b90df69e9c)So it's not really about the "human language"?

9214

[14:43](#msg5a902880c3c5f8b90df69eff)well, it depends :)

BeardPower

[14:43](#msg5a90288e53c1dbb7436923f8)Need to read the books and contents of your links.

pekr

[14:43](#msg5a90289e0202dc012e754e3a)Nice. I do remember something similar from IIRC Jeff Kreiss, some animation dialect ....

9214

[14:43](#msg5a9028a06fba1a703a8f9264)it could be some standardized notation or verbose and human-readable text

toomasv

[14:43](#msg5a9028ab53c1dbb7436924ae)IMO, it is humanly comprehensible language, might be (and usually is) somewhat technical

[14:46](#msg5a9029576fba1a703a8f95b5)"human language" is by far too complex to be used for DSL; may-be "restricted HL" is more appropriate.

rebolek

[14:49](#msg5a9029fc53c1dbb743692bc0)@BeardPower `frame` can be made optional I guess. It makes sense to remove it in this case, but `frame` can be also block of draw data, where it makes sense to prefix it with word.

[14:51](#msg5a902a7d6f8b4b9946b17daf)Anyway, this is toy dialect, nothing serious :)

BeardPower

[14:53](#msg5a902ad235dd17022ee440de)@rebolek Sure, it's just interesting for me, because I had the idea of porting an animation framework and I want to come up with some good DSL for it.

[14:53](#msg5a902afc53c1dbb74369324c)@toomasv Yeah, it should not be too verbose, but still easy to grasp.

[14:54](#msg5a902b39e4ff28713ab8d154)I will write some ideas for my DSL down, maybe you guys can review it and give me some valuable input on it :)

viayuve

[14:55](#msg5a902b486fba1a703a8fa408)@BeardPower can red run on kolibrios

BeardPower

[14:55](#msg5a902b5d53c1dbb74369347d)@viayuve No, but it could be ported.

viayuve

[14:56](#msg5a902b8835dd17022ee44577)you mean write red in assembly lol no way

[14:56](#msg5a902b98c3c5f8b90df6b49d)or may be some win emu can run it

rebolek

[14:56](#msg5a902bb5c3c5f8b90df6b524)Red compiler already outputs x86 code, so the work is partially done :)

BeardPower

[14:56](#msg5a902bbbe4ff28713ab8d442)You would not right Red in assembly, but emit code for KolibriOS.

[14:57](#msg5a902bdac3c5f8b90df6b649)As @greggirwin already said some time ago: Red can emit everything :smile:

viayuve

[14:58](#msg5a902c1cc3c5f8b90df6b781)you mean -t linux-arm

[14:58](#msg5a902c29a2194eb80da31db4)let me test now

BeardPower

[15:00](#msg5a902c8f888332ee3ac15c7e)It would not work, because KolibriOS has it's own Kernel, which Red does not support. But yeah, try it. Maybe KolibriOS can run raw x86 code directly.

viayuve

[15:01](#msg5a902cc68f1c77ef3a46b6cc)compiling to native code...

BeardPower

[15:02](#msg5a902d1a6fba1a703a8fb011)Where is Red/OS when needed ;-)

viayuve

[15:03](#msg5a902d5335dd17022ee45095)may be on break coffee time lol :wink:

BeardPower

[15:05](#msg5a902dc035dd17022ee45415)Maybe :) It would be an awesome project to create an OS with Red on some of the newer architectures. Time, money and maybe skills (well, maybe mostly skills :)) are hindering me to do it :smile:

[15:07](#msg5a902e236fba1a703a8fb568)First challenge: Red 64-bit.

viayuve

[15:08](#msg5a902e596f8b4b9946b19bd4)red produce machine code right ??

BeardPower

[15:09](#msg5a902e94a2194eb80da32b82)Yes. It emits code for x86 (other architectures as well) and the binary format for the target OS: PE, ELF,...

[15:13](#msg5a902f85888332ee3ac16c12)You could emit raw assembler for bare-metal in combination with a boot loader, but if you are running an OS, you also need to spit out the binary format used on that OS.

viayuve

[15:15](#msg5a902ffd0202dc012e757db2)you are telling me no os just use red and run on bare-metal ?? is it possible??

BeardPower

[15:15](#msg5a9030276fba1a703a8fc03c)Yes, if you create a target in Red, which will spit out the needed assembler.

[15:17](#msg5a903094c3c5f8b90df6d854)There is some memory management, interrupt handing etc. needed, so you need a facility, which takes care of that. Embedded devices don't even have an OS.

[15:18](#msg5a9030af6f8b4b9946b1a97c)Whatever runs after the boot-loader, is your OS, simply speaking.

viayuve

[15:18](#msg5a9030de0202dc012e758455)than attach that assembler in boot loader and start the program really never did this kind of thing in my life also I was looking on targets and android is supported so I can build app for android ?? anyone tried that I will try that too.

BeardPower

[15:19](#msg5a90311d35dd17022ee46b47)The goal for Red is to support Android, but I don't know what actually is doable on it.

[15:23](#msg5a9031d953c1dbb743695da0)Yes, the boot loader will start the kernel/OS. E.g. an exo-kernel, which takes care of interrupts, security and a few other things. The OS is just like another app with it's own memory management, threading, I/O etc. You can even run an app without the OS entirely. So you would need to emit code, which will be tailored to the exo-kernel.

rebolek

[15:23](#msg5a9031fda2194eb80da3413c)Red for ESP8266/NodeMCU would be really cool.

BeardPower

[15:26](#msg5a9032a3c3c5f8b90df6e436)A lot of interesting development boards out there :)

[15:27](#msg5a9032de6f8b4b9946b1ba74)And so less time...

[15:29](#msg5a90336ac3c5f8b90df6e89e)@viayuve If you are interested in the starting sequence of a computer -&gt; https://lennartb.home.xs4all.nl/bootloaders/node3.html  
There are a lot of other sources on BIOS/UEFI/OS development, the "holy grail" of development :D

viayuve

[15:37](#msg5a90354535dd17022ee48513)nop its not working i will try after installing too thanks for link

BeardPower

[15:39](#msg5a9035bc888332ee3ac19210)You're welcome. Don't want to go OT here, so I sent you another link as a PM.

greggirwin

[17:06](#msg5a904a070202dc012e762852)Thanks for the animated conversation all! Fun stuff. We should have a Red logo transmogrification contest.

There was some work done on Android some time back, and even some VID pieces are in place there.

rebolek

[17:12](#msg5a904b63a2194eb80da3e7bb)That would be great. And having the promised article would be even greater.

9214

[17:14](#msg5a904be935dd17022ee5135d)and having promised article with animations would be \*awesome*

greggirwin

[17:23](#msg5a904df7888332ee3ac22b5b)@rebolek, I'm sorry if my \*hope* for getting a new blog post has now turned into a broken promise. As I've said, I'm not going to put anything out there without Nenad's approval at this point.

9214

[17:24](#msg5a904e3ea2194eb80da3f8d0)@greggirwin you can post one random letter from an article each day

[17:24](#msg5a904e5d888332ee3ac22e32)perhaps others already did that (@PeterWAWood @RnBrgn ?)

[17:24](#msg5a904e64c3c5f8b90df79d5a)and @Oldes from time to time

greggirwin

[17:25](#msg5a904e9a6fba1a703a908235)`A` is for `article`, the one not yet seen  
`B` is for `Bolek`, who I've kept waiting

rebolek

[17:26](#msg5a904eae888332ee3ac22fc7)Sorry @greggirwin I don't want to sound rudé

greggirwin

[17:27](#msg5a904ee76f8b4b9946b26ff1)I know @rebolek. I'm anxious too, believe me.

rebolek

[17:28](#msg5a904f2835dd17022ee52892)Haha funny phone correction. Rudé means red in Czech.

## Saturday 24th February, 2018

greggirwin

[04:22](#msg5a90e86b0202dc012e795c76)Even your phone knows.

viayuve

[05:58](#msg5a90ff00888332ee3ac5710d)Smart Phone you know it works sometime :wink:

[05:58](#msg5a90ff15a2194eb80da754cc)good morning everyone

[07:08](#msg5a910f5153c1dbb7436daa07)@greggirwin how to emit assembler with binary.

greggirwin

[07:10](#msg5a910fe335dd17022ee8c9a5)You don't need to go back up from down, I imagine. Just emit ASM instead.

[07:10](#msg5a910ffec3c5f8b90dfb3c7e)Or did you mean `binary!`, not "machine code".

viayuve

[07:14](#msg5a9110d353c1dbb7436db0ae)I want to try and run red directly on bare metal whatever is needed for that binary or asm or machine code

greggirwin

[07:15](#msg5a91111a53c1dbb7436db22c)You have your work cut out for you. It's not on our priority list right now, but we'll certainly try to find ways to help people however they want to use Red.

[07:16](#msg5a911141e4ff28713abd35f4)If you can find someone who has done it before, with other langs, that would be a huge help.

viayuve

[07:19](#msg5a911205a2194eb80da7a193)I dunno @BeardPower suggested change target to "red" it will emit assembler and red binary code that attach that to boot loader and change few things and we can run it red on bare metal but I can not find on documentation or on site how to emit that. there is no target as "red". Is there any way to spit assembler out ??

[07:21](#msg5a91125d53c1dbb7436db915)I made boot loader and wanted to make kernel using red but there is no red/os for now so may embedded way i guess

greggirwin

[07:22](#msg5a91129a8f1c77ef3a4b2e1d)There is no ASM in Red at all yet. It emits machine code directly.

[07:22](#msg5a9112c7c3c5f8b90dfb48d9)I'll have to defer to @BeardPower on the rest.

viayuve

[07:26](#msg5a91139435dd17022ee8d77b)machine code means binary and hex code so is it possible to run it on bare metal without os ?? @greggirwin

greggirwin

[07:30](#msg5a91149ac3c5f8b90dfb5090)Not today, because the back end targets are all OSs.

viayuve

[07:33](#msg5a9115376f8b4b9946b60090)you said just emit ASM how ??

PeterWAWood

[07:38](#msg5a91166e6f8b4b9946b605a0)@viayuve There is a Red/System runtime which is compiled alongside the application code. It includes calls to the host OS (via libc) to load the machine code that it produces.

9214

[07:38](#msg5a9116898f1c77ef3a4b3d29)@viayuve you can write compiler for some language in Red that emits assembler, but you can't run Red on bare metal, because Red compiles down to R/S

[07:39](#msg5a9116a0a2194eb80da7b37c)R/S itself relies on syscalls

[07:39](#msg5a9116bbe4ff28713abd49ee)i.e. on operating system at hand and its features

[07:41](#msg5a911718e4ff28713abd4c2a)besides, if you want interpretive language that runs on bare metal, look into Forth

viayuve

[07:46](#msg5a91184b888332ee3ac5cf42)is short no os no red for now got it, thanks guys for answers I will dig in 3d cube now.

PeterWAWood

[10:59](#msg5a9145758f1c77ef3a4c0ecf)@viayuve You can get the compiler to output the "pure" machine code of a Red/System program by using the `--no-runtime` option. It will not include the Red runtime so you can't use `print` in the program. (You would need to write your own input and output routines).

Certainly you could compile a simple program such as:

```
Red/System
a: 1
b: 2
c: a + b
```

[10:59](#msg5a9145a46f8b4b9946b6cd38)I haven't done it myself but I believe the format of the machine code will be determined by the `-t` option.

[11:05](#msg5a9146df53c1dbb7436e98bf)The purpose of the `--no-runtime` option is to allow the production of "OS free" executables.

If I remember correctly, it was introduced when Nenad used to take one day off a week from concentrating on Red to enjoy experimenting. He experimented a little with compiling for Arduino.

He's been working on Red 7 days a week almost continuously for the last six years. So he hasn't had time to experiment.

[11:06](#msg5a9147406f8b4b9946b6d2e1)(He's taking a much needed rest at the moment.)

viayuve

[11:10](#msg5a9148128f1c77ef3a4c18a6)I will try that too @PeterWAWood thanks

PeterWAWood

[11:18](#msg5a9149fa35dd17022ee9c469)@viayuve It looks as though the `-no-runtime` option has not kept up with changes made to the compiler since it was introduced. It exposes a compiler error:

```
Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : Cannot use path on none! value 
*** Where: set-image-info 
*** Near:  [set-integer-at job spec/2/2 + 4]
```

viayuve

[11:19](#msg5a914a370202dc012e7ae7ff)may be old stable

PeterWAWood

[11:19](#msg5a914a3d6f8b4b9946b6df59)I think that it is not going to be a high priority to fix the `--no-runtime` option

[11:19](#msg5a914a53c3c5f8b90dfc36c9)@viayuve Probably "very old stable".

[11:26](#msg5a914bcac3c5f8b90dfc3d2d)@viayuve From a quick look at the compiler, it seems that the `--no-runtime` is still accepted from the command line, the option is not actually used anywhere in the compiler.

[11:32](#msg5a914d5d6f8b4b9946b6eb71)@viayuve You might want to take a look at #2906 and this \[comment](https://github.com/red/red/issues/1772#issuecomment-217625876)

BeardPower

[11:32](#msg5a914d636fba1a703a951863)

PeterWAWood

[11:33](#msg5a914d996fba1a703a95190c)@viayuve Perhaps you can try compiling with the `--no-runtime` option on your machine. The crash that I got was on macOS.

[11:35](#msg5a914e040202dc012e7af885)I checked and also got the crash under Windows 7.

viayuve

[11:37](#msg5a914e6735dd17022ee9d5de)@PeterWAWood error here too

[11:37](#msg5a914e7835dd17022ee9d60e)7 win

PeterWAWood

[11:42](#msg5a914f8b35dd17022ee9db45)#3235

BeardPower

[11:44](#msg5a915020888332ee3ac6c276)@viayuve I'm sorry, if there was some misunderstanding in my posts. There is machine code (Hexdump) and Assembler. Red is compiled to R/S which in turn spits out hex (machine code). To run Red on bare-metal, you would need to emit code, which can run on bare metal. This will of course slice of huge parts and features of Red, as Red and in consequence R/S relies on, as pointed out by others, syscalls and libc. That's why you need to spit out assembler to rewire/strip off this code. You cannot create an OS without assembler calls, as you have to do various stuff directly on the CPU. E.g. loading the interrupt description table, setup code segments or communicate with the PIC. These are assembler instructions. Print was mentioned. Normally it's using printf from libc, which is using a system call to the OS, which in turn writes out to the video memory directly. So you would need to implement Print as a direct write to the video memory. Therefore you would need to emit it (change in the compiler/target). If you change this for everything, which is relying on syscalls, Red would run on bare metal.

viayuve

[11:48](#msg5a9150fd53c1dbb7436ebfca)@BeardPower thanks for very nice explanation.

[11:49](#msg5a9151506fba1a703a95272e)@BeardPower I am still stuck with 3d logo though lol I might make coffee now and take bit rest :wink:

[11:54](#msg5a915270c3c5f8b90dfc58e1)@PeterWAWood I will take out my pi and do some test :smile:

BeardPower

[11:54](#msg5a9152726f8b4b9946b701fd)Sorry, if my posts created a feeling of an easy task. There is of course more to it. I'm lying through my teeth. x86 is a headache with all it's compatibility bloat. The CPUs still support 16-bit crap, so they had to rape the IDT, segment descriptors and what not to address 16-, 32- and 64-bit code. It's a nightmare.

viayuve

[11:56](#msg5a9153066f8b4b9946b703a5)I can understand @BeardPower I have almost 0% knowledge about hardware and system just learning and failing and learning again

BeardPower

[11:56](#msg5a9153086f8b4b9946b703aa)Even at startup, the CPUs are running in compatibility mode. Where is the Mill, when you need it? It's 64-bit only. No compatibility bloat.

viayuve

[11:57](#msg5a915316c3c5f8b90dfc5b2d)goood for them

[11:57](#msg5a91532e6fba1a703a952df5)I went through few video so far

[12:00](#msg5a9153cce4ff28713abe5247)Sometime I forget that red is still in Alpha I guess

BeardPower

[12:00](#msg5a9153f0e4ff28713abe52a6)I recommend to watch every video. You will see, why it is superior to the existing architectures and a perfect and easy target for Red.

viayuve

[12:03](#msg5a915476a2194eb80da8ba3b)I will go through it week end yey :coffee:

[12:08](#msg5a9155b7888332ee3ac6d8c4)If red can connect without any lib to all db over internet like sqlite, mysql etc

BeardPower

[12:08](#msg5a9155d46f8b4b9946b70f34)This is, where Red/OS comes in. It would be a dialect for setting up the segments, IDT, PIC, video memory etc.

[12:09](#msg5a9155f36fba1a703a953898)Then what?

viayuve

[12:10](#msg5a91562c35dd17022ee9f2f1)I can centralize everything :smile: in single place

BeardPower

[12:10](#msg5a9156516f8b4b9946b710f4)Feel free to write an odbc driver for Red 😁

[12:11](#msg5a91568135dd17022ee9f3b6)But you need to wait until ports are implemented.

viayuve

[12:12](#msg5a9156910202dc012e7b1dae)lots to wait for

[12:12](#msg5a9156c8888332ee3ac6dc85)ports and i/o too

[12:13](#msg5a9156d035dd17022ee9f82f)gc too

BeardPower

[12:17](#msg5a9157e6a2194eb80da8c955)Well, if you have good memory management, you don't need a GC.

[12:18](#msg5a9158110202dc012e7b23e0)Needs a good memory re-usage pattern, though.

[12:21](#msg5a9158cd53c1dbb7436ee421)R/S needs manual memory management anyway.

viayuve

[12:22](#msg5a9159078f1c77ef3a4c5dad)and android target is not compiling

BeardPower

[12:23](#msg5a9159568f1c77ef3a4c5ea8)R/S could also spit out LLVM bytecode to leverage it's great code optimization. This would also be an option, but with the cost of needing a dependency. There are a lot of things to consider.

[12:26](#msg5a9159ebe4ff28713abe7008)I never tried the Android target. Android is some special case, as you can run native code, as it's just a layer on top of Linux, or run Java Bytecode.

viayuve

[12:26](#msg5a915a0d8f1c77ef3a4c65ff)\[!\[image.png](https://files.gitter.im/red/red/welcome/GvJl/thumb/image.png)](https://files.gitter.im/red/red/welcome/GvJl/image.png)

BeardPower

[12:27](#msg5a915a1853c1dbb7436ee8e1)I'm only running native code for Android.

[12:31](#msg5a915b06a2194eb80da8d8f1)It seems, that there is some issue with the image handling stuff. Images need a set of functions/specs to be implemented like set/get pixel, conversion etc., which one of it not being implemented correctly.

viayuve

[12:31](#msg5a915b2a6f8b4b9946b7290b)https://www.postmarketos.org/ interesting

[12:33](#msg5a915b906fba1a703a9550d4)linux phone would be batter target I guess for red open hardware too

[12:34](#msg5a915bbc888332ee3ac6f18e)@9214 on which version of red have you compiled those android ap

BeardPower

[12:34](#msg5a915bcc35dd17022eea0c9b)Are you using the actual github version?

9214

[12:34](#msg5a915be56f8b4b9946b72c3c)@viayuve I haven't compiled any android apps

viayuve

[12:35](#msg5a915c0235dd17022eea0d4a)yes latest build from today

[12:35](#msg5a915c166fba1a703a95532d)21feb

[12:36](#msg5a915c5735dd17022eea0e91)@9214 you showed those apps photo how did you got it. I just want to compile it for android

9214

[12:38](#msg5a915cbc53c1dbb7436ef46c)@viayuve  
http://www.red-lang.org/2013/08/033-released-shared-libraries-and.html  
http://www.red-lang.org/2011/12/arm-support-released.html

BeardPower

[12:38](#msg5a915cd153c1dbb7436ef4db)@viayuve Nice, but I'm waiting for the Red-Phone with a Mill CPU 😎

9214

[12:39](#msg5a915d060202dc012e7b3cd0)Android target is highly experimental, I don't think you can compile something for it

[12:39](#msg5a915d18c3c5f8b90dfc8cc9)most of the work on Android bridge was made in private repository

BeardPower

[12:40](#msg5a915d2c0202dc012e7b3da6)Maybe he compiled it for Linux. Android is just a layer on top of Debian.

9214

[12:40](#msg5a915d2c6fba1a703a9557a7)what we have in `red/red` is just PoC I suppose

viayuve

[12:40](#msg5a915d2e8f1c77ef3a4c727e)wow red 0.3.3 can do that while red 0.6.3 can't lol

[12:41](#msg5a915d7c6fba1a703a9559b3)Okay I will try that on debian than may be it will work also how can I get my hands on 0.3.3 or android experimental version

BeardPower

[12:42](#msg5a915da76fba1a703a955a29)I never understood the purpose of Android. Wrapping Linux with a Java layer. People are just crazy 😉

9214

[12:42](#msg5a915dc18f1c77ef3a4c74a5)https://github.com/red/red/tree/master/bridges

BeardPower

[12:51](#msg5a915fd5e4ff28713abe8530)I tried the .Net. It was working for a few minutes. Then the context was going bananas.

[12:52](#msg5a915ff80202dc012e7b48b4)Why a bridge? Wouldn't it make more sense to emit JVM bytecode?

viayuve

[12:52](#msg5a9160126f8b4b9946b73cfc)text-table ??

9214

[12:52](#msg5a9160180202dc012e7b491b)perhaps bridge was easier to prototype

BeardPower

[12:53](#msg5a91603dc3c5f8b90dfc98cc)Or BEAM?

[12:53](#msg5a91604d888332ee3ac70564)Add your fancy VM here.

viayuve

[12:54](#msg5a9160a18f1c77ef3a4c808c)http://learnrebol.com/rebol3\_book.html producing that grid or taxt-table ??

[12:55](#msg5a9160bec3c5f8b90dfc9bb5)text

9214

[12:55](#msg5a9160df53c1dbb7436f037b)@viayuve I don't understand what the question is

[12:56](#msg5a9160fde4ff28713abe89e9)Saphiron R3 fork and Red use different graphical engines IIRC

[12:56](#msg5a9161050202dc012e7b4c76)R3GUI and View

[12:58](#msg5a91615aa2194eb80da8f3c8)currently Red strives to implement only native widgets, `text-table` is not one of them

[12:58](#msg5a916161c3c5f8b90dfc9df4)even in R3GUI they are custom

BeardPower

[12:59](#msg5a9161cc53c1dbb7436f065a)Yes, that's what @greggirwin also told me.

viayuve

[13:01](#msg5a91620de4ff28713abe8d96)\*\** Script Error: path face/parent/type is not valid for none! type  
\*\** Where: find  
\*\** Stack: view layout foreach-face

[13:01](#msg5a91623b6fba1a703a956d6d)https://gist.github.com/dockimbel/091cc787b366a3d88972b8cb9e2878b2

[13:03](#msg5a9162b5c3c5f8b90dfca4a1)dunno why but this produce only table no output at all fields are empty

```
Red [] L: charset "ABCDEFGHI" D: union N: charset "123456789" charset "0" 
repeat y 9 [repeat x 9 [col: either x = 1 [#"^(2028)"][#"A" + (x - 2)]
  append p: [] set ref: (to word! rejoin [col y - 1]) make face! [size: 90x24
    type:    pick [text field] header?: (y = 1) or (x = 1)
    offset:  -20x10 + as-pair ((x - 1) * size/x + 2) ((y - 1) * size/y + 1)
    text:    form case [y = 1 [col] x = 1 [y - 1] 'else [copy ""]]
    para:    make para! [align: pick [center right] header?]
    extra:   object [name: form ref formula: old: none]
    actors:  context [on-create: on-unfocus: function [f e][f/color: none
      if rel: f/extra/old [react/unlink rel 'all]
      if #"=" = first f/extra/formula: copy text: copy f/text [parse remove text
          [any [p: L N not ["/" skip not N] insert p " " insert "/data "
          | L skip | p: some D opt [dot some D] insert p " " insert " " | skip]]
        f/text: rejoin [f/extra/name "/data: any [math/safe [" text {] "#UND"]}]
       if f/data [any [react f/extra/old: f/data do f/data]]]]
      on-focus: func [f e][f/text: any [f/extra/formula f/text] f/color: yello]
]]]] view make face! [type: 'window text: "PicoSheet" size: 840x250 pane: p]
```

[13:04](#msg5a9162c253c1dbb7436f0a8d)http://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html

9214

[13:05](#msg5a91630ae4ff28713abe9153)https://gist.github.com/dockimbel/9ff2fd10e6310d1c4baf2336c6928cf0

viayuve

[13:07](#msg5a91638c53c1dbb7436f0d4c)thanks

[13:38](#msg5a916ae16fba1a703a95957f)@9214 loop for widget like print n numbers text face

[13:39](#msg5a916b0b888332ee3ac735b4)

```
loop 3 view [text "Hello World!"]
```

[13:39](#msg5a916b0dc3c5f8b90dfcc82a)err

[13:45](#msg5a916c820202dc012e7b8359)view \[loop 3 \[text "hello"]]

[13:45](#msg5a916c94888332ee3ac73b01)nop What I am doing wrong

koba-yu

[14:17](#msg5a91740f53c1dbb7436f5007)@viayuve you want to do something like this?

[14:17](#msg5a9174176f8b4b9946b79070)

```
view compose [(collect [loop 3 [keep [text "Hello"]]])]
```

viayuve

[14:48](#msg5a917b22888332ee3ac77ad5)nice thanks

[14:48](#msg5a917b2953c1dbb7436f72e6)@koba-yu

koba-yu

[14:51](#msg5a917bf40202dc012e7bc8bf)@viayuve your welcome!

viayuve

[14:53](#msg5a917c5f6f8b4b9946b7b421)@koba-yu it is row like how to put it in column like structure??

9214

[14:57](#msg5a917d626fba1a703a95e790)

```
text
view collect [keep 'below loop 3 [keep [text "text"]]]
```

viayuve

[14:58](#msg5a917da7e4ff28713abf0cc5)thanks @9214

koba-yu

[15:04](#msg5a917ee735dd17022eeaaa4b)@9214 Ah, not needed to use `compose`, thank you!

9214

[15:05](#msg5a917f406fba1a703a95f031)@koba-yu you're welcome :)

greggirwin

[16:04](#msg5a918d016fba1a703a963224)@BeardPower, there was likely a request from the investors to see if a .NET bridge could be built. Just my guess. As with libRed, bridges will allow for interop with other platforms.

BeardPower

[17:38](#msg5a91a308a2194eb80daa31c2)@greggirwin I see. Form a .NET stanpoint IT makes sense, to call Red code through a bridge, but if Red would emit CLR bytecode, that would be the best solution possible.

9214

[17:44](#msg5a91a49935dd17022eeb6715)@BeardPower you meant CLR bytecode (IL)?

BeardPower

[17:49](#msg5a91a591a2194eb80daa415d)@9214 Yes, fixed. Damn autocorrection on my phone.

[21:46](#msg5a91dd2235dd17022eec72b6)Is https://doc.red-lang.org/ down?

[21:52](#msg5a91de99c3c5f8b90dfeedbe)It's up again.

## Sunday 25th February, 2018

DVL333

[18:21](#msg5a92fea00202dc012e82576f)Is it possible to declare constants in Red? Do they exist?

rebolek

[18:21](#msg5a92febd888332ee3acdf12d)@DVL333 No, there are no constants.

9214

[18:22](#msg5a92fecde4ff28713ac58175)@DVL333 you'll need `protect` dialect to emulate them

rebolek

[18:22](#msg5a92fed9458cbde557c7499b)which is not implemented yet

9214

[18:23](#msg5a92ff0635dd17022ef106e1)meanwhile you can hack your way around with reactors

[18:23](#msg5a92ff2bc3c5f8b90d039980)or any object with `on-change*`

rebolek

[18:25](#msg5a92ffb2e4ff28713ac585b0)is it worth it?

9214

[18:26](#msg5a92ffdb0202dc012e825cd6)@rebolek that's not the right question :)

rebolek

[18:27](#msg5a9300106fba1a703a9c4c20)you know nothing, @9214 . That's the most important question :D

9214

[18:30](#msg5a9300d453c1dbb74375d430)aah, whatever, you gonna answer it all by yourself :zzz:

[18:31](#msg5a930105458cbde557c75426)and don't forget to track my sleep patterns, otherwise you won't climb up on stats ladder

rebolek

[19:06](#msg5a930936458cbde557c77fa4) @9214 sorry, that was just Song of Ice and Fire reference, nothing personal. I was just pointing out that it may be possible to fake constants using different techniques, but it may certainly not be worth it.

[19:06](#msg5a93094a6f8b4b9946be51b1)Anyway, tracking your sleeping pattern sounds like an interesting task ;)

BeardPower

[19:11](#msg5a930a68458cbde557c78784)Just play the game shown in his avatar 😁

[19:14](#msg5a930b210202dc012e8299c9)Rise of the Dragon :+1:

rebolek

[19:17](#msg5a930bbfe4ff28713ac5c56b)I remember that game from Amiga, I loved it!

[19:35](#msg5a9310020202dc012e82b36b)@9214 here's a song for you https://www.youtube.com/watch?v=t7Yw8HBaklo

greggirwin

[19:40](#msg5a93112635dd17022ef165f3)The question should be: What is the goal? (why do you want constants @DVL333 ?)

[19:41](#msg5a931153458cbde557c7ac8e)But I'm also going to work on a deep, remote reactor! that monitors gitter and auto-responds to @9214 posts, always making mine a little longer, so I win on char count too.

[19:41](#msg5a93117ae4ff28713ac5e2a0)Wait! Did I just hear @9214 say "Grrrrr!"? :^)

DVL333

[23:39](#msg5a93492c35dd17022ef279d4)  
@greggirwin I just investigated capabilities of Red and noticed that I don't know, how to declare constants. It is usual feature for many languages so i thought that i could miss something and hence decided to ask here. :^)&gt;

## Monday 26th February, 2018

greggirwin

[00:01](#msg5a934e75458cbde557c8cc7b)@DVL333 OK, great.

9214

[09:02](#msg5a93cd27888332ee3ad1b1f2)@greggirwin you didn't say a P word, so, no "grrr" from me :)

[09:06](#msg5a93ce21458cbde557cb103f)@rebolek nice! Haven't digged in Ilsa's discography though.

greggirwin

[09:44](#msg5a93d70835dd17022ef50176)@9214 you mean Pythonis...

...Tahhhh!

9214

[10:09](#msg5a93dcc0888332ee3ad20dc1)@greggirwin  
https://www.youtube.com/watch?v=f6QBqCNuB3g

BeardPower

[11:12](#msg5a93eb890202dc012e86d035)Is this @9214 on a good day?

Oldes

[13:16](#msg5a9408a235dd17022ef629b9)Q

greggirwin

[17:48](#msg5a94486e458cbde557ce539d)@9214, OK, that made me laugh. :^)

## Tuesday 27th February, 2018

DVL333

[10:10](#msg5a952e920202dc012e8e7bb8)I've found that example of using function attributes ( `catch` and `throw`) for REBOL:

```
root: func [[catch] num [number!]] [
    if num < 0 [
        throw make error! "only positive numbers"
    ]
    square-root num
]
root -4
```

But this example doesn't work in Red - it generates error "no catch for throw". Is there a error in the example or function attributes don't exist in Red?

rebolek

[10:32](#msg5a9533c2c3c5f8b90d0fdaf7)They don't exist (yet).

DVL333

[10:45](#msg5a9536d90202dc012e8eb40f)@rebolek ok, thanks

rebolek

[10:51](#msg5a953823458cbde557d3c3d0)@DVL333 Anyway, catch and throw exist:

```
>> catch [throw 1]
== 1
```

## Thursday 1st March, 2018

meijeru

[09:06](#msg5a97c2866fba1a703ab51e91)`catch` attribute exists in Red/System

## Friday 2nd March, 2018

guraaku

[00:38](#msg5a989d220202dc012e9fe963)Hi :) I'm continuing to work on building my own DSL, and came across macro capability in Red - seems quite useful !

[00:39](#msg5a989d516f8b4b9946db3514)I wanted to make an infix operator - but it seems that functionality is not in Red

[00:39](#msg5a989d58c3c5f8b90d214f49)so, I've made a macro,

[00:40](#msg5a989d6ce4d1c63604af95fc)`#macro [any-type! 'isanyof block!] func [s e] [ reduce ['SL_IsAnyOf s/1 e/-1] ] 5 isanyof [1 2 3 5]`

[00:40](#msg5a989d79e4d1c63604af964e)oops, that formatting didn't work...

[00:41](#msg5a989db58f1c77ef3a70cce2)

```
code
```

[00:41](#msg5a989dc20202dc012e9fec5b)

```
#macro [any-type! 'isanyof block!] func [s e] [
    reduce ['SL_IsAnyOf s/1 e/-1]
]

5 isanyof [1 2 3 5]
```

[00:41](#msg5a989dc553c1dbb74392ddfe);(

BeardPower

[00:43](#msg5a989e148f1c77ef3a70cf70)Just put your code between\`

guraaku

[00:43](#msg5a989e3435dd17022e0e50fe)hmm

[00:43](#msg5a989e440202dc012e9fee57)yes, I thought I was doing that...

[00:44](#msg5a989e55f3f6d24c6827850b)I'll try again...

[00:44](#msg5a989e660202dc012e9feecf)

```
#macro [any-type! 'isanyof block!] func [s e] [
    reduce ['SL_IsAnyOf s/1 e/-1]
]

5 isanyof [1 2 3 5]
```

[00:44](#msg5a989e6b6fba1a703ab9c145):D

BeardPower

[00:45](#msg5a989e8cc3c5f8b90d2153ab)You had an additional \\`at the beginning:`#macro

guraaku

[00:45](#msg5a989e98c3c5f8b90d2153c6)ah

[00:45](#msg5a989e9de4d1c63604af9aaa)ok, got it this time :)

[00:45](#msg5a989eb5458cbde557e51ade)anyway, this macro seems to work well for what I a trying to do

BeardPower

[00:45](#msg5a989ebf458cbde557e51b0b):+1:

guraaku

[00:46](#msg5a989ece53c1dbb74392e0be)

```
SL_IsAnyOf: function [val [any-type!] container [block!]] [
    either (find container val) = none [
        return false
    ][
        return true
    ]
]
```

[00:46](#msg5a989eede4ff28713ae2ee4d)just wondering if this would be a recommended approach for achieving something like this ?

[00:46](#msg5a989ef9e4d1c63604af9c6f)Note, I specifically didn't want to use parse at this point

[00:47](#msg5a989f156f8b4b9946db3c57)I'm using parse for my statements, but didn't want to parse expressions

[00:47](#msg5a989f2cc3c5f8b90d215607)because for now, I figure, just let Red handle the expressions for me

BeardPower

[00:48](#msg5a989f4ac3c5f8b90d215659)http://www.red-lang.org/2016/12/entering-world-of-macros.html

guraaku

[00:48](#msg5a989f5d6f8b4b9946db3d4f)yep, that's what I was reading :)

[00:49](#msg5a989f806fba1a703ab9c4d2)Just a little unsure of where macros really fit in, compared to using parse, for example

BeardPower

[00:49](#msg5a989f94f3f6d24c6827888a):smile: I'm also new to Red. I'm sure the more skilled users will answer your question when they are back.  
E.g. @greggirwin

guraaku

[00:49](#msg5a989f9635dd17022e0e56b5)that blog entry has a macro for implementing a DSL

[00:49](#msg5a989f990202dc012e9ff532):)

[00:50](#msg5a989fdb0202dc012e9ff628)it says, "With macros, it can be moved to compile-time, when suitable."

[00:50](#msg5a989fe6e4ff28713ae2f25e)How are you finding Red so far ?

BeardPower

[00:54](#msg5a98a0afe4d1c63604afa2f1)I think it's great. Tiny, fast and feature rich out of the box. It does not have the bloat of other languages.

[00:54](#msg5a98a0da888332ee3aeb3e1d)A very low memory footprint and fun to code in.

guraaku

[00:55](#msg5a98a0e853c1dbb74392e850)yes, same here. Long way to go, but having fun and making some good progress so far :)

BeardPower

[00:55](#msg5a98a0f5c3c5f8b90d215d5e)It just lacks some important feature like concurrency, ports etc.

guraaku

[00:55](#msg5a98a111c3c5f8b90d215dfd)what would you be looking at using it for ? web stuff ?

BeardPower

[00:55](#msg5a98a1146f8b4b9946db4427)But this will come, hopefully, soon.

guraaku

[00:56](#msg5a98a120888332ee3aeb3ef6)yes, early days, not even version 1.0 yet !

BeardPower

[00:56](#msg5a98a136c3c5f8b90d215e54)Graphical intensive UI, games, services, OS. Everything as advertised :D

guraaku

[00:57](#msg5a98a16c35dd17022e0e5ea1)I'll be interested to see how all this token stuff goes - whether that ends up being a distraction to progressing things, or whether it will help...

BeardPower

[00:57](#msg5a98a193f3f6d24c68279087)I'm not so much into web stuff.

[00:58](#msg5a98a1d235dd17022e0e6046)Me too. I really hope the road-map did not change because of that.

guraaku

[00:59](#msg5a98a1d50202dc012e9ffe8e)ok, me either really - at the moment, just experimenting with replacing our hand written translator for our own DSL

[00:59](#msg5a98a1eb888332ee3aeb42a8)time will tell I guess

BeardPower

[00:59](#msg5a98a1f7458cbde557e52934)That's for sure :)

guraaku

[00:59](#msg5a98a2006f8b4b9946db471a)but yes, I also want to see if I can build a nice GUI

BeardPower

[01:00](#msg5a98a22335dd17022e0e6129)GUIs are easy to create.

guraaku

[01:00](#msg5a98a23835dd17022e0e6164)hehe... mine looks pretty terrible so far ;)

[01:00](#msg5a98a2436fba1a703ab9d071)functional, but doesn't look very good...

BeardPower

[01:01](#msg5a98a2566fba1a703ab9d0ec)Just call it "Retro" ;-)

guraaku

[01:01](#msg5a98a25c8f1c77ef3a70de64)^\_^

[01:01](#msg5a98a28735dd17022e0e627f)Anyway I better get back to these macros ;)

[01:02](#msg5a98a28c35dd17022e0e6292)thanks for the chat

BeardPower

[01:02](#msg5a98a29f888332ee3aeb454d)You're welcome and Godspeed :)

guraaku

[01:02](#msg5a98a2a68f1c77ef3a70df3f)thanks, see you later :)

BeardPower

[01:03](#msg5a98a2db0202dc012ea0023f):+1:

PeterWAWood

[02:42](#msg5a98ba07458cbde557e58638)@guraaku You create an infix operator in Red by making an op! value.

```
>> same-type?: func [a b] [equal? type? a type? b]
== func [a b][equal? type? a type? b]
>> same-type-as: make op! :same-type?
== make op! [[a b]]
>> 1 same-type-as 2
== true
>> 1 same-type-as 2.0
== false
```

greggirwin

[03:03](#msg5a98bf0b6fba1a703aba41b4)Welcome @guraaku! @PeterWAWood beat me to the easy answer on infix.

&gt; I specifically didn't want to use parse at this point

Shhhh, whisper, my friend, 'tis heresy you speak. ;^)

Joking aside, using Red however it works for you is fine. It took me a while to start using `parse`, and even longer to get some of the deep insights that make Redbol langs different. Most important is that you feel free to play and enjoy Red, because things click differently in every brain, and every experiment you perform will teach you something. We're all too happy to offer excessive advice and overload you with suggestions.

Happy Reducing!

guraaku

[05:18](#msg5a98de89f3f6d24c6828757d)Oh! Thanks for that info on infix operators Peter

[05:18](#msg5a98deadc3c5f8b90d2248da)I google and found stuff that said it wasn't possible

[05:18](#msg5a98dec335dd17022e0f4647)I'll give it a try over the weekend

[05:19](#msg5a98def0c3c5f8b90d2249f4)Gregg, don't misunderstand me, I am using parse, and quite impressed with it

[05:20](#msg5a98df31e4d1c63604b08f77)But in my dsl, I have stuff like, Check [block!

[05:21](#msg5a98df576f8b4b9946dc2658)So, I use parse for parsing my statements like that

[05:21](#msg5a98df66458cbde557e60692)But, I stop at Rhett point of expressions

[05:22](#msg5a98df8a8f1c77ef3a71c7ad)And just let Red handle interpreting the block for me

[05:22](#msg5a98df9ae4ff28713ae3dc7d)Sorry for the typos, on my phone

[05:23](#msg5a98dfc5458cbde557e60850)For now, I didn't want to bother writing parse rules for Eg 2 + 2

[05:24](#msg5a98e0146fba1a703abab96c)So, because I am not parsing the block, I needed some other way of handling my isanyof operator

[05:25](#msg5a98e05b8f1c77ef3a71ca9d)Anyway, I'll see if l can manage to get it working 😀

[05:26](#msg5a98e07c53c1dbb74393d905)But yes, I was quite impressed with the simplicity of the macro as well.

[05:26](#msg5a98e08a8f1c77ef3a71cb69)OK, thanks again, catch you later!

9214

[05:53](#msg5a98e6e4e4ff28713ae3fb17)@guraaku macros are fine as long as you don't compile the script, but after that (i.e. after compilation) they are limited to R2 functionality, since current compiler is bootstrapped from Rebol

[05:57](#msg5a98e7d2458cbde557e627e0)as others have pointed out already, creating `op!` is the easiest way to go, albeit slightly limited:

```
>> is-in: make op! func [a b][to logic! find/only/case b a]
== make op! [[a b]]
>> 1 is-in [1 2]
== true
>> 1 is-in [0 3]
== false
>> 'a is-in [a b c]
== true
>> #"A" is-in "ABC"
== true
>> #"A" is-in "aBC"
== false
```

greggirwin

[07:43](#msg5a9900980202dc012ea170ae)@guraaku, you'll find some of us almost abuse `parse` for every purpose, hence my lighthearted comment. What we need to remember is exactly the approach you're taking now. Let Red do all the work it can, and mold it as lightly as possible for your needs. You're on track.

DVL333

[21:45](#msg5a99c605458cbde557eb161e)Some questions:  
1\) What is the difference between `pair!` and `point!` datatypes? They seem to be similar. Can you give an example of `point!` data, how to define it?  
2\) `handle!` datatype - the same question: Can you give an example `handle!` data, how to define it? There isn't any information about this datatype.  
3\) Is there difference between infix and prefix notations? I mean, I can write `op1 + op2` or `add op1 op2` - what is better to use, or is it the same?

greggirwin

[21:51](#msg5a99c76d8f1c77ef3a76bbf8)`point!` is new, and to be finalized. The idea is that pairs will be limited to 2, possibly integer, values, while points are meant to hold 3, and maybe more, float values. Pairs use `x` notation, while points may use `(1, 2, 3)` notation to match mathematics more closely.

`Handle!` is meant to be an opaque handle for OS interaction. You should only ever need it when storing and passing those at the Red/System or OS API level.

Infix and prefix are effectively the same. Use the one that seems clearest in any given situation. e.g., if you're writing a Lisp dialect, you probably want to use prefix. For most other cases, infix is the norm. But there will always be mixed scenarios as well, where you want to use them to control evaluation precedence. That can be either easier or harder for readers, over parens, and is largely subjective.

DVL333

[22:07](#msg5a99cb04e4d1c63604b57c03)@greggirwin Thanks a lot! :+1:

guraaku

[23:10](#msg5a99d9cfe4ff28713ae915d6)Hi @9214 :) Thanks for that suggestion, that looks good. The "t o logic!" makes it a much simpler implementation that what I had done

[23:11](#msg5a99da048f1c77ef3a77152d)Oh, and you said, "macros are fine as long as you don't compile the script, but after that (i.e. after compilation) they are limited to R2 functionality, since current compiler is bootstrapped from Rebol"

[23:11](#msg5a99da3d35dd17022e149877)I certainly had intended compilation - but, are you saying, that's the only problem, that they are limited to R2 functionality ? As long I stick to that, compilation should be fine ?

[23:12](#msg5a99da58e4d1c63604b5c60e)Anyway, for now, it seems I'll go the infix operator route - that's what I really wanted in the first place :)

[23:12](#msg5a99da78888332ee3af180f0)So, I'll keep macros in mind if I need them later on...

[23:14](#msg5a99dae1e4d1c63604b5c7eb)@greggirwin , yes, for now my approach of letting Red do as much of the work as it can, means I can implement stuff more quickly - but on the other hand, it leaves open the possibility that malicious users could make use of any Red functionality in an expression, to do anything they want - delete all files or something.

[23:15](#msg5a99db076fba1a703abff576)Whereas if I completely defined my language, they'd only have available the things I make available to them

[23:16](#msg5a99db3553c1dbb7439912ba)I haven't thought too much about it yet, but a couple of approaches that came to mind were -

[23:16](#msg5a99db568f1c77ef3a7719de)have another pass through the code that looked for anything else other than the things I allow

[23:18](#msg5a99dbb235dd17022e149f0c)or, i notice I could set things to none, eg maybe if I didn't want them creating their own GUIs I could do view: none

[23:19](#msg5a99dbeff3f6d24c682db137)but that could be a lot of work, unless there was some way to set all known words to none ?

greggirwin

[23:38](#msg5a99e07b458cbde557eb934b)That's always the tradeoff. Do we let untrusted stuff in, or do more work to lock it down. We don't have the `secure` dialect in place in Red yet, which will help with sandboxing, and I know I personally want to play with some capability-based ideas.

guraaku

[23:47](#msg5a99e29a6fba1a703ac01729)ah, so you're saying there are plans for a secure dialect ?

[23:48](#msg5a99e2de35dd17022e14bbe5)For now, I'm not too worried about it... what I'm doing is really just exploring possibilities

[23:49](#msg5a99e2fcc3c5f8b90d27d1cb)In fact, our current DSL specifically has syntax to allow access to native C# code

[23:49](#msg5a99e31a6f8b4b9946e16c14)so, that kind of security hole courrently exists in our real implementation

[23:50](#msg5a99e3490202dc012ea657fb)Access to C# was put in there in the first place as a quick and dirty means of extending the DSL if needed

## Saturday 3th March, 2018

9214

[05:14](#msg5a9a2f2253c1dbb7439a389b)@guraaku the rule of thumb is to use macros if you absolutely, positively need to shift heavy computations from run-time to compile-time. There's nothing macros can do that Red cannot, in terms of DSL implementation and homoiconicity. But if you really need them to be compiled, the first step is to make `parse` rules in macros R2-compatible, then you need to ensure that macro transformation works identically both when interpreted and compiled, and it's quite a painful process (I have little experience with that).

guraaku

[05:16](#msg5a9a2fb3c3c5f8b90d28e27c)thanks @9214 , that sounds like a good rule of thumb. :)

9214

[05:21](#msg5a9a30d26f8b4b9946e28212)@DVL333 the difference between `op!` and `function!` is that the former takes \*value* on the left and \*expression* on the right, while the latter takes as many \*expression* as it needs for its arguments (on the right). `op!` have precedence over `function!`s during evaluation, which can be confusing for newcomers. Also, as of now, `op!`s can't accept `'lit-arg` and `:get-arg` syntax. You can think of them as a syntactic sugar over dyadic functions, just don't forget about their precedence and behavior.

[05:22](#msg5a9a30fbe4d1c63604b6fe4b)@guraaku you're welcome, let us know how it goes with your DSL :)

guraaku

[05:23](#msg5a9a31356fba1a703ac12d32)sure, it's still going well so far :)

[05:23](#msg5a9a3155e4d1c63604b6ff32)presented it to the team at work the other day.... not much reaction though

9214

[05:24](#msg5a9a31756f8b4b9946e2841f)puny mortals! :japanese\_goblin:

guraaku

[05:28](#msg5a9a3282888332ee3af2c546)haha..yes...I think they're focussed on other stuff at the moment...

greggirwin

[05:37](#msg5a9a3495e4d1c63604b7093b)&gt; so you're saying there are plans for a secure dialect ?

Likely modeled on the one in R2, to start with.

guraaku

[05:38](#msg5a9a34b9458cbde557ecc1ed)ah ok, I'll have to have a look at that :)

greggirwin

[05:38](#msg5a9a34d2458cbde557ecc23f)http://www.rebol.com/docs/words/wsecure.html

guraaku

[05:38](#msg5a9a34efe4ff28713aea5e27)sounds like progress is still happening ! I was just saying before, I wonder whether the token thing was going to distract from delivery or help it along....

greggirwin

[05:40](#msg5a9a353ae4d1c63604b70bf2)We plan to get a couple more releases out before the team dives deep on the blockchain side, and get things organized to keep things moving on the main language front while they work on Red/C3.

guraaku

[05:40](#msg5a9a35540202dc012ea77d05)yay ! :)

## Sunday 4th March, 2018

guraaku

[05:48](#msg5a9b889a6f8b4b9946e7c587)Another simple thing I came across today...

[05:48](#msg5a9b88a1f3f6d24c683432c6)I wanted something like,

[05:48](#msg5a9b88b1c3c5f8b90d2e2e5a)

```
count item in order
```

[05:49](#msg5a9b88cc53c1dbb7439f7d89)I found I can just write a function, count, like

[05:50](#msg5a9b890ef3f6d24c6834341d)

```
count: function [item 'in order] [ ;do stuff...]
```

[05:50](#msg5a9b89166fba1a703ac674f5)then I can call it like

[05:50](#msg5a9b892135dd17022e1b3a65)

```
count x in y
```

[05:51](#msg5a9b89696f8b4b9946e7c856)so for that particular case, where you want your arguments interspersed with "keywords", this is simple

[05:51](#msg5a9b89796fba1a703ac6761f)(so long as your function name isn't something already in use...)

[05:53](#msg5a9b89edc3c5f8b90d2e32ca)so there's nice things in Red that let me write normal Red code, that actually looks like how I want my DSL

[05:54](#msg5a9b8a08c3c5f8b90d2e3336)so I can just do this, without worrying about parse

[05:56](#msg5a9b8a8f8f1c77ef3a7db175)although, defining the function like this also lets me call with with anything in place of "in"

greggirwin

[06:36](#msg5a9b9405c3c5f8b90d2e55ac)Yes, there are all kinds of fun tricks we can use. It's a wonderful tool for thinkering.

[06:38](#msg5a9b94518f1c77ef3a7dd133)If you step back from your code just a bit, you can see how a relatively simple `func` wrapper could take a dialected spec and value check lit-words.

meijeru

[08:16](#msg5a9bab40888332ee3af89471)In your `count x in y` example, you can substitute any old word for `in` so even `count x up y` would work, which -- in my view -- diminishes the DSL effect.

guraaku

[08:17](#msg5a9babac0a1614b712dc9cf0)yep, I mentioned that. I guess you could check the value in the function itself, if you cared whether or not the correct word was used

[08:27](#msg5a9badf88f1c77ef3a7e29ad)

```
hi: function ['there :name] [
    either there = 'there [
        print ["hi there" name]
    ] [
        print "there should follow hello"
    ]
]
```

[08:28](#msg5a9bae200a1614b712dca7b0)

```
>> hi therex Bill
there should follow hello
```

9214

[08:29](#msg5a9bae74e4ff28713af00b42)@guraaku

```
>> hi (1 + 2 reverse [a b c] 'foo 'bar 'there) Bill
hi there Bill
```

guraaku

[08:30](#msg5a9bae93e4d1c63604bcdfc3):O

9214

[08:30](#msg5a9baec16f8b4b9946e8468f)perhaps you should use `:there` instead ;)

guraaku

[08:31](#msg5a9baecac3c5f8b90d2eb829)ah

[08:33](#msg5a9baf418f1c77ef3a7e2d80)yes, that works better :)

DVL333

[13:15](#msg5a9bf1540a1614b712ddafdb)Help is needed. I desided to run that script:

```
view [camera with [selected: 1] ]
```

(this is an example from http://www.mycode4fun.co.uk/)  
As I can guess, video from mу Cam must be shown. But I view only a blue rectangle, not video.  
I examined different variants (more complicated scripts) and sometimes video begins to show, but only 1-2 sec and then it's interrupted and blue rectangle is shown again.  
Any suggestions?

9214

[13:15](#msg5a9bf1880a1614b712ddb0ad)@DVL333 see @gltewalt's \[issues](https://github.com/red/red/issues?utf8=%E2%9C%93&amp;q=is%3Aissue+is%3Aopen+camera)

[13:17](#msg5a9bf1fe8f1c77ef3a7f34b9)@qtxie :point\_up: any ideas?

qtxie

[13:26](#msg5a9bf3e9e4d1c63604bdfdb2)blue rectangle? I have no idea... @DVL333 Are you using a Cam on laptop or a standalone usb webcam?

[13:26](#msg5a9bf421c3c5f8b90d2fd256)There is a report before that on some devices the cam does not work.

DVL333

[13:30](#msg5a9bf50a458cbde557f3ba43)I'm using a Cam on laptop. A lamp near it is glowing, so a Cam is working. I have Windows7 Ultimate 64bit, Red - version 0.6.3 built 3-Mar-2018/2:02:48+03:00

dockimbel

[14:20](#msg5a9c00a5e4ff28713af15d48)@qtxie That code works with GUI console from Jan 27th on my laptop. Trying with latest commit, still works.

9214

[14:20](#msg5a9c00c08f1c77ef3a7f71ec)FYI, I never was able to use `camera` face on Wine

DVL333

[14:44](#msg5a9c063b53c1dbb743a15ccc)Moreover, I have just tried to run this code on another laptop with the same parameters (Windows7 Ultimate 64bit, Red - newest version) - the same result. So, it's not a problem only with my laptop.

gltewalt

[22:20](#msg5a9c713de4d1c63604c037c9)Make sure windows is set for appearance and not best performance

[22:24](#msg5a9c72286f8b4b9946eb85b1)With Win7 I found it had to be set to best appearance for webcam to work

[22:37](#msg5a9c75458f1c77ef3a8188d4)@DVL333 I had exact issue

## Monday 5th March, 2018

qtxie

[02:44](#msg5a9caef0c3c5f8b90d330860)@gltewalt @DVL333 Thanks. I'll try with best performance to see if I can reproduce it.

gltewalt

[02:59](#msg5a9cb29d6fba1a703acb45ce)Best appearance

[03:00](#msg5a9cb2b7f3f6d24c68390bea)Oh, disregard

[03:00](#msg5a9cb2ddc3c5f8b90d33164d)(To reproduce the blue square - best performance. Yes.)

DVL333

[19:36](#msg5a9d9c3935dd17022e24da24)In old Nenad's example of "PicoSheet" (http://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html) I've found "strange" syntaxis of `case` command:

```
case [
        y = 1 [col]
	x = 1 [y - 1]
	'else [copy ""]]
```

`'else` - I didn't see that construction enywhere else, it's different from Rebol. In Rebol it's recommended to use `true`. And I thought, that it's not the only small difference. Is there a document with discription of features like that?

rebolek

[19:43](#msg5a9d9ddc888332ee3a01bed7)@DVL333 in this case, every non-false value is fine, evaluated to `true`, making it catch-all rule.

[19:44](#msg5a9d9e078f1c77ef3a87469b)It is actually same in Rebol, but probably not used very much.

DVL333

[19:45](#msg5a9d9e59c3c5f8b90d38156a)@rebolek It's tricky. :smile: I see, thanks.

rebolek

[19:51](#msg5a9d9fb16fba1a703ad03ba2)@DVL333 it helps with readability, that's the reason :)

BeardPower

[20:16](#msg5a9da58635dd17022e250c26)@rebolek This question is kind of haunting us ;)

[20:17](#msg5a9da5ea6fba1a703ad05bd7)So `'case` could also be used?

[20:18](#msg5a9da60b6f8b4b9946f172b7)Like `'false`.

rgchris

[21:00](#msg5a9daffe888332ee3a022477)@BeardPower No keywords in Red—`'false` has no more or less meaning than any of `'none 'if 'foo 'bar`

[21:02](#msg5a9db0548f1c77ef3a87bd02)

```
lisp
>> if 'false [probe 'truthy]
truthy
== truthy
```

BeardPower

[21:21](#msg5a9db4c4c3c5f8b90d3897ac)I see, thanks!

## Tuesday 6th March, 2018

virtualAlan

[00:51](#msg5a9de61be4d1c63604c7751d)Integral sound - when ? - it's easy to add sound, i've done it many times, but Integral sound (store friendly) will make a difference. why is this not a priority ?

9214

[03:19](#msg5a9e08c6f3f6d24c683fe229)@virtualAlan why should it be?

greggirwin

[04:25](#msg5a9e1835458cbde557fe1233)@virtualAlan, the thing about priorities is...everybody's are different. Since you've worked in the sound area, any contributions you can make would be \*great\*. The catch is that we don't want any external dependencies, yes? So it has to be cross platform, and done with APIs. Starting with one platform is fine, but we also need to define an interface to it at the Red level.

The question for audio is what value it adds. Simple apps do benefit from simple sound playing. If we start there, can we easily extend it later? Games will need much more control, and not all platforms will benefit the same. Mobile games are hot, but Windows games tend to be massive endeavors. Does audio help there without all the other pieces needed?

I think one of the most useful targets is audio creation and editing. Helpful on all platforms, and can then be integrated into other tools and apps.

BeardPower

[11:39](#msg5a9e7e0635dd17022e28e2c1)That's why I vote for positional audio 👌🏼

[11:41](#msg5a9e7e5b35dd17022e28e501)The positional algorithms would be implemented as part of Red, accessing the OS libs for playing out the audio.

[11:41](#msg5a9e7e868f1c77ef3a8b427c)From Mono to Stereo to 22.2 or even more.

greggirwin

[16:37](#msg5a9ec3baf3f6d24c68439b9a)@BeardPower, links?

BeardPower

[18:12](#msg5a9eda11e4d1c63604cc2aa5)https://www.linkedin.com/pulse/android-audio-apis-jorge-frisancho  
https://www.khronos.org/opensles/  
https://msdn.microsoft.com/en-us/library/windows/desktop/ee415813(v=vs.85).aspx  
https://msdn.microsoft.com/en-us/library/windows/desktop/ee415714(v=vs.85).aspx  
https://msdn.microsoft.com/en-us/library/windows/desktop/dd370802(v=vs.85).aspx

[18:18](#msg5a9edb890a1614b712ec213e)Depending on the level (low, high, frameworks, engines), every platform has various APIs.

Counting the ones for Windows, Android and macOS, you get &gt;10 APIs, each with different features and designs (low latency, output quality, memory usage, hardware acceleration,...).

[18:20](#msg5a9edbd4c3c5f8b90d3e7263)Some API provide 3D Audio and positional audio out of the box.

[18:22](#msg5a9edc57888332ee3a07ebb3)It would be way more easier to use a cross-platform sound engine, but with the cost of having a dependency.

greggirwin

[18:24](#msg5a9edcd435dd17022e2b2a1e)Thanks!

BeardPower

[18:25](#msg5a9edcfe0a1614b712ec2872)You're welcome. Sound has even more API fragmentation than graphics.

[18:26](#msg5a9edd490a1614b712ec29ec)There are even more, if you want to support audio on older Windows versions like Windows XP.

greggirwin

[18:28](#msg5a9eddb6458cbde5570244e1)https://github.com/red/red/wiki/Audio-R&amp;D

I think it's good to look forward, and what is current, \*then* look back for compatibility as a lower priority.

[18:28](#msg5a9eddcc35dd17022e2b2e43)https://github.com/red/red/wiki/Audio-R&amp;D

I think it's good to look forward, and what is current, \*then* look back for compatibility as a lower priority.

BeardPower

[18:28](#msg5a9edde88f1c77ef3a8d81ec)I forgot: here is the API for iOS and MacOS: https://developer.apple.com/library/content/documentation/MusicAudio/Conceptual/CoreAudioOverview/Introduction/Introduction.html

[18:31](#msg5a9ede75c3c5f8b90d3e83cd)I will add links to the Wiki. Sound is, well, kind of a headache, that's why most projects use a cross-platform sound engine. I will also list those.

[18:33](#msg5a9edf096fba1a703ad676ae)Takes a little time, but will work on it during the week.

greggirwin

[21:11](#msg5a9f0414f3f6d24c68451c81)Excellent. Thanks @BeardPower !

[21:12](#msg5a9f044a458cbde557032c3b)I added the macOS link to the wiki for you.

BeardPower

[21:13](#msg5a9f0469f3f6d24c68451fe5):+1:

## Friday 9th March, 2018

virtualAlan

[01:07](#msg5aa1de3fe4ff28713a0e7169)@greggirwin @BeardPower many thanks - apologies, was just playing 'devils advocate' seeing what you might come up with. And you always deliver. Regards .... Alan.

guraaku

[01:46](#msg5aa1e78be4d1c63604db7a99)Hi ! now that I've mastered building my DSL with parse etc.... (just kidding !) ... I'm starting to have a look at some GUI stuff

[01:47](#msg5aa1e7cb8f1c77ef3a9c8d10)The vague idea is that I'd like to allow a user to build their own GUI, by dragging and dropping stuff onto the window, eg, buttons, images etc

[01:48](#msg5aa1e7e68f1c77ef3a9c8d32)and then save their final screen so that we can use it later

[01:49](#msg5aa1e82d888332ee3a16f326)So, just experimenting with Layout now. I see that I can define a Layout, and the result is some code making those objects, ie it doesn't save it as the actual Layout code

[01:49](#msg5aa1e841e4ff28713a0e97c5)My simple example,

[01:50](#msg5aa1e8750a1614b712fb50ec)

```
screen: Layout [button "hi there" loose]
```

[01:51](#msg5aa1e89d53c1dbb743be6663)if you then look at screen, it's make object! ... etc which is all well and good..

[01:51](#msg5aa1e8b90a1614b712fb51a5)if I then do view screen, the screen is displayed, and I can drag the button around

[01:52](#msg5aa1e8e5458cbde55711c3f9)if I then close the window and look at screen again, I can see that the offset of the button now reflects where I dragged it to

[01:53](#msg5aa1e8fe8f1c77ef3a9c9205)which is great !

[01:54](#msg5aa1e938458cbde55711c49a)However, if I save screen to a file, and then try to load it, it gives me errors - I can't display the window again

[01:54](#msg5aa1e96e0a1614b712fb5457)things like, it has saved things like

[01:54](#msg5aa1e96f0a1614b712fb5459)parent: make object! \[...]

[01:55](#msg5aa1e9758f1c77ef3a9c9362)which is not valid

[01:56](#msg5aa1e9c7e4d1c63604db81b4)I tried setting parent to none instead, still no good

[01:57](#msg5aa1e9ef6f8b4b9946064ace)Admittedly, I haven't looked too deeply into the errors yet, but any initial thoughts on whether or not this would be the right way to go about trying to do something like this ?

[02:00](#msg5aa1eacdc3c5f8b90d4de8d8)ie, manipulate a GUI via the GUI, eg, drag things around to position them as you want, then save the code (in whatever is the most appropriate format) so that we can use it to display the GUI again later.

[02:01](#msg5aa1eaf10a1614b712fb58e4)I guess, the kind of thing you'd do in some programming IDE, Visual Studio etc, to design a screen

[02:02](#msg5aa1eb3053c1dbb743be6fc6)Thanks in advance for any ideas :)

dockimbel

[03:28](#msg5aa1ff73e4ff28713a0ee548)@guraaku Your idea is totally doable, but you can't save the face objects graph from memory to disk directly, because of the cyclic references and run-time state values that would not be valid anymore once reloaded. The solution is to write a small saver/loader for the face object tree, that will save only a subset of the face properties and recreate the tree on load.

[03:51](#msg5aa204dcc3c5f8b90d4e3fb5)Another approach could be just to reset some face properties (we call them facets), and then save the object tree directly:

```
view lay: layout [button "ok" text "hello" panel [text "nested"]]
foreach-face lay [face/parent: none face/state: none]
lay/parent: lay/state: none
save %faces.red lay
```

Though, in order to use it after reload, you need to reduce the nested objects, as object literals don't have a literal form (yet), only a construction expression.

[04:10](#msg5aa2093e8f1c77ef3a9cfa73)Here is a fully working example: https://gist.github.com/dockimbel/c4ec0145e3a8ba776e05b4895a8d8733

[04:13](#msg5aa209fb6f8b4b994606bcd2)@greggirwin I think we could provide some helper mezz functions like `save-faces` and `load-faces` to help with that?

[04:16](#msg5aa20a976fba1a703ae61ec7)@qtxie Do you remember a ticket for `save` doing a `mold/only` instead of just a `mold` on the argument? With current behaviour, you cannot save nested blocks properly.

greggirwin

[06:27](#msg5aa22960e4ff28713a0f81df)@dockimbel I found some old R2 GUI tools, one by Carl from 2000, which I was thinking of before hunger took me over and I had to stop to eat. :^) I was thinking along the lines of saving `layout` specs rather than face trees, but we can absolutely add some helpers for saving and loading them.

[06:33](#msg5aa22ad453c1dbb743bf52dd)Are the `parent` and `state` facets the only important elements for cycle prevention? `Actors` is the only other facet I see that might be an issue, but it should be safe, yes? I would like to save the data prettified if we do it.

[07:23](#msg5aa236866f8b4b994607688d)Ignoring the hack that shows where a button is dropped: https://gist.github.com/greggirwin/e40459503f75a748b056d08b3f8289ea

[07:24](#msg5aa236ad53c1dbb743bf860e)Drag the button, as many times as you want, and drop it where you want it.

9214

[07:25](#msg5aa236ebf3f6d24c6854676a)@greggirwin this is what you're doing past midnight? Dragging buttons? :^)

greggirwin

[07:25](#msg5aa236f8c3c5f8b90d4f0865)I was just waiting for you to show up.

9214

[07:27](#msg5aa237480a1614b712fc7bab)Sir :guardsman:

greggirwin

[07:27](#msg5aa2377a458cbde55712eab8)Just one more turn around the perimeter before hitting the barracks.

[07:29](#msg5aa237eb6fba1a703ae6d804)@guraaku, note that one of the things you give up with a system like this is VID's auto layout engine. By dragging and dropping, without a smart constraint system, you end up with absolute coordinates for each face. Not terrible, as that's how the rest of them do it.

dockimbel

[09:24](#msg5aa252e76f8b4b994607f16b)@greggirwin  
&gt; Are the `parent` and `state` facets the only important elements for cycle prevention? `Actors` is the only other facet I see that might be an issue, but it should be safe, yes?

Actors are safe as long as they don't depend on bindings to external objects.

[09:26](#msg5aa25347458cbde557136ad1)Saving the VID version of a GUI is surely easier, though it won't capture the facets changed after display.

BeardPower

[10:24](#msg5aa260cd8f1c77ef3a9e777e)@virtualAlan Challenge accepted! Appreciate your input :+1:

guraaku

[12:04](#msg5aa2784e6fba1a703ae82621)Wow, thanks for all that @dockimbel and @greggirwin ! :)

[12:08](#msg5aa27937888332ee3a1975e7)Just got home and found all these responses and code, and people talking about adding stuff to Red to make it easier for what I'm trying to do... what a great community ! Really appreciate all the help

[12:08](#msg5aa27947888332ee3a197628)I'll digest and play with it over the weekend

9214

[12:08](#msg5aa279520a1614b712fde259)@guraaku you haven't seen our collective refactoring sessions ;)

guraaku

[12:11](#msg5aa279d98f1c77ef3a9f0174)so, forgive my ignorance, you guys are all working on the actual Red code, right ? I recognize Nenad's name , but you are working on it as well ?

9214

[12:14](#msg5aa27aae53c1dbb743c0e733)@qtxie, @dockimbel and @greggirwin are the core team, I think @PeterWAWood and @x8x too

[12:15](#msg5aa27ac58f1c77ef3a9f069a)maybe @rebolek ? ;)

rebolek

[12:15](#msg5aa27afb0a1614b712fdec6a)that would be great

guraaku

[12:16](#msg5aa27b01c3c5f8b90d507154)It's really good everyone to be in here and helping out newbies like me

9214

[12:16](#msg5aa27b2ec3c5f8b90d50733d)@guraaku that's what community should do :)

guraaku

[12:16](#msg5aa27b346f8b4b994608cdd9):)

[12:18](#msg5aa27b8235dd17022e3ce40b)I hope one day I'll be able to report good news that we are making use of all the hard work...

[12:19](#msg5aa27bdf53c1dbb743c0ec36)I think I'm getting close to having something pretty functional... the trick is how to get it accepted at work...

[12:21](#msg5aa27c4d35dd17022e3ce733)I think a low risk option is using this to quickly implement things, for clients to play around with to help work out their requirements etc

[12:21](#msg5aa27c5ff3f6d24c6855ccec)and maybe to help with testing the "real" system...

9214

[12:21](#msg5aa27c6335dd17022e3ce7c9)@guraaku the trick that @greggirwin taught me: lock yourself with your supervisor in one room and start to stare at him/her with :^) face

guraaku

[12:23](#msg5aa27cd1458cbde557145d38)I may try that ;)

[12:30](#msg5aa27e600a1614b712fdfe56)anyway, just about bedtime I think..

[12:30](#msg5aa27e7e0a1614b712fdfeca)hope people aren't staying up late dragging buttons around ! :P

[12:31](#msg5aa27e9535dd17022e3cf1d8)have a good night/day, and catch you later @9214

BeardPower

[12:32](#msg5aa27eca6f8b4b994608e3c3)@guraaku Na, I prefer clicking ;-)

9214

[12:33](#msg5aa27f2fe4ff28713a112edd)@guraaku ciao!

greggirwin

[19:08](#msg5aa2db91e4d1c63604e019f9)@guraaku, (those of you who know this story, just move along) I used to specialize in VB. When I'd suggest using it, people would say it would be too slow. One of my tactics was to say, "OK, let's just prototype with it, then build the real thing in C. It will save us time." So we'd do that, I'd show a working app, then say "Now, we can rewrite it in C." They'd say "But it all seems to work. Why would we do that?" :^)

[19:08](#msg5aa2dbcb53c1dbb743c31853)Red \*is* Alpha though, so really know it will do all you need if committing for production work. We can help with that here. Any OOB tools are great for it though.

guraaku

[23:07](#msg5aa31394c3c5f8b90d53b730)morning @greggirwin :) Yes, sounds like a good tactic. I think getting to use anything other than our preferred platforms (C# and Java) will be an uphill battle at this point, but I'll continue working on my prototype and see how far I can get with it. If I can present something that works and has other significant advantages, eg much less code, quicker to implement, easier maintenance etc then it will be up to someone else to make the decision as to why we shouldn't use it.

[23:09](#msg5aa31435e4ff28713a144d33)Regardless, it's fun playing around with Red, and I usually find that the different ideas that you get exposed to when looking at other things seem to come in handy later on. Even if you can't use that other language, you may be able to implement some of the ideas in whatever language you have to work with.

[23:12](#msg5aa314c68f1c77ef3aa244c4)Regarding your comment about giving up VID's auto layout, yes, that's something to consider. Whether or not I can come up with a way to default to the auto layout, then use the absolute coordinates if a user does decide that the default isn't exactly what they like.

greggirwin

[23:26](#msg5aa31824e4d1c63604e139e4)Red is a \*great* tool for thinking. That may be its killer feature.

[23:27](#msg5aa31858888332ee3a1cbc4f)There's no reason you can't store both a `layout` spec you build and also a fixed coordinate face data structure.

## Saturday 10th March, 2018

DVL333

[01:30](#msg5aa3354ce4ff28713a14c54d)Question: how to dynamically create a new face with VID dialect? For example, I click a button and another button will create next to the first on the same layout...

guraaku

[01:32](#msg5aa335b16f8b4b99460c9ba8)I'm just looking at @greggirwin 's gui-dropper at the moment, it would seem to be doing something similar, although drawing a box rather than putting a new button

[01:51](#msg5aa33a076f8b4b99460ca907)I wonder if he drew a box because putting a new button was difficult...

[02:03](#msg5aa33cfc6fba1a703aec169d)@DVL333 I don't know if this is the easiest way, but just modifying the gui-dropper code,

[02:04](#msg5aa33d1653c1dbb743c4c467)

```
;repend face/parent/draw ['box p p + face/size 'text p + 4x5 name]
        repend face/parent/pane (do newButton)
```

[02:04](#msg5aa33d1e458cbde557183694)sorry, bad formatting

[02:04](#msg5aa33d44458cbde5571836f8)instead of appending to face/parent/draw, you can append to face/parent/pane

[02:05](#msg5aa33d6b6fba1a703aec17d0)but what you append is the make object! code that you get if you look at what the button looks like if you did a layout

[02:06](#msg5aa33d9035dd17022e40ab10)

```
screen: layout [button "hi" [print "hi"]
```

[02:06](#msg5aa33da0e4d1c63604e1bcbb)do a print screen and see what it looks like

[02:07](#msg5aa33dd5e4d1c63604e1bd21)but yes, not exactly then using the VID dialect...

[02:38](#msg5aa3450e0a1614b71201c8e9)ok, here's a better way !

[02:38](#msg5aa345206f8b4b99460ccd4a)define your new button using normal VID, eg

[02:38](#msg5aa345428f1c77ef3aa2f528)

```
newLayout: layout [button loose "new button !" [print "clicked new button"]]
newButton: newLayout/pane/1
```

[02:39](#msg5aa3455c6f8b4b99460ccdfa)but using layout converts the VID to a face tree, which is what you need to append to face/parent/pane

[02:39](#msg5aa34571e4d1c63604e1d422)

```
repend face/parent/pane copy newButton
```

[02:41](#msg5aa345c56fba1a703aec3628)the slightly messy bit there is that layout gives you a window, then a pane, then your faces inside there

9214

[06:55](#msg5aa38152888332ee3a1e1042)@DVL333 the main idea is

```
view [at 100x100 button [append face/parent/pane layout/only [button]]]
```

you'll need to take care of positioning coordinates and offsets by yourself

guraaku

[07:56](#msg5aa38f9e0a1614b71202bb8a)By the way, is there an option or flag for View to have the window initially maximized ?

9214

[07:56](#msg5aa38fb2458cbde55719492b)@guraaku you mean fullscreen window?

guraaku

[07:56](#msg5aa38fc4e4d1c63604e2be54)ah, I guess ?

[07:57](#msg5aa38ff70a1614b71202bcda)still with the minimize, restore and close icons visible

9214

[07:59](#msg5aa390636fba1a703aed270c)@guraaku you can do

```
view compose [size (system/view/screens/1/size)]
```

greggirwin

[08:00](#msg5aa390b46f8b4b99460dd085)You can't dynamically add a new face using VID without reprocessing the layout spec. But it's not too hard to add a real face without using VID.

[08:01](#msg5aa390e435dd17022e41b7d3)

```
btn-pos: 700x10

n: 0

view [
	size 800x600
	at btn-pos
	btn: button "Button" loose on-drop [
		n: n + 1
		name: append copy "Button " n
		p: face/offset
		new-face: make face! [
			type: 'button offset: p text: name size: btn/size
		    actors: make object! [
		        on-click: func [face [object!] event [event! none!]][
		        	print face/text
		        ]
		    ]
 		]
		append face/parent/pane new-face
		btn/offset: btn-pos
	]
]
```

[08:04](#msg5aa391760a1614b71202c25e)A limitation here, and the hack of drawing a box was due to: a) quick work, b) doing this all in a single window without a separate panel. We don't have cross-window drag and drop, but should be able to do pretty well with a panel as the target. Just a bit more work.

[08:11](#msg5aa3932d0a1614b71202ca3b)We could also do it with a toolbox of styles, where you just click to add one, rather than dragging. That action could create the face in the target window, where you could then drag it around. One thing I have to look at is how `loose` is handled internally. Doesn't appear as a visible facet on the face it seems.

[08:12](#msg5aa393798f1c77ef3aa3f186)Ah, it's `options: [drag-on: 'down]`

[08:14](#msg5aa393fa8f1c77ef3aa3f3bd)So if you wanted your newly drop-created faces to also be draggable, to reposition them after dropping, just include that option.

guraaku

[08:15](#msg5aa3940e0a1614b71202ceb8)yes, interestingly, when I read in the saved face tree - using the previously posted code,the button was no longer loose

dockimbel

[08:15](#msg5aa3943e0a1614b71202cf38)@greggirwin @9214 There is still a `make-face` constructor on our todo-list for View, let me see what would be required to support it.

guraaku

[08:17](#msg5aa394a753c1dbb743c5e6c0)seems there's a few different ways to do these kind of dynamic additions to GUIs...

[08:18](#msg5aa394cb888332ee3a1e5780)I think I would have liked to save the final GUI as VID, but it seems less work to just save and load the face tree

[08:19](#msg5aa394f7e4ff28713a16013e)Because, as you drag around things etc, the face tree will be automatically updated

greggirwin

[08:22](#msg5aa395c3e4d1c63604e2d30d)@dockimbel, `make-face` just being a helper, so setting the default action and such is easier, or a dialected func?

dockimbel

[08:23](#msg5aa395f5c3c5f8b90d557cbb)@guraaku That's an interesting concept. Would it be possible to write a reverse-VID constructor, that, given a face tree, would construct back the equivalent (ideally minimal) VID source code? I guess it could be achieved to some extent.

[08:23](#msg5aa3961c35dd17022e41cb33)@greggirwin It should be able to support VID actors.

greggirwin

[08:25](#msg5aa3966cf3f6d24c685ac4d6)@dockimbel, we talked about constraint based systems some time back. This (reverse VID) could be an experiment along those lines.

[08:26](#msg5aa396ce35dd17022e41cd55)But I don't know that you could guarantee an exact match. It might turn out better than your manual layout of course. Many fun thoughts there. We don't have `guide` yet, which might help with that as well.

guraaku

[08:27](#msg5aa396f6f3f6d24c685ac6f0)I guess there could be multiple different VIDs that lead to the same face tree, ...

[08:27](#msg5aa397066f8b4b99460de809)but, any one of them would be acceptable, given they all produce the same thing

greggirwin

[08:28](#msg5aa39748f3f6d24c685ac834)Yes, or close to. e.g., you could eval the face tree, then generate both `across`-based and `below`-based layouts and see which gets closer. Also looking at average spacing, to set a `space` value.

DVL333

[09:49](#msg5aa3aa1bf3f6d24c685b0ea6)@9214 @greggirwin Without your help I couldn't make it myself. Thank you!

planetsizecpu

[19:42](#msg5aa43515888332ee3a20e53e)@greggirwin @dockimbel I think you meant some like the Recode func on my forms app but using foreach-face instead my own list

## Sunday 11st March, 2018

greggirwin

[00:26](#msg5aa477ba8f1c77ef3aa788e8)@planetsizecpu can you provide a link. I can't keep up with and remember all chat references.

ne1uno

[02:09](#msg5aa48fd68f1c77ef3aa7d84f)https://github.com/planetsizecpu/forms

BeardPower

[02:14](#msg5aa490ed8f1c77ef3aa7dbcd):+1:

guraaku

[02:18](#msg5aa491e90a1614b71206aeac)that looks great !

toomasv

[05:04](#msg5aa4b8e835dd17022e4613e1)@planetsizecpu Nice forms! :+1:

jaroet

[06:58](#msg5aa4d380e4ff28713a1ab3bc)≥ ≥≥ @ne1uno On MacOS it is kind of freezing. I can move the windows around but I can not click on any buttons and I have a constantly spinning mouse cursor (beachball). Tried with latest stable and nightly.

ne1uno

[07:03](#msg5aa4d4d9e4d1c63604e7797c)it's from planetsizecpu, I just knew the url. on win7 I can't seem to drop any element but all the buttons work. previous versions did work.

jaroet

[07:07](#msg5aa4d5ccf3f6d24c685f755f)Thanks ... added an issue

ne1uno

[07:08](#msg5aa4d607f3f6d24c685f7674)would the default font consolas be a problem?

planetsizecpu

[07:28](#msg5aa4dab727c509a7744c2b61)@greggirwin Sorry, yesterday was on phone : \[forms](https://github.com/planetsizecpu/forms)  
@toomasv Thx, there are some bug &amp; some improvements to do, but I do this stuff at gaps between work, lack of time ;)

[08:15](#msg5aa4e5ab0a1614b71207c1e1)@jaroet I'm unable to test in mac. I have to fix the issue of moving widgets, don't update the source code until you add some widget or resize main window, by delete al calls to Recode and set a call from on-deep-change

[08:19](#msg5aa4e6968f1c77ef3aa8f155)There is another known issue after run code: all widgets would then belong to another window instead of main form panel, so widgets offs

[08:20](#msg5aa4e6b2c3c5f8b90d5a84c7)Ser would never been updated

[08:21](#msg5aa4e6fd0a1614b71207c5ab)Sorry for faults, on phone now

greggirwin

[08:59](#msg5aa4effd458cbde5571e8dd7)Thanks @ne1uno ! Will need to look at it tomorrow @planetsizecpu. Too late to give it proper attention right now.

planetsizecpu

[09:15](#msg5aa4f3a153c1dbb743caf84c)Thx @greggirwin, for me it's time to walk a few km to pull down AP, ill do beyond the beach today ;)

9214

[09:20](#msg5aa4f4f50a1614b71207fbfb)@9214 sighs and looks at outside thermometer with -15C

BeardPower

[11:27](#msg5aa512b235dd17022e4759b3)@planetsizecpu AP? Access Point? What is AP?

planetsizecpu

[11:54](#msg5aa518dc8f1c77ef3aa9b600)@BeardPower haha, AP = Arterial Pressure :) (IMO "the belt" it's too long)

BeardPower

[12:57](#msg5aa527b527c509a7744d5b4c)@planetsizecpu Ah, "Gösser-Muscle" ;-)

## Monday 12nd March, 2018

mikeyaunish

[19:08](#msg5aa6d03653c1dbb743d3ab8d)@DVL333 @greggirwin My direct-code example is another way to handle manipulation of graphical elements. See: \[ Direct Code move elements example ](https://www.youtube.com/watch?v=ILW5BYZ34hg&amp;feature=youtu.be)

greggirwin

[22:07](#msg5aa6fa29e4d1c63604f16e5f)@mikeyaunish How did I not know, or forget about this? Wow! That's so cool.

## Tuesday 13th March, 2018

greggirwin

[03:03](#msg5aa73f6553c1dbb743d5b3a8)@mikeyaunish I played with DirectCode a bit, and it's going to be fun watching it advance. Middle mouse button selection doesn't work for me, but ctrl+~ does.

toomasv

[04:20](#msg5aa7519a8f1c77ef3ab40f40)@mikeyaunish Very nice! :+1:

Ungaretti

[08:41](#msg5aa78ebee4d1c63604f3c9eb)@mikeyaunish Amazing! Congratulations!

rebolek

[09:00](#msg5aa7933a458cbde5572b0235)@mikeyaunish really great! :clap:

planetsizecpu

[11:35](#msg5aa7b7758f1c77ef3ab5ea0b)@mikeyaunish Well done :+1:

DideC

[13:39](#msg5aa7d49e0a1614b712157aae)@mikeyaunish Whaou, amazing to see how this simple code evolve to an apps. Congrats.

mikeyaunish

[15:02](#msg5aa7e8176f8b4b9946210259)Has anyone done any work on customizing the 'area' object? I'd like to customize some of it's functionality to make editing Red scripts easier.

rebolek

[15:03](#msg5aa7e8310a1614b71215ef29)@mikeyaunish what kind of customization do you have in mind?

greggirwin

[16:45](#msg5aa80011458cbde5572d8503)@mikeyaunish, `area` is a basic native control, but if anyone can push its limits, Bolek can. :^)

rebolek

[17:10](#msg5aa8060cc3c5f8b90d699789)@greggirwin thanks for your lie ;) it really depends on kind of customization, adding improved keyboard handler is possible, adding syntax highlighting is not (unless you fake it with Draw overlay, in which case you do not need area at all).

greggirwin

[17:11](#msg5aa8065ec3c5f8b90d6999f2)Right, need to know the goal, but waiting for text-box! is likely better.

rebolek

[17:16](#msg5aa80776e4d1c63604f67c7d)Waiting for final version? Because text-box is available and I did editor that lives in console with it.

greggirwin

[17:22](#msg5aa808e88f1c77ef3ab7e139)I thought there were some pending changes, but haven't followed it closely.

rebolek

[17:25](#msg5aa8098ce4ff28713a2a41e0)IIRC yes, that's why I haven't worked on it more, but if anyone's intetested in text-box, it's possible to check it already, I don't think final version will so much different.

toomasv

[17:28](#msg5aa80a520a1614b71216ca12)Nope. It's broken currently.

rebolek

[17:29](#msg5aa80a7f8f1c77ef3ab7e914)Ah :(

[17:32](#msg5aa80b1053c1dbb743d9cb04)So it's still possible to check it, you just need to find last version, where it worked ;)

toomasv

[17:34](#msg5aa80b958f1c77ef3ab7f0fa)I am bad on finding last working versions :(

rebolek

[17:37](#msg5aa80c5453c1dbb743d9d2b2)I understand, this would be hard for me too. Maybe it would really be easier to wait for new version :)

virtualAlan

[19:59](#msg5aa82d8553c1dbb743da8eef)A Gui drag-n-drop experiment based on a Gregg Irwin example, again with this one, just for fun.  
It allows you to drag and drop widgets to a layout grid, Then the 'Save it' button will save the  
generated script, the 'Try it' button will allow you to run the script and the 'Clear it' button will clear the  
layout page. There's a lot more that could be added to this one.  
http://www.mycode4fun.co.uk/red-apps  
http://www.mycode4fun.co.uk/example-scripts  
Regards ....  
Alan.

mikeyaunish

[22:26](#msg5aa85017c3c5f8b90d6b51a0)@rebolek - syntax highlighting would be nice. Although I seem to be getting around fine without it. Just really would like some customized keyboard handling . Sounds like waiting for text-box is the way to go. No rush for it at this point.

greggirwin

[23:23](#msg5aa85d8735dd17022e5788c6)Really nice @virtualAlan! You should check out my second version, which is nicer: https://gist.github.com/greggirwin/fd4543f99e257ae1338bbf5eb44dd12c

gltewalt

[23:55](#msg5aa864d66f8b4b994623c71b)on-drop seems to be working the same as an on-click

## Wednesday 14th March, 2018

gltewalt

[00:10](#msg5aa8686135dd17022e57b2ff)If you just click "button" it creates a new button. No dragging required.

greggirwin

[00:26](#msg5aa86c25f3f6d24c6870c123)Yes, for `loose` faces, that it true. It would be good to write up how to work with that, even if just to suggest "Don't expect to be able to tell them apart".

virtualAlan

[00:30](#msg5aa86d348f1c77ef3ab9e8a9)Thanks Gregg - will have a look

guraaku

[07:28](#msg5aa8cf138f1c77ef3abb7397)Wow, sounds like everyone has had a go at some kind of GUI form designer thing ! :)

[07:29](#msg5aa8cf76f3f6d24c687240be)Mine is aimed at being part of my own DSL, so for example a screen is fairly well defined - it will have some images, some "records" in some kind of table, some "actions" that are allowed to be taken on those records, eg delete

[07:30](#msg5aa8cfadf3f6d24c6872415f)But, it seems some general functionality would be useful - perhaps as discussed before, to go from a face tree back to VID

## Thursday 15th March, 2018

virtualAlan

[00:05](#msg5aa9b8d3e4ff28713a32f130)Yes the clicking creating a new button without dragging it is an easy one, Controlling those loose faces is a good idea. A simple 'If' in the right place is all that's needed. The idea is to isolate the drag button from the click button, so it's all about screen coordinates.  
The drag button is in one area and the click button is in another one. I'll do another script using Greggs latest example as a starter.  
Alan.

mikeparr

[09:09](#msg5aaa386727c509a7746585cf)@virtualAlan Interesting, Alan - I look forward to developments in this area. Would be nice to create function stub(s) for each button event (like VB does, of course!)

## Monday 19th March, 2018

mikeyaunish

[04:36](#msg5aaf3e51e4d1c6360415feb5)\[direct-code](https://github.com/mikeyaunish/direct-code) proof of concept proposed "object editor" All of the changes taking place in the object editor can selectively modify the source code.

!\[alt](http://github.com/mikeyaunish/direct-code/blob/master/images/object-editor-v2.gif?raw=true)

The object editor opens in a separate window and should eventually be able to edit every part of the VID object.  
Having everything modifiable from within the "Object Editor" window is non-standard but feels quite intuitive.  
Definitely non-standard ~ what might be the drawbacks of this technique?

[04:38](#msg5aaf3ee3e4ff28713a4a5c83)Not having any luck imbedding the gif. \[object-editor](http://github.com/mikeyaunish/direct-code/blob/master/images/object-editor-v2.gif)

[04:40](#msg5aaf3f25bb1018b37afd061f)@toomasv what is your markdown trick to embed gif images?

toomasv

[04:43](#msg5aaf3fe9a60157d62f01ded0)@mikeyaunish Image link inside hyperlink:  
`[![title](link)](link)`  
Super nice work you have there!

mikeyaunish

[04:53](#msg5aaf4245f3f6d24c688dd558)Try number 2. \[!\[object editor video](https://raw.githubusercontent.com/mikeyaunish/direct-code/6421719d/images/object-editor-v2.gif)](https://raw.githubusercontent.com/mikeyaunish/direct-code/6421719d/images/object-editor-v2.gif)

[04:54](#msg5aaf42a135dd17022e7552ba)Thanks @toomasv that worked great. I see from your examples that is much easier to convey a new idea through a small video.

dockimbel

[05:11](#msg5aaf466fa60157d62f01f660)@mikeyaunish Great work! :clap:

rebolek

[05:31](#msg5aaf4b446f8b4b9946418f70)@mikeyaunish very nice!

guraaku

[09:05](#msg5aaf7d64bb1018b37afe1d7e)What are the data and extra fields in a face object ? Are either of them something we could use for our own purposes ? I'm thinking I might want somewhere to put the VID code for that face. Can I use those ?

9214

[09:06](#msg5aaf7d9d27c509a7747ba9b6)@guraaku you can use `extra` facet, yes.

guraaku

[09:07](#msg5aaf7dbee4ff28713a4b7f37)thanks @9214 :)

dockimbel

[09:28](#msg5aaf82ae5f188ccc15d069ae)@guraaku See `extra` entry in \[this table](https://doc.red-lang.org/en/view.html#\_face\_object).

guraaku

[09:41](#msg5aaf85bbc3c5f8b90d8af179)oops, thanks ! yes, I should read the doco :)

[12:03](#msg5aafa704c3c5f8b90d8ba92d)this one's probably also in the doco somewhere, but I don't see it... is there a way I can change an image on the fly ?

[12:03](#msg5aafa70da60157d62f03d272)for example, if I have a something like...

[12:03](#msg5aafa71127c509a7747c9749)

```
btn: button "hello" https://picsum.photos/150
```

[12:03](#msg5aafa725e4ff28713a4c7019)I've tried modifying the image by

[12:04](#msg5aafa739fa066c5325485a17)\`btn/data: https://picsum.photos/200

[12:04](#msg5aafa76227c509a7747c997a)but the image remains the same

9214

[12:06](#msg5aafa7bdbb1018b37aff0f2c)@guraaku ?

```
view [
    image https://picsum.photos/150 draw [
        fill-pen red circle 75x75 50
    ]
]
```

dockimbel

[12:06](#msg5aafa7c427c509a7747c9c11)@guraaku Image is referenced by `/image` facet:

```
view [
    image https://picsum.photos/150 on-down [
        face/image: load https://picsum.photos/200
    ]
]
```

guraaku

[12:07](#msg5aafa7ef6f8b4b99464370bc)@9214 I was just playing around with react

[12:07](#msg5aafa81827c509a7747c9e0f)so, as an example, having a field where I could type in an image url, and then have the image face (or a button, whatever) display that image

[12:07](#msg5aafa81cfa066c532548600a)ah

[12:08](#msg5aafa820fa066c532548601b)load :)

[12:08](#msg5aafa84afa066c53254860e1)beautiful :)

[12:12](#msg5aafa93de4d1c6360418095c)

```
react [btn/image: load (to url! fld/text)]
```

9214

[12:12](#msg5aafa93df3f6d24c688fd2ba)@guraaku

```
view [
    below center
    f: field 300x20 center hint "insert URL here"
    button "Release the Kraken!" [
        canvas/image: load f/data
    ]
    canvas: image
]
```

guraaku

[12:18](#msg5aafaa8cfa066c5325486de5)ok, that works @9214, but I must be doing something wrong when I try to use that kind of code in a react block

[12:18](#msg5aafaaac5f188ccc15d14a64)

```
react [btn/image: load fld/data]
```

9214

[12:19](#msg5aafaab8fa066c5325486ef3)`react later`

guraaku

[12:21](#msg5aafab3327c509a7747cb1f3)hmm...that doesn't seem to make it work

dockimbel

[12:21](#msg5aafab35458cbde5574fc6a8)or `react [if url? fld/data [btn/image: load fld/data]]`

guraaku

[12:25](#msg5aafac25c3c5f8b90d8bc6c0)

```
View [
    btn: button "hello" https://picsum.photos/150
    fld: field "https://picsum.photos/150" 
    react [if url? fld/data [btn/image: load fld/data]]
]
```

9214

[12:25](#msg5aafac44bb1018b37aff2860)@dockimbel doesn't seem to work with button.

guraaku

[12:25](#msg5aafac4727c509a7747cb78e)it doesn't seem to react..

9214

[12:26](#msg5aafac705f188ccc15d15574)

```
text
view [
    below center
    f: field 300x20 center hint "insert URL here"
    image react later [
        face/image: load f/data
    ]
]
```

[12:27](#msg5aafaca835dd17022e775e79)though it's better to wrap everything in `attempt` block.

[12:29](#msg5aafad0ea60157d62f03f742)And, with `attempt`, you can probably omit `later`.

guraaku

[12:35](#msg5aafae9e458cbde5574fdac0)yes, so if you type in a bad url

[12:36](#msg5aafaeb9bb1018b37aff35bc)ok, so just not working with button for some reason, but works ok with image, which is what I actually wanted anyway, so that's ok :)

[12:37](#msg5aafaf1b6f8b4b9946439b72)thanks @9214 and @dockimbel

[12:39](#msg5aafaf68458cbde5574fdefa)I was having a look earlier at @mikeyaunish 's direct code - a lot of work gone into that !

[12:48](#msg5aafb18d6f8b4b994643a89f)ok, time for bed, thanks again !

9214

[13:28](#msg5aafbb0bc3c5f8b90d8c1fb3)@guraaku g'night!

## Wednesday 21st March, 2018

greggirwin

[00:48](#msg5ab1abeda60157d62f0e5ed1)@mikeyaunish, \*very* nice. Alan Kay would probably like that approach a lot. :^)

## Friday 23th March, 2018

guraaku

[01:17](#msg5ab4558f458cbde55766f338)Hi again, am still playing around with react, now trying to get a face to react to a change in a series

[01:17](#msg5ab455b8e4ff28713a639aee)current code...

[01:18](#msg5ab455cafa066c53255f954f)

```
p1: make deep-reactor! [
    p: Person
    name: "John"
]

p2: make deep-reactor! [
    p: [age 15 inc 1000 name "Peter"]
]

scr: [
    bt1: button "p1" react [face/text: p1/name]
    bt2: button "p2" react [face/text: p2/p/name]
]

scrLayout: layout scr
view/no-wait scrLayout
```

[01:18](#msg5ab455e835dd17022e8e4536)so, I can make bt1 change, by setting p1/name

[01:19](#msg5ab45604bb1018b37a15d099)but I can't seem to get any reaction when changing p2

[01:19](#msg5ab45610f3f6d24c68a6cd4b)eg p2/p/name: "Paul"

[01:20](#msg5ab45651e3d0b1ff2c59d324)any thoughts on what I am doing wrong ?

[01:23](#msg5ab456f82b9dfdbc3a115780)oh, sorry, in the code above, Person was something like p - I was hoping that I could make an existing series, Person, into a reactor

[01:23](#msg5ab45725e4ff28713a639f6e)but that didn't seem to be working, so attempt p2 was defining the series in the reactor itself

dockimbel

[01:46](#msg5ab45c67e3d0b1ff2c59e6a0)@guraaku  
&gt; eg p2/p/name: "Paul"

Does it work if you use instead: `put p2/p 'name "Paul"`?

guraaku

[01:46](#msg5ab45c8cbb1018b37a15e8ff)let me try...

[01:49](#msg5ab45d23e4ff28713a63b587)no :(

dockimbel

[01:49](#msg5ab45d43c3c5f8b90da35657)@guraaku It works here with both versions. I just added the following line to `scr`:

```
button "set" [p2/p/name: "Paul"]
```

[01:50](#msg5ab45d5f27c509a77493a102)When I click it, the second button's text is changing.

guraaku

[01:50](#msg5ab45d81e4ff28713a63b81b)ok, I was just changing the value from the console

dockimbel

[01:51](#msg5ab45dbe2b9dfdbc3a116f43)It works here even from the console.

guraaku

[01:52](#msg5ab45dd627c509a77493a265)hmm..that's interesting !

[01:52](#msg5ab45de7e4ff28713a63b940)bother versions ? or just the put

dockimbel

[01:52](#msg5ab45dfbe3d0b1ff2c59ec0b)Both versions.

[01:53](#msg5ab45e03c574b1aa3e21c02b)@guraaku Are you on macOS or Windows?

guraaku

[01:53](#msg5ab45e0d458cbde557670ce1)windows

[01:53](#msg5ab45e205f188ccc15e84937)I just triede the extra button approach too, that doesn't seem to work for me :O

dockimbel

[01:53](#msg5ab45e36c574b1aa3e21c0a8)Try to use the latest automatic build in case you are using the stable 0.6.3, as a lot of bugs were fixed since then.

guraaku

[01:54](#msg5ab45e4ac3c5f8b90da35aa7)yep, I'm using 0.6.3

[01:54](#msg5ab45e4ec3c5f8b90da35aaf)you're on mac ?

dockimbel

[01:54](#msg5ab45e52e3d0b1ff2c59ed47)Win7

guraaku

[01:54](#msg5ab45e562b9dfdbc3a117125)ah ok

[01:54](#msg5ab45e5bf3f6d24c68a6e84f)I'm windows 10

[01:54](#msg5ab45e6c27c509a77493a4aa)I'll try on my windows 7 machine later today

[01:55](#msg5ab45ea3e4ff28713a63bc47)ok, but good that it's working for you, so at least my code in general should work ! :)

[01:57](#msg5ab45efa2b9dfdbc3a11730c)ok, thanks for that @dockimbel , I'll let you know how it goes alter on

[01:57](#msg5ab45efbe4ff28713a63bd2e)later

dockimbel

[01:58](#msg5ab45f5227c509a77493a7b0)@guraaku Try with latest automatic build, it should work fine for you too. If that's not the case, you can open a ticket, as it would be probably caused by a refreshing issue on Win10.

guraaku

[01:58](#msg5ab45f60c3c5f8b90da35e49)Yep, I'll give that a go too

[05:46](#msg5ab494be458cbde55767ca42)@dockimbel , I just tried a couple of things - it didn't work on my Win7 machine, BUT, the latest automated build does work on Win7

[05:46](#msg5ab494cfe3d0b1ff2c5aa1dd)I haven't yet tried the latest automated build on Win10, i'll try that when I get home

[13:07](#msg5ab4fc155f188ccc15ead229)@dockimbel , just tested on my Win10 machine with latest automated build, that is working too. So all good, looks like it's something you've already fixed

dockimbel

[13:13](#msg5ab4fd92458cbde55769bacf)@guraaku :+1:

BeardPower

[13:15](#msg5ab4fddb27c509a7749638ff)Just out of interest: Is there some statistics on how many Red users still work with Win7?

[13:16](#msg5ab4fe1dfa066c532562461e)It would make some support decisions (graphics or audio support in Red etc.) easier.

dockimbel

[13:17](#msg5ab4fe53f3f6d24c68a995f5)@BeardPower That's something that could be collected from a console plugin, once we add the plugin framework.

BeardPower

[13:22](#msg5ab4ffa82b9dfdbc3a141376)@dockimbel Perfect. Just inform the user, that this functionality is in there and make it opt-in :)

dockimbel

[13:26](#msg5ab50092c3c5f8b90da612f8)@BeardPower Yup. ;-)

ne1uno

[15:22](#msg5ab51b9d27c509a77496ec97)Xp and win7 are going to be vm targets for a very long time compared to win10. it's the hardware drivers that can't handle anything more than OpenGL2

greggirwin

[16:35](#msg5ab52ccbc3c5f8b90da71be3)I'm just moving on Win7 myself, but it will still be around for me.

We can incentivize reporting participation with token rewards. Just have to figure out how it all works so it's easy for people to get started if they haven't done any blockchain stuff before.

BeardPower

[16:37](#msg5ab52d46c3c5f8b90da71e91)Is there an ETA on the Red wallet?

[16:37](#msg5ab52d5635dd17022e920c0a)So we can write a tutorial for it.

## Saturday 24th March, 2018

dockimbel

[04:30](#msg5ab5d46735dd17022e94c03f)@BeardPower We have a working alpha version since a while here. The biggest missing piece is software private key handling (we only have hardware support for now). I will blog about it in a few days, after I publish the one about roadmap updates.

BeardPower

[11:02](#msg5ab6303835dd17022e95d106)@dockimbel Great!

## Monday 26th March, 2018

DVL333

[10:12](#msg5ab8c772e4ff28713a74e309)Question about View engine.  
There is a `screen` face. How to use it?  
For example, I have two monitors. And I want to put window on the second monitor...

9214

[10:12](#msg5ab8c785c4d0ae8007009dc6)@DVL333 `system/view/screens`

[10:12](#msg5ab8c7aa458cbde55778266f)in your case `system/view/screens/2` should be the second display.

DVL333

[10:13](#msg5ab8c7cabb1018b37a26ec19)@9214 So what?  
`system/view/screens` in this case contain information only about the first monitor.

[10:14](#msg5ab8c815e4ff28713a74e585)

```
system/view/screens/2
== none
```

9214

[10:14](#msg5ab8c821c4d0ae800700a0b7)@qtxie does View supports multiple monitors or is it TBD? :point\_up:

DVL333

[10:23](#msg5ab8ca0abb1018b37a26f6c9)@9214 And even if it is TBD, how to assign a window to the screen? Is it a right variant?

```
w1: make face! [type: 'window size: 200x200]
append p: [] w1
system/view/screens/2: make face! [type: 'screen pane: p]
view w1
```

9214

[10:23](#msg5ab8ca20e4ff28713a74edb5)@DVL333 are you trying to build tree of faces by hand?

[10:24](#msg5ab8ca50458cbde557783152)@DVL333 https://github.com/9214/smorgasbord/blob/master/red/tree-of-faces.red

[10:28](#msg5ab8cb55e4ff28713a74f360)@DVL333 `screen` face is no different than any other `face!` object

[10:29](#msg5ab8cb7335dd17022e9f23b7)There're mandatory facets that you need to specify, they're listed \[here](https://doc.red-lang.org/en/view.html#\_face\_object)

DVL333

[10:37](#msg5ab8cd60458cbde557784037)@9214 I'm just investagation this doc. :) So I have this question. Ok, we can create `screen` face as a clone of `face!` object, in my example i have done it. But how to use it further together with other faces?

9214

[10:39](#msg5ab8cdcce4ff28713a74feed)Basically you need to specify `screen` face as a parent of some window, and populate the `pane` of your `screen` with one (or many) windows. See my example above.

[10:40](#msg5ab8ce0f35dd17022e9f2fd4)@DVL333  
&gt; in my example i have done it

your example is nonsense, because `system/view/screens/2` is `none` and you're trying to bind it to a face that doesn't contain mandatory facets.

DVL333

[10:43](#msg5ab8ced4458cbde5577847f5)But it means, that it is useless to create `screen` face manually.  
I have written "And even if it is TBD...", just imagine that it works. If it has worked, my example would have been right? You can offer your own variant - i am just asking about it.

9214

[10:43](#msg5ab8ceeb7c3a01610d76046d)Does the content of `system/view/screens` differs if you're examining it on different monitors?

[10:45](#msg5ab8cf3727c509a774a498cd)Though, if you have two identical monitors that won't tell us much :)

DVL333

[10:53](#msg5ab8d10ec574b1aa3e331c40)@9214 No, it's the same - information about first monitor. Even if the console is on the second monitor.

[10:53](#msg5ab8d131e3d0b1ff2c6b2c1c)Monitors are different with different resolutions.

rebolek

[10:54](#msg5ab8d1527c3a01610d760fdf)I don't think multiple monitors support is ready.

9214

[10:55](#msg5ab8d194458cbde5577854ab)@qtxie or @dockimbel might say for sure, but since View didn't automagically populated `system/vew/screens` with new faces, I don't think that adding them manually will change anything.

[10:55](#msg5ab8d1abc4d0ae800700d0bb)There won't be any coupling beween virtual face and physical device.

DVL333

[11:06](#msg5ab8d452c4d0ae800700dd53)My question wasn't about manual assignment windows to different monitors, that Red doesn't "see", my questions was about using `screen` face \*\*in general\*\*. How to use it together with other faces. @9214 has given an example, but it doesn't use `screen` face...

9214

[11:07](#msg5ab8d47a2b9dfdbc3a228edd)@DVL333 Really? \[It doesn't](https://github.com/9214/smorgasbord/blob/master/red/tree-of-faces.red#L11)?

DVL333

[11:10](#msg5ab8d50bc4d0ae800700e063)Really. Do you see screen face in your example? Do you create it? You only set `system/view/screens/1` as a parent facet for `window`.

9214

[11:12](#msg5ab8d5ab5f188ccc15f97957)And why you need to create another `screen` face, just for the fun of it?

[11:13](#msg5ab8d5d427c509a774a4b9ff)I mean, it would be technically useless, because only existent face in `screens` is coupled with your physical display.

[11:13](#msg5ab8d5f7458cbde557786b72)You can, in theory, create second face and then delete the first one, but I have doubts that it will work.

[11:15](#msg5ab8d63ec574b1aa3e33384c)`screen` is only used as the topmost parent for faces:

&gt; In order for any face to be displayed on screen, it must be connected to a screen face directly (for windows) or indirectly (for other face types).

DVL333

[11:18](#msg5ab8d7025f188ccc15f9835b)I am orienting on official documentation: it describes how to creates different faces and how to create `screen` face among them. So I am asking this question. :) And according to you it is really useless. But it means that official documentation has mess information. Ok, i see.

9214

[11:19](#msg5ab8d73fbb1018b37a273c06)&gt; official documentation has mess information

would be really interesting to see the "messy" parts, if you have time to point them out

DVL333

[11:22](#msg5ab8d7fec4d0ae800700edc9)part about describing `screen` object with its facets (6.17). If we needn't use it, and create it manually, what is the reason for that among describing other faces that we really create manually?

9214

[11:25](#msg5ab8d8b5f3f6d24c68b86c09)@DVL333 so we should avoid mentioning `'screen` type just because there's no use for it just yet?

[11:25](#msg5ab8d8bd5f188ccc15f98ba0)I don't follow your logic.

[11:26](#msg5ab8d8d627c509a774a4c97f)It's called \*reference documentation* for a reason.

DVL333

[11:32](#msg5ab8da682b9dfdbc3a22ac8a)My logic is that I read this documentation and try to write examples. In differ parts of this document there is notices like "don't use it, it is automatical and only for your information", but in this part that notice is omitted. So I can suppose that it usefull information and decided to ask a question.

[11:34](#msg5ab8dab82b9dfdbc3a22ae29)This part is really confusing.

9214

[11:36](#msg5ab8db43e3d0b1ff2c6b5f87)@DVL333 you can create any face object from `face!` prototype and change its facets, but AFAIK there's no use for manually created facet with `'screen` type. Still, it's used in View engine and is useful to know about. I don't understand which part of that is so confusing for you.

[11:37](#msg5ab8db7ee4ff28713a75461c)Maybe there is such usage but I'm unaware of it, maybe there will be one or two use-cases.

dockimbel

[15:22](#msg5ab9103af3f6d24c68b99758)@9214  
&gt; @qtxie or @dockimbel might say for sure, but since View didn't automagically populated `system/vew/screens` with new faces, I don't think that adding them manually will change anything.

Correct. The screen faces are the virtual representation of physical screens, so adding new ones will have no effect.

[15:23](#msg5ab9106c5f188ccc15fab6e6)View does not support yet multiple screens. It should not be a big work to support, though, it's far away in our tasks priorities for now.

9214

[17:47](#msg5ab93235f3f6d24c68ba5418)your public key is what your "wallet" is.

greggirwin

[20:41](#msg5ab95ae57c3a01610d78e3d9)@greggirwin cleaned up mis-posted messages.

## Tuesday 27th March, 2018

virtualAlan

[00:46](#msg5ab9945f458cbde5577c3225)Apologies I meant to post this here: A drag-n-drop Gui thing with properties windows and other. It's a continuation of the last one I did. Not sure if it is or can be of any use to anyone, a lot more needed i think. but anyway, please try it.  
http://www.mycode4fun.co.uk/red-apps  
Regards...  
Alan.

endo64

[07:36](#msg5ab9f489458cbde5577da11c)Nice work @virtualAlan

toomasv

[07:38](#msg5ab9f50fe3d0b1ff2c706aa8)@virtualAlan :+1:

Ungaretti

[08:24](#msg5ab9ffa72b9dfdbc3a27da25)@virtualAlan Great work! Hope to see the source code one day.

## Wednesday 28th March, 2018

AlexanderBaggett

[18:53](#msg5abbe4925f188ccc1508406e)Hello All, I am giving a small presentation (about 1 hour) about Red language at my work in one week. If you guys want to help, I would appreciate help on it. The format I am thinking about will be a short introduction about Red. Then open up the REPL and start going through some of the unique features to Red. If there is a particular concept like functional or symbolic programming for example, or how to work with blocks and `compose` and `reduce` for example that you can illustrate in just a few lines of code, I would appreciate you either messaging me or tagging me with it. I will review it and it may make it into my presentation.

9214

[18:56](#msg5abbe55b35dd17022eadf9fb)@AlexanderBaggett

```
>> thing: has [x][append body-of context? 'x [- 1] 50 - 8]
== func [/local x][append body-of context? 'x [- 1] 50 - 8]
>> thing
== 42
>> thing
== 41
>> thing
== 40
>> :thing
== func [/local x][append body-of context? 'x [- 1] 50 - 8 - 1 - 1 - 1]
```

```
>> block: [50 - 8] 
== [50 - 8] 
>> do block 
== 42 
>> do reverse block 
== -42 
>> do head change at block 2 '+ 
== 58 
>> block 
== [8 + 50]
```

rebolek

[18:56](#msg5abbe563458cbde55787260c)@AlexanderBaggett that sounds great!  
What I want to show is something like `f: func [x][x + 1] b: body-of f f/2: '-`

9214

[18:56](#msg5abbe56ebb1018b37a35e5ce)@rebolek too late :mouse:

rebolek

[18:57](#msg5abbe589bb1018b37a35e5fd)@9214 no problem, I can afford it.

[18:57](#msg5abbe5b335dd17022eadfacc)The fastest mouse in Mexico is really generous.

9214

[18:58](#msg5abbe5c6458cbde5578727bd)@AlexanderBaggett also VID and Parse stuff.

rebolek

[18:59](#msg5abbe5fe458cbde5578728e8)We should prepare generic presentation that everyone can use.

AlexanderBaggett

[18:59](#msg5abbe61be4ff28713a83cebb)I will definitely be presenting VID. And the eDSL concept in general.

[18:59](#msg5abbe62327c509a774b359a2)I haven't used Parse yet

[19:00](#msg5abbe631c574b1aa3e422234)But that is cool stuff guys

[19:00](#msg5abbe633c4d0ae80070fe171)I appreciate it

9214

[19:00](#msg5abbe642e3d0b1ff2c7a0065)@AlexanderBaggett you can look at @maximvl's talk  
https://www.youtube.com/watch?v=4ZbGJemrLFw

rebolek

[19:00](#msg5abbe668270d7d37086c2b91)@AlexanderBaggett present what you understand, if you're not familiar with `parse` skip it for now, but certainly dive into it. It's really worth it.

9214

[19:02](#msg5abbe6a85f188ccc15084ad4)@AlexanderBaggett I suggest you to show only those things that you already know, otherwise you won't be able to answer probing questions or clarify your point.

gltewalt

[19:03](#msg5abbe711bb1018b37a35ecbb)What kind of workplace?

9214

[19:04](#msg5abbe73b27c509a774b35f8f)@AlexanderBaggett but if you gonna show Parse, \*please* don't start with (or limit the talk to) string parsing, because Parse is way more than an alternative for regexes.

AlexanderBaggett

[19:05](#msg5abbe76927c509a774b3601f)@9214 I am probably not going to talk about parse. But your symbolic programming example is great stuff :)

[19:05](#msg5abbe784e4ff28713a83d58b)Mostly because I haven't used it yet.

9214

[19:06](#msg5abbe79ac4d0ae80070fe6dc)@AlexanderBaggett I guess you can adapt code examples from `/community` and `/code` repositores.

[19:06](#msg5abbe7a335dd17022eae0580)Eve clock is a nice show case.

AlexanderBaggett

[19:07](#msg5abbe7ede3d0b1ff2c7a086f)Thanks, I will take a look.

[19:08](#msg5abbe8485f188ccc15085149)Gregg Irwin had a fun Bubbles example. That would be cool to show for `Draw`

9214

[19:10](#msg5abbe8a82b9dfdbc3a312e61)@AlexanderBaggett

```
>> block: [spoon spoon]
== [spoon spoon]
>> spoon: "there's"
== "there's"
>> reduce block
== ["there's" "there's"]
>> bind next block context [spoon: "no spoon"]
== [spoon]
>> reduce block
== ["there's" "no spoon"]
>> spoon
== "there's"
>> block
== [spoon spoon]
```

[19:12](#msg5abbe91127c509a774b36a74)

```
text
>> 1 + 2 * 3
== 9
>> math [1 + 2 * 3]
== 7
```

[19:12](#msg5abbe929bb1018b37a35f74c)

```
text
>> +: :*
== make op! [[
    "Returns the product of two values" 
    value1 [number! char! pair! tuple...
>> 6 + 7
== 42
```

AlexanderBaggett

[19:13](#msg5abbe9755f188ccc15085646)That's cool stuff dude :)

9214

[19:16](#msg5abbea28c4d0ae80070ff325)

```
text
>> load "serialization is hard!"
== [serialization is hard!]
```

AlexanderBaggett

[19:17](#msg5abbea4ec574b1aa3e42351d)LOL

gltewalt

[19:18](#msg5abbea85270d7d37086c3d6d)An easy entry is to show how there are many data types and then how you can work with them directly.

AlexanderBaggett

[19:19](#msg5abbeabd270d7d37086c3e97)

```
>> ? datatype!
    datatype!      
    unset!         
    none!          
    logic!         
    block!         
    paren!         
    string!        
    file!          
    url!           
    char!          
    integer!       
    float!         
    word!          
    set-word!      
    lit-word!      
    get-word!      
    refinement!    
    issue!         
    native!        
    action!        
    op!            
    function!      
    path!          
    lit-path!      
    set-path!      
    get-path!      
    routine!       
    bitset!        
    point!         
    object!        
    typeset!       
    error!         
    vector!        
    hash!          
    pair!          
    percent!       
    tuple!         
    map!           
    binary!        
    time!          
    tag!           
    email!         
    handle!        
    date!          
    image!         
    event!         

>>
```

9214

[19:20](#msg5abbeae6c4d0ae80070ff64a)

```
text
>> user@example.com
== user@example.com
>> now
== 29-Mar-2018/0:19:08+05:00
>> 255.255.128.0
== 255.255.128.0
>> #{deadbeef}
== #{DEADBEEF}
>> <tag>
== <tag>
```

gltewalt

[19:20](#msg5abbeb1635dd17022eae1439)read http://www.coolsite.com

rgchris

[21:01](#msg5abc02bee4ff28713a845fa8)@AlexanderBaggett My favourite introduction has always been \[Ten Steps](http://rebol.info/rebolsteps.html). Really builds up the ideas behind the language. Could be followed/expanded by specific forays into DRAW or PARSE, etc.

9214

[21:02](#msg5abc02f2e4ff28713a8460b6)@rgchris nice website design!

rgchris

[21:19](#msg5abc06f1c574b1aa3e42ccdf)Is Bootstrap with a few modifications here and there : )

## Thursday 29th March, 2018

dockimbel

[04:43](#msg5abc6f01e3d0b1ff2c7c28be)@rebolek  
&gt; We should prepare generic presentation that everyone can use.

That would be very useful! A collaborative approach would be welcome.

greggirwin

[18:51](#msg5abd35a992f5d6205773a7cb)@AlexanderBaggett @rgchris's 10 steps is a great place to start. We often want to show the most advanced and mind-bending things Red can do, but Carl worked really hard to hide those details for a reason, I believe. It's too much, too soon. If you show that Red is comfortable, and has advanced features like VID (which always makes for great demos, and is easy to do live), then when people say "What's so special about that? It works like every other scripting language.", \*then* you can hit them with "Red is so powerful it can emulate any type of language. It's a language construction toolkit that just happens to come with a bunch of prebuilt languages to get you started."

[18:53](#msg5abd362fc4d0ae800715fa03)If you can setup the mandelbrot demo, to show Red/System's speed and ease of use, and also a quick cross-compiler script to build for any platform, that's gone over well for me in the past. Showing some of the best existing demos is also great. Ballots is one of my favorites.

[19:09](#msg5abd39f392f5d6205773b970)Assuming you have %red.exe and %hello.red in a dir, a cross compiler can just do something like this:

```
Red []

targets: [
    Windows
    MSDOS
    Linux
    Darwin
]

in-dir: function [
	"Evaluate a block in a directory"
	dir  [file!]  "Directory to work in; reset after body is done"
	block [block!] "Block to evaluate"
][
	orig: what-dir
	change-dir dir
	also do block change-dir orig
]

cross-compile: func [target script][
    print ['Compiling script 'for target]
    make-dir/deep append copy %bin/ target
    in-dir append copy %bin/ target [
        call/show probe form reduce [
            to-local-file clean-path %../../red
            ;to-local-file system/options/boot  ; doesn't work right now
            "-c -t" target
            append copy "..\..\" script
        ]
    ]
]

print "Red cross-compiler launcher^/"

;cross-compile 'Windows %hello.red
foreach target targets [cross-compile target %hello.red]

halt
```

AlexanderBaggett

[19:36](#msg5abd403e270d7d3708725de7)@greggirwin thanks a bunch :)

greggirwin

[19:37](#msg5abd4079458cbde5578d7cfd)Make sure to test it. Not sayin' I didn't, but it was a quick hack of an old script.

kotshie

[22:02](#msg5abd6266bb1018b37a3cb30a)Hello there, new to the language. I'm trying to have a red script parsing data from input and updating a View. What is the common pattern for communicating views and objects?

[22:02](#msg5abd626992f5d62057746f90)Thanks.

[22:04](#msg5abd62d9e3d0b1ff2c80d16b)

```
forever [
    in: input
    either not empty? in [
        msg: parse in parse-databus
        if not empty? msg [
            connected: true
            debug ["^[[31m" msg "^[[0m"]
            ; if msg is a service_status
            if msg/6 = {"service_status"} [
                debug ["^[[36;1m" msg "^[[0m"]
                val: select status msg/5
                ; if msg not exists on status map or it changes
                ; then update UI and map!
                if (none? val) or (not val = msg/1) [
                    put status msg/5 msg/1
                    ; update GUI
                    continue
                ]
            ]
        ]
    ][
        connected: false
    ]
```

9214

[22:16](#msg5abd65a4458cbde5578e2d48)@kotshie hi, welcome! Have you read official View/VID documentation?  
https://doc.red-lang.org/en/gui.html

kotshie

[22:21](#msg5abd66cf27c509a774ba3199)Hi, yes. But couldn't find how to do background processing and keep the GUI responsive.

[22:21](#msg5abd66eabb1018b37a3cc427)is there multithreading support ?

greggirwin

[22:21](#msg5abd66ee5f188ccc150f2280)Red is currently single threaded, with concurrency planned for a future release.

[22:22](#msg5abd6712c4d0ae800716db5f)In the meantime, you may need to include a `do-events/no-wait` call to let the GUI event loop update things.

9214

[22:23](#msg5abd675d270d7d3708730e39)@kotshie I guess `view/no-wait [...]` is what you need?

greggirwin

[22:23](#msg5abd6772e3d0b1ff2c80e4d2)If you're not already updating the GUI, can you show us your VID code and we can suggest how to approach it. Normally, as soon as you update the facet of a GUI face, it will show the change.

[22:24](#msg5abd67bbc4d0ae800716dd8d)e.g. `view [time: text 100 rate 0:0:1 on-time [face/data: now/time]]`

[22:25](#msg5abd67e72b9dfdbc3a37fb2a)In VID, you can use set-words, which then refer to a face, so you can make changes outside a face's event handlers.

kotshie

[22:26](#msg5abd67f927c509a774ba35c0)

```
system/view/auto-sync?: no
view/flags/options/no-wait win [no-min resize] []
```

[22:26](#msg5abd68187c3a01610d8b6933)

```
win: [
    title "Service Status"
    size 600x700
    backdrop 30.30.30
    below left
]


; stat panel ui
append win compose [
    style stat-panel:  base 75x75 60.60.60 font-size 12 font-name "monospace" font-color white  
    style titles: text font-size: 12 font-color: 150.150.150 
    tab-panel [
        "Summary" [
            across
            titles "01" 
            return
            naw-ldap: stat-panel "ldap/0" react []
            naw-bizdhcp: stat-panel "dhcp/0" 
            return
            titles "01"
            return
            aps-ldap: stat-panel "ldap/0"
            return
            titles "Core Nodes"
            return
            naw03: stat-panel "03"
            naw-cdn: stat-panel "0"
            naw-cdna: stat-panel "0"
            naw-cdnb: stat-panel "/0"
            naw-uta: stat-panel "/0"
            naw-utb: stat-panel "/0"
            return
        ]
        "Stacks" [
            titles "Stacks"
            return
            st1: stat-panel "1"
            st1-aaa: stat-panel "/0"
            st1-dhcp: stat-panel "/0"
            st2: stat-panel "s02"
            st2-aaa: stat-panel "/0"
            st2-dhcp: stat-panel "/0"

        ]
    ]
]
```

greggirwin

[22:26](#msg5abd681a270d7d37087310b7)You've set auto-sync off there, so then you need to use `show` on faces you may have changed.

kotshie

[22:27](#msg5abd6852270d7d3708731122)my UI updates well, but since I'm retrieving input from the cli indefinitely my UI hangs

[22:27](#msg5abd6866c574b1aa3e491783)my forever loop hangs the UI

[22:28](#msg5abd689592f5d62057748431)One I'm getting around it right now is using two process and a file for synchronization

[22:28](#msg5abd689c5f188ccc150f2a11)one way*

greggirwin

[22:29](#msg5abd68b527c509a774ba3840)Try using `do-events/no-wait` when you update your GUI. Maybe even call it more than once, to give the UI a chance to catch up.

kotshie

[22:29](#msg5abd68b62b9dfdbc3a37fe91)But I wondered if red already provided a way to run "background" processes

greggirwin

[22:29](#msg5abd68cc270d7d37087312c5)There is nothing like that yet.

kotshie

[22:32](#msg5abd696cc4d0ae800716e3c1)ok. Thanks for the help. will implement a two process solution for now.

greggirwin

[22:33](#msg5abd699dc4d0ae800716e477)Did you try to `do-events` approach?

[22:33](#msg5abd69d4e4ff28713a8ac442)It's not always the best approach, but may work for you. Dual processes should also work.

kotshie

[22:35](#msg5abd6a2e92f5d620577489be)I haven't done the do-events approach, will try it as well

[22:39](#msg5abd6b0ebb1018b37a3cd30a)do-events definitely improves the performance, I still get some small lag updating

greggirwin

[22:39](#msg5abd6b39c4d0ae800716eaaf)You can loop a few times on it, to see if that helps. Bit of a hack during Alpha, but may be enough.

## Saturday 31st March, 2018

abdllhygt

[15:37](#msg5abfab3bbb1018b37a458f47)hi i came!

[15:50](#msg5abfae44e4ff28713a938e1b)0.6.4 has net/http?

9214

[16:19](#msg5abfb5107c3a01610d942239)Hi @abdllhygt, full I/O support will come in 0.7.0 release, but you already can do http requests.

abdllhygt

[16:56](#msg5abfbdb7e4ff28713a93ccf1)i mean making a web app

9214

[17:46](#msg5abfc96692f5d620577db3cb)@abdllhygt that would require compiler/transpiler to webasm or asm.js, the latter one was in the plans as PoC, if I'm not mistaken.

abdllhygt

[17:48](#msg5abfc9e1270d7d37087c5cd7)i don't interest js : ) actually i mean like ruby on rails

9214

[17:51](#msg5abfcab02b9dfdbc3a411ba9)Backend, you mean?

abdllhygt

[17:52](#msg5abfcaeac574b1aa3e5278c5)yes

9214

[17:53](#msg5abfcb36e3d0b1ff2c8a261f)as, I said, I/O is missing, and proper memory management, otherwise nothing stops you from creating a web server

[17:54](#msg5abfcb4fc574b1aa3e5279bd)Nenad even created one on Rebol, it's called Cheyenne

abdllhygt

[17:58](#msg5abfcc37e4ff28713a94078e)hmm, i know cheyenne

[17:58](#msg5abfcc59e4ff28713a9407ea)i guessed maybe IO is about console

[17:58](#msg5abfcc5fc574b1aa3e527d5a)thanks

Oldes

[19:18](#msg5abfdf21458cbde55797cc06)IO is about everything;)

## Sunday 1st April, 2018

virtualAlan

[01:08](#msg5ac031255f188ccc1519d7f7)Added some more examples: not sure about the tab one (example 40) ? might be a better way , but seems to work ok - please take a look: http://www.mycode4fun.co.uk/About-Red-Programming . you'll need to scroll down to the last example. Regards. Alan.

toomasv

[06:46](#msg5ac08051bb1018b37a486b52)@virtualAlan Good work as always! :+1:

greggirwin

[20:51](#msg5ac14651e4ff28713a990ac5)Thanks Alan. I love the newer examples that show code.

## Monday 2nd April, 2018

planetsizecpu

[13:24](#msg5ac22ef7c4d0ae800728b62a)@ :+1:

## Wednesday 4th April, 2018

phrmoy

[16:18](#msg5ac4fadb7c3a01610da9955a)Hey guys, is this the most active channel of communications for Red?

[16:18](#msg5ac4faec109bb0433289cf2a)What an outstanding project this is. Very impressive.

9214

[16:19](#msg5ac4fb19c574b1aa3e681b2d)@phrmoy hi, welcome! This room is for newcomers to the language, we have the other ones too, which are fairly active each day.  
https://gitter.im/red/home

HighTechForms

[20:17](#msg5ac532dc5f188ccc152ee982)@virtualAlan I was wondering why my cursor wasn't moving from field to field! I'm not used to having to program the tab behavior. :D

phrmoy

[21:58](#msg5ac54a72e4ff28713aaaf95e)@9214 thank you!

## Thursday 5th April, 2018

nd9600

[17:47](#msg5ac661227c3a01610dafdd65)I'm running into a slight scope problem here. It almost seems like a bug, but Rebol behaves the same way, so it's probably not

[17:47](#msg5ac661311130fe3d36a6a437)

```
f: function [] [
    a: copy []
    parse "test" [
        "test"   (append a compose [copy d thru "2" (to-paren [append b d]) ])
    ]
    a
]

f2: function [] [
    b: copy []
    f_results: f
    probe f_results ; [copy d thru "2" (append b d)]
    parse "abcd2" f_results
    b
]
f2
```

[17:47](#msg5ac6613f2b9dfdbc3a5cc6fa)I'm trying to dynamically create PARSE rules

[17:48](#msg5ac6615c5f188ccc153416c9)`f`returns `[copy d thru "2" (append b d)]`, but when I try and use that in f2, it crashes

[17:48](#msg5ac6617a27c509a774df6bb1)with `b has no value \n Where: append`

[17:49](#msg5ac661afe3d0b1ff2ca5dffd)I assumed that since the block that's being converted to parens isn't executed, it wouldn't be a problem that it was defined somewhere else

[17:49](#msg5ac661c06d7e07082bc1d387)If you move `b: copy []` to outside `f2` it works ok

[17:50](#msg5ac661e0c574b1aa3e6e72db)It looks like `'b` has to be defined when `f` is called, even though it's not used

[17:50](#msg5ac661e892f5d62057996eb2)Is there anyway around that?

[17:50](#msg5ac661ef2b9dfdbc3a5cca32)Assuming this is the correct behaviour

9214

[17:50](#msg5ac661fa5f188ccc15341a35)@nd9600 `f_results: bind f 'b`

nd9600

[17:52](#msg5ac662482b9dfdbc3a5ccb69)Yeah that was it, thanks

[17:53](#msg5ac6628c92f5d620579971cc)Red is such a deep language

[17:53](#msg5ac6629327c509a774df705f)Never seemed like it on the surface

9214

[17:56](#msg5ac6633b92f5d6205799757b)@nd9600 as I understand, you want to construct Parse rule dynamically and use it to extract some data?

nd9600

[17:57](#msg5ac66389109bb04332902e0c)Yes

[17:58](#msg5ac663ab5f188ccc15342167)I'm trying to convert routes for a web framework that are written in a simple way, to Rebol's parse rules

[17:58](#msg5ac663d3c574b1aa3e6e7bd5)so `abcdef/{}/123{}1` to

```
["abcdef/" 
     copy parameter_data to "/" skip (append output_block parameter_data) "123" 
    copy parameter_data to "1" skip (append output_block parameter_data)
    ]
```

9214

[18:00](#msg5ac6644627c509a774df7686)@nd9600 there's also `collect ... keep` construct which you may find useful.

nd9600

[18:01](#msg5ac6647792f5d62057997ba2)Oh can you use it to `keep` things that aren't matched inputs?

[18:01](#msg5ac6647a6d7e07082bc1e239)I assumed noy

[18:01](#msg5ac6647d92f5d62057997bc9)not*

[18:02](#msg5ac664991130fe3d36a6b682)Because I'd need to do it inside normal Red code too

9214

[18:02](#msg5ac6649c6d7e07082bc1e310)@nd9600 what do you mean by "things that aren't matched inputs"?

nd9600

[18:02](#msg5ac664b8080a385053ff3c1e)I mean I'd need to keep `(append output_block parameter_data)` as well as parts of the input

[18:02](#msg5ac664d0e3d0b1ff2ca5f103)and `(append output_block parameter_data)` doesn't appear in the input  
so I didn't think I could `keep` it

9214

[18:05](#msg5ac665525f188ccc15342c2a)Are we talking about string parsing or data generation here? :confused:

nd9600

[18:06](#msg5ac665916d7e07082bc1e82f)Well it's parsing a string to make a rule so that Red can parse a different string with that rule to see if it matches

[18:06](#msg5ac6659e109bb0433290384c)How would you bind a function that takes arguments?

9214

[18:06](#msg5ac665bd080a385053ff4118)@nd9600 you can't "bind a function".

nd9600

[18:07](#msg5ac665cd7c3a01610daff8af)Bind a word, sorry

[18:08](#msg5ac66601e3d0b1ff2ca5f751)Ignore that  
This isn't working for some other reason

9214

[18:12](#msg5ac666fd6d7e07082bc1ef3b)@nd9600 is this what you want?

```
probe parse "abcdef/{foo}/123{bar baz}1" [
    collect [
        any [
            to "{" keep thru "}"
        |   thru end
        ]
    ]
]
```

nd9600

[18:24](#msg5ac669d1c574b1aa3e6e9eac)No, more like

```
convert_rule_to_parse_rule: funct [
    "converts a rule of the form abcdef/{}/123{} to Redbol's PARSE rule"
    rule_as_string [string!]
] [
    converted_rule: copy []
    conversion_rules: [
        any [
                ; handle's parameters
                [ 
                    copy match_until_parameter to "{" (append converted_rule match_until_parameter)
                    thru "}" 
                    [
                        ; if the parameter was at the end of the rule
                        end ( 
                            append converted_rule compose [
                                copy parameter_data to end (to-paren [append output_block parameter_data])
                            ]
                            )
                    |
                        ; if the parameter wasn't at the end of the rule
                        copy match_until_after_parameter skip (
                            append converted_rule compose [
                                copy parameter_data to (match_until_after_parameter) skip (to-paren [append output_block parameter_data])
                            ]
                            ) 
                    ]

                ]
            |   
                ; used if there are no parameters
                [ 
                    copy match_until_end thru end (append converted_rule match_until_end)
                ]

        ]
    ]
    parse rule_as_string conversion_rules
    converted_rule
]
```

[18:25](#msg5ac66a142b9dfdbc3a5cf751)If you call it like `convert_rule_to_parse_rule "abcdef/{}/123{}1"` it'll give back

```
["abcdef/" 
     copy parameter_data to "/" skip (append output_block parameter_data) "123" 
    copy parameter_data to "1" skip (append output_block parameter_data)
    ]
```

9214

[18:26](#msg5ac66a6b080a385053ff5802)I don't get why you need to generate rules if something like my example is enough.

[18:27](#msg5ac66a7a5f188ccc15344519)Unless it's for learning purposes. ;)

nd9600

[18:27](#msg5ac66a8f109bb043329050b7)Because it has to check loads of different URLs against lots of rules

[18:27](#msg5ac66aad109bb043329051a6)I'm trying to re-make something like https://laravel.com/docs/5.6/routing#route-parameters in Rebol

[18:28](#msg5ac66ad31130fe3d36a6d943)I have a list of routes like

```
[
        url "/route_test" 
        method "GET"
        controller "FirstController@index"
    ]
    [
        url "/route_test/{parameter}" 
        controller "FirstController@param_test"
    ]
```

[18:29](#msg5ac66b1427c509a774df9b71)And I check if a URL in a HTTP request matches a route, and if it does, returns the parameters from the route and the controller

Slightly different from what yours would do

[18:30](#msg5ac66b301130fe3d36a6db18)https://github.com/nd9600/framework has the whole code

[18:30](#msg5ac66b466d7e07082bc20997)It's in Rebol right now because Red can't read from and write to HTTP ports as far as I know

9214

[18:31](#msg5ac66b71080a385053ff5bd4)&gt; It's in Rebol right now because Red can't read from and write to HTTP ports as far as I know

https://github.com/red/red/wiki/Guru-Meditations#how-to-make-http-requests

[18:34](#msg5ac66c3f1130fe3d36a6e41d)@nd9600 so, if url is of the form `{...}/.../{...}/ etc etc`, you need to extract everything between `{...}`, am I getting this right?

nd9600

[18:41](#msg5ac66dc31130fe3d36a6efaf)Yes  
But also, I need to know if the url matches a pattern

[18:41](#msg5ac66de42b9dfdbc3a5d0e96)Can you read in HTTP requests from a port?

[18:42](#msg5ac66dfe2b9dfdbc3a5d0f10)Like in http://www.rebol.net/cookbook/recipes/0057.html

9214

[18:42](#msg5ac66e027c3a01610db02919)@nd9600 I don't think so, not yet. Full I/O is planned for 0.7.0 release.

[18:43](#msg5ac66e3ae3d0b1ff2ca62273)&gt; But also, I need to know if the url matches a pattern

the `{...}/.../` pattern you mean?

nd9600

[18:45](#msg5ac66eac5f188ccc15345c16)Yes, something like `"/route_test/{parameter}"`, `"/route2/{parameter}/{parameter2}"`, `/completely_different{param}_route` etc

9214

[18:46](#msg5ac66eefc574b1aa3e6ec325)@nd9600 see, if your URL contains any `{...}` thingies - they will be extracted, and `parse` will return non-empty block. If it doesn't contain `{...}` parts, `parse` will return an empty block. Can you deduce from that whenever URL matched your pattern?

nd9600

[19:19](#msg5ac676df6d7e07082bc24597)I think I saw something like that at https://nikic.github.io/2014/02/18/Fast-request-routing-using-regular-expressions.html , so possibly

9214

[19:31](#msg5ac679a392f5d6205799f691)@nd9600 sorry for confusion, I got the idea once I saw the use case. Yes, rule generation is a way to go.

nd9600

[19:32](#msg5ac679c6080a385053ffa4be)No problem. Using collect and keep like you said should make it simpler

9214

[19:47](#msg5ac67d6b080a385053ffb957)@nd9600 haven't tested it much, but here's my attempt:

```
emit: func [route][
    rule: [
        collect [
            some [
                keep to "{" skip
                copy label to "}" skip ahead [set mark skip | end (mark: 'end)] 
                keep (
                    compose/only [
                        keep (
                            to paren! reduce ['quote to set-word! label]
                        ) 
                        keep to (mark)
                    ]
                )
            |   thru end keep ([thru end])
            ]
        ]
    ]

    reduce ['collect parse route rule]
]

probe context parse "/user/nikic/42" probe emit "/user/{name}/{id}"
```

nd9600

[19:49](#msg5ac67dc81130fe3d36a74654)Impressive

9214

[19:49](#msg5ac67de6c574b1aa3e6f0f2a)Assuming that `{...}` can contain only alphabetic characters of course, otherwise you should omit conversion to `set-word!` and object creation, because your block will be just a key/value storage.

greggirwin

[19:52](#msg5ac67e607c3a01610db07787)@nd9600 as @9214 mentioned, there is the `collect` keyword in `parse` and there is the `collect` function in Red. Once you play around a bit, you'll find what is most comfortable for each of your use cases.

9214

[19:52](#msg5ac67e887c3a01610db078e7)@nd9600 also, I'm not sure if it's 100% compatible with R2 `parse`.

nd9600

[19:52](#msg5ac67e9a080a385053ffbf04)Where's `keep` defined? `? keep` tells me it's not defined in the global context

9214

[19:53](#msg5ac67ea9270d7d37089880fb)@nd9600 it's defined inside `collect`.

greggirwin

[19:53](#msg5ac67eaa109bb0433290baaa)And don't forget that you can use `-` in Red words, which is more idiomatic than underscores.

[19:53](#msg5ac67ec51130fe3d36a74c93)@nd9600, `keep` is a tricky thing, implicit in the context of the `collect` func, or the `parse` dialect.

nd9600

[19:53](#msg5ac67ed3270d7d37089881b0)The only difference I've seen in the parses so far is Rebol doesn't let you go to or thru a rule, only to input or a datatype

[19:53](#msg5ac67ed7c574b1aa3e6f13dc)Ah right

greggirwin

[19:54](#msg5ac67ee5109bb0433290bbd8)Use 'source collect' to see how it works.

[19:54](#msg5ac67f04c574b1aa3e6f1495)Red's `parse` is more advanced than Rebol's, yes.

## Friday 6th April, 2018

Sunnypt

[23:51](#msg5ac807f1080a385053065c8f)hi, how can I try the Android things that are happening ? do I have to wait till it is a new stable release ?

## Saturday 7th April, 2018

ne1uno

[00:02](#msg5ac80a85080a385053066463)Sunnypt, https://www.red-lang.org/2018/04/sneak-peek-at-red-on-android.html

[00:03](#msg5ac80acbe3d0b1ff2cad481c)there is a demo apk, no public branch or release yet

[00:04](#msg5ac80b0b109bb043329762bc)https://static.red-lang.org/build/red-eval4.apk

Sunnypt

[00:18](#msg5ac80e5ddf3e0fb547af33bf)So I guess that's a no then ? I have to wait ?

[00:21](#msg5ac80f1f7c3a01610db73d8a)thanks, @ne1uno will look forward to it

dockimbel

[03:29](#msg5ac83b0127c509a774e74588)@Sunnypt It requires to manually set the camera permission for the app, otherwise it would crash on camera start.

## Sunday 8th April, 2018

ifmihai

[14:16](#msg5aca243492f5d62057a762a5)@Ungaretti Hi, i like ur notebook and way of describing red. Do you see as worthy to add a page with a mini tutorial to use red with visual studio code? I'm a newbie with red, btw. I would like to go VSC way, not notepad++. Hence this question. I think it would help a lot all newbies.

9214

[14:17](#msg5aca247b109bb043329e2321)@ifmihai what stops you from using \[this](https://github.com/red/VScode-extension) instructions?

Ungaretti

[14:27](#msg5aca26dc92f5d62057a76cac)@ifmihai Hi Michael. Thanks. Maybe I'll do that. I haven't used VSC yet.  
Some 15 minutes ago I finished setting up \[helpin.red](http://helpin.red) . I'm not sure it's working properly, and it is seriously under development, but it already has some extra material, specially on the Draw dialect. It also has downloads of many formats, like pdf, word and windows help file... IF everything is working properly on the website, of course.

dockimbel

[14:34](#msg5aca28756d7e07082bd02cd9)@Ungaretti Looks great! :+1:

endo64

[15:30](#msg5aca357e1130fe3d36b5309a)Looks very nice @Ungaretti

ifmihai

[16:17](#msg5aca408a2b9dfdbc3a6b2fd5)@9214 i wasnt aware of that github page. thanks a lot!

[16:21](#msg5aca417492f5d62057a7cdc6)@Ungaretti looks nice! which resource will be the primary in the future? helpin.red? or the notebook? i was set to give you some mini corrections and changes, while i'm reading the notebook. But unfortunately, i cannot sign in to add comments. gitbook doesn't let me, it says i am malicious :smile:

[16:30](#msg5aca438b27c509a774edf351)@Ungaretti for now, as a newbie, i can tell you that the most confusing part for me, is about red executable: where should i place it, if PATH settings are needed, if i can rename the executable or not (i would like it to be red.exe, not red-063.exe), what's the best practice to organize red files on hdd, does red installs some files first time it runs? where is this location? I would love to see these questions answered in the notebook or helpin.red

9214

[16:36](#msg5aca44fa080a3850530d98b0)@ifmihai  
&gt; where should i place it

Anywhere. Setting up a PATH is completely up to you.

&gt; if i can rename the executable or not

You can.

&gt; what's the best practice to organize red files on hdd

Depends on the project and your preferences.

&gt; does red installs some files first time it runs?

Toolchain compiles compression library and unpacks Console executable, you can find them in `ProgramData/Red` if I'm not mistaken.

ifmihai

[16:42](#msg5aca46936d7e07082bd0a407)@9214 ah, this makes more sense, thank you for the (fast) clarification. indeed, there's a ProgramData/Red folder in there. I kept searching in my username's folder, didn't think to search ProgramData (I don't have a clue what's its purpose :D). Clearly, documentation lacks in this area. It would be useful to have this information added in the notebook.

[16:46](#msg5aca4758df3e0fb547b66126)Also, I have a pressing question, since first contact with red. I saw that rebol can use a C dll file, with load/library (if i remember correctly). Closest info i found about red, was routine! datatype, but not much else. Is it possible at this stage of red, to use a C dll file somehow? i have 2 versions of the dll file, 32bit and 64bit. This would help me a lot, to prioritize my work

9214

[16:47](#msg5aca47a16bbe1d2739c4bfdc)@ifmihai it will be possible with an \[upcoming](https://trello.com/c/MR6HCDxV/186-red-core) `library!` datatype. For now you need to use Red/System \[imports](https://static.red-lang.org/red-system-specs.html#section-15).

[16:49](#msg5aca480c92f5d62057a7ed24)Though recently this feature was postponed to future releases.

ifmihai

[16:51](#msg5aca48a927c509a774ee0544)@9214 cool, wasn't aware of library! datatype on the roadmap. that's great. For now, Red/System is kind of a nebulous subject for me, i have to understand what it is exactly, and why the need for it. What would be the sequence of action? use Red/System to import each function? then use them in normal red files?

Ungaretti

[16:54](#msg5aca493c7c3a01610dbe86ee)@ifmihai Until this morning I was not even sure I could make a website out of HelpNDoc outputs, but since it seems OK, all future updates will be done at helpin.red . I have many issues with gitbook aside of those you mention.  
Please (!) send me all corrections and suggestions and ideas! They are very welcome! I strongly suggest you use private messages or post it at gitter red/docs conversation, as it fits better there.

9214

[16:56](#msg5aca49a65f188ccc15429fb5)@ifmihai Red/System is a low-level DSL (domain-specific language) for system programming, and a compilation target for Red (R/S, in turn, compiles down to native machine code). You can look at examples of using imported functions \[here](https://github.com/red/code/tree/master/Library).

[16:58](#msg5aca4a205f188ccc1542a13a)@rebolek also has \[simple examples](http://red.qyz.cz/red-system-from-red.html) of using R/S from Red in his blog.

ifmihai

[17:03](#msg5aca4b5d109bb043329ead47)@9214 cool github page with that list! thanks! So, R/S is about speed? if i get it right? Would make sense to write code in R/S for hot parts of your code? then call it from normal red files?

[17:04](#msg5aca4ba5109bb043329eadc2)@Ungaretti i wasn't even aware that private messages are possible on gitter :smile: I am newbie with gitter too. red/docs sounds more logical, indeed. I would prefer private messages for now though

9214

[17:05](#msg5aca4bf52b9dfdbc3a6b5ea5)@ifmihai yes, it's a C-level language (albeit a bit slower than C, because we don't have any optimizations layers in place). If you're willing to sacrifice flexibility and expressiveness for speed (and if you don't mind compiling your project instead on interpreting it) - sure, you can rewrite bottlenecks in R/S, either using `routine!`s or separate files.

ifmihai

[17:07](#msg5aca4c522b9dfdbc3a6b5fd4)@9214 :+1: makes sense

mikeparr

[18:22](#msg5aca5df7109bb043329ef738)@Ungaretti - well done for your new help stuff!

ifmihai

[18:25](#msg5aca5e82109bb043329ef986)how do we exactly install Red/System? i'm thinking about creating separate R/S files, but, how do we compile the R/S file?

rebolek

[18:25](#msg5aca5e8f1130fe3d36b5d4ec)It's part of Red.

[18:25](#msg5aca5e9f270d7d3708a6b97d)Compile it like any other Red code.

9214

[18:25](#msg5aca5ea45f188ccc1542edf9)@ifmihai just like anything else, with `-c` or `-r` flags.

ifmihai

[18:26](#msg5aca5eba7c3a01610dbed5a2)so, just red.exe would suffice? nice! -c flag, ok, thank you, i will try it right now

9214

[18:26](#msg5aca5ed9080a3850530e01c4)@rebolek I see you're back, mr. Gonzalez :mouse:

rebolek

[18:54](#msg5aca656d1130fe3d36b5ee51):speedboat:

9214

[18:55](#msg5aca659e109bb043329f142f)@rebolek but you've answered only 28 minutes later...

greggirwin

[19:51](#msg5aca72cc7c3a01610dbf2031)@ifmihai, thanks for asking good questions! Not long ago we added https://github.com/red/red/wiki/Installing-Red-and-Getting-Started as a placeholder for this, and I just included your questions there to help guide what we need to include there.

## Tuesday 10th April, 2018

damanikgenis\_twitter

[03:13](#msg5acc2bcd5f188ccc154aba9a)Red Dapps ?

greggirwin

[03:22](#msg5acc2ddc6bbe1d2739cd0984)The first one, the Red Wallet, is coming soon.

sergey6661313

[06:47](#msg5acc5dfe2b9dfdbc3a741f5a)the launch in windows xp still does not work :(

9214

[09:38](#msg5acc85fb5f188ccc154c4380)@sergey6661313 new console engine is not compatible with XP and lower, you should compile the old one manually.  
https://github.com/red/red/tree/master/environment/console/GUI/old

[10:02](#msg5acc8b996d7e07082bdab720)@dockimbel :point\_up: maybe we should ship it separately?

ifmihai

[10:58](#msg5acc98ce109bb04332a8b21d)@greggirwin nice and useful link!

## Thursday 12nd April, 2018

peterkwok2018

[02:22](#msg5acec2cd6bbe1d2739d9392c)Red Wallet👍

## Friday 13th April, 2018

sergey6661313

[05:50](#msg5ad045405d7286b43a23fb65)I'm stupid myself can not use your link :)  
But I can try compiling "view \[text" Hello World! "]" On the version red-13apr18-3bc6a8d0.exe using windows xp and get the flown inscription https://pastenow.ru/2XG00

9214

[12:05](#msg5ad09cfb109bb04332bb49b4)@sergey6661313 if I get it right, you don't know how to compile console from sources? Have you read readme file instructions in Red repository?

## Saturday 14th April, 2018

virtualAlan

[00:52](#msg5ad150b2df3e0fb547d675b4)A drag/drop GUI maker 'version 2.1'. an update.  
Try it. I promised the script for this one. Will post it when I've done a little more to it. Just an observation, everything works as I expect when using the 'red-05jan18' build, but the latest builds are a bit flickery and need several clicks on some widgets ? - need to look at this. Any other issues with it, please let me know. Tested with Win 10. PC, Laptop and Tablet. http://www.mycode4fun.co.uk/red-apps  
Regards....  
Alan.

## Sunday 15th April, 2018

abdllhygt

[13:42](#msg5ad356ce27c509a7741418b6)hi!

9214

[15:09](#msg5ad36b0e1130fe3d36dcebbb)Hi @abdllhygt :)

abdllhygt

[15:33](#msg5ad370d5df3e0fb547dd3edf)@9214 when do you come to here?

[15:35](#msg5ad3712915c9b03114fc4e16)i mean turkey : ) come and teach red : )

rebolek

[15:36](#msg5ad3718327c509a7741477e6):D

[15:36](#msg5ad371977c3a01610de513d6)Red Apostle #9214

9214

[15:58](#msg5ad3768b6d7e07082bf87f7b)@rebolek I prefer "harbinger".

rebolek

[15:58](#msg5ad3769e6bbe1d2739ebd884)ou

abdllhygt

[17:47](#msg5ad3903b27c509a77414e3b3)what means those? @9214 @rebolek , you're teacher for me

9214

[17:51](#msg5ad3912f6d7e07082bf8e904)@abdllhygt "a person who praises something", roughly speaking.

abdllhygt

[17:53](#msg5ad391a85f188ccc1569e78d)i used tranlate, and i guessed friend of Jesus (apostle)

9214

[18:05](#msg5ad3946415c9b03114fcce13):point\_up: 6/1000th face of @greggirwin :^)

abdllhygt

[18:06](#msg5ad394a85f188ccc1569f24d)what means?

9214

[18:08](#msg5ad3952a15c9b03114fcd0f1)@abdllhygt an inside joke :)

abdllhygt

[18:10](#msg5ad3958a15c9b03114fcd264)i don't understand the jokes, what about

kotshie

[18:50](#msg5ad39f0c109bb04332c5d81e)I'm trying to use the libRed API in Linux, but when calling redOpen I get:

```
*** Script Error: cannot access system in path none
*** Where: eval-path
*** Stack:
```

[18:52](#msg5ad39f665f188ccc156a19da)Am I doing something wrong?

9214

[18:52](#msg5ad39f6e15c9b03114fcf598)@kotshie can you show us your code?

kotshie

[18:53](#msg5ad39fb815c9b03114fcf7ba)it even happens in this sample:

```
#include "red.h"

    int main() {
        redOpen();
        redDo("print {Done}");
        redClose();
        return 0;
    }
```

[18:55](#msg5ad3a0041130fe3d36ddb75d)

```
gcc -m32 red_sample.c -o red_sample -lRed
```

9214

[18:58](#msg5ad3a0cd5d7286b43a304973)@kotshie have you build libRed with `cdecl` ABI?

[18:58](#msg5ad3a0ec1130fe3d36ddba1c)You can also check out libRed tests, to see if they work as expected:  
https://github.com/red/red/tree/master/tests/libRed

[18:59](#msg5ad3a0fa15c9b03114fcfc13)And documentation:  
https://doc.red-lang.org/en/libred.html

kotshie

[19:06](#msg5ad3a2b06d7e07082bf92afa)when I ran "red build libRed" it only created a libRedRT.so not a libRed.so

9214

[19:07](#msg5ad3a3056bbe1d2739ec74dd)That's strange, as I build it just now with same command.

[19:08](#msg5ad3a3257c3a01610de5c2cd)can you try `red clean` and then `red build libRed`?

kotshie

[19:08](#msg5ad3a3286d7e07082bf92c4b)built it with "do/args %red.r "build libRed" inside rebol

[19:12](#msg5ad3a41a102fac7b7b15b300)if I run it on directory like this, I get this error.

```
-=== Red Compiler 0.6.3 ===- 

Compiling /home/kotshie/Downloads/libRed/libRed.red ...
...compilation time : 803 ms

Target: Linux 

Compiling to native code...
*** Compilation Error: invalid path value: OS-image/make-image 
*** in file: %/home/kotshie/Downloads/libRed/libRed.red 
*** in function: exec/redImage
*** at line: 1 
*** near: [[rgb: src] 
    img/node: OS-image/make-image width height rgb null null
]
```

9214

[19:13](#msg5ad3a44f15c9b03114fd06c0)@kotshie run what and on what directory?

kotshie

[19:13](#msg5ad3a46f15c9b03114fd071f)

```
red build libRed
```

9214

[19:16](#msg5ad3a5091130fe3d36ddc9f6)Can't reproduce it here.

kotshie

[19:53](#msg5ad3ada61130fe3d36dde8ca)I noticed that OS-image does not exist in Linux platform, its defined on image-quartz.red and image-gdi+.red

[19:53](#msg5ad3adbd102fac7b7b15d918)am at the master branch

9214

[20:43](#msg5ad3b98a6bbe1d2739ecca84)@kotshie are you using nightly or stable build?

kotshie

[20:45](#msg5ad3b9e05d7286b43a30a578)I was using stable, just switched to nightly and I was able to build it .

[20:45](#msg5ad3b9ee27c509a77415796a)somehow red was downloading an old libRed.red

[20:45](#msg5ad3b9f62b9dfdbc3a934d9b)was having this issue: https://github.com/red/red/issues/2916

virtualAlan

[23:34](#msg5ad3e18e270d7d3708ce6e91)@abdllhygt Yes apologies for the others. I guess it makes them feel superior. These insider jokes and remarks are not nice on a welcome page. Please continue with Red, it is worth it.

## Monday 16th April, 2018

greggirwin

[01:03](#msg5ad3f66c1130fe3d36ded3d7)Communicating globally is always a challenge, especially when new people arrive and we forget that they don't know all our history.

9214

[02:13](#msg5ad406d55f188ccc156b5f46)@virtualAlan but making a bad lot out of me with your "guesses" is nice, yes? Also, does it make you feel as a good samaritan, in a superior way?

[02:15](#msg5ad4072e2b9dfdbc3a942384)@abdllhygt I'm sorry if I made you upset in any way with my remark.

## Tuesday 17th April, 2018

githubnyn

[11:30](#msg5ad5daba6bbe1d2739f5d656)does the RED compiler convert red/system to assembly or directly byte codes for PC/Mac/Linux ?

rebolek

[11:31](#msg5ad5db0b6bbe1d2739f5d8d6)directly to machine code, otherwise you would need another compiler that would compile assembly to machine code

9214

[11:31](#msg5ad5db0c2b9dfdbc3a9c228d)@githubnyn Red compiles to R/S, R/S compiles down to platform-specific machine code.

githubnyn

[11:41](#msg5ad5dd7c7c3a01610def134b)so in order to convert `a: 1 + 2` to byte code I guess you first need to convert it to assembly on paper, then find out the corrisponding byte codes of Windows / OS X / Linux and then tell the compiler to use these byte codes ?

rebolek

[11:42](#msg5ad5ddb27c3a01610def13df)@githubnyn Red compiler knows the right bytecodes, so does the conversion for you

githubnyn

[11:52](#msg5ad5dff45f188ccc15738215)I see. I guess my question would be when writing a compiler you first use ASM as reference to get the byte codes needed by the compiler

9214

[11:53](#msg5ad5e03d6d7e07082b02c3b4)@githubnyn what problem are you trying to solve?

rebolek

[11:54](#msg5ad5e086109bb04332cf36fd)Yes, you would need it as reference, so you would know that `push ebp` in assembler is `C5 F0` in machine code (it isn't, I just made it up, but you get the idea).

[11:55](#msg5ad5e0b77c3a01610def21ff)But there's no need for compiler to first translate code to assembler and then to machine code, because the mapping between assembler and machine code is 1:1

githubnyn

[11:57](#msg5ad5e11b5f188ccc1573885b)great thank you

## Saturday 21st April, 2018

kotshie

[04:09](#msg5adab95e62316e0505e2e6ad)Reading on https://doc.red-lang.org/en/libred.html#\_redroutine

[04:09](#msg5adab9666bbe1d27390be954)mentions "like redirecting print or ask"

[04:09](#msg5adab9936bbe1d27390bea33)is there any example of how to do that? I want to try to redirect some existing red functions to c funcs

9214

[08:23](#msg5adaf51a5d7286b43a507091)@kotshie this?  
https://github.com/red/red/blob/master/tests/libRed/test.c#L42

[08:24](#msg5adaf5591130fe3d36fe2130)https://github.com/red/red/blob/master/tests/libRed/test.c#L9

amreus

[12:13](#msg5adb2ae015c9b031141dc286)good morning. Is it possible to create a clickable link in a `area`?

9214

[12:14](#msg5adb2b2d62316e0505e45a73)@amreus I don't think so, `area` is just a multi-line input field.

[12:15](#msg5adb2b4d109bb04332e66104)You can play around with \[RTD](https://github.com/red/red/wiki/Rich-Text-support) and \[actors](https://doc.red-lang.org/en/view.html#\_actors), though, I'm not an expert in that (and can't check out RTD because I'm :penguin:)

amreus

[12:40](#msg5adb31511130fe3d36fef26b)@9214 Linux? Thanks for the links. i think it is something I do not want to get into at this time.

[12:50](#msg5adb3379270d7d3708ee496d)if I accidentally redfine a function in the console, is there a way to get the original back other than resarting the console?

9214

[12:51](#msg5adb33b96bbe1d27390d7f5d)@amreus no, unless it's referenced by some other word / stored somewhere else.

amreus

[13:02](#msg5adb36712b9dfdbc3ab39a22)@9214 Then perhaps a `restart` function be written?

9214

[13:03](#msg5adb369162316e0505e48294)@amreus yeah, and what if I redefine `restart`? :)

amreus

[13:04](#msg5adb36c227c509a774366a91)@9214 Same as everything I suppose - don't do it.

9214

[13:04](#msg5adb36c47c3a01610d066724)It makes sense only in a REPL, as an escape mechanism in the menu bar.

amreus

[13:06](#msg5adb373e270d7d3708ee56b9)It would be nice to reset the console sometimes. I try dumb things and it would be nice to start with a clean slate without resartying. No big deal restarting i guess.

## Sunday 22nd April, 2018

abdllhygt

[17:00](#msg5adcbfc7109bb04332eba60a)@virtualAlan @9214 I mean, i don't understand because of my bad english. I asked, because "jokes about Prophets" disturb me. It's false if jokes about these.

9214

[17:41](#msg5adcc92f1130fe3d36046304)@abdllhygt I understand what you mean. No, they weren't about prophets or religious thematics. We don't value such "jokes" either. What @rebolek probably meant is that I'm good at \[IT evangelism](https://en.wikipedia.org/wiki/Technology\_evangelist) when it comes to Red. My remark about @greggirwin was due to the fact that he played many roles in a theater (i.e. "has many faces"), and he also loves \[Cambell's work](https://en.wikipedia.org/wiki/The\_Hero\_with\_a\_Thousand\_Faces).

greggirwin

[19:31](#msg5adce3212b9dfdbc3ab92d3f)@9214 +1

[19:32](#msg5adce367270d7d3708f40f1e):point\_up: \[April 21, 2018 7:06 AM](https://gitter.im/red/red/welcome?at=5adb373e270d7d3708ee56b9) @amreus, sometimes things just require a different mindset, or approach. A strength can also be a weakness. e.g., Smalltalk is noted for the power of system images, but how do you "go back" to a specific, previous state?

[19:33](#msg5adce38c7c3a01610d0bfced)When Red adds `protect`, it will help some in that regard.

## Monday 23th April, 2018

JacobGood1

[01:54](#msg5add3cf062316e0505eb553f)every time you save in smalltalk (pharo) the image is recorded so you can rollback, think of it like committing on git

[01:55](#msg5add3d2f270d7d3708f52f5d)I am not trying to undermine your point btw...

greggirwin

[02:37](#msg5add46cd7c3a01610d0d3f4b)Original Smalltalk did not do that, did it?

[02:37](#msg5add46e01130fe3d36060c37)I have only peeked at Pharo, though have it here so I could check to learn more. Thanks @JacobGood1 .

JacobGood1

[03:01](#msg5add4c872b9dfdbc3aba859d)I have no idea

virtualAlan

[13:03](#msg5addd9b72d0e228d7ba1d13e)@9214 yes, my comment was not well composed, even though it was meant in a good and positive way. I should have worded it differently and it certainly was not my intention to make bad of you in any way. You are a Red guru and we are all learning a lot about Red from your excellent help, Please accept my apologies for my clumsy comment. Regards. Alan.

9214

[13:04](#msg5addd9eb6d7e07082b245e2f)@virtualAlan no worries Alan, thanks for being mindful of our community. We all learn from your examples too. :+1:

## Wednesday 25th April, 2018

amreus

[00:19](#msg5adfc9aa27c509a77449bbb2)Hi. What is `quote` used for?

dander

[01:24](#msg5adfd8ea109bb04332fa28fc)@amreus it returns its argument without evaluating it. For example, if you want to store a `lit-word!` instead of it being evaluated to the corresponding `word!`

[01:26](#msg5adfd9287c3a01610d19b0dd)Or keeping parens from being evaluated

freeballlight\_twitter

[07:20](#msg5ae02c301130fe3d36140eca)REDcoin ,When to go to the exchange @greggirwin

[07:24](#msg5ae02d3b7c3a01610d1b0162)what's telegram address

greggirwin

[07:34](#msg5ae02f792b9dfdbc3ac84c8b)@freeballlight\_twitter: https://t.me/redofficial Any news about exchanges will be posted there.

freeballlight\_twitter

[07:48](#msg5ae032de27c509a7744b5f7b)\[!\[image.png](https://files.gitter.im/red/red/welcome/9K0S/thumb/image.png)](https://files.gitter.im/red/red/welcome/9K0S/image.png)

[07:52](#msg5ae033da27c509a7744b634f)\[!\[image.png](https://files.gitter.im/red/red/welcome/93ly/thumb/image.png)](https://files.gitter.im/red/red/welcome/93ly/image.png)

[07:53](#msg5ae033e415c9b03114330165)why @greggirwin

greggirwin

[08:14](#msg5ae038e527c509a7744b7b39)I don't know why it isn't working for you, sorry.

[08:15](#msg5ae0393662316e0505f97d7a)You could try https://t.me/joinchat/HcmxBBFazgI5uoK0iAO45Q.

[08:16](#msg5ae03950270d7d3708037ab1)If you can join there, an admin may be able to help you.

freeballlight\_twitter

[08:17](#msg5ae039872b9dfdbc3ac87983)i can join there

[08:19](#msg5ae039ff2d0e228d7bad570a)I will ask administrator that why cannot join https://t.me/redofficial

9214

[09:17](#msg5ae047b462316e0505f9cb99)@freeballlight\_twitter probably because you were banned from there.

## Thursday 26th April, 2018

freeballlight\_twitter

[08:29](#msg5ae18e035d7286b43a6ca1d3)why?banned from there.

9214

[08:36](#msg5ae18f98b01085166cc1b2b8)@freeballlight\_twitter ask an admin of the group that @greggirwin linked to you. This Gitter room is specifically for helping new programmers to get started with Red, so please don't derail it.

freeballlight\_twitter

[09:29](#msg5ae19be2109bb04332023f6f)@greggirwin why?banned from there https://t.me/redofficial

9214

[09:31](#msg5ae19c6c2b9dfdbc3acef855)@freeballlight\_twitter I think @greggirwin already answered that he don't know and that you should ask an admin in \[this](https://t.me/joinchat/HcmxBBFazgI5uoK0iAO45Q) group. I pointed you to do the same, and specifically asked to stop flooding in this room, yet you continue to do so.

[09:42](#msg5ae19f1d2b9dfdbc3acf05a9)@9214 he do\*\*es\*\*n't know

freeballlight\_twitter

[10:09](#msg5ae1a56415c9b0311439dc43)who's admin .I talk to him in private

BeardPower

[12:47](#msg5ae1ca6c1130fe3d361c140a)@freeballlight\_twitter Official Customer Service

## Saturday 28th April, 2018

jbshirk

[21:29](#msg5ae4e7ce6d7e07082b44d37a)Hi. I was chided doubly for posting a question in thewrong

[21:30](#msg5ae4e7e41130fe3d362984b1)App domain. Moving to here

[21:30](#msg5ae4e7ec2d0e228d7bc1d177)https://github.com/red/red/issues/3304#issuecomment-377790261

[21:33](#msg5ae4e8967c3a01610d2f8f67)There's no way to search the history of gitter (at least in my phone) so my apologies if the question is answer already. I am wondering how red could run in or compile targeted to the browser (like Amber Smalltalk or PharoJS, respectively)

## Sunday 29th April, 2018

guraaku

[10:20](#msg5ae59c5c2d0e228d7bc3d453)Just had a closer look at the recent post on Android, in the lists of features still needed is "Red GUI console support". So I take it at some point we will get that, that we can run Red console on Android ?

[10:21](#msg5ae59c98270d7d37081a1243)Recently I've been thinking whether or not to buy a cheap Windows tablet, sy 7 or 8 inch, so I can play around with Red on the go..... But if we get Red console on Android sometime soon, I wouldn't need to buy a new tablet, I can just use my phone :)

[10:21](#msg5ae59cb6109bb04332123338)I wonder how long it will be though...

pekr

[10:39](#msg5ae5a0e462316e05051005fa)My understanding is, that Red GUI console is implemented in View itself, so should be, in theory, kind of easily portable ...

guraaku

[10:41](#msg5ae5a169270d7d37081a2307)Would be good to be able to play around with Red on my phone anytime I have some idea...

9214

[11:25](#msg5ae5abbc2b9dfdbc3adf4720)@jbshirk Red, being too high level, cannot be compiled to javascript. Red/System can.

[11:26](#msg5ae5abde109bb04332126898)But there're no plans for WebAssembly or asm.js backends.

[11:26](#msg5ae5abeadad6fb186ffb0f11)So far*

jbshirk

[11:57](#msg5ae5b3172d0e228d7bc422e7)@9214 thank you. I've been reading about Pollen, a nice book site generator language written in Racket (based on Scheme and Lisp), but when I found Red, I thought it could be an ideal alternative.

[11:57](#msg5ae5b3286d7e07082b4739f3)https://docs.racket-lang.org/pollen/

[11:57](#msg5ae5b33a6d7e07082b473a07)http://racket-lang.org/

pekr

[12:02](#msg5ae5b43c6d7e07082b473d55)I think there is some plan for a web assembly, just not a concrete one. Let's not make it sound, like Red team would not be interested in those areas ...

viayuve

[12:04](#msg5ae5b4d6109bb043321287c9)What is web Assembly you mean something like web server like wamp

pekr

[12:07](#msg5ae5b5775d7286b43a7d2faa)No. Wrb Assembly is a next gen stack, which is going to be included in browsers. Your language can then compile to it. So no more JS only, though nowadays some languages compile to Emscriptem, which is reduced and optimized JS subset, or something like that.

[12:08](#msg5ae5b5d75d7286b43a7d30cc)http://webassembly.org

## Monday 30th April, 2018

virtualAlan

[00:07](#msg5ae65e3d109bb0433214d629)  
http://www.mycode4fun.co.uk/About-Red-Programming  
and my Gui creater here;  
http://www.mycode4fun.co.uk/red-apps  
hope it is all useful to someone.  
Regards. Alan.&gt;

greggirwin

[02:10](#msg5ae67b2d7c3a01610d349ff9)Thanks for the update Alan!

guraaku

[11:53](#msg5ae7039c109bb04332173eb0)Hi, am playing around with styles in VID, not sure if I'm understanding it properly

[11:53](#msg5ae703b9270d7d37081f2d11)

```
view [
    style pics: panel green [
        below
        image https://picsum.photos/160 loose
        image https://picsum.photos/160 loose
    ] 

    pics
    pics
]
```

[11:53](#msg5ae703bf5d7286b43a81efc2)hmm

[11:54](#msg5ae703ed62316e05051519fc)sorry, didn't format well :(

[11:54](#msg5ae70406270d7d37081f2f3b)anyway, with that code, I was expecting to see 2 panels with 2 images in each panel

[11:54](#msg5ae7040e15c9b031144f035d)but the images don't appear in the second panel

[12:14](#msg5ae708b2109bb043321755d9)

```
view [
    style buttons: panel green [
        below
        button "hello"
        button "goodbye"
    ] 

    buttons
    buttons
]
```

[12:15](#msg5ae708ce15c9b031144f1cb6)similarly, the two buttons only appear in the first panel

9214

[14:17](#msg5ae7256915c9b031144fb122)@guraaku I guess it's because

&gt; Sets a new style in \*\*the current panel\*\*. The new style can be created from existing face types or from other styles. \*\*The new style is valid only in the current panel and child panels\*\*.

[14:17](#msg5ae725772d0e228d7bc9adb4)https://doc.red-lang.org/en/vid.html#\_style

[14:20](#msg5ae72632109bb0433217f0a6)@qtxie @dockimbel :point\_up: should buttons and other control elements be duplicated in such cases?

dockimbel

[16:29](#msg5ae744785d7286b43a834038)A style is just one face, a panel can have a tree of child faces, so can't be used as a style. Styles are there to customize the look of widgets, not to instantiate layouts made of several faces. If one needs to duplicate VID code beyond what styles can achieve, just use regular Red constructions, like `compose` to build VID blocks dynamically.

greggirwin

[18:24](#msg5ae75f7a2d0e228d7bcae33c)Good question @guraaku. I added a note to the VID hints wiki page.

guraaku

[21:24](#msg5ae7899c7c3a01610d396c22)Thanks @9214, @dockimbel, @greggirwin :) Ok, actually yes what I was really wanting to achieve was some kind of reusable group of faces - so I need to go down the path of just manipulatin the VID code, that's fine

[21:26](#msg5ae78a12dad6fb186f02b40c)For example, I want to be able to define groups of images that will be used on different screens - so styles wouldn't have helped me there anyway, given they are only valid in current and child panels

greggirwin

[21:42](#msg5ae78db5270d7d370821f4cc)Generating VID is pretty easy, and writing helpers to do it, where you parameterize facets, is fun. e.g. you can write VID+ dialects that generate straight VID.

guraaku

[21:53](#msg5ae7904562316e050517e56e)yes, I think that sounds like the approach I would like to take

## Wednesday 2nd May, 2018

amreus

[22:52](#msg5aea4133e2d30c2f045d5f69)Is there a better idiom for checking path existence? for example my intent is:

```
a: [b: 1]
if a/c [ val: a/c/1 ]
```

greggirwin

[23:06](#msg5aea448c0a9c956f041fdb36)That's fine, and safe in Red. It doesn't distinguish between `c` being `none` and `c` not being there at all though.

## Thursday 3th May, 2018

hiiamboris

[08:01](#msg5aeac1c10a9c956f04214461)@amreus if a/c is a function you'll call it though, better use `if :a/c` ;)

## Friday 4th May, 2018

amreus

[07:02](#msg5aec057f5cf0b83004561af9)Thanks guys - I believe `val: attempt [a/c/1]` is what I wanted.

gltewalt

[16:17](#msg5aec879000dc48880495d4cd)Wanted to edit that, but ran out of gitter time - so I jut deleted

amreus

[23:57](#msg5aecf35153ceca3604b22f50)Can I make `date!` from a string? `to-date "5-May-2018"` fails, as do other date-string forms I have tried.

## Saturday 5th May, 2018

9214

[01:58](#msg5aed0fb06f9af87e0443eb9b)@amreus `load`

greggirwin

[04:14](#msg5aed2f9500dc48880497b942)@amreus, also see https://doc.red-lang.org/en/date.html. `Make` and `to` aren't exact equivalents, but the `make` examples there should work with `to` as well, at least showing you the supported spec.

amreus

[20:28](#msg5aee13fc6d98e53e04557ba0)I was just surprised strings are not supported. Is that by design, or just not implemented yet?

greggirwin

[21:10](#msg5aee1dd103cafa797b2ccc0f)By design. `To` is not lexer based, but for converting from existing Red values.

## Sunday 6th May, 2018

endo64

[08:50](#msg5aeec1c803cafa797b2e0dc1)&gt; Can I make `date!` from a string? `to-date "5-May-2018"` fails, as do other date-string forms I have tried.

@greggirwin @amreus Should we add this to https://github.com/red/red/wiki/Differences-between-Red-and-Rebol as it works in R2 (didn't test with R3 yet)

dockimbel

[08:59](#msg5aeec3e66f9af87e0447b937)@endo64 If you add it there, just mention that's a temporary difference. The lexer is far from its final form yet.

endo64

[09:03](#msg5aeec4eeff26986d08379ea1)@dockimbel Ok, thanks, I thought it's a permanent difference.

[09:18](#msg5aeec86a5cf0b830045d976c)Added to the wiki.

amreus

[12:29](#msg5aeef5285cf0b830045e0351)Thanks all. Would it make sense to have a issue tracker for differences instead of a wiki? That way differences can be tracked, and closed as they are implemented.

endo64

[21:14](#msg5aef703dff26986d083940d3)But not all differences will be implemented and closed, most of them is by design so they should be noted in a wiki like docs, instead of tracking. About `to-date`, we could open an issue on git to not forget it to implement.

## Monday 7th May, 2018

amreus

[00:03](#msg5aef97dc03cafa797b301b8d)@endo64 Makes sense - maybe just a Label in the existing issue tracker for such issues.

dockimbel

[09:22](#msg5af01af253ceca3604b9a136)I prefer we don't open issues on Github about features that we already plan to do.

## Tuesday 8th May, 2018

Re-git

[17:54](#msg5af1e4695cf0b830046732d5)Hi, I just started playing with Red. It really like the idea of super simple gui programming but I have problem with this very simple toy code.  
I want to display the choosen filename path changing text in gui but it does not seem to work, after choosing the file from the dialog, text does not change and keeps diplaying "some text".  
Here is my code:

`Red [] x: "some text" View[ test-btn: button "Test me" [ my-file: request-file txt/text: my-file] txt: text x]`

Can you help me understand what I'm doing wrong here?

9214

[18:18](#msg5af1e9f300dc488804a51bf6)Hi @vejitatoja, you need to convert `file!` to `string!` explicitly, say, with `mold` or `form`:

```
view [button "file" [t/text: mold request-file] return t: text 400x20 "text"]
```

Or, to prettify things, with `to-local-file`:

```
view [button "file" [t/text: to-local-file request-file] return t: text 400x20 "text"]
```

toomasv

[18:23](#msg5af1eb1600dc488804a51fb3)@vejitatoja One possibility is also to use `data` facet of `text` face:

```
x: "some text" View[ test-btn: button "Test me" [ my-file: request-file txt/data: my-file] txt: text x]
```

9214

[18:23](#msg5af1eb2518d6bdde3726afc6)@toomasv :+1:

[18:25](#msg5af1eb9fff26986d0841655b)@vejitatoja :point\_up: `text` and `data` facet are synchronized, and once `data` is updated `text` will be set to its `form`ed representation. Or, if you'd updated `text`, `data` would be updated with `load`ed data.

Re-git

[18:46](#msg5af1f070da323a7c0407efab)@9214 Thank you! Using `form` or `mold` everything worked. Your answer made me realize that there are different object types like `file!` and `string!`

9214

[18:49](#msg5af1f127f2d2d537047261cd)@vejitatoja they are not objects though, just values. Red has ~50 datatypes and counting.

```
>> ? datatype!
...    
    string!        
    file!          
    url!           
...
```

Welcome to the community btw ;)

Re-git

[18:51](#msg5af1f1c259a0578004b488d9)@toomasv Thank you. It worked. :+1:

Is there a way to list all of the of the available facets?

9214

[18:52](#msg5af1f1dbf2d2d537047263d0)@vejitatoja https://doc.red-lang.org/en/view.html#\_face\_object

[18:54](#msg5af1f2486f9af87e04516eab)Or just `probe face!`

Re-git

[18:55](#msg5af1f2b2b37eab7d0478f4ad)@9214 Thank you. I will keep exploring!

9214

[18:58](#msg5af1f36897f07c7e137af26b)@vejitatoja FYI, we have \[`red/help`](https://gitter.im/red/help) room, in case you need a deeper help with your code. Also check out list of \[all rooms](https://gitter.im/red/home) and \[Github wiki](https://github.com/red/red/wiki).

toomasv

[19:23](#msg5af1f91f5cf0b8300467833c)@vejitatoja You are welcome! BTW about datatypes - \[this](https://github.com/toomasv/red-type-hierarchy/blob/master/Red%20type%20hierarchy2.pdf) might be interesting to you.

greggirwin

[20:44](#msg5af20c201eddba3d04e18bed)@vejitatoja, welcome! You can also try https://gist.github.com/greggirwin/91dc1c3971998e0babeedba9f7e60bc5 for exploring. `Help` and `source` are your friends in the repl. e.g. you can do `help datatype!` and it will list them. Docs are a work in progress, but ask and we can point you to things if you can't find them.

[20:48](#msg5af20d386d98e53e04610ba7)Don't worry when you hit some things that are different than what you might expect. Red is different.

## Wednesday 9th May, 2018

toomasv

[02:51](#msg5af2624040f24c430462ce0c)@vejitatoja And to study conversions between datatypes you can use \[conversion-lab](https://gist.github.com/toomasv/63a0ee4b5e5c5df2d2d83d76eb884989) :)

planetsizecpu

[06:10](#msg5af290bdda323a7c0409b694)@vejitatoja \[this script](https://github.com/planetsizecpu/forms/blob/master/forms.red) will help you a bit for gui objects

## Thursday 10th May, 2018

Re-git

[12:43](#msg5af43e85d245fe2eb79d5983)@planetsizecpu Thank you i will check that out!

[12:45](#msg5af43eea5a1d895fae2c9ca2)Is it possible to run Red console Repl on Android? I will be traveling a lot in the next days and would like to write some simple scripts on my mobile device while reading through the book on Rebol.

9214

[12:50](#msg5af44012862c5e33e9244464)@vejitatoja no, it's not yet possible.

meijeru

[12:54](#msg5af440f8d245fe2eb79d63c0)@vejitatoja For interest: which book on Rebol are you reading? A first book on Red is coming out soon.

Re-git

[13:15](#msg5af445f9862c5e33e9245b08)@meijeru I have converted the book i found on http://re-bol.com/rebol.html to .mobi so i can read it on my kindle.

9214

[13:16](#msg5af4462ee0b50c2d05b06d77)@vejitatoja you can get free PDFs of Nick's books from Lulu.

[13:16](#msg5af4463af04ce53632c879bd)see https://github.com/red/red/wiki/Learning-resources#books

[13:17](#msg5af446545a1d895fae2cb9f3)I'd recommend to start with \[User guide](http://www.rebol.com/docs/core23/rebolcore.html)

[13:24](#msg5af448222df44c2d06190a46)but bear in mind that Rebol2 is not 100% compatible with Red (see some notes \[here](https://github.com/red/red/wiki/REBOL-Core-Users-Guide-\_\_-A-walkthrough-with-Red))

meijeru

[13:54](#msg5af44f16d332ee5fad0a6c02)The book I referred to is already \[announced by Amazon](https://www.amazon.com/Learn-Red-Fundamentals-running-language/dp/1789130700/ref=sr\_1\_10?s=books&amp;ie=UTF8&amp;qid=1524151017&amp;sr=1-10&amp;refinements=p\_27%3AIvo+Balbaert).

9214

[13:59](#msg5af4503fea553a33ea52f2ed)Book description makes my spider sense tingle.

meijeru

[15:33](#msg5af466595666c42eb6fef7e6)How's that?

[15:58](#msg5af46c33bd10f34a68f0ed05)What danger do you sense?

9214

[15:59](#msg5af46c5f5666c42eb6ff120f)I'd rather keep it to myself until I get a chance to read the whole thing.

meijeru

[16:12](#msg5af46f81d332ee5fad0aeb42)It's a commercial venture by a firm that has produced books about almost all ICT subjects. The author has published many books about different programming languages. I was asked to do some reviewing on the manuscript. It is at a more basic level than Nick's book I would say.

## Sunday 13th May, 2018

abdllhygt

[09:03](#msg5af7ff669ad18967b9dfafd4)hey!

[09:03](#msg5af7ff6c52194a4a67df12fe)what's rai?

9214

[13:39](#msg5af840175a1d895fae377190)@abdllhygt hi, can you be more specific?

## Monday 14th May, 2018

rgchris

[05:26](#msg5af91e1c9ad18967b9e269a6)@abdllhygt Rebol. (was a proposed alternate name)

jacktyme\_twitter

[19:47](#msg5af9e7b952194a4a67e4d5a0)Hello, is it possible to make a packet editor or sniffer in red?

greggirwin

[19:55](#msg5af9e9cc5666c42eb60e864e)@jacktyme\_twitter you'll need to wait for at least 0.7.0, when full I/O is added, unless you want to dive down and do it in Red/System, which would be like doing it in C.

jacktyme\_twitter

[20:00](#msg5af9eae65666c42eb60e8a81)ok thanks, when will that version be released?

9214

[20:01](#msg5af9eb00d332ee5fad1a4afb)@jacktyme\_twitter no ETA.

jacktyme\_twitter

[20:01](#msg5af9eb1a9ad18967b9e596b4)Alright ill keep my eye on it, thanks

## Thursday 17th May, 2018

HeyPPP

[07:54](#msg5afd354cbd10f34a680bd344)Does the project has a telegram?

[07:55](#msg5afd3560e0b50c2d05cc0454)Does the project has a telegram?

[07:55](#msg5afd3561e1cf621dba274f61)Does the project has a telegram?

ne1uno

[08:30](#msg5afd3d95d332ee5fad25e500)@HeyPPP&gt;: https://t.me/redofficial

abdllhygt

[12:34](#msg5afd76c71cfca775e1176101)@rgchris thanks! @9214 i learned `Rebol. (was a proposed alternate name)`

9214

[13:02](#msg5afd7d6fa2d9513633493264)@HeyPPP First, if you want to be heard - don't spam like that. Second - Red (programming language) doesn't have Telegram group, most of the community concentrated here, on Gitter, on \[Reddit](https://www.reddit.com/r/redlang/), or on our mailing list. RED (community token) group can be found in the link that @ne1uno sent to you.

## Friday 18th May, 2018

phrmoy

[01:24](#msg5afe2b6ad332ee5fad2966f8)Hey guys, do expect 1.0 before 2019?

9214

[01:50](#msg5afe31795a1d895fae4bd3cf)Hey @phrmoy, there's no ETA on 1.0 release. I doubt it will happen that soon even with the amount of resources that the core team recently gathered. Such things require a lot of time and effort.

phrmoy

[01:51](#msg5afe31a02df44c2d06385ff1)Gotcha, thanks for sharing.

9214

[01:51](#msg5afe31a7b84be71db916d132)You're welcome.

## Sunday 20th May, 2018

Ivo-Balbaert

[08:29](#msg5b01320752194a4a67fc4f9e)On May 18 the first printed book on Red was officially published by Packt Publishing:  
\[Packt Publishing] (https://www.packtpub.com/application-development/learn-red-%E2%80%93-fundamentals-red)  
\[Amazon](https://www.amazon.com/Learn-Red-Fundamentals-running-language/dp/1789130700)

The book is primarily meant for newcomers to the language. It was expertly reviewed by Rudolf Meijer with a foreword by Gregg Irwin.

dockimbel

[13:39](#msg5b017a79e1cf621dba33f042)@Ivo-Balbaert Great news! Will Packt tweet about it, so we can retweet them?

## Monday 21st May, 2018

BuilderGuy1

[00:26](#msg5b0212181cfca775e124daf7)@Ivo-Balbaert Bought it !! Today... a CRUD app, tomorrow... THE WORLD !!!

SteeveGit

[08:17](#msg5b0280b052194a4a67ffb5cf)Also just bought it, but made a little error in the billing adress :smile: At least I can read the pdf

toomasv

[09:15](#msg5b028e30b84be71db922cb80):+1:

Ivo-Balbaert

[17:56](#msg5b03084d5a1d895fae59a576)@SteeveGit Send me your correct address, I will make sure they send it to you

SteeveGit

[18:00](#msg5b030937e0b50c2d05ddfbb7)Thx @Ivo-Balbaert, I already changed my address on their site, but since they validated my command before that, I was just wondering if they would use the last and correct address for the shipment

greggirwin

[23:25](#msg5b035585e1cf621dba399a8d)Congrats on getting the book out Ivo!

## Tuesday 22nd May, 2018

Kesujii\_twitter

[11:59](#msg5b04062a2df44c2d0649c182)heyo guys, what was ICO price?

9214

[15:16](#msg5b04343bb84be71db928b519)@Kesujii\_twitter https://t.me/redofficial

planetsizecpu

[16:56](#msg5b044bd1bd10f34a6821f13d)\[!\[article.jpg](https://files.gitter.im/red/red/welcome/YGgH/thumb/article.jpg)](https://files.gitter.im/red/red/welcome/YGgH/article.jpg)

[16:57](#msg5b044bdc677d792bd1a88066)@Ivo-Balbaert Yesterday I wrote this article in spanish forum, there are 600+ readers by now  
I hope that help and community to grow ;)

AlexanderBaggett

[19:40](#msg5b0472425666c42eb630cdb6) https://www.amazon.com/Learn-Red-Fundamentals-running-language/dp/1789130700

9214

[19:59](#msg5b047691e1cf621dba3da2d7)@AlexanderBaggett last 10 messages in this room were about this book, if you haven't noticed.

AlexanderBaggett

[20:00](#msg5b0476d85666c42eb630dff2)I know its so cool right?

9214

[20:00](#msg5b0476f05666c42eb630e0a3)Well, it depends.

## Wednesday 23th May, 2018

guraaku

[09:26](#msg5b0533b52942532e42d59403)I hope it's good ! :)

## Thursday 24th May, 2018

Re-git

[00:31](#msg5b0607e1aaafa25932af58ba)I'm having problem with understanding this behavior in my script. I was thinking that  
`word:` and `set word`  
`:word` and `get word`  
`+` and `add`  
were equivalent.  
Can you help me understand why the functions fail in all but the first case and what should i do if i would like to use the shorthand syntax instead of `set` and `get` and `add`?

```
Red []
  
x: 1
y: 1
i: 1
m: 1

inc-with-set: func ['word value] [set word add get word value]
inc: func          ['word value] [word: add get word value]
inc-broken: func   ['word value] [word: :word + value]
inc-broken2: func  ['word value] [set word add :word value]

inc-with-set x 2
inc y 2
; inc-broken i 2
; inc-broken2 i 2

print x
; 3
print y
; 1
print i
; *** Script Error: + does not allow word! for its value1 argument
; *** Where: +
; *** Stack: inc-broken
print m
; *** Script Error: add does not allow word! for its value1 argument
; *** Where: add
; *** Stack: inc-broken2
```

9214

[00:33](#msg5b06085396af8f1186c5db38)@vejitatoja  
`word: 'value` is the same as `set 'word 'value`, same for `get`. `+` and `add` are not equivalent, even if both perform addition - first is an infix operator, second is a function.

[00:41](#msg5b060a369ed336150ea6ba86)`inc` doesn't work as expected because you set `word`, not `x`. In `inc-broken`and `inc-broken2`, `:word` evaluates to `x`, not to integer.

Re-git

[00:44](#msg5b060af3d88b24150d2e0e5a)how should i rewrite those functions to behave as i intended?

9214

[00:49](#msg5b060c052942532e42d8ce22)@vejitatoja

```
>> x: 0
== 0
>> inc: func ['word value][set word add get word value]
== func ['word value][set word add get word value]
>> inc x 1
== 1
>> x
== 1
```

```
>> inc: func ['word value][do probe compose [(to set-word! word) add get word value]]
== func ['word value][do probe compose [(to set-word! word) add get word value]]
>> inc x 1
[x: add get word value]
== 2
>> x
== 2
```

```
>> inc: func ['word value][do probe reduce [to set-word! word to get-word! word '+ 'value]]
== func ['word value][do probe reduce [to set-word! word to get-word! word '+ 'value]]
>> inc x 1
[x: :x + value]
== 3
>> x
== 3
```

```
>> inc: func ['word value][do probe compose [set word add (to get-word! word) value]]
== func ['word value][do probe compose [set word add (to get-word! word) value]]
>> inc x 1
[set word add :x value]
== 4
>> x
== 4
```

[01:07](#msg5b061047b435f21fb8c18060)Your confusion comes from the usage of literal argument, I believe. Try to rewrite all of the above with `[word value]` spec instead to grasp the semantics.

[01:09](#msg5b0610e7752aff59310d873d)Or step aside from functions entirely and tinker with something like:

```
>> x: 0
== 0
>> type? 'x
== word!
>> get 'x
== 0
>> word: 'x
== x
>> type? word
== word!
>> word
== x
>> get word
== 0
>> 
>> word: 'x
== x
>> set 'x 1
== 1
>> x
== 1
>> set word 2
== 2
>> x
== 2
>> set word 1 + get word
== 3
>> x
== 3
```

greggirwin

[21:49](#msg5b07335160209a1187e003ba)@vejitatoja, @9214 already provided some great details, so I'll just add that it's easy to see how a `set-word!` and `set` are not directly equivalent.

```
>> word: 1
== 1
>> set word 1
*** Script Error: set does not allow integer! for its word argument
*** Where: set
*** Stack:
```

As @9214 said, the best thing to do is play until you understand things a bit more.

[21:51](#msg5b0733fc9ed336150eaad7ef)As you can see `set-word!`s are not just shorthand syntax.

## Friday 25th May, 2018

rebolek

[05:09](#msg5b079aa516f6496124dbd48b)@greggirwin I don't understand you example. `word: 1` is equivalent to `set 'word 1`, not to `set word 1`.

gltewalt

[05:14](#msg5b079ba24eaffb692d53dc0a)I think that’s the point

rebolek

[05:15](#msg5b079bde016ae21a4ce155a8)ok then. I still hadn't my morning tea and coffee ;)

[05:18](#msg5b079c88361a950a6613446a)Anyway, to me they are directly equivalent. Even in @greggirwin's example, he's changing `set-word!` to `word!`.

9214

[05:25](#msg5b079e35c5750d377c0f2d76)@rebolek you can't use `set-word!` syntax if you don't know word's spelling in advance.

[05:25](#msg5b079e59160c567d16d6ec11)While you can `set` some word without even knowing how it looks like.

rebolek

[05:26](#msg5b079e99160c567d16d6eca9)

```
>> x: 'a do reduce [to set-word! x 5]
== 5
>> a
== 5
```

9214

[05:27](#msg5b079eae93dc78791c83a3ab)@rebolek that's no the point.

[05:29](#msg5b079f28016ae21a4ce15f62)`set` changes word's value in its context, `word:` either creates new entry or changes value in the context where evaluation happens.

[05:53](#msg5b07a4f0160c567d16d6fff6)not* the point

[05:54](#msg5b07a50b352b9e1a4b2f542b)You can't write `x:` by yourself if you don't know that it's actually `x`.

rebolek

[05:54](#msg5b07a51cc5750d377c0f4973)If that's point, it's not communicated in Gregg's post very clearly.

9214

[06:03](#msg5b07a74bedd06f7d15e0b9c7)@rebolek maybe he skipped his coffee?

rebolek

[06:06](#msg5b07a7e96fcbaf377df6e1ef)@9214 Ouch. I hope he's fine.

9214

[06:07](#msg5b07a8067ccd4f1a695ce8f0)He didn't post his :^) in a while... :worried:

rebolek

[06:12](#msg5b07a95cc5750d377c0f56fb)suspicious...

gltewalt

[16:28](#msg5b083997a45f930a65d53476)word gets evaluated immediately, so you get the value. Equivalent to `set 1 1`.

This works and will not throw an error, but you are setting x, not word:

&gt;&gt; word: 'x  
\== x  
&gt;&gt; set word 1  
\== 1  
&gt;&gt; word  
\== x  
&gt;&gt; x  
\== 1  
\`

I think that's all he was trying to point out.

9214

[16:28](#msg5b0839bcedd06f7d15e2ea47)You are not binding `x`, you are setting it to some value.

[16:29](#msg5b0839df6fcbaf377df93055)Binding is changing word's context, setting is changing its value in its context.

gltewalt

[16:29](#msg5b083a06edd06f7d15e2eb93)Edited

[16:46](#msg5b083de96fcbaf377df940f9)`first cola`

greggirwin

[19:10](#msg5b085fb0edd06f7d15e36ff3)You're all correct. :^) @9214 and @GregT got my intent, but my example should have been reversed, as @rebolek noted:

```
>> set word 1
*** Script Error: word has no value
*** Where: set
*** Stack:  

>> word: 1
== 1
```

[19:16](#msg5b086126016ae21a4ce45072)The important point is that, while similar, or even the same in some cases, `set-word!` and `set` syntax are not equivalent.

endo64

[21:47](#msg5b088484a7abc8692ee511c5)@gltewalt &gt; word gets evaluated immediately  
Correct, blocks are not evaluated immediately, hence:

```
word: 'x
set [word] 1
word ; == 1
x ; *** Script Error: x has no value
```

We are setting `word` to 1 not its evaluated value (`x`) to 1.

greggirwin

[22:21](#msg5b088c66edd06f7d15e41da1)Wow. This could turn into an entire topic.

ne1uno

[22:28](#msg5b088e22361a950a6616f970)can we find something other than word here? it's already overloaded enough

greggirwin

[22:29](#msg5b088e4dc712f56125328069)&lt;he he&gt; Good point @ne1uno.

Re-git

[22:53](#msg5b0893d7160c567d16da8a3d)Thank you very much for discussion and explanations. I'm was experimenting a bit more but I'm still very confused. :worried:

```
x: 0
set1: func ['word] [set word 1]
set2: func ['word] [word: 2]
set3: func [word] [word: 3]
set1 x
set2 x
set3 x
probe x
; 1
probe word
; *** Script Error: word has no value
; *** Where: probe
; *** Stack: probe
```

What am I setting in functions `set2` and `set3`?  
It looks like neither `x` nor `word`

endo64

[23:24](#msg5b089b3454ce231361562003)@vejitatoja for `set2` function, to understand better, lets put some `probe`s

```
set2: func ['word] [probe x probe word: 2 probe x]
set2 x
0
2
0
```

your function gets an un-evaluated word (`x` and its value is 0 in global context)  
then your function sets a value (2) to a locally bound word (`word`) (bound to function itself ). So you cannot see its value in outer (global) context:  
`>> word == ** word has no value ( > in global context < I added this)`  
And this `'word` has nothing related to 'x actually. it is just a local word in your function.  
So you are not setting `'x`. If you want you should use your `set1`

[23:27](#msg5b089be3edd06f7d15e4447d)`set word value` is same as `word: value` if both are in the same context (for example it is global context if you are on REPL console).  
otherwise `set word value` sets the `word`s value in global context if you are not explicitly give the context, like `set in obj 'word 2` sets the `word`s value in the context of `obj`

[23:28](#msg5b089c10361a950a66171e03)And @ne1uno is right, lets use another word for `word` it is already enough confusing :) `'w` is better I think.

## Saturday 26th May, 2018

9214

[07:15](#msg5b0909a9b6eece791db4596f)@vejitatoja `word` evaluates to `x`, but `'word` and `word:` do not evaluate to `'x` and `x:`. Each word has a spelling (its `form`ed representation). `set-word!`, `get-word!` and `lit-word!` are all part of the word syntax, and are constructed by appending/prepending either `:` or `'` to the `load`ed spelling of a word:

```
>> spelling: "word"
== "word"
>> load spelling
== word
>> type? load spelling
== word!
>> append copy spelling ":"
== "word:"
>> type? load append copy spelling ":"
== set-word!
>> type? load head insert copy spelling ":"
== get-word!
>> type? load head insert copy spelling "'"
== lit-word!
```

So, when you write `word:` in `set2` and `set3`, you're applying this syntax to the word that has spelling `word`, not to the word that has spelling `x`. Since `word` appears in function's specification, it is local to function's context, hence you can't see it "from the outside". In `set1`, on the other hand, `x` comes from the outside world and is bound to some context (`system/words` in our case) so what you function does is simply changing its value in its context: since `set` is a function, it evaluates its arguments, `word` evaluates to `x`, `1` evaluates to itself, then `x` word in `system/words` context is set to an integer `1`.

Phew! :smile:

endo64

[13:09](#msg5b095c82160c567d16dc5b90)Once again its time to give this nice example I love :) `words carry their contexts`

```
>> a: 0  o: context [a: 1]  p: context [a: 2]
>> b: reduce ['a in o 'a in p 'a]
== [a a a]

>> reduce b
== [0 1 2]

>> set in o 'a 3
== 3

>> reduce b
== [0 3 2]
```

`set a-word a-value` is always sets the value of a word in global context if you did not explicitly give another context using `in` or similar. That's what happen in your set1 function and not in set2 &amp; set3.

9214

[13:12](#msg5b095d4ec5750d377c14ac7c)

```
text
>> matrix: collect [loop 4 [keep context [spoon: take [there is no spoon]]]]
== [make object! [
    spoon: 'there
] make object! [
    spoon: 'is
] make object! [
    spoon: 'no
...
>> cutlery: collect [forall matrix [keep in matrix/1 'spoon]]
== [spoon spoon spoon spoon]
>> reduce cutlery
== [there is no spoon]
```

toomasv

[13:27](#msg5b0960d2a45f930a65d84840)"No spoon" festival!!

9214

[13:28](#msg5b0960f6a45f930a65d8489a)A common rite of passage in Redboland.

toomasv

[13:48](#msg5b096590a7abc8692ee7165f)Be brave and allow web-content, then `reduce riddle`:

```
riddle: foreach spoon load take/part 
   at read https://gitter.im/red/red/welcome?at=5b0960f6a45f930a65d8489a 498 38 [
      append [] bind [spoon] context compose [spoon: (to-lit-word spoon)
]]
== [spoon spoon spoon spoon spoon spoon spoon]
```

[13:58](#msg5b0967eac712f561253479ac)Or better yet:

```
i: 0 riddle: foreach spoon load take/part at read https://gitter.im/red/red/welcome?at=5b0960f6a45f930a65d8489a 498 38 [append [] bind pick [no spoon] odd? i: i + 1 context reduce [pick [no: spoon:] odd? i to-lit-word spoon]]
== [no spoon no spoon no spoon no]
```

[14:09](#msg5b096a82edd06f7d15e63303)Had to squeeze it on one line to work by copying.

greggirwin

[14:24](#msg5b096e1ea7abc8692ee72e8a)For those newer to Red, this being the Welcome group, you can see that Red is different and very flexible. For those who know Red, can we distill things to a simple recommendation for beginners? e.g.

&gt; If you know the name of the thing you're referring to, use a `set-word!`. If you're passing names (words) around, and there's a level of indirection, that's when you use `set` and `get`.

Re-git

[15:28](#msg5b097d04361a950a661947e7)Thank you @endo64 @9214 @greggirwin your explanations were very helpful! I think i get it now. :fire:

## Sunday 27th May, 2018

Re-git

[20:14](#msg5b0b11aa016ae21a4ceb0508)As an exercise I wrote function that works simillar to pythons `for x in range(1,5):`

```
for-range: func ['var start stop step block] [
    set var start
    while [(reduce var) <= stop] [
        do block
        set var add reduce var step
    ]
]

for-range x 1 5 1 [print x]

; 1 
; 2
; 3
; 4
; 5

counter: 0
for-range x 1 11 2 [print rejoin [multiply x 5 " is the result of loop nr: " set 'counter add counter 1 ]]
unset 'counter

; 5 is the result of loop nr: 1
; 15 is the result of loop nr: 2
; 25 is the result of loop nr: 3
; 35 is the result of loop nr: 4
; 45 is the result of loop nr: 5
; 55 is the result of loop nr: 6
```

After few tests it seems to work as long as user will not pass word `var` as fist argument to the function. Is there a way to improve it?

hiiamboris

[20:37](#msg5b0b1722352b9e1a4b38fe61)@vejitatoja and what happens if user does pass `var` as 1st argument?

Re-git

[21:14](#msg5b0b1f9993dc78791c8d6b1a)@hiiamboris I'm sorry for confusion I must have made error and forgot to change all of the instances of `x` to `var` when testing it.  
Now I see that when passed `var` `stop` or `start` as the first argument it still works as intended.

hiiamboris

[21:22](#msg5b0b21834eaffb692d5db367):+1:

BeardPower

[21:34](#msg5b0b2470361a950a661d65ff)@vejitatoja Just out of curiosity: are you really comfortable with the

```
set
```

style?

hiiamboris

[21:41](#msg5b0b261993dc78791c8d7da4)@vejitatoja you can replace `set 'counter add counter 1` with `counter: counter + 1` and `reduce var` with `get var`

greggirwin

[23:42](#msg5b0b4266ba1a351a68cb6df9)@vejitatoja nice! Already creating your own control structures.

## Monday 28th May, 2018

Re-git

[14:56](#msg5b0c189cedd06f7d15ed5511)@BeardPower It's not a problem now that I understand it a little better. From what I learned I have to use `set` this way inside the function if i don't know the name of the word being passed by the user.

BeardPower

[15:10](#msg5b0c1bcac712f561253bb6ed)@vejitatoja Yes, but the word counter is known.

Re-git

[15:32](#msg5b0c2128160c567d16e3beed)@BeardPower Yes that's true. As @hiiamboris suggested I could have used `counter:` and it would have worked as well. I probably was propably afraid that functions have their own context and that to change variable in global scope I have to use `set` but that was clearly wrong assumption.

BeardPower

[15:34](#msg5b0c218e52e35117cdea22bf)@9214 Maybe the chief of context can explain that ;-)

9214

[15:56](#msg5b0c26b1ba1a351a68ce4bae)@BeardPower what was the question?

hiiamboris

[16:04](#msg5b0c2889361a950a66207f2b)@vejitatoja in your example the function body block was implicitly bound to the function context (which only contains the words `var start stop step block` - so when you change these you change them in this \*function* context). But the block `[multiply ... ]` was declared in the global context and was implicitly bound to it, so any set-words inside it apply to the global context, not the function context where it's executed with `do`. I find it important to know when and to what block's words were bound, and that it holds and carries these bindings around for you.

9214

[16:27](#msg5b0c2e0754ce2313615f870d)@hiiamboris words in function's body block were bound to the global context, and then rebound to a context of a newly created function with `func`.

hiiamboris

[17:00](#msg5b0c35aca45f930a65e0094f)@9214 true, thanks for clarifying it

gltewalt

[17:10](#msg5b0c3813a45f930a65e012e4)Last context maker wins

BeardPower

[17:17](#msg5b0c399d4eaffb692d611a89)@9214 I see you managed it.

toomasv

[19:36](#msg5b0c5a35b6eece791dbd887f)@vejitatoja I tried a differnt approach. Just for the fun of tweaking:

```
for-range: func ['x start end step prg /local blk][
	blk: copy [] 
	foreach (x) repeat i (end - start / step + 1) [
		append blk start + (i - 1 * step) 
	][
		do bind prg object reduce [to-set-word x get x]
	]
]
```

greggirwin

[19:45](#msg5b0c5c5d361a950a66214976)@vejitatoja, also play with the various function creators, to get a feel for their differences: `does has func function`

Re-git

[21:37](#msg5b0c76a14eaffb692d61f5a2)@greggirwin What is the benefit of using other function creators? For example why use `does` instead of `func` with no arguments?

greggirwin

[21:44](#msg5b0c783499fa7f4c062779a0)It can make the intent clearer. If you see `does` you know that there are no expected args or locals, which makes them good for things like menu or button action handlers.

[21:45](#msg5b0c788c352b9e1a4b3d528f)There's no technical difference. Just what the words convey to people.

gltewalt

[22:54](#msg5b0c888f16f6496124ea0f27)`has` Local words but no arguments.

`func` Local words are specified with `/local`.

`function` automatically collects local words, but words can be made global

## Tuesday 29th May, 2018

9214

[07:46](#msg5b0d0541e26c847ac89c9bae)`function` makes all `set-word!`s in its body local, `/local` is still applicable, the ones that need to be global can be specified with `/extern`.

rebolek

[07:53](#msg5b0d06f552e35117cdecc61c)You can say that only arguments to a function are local.

9214

[07:54](#msg5b0d072499fa7f4c0628fc94)Rather 'only words that appear in its spec as arguments'.

rebolek

[07:54](#msg5b0d0737edd06f7d15f04741)Right.

[07:54](#msg5b0d0753a7abc8692ef12682)But all words that appear in specs are arguments, so it's basically the same.

endo64

[09:13](#msg5b0d19c6edd06f7d15f08a3b)`? function` shows that `/extern` as an refinement!, but it actually it is not, right? It is used as `/local` inside the spec. This is also a difference from R2/R3 as it was a refinement and the words were provided by a block.

rebolek

[09:16](#msg5b0d1a564eaffb692d63cc58)@endo64 good point, I think that it's included in the specs only so `help` can use the info.

9214

[09:26](#msg5b0d1cc9c712f561253ecc3e)The interesting thing is that you can use `/extern` as a refinement and Red won't complain

```
>> function/extern [][]
== func [][]
>> function/foo [][]
*** Script Error: function has no refinement called foo
*** Where: function
*** Stack:
```

rebolek

[09:26](#msg5b0d1ce2e26c847ac89cedc2)It's in specs, so it shouldn't complain.

[09:27](#msg5b0d1d02e26c847ac89cee33)It does nothing, but it's valid refinement :)

endo64

[09:57](#msg5b0d23f0016ae21a4cf1515a)May be it should be removed there then? Because `/local` is not shown as a refinement for `func`.

greggirwin

[19:11](#msg5b0da5caba1a351a68d38646)`/local` is a special and general case. @endo64 makes a very good point about the subtle difference from Rebol. The fact that `/local` and `/extern` aren't mutually exclusive makes it trickier. `/extern` also works if it comes after `/local` in the spec, which makes it a bit special, more like an equal. `Help` needs to show it, I think, but it's another deep part of the lake that is Red.

## Thursday 31st May, 2018

bferris413

[19:17](#msg5b104a3a4eaffb692d6f8011)Hello, I've been watching Red for a few months now, and looking to get started with the language

[19:17](#msg5b104a5aa7abc8692efd171c)Quick question: where can I find information about how var:, :var, and features like that work?

[19:18](#msg5b104a7ba7abc8692efd176c)I've been looking through helpin.red and other tutorials, but can't find anything

[19:19](#msg5b104ab7b6eece791dcbb19d)Completely new to Red/Rebol, obviously

greggirwin

[19:21](#msg5b104b47edd06f7d15fc3bbc)Welcome @bferris413! We still point people to http://www.rebol.com/docs/core23/rebolcore.html as a great resource for language fundamentals, while we improve our own docs. http://www.red-by-example.org/#wordxex (and sections for get-word! and set-word! as well) have some info.

[19:22](#msg5b104b7c52e35117cdf8d3eb)@Ungaretti, I also didn't find word info in helpin.red, at a glance. But I'm still on my first cup of coffee.

[19:24](#msg5b104bd616f6496124f75ea2)http://www.rebol.com/docs/core23/rebolcore-4.html#section-5 has details on word handling.

[19:24](#msg5b104becedd06f7d15fc3e77)Feel free to ask questions here as well.

bferris413

[19:24](#msg5b104bec4eaffb692d6f862d)Thanks @greggirwin , I'm looking forward to Red a lot. Bookmarking those links now, I think that's what I'm looking for, thanks

9214

[19:55](#msg5b1053154eaffb692d6fa436)@bferris413 https://github.com/red/red/wiki/Learning-resources

bferris413

[19:57](#msg5b1053b8edd06f7d15fc5c97)bookmarked now, thank you @9214

9214

[19:58](#msg5b1053f093dc78791c9f224a)You're welcome. Don't hesitate to ask any questions either here or in \[`/help`](https://gitter.im/red/help) room.

bferris413

[20:04](#msg5b105561160c567d16f27b29)Great, I'm sure I'll have a bunch!

Re-git

[22:28](#msg5b1076f3a7abc8692efda7c8)I want to draw some text on the screen using draw dialect. How do I change the font size and the font used?

endo64

[22:32](#msg5b107803a7abc8692efdaa99)

```
f: make font! [name: 'Arial color: White size: 18]
view [base red 200x100 draw [font f text 20x20 "Testing"]]
```

[22:37](#msg5b107929e26c847ac8a911e6)Here you can find some more info using fonts in draw dialects: https://doc.red-lang.org/en/draw.html at the bottom of the document.

Re-git

[22:38](#msg5b107961361a950a662fc87a)@endo64 Thank you very much. It works!

## Friday 1st June, 2018

Ungaretti

[08:49](#msg5b1108a8361a950a66317ec2)@greggirwin @bferris413 helpin.red doesn't have specific explanations about word usage. Good suggestion for improvement.

## Sunday 3th June, 2018

cloutiy

[14:49](#msg5b14000b160c567d16fd0a17)Hi there, have been following Red for many years now. In order to simplify my life I've decided to get rid of all the others and focus on Red, which will eventually address all my needs for personal projects. I have a suggestion. In general if you have some previous programming knowledge, it's easy to ramp up. Conditional statements, looping, bindings, data type etc...although there are some minor differences, pretty much all languages have them, so the concept is familiar. What trips me up is the parse dialect. I would love to see more resources, or maybe even a dedicated space for getting to grips with and becoming proficient with how to use parse. Maybe having something like "parse challenges" website or page. A space that focuses solely on working with parse. The prospect of easily creating DSLs and parsing things from structured text/data is such a wow factor and brings a whole new level of developer expressivity to the table that I hope at some point more resources that focus on this piece will be available.

toomasv

[15:01](#msg5b1402d7ba1a351a68e7a88e)@cloutiy Good suggestions! Meanwhile -- just now there was some discussion on `parse` in :point\_up: \[June 3, 2018 10:16 AM](https://gitter.im/red/help?at=5b1395c816f6496124012605). Check up if there was something interesting for you!

endo64

[21:00](#msg5b1456f6b6eece791dd76a3b)We might open a red/parse room here on gitter, what do you think @greggirwin ?

greggirwin

[23:36](#msg5b147b60f9f2e56cf23a561c)@cloutiy, we hope to have more resources like that, but we also want to have "Red for X Programmers" content, to help people ramp up on the basics. `Parse` is, indeed, a crown jewel in Red, but people don't need it from day one.

@endo64, probably a good idea.

[23:38](#msg5b147bdfedd06f7d15087c4b)Done. red/parse room created.

## Monday 4th June, 2018

cloutiy

[02:06](#msg5b149eb0c712f56125570b87)@greggirwin Nice! Thanks!

guraaku

[09:01](#msg5b14fff352e35117cd067dc6)thanks @greggirwin ! I'll continue my parse discussion in there :)

[09:03](#msg5b15005da45f930a65fc3a8f)And I'll add my agreement to what @cloutiy said - certainly for me the prospect of having capability to more easily create DSLs was one of the biggest factors in why I wanted to give Red a try

[09:04](#msg5b1500bbb6eece791dd946c4)So, as @greggirwin says, Parse is a jewel in the Red crown - but if it's quite difficult for people to use it, then Red may lose some of the people who want to like it

[09:05](#msg5b1500db016ae21a4c0a66d0)Parsing is typically just the first thing you want to do - you then want to interpret or build an AST etc

[09:05](#msg5b1500eb22a05f5e71fc0cde)so, more doco/examples on how to do that would not go astray :)

[09:06](#msg5b150129a45f930a65fc3fc6)Having said that... in my experience the Red community has been fantastic, always ready to help out newbies with questions

[09:08](#msg5b150179b6eece791dd94a3a)so, I'm hoping that if I learn anything useful, I can become a part of that, and contribute back to it. So... hopefully, if all goes well, I'll write up my learnings in a blog post soon...

[09:12](#msg5b15028452e35117cd068b25)...even if the way I've done things isn't very good, at least people could comment on it..

greggirwin

[22:20](#msg5b15bb1b35e25f39974bd6cb)We have to remember that even though Red makes parsing much easier than other langs, language \*design\*, and parsing in general are still hard. We can really only make them easier with constraints. e.g. we can offer tools and templates for common cases, where people just want different keywords or outputs. We also don't have to use `parse` for building dialects, and we can encourage people to use other approaches, without stigmatizing them.

## Tuesday 5th June, 2018

Respectech

[01:32](#msg5b15e81693dc78791cb018cd)I have a tutorial for Rebol3 in progress that covers some aspects of 'parse, which should be pretty compatible with Red's 'parse. It allows you to experiment with parse in real-time on the tutorial webpage: http://video.respectech.com:8080/tutorial/r3/index.r3

[01:34](#msg5b15e8b0352b9e1a4b5c25dc)I'm planning on making a comparable tutorial for Red as soon as 0.7 is ready.

toomasv

[03:26](#msg5b16030182a4d36ea6ce54a2)@Respectech Great tutorial :+1:

BeardPower

[09:04](#msg5b165203a45f930a65010a29)Awesome!

greggirwin

[17:55](#msg5b16ce7516f64961240c2682)Thanks for posting that @Respectech !

Respectech

[19:01](#msg5b16ddfa16f64961240c68a8)If you have any input on the tutorial, feedback is always welcome.

## Wednesday 6th June, 2018

gour

[09:36](#msg5b17ab2616f64961240f0bd9)morning

[09:37](#msg5b17ab74160c567d1609710a)i'm aware that there is still no x86\_64 support nor GUI for linux, but wonder if someone familiar with Scheme (Guile, Racket,...) can shed some light about Red vs Scheme i nregard to ease of learning etc.?

maximvl

[09:38](#msg5b17ab9f22a05f5e7105a882)@gour Red doesn't have great docs/specs yet, so most learning I did came from code and Rebol docs

[09:38](#msg5b17abaf016ae21a4c142070)which is still ok, you just need to keep in mind that there might be difference

[09:39](#msg5b17abe1a45f930a6505ebeb)also Scheme is more "minimalistic" language with few primitive constructs, Red feels more like a Common Lisp with a lot of features builtin

[09:41](#msg5b17ac3f82a4d36ea6d46703)most notable differences which needs most attention to be learned properly (in my opinion): 1. series 2. contexts 3. parse

[09:43](#msg5b17acc4b0d8ca5f1a82dc09)ease of learning really depends on your background, some people can't get lisp at all :)

gour

[09:43](#msg5b17acccedd06f7d151396ff)@maximvl thanks. have you maybe seen 'Red book' ?

maximvl

[09:44](#msg5b17ace193dc78791cb66144)the one available on amazon?

[09:44](#msg5b17acfd352b9e1a4b6264e1)there is this one: https://www.amazon.com/Learn-Red-Fundamentals-running-language/dp/1789130700

[09:44](#msg5b17ad05b0d8ca5f1a82dcd2)but I haven't read it, you should ask @9214

gour

[09:44](#msg5b17ad1be26c847ac8bfaf71)well, i did play a bit with FP (haskell), bu never grokked monads, iow having mostly experience with imperative stuff...didn't do programming for a long time and would looking for some hobby-language...

maximvl

[09:46](#msg5b17ad7135e25f3997527a0c)then Red should fit quite well, there is no "crazy functional" stuff like monads (et least yet), most code is written easily in imperative style

[09:46](#msg5b17ad83016ae21a4c1426db)you can do complicated things quite easily

gour

[09:47](#msg5b17ad9c352b9e1a4b62690f)@maximvl yes, that book

maximvl

[09:47](#msg5b17ad9e52e35117cd10692b)eg

```
>> now/date
== 6-Jun-2018
>> now/date - 40
== 27-Apr-2018
```

[09:47](#msg5b17adb322a05f5e7105b0ab)in most languages this would require some library and stuff

9214

[09:47](#msg5b17adce82a4d36ea6d46ce3)@gour I see you being on the hook for a while, so why don't you dedicate next weekends to Rebol/Core reading and experimenting in Red console?

[09:48](#msg5b17adf982a4d36ea6d46d5e)It makes more sense to try things out by yourself than ask community to convince you.

gour

[09:49](#msg5b17ae3a16f64961240f193c)@9214 i'm tight with my free time, that's why i do not want to 'guess' wrong :-) what do you have in common with the book?

9214

[09:49](#msg5b17ae3cb0d8ca5f1a82e107)Red is more 'batteries included' than Scheme, and there's no FP bigotry whatsoever.

gour

[09:50](#msg5b17ae78160c567d16097ba9)i'm a bit worried when will Linux get 64bit support and GUI - these days i do not own any Win license nor have access to Mac

endo64

[09:51](#msg5b17ae9835e25f3997527d7f)@gour Red is a perfect fit for you :)  
@greggirwin wrote some thoughts about the book but I couldn't find it on gitter as its search capability is terrible.  
You can also check https://github.com/red/red/wiki/Learning-resources for some good learning stuff.

gour

[09:51](#msg5b17aea7352b9e1a4b626cf0)although i'm aware i can use console to do many scripting stuff

9214

[09:51](#msg5b17aeb8edd06f7d15139f22)That's a fair concern, but there's more in the package than fancy GUIs.

[09:52](#msg5b17aed84eaffb692d86c373)Mastering the fundamental principles does not require View or 64 bit support.

gour

[09:52](#msg5b17aedd16f64961240f1b8a)@endo64 i know about learning-resources, but, hopefully (good) book can save time, at least in the beginning

[09:53](#msg5b17af0552e35117cd106faf)how is editor (vim) support for Red?

9214

[09:53](#msg5b17af20e26c847ac8bfb72c)@gour https://github.com/red/red/wiki/Editor-Integrations

[09:54](#msg5b17af4fe26c847ac8bfb7ba)If you're looking for 1.0 experience, obviously Red is not (yet) for you.

gour

[09:55](#msg5b17af7e93dc78791cb669a8)@9214 heh...otoh, i suppose i'm not the only one expecting to use Red with vim :smile:

9214

[09:56](#msg5b17afc182a4d36ea6d4743a)As for the book, I'm pretty sure that at this point you won't loose anything if you'll stick only with community provided material.

[09:57](#msg5b17b00282a4d36ea6d475b3)Or you can buy it anyway and prove me wrong, I'm not in a position to dictate how you should manage your time and finances ;)

maximvl

[09:58](#msg5b17b04b22a05f5e7105ba4d)@gour or like this:

```
>> parse read https://gitlab.com [ collect [ skip thru <title> keep to </title>  ] ]
== [{ The only single product for the complete DevOps lifecycle - GitLab | GitLab }]
```

gour

[09:58](#msg5b17b04db0d8ca5f1a82e99c)@9214 well, @maximvl mentioned you in regard the book, so i thought you're familiar with it, own a copy etc.

BeardPower

[09:58](#msg5b17b05593dc78791cb66dae)Once Red will support modules, batteries can be provided more easily. What should go into the core and what needs to be discussed.

9214

[09:59](#msg5b17b08499fa7f4c064c4d6d)@gour well, yes, I read it and my suggestion to you (or to any other newcomer) still holds.

gour

[10:00](#msg5b17b0af352b9e1a4b62747d)@9214 ok, thank you for that

maximvl

[10:01](#msg5b17b0e84eaffb692d86cacf)AFAIK no x64 migration is planned before 1.0

9214

[10:01](#msg5b17b0e9016ae21a4c143714)I can't say anything else without triggering @greggirwin's stern face though. ;)

BeardPower

[10:01](#msg5b17b0f3b6eece791de30fa4)Goal for the future: Red IDE, which is also "the book" :smile:

[10:03](#msg5b17b17982a4d36ea6d47abc)x64 would be a waste of resources right now, as the Red compiler needs to be re-written in Red (self-hosted), so migrating to x64 in the current state would be double work, as it would need to be thrown away once Red is self-hosted.

[10:04](#msg5b17b1ab93dc78791cb67322)So x64 is post self-hosted.

gour

[10:15](#msg5b17b45da45f930a65060bad)ok, i accept about 64bit support, what about GUI, iow. is it planned for 1.0 or post-1?

rebolek

[10:24](#msg5b17b66022a05f5e7105d085)@gour I use Vim with Red and it works fine.

9214

[10:24](#msg5b17b661b6eece791de323db)@gour IIRC core team does not plan to dedicate resources to GTK support until 1.0 is launched.

[10:25](#msg5b17b689b0d8ca5f1a8302f3)Job vacancy for GTK programmer is still open though.

gour

[10:31](#msg5b17b80552e35117cd109263)@rebolek do you use it with rebol support (i hope there is some)?

rebolek

[10:32](#msg5b17b837352b9e1a4b628de1)@gour I believe this is what I'm using - https://github.com/ruchee/vim-red

gour

[10:35](#msg5b17b8de160c567d1609a316)thanks - it's not listed in wiki

9214

[10:36](#msg5b17b91c352b9e1a4b62911a)@gour feel free to add it to the list.

rebolek

[10:36](#msg5b17b92c016ae21a4c1452a6)too late

9214

[10:37](#msg5b17b95393dc78791cb68a3d)@rebolek very good, uncle Gonzalez, I see you're back on track. :mouse:

rebolek

[10:38](#msg5b17b99393dc78791cb68a9f):rocket:

bferris413

[19:29](#msg5b1835fd16f649612411327f)quick question

[19:29](#msg5b18360235e25f399754a057)if i do sum: 10

[19:29](#msg5b18360552e35117cd1291a7)x: 'sum

[19:29](#msg5b18360ca45f930a65082000)how do i get x -&gt; sum -&gt; 10

[19:29](#msg5b18361db0d8ca5f1a84ef0b)"dereference" x, for lack of a better term

[19:29](#msg5b18362e160c567d160b986e)or, \*\*x

[19:30](#msg5b18365122a05f5e7107cafd)not 'do' in the red sense, let me rephrase that

[19:31](#msg5b18367482a4d36ea6d68b2e)sum: 10  
x: 'sum  
; now use x to get 10

gltewalt

[19:33](#msg5b18372222a05f5e7107cd87)get x

bferris413

[19:46](#msg5b183a3152e35117cd12a121)ahh, relief, thank you

[19:47](#msg5b183a41db98e07a9a778482)is there a symbol for that?

[19:47](#msg5b183a6293dc78791cb89002)any idea why i cant do ::x?

[19:48](#msg5b183a7716f649612411433f):x is sum and :sum is 10

endo64

[19:52](#msg5b183b75db98e07a9a778934)`:x` is same `get 'x` , but there is no such use `::x`.

[19:52](#msg5b183b86fcefb41e8a920524)

```
>> probe get probe get probe first [x]
x
sum
10
== 10
```

toomasv

[19:53](#msg5b183bd793dc78791cb89415)In short

```
>> get get 'x
== 10
```

gltewalt

[19:55](#msg5b183c2352e35117cd12a8b0)`:x` seems to be limited to one level of depth, but I don't remember

[19:55](#msg5b183c414eaffb692d88f35e)typo

toomasv

[19:59](#msg5b183d23fcefb41e8a920afa)And `get` is limited to two levels?

```
>> a: 1 b: 'a c: 'b d: 'c
== c
>> get d
== b
>> get get d
== a
>> get get get d
== 1
```

gltewalt

[20:01](#msg5b183d87db98e07a9a77908f)Can use path I think with `get`

[20:03](#msg5b183e2efcefb41e8a920ef8)Well... it doesn't work like I expected it to work, even though `get` can accept `path!`

toomasv

[20:06](#msg5b183ed6a45f930a650840e2)Just a blimp:

```
hyper-get: func [got][either word? get/any got [hyper-get get/any got][get/any got]]
>> hyper-get d
== 1
```

gltewalt

[20:07](#msg5b183efd52e35117cd12b491)Now make his `::` op ?

toomasv

[20:09](#msg5b183f714eaffb692d89002f)Hmm. . `op!` should have two args

gltewalt

[20:10](#msg5b183f98b0d8ca5f1a851516)Oh yeah :smile:

[20:13](#msg5b18406822a05f5e7107f10d)If you have a huge nest of words, will hyper-get blow up?

[20:16](#msg5b1841394eaffb692d8907f4)If `a` holds a lit value, hyper-get returns nothing

[20:17](#msg5b18415fa45f930a650849ee)

```
>> a: 'something b: 'a c: 'b d: 'c
== c
>> hyper-get d
>>
```

9214

[20:24](#msg5b1842ef35e25f399754ce4c)It holds `word!`, not `lit-word!`.

[20:25](#msg5b18433e160c567d160bc7b5)@toomasv you should check for `unset` I suppose.

hiiamboris

[20:27](#msg5b1843b14eaffb692d891130)&gt; any idea why i cant do ::x?

I guess it'll be possible to use it for ipv6 addrs in some far future?

9214

[20:28](#msg5b1843fefcefb41e8a92215c)@bferris413 basically because `::x` is not a valid syntax. `:` is not a function or an operator, it's a part of the word datatype, so you can't nest them like that.

[20:29](#msg5b184433fcefb41e8a92221b)By 'them' I mean colons.

virtualAlan

[23:23](#msg5b186cef52e35117cd134c79)I just added some new things to my site.  
Pretty trivial stuff, but the scripts might be of use to someone.  
A Red Frogger style game here:  
http://www.mycode4fun.co.uk/red-apps  
And some scripts here:  
http://www.mycode4fun.co.uk/example-scripts  
Regards....  
Alan.

## Thursday 7th June, 2018

bferris413

[01:29](#msg5b188a7052e35117cd139930)I see, thank you for the explanations

greggirwin

[01:55](#msg5b1890aeb6eece791de62782)Thanks Alan!

[01:58](#msg5b189135edd06f7d1516ae61)@hiiamboris, IPv6 is much more complicated. I don't know what the answer is, but we should be able to use `url!` values with an IPv6 scheme with helper funcs as a workaround.

bferris413

[12:46](#msg5b19291d22a05f5e710ab645)is there a way to tell which functions evaluate their arguments, and which ones dont?

9214

[12:47](#msg5b192944b6eece791de82218)@bferris413 look at function's spec.

[12:48](#msg5b1929adb0d8ca5f1a87f85c)lit-args and get-args indicate that arguments won't be evaluated. Their differences are covered \[here](https://github.com/red/red/wiki/Guru-Meditations#literal-arguments-and-get-arguments).

bferris413

[12:49](#msg5b1929c8e26c847ac8c4d722)ok interesting, thanks

9214

[12:50](#msg5b192a07160c567d160e9a2f)

```
text
>> foo: func [x][probe x] x: 1
== func [x][probe x]
>> foo x
1
== 1
>> foo: func ['x][probe x]
== func ['x][probe x]
>> foo x
x
== x
>> foo (x)
1
== 1
>> foo: func [:x][probe x]
== func [:x][probe x]
>> foo x
x
== x
>> foo (x)
(x)
== (x)
```

bferris413

[12:51](#msg5b192a37db98e07a9a7a7702)yeah i think that pretty much dives into where I'm headed

[12:51](#msg5b192a49db98e07a9a7a771d)getting used to the word itself vs its evaluated value

## Sunday 10th June, 2018

s0kil

[22:06](#msg5b1da0d4106f3c24bdede253)Hello, I have encountered Red recently, and I was wondering if it is possible to write a web server?

greggirwin

[23:05](#msg5b1daeb24b2d9417e1dbebf1)Wait for full I/O in 0.7.0, but start learning the basics of Red now, so you're ready.

9214

[23:46](#msg5b1db863dd5436275300866c)@DanielSokil hi, unfortunately no, not until full I/O support is implemented in 0.7.0. You can check out Rebol though, @dockimbel is the author of Cheyenne.

[23:47](#msg5b1db8853516592752fbdc6f)https://www.cheyenne-server.org

[23:48](#msg5b1db8cf6023754a31825777)Wait, what a... mobile Gitter is a trash. I haven't seen your comment until I've posted mine, @greggirwin :^)

## Monday 11st June, 2018

s0kil

[12:39](#msg5b1e6d946023754a31846da8)From what I understand 'View is not yet supported for Linux, correct?

[12:40](#msg5b1e6dc19ca98417e25ec223)I have tried running a simple hello world, and that returns an error: 'view has no value...'

rebolek

[12:40](#msg5b1e6dc86077c67d3ee50cd1)Not yet officially. There's GTK branch thought.

[12:40](#msg5b1e6dd2106f3c24bdf02ec4)You can check GTK View here https://www.rebolek.com/builds/

s0kil

[12:41](#msg5b1e6de1106f3c24bdf02eed)Thanks!

maximvl

[12:41](#msg5b1e6de2ddd61d08e548303c)there is a secret community based server where you can download some linux-view builds ;)

[12:41](#msg5b1e6de5144c8c6fea896441)or that

rebolek

[12:41](#msg5b1e6df7ffd8896fe91d8720)@maximvl wow, where?

maximvl

[12:41](#msg5b1e6e000b75bc7d5afe0181)@rebolek on rebolek.com

rebolek

[12:41](#msg5b1e6e064b2d9417e1de1b5a)Ah :)

maximvl

[12:41](#msg5b1e6e09d7b4f6288cc12dcf):D

rebolek

[12:42](#msg5b1e6e193516592752fe08af)That's not community server, I'm the supreme leader there ;)

maximvl

[12:42](#msg5b1e6e3ed7b4f6288cc12ed3)ok, community based supreme leader

[12:42](#msg5b1e6e4214d4bc146e7fc380):smile:

rebolek

[12:43](#msg5b1e6e63106f3c24bdf03106)that's better

[12:43](#msg5b1e6e75ddd61d08e548322d):smirk:

[12:43](#msg5b1e6e88dd54362753029e89)anyway, I'm thinking about changing the downloads to packed version

maximvl

[12:44](#msg5b1e6e99144c8c6fea896844)what is packed version?

rebolek

[12:44](#msg5b1e6e9b4b2d9417e1de1de7)at least macOS release

[12:44](#msg5b1e6e9f9ca98417e25ec5c6)compressed

maximvl

[12:44](#msg5b1e6eaa144c8c6fea8968b7)I mean, it's 1mb

[12:44](#msg5b1e6eaf3516592752fe0aff)cmon :D

rebolek

[12:44](#msg5b1e6eca9ca98417e25ec6e8)size is not problem, but macOS `.app` is directory, so probably harder to download

9214

[13:12](#msg5b1e7521106f3c24bdf04d23)@DanielSokil Wine works pretty well for the simple cases. Unfortunately it doesn't support the new console engine, so you need to build the old one manually.

[13:14](#msg5b1e75a66077c67d3ee52f4a)I mean View under Wine of course.

s0kil

[13:23](#msg5b1e77ce4b2d9417e1de4475)A GUI application that allows you to view/load/save notes in 8 lines of code.  
!\[amazing](https://media.makeameme.org/created/amazing-wvwxqd.jpg)

9214

[13:24](#msg5b1e7819dd5436275302c40c)Eight? Blasphemy! :wink:

s0kil

[13:48](#msg5b1e7db36023754a3184b1b2)@rebolek  
&gt; You can check GTK View here https://www.rebolek.com/builds/  
GTK View does not support compilation ?

9214

[13:49](#msg5b1e7df96023754a3184b23d)How come?

s0kil

[13:51](#msg5b1e7e563516592752fe4980)I have tried compiling, throws an error: `Access Error: cannot open: %-c`

9214

[13:51](#msg5b1e7e6c6023754a3184b495)@DanielSokil have you build Red from sources?

[13:51](#msg5b1e7e78d7b4f6288cc1758d)Ah, wait.

[13:52](#msg5b1e7e86659aad4a326967bc)You use @rebolek's binaries.

[13:52](#msg5b1e7e9ea09ae108e6175181)Then you need to use Rebol for compilation.

[13:56](#msg5b1e7f7b144c8c6fea89b1dc)Look in Red readme for the instructions and example.

[13:56](#msg5b1e7fa99ca98417e25f0f63)And I think you also need to specify `Needs: View` in script's header.

s0kil

[13:59](#msg5b1e804f144c8c6fea89b5bb)@9214  
What is the difference between `needs: View` and `needs: 'view`? Can be used interchangeably?

9214

[14:00](#msg5b1e80653516592752fe5290)No difference.

rebolek

[14:54](#msg5b1e8d394b2d9417e1deaa8c)@9214 my builds are console builds, not Rebol encapped versions.

bferris413

[15:24](#msg5b1e943e106f3c24bdf0de98)Am I able to run the red console through another terminal (powershell)?

endo64

[15:26](#msg5b1e94909ca98417e25f6e92)\[!\[image.png](https://files.gitter.im/red/red/welcome/pqRu/thumb/image.png)](https://files.gitter.im/red/red/welcome/pqRu/image.png)

[15:26](#msg5b1e94936023754a31851e56)@bferris413 yes you can.

bferris413

[15:28](#msg5b1e953bddd61d08e548dd47)Great, thanks a lot

endo64

[15:29](#msg5b1e9549106f3c24bdf0e2ce)You're welcome.

bferris413

[16:20](#msg5b1ea1574b2d9417e1df06ce)$ support in red? (following through some rebol tutorials)

[16:20](#msg5b1ea15fffd8896fe91e7097)val: $100

[16:20](#msg5b1ea167659aad4a3269fce0)&gt;&gt; x: $100  
\*\** Syntax Error: invalid value at "$100"  
\*\** Where: do  
\*\** Stack: load

gltewalt

[16:27](#msg5b1ea30e9ca98417e25faf90)No money! datatype yet

[16:28](#msg5b1ea31b144c8c6fea8a4aa0)Use float for now

bferris413

[16:35](#msg5b1ea4e60b75bc7d5afeee69)Ok thanks

endo64

[23:09](#msg5b1f01204fbf4449eb0e1af8)@bferris413 An interesting use is, you can also start a shell session inside Red non-GUI console,

```
C:\Users\endo\Documents\Red\red\build\bin>red --cli
--== Red 0.6.3 ==--
Type HELP for starting information.

>> call/console "cmd"
Microsoft Windows [Version 10.0.17134.81]
(c) 2018 Microsoft Corporation. All rights reserved.

C:\Users\endo\Documents\Red\red\build\bin>cd  
C:\Users\endo\Documents\Red\red\build\bin

C:\Users\endo\Documents\Red\red\build\bin>exit
== 0 (back to Red)
>> call/console "powershell"  ;switch to powershell
Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

PS C:\Users\endo\Documents\Red\red\build\bin> pwd
Path
----
C:\Users\endo\Documents\Red\red\build\bin

PS C:\Users\endo\Documents\Red\red\build\bin> exit
== 0
>> (now we are in Red console again)
```

greggirwin

[23:20](#msg5b1f03c532618e705eb2061d)@endo, that's a great example. We have https://github.com/red/red/wiki/Reference-Call, but it's pretty old now, and may not be correct for the new GUI console behavior. `Call` is very important, and deserves a really good wiki page, until we get a real doc page for it. There are \*so* many subtleties to trip over. If someone, or more than one someone, wants to champion that, you'd be my hero, and tokens will rain. :^)

endo64

[23:44](#msg5b1f0965fd5b835b2d536479)@greggirwin Added to my todo, I'll do my best :)

ne1uno

[23:45](#msg5b1f09a7cf3b245b2cf63b99)`browser` too

[23:46](#msg5b1f09ea82b1b355c94f907d)if you just want to open another program or associated file

endo64

[23:48](#msg5b1f0a3d32618e705eb212f4)@ne1uno Yep, we can add it as a note in Call reference, thanks for noting!

[23:51](#msg5b1f0b19fd5b835b2d536984)We had `run` and `launch` in R2 and R3, may be they will added to Red later. But no priority on that, but `call` is important.  
`Run: Runs the system application associated with a file.`

virtualAlan

[23:57](#msg5b1f0c76cf3b245b2cf6426f)I use Call a lot - It can allow us to do stuff that aint possible in Red yet .... hurray for 'Call'  
Regards Alan.

## Tuesday 12nd June, 2018

endo64

[00:00](#msg5b1f0d13fd5b835b2d536e56)@virtualAlan Yes it makes Red very useful even in alpha stage, I also use `call/console` or `call/output` with `parse` instead of cryptic regexes with `grep`

## Thursday 14th June, 2018

JinWuZhao

[13:44](#msg5b22715886343c3a32045314)hello

rebolek

[13:46](#msg5b227198cf3b245b2cfe2d13)@JinWuZhao hi

JinWuZhao

[13:54](#msg5b227394c277fb705dcdd3c0)@rebolek good night

[13:54](#msg5b2273a632618e705eba41de)@JinWuZhao

9214

[13:54](#msg5b2273ada0161836cb1aefbc):wave:

rebolek

[13:55](#msg5b2273e88864a936cc87e2bb)@JinWuZhao night won't be here for another ~6 hours, but thanks.

9214

[13:56](#msg5b2273fe70d89b3a319673fc)@9214 tracks @rebolek's time zone... :suspect:

rebolek

[13:57](#msg5b22744386343c3a32045c0e)@9214 common, you know it's CEST

9214

[13:57](#msg5b227454a0161836cb1af212)Don't try to trick me here!

rebolek

[13:58](#msg5b22746a70d89b3a31967530)I must try at least

## Friday 15th June, 2018

JinWuZhao

[02:18](#msg5b2321fd202c8f71f50305f1)good morning

9214

[05:08](#msg5b2349b5e87f0c7bee8d17a1)Good morning @JinWuZhao .

## Saturday 16th June, 2018

abdllhygt

[12:40](#msg5b25053d17cfd73e85433c42)hi!

9214

[12:40](#msg5b25055982b1b355c95cf6b3)Hi @abdllhygt , how is it going?

abdllhygt

[12:41](#msg5b250582ebf21755ca36b5d2)@9214 i'm well thanks, you? come to 'help' : )

[18:19](#msg5b25549d32618e705ec01775)Hi programmers, i want to show somethings about my conlang and my translator project with red.

[18:20](#msg5b2554f7c277fb705dd3af9e)My conlang(Liwara(traslator language)) is root of the my translator project. Word rules and grammer is good about `parse`

[18:21](#msg5b25551132618e705ec0183a)!\[liware](http://i.hizliresim.com/DDRdNy.png)

[18:22](#msg5b2555714fbf4449eb1c2f20)last char of all verbs are `u`  
last char of all words are `a`  
last char of all adverbs are `i` | `o`  
last char of all grammer rules are `e`

9214

[18:23](#msg5b2555ac6b24803e845dce5b)`i` and `o` representing two contrasts - that's clever!

abdllhygt

[18:25](#msg5b255602ebf21755ca373d54)@9214 thanks : )

[18:25](#msg5b25562ffd5b835b2d61420b)parsing Liware is easy for a programmer

[18:26](#msg5b2556694fbf4449eb1c30fe)!\[liware](http://i.hizliresim.com/oVZkDq.png)

[18:27](#msg5b2556a28864a936cc8dbe0b)reds are verbs  
blues are words  
greens are adverbs  
others are grammer rules

9214

[18:31](#msg5b2557674fbf4449eb1c32e8)@abdllhygt is there any idea/concept behind words formation, aside from prefixes?

[18:32](#msg5b2557ae1c7d4214379e0244)i.e. why `kom` is about food and how `gat` denotes some animal?

abdllhygt

[18:32](#msg5b2557d7202c8f71f5073681)@9214 i mix 6 languages for Liwara

[18:34](#msg5b2558426b24803e845dd31e)"gata" is cat, "come(komu)" is eat in Portuguese

[18:35](#msg5b2558608864a936cc8dc190)"baba" is father in Turkish/Chinese

9214

[18:39](#msg5b2559526b24803e845dd7be)I see. Great project, certainly sparked my interest in conlangs. :clap:

abdllhygt

[18:43](#msg5b255a5dcf3b245b2c04193f)thanks : ) @9214 i will show more details if i finished some things in code

greggirwin

[19:46](#msg5b256923202c8f71f5075b36)I don't see any images or details for @abdllhygt's messages. Just me?

hiiamboris

[19:54](#msg5b256b101ee2d149ecc7e0a8)@greggirwin `isup.me` doesn't see that image hosting too ;)

meijeru

[20:00](#msg5b256c666b24803e845dfb7f)I get a 403 error (no permission)

abdllhygt

[20:05](#msg5b256d86cf3b245b2c043d80)!\[alt](https://image.ibb.co/duWhfJ/words.png)

[20:06](#msg5b256db21ee2d149ecc7e42b)@greggirwin @hiiamboris @meijeru now?

[20:06](#msg5b256dcc32618e705ec045d7)!\[alt](https://image.ibb.co/bF367y/syntax.png)

greggirwin

[20:15](#msg5b256fdd1c7d4214379e2cb0)Thanks @abdllhygt! I see the new ones.

[20:15](#msg5b256fee82b1b355c95db9a4)Are you familiar with Lojban?

abdllhygt

[20:15](#msg5b256ff7c277fb705dd3de66)@greggirwin you're welcome

[20:16](#msg5b25701237a2df7bed4271a0)@greggirwin i don't know it

greggirwin

[20:16](#msg5b2570286b24803e845e0010)Worth a search, if you're into conlangs. Very nice work.

abdllhygt

[20:17](#msg5b25707637a2df7bed4271e2)@greggirwin thanks i will research, what do you think about translator idea?

[20:23](#msg5b2571db8864a936cc8defa7)

```
>> _a "gata" "n" _i["canti" "iyi" "biyi"]
== "a big, good and beautiful cat"
```

i work about Liwara markup language  
now, i want to improve this

## Sunday 17th June, 2018

guraaku

[03:09](#msg5b25d0e0f3e3007371b86a8b)Yes, made me think of Lojban

[03:09](#msg5b25d0f04a5db82dd58f0805)I think there is a parser for it ?

[03:10](#msg5b25d11649960533e8a17d51)Might be worth having a look at Lojban and seeing whether your ideas are similar

abdllhygt

[10:09](#msg5b2633694dbdad0d85b213f6)@guraaku i work on `parser`. I was looking Lojban, yesterday. I guess, Lojban based logic. Liwara is a "intermediate language" for true translating. And Liwara follow `parse`.

## Tuesday 19th June, 2018

codenoid

[08:02](#msg5b28b8945862c35f47b0867a)what is this

9214

[08:03](#msg5b28b8e0467bd7268c1c0ac8)@codenoid ?

codenoid

[08:14](#msg5b28bb775862c35f47b08cf0)hi @9214 long time no see

[08:15](#msg5b28bb8e31882e7c8b014008)i still wondering, why your username is @9214

Oldes

[08:31](#msg5b28bf52467bd7268c1c1ee5)@codenoid Playmobil @9214 -&gt; \[Roman Legionnaire](https://www.klickypedia.com/wp-content/uploads/2016/08/9214\_Roman\_Box.jpg) (maybe?)

9214

[08:35](#msg5b28c044ad21887018c6d041)\[!\[ERSiPwenMBU.jpg](https://files.gitter.im/red/red/welcome/mj8q/thumb/ERSiPwenMBU.jpg)](https://files.gitter.im/red/red/welcome/mj8q/ERSiPwenMBU.jpg)

abdllhygt

[12:29](#msg5b28f744467bd7268c1cab0c)@codenoid did you ask about my texts?

[19:44](#msg5b295d37d2abe46688721ef3)

```
>> _oe[[_av "gata" "s" _i["canti"] _a "baba" "" _i["iyi"]] [_a "tomata" "n" _i["biyi"]] [_a "pana" "" _i["biyi"]]]
== {the good father's beautiful cats, a big tomato or the big bread}
```

[21:36](#msg5b297759ad21887018c8be2e)

```
>> _es _av "kasa" "" _i[] _a "gata" "" _i[] _i["kebi"]
== "the cat's house is big"
>> _udes _av "kasa" "" _i[] _a "gata" "" _i[] _i["kebi"]
== "the cat's house was big"
>> _ukes _av "kasa" "" _i[] _a "gata" "" _i[] _i["kebi"]
== "the cat's house will be big"
```

[21:56](#msg5b297c2614805602858fe5af)

```
>> _u_e "komu" _a "gata" "n" _i[] _a "pana" "" _i["iyi"]
== "a cat is eating the good bread"
```

## Wednesday 20th June, 2018

cryptowyrm

[13:13](#msg5b2a530c59799e70172d63b3)Hi there! About a week ago I started writing a guide to learn Red, you can read it here: https://crypticwyrm.neocities.org/learningred/ . Has a few screencasts too and I try to explain the differences to Rebol so that you can make use of Rebol learning resources. I'm currently updating the guide every day or two, it's far from complete but there is already a lot of content giving an overview of Red.

rebolek

[13:14](#msg5b2a5350ad21887018ca8dc8)@cryptowyrm great, every tutorial is most welcome!

cryptowyrm

[13:16](#msg5b2a539e6ceffe4eba1c60b2)I thought so :) I saw there is a Helpin Red guide now which is super useful, but I'm also writing this to get a deeper understanding of the language myself, been using Red and Rebol before that for a decade, but never got deep into the language. Now that Red is becoming ever more attractive, I want to change that, and teaching is supposedly the best way to learn :)

rebolek

[13:21](#msg5b2a54caaeb8fa0c072bf9e4)Some pedants may have objections to the variables chapter, as there are no variables in Red/Rebol, but I guess it's fine in basic guide.

cryptowyrm

[13:24](#msg5b2a55aa7da8cd7c8c58c67b)Ah yes :) The whole word!, lit-word!, get-word!, set-word! thing is what I personally always found most confusing about Rebol, its just so different compared to other languages, quite possible that I'm still confused there and have to change some things as I learn more about it, I'll add a chapter for that once I feel I know enough about the topic, I think that could be really helpful.

rebolek

[13:28](#msg5b2a566a960fcd4eb90fd90a)It's not confusing when you \*get* it, it's actually very simple concept. But I understand the source of confusion when coming from another language.

cryptowyrm

[13:31](#msg5b2a571d6ceffe4eba1c69ee)I hope so :) Writing this has already helped me a lot in writing better Red code because I noticed I didn't really understand some things before. You can get super far with Rebol and Red while learning very little. I also went through lots of the old Rebol 2 and 3 docs and found some nice tricks I was never aware of. I plan to compile those into a chapter as well, so that the guide can be useful for both beginners and people already familiar with the language.

9214

[15:36](#msg5b2a749b5862c35f47b4d60c)&gt; Some pedants may have objections to the variables chapter, as there are no variables in Red/Rebol, but I guess it's fine in basic guide.

I wouldn't say that it's fine to confuse other newcomers and force them to learn the wrong models, especially when the author himself doesn't understand what he's talking about.

[15:39](#msg5b2a7532479ca266896c25cd)OTOH, people will call you a pedant if you'll try to teach the right thing from the ground up. What a wonderful world.

rebolek

[16:35](#msg5b2a82666ceffe4eba1cf203) &gt; force them to learn the wrong models

It would be interesting to get some data how many people have now preconception of \*variables* and how many would find this abstraction useful as first step in introduction to Redbol.

9214

[16:37](#msg5b2a82dc7da8cd7c8c595271)@rebolek "You can call this a variable, with a minor caveat which we'll cover in the next sections" (or something like that) is not the same as "This is a variable. Permanent."

rebolek

[16:39](#msg5b2a8336ce3b0f268d2d5e04)@9214  
&gt; I'm currently updating the guide every day or two

is leading me to believe that

&gt; "This is a variable. Permanent."

may not be true.

9214

[16:42](#msg5b2a83de72b31d3691dd0dcd)Maybe, maybe not. If people take responsibility to educate the others, I expect them, at the very minimum, to be confident in what they say.

[16:44](#msg5b2a8468d2abe4668874df62)Besides, I don't see the point in yet another tutorial on the basics, we already have a plethora of them. Wouldn't it be better to concentrate documentation efforts in one place instead of spreading thinly over the surface?

rebolek

[16:44](#msg5b2a84821480560285923ec4)If people are going to give away their time for free to help others, I hope they will accept help themselves, nothing more.

[16:45](#msg5b2a84bcce3b0f268d2d6288)&gt; we already have a plethora of them

Do we, really? Every single one helps, IMO.

[16:50](#msg5b2a85b9ad21887018cb1ff4)Also I believe that people who are writing basic tutorials now are the same people who will write advanced tutorials tomorrow. Or who do you think is going to write them?

9214

[16:50](#msg5b2a85f1aeb8fa0c072c8bc1)So why not to learn and write advanced tutorials in the first place?

[16:52](#msg5b2a8655d2abe4668874e522)I recall myself as a newbie - all the basic tutorials weren't really helpful (in some parts even harmful), resources were all scattered and disorganized, so I came in this chat and started to ask questions.

[16:55](#msg5b2a86f17da8cd7c8c595cb8)If we talk about 'newcomers to Red', not about 'newcomers to programming'. For the latter I guess it's ok, but then I'd recommended more mainstream language instead.

rebolek

[16:57](#msg5b2a87835862c35f47b50ecf)Some people may prefer a tutorial that will help them to star immediately instead of spending time on chat and I certainly respect that.  
Web purists may disdain w3schools.com but it certainly helped me find answers quickly instead on spending time on HTML, CSS and JS forums.

9214

[16:58](#msg5b2a87d16ceffe4eba1cff80)And it will be you and me who will sit here and write text-walls of explanations to yet another 'oh why my variable is X' or 'oh what does &lt;foo has no value&gt; means', or even 'why my array grows over time if I initialize it on each call'.

rebolek

[17:00](#msg5b2a88440168e70c08d6ceec)For newcomers to Red, using \*variables* in tutorial is fine, because they are used to them. For newcomers to programing, it's more dangerous. And suggesting more mainstream language is basically elitism, Redbol is partially based on Logo, an educational language, I taught Rebol to 10 years old children, why should newcomers avoid it?

9214

[17:01](#msg5b2a88825862c35f47b511e6)And that happens because second graders teach first graders how to write things that should be written only if you're in the highschool (in some cases only if you have a PhD).

[17:03](#msg5b2a88d4d2abe4668874edc8)@rebolek

&gt; For newcomers to Red, using variables in tutorial is fine

It certainly wasn't fine for me. Re-learning everything from the ground up was rather painful and time-consuming.

[17:05](#msg5b2a89727d3bca737af5f300)&gt; why should newcomers avoid it

Because there could be no way back to the traditional mainstream programming ;)

rebolek

[17:13](#msg5b2a8b55960fcd4eb910834d)&gt; Re-learning everything from the ground up was rather painful and time-consuming.

It would be anyway...

&gt; there could be no way back to the traditional mainstream programming

If Red is you first language, you can go back only to ignorance ;)

9214

[17:18](#msg5b2a8c61960fcd4eb9108566)But you may, say, re-evaluate your choice of career path and don't go into back-end to code in Java as you initially planned.

[17:31](#msg5b2a8f557d3bca737af60292)I don't know, honestly. Maybe for someone notion of variables can serve as a trampoline, but for me it was a pitfall. So all I try to do is to help others to avoid the same fate. But if you call me an elitist and a pedant for doing so, then I'd rather spend my time elsewhere. Basic tutorials are fine when they give you a headstart, but not when they push you back from the starting line.

[17:40](#msg5b2a9178ad21887018cb3e42)Though, it all depends on how far you want to run. For someone who uses Red on a whim as yet another scripting language to film VB-style horror shows - sure, variables, arrays, even OOP will do. Because who cares?

rebolek

[18:00](#msg5b2a96460168e70c08d6f651)&gt; re-evaluate your choice of career path and don't go into back-end to code in Java as you initially planned

I thought that people do not plan that and do it only when bills took over their dreams. When it's Java or prostitution.

9214

[18:05](#msg5b2a977b960fcd4eb910a0a4):nail\_care: :lipstick:

ne1uno

[18:08](#msg5b2a9815467bd7268c209bff)anyone have the right way to say what words are if not variables? that's part of the problem

9214

[18:11](#msg5b2a98c66ceffe4eba1d2835)@ne1uno word is a symbolic value that indirectly refers to other value. Variable is a symbolic name that directly refers to a value.

greggirwin

[18:11](#msg5b2a98ebad21887018cb4e62)@9214, you are not normal. You know that, right? Only a tiny percentage of people will think like you, and understand the way you do. We're all elitist to some degree, but we need to welcome all contributors, and be aware that not everyone learns the same, or has the same needs. For better or worse, if Red succeeds, we'll have 1% of people that know the inner details, 10% skilled developers, and 90% (pardon my rounding) semi- or non-programmers.

We know there are implementation details that make Red different, but words \*are* variables. It's a shortcut term that we shouldn't shy away from entirely. Noting how Red is different will sometimes be important, but a lot of people could use Red effectively without ever getting beyond the basic idea. And that's OK. People need context, too, based on where they're coming from.

9214

[18:12](#msg5b2a98f96ceffe4eba1d289b)It's the same as with real words. "Paris" is a 5 letter word, which also refers to a geographical location.

pekr

[18:13](#msg5b2a99627d3bca737af61ab5)Paris is too abstract :-)

greggirwin

[18:14](#msg5b2a997b0168e70c08d6fe82)@cryptowyrm, please add a link to your work from https://github.com/red/red/wiki/Unofficial-Tutorials-and-Resources or https://github.com/red/red/wiki/Learning-resources, and thanks for contributing!

9214

[18:14](#msg5b2a997ead21887018cb4fcd)And two words with the same spelling can mean two different things. Say, "rock". Is it a musical genre? A natural solid mineral? A closed hand in rock-paper-scissors?

[18:15](#msg5b2a99c47da8cd7c8c599397)Or \*just* a sequence of 4 letters?

greggirwin

[18:17](#msg5b2a9a260168e70c08d70062)The way around this is to standardize on a new way of talking about this, maybe using \*identifiers* as a term?

9214

[18:23](#msg5b2a9b8cd2abe46688751bfa)@cryptowyrm I like your approach with screencasts, by the way, it's kinda refreshing. And please don't take my rant personally! All contributions are welcome, despite what I or any other grumpy kid will say. Just bear in mind that educating others requires a certain degree responsibility, authority, and a strong will to learn (and re-learn) yourself. You'll get there, though. :wink:

[18:24](#msg5b2a9bd01480560285927b5e)@greggirwin IIRC Peter started a 'Glossary of terms' at some point.

greggirwin

[18:27](#msg5b2a9c8cce3b0f268d2da4c8)https://github.com/red/red/wiki/Glossary is there, but needs attention.

9214

[18:28](#msg5b2a9cea0168e70c08d7066f)@cryptowyrm I've added your tutorial to the list of learning resources, \[here](https://github.com/red/red/wiki/Learning-resources#hands-on-guides-and-tutorials).

greggirwin

[18:29](#msg5b2a9cf0aeb8fa0c072ccb59)@cryptowyrm, I'll try dig into your work more later, but one suggestion I'll make is to use the term "hyphen" rather than "minus sign" when talking about identifiers.

9214

[18:29](#msg5b2a9d0f479ca266896c90ca)@greggirwin IIRC it's called a Lisp style, no?

greggirwin

[18:29](#msg5b2a9d1dce3b0f268d2da76b)Thanks @9214!

9214

[18:29](#msg5b2a9d1d7d3bca737af62500)Except for `+thing+` and `*thing*`.

greggirwin

[18:30](#msg5b2a9d47ad21887018cb5b36)Let's not scare people away with Lisp references. ;^)

[18:32](#msg5b2a9da1960fcd4eb910ae25)It's more related to human language.

&gt; hyphen: the sign -, used to join words to indicate that they have a combined meaning...

9214

[19:56](#msg5b2ab15e72b31d3691dd8385)@cryptowyrm, oh and you're a Steemit user, nice! You'll feel yourself like at home in `/blockchain` room :wink:

gltewalt

[20:43](#msg5b2abc826ceffe4eba1d89eb)https://en.wikipedia.org/wiki/Label\_(computer\_science)

9214

[20:45](#msg5b2abcd16ceffe4eba1d8a79)&gt; the purpose of a label is to act as the destination of a GOTO statement

No thx.

gltewalt

[20:46](#msg5b2abd127da8cd7c8c59fad6)In C

[20:50](#msg5b2abdffce3b0f268d2df6d4)@greggirwin already mentioned ‘Identifier’. We might also say ‘Name’.

9214

[20:50](#msg5b2abe2a6ceffe4eba1d8f93)@gltewalt we already discussed all of that and more in you-know-where.

[20:51](#msg5b2abe45aeb8fa0c072de784)Words can serve as identifiers, but they are not \*just* identifiers.

gltewalt

[20:51](#msg5b2abe5ffc606203806a1035)This is what @dockimbel had to say about the “No variables” thing:

“Strictly speaking there is no ‘variables’ in Red/Rebol, words are first-class datatypes and have the property to refer to another value in a given context (we call that "binding"). You can think of it as a simple link between the word and a given value. Therefore a: "string" just makes the word a refer to the literal string which follows it, nothing else.“

[20:52](#msg5b2abe846ceffe4eba1d9083)@9214 Sorry, just opened it up to catch up

RnBrgn

[20:59](#msg5b2ac041467bd7268c21cd92)@cryptowyrm Thanks for the Learning Red Docs. The explanation of Vectors could be reworded . Char! types are allowed, so Vectors are not numerical only..

greggirwin

[22:27](#msg5b2ad4d3467bd7268c22f350)We'll take the "Variables considered harmful" chat elsewhere, and see if we can build consensus.

## Thursday 21st June, 2018

japerkin

[07:10](#msg5b2b4f6dd2abe466887bba6a)hello everbody

greggirwin

[07:11](#msg5b2b4f9a479ca26689718083)Welcome @japerkin.

japerkin

[07:11](#msg5b2b4fa07da8cd7c8c5f84b8)Please show mercy because I am new to the Red language.

greggirwin

[07:12](#msg5b2b4fcafc606203806e63f3)We are generally merciful, but you never know. ;^)

[07:15](#msg5b2b508c148056028598d814)`view [h1 "Welcome @japerkin!" button "Show Mercy" [print "Mercy."]]`

japerkin

[07:16](#msg5b2b50c359799e701734390d)I'm trying to follow a basic red tutorial at this website: http://helpin.red/Consoleinputandoutput.html. I can get it to run, but not compile.

```
Red []
prin "Enter a name:  "
name: input
print [name " is " length? name " characters long"]
```

I'm getting an error during compilation "undefined word input", and not too sure what I'm doing wrong. Any advice would be appreciated.

greggirwin

[07:18](#msg5b2b5151ce3b0f268d3455ef)`Input` is the issue here, as it's part of the console itself, not the standard runtime.

[07:19](#msg5b2b51770168e70c08dfa724)We should have a note in the wiki somewhere on that...

rebolek

[07:21](#msg5b2b520c0168e70c08dfa909)@japerkin it's basic tutorial, so it's probably meant to be run from interpreter and not compiled.

japerkin

[07:22](#msg5b2b521aaeb8fa0c0732d907)Ohh okay thanks.

greggirwin

[07:22](#msg5b2b522a479ca26689718858)As a quick test, comment that line out and see if it compiles.

rebolek

[07:22](#msg5b2b5241148056028598dc46)@greggirwin it won't, as next line uses `name`

greggirwin

[07:23](#msg5b2b525c960fcd4eb915afb9)Ah, yes, late here. Set `name` to a fixed string then, to test.

[07:23](#msg5b2b5282d2abe466887bc2a3)There is a note about compiling not working, on the Helpin Red site's page.

japerkin

[07:24](#msg5b2b529059799e7017343e5c)I just saw it xD

greggirwin

[07:24](#msg5b2b52a0479ca26689718a5f):^) Me too.

japerkin

[07:24](#msg5b2b52b15862c35f47ba0687)Is ask function not implemented?

greggirwin

[07:24](#msg5b2b52ca72b31d3691e31c07)Again, it's part of the console itself, not the standard runtime.

[07:25](#msg5b2b52ec72b31d3691e31c4f)You can use `??` or `source` in the console to see how they're implemented.

rebolek

[07:25](#msg5b2b52f072b31d3691e31c54)@japerkin add `#include %environment/console/CLI/input.red` to beginning, it should compile then

greggirwin

[07:26](#msg5b2b5310479ca26689718ac9)I knew we had an example somewhere. It was in @rebolek's head!

rebolek

[07:26](#msg5b2b5321148056028598e034)Wait, it's not tested ;)

greggirwin

[07:27](#msg5b2b53590168e70c08dfacba)I'll leave it to you, as I'm falling asleep.

dander

[07:27](#msg5b2b536ad2abe466887bc4c5)that would also need to run from the root of the red sources too, right?

rebolek

[07:27](#msg5b2b536a479ca26689718b1b)No problem, I'm compiling it now.

japerkin

[07:27](#msg5b2b536fd2abe466887bc4d0)\*\** Compilation Error: undefined symbol: red/unicode/decode-utf8-char  
\*\** in file: %/c/Users/jacob/Desktop/redprograms/red/environment/console/CLI/win32.reds  
\*\** in function: exec/terminal/stdin-read  
\*\** at line: 190  
\*\** near: [unicode/decode-utf8-char as c-string! utf-char :len  
c  
]

Added the input.red import  
Am I still doing something wrong?

rebolek

[07:28](#msg5b2b539d72b31d3691e31f20)@japerkin maybe some other file needs to be added also, wait a minute, I'll prepare working example for you...

japerkin

[07:28](#msg5b2b53a9d2abe466887bc4f9)Thank you. I appreciate it.

greggirwin

[07:28](#msg5b2b53b2ad21887018d0b34b)It's not you @japerkin, that example just wasn't meant to be compiled. Bolek will get you set up, and then surely find the note in the wiki.

rebolek

[07:33](#msg5b2b54c8467bd7268c261e57)@japerkin I have this code:

```
Red []
#include %environment/console/CLI/input.red
prin "Enter a name:  "
name: input
print [name " is " length? name " characters long"]
```

And it compiles fine on Linux.

[07:33](#msg5b2b54e4148056028598e724)How do you compile?

japerkin

[07:33](#msg5b2b54e7467bd7268c261f40)Shouldn't it be supported on windows as well?

rebolek

[07:34](#msg5b2b550a6ceffe4eba2445c9)@japerkin yes, it should, but I can't test on Windows.

[07:34](#msg5b2b551d467bd7268c261fbc)Try using `-r` switch, I can't compile it without it

japerkin

[07:37](#msg5b2b55adce3b0f268d346455)I added -r switch and it compiled, but during runtime the "prin" function never gets run, which I'm guessing is the case because it is another console only function?

iceflow19

[07:37](#msg5b2b55ae960fcd4eb915b816)@rebolek is that switch necessary because it has to be compiled into libred?

[07:39](#msg5b2b5641ad21887018d0ba3d)er sorry Im thinking of -u

[07:43](#msg5b2b573cce3b0f268d3467d8)@japerkin does it work with -u?

rebolek

[07:44](#msg5b2b577b479ca26689719570)@ne1uno without `-r` it will print cryptic error:

```
Compiling to native code...
*** libRedRT Error: definition not found for red/image/resize
```

I will try with `-u`.

japerkin

[07:45](#msg5b2b5789ce3b0f268d346847)I tried with -u, but got an error

rebolek

[07:45](#msg5b2b579d479ca266897195ad)@japerkin `prin` also doesn't work for me, but you may try to type and after Enter, `print` line works.

[07:45](#msg5b2b57b0d2abe466887bd091)Not sure why `prin` doesn't work, I suspect it may be some bug.

hiiamboris

[08:04](#msg5b2b5c2172b31d3691e33728)probably doesn't flush the console output buffer until it meets a line feed

rebolek

[08:08](#msg5b2b5d02ce3b0f268d347550)If the `prin` is left alone, it works fine, when it's followed by `input`, it does not output text

hiiamboris

[08:12](#msg5b2b5e0b0168e70c08dfc6b9)oh, it's the input clearing the line

rebolek

[08:13](#msg5b2b5e127d3bca737afd0d7c)@hiiamboris right

hiiamboris

[08:13](#msg5b2b5e130168e70c08dfc6ca)try `prin "123" wait 1 input`

rebolek

[08:20](#msg5b2b5fe1ad21887018d0ce4d)@japerkin just use `ask` instead of `input`, it's easier and works without problem:

```
Red []
#include %environment/console/CLI/input.red
name: ask "Enter a name: "
print [name " is " length? name " characters long"]
```

ne1uno

[08:39](#msg5b2b64380168e70c08dfd6c5)there's an open issue about compile with print on windows

[08:39](#msg5b2b644eaeb8fa0c0732ff17)try -t MSDos

[08:40](#msg5b2b64950168e70c08dfd7e9)if nobody mentioned it yet, there are many open issues, this is still alpha version

[08:46](#msg5b2b65da72b31d3691e35315)the print issue won't prevent compile though, you may need to check your paths if the includes aren't working

endo64

[09:56](#msg5b2b7639d2abe466887c1851)&gt; ust use ask instead of input, it's easier and works without problem

@rebolek This is interesting because `input` is simply calling `ask ""`, is it not when compiled?

rebolek

[10:27](#msg5b2b7da8960fcd4eb9161c4f)@endo64 yes, it's strange. Maybe it's worth a ticket.

endo64

[11:15](#msg5b2b88cfce3b0f268d34e792)@rebolek Added to an already exist issue \[#1840](https://github.com/red/red/issues/1840#issuecomment-399067176)

9214

[12:08](#msg5b2b9544ce3b0f268d350b9e)@japerkin just to make ourselves clear - you \*\*don't\** need compilation. Red can be both compiled \*\*and\** interpreted. These tutorials assume that you work with interpreter or REPL.

[12:09](#msg5b2b9589ce3b0f268d350c2c)The next question is what version of Red toolchain do you use. Stable? Latest?

[12:18](#msg5b2b979a1480560285999655)To compile the script that uses `input`, you need  
\* Red sources  
\* `#include %environment/console/CLI/input.red`  
\* compile with `-r` flag

To make `print` work after compilation on Windows you need the latest build, because of https://github.com/red/red/issues/3221

[12:26](#msg5b2b9977aeb8fa0c07339e2a)Nevertheless, the issue with `print` still persists.

[12:27](#msg5b2b99b3ad21887018d168ee)So, if you \*\*absolutely, positively\** need compilation to follow tutorials - use `-t DOS` flag during compilation in such cases.

abdllhygt

[18:22](#msg5b2bed01fc606203807038e8)@9214 @rebolek https://github.com/abdllhygt/red-zenity library is ready

[18:23](#msg5b2bed37d2abe466887d892e)Hi it's crossplatform GUI dialogbox programming Red library

BeardPower

[18:25](#msg5b2bed8b0168e70c08e174ae):+1:

greggirwin

[18:53](#msg5b2bf419467bd7268c27edc3)@abdllhygt, nice!

@gltewalt, would you please make sure we have a wiki entry on compiling for use with console funcs? Thanks.

abdllhygt

[18:56](#msg5b2bf4cb7da8cd7c8c614bd2)@greggirwin thanks

gltewalt

[18:59](#msg5b2bf58bb9c2fb2557ff02ad)@greggirwin This, or something more comprehensive? https://github.com/red/red/wiki/Guru-Meditations#how-to-compile-ask

greggirwin

[19:32](#msg5b2bfd42ce3b0f268d364442)\*That's* what I was looking for!

gltewalt

[19:32](#msg5b2bfd4f72b31d3691e5084b)https://github.com/red/red/wiki/Compiling-with-console-functions

greggirwin

[19:32](#msg5b2bfd5f72b31d3691e50879):+1:

cryptowyrm

[19:33](#msg5b2bfd6ead21887018d2a13b)My Gitter notification came a day late, so I appologize in advance for the wall of text that will follow now while I answer mentions :)

[19:33](#msg5b2bfd78467bd7268c280825)@greggirwin I changed minus to hyphen :) Not my native language (I'm German), but yes hyphen does sound better with your explanation of the word. And you can't scare me away with Lisp references, ClojureScript is the language I've been using most the past few months, all my web apps are written in it :)

[19:33](#msg5b2bfd99479ca26689737ae7)@RnBrgn Chars are usually numbers, I believe that's true in Red as well, they are just represented as characters, you can even use + on a char! vector and #"a" will turn into #"b" and so on, but I added char to the description to make it clear that you can use them in a vector, thanks for the feedback!

[19:34](#msg5b2bfdae6ceffe4eba263f64)@9124 Holy variable discussion, Batman! And no worries, I'm not offended. The official Rebol docs do use the word variable and not using it at all would just confuse people I think, but I added a Note at the top of the variables section now to explain the differences between variables in other languages and words in Red/Rebol. As for the problem of writing documentation when you're not an expert, that's a tough one. Even experts will make mistakes and lots of them, that's human. Mistakes aren't an issue as long as they are corrected IMHO, so I think it's okay, but people need to decide that for themselves which is why I specifically say in the guide that I am not an expert.

[19:34](#msg5b2bfdb959799e7017362103)@9124 As for programming beginners, the document is aimed at programmers coming from another language, not people completely new to programming (as I say in the About this document section). I wouldn't recommend Rebol/Red as a first language, it's too different to other languages. I'd recommend Python, C# if you want to develop games (Unity), and as your second language JavaScript because everyone needs to know that one. Not as the first language though, because JavaScript. Then you can move to better languages like Red, Smalltalk-80, Dart, Clojure, etc.

[19:34](#msg5b2bfdc37da8cd7c8c61657b)@9124 Yes, Steemit was great while it lasted. I wrote a Tweetdeck clone for it https://crypticwyrm.neocities.org/columns/ Steemit bought me a PS4 pro and two dozen games after a few months, now I'm happy if I get even just a dollar for a 20 page article :) Bots and vote buying are ruining the whole system. Still prefer it to Facebook and other centralized social networks though, especially since I can write any software I want for it.

[19:34](#msg5b2bfdc7d2abe466887db8b8)Done, and sorry again ;)

9214

[19:37](#msg5b2bfe6a960fcd4eb91791dd)@cryptowyrm your experience with Steemit and similar platforms will be useful once our community moves closer to 'tokenomics' realm.

cryptowyrm

[19:39](#msg5b2bff0672b31d3691e50c9b)@9214 Maybe, I haven't looked into Smart Contracts yet because they didn't interest me much, but I am a crypto (and decentralization, ZeroNet, Beaker Browser, etc) enthusiast, I owned Bitcoin when it just started (and of course I didn't keep any), crowdfunded Ethereum, so I've been in that area for many years now :)

greggirwin

[19:39](#msg5b2bff0caeb8fa0c0734d05c)&gt; I wouldn't recommend Rebol/Red as a first language, it's too different to other languages.

Ah, but if it's your first, you don't know that! The worst thing is that it will ruin you for other languages.

@cryptowyrm do you think Python and C# have a lower learning curve, or just more resources to copy from?

cryptowyrm

[19:41](#msg5b2bff5f467bd7268c280c97)That's why I wouldn't recommend it. If you want to just program as a hobby it's fine, but if you want to make it your job, start with a mainstream language. Python is a good (enough) language and useful in lots and lots of areas, that's why I'd recommend it. I used to prefer Ruby myself. C# because of Unity and it's also a good (enough) language.

9214

[19:41](#msg5b2bff63aeb8fa0c0734d0e1)&gt; The worst thing is that it will ruin you for other languages.

This. This is why I'd not recommended Redbol as a first language either. We should be merciful :wink:

[19:42](#msg5b2bff91fc6062038070697b)&gt; If you want to just program as a hobby it's fine, but if you want to make it your job, start with a mainstream language.

That's... not entirely true.

gltewalt

[19:42](#msg5b2bffa07d3bca737afed4a9)If it's your first language, you will have a 1000% percent easier time of learning it, but yeah, it will probably ruin mainstream languages for you

9214

[19:42](#msg5b2bffbe0168e70c08e1a595)I mean the part where you won't get a job if you'll stick to non-mainstream PL.

cryptowyrm

[19:43](#msg5b2bffee467bd7268c280e45)Oh yes you can get great job opportunities when you learn Clojure for example, which isn't at all mainstream. But still, when you want to make programming your life, I do think mainstream first is the better way to go.

gltewalt

[19:44](#msg5b2c000459799e70173625f9)Well, if you become a guru at it like @9214, you can make your own job. That's pretty much what DHH did with Rails. Ruby wasn't mainstream at that time.

cryptowyrm

[19:44](#msg5b2c0028aeb8fa0c0734d3cc)Yes, DHH is also why I checked out Ruby. And then Objective-C and then Smalltalk-80 :) I went back to the roots of Ruby so to speak.

greggirwin

[19:44](#msg5b2c0036aeb8fa0c0734d3eb)@cryptowyrm one of the problems we hope to solve is that \*only* programmers can make software today (broad brush), and we're...not only not great at it, we're terrible at knowing business, scientific, and other needs. Whatever your job is, you should be able to teach a computer to help you with it.

[19:45](#msg5b2c00766ceffe4eba26474b)I should clarify. When I say we're "not great" at it, it's a euphemism for "#@!%$ horrible". ;^)

cryptowyrm

[19:46](#msg5b2c007b59799e7017362699)@greggirwin That would be awesome. Chris Granger tried with Eve, but sadly failed. I do think the GUI features of Red and Rebol could make it a perfect beginner language in some ways, you just get a much bigger feeling of achievement when you see a window on the screen instead of just text. I think that's why JavaScript is so easy and fun to learn

ne1uno

[20:58](#msg5b2c1161aeb8fa0c073504cd)isn't it ironc that the clock demo was a bad demo for eve, too code centric, but a great demo for red

greggirwin

[21:03](#msg5b2c12a8ce3b0f268d367b8c)Almost anything is a great demo for Red. ;^)

cryptowyrm

[21:03](#msg5b2c12ac7d3bca737aff086d)Clock demos seem to be getting common, Elm has one too.

[21:07](#msg5b2c13857d3bca737aff0b3e)The live coding aspect of the clock demo is something I'd encourage people to spend more time on to make Red more appealing. I've really gotten in love with live coding from ClojureScript + Reagent and Dart + Flutter (Android). Seeing an app being created while you write the code is just an amazing productivity boost. The Tweetdeck code I wrote using live coding and I wrote a Tweetdeck clone before, in JQuery + CoffeeScript. The difference was astonishing.

greggirwin

[21:16](#msg5b2c159b5862c35f47bc36ed)Live coding is nothing very special in its basic form in Red: https://github.com/red/code/blob/master/Showcase/livecode.red

[21:17](#msg5b2c15fe960fcd4eb917d072)We've also played with some DnD GUI layout tools recently, if somebody wants to post links to those.

cryptowyrm

[21:17](#msg5b2c15ff479ca2668973b9e3)Saw that, I've been using that to try out examples for my Red guide :) Trapping errors does seem to be a problem though, I always manage to crash Red

greggirwin

[21:18](#msg5b2c161f72b31d3691e54870)Please note how you do that. :^)

cryptowyrm

[21:19](#msg5b2c1673ad21887018d2e028)Will do, last time it happened when I was editing a parse rule, might be able to reproduce it next time I fiddle around with it

greggirwin

[21:21](#msg5b2c16e17da8cd7c8c61ad19)Live coding `parse` is a tool we want to write. Some of the possible problems there are obvious. Also, with live coding in a simple example, it's akin to Smalltalk, and you can change the system dynamically, which is obviously powerful and dangerous.

cryptowyrm

[21:23](#msg5b2c176aaeb8fa0c0735158b)Yeah, it will be interesting to see how far Red can go with this. One of the reasons that ClojureScript is so good at live coding is that it has no mutable state, or rather, all mutable state is encapsulated in atoms. In Red, you can mutate state all over the place, so making it fool proof is going to be tough, but could potentially be much more powerful.

9214

[21:25](#msg5b2c17e07d3bca737aff1667)Oh, purity talk. Yet another one.

greggirwin

[21:26](#msg5b2c17f97d3bca737aff1690)&lt;he he&gt; @cryptowyrm seems fine @9214.

[21:27](#msg5b2c182c5862c35f47bc3d31)I don't know how live coding is enabled by immutability though. It may make some things safer, but they are orthogonal features, yes?

9214

[21:27](#msg5b2c1852ce3b0f268d36891f)@9214 stifles the fuse and retreats in his cave... for now

JacobGood1

[21:28](#msg5b2c187c7d3bca737aff1781)Gilad, which is a smalltalk pro, has commented on the fact that immutable first languages should really push live coding as a feature because it is a lot easier there.

greggirwin

[21:28](#msg5b2c1880ce3b0f268d368986)&lt;psssst&gt; &lt;Mission Impossible Theme spins and slows&gt;

[21:29](#msg5b2c18a1479ca2668973c16c)Interesting @JacobGood1. It that a new relative of NewSpeak?

cryptowyrm

[21:30](#msg5b2c18e4d2abe466887e020b)I'm very open minded. I have yet to decide who is right. Haskell with its TYPES ARE EVERYTHING, Clojure with its mutable state is evil, etc. I try to see things from all sides, generally.

greggirwin

[21:30](#msg5b2c190b0168e70c08e1e608)Nobody's completely right. It's choices.

JacobGood1

[21:31](#msg5b2c19256ceffe4eba26869e)Well, you are here after all...

cryptowyrm

[21:31](#msg5b2c192e960fcd4eb917d631)Gilad is a great guy, much respect for him for not bowing down to academics and Google with their strongly typed supremacy :)

[21:33](#msg5b2c19a6aeb8fa0c07351ab1)Was really sad to see Google go down the strongly typed route with Dart after reading Gilad's book. But it's popular now. Who cares what's good as long as it's popular.

## Friday 22nd June, 2018

abdllhygt

[18:20](#msg5b2d3df0aeb8fa0c0737c443)hi!

[18:20](#msg5b2d3e09ce3b0f268d393f21)Is there a Web Framework with Red?

JacobGood1

[18:33](#msg5b2d4105d2abe4668880bde3)@greggirwin  
"Interesting @JacobGood1. It that a new relative of NewSpeak?"  
He has just made that comment in the past, he is not working on an immutable first language. Newspeak seems to be the only language of interest for him lately, however, that interested seems to have waned as well.  
@cryptowyrm I agree about Dart, that language could have been a lot better, at least they have flutter. It appears Google is making a new os in which Dart is the premiere language. Kind of like C# is to Windows.

[18:35](#msg5b2d41827d3bca737a01cc13)Last time I played around with Dart I liked a few features of the language; optional types, mixins, and all objects are interfaces(ties in with mixins well).

cryptowyrm

[18:45](#msg5b2d43e56ceffe4eba294337)@JacobGood1 Yeah, Fuchsia OS. Flutter is really great, because of the hot swapping live coding (which shows that it can be done in languages with mutable state). And since it works a lot like Facebook's react it's also very easy to use. Compared to Java Android development especially, where you've got abstractions wrapped in abstractions covered in abstraction sauce :)

JacobGood1

[18:50](#msg5b2d4507ad21887018d5965f)Languages have had hot swap/interactive programming abilities since forever... Common Lisp, SmallTalk, etc. Heck, even Java has had it for some time with Jrebel.

cryptowyrm

[18:56](#msg5b2d4660467bd7268c2b1169)Yeah Lisp and Smalltalk are famous for that and those languages are many decades old. With Lisp there is this old story how a rocket from Nasa was saved because they changed the app live while it was running on the rocket in space. It does seem to be rarely used though, it only now gets popular from what I've seen. I never used it on a real, big project before starting to program in ClojureScript with the Reagent React wrapper.

9214

[18:57](#msg5b2d46b27da8cd7c8c6494b9)@JacobGood1 @cryptowyrm I'd appreciate if you move to \[chit-chat](https://gitter.im/red/chit-chat) room.

[18:58](#msg5b2d46ee8a0a354b38a0b91c)@abdllhygt no, no such thing.

abdllhygt

[19:02](#msg5b2d47ba467bd7268c2b143d)@9214 hmm, thanks

[19:03](#msg5b2d48056ceffe4eba294dd0)@9214 what do you think about Web programming with Red? My opinion, it's good for me like `View`.

9214

[19:07](#msg5b2d48fbce3b0f268d3958f1)@abdllhygt Red is not suitable for web programming as of now. At the very least we need either `asm.js` or WebAssembly compilation targets for Red/System.

JacobGood1

[20:23](#msg5b2d5ac47da8cd7c8c64c52d)it is too easy to start chit chatting in any channel, it would be nice if all of our off-topic conversations could be moved somehow

## Saturday 23th June, 2018

greggirwin

[01:56](#msg5b2da8eb59799e701739d4a9)@JacobGood1 tell the Gitter folks, though dropping my name won't help. ;^)

JacobGood1

[03:44](#msg5b2dc216b9c2fb2557030e47)@greggirwin dropping your name, from my message to them, won't help?

abdllhygt

[09:45](#msg5b2e16a8ce3b0f268d3c8882)@9214 I mean like `Ruby on Rails`

xmonader

[18:31](#msg5b2e9210aeb8fa0c073c444f)Hi :)

endo64

[18:58](#msg5b2e984e479ca2668979b309)Hi @xmonader

greggirwin

[20:55](#msg5b2eb3a67da8cd7c8c681174)Welcome @xmonader.

## Sunday 24th June, 2018

xmonader

[14:04](#msg5b2fa4d16ceffe4eba2ed12a)How are you guys? Thanks

[14:04](#msg5b2fa4e972b31d3691ef4a13)I used to tinker rebol and I feel red can be lots of fun specially with `parse` dsl

endo64

[14:55](#msg5b2fb0f1ad21887018da22e1)Hi @xmonader if you are new to Red / Rebol it's a good start reading Rebol's Core document. For parse you can take a look http://www.red-lang.org/2013/11/041-introducing-parse.html

[15:00](#msg5b2fb2096ceffe4eba2eeaeb)You can ask parse related questions in Red/Parse room as well.

xmonader

[15:54](#msg5b2fbebd59799e70173db2a7)@endo64 I'll try hope you guys have enough patience for all of my questions on rebol ^\_^

endo64

[16:35](#msg5b2fc864b9c2fb2557076363)@xmonader No worries, Red / Rebol community is one of the warmest communities.

## Tuesday 26th June, 2018

abdllhygt

[18:27](#msg5b328598ad21887018e07801)hi!

[18:29](#msg5b328614be98b142240b124d)does Red have any DB library?

greggirwin

[18:32](#msg5b3286d77d3bca737a0c36fc)@abdllhygt not at this time.

[18:33](#msg5b3286ef7d3bca737a0c3722)Depending on your needs, storing Red data in files is often more than enough.

abdllhygt

[18:50](#msg5b328aee0168e70c08f0d2c7)@greggirwin you mean `block` in file?

[19:02](#msg5b328dce960fcd4eb9259da2)actually i think to make Mysql library for Red but "`block` in file" system is more good : )

x8x

[22:11](#msg5b32ba178456767856ed1be1)@abdllhygt There is a SQLite binding for Red and Red/System from @Oldes here https://github.com/red/code/tree/master/Library/SQLite

## Wednesday 27th June, 2018

abdllhygt

[05:48](#msg5b33251d479ca2668982ebbb)@x8x thanks for info

## Thursday 28th June, 2018

kysmor

[16:07](#msg5b3507bd5862c35f47d036ec)Hello everybody!

[16:07](#msg5b3507ced2abe46688922902)I am just looking at Red programming language

[16:07](#msg5b3507db6ceffe4eba3b28b3)and it looks really great, but....

[16:09](#msg5b35082abe98b1422410fd3c)I am a Linux user and the version downloaded does not allow me to use GUI (graphics windows, buttons, etc.). Is there something that I missed or wronged?

pekr

[16:58](#msg5b3513a3b9c2fb2557139c7a)No, your observation is correct. Linux GUI is not complete yet and most probably not a priority right now ...

ne1uno

[17:05](#msg5b351548b9c2fb255713a1a0)@rebolek just posted a link to an unofficial GTK branch build, or you can build it yourself

[17:06](#msg5b3515a2be98b14224112786)not sure how complete it is though

[17:07](#msg5b3515e0d2abe466889255c9)https://rebolek.com/builds/

codenoid

[17:59](#msg5b352213ad21887018e6a069)hi, i have oot question  
how to execute query with curl and Postgres HTTP API  
https://wiki.postgresql.org/wiki/HTTP\_API

dander

[18:56](#msg5b352f7a479ca2668987fc89)@codenoid you don't need curl, because Red can do HTTP natively. Check out https://github.com/red/red/wiki/Guru-Meditations#how-to-make-http-requests  
and also @rebolek's wrapper: https://github.com/rebolek/red-tools/blob/master/http-tools.red

Respectech

[21:30](#msg5b35538f7d3bca737a12b842)@dander I'm assuming that Red doesn't support HTTPS yet.

rebolek

[21:59](#msg5b355a26aeb8fa0c074b405d)@Respectech no, Red supports HTTPS without problem on all platforms.

## Friday 29th June, 2018

Respectech

[00:08](#msg5b35789ba288503b3de8542c)@rebolek That's great!

[00:09](#msg5b3578d5be98b1422412186b)When I rewrite all my back office software in Red (mostly written in Rebol3 now), I can throw away curl and just do it all natively. :-)

[00:10](#msg5b3578e37d3bca737a12ff77)But I will also need a Red version of mysql-protocol.

rebolek

[04:23](#msg5b35b45359799e70174b5cb5)@Respectech for mysql you have to wait for ports in 0.7.0, or dive into Red/System

luis-rj

[18:29](#msg5b367a9c59799e70174d643b)In the meantime, I am using dreamfactory API : https://www.dreamfactory.com/resources/video/how-use-dreamfactorys-mysql-rest-api

## Sunday 1st July, 2018

cloutiy

[16:32](#msg5b39023163042f2df34d2b07)Hi there, I wasn't sure which room to post this in...but someone sent this my way, and wondered if any in the Red community knew about it. Seems like a great place to put red documentation: http://overapi.com/javascript (this is the example for javascript, but imagine having Red there.). I know other folks have already done this work. Maybe it could easily be added on overapi.com as well for visibility.

endo64

[18:16](#msg5b391a897b811a6d63c69f98)@cloutiy Very nice document indeed. Red could be added there too, and it would be nice, but it might a little early to do that as we don't have complete documentation yet.

## Monday 2nd July, 2018

Ungaretti

[11:38](#msg5b3a0ec5e534eb69a5c0d396)@cloutiy Thanks, very nice indeed. I also wish Red could have something like that.  
By the way, the room would be red/docs, but I guess it fits here too.

cloutiy

[21:59](#msg5b3aa02f9b82c6701b9cf73a)@Ungaretti ah ok thanks! I did not know that room existed

## Wednesday 4th July, 2018

abdllhygt

[12:27](#msg5b3cbd4289db5e701ca0f93f)Hi!

[12:28](#msg5b3cbd6b3572e970c175240f)

```
>> a: _a "kasa" "s" _i["iyi" "canti"]
>> a/text
== "the good and beautiful houses"
>> a/type
== "s"
>> a/title
== "aa"

>> b: _a "kasa" "n" _i["iyi" "canti"]
>> b/text
== "a good and beautiful house"
>> b/type
== "n"
>> b/title
== "aa"
```

meijeru

[12:37](#msg5b3cbf823c5abf52b63b2e4d)Is the source for `_a` and `_i` available? If not, what should we think of these examples? Natural language processing is surely a big applicaion area for Red, so your work might be a good showcase.

[12:42](#msg5b3cc0d1f16644066118d771)By the way the websites `www.liisan.com` and `www.abdllh.com` are both unreachable.

abdllhygt

[12:57](#msg5b3cc42163042f2df3558f2a)@meijeru `_a` and `_i` are `func`. it's my markup language. i try to make a translator.

[12:58](#msg5b3cc47ce534eb69a5c75ce0)"www.liisan.com" is my "turkish learning" website and "www.abdllh.com" is my personal website. Liisan was closed, abdllh.com will open soon inshallah (actually it's work now but maybe you can't enter).

## Monday 9th July, 2018

abdllhygt

[13:10](#msg5b435ea833b0282df40c533a)hi! i want to show about my programmming language

[13:15](#msg5b436006bd92d80782a029b5)

```
>> hi: "merhaba"
== "merhaba"
>> :hi yaz
merhaba
>> a: 5*20+3
== 103
>> :a > 100 ise a: 3
>> :a say :hi yaz
merhaba
merhaba
merhaba
```

[13:16](#msg5b436049bd92d80782a02b18)`yaz` = `print`  
`ise` = `if`  
`say` = `repeat`

9214

[14:54](#msg5b43772289db5e701cae4edf)@abdllhygt nice, but why mix postfix and infix notations?

toomasv

[14:55](#msg5b43777463042f2df36303c8)Welcome back @9214 !

abdllhygt

[14:56](#msg5b4377a23c5abf52b6485d3b)@9214 what's postfix and infix?

[14:57](#msg5b4377d663042f2df36304bf)@9214 where were you : )

9214

[14:57](#msg5b4377d7bd92d80782a07a90)@abdllhygt say, "multiply 6 and 7" would be written:  
\* In prefix notation: `* 6 7`  
\* In infix notation: `6 * 7`  
\* And postfix: `6 7 *`

[14:58](#msg5b43782970efc60660b96531)In your examples, `hi: "merhaba"` is prefix, `5*20+3` is infix, `:a say :hi yaz` is postfix, while `:a > 100 ise a: 3` is a mix of all three notations.

[14:59](#msg5b43786681816669a43cfc0c)@toomasv thanks! Short visit anyway.

abdllhygt

[15:00](#msg5b43788dbd92d80782a07e67)@9214 ahh i see, for parsing : ) i was using without `:*` but i was taking errors. i'm not professional in `parse`, maybe i can leave `:*` in future.

[18:30](#msg5b43a9b57b811a6d63dcec91)https://github.com/abdllhygt/coz

## Tuesday 10th July, 2018

wklesd

[06:58](#msg5b445916bd92d80782a27f6a)Hello everybody!

endo64

[06:59](#msg5b44594d3d8f71623d6af64a)@wklesd Hi!

rebolek

[07:00](#msg5b44599bf166440661280476)@wklesd hello

wklesd

[07:01](#msg5b4459c8bd92d80782a2819f)I have some problem with this code: \`

[07:02](#msg5b445a007b811a6d63de532b)

```
t: to-time "09:00:00"
```

[07:02](#msg5b445a177e23133ecb4041f2)why t/second = 59.99999999999609?

rebolek

[07:05](#msg5b445ad181816669a43ef210)@wklesd on what version are you on? I have this:

```
>> t: to-time "09:00:00"
== 9:00:00
>> t/second
== 0.0
```

wklesd

[07:07](#msg5b445b2b89db5e701cb0452a)063

rebolek

[07:09](#msg5b445ba9a99e1e52b724c417)stable or latest?

wklesd

[07:12](#msg5b445c607b811a6d63de58ed)stable, windows

endo64

[07:13](#msg5b445cb6bd92d80782a28b4b)@wklesd Can you try with latest auto build. I get the same result as @rebolek

wklesd

[07:14](#msg5b445cd889db5e701cb04f39)latest is ok, but have some another keyboard bugs with it

[07:19](#msg5b445de970efc60660bb6eed)ok, thanks you all, I tought I misunderstand something...

[07:19](#msg5b445e0b3d8f71623d6b02cc)and sorry for my English!

rebolek

[07:31](#msg5b4460ca3c5abf52b64a63a1)@wklesd no problem, you're welcome

9214

[11:46](#msg5b449c8e3572e970c185319e)@wklesd FYI, you can use `load` instead of `to time!`

wklesd

[12:25](#msg5b44a5bb70efc60660bc14d3)@9214 Thank you, I didn't know about that.

9214

[12:30](#msg5b44a6e881816669a43fabd0)@wklesd if you're completely new to the language, be sure to check out our \[list of learning resources](https://github.com/red/red/wiki/Learning-resources). \[Rebol/Core user guide](http://www.rebol.com/docs/core23/rebolcore.html) and \[comunity provided material](https://github.com/red/red/wiki/Learning-resources#hands-on-guides-and-tutorials) are good entry points.

[12:31](#msg5b44a7253d8f71623d6bbef1)We also have a dedicated \[`/help`](https://gitter.im/red/help) room, in case you need an assistance with your code / problem.

wklesd

[12:37](#msg5b44a8a433b0282df40f7bb4)I will! Thanks!

9214

[12:38](#msg5b44a8b43d8f71623d6bc2a7)@wklesd you're welcome.

DVL333

[12:58](#msg5b44ad6d3c5abf52b64b1aaf)`Do`function has `/expand`refinement. How does it work? Can you show any examples of using this refinement?

9214

[13:07](#msg5b44af77f16644066128dfab)@DVL333 https://www.red-lang.org/2016/12/entering-world-of-macros.html

It's the same as `do expand [...]`

greggirwin

[17:48](#msg5b44f17f7b811a6d63dff4c9)Note that `expand` uses `expand-directives` internally, and `expand-directives` calls `expand`. \*BUT\*, it's not the same `expand`. The function that `expand-directives` calls is in the `preprocessor` context. You can see that the spec is slightly different.

abdllhygt

[20:01](#msg5b45108de534eb69a5d8b36a)Hi! I want to show some codes about my Coz programming language

[20:01](#msg5b4510a570efc60660bd4c84)Red:

```
print "merhaba"
```

Coz:

```
"merhaba" yaz
```

[20:03](#msg5b451109e534eb69a5d8b4fe)Red:

```
a: 5
a: 5 + (10 * 3)
```

Coz:

```
a: 5
a: 5+10*3
```

[20:05](#msg5b4511a5bd92d80782a47a6c)Red:

```
if a > 10 [print "it's more big than 10"]

if a = 35 [
  print "it's 35"
  a: 10
]
```

Coz:

```
a > 10 ise "10dan büyük" yaz

a = 35 ise {
  "35miş" yaz
  a: 10
}
```

greggirwin

[20:06](#msg5b4511c23572e970c1868c94)Looks like you continue to make good progress @abdllhygt. I'm glad you didn't lose all the code for it.

abdllhygt

[20:08](#msg5b451252a99e1e52b726a7fe)@greggirwin thanks! but i rewrite Coz (i guess) : )

[20:11](#msg5b4512ea60c38707836e53b6)Red:

```
a: 0
repeat i a [ print "merhaba" ]

repeat i a [
  a: a + 1
  print a
]
```

Coz:

```
a: 0
a kere "merhaba" yaz

10 kere {
  a: a+1
  a yaz
}
```

[20:13](#msg5b4513503c5abf52b64c4ce4)In Turkish language, verbs are in last of sentence. You guys see; `keys` isn't in start of line on Coz. So, parsing is more difficult.

greggirwin

[20:13](#msg5b451373bd92d80782a480d2)Natural language poses a lot of challenges.

abdllhygt

[20:16](#msg5b4514163572e970c1869561)@greggirwin in here, people don't know english well. Coz is more good about it for beginners.

[20:17](#msg5b451460bd92d80782a48424)Btw, i uploaded last version (0.0.5) to night \[coz: github](https://github.com/abdllhygt/coz/tree/master)

## Wednesday 11st July, 2018

abdllhygt

[15:20](#msg5b46202263042f2df369e966)Hi!

[15:22](#msg5b46209970efc60660c03b93)I writed a library for compiling code include `ask` without Red source  
\[Dynamic Ask](https://github.com/abdllhygt/DynamicAsk)

greggirwin

[16:45](#msg5b463425866e0c6b159d52b2)Very nice @abdllhygt. Showing how to leverage and integrate with the OS is very helpful to many people.

abdllhygt

[17:13](#msg5b463ac4641ecc065f98ac67)@greggirwin same old name `ask`

```
#include %dynamic-ask.red

answer: ask "how old are you? "

print answer
```

[17:14](#msg5b463af7641ecc065f98ad06)just you must add `#include %dynamic-ask.red` in your code

[17:16](#msg5b463b58ba5f154b3b94b2bd)`Dynamic Ask` uses;  
\- batch in Windows  
\- python in Linux, freebsd  
\- ruby in MacOs

## Friday 20th July, 2018

codenoid

[06:12](#msg5b517d574b880b3e6a387fd0)&lt;3

## Saturday 28th July, 2018

redredwine

[14:46](#msg5b5c81dbc83d1230b13097b6)Oracle is going to start charging for Java license in 2019. Bet a lot of the java world is already starting to look for alternative options. Was wondering if there's going to be accelerated development on Red to seize this opportunity to attract some of the soon to be disenchanted java world to Red. Right now unfortunately, it's not even complete to be a serious alternative.

pekr

[14:48](#msg5b5c8245defc9823f5201859)Isn't Java open sourced? Oracle might just risk the community driven fork then ....

ne1uno

[15:31](#msg5b5c8c5044812258443c4267)will this affect the android port? sounds like they already charge for commercial updates so no real change, Oracle has extended public updates for Java Development Kit (JDK) 8 until at least January 2019.

pekr

[16:21](#msg5b5c981dc83d1230b130c856)Google is working on Fuchsia OS, which is supposed to reolace Android in 5+ years, or something like that. IMO it will not happen so soon, but might happen in the end ...

JacobGood1

[17:40](#msg5b5caa8720d248394f609fce)see here: https://news.ycombinator.com/item?id=16869963 for the correct news

[17:41](#msg5b5caad03cc39566072b9c4f)the jvm is prob bigger than ever since so many languages that people are turning to as alternatives are still on the jvm

[17:42](#msg5b5cab0033154658457674ec)not too mention there are a lot of interesting technologies that are coming out of the java camp such as graal...

greggirwin

[18:26](#msg5b5cb5553e264c7138491824)@redredwine, targeting Java as a competitor isn't in our plans. We'll tackle it differently. But this raises an important point, because we need a model (not just Red) that works. What are we willing to pay for, and what does it cost us \*not* to pay for commercially supported tools and languages?

## Wednesday 1st August, 2018

accumulism

[16:16](#msg5b61dcc912f1be713770e23c)Are we talking about port targets? This is my vote... https://medium.com/javascript-scene/what-is-webassembly-the-dawn-of-a-new-era-61256ec5a8f6

greggirwin

[16:56](#msg5b61e62f17c942036b8c9d04)Wasm is already our preference over JS, but not a priority at this time.

## Thursday 2nd August, 2018

godwinburby\_twitter

[06:29](#msg5b62a4c879bfdf5c9989d3d7)Newbie here :-). How to use parse to extract certain words from input strings. Example - input: "Call client for repurchase +Sale +Followup". parse input rule should give me back Sale and Followup. Can't wrap my head around parse dialect to solve the above need. (could use split, foreach, find etc but love to learn parse :-) )

endo64

[06:32](#msg5b62a591e8698a2dcaf86e96)`parse str [collect some [ thru "+" keep to [ws | end] ] ]` something like this should work. Sorry I'm on mobile, didn't test.

[06:34](#msg5b62a5ed3bca002dcbafd648)`ws: chatset " ^-"` or change ws with `space`

godwinburby\_twitter

[06:35](#msg5b62a6248eb2d52fde34b63d)@endo64 its giving the following error : Script Error: PARSE - invalid rule or usage of rule: ws

[06:36](#msg5b62a65479bfdf5c9989d688)@endo64 space works fine :-). Thanks

endo64

[06:36](#msg5b62a66d74470f5c983b59a4)And welcome @godwinburby\_twitter :)

toomasv

[07:01](#msg5b62ac5a04436a1ae6067cd7)@godwinburby\_twitter It should be `charset " ^-"` and before `parse`:

```
>> str: "Call client for repurchase +Sale +Followup"
== "Call client for repurchase +Sale +Followup"
>> ws: charset " ^-"
== make bitset! #{0040000080}
>> parse str [collect some [ thru "+" keep to [ws | end] ] ]
== ["Sale" "Followup"]
```

godwinburby\_twitter

[15:10](#msg5b631ec93a5a2d2f99e34ae3)@toomasv thanks for pointing that out. Can you guide me to some good tutorial about parse dialect?

toomasv

[15:35](#msg5b6324cb85278d705e7573bc)@godwinburby\_twitter Here is intro to `parse` from redlang.org  
Main intro -- https://www.red-lang.org/2013/11/041-introducing-parse.html  
Improvements1 (in the end) -- https://www.red-lang.org/2016/06/061-reactive-programming.html  
Improvements2 (in the end) -- https://www.red-lang.org/2017/03/062-libred-and-macros.html

@ungaretti 's "Red Language Notebook" -- https://ungaretti.gitbooks.io/red-language-notebook/content/parse.html  
@lepinekong 's "Red for Hopless Programmers" -- https://dev.to/lepinekong/red-for-hopeless-programmers---part-ii-258

In addition:  
Rebolcore's parse (can differ from Red) -- http://www.rebol.com/docs/core23/rebolcore-15.html

[15:53](#msg5b6328ef04436a1ae6088236)Parse expressions (Rebol wikibook) -- https://en.wikibooks.org/wiki/Rebol\_Programming/Language\_Features/Parse/Parse\_expressions

[18:00](#msg5b6346abcf8ab4758a93ea4f)This is also interesting -- https://raw.githubusercontent.com/johnk-/rebol-parse-tutorial/master/red-parse-tutorial.mdp

greggirwin

[18:21](#msg5b634ba76d45752f987dd6ee)Welcome @godwinburby\_twitter!

We have a couple wiki pages related to parse, but nothing with this list of resources. If someone wants to put the above in a page, that would be great. Maybe we should add a `[parse]` tag for the page names as well.

gltewalt

[18:55](#msg5b6353a4a9426c705d1a6a69)Probably need more tags. There’s an over abundance of \[DOC]

greggirwin

[19:00](#msg5b6354cf74470f5c983e882f)Yeah, \*everything* there is a doc. ;^)

## Friday 3th August, 2018

godwinburby\_twitter

[10:17](#msg5b642b9ecf8ab4758a98cffe)Thanks a lot @toomasv 😊

toomasv

[10:17](#msg5b642bb4c917d40dc2380da4)You are welcome!

Ungaretti

[12:13](#msg5b6446d9a9426c705d1fb610)@godwinburby\_twitter @toomasv Instead of the Gitbook, I suggest you use \[http://helpin.red/Parse.html](http://helpin.red/Parse.html) . It's more updated.  
There is still a lot do do in the Parse chapters. Since I don't use parse, it's a bit like a deaf man teaching music. Any help is welcome by the way.  
An interesting side note is that I actually abandoned the Gitbook when I started the website, but somehow, mysteriously, the Gitbook is being automatically updated with the site's content! Not a full update, but really, really bizarre! I just found that out following @toomasv link.

toomasv

[12:43](#msg5b644df504436a1ae60ef528)@Ungaretti Thanks for update! May be you forgot to `copy`? :wink:

mikeparr

[19:45](#msg5b64b0c1a9426c705d2243fc)Another parse intro in: http://www.red-by-example.org/parse.html

toomasv

[20:02](#msg5b64b4f13bca002dcbbb0a8e)@mikeparr Oops! Sorry for this unforgivable omission and thank you for adding that. It has greately evolved!

[20:33](#msg5b64bc2f945df30dc14d303c)Ah, yes. Didn't know about this page, remembered \[that](http://www.red-by-example.org/#cat-p02) only. :see\_no\_evil:

## Saturday 4th August, 2018

bferris413

[01:46](#msg5b6505760cfcf02fdf09eb55)Greetings, I read ~ 1week ago that the GC branch was going to be merged in soon...has that happened yet? Any reason why I shouldn't use the GC branch?

ne1uno

[02:06](#msg5b650a1704436a1ae61349dc)bferris413 not sure about /simple-gc-free where work is going on now, but /simple-gc works quite well on most program I tried

[02:10](#msg5b650af90cfcf02fdf0a0772)there is some debugging output to the console, I didn't try any of the options available

greggirwin

[04:22](#msg5b652a083a5a2d2f99eef8f4)GC is one of the hardest things to test and debug in software. It's good for people to use and test it, and mentioning reproduceable issues here. But we don't want tickets filed against it until it is merged.

abdllhygt

[13:37](#msg5b65ac048eb2d52fde44bde2)hi!

[13:37](#msg5b65ac335d1362758b2ffd51)i improved my translator a little, i want to show some examples

[13:42](#msg5b65ad4d3a5a2d2f99f17c27)my conlang to english:

```
>>ta
you
>>ta ne kasa
your house
>>ta ne kasa kebi
your big house
>>gatas ne agua
the cats' water
>>wa ne ina zeki canti ne pana
my intelligent and beautiful dog's bread
```

i maked with `Red/parse`

[14:08](#msg5b65b37785278d705e83c34c)

```
>> wa ne ina zeki canti ne pana
== my intelligent and beautiful dog's bread

-ne[
  (-wta "wa")
  (-a "ina" "" -i["zeki" "canti" ]) 
  (-a "pana" "" -i[])
]
```

my conlang compiles to my markup language,  
and markup language compiles to english

greggirwin

[18:26](#msg5b65efc08eb2d52fde461dd6)Very nice @abdllhygt !

[18:26](#msg5b65efc7e8698a2dca0a0362)You've come a long way.

abdllhygt

[19:06](#msg5b65f93b04436a1ae6182f63)@greggirwin Thanks!

[21:20](#msg5b6618ba6d45752f988d264f)new examples:

```
>> wa ne kasa es kebi
== my house is big
>> wa ne gata ne kasa ek kebo
== my cat's house will be small
```

[21:21](#msg5b6618de04436a1ae618c569)

```
>> ila, ila ne baba we ila ne gata ed zeki
== he, his father and his cat were intelligent
```

## Sunday 5th August, 2018

toomasv

[07:55](#msg5b66ad716d45752f988ff0a3)@abdllhygt Ta ne casa es kebi we ta ne gata es zeki

gltewalt

[08:19](#msg5b66b2f5c917d40dc245474e)Your house is big and your cat is intelligent?

toomasv

[09:39](#msg5b66c5c874470f5c9850ff90):wink:

abdllhygt

[11:03](#msg5b66d97e85278d705e898530)@toomasv home is "kasa", not "casa"

[11:03](#msg5b66d99c3a5a2d2f99f76b03)@gltewalt true!

toomasv

[11:13](#msg5b66dbbcc917d40dc246172e)@abdllhygt Got that, but couldn't correct on phone :flushed:

abdllhygt

[11:36](#msg5b66e14b85278d705e89ac63)@toomasv i see

[11:37](#msg5b66e16c85278d705e89aceb)i guess, you interest with my language : )

## Monday 6th August, 2018

Senenmut

[16:23](#msg5b68760b85278d705e911c72)Short message : Hello Gregg , i am still programming. This summer i make a break in programming because of the hot summer weather. Its to hot for programming. A solution could be a new discipline in "under water programming". The only way to stay cooled for coding. ha. Look around to find a complete waterproof tablet. Get fresh air through a snorkel. However , the sport discipilne "extreme ironing " still exists.

greggirwin

[18:38](#msg5b6895af3a5a2d2f99ffb44b)@Mennohexo glad you haven't melted. I have an outline for a SciFi story, where the protagonist works in a deep-water data center. :^)

Senenmut

[19:15](#msg5b689e4f85278d705e921b2d)he he. Indeed the hottest summer since years here in germany.

[19:25](#msg5b68a0b5a9426c705d35a76b)In programming matters the last experiment was to compile a little .apk program in RFO Basic for Android. It works. RFO works for android without java. Great aim for Red in to run on Android too. I know. I'll do it then and stay tuned with RED.

[20:36](#msg5b68b14874470f5c985a4984)However , i do not program in java or C++. Dont like those languages. Doesnt mean raw C. C is good. ok , have a nice week and we get in touch next time. Regards MH

## Tuesday 7th August, 2018

abdllhygt

[20:29](#msg5b6a0123359c70045c9ee395)Hi! I uploaded my \[translator](https://github.com/abdllhygt/waja) to github

[20:30](#msg5b6a0148c917d40dc2566934)!\[alt](https://image.ibb.co/iGmEFe/gitwaja.png)

Senenmut

[22:53](#msg5b6a22d76d45752f98a224ad)Finally i have a good and NEW programmers joke. Hope that you like it. ======== "I have seen Arnold Schwarzenegger dressed in woman clothes and is learning programming in BALLERINA!" ha ha ha

## Wednesday 8th August, 2018

s0kil

[03:31](#msg5b6a6407359c70045ca0d9c8)@abdllhygt Translator looking great.

Senenmut

[07:12](#msg5b6a97f38eb2d52fde5e20e1)naam. quaiis. Anna bichair all ham du li lah. Keyfahaluk alljaum Abdullah ? Yes , a good job. Yeah , i can speak and write a little arabic language. What do you suppose of the horizont of a red programmer ? We are the real champions.

endo64

[08:29](#msg5b6aa9efc79ebc1ae7c23d8f)@Mennohexo His name is Adbullah but he is Turkish, not Arabic :) Though I don't know if he knows Arabic language.

Senenmut

[09:15](#msg5b6ab4af3bca002dcbda1193)Oh, i understand. Everyone is welcome to Red.

[09:22](#msg5b6ab64c74470f5c98659b01)Some years ago i was in dubai and decided to learn more arabic language. Most students learn french as a second foreign language beside english as a plus to their mother tongue. I want to make it different.

abdllhygt

[09:58](#msg5b6abec585278d705e9dea9f)@DanielSokil thanks!

[10:03](#msg5b6abfd66d45752f98a55325)@Mennohexo yes i'm Turkish and i can't speak Arabic. I learn Arabic when i'm in highschool. And i learned somethings from some people. So, i can understand a little:  
naam = yes  
quaiis = ?  
Anna bichair all ham du li lah = I'm good Alhamdulillah  
Keyfahaluk = How are you?  
alljaum = ?

[10:03](#msg5b6abfebe8698a2dca231ccc)hahah

[10:24](#msg5b6ac4e50cfcf02fdf27635c)@Mennohexo `What do you suppose of the horizont of a red programmer` i didn't understand

Senenmut

[16:13](#msg5b6b16c6c917d40dc25c49ce)Hi Abdullah. I meant that every programmer whose choice is RED is searching a new way to problem solving for future projects. Therefore a new language. But a compact style where programming is FUN , instead of someone who is using a method of confusing fuss. For example large libraries that does not function and where the programming job becomes a mess of time consuming irresponsebility. The horizont that things can be done easier and with more fun.

[16:38](#msg5b6b1c6cc917d40dc25c6fc5)One example. You want to make a hello world GUI Window. A simple window nothing else. Go to rosetta code page and check out every language which is listed there for the "GUI Hello World" Code. You will be surprized most languages make so much trouble only to create such a simple window. There are a lot of code lines. Then look at the horizont of the RED programmer and realize how short such a code line can be. That's all what i meant.

abdllhygt

[17:48](#msg5b6b2cf2cf8ab4758abe021c)hmm i see

[17:48](#msg5b6b2d078eb2d52fde61ac1c)`view` is really good

[17:49](#msg5b6b2d14c79ebc1ae7c56ced)but i work on `parse` generally

Senenmut

[18:49](#msg5b6b3b435d1362758b4d2420)Good to know you enjoy red programming. If ... you program a GUI for your application you can be shure that there are no slowdowns to get to the point. Faster than other programming languages. Have a nice week.

## Monday 13th August, 2018

abdllhygt

[20:20](#msg5b71e802196bc60b6bc55546)Hi!  
\[Waja](https://github.com/abdllhygt/waja) is 2240 lines code, now  
!\[waja](https://image.ibb.co/ddFbrU/lwgit.png)  
It translate `Liwaja` to `English`

[21:04](#msg5b71f26a67eb9f60fed73fdb)!\[waja gui](https://image.ibb.co/cpNNWU/wajagui.png)

toomasv

[21:18](#msg5b71f5b3637ee66082e7354e):+1:

## Tuesday 14th August, 2018

gltewalt

[03:58](#msg5b72534d49932d4fe4db5ab1)This is pretty cool. I didn’t start with Rebol so I’ve missed some of these things.

http://www.rebol.com/docs/services/index.html

planetsizecpu

[07:23](#msg5b72836b988005174ed82cb5)@abdllhygt Wow, nice work, push hard! 💪

abdllhygt

[12:14](#msg5b72c7b5196bc60b6bca2df5)thanks!

## Thursday 16th August, 2018

gvolk0

[00:12](#msg5b74c18167eb9f60fee7385f)Hello all. Trying out basic Rebol/Red things, but can't get the 'reb' script to work found under 'Quick one liners' here: https://www.cs.unm.edu/~whip/rebol-unix-shell.html

```
#!/usr/bin/env rebol -qs

REBOL [Title: "Reb"]

random/seed now

print type? system/options/args
print mold system/options/args
print do system/options/args
```

```
>  reb "1 + 2"

block
["1 + 2"]
1 + 2

> reb 1 + 2

block
["1" "+" "2"]
2
```

running `REBOL/Core 2.7.8.2.5 (2-Jan-2011)`.

What's going on?

greggirwin

[02:08](#msg5b74dcb7988005174ee5b191)Watch the shebang: `#!/usr/bin/env/rebol -qs`

gvolk0

[02:24](#msg5b74e0655ec2bc174f051c98)I don't follow... there's no slash between 'env' and 'rebol' nor should there be. Using a direct path to rebol instead of going through env gives exactly the same results.

gltewalt

[02:30](#msg5b74e1d6196bc60b6bd65c5b) Try with REBOL/View

[02:31](#msg5b74e1fd5b07ae730ac49d05)?

[02:33](#msg5b74e25ca3a93d24226ec3e5)Those docs do show it as no space, though

[02:35](#msg5b74e2d75ec2bc174f052895)According to that sites format `#!/usr/bin/env/Rebol`

ne1uno

[02:39](#msg5b74e3e4988005174ee5d548)https://en.wikipedia.org/wiki/Env

[02:40](#msg5b74e41c937eee2423234d68)any chance the file has the wrong line endings?

[02:47](#msg5b74e5cb5ec2bc174f053508) @Cpt0r should ask, what did you expect to happen?

gvolk0

[02:53](#msg5b74e70c179f842c9744a322)@ne1uno the last line of output should be '3', the sum of 1 and 2.

[02:55](#msg5b74e78ce9b96f2c9814b1f2)the example uses /usr/local/bin/rebol, without mentioning env at all. this is just a difference in where the rebol executable is installed. And again whether I use env or not doesn't change the outcome.

ne1uno

[03:21](#msg5b74edad196bc60b6bd694a1)how old is that page? someone more familiar with older rebol may know. `system/options/args` is returning a block! so it's the same answer you would get from the rebol console if you type them in directly

[03:30](#msg5b74efea67eb9f60fee82780)`do "1 + 2` is 3 but `do ["1 + 2"]` is "1 + 2"

[03:32](#msg5b74f034937eee242323864b)try `system/script/args`

[03:34](#msg5b74f0ae637ee66082f81c50)\*that's probably not going to work as expected either

gvolk0

[04:47](#msg5b7501e95b07ae730ac539e8)what woudl be the equivalent in Red?

ne1uno

[05:17](#msg5b7508fb67eb9f60fee8a597)change the header to "Red" then `print do second system/options/args` should work if you only pass quoted strings, it's going to be too fragile to use much use

gvolk0

[05:28](#msg5b750b642a4b1910f5e284e8)thank you

## Saturday 18th August, 2018

bferris413

[00:56](#msg5b776ecbe40fdf5fb153d4a4)Is there a way I can get Red GUIs to show up crisply on my screen?

[01:00](#msg5b776f98070fa234ee7a9e32)I'm on Windows 10. The examples on http://redprogramming.com/Short%20Red%20Code%20Examples.html are crisp, but that looks like XP.

gltewalt

[01:02](#msg5b777025802bc42c5f34fc3b)The examples on the website look bad, or your results look bad?

bferris413

[01:08](#msg5b777187dd0b74601e221aaf)The website examples are crisp, but whenever I compile or run a GUI its got a fuzzy look

gltewalt

[01:33](#msg5b7777850825690ea2e672b9)Haven’t heard that before. What are your graphic settings on? Best Performance, Let Windows Decide, etc

greggirwin

[02:22](#msg5b7782d2157b9d34efa1800d)https://github.com/red/red/issues/2553 Known issue @bferris413

bferris413

[21:58](#msg5b789692e2e48a20b47a35de)Got it, thanks @gltewalt and @greggirwin

## Saturday 1st September, 2018

amreus

[12:38](#msg5b8a8859c2bd5d117a0339d9)I managed to make an executable with Red/System that uses the `PlaySound` function from `winmm.dll`. Is it possible and are there docs on using the Red/System function in a Red program?

9214

[12:49](#msg5b8a8ae24be56c5918c7f9de)@amreus let's see:  
\* @rebolek has a \[tutorial](http://red.qyz.cz/red-system-from-red.html) in his blog  
\* \[another one](https://github.com/red/red/wiki/%5BDOC%5D-Red-System-tutorial-for-newcomers-English-version) is in our community wiki  
\* you can find more examples \[here](https://github.com/red/code/tree/master/Library) and \[here](https://github.com/red/community/tree/master/red-system)

amreus

[12:55](#msg5b8a8c2ff5402f32aac148bf)@9214 Thanks. I searched - I've had no luck discovering these articles.

## Monday 3th September, 2018

godwinburby\_twitter

[06:43](#msg5b8cd82a1d3a5711b6d80eae)How do I convert a string to date. to-date does not work currently with string. to-date "03/09/2018" does not work. I need to retrieve the date and add days to it.

rebolek

[06:44](#msg5b8cd85594f8164c17d57650)@godwinburby\_twitter try `load`:

```
>> load "03/09/2018"
== 3-Sep-2018
```

[06:45](#msg5b8cd882f5402f32aacd8dbc)If you are you are using reversed format for your date, you need to write custom function, but it should be easy.

[06:47](#msg5b8cd8fe1d3a5711b6d814ea)

```
>> load-date: func [data /local date][date: 1-1-1970 data: split data #"/" date/day: load data/2 date/month: load data/1 date/year: load data/3 date]
== func [data /local date][date: 1-Jan-1970 data: split data #"/" date/day: load data/2 date/month: load data/1 date/year: load data/3 date]
>> load-date "03/09/2018"
== 9-Mar-2018
```

godwinburby\_twitter

[06:54](#msg5b8cdab31d3a5711b6d81d3d)Thanks @rebolek load works fine. 🙏

rebolek

[06:57](#msg5b8cdb4360f9ee7aa4cd44a0)@godwinburby\_twitter you're welcome!

## Sunday 9th September, 2018

codenoid

[08:47](#msg5b94de2667a666314ec6a414)hi all &lt;3

BeardPower

[09:07](#msg5b94e2b8f3c26b08f64e6afc)@codenoid Hi!

## Monday 10th September, 2018

bferris413

[21:10](#msg5b96ddbca2343433d12c9316)I find an issue when running the latest Windows binary found on red-lang.org

[21:11](#msg5b96ddfa7189ae6fdda67532)If I go to Options &gt; Choose Font... &gt; size 14 or 16pt consolas, i get sizes 15 or 17, respectively

[21:11](#msg5b96de0c7189ae6fdda6761f)size 10 gives me 12pt

[21:12](#msg5b96de2045318b2dfe8d6798)20 gives me 25

ne1uno

[21:16](#msg5b96df1c51a02e2a260f23dd)bferris413: do you have high DPI setting?

bferris413

[21:16](#msg5b96df3051a02e2a260f2424)Yes, I'm on a laptop

[21:19](#msg5b96dfeb45318b2dfe8d71d4)When I go back into options &gt; choose font, I the selected font size is 15/17/etc.

ne1uno

[21:22](#msg5b96e0a21e2b442a25f1dfae)could look in config to see what size is set. seems strange, doesn't do that in win7

greggirwin

[22:23](#msg5b96eee1a2343433d12cfb40)Could be related to https://github.com/red/red/issues/2553

## Tuesday 18th September, 2018

hiiamboris

[14:27](#msg5ba10b57e6046343f37de561)Hi Adepts of Reduction! Anything happened during last 2 months? :)

9214

[15:23](#msg5ba118553b7e6c2edd36118f)@hiiamboris documentation and PR initiatives, Red formal specification draft, constant improvements in GC branch, lots of internal work behind the curtain.

hiiamboris

[17:03](#msg5ba12fed8909f71f75f1ca36)thanks, @9214 !

greggirwin

[17:19](#msg5ba133a07dca3065031cff22)@hiiamboris if you have a chance, look at the newer comments on https://github.com/red/red/pull/3476 and see if you think we can agree on things to get that merged.

hiiamboris

[17:22](#msg5ba1344eb9531f2dfa866ec3)@greggirwin saw that today yeah, I just need to add a few tests, right?

greggirwin

[17:37](#msg5ba137cbe6046343f37f1a61)I'd have to refresh my own memory, which won't happen for a while, with all that's going on here. Maybe @9214 or @PeterWAWood can help on that. IIRC, there was support building for it.

## Saturday 22nd September, 2018

wasamasa

[20:49](#msg5ba6aaf15df5194734fb28b8)Hello, I've decided to go through Red's blog to see what happened since the last time I've checked and was surprised to see garbage collection mentioned. I always assumed there has been garbage collection so far. Does this mean the garbage collection has been improved or is there more behind it?

greggirwin

[20:51](#msg5ba6ab6db9531f2dfaa71279)GC is new, and will be in the next release.

wasamasa

[20:52](#msg5ba6ab895df5194734fb2c83)So, how has it worked so far? Does the interpreter just allocate and never free?

greggirwin

[20:52](#msg5ba6abaa0cfe7f30f1d32019)Yes, it has meant some limitations, but it's also not terribly hard to work around, by reusing series and such.

[20:53](#msg5ba6abdd1ee2ca650255f180)Handling data from large files was the only thing you really couldn't do effectively, or build dynamic GUIs like @rebolek's table style.

wasamasa

[20:53](#msg5ba6abdf8909f71f751291b8)Oh wow. I remember doing some tests with `memusagestat` and found the graphs odd, but didn't think it would be that.

rebolek

[21:58](#msg5ba6bb0abe4f300626d2d069)I just want to clarify that my table style can't handle files bigger than memory, that would require something like `read/seek` that's not implemented yet. It is dynamic in the sense that it renders only visible data.

## Wednesday 26th September, 2018

amreus

[15:25](#msg5baba4f8cdc50131725822db)From my failed attempts, it is not possible to use a 64-bit .dll from Red/System, correct? I am playing with using the \[SketchUp SDK](https://developer.sketchup.com/en) from Red. I had to go back to using version from 2016 since the newer Sketchup DLLs are released as 64-bit only.

9214

[15:26](#msg5baba518cdc501317258242c)@amreus Red is currently limited to 32-bits.

[15:26](#msg5baba52a8196693171bac129)This stems from Rebol2 dependency IIRC.

amreus

[15:27](#msg5baba57acdc501317258286a)@9214 Thanks - perhaps it becomes possible after Red is "self-hosting" if that's the correct terminology?

9214

[15:29](#msg5baba5d298245f4ae088e54c)@amreus yes, perhaps even before 1.0 release - Apple presses us hard with their drop of 32-bit support.

amreus

[16:09](#msg5babaf288196693171bb0d19)Oh the SDK page requires a login - \[here](https://github.com/TommyKaneko/Sketchup-API-C-Wrapper/tree/master/third-party/slapi) are the SketchUp SDK headers if interested.

rebolek

[16:51](#msg5babb92056877c463a8a00ba)@9214 I don't think that it has anything to do with R2. I guess that because when R/S development started, 64bit systems were not that common yet.

9214

[16:52](#msg5babb9674d320a463bf980ec)Well, R2 is (was?) limited to 32-bit, so at least it was a partial influence. Not to mention that current compiler is written in Rebol.

rebolek

[16:54](#msg5babb9c3fe37781110ffae77)There actually is 64bit R2 version, but that's not the point. You can write 64bit compiler is 8bit BASIC.

[16:55](#msg5babba098196693171bb5f1a)Red development started in 2011. That's the main reason for it being 32bit I believe.

pekr

[19:27](#msg5babdd8eaedb375b9c4f4ad7)I think that simply compiler and emitters are designed that way. I am not sure R2 itself has anything to do with it. But - I am not guru here, so just my wild guess :-)

amreus

[19:52](#msg5babe36d4d320a463bfab09e)There is a bit (get it?) of info on why Red is 32-bit in the \[GURU Meditations](https://github.com/red/red/wiki/%5BDOC%5D-Guru-Meditations#why-is-red-32-bit-only)

9214

[19:57](#msg5babe4af8196693171bc8813)@amreus I don't see any.

greggirwin

[22:49](#msg5bac0cfa7bd81c5b9dbba41e)A related question is whether Red can be \*only* 64-bit and meet all needs, as 32/64 dual support will be costly over time.

## Thursday 27th September, 2018

bferris413

[22:09](#msg5bad552e8ddf5867dc8452de)beginner question: how can I get all items out of a block, in order? I'm completely new to Red and metaprogramming, but I'm trying to do something like this

[22:10](#msg5bad5553cdc5013172633502)time-slot: func \[day] \[ \[panel reduce \[text day]]

[22:10](#msg5bad555daedb375b9c58ea5b)gui: [  
'below  
time-slot "Monday"  
time-slot "Tuesday"  
time-slot "Wednesday"  
time-slot "Thursday"  
time-slot "Friday"  
'button "Calculate"  
]  
view reduce gui

[22:11](#msg5bad557d8196693171c5f40c)This boils down to my not having a good working knowledge of code vs data interchangeably

[22:11](#msg5bad55918ddf5867dc84551d)basically, I want to build up the GUI using the outside function 'time-slot'

9214

[22:11](#msg5bad5597691dc567dbb3c426)Hi @bferris413, you want to build a bunch of View panels dynamically here, right?

bferris413

[22:11](#msg5bad559d41177e0bc7b8ac24)exactly

[22:12](#msg5bad55da4d320a463b04368d)ive tried a few different combinations in the function, using symbols, etc, but couldn't get it right.

9214

[22:14](#msg5bad56628ddf5867dc845b1d)@bferris413

```
view compose [
    below
    (
        collect [
            foreach month system/locale/months [
                keep reduce ['text month]
            ]
        ]
    ) 
]
```

bferris413

[22:15](#msg5bad568798245f4ae0940348)I'm going to dig into this

[22:16](#msg5bad56ac01fb5f4ae13207e1)Thanks a lot @9214 , I'll look these keywords up

9214

[22:17](#msg5bad56f18ddf5867dc845fd1)The problem with your initial approach is that `time-slot` returns a block, but not a content of a block. That is, `[panel reduce [text day]]`, but not `panel reduce [text day]`.

[22:17](#msg5bad571356877c463a94eb18)And even with `panel reduce [text day]` there's a problem - `reduce [text day]` is not a valid VID description.

bferris413

[22:18](#msg5bad57208196693171c5fece)right, that's the wall i kept hitting. I was searching for functions to somehow remove the content, but kept hitting the next error you describe

[22:18](#msg5bad572bcdc50131726341e8)yep, thats been my trial =)

9214

[22:20](#msg5bad579d8196693171c600f7)@bferris413 play around with `compose` (that's what you've looked for). Type `? compose` to see more details.

bferris413

[22:20](#msg5bad57c753c31c1111757db4)I'll do that, thank you

9214

[22:21](#msg5bad57cfaedb375b9c58f734)You're welcome!

greggirwin

[22:37](#msg5bad5bbd8196693171c61a0a)@bferris413 as @9214 shows, `compose` is the way to do this inline. To build larger GUIs programmatically, it's common to create a base layout block and `append` content to that, then `view` it.

9214

[23:05](#msg5bad623041177e0bc7b8f389)@bferris413 here's a more detailed explanation, so you get the idea and the way of thinking:

```
view ...
```

We know that `view` accepts a VID block, with description of graphical interface. Note that VID block is still a block, and this means that we can do whatever we want with it before `view` takes its turn. So, we know that we want to inline some dynamically generated data in that block, which is what `compose` usually does:

```
view compose [...]
```

Okay, good. `compose` will evaluate any parentheses inside a block - this is where our data will reside. We know in advance that our data should be displayed as a column, so I'll just add a `below` VID keyword on top, to force vertical layout:

```
view compose [below (...)]
```

Great, now, how do we generate our labels? The first ingridient is a list of months, which Red already has:

```
>> system/locale/months
== ["January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December"]
```

Next step is to take each of these strings and wrap it into `text`. A naive solution will most likely contain a `foreach` or `forall` loop with `append` and pre-allocated block, but we can do this a bit more elegantly with `collect`:

```
>> collect [repeat i 5 [keep i]]
== [1 2 3 4 5]
```

`collect` works really simple - it takes a block of code and evaluates it, but `keep`s (pun intended) any intermediate results which are marked with `keep` word.

```
>> collect [foreach month system/locale/months [keep month]]
== ["January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December"]
```

But this is useless, as it returns the exact same block. We actually need to `keep` `text` portion. So we need to do `keep [text month]`, but we also need to actually embed a string inside, not a `month` word: `keep reduce ['text month]`. A tick before `'text` makes sure that `'text` will evalute to `text` word.

We're all set now!

```
>> inline: [collect [foreach month system/locale/months [keep reduce ['text month]]]]
== [collect [foreach month system/locale/months [keep reduce ['text month]]]]
>> view compose [below (do inline)]
```

## Friday 28th September, 2018

greggirwin

[00:03](#msg5bad6fcf4d320a463b04d0de)@9214, things like this could make nice little PR blurbs.

9214

[00:06](#msg5bad70848196693171c695ea)@greggirwin I'd rather use \[this](https://github.com/9214/whatnot/blob/master/red/palette.red) instead.

bferris413

[12:27](#msg5bae1e2f8196693171ca9769)@9214 @greggirwin Thanks for the great explanations, I'll post up some results when I get something substantial

## Saturday 29th September, 2018

bferris413

[21:11](#msg5bafea6bc08b8b3067ab0075)`collect [foreach day system/locale/days [keep reduce ['panel reduce ['text day]]]]`  
is there a way to remove the second reduce?

[21:11](#msg5bafea86c08b8b3067ab00d1)similar to `compose/deep`?

## Sunday 30th September, 2018

greggirwin

[00:05](#msg5bb01355ae7be94016da03b8)Nope. You can use `compose/deep` in this case, but there is no `reduce/deep`.

```
collect [foreach day system/locale/days [keep compose/deep [panel [text (day)]]]]
```

bferris413

[00:37](#msg5bb01ae51c100a4f29095c12)Interesting, thanks

meijeru

[13:45](#msg5bb0d38eef4afc4f28f9e8a7)I have on occasion missed `reduce/deep` as well. Is that worth a REP wish, perhaps?

greggirwin

[18:25](#msg5bb1150f5af48530683e9fe1)It has never been added to Rebol, and was surely considered for Red. For me, while it would be nice sometimes, as soon as your data becomes anything more than very simple, `compose` often makes things easier. e.g. having to make all words into lit-words becomes a pain real quick.

[18:25](#msg5bb1152c1c100a4f290eb93b)I also have another dialected func, based on an old idea from Ladislav, which provides even more control.

[18:27](#msg5bb1157b271506518d9863e3)It's just some thinkerings right now, but I can put it in a gist if you want to see it and comment.

meijeru

[20:32](#msg5bb132f56e5a401c2df854e9)Yes please.

[20:35](#msg5bb13377bbdc0b2505c7469a)BTW there is a trade-off between making words into lit-words (for reduce/deep) and expressions into parens (for compose). It would depend on the volumes of these two categories.

greggirwin

[20:36](#msg5bb133c23844923661c4df82)Yes, and nested blocks staying blocks, or composing parens.

rebolek

[20:38](#msg5bb13438435c2a518e307d17)I think that name suggest usage. `reduce` is good for reducing data - getting values, and `compose` is great for composing dialects, where words are usually keywords and shouldn't be evaluated.

greggirwin

[20:43](#msg5bb135811c100a4f290f7a23)https://gist.github.com/greggirwin/29836d25de0c68eaba0e6dbd268a20f5

## Thursday 4th October, 2018

innitheblindsw

[15:15](#msg5bb62e76ae7be94016fecbf3)how handle "timeout" on read url?

9214

[15:16](#msg5bb62ee9bbdc0b2505e67805)@innitheblindsw could you be more specific?

innitheblindsw

[15:22](#msg5bb630396e5a401c2d176dbb)--== Red 0.6.3 ==--  
Type HELP for starting information.

&gt;&gt; read/binary https://gist.github.com/dockimbel/bf833e5a737f0efe4bfe07a26a528ec4  
\*\** Access Error: cannot connect: https://gist.github.com/dockimbel/bf833e5a737f0efe4bfe07a26a528ec4 reason: timeout  
\*\** Where: read  
\*\** Stack:

[15:26](#msg5bb63108c7bf7c3662b617d7)

```
--== Red 0.6.3 ==-- 
Type HELP for starting information. 

>> read/binary https://gist.github.com/dockimbel/bf833e5a737f0efe4bfe07a26a528ec4
*** Access Error: cannot connect: https://gist.github.com/dockimbel/bf833e5a737f0efe4bfe07a26a528ec4 reason: timeout
*** Where: read
*** Stack:
```

9214

[15:26](#msg5bb6310c64cfc273f995c2cb)First, use \[this](https://gist.githubusercontent.com/dockimbel/bf833e5a737f0efe4bfe07a26a528ec4/raw/73322d487b84d5b1bb77e8fc04b07ba13e699528/eval2.red) link to file directly. Second - Android bridge is being developed in the private branch, so, whatever you want to do with this script - it won't work.

innitheblindsw

[15:27](#msg5bb63176ae7be94016fee602)My network it is very slow. I try  
\`

[15:29](#msg5bb631d25331811c2e4c2b13)

```
read http://www.google.com
```

I got the same error. If try again, maybe read url.

[15:36](#msg5bb633841e23486b9389e4ad)I want try every time but get a value from read. Example: for open google.com i delay 2 minutes.

[15:38](#msg5bb633edc08b8b3067d0d2d5)if a way using `error?` with `either` to know if `read`have error?

9214

[15:41](#msg5bb6348fc08b8b3067d0d5af)@innitheblindsw `try` or `attempt`.

innitheblindsw

[16:40](#msg5bb6427fe65a634336829e1f)Solution  
\`

[16:41](#msg5bb642b664cfc273f9963f76)Solution

```
either error? try [read https://www.google.com.cu] [print "Err"] [print ":)"]
```

https://stackoverflow.com/questions/34805827/read-files-from-http

[16:58](#msg5bb646aaae7be94016ff8361)Thanks @9214 .

```
while [error? try [read http://www.google.com.cu]] [print "Err" wait 2]
```

Now it works. Between the retries 3-5, `read` now shown a value.

9214

[17:00](#msg5bb6472e6e5a401c2d181a57)

```
text
until [attempt [read http://www.google.com.cu]]
```

greggirwin

[17:01](#msg5bb6474e435c2a518e4ffaa2)Careful with loops that can block forever that way.

innitheblindsw

[18:38](#msg5bb65e2ce65a634336835a10)Thanks @greggirwin for advice. I am beginner like developer and like a child in RED. This is my firts homoiconic language and i come from autoit. i will like translate to spanish this documentation https://doc.red-lang.org/ . how i can do?

greggirwin

[18:57](#msg5bb6628b3844923661e50073)@innitheblindsw , you can fork https://github.com/red/docs make a new folder for `es`, then submit a PR when you're ready.

claytonsurgeon

[23:44](#msg5bb6a5f6bbdc0b2505e98a51)if `:print` returns the print function unevaluated, how do I do the same for a nested function like `now/time`?

## Friday 5th October, 2018

9214

[04:32](#msg5bb6e976271506518dbc11e3)@claytonsurgeon nohow, you should wrap `now/time` in another function first.

greggirwin

[15:47](#msg5bb7877cc08b8b3067d8fd58)@claytonsurgeon `now/time` isn't a nested function, but a function with a refinement. What are you trying to accomplish?

rebolek

[17:43](#msg5bb7a2de271506518dc0c1e5)I believe he wants to do something like `nt: :now/time`.

greggirwin

[18:15](#msg5bb7aa3cc7bf7c3662bf7a02)Yes, but \*why\*. As @9214 noted, the easy way is to wrap it in another func. Composing refined paths is an option, but more advanced.

[18:15](#msg5bb7aa575331811c2e557f27)The key is knowing if it needs to be dynamic in any way, or just static deferrals.

9214

[18:16](#msg5bb7aa8e6e5a401c2d20b47a)I sometimes face a need to alias refined functions. E.g.:

```
stack: make block! 16
push: :append/only
pop: :take/last
```

[18:17](#msg5bb7aad2c08b8b3067d9e9ad)And wrapping each one of them and copy-pasting spec is kinda tedious.

## Saturday 6th October, 2018

claytonsurgeon

[02:25](#msg5bb81d16435c2a518e5b4e18)I'm just going through the rebol docs trying to learn the ins and outs. No particular purpose, was curious if there was an idiomatic way of doing this.

[02:28](#msg5bb81de41e23486b9395c99f)@rebolek yeah, I was trying to do something like that.

rebolek

[02:31](#msg5bb81e9e1c100a4f2939e8a1)@greggirwin that's easy way? `push: :append/only` looks easier than `push: func [value][append/only value]` - and supporting other refinement!s like `/part` and `/dup` will make the code even longer and more complicated.

greggirwin

[02:37](#msg5bb81fdf82893a2f3ba7ef19)It's easy to understand. I'm tired, but can't see how the get-path approach could work for functions.

rebolek

[02:44](#msg5bb821a35331811c2e583d50)Easily, instead of writing and that's still missing help strings)

```
push: func [ 
        series 
        value 
        /part length 
        /dup count 
][ 
        case [ 
                all [part dup][append/only/part/dup series value length count] 
                part [append/only/part series value length] 
                dup [append/only/dup series vale count] 
                true [append/only series value] 
        ] 
]
```

you will write `push: :append/only`

9214

[04:30](#msg5bb83a7964cfc273f9a22a83)Hear-hear!

meijeru

[06:17](#msg5bb85363c08b8b3067ddc553)I am a proponent of having stacks grow at the \_front_ instead of the \_back\_. Then push becomes simply `insert`, and pop becomes `remove` or `take`.

9214

[06:23](#msg5bb854d982893a2f3ba90a50)Except that it's (1) `insert/only` (2) less effective, as you need to move allocated portion on each insertion, instead of just extending it at the tail.

[06:23](#msg5bb854fd1c100a4f293b0c89)This discussion is about possible aliasing feature, not stacks or someone's preferences.

meijeru

[06:35](#msg5bb857cc64cfc273f9a2cd37)I see. So I have unwittingly started a new (hopefully not un-interesting) discussion about stacks. To me it is a case of efficiency vs. readability and less chance of mistakes. `remove back tail` I have always found awkward. Anyone else feels the same?

rebolek

[06:42](#msg5bb85959435c2a518e5c8532)`remove back tail` is bit awkward, but you can do `take/last`.

9214

[06:42](#msg5bb85969bbdc0b2505f3af5d)I don't follow your argument. In any case, such operations over block are abstracted away with `push` and `pop`, which you can either create with wrappers:

```
pop: func [stack][remove back tail stack]
```

or with "aliases":

```
pop: :take/last
```

With implementation encapsulated in such generic operators, you always write `push stack value` and `pop stack` or similar, so there's no concern about readability.

meijeru

[06:50](#msg5bb85b1e82893a2f3ba92e0d)So you introduce another inefficiency: the overhead of a function call :smirk\_cat: . I take your point though, about abstracting away.

[06:55](#msg5bb85c68ae7be940160c2325)So as long as the `pop: :take/last` solution is not available, the wrapper function will have to do.

9214

[07:01](#msg5bb85dd96e5a401c2d249c05)This was just an example off top of my head, to show what users (and especially novices) may expect from using `get-path!` on a refined function. Such aliasing of functions with refinements is a reccuring theme, which pops (pun intended) up here once in a while, and so is worth to be discussed.

I don't understand why you took emphasis on stacks / readability / efficency whatever, as it wasn't the point.

meijeru

[08:57](#msg5bb879041c100a4f293bd342)OK I change the subject back to `get-path!` on a refined function. I am all for it and can see good applications, but -- unless I am mistaken -- it is not yet there. Has anyone made a WISH?

rebolek

[08:59](#msg5bb8796cbbdc0b2505f46117)@meijeru good point. AFAIR there's no formal wish yet.

## Monday 8th October, 2018

barss

[13:09](#msg5bbb5719bbdc0b250505736b)Hi! I have installed last stable Red 0.6.3 for Windows and WinDefender detect Trojan:Win32/Fuerboos.C!cl in C:\\ProgramData\\Red\\gui-console-2017-8-3-49893.exe Is it WinDefender's error?

rebolek

[13:12](#msg5bbb57b25331811c2e6b2300)@barss Yes, that's unfortunately result of their poor heuristics.

barss

[13:14](#msg5bbb582f384492366102713a)@rebolek Thanks )

rebolek

[13:15](#msg5bbb58675331811c2e6b29fb)You're welcome, you're not the first one hit by bad AV.

dander

[16:43](#msg5bbb8941ef4afc4f283b6d73)@barss If you like, you can submit a false-positive report \[here](https://www.microsoft.com/en-us/wdsi/filesubmission). I think it's probably helpful to get more attention to get these reports fixed

barss

[22:13](#msg5bbbd6a5600c5f6423755ce8)@dander Thanks, I submitted incorrect malware analysis.

dander

[23:28](#msg5bbbe812e65a634336a540fd)@barss thanks!

## Tuesday 9th October, 2018

bferris413

[15:49](#msg5bbcce2364cfc273f9b4c179)can someone explain the behavior of collect/keep, when keep'ing blocks?

[15:50](#msg5bbcce4c38449236610d5585)if I do `collect [ keep 1 ]`, i get the same as `collect [ keep [ 1 ]]`

[15:51](#msg5bbcce6f435c2a518e7911ff)both return `[1]`

9214

[15:51](#msg5bbcce866e5a401c2d40fda7)@bferris413 note that `keep` has refinement `/only`.

[15:52](#msg5bbccea2271506518de18225)

```
text
>> collect [keep 1]
== [1]
>> collect [keep [1]]
== [1]
>> collect [keep/only [1]]
== [[1]]
```

bferris413

[15:52](#msg5bbcceaec7bf7c3662e01e0e)oh

[15:52](#msg5bbccecf1e23486b93a93e1e)hm, thanks! where can I find keep documentation? if i use ?/help keep in the red terminal i don't get anything

9214

[15:53](#msg5bbccef71e23486b93a93e2a)@bferris413 `collect` and `keep` go in pair. Try `source collect`.

bferris413

[15:53](#msg5bbccf021c100a4f2957d2b5)ok great, thanks

9214

[15:53](#msg5bbccf04435c2a518e791770)`keep` is basically an internal alias for `append`.

## Wednesday 10th October, 2018

SutherlandSM

[14:59](#msg5bbe13c8384492366116b788)Long time REBOL new to Red. Does Red have a fully functioning View Engine yet?

[15:01](#msg5bbe1430f659e6777290f6c4)Need to create apps with data visualizations. Can C++ libraries or some other graphing library be plugged into Red? Can Red access SQL Server databases?

[15:01](#msg5bbe143c6e5a401c2d4a269a)I have an ODBC connection for REBOL that works well.

rebolek

[15:02](#msg5bbe1483c7bf7c3662e95ced)@SutherlandSM View is different from Rebol, native widgets instead of custom ones, but on pair with R2, I think.

[15:03](#msg5bbe14b0271506518deaa65c)C++ - Red has C interface, so no C++ (yet?)

[15:04](#msg5bbe14e3271506518deaa853)SQL - that needs full IO which should be in 0.7.0 version.

SutherlandSM

[15:04](#msg5bbe14efae7be940163275a5)Hmmm... the most important thing REBOL has been missing, has been the ability to use the huge range of C++ libraries.

[15:04](#msg5bbe14fe1c100a4f29611535)Ok. Sound's like you guys are getting close.

[15:06](#msg5bbe155e384492366116c4a4)I am the Director of R &amp; D at Pondera Solutions. We are a full stack .NET company. However, I do rapid prototyping in whatever works. Have codebases in 9 languages including REBOL.

rebolek

[15:06](#msg5bbe1588271506518deaacee)Lot of visualizations can be done in Red directly, using Draw. But if you need some 3D stuff@60Hz, you're out of luck, Draw can't certainly handle that :smile:

SutherlandSM

[15:08](#msg5bbe15dec7bf7c3662e96b68)Our current mobile app was first prototyped in REBOL, tested with LUA and is being developed out by a third party IOS developer. I could REALLY use a full stack self contained platform that plays well with everything in a human friendly language like REBOL.

[15:08](#msg5bbe1604e65a634336b5316e)Currently using C#, F#, VBA on a project. Hair tearing experience.

[15:10](#msg5bbe1648600c5f64238589a5)Any ETA on 0.7?

rebolek

[15:11](#msg5bbe1692435c2a518e825978)I understand your pain. Red is going to have Android backend "soon" (there's lot of work done on it, but it's low priority, so that's how soon it would be).

[15:12](#msg5bbe16c5c7bf7c3662e97326)0.7 - right now, 0.6.4 is very close to relase and work on 0.7 has already started.

SutherlandSM

[15:12](#msg5bbe16e3e65a634336b5387e)What's this business about Greg Irwin banned? on the right pannel?

rebolek

[15:13](#msg5bbe1714c08b8b3067f9a579)Certainly it won't be weeks,

[15:14](#msg5bbe174dc7bf7c3662e97895)@SutherlandSM huh? I'm on phone, so can't see it, but he's certainly not banned.

SutherlandSM

[15:14](#msg5bbe1771435c2a518e82618d)Right. Well. I have been checking in from time to time. Sapphire stalled, so Red seems to be it right now. Typical Sassenrath generated concept. 15-20 years ahead of the times. I have high hopes for Red if it can be done soon enough.

[15:15](#msg5bbe17adef4afc4f284dbfe7)Thanks for the chat. Will check in from time to time. Gotta have IO, and gotta have minimally C++ functionality.

rebolek

[15:16](#msg5bbe17cce65a634336b53f8f)We all have high hopes :) Cime b

[15:16](#msg5bbe17daef4afc4f284dc09f)Come back soon to check the progress!

SutherlandSM

[15:16](#msg5bbe17e81c100a4f2961288d)Will do. Thanks.

rebolek

[15:17](#msg5bbe17f91c100a4f296128c7)You're welcome

ne1uno

[15:23](#msg5bbe1981f659e6777291226d)you could make a shim lib for c++, it does get messy with overloading and optional parameters.

## Thursday 11st October, 2018

Palaing

[08:17](#msg5bbf0725e65a634336bbc71e)Trying to install Red on Ubuntu 18.04.1 following the docs at https://www.red-lang.org/p/download.html , I installed the required dependencies except:  
\- installed lib32ncurses5 and lib32z1 instead of ia32-libs as suggested by apt-get  
\- removed ~~libcurl3~~ which conflicted with `libcurl4` (needed by Apache)  
When launching red-063 I get: `.red/console-2017-8-3-49893: error while loading shared libraries: libcurl.so.4: wrong ELF class: ELFCLASS64`  
Note that I had to add environment variable `LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu` as otherwise libcurl.so.4 was not found despite seemingly adequate config of /etc/ld.so.conf files.  
Anyone can help?

rebolek

[08:27](#msg5bbf098664cfc273f9bad228)install 32bit version of libcurl4

[08:28](#msg5bbf09c4f659e6777297fbdb)`sudo apt-get install libcurl4:i386`

Palaing

[08:45](#msg5bbf0dbdf659e67772981e12)@rebolek That works great, thanks so much!

bferris413

[23:05](#msg5bbfd73e6e5a401c2d576829)I have some fields in a view: `fields: [ f1 f2 f3 ]`

[23:05](#msg5bbfd7541c100a4f296e5cba)And I have a button to gather all the text from those fields on click:

[23:06](#msg5bbfd768e65a634336c23ba1)

```
button "Add" [ 
    append text-list rejoin collect [
        foreach elem fields [
            elem-text: do rejoin [ elem "/text" ]
            keep append copy elem-text " "
        ]
    ]
```

[23:06](#msg5bbfd78d82893a2f3bccd66b)Is there an idiomatic way to get the text from the elements, as seen in `elem-text: do rejoin [ elem "/text" ]`

[23:07](#msg5bbfd7cdc7bf7c3662f696fe)I guess the real question is more about dynamically building up the actual word or path

[23:08](#msg5bbfd7e06e5a401c2d576bff)Or is this just a bad idea altogether?

9214

[23:09](#msg5bbfd81fc7bf7c3662f69874)@bferris413 ?

```
view [
    a: field "yes"
    b: field "there"
    c: field "is"

    t: text-list
    button "collect" [
        t/data: collect [
            foreach field reduce [a b c][keep field/text]
        ]
    ]
]
```

[23:09](#msg5bbfd843271506518df7ce3b)Fiddling with strings when you have a whopping pile of 50+ datatypes is generally a bad idea. Building values dynamically, on the other hand, is one of the key Red's strength, which you should leverage.

bferris413

[23:16](#msg5bbfd9b4600c5f64239310f6)Ok thanks. I remember reading that `do`'ing strings was generally not a good idea. As usual, I'll be working on it. Thanks @9214

9214

[23:16](#msg5bbfd9e082893a2f3bcce076)Note that `path!` is a series, and that you can use the same actions on it as with blocks and strings:

```
>> path: to path! 'a
== a
>> append path 'b/c
== a/b/c
>> remove path
== b/c
>> reverse path
== c/b
>> c: [b see?]
== [b see?]
>> reduce path
== see?
```

bferris413

[23:17](#msg5bbfda226e5a401c2d577b38)Completely forgot about that

[23:29](#msg5bbfdce1435c2a518e8fbf4a)What's the purpose of reducing the fields? if I try `probe reduce [a]` I get what looks like an object

[23:30](#msg5bbfdd02c7bf7c3662f6b389)

```
>> view [ a: field "ok" 
[    button "press" [ probe reduce [a ] ]
[    ]
[make object! [
    type: 'field
    offset: 10x10
    size: 80x25
    text: "ok"
    image: none
    color: none
    menu: none
    data: 'ok
    enabled?: true
    visible?: true
    selected: none
    flags: none
    options: [style: field vid-align: top at-offset: none]
    parent: make object! [
        type: 'window
        offset: 685x434
        size: 172x53
```

9214

[23:32](#msg5bbfdd93e65a634336c25e0e)@bferris413 initially block `[a]` contains only one value of type `word!`. Blocks suppress evaluation completely and store their values as-is, including words (which you probably think are "variables" of some sort, which is not quite correct); they do not automagically coerce words to their values, it is up for a user to `do` (pun intended) so. `reduce` is similar to `do`, except that it evaluates all contained expressions.

[23:33](#msg5bbfddc4271506518df7ee9d)In your case word `a` evaluated to a \[face object](https://doc.red-lang.org/en/view.html#\_face\_object), used by View engine, specifically to a face object of a field.

[23:35](#msg5bbfde55ae7be940163fffdb)Without reducing I'd instead tried to access `text` field in a `word!` value, which is incorrect and makes no sence, as words are not aggregate values.

bferris413

[23:36](#msg5bbfde69ef4afc4f285b2655)Ok, I've got a lot to learn

[23:36](#msg5bbfde6dc7bf7c3662f6bc4a)thanks @9214

9214

[23:36](#msg5bbfde77f659e677729e786e)You're welcome. Take your time :wink:

[23:39](#msg5bbfdf2b271506518df7f765)@bferris413 imagine that block is a piece of paper, and some words are written on it. Initially they are just scribbles and sets of letters with symbols - "London" is a 6-letter word. But if you "infer" their meaning, then they become something else - London is the capital of Great Britain.

[23:40](#msg5bbfdf5d384492366123fc73)This is kinda the same with Red. `[a]` is a list of paper with one word written on it, `reduce` "infers" the meaning of all words (of all expressions, to be specific), and `a` brings forward its meaning.

[23:44](#msg5bbfe04f600c5f64239338e6)

```
text
>> London: "the capital of Great Britain"
== "the capital of Great Britain"
>> paper: [London]
== [London]
>> type? first paper
== word!
>> reduce paper
== ["the capital of Great Britain"]
>> type? first reduce paper
== string!
```

bferris413

[23:51](#msg5bbfe1f3ae7be9401640145a)Good explanation, thanks!

## Friday 12nd October, 2018

Rebolforces

[01:17](#msg5bbff645435c2a518e90519b)@endo64 thanks, it is nice to be remembered :-)

## Saturday 13th October, 2018

x8x

[10:49](#msg5bc1cdac11177a25e5e435d8)ouch..

## Sunday 14th October, 2018

greggirwin

[20:45](#msg5bc3ab06ef4afc4f28743a99)@rebolek, on get-path+func, I see what you mean now. My confusion was in trying to make it a general case, rather than hard-coding for a specific func inside.

[20:46](#msg5bc3ab226e5a401c2d70a833)@SutherlandSM, I'm not banned myself, but had to ban someone else at one point. The Gitter UI doesn't make that clear.

SutherlandSM

[23:24](#msg5bc3d019ae7be940165a4f69)@greggirwin Good to touch base with you all. I've been using a lot of F# recently and some VBA for rapid prototyping. They all have hints of REBOL in them, but just don't put it all together. I have used REBOL a few times when charts are not in use. Unfortunately nearly everything we do involves charts.

[23:25](#msg5bc3d06f82893a2f3be119d8)Worried that Red will not become production ready soon enough. Now that I've seen architecture of the tech stack I think it could be pretty important.

[23:26](#msg5bc3d0acc08b8b306715d07d)I like the way Lua incorporates C++. Would be nice if we could get that to happen in REBOL/Red. We should be able to implement classes as objects in some way.

[23:26](#msg5bc3d0c21c100a4f2988d3cb)Anyway. Back to the cave. :)

## Monday 15th October, 2018

bferris413

[01:29](#msg5bc3ed731c100a4f298978c9)Is there a literal syntax for `put` into a hash! ?

[01:31](#msg5bc3edf3271506518d12b6ad)Also, I get an access violation with this:

[01:32](#msg5bc3ee1864cfc273f9ca3725)

```
v: make hash! [a "1"]
append v 'b
put v 'b "2"
*** Runtime Error 1: access violation
*** at: 004546E6h
```

greggirwin

[01:41](#msg5bc3f04e64cfc273f9ca419a)@SutherlandSM C++ is...not easy to integrate with, name mangling and all that. On the bright side, your input will be valuable on chart design and implementation.

[01:47](#msg5bc3f198c7bf7c366211b116)@bferris413 please see if there's already a ticket for that. If not, file one. It affects blocks too. `Put` is the culprit there, but you don't need it.

```
>> v: [a "1"]
== [a "1"]
>> append v 'b
== [a "1" b]
>> v/b: "2"
*** Script Error: value out of range: 2
*** Where: set-path
*** Stack:
```

Note that block types are not specifically key-value structures, so they don't auto-expand. A `map!` will do what you want though. If you know you're always going to use blocks that way, add a value placeholder:

```
>> v: [a "1"]
== [a "1"]
>> repend v ['b none]
== [a "1" b none]
>> v/b: "2"
== "2"
>> v
== [a "1" b "2"]
```

endo64

[10:38](#msg5bc46e0bbbdc0b250544b9b6)&gt; please see if there's already a ticket for that. If not, file one.

@greggirwin @bferris413 I see no ticket for that, we should file one.

bferris413

[12:20](#msg5bc4862a1e23486b93c27ebe)I'll follow up this evening, thanks @greggirwin @endo64

SutherlandSM

[15:59](#msg5bc4b96abbdc0b250546ca55)@greggirwin Would like to help as time permits. Most SaaS companies like ours (ponderasolutions.com) deliver our product on the Web. So Web integration is important. I have been pleasantly surprised by F# SAFE Stack template for dotnet. Functional language that is much lighter weight than C#/Java and implements DSLs for GUI and parsing, but still burdened with the whole .NET Core rat's nest.

[16:01](#msg5bc4b9cebbdc0b250546ccb6)Feels a bit like pulling a cruise ship across the street to the grocery store with a turbocharged tricycle.

greggirwin

[16:36](#msg5bc4c20e384492366143cde9)&gt; Feels a bit like pulling a cruise ship across the street to the grocery store with a turbocharged tricycle.

I'm going to steal that.

## Tuesday 16th October, 2018

bferris413

[00:36](#msg5bc532a6435c2a518eb2964e)Filed at https://github.com/red/red/issues/3567 , thanks

[00:47](#msg5bc5353464cfc273f9d26f8e)For what it's worth I'm enjoying learning Red

[00:48](#msg5bc53545e65a634336e53556)It's verrrry different from any other language I know

[00:48](#msg5bc535676e5a401c2d7a6824)bit of a learning curve in that respect, but I'm liking it quite a bit

greggirwin

[06:20](#msg5bc5833782893a2f3bebc449):+1:

## Wednesday 17th October, 2018

temperfugit

[03:56](#msg5bc6b303ae7be940166ce80f)Is there a way when using foreach to know the index of whichever value you're on (besides manually incrementing a variable inside of it)?

ne1uno

[04:16](#msg5bc6b78de65a634336eeb7ea)`forall` works with `index?`

temperfugit

[04:39](#msg5bc6bd0ce65a634336eed28b)Thanks @ne1uno ! The idea of a variable pointing to a series \*and* keeping track of a current index position threw me off when I started looking at Red, so I guess I've been kind of ignoring that functionality (and `forall`). It looks like `forall` does exactly what I want though.

## Thursday 18th October, 2018

Palaing

[14:40](#msg5bc89b6838449236615c7dc5)Is there any way to catch and process the output of an external command, without writing it to a file?  
Instead of:

```
call/shell/output "mysql xxx" %output
output: read %./output
```

I would like to do something like:

```
output: call/shell/output "mysql xxx"
```

but `call` only returns a process ID...

rebolek

[14:43](#msg5bc89c13435c2a518ec84d48)`call/output` needs an argument where output is stored

[14:44](#msg5bc89c5dc08b8b3067346a79)Try `call/output code out: ""` and then `probe out`

Palaing

[15:03](#msg5bc8a0a4069fca52a556eeff)@rebolek Thanks, that's exactly what I tried to do !!!

greggirwin

[17:09](#msg5bc8be411e23486b93ddabe7)The key, @Palaing, is that you need a word to reference the output buffer (which can also be a `binary!`.

## Friday 19th October, 2018

novvorto\_twitter

[09:02](#msg5bc99d90c08b8b30673a9d9f)'''  
Red \[]  
name: ask "Name: "  
print \[name]  
'''  
I tried to compile this code using:  
'red -r test.red'  
It gave me:  
'''  
\-=== Red Compiler 0.6.3 ===-

Compiling f:\\Project\\AppDev\\Red\\001\\008.red ...  
\*\** Compilation Error: undefined word ask  
\*\** in file: f:\\Project\\AppDev\\Red\\001\\008.red  
\*\** near: [ask "Name: "  
print \[name]  
]  
'''  
Why is 'ask' undefined?

rebolek

[09:02](#msg5bc99db482893a2f3b0630ca)@novvorto\_twitter `ask` is part of console

novvorto\_twitter

[09:03](#msg5bc99de1ae7be940167fc7e1)Does it mean I have to 'needs console' in Red header?

rebolek

[09:03](#msg5bc99de3ab17df2631b704d2)you need to include `environment/console/CLI/input.red`

[09:03](#msg5bc99dfaab17df2631b70545)@novvorto\_twitter `needs: console` would be nice, but that'đ not supported yet :)

novvorto\_twitter

[09:04](#msg5bc99e3b271506518d3724e3)Right, I don't know how to use this mark down thing in this chat.

rebolek

[09:05](#msg5bc99e65600c5f6423d2be81)no problem

endo64

[09:44](#msg5bc9a78c271506518d375d65)&gt; Right, I don't know how to use this mark down thing in this chat.

@novvorto\_twitter Use back tick (\`) instead of single quote (')

Ungaretti

[09:51](#msg5bc9a93cab17df2631b75154)@rebolek Interesting. How should I include `environment/console/CLI/input.red`? Like `needs: environment/console/CLI/input.red`? That does not seem to work.

rebolek

[09:56](#msg5bc9aa4a435c2a518ecefcd6)@Ungaretti `#include environment/console/CLI/input.red` (if your is script is in root dir).

Ungaretti

[10:07](#msg5bc9acc41e23486b93e3796e)@rebolek Sorry, I'm lost here. You mean something like:

```
#include environment/console/CLI/input.red
Red []
name: ask "Name: "
print name
```

rebolek

[10:11](#msg5bc9adb61e23486b93e37ec3)@Ungaretti basicallyyes

[10:11](#msg5bc9adc3c08b8b30673b007d)just move #include below the header

Ungaretti

[10:11](#msg5bc9ade7600c5f6423d325d7)@rebolek I see. Thanks.

rebolek

[10:13](#msg5bc9ae5564cfc273f9ef37d8)@Ungaretti Accidentally I have this file in my Red root dir, that I compiled succesfully in the past:

```
Red []
#include %environment/console/CLI/input.red
t: ask "Input name: "
print t
```

[10:14](#msg5bc9ae691e23486b93e383f6)I was trying to test it again, but compilation gives me access violation.

[10:15](#msg5bc9aede6e5a401c2d9744d3)With `-r`. Without it I get `*** libRedRT Error: definition not found for red/image/resize`

Ungaretti

[10:17](#msg5bc9af28c7bf7c366236adaf)I have the Red executable in the same folder as my script (is that it?) and I get:

```
Compiling C:\Users\AndrÚ\Documents\RedIDE\programs\compiletest.red ...
*** Compilation Error: include file not found: environment/console/CLI/input.red
*** in file: C:\Users\AndrÚ\Documents\RedIDE\programs\compiletest.red
*** near: [
    #include %environment/console/CLI/input.red
    name: ask "Name: "
    print name
]
```

rebolek

[10:17](#msg5bc9af4d82893a2f3b06a5c0)@Ungaretti do you have source repo cloned from GitHub?

Ungaretti

[10:19](#msg5bc9afcdc08b8b30673b0e4e)@rebolek No! It all makes sense now! I could not figure how Red would find a file that was not there (but hey, I've seen some weird stuff) but now I understand that you need the whole source in the same folder.

rebolek

[10:20](#msg5bc9aff0435c2a518ecf2519)@Ungaretti AH! There's no magic involved, it can include only existing files :)

## Saturday 20th October, 2018

SutherlandSM

[16:45](#msg5bcb5bc16e5a401c2da1d239)@greggirwin @rebolek Well. Gave up on .NET for rapid prototyping. Excel is no longer an option now that we are on Azure, so I am writing my charts in REBOL (not Google Charts) and putting them in a VID display. Will be up to the .NET boys to implement once we've tested the prototype.

[16:46](#msg5bcb5be5ae7be940168aaa12)I remember that Carl implemented charts for contract with a large chip manufacturer back in the day. Wondering what happened to that code.

[16:47](#msg5bcb5c391c100a4f29b8178c)I write code to express my ideas, which is very different than writing code for others to use, so my charts will need massaging from a real computer science guru to be useful.

[16:49](#msg5bcb5caa069fca52a5681810)Would welcome collaboration if it will help the REBOL/Red effort. Right now I am all R2, just because I can do just about everything with it and I know where the bugs are. I have always wished for better fonts, but for prototyping it doesn't matter as much.

greggirwin

[18:47](#msg5bcb7850c7bf7c366241f702)@SutherlandSM there was a quite extensive charting lib written by a Rebol community member: http://www.rebol.org/view-script.r?script=q-plot.r and @rgchris has a Google charts API (not sure if it's still supported).

[18:49](#msg5bcb78a7435c2a518eda6608)Red, especially with reactivity, will be great for this. @rebolek's work is the point project on charts right now.

rebolek

[18:58](#msg5bcb7aed1c100a4f29b8e1c2)Yeah, reactivity will be certainly great for this...but being :mouse: I'm very afraid of it...https://turnoff.us/geek/reactive-and-boring/

SutherlandSM

[18:59](#msg5bcb7affae7be940168b6fc0)Ah. Yes... I remember looking at q-plot once. There was something like ez-plot as well. Will take a look.

[18:59](#msg5bcb7b1538449236616ed5bd)What does reactivity mean in the Red world.

rebolek

[19:00](#msg5bcb7b57435c2a518eda7967)Same thing as everywhere else.

[19:01](#msg5bcb7b8bab17df2631c30b0a)You change something and other stuff should somehow magically change also, if the stars are in right position.

SutherlandSM

[19:02](#msg5bcb7bc2069fca52a568ee6f)So makes it possible for async data driven redlets.

[19:03](#msg5bcb7bf038449236616eda39)Perhaps the only good thing about Java.

[19:03](#msg5bcb7c1882893a2f3b12275f)How do you keep the event loop from slowing things down?

rebolek

[19:04](#msg5bcb7c50435c2a518eda7f35)Reactivity has nothing to do with event loop.

[19:04](#msg5bcb7c591c100a4f29b8e89d)It's separate concept.

SutherlandSM

[19:06](#msg5bcb7ca0435c2a518eda8316)Good. Interested to know how it is being implemented in the REBOL/Red world.

[19:06](#msg5bcb7cb31c100a4f29b8e9ec)I have done some state machines, but they depended on the event loop.

rebolek

[19:07](#msg5bcb7cf91c100a4f29b8ebb7)@SutherlandSM here's an example from red-lang.org :

```
red>> a: make reactor! [x: 1 y: 2 total: is [x + y]]
    == make object! [
        x: 1
        y: 2
        total: 3
    ]
    red>> a/x: 5
    == 5
    red>> a/total
    == 7
    red>> a/y: 10
    == 10
    red>> a/total
    == 15
```

[19:09](#msg5bcb7d77600c5f6423dea046)And when `total` is some GUI element instead of variable, GUI changes it's state, just by changing some value elsewhere.

SutherlandSM

[19:10](#msg5bcb7dafab17df2631c31793)So word state change triggers a function. Something like what view/faces did when initializing, but this does it at runtime. So reactor! is a data-type or something else.

9214

[19:11](#msg5bcb7df1069fca52a568ff49)@SutherlandSM read the documentation. \[Here](https://doc.red-lang.org/en/reactivity.html) and \[here](https://www.red-lang.org/2016/06/061-reactive-programming.html).

SutherlandSM

[19:11](#msg5bcb7dfbc7bf7c3662421e96)This is exactly what I've been looking for. Have to finish off the current prototype, but will dig into this soon.

[19:12](#msg5bcb7e1fef4afc4f28a5ac0a)Love you guys. Will have to do that when time permits. This was for deciding whether I should take the time. Thanks.

[19:14](#msg5bcb7ea7271506518d42eb47)Similar to OOP languages without the constraints. Looking forward to it. Thanks.

## Monday 22nd October, 2018

rgchris

[01:08](#msg5bcd22f3435c2a518ee44da5)@greggirwin @SutherlandSM The \[Charts API](http://ross-gill.com/page/Google\_Charts\_and\_Rebol) should still work so long as the Google API stays switched on.

SutherlandSM

[04:07](#msg5bcd4d0c069fca52a573c655)Hi Chris. Thanks. I remember using your Charts API in the past. Looks like I will be able to a adapt q-plot for the present. Need to change the way a few things render, but the basic dialect has been a good starting place.

[04:18](#msg5bcd4fb364cfc273f9053ead)Just downloaded Red for windows. Seems to be stuck on "Compiling GUI Console..."

[04:19](#msg5bcd4fc3c08b8b3067514ece)I is running on a 64k Azure VM.

[04:19](#msg5bcd4fd882893a2f3b1cf444)Oops. There it goes.

[04:19](#msg5bcd4fdcae7be9401696508a)Nice.

[04:48](#msg5bcd56ab6e5a401c2dada7df)I like the fonts and the styles of Red. Much closer to modern styles. How easy is it to port R2 scripts to Red?

[04:48](#msg5bcd56b2271506518d4dd939)From experience.

[04:49](#msg5bcd56d01c100a4f29c3e942)Tempted to do the charting tool in Red, but have a prototype to finish.

[04:49](#msg5bcd56e1435c2a518ee5677d)Need odic connectivity as well. Will try in Red.

9214

[04:52](#msg5bcd579fc7bf7c36624d1ed3)&gt; I like the fonts and the styles of Red. Much closer to modern styles.

FYI, all widgets are native. R2 relied on AGG library.

SutherlandSM

[04:55](#msg5bcd582982893a2f3b1d2579)Nice. Is there an ODBC port scheme?

[04:55](#msg5bcd584d64cfc273f90576ce)Been connecting to a SQL server back end.

9214

[04:57](#msg5bcd589f6e5a401c2dadb138)There are no port schemes, because `port!` datatype is yet in development.

SutherlandSM

[04:57](#msg5bcd58c0271506518d4de2ef)Any work around for ODBC connections, or do I wait?

[04:58](#msg5bcd58ddc08b8b3067518388)Just need to send a connection string a query and get back data.

[05:00](#msg5bcd59506e5a401c2dadb44c)Here's my R2 script for testing ODBC connection:  
REBOL \[]  
connection-port: open [  
scheme: 'odbc  
target: "driver={SQL Server};server=(local);database=Research\_NEVADA;trusted\_connection=true"  
]  
ask "Worked!"  
close connection-port  
ask "?"  
quit

endo64

[08:08](#msg5bcd85706e5a401c2daed484)@SutherlandSM Currently you can put your test into a batch file or better a .vbs script and `call` it.

```
const adUseServer = 2
const adModeWrite = 2

Set oCON = CreateObject("ADODB.Connection")
oCON.ConnectionString = "driver={SQL Server};server=(local);database=Research_NEVADA;trusted_connection=true"

On Error Resume Next
oCON.ConnectionTimeout = 10
oCON.CommandTimeout = 0
oCON.CursorLocation = adUseServer
oCON.Mode = adModeWrite
oCON.Open

If Err Then
	Dim oErr
	For Each oErr in oCON.Errors
		WScript.Echo oErr.Source & vbcrlf & oErr.Description
	Next
	set oErr = nothing
	oCON.Errors.Clear
	Err.Clear
	if oCON.State = 1 then oCON.Close
	Set oCON = Nothing
	WScript.Quit(1)
end if
WScript.Quit(0)
```

And then `call\console "cscript.exe connection-test.vbs"` or `call/output` to capture the output (Wscript.echo)

greggirwin

[22:29](#msg5bce4f2d1c100a4f29ca67e7)@SutherlandSM we're also going to add a message, very soon, so you know it's compiling the console on first run. The next step after that will be to reverse the roles, so the download will be the console, and the toolchain will be secondary, when you want to compile. That way you won't get a delay the first time.

## Tuesday 23th October, 2018

novvorto\_twitter

[18:56](#msg5bcf6ec3271506518d5bb26e)

```
Red []
#include %"red/environment/console/cli/input.red"
name: ask "Name: "
print [name]
```

This script compiles OK but gives  
\*\** Runtime Error 1: access violation  
\*\** at: 0041F2CBh  
on Windows 7 SP1 64-bit

I am using red-23oct18-08dabaae.exe.

9214

[19:10](#msg5bcf7226069fca52a581e4cd)@novvorto\_twitter which flags do you use for compilation? Are sources pulled from a fresh master branch?

rebolek

[19:12](#msg5bcf72af271506518d5bccc8)I have same problem under Linux.

9214

[19:14](#msg5bcf7327435c2a518ef37c6f)@rebolek worth a ticket then.

novvorto\_twitter

[19:16](#msg5bcf738f600c5f6423f7b3fd)@9214 I use "-r" to compile. As for the source I use red-23oct18-08dabaae.zip.

9214

[19:18](#msg5bcf73e83844923661883e61)@novvorto\_twitter thanks!

rebolek

[19:18](#msg5bcf73f182893a2f3b2b527e):point\_up: \[19. říjen 2018 12:13](https://gitter.im/red/red/welcome?at=5bc9ae5564cfc273f9ef37d8)

9214

[19:20](#msg5bcf74601e23486b9307c337)Either \[this](https://github.com/red/red/commit/d11e5eb6cbda5cd83405011cbad1a60a9a326113) or \[this](https://github.com/red/red/commit/1ec7ea6322ddfecab0c6a7cede089de6d17473c6).

[19:21](#msg5bcf74a7ae7be94016a4b311)Actually the latter one only, because libRed is not used in release mode.

## Wednesday 24th October, 2018

bitbegin

[03:09](#msg5bcfe281c08b8b3067625420)this is a gc issue

endo64

[08:10](#msg5bd028f7c7bf7c36625f83bb)`*** Runtime Error 1: access violation` confirmed on Win10.

bitbegin

[08:11](#msg5bd02949ef4afc4f28c29363)can you add "-d" to get error stack？

endo64

[08:35](#msg5bd02ee7c7bf7c36625fabbc)@bitbegin Here it is:

```
D:\Projects\Red\red\build\bin>test.exe
root size: 2191, root max: 4152, cycles: 0
root size: 2191, root max: 4152, cycles: 1
root size: 2191, root max: 4152, cycles: 2

*** Runtime Error 1: access violation
*** in file: /D/Projects/Red/red/build/bin/datatypes/series.reds
*** at line: 82
***
***   stack: red/_series/get-length 00000000h true
***   stack: red/string/rs-abs-length? 00000000h
***   stack: terminal/console-edit 00D26D24h
***   stack: terminal/edit 00D26D24h
***   stack: _read-input 00D26D24h
***   stack: ask
```

[08:36](#msg5bd02f0b435c2a518ef80e84)And the `series.reds` line 82 is:

```
get-length: func [
		ser		   [red-series!]
		absolute?  [logic!]
		return:	   [integer!]
		/local
			s	   [series!]
			offset [integer!]
			width  [integer!]
	][
		s: GET_BUFFER(ser)
		offset: either absolute? [0][ser/head]
		if negative? offset [offset: 0]					;-- @@ beware of symbol/index leaking here...   <<<<<<< HERE
		width: (as-integer s/tail - s/offset) >> (log-b GET_UNIT(s))
		either offset > width [ser/head: width 0][width - offset] ;-- past-end index adjustment
	]
```

bitbegin

[08:37](#msg5bd02f67ef4afc4f28c2bc54)same logs as on ubuntu

[08:48](#msg5bd031dd435c2a518ef822b4)

```
Red []
#include %environment/console/CLI/input.red
#system [
    terminal/init-globals
]
t: ask "Input name: "
print t
```

[08:49](#msg5bd03225ef4afc4f28c2cc7e)Adding this \`terminal/init-globals' can solve this issue temporary

endo64

[09:22](#msg5bd039bb1e23486b930c978b)@bitbegin What does it do? How did you find it? :)

bitbegin

[09:26](#msg5bd03ab238449236618d1182)`saved-line` not init

SutherlandSM

[20:40](#msg5bd0d8c5ef4afc4f28c76a13)@endo64 Perhaps I miscommunicated. The test works fine for me in REBOL. I just need something using Red. Do we have ODBC connectivity in Red?

rebolek

[20:42](#msg5bd0d94c6e5a401c2dc508cb)no

endo64

[22:10](#msg5bd0eded64cfc273f91d8d4e)@SutherlandSM Nope, we don't have ODBC yet. I just offered a workaround using `call`.

## Saturday 27th October, 2018

amreus

[23:10](#msg5bd4f05082893a2f3b4e35fd)Why might Red not include some filenames read from a directory? Example:

```
files: read %/c/windows/system32/
```

I can find `doskey.exe` in `files` but the on-screen keyboard `osk.exe` isn't in the block.

My first thought was permission, but they both have the same permissions.

## Sunday 28th October, 2018

ne1uno

[01:15](#msg5bd50da3c08b8b3067835211)@amreus which OS version? win7 the permissions look the same but I know osk is able to pass keys to some system programs where some regular virtual keyboard can't. maybe it's just faking permissions unless you are an actual admin so you are able to run it? I am on an admin user account and `osk.exe` is in `files` from your example

[01:20](#msg5bd50ed2c08b8b3067835811)`find files %osk.exe`

amreus

[07:54](#msg5bd56b2bab17df263101ce03)@ne1uno After some research, it appears I am getting the files from the `C:\Windows\SysWOW64` directory which is a folder for 32 bit Windows binaries on Windows 64 bit. Similar to how there is `C:\Program Files` for 64 bit programs, and `C:\Program Files (x86)` for 32 bit programs.

[07:57](#msg5bd56bcd069fca52a5a7aa1f)\[!\[image.png](https://files.gitter.im/red/red/welcome/vUqL/thumb/image.png)](https://files.gitter.im/red/red/welcome/vUqL/image.png)

[08:01](#msg5bd56ce6ab17df263101d7e1)I don't know the intricate details but I think since Red is 32-bit, it runs on the Window's 32-bit emulator on Win 64 which transparently uses the `SysWOW64` folder instead of the `System32` folder which is only for 64-bit binaries on 64-bit Windows.

ne1uno

[08:06](#msg5bd56e02271506518d81609f)I have 64bit-Pro win7, what does `about/debug` say from --cli

amreus

[08:07](#msg5bd56e3564cfc273f9398359)It closes the Red gui. lol.

[08:07](#msg5bd56e50600c5f64231d1cdd)oh cli....

[08:08](#msg5bd56e69c08b8b3067855989)

```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.3 ahead: 1096 date: 25-Oct-2018/0:28:46 commit: #12ad56be0fc474f7738c0ef891725e49f9738010 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```

ne1uno

[08:08](#msg5bd56e6e271506518d816396)still works on the old gui if you build it yourself, or the cli

[08:12](#msg5bd56f7d069fca52a5a7c001)maybe try `find` from powershell or a command prompt or start menu, then properties to find the exact location?

amreus

[08:12](#msg5bd56f821c100a4f29f74ba3)This all came about because I am making a command-line utility for searching for executables in my PATH and PATHEXT environmental variables.

ne1uno

[08:13](#msg5bd56fbf600c5f64231d25d2)win7 must still have a 32 bit version of `osk`

amreus

[08:15](#msg5bd5700f600c5f64231d2883)@ne1uno Does this mean I can not get the contents of `System32`?

ne1uno

[08:16](#msg5bd57042c08b8b3067856156)I'm assuming `osk` is 64 bits and in a different spot than system32

[08:16](#msg5bd57052bbdc0b2505b0db8b)maybe someone else on win10 can look

amreus

[08:16](#msg5bd57054bbdc0b2505b0db8d)osk.exe is in `System32` folder.

ne1uno

[08:17](#msg5bd5707e1e23486b932da427)might be a soft link or something red is ignoring or just not seeing?

amreus

[08:17](#msg5bd5709c1c100a4f29f74f62)No, Red is being re-directed to the `SysWow64` folder on 64-bit Windows. Or at lease `files: read %/c/windows/system32` is returning the contents of `%/c/windows/syswow64`

ne1uno

[08:24](#msg5bd572581c100a4f29f75b6c)https://stackoverflow.com/questions/44700843/attempting-to-open-on-screen-keyboard-through-another-program-fails

amreus

[08:25](#msg5bd57287435c2a518e1903aa)Ah I can use `files: read %/c/windows/sysnative/` to get the contents of `System32`, or some combination of `System32` and `SysWow64`

[08:35](#msg5bd574bc069fca52a5a7e352)@ne1uno Thanks for your help. This was really all about Windows and 32/64 bit compatibility, not about Red after all.

ne1uno

[08:36](#msg5bd574f2600c5f64231d43cc)thanks for finding the trick path. I knew there was probably a way but haven't run into the problem yet

[08:43](#msg5bd5769bc7bf7c3662811463)`print list-env` shows a few things 32/64 related, but doesn't look like you could use them to find programs for sure

[09:42](#msg5bd58485069fca52a5a8430d)`call rejoin ["start " get-env "SystemRoot" "\sysnative\osk.exe"] doesn't work win7 this does`call rejoin \["start " get-env "windir" "\\system32\\osk.exe"]\`

## Thursday 1st November, 2018

novvorto\_twitter

[17:50](#msg5bdb3ce55905a919553a3d7c)I am using red-25oct18-12ad56be on Win 7 SP1.

```
>> reverse 1.2.3.4
```

crashes the GUI console.  
But,

```
>> reverse to tuple! [1 2 3 4]
== 4.3.2.1
```

runs fine.

dsunanda

[19:51](#msg5bdb5945d2b0f12575492f25)Reverse....That is an annoying bug. Luckily, looks like it has already been reported, and is scheduled for a fix in 0.6.4. #3379

ne1uno

[20:01](#msg5bdb5b8b995818347b89d467)old gui and console work

## Friday 2nd November, 2018

novvorto\_twitter

[05:35](#msg5bdbe2366ab3f85bddef0727)To temporary fix the `reverse tuple!` issue, this script works:

```
Red []

reverse-tuple: func [
	tup [tuple!]
][
	b: ""
	repeat i length? tup [
		b: rejoin [b " " tup/:i]
]
to-tuple reverse to-block b
]

print reverse-tuple 1.2.3.4
```

[05:46](#msg5bdbe498d2b0f125754cce87)Ah, no. Apparently it doesn't work.

[05:47](#msg5bdbe4dc5905a919553ea2a0)More internal checking might be needed.

[06:09](#msg5bdbea046eb1e3597a9948e8)umh... the way Red works is:  
\`

[06:09](#msg5bdbea10a9c55b2574943043)&gt;&gt; 256.21.21  
\*\** Syntax Error: invalid float! at "256.21.21"  
\*\** Where: do  
\*\** Stack: load  
\`

rebolek

[06:10](#msg5bdbea4c4775f53eb32a4dd7)Well, technically it is invalid float :)

novvorto\_twitter

[06:10](#msg5bdbea606ab3f85bddef393d)Right, I just found out.

rebolek

[06:14](#msg5bdbeb4425b9875faebe52e8)@novvorto\_twitter

```
>> reverse-tuple: func [tuple][load replace/all form reverse split form tuple dot space dot]
== func [tuple][load replace/all form reverse split form tuple dot space dot]
>> reverse-tuple 1.2.3.4
== 4.3.2.1
```

or use latest nightly, which is recommended over "stable"

## Saturday 3th November, 2018

amreus

[12:44](#msg5bdd98364775f53eb3352530)In Red functions, the order of refinements must determine the order of the arguments? Seems obvious but just asking.

rebolek

[12:45](#msg5bdd98625760a73eb430e3e3)@amreus yes. If you change order of refinements, you need to change order of args also.

SutherlandSM

[23:49](#msg5bde3407995818347b9bee17)@greggirwin Does anybody know how to access multiple result sets through and ODBC port on REBOL. Been searching for a while. I am able to iterate through them in VBA, but not so far with REBOL. Copy just returns the first result set.

## Sunday 4th November, 2018

greggirwin

[19:52](#msg5bdf4e0e538a1c19717314e6)@amreus to be clear, it's the order of refinements \*at call time\*, not in the func spec.

[19:53](#msg5bdf4e36995818347ba2604a)@SutherlandSM that part of my brain is too dusty. I didn't use ODBC much from R2.

GiuseppeChillemi

[19:55](#msg5bdf4ea3076992347ab71c31)@SutherlandSM , which ODBC protocol/library are you using ?

## Monday 5th November, 2018

SutherlandSM

[19:48](#msg5be09e8b25b9875faedb38f1)@GiuseppeChillemi To connect I just open the following port using the SQL Server driver:  
connection-port: open [  
scheme: 'odbc  
target: "driver={SQL Server};server=(local);database=Research\_NEVADA;trusted\_connection=true"  
]

gltewalt

[22:51](#msg5be0c95bcdc12d25bb7ad746)latest nightly still breaks GUI Console on `reverse 1.2.3.4`

[22:51](#msg5be0c977cdc12d25bb7ad86f)CLI is fine

## Tuesday 6th November, 2018

9214

[00:13](#msg5be0dc939088fe25bc67eb94)@gltewalt have you reported it?

gltewalt

[00:17](#msg5be0ddaa6200995df141582e)No i though it was still an existing ticket. (But this mobile thing wont follow the link)

[01:13](#msg5be0eac3da57ff676c98ee3d)(Yep. " qtxie added this to the 0.6.4 milestone on Aug 5")

## Wednesday 7th November, 2018

guraaku

[10:02](#msg5be2b81c7a36913a9a04acf3)Hi, wondering about Language Server Protocol support for Red - is that something that could happen ?

rebolek

[10:05](#msg5be2b8f19600d10e64708083)@guraaku if some volunteer writes it, then it will happen. But it's not priority for Red team.

guraaku

[10:06](#msg5be2b928bb887874748ed37f)I guess ir's a lot of work......... !

rebolek

[12:19](#msg5be2d8664e7ca145206a3636)If somebody really needs such feature, I believe they're willing to spend time on it.

endo64

[15:34](#msg5be306127326df140ecc11a1)&gt; latest nightly still breaks GUI Console on `reverse 1.2.3.4`

@gltewalt Confirmed. Is there a ticket for it?

gltewalt

[18:53](#msg5be334bbe8add80e63b7f637)Looks like #3379

SutherlandSM

[19:01](#msg5be3366d7a36913a9a081b8f)@endo64 Nice. Thanks for this. I have put Red exploration on hiatus until I finish this prototype in R2. But would really like to move over as soon as it makes sense.

## Thursday 8th November, 2018

lpvm

[12:43](#msg5be42f86f1b875340493ba51)Hi, what is the state of reading https files? Is TLS implemented? Or do you use any kind of intermediary to do that?

rebolek

[12:44](#msg5be42fb76b9822140dfa7a4e)@lpvm Hi, HTTPS is fully working:

```
>> read https://rebolek.com
== {<html>^/<head>^/^-<title>Rebolek's page</title>^/^-<meta charset="UTF-8">^/^-<link rel="stylesheet" type="text/css" href="css/main.css">^/^-<link href="https://fonts.googleapis.com/css...
```

lpvm

[12:50](#msg5be4312ef1b875340493c7b6)Great! Another thing. I saw an example of what seems dynamic content in a web server :point\_up: \[31 de outubro de 2018 13:02](https://gitter.im/red/red?at=5bd9a7f55760a73eb41765aa)

[12:51](#msg5be43149bb88787474983146)what can one do at this stage?

rebolek

[12:53](#msg5be431e0bb06d73a9940b515)It's dynamic content in a web page that is viewable using @toomasv's Tinybrowser only. I don't think that he implemented some kind restrictions, so theoretically `call "rm -rf /"` is possible :smile:

lpvm

[12:54](#msg5be431f49600d10e6479cb91)oohhh

rebolek

[12:54](#msg5be43209c0e6da07fef3a1a9)It's just demo, so it's kind of expected.

toomasv

[12:56](#msg5be43288f1b875340493d521)There is no security whatever in this demo :exclamation:

lpvm

[12:57](#msg5be432a7bb06d73a9940bb25)yeah! Great exercise, though!

[12:59](#msg5be4333a3102f145216c425e)Another thing I need is to scrape some data generated by javascript. Is there a way to connect to PhantomJS or equivalent?

rebolek

[13:27](#msg5be439c3bb88787474986234)I'm not familiar with PhantomJS. If there's some way to access it from outside, Red should be able to connect to it I guess.

lpvm

[13:40](#msg5be43cdf4e7ca1452073384e)@rebolek I can't wait for Red to be complete to move all my work to it.

rebolek

[13:43](#msg5be43d6ee8add80e63be5ee8):thumbsup:

[13:43](#msg5be43d7c6b9822140dfad70b)@lpvm what parts are you missing?

lpvm

[13:44](#msg5be43dc7c0e6da07fef3f2d8)send email for one, with support for TLS

## Saturday 10th November, 2018

Palaing

[10:02](#msg5be6ac9d6b9822140d0a3723)I've been using build red-02oct18-c00c57b1.exe for some time on Windows 10 without any problem.  
Yesterday following (seemingly) a bug, I tried red-08nov18-06ddce9e.exe . It ran once, then no more. And red-02oct18-c00c57b1.exe stopped running too. That seemed to be related to AVG's "sandbox" (running newly compiled file in a secure environment while checking it). So I completely uninstalled AVG, cleaned related registry entries, no way: GUI console is compiled, but does not launch.  
Only the latest official build red-063.exe still works. Any hint?

xqlab

[11:08](#msg5be6bc379600d10e6489e1ce)does red --cli work? Do you see the Red Gui Console in the Task Manager ? Then search console-cfg.red in the file manager and delete it

Palaing

[11:30](#msg5be6c149c0e6da07fe03e2d5)No, gui-console-2018-11-8-26777.exe returns immediately. It does not create anconsole-cfg.red file.

9214

[13:28](#msg5be6dd0462866f7473793f03)@Palaing purge `ProgramData\Red` (a hidden folder), download fresh toolchain binary and try again.

bitbegin

[13:30](#msg5be6dd5b2138723405e58ca2)should be this folder `C:\Users\bitbegin\AppData\Roaming\Red`, delete it

9214

[13:31](#msg5be6dd967326df140ee43299)@bitbegin nope, actually `C:\ProgramData\Red`.

[13:31](#msg5be6dda862866f7473794491)`Roaming\Red` contains only config file and local caches, which are harmless.

bitbegin

[13:41](#msg5be6e01662866f74737951f5)ok

Palaing

[15:34](#msg5be6fa916b9822140d0c072d)@9214 I did that too. Deleted C:\\ProgramData\\Red ; dowloaded binary again.  
\- red-063.exe compiles and runs OK, after I told Windows Defender it's no malware

[15:36](#msg5be6fb067326df140ee4f4e2)- red-08nov18-06ddce9e.exe compiles OK but does not run, whether I try to launch it or directly gui-console-2018-11-8-26777.exe

9214

[15:39](#msg5be6fbc89600d10e648b6bb8)@Palaing are you sure that all binaries are whitelisted?

[16:00](#msg5be700a447217e07ffff5e39)@Palaing exclude all Red-related directories from AV scanning/sandboxing/whatever and try again. I can't reproduce this issue on my machine.

[16:01](#msg5be700eef1b8753404a5a35e)There's also a wise saying: "7 troubles - 1 hard reset" :wink:

Palaing

[16:19](#msg5be704f9f1b8753404a5bc9e)@9214 Thanks, I appreciate your help.  
I actually tried several times, including: deleting C:\\ProgramData\\Red, rebooting, totally disabling (wifi and) AV, and starting again (with fresh binaries, SHA-256 checked):  
\- red-08nov18-06ddce9e.exe -&gt; compiles, cli does not launch.  
\- red-063.exe -&gt; compiles and launches cli OK.  
As the previous automatic build stopped working, and the 08nov18 one also stopped yesterday after working for a while, it's like something (windows update?) changed that makes recent versions crash. I don't know how to get a log / diagnose the crash...  
Thanks very much for your help, don't loose more time with this unless it helps Red development: I'll stick with red-063 for the moment.

9214

[16:26](#msg5be706b2bb88787474aa3ce1)@Palaing does the console binary (`gui-console-.exe`) appear in `ProgramData/Red` folder after compilation?

[16:26](#msg5be706c53102f145217e8704)No worries. Let us know once this problem is resolved.

Palaing

[16:27](#msg5be706e5d001b917203c4560)Yes I have the console binary (gui-console-&lt;date&gt;.exe) and also the associated DLL (crush-2018-11-8-26777.dll) appear in ProgramData/Red folder

[16:28](#msg5be70720bb06d73a99527d5d)Actually for some reason I forgot, I used to launch directly that binary instead of the downloaded exe.

[16:28](#msg5be70738f1b8753404a5cac7)now when I double-click it nothing happens

9214

[16:31](#msg5be707e87a36913a9a200738)@Palaing can you explicitly exclude this particular console executable from AV scanner and launch it as an admin?

Palaing

[16:32](#msg5be7082a9600d10e648bb782)I tried that - same result

[16:33](#msg5be70856bb88787474aa497b)(both the gui-console-2018-11-8-26777.exe file and its folder are in AV's exclusion list)

[16:44](#msg5be70b08bb88787474aa5910)@9214 Thanks anyway. I'll try these gui-console-2018-11-8-26777.exe and crush-2018-11-8-26777.dll files on another machine when I can, to see if error comes from compilation or execution environment.

## Sunday 11st November, 2018

BeardPower

[13:42](#msg5be831c36b9822140d132873)@endo64 @rebolek Any ETA on the release of group photos and videos?

endo64

[16:46](#msg5be85d034e7ca145208cdef8)@BeardPower I've uploaded my videos for Gregg to review, after that we can publish them.

BeardPower

[17:39](#msg5be8696d3102f1452186a220)@endo64 Thanks!

rebolek

[21:10](#msg5be89acc47217e07ff08e9fc)@BeardPower I'm wainting for @greggirwin to send me slides so I can put them to my videos.

[21:12](#msg5be89b356b9822140d15c7a7)That's for Nenad's and Gregg's presentation. Mine so awful that I'm going to do this planet a favour and not publish it.

9214

[21:12](#msg5be89b5892b7d1172173b62a)Oh c'mon.

BeardPower

[21:13](#msg5be89b7bd001b9172045ce31)@rebolek Thanks!

[21:13](#msg5be89b80bb88787474b3a791)Yeah, c'mon!

## Monday 12nd November, 2018

greggirwin

[21:59](#msg5be9f7dabb88787474bbf3c7)@rebolek's presentation was really cool, IMO. We'll work on getting things reviewed, edited, and posted, but some patience is needed.

[22:01](#msg5be9f84fd001b917204e501a) We'll get Nenad's slides, and I'll formalize my blockchain cron notes into something more presentable as well.

9214

[22:02](#msg5be9f85ebb88787474bbf778)I second that. Witnessed @rebolek's presentation firsthand, and it was a \[life changing experience](https://www.youtube.com/watch?v=uwmeH6Rnj2E).

## Tuesday 13th November, 2018

virtualAlan

[00:15](#msg5bea17b56b9822140d1eeb6f)Been a bit busy recently with other things, but have added a few more examples that might be useful ....  
Here: http://www.mycode4fun.co.uk/About-Red-Programming  
And here: http://www.mycode4fun.co.uk/red-beginners-reference-guide  
Regards .... Alan.

greggirwin

[00:45](#msg5bea1ec262866f74738ce7be)Thanks @virtualAlan !

Ungaretti

[07:46](#msg5bea81414e7ca1452099e701)Thanks indeed!! @virtualAlan

BeardPower

[11:49](#msg5beaba5b2138723405fd3385)@9214 Doo-Nee-Eee!

toomasv

[12:22](#msg5beac21162866f747390c54b)"ree-boo-lek! ree-boo-lek! we-want-your-slides! we-want-your-slides!"

rebolek

[12:23](#msg5beac22b2138723405fd6486)@toomasv You were there. You know I had no slides.

toomasv

[12:23](#msg5beac24a62866f747390c736)Video then. I have bad memory :flushed: But I remember it was fascinating!

rebolek

[12:26](#msg5beac301bb06d73a99693ee0):) You really have bad memory, it wasn't fascinating :)

toomasv

[12:27](#msg5beac31ce0fd6b4360e7c120)You see! Of course! It was terrific!

rebolek

[12:28](#msg5beac36efee6703aaf63c7d1)well it was just shitty tech demo

toomasv

[12:29](#msg5beac39ffee6703aaf63c961)C'mon (again)

rebolek

[12:31](#msg5beac4086b9822140d22f4cb)If I post it, it will be last video certainly, because I have to record my console session.

[12:32](#msg5beac444f1b8753404bc83fb)Otherwise the video wouldn't make any sense.

toomasv

[12:35](#msg5beac513fee6703aaf63d29d)Ready to wait. Take your time.

## Thursday 15th November, 2018

lpvm

[00:32](#msg5becbe9e47217e07ff22c3a1)I'd like to compile Red from sources in FreeBSD, where can I find instructions for that?

gltewalt

[00:39](#msg5becc02547217e07ff22cedd)https://github.com/red/red/blob/master/README.md

[00:40](#msg5becc068bb88787474cde379)Under the section “Running Red from the sources (for contributors)”, I believe

greggirwin

[01:04](#msg5becc632fee6703aaf70b3c6)And you'll have to report the state of affairs on FreeBSD, as it's not actively developed and supported by the team at this time.

gltewalt

[04:04](#msg5becf0627326df140e09d5d6)@Palaing Sounds like the AV has some of the .exe file names in quarantine. Clear out the AVs quarantine directory

[04:06](#msg5becf0b16b9822140d30b422)The exclusion list sometimes doesn’t matter if the file name is already in quarantine

[04:13](#msg5becf2627326df140e09e7c6)Click “Remove” on step 4

https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-antivirus/restore-quarantined-files-windows-defender-antivirus

lpvm

[11:12](#msg5bed548e92b7d117219127c7)@greggirwin The compilation on my FreeBSD 11.2 machine came to an error:

[11:12](#msg5bed549321387234050dd04a)

```
Compiling to native code...
*** Driver Internal Error: Script Error : Invalid path value: red/image/push 
*** Where: process 
*** Near:  [spec: copy/deep functions/:name/4
```

[11:12](#msg5bed54bb7a36913a9a46e37c)Have to give up, then.

greggirwin

[16:47](#msg5beda33f21387234050febf1)Likely that image support hasn't been added to that platform backend.

Palaing

[22:09](#msg5bedee9dd001b9172067c0cd)@gltewalt Thanks. It must be something like that but I emptied the quarantine folder and it still does not work. The gui-console exe is OK though (tested elsewhere). I'm giving up for now.

## Saturday 17th November, 2018

TheOnlyArtz

[09:19](#msg5befdd062ef5b06e407cfb47)Hey!

rebolek

[09:19](#msg5befdd1580652945c3767415)Hey

TheOnlyArtz

[09:19](#msg5befdd1addad8777ef79855c)I was wondering if there's a websocket client for Red

rebolek

[09:19](#msg5befdd3ab86c70503f447d8a)After Red gets full IO support in 0.7.0, it would be possible, but there's no one yet.

TheOnlyArtz

[09:20](#msg5befdd4280652945c3767568):(

[09:20](#msg5befdd4c1ad4155d3ada6795)Ok thank you !

viayuve

[09:21](#msg5befddaa061f2e6bbb7f2fcb)in 2019 around June or July may be full io based on guesstimate.

TheOnlyArtz

[09:27](#msg5befdeff9f5a9e6e41fb64b6)oof, that will take some time

viayuve

[09:32](#msg5befe0124bad337eb9f232e2)yes look at red time line here https://trello.com/b/FlQ6pzdB/red-tasks-overview

TheOnlyArtz

[09:34](#msg5befe0c04bad337eb9f2373d)The last activity was couple of months ago (Trello)

viayuve

[09:36](#msg5befe11d9f5a9e6e41fb6d32)yes its a list only keep track, for full project activity https://github.com/red/red

TheOnlyArtz

[09:47](#msg5befe3c62735965dfeec4065)So what can I do with Red? in general.

endo64

[12:42](#msg5bf00cbd1ad4155d3adb8d8c)@TheOnlyArtz Many things, like UIs, parsing, DSLs. Question is what do you want to do? :)

[12:43](#msg5bf00cef2735965dfeed43d8)Check /code repo, @toomasv gists, https://gist.github.com/toomasv and other useful stuff from wiki pages.

9214

[13:15](#msg5bf014674720c11e0e7ed9ff)@TheOnlyArtz depends on what you are capable of, in general.

[13:23](#msg5bf016394720c11e0e7ee4a3)@viayuve on what metrics your highly speculative estimate is based upon, if I may ask?

greggirwin

[18:56](#msg5bf06465a47c6c5d3bff5046)@TheOnlyArtz if you read through the entries at red-lang.org, you can see a lot of examples. We have basic I/O, which lets you do a lot, but low level (full I/O) is slated for 0.7.0, as was said. We'd love to estimate delivery dates, but have to roll with the punches, which makes that nearly impossible. As we're still Alpha, Red is great for experimenting, learning, and thinking in new ways, but stable enough for a lot of real work too. 0.6.4 will make the GC official, but automated builds have it already, which makes a lot of things easier to not worry about. :^)

The best thing to do is try it out, and see if you like it. It's different in many ways, and not for everyone.

lpvm

[22:53](#msg5bf09bfc9f5a9e6e41ffe5c1)Is there an updated Vim plugin for Red? I have an old one for Rebol.

## Sunday 18th November, 2018

greggirwin

[02:52](#msg5bf0d3f55f5c92504074eb78)I don't believe so.

gltewalt

[03:42](#msg5bf0df964720c11e0e838d23)Someone did some work about a year ago...

[03:42](#msg5bf0dfae80652945c37c6fc9)https://github.com/DavidFeng/vim-red

lpvm

[16:02](#msg5bf18d0f4720c11e0e8778b5)Great!

## Monday 19th November, 2018

viayuve

[07:01](#msg5bf25fd12ef5b06e408bd828)@9214 idunoMatrix

lpvm

[16:12](#msg5bf2e0e080652945c388624d)

```
f: func [d /local sum] [foreach digit d [print digit]]
>> f "17"
1
7
>> g: func [d /local sum] [sum: 0 foreach digit d [sum: sum + to-integer digit]]
>> g "17"
== 104
```

[16:13](#msg5bf2e1131ad4155d3aec992d)why does not `g "17"` return 8?

ne1uno

[16:17](#msg5bf2e22a9f5a9e6e410d8a97)@lpvm `to-integer to-string digit` or `to-integer digit - 48` since digit is `char!`

lpvm

[16:19](#msg5bf2e2762ef5b06e408f6179)@ne1uno There's an implicit conversion in `f` then?

ne1uno

[16:20](#msg5bf2e2e7f9993b426734996f)try `print [type? digit]`

lpvm

[16:21](#msg5bf2e31c1665691e0fcb5971)thanks!

ne1uno

[16:22](#msg5bf2e33e4bad337eb904a0f4)I guess it's not quite like splitting a string

lpvm

[17:48](#msg5bf2f77b2735965dfefeff6f)Regarding `view` documentation, I'd like to know the logic on how to use the documentation to build an example. For example, regarding `drop-list`. https://doc.red-lang.org/en/view.html#\_drop\_list

[17:49](#msg5bf2f7a12ef5b06e408feea3)As facets, there are `type`, `data`, `selected`.

[17:50](#msg5bf2f7f3b86c70503f574191)how can I use these? `view [ size 400x300 d: drop-list ["1"]]` can't seem to show `1` when the drop-list is clicked.

toomasv

[18:17](#msg5bf2fe512735965dfeff2f71)Put block of strings in data- these appear in drop-list. `on-select` and `on-change` actors fire on selection of new item. E.g. `view [drop-list data [“one” “two” “three”] on-change [print [face/selected pic face/data face/selected]]]`

[18:18](#msg5bf2fe794720c11e0e90a815)On phone now, somewhat restricted.

[18:19](#msg5bf2febb1665691e0fcc1987)`pick`

lpvm

[18:20](#msg5bf2fee5951402310a72122a)The list `["one" "two" "three"]` doesn't show up

[18:22](#msg5bf2ff6a80652945c38947f9)if it works fine for you, is it maybe my version fault? I'm using the 17th of November build.

toomasv

[18:23](#msg5bf2ffa84720c11e0e90afb0)Should work with any version. Did you copy paste it?

lpvm

[18:24](#msg5bf2ffebf9993b42673572af)yes, corrected the pic to `pick`. This is the code I tried: `view [drop-list data [“one” “two” “three”] on-change [print [face/selected pic face/data face/selected]]]`

toomasv

[18:26](#msg5bf300402ef5b06e40902bf0)I tried, and with `pick` it works

lpvm

[18:26](#msg5bf300694bad337eb9056f5d)is your build from the 17th of November?

toomasv

[18:27](#msg5bf3008d80e46b4266d87658)8th Nov

lpvm

[18:32](#msg5bf301b59f5a9e6e410e69f9)wold like to try that build but can't find it

9214

[18:34](#msg5bf30227951402310a722804)@lpvm `“one”` is not the same as `"one"`.

toomasv

[18:34](#msg5bf3024c951402310a7228f5):smile:

lpvm

[18:35](#msg5bf3026080e46b4266d88440):-)

[18:36](#msg5bf302a82ef5b06e40903840)You know, I have to use a remote windows session, as I'm in Linux, and the clipboard seems to modify the each `"` to that symbol when I paste it in Windows session.

rebolek

[18:38](#msg5bf3031980652945c3896199)I feel your pain 🐧

lpvm

[18:42](#msg5bf304071665691e0fcc3f2a)GUI is a new thing to me @toomasv . Hope to learn some tricks from you and your examples I've seen.

[18:44](#msg5bf3048ca47c6c5d3b0f898c)@rebolek Yes , the other pain is that I could not neither compile nor cross-compile to FreeBSD. Would like to parse some PF logs to update my spam table. `$ red_linux -t FreeBSD -c -r pf_log.red` returns:

```
Target: FreeBSD 
Compiling to native code...
*** Loading Error: file access error: %platform/freebsd.reds 
*** in file: %/home/lupe/prog/rebol_red/freebsd/tools.reds
```

toomasv

[18:45](#msg5bf304bef9993b4267359200):+1: Feel free to ask for explanations if needed. I am lazy in commenting between lines :flushed:

[18:49](#msg5bf305d12735965dfeff6269)It seems wrong quotes slipped in from my phone

rebolek

[18:52](#msg5bf306699f5a9e6e410e8d36)@lpvm There are no active FreeBSD users AFAIK, so bug reports will be very appreciated. One thing is doing whole GUI subsystem and another thing is fixing few bugs that prevent Red from running on/compiling for FreeBSD, as it's supported platform.

lpvm

[18:52](#msg5bf3067e6183a977eee17870)No problem. It also happened to me for some Linux conf file as I copy pasted a line from a site and the initramfs files could not start. The worst part is that one can loose a lot of time going after these errors.

rebolek

[18:54](#msg5bf306ce6183a977eee179f5)I may try to install FreeBSD VM and check the build.

lpvm

[18:55](#msg5bf307334720c11e0e90e49d)@rebolek Ok, it's just that I tried compiling a simple `print "Hello"`, so no simpler could it be. But if it can be corrected, please tell me, is https://github.com/red/red/issues the place to raise the issue? Or some other specific place?

[18:57](#msg5bf307b5ddad8777ef8cacf2)You can count me as one active user for the FreeBSD platform from now on!

rebolek

[18:58](#msg5bf307db2735965dfeff7345)@lpvm Yes, https://github.com/red/red/issues is the right place.

[19:00](#msg5bf3085980e46b4266d8ad09)@lpvm Cool, so I will add FreeBSD as a target for my \[automated builds](https://rebolek.com/builds/) :smile:

lpvm

[19:08](#msg5bf30a23a47c6c5d3b0faee8)Issue already raised.

[19:10](#msg5bf30aa180e46b4266d8bcc0)@rebolek You have linux and rpi gui builds?!

rebolek

[19:12](#msg5bf30b0b1665691e0fcc6b4a)@lpvm these builds are from latest GTK branch version

[19:13](#msg5bf30b63ddad8777ef8cca0f)and latest update in GTK branch is from 22.4, so it's pretty old branch.

lpvm

[19:15](#msg5bf30bb64bad337eb905c08e)ok, I'll wait for a new recent one. Have many things to use cli scripts in Linux and FreeBSD.

[21:30](#msg5bf32b675f5c925040837717)

```
>> big: make block! 1000000000

*** Runtime Error 1: access violation
*** at: 0805D348h
```

rebolek

[21:30](#msg5bf32b861ad4155d3aee8bcc)I believe there's an issue for that

lpvm

[21:30](#msg5bf32b8b4720c11e0e91d0d2)was trying to test speed `block` vs `vector`, but both fail when provisioning for a billion.

[21:31](#msg5bf32bafddad8777ef8da429)ok

## Tuesday 20th November, 2018

lpvm

[16:19](#msg5bf4341b5f5c9250408a2376)How to check for a valid date? Using `try` and `attempt`:

```
>> try [date? a: 29-02-2019]
*** Script Error: cannot MAKE/TO date! from: [day month year]
*** Where: do
*** Stack: load 
>> attempt [date? a: 29-02-2019]
*** Script Error: cannot MAKE/TO date! from: [day month year]
*** Where: do
*** Stack: load
```

greggirwin

[20:14](#msg5bf46b37f59704348ed8f98e)@lpvm you can see that the error comes in `load`ing the value, which is separate from evaluation (that `attempt` will catch). `attempt/safer` also doesn't catch it. A couple alternatives:

```
>> attempt [make date! [2019 02 29]]
== none
```

```
>> load/trap "date? a: 29-02-2019"
== [[date? a:] "29-02-2019" make error! [
    code: 349
    type: 'script
    id: 'bad-to-arg
    arg1: date!
    arg2: [d...
```

There can be a bigger discussion on loadability and literal values, if needed.

endo64

[21:51](#msg5bf481d7e25cc27405191cf7)@lpvm `29-02-2019` should be loaded correctly, if it comes from a file or similar external source then it will be a string, hence you can catch:

```
>> attempt [date? a: load "29-02-2019"]
== none
>> attempt [date? a: load "22-02-2019"]
== true
```

lpvm

[23:04](#msg5bf49317ced7003fe15d0dac)Thank you for the explanation and the solution @greggirwin and @endo64 . I think I've never used `load` for strings before. As a general rule, for strings, when should `load` be used?

## Wednesday 21st November, 2018

greggirwin

[00:05](#msg5bf4a147cfa682348d5aaac8)`Load` is a safe operation, even on untrusted data, though we should always test and ensure that. All it should do is transcode a string of data (text or binary) into Red values. Anytime you get user input (including from other devs in extensible systems), it's going to be in one of those forms. That makes `load` your first friend in dialect processing, because then you can `parse` at the block level.

With Red, there is almost never a single way to do things, as with some other langs. `load/trap` is really powerful, in that you can tell whether an error occurred at all, and point people to the problem. Much easier than trying to do all the parsing on the string yourself.

[00:05](#msg5bf4a15bed6bcf1ef835070a)It can also be incorporated in tools, to syntax check on the fly.

endo64

[06:51](#msg5bf50063958fc53895c5e430)@lpvm When you `load` a string you will have a block of values, those values are words (like `my-word`, `print`, `:call`, `tuple!`) and literals (like `42`, `"my strig"`, `1.2.3.4`, `0.5`, `some@one.com` etc.), and the words in your loaded block can either have values as well, for example `print` is a word with a function (native) value, and `tuple!` is a word that has a value of a `datatype!`.

So you can execute (evaluate) your loaded block (if you trust it), or parse it, or use that block to create values in your script (like a configuration file etc.)

```
>> load "print [3 * 5 some@one.com]"
== [print [3 * 5 some@one.com]]   ; here we have a block with words & values only, two words print and *, two literals 3 and 5, and one another literal which is an email
>> do load "print [3 * 5 some@one.com]"
>> do "print [3 * 5 some@one.com]"
15 some@one.com   ; do without load also loads the string (or file) before evaluating 

>> load "a: 1 b: 2"
== [a: 1 b: 2]   ;just two words a: & b:, and two literals 1 & 2, doesn't mean anything without a further process like parsing or evaluating
>> construct load "a: 1 b: 2"
== make object! [
    a: 1
    b: 2
]  ; now we have something more useful
```

So loadable strings are more valuable then ordinary strings :)

lpvm

[14:16](#msg5bf568a6fa7bbb3fe0dfdecc)Thank you both for these very nice and complementary explanations!

novvorto\_twitter

[15:19](#msg5bf5779fed6bcf1ef83a35c4)`to-date "31-3-2018"` hasn't working since the offcial release of version 0.6.3?  
`load "31-3-2018"` works though.

toomasv

[15:59](#msg5bf580d2d24f9324d22f75c4)@novvorto\_twitter Use this :smile: :

```
to-date1: func [value][
    to-date switch type?/word :value [
        string! [if find value dot [replace/all value dot space] load value] 
        block! [value] 
        object! map! [reduce [value/year value/month value/day]]
]]
to-date1 "2-12-2000"
;== 2-Dec-2000
to-date1 "2000/12/2"
;== 2-Dec-2000
to-date1 "2.12.2000"
;== 2-Dec-2000
to-date1 #(year: 2000 month: 12 day: 31)
;== 31-Dec-2000
to-date1 [2 12 2000]
;== 2-Dec-2000
```

greggirwin

[17:13](#msg5bf59222b6c07010526655ef)@novvorto\_twitter that is an intentional design choice (for now). Feel free to add a note to https://github.com/red/red/wiki/%5BDOC%5D-%60to%60-vs-%60make%60.

## Friday 23th November, 2018

justjenny

[01:58](#msg5bf75ecbed6bcf1ef8467558)Hi, just got the new Red-064.exe - but whats's the difference from Red-063.exe or red-062.exe - What's the point of a new version without some docs. show us/ tell us the new features. Love what you all do - keep up the excellent work. Jenny.

rebolek

[06:46](#msg5bf7a24ab6c0701052738be2)@justjenny Hi, I see it's on red-lang.org, I think that a blog post will follow very soon, probably the download page was updated a bit sooner than it should :)

justjenny

[13:04](#msg5bf7facdbaf43f2b9b5fd220)@rebolek thanks, will keep looking, I need to find more time for Red, love it.

rebolek

[13:05](#msg5bf7fb36e25cc274052f2bfe)@justjenny to answer you question what's the difference - beside bugfixes, mainly the introduction of garbage collector, that's the biggest feature, I believe.

greggirwin

[17:36](#msg5bf83aa9958fc53895da7f3d)@justjenny nice to see you again. Yes, a new blog post is coming. With 1'116 commits in this release, there's a lot. As @rebolek the GC is the big one, and that is really huge for people, because now you can write long-running processes and not have to manually manage series to keep memory use from growing.

[17:40](#msg5bf83b9c662131389408997c)We wanted to get the binaries out, and an updated bincheck, so there is no turning back. You can always scan git commits to see if there are any messages related to things that affect you.

## Saturday 24th November, 2018

justjenny

[00:23](#msg5bf89a10cfa682348d743c41)@rebolek @greggirwin thanks, yes of course memory management is important. hope to learn more and add more to my blog soon - Red is moving forward nicely - congratulations to everyone for their epic work, We Redusers love and appreciate it. Jenny.

Palaing

[15:27](#msg5bf96dcdbaf43f2b9b68ce76)Excited about trying Red-064.exe . Unfortunately, like previous automated builds, it compiles into a gui-console-xxx.exe but that file won't launch the console (though it will, if copied, on another machine). I Tried everything: check/clean quarantine, completely deactivate virus scanning and delete C:\\ProgramData\\Red before compiling. Red-064.exe compiles but console does not run. Red-063.exe still compiles and runs. Just as if my PC had some dll compatibility issue with the recent version(s). Any hint ?

## Sunday 25th November, 2018

dsgeyser

[10:24](#msg5bfa7854f048fa10511d7e74)@rebolek Are you going to make the editor available as a commercial offering?

rebolek

[15:35](#msg5bfac13fcfa682348d8139a6)@dsgeyser commercial? I'm not sure if anybody's going to pay for it.

dsgeyser

[17:33](#msg5bfadcd9ced7003fe1844059)@rebolek Is it available online? This also could possibly be used as a great Red learning tool with a few added features.

rebolek

[17:34](#msg5bfadd1bf59704348e0140cc)@dsgeyser yeah, it's available, I don't advertise it very much, until I add built-in interactive help-

dsgeyser

[17:42](#msg5bfadeeacfa682348d81f3e7)@rebolek I'm intrigued by all the possibilities your editor has. Any chance of a peek... I really want to play with it. Maybe also provide a few suggestions from my standpoint.

rebolek

[17:44](#msg5bfadf6e6621313894189e10)@dsgeyser you can get it from https://gitlab.com/rebolek/values . To run it, `do %values.red` and then `ve`.

[17:44](#msg5bfadf7ced6bcf1ef85baf20)Then you are on your own :smile:

[17:45](#msg5bfadfc1e25cc27405407e00)I recommend to open a script with `:lscript.red`, check its structure with `vs`, take a look at some function with eg. `vfenumerate`.

[17:46](#msg5bfadfe487c4b86bcc16a276)Here's some help https://gitlab.com/rebolek/values/blob/master/help.md

dsgeyser

[17:50](#msg5bfae0f6cfa682348d81ffe8)@rebolek Thanks. I'll do as to what was suggested in an animation film: "Just keep swimming..."

rebolek

[18:54](#msg5bfaf002baf43f2b9b71ed7e)@dsgeyser :-) That, or you can ask me :)

DarrellBrogdon

[19:42](#msg5bfafb1aed6bcf1ef85c64ed)Hi all. I'm watching the video from RedCon and I'm wondering if the slides are available for download anywhere?

endo64

[21:19](#msg5bfb11ef662131389419e4a9)@DarrellBrogdon Slides are not yet available @greggirwin is working on it.

## Monday 26th November, 2018

Valpal41

[01:16](#msg5bfb495966213138941b2b4d)just found Red. nice language. am enjoying learning about it.

endo64

[06:20](#msg5bfb90b3f048fa1051241004)@Valpal41 Welcome! Do not hesitate to ask your questions here.

Valpal41

[13:17](#msg5bfbf2667074b903685a731a)thanks @endo64

[23:35](#msg5bfc8351ed6bcf1ef8665530)I found this site: it is the best one i have found for a new Red programmer - very helpful - I'm learning a lot from it: not sure who knows about it, but a top rate siter: http://helpin.red/Homepage.html

## Tuesday 27th November, 2018

dander

[00:14](#msg5bfc8c52b6c0701052924a46)@Valpal41 yeah, that is a great intro guide. There is a reference to it, among other useful links \[here](https://github.com/red/red/wiki/%5BLINKS%5D-Unofficial-Tutorials-and-Resources)

Valpal41

[00:29](#msg5bfc8fe787c4b86bcc217c28)@dander thanks, will take a look at the others - there's more help than i thought or expected with such a new language. this is great.

dander

[00:45](#msg5bfc938cd24f9324d25b6ff5)@Valpal41 have fun! 😊

Valpal41

[01:10](#msg5bfc997bf048fa10512b0221)omg - just looked on http://www.mycode4fun.co.uk/About-Red-Programming - and the rest of this site - this is unreal - I mean what can be done with Red is great.

Ungaretti

[09:30](#msg5bfd0eacbaf43f2b9b7f35e4)@Valpal41 Welcome! You will find that the community here is very active and supporting.

lpvm

[12:02](#msg5bfd3249f849b222e0b00426)When will we get Red in the top ten? https://houseofbots.com/news-detail/4118-1-top-10-most-popular-iot-programming-languages-in-2018-19

9214

[12:42](#msg5bfd3bbdf59704348e107f88)Only professional business analyst can answer that type of questions with a straight face.

lpvm

[15:54](#msg5bfd68c07074b90368640551)In View, when using `drop-list` there's no scroll bar. As I need to present a user with one hundred possibilities, is there a way to do this? `text-list` has the scroll bar, but the list is not contracted when a line is selected.

ne1uno

[16:45](#msg5bfd74c6baf43f2b9b81eaa0)you can drag with the mouse or use arrow keys to select, another problem is not being able to limit the dropdown window size

toomasv

[16:48](#msg5bfd754da115c91ef7a04f11)@lpvm Use `scrollable` flag:

```
items: repeat i 100 [append [] rejoin ["Item " i]]
view [drop-list with [flags: 'scrollable] data items]
```

Same for `drop-down`. I think it is not documented yet.

greggirwin

[17:46](#msg5bfd82f77d26db1e83055ecd)@gltewalt, would you add that flag to the docs?

lpvm

[17:47](#msg5bfd832bd24f9324d2616056)Thanks @toomasv !

toomasv

[17:47](#msg5bfd833ad24f9324d2616065)@lpvm You are welcome!

gltewalt

[17:48](#msg5bfd836c7d26db1e83056258)‘Scrollable?

toomasv

[17:49](#msg5bfd83bce25cc27405517182)@gltewalt `'` not `‘`

greggirwin

[17:52](#msg5bfd844f7074b9036864c3f3)@gltewalt yes.

gltewalt

[18:46](#msg5bfd90f9e25cc2740551d6cd)Which section(s) @greggirwin ? drop-list, text-list, drop-down?

## Wednesday 28th November, 2018

greggirwin

[02:49](#msg5bfe022cd24f9324d264821e)All that apply. I don't have time to test right now.

toomasv

[04:10](#msg5bfe154cf59704348e1624e5)@gltewalt `text-list` does not need it, even if it accepts if specified. Other faces accept it too, but not all are showing scrollers. And those which are showing (e.g. `panel`, `rich-text`, `text`) need to specify `on-scroll` actor, and how to manipulate scroller face with its specific facets is undocumented too. So, I think for those we need to wait some explanation.

But for `drop-list` and `drop-down` it works out of the box. (On W10 at least. I have no info on other platforms.)

gltewalt

[04:21](#msg5bfe17dfe25cc2740555146c)Ok

ne1uno

[04:22](#msg5bfe17f0ced7003fe198d9fc)drop-list seems to work as described win7

innitheblindsw

[12:18](#msg5bfe87b0ed6bcf1ef8730a19)Hi everybody. Is posible connect to pop3 or imap of a email using ssl en RED?  
I have a idea or proyect from control my server using email messages.

rebolek

[12:19](#msg5bfe87d0b6c07010529ec787)Hi @innitheblindsw! Not yet, unfortunately, this will come with 0.7

innitheblindsw

[12:20](#msg5bfe8801d24f9324d267bbac)Thanks. That was quick

[12:21](#msg5bfe8835ced7003fe19ba4fc)Thanks and Merry Christmas\\

rebolek

[12:21](#msg5bfe88386621313894300ad3)@innitheblindsw simple question, quick answer :)

innitheblindsw

[12:22](#msg5bfe8888f048fa1051375f42)Gracias a todo el equipo de desarrollo de RED por la nueva versión.

[12:22](#msg5bfe889bcb32736b29a7c970)Sorry.

[12:22](#msg5bfe889c7074b903686b2f0d)Thanks to the entire RED development team for the new version.

DarrellBrogdon

[16:46](#msg5bfec6537d26db1e830d848c)@endo64 Thanks for the reply. And apologies for the late response. I got so busy I forgot I had asked!

## Thursday 29th November, 2018

lpvm

[13:54](#msg5bffef87cb32736b29b0bac0)In Rebol, I got an example of a `menu` bar:

```
menu-Options: ["About..." [alert "This menu is just a choice button widget :)"]
m1: menu-list "Options" 170 with [menu: menu-Options]
```

Reading the documentation can't find a way to implement a `menu` in Red.

9214

[13:56](#msg5bfff01ba115c91ef7affe70)

```
text
view/options [box red][menu: ["a" ["b" "c"]]]
```

[13:57](#msg5bfff02ea115c91ef7affea9)https://doc.red-lang.org/en/view.html#\_window

lpvm

[13:59](#msg5bfff0a6f849b222e0c1af61)I don't know yet how to read that documentation. For example, why is there `view/options` and not `window` as in the title of the section?

9214

[14:00](#msg5bfff0edd24f9324d270f48a)Because window is a top-most container for other faces. And you should really learn about virtual tree of faces first.

lpvm

[14:09](#msg5bfff326e25cc2740560d4ff)That code opens a window with a menu, fine, thanks. ButI have a `layout` block. How to integrate that menu with that block?

9214

[14:10](#msg5bfff350cb32736b29b0d370)Not sure what you mean by that.

lpvm

[14:12](#msg5bfff3c3ced7003fe1a48cdb)It's done, sorry, just misunderstanding from my part.

[15:22](#msg5c00042bd24f9324d2717849)I'm looking at `environment/console/GUI/gui-console.red` from sources.  
For assigning an action to a menu choice do I need to create a separate `actor` function or can I do it in a simpler way?

9214

[15:36](#msg5c0007877d26db1e83157873)@lpvm if we are talking about window menu, then you should extend `actor` facet with `on-menu` event handler. For other faces specifying `on-menu` handler in VID block should be enough.

lpvm

[15:42](#msg5c0008d8a115c91ef7b0a2ef)I agree with you that I have to really learn what is said in the documentation. But where is it said `on-menu` in the documentation of `view` or `VID`? Is it implicit?

9214

[15:43](#msg5c000928cfa682348da38abf)https://doc.red-lang.org/en/view.html#\_events

[15:44](#msg5c000940662131389439e53e)Specifically p. 11.3

lpvm

[15:46](#msg5c0009e07d26db1e83158c0d)Thank you. It's implicit! I'll have to print view and VID on paper to cut, write and make some diagrams! :-)

9214

[15:47](#msg5c000a09b6c0701052a88b4b)&gt; It's implicit!

Again, not sure what you mean by that. All info in View/VID documentation is explicit.

toomasv

[15:50](#msg5c000ad8f59704348e22ce9a)@lpvm I something like this what you want?:

```
lay: layout/options [
   on-menu [
      switch event/picked [
         open [probe "opening..."] 
         save [probe "saving..."]
]]][
   menu: ["File" ["Open" open "Save" save]]
]
view lay
```

9214

[15:55](#msg5c000be67074b9036874f719)@toomasv you can just go with `view/options [on-menu ...][menu: ...]`.

toomasv

[15:57](#msg5c000c7acfa682348da3a827)@9214 Yes, of course. But I understood @lpvm asked specifically about `layout`.

lpvm

[16:03](#msg5c000dccced7003fe1a53c28)@toomasv for now yes, it is! For me it's a lot easier to have some examples and then re-read the documentation. Thanks.

9214

[16:03](#msg5c000dee958fc538950b6941)@lpvm https://github.com/red/red/wiki/\[LINKS]-Learning-resources

toomasv

[16:06](#msg5c000e9de25cc274056197f1)@lpvm You are welcome!

lpvm

[16:07](#msg5c000eb1ed6bcf1ef87cf3c2)@9214 Yes, I know about those resources, but the ones I've searched had nothing about placing menus.

toomasv

[16:12](#msg5c000fffcfa682348da3bd93)@lpvm So you can add contextual (right-click) menu to a face:

```
view [
   area "some words here" 
   with [menu: ["Show" show]] 
   on-menu [switch event/picked [
      show [probe face/text]
   ]]
]
```

lpvm

[16:16](#msg5c0010d7f849b222e0c28933)Nice!. I read about the `popup` keyword to create contextual menus, but my attempt was not successful

9214

[16:19](#msg5c0011aeb6c0701052a8c087)

```
text
view/options [][menu: [popup "a" a "b" b]]
```

toomasv

[16:21](#msg5c0011edcb32736b29b1b30b)@lpvm `popup` is for creating a right-click menu for window.

lpvm

[16:23](#msg5c0012978dffd748db007a0a)Understood. These little examples are gold!

## Friday 30th November, 2018

Palaing

[21:14](#msg5c01a849c4af6856da687323)@9214 FYI - following our discussion: all recent versions of Red windows binary would compile properly on my PC, but the produced gui-console-xxx.exe would not run, though it would run on another machine. I felt more an more frustrated... until today: version red-29nov18-95481b0a.exe compiled and the console showed up! Hallelujah. Don't ask me why.

9214

[21:15](#msg5c01a88c464b6c0fd66f795b)Cosmic rays, I presume.

[21:17](#msg5c01a8dc99ad1556dbe7d966)https://github.com/red/red/issues/3617 ?

Palaing

[21:21](#msg5c01a9ee6c3c565096b3a821)@9214 Maybe! Now my old gui-console versions do launch again too. How could I miss that? I thought I had made all possible tests, including with a console-cfg.red file left from an old, working version...

dander

[21:36](#msg5c01ad566c3c565096b3bdaf) @Palaing did you rule out cranky AV?

Palaing

[21:38](#msg5c01add98fa4333e391c4cc2)@dander I think I did - though the AV was messing things up at the beginning. I uninstalled / deactivated AV, emptied quarantine, even cleaned related entries in registry...

## Sunday 2nd December, 2018

novvorto\_twitter

[13:30](#msg5c03de80e827492525883d2d)

```
Red []

number: [num-pair]
num-pair: [real-pair | int-pair]
;num-pair: [int-pair | real-pair]
int-pair:[ 0 1 op int]
real-pair:[ 0 1 op real]
op: ["+" | "-"]
int: [some digit]
real: [
    some digit
    "."
    some digit 
]
digit: charset "0123456789"

print parse "12.2-1.2+1-1.2" [some num-pair] print "---"
print parse "12+123-12.34" [some num-pair] print "---"
print parse "-12+123-12.34" [some num-pair] print "---"
```

With `num-pair: [real-pair | int-pair]`, prints  
true  
true  
true  
With `num-pair: [int-pair | real-pair]`, prints  
false  
false  
false  
Switching the sequence of checking makes a different. What is the logic behind this?

9214

[13:35](#msg5c03dfa9c4af6856da7556cf)@novvorto\_twitter Parse rules are left-recursive and greedy. Meaning: the first rules always goes first, and if it can match, then it will match as much as it can.

In your example with `[int-pair | real-pair]`, for instance, `12` is recognized as an integer, and after that parsing fails, as there's nothing that can match `.2`.

[13:37](#msg5c03e00299ad1556dbf4d7d6)Basically, whenever you reach a real number it will fail, because integer part is consumed my `int-pair` rule, and decimal part cannot be matched because of leading `.`.

[13:40](#msg5c03e0c4c4af6856da755f48)

```
text
digit:   charset [#"0" - #"9"]
sign:    charset "+-"

integer: [opt sign some digit]
real:    [integer dot some digit]
number:  [real | integer]

foreach test [
    "12.2-1.2+1-1.2"
    "12+123-12.34"
    "-12+123-12.34"
][
    probe parse test [some number]
]
```

novvorto\_twitter

[13:45](#msg5c03e1e7bc1a693e3a4411b8)I get it. Thanks

olivier\_lp\_twitter

[17:45](#msg5c041a406c3c565096c1f333)Hi, i m using rebol as a sceipting language on windows, a function I like is Use which is a native function. In red no such function at the moment. Has someone got one, i thought use: func \[d b /local f] \[f: func append copy \[/local] d b f]

9214

[17:48](#msg5c041b096c3c565096c1f6cf)

```
text
use: func [locals body][
    do bind/copy body context collect [
        forall locals [keep to set-word! locals/1]
        keep none
    ]
]
```

olivier\_lp\_twitter

[17:53](#msg5c041c2f9aec405095b734f9)@9214 thanx, i m gonna test it, i dont well understand collect/keep

[17:58](#msg5c041d55500e8e37284c1621)I was a bit upset by the red parse function as it s not working with a string as input, but i saw there is a split function which does the work, pretty well (a char can be the delimiter :-) ) except if the delimiter is a case sensitive string... more and more interesting this language

9214

[17:59](#msg5c041d719aec405095b73d40)&gt; I was a bit upset by the red parse function as it s not working with a string as input

Nonsense.

olivier\_lp\_twitter

[18:02](#msg5c041e1b500e8e37284c1ab7)My bad, a string as rule

9214

[18:03](#msg5c041e5f464b6c0fd67de27e)@olivier\_lp\_twitter use `split` with `bitset!` as delimiter for that.

[18:03](#msg5c041e7cc4af6856da76e530)R2:

```
>> parse "abcdef" "ac"
== ["" "b" "def"]
```

Red:

```
>> split "abcdef" charset "ac"
== ["" "b" "def"]
```

olivier\_lp\_twitter

[18:12](#msg5c04208c43c68b3727ebceaf)@9214 yes bitset works fine for multiple char delimiter, but you can use a string as delimiter (in rebol it s less friendly), split "abcdAbcd" "ab" is not case sensitive. With bitset it s case sensitive, my bad is just that there is a use not well done, but not so use

[18:35](#msg5c0425fe8fa4333e392af5ec)@9214 do u have a size? Function which work for big files (upper than 2\*\*32) ? In red as in rebol it s the 2\*\*32 modulo which is return (integer), i made so long to understand why sometimes i was up to 300 % progressing

lpvm

[21:38](#msg5c0450d743c68b3727ed09b7)`for` doesn't seem to be implemented in `Red`. Is this a final decision or will we get a similar version to the Rebol's one?

9214

[21:38](#msg5c0450f01c439034af0a8e62)@lpvm https://github.com/red/REP/issues/6

lpvm

[21:42](#msg5c0451c99f38cc0fd59531cc)Thanks @9214 . To compare two strings place by place I was thinking on `for`. I'll use another loop construct then.

9214

[21:42](#msg5c0451e09f38cc0fd595322b)@lpvm just recently I used `forall` for that.

olivier\_lp\_twitter

[21:56](#msg5c0454f5e8274925258b4090)@lpvm for in rebol is function, the code is working on red, juste the money! type to be put off

## Monday 3th December, 2018

lpvm

[14:24](#msg5c053c9bbe66d825266dc7e3)In the webpage https://www.red-lang.org/search?q=parse where is said "Creating a simple parser for a subset of HTML", how is the output produced?

rebolek

[14:25](#msg5c053ce9e82749252590ce46)@lpvm with the `parse` function.

lpvm

[14:35](#msg5c053f1d99ad1556dbfd63af)Is that example complete?

rebolek

[14:37](#msg5c053f9e48d021555ae537dc) @lpvm of course, you can copy/paste it to console and you'll get same result as shown on web.

lpvm

[14:40](#msg5c0540783f503110361bdb4e)I've copied and pasted, just added the header, but nothing prints.

rebolek

[14:46](#msg5c0541b2a6c29a1037d8d240) @lpvm That's strange, I've tried it right now and works fine:

```
>>     html: {
{            <html>
{                <head><title>Test</title></head>
{                <body><div><u>Hello</u> <b>World</b></div></body>
{            </html>
{        }
== {^/        <html>^/            <head><title>Test</title></head>^/            <body><div><u>Hello</u> <b>World</b></div></body>^/        </html>^/    }
>> 
>>     ws: charset reduce [space tab cr lf]
== make bitset! #{0064000080}
>> 
>>     parse html tags: [
[            collect [any [
[                ws
[                | "</" thru ">" break
[                | "<" copy name to ">" skip keep (load name) opt tags
[                | keep to "<"
[            ]]
[        ]
== [html [head [title [
    "Test"
]] body [div [u [
    "Hello"
] b [
    "World"
]]]]]
```

viayuve

[14:48](#msg5c05422a99ad1556dbfd7a2b)&gt;&gt; html: {  
{ &lt;html&gt;  
{ &lt;head&gt;&lt;title&gt;Test&lt;/title&gt;&lt;/head&gt;  
{ &lt;body&gt;&lt;div&gt;&lt;u&gt;Hello&lt;/u&gt; &lt;b&gt;World&lt;/b&gt;&lt;/div&gt;&lt;/body&gt;  
{ &lt;/html&gt;  
{ }  
\== {^/ &lt;html&gt;^/ &lt;head&gt;&lt;title&gt;Test&lt;/title&gt;&lt;/head&gt;^/ ...  
&gt;&gt;  
&gt;&gt; ws: charset reduce \[space tab cr lf]  
\== make bitset! #{0064000080}  
&gt;&gt;  
&gt;&gt; parse html tags: [  
[ collect [any [  
[ ws  
[ | "&lt;/" thru "&gt;" break  
[ | "&lt;" copy name to "&gt;" skip keep (load name) opt tags  
[ | keep to "&lt;"  
\[ ]]  
\[ ]  
\== [html [head [title [  
"Test"  
]] body [div [u [  
"Hello"  
] b ...

[14:49](#msg5c05427d464b6c0fd684d5cc)works

lpvm

[14:49](#msg5c0542961c439034af104b98)In the command line works

viayuve

[14:50](#msg5c0542ade82749252590f4cd)yes

lpvm

[14:51](#msg5c0542e543c68b3727f2e0c5)but as a script?

rebolek

[14:52](#msg5c05432dbc1a693e3a4cb3aa)

```
>> do %delme.red
== [html [head [title [
    "Test"
]] body [div [u [
    "Hello"
] b [
    "World"
]]]]]
```

[14:52](#msg5c054334bc1a693e3a4cb3b3)It's the same

lpvm

[14:55](#msg5c0543fabe66d825266dfd53)If you create script like https://gist.github.com/lpvm/45e3a656e1de97b2913d8e0b29db89b4

[14:56](#msg5c0544221c439034af10570b)how to output the result of parse?

rebolek

[14:56](#msg5c0544251c439034af105710)That's exactly how my script looks.

[14:56](#msg5c054433a6c29a1037d8ea7d)with `probe` for example.

viayuve

[14:57](#msg5c054447e82749252591024e)I think he need to put output in block and use print to print out at end

lpvm

[15:00](#msg5c0545099f38cc0fd59b1566)When I run that script as `red parse.red` nothing is printed. `probe` tags prints the rules block. But not the output shown in the wepage or in the cli.

rebolek

[15:00](#msg5c054523464b6c0fd684eb1d)`probe parse ...`

[15:01](#msg5c05452c6c3c565096c94c5f)`parse` returns collected output

lpvm

[15:02](#msg5c05457e6c3c565096c94e6a)now worked, before it did not, not sure why. Thanks!

[15:03](#msg5c0545b2c4af6856da7debbc)`tags` is there only for recursive purposes?

rebolek

[15:03](#msg5c0545c8464b6c0fd684ef80)yeah, it's recursive rule, so needs some name

viayuve

[15:13](#msg5c054820e827492525911c96)@lpvm bookmark this when you try to learn new examples http://www.red-by-example.org/

[15:13](#msg5c05482e8fa4333e39320e70)it helped me a lot

lpvm

[15:14](#msg5c05486fc4af6856da7e01bb)I've been there several times, but many items are marked as `To do by red-by-example team ...`

viayuve

[15:16](#msg5c0548c3c4af6856da7e05c4)yes I know ... than try this in google instead of red "rebol "your query""

[15:17](#msg5c0548f099ad1556dbfdb7ac)they have lot of examples and many thing works out of the box. not everything....

[15:17](#msg5c0549268fa4333e39321338)it is still great help for me.

[15:18](#msg5c054954464b6c0fd6850bee)Also when you stuck ask away that's what I did 😆

[15:19](#msg5c054994e827492525912543)and still doing it.... ;-)

lpvm

[15:24](#msg5c054aaa43c68b3727f31a45)I'll follow your advice. I'm solving the puzzles of \[Advent of Code 2018](https://adventofcode.com/2018).

[15:24](#msg5c054ac4c4af6856da7e19e0)for `input-txt: "#102 @ 1,3:^/"`

[15:25](#msg5c054b049aec405095be6bb9)`parse input-txt [any [thru "#" copy nr to space break]]` although `nr` gets the number correctly, `parse` returns `false`. What's wrong with my rule?

rebolek

[15:32](#msg5c054c946c3c565096c9857d)Your rule is fine, but does not match end. Parse returns true only when your rule sucessfully matched end.

[15:33](#msg5c054cbabe66d825266e3dd2)So either add `to end` or ignore the return value.

lpvm

[15:34](#msg5c054cff3f503110361c3cc7)thought `break` had that meaning but it's meant to exit control loops

[16:39](#msg5c055c5b8fa4333e3932a30d)Now, to insert the matched parts into a block. I've built this simple example: https://gist.github.com/lpvm/77780cb47fc8ef9281ce6188260ccbc2

[16:40](#msg5c055c979aec405095beeec3)`l` and `r` (left and right of `#`) are parsed right, but neither parse traversed the second line nor are values inserted in `b`.

9214

[16:41](#msg5c055caa9aec405095beeef8)@lpvm well, maybe that's because you don't insert anything in `b`?

[16:41](#msg5c055cbcbc1a693e3a4d791a)And don't iterate over the whole string?

[16:43](#msg5c055d316c3c565096c9fbe1)

```
text
>> split "1#11^/2#22^/" charset "#^/"
== ["1" "11" "2" "22" ""]
```

lpvm

[16:43](#msg5c055d36a6c29a1037d9a695)Tried `[append b copy l ...` didn't work, either.

9214

[16:43](#msg5c055d451c439034af111266)@lpvm have you read Parse documentation?

lpvm

[16:45](#msg5c055db63f503110361ca8a1)Yes. This is a minimal example, I still need the parse instead of the split, although I can use split first and then the parse for each line afterwards.

9214

[16:46](#msg5c055dd78fa4333e3932af66)

```
text
>> parse "1#11^/2#22^/" [collect some [keep to "#" skip keep to newline skip]]
== [#"1" "11" #"2" "22"]
```

[16:46](#msg5c055de3bc1a693e3a4d84f8)What's the problem you're trying to solve, once again?

lpvm

[16:51](#msg5c055f259f38cc0fd59bdb83)some are parsed as `char!` some as `string!`. Interesting. How would you do to get this result: `[[#"1" "11"] [#"2" "22"]]`?

9214

[16:53](#msg5c055f71be66d825266eb849)

```
text
>> parse "1#11^/2#22^/" [collect some collect [keep to "#" skip keep to newline skip]]
== [[#"1" "11"] [#"2" "22"]]
```

[16:55](#msg5c055fea8fa4333e3932be50)Ah, I see, it's AoC No. 3.

lpvm

[16:56](#msg5c056037bc1a693e3a4d959d)Yes, I'm trying to improve my skills on Red to jump to a bigger project.

9214

[17:19](#msg5c0565b4e82749252591e6c0)@lpvm I would suggest to put away Parse for a moment, as I don't think that 3/1 really requires it.

lpvm

[18:31](#msg5c05766d9f38cc0fd59c827a)@9214 From the parse \[blog](https://www.red-lang.org/search?q=parse), it's said that `collect` should be followed by a block of some rule `[rule]`. Is this correct? I'm asking this because you used `collect some`, not `collect [some`

9214

[18:34](#msg5c05773499ad1556dbfef76c)@lpvm you can wrap rule in a block if you want to, it won't change anything.

lpvm

[18:43](#msg5c057965500e8e37285498c0)You saved my day! Now, I'm ready to solve the puzzle. The solution is in my head already, parsing the input was the most difficult part. Thanks!

9214

[18:47](#msg5c057a4ec4af6856da7f6b63)@lpvm you're welcome. As I said, Parse isn't really necessary here. You can always process string using native functions, even if it looks naive.

greggirwin

[18:49](#msg5c057ab9e8274925259283a3)On red-by-example, @mikeparr is the current lead there, but anyone can contribute new entries. Just work with him on the process. I'm sure he'll be happy to get some help.

lpvm

[18:50](#msg5c057af03f503110361d7130)Yes, but being more comfortable with `parse` is also important to me.

9214

[18:51](#msg5c057b1c464b6c0fd6866495)@lpvm ok, but don't forget about baby steps.

[18:57](#msg5c057c848fa4333e3933967f):baby: ( :neckbeard: )

```
>> load replace form split "#123 @ 3,2: 5x4" complement charset [#"0" - #"9" ",x#"] comma 'x
== [#123 3x2 5x4]
```

greggirwin

[19:04](#msg5c057e489f38cc0fd59cb0ec)@9214 :+1: (baby steps)

GiuseppeChillemi

[20:27](#msg5c0591b3464b6c0fd686fbe3)@9214

&gt; thought `break` had that meaning but it's meant to exit control loops

That's the "prior knowledge" concept which is working here... ;-)

## Tuesday 4th December, 2018

rpherman

[12:33](#msg5c0674056c3c565096d0e98b)I've tried compiling a redCV example shape.red, however, it says the zlib1.dll is missing. It's there, but is this a 32-bit vs. 64-bit issue? I am on Win 64-bit machine. Thanks.

[12:40](#msg5c0675a8bc1a693e3a5474a3)I should add it compiles, and this is the message on double clicking the shape.exe file.

lpvm

[14:03](#msg5c0689329f38cc0fd5a3192e)Why does this need partenthesis? `put singles cl-id (select singles cl-id) + 1`, since evaluation is left to right.

rebolek

[14:04](#msg5c0689646c3c565096d181f1)Because `select` function will evaluate its arguments first

lpvm

[14:06](#msg5c0689da9aec405095c66ae3)arguments, plural? `? select` says `value` (singular) as second argument...

rebolek

[14:06](#msg5c0689fc464b6c0fd68cf47f)Yeah, but `select` takes two arguments.

[14:07](#msg5c068a3c500e8e37285b61ca)And if you leave parenthesis out, `select` sees `select singles cl-id + 1`, which is `select (singles) (cl-id + 1)`.

lpvm

[14:08](#msg5c068a68bc1a693e3a5506db)yes, I know, that's why I asked. `+` takes precedence, then.

9214

[14:10](#msg5c068ad9e827492525993ec9)Operators have precedence over functions. Functions take as much expressions as they need, operators take one value on the left and one expression on the right.

lpvm

[14:11](#msg5c068b239f38cc0fd5a32499)It's explained, thank you both.

[14:13](#msg5c068b82464b6c0fd68cff03)Found it in the Rebol \[user's guide](http://www.rebol.com/docs/core23/rebolcore-11.html)

[15:58](#msg5c06a4436c3c565096d24606)Can't figure out what's the problem with this:

```
input-txt: ["[1518-02-24 "]
shift-date: [thru "[" keep to space to end]
shifts: parse input-txt [collect some collect [shift-date skip]]
probe shifts
== [[]]
```

9214

[16:00](#msg5c06a49ba6c29a1037e1fa4f)@lpvm are you sure that `input-txt` should be a block?

lpvm

[16:01](#msg5c06a4d99aec405095c71c6e)Yes, that's the result of a `read/lines %input.txt`

9214

[16:01](#msg5c06a4f0c4af6856da86cbb4)Why then do you parse block as if it's a string?

[16:03](#msg5c06a56599ad1556db066f24)

```
text
>> parse ["[1518-02-24 " "[123-45-6 "][collect some [into [thru "[" keep to space skip]]]
== ["1518-02-24" "123-45-6"]
```

[16:04](#msg5c06a5901c439034af195be0)Again, step aside from Parse. You don't need it to extract something between `[` and ` `.

lpvm

[16:05](#msg5c06a5c848d021555aee1fbe)`into`, alright. Could `mold` it as well, right?

9214

[16:05](#msg5c06a5d748d021555aee2035)`mold` what?

lpvm

[16:07](#msg5c06a65f43c68b3727fbdc1d)`mold` the block, so that it becomes a string. Did it and it works.

9214

[16:08](#msg5c06a687464b6c0fd68dc241)... why then use `read/lines` if you instantly convert block back to string?

lpvm

[16:12](#msg5c06a7561c439034af196832)I'll explain it. For day 04 of AoC, I had the parse working fine for each line, after using `read` to import the input. Except that the input was not sorted. Had to use `read/lines` to then `sort`it. That's where the block took the place of the string.  
Now that things are in chronological order, as some lines are dependent (need information) on a line that is above, I can parse it and complete some lines with values of a previous line. `into` or `mold` do the job.  
Thanks both of you.

[16:34](#msg5c06ac8d9aec405095c758d8)Now, one step ahead. The first expression is parsed correctly, but the following are not.

```
input-txt: ["[1518-02-24 23:58] Guard #853 begins shift" "[1518-02-25 00:20] falls asleep" "[1518-02-25 00:43] wakes up"]
digit: charset "0123456789"
shift-date: [thru "[" keep to space skip keep to "]" skip]
action: ["Guard #" copy guard keep some digit keep (7) thru {"} | "falls asleep" keep (load guard) keep (0) | "wakes up" keep (load guard) keep
(1)]
rule: [collect some collect [into [shift-date space action skip opt txt]]]
shifts: parse input-txt txt: rule
```

Added the `txt:` before rule and added `opt txt` to `rule` but it's not working.

9214

[16:37](#msg5c06ad40500e8e37285c5b47)

```
text
>> load/next "[1518-02-24 23:58] Guard #853 begins shift" 'rest
== [24-Feb-1518 23:58:00]
```

Boom. Done. Unless you purposedly complicate your life by using Parse.

lpvm

[16:46](#msg5c06af599f38cc0fd5a42672)I want to use the guard number for the lines that don't have it, that's why I'm using Parse. The other reason is to become more proficient on it.

9214

[16:47](#msg5c06afbbc4af6856da871926)I don't think that me solving your problems will make you more proficient. :wink:

[17:01](#msg5c06b2f9bc1a693e3a563470)

```
text
input: [
    "[1518-02-24 23:58] Guard #853 begins shift"
    "[1518-02-25 00:20] falls asleep"
    "[1518-02-25 00:43] wakes up"
]

actions: [begins falls wakes]

forall input [
    probe parse load input/1 [
        collect [
            into [keep pick to end]
            [thru set ID keep issue! | keep (ID)]
            set action skip keep (index? find actions action)  
        ]
    ]
]
```

toomasv

[17:08](#msg5c06b4741c439034af19cabd)Why not `load` it at once? It is all Red types.

9214

[17:08](#msg5c06b495e8274925259a7ae8)@toomasv dunno.

toomasv

[17:10](#msg5c06b509500e8e37285c96ae)E.g.:

```
input: load %day4.input
data: parse input [
	collect some [
		ahead block! into [keep date! keep time!] 
	| 	keep [issue! | 'wakes | 'asleep] 
	| 	skip
	]
]
; == [22-Apr-1518 0:56:00 asleep 23-Jul-1518 0:09:00 asleep...]
```

9214

[17:11](#msg5c06b549464b6c0fd68e2d0f)

```
text
input: load {
    [1518-02-24 23:58] Guard #853 begins shift
    [1518-02-25 00:20] falls asleep
    [1518-02-25 00:43] wakes up
}

actions: [begins falls wakes]

probe new-line/all parse input [
    collect some collect [
        into [keep pick to end]
        opt [thru set ID issue!] keep (load form ID)
        set action skip keep (index? find actions action) skip
    ]
] on
```

[17:12](#msg5c06b586e8274925259a8230)

```
text
[
    [24-Feb-1518 23:58:00 853 1]
    [25-Feb-1518 0:20:00 853 2]
    [25-Feb-1518 0:43:00 853 3]
]
```

toomasv

[17:21](#msg5c06b79e43c68b3727fc55a3)From flat representation it is easy to sort/pick things, but not hard from deep structures also, of course.

lpvm

[23:47](#msg5c071228178d7860a186bb85)@9214 I don't want you to solve my problems. If I needed to solve it, would just use some Unix tool to sort the input and parse it with the rules defined before. Or just solve everything in awk.  
Just want to learn Red and Parse, so nothing better to see some different examples and understand them.  
There are some things I don't understand yet in your and @toomasv examples, but I'll have some hours of sleep before returning to the examples.

## Wednesday 5th December, 2018

greggirwin

[01:13](#msg5c07263e8d4f3a2a7c6ff493)&gt; I've tried compiling a redCV example shape.red, however, it says the zlib1.dll is missing.

@rpherman, I haven't built redCV in a while. With luck @ldci will show up and answer. The DLL needs to be where the EXE can find it, e.g. in a system path or the same dir as the exe.

virtualAlan

[01:22](#msg5c072847f992693c7a22715b)Hi, not found a decent slideshow viewer for red yet, so did this one: http://www.mycode4fun.co.uk/About-Red-Programming also a more advanced script here: http://www.mycode4fun.co.uk/example-scripts regards Alan.

[01:23](#msg5c0728aff992693c7a2272dd)sorry, it's 'example 46' - so need to scroll down a ways ....

greggirwin

[05:55](#msg5c0768538d4f3a2a7c717d2b)Thanks Alan!

OneITI

[07:15](#msg5c077b00e4787d16e3495be8)Hello.

[07:15](#msg5c077b2b8b656e2b04c582e8)I am a high school student, highly interested in open-source culture and Red project itself.

[07:16](#msg5c077b3df992693c7a245c00)I would like to contribute to Red project sincerely.

endo64

[07:28](#msg5c077e01f992693c7a247180)@OneITI Welcome! First step is reading some docs :)  
https://www.red-lang.org/p/contributions.html  
https://github.com/red/red/wiki  
https://github.com/red/red/wiki/%5BLINKS%5D-Learning-resources

And don't hesitate to ask you questions here and in the /help room

OneITI

[07:29](#msg5c077e478336e22a7de358c6)Okay, thank you for your genial welcome. I think this project is actually congenial to me.

[07:29](#msg5c077e5811bb5b2504666ece)I have a little question of Red's camera function.

[07:30](#msg5c077e7b28907a3c7bce3580)I have tried the camera face in this article; http://helpin.red/Faces.html

[07:31](#msg5c077ee411bb5b25046672cf)I have compiled the second source code, which enables a button to save the current stream as a jpeg-format file.

[07:32](#msg5c077f06630ddb19d437f716)However, the saved image files are nothing but an immaculately white.

[07:33](#msg5c077f394808192b03e9698d)I consider this to be a bug regarding the image process or binary file output.

[07:34](#msg5c077f865e40952503193cbf)Moreover, my operating system is macOS High Sierra(10.13.6), and I am utilizing Red 0.6.3 with the Visual Studio Code(1.29.1) plugin.

9214

[07:42](#msg5c07817711bb5b250466847c)Perhaps you should update to the latest version first, before pointing out bugs.

[07:43](#msg5c0781aef4880a60a22c1232)And there's certainly no need in double posting your questions in different rooms.

greggirwin

[08:30](#msg5c078ca128907a3c7bce9922)Welcome @OneITI!

Palaing

[09:27](#msg5c079a068336e22a7de40dc8)wrong syntax, but the error message is weird too:

```
>> 1 < 2 or 2 > 3
*** Script Error: < does not allow integer! for its value2 argument
*** Where: <
*** Stack:
```

toomasv

[10:05](#msg5c07a2e88d4f3a2a7c730f94)Should be `Error: or does not allow...`  
Somehow op in message is not updated?

rebolek

[10:06](#msg5c07a30b28907a3c7bcf33bd)but `or` allows `integer!`

toomasv

[10:06](#msg5c07a32711bb5b2504675f02)

```
>> true or 3
*** Script Error: or does not allow integer! for its value2 argument
```

rebolek

[10:06](#msg5c07a3418336e22a7de45171)Yeah, but

```
>> 2 or 3
== 3
```

[10:07](#msg5c07a35811bb5b2504676047)The error message probably should say something like `incompatible values`

toomasv

[10:07](#msg5c07a36c11bb5b2504676157)Yes

[10:08](#msg5c07a3aff4880a60a22cf2d3)Can you explain treatment of integers by `or` and `and`?

rebolek

[10:09](#msg5c07a3de8d4f3a2a7c73185e)@toomasv like in C.

[10:09](#msg5c07a3e711bb5b25046764b4)`1 or 2 -> 3`

[10:09](#msg5c07a3f4f4880a60a22cf458)in binary: `01 or 10 -> 11`

toomasv

[10:14](#msg5c07a4fa8b656e2b04c6a40d)Ok, thanks!

codenoid

[11:21](#msg5c07b4b680986419d541c731)hi

[11:21](#msg5c07b4b8f4880a60a22d6bd4)how it's goig

[11:21](#msg5c07b4ba1e86c308232ce902)going

rebolek

[11:21](#msg5c07b4c8f4880a60a22d6c88)Hi @codenoid

9214

[11:21](#msg5c07b4d31e86c308232ce943)Infix logic operators dispatch on leftmost (rightmost?) operand, so IMO this is an expected error message.

rebolek

[11:24](#msg5c07b55bf992693c7a25f951)If I compare R2 and Red:

```
>> 1 < 2 or 2 > 3
*** Script Error: < does not allow integer! for its value2 argument
*** Where: <
*** Stack:
```

vs

```
>> 1 < 2 or 2 > 3
** Script Error: Expected one of: logic! - not: integer!
** Near: 1 < 2 or 2
```

Rebol message seems to make more sense

9214

[11:24](#msg5c07b56b8d4f3a2a7c7393b1)Agreed.

lpvm

[12:06](#msg5c07bf4511bb5b2504681ced)@9214 Hi, regarding the solution you've presented yesterday, there's something I don't understand.  
What I've seen and done is `... into [rules]`. You've built something like `... into [one rule] [another rule] third rule` and the third rule is not in a block.  
Another thing is the first block of rules `[keep pick to end]`. I \[read](https://www.red-lang.org/2017/03/062-libred-and-macros.html) something about `pick` in `parse` context, but could never arrive at such formulation by myself based solely on that.  
Would you mind explaining all this?

9214

[12:09](#msg5c07c0041e86c308232d3b55)Can you elaborate on "not a block" part? As for `pick`, see \[here](https://github.com/red/red/wiki/\[DOC]-Guru-Meditations#parse-collectkeep-options-combined-with-tothru-rules). It basically collects matched values one-by-one instead of collecting matched group as a "unity".

lpvm

[12:31](#msg5c07c534f992693c7a266b25)It's getting more clear, now, but yet not fully bright...  
You've build `into [keep pick to end]`. To play with this, I tried `into [keep pick to ":" to end]` if the minute part of the time was not important. But returns `[]`.

[12:32](#msg5c07c55880986419d54236ce)Shouldn't it return everything up to the hour part?

9214

[12:33](#msg5c07c584f4880a60a22de82a)

```
text
>> parse ["123:456"][collect [into [keep pick to ":" to end]]]
== [#"1" #"2" #"3"]
>> parse ["123:456"][collect [into [keep to ":" to end]]]
== ["123"]
```

lpvm

[12:44](#msg5c07c81c5e409525031b349f)Taking your previous example:

```
input: [
    "[1518-02-24 23:58] Guard #853 begins shift"
    "[1518-02-25 00:20] falls asleep"
    "[1518-02-25 00:43] wakes up"
]

forall input [
    probe parse load input/1 [
        collect [
            into [keep pick to ":"  to end ]                    ;  inserting `to ":"`
            [thru set ID keep issue! | keep (ID)]
            set action skip keep (index? find actions action)

        ]
    ]
]
==  []
```

9214

[12:44](#msg5c07c8383de4e816e212c3bc)How can it work if you just `load`ed the string?

lpvm

[12:48](#msg5c07c927f992693c7a2684ee)Fine, skipped that one. Thank you for your time, patience and overall help @9214

9214

[12:50](#msg5c07c9a75e409525031b3e5e)@lpvm no problem, have fun. :wink:

lpvm

[12:52](#msg5c07ca018d4f3a2a7c7414e0)Spot on, that's really my thrive at this phase on my life!

toomasv

[12:57](#msg5c07cb4511bb5b2504686da6)What structure did you choose for representing/gathering Day4 data?

lpvm

[12:59](#msg5c07cbab8336e22a7de55d0b)Hi @toomasv I haven't yet studied your code proposal and haven't choose any yet.

## Saturday 8th December, 2018

olivier\_lp\_twitter

[22:01](#msg5c0c3f208b656e2b04e3d9c2)Is a multitasking or multithreading implementation planned ?

9214

[22:02](#msg5c0c3f685e4095250337adab)@olivier\_lp\_twitter \[consult the roadmap](https://trello.com/b/FlQ6pzdB/red-tasks-overview).

olivier\_lp\_twitter

[22:17](#msg5c0c42fa3de4e816e22f2fe7)@9214 thanx, i got my answer :-)

## Sunday 9th December, 2018

rpherman

[15:42](#msg5c0d38031e86c308234f6517)@greggirwin I put the DLL in the same folder as the executable. I think it is a 32 bit / 64 bit issue. I am running 64 bit Red, and I saw a snippet about redCV being 32 bit.

9214

[21:25](#msg5c0d882d4808192b030f3e51)@rpherman there's no 64-bit Red.

## Wednesday 12nd December, 2018

Senenmut

[18:06](#msg5c114e1d8d4f3a2a7cafe47b)Hi there. winter + time = programmingtime ### May i ask for news about the compiling of a android .apk executable program file in red ? Are there any news ? Pleased to share them here. ## signed by The barbarian programmer ##

9214

[18:09](#msg5c114ee3178d7860a1c767dc)@Mennohexo read \[the latest blog post](https://www.red-lang.org/), esp. P.6:

&gt; Android will come after Full I/O

Senenmut

[18:18](#msg5c1150dd33d9e11991c0d009)oh that's great news. thanks. The only tool right now is RFO Basic but they have a little slowdown in development , however it still works. Noone wants to load hundreds of MB and install a shop of hocus pokus like the official java android solution is. ha ## To professional programming frames slow down production ideas. Is my view. Few other think too. ##BP

[18:27](#msg5c1152ff8b656e2b0403d1ad)i mean the dangerous programmer named : iArnold

[18:31](#msg5c1153e95e4095250357d55c)ok. its a programmers joke. really. Thanks and see you again here. Regards BP

rpherman

[20:55](#msg5c1175a711bb5b2504a574ab)@9214 Thanks about pointing out there is no 64-bit Red! There are no beginner RedCV instructions on what you need to do to set it up. I am familiar with OpenCV in Python, but I am lost in knowing what I need to compile and how and where to put things in the folder structure in order for this to work. Thanks again!

Senenmut

[22:35](#msg5c118d193de4e816e250d30b)You can develop modern android apps with win XP. #Its possible. Anyway , a little bit like barbarian.

luis-rj

[23:23](#msg5c119883f992693c7a65277b) @rpherman this post might be useful : http://redlcv.blogspot.com/2017/12/red-and-opencv-find-faces-in-image.html

## Thursday 13th December, 2018

9214

[07:01](#msg5c1203c1178d7860a1cbd91f)@rpherman, perhaps @ldci can chime in and help with your issue. Instructions are pretty straightforward, it's a missing DLL that causes the trouble.

## Friday 14th December, 2018

phrmoy

[03:15](#msg5c132040ca317a0e25c36c37)wow 0.6.4!

[03:15](#msg5c13205a0a86bc6f8da4f572)do we expect v1.0 by 2020?

9214

[03:24](#msg5c13227b539aca60b20860db)There's no ETA for releases, so no one expects anything. Please stop speculating and making blind estimations.

phrmoy

[03:49](#msg5c13282c987052387ee1d687)Thanks for the answer and apologies for asking, the language looks amazing. Keep up the good work!

greggirwin

[04:43](#msg5c1334e3ae1ab5539ee2ae5f)No need to apologize @phrmoy. Sometimes we can't tell, with new people, when someone is being sarcastic, because they want things to go faster.

## Saturday 15th December, 2018

PaulBanks

[02:38](#msg5c14691fe806954a9a1d6768)hi, just joined - been using or rather trying Rebol for a while, and now on Red, really nice language. few problems but still great stuff.

rebolek

[06:09](#msg5c149a7f392d8c6f8e63c57e)@PaulBanks Hi! What problems do you see?

endo64

[09:50](#msg5c14ce7ee806954a9a1f9bd4)@PaulBanks Hi, Red is actively developing, if you found bugs please report them on GitHub, before doing that you can discuss about them in bugs room on gitter.

PaulBanks

[15:55](#msg5c1523e0b512ce0b9d95e717)@rebolek @endo64 Hi, sorry, no i meant as a beginner just getting started with Red. Am enjoying learning about it. The problems were my own, in getting used to it. I seem to be doing ok now. thanks.

rebolek

[16:19](#msg5c15297b392d8c6f8e671329)@PaulBanks I see. Don't be afraid to ask, someone will always help you!

## Sunday 16th December, 2018

rgchris

[03:29](#msg5c15c689c428e9539d466039)Wee Red update to an old \[HTTPC](https://gist.github.com/rgchris/cb01af1841d2cf25ea2b5f458a264173) experiment. Tested on Terminal on Mac (your colour experience may vary).

## Tuesday 18th December, 2018

PaulBanks

[02:30](#msg5c185bc19c82bd02402f09f1) I get how to get the screen size, but how can i get a gui window size and then split the co-ordinates - I know about as-pair but is there an un-pair ? - thanks.

gltewalt

[02:48](#msg5c185fea00ab9f271106498f)You can refer to `x` and `y` values with `/x` and `/y`

[02:48](#msg5c186009b4ef8202484d31b1)

```
>> p: 800x600
== 800x600

>> p/x
== 800
>> p/y
== 600
```

PaulBanks

[02:59](#msg5c18628e416379024147b868)yes thank you @gltewalt - but how can i get the gui window size ? not the screen size.

[03:02](#msg5c186347b8760c21bbe5c682)apologies for being so slow, just am enjoying this language.

gltewalt

[03:03](#msg5c18638934a2755a1d2a2b4e)Off the top of my head, I don't know / remember about gui window size

toomasv

[04:18](#msg5c18750b34c6c32cc8310397)@PaulBanks

```
view win: layout [button "Win size" [probe win/size]]
```

or

```
view [button "Win size" [probe face/parent/size]]
```

greggirwin

[04:22](#msg5c187612b4ef8202484daaf6)Or even

```
>> win: layout [button "Win size" [probe win/size]]
== make object! [
    type: 'window
    offset: none
    size: 82x47
    ...
>> win/size
== 82x47
```

toomasv

[04:25](#msg5c1876b94303512ab46141f5)Interesting. Without rendering the window size is smaller. It hasn't got its default smallest size yet? After rendering the size is 130x47.

greggirwin

[04:27](#msg5c18771d2a66862cc947f524)Ooooh, yes, good catch.

toomasv

[04:27](#msg5c1877452a66862cc947f607):smile:

gltewalt

[21:52](#msg5c196c3234c6c32cc837540f)too bad `size` isn't settable

[21:53](#msg5c196c3eb6f00a27100c4cf2)`s: size 300x200`

## Wednesday 19th December, 2018

justjenny

[00:17](#msg5c198e094303512ab4684046)hi, I did know this a while back, but can't recall it - I've been asked how to get the 'enter' keypress - the other keys are pretty straight forward, but the 'return' key is different ? help ! - Jenny.

greggirwin

[01:02](#msg5c199894dab2222ab3b76919)@gltewalt `view [size 300x200]`

[01:04](#msg5c19991e41637902414f954a)

```
>> win: layout [button "OK"]
== make object! [
    type: 'window
    offset: none
    size: 82x47
    text: none
    image: none
    color: none
    me...
>> win/size: 300x200
== 300x200
>> view win
```

[01:07](#msg5c1999dfdab2222ab3b77018)@justjenny have you looked at https://doc.red-lang.org/en/view.html#\_events for event handling details?

[01:09](#msg5c199a542a66862cc94f50f6)In the simplest case, you can use `on-key-down`, rather than `on-key`. e.g.

```
view [field on-key-down [print mold event/key]]
```

justjenny

[01:19](#msg5c199c9f41637902414fa80a)Gregg - yes- got i t -thanks - the simple stuff always gets me - thanks again .

nd9600

[22:44](#msg5c1ac9dbb4ef8202485cb62c)Are closures possible at all in Red somehow?

[22:45](#msg5c1ac9fc4163790241571caf)

```
f: function [x] [function [y] [x + y]] 
g: f 1 
g 2
```

something like this

gltewalt

[22:51](#msg5c1acb7c41637902415724ca)https://github.com/red/red/wiki/%5BNOTES%5D-Closures

nd9600

[23:01](#msg5c1acdc734c6c32cc8400047)thanks

## Thursday 20th December, 2018

virtualAlan

[01:31](#msg5c1af0d9dab2222ab3bfe398)Had loads of messages about sizing an image and keeping its aspect ratio after adding my slideshow script, so have explained it and updated it .... You will need to scroll down a ways to my example 36 - http://www.mycode4fun.co.uk/About-Red-Programming - hope it's useful - Regards Alan.

[05:12](#msg5c1b24ca9c82bd0240407152)sorry, it's example 46

solisoft

[18:18](#msg5c1bdce6f4043314193f4ffe)Hi, there is a way to run red within ubuntu 18.10?

[18:18](#msg5c1bdcf7b8760c21bbfbf90a)

```
./red              
/home/soli/.red/console-2018-11-22-8164: error while loading shared libraries: libcurl.so.4: cannot open shared object file: No such file or directory
```

rebolek

[18:18](#msg5c1bdd0dc35a30024755e1c9)@solisoft Hi, you need to install 32bit libs.

solisoft

[18:19](#msg5c1bdd304e0d6621ba23f0cd)Yes I tried ... but no success

rebolek

[18:20](#msg5c1bdd62dab2222ab3c5c603)On Ubuntu you need 32bit libculr4 instead of libcurl3

solisoft

[18:21](#msg5c1bdd9334c6c32cc8466198)`sudo apt install libcurl4:i386` fixed it

rebolek

[18:22](#msg5c1bdddab8760c21bbfbfe24)yup

solisoft

[18:23](#msg5c1bde3200ab9f27111c73d9)oh still no `view` on linux :)

rebolek

[18:30](#msg5c1bdfe300ab9f27111c7dcb)@solisoft No, just the experimental GTK branch.

GaryMiller

[20:19](#msg5c1bf9362a66862cc95e3bb4)I've been scanning the Red docs for mention of Unicode strings specifically for representing foreign language characters. Are they supported yet? If not any idea when they might be added.

rebolek

[20:30](#msg5c1bfbf19f43111418705f2c)@GaryMiller Unicode is fully supported, you can do `print "křížala"` for example.

GaryMiller

[21:22](#msg5c1c0813c35a30024756fbf9)Great Thanks!

[21:26](#msg5c1c08ec4e0d6621ba250e8b)I was also looking for how to divide an application's functions and words into different modules or namespaces separately into different files to support group development. Is this possible?

greggirwin

[21:28](#msg5c1c0981c35a3002475703ad)True module support is planned for 0.8.0. In the meantime, you can use contexts as namespaces.

## Sunday 23th December, 2018

AiguyGary\_twitter

[01:53](#msg5c1eea8292cf4d2242de8327)If you are running a non-GUI script in the REPL, is there a Word you can put in the first line of the block you are going to DO to execute the script that will clear the screen on the REPL and place the cursor at the top of screen ? I tried searching for clear screen or clear console but just found the clear to reset the contents of a Word. I realize I could just print a bunch of blank lines but usually there's a more elegant way to do such things.

gltewalt

[02:27](#msg5c1ef286cac5bc2241d35d96)If you're using the GUI Console, `Ctrl + l`

amreus

[06:56](#msg5c1f318a23323d58bd103c0d)@AiguyGary\_twitter I used this: `cls: does [prin "^(esc)[2J"]`

AiguyGary\_twitter

[17:23](#msg5c1fc47cd945b96882e4c4a0)Thanks!

[20:43](#msg5c1ff37cdb5b5c6883f82b85)Has anyone ported the Levenshtein algorithm to Red yet. I found one in REBOL but not in red. http://www.rebol.org/documentation.r?script=simetrics.r#section-2.2 It's a very useful function for Natural Language Processing because it can still match strings even with spelling errors or letters transposed. Some languages like Python and D have it built into their standard libraries. It's also one of the language examples on the Rosetta Code site used to compare programming languages. I see Red has made it onto Rosetta Code but the Levenshtein code example was not filled in.

rebolek

[20:49](#msg5c1ff4c82863d8612b7bdb25)That shouldn't be hard to port to Red.

## Wednesday 26th December, 2018

ne1uno

[17:55](#msg5c23c0ab92cf4d2242faab01)@rgchris has similarity-of and simple-diff in scrips or his website somewhere https://github.com/rgchris/Scripts

## Thursday 27th December, 2018

AiguyGary\_twitter

[13:44](#msg5c24d7555064a51f83838f0c)If I compile a red program with a ask in it I see the following error when I try to run the executable in a PowerShell console. The "Hi" is a print from inside of my program. Do I need to ad anything to the red code for ask to work inside a compile program?

Hi  
\*\** Script Error: ask has no value  
\*\** Where: UserResponse  
\*\** Stack:

The line with the ask reads...

UserResponse: ask " &gt; "

9214

[13:51](#msg5c24d8febabbc178b2e64df0)@AiguyGary\_twitter have you read \[this](https://github.com/red/red/wiki/%5BNOTES%5D-Compiling-with-console-functions)?

AiguyGary\_twitter

[13:55](#msg5c24d9c192cf4d2242012c89)Thanks!

## Friday 28th December, 2018

PaulBanks

[00:16](#msg5c256b5aab910e7d3ae1b52e)thanks guys - am loving Red - am getting some problems with my anti-virus program (AVG), keeps wanting to kill anything I compile with Red ?

gltewalt

[00:47](#msg5c2572925064a51f83877564)Suggest UPX to prevent AVs from complaining.  
https://upx.github.io/

[00:49](#msg5c257318db5b5c688318b432)It’s an ongoing struggle with antivirus complaining

[02:47](#msg5c258eb4db5b5c688319507a)I know it’s an irritation.

AiguyGary\_twitter

[03:50](#msg5c259d7793cce97d3baa7129)Has anyone talked to the virus makers to determine what is throwing the false alert? I saw the warning from Microsoft Windows antivirus scanner too when I installed. I could see this being an issue for businesses if they wanted to develop a commercial application and that kept coming up for their customers.

9214

[09:40](#msg5c25ef8992cf4d224207e083)@AiguyGary\_twitter vendors we tried to contact never helped us, and didn't gave any insights about false positives. They update their heuristics each month, so, one day you are clear, the other the again start to flag you. It's more of a coin-toss game than anything.

## Saturday 29th December, 2018

bferris413

[01:51](#msg5c26d3290b7fc97caab5718d)Just spent a considerable amount of time working through my first significant string copy "issue"

[01:52](#msg5c26d357f6166a302786119c)I'm still not sure what the problem was, values were being overwritten in a hash!...need to read up on strings some more

gltewalt

[02:09](#msg5c26d76ff6166a3027862a77)Example?

endo64

[09:30](#msg5c273ec192cf4d22421019a2)Not sure what was your issue but, strings in a hash is just strings, shouldn't be any difference:

```
>> m: #(s: "")
== #(
    s: ""
)
>> t: copy m/s
== ""
>> append t "test"
== "test"
>> m
== #(
    s: ""
)
```

greggirwin

[22:55](#msg5c27fb4b09b8066849854a68)@bferris413, have you seen https://github.com/red/red/wiki/%5BDOC%5D-Why-you-have-to-copy-series-values ?

## Sunday 30th December, 2018

bferris413

[00:26](#msg5c2810a092cf4d22421525ac)No, but that looks helpful, I'll take a look, thanks @greggirwin

[00:27](#msg5c2810dfbabbc178b2fa82cf)@gltewalt @endo64 I'll try to condense the example, I was taking strings from a bunch of fields, and putting them into objects which would then be stored in a hash!

[00:27](#msg5c2810fa37975e7ca944a82f)certain previous hash entries were being overwritten with the updates, and adding `copy` fixed the issue

[00:27](#msg5c28110c92cf4d2242152779)but after much printing, probing, and debugging

[00:28](#msg5c28111937975e7ca944a8a9)honestly it may have been more working with globals than anything

[01:10](#msg5c281aeef6166a30278dd669)Very helpful writeup, I didn't even know that wiki existed. Normally I've been keeping red-by-example open, and using the official docs for view/vid. I'll be browsing the wiki now as well, thanks

toomasv

[05:51](#msg5c285cdad945b96882182fd9)@bferris413 See also \[doc resources](https://www.red-lang.org/p/documentation.html)

## Monday 31st December, 2018

AiguyGary\_twitter

[04:48](#msg5c299faf8d31aa78b12387ed)Has anyone interfaced the Microsoft Speech API SAPI to Red yet. https://www.microsoft.com/en-us/download/details.aspx?id=10121

ne1uno

[05:29](#msg5c29a93b93cce97d3bc346ca)@jocko had a `red-tts` repo, seems to be gone now. used `call say`

[05:32](#msg5c29a9d437975e7ca94df4cf)`powershell` in windows

AiguyGary\_twitter

[12:56](#msg5c2a1208babbc178b2066c42)Thanks!

ne1uno

[15:11](#msg5c2a319bd945b9688223349d)something like this or a simple vb/js might work on windows till someone wraps tts https://github.com/gredinger/Powershell-TTS
