# Archived messages from: [gitter.im/red/red/gui-branch](/gitter.im/red/red/gui-branch/) from year: 2016

## Saturday 2nd January, 2016

tanstaaf1

[02:34](#msg568737480171d1791d02fce4)With Santa delayed I would like to begin playing with a beta. Since I don't have a "Rebol SDK copy with a valid license file", is there a binary with GUI more recent than the Dec 22 version on red-lang? Where are pre-release docs?

PeterWAWood

[02:38](#msg5687383a653b30761d76ef73) You don't need a REBOL SDK to create a binary of the interpreter which should be more than sufficient for you at this stage.

[02:40](#msg568738aa653b30761d76ef7b)You could also download one of the automated builds from red-lang.org

tanstaaf1

[02:40](#msg568738ae35e1a316162efb0c)That's good. Are there written instructions on how to build the whole thing? Anything written on how to use it? I've never built a red binary before.

[02:41](#msg568738df3acb611716008b53)The automated build is dec 22. I'm thinking there have been more than a few bugs fixed since then and don't want to report things previously reported?

[02:42](#msg5687390e653b30761d76ef84)I may need a little hand holding this time but hope to, at least, be useful as a beta tester.

PeterWAWood

[02:42](#msg568739233c6894026925a660)That would be great once Red reaches beta.

tanstaaf1

[02:43](#msg5687393a4f069158055ca7c7)Sorry ... prealpha for for the beta. :-)

[02:43](#msg568739554f069158055ca7ca)hey..Happy NY, Peter!

PeterWAWood

[02:45](#msg568739c63c6894026925a66e)The instructions for building Red programs is in the read me at https://github.com/red/red

[02:45](#msg568739d10199d70069e08977)Happy New Year to you too.

[02:49](#msg56873aaa35e1a316162efb2d)The console is simply a Red program. Under Windows, most people would compile it from a Rebol console.

[02:52](#msg56873b520171d1791d02fd2a)

```
change-dir %<path to main Red directory>
do/args %red.r  "-o <what I want to call the exe> environment/console/console.red"
```

tanstaaf1

[02:55](#msg56873c2a9606b15a055e7627)thx

[02:56](#msg56873c690171d1791d02fd3e)does vid use the same syntax as red2 gui? Or is there a way to print the list of gui words?

PeterWAWood

[03:03](#msg56873dec0199d70069e089c7)If you want to include View in the interpreter you need to add the following line to the header in console.red:

```
needs: 'view
```

[03:06](#msg56873eb53c6894026925a6c3)There is no documentation yet other than in the files:  
tests/vid.red  
tests/view-test.red

nickantonaccio

[05:18](#msg56875dae9606b15a055e7871)I've put some things to help get started at http://redprogramming.com/Short%20Red%20Code%20Examples.html

pekr

[07:52](#msg568781c90171d1791d03018a)@PeterWAWood - that's an old school :-) There is an `rc`function (recompile), so basically you can type `rc %tests/view-test.red`

PeterWAWood

[07:57](#msg568782db653b30761d76f46a)In Rebol console?

pekr

[07:57](#msg568782f3653b30761d76f46c)yes. I never ever use red.exe - I hate it :-)

[07:58](#msg5687832a3acb61171600905a)It's always old to test with the new stuff. I prefer to just hit enter on red.r, that brings me into the R2 session and then I use above mentioned `rc`

PeterWAWood

[07:59](#msg56878369653b30761d76f47c)I dont

[08:00](#msg5687838c4f069158055cacbc)Usually use the Rebol console, ill

[08:00](#msg5687839535e1a316162efffc)Give it a try

[08:00](#msg568783b43acb611716009066)Sorry typing this on my phone.

pekr

[08:00](#msg568783b60199d70069e08e53)give a try to what? red.exe? It does not have my `rc`and its enough to abandon it entirely

PeterWAWood

[08:01](#msg568783e90171d1791d0301b2)I normally use rake to compile and run Red programs

[08:03](#msg5687843e9606b15a055e7b0b)I don't use red.exe either.

[08:03](#msg5687846a4f069158055caccb)So I'll try rc

pekr

[08:04](#msg568784723acb61171600906a)Maybe a question - can I compile using red.exe, while in console session? No, because after running red.exe, I am brought to red. So the only chance to compile is to use red.exe as a command line tool. But then I have to hit cmd.exe or have prepared some environment as Console2, etc. If I am running it as a command line from e.g. Total Commander (which I use for ages, I miss the output, which I have to redirect to file, if I want to know why something broke). Well, most probably wrong habits on my side

[08:05](#msg568784d29606b15a055e7b12)The thing also is, that I ocassionally still use R2, so it is natural for me. But I can understand, that you have to have R2 "installed", so that .r is associated with R2, and hitting .r script runs it via the console ... It is really convenient for me that way ...

PeterWAWood

[08:06](#msg56878519653b30761d76f494)I don't think you can compile a program from the interpreters, @dockimbel will know😊

pekr

[08:13](#msg5687868f4f069158055cace0)Well, you can't definitely compile red program from red itself, that would mean, that we are already self-hosted, right? :-)

[08:14](#msg568786ce0171d1791d0301df)but - if Red would have `call`awailable, we could call R2 or Red.exe to compile, even from the Red interpreter :-)

[08:14](#msg568786d70199d70069e08e80)Well, wrong group anyway, we are in a gui ....

## Monday 4th January, 2016

PeterWAWood

[03:51](#msg5689ec550199d70069e0c893)@dockimbel @qtxie Does vid support this yet:

```
view [
	t: title "VID test"
	return
	text "Testing a change of title ........................"
	return
	button "Hello" 100x40 [t/text: "Hello" show t]
]
```

It compiles but gives this runtime error:

```
PS E:\Languages\Red> ./title
*** Script error: VID - invalid syntax at: [title "VID test" return]
*** Where: do
*** Stack: view if set either layout while switch unless ctx175~throw-error cause-error do
```

WiseGenius

[05:08](#msg5689fe5b4f069158055ce9df)@PeterWAWood @bitbegin In the meantime, this works:

```
view [
	title "VID test"
	text "Testing a change of title ........................"
	return
	button "Hello" 100x40 [face/parent/text: "Hello"]
]
```

PeterWAWood

[05:09](#msg5689fe834f069158055ce9e4)@WiseGenius Thanks !!!

bitbegin

[05:59](#msg568a0a4e0199d70069e0cb4b)@WiseGenius @PeterWAWood can not work with title

WiseGenius

[06:02](#msg568a0aeb9606b15a055eb7e4)@bitbegin What result do you get when you try the above code?

bitbegin

[06:08](#msg568a0c59653b30761d773120)ok. it work! I understood wrong

## Tuesday 5th January, 2016

dockimbel

[03:54](#msg568b3e91335036ce0437227d)@pekr `call` is already \[available](https://github.com/red/red/tree/master/system/library/call), but you need to include it in order to use it.

[03:57](#msg568b3f2ff8f27d643a1e67c5)@PeterWAWood Assigning words in VID is only allowed for graphic components. The `title` keyword is just setting a window property. A simple way to access the window face is to assign a reference to it on `layout`'s return value:

```
view win: layout [
    title "VID test"
    text "Testing a change of title ...................."
    return
    button "Hello" 100x40 [win/text: "Hello"]
]
```

[04:00](#msg568b3fc8de4e8bcd04b8f61e)`layout` is the VID processor, returning the root face of the resulting face tree. `view` calls `layout` implicitly, but you can make it explicit if you want to post-process the result in any way before displaying it.

[04:00](#msg568b3ff4116ab4ca1b89be25)@dockimbel About the `call` code above, we should convert it to a module in 0.6.1, for easier usage.

meijeru

[08:14](#msg568b7b68741102623acb772f)@dockimbel Just for completeness, it could be mentioned that if `view` is called with `no-wait`, it returns the root face also (completed with any `options` and `flags`).

dockimbel

[09:42](#msg568b8fffde4e8bcd04b8fe7b)@meijeru Right.

## Wednesday 6th January, 2016

Oldes

[09:15](#msg568cdb2f262659750bce80b9)Would it be difficult to add OpenGL widget? I guess it could be done by rendering to image buffer, right? I mean.. it's not difficult to get OpenGL window, but it could be fun to have it just in the view layout with other native widgets. For me it would be more cool, than already existing Camera widget. But it's just a moment of thought. Still don't have time for playing anyway.

dockimbel

[09:32](#msg568cdf13d9a9d7ea39cf9ce0)Not difficult, but not useful until we get 3D primitives support and proper abstractions, which is probably a few months of hard work. Though, if someone wants to work on such backend, it would be a great help to boost Red into the gaming domain. Just keep in mind that there's a huge design work for creating a good high-level interface for users while keeping performances maximized.

Oldes

[09:33](#msg568cdf4cc5bdc5ba338e207e)I§m sure it could be fun even without 3D primitives

dockimbel

[09:34](#msg568cdfa817dc78be338711f3)@Oldes Even supporting just textures is a significant work. I'm not sure what you have in mind when you say "fun". ;-)

Oldes

[09:37](#msg568ce060262659750bce814c)Just a rotating rainbow triangle with native gui widgets around or over, if possible, would be a good eye catching starter. No need for textures yet:) But no problem... looking forward for IO = so one could try to implement some protocols.. that would be also fun:)

[09:40](#msg568ce0fb262659750bce8164)But yes... maybe it would be good start to have just an image rotating with other widgets. I'm not sure if it is already doable easily.

dockimbel

[09:45](#msg568ce243e8598dd060155be3)@Oldes \*Just a rotating rainbow triangle* That's already a lot of GL calls to wrap. If you just offer a 1:1 mapping of Red functions or routines to GL calls, the added value of using Red will be very limited and not impressive at all to any GL user.

Oldes

[09:47](#msg568ce2bc881538d260ace7a7)Hm... you are right that in Red should not be visible all GL functions.

dockimbel

[09:48](#msg568ce307881538d260ace7b4)The hard part is really in providing an abstraction layer with creates substantial value by hiding fully the GL API, like we did for Red/View and native GUI API.

Oldes

[09:49](#msg568ce332881538d260ace7b9)OK.. so lets move on IO asap ;-)

dockimbel

[09:49](#msg568ce33ec5bdc5ba338e20f7):)

WiseGenius

[15:44](#msg568d3650d9a9d7ea39cfa9f4)Concerning this code:

```
view layout [field [print "Hello, World!"]]
```

In Rebol 2, `[print "Hello, World!"]` is done when the Enter key is pressed from within the field. Currently in Red, though, the block is done whenever the content of the field changes. Is this difference desired? If so, is there / should there be an event type to get the Rebol 2 behaviour?

## Thursday 7th January, 2016

dockimbel

[09:00](#msg568e292550d34f6404e86654)@WiseGenius Currently the default event for `field` is `change`, we don't have a `enter` event, but I was thinking about it in earlier in Red/View implementation, so, yes, I think it would be a useful addition.

## Monday 11st January, 2016

fergus4

[17:43](#msg5693e9aab1f439094a07825f)Is there a way to increase height of drop-list button in vid? I can only change length unlike button which can change both. Also list does not seem to take block! word. Block of list choices must be inline with widget?

nickantonaccio

[19:36](#msg569404218fdd3c0c382e0449)@dockimbel did I submit #1522 correctly? Can't even do many basic tutorial examples with that bug...

## Tuesday 12nd January, 2016

pekr

[05:31](#msg56948fb80712a5b63b4cdede)When runnint react-test5.red:

\*\** Script error: blk has no value  
\*\** Where: reduce  
\*\** Stack: view if set either layout while switch do-safe if print = type? react parse if append reduce

[05:32](#msg56948fe1ee13050b38a2fc8d)The UI displays and I can move sliders, it just has no effect ....

iArnold

[07:18](#msg5694a8aed36554aa4984cdde)&gt; @dockimbel did I submit #1522 correctly? Can't even do many basic tutorial examples with that bug...

Looks ok to me. It is quiet with bugfixes on the Red front atm. Will be a large blogpost. Very anxious when the release will finally be published.

[07:30](#msg5694ab7be4c45a8129aab7fe)By the way thanks to a tip of a good friend of mine I got my program running on my Mac. I'll keep it a secret for now how I did it.

pekr

[07:39](#msg5694ada9ee13050b38a30004)Emulator? :-)

[07:39](#msg5694adb80712a5b63b4ce1d6)btw - I can't see any doc updates in the wiki yet ....

dockimbel

[07:50](#msg5694b0608fdd3c0c382e1d3a)@nickantonaccio Ok, will have a look at it today.

Oldes

[08:01](#msg5694b2e08fdd3c0c382e1d82)Now when I use this code:

```
view [text bold blue "hello"]
```

I have black text on blue background. Is it just me who consider it as unfriendly? I want bold blue text in such a case, not blue background. @dockimbel what do you think?

dockimbel

[08:10](#msg5694b4e7d739f50a3603096f)@Oldes It's obviously a bug.

[08:53](#msg5694bf15d739f50a36030ab3)@nickantonaccio #1522 is fixed now.

nickantonaccio

[12:44](#msg5694f54687cb99b53b8894c5)Thank you!

## Wednesday 13th January, 2016

WiseGenius

[07:23](#msg5695fb5e7669220736036207)@dockimbel Should I post a reminder anywhere to add an `enter` event, or is that not necessary?

dockimbel

[08:13](#msg5696070eee13050b38a33988)@WiseGenius You can write a wish ticket for it in the tracker to ensure it won't be forgotten.

WiseGenius

[08:15](#msg5696078b0712a5b63b4d1b09)@dockimbel Thanks. I'll do that.

Oldes

[08:25](#msg569609fab1f439094a07da0d)@dockimbel just passing around it... at this moment you are using

```
system/view/metrics/dpi
```

as integer value, but windows works with pair. Don't you want to change it even when it is just a dummy placeholder so far? Also note that you are using value 94, but better would be 96.

dockimbel

[08:29](#msg56960ad85fd2ae3c32b53f64)@Oldes Right, though it's unused now and anyway such property should rather be part of screen objects.

Oldes

[08:33](#msg56960bbc0712a5b63b4d1b89)But screen is just a

```
face!
```

now, isn't it?

pekr

[08:33](#msg56960bc70712a5b63b4d1b8a)Yes, needs to be part of the screen metrics. It is nowadays common, that you have multiple screens. Sometimes I have ntb (debug), 24" LCD and LCD TV connected all at once - different resolution and scaling ....

[08:33](#msg56960bd776692207360363b8)btw - R2 view crashes, when you change resolution and the app is running

dockimbel

[08:34](#msg56960bf8b1f439094a07da54)@Oldes Yes, we could put such property in the `options` facet.

Oldes

[08:34](#msg56960c32b1f439094a07da61)Ah... so it's over my abilities... wanted to give it a try while reading this http://kennykerr.ca/2014/04/07/making-a-window-dpi-aware/

[08:37](#msg56960cb687cb99b53b88c40e)Or is

```
options
```

just a block with name-value pairs?

dockimbel

[08:44](#msg56960e79ee13050b38a33a77)Just a block of name-value pairs.

pekr

[08:57](#msg5696118ab1f439094a07db4a)@dockimbel Any ETA on the other docs? So far, only the Overview is available, which is btw very nice, short, self explanatory ....

dockimbel

[09:34](#msg56961a1d87cb99b53b88c633)Almost done with View documentation, it was delayed by some improvements to the reactive programming support.

[09:34](#msg56961a2bb1f439094a07dcb6)Maybe in a few hours for the View document.

djrondon

[15:49](#msg569672263165a6af1a3b89cc)Cool!

## Thursday 14th January, 2016

WiseGenius

[13:41](#msg5697a5742bc35f6c1c1a0b3c)@dockimbel If someone wanted to have the cursor automatically put into a specific field when the window was made, how should they do it? Should there be a `create` event for the window? Or should it be possible to specify a default face to be activated when the window was created, etc.

Oldes

[14:02](#msg5697aa82c391361d48eb0e36)@WiseGenius in Rebol there is \[focus](http://www.rebol.com/docs/words/wfocus.html)

pekr

[14:02](#msg5697aa8bda358920486ea78e)Some systems have focus function.

[14:02](#msg5697aa8d28b4586d1c8c9e03):-)

rebolek

[14:03](#msg5697aa993165a6af1a3bbbb0)Not yet in Red.

pekr

[14:04](#msg5697aafeda358920486ea7a2)Well, I thought for a while about using `on-change`object property, but that one is callend only when path set-words are used. I remember, some R3 GUI implementations had something like `on-make`, or was it `on-create`or `on-init`- don't remember anymore ....

[14:06](#msg5697ab57a03e28ad1adeac01)IIRC, general VID level initialisation can be done via its DO \[code here] section, but still not sure, how would I put some field in the focus, without the focus function or some API calls ...

rebolek

[14:11](#msg5697ac9328b4586d1c8c9e72)Anyway, FOCUS is planned, so we have just to wait.

iArnold

[15:57](#msg5697c582a03e28ad1adeb211)Great to see the VID and View docs now on the Wiki.

pekr

[15:59](#msg5697c5db59e3d04215bbbc84)I can't see the VID there yet, but surely it is coming soon :-)

iArnold

[16:04](#msg5697c6f12bc35f6c1c1a1328)You are right I was thinking about https://github.com/red/red/wiki/Red-View-architecture

dockimbel

[17:43](#msg5697de5d59e3d04215bbc2b4)@WiseGenius We'll have a focusing feature soon available. I'll add it to the documentation. Basically, you'll be able to set the focus on any face by assigning it to its container window `selected` facet.

WiseGenius

[17:46](#msg5697df073165a6af1a3bc8b4)@dockimbel Sounds good.

[17:47](#msg5697df4028b4586d1c8cab06)@Oldes Thanks for the link.

pekr

[17:57](#msg5697e189a03e28ad1adeb93e)guys, are you preparing any nice demo for the release too? :-)

meijeru

[19:08](#msg5697f213c391361d48eb1f8b)@dockimbel Great to see the additional View documentation. Will compare it to my own notes (which I gave you a copy of). Hope to contribute futher. Will you add a piece about `react`?

## Friday 15th January, 2016

dockimbel

[01:53](#msg5698512ba03e28ad1adecd37)@meijeru Thank you. Yes, I will document `react` and the reactive layer too.

pekr

[08:13](#msg5698aa38a03e28ad1aded58c)As for the doc, I would put more emphasis to explain, how the on-* is constructed. The only mention is in terms of code block and the only example is `on-create`, whereas Create is not present in the event list ....

dockimbel

[08:31](#msg5698ae613165a6af1a3be612)@pekr Could you elaborate on "how the on-* is constructed", I don't see what you mean?

pekr

[08:31](#msg5698ae7859e3d04215bbdf5a)difficult to express myself, have a 2 deadlines today ...

[08:32](#msg5698ae882bc35f6c1c1a3700)but .... when you look at sources, there is nicely visible, that we use many on-* functions

[08:32](#msg5698aeb6a03e28ad1aded61f)I was all eager reading about those actors, but one could not search the document for the on-menu, etc., as there is a list of events, but not the list of actors

[08:33](#msg5698aecd28b4586d1c8cc81b)I know it would lead to some duplication, but then I would put more emphasis to explain:

dockimbel

[08:33](#msg5698aede28b4586d1c8cc81f)Just search for the event name, which can easily be derived from the actor's name. Actually, you don't even have to search, just click on "Actors" entry in the TOC.

pekr

[08:33](#msg5698aef3a03e28ad1aded626)- either in the event section, that those event names are all used to serve as possible actors, with the on-&lt;eventname&gt; construct

[08:34](#msg5698af0cc391361d48eb3857)but what you say, is not clear

[08:34](#msg5698af2c3165a6af1a3be62d)there are only two things, which relate one to each other: on-&lt;event&gt;: func \[face \[object!] event \[event!]]

[08:35](#msg5698af4ac391361d48eb3865)and then the mention of `on-create`, which is not part of the event list, AFAIK

[08:35](#msg5698af53c391361d48eb3868)but well, as you said - this is not for beginners

dockimbel

[08:35](#msg5698af66c391361d48eb3869)Indeed, a more explicit explanation for how to construct actor names is missing.

pekr

[08:36](#msg5698af77da358920486ed1e9)I just tried to express my first impression, when skimming thru sources and seeing all those actors, I would have to construct it mentally for myself, when reading the doc ...

[08:36](#msg5698af9259e3d04215bbdf8c)I think that single sentence in the events section could be sufficient:

dockimbel

[08:36](#msg5698af95c391361d48eb3876)Actually, there is no `create` event, that's why the `on-create` actor is described specifically.

pekr

[08:37](#msg5698afda3165a6af1a3be64b)All (?) of the above/below events can be used to construct Actors. The format is: on-&lt;event&gt;, for e.g. on-key, on-move, on-drag, etc.

[08:38](#msg5698afee5de13b3f15e330e4)At least to me, any such sentence would make it imediatelly obvious ....

dockimbel

[08:44](#msg5698b176a03e28ad1aded68a)I made some \[improvements](https://github.com/red/red/wiki/Red-View-Graphic-System/\_compare/d7c0ac9845009cb3e442a17d929a4ca7538a48b1) to actors description.

pekr

[08:45](#msg5698b1c059e3d04215bbdfd1)Cool, thanks a lot, sometimes even small change can make a big difference :-)

[08:46](#msg5698b1f02bc35f6c1c1a3763)One of my deadlines here is to write a doc for the the electronic invoice workflow. You would not believe what I am slapped for :-)

[08:47](#msg5698b206c391361d48eb38be)Can't wait for table being extended by on-focus, on-unfocus :-)

meijeru

[14:44](#msg569905c8a03e28ad1adee596)@dockimbel Below some comments on the GUI documentation

[14:44](#msg569905e159e3d04215bbeee1)How is the "two-way binding" accomplished??

[14:45](#msg56990601a03e28ad1adee5a9)I think the `flags` facet can also be a single word

[14:45](#msg56990623da358920486ee102)The `name` facet of the `screen` face is notmentioned

[14:47](#msg569906655de13b3f15e33fbc)The `data` facet of \*list faces* can only be of type `block! hash! map!`, other types will not yield strings

[14:47](#msg5699068a3165a6af1a3bf59b)The `text` field of \*list faces* serves as "caption", what is this?

[14:48](#msg569906cc2bc35f6c1c1a45d5)What is the significance ofthe `picked` field of an event when its type is `pan, rotate, two-tap or press-tap`?

[14:49](#msg569906ee28b4586d1c8cd755)The significance of `picked`with a `menu` face is not explained

[14:54](#msg56990829a03e28ad1adee62d)The routine `to-image` defined in `platform.red` and the function defined in `environment/functions.red` which dispatches to it, may cause confusion with the Rebol convention of having `to-` functions which are short for `to type!` (e.g. `to-integer` as short for `to integer!`)

[15:21](#msg56990e8928b4586d1c8cd8f9)@dockimbel Two more remarks:

[15:22](#msg56990ead3165a6af1a3bf76d)As font size one should also allow a `float!` value

[15:22](#msg56990ed359e3d04215bbf0e6)In font and para objects,the `parent` field may also be a single object.

dockimbel

[15:30](#msg56991093a03e28ad1adee810)@meijeru Good points, will makes some changes to address them.

[15:31](#msg569910d028b4586d1c8cd98d)\*How is the "two-way binding" accomplished??* Thanks to the object ownership system (to be documented).

fergus4

[22:16](#msg56996fac3165a6af1a3c0d26)How are the window option flags used in vid. They do not seem to be the same as rebol2

## Monday 18th January, 2016

dockimbel

[11:39](#msg569cced83165a6af1a3c65b2)@fergus4 You can set the \[supported](https://github.com/red/red/wiki/Red-View-Graphic-System#window) Windows flags using `/flags` refinement. For example: `view/flags [button "hello"] [resize]`

## Tuesday 19th January, 2016

qtxie

[15:11](#msg569e52242bc35f6c1c1af4af)Here is the `gui-console` branch. https://github.com/red/red/tree/gui-console

[15:13](#msg569e52b7a03e28ad1adf989a)You can use `red/tests/red-console.red` to test it.

[15:14](#msg569e52d528b4586d1c8d86f4)Just be sure to compile it with `-t Windows` flag.

WiseGenius

[15:47](#msg569e5aa33165a6af1a3ca8b2)\[!\[cursor\_in\_red\_gui\_console.png](https://files.gitter.im/red/red/gui-branch/SvRv/thumb/cursor\_in\_red\_gui\_console.png)](https://files.gitter.im/red/red/gui-branch/SvRv/cursor\_in\_red\_gui\_console.png)

[15:48](#msg569e5ab5da358920486f961f)\[!\[selection\_in\_red\_gui\_console.png](https://files.gitter.im/red/red/gui-branch/LUf1/thumb/selection\_in\_red\_gui\_console.png)](https://files.gitter.im/red/red/gui-branch/LUf1/selection\_in\_red\_gui\_console.png)

[15:48](#msg569e5ad7da358920486f9628)@qtxie Exciting! Above are the first 2 issues I noticed.

pekr

[15:58](#msg569e5d3dc391361d48ebfd83)@qtxie - is there going to be extended keyboard navigation available in future? E.g. End, Home, ctrl + arrow (skip words), ctrl + shift + arrow (hilite + skipt words), shift + arrow (hilite letters)

dockimbel

[15:59](#msg569e5d5ea03e28ad1adf9b56)@pekr Yes, and many other features.

pekr

[16:00](#msg569e5d823165a6af1a3ca965)Cool, thanks :-)

dockimbel

[16:02](#msg569e5e28c391361d48ebfdba)Also, the GUI console is written in View itself, so it can be easily extended/customized by anyone. ;-)

qtxie

[16:04](#msg569e5e74da358920486f96f4)@WiseGenius I think it caused by no Consolas font on WinXP. Seems the font is not fixed width.

dockimbel

[16:05](#msg569e5eb13165a6af1a3ca9aa)@qtxie I think on WinXP, it should use `Fixedsys` font.

## Wednesday 20th January, 2016

Oldes

[07:45](#msg569f3aff5de13b3f15e41ba3)Good work @qtxie .. looking forward to see some colors there ;-)

qtxie

[08:58](#msg569f4c1804e908d302c3e135)@WiseGenius I fixed the issues on WinXP. :smile:

[08:59](#msg569f4c5405627b5909670b83)@Oldes I like colors. ;-)

dockimbel

[09:00](#msg569f4ca73165a6af1a3cd10f)@Oldes Colors support could be easily coded in the backend, the real work is defining an interface to specify them in a convenient way.

Oldes

[09:01](#msg569f4cf8da358920486fbee3)I already had the ansi color code emulation done so what would be colored in nix terminal would have colors on windows cmd too... but I don't know how to get the colors in the gui text. Yet.

[09:04](#msg569f4d90c391361d48ec24a7)Here is my code... https://github.com/Oldes/Red/commit/7e9217da06fcfea1fb90a8e7a4c475014e443d4b

dockimbel

[10:45](#msg569f6537c391361d48ec2872)@meijeru `name` facet from screen is removed now.

[10:49](#msg569f6641a03e28ad1adfc6cc)@meijeru \*The `data` facet of \*list faces* can only be of type `block! hash! map!`, other types will not yield strings* Right, but `map!` is not yet supported by the ownership system, so it cannot be used in facets right now (but will as soon as `map!` generates the proper events too).

[11:11](#msg569f6b46da358920486fc36f)@meijeru `caption` word was replaced by `label`. I hope it is more clear now.

[11:26](#msg569f6eea5de13b3f15e423d8)@meijeru I made the changes according to your comments, let me know if I missed anything.

meijeru

[12:07](#msg569f7896a03e28ad1adfc9b2)@dockimbel The possibility for font sizes to be `float!` values is not mentioned. Nor is the possibility for the `parent` field of `font` and `para` objects to be a single object.

dockimbel

[14:51](#msg569f9ed8a03e28ad1adfd18a)@meijeru Float values for font size are not supported currently, they'll result in mismatched size. I will have a look to see if the Windows backend can support that.

[15:00](#msg569fa10d3165a6af1a3cdf9e)@meijeru `parent` field needs to be a block for `font` and `para` objects. It doesn't seem that the current implementation can support just an object for that field. Did you make it work with an object instead of a block?

meijeru

[16:40](#msg569fb894a03e28ad1adfd75f)@dockimbel The single object parent for fonts and paras was just a hypothesis of mine, by analogy to face parents. I see in the source that it is not cared for. So it is right that it is not mentioned.

## Friday 22nd January, 2016

meijeru

[08:46](#msg56a1ec5a28b4586d1c8e1f53)@dockimbel One more detail: the spec block for the `on-create` actor function is `func [face [object!]]`, in contrast to the other `on-` functions. At least this is what I see in `view-test.red`, but in `view.red` at line 438 there is a call of `on-create` with second argument `none`. Is that in error?

## Sunday 24th January, 2016

WiseGenius

[05:19](#msg56a45ef1586242210adf2e84)@qtxie Just tested it now. When compiled, it opens what looks like the old console and hangs at:

```
--== Red 0.5.4 ==--
Type HELP for starting information.
```

So I compiled the old console to interpret the new one, and got:

```
--== Red 0.5.4 ==--
Type HELP for starting information.

red>> do %tests/red-console.red
*** Script error: path system/view/init is not valid for none type
*** Where: do
red>> do %tests/view-test.red
*** Script error: path system/view/debug?: is not valid for none type
*** Where: do
red>>
```

[05:24](#msg56a46000586242210adf2e99)Then I remembered to compile the old console with `Needs: 'View` but when compiling it (renamed as `console-gui.red`), I got:

```
-=== Red Compiler 0.5.4 ===-

Compiling /H/Work/Red/Tests Red/2016-01-24-15-20-46-red-gui-console/red-gui-console/enviro
nment/console/console-gui.red ...
Pre-compiling compression library...
*** Compilation Error: word init-console not defined in system/console/init-console
*** in file: %/H/Work/Red/Tests%20Red/2016-01-24-15-20-46-red-gui-console/red-gui-console/
environment/console/console-gui.red
*** near: [system/console/init-console "Red Console"]
```

qtxie

[08:30](#msg56a48b9257ef8eae73f16a35)@WiseGenius Did you compile `red-console.red` with `-t Windows` flag.

WiseGenius

[08:32](#msg56a48c0380ad69394a7a213c)Oops! :blush: I had a feeling it was me.

dockimbel

[11:00](#msg56a4aedc8fbaf4220af900e1)We have to decide what to do with nested event loops support. We want to cover two basic needs we have:  
1\. Support modal windows (could be done without nested event loop support though).  
2\. Protect Red GUI console from user code manipulations (like calling `unview/all`, which would currently close the base console too).

[11:02](#msg56a4af5edc33b33c75478be5)Maybe also events filtering (like a `/allow` and `/deny` refinements to `do-events` with argument event names lists) could benefit from that, though, it's probably orthogonal to nested loops support. Any thoughts or useful link from other GUI framework doing something smart/useful with that?).

[11:05](#msg56a4affe6b6468374a092ffd)The point 2. is non-existing problem in Rebol2 GUI console, as the console uses a different engine than View, so it's fully isolated from user code.

SteeveGit

[11:23](#msg56a4b414c54bc2bf180bb527)The problem I see with nested event loops, is that we can't close the console without closing user guis first. Am I right?

pekr

[11:24](#msg56a4b456eaf741c118d49156)What are your worries in particular? If nested/named separate loops could help to faster navigate/filter/group/clear/pack(batch, compress, like in QNX), I am all for it ... If it means recursion, which could fail, or a situation difficult to maintain, then it is something to be considered

[11:25](#msg56a4b4b2eaf741c118d49159)I would think in a more broader way - sending events across the nodes, to particular windows or regions, allowing some kind of emu(simu)lation and let's not also forget timers etc.

dockimbel

[11:31](#msg56a4b623aaae7a3a7592c890)@SteeveGit Currently, if you close the Red GUI console, it will close all other windows.

SteeveGit

[11:34](#msg56a4b6c2eaf741c118d49183)Can we currently hide the console at least?

dockimbel

[11:35](#msg56a4b705eaf741c118d49189)The `visible?` facet is there for that, but I don't think we tested it on a window so far, only on widgets.

pekr

[11:38](#msg56a4b7c0aaae7a3a7592c8a7)Unrelated, but what is your take on `quit`? E.g. in R2, it quits the console. Do we want to change that? I know there is a halt, but few times I wished the console server simply as a starting workbench for my prototyping, so wished `quit` would quit the app back to the console and not close it?

dockimbel

[11:39](#msg56a4b7fac54bc2bf180bb564)@SteeveGit The following code works with the gui-console branch:

```
view [button "toggle" [win/visible?: not win/visible?]]
```

SteeveGit

[11:40](#msg56a4b84ac54bc2bf180bb56b) OkiDoc

dockimbel

[11:51](#msg56a4bacf80ad69394a7a24d3)The current GUI console exposes some face names to global context, but the final version would have a cleaned-up implementation, so that you'll need then to use `system/screen/1/pane/1` to access the console window.

SteeveGit

[11:52](#msg56a4bb06dc33b33c75478caf)I'm concerned about the possibility to run or not, a tool like \*\*anamonitor\** in the background of a guest app. Wouldn't nested event loops perhaps block this use case?

dockimbel

[12:00](#msg56a4bcd58fbaf4220af901e1)Maybe, maybe not, depends on what we decide for the nested loops behavior. Though, that's a very good use-case.

SteeveGit

[12:04](#msg56a4bdd1eaf741c118d491fb)Nested event loops breaks in some way the concurrent behavior model.

dockimbel

[12:10](#msg56a4bf3a8fbaf4220af90223)@SteeveGit How so?

SteeveGit

[12:20](#msg56a4c1976b6468374a09311d) Well, as with the \*\*anamonitor\** use-case. One particular GUI should not be able to completely preempt other GUIs from acting by default, but behave in a concurrent (shared time and events) way.

[12:21](#msg56a4c1b7c54bc2bf180bb610)I say, by default.

dockimbel

[12:38](#msg56a4c5b9eaf741c118d49295)@SteeveGit It would work fine, though, it would be in a single thread, so for now, the code in event handler should be non-blocking. Once we have concurrency support, then you'll be able to run heavy tasks or IO without blocking the event loop.

WiseGenius

[15:21](#msg56a4ebecaaae7a3a7592cdb8)Some day last week, I decided to switch an extremely small GUI program from using Kai's clever GTK bindings to use Red's own GUI. I thought that someone out there may be encouraged by the result:

\* I was keeping 31 dlls in the same folder as dependencies. Now there are 0!  
\* Unfortunately, like all my projects, it needs `now/precise` so I'll have to write a dll to depend on until that's available, bringing the count back up to 1.  
\* My code shrank from 580 lines to 464 lines.  
\* Keep in mind that I only made the most minimal changes to make it continue to work.  
\* There are now some useless functions I still have to go through and remove which will make it smaller.  
\* It's still using verbose workarounds from before `map!`s were available. Fixing that will make it smaller.  
\* It still has to be refactored.  
\* My code is neater.  
\* Again, that wasn't intentional.  
\* Every difference in the look of the interface is better.  
\* Every difference in behaviour is better.  
\* It already does more.  
\* It didn't take long to change (It might have been minutes?).

dockimbel

[16:12](#msg56a4f808586242210adf3c0d)@WiseGenius Very interesting feedback, enjoyed reading it! :clap: Kaj did a great work on the GTK binding in the early days of Red.

WiseGenius

[16:16](#msg56a4f8f7586242210adf3c33)Yes. It's very impressive!

pekr

[17:44](#msg56a50d946b6468374a0939c5)cool!

iArnold

[19:44](#msg56a529b957ef8eae73f16b0f)@WiseGenius Right! It is high time Red gets updated!

[19:59](#msg56a52d1a5c829b286390f373)Use of now/precise to seed random generator?

## Monday 25th January, 2016

WiseGenius

[03:58](#msg56a59d5a6b6468374a094a4e)@iArnold Partly. The reason all my projects need `now/precise` is for timestamps and something similar to UUID generation. Kaj's binding's `now/precise` returns unix time which is only in seconds and not `/precise` enough for that purpose. However, I \*was* using Kaj's `now/precise` for random seeds in another part of the program, yes. I didn't have to remove this binding to get the extra dlls down to 0, but I did anyway, because I don't need it to be that frequently random until the timestamps and UUIDs are working, and I'd be replacing the binding for that to happen anyway. In the meantime, I've been manually incrementing the seed in code each time I run it and keeping a log of it which seems better for testing for now, at least for a very short while.

dockimbel

[04:34](#msg56a5a5d5aaae7a3a7592e3fe)@WiseGenius FYI, time support is very high on our todo-list, we'll work on it just after the 0.6.0 release. BTW, we plan to do the release before 7th, as we then all go on holiday for a week due to Chinese New Year.

WiseGenius

[04:39](#msg56a5a70faaae7a3a7592e412)@dockimbel :thumbsup: That's very exciting to hear! It sounds like it means I won't have to write a separate dependency workaround for Android when 0.6.1 comes out! Very excited for 0.6.0 as well!

dockimbel

[04:43](#msg56a5a808c54bc2bf180bd0a2)@WiseGenius Time support will be part of 0.6.1 along with other improvements for the Windows backend, like timers, animations support and new widgets.

## Tuesday 26th January, 2016

dockimbel

[05:56](#msg56a70a7580ad69394a7a75c8)We have modal windows support now in gui-console branch. As soon as we fix some of the minor issues we found with the GUI console, we'll merge it in master.

bitbegin

[06:33](#msg56a71346dc33b33c7547e0b4)赞！

iArnold

[07:41](#msg56a7234680ad69394a7a77c6)@bitbegin My mandarin is a little dry, does it mean "two little men jumping over a dam into the ocean"?

bitbegin

[07:49](#msg56a725218fbaf4220af95646)It means "Very Cool".

rebolek

[08:04](#msg56a72873c54bc2bf180c0af3)Wouldn’t it be nice if faces "knew" their name? I’d like to be able to do something like `view [b: button "show name" [probe face/name]]` and get `red>> b` as result.

PeterWAWood

[08:34](#msg56a72fb1dc33b33c7547e33a)@rebolek I think it's a bit tricky to find the word which points to a value. You could search through the words in a context and see which one pointed to the value. Dealing with a: b: button would be a bit tricky too.

dockimbel

[08:35](#msg56a72fe5586242210adf8b81)@rebolek As any other object or values in Red, faces are anonymous. If you can give me a use-case where such extra field would be useful instead of accessing the face through the face tree, I would study it. I understand that it would be a VID-specific case, but still, I don't see when this reverse-mapping would be useful.

rebolek

[09:42](#msg56a73f93586242210adf8e0a)@PeterWAWood not find, it would be set by VID. I know faces, as other objects, are anonymous, so this would be only VID-specific. I made simple VID editor and when I select a face, I get all the information about a face, but not its VID name. There are of course other ways how to achieve it, but this one would be simplest, IMO.

dockimbel

[10:02](#msg56a74423dc33b33c7547e6a2)@rebolek I don't think it is a relevant information for a VID editor, as it's not an intrinsic property of the face, but an external relation with a specific word. Though, when I'll see your UI, maybe I'll change my mind. ;-)

rebolek

[10:03](#msg56a7446eaaae7a3a759322df):)

[10:03](#msg56a7448deaf741c118d4ea0f)No problem, it’s just an idea, that’s why I’m not opening issue for it.

[10:08](#msg56a74586586242210adf8efe)I want to create VID source from the editor, not just tree of faces, that’s why I care about the names. But as I wrote, there are other ways to do it.

iArnold

[10:08](#msg56a745b08fbaf4220af95ae2)I use an ID for my pieces. Then have to loop until the ID is found.

pekr

[10:09](#msg56a745e1586242210adf8f10)We miss find/deep, which Carl planned to add to Rebol for quite some time :-)

dockimbel

[10:23](#msg56a74935eaf741c118d4ead5)@pekr That's pretty trivial to implement.

pekr

[16:38](#msg56a7a121586242210adfa20c)re gui-console - I absolutly love its flat design, where Red favicon looks simply fabulous ;-)

[16:39](#msg56a7a131dc33b33c7547fb05)Just two observations:

[16:40](#msg56a7a1868fbaf4220af96db8)1) When you hold down cntrl and press/hold left/righ arrow key, the cursor disappears ...

[16:43](#msg56a7a22480ad69394a7a9016)2) tried the following code `i: 0 loop 1000 [i: i + 1 print i]`. Scroll-up then, you will find some malformed output above all the printed numbers: `ed>>` - when scrolling by mouse wheel, it is ok, but when scroller is used, you can see the described effect ...

[16:46](#msg56a7a2fd586242210adfa298)http://2zone.cz/pekr/red-gui-console.jpg

[16:47](#msg56a7a32580ad69394a7a9061)Can I post to the FB group, or is that supposed to be a bonus/surprise for the 0.6.0 release?

dockimbel

[16:58](#msg56a7a5c880ad69394a7a9129)You can post it.

pekr

[16:59](#msg56a7a5f5c54bc2bf180c2423)Thanks a lot ...

dockimbel

[17:02](#msg56a7a69e586242210adfa3eb)@pekr I tried your code on Win7 with latest code, can't see anything wrong. @qtxie should give it a try on Win10.

pekr

[17:02](#msg56a7a6b1eaf741c118d4fe9a)Do I understand it correctly, that you wish for more features (keyboard), plus the ability to embed it in apps, as a widget?

[17:02](#msg56a7a6bcdc33b33c7547fcbc)Yes, I am on Windows 10 ...

dockimbel

[17:03](#msg56a7a6e2586242210adfa3fb)@pekr The console is already a widget, the console GUI app is a View app. I just want minimal keyboard shortcuts support for now. We can improve that in later releases.

Oldes

[19:18](#msg56a7c6846b6468374a09a511)&gt; I absolutly love its flat design, where Red favicon looks simply fabulous

[19:18](#msg56a7c696c54bc2bf180c2bcf)@pekr from my view it's not \_fabulous\_... I don't like how the text is glued on the border without almost any space... if I can count the 1px which is used now. I think there should be bigger padding... but yes.. it's really just a detail... I like how Red is evolving. Still looking forward to see colors in the text:)

[19:20](#msg56a7c7046b6468374a09a53c)Although I guess that no padding is your personal setting in the OS.

[19:25](#msg56a7c8278fbaf4220af9778b)@dockimbel when I do this in console:

```
save %/r/test.png make image! 100x100
```

```
CompoundFile.cmp
```

file is created in the working folder.. is this ok?

iArnold

[19:42](#msg56a7cc1257ef8eae73f171cc)&gt; It means "Very Cool".

Depending on the ocean that could be very cool indeed ;-)

Oldes

[21:09](#msg56a7e0896b6468374a09ab7d)@dockimbel here is the compound file fix: https://github.com/red/red/pull/1554

[21:11](#msg56a7e0ecc54bc2bf180c3249)Btw... another reason why move on Red soon:

```
red>> save %/r/test.png make image! 10000x10000
red>>
```

while in Rebol2:

```
>> save %/r/test.png make image! 10000x10000
** Script Error: Out of range or past end
** Near: save %/r/test.png make image! 10000x10000
```

[21:33](#msg56a7e62b6b6468374a09acca)@dockimbel btw... current gui-console branch is somehow corrupted as:

```
>> do/args %red.r "-t Windows %environment/console/console-view.red"

-=== Red Compiler 0.5.4 ===-

Compiling /c/dev/git/red/environment/console/console-view.red ...
...compilation time : 952 ms

Compiling to native code...
*** Compilation Error: undefined symbol: exec/terminal/vprint
*** in file: %/c/dev/git/red/runtime/platform/win32-gui.reds
*** in function: red/platform/print-UCS4
*** at line: 23
*** near: [
    exec/terminal/vprint as pointer! [byte!] str size UCS-4
]
```

## Wednesday 27th January, 2016

dockimbel

[03:09](#msg56a834ea80ad69394a7aabd1)@Oldes Yes, there's a compilation issue with system console to solve. We're working on it.

[11:38](#msg56a8ac42c54bc2bf180c4e20)@Oldes Should be solved now.

WiseGenius

[15:12](#msg56a8de5f6b6468374a09d1a2)I see that in the gui-console branch, I can now use this to give `f` the focus:

```
l: layout [f: field "Hello, World!"]
l/selected: f
view l
```

Am I using this in the correct way?  
Is there a shorter way, to mark `f` as selected from within the vid block?

[15:12](#msg56a8de68c54bc2bf180c585c)Issue: Closing the window resulting from the above code closes the console, which doesn't happen when `l/selected: f`\` is not included.

dockimbel

[15:49](#msg56a8e702eaf741c118d53496)Yes, it's correct. We need to add something to VID to support focusing.

[15:51](#msg56a8e789586242210adfda1d)When I close the window using your above example code, the console gets stuck in the GUI event loop.

[15:52](#msg56a8e7a780ad69394a7ac632)@WiseGenius Are you testing from master or gui-console branch?

WiseGenius

[15:54](#msg56a8e838dc33b33c754831bb)@dockimbel The gui-console branch. I didn't think `selected` worked in master yet. Same behaviour from both `console.exe` and `gui-console.exe`.

## Thursday 28th January, 2016

dockimbel

[05:25](#msg56a9a6456b6468374a09f614)@WiseGenius The latest commit should fix the issue.

pekr

[05:28](#msg56a9a6ee586242210adffc64)Doc, I can see few improvements there - focus/unfocus, enter key for fields. Just one question - is tab key detectable already, so that GUI could be extended in future for the tabbing and accelerator key support?

dockimbel

[05:30](#msg56a9a75fdc33b33c7548537f)Tab key detectable: it should be, though I don't remember testing it. Tabbing is a built-in feature in Windows, so it just a matter of switching a flag to activate it.

[05:32](#msg56a9a7d3eaf741c118d5563b)Accelerator key: it's already possible to implement in-app hotkeys, just catch them at window level in on-key and return 'done to block other faces from processing it.

pekr

[05:35](#msg56a9a8aac54bc2bf180c7c84)Hopefully it is going to be added to VID at some point. IIRC, there was something like # key in VID2?

[05:36](#msg56a9a8f06b6468374a09f64e)What I did not like about the R2 solution was lack of rich-text, so you could not underline the accelerator key in labels. Not sure it is going to be possible with Red VID

[05:37](#msg56a9a908c54bc2bf180c7c93)Maybe again a feature of Windows and just the question of turning it on?

dockimbel

[05:47](#msg56a9ab78eaf741c118d5568b)Rich text is available in Windows, but we want a cross-platform support for it, so the best way is probably to make a Draw-based custom implementation.

WiseGenius

[08:19](#msg56a9cf08586242210ae000a7)@dockimbel Would you like me to update the following for #1548, or are you waiting until it's merged into master branch?  
https://github.com/red/red/wiki/Red-View-Graphic-System#field  
https://github.com/red/red/wiki/Red-View-Graphic-System#event-names

dockimbel

[08:43](#msg56a9d4a28fbaf4220af9cc07)@WiseGenius What is #1548? Anyway, yes, you can update the View document with those additions. We should merge the gui-console branch this week.

WiseGenius

[08:44](#msg56a9d503dc33b33c754857d6)https://github.com/red/red/issues/1548

dockimbel

[08:45](#msg56a9d5296b6468374a09faf2)Ah, right. Yes, you can update the document. In the meantime, I'll prepare a new graphic and new text for the event flow section in the View document, as it was changed recently too.

WiseGenius

[09:27](#msg56a9df138fbaf4220af9cdaa)@dockimbel I made the change:  
\* I assumed each face was only listing its default event, so I replaced \[field](https://github.com/red/red/wiki/Red-View-Graphic-System#field)'s `change` with `enter` rather than adding it? Is that correct?  
\* I assumed `enter`'s handler is called `on-enter`.

[09:28](#msg56a9df2e8fbaf4220af9cdb2)I assume `area` keeps `change` as its default event.

[09:28](#msg56a9df40eaf741c118d55c4c)As expected, `field` can still respond to `on-change` with this code:

```
view [field on-change [print {Content changed.}]]
```

However, `area` doesn't respond to `enter` with this code:

```
view [area on-enter [print {Enter key pressed.}]]
```

Is this a bug?

dockimbel

[09:29](#msg56a9df67586242210ae00342)@WiseGenius No, you should add it. There is no "default" event in View, it's a VID-layer concept.

[09:29](#msg56a9df96aaae7a3a75939556)All events handler are named in the form: `on-`.

[09:31](#msg56a9dfe7586242210ae00363)`enter` event is not relevant for `area` as it is used internally to make a line break. So, for now, we keep `on-change` as default in VID.

WiseGenius

[09:32](#msg56a9e02e8fbaf4220af9cdeb)@dockimbel `field` and `area` also respond to `on-key` but that's not listed, so that's why I assumed it was just the defaults. Should `on-key` be added too, then?

[09:34](#msg56a9e0a6aaae7a3a75939583)Also, `on-up`, `on-down`, etc. Where to stop?

dockimbel

[09:39](#msg56a9e1e0dc33b33c754859ee)Almost all events handlers can be used in every style, the document just highlights the most significants ones for each type, the ones people will most likely use. So, `on-key` seems relevant for field/area types, especially, if it can be used to change the pressed key (this is planned, but not implemented yet IIRC).

WiseGenius

[10:26](#msg56a9ecca80ad69394a7af111)@dockimbel OK, so I restored `field`'s `on-change`, added `on-key` to both `field` and `area`, and corrected a bit of spelling. I'll leave it alone now, unless there's anything else?

dockimbel

[11:59](#msg56aa02b2586242210ae00a8a)@WiseGenius Thanks, it's fine now.

pekr

[14:29](#msg56aa25b08fbaf4220af9dc52)Cool, gui-console shift-left, shift-right hilighting already works! Now to add shift-home, shift-end, plus ctrl variants (skip by words) and we are mostly done :-)

[14:31](#msg56aa26268fbaf4220af9dc82)btw - I tried with multiline method and it stops at the beginning/end of the particular row. Theoretically, that is about being expected. In some editor, it works, plus up/down arrow jumps to the same position but above/below row ...

[14:31](#msg56aa2639586242210ae0125a)But that is complex and can come later ...

WiseGenius

[14:35](#msg56aa2725586242210ae0129b)@dockimbel Yes, \[this issue](https://gitter.im/red/red/gui-branch?at=56a9a6456b6468374a09f614) is fixed (only just tested it now).

dockimbel

[16:26](#msg56aa413cc54bc2bf180c9845)@pekr We'll add more keyboard navigation and other improvements in next releases.

pekr

[16:32](#msg56aa4298586242210ae0192a)btw - I would like to know, what would users preserve for multiline editing. On one hand, you might want to copy result of your experience and post it somewhere, e.g. for a troubleshooting purposes. On the other hand, you might want leading { and [ being ignored, to get only real code hilited?

[18:33](#msg56aa5ee9aaae7a3a7593b078)preserve = prefer

iArnold

[19:44](#msg56aa6f9f79524a9e34b6f80d)  
@pekr We'll add more keyboard navigation and other improvements in next releases.

Those extra's are nice to haves for now.  
In how far will the current VID (code) be reusable for Red 2.0? If not then it might even not be worth it.&gt;

[19:44](#msg56aa6fa35840676d27f63c46)Desperately awaiting the release now... Red really needs progression toward 0.7.0 to gain more serious attention imho.

pekr

[19:48](#msg56aa7086eaf741c118d57c49)Patience, Mr. Yoda, patience :-)

iArnold

[19:50](#msg56aa71225840676d27f63c48)Not if anything to say about it I have

tanstaaf1

[22:11](#msg56aa922980ad69394a7b14d0)@pekr Do you know an sheduled timeline (guess) for mac and linux gui support once the Windows version is complete? This might have been asked and answered but I don't recall seeing it. Trello mentions android as 0.61 but nothing else.

PeterWAWood

[22:22](#msg56aa948ceaf741c118d5844c)@tanstaaf1 @dockimbel has mentioned in the past that Cocoa support may have to wait until a release 1.1 (due to the need for a Red to Cocoa bridge). I think that Linux GUI support will be earlier though that may well use Kaj's GTK 2 bindings.

## Friday 29th January, 2016

tanstaaf1

[01:58](#msg56aac75adc33b33c7548897b)@PeterWAWood Thanks for the info.

dockimbel

[04:05](#msg56aae516eaf741c118d59083)@tanstaaf1 Not scheduled yet, we have a prototype Mac GUI script for Red/System where we can access some GUI API directly, without a bridge, so we might be able to do something there before 1.0.

[04:07](#msg56aae56b586242210ae037fb)For Linux, I guess we'll have to use GTK3, as GTK2 seems obsolete now, which means a new binding.

ghost~5680c5f416b6c7089cc058a5

[09:16](#msg56ab2de78fbaf4220afa0a9d)@dockimbel @qtxie Is this the correct behaviour -

[09:17](#msg56ab2e21586242210ae04070)\[!\[Animation.gif](https://files.gitter.im/red/red/gui-branch/qSFo/thumb/Animation.gif)](https://files.gitter.im/red/red/gui-branch/qSFo/Animation.gif)

[09:17](#msg56ab2e4480ad69394a7b2968)?

[09:18](#msg56ab2e5d80ad69394a7b296d)while selecting the lines, if you move out of the console, then it starts deselecting the line

qtxie

[09:20](#msg56ab2eee69b0429839d1001f)Nope. I will fix that. ;-)

meijeru

[10:58](#msg56ab45c3eaf741c118d59c30)Just tried the new Red Console for the first time. Looks good, but there is a problem with maximising. See https://github.com/red/red/issues/1560

dockimbel

[11:09](#msg56ab4880c54bc2bf180cc3e2)@nc-x Which tool are you using for capturing/saving in gif-anim format?

ghost~5680c5f416b6c7089cc058a5

[11:32](#msg56ab4dcac54bc2bf180cc4aa)@dockimbel

[11:32](#msg56ab4dd48fbaf4220afa0f7c)https://screentogif.codeplex.com

WiseGenius

[14:12](#msg56ab7344eaf741c118d5a428)@nc-x Cool! I was going to post a video of that issue, and now I don't have to. Thanks.

ghost~5680c5f416b6c7089cc058a5

[14:38](#msg56ab794b6b6468374a0a459e):smile:

[14:38](#msg56ab7983c54bc2bf180ccc23)@qtxie Probably I am getting greedy, but can the gui-console please look like this -

[14:39](#msg56ab7991eaf741c118d5a5a8)http://cmder.net/img/main.jpg

[14:39](#msg56ab799c586242210ae04d3a)instead of being white...

qtxie

[14:49](#msg56ab7be780ad69394a7b3733) We would be able to set the backgound color and font color later. ;-)

Oldes

[14:50](#msg56ab7c22586242210ae04de5)I want multiple colors, not just one color. And Also really like the trick with wallpaper image of Console2... as it's one or rare changes to see my beautiful background image hidden under tons of windows.

ghost~5680c5f416b6c7089cc058a5

[14:54](#msg56ab7d2eeaf741c118d5a6a0)Also, the window size of the current gui-console looks out of proportion (atleast to me). The default should be equal to Cmder's as it looks better (again, atleast to me).

qtxie

[14:58](#msg56ab7e08eaf741c118d5a6e1)Yes. Maybe the best way is to let the user to config it.

meijeru

[14:59](#msg56ab7e3caaae7a3a7593de61)@qtxie I hope you saw red/red#1560 ...

qtxie

[15:01](#msg56ab7ed0aaae7a3a7593de7d)@meijeru Yes. It's caused by maximize button doesn't generate `resize` event.

dockimbel

[15:53](#msg56ab8ae980ad69394a7b3aa4)@nc-x Thanks for the link to the tool, will surely use it to post more videos in an easy way. We'll add more customizing options to the console later, first, we need to focus on getting 0.6.0 out. ;)

## Saturday 30th January, 2016

ghost~5680c5f416b6c7089cc058a5

[02:32](#msg56ac20c0586242210ae06d79)@dockimbel Since you plan to use gtk3 for linux gui and since gtk3 also runs on mac, so won't it be possible to run the gui on mac as well?  
Yes, it won't be native. Yes, it would require osx users to download and build gtk3... But atleast they will have something to play till the native gui comes...

[02:45](#msg56ac23e16b6468374a0a65bf)@dockimbel @qtxie  
b) Using the latest master binary (which contains the gui console as default) ------  
`file: hello.red`

```
Red[]

prin "Hello"
```

from Cmder ---

```
red hello.red
```

produces no output.  
whereas

```
red --cli hello.red
```

gives

```
Hello
```

Is this intended?

[02:47](#msg56ac244d80ad69394a7b5693)c) Also, `ask` and `input` don't work in the gui-console...

[03:17](#msg56ac2b4ac54bc2bf180ceda2)Regarding (b) Earlier I thought that the gui-console was exiting too quickly so it didn't show output So  
I changed the script to

```
Red[]

prin "Hello"
wait 10
```

to check whether the gui-console starts or not when `red hello.red`. But the console doesn't even start...

[03:33](#msg56ac2f22dc33b33c7548c340)Oh wait.... When `wait 10` is typed into the gui-console, it goes `Not Responding` whereas this isn't the case for the CLI...

qtxie

[04:30](#msg56ac3c5bdc33b33c7548c463)@nc-x When using gui console, the output will direct to the gui console. So you cannot see it in cmd window. Maybe we should change the default console to CLI console.

[04:31](#msg56ac3ca080ad69394a7b5845)For c), `ask` and `input` are not implemented yet in gui console. They are just two stub funtions for now.

ghost~5680c5f416b6c7089cc058a5

[04:32](#msg56ac3ce0586242210ae06f85)Shouldn't `red hello.red` open up the gui console to display the output like rebol?

dockimbel

[05:30](#msg56ac4a6e6b6468374a0a68e9)@nc-x Yes, it should.

[05:32](#msg56ac4ae28fbaf4220afa3add)We still have some glitches to fix for the console handling on Windows. Though, as soon as the GUI console is used, you can't get output to system console anymore (though in the future, we plan to handle both in a smarter way). For now, you should rely on `--cli` to force the usage of system console.

[05:33](#msg56ac4b24dc33b33c7548c586)BTW, we have a regression on `over` events handling that should be fixed today.

iArnold

[07:07](#msg56ac6148d945103164811147)&gt; Yes, it would require osx users to download and build gtk3... But atleast they will have something to play till the native gui comes...

once tried this but did not work and totally bad user experience.

PeterWAWood

[08:07](#msg56ac6f3fdc33b33c7548c852)@iArnold I found installing gtk3 on OS X pretty straightforward:

First, you need to install X-windows. Simply click on the X.11 icon in the Others collection in LaunchPad and follow the instructions.

Second, you need to install gtk+3 itself. Using HomeBrew that's straightforward:

```
brew install gtk+3
```

iArnold

[08:54](#msg56ac7a3bf68dd35f36a4dbc3)And exactly that brew stuff is the trouble, if you use macport and fink things start biting each other.

dockimbel

[08:57](#msg56ac7b0d8fbaf4220afa3e14)@nc-x Yes, it should, we are working on fixing that.

meijeru

[12:03](#msg56aca6926b6468374a0a6f08)&gt; @meijeru Yes. It's caused by maximize button doesn't generate `resize` event.

[12:04](#msg56aca6ca80ad69394a7b5fad)Is that a Windows problem or can it be solved in the backend?

dockimbel

[12:44](#msg56acb0378fbaf4220afa4203)@meijeru Not a problem at all, we just need to map the maximize event to `resize`.

tanstaaf1

[16:24](#msg56ace3cac54bc2bf180cfc5b)@iArnold I just did a brew install of gtk+3. Some small workarounds were noted but it appears to be adequately installed. I pretty near always have problems with macport, fink, etc. but seldom with brew.

[16:26](#msg56ace431eaf741c118d5d50a)I got the Windows version of red-gui working on my Mac now with PlayOnMac (wine). Haven't yet had any problems but haven't yet really given it a shake down.

[16:28](#msg56ace4c480ad69394a7b6568)I'm concerned about the possibly very long wait for Linux users. I guess they can use Wine... Else a non-native gtk+3 for both linux and mac would seem to be more time effective. I figured I could use gtk+3 anyway.

[17:49](#msg56acf79ec54bc2bf180cfebb)@dockimbel In the context of looking for a GUI toolkit for Python 3 I gotta say I'm SOOOO glad Red will come with cross-platform GUI integrated! I've been trying to pick a GUI toolkit for some Python work and my head hurts from all the choices (most of which are booby trapped in one way or another). This is a huge lever for Red over practically every other language I out there. That said, I think it would be good if the Linux-Mac GUI lack were \*temporarily* addressed sooner rather than a year+ from now. Have you considered wxWidgets (http://www.wxwidgets.org) in particular?

[17:59](#msg56acfa0dc54bc2bf180cff15)Quoting: WxWidgets "is a free, portable GUI class library written in C++ that provides a \*native* look and feel on a number of platforms, with Windows, Mac OS X, GTK, \*X11\*, all listed as current stable targets. Language bindings are available for a number of languages including Python, Perl, Ruby, etc. I am speaking from some considerable ignorance as there may well be something prohibitive about WxW from your perpective. From my perspective its near term support (1) gets Linux and Mac users on board NOW with minimized work (2) claims to be close to native in appearance (3) supports X11 in addition (something I, and I'm hoping at least a few others, would find useful) (4) has close to if not THE largest existent user base due to being both widely cross OS and cross language. Again..I haven't used it and really have no conception how this would work for you. But it would seem to me it would be better than coding specifically to GTK+3 as you are proposing and should buy you YEARS of time to get back to Mac, Linux, etc. native coding.

dockimbel

[18:00](#msg56acfa3daaae7a3a75940f4e)@tanstaaf1 "rather than a year+ from now" Where did you see such ETA? :) I know wxWidgets, no I haven't considered it as I want to have cross-platform native widgets support first. Though, someone could make a wxWidgets backend to Red/View is there's a need for it.

[18:02](#msg56acfaac586242210ae07fe1)I'm not interested in GTK3 as a cross-platform library, but as the default GUI backend on Linux.

tanstaaf1

[18:02](#msg56acfacd80ad69394a7b684c)@dockimbel From the responses I got (or thought I got) there seemed to be a Red 1.1 timeline for native. I did catch your comment about the current state of a solution for Mac...and mention of GTK+3 for Linux. I presumed that would be a whole lot of work and would mean a year or more of me working under Wine.

dockimbel

[18:05](#msg56acfb67c54bc2bf180cff4b)Ah, maybe someone said that Linux/OSX GUI support would be post-1.0, but that's not our roadmap, we want it before 1.0 (probably after Android support).

[18:07](#msg56acfbd780ad69394a7b686d)Actually, supporting GTK+ should go much faster than Windows, because of a single API vs multiple non-compatible versions. Though, GTK3 requires probably a new binding, so I might start with GTK+ first.

tanstaaf1

[18:09](#msg56acfc66aaae7a3a75940fa0)Ok! That's great news. BTW, I try to always be respectful of your time limits. I don't know if that comes across fully in my posts but I am trying to mostly to be patient about "new features" before you get to 1.0. Sometimes I think I might have a suggestion which might help now or might need to be considered now at risk of being harder to allow for later. That's where the suggestion was coming from....

dockimbel

[18:11](#msg56acfcd76b6468374a0a77d3)wxWidget is an old library, so I'm not sure how good is the API. No mobile/touch specific support... Though, the runtime file footprint is very good for such library compared to others.

[18:12](#msg56acfd1a8fbaf4220afa4a44)Also, wxWidget is C++, so requires a preliminary C wrapper lib to write in order to access the API.

[18:14](#msg56acfd8780ad69394a7b68aa)@tanstaaf1 No problem, suggestions are always welcome. Though, don't think we haven't done our homework and spent often hours searching and studying libs before deciding on the way to go. ;-)

tanstaaf1

[18:18](#msg56acfe90586242210ae08079)As you know, I am sort of a Rip VanWinkle (if you know the story) waking back into programming after a 20+ year nap. I am appalled at the state of things in general and specifically in the often unnecessary complexity which has covered nearly everything. I am continually reminded, anew, how "revolutionary" Red is ... in a back to the future sort of way!

dockimbel

[18:22](#msg56acff59dc33b33c7548d5be)@tanstaaf1 Now I better understand why you like Red. ;-) Indeed, we try to get back to the simplicity we used to have, and skip as much as possible the mess that software building has become (don't even get me started on web programming ;-)).

iArnold

[19:25](#msg56ad0e35d945103164811255)@tanstaaf1 Maybe, but even having to use those command/terminal tools is very bad for user experience.

## Monday 1st February, 2016

ghost~5680c5f416b6c7089cc058a5

[09:27](#msg56af24ebdc33b33c754910ee)@qtxie @dockimbel

[09:27](#msg56af2510dc33b33c754910f4)(a) `filename: test.red`

```
Red []

print
```

`red --cli test.red` produces

```
*** Script error: print is missing its value argument
*** Where: print
```

Whereas `red test.red` opens the gui-console and immediately automatically closes it.  
Expected behaviour: The gui-console should open, print the error and pause itself waiting for user input.

[09:28](#msg56af2552586242210ae0bc2a)\[!\[doesnt show errors.gif](https://files.gitter.im/red/red/gui-branch/g2fc/thumb/doesnt-show-errors.gif)](https://files.gitter.im/red/red/gui-branch/g2fc/doesnt-show-errors.gif)

[09:29](#msg56af2588aaae7a3a75944b67)(b)

```
Red []

a: ask "?: "
print a
```

`red test.red` asks for input, prints the input, then whatever key you press "does not close" the gui-console and it has to be manually closed.

[09:30](#msg56af25c4586242210ae0bc43)\[!\[noclose.gif](https://files.gitter.im/red/red/gui-branch/Nxmx/thumb/noclose.gif)](https://files.gitter.im/red/red/gui-branch/Nxmx/noclose.gif)

[09:32](#msg56af2629dc33b33c7549112a)(c)

```
Red []

print 1
```

`red test.red` The gui-console should get closed whenever ANY KEY is pressed. But it closes only on pressing ENTER, and hence we are able to type anything in the gui-console even after the script is over.

[09:33](#msg56af26646b6468374a0ab41d)\[!\[shouldn't allow typing.gif](https://files.gitter.im/red/red/gui-branch/ynnC/thumb/shouldn\_t-allow-typing.gif)](https://files.gitter.im/red/red/gui-branch/ynnC/shouldn\_t-allow-typing.gif)

[09:34](#msg56af26b4c54bc2bf180d3ac1)(d) Also, sometimes `red test.red` just opens the gui-console and INSTANTLY AUTOMATICALLY exits itself. (Emphasis on SOMETIMES)

[09:36](#msg56af2702dc33b33c75491156)(e) There are bugs with writing multi-line codes... Is is even implemented yet? If yes, then I will post the problems here. If no, then I will wait...

[09:36](#msg56af27116b6468374a0ab435)(f) That's it for now.... :wink2:

dockimbel

[10:19](#msg56af3137eaf741c118d6172e)FYI: I upgraded the View documentation to match the current master branch. Especially, the \[event flow](https://github.com/red/red/wiki/Red-View-Graphic-System#event-flow) part has been deeply modified.

[10:26](#msg56af32e3dc33b33c754913b3)@nc-x  
\* (a) Agreed.  
\* (b) That's the expected behavior, use `quit` to exit the console session in such case.  
\* (c) Typing: yes, it's a bug. Though the console shouldn't close after `print`.  
\* (d) Hmm... Try compiling the gui-console in debug mode (just wait for a fix for a regression on debug mode today).  
\* (e) Please report them here on in a ticket on Github. We haven't tested that much so far.  
\* (f) Thanks for the nice and extensive reporting! ;-)

[10:27](#msg56af32fceaf741c118d61782)@qtxie ^--- some fun for you. ;-)

ghost~5680c5f416b6c7089cc058a5

[11:28](#msg56af41476b6468374a0ab8bc)Regarding (b) and (c) -

[11:31](#msg56af41f7dc33b33c75491630)When you code a CLI application in Visual Studio and compile and run it from VS itself, it starts the app in Console (cmd) , and instead of closing on its own or requiring to manually close, it justs adds "Press any key to continue..." in the end of the program and any key pressed closes it.

[11:33](#msg56af42938fbaf4220afa8acf)The current behaviour of gui-console while running a script is that it requires 'quit' to be typed (as you said above). Though if this is the case, then why do scripts not using ask exit when "enter" is pressed.

[11:35](#msg56af42ebdc33b33c75491651)Pressing ENTER exits the gui-console after running the script when not using 'ask'. When 'ask' is used in the program, the console needs to be manually closed.

[11:35](#msg56af430d6b6468374a0ab914)@dockimbel I would, personally, prefer the Visual Studio way.

[11:36](#msg56af43348fbaf4220afa8ae3)The above was (i)

[11:36](#msg56af433a8fbaf4220afa8ae4)Now -

[11:36](#msg56af433f8fbaf4220afa8ae9)(ii)

[11:37](#msg56af4364eaf741c118d61a4f)Regarding (d) - Never knew there's a debug mode... Will try tomorrow.

[11:38](#msg56af43b280ad69394a7ba8b2)(iii) I don't have access to a pc currently, so can't post the screen-recording. But here's a basic description -

[11:38](#msg56af43bcc54bc2bf180d3feb)Of (e)

[11:38](#msg56af43be8fbaf4220afa8afb)-

[11:38](#msg56af43d0eaf741c118d61a68)Open the gui-console

[11:39](#msg56af43d6dc33b33c7549167b)Then type

[11:39](#msg56af43f36b6468374a0ab945)\`a: func \[] [

[11:39](#msg56af43ff6b6468374a0ab948)\`

[11:40](#msg56af44126b6468374a0ab94d)-\_-

[11:40](#msg56af442980ad69394a7ba8cb)-\_-

[11:40](#msg56af4445586242210ae0c1a6)Well lets startover

[11:42](#msg56af449bc54bc2bf180d4010)Type in console -

[11:43](#msg56af44d9dc33b33c754916b5)`a: func[] [`

[11:43](#msg56af44e1586242210ae0c1d6)And press enter

[11:44](#msg56af4520dc33b33c754916c8)You get into next line

[11:44](#msg56af452baaae7a3a759450ef)Then press up arrow

[11:45](#msg56af455d8fbaf4220afa8b41)It breaks the multiline block. And shows the prompt.

[11:45](#msg56af4566586242210ae0c1ed)This is the first bug.

[11:47](#msg56af45b86b6468374a0ab98e)Secondly, it shows the prompt but is still within the above block of the function. So any code you have written now errors out if you thought that the above block was over.

[11:47](#msg56af45e8c54bc2bf180d404f)Well, I don't know how well I have been able to explain. I am very bad at it.

[11:48](#msg56af460d8fbaf4220afa8b5e)But doing the above steps, you will be able to reproduce it and understand what i mean...

## Tuesday 2nd February, 2016

ghost~5680c5f416b6c7089cc058a5

[03:30](#msg56b022b8586242210ae0f05b)thanks, the bug is fixed now...

[03:35](#msg56b02417dc33b33c754944a8)@dockimbel I compiled the gui-console in debug mode, created `a.red` with the following content

```
Red[]

print "hello"
print 1.0
print 10
```

and did `gui-console a.red` from CMD.

1\) Is this the right way to execute it?  
2\) If yes then - the gui console doesn't show any output. Instead it just opens and waits. The output is shown in the CMD itself -

```
Symbols
Literals
Declarations
Functions
Main program
system: context [version build words platform cata...
catalog: context [datatypes actions natives errors...
errors: context [throw note syntax script math acc...
throw: context [code type break return throw conti...
note: context [code type no-load]
syntax: context [code type invalid missing no-head...
script: context [code type no-value need-value not...
math: context [code type zero-divide overflow posi...
access: context [code type cannot-open invalid-utf...
user: context [code type message]
internal: context [code type bad-path not-here no-...
state: context [interpreted? last-error]
schemes: context []
ports: context []
locale: context [language language* locale locale*...
options: context [boot home path script args do-ar...
float: context [pretty? full? on-change*]
script: context [title header parent path args]
standard: context [header error]
header: context [title name type version date file...
error: context [code type id arg1 arg2 arg3 near w...
system/lexer: context [make-binary make-tuple make...
'png context [title name mime-type suffixes encode...
'jpeg context [title name mime-type suffixes encod...
'bmp context [title name mime-type suffixes encode...
'gif context [title name mime-type suffixes encode...
face!: context [type offset size text image color ...
font!: context [name size style angle color anti-a...
para!: context [origin padding scroll align v-alig...
system/view: context [screens event-port metrics p...
metrics: context [screen-size dpi]
system/view/platform: context [get-screen-size on-...
system/view/VID: context [reactors default-font th...
react-ctx: context [face]
system/console: context [prompt history limit catc...
make context [type offset size text image color me...
make context [name size style angle color anti-ali...
make context [type offset size text image color me...
actors: context [on-close on-resizing]
hello
1.0
10

*** Runtime Error 1: access violation
*** in file: /C/Users/ABC/Desktop/red-master/environment/console/datatypes/string.reds
*** at line: 339
***
***   stack: red/string/get-char 02871000h 1
***   stack: terminal/string-width? 02773DE8h 0 199466 77
***   stack: terminal/string-lines? 02773DE8h 0 10510272 77
***   stack: terminal/select 00A05F10h 333 1 true
***   stack: terminal/ConsoleWndProc 000C03C6h 513 1 1573197
```

dockimbel

[03:36](#msg56b024568fbaf4220afab8bc)@nc-x In debug mode, the output is redirected to the system shell, so, yes, it is expected.

ghost~5680c5f416b6c7089cc058a5

[03:37](#msg56b024656b6468374a0ae5a6)Ok

[03:38](#msg56b024b1586242210ae0f088)So, the above was the information you required, right?

dockimbel

[03:38](#msg56b024bb6b6468374a0ae5b4)For launching the console, if you want to use the system shell, you need to use `red --cli` mode, eventually passing an argument file to run on start. In such case, Red will quit after the script is run (unless you force it to stay open using an additional `--catch` command-line option (we might need a better name for this one).

[03:39](#msg56b024d58fbaf4220afab8d1)@nc-x Yes, its looks like it is a job for @qtxie. ;-)

ghost~5680c5f416b6c7089cc058a5

[03:40](#msg56b02531eaf741c118d645a6)--cli is alright... What about the gui-console. How to exit it after the script is finished? that is something I still don't understand.

dockimbel

[03:41](#msg56b0255680ad69394a7bd679)@nc-x In the case of the GUI console, you are supposed to work from it, not swapping between the system shell and GUI console, therefore, even if you launch it from command-line (most users would just double-click it) with an argument file, it will stay open, that's the intended behavior. That's also how Rebol console behaves.

ghost~5680c5f416b6c7089cc058a5

[03:41](#msg56b0256b6b6468374a0ae5d4)I would still prefer the VS way. But okay...

[03:42](#msg56b02598eaf741c118d645af)And can you please give an example of how to use `--catch` ?

dockimbel

[03:43](#msg56b025c6c54bc2bf180d6db7)@nc-x `red --cli --catch tests/demo.red`

ghost~5680c5f416b6c7089cc058a5

[03:43](#msg56b025f26b6468374a0ae5e5)

```
red --cli --catch a.red
*** Error: cannot access argument file
```

[03:44](#msg56b02615586242210ae0f0b3)And it starts the cli- console

dockimbel

[03:44](#msg56b0261980ad69394a7bd695)@nc-x Your VS use case is for a CLI app, the gui-console is really a GUI app (it runs on top of the View engine), think of it as an interactive shell inside a GUI system.

ghost~5680c5f416b6c7089cc058a5

[03:44](#msg56b0262c80ad69394a7bd699)okay

dockimbel

[03:45](#msg56b02640586242210ae0f0b6)@nc-x Probably an issue with options ordering, the parser is probably not smart enough yet.

ghost~5680c5f416b6c7089cc058a5

[03:45](#msg56b026636b6468374a0ae5fa)Okay...

dockimbel

[03:45](#msg56b02672aaae7a3a75948144)Indeed, `--catch` goes first... let me fix that annoying issue...Hmm, actually `--catch` messes up the new console code, fixing it now.

ghost~5680c5f416b6c7089cc058a5

[03:46](#msg56b026abc54bc2bf180d6dd9)Time to use the gui-console instead of cli-console now... :D  
Will the autocomplete cycling behaviour and ability to copy the multiline functions without the leading prompt be there in 0.6.0 ?

dockimbel

[03:47](#msg56b026e5aaae7a3a75948153)@nc-x Unsure, depends on the amount of work required to support it. @qtxie should answer that.

ghost~5680c5f416b6c7089cc058a5

[03:50](#msg56b0278dc54bc2bf180d6df1)okay

dockimbel

[03:51](#msg56b027de6b6468374a0ae624)@nc-x I haven't looked into the possible removal of leading prompts when copying, is it deterministic or can we encounter ambiguous cases? Did you give it some thoughts? Maybe you should open a ticket to describe it fully?

ghost~5680c5f416b6c7089cc058a5

[03:56](#msg56b028e4586242210ae0f119)There shouldn't be any ambiguous cases. Red is free-form enough, so it shouldn't be a problem.

[03:56](#msg56b028f5aaae7a3a7594819e)Opening a ticket - will do sometime soon...

[04:15](#msg56b02d72aaae7a3a75948235)@dockimbel Any reason why the output of `probe` is so ugly (I mean unformatted)?  
On the other hand Rebol's output is so clean and readable.

dockimbel

[04:22](#msg56b02ef9c54bc2bf180d6ed0)@nc-x We haven't implemented yet newlines preservation in the lexer, so the serialization of blocks is flat currently. Not sure in which release we'll add it (it's a not-so-trivial addition), but if 0.6.0 generates significantly more traction than previous releases, then probably in the next one. ;-)

ghost~5680c5f416b6c7089cc058a5

[04:25](#msg56b02fa8aaae7a3a7594827b)0.6.0 is gonna be a much bigger release than all the previous versions.  
Though it would have been better and easier to promote Red 0.6.0 if there was something like http://phoronix.com/ for windows related blogs. Phoronix is mainly Linux. So when the Linux GUI comes, maybe someone can contact them and ask them for a blog post for Red...

dockimbel

[04:27](#msg56b0301ceaf741c118d646dd)Phoronix: indeed. For Windows, I guess we can target all the RAD tools communities and bloggers.

ghost~5680c5f416b6c7089cc058a5

[04:28](#msg56b03071dc33b33c75494642)Yup. So someone needs to find and contact them just before the 0.6.0 release. I don't know any Windows blogger, lol, most blogs I have come across are Linux or OSX based.

dockimbel

[04:28](#msg56b0307edc33b33c75494643)Same here.

qtxie

[06:35](#msg56b04e35f68dd35f36a4e2f3)&gt; Time to use the gui-console instead of cli-console now... :D  
Will the autocomplete cycling behaviour and ability to copy the multiline functions without the leading prompt be there in 0.6.0 ?

[06:36](#msg56b04e55e6be530f440f6a69)For autocomplete cycling, Maybe a quick hack will make it work. I will give it a try. ;-)  
For stripping the leading prompt, the current data structure doesn't support it. So need more work to support it.

dockimbel

[06:37](#msg56b04ea7c54bc2bf180d7198)@qtxie Could we have a callback call to a user-provided function when the output is selected, before sending it to the clipboard?

qtxie

[06:42](#msg56b04fdad94510316481187e)Yes. we can. The problem is we cannot distinguish the prompt from the output. The underground data structure doesn't have this information.

## Thursday 4th February, 2016

Oldes

[08:30](#msg56b30c435245f2e110e73388)@qtxie on Windows7 there is some padding on left side of the gui console, which is black and does not redraw when I resize the window.

[08:31](#msg56b30c4b5245f2e110e7338a)\[!\[blob](https://files.gitter.im/red/red/gui-branch/1q2b/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/1q2b/blob)

bitbegin

[08:34](#msg56b30d1c5245f2e110e733a2)@qtxie This is also my issue.

[08:35](#msg56b30d6d5245f2e110e733b2)@Oldes should be on left side

Oldes

[08:36](#msg56b30d7e34ca6b3f59447b24)

[08:40](#msg56b30e84a867d14059a370c2)I have a bad feeling it could be because of :point\_up: \[my comment](https://gitter.im/red/red/gui-branch?at=56a7c6846b6468374a09a511), but cannot find anything suspicious in the code.

[08:51](#msg56b3110a958093bc12d1a8be)@qtxie Ok.. this is the cause: https://github.com/red/red/blob/master/environment/console/terminal.reds#L621

[08:51](#msg56b311205245f2e110e73468)Better to have zero padding than this invalid:)

qtxie

[12:07](#msg56b33ee79988594d700be13f)@Oldes @bitbegin Should be fixed in latest commit.

bitbegin

[12:07](#msg56b33f1870aea8e629e6368c)ok

Oldes

[12:47](#msg56b3485070aea8e629e63864)@qtxie seems to be fixed only for first line:)

[12:47](#msg56b3485a70aea8e629e63866)\[!\[blob](https://files.gitter.im/red/red/gui-branch/oezg/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/oezg/blob)

[12:52](#msg56b3498770aea8e629e6388e)@qtxie also, what is

```
vt/bg-color
```

as defined here https://github.com/red/red/commit/5ee88a39f8c4578fab5d8bc48712a45b1d3f64a0#diff-a42a4ff9170d0e3eec3b77f616ac1278R623 It seems not to be visible anywhere.

[12:53](#msg56b349c83bd55a660df55443)Ah.. it is color used when selecting text as a normal bg.

[12:55](#msg56b34a316002fae41579c015)Another small console issue is, that it is not possible to start text selection bellow the last printed line.

## Friday 5th February, 2016

qtxie

[07:00](#msg56b448a19988594d700be44a)@Oldes Thanks. Both issues should be fixed now.

Oldes

[07:46](#msg56b453735cc201794d498dac)@qtxie Cool, you are the best! So here is another detail... when you select over multiple lines, the first one black background should be to the end of line too:

[07:47](#msg56b4537b25142e764dfd10a9)\[!\[blob](https://files.gitter.im/red/red/gui-branch/XXMf/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/XXMf/blob)

[07:54](#msg56b4551e6002fae41579f32e)And if I can be a little bit 胆大, would it be possible to have \_word wrapping_ optionally disabled?

WiseGenius

[08:00](#msg56b4568b073653e7151bd6f4)@Oldes I think there is such an option, but it doesn't have any effect yet. See https://github.com/red/red/issues/1576.

[08:01](#msg56b456cc65d6cbe7290442de)Oh wait, you mean for the console? Well, I expect #1576 would probably have to be fixed first anyway.

dockimbel

[08:56](#msg56b463b170aea8e629e66cf0)@Oldes Starting to learn some Chinese? :-)

## Sunday 7th February, 2016

JenniferLee520

[07:26](#msg56b6f18f9c53e6696d4894cf)I make 'Base C a child of 'Base P, and 'Base C has the 'Drag-on option. If the color of 'Base P is none and there is nothing Drawn on 'Base P under the same area of 'Base C, 'Base C will not be able to drag. ... I guess the capturing phase has a flaw.

ghost~5680c5f416b6c7089cc058a5

[14:24](#msg56b753a3939ffd5d15f6465c)@qtxie 1. has the random gui-console crash issue when interpreting code (reported here - 2nd Feb) been fixed?

[14:26](#msg56b7540c1c80c61f4d0ad261)2. Does the gui-console now show ( and wait ) errors while the code is being interpreted ( reported earlier as well) ?

## Monday 8th February, 2016

ghost~5680c5f416b6c7089cc058a5

[09:25](#msg56b85f1ad09b3b1c4dda3d45)I opened Issues on Github for them...

WiseGenius

[15:44](#msg56b8b7dad09b3b1c4dda4cea)Would it be possible for Red code to have access to the `Right to left Reading order` shown in the context menu of `field`s and `area`s in Windows XP and Windows 7? I realize that this would probably be specific to Windows, but still desire it. Such a facet(?) may have to have 3 settings. For example:

```
l: layout [a: area]
a/para: make para! [align: 'center]
view l
```

`a` starts out with its text centered. After `Right to left Reading order` is selected from the context menu, the text is aligned right. After it's deselected from the menu, the text is aligned left, and not back to how it was originally (even though `a/para/align` is still `center`). So it seems that there are 3 settings. Perhaps they should be `none` (the default, which it started out with in the example), `'RTL` and `'LTR`?

## Wednesday 17th February, 2016

WiseGenius

[16:29](#msg56c49ff81c98d5621ea7941f)@dockimbel \[Earlier](https://gitter.im/red/red/gui-branch?at=56a9df67586242210ae00342), you mentioned that:  
&gt; All events handler are named in the form: `on-`.

However, after spending a fair amount of time puzzling over why `on-resize` wouldn't work, I was surprized to learn that the handler for `resize` is called `on-size`.  
I understand that some handler's names have been shortened, such as `on-mid-down`, `on-mid-up` and `on-dbl-click`, but I suspect `on-size` is a mistake? Especially when the handler for `resizing` is called `on-resizing`.

## Thursday 18th February, 2016

dockimbel

[01:43](#msg56c521bc34be37957fd0f8e3)@WiseGenius Indeed, looks like a typo. For `on-dbl-click`, I need to do something about it too, as it is not fully satisfying.

[02:46](#msg56c5306f28357a987fbebaca)@WiseGenius Events/handlers names have been normalized now.

WiseGenius

[08:39](#msg56c5832434be37957fd10336)

```
foreach [event-name actor-name] system/view/evt-names [
	if not equal? actor-name to word! append copy "on-" event-name [
		print [event-name {doesn't match} actor-name]
	]
]
```

:thumbsup:

PeterWAWood

[08:52](#msg56c5863128357a987fbec401)@WiseGenius Did you know you could have used the single function

```
not-equal?
```

rather than the two

```
not
```

and

```
equal?
```

?

WiseGenius

[09:02](#msg56c588baaa5f8e7a7f6749f0)Yes I did, thanks. I felt like typing a space for the ease. I was also inconsistent with the way I formed my strings. I was tempted to fix that, but it was more of a useless statement of the obvious than useful code. Nevertheless, I was hoping someone might tell me if there was a better way to write it, as I usually do. So thanks again for the tip.

iArnold

[09:23](#msg56c58d7e55deeec468621572)And

```
not-equal?
```

is defined as the result of

```
not equal?
```

?

rebolek

[09:25](#msg56c58dff443730631ea97ce2)No.

[09:25](#msg56c58e03443730631ea97ce3)

```
red>> ?? not-equal?
not-equal?: make native! [["Returns true if two values are not equal" value1 [any-type!] value2 [any-type!]]]
```

dockimbel

[09:29](#msg56c58f0b1c98d5621ea7bd37)`if not` =&gt; `unless`

WiseGenius

[09:32](#msg56c58fba611729797fd29f39):smile:

## Wednesday 2nd March, 2016

rebolek

[11:03](#msg56d6c88206ba9a282a287534)How do I use actors with BASE style? I can make custom style with custom actor from i.e. BUTTON, but that doesn’t seem to work with BASE. See this example:

```
Red [
	Needs: 'View
]

system/view/auto-sync?: no

extend styles [
	cbutton: [
		template: [
			type: 'button size: 100x50 color: red
			actors: object [on-click: func [f e] [print "click"]]
		]
	]
	cbase: [
		template: [
			type: 'base size: 100x50 color: red
			actors: object [on-click: func [f e] [print "click"]]
		]
	]
]

win: layout [
	cbutton "button"
	cbase "base"
]

view win
```

[11:06](#msg56d6c9519b722b537d18cf2f)Or, simpler example, shouldn’t this work?

```
Red [Needs: 'View]

view [base "base" [print "click"]]
```

dockimbel

[11:10](#msg56d6ca270bdb886502f6a93e)`click` event is currently only generated for button type, use `down` instead.

rebolek

[11:12](#msg56d6ca8450b462292adf6237)Thanks, I will try it. Shouldn’t the `default-actor` for BASE (in %styles.red) be also `on-down` then?

dockimbel

[11:12](#msg56d6caa40bdb886502f6a961)Yes, it should. Fixing it now.

rebolek

[11:27](#msg56d6ce0ab01413547d897023)Thanks.

[12:04](#msg56d6d6ddb01413547d89725e)Another problem with BASE seems to be DRAG event. I can catch DRAG-START and DROP, but not DRAG. Is it expected?

```
Red [
    Needs: 'View
]

system/view/auto-sync?: no

extend styles [
    cbase: [
        template: [
            type: 'base size: 100x50 color: red
            options: [drag-on: 'down]
            actors: object [
            	on-drag-start: func [f e] [print "drag-start"]
            	on-drag: func [f e] [print "drag"]
            	on-drop: func [f e] [print "drop"]
            ]
        ]
    ]
]

view [cbase "base"]
```

pekr

[12:07](#msg56d6d79a44ba0664026a68ed)So I need two separate actors for a button? 'click and 'down, if I want to also catch Enter or a space?

rebolek

[12:10](#msg56d6d81e0bdb886502f6acbe)@Pekr No, `on-click` catches both mouse click and space for BUTTON. You need it for BASE however, but that’s expected, I guess.

pekr

[12:11](#msg56d6d87b06ba9a282a287908)It shoudl catch also Enter then, maybe even tab. With some forms, I am used to use tabbing and a keyboard navigation by general. Hitting Enter upon the hilited button is quite normal ...

rebolek

[12:19](#msg56d6da4db01413547d89734a)You’re right I guess, ENTER should be caught also. I don’t think that TAB should be caught by ON-CLICK, this is ON-FOCUS business I guess.

pekr

[12:21](#msg56d6dada50b462292adf6656)Well, the question is, if 'on-click should really catch any key. On the other hand, it is a bit tricky situation - we were doing kiosk system long before iPhone existed :-) , and touch surfaces (M3, Ello, etc.) offered you a virtual keyboard. And all it was doing was just hiding a mouse pointer and passing a click ...

[12:21](#msg56d6dae60bdb886502f6ad79)I don't have clear opinion on that ....

[12:22](#msg56d6db0b9b722b537d18d388)Well, other than that by using the base style, we should be able to do a full fledged widgets, e.g. simulate buttons, etc., as R2 VID does ...

rebolek

[12:31](#msg56d6dd1d9b722b537d18d41e)I think that it’s already possible to implement custom widget with BASE style.

dockimbel

[12:59](#msg56d6e39ff760676329baec11)@rebolek Your code works fine here (Win7), I get the "drag" printed out.

rebolek

[13:46](#msg56d6eec5048f9e65291b6141)Interesting, I’m on W7 VM and I get only "drag-start" and "drop".

pekr

[14:00](#msg56d6f20506ba9a282a288072)I get drag-start, drop - Windows 10, pasted above code into the console.

rebolek

[14:04](#msg56d6f2d206ba9a282a2880b4)So no "drag" too?

pekr

[14:08](#msg56d6f3dc44ba0664026a70e8)I just press the button, try to "drag it", but no other events apart from those 2 mentioned above ....

rebolek

[14:08](#msg56d6f3f244ba0664026a70ef)Same as here. Thanks.

pekr

[14:09](#msg56d6f403048f9e65291b62ea)btw - does R3 have drag-start? What is that good for? How does it differ from the ongoing drag event and why is that useful?

rebolek

[14:10](#msg56d6f44af760676329baf141)For example, you can add some decoration on drag-start to empathize that the face is being dragged.

[14:11](#msg56d6f475048f9e65291b630a)I guess you could do it with drag only too, but then you need some condition to check for start.

pekr

[14:11](#msg56d6f48e44ba0664026a7117)well, but what is the difference, between the GUI starts to produce 'drag event itself? One other event? I mean - what is the time difference there? From my pov, it is not much useful event, unless I am missing something, which is easily possible :-)

[14:12](#msg56d6f4c506ba9a282a28815e)Ah, ok, now I see ...

rebolek

[14:13](#msg56d6f51e06ba9a282a28817f)@Pekr, here’s an (buggy here) example. Can you test it, please?

```
Red [
    Needs: 'View
]

system/view/auto-sync?: no

extend styles [
    cbase: [
        template: [
            type: 'base size: 100x50 color: red
            options: [drag-on: 'down]
            actors: object [
            	on-drag-start: func [f e] [f/color: yellow show f]
            	on-drag: func [f e] [print "drag"]
            	on-drop: func [f e] [f/color: red show f]
            ]
        ]
    ]
]

view [cbase "base"]
```

[14:14](#msg56d6f53b50b462292adf6db9)It disappears on drop here.

pekr

[14:15](#msg56d6f5749b722b537d18dbae)The same here ....

rebolek

[14:15](#msg56d6f58d0bdb886502f6b549)Thanks, I’ll open ticket for it.

dockimbel

[14:16](#msg56d6f5d350b462292adf6def)Works fine here again. But you can open a ticket anyway, @qtxie should have a look at it.

pekr

[14:16](#msg56d6f5d59b722b537d18dbcd)btw - IIRC, in Gabriele's R3 GUI attempt, he had something like the draggable? droppable? elements. Not sure those were actors, but if underlying face was draggable or droppable, corresponding icon/change in UI appeared

[14:22](#msg56d6f71106ba9a282a288241)Question towards the `move`and `resize`- A window has moved / has been resized - is my understanding correct, that those two signal end of the move/resize operation?

endo64

[17:55](#msg56d7290c50b462292adf8087)@rebolek it disappears here too, Win8.1 x64.

rebolek

[17:56](#msg56d72939b01413547d898f43)Thanks for report, @endo64

endo64

[17:56](#msg56d72964b01413547d898f4a)But wait, if I move very little, it works, if I move a bit wide then it disappears, I think if window would a bit bigger we can see it.

[17:58](#msg56d729ab0bdb886502f6c8e0)try this

```
view [button 500x500 cbase "base"]
```

rebolek

[17:58](#msg56d729af50b462292adf80ce)I made new version of the test:

```
Red [
    Needs: 'View
]

system/view/auto-sync?: no

diff: 0x0

extend styles [
    cbase: [
        template: [
            type: 'base size: 10x50 color: red
            options: [drag-on: 'down]
            actors: object [
            	on-drag-start: func [f e] [
            		diff: e/offset
            	]
            	on-drag: on-drop: func [face e] [
            		face/offset: face/offset + e/offset - diff
            		difx: e/offset/x - diff/x
            		index: index? find face/parent/pane face
            		left-face: face/parent/pane/(index - 1)
            		right-face: face/parent/pane/(index + 1)
            		left-face/size/x: left-face/size/x + difx
            		right-face/offset/x: right-face/offset/x + difx
            		right-face/size/x: right-face/size/x - difx
            		show face/parent
            	]
            ]
        ]
    ]
]

view [button "vlevo" b: cbase button "vpravo" [print b/offset]]
```

[17:59](#msg56d729fe048f9e65291b7715)With this version, first drag doesn’t work, but it starts working on second drag (buttons change their size together with dragging).

[18:00](#msg56d72a31f760676329bb056d)That is with the compiled version. With interpreted version, it still ignores `on-drag` here.

endo64

[18:00](#msg56d72a54f760676329bb057a)I tested on console.

rebolek

[18:01](#msg56d72a7ef760676329bb058b)@endo64 I found that the offset of the `cbase` is changed to some high number, that’s why it disappears.

endo64

[18:02](#msg56d72aa3f760676329bb0599)@rebolek Yes, that's correct.

rebolek

[18:04](#msg56d72b119b722b537d18f06f)When I see all the little inconsistencies between different Windows versions, I don’t wonder why why Carl decided for custom widget set with original VID ;)

## Thursday 3th March, 2016

dockimbel

[05:57](#msg56d7d2399b722b537d191bb1)@rebolek He just underestimated the amount of skill and work required to build a set of widgets which can compete in number and quality with native ones (not even mentioning deep integration with existing OS features). There's no perfect solution for that unfortunately.

rebolek

[06:26](#msg56d7d925048f9e65291ba38f)@dockimbel of course, I agree that linking to OS widgets is the way to go. I know very well from R3GUI what it means to write (good) custom widgets :)

dockimbel

[06:58](#msg56d7e0a450b462292adfad8a)Well, even native widgets have their issues, like incompatibilities across OS versions. I think the best way is a mix of native and custom widgets. We are heading towards that.

nickantonaccio

[12:36](#msg56d82fd606ba9a282a28d6e4)@dockimbel You're doing it right

dockimbel

[14:39](#msg56d84cb3048f9e65291bc2e7)@nickantonaccio Thanks Nick.

## Wednesday 9th March, 2016

rebolek

[09:41](#msg56dfefb168ddef776469df7c)Is there something like `on-init` event?

pekr

[09:44](#msg56dff09b19834f3c353614aa)Wouldn't `on-create`be sufficient for your purposes?

[09:45](#msg56dff0b868c077746483b2c4)"In addition to the GUI events, it is possible to define an on-create actor which will be called when the face is shown for the first time, just before system resources are allocated for it."

rebolek

[09:46](#msg56dff0e8a54928411669a088)@pekr It would, I just didn’t knew the name :) Thanks!

pekr

[09:48](#msg56dff17219834f3c353614ee)Well, I would prefer it being called `on-init`probably, as well as having somethin like `on-destroy`

[09:49](#msg56dff18e68c077746483b2ff)btw - objects do have `on-change`, but not sure if it would be usefull in terms of the GUI

Cybarite

[10:26](#msg56dffa41ddfe3d431628f7d0)If I change %draw-graphics.red to view instead of saving .png's it exits immediately. If I run unchanged it stores the .pngs correctly.

```
view [
	title "Red Draw Graphics"
	origin 0x0 space 0x0
	base 1900x1280 draw 800x800 [
		pen red 
	    font small
	    text 5x5 "0x0"
	    line-width 2
	    line 20x20 200x20 195x16
	    line 200x20 195x24

	    line 20x20 20x200 16x195
	    line 20x200 24x195

	    font Arial
	    text 205x12 "X"
	    text 12x205 "Y"
	]
]
```

dockimbel

[10:27](#msg56dffaa5ddfe3d431628f7e6)@Cybarite When I copy/paste your code in the console here, I get:

```
*** Script error: VID - invalid syntax at: [800x800 [pen red font small text
```

[10:29](#msg56dffb1568c077746483b5e0)Also, I get more errors on `small` and `arial` not been defined.

[10:31](#msg56dffb7b126367383572318e)Here's a fixed version that will display properly:

```
lisp

Arial: make font! [name: "Consolas" style: 'bold]
small: make font! [size: 9 name: "Consolas" style: 'bold]

view/tight [
    title "Red Draw Graphics"
    base 800x800 white draw [
        pen red 
        font small
        text 5x5 "0x0"
        line-width 2
        line 20x20 200x20 195x16
        line 200x20 195x24

        line 20x20 20x200 16x195
        line 20x200 24x195

        font Arial
        text 205x12 "X"
        text 12x205 "Y"
    ]
]
```

Cybarite

[10:38](#msg56dffd2d68c077746483b683)Thanks Doc. that was a sloppy paste on my part. my first code into gitter.... your update is compiling and executing for me... trying to understand the differences. This is first draw that is working for me outside of the tab example.

dockimbel

[10:40](#msg56dffd8968c077746483b6aa)@Cybarite Be sure you're using the latest Red build from master branch. Experiment first by running the code directly instead of compiling it.

Cybarite

[13:11](#msg56e02105b0cc3f1b4151635a)I don't see how red console is directed to understand Needs: View. So I get view undefined.

dockimbel

[13:13](#msg56e0218268c077746483c085)Which console precisely?

Cybarite

[22:14](#msg56e0a04d11a3dbf55aca89af)Red 0.5.4

## Thursday 10th March, 2016

dockimbel

[02:57](#msg56e0e27c9f24605773d6c5a3)I mean where is the console coming from? How do you build it?

iArnold

[06:24](#msg56e11320467b443409df62fa)Needs: 'View is in the info block of the program and this triggers the compiler to include the view engine.

Cybarite

[08:43](#msg56e133ab11a3dbf55acaa5bf)oh .... modified? http://static.red-lang.org/dl/win/red-054.exe  
connecting to: static.red-lang.org  
\== 13-Jun-2015/0:41:41

rebolek

[08:44](#msg56e133f00055f8f35a81d8b4)@Cybarite you should probably compile the console yourself from latest sources.

Cybarite

[13:40](#msg56e179353194fbd11095d35c)Thanks @rebolek this got me going

```
do/args %red.r {%/c/red/environment/console/gui-console.red}
```

rebolek

[14:45](#msg56e188709f24605773d6ed57)@Cybarite :thumbsup:

pekr

[15:08](#msg56e18e07618c335373ea9b2e)@Cybarite - I like the following aproach - hitting the red.r, it gets me into the R2 console. Then I use the `rc`(recompile function) for subsequent compilations, e.g.:

[15:09](#msg56e18e47c7364f7926bdc1ab)

```
`
rc %environment/console/gui-console.red
; alternatively:
rc "-t Windows %environment/console/gui-console.red"
```

dockimbel

[15:13](#msg56e18f0ac7364f7926bdc1e9)Or you can just use the automated builds...

pekr

[19:22](#msg56e1c98a0055f8f35a8209f4)`base` should imo accept size as a pair, not just integer?

[19:28](#msg56e1caf69f24605773d704fd)Ah, sorry. It works, typed 500X500, so it reported an invalid integer. 500x500 works just as expected ....

[19:38](#msg56e1cd1f618c335373eab1fa)Is Draw dialect, maybe later, but allowing parens? Tried to look into some R2 demo samples, and it uses parens to dynamically call a function, which e.g. supplies a bunch of spline vectors ....

[19:58](#msg56e1d1dc9f24605773d70780)Eh, wrong again. Spline.r used compose/deep to compose a draw block ahead, not during the draw dialect interpratation itself

## Friday 11st March, 2016

dockimbel

[04:38](#msg56e24bde618c335373ead173)@pekr Draw dialect cannot evaluate arbitrary code in parens, that would kill the performances and slow down the GUI a lot.

pekr

[09:52](#msg56e2954289dd3cce100584de)Any guess why R3 Draw has a `shape` sub-dialect? It contains mostly an `arc`, `line`, which are available even outside the `shape`. Well, plus `move`command. Was looking into famous AGG Lion demo and decompressed polygons .... Maybe to allow grouping of more complex shapes into a subblock?

Oldes

[09:54](#msg56e295d411a3dbf55acb06c1)Just guessing, but I would think that once defined shape could be used multiple times, couldn't be?

pekr

[09:55](#msg56e2962811a3dbf55acb06d9)most probably so. I can't see any set-words in the Draw though, it is mostly referenced outside the dialect and used via the compose .... As Doc noted, maybe because of speed, such stuff can't be dynamic and has to be "pre-made"?

[09:56](#msg56e2963611a3dbf55acb06e0)Where's Cyphre, when one needs him? :-)

[10:00](#msg56e29727618c335373eae0f5)Red Draw dialect seems to support sub-blocks. It just does not use a `shape`keyword. Hopefully the purpose is identical? https://github.com/red/red/wiki/Draw-dialect#sub-blocks

dockimbel

[10:07](#msg56e298f611a3dbf55acb079d)@pekr `shape` sub-dialect in Draw is for defining SVG-like \[paths](https://www.w3.org/TR/SVG/paths.html). We don't support it yet in Red/Draw, but will have to in the future as we want full SVG support.

pekr

[17:20](#msg56e2fe4e9f24605773d755b5)How to aproach the following situation? I created a very simple test:

```
view [b: base white 500x500 on-down [b/color: random 255.255.255 print "clicked"]]
```

I simply wanted the color to be changed with a click (as we don't have 'rate yet). So I used `on-click` - but this one works only for buttons. So I changed it to `on-down`, which worked, except the case, when I clicked fast, as clicking fast is identified as `on-dbl-click`

[17:25](#msg56e2ff78c7364f7926be2760)Now I don't like or don't know how to aproach the following:  
\* For mouse click I have to use `on-down`, as `on-click`is for buttons only. But for dbl click, the event is called `on-dbl-click`. I find it inconsistent, but of course, `on-dbl-down`would sound strange :-)  
\* What If I want to react to events, which span multiple areas, at once? I mean - in my example above I simply want all clickcs, no matter if it is identified as a double click, or a single click?

[17:58](#msg56e3075e11a3dbf55acb2b7e)Cotrary to R3 GUI, `on-move`seems to be defined for when the window moves? Couldn't it be as well catched by on-drag for window, and on-move could be left to detect general mouse movement?

## Saturday 12nd March, 2016

dockimbel

[06:21](#msg56e3b57c9f24605773d77d03)@pekr We are currently using hard-wired `click` and `dbl-click` events from win32 API, as we didn't have time to implement our own custom handlers for those events. In next releases, we'll have our own implementation, making those events will be available to all widgets (and also providing the missing `down` events).

[06:22](#msg56e3b5a06fde057c2686145f)Re `on-move`: yes, that's a possible evolution.

[06:27](#msg56e3b6c111a3dbf55acb5025)I just pushed a change to emit a `down` event when a `dbl-click` event is generated, so you can catch all clicks again with just `down`.

PeterWAWood

[09:27](#msg56e3e0e5618c335373eb2d31)Just out of interest: Hypercard and its successors (LiveCode) use

```
mouse-up
```

as the event for

```
click
```

. Did you make a specific decision to use

```
down
```

rather than

```
up
```

.

iArnold

[09:38](#msg56e3e391bb541ac77f4f0867)You mean because you can start to click something and then realise you did mean to click this particular thing but something else so you want to be able to discontinue the clicking by moving the mousecursor away?

PeterWAWood

[09:44](#msg56e3e4f5618c335373eb2d91)That could have influenced Apple's choice.

dockimbel

[09:53](#msg56e3e7153194fbd110966871)@PeterWAWood We don't use `down`, we use the native Windows `click` event. For our future custom `click` implementation, we can have a look at the best practice for it, though, different OS have different design rules for that.

PeterWAWood

[09:56](#msg56e3e7c69f24605773d781dd)@dockimbel Thanks for the explanation.

[10:01](#msg56e3e8ea6fde057c26861917)I may not have explained very well. Hypercard doesn't have a

```
click
```

event for its gui objects, a click is detected via

```
mouseUp
```

. Part of the reason for this may be because it has a

```
click
```

command which simulates a mouse-click.

[10:18](#msg56e3ecda9f24605773d7827f)It appears to send a

```
mouseRelease
```

event if the button is released outside of the object in which the

```
mouseDown
```

object was registered. (I guess this is because

```
mouseUp
```

cannot be guaranteed to be a

```
click
```

.)

[10:23](#msg56e3ee369f24605773d782ad)A little off-topic: it seems that Apple prefers the concept of mouse down and mouse up as events - \[Cocoa Event Concepts](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/EventOverview/EventObjectsTypes/EventObjectsTypes.html#//apple\_ref/doc/uid/10000060i-CH4-SW2)

pekr

[10:25](#msg56e3ee9e0055f8f35a82888d)When I read R3 Saphir docs yesterday, I liked the event name: `on-make`, as it is similar to `make`function. Dunno why `on-create`, language-wise, sounds kind of "harsh"?

[10:27](#msg56e3ef1611a3dbf55acb555d)Not sure if my thoughts are not going too much far, but wouldn't it be a useful feature for Red objects as well? We have `on-change`, which is useful. Kind of resembles init phase of some object systems ....

dockimbel

[10:44](#msg56e3f3129f24605773d7834a)@pekr You realize that you can already run arbitrary code at object init phase?

pekr

[10:48](#msg56e3f40711a3dbf55acb563e)Well, that's true, maybe apart from `construct`, which does not evaluate. I might mixed it up with the face/widget init phase.

dockimbel

[10:49](#msg56e3f43389dd3cce1005d29f)Where can I see the Saphir `on-make` description?

pekr

[10:49](#msg56e3f43e11a3dbf55acb5648)https://github.com/saphirion/documentation/blob/master/r3/r3-gui/developer/actors/actors.mdp

[10:50](#msg56e3f48311a3dbf55acb5653)They have two inits, not sure how useful it is - on-make, on-init (which seems to be called once the panel is ready or something like that). Then on-set, on-get, on-draw and various other stuff. We can surely go our own way, just tried to understand, if something from their aproach would be useful to us ....

dockimbel

[10:55](#msg56e3f5993194fbd110966a63)`on-create` is triggered just before system graphic resources are allocated, so the closest in Saphir would be `on-init`, though, it's not the same concept. Maybe `on-bind` would be a more appropriate name than `on-create`, but it would look more esoteric to newcomers.

pekr

[10:56](#msg56e3f5f40055f8f35a8289be)yes, not a good name. I think, that we don't need to be so "language precise" here ...

[10:57](#msg56e3f61d89dd3cce1005d2e6)OK, will look if I can port some R2 draw demo. I haven't started R2 desktop for ages, interesting it still works :-)

[10:59](#msg56e3f6846fde057c26861aeb)What I miss right now though, is "engage", which is called on time events. Wanted to simulate it just by the mouse move, but `move` is for something else, so will use `over`instead.

## Sunday 13th March, 2016

pekr

[10:20](#msg56e53f030055f8f35a82b6ff)Here's the oneliner. It seems `all-over` does not work?

[10:21](#msg56e53f236fde057c26864866)

```
cnt: 0 view/flags [b: base 300x300 white on-over [cnt: cnt + 1 b/text: to string! cnt]][all-over]
```

dockimbel

[10:37](#msg56e542e30055f8f35a82b764)@pekr Because you're not applying `all-over` to the right face.

pekr

[10:38](#msg56e5430a11a3dbf55acb8404)you mean, I should use flags for base?

[10:38](#msg56e5431c6fde057c268648cc)I thought flags are available only at the top level (window).

dockimbel

[10:38](#msg56e5431d11a3dbf55acb8408)You're applying it to the window instead of the base face.

pekr

[10:40](#msg56e543826fde057c268648dc)How can I use flag inside of VID? Do we have something like `with`in R2, where I can set particular items in face?

dockimbel

[10:40](#msg56e543953194fbd110969701)No, not yet.

pekr

[10:41](#msg56e543cd6fde057c268648ef)OK, will try few things. I thought `flags` keyword would be available, but does not seem so. So maybe using `on-create`to set it?

dockimbel

[10:41](#msg56e543dec7364f7926be82a4)No, just use `do`.

pekr

[10:45](#msg56e544d79f24605773d7b0f1)Thanks, it works:

```
cnt: 0 view [b: base 300x300 white on-over [cnt: cnt + 1 b/text: to string! cnt] do [b/flags: [all-over]]]
```

dockimbel

[10:46](#msg56e545180055f8f35a82b7c3)Shorter version:

```
cnt: 0 view [b: base 300x300 white on-over [b/text: form cnt: cnt + 1] do [b/flags: [all-over]]]
```

pekr

[11:05](#msg56e549840055f8f35a82b84c):-) http://2zone.cz/pekr/spiral.mp4

[11:08](#msg56e54a10618c335373eb5e40)I have a question - is the window just a child window of the console? I mean - both ScreenToGif and PowerDirector display some offset (you can see it in the video). ScreenToGif records it even incorrectly. Not sure I should use some offset setting to change its origin?

dockimbel

[11:08](#msg56e54a170055f8f35a82b855)I want to add a keyword to VID for making a face \*draggable* (was my first choice, but I thought that maybe a nicer one could be found). What about \*loose\*?

[11:09](#msg56e54a5389dd3cce100600ba)@pekr Not a child window of the console.

pekr

[11:12](#msg56e54b2d6fde057c268649d5)English wise, I sometimes incorrectly use loose insted of lose/losed. Not sure it easy maps to any UI related stuff, but maybe just a problem of my English knowledge ....

[11:13](#msg56e54b4989dd3cce100600da)Hmm, not sure, why te offset is happening with both recorders ....

[11:17](#msg56e54c4ec7364f7926be839e)You can: do read http://www.2zone.cz/pekr/spiral.red

dockimbel

[11:20](#msg56e54cfa11a3dbf55acb8537)@pekr Nice demo! It's very fast here. I should try with full-screen size. The code needs a bit of clean-up, then it could go into red/code. ;-)

pekr

[11:21](#msg56e54d4b618c335373eb5eaa)Cyphre's one. I just adapted it a bit - had to use to integer! on assigning a float to a pair, or it overflows, then I am not generating to-image, use just draw and we don't have effect pipeline, so it is not so nice as in R2, where Cyphre used Blur effect too ...

[11:22](#msg56e54d8e9f24605773d7b200)Really, shouldn't it be considered a bug?

[11:22](#msg56e54d906fde057c26864a2e)red&gt;&gt; pair: 0x0 pair/x: 3.14  
\== 1374389535

dockimbel

[11:23](#msg56e54daa3194fbd11096984d)Yes, it should output an error, as we don't support floats in pairs yet.

pekr

[11:23](#msg56e54dad3194fbd11096984e)Imo, we either should support floats for pair, or just use the integer part

[11:23](#msg56e54db53194fbd11096984f)ok, good to know

[11:24](#msg56e54ddac7364f7926be83c8)I was surprised it is quite fast :-) Wish for timers and few more Draw / Effect features :-)

[11:24](#msg56e54df689dd3cce1006012b)The nicest demo from R2 Desktop, imo, is - particles, and then imagination is nicely relaxing ....

[11:25](#msg56e54e206fde057c26864a39)Wanted to port Tiger one, but we miss Shape. So looking forward to future Draw enhancements!

bitbegin

[11:26](#msg56e54e4ec7364f7926be83d9)@pekr wow, it's beautiful!

pekr

[11:26](#msg56e54e6311a3dbf55acb855c)You see, that's what attracts ppl :-)

dockimbel

[11:26](#msg56e54e7089dd3cce10060140)The tiger is the famous SVG tiger test image, so it requires full Draw support (we have only partially implemented the Draw features from Rebol).

pekr

[11:27](#msg56e54ea36fde057c26864a48)Not much is missing imo. Even shape could be decomposed. We just miss the `move` function to set a position, well, at least from my observation ...

dockimbel

[11:28](#msg56e54ed06fde057c26864a54)I just pushed a few additions to VID.

pekr

[11:28](#msg56e54edf6fde057c26864a57)@bitbegin when Rebol Technologies introduced AGG based R2/View, it caused some real wow-effects inside the community. That was like seeing an Amiga. AGG is SW based renderer, not further developed, as Maxim has died. You can look into some demos here - http://antigrain.com/demo/index.html

[11:29](#msg56e54f129f24605773d7b231)I hope we add most of the back ....

[11:31](#msg56e54f8e3194fbd110969889)@dockimbel Any idea, why the recorders see the demo window shifted?

dockimbel

[11:31](#msg56e54fac3194fbd11096988d)No...haven't tried Screen2Gif yet.

pekr

[11:33](#msg56e54fecc7364f7926be8408)I thought it might be that the spiral function is drawing outside the area. But I tried the one-liner I tried above, from fresh console session, and still the same.

[11:33](#msg56e5500a0055f8f35a82b906)You can see it in the video I posted - there is a dashed line ....

bitbegin

[11:42](#msg56e5521fc7364f7926be845e)Very sad to here that, but the demos are very interesting.

## Monday 14th March, 2016

qtxie

[03:43](#msg56e6334b11a3dbf55acba917)\[!\[macosx-gui-red.gif](https://files.gitter.im/red/red/gui-branch/N15J/thumb/macosx-gui-red.gif)](https://files.gitter.im/red/red/gui-branch/N15J/macosx-gui-red.gif)

[03:44](#msg56e6339b0055f8f35a82dce7):smile: We got a good progress on Mac OSX GUI backend.

PeterWAWood

[03:51](#msg56e635500055f8f35a82dd1a)@qtxie :clap:

dockimbel

[03:52](#msg56e6359089dd3cce1006253d)@pekr Where's the original spiral demo source code? There's a bug in the one you posted, the `sz` argument to `spiral` is an integer, but you use it as a pair?

[03:54](#msg56e635e8618c335373eb83cd)

[03:54](#msg56e6360d0055f8f35a82dd30)View on MacOSX: ...and guess who retweeted it immediately after I posted it:

[03:55](#msg56e6361989dd3cce10062552)

[03:55](#msg56e6363a11a3dbf55acba976)\[!\[view-osx-tweet.png](https://files.gitter.im/red/red/gui-branch/rNWv/thumb/view-osx-tweet.png)](https://files.gitter.im/red/red/gui-branch/rNWv/view-osx-tweet.png)

qtxie

[04:24](#msg56e63ced0055f8f35a82ddf7)Let's see how many stars we will get on github today. ;-)

dockimbel

[04:25](#msg56e63d1dc7364f7926bea997)The real boost in stars will be for the release. ;-)

pekr

[06:01](#msg56e653b9c7364f7926beac2b)@dockimbel It is in the Desktop, Rebol, Demos section

[06:02](#msg56e653de9f24605773d7da10)http://www.rebol.com/view/demos/spiral.r

[06:05](#msg56e654a389dd3cce10062895)Where do I use `sz`as a pair?

iArnold

[06:26](#msg56e659b1bb541ac77f4f0c9c)@qtxie :clap:

dockimbel

[07:55](#msg56e66e860055f8f35a82e4bc)@pekr Sorry, I think I messed up your code here with some aggressive code replacements. I am improving the code to work faster and take less memory, then I'll publish it on red/code.

pekr

[08:01](#msg56e66fc0c7364f7926beb08a)super :-)

[16:58](#msg56e6eda4c7364f7926bed910)What kind of binding OS-X uses

[17:36](#msg56e6f6806fde057c2686a3c7)Sorry, posted from the phone, could not edit. Just wanted to ask, if the OS-X bridge is going to be any useful for the iOS or is that going to be a separate binding?

## Tuesday 15th March, 2016

dockimbel

[01:52](#msg56e76af389dd3cce10067bc6)Separate, but maybe some parts could be shared, I'm not sure how much of the API overlaps nowadays.

pekr

[05:23](#msg56e79c403194fbd110971a6e)Hmm. It's going to be lots of View engines in the end - Windows, Windows Universal Apps, OS-X, iOS, Android, Linux (in no respective order)

dockimbel

[05:24](#msg56e79c7a618c335373ebe5b6)No, only one View engine, with several platform-specific backends. See the View architecture graphic in the wiki.

pekr

[05:24](#msg56e79c953194fbd110971a78)That's what I meant, sorry for not being precise in wording ....

[05:25](#msg56e79ce66fde057c2686d1d8)I have a question towards Draw. I know it is going to be enhanced. Do you plan to support transformations, or at least gradients, as AGG version did? I remember, talking with Cyphre, that it would be good to support gradients in an SVG compatible way ....

dockimbel

[05:32](#msg56e79e7d9f24605773d838c3)We aim at SVG support, so we'll add all the required features for that (Rebol/Draw already has almost everything needed). I'm not aware of a issue with Rebol's gradients for that, anyway, as I said, we'll have SVG support, whatever it takes.

pekr

[05:45](#msg56e7a177618c335373ebe656)How's the demo doing? Can't wait :-)

dockimbel

[06:02](#msg56e7a56d89dd3cce10068482)@pekr You mean the spiral one? I just optimized the code speec and for using much less memory than the original code.

pekr

[06:08](#msg56e7a6e70055f8f35a833f07)Yes, that one. Is that already in the repo? OK, will look there later ....

dockimbel

[06:10](#msg56e7a7480055f8f35a833f15)No, I'm working on latest fixes for 0.6.0 and the documents writing. I'll put more scripts in red/code after bloging after the release.

[06:27](#msg56e7ab5a618c335373ebe7b2)@pekr In the meantime, you are welcome to write more demos or port older Rebol ones. ;-)

pekr

[06:30](#msg56e7ac2389dd3cce1006856c)I am not a demo guru, would not be able to create any such computations, effects :-) I might try to port some other demo, but missing on gradients, fill pens, it is going to be a poor man's port, but - better than nothing. Rebole and Oldes are another Rebol demo competition authors :-)

iArnold

[08:19](#msg56e7c5879f24605773d83f73)I have a nice demo, but it faces a problem with refreshing fields, and if I try to make a minimal example it works great in gui-console.exe but the compilation to an exe ends in the virusscanner waking up on a false positive and placing the exe in quarantine. I think about deleting the extra visual indication.

I have a question about the android branch, will this offer support for moving and tilting the device?

rebolek

[08:22](#msg56e7c64a3194fbd1109721b7)@iArnold Have you tried to run a VM without virusscanner for compilation?

iArnold

[08:39](#msg56e7ca3889dd3cce10068b24)@rebolek No. I have no space left on my HD to host any VM and I have no Windows to put on there anyway. I will delete the visual indication and then 'publish' the game to the /code.

rebolek

[08:40](#msg56e7ca646fde057c2686da1f)@iArnold OK, if you publish the code, others can have a look at the problem.

iArnold

[08:49](#msg56e7cc8211a3dbf55acc1325)Did that already, you can find it here https://gist.github.com/iArnold/601546d4109f90d16841

rebolek

[08:54](#msg56e7cdc111a3dbf55acc136e)Thanks, I’ll take a look. No virusscanner in my VM ;)

pekr

[09:14](#msg56e7d28e3194fbd1109724be)What is the link to Red demos?

iArnold

[12:21](#msg56e7fe4c618c335373ebfc13)@qtxie Are you a little girl now??

## Wednesday 16th March, 2016

qtxie

[07:03](#msg56e905272f1340a15a08f85b)@iArnold ;-)

## Thursday 17th March, 2016

Cybarite

[09:51](#msg56ea7e3c6fde057c268790d8)It looks like I can not use stylized buttons on a tab.

```
style browse-button: button 25 font [
		name: "Comic Sans MS" size: 12 color: blue		
	]
browse-button "Rebol.com" [browse http://www.rebol.com]  ; works outside a tab

tab-panel 200x200 [
	"Browse" [
		below
		button "Rebol.com" [browse http://www.rebol.com]
		browse-button "Rebol.com" [browse http://www.rebol.com]  ; fails in a tab .exe won't run
	]
]
```

dockimbel

[09:53](#msg56ea7eb0c7364f7926bfc9fc)Styles are local to the current panel, so you need to define them in the right context. Global styles through `stylize` function are not yet available.

Cybarite

[09:54](#msg56ea7eef89dd3cce10073e7c)ok thanks

rebolek

[09:55](#msg56ea7efd3194fbd11097d5a8)Local to current panel? Could be at least local to current panel AND its subpanels?

dockimbel

[10:01](#msg56ea805f9f24605773d8f82d)Let me see if that can be easily added to current VID...

[11:46](#msg56ea992e618c335373ecab83)@Cybarite @rebolek Ok, you now have cascading styles support in VID. ;-)

pekr

[11:53](#msg56ea9ac13194fbd11097dd01)what is the link to demos please? And could it be added into links group here?

dockimbel

[11:53](#msg56ea9ace9f24605773d8ff83)Which demos?

pekr

[11:54](#msg56ea9ae56fde057c2687987d)I don't know - script examples, on Github. You posted something like that few weeks ago?

dockimbel

[11:54](#msg56ea9b03c7364f7926bfd223)It's the red/code repo. We have a red/code channel on gitter for discussing it.

pekr

[11:55](#msg56ea9b263194fbd11097dd10)Could be added to wiki too ... thanks ...

[11:55](#msg56ea9b496fde057c2687989b)hmm, that's what I don't like so far about Gitter - not seeing the group, unless I specifically visit it ...

[11:56](#msg56ea9b6989dd3cce10074625)ok, thanks, now I am in ...

rebolek

[13:41](#msg56eab4219f24605773d90748)@dockimbel Thanks!

[13:42](#msg56eab4303194fbd11097e4b2)@pekr Think of it as each group is private ;)

pekr

[14:11](#msg56eabafd89dd3cce100750a5)There is a globus icon at the top-right section of gitter screen, which lists red related groups. Just did not know it exists, so I have not checked ....

rebolek

[14:14](#msg56eabbd79f24605773d90a3c)@dockimbel When I have an action for a widget, how are GUI actions in that block processed? Let’s say I have block like this: `[show busy call "something that takes long time" show done]` - `show busy` is not displayed in such case. Is there a way to force it somehow?

dockimbel

[14:45](#msg56eac302618c335373ecb9fd)GUI refreshes require going back into the event loop, so that the OS can process events/messages properly. In your above use case, you need to insert a call to `do-events/no-wait` after `show busy`, so painting messages get a chance to be processed by Windows and our backend before entering a long wait. You should use such manual event processing anywhere where you are blocking for too long (typically in tight loops).

rebolek

[14:46](#msg56eac33e6fde057c2687a693)Thanks!

dockimbel

[14:48](#msg56eac3bf6fde057c2687a6c9)Also, we might need to add some code to avoid the "(Not Responding)" mode in legitimate long pauses due to heavy computation or blocking IO operation (we don't have async IO for now).

rebolek

[14:50](#msg56eac453c7364f7926bfe055)Hm, can’t get it working...nevermind, it’s not that important.

dockimbel

[14:54](#msg56eac50e3194fbd11097eb53)You can try putting a `loop 20 [do-events/no-wait wait .01]` in order to process enough events and give it a little time (I used arbitrary values).

rebolek

[15:11](#msg56eac93911a3dbf55acce0d1)Hm, experimenting with it, I have `loop 100 [do-events/no-wait wait .1]`. IMO it should do nothing for 10 seconds before proceeding but I don’t see any delay before next command. I really should give up or I won’t do anything useful today ;-)

Cybarite

[23:15](#msg56eb3a91de00745d3dd38cb9)@dockimbel Thanks for cascading styles support in VID. Works well. Also I am seeing some improvement for Images on tabs with those updates - might be spurious correlation but now the image still only will appear on the first tab. But now it stays. Previously it appeared when Tab-1 was viewed but if went to Tab-2 and came back to Tab-1 there was no image.

## Friday 18th March, 2016

dockimbel

[03:23](#msg56eb74b1de00745d3dd396da)@Cybarite The image displaying issue in tabs was fixed recently.

asampal

[04:20](#msg56eb8202d7d79821324bd4be)@pekr there's a new UI coming for gitter that you might want to check out - http://blog.gitter.im/2016/03/15/introducing-our-new-ui/

dockimbel

[04:33](#msg56eb8514745ba1e13ee704c6)@asampal Thanks, just switched to it now and it's indeed better.

pekr

[05:07](#msg56eb8d28acb317593df53690)There is absolutly a need to hide the left icon ribbon, not just the chat room list. In fact, chat list is useful, the ribbon less so. It takes up space and shifts conversation to the right. Sadly, I don't like it.

asampal

[06:18](#msg56eb9db79c87b5e3032c9a44)when you auto-hide the chat room list it overlays the conversation area instead of shifting it

pekr

[06:19](#msg56eb9e046fbc43bf40990cae)It shifts it here ...

asampal

[06:20](#msg56eb9e1e7397e2bc0206dd94)are you autohiding it?

pekr

[06:20](#msg56eb9e258f56f9a16e0db2aa)I turned back to the original design. Unless the ribbon with icons can be hidden, I am not going to use it, unless I am pushed to do so ...

[06:21](#msg56eb9e68c081db78786b27c5)I don't understand, what is the question ...

asampal

[06:22](#msg56eb9e8f9c87b5e3032c9a4c)if you click the &lt;|| icon at the bottom of the icon ribbon, you can make the chat list auto-hide so that it retracts when not in use

pekr

[06:22](#msg56eb9e93d37167a26ea0ec45)I have vertical ribbon with icons, then Red channels lists, then chat area, then the right column

asampal

[06:22](#msg56eb9e9f745ba1e13ee7050f)and it pops out when you go on top of the icon ribbon

[06:22](#msg56eb9eaed7d79821324bd51a)but it overlays the conversation area instead of pushing it

pekr

[06:22](#msg56eb9eb76fbc43bf40990cbe)I don't want the chat rooms being hidden though

[06:23](#msg56eb9efe2316027b785e62ba)I want the reverse (or both) - icon bar being hidden ... I want to see the list of the chat rooms all the time, just like in AltMe. I want to see, where's new message poste immediately

asampal

[06:24](#msg56eb9f379c87b5e3032c9a50)k, well - you can complain about this in https://gitter.im/gitterHQ/change

pekr

[06:25](#msg56eb9f65ec99d7bd40a09c6b)Thanks, will consider doing so. I already posted a under the blog article ....

asampal

[06:28](#msg56eb9ff4745ba1e13ee70513)@pekr why don't you post a screenshot of AltME there?

[06:28](#msg56eba01ad7d79821324bd521)maybe in various states, showing the possibilities

iArnold

[08:32](#msg56ebbd2b2316027b785e679c)I like to know if the android branch will support shaking, tilting and sound.

Oldes

[08:40](#msg56ebbf11de00745d3dd3a16d)I agree with @pekr that the left side bars should be reversed, I also like to see the conversation list and have no use for the icons bar. Also I hate the pink colors.

meijeru

[09:33](#msg56ebcb5eec99d7bd40a0a55e)A question: how does one attach an `on-resize` handler to the window? And is there any point in attaching such a handler to a sub-face of the window, seeing that the `resize` flag is applying to the window face only.

rebolek

[09:34](#msg56ebcbaa745ba1e13ee705a3)@meijeru I think it’s not possible directly yet. Do something like this:

```
win: layout win-layout
win/actors/on-resize: :resize-actor
view win
```

meijeru

[09:56](#msg56ebd0dd8f56f9a16e0dbd41)I think that is a serious omission, don't you? I will try your solution, for sure. I have tried myself with `insert-event-func` but that does not work, and even if it did, it would be less efficient since global handlers are called on every event.

[09:57](#msg56ebd10ec081db78786b3212)I still think it is interesting to find out why the following does not work:

[09:57](#msg56ebd11f6fbc43bf409916ba)

```
Red []
view/no-wait/flags win: layout [] 'resize
insert-event-func [if all [face = win event = 'resized][print "resized"]]
do-events
```

dockimbel

[10:02](#msg56ebd23bec99d7bd40a0a76a)@meijeru Try rather `event/type = 'resize` or `event/type = 'resizing`. ;-)

meijeru

[10:07](#msg56ebd3562316027b785e6dc7)@dockimbel Thanks! However, my comment about the awkwardness of it all remains valid, I think.  
@rebolek Your solution should have

```
win/actors: make object! [on-resize: :resize-actor]
```

but otherwise it works fine!

dockimbel

[10:15](#msg56ebd53f2316027b785e6e4f)@meijeru It's just unfinished work. We will provide a resizing handling system in a future release.

meijeru

[10:44](#msg56ebdc1dec99d7bd40a0aa3d)@dockimbel Thanks! Another remark - the GUI console has a global variable `win` which cost me some headache: I did `win: layout [ ]` but in the initialization I had a test `value? 'win` thinking I could check whether the face creation had already occurred. However, in the GUI console `value? 'win` is always true... Shouldn't there be a context to encapsulate?

dockimbel

[11:00](#msg56ebdfdd745ba1e13ee70620)@meijeru Your test in the global event handler should rather be:

```
if all [face/type = 'window...
```

[11:02](#msg56ebe037745ba1e13ee70623)@meijeru Good point, the console code is not properly encapsulated in a context...

[12:21](#msg56ebf2c2cbd8ba9c7199dd5e)@meijeru The console words leaking issue should be fixed now.

meijeru

[12:55](#msg56ebfac9d37167a26ea101ae)@dockimbel Fine! Now I run against this, which may or may not be a proper issue:

```
Red []
system/view/auto-sync?: false
windo: layout [button-1: button "button 1" button-2: button "button 2"]
windo/flags: [resize]
windo/actors: make object! [
	on-resize: func [face event] [
		button-1/size/x: button-2/size/x: windo/size/x - 40 / 2
		show windo
	]]
view windo
```

The buttons DO increase in size when resizing the window, but their horizontal offsets do NOT change properly, hence: overlap.

rebolek

[13:02](#msg56ebfc573c96c9a41ed54015)@meijeru You’re right, `make object!`, I wasn’t sure if the actors object is already there or not.

Cybarite

[17:37](#msg56ec3cbc0425c72f73f11d65)@dockimbel Thanks for the image on tabs fix. Bumping around git learning how to keep current.

[18:06](#msg56ec43aace5b0c6e7a1bdc7d)For the progress and slider combo on a tab, the app won't run unless the progress baris removed...  
\` "Slider" [  
; progress 100x20 data 20% react \[face/data: slider-in-tab/data]  
slider-in-tab: slider 100x20 data 20%  
]

fergus4

[23:51](#msg56ec9499dec81665365dbb7c)

[23:52](#msg56ec94b00425c72f73f135ac)

[23:52](#msg56ec94c2654d30d022e44d33)

## Saturday 19th March, 2016

fergus4

[01:58](#msg56ecb22cce5b0c6e7a1bf62a)

[02:01](#msg56ecb2ec8b806f6b7a188935)Trying to change the text of a series of buttons in a window but the new text is \*\*not\** showing:  
'code'  
windo: layout [  
style but: button 50x50  
but "1" \[foreach face windo/pane \[print face/text]]  
but but but but but but return  
]  
i: 1  
foreach face windo/pane \[face/text: i i: i + 1 ]  
view windo  
'code'  
if I click button "1" it shows that the face/text has been changed.

qtxie

[03:47](#msg56eccbb4654d30d022e453c1)@fergus4 You need to convert the number to string for now.

[03:47](#msg56eccbc00d69dfd122212235)

```
foreach face windo/pane [face/text: to string! i i: i + 1 ]
```

dockimbel

[08:46](#msg56ed11f5ce5b0c6e7a1bfe98)@meijeru \*The buttons DO increase in size when resizing the window, but their horizontal offsets do NOT change properly, hence: overlap.* You are not changing the offsets, so the buttons stay at the same place. As I said above, there is no auto-resizing system implemented yet.

meijeru

[10:03](#msg56ed23f78680486236c1413f)@dockimbel My misunderstanding. I thought that calling `show` would be enough to calculate the whole window face again...

## Sunday 20th March, 2016

ghost~5680c5f416b6c7089cc058a5

[06:10](#msg56ee3eea9af6ba280ec16b6e)@qtxie  
:point\_up: \[February 2, 2016 12:05 PM](https://gitter.im/red/red/gui-branch?at=56b04e35f68dd35f36a4e2f3)  
Can something like this work for multiline copying without the need of stripping the leading prompt -

[06:11](#msg56ee3f2a09b9b0dd488fc4fe)\[!\[Animation.gif](https://files.gitter.im/red/red/gui-branch/qvam/thumb/Animation.gif)](https://files.gitter.im/red/red/gui-branch/qvam/Animation.gif)

lispberry

[07:26](#msg56ee50aadec81665365dee9a)Is it ok to use draw+view for a game or it has low performance?

qtxie

[07:37](#msg56ee534c8b806f6b7a18b80f)@nc-x Yes. That's doable. :yum:

ghost~5680c5f416b6c7089cc058a5

[07:46](#msg56ee55528680486236c1662e)@LispBerry Should be good enough for simple games.

[07:46](#msg56ee55658b806f6b7a18b839)@qtxie For 0.6.0 or 0.6.1? :wink:

fergus4

[14:25](#msg56eeb2c78680486236c170ff)@qtxie Thanks. I had tried to-string but got an error.

## Monday 21st March, 2016

qtxie

[00:35](#msg56ef41b90425c72f73f18d11)@nc-x Mostly in 0.6.1. :smile:

## Thursday 24th March, 2016

rebolek

[14:24](#msg56f3f89d7c18711013e642f9)Hm, interesting:

```
view [text "&Rebol, Red && Red/System"]
```

pekr

[14:48](#msg56f3fe5bbbffcc665fa907a0)Didn't the first one got "interpreted" as an accelerator key, so it got underlined?

dockimbel

[14:49](#msg56f3fe626d20f28b42f239c0)@rebolek It's a Windows-specific feature. Useful to indicate a short-cut key.

rebolek

[15:13](#msg56f404366d20f28b42f23a01)Yes, that’s what I though. Is it the same in other systems? I guess there should be OS-agnostic way in Red to do this.

pekr

[15:16](#msg56f404bbe4a8384a1bbbb514)That might be imo tricky, but who knows :-)

dockimbel

[15:17](#msg56f4051f72bf52bd58e73d81)I don't remember seeing similar feature in other systems. It's not anyway an officially supported feature, so I guess we should escape the &amp; character by default when used in a face on Windows, and maybe leave a switch somewhere to disable that feature for Windows-specific behavior.

rebolek

[15:20](#msg56f405ccaaf8f1a914e65c1f)That sounds reasonable.

## Friday 25th March, 2016

rebolek

[14:21](#msg56f5497a7c18711013e64ac1)I haven’t tried to compile this yet ;) but I am really excited about it. It has bothered me reaaaaaaly long.  
http://i.imgur.com/KrE8IKc.gif

dockimbel

[14:29](#msg56f54b4e72bf52bd58e743f5)@rebolek The goal is to make the VID set-words local?

rebolek

[14:30](#msg56f54b9c72bf52bd58e743f9)@dockimbel exactly.

dockimbel

[14:32](#msg56f54c1372bf52bd58e74400)We should provide a clean way for that in the future, though I haven't investigated it yet, not sure which of a function context or an object context would be the best option.

rebolek

[14:33](#msg56f54c32aaf8f1a914e6625b)Next step is to add `/with` refinement and pass object! that will be populated by VID's set-words.

dockimbel

[14:34](#msg56f54c787c18711013e64ad1)Should work fine with the compiler too, as it will just defer the functions construction to the interpreter.

rebolek

[14:35](#msg56f54cb172bf52bd58e7440d)That shouldn’t be problem, I doubt anyone needs native speed for window layout ;)

dockimbel

[14:35](#msg56f54cb37c18711013e64ad6)Object is probably a better option. Too bad we don't have exposed collect-words yet, though rewriting it with parse is pretty trivial.

rebolek

[14:36](#msg56f54d026d20f28b42f240dd)It is. Probably also an one-liner. But let me not distract you from preparing the release ;)

dockimbel

[14:37](#msg56f54d2f6d20f28b42f240e0)Using `collect` keyword in Parse should make it a one-liner, right. ;-)

## Saturday 26th March, 2016

ghost~5680c5f416b6c7089cc058a5

[13:28](#msg56f68e82bbffcc665fa98976)Most probably a bug in ScreenToGif (or red?)-

[13:29](#msg56f68ea0d39de41b495dee50)\[!\[Animation.gif](https://files.gitter.im/red/red/gui-branch/rLw4/thumb/Animation.gif)](https://files.gitter.im/red/red/gui-branch/rLw4/Animation.gif)

[13:29](#msg56f68eae8f5147e119f0b81d)"Weird colours and un-antialised text"

[13:29](#msg56f68eb1e4a8384a1bbc34f8)Please use

[13:29](#msg56f68eb88d2a72471b7a652e)LICECAP

[13:29](#msg56f68ebc76b6f9de194b73d8)or alternatives

[13:29](#msg56f68ec0bbffcc665fa9897d)to record demos

[13:29](#msg56f68ec1bbffcc665fa9897e):D

[13:30](#msg56f68ef18f5147e119f0b825)http://www.cockos.com/licecap/

dockimbel

[14:40](#msg56f69f796d20f28b42f2462d)@nc-x Strange..thanks the alternative link!

rebolek

[14:55](#msg56f6a2cabbffcc665fa98bc8)I also noticed errors with screentogif

## Tuesday 29th March, 2016

nodrygo

[12:32](#msg56fa75cdd39de41b495e957d)hello  
sory for this newbie stupid question but I can't understand how to put some variables inside a draw block  
those tests doesn't work .. any clue here ?

```
Red [Needs:  'View]

txt1pos:  make pair! [20 20]
txt2pos:  90x220
Arial: make font! [name: "Consolas" style: 'bold]
mydraw:  [
    font Arial
    text txt1pos  "MYTEXT1"
    text txt2pos  "MYTEXT2"
]
save %mydraw.png draw 240x240 mydraw
```

Oldes

[13:05](#msg56fa7d86d39de41b495e9836)@nodrygo using something like this:

```
mydraw:  compose [
    font Arial
    text (txt1pos)  "MYTEXT1"
    text (txt2pos)  "MYTEXT2"
]
```

nodrygo

[13:07](#msg56fa7e1ed39de41b495e9867)@Oldes Unfortunately I have tried and get

```
*** Script error: invalid Draw dialect input at: [(txt1pos) "MYTEXT1" text (txt2pos) "MYTEXT2"]
*** Where: draw-image
red>>
```

Oldes

[13:08](#msg56fa7e3311ea211749c2c778)note the

```
compose
```

word!

[13:08](#msg56fa7e4d8d2a72471b7b0fc9)Another way is:

```
mydraw:  reduce [
    'font Arial
    'text txt1pos  "MYTEXT1"
    'text txt2pos  "MYTEXT2"
]
```

[13:08](#msg56fa7e56e4a8384a1bbcdf7a)using

```
reduce
```

nodrygo

[13:09](#msg56fa7e868f5147e119f16488) ho sorry i missed that  
now it work .. thanks a lot

pekr

[13:28](#msg56fa83008f5147e119f16639)@qtxie - saw your new PR. Was `grad-pen`discarded and now `fill-pen`should be used instead? What if I want to use just a solid color? Should I use just `pen`? Because in Rebol, `fill-pen`could be submitted an `image!` type, so not sure if we need both, or not ....

qtxie

[13:31](#msg56fa8394d39de41b495e9a98)@pekr It is the same as in Rebol 2. fill-pen will accept a solid color, or an image!, or gradient colors.

[13:31](#msg56fa83bf8f5147e119f16690)For now, the image! support is not implemented.

pekr

[13:31](#msg56fa83c4e4a8384a1bbce14f)OK, but is my understanding ok, that grad-pen command is not needed anymore?

qtxie

[13:32](#msg56fa83dfe4a8384a1bbce156)Yes. no need grad-pen. ;-)

pekr

[13:32](#msg56fa83f2d39de41b495e9ac4)OK, thanks ...

[18:31](#msg56fac9f676b6f9de194c3b59)@qtxie - any example of `radial`pen? I tried to use values from Rebol, but it does not seem to work. Maybe I don't have arguments right:

```
pen radial 310x326 0 31 0 1 1 29.216.214.255 29.216.214.255 58.255.255.0 29.216.214.127 29.216.2
14.191 29.216.214.255 circle 310x326 31
```

qtxie

[22:17](#msg56fafeeb76b6f9de194c4ccf)@pekr only `linear` is supported for now. :worried:

## Wednesday 30th March, 2016

PeterWAWood

[02:46](#msg56fb3e0876b6f9de194c58c9)@qtxie Is there a way of clearing the gui-console screen (but not the history)? A keyboard shortcut would be wonderful - like CMD-k clears the Mac Terminal App.

[02:50](#msg56fb3eebd39de41b495ed36f)Or perhaps a clear-screen function like Basics of old.

qtxie

[02:55](#msg56fb40308d2a72471b7b49fc)@PeterWAWood No clear-screen function for now. I'll have a look it.

PeterWAWood

[03:00](#msg56fb416b8d2a72471b7b4a21)Thanks @qtxie. It would be a good usability improvement.

rebolek

[04:43](#msg56fb59866d20f28b42f257ca)https://github.com/ptmt/react-native-desktop

pekr

[04:53](#msg56fb5bb176b6f9de194c5d1c)That looks a bit like View and Word explorer we had in R2 ....

rebolek

[04:54](#msg56fb5c166d20f28b42f257d5)Also

```
<View>
  <Button onClick={() => alert('clicked')}/>
</View>
```

is as close as possible to

```
view [button [view [text "clicked"]]]
```

:)

pekr

[04:55](#msg56fb5c32d39de41b495ed7b3)For a while I thought it is your personal project :-)

rebolek

[04:56](#msg56fb5c786d20f28b42f257d6)My personal project is Lest and it uses few lines of Rebol/Red syntax to produce tons of HTML output ;)

pekr

[04:57](#msg56fb5cafbbffcc665faa6af1)There was a conference to Reactive .... in Bratislava, which author attended - http://potomushto.com/2015/11/21/reactive-bratislava.html

rebolek

[04:58](#msg56fb5d107c18711013e6621d)Anyway, it produces native OS X GUI, so there could be some inspiration for making OS X version of View ;)

qtxie

[05:50](#msg56fb69408d2a72471b7b5035)Looks nice!

pekr

[07:58](#msg56fb8727d39de41b495edfcd)Tried to mimic the particle demo from R2 desktop/demos section, is my conclusion right, that the technique to draw the gradient might differ between the Red and R2/R3? I hope, that we at least get it cross-platform compatible for Red? For the following code, I get the following image:

```
view [
    base 600x600 black
    draw: [
        fill-pen radial 310x326 0 31 0 1 1 29.216.214.255 29.216.214.255 58.255.255.0 29.216.214.127 29.216.2 14.191 29.216.214.255 
        circle 310x326 31
    ]
]
```

[07:58](#msg56fb8735bbffcc665faa7294)http://2zone.cz/pekr/particles-comparison.jpg

[07:58](#msg56fb8741d9b73e635f67870a)Left - R2, right - Red

dockimbel

[08:23](#msg56fb8cfbd9b73e635f6788da)@pekr The code you showed cannot draw the picture on the left, even in Rebol2.

pekr

[08:24](#msg56fb8d48d9b73e635f6788ed)Well, the demo uses some block of generated data, which is then composed into draw directives. Here's a block plus result:

[08:25](#msg56fb8d7c11ea211749c31075)

```
[29.216.214.0 29.216.214.255 310.18994967025 326.482568918258 31 6.7 -6.8]
310x326
[
    fill-pen radial 310x326 0 31 0 1 1 29.216.214.255 29.216.214.255 58.255.255.0 29.216.214.127 29.216.2
14.191 29.216.214.255 circle 310x326 31
]
```

[08:26](#msg56fb8db1d9b73e635f67890b)I loooked into some blur effect, or something like that, but did not find any ...

[08:28](#msg56fb8e39e4a8384a1bbd2903)If this is too early to do some tests, I might hold-back. I just try living on the edge :-) Note here: I never used draw in R2 myself, so I can easily confuse something ....

PeterWAWood

[10:20](#msg56fba88576b6f9de194c7041)@dockimbel @qtxie A question about the VID and View docs.

The VID docs indicate a

```
font-name
```

can be either a

```
word
```

or a

```
string
```

. The

```
font-name in a font object
```

is a

```
string!
```

. Are both correct?

[10:26](#msg56fba9e28d2a72471b7b60e1)@dockimbel @qtxie Would it be difficult to add an

```
installed-fonts
```

function in View that returns a block of the currently installed fonts?

dockimbel

[10:28](#msg56fbaa5b76b6f9de194c70aa)@PeterWAWood I think you can just list them from a system folder?

[10:35](#msg56fbabdd76b6f9de194c711e)@PeterWAWood For which purpose do your need that function?

[10:35](#msg56fbabffbbffcc665faa7daa)@PeterWAWood Both are correct, though I don't remember ever testing it with a word! value.

PeterWAWood

[10:46](#msg56fbaea011ea211749c31a42)@dockimbel I was thinking of a beginners' (for real beginners) guide. Starting with:

```
followed by
```

view \[text "My Second Program font-size 30 font-color blue font-name "comic sans ms"]

```
then next getting them to "customise" the text by changing the font colour, name and size.

Being able to tell them to type
```

probe installed-fonts\` in the console would make it very easy for them (and help them from making mistakes at this early stage).

[10:48](#msg56fbaee1d9b73e635f679285)The Windows/Fonts directory gives the file names but not the font names.

dockimbel

[10:48](#msg56fbaeed76b6f9de194c71f4)@PeterWAWood We plan to add support for the system font requestor, would that be enough?

PeterWAWood

[10:49](#msg56fbaf24d9b73e635f679294)That would be enough as I could get them to open the system font requestor from the console.

dockimbel

[10:49](#msg56fbaf508d2a72471b7b6224)Of course, it will be in form of a `request-font` function, probably returning a ready-to-use font object definition.

PeterWAWood

[10:53](#msg56fbb028d39de41b495eebbc)That would be fine for what I'm thinking. I just want it easy for them to list the fonts at that stage. (They can ignore the return value.)

[10:55](#msg56fbb08876b6f9de194c7266)

```
word
```

does work happily with VID

```
font-name
```

```
red>> com: "comic sans ms"
== "comic sans ms"
red>> view [text "testing" font-size 40 font-name com]
red>>
```

[11:32](#msg56fbb93976b6f9de194c74fc)I've been experimenting with display emoji in VID text. I tried with "Segoe UI Symbol" and "Segoe UI Symbol Regular" but no luck - just an empty box. I'm not sure if it's the problem is the font or VID.

Here's the code that I used:

```
view [text "^(01F600)" font-size 40 font-name "Segoe UI Symbol Regular"]
```

[11:33](#msg56fbb96d76b6f9de194c7513)When I used the "Webdings" font VID displayed to empty boxes.

pekr

[11:40](#msg56fbbb16bbffcc665faa81d6)That's what usually happens after Weddings - emptying boxes :-)

PeterWAWood

[11:43](#msg56fbbbe4d9b73e635f679611)&gt; When I used the "Webdings" font VID displayed TWO empty boxes.

iArnold

[12:39](#msg56fbc90a8d2a72471b7b69f0)Documentation says https://github.com/red/red/wiki/Red-View-Graphic-System#including-view-component Needs: 'View  
But the gui-console.red uses Needs: View and that works too. What is correct?

dockimbel

[12:54](#msg56fbcc8d8d2a72471b7b6b23)Both. The literal word form is future-proof, in case the header gets evaluated for whatever reason.

iArnold

[13:54](#msg56fbda8611ea211749c327e4)Okay Thanks!

[14:04](#msg56fbdcd4e4a8384a1bbd414a)I used to have a problem with Norman Virus false positives on small compiled programs that use View. I added a line  
Icon: default and now the false positives are gone.  
Maybe something for a Tips and Tricks gallery?

[14:24](#msg56fbe1ba8f5147e119f1c915)And I added proper Title: "Any title will do" line, the Icon alone was not enough.

[14:34](#msg56fbe403d9b73e635f67a417)Is the behaviour I see in this compiled gist: https://gist.github.com/iArnold/fd0f69c846697514d70c  
intentional? First click on button Black, a purple square appears. Now drag the window around. This new square stays in place where the other square moves along with the window. This difference is 'panel versus 'base, but the 'panel is not draggable. Should the 'panel move along with the window too?

justjenny

[22:19](#msg56fc50ffd9b73e635f67ca4b)Love everything about Red - It is the Future - but 'What about sound ? '

[22:30](#msg56fc537911ea211749c35408)Sound can turn a average app into a great app - Red needs sound .

## Thursday 31st March, 2016

dockimbel

[03:32](#msg56fc9a35d087756f7c042029)@justjenny I would be very glad to have sound/audio support, but our coding resources are limited and we need to prioritize first features which are the most needed. We can give it a try after 0.7.0 is released, as it anyways requires some form of concurrency (asynchronous I/O or threading).

PeterWAWood

[04:01](#msg56fca1218d2a72471b7ba9a4)@qtxie The gui-console crashes when trying to find a string in an object (accidentally :-) ).

```
red>> o: make object! [a: 1]
== make object! [
    a: 1
]
red>> find o 'a
== true
red>> find o "a"
== console crashes
```

In the cli console (OS X)

```
find o "a"
```

returns

```
none
```

.

dockimbel

[04:02](#msg56fca158d087756f7c042047)@PeterWAWood Confirmed. Please open a new ticket for it.

PeterWAWood

[04:05](#msg56fca2038f5147e119f1ffe9)#1762

[07:20](#msg56fccfd5d39de41b495f3a2a)@dockimbel Thanks for the quick fix.

[07:51](#msg56fcd6e976b6f9de194cc3af)@qtxie Is it possible to make a "double-size" gui-console with the Logo, Title and text double their current size? (It would make it possible to make high resolution screenshots (~= 300 dpi)).

[08:05](#msg56fcda418f5147e119f20a86)@qtxie I've found that I can scale the windows display in my VM so can double the size of the gui-console window and take 300 dpi screenshots.

qtxie

[08:06](#msg56fcda9cd087756f7c04212c)I'm not sure if we can change the size of the Logo and Title. We'll be able to change the font size later.

pekr

[09:23](#msg56fcecaa76b6f9de194cca63)@qtxie have you seen my screenshot re R2 vs Red radial gradient? I wonder if implementation differs?

[09:29](#msg56fcede3e4a8384a1bbd89f9)Dockimbel did not believe me, that such code could produce such gradient in R2, so here it is:

[09:29](#msg56fcedf076b6f9de194ccacf)

```
view layout [image black 600x600 effect [draw [pen none fill-pen radial 310x326 0 31 0 1 1 29.216.214.
255 29.216.214.255 58.255.255.0 29.216.214.127 29.216.214.191 29.216.214.255 circle 310x326 31]]]
```

dockimbel

[09:32](#msg56fcee9e8d2a72471b7bba6c)@pekr I said: "The code you showed cannot draw the picture on the left" not "Such code...". :point\_up: \[March 30, 2016 4:23 PM](https://gitter.im/red/red/gui-branch?at=56fb8cfbd9b73e635f6788da) The code and screenshot you provided didn't match.

pekr

[09:33](#msg56fceeced9b73e635f67e80b)Red equivalent (there was actually a typo in my code, one space (R2 copying in console). Here's proper code. Still a bit different than R2 (not saying we should be compatible, just asking):

[09:33](#msg56fceedf76b6f9de194ccb18)

```
view [
    base 600x600 black
    draw: [
        fill-pen radial 310x326 0 31 0 1 1 29.216.214.255 29.216.214.255 58.255.255.0 29.216.214.127 29.216.214.191 29.216.214.255 circle 310x326 31
    ]
]
```

qtxie

[10:00](#msg56fcf53ed087756f7c0421cb)@pekr Yes. I notice that. We are using GDI+ to render the gradient, while R2 use AGG. I think it is the reason there is a bit difference.

pekr

[10:03](#msg56fcf5ebd9b73e635f67ea1e)OK, I just wonder, how will that differ cross-platform (OS-X, Linux). We should "somehow" (not sure how) ensure the same look, or any such gui effect are not going to be much useful, if one wants to cover more platforms.

[10:03](#msg56fcf602bbffcc665faad72d)Just not sure it is technically possible ....

[10:04](#msg56fcf63011ea211749c3751b)I also remember Cyphre stating, that R2 gradients were not compatible with SVG ... maybe it would be good to look into the topic from that perspective. Just not sure, if SVG is enough of a standard to follow :-)

iArnold

[10:13](#msg56fcf843e4a8384a1bbd8d68)I tried the example from the blog ";-- Simple form editing/validating/saving with styles definitions". Works fine except for a tabsequence I miss, using `tab` to go from 1 form field to the next. Is this left out for the example? How to add this?

qtxie

[10:15](#msg56fcf8af54b9c4023d23dca3)Yes. As different algorithm produce different visual effect, I think the only way to make it the same is to use a graphic library(e.g. AGG) or to write the algorithm ourself.

pekr

[10:16](#msg56fcf90a11ea211749c375ee)That's what I was afraid of :-(

## Friday 1st April, 2016

iArnold

[08:09](#msg56fe2ca276b6f9de194d2268)How to set a default selected value on a drop-down, text-list or drop-list?  
drop-down data \["y" "n"]  
and say "n" is default choice?

rebolek

[08:10](#msg56fe2cde1720648112da4242)@iArnold currently, you must do it manually, but see https://github.com/red/red/issues/1760

[08:11](#msg56fe2d14d087756f7c042996)By manually, I mean something like `view [d: drop-down data ["y" "n"] do [d/selected: 2]]`

iArnold

[08:15](#msg56fe2e2dd39de41b495f9a28)Thanks @rebolek !

[09:55](#msg56fe45a8d39de41b495fa0ec)There must be some thought spend about the 'examples' from view-test.red  
There is drop-list with data: \["bla" val1 "bla2" val2 ] When selected is "bla2" then /selected is also 2 but now if i set idx: /selected and print /data/:idx it will print val1, not val2.

[09:57](#msg56fe461911ea211749c3d054)And tabbing between fields is a dear missing feature right now for me. (Or I do not know how to make this possible)

[10:13](#msg56fe49ad8d2a72471b7c18a5)I made an area and filled area/text data with a multiline text using a string with {} . In the area the text shows up as a string without the newlines. Can anyone confirm this, in which case I can file an issue.

[10:15](#msg56fe4a3411ea211749c3d17d)When copy pasting what I see in a normal editor I can see it has CR/LF as I expected. I can edit the text in the area and create multiline texts as well.

[14:01](#msg56fe7f1fe4a8384a1bbdf894)I want to change my input in a field to uppercase. There is no suitable event to use to achieve this.  
my-field: field 50 on-change \[my-field/text: uppercase my-field/text]  
results in a stackoverflow error.  
Okay circumvented this clip now. using a logic! to check if already in this event.  
Now I want to get the cursor back at the end of the field, after typing the first character it is after change to uppercase now at the beginning of the field. How do I do that?

SteeveGit

[14:22](#msg56fe841fe4a8384a1bbdfa3a)@iArnold Try to use on-key-up instead of on-change, just a guess

iArnold

[14:36](#msg56fe8774d9b73e635f685741)According to the View docs there are only on-change on-key and on-enter

SteeveGit

[14:38](#msg56fe87d411ea211749c3e3dc)@iArnold look at that https://github.com/red/code/blob/master/Showcase/livecode.red

iArnold

[15:41](#msg56fe96bed087756f7c042c50)Thanks @SteeveGit , it is unrealistic of me to expect the docs being complete in this stage.

## Saturday 2nd April, 2016

Oldes

[10:44](#msg56ffa2a211ea211749c418e0)@pekr you can hardly expect "same look" when using native widgets and OS libraries.

pekr

[10:46](#msg56ffa313d9b73e635f688b5f)It's not about same look, but more about more complex widgets supporting different features, etc., hence it will be close to cross-platform, but most probably not 100% cross-platform. No problem though, especially if we can create our own widgets, like in R2, which should be possible even now ....

SteeveGit

[14:46](#msg56ffdb63d39de41b495ff1bb)Looking for a change of the default font and size in the gui console. Any way?

[14:47](#msg56ffdb7d11ea211749c420df)without recompilation

[14:58](#msg56ffde0211ea211749c42147)ah ah ah, found it.

```
red>> system/view/screens/1/pane/-1/pane/1/font
== make object! [
    name: "Consolas"
    size: 11
    style: none
    angle: 0
    color: none
    anti-alias?: none
```

Trying to hide it @dockimbel ? uhuhuh

dockimbel

[15:49](#msg56ffe9fe1a1ccc164832b070)@SteeveGit haha, well done. :clap: ;-) Yes, you can change the font that way, but it's not yet officially supported, the caret size won't adjust accordingly yet, and it needs some testing. Though, we'll enable it for next release for sure. ;-)

[15:51](#msg56ffea67d087756f7c043090)The "hiding" part is actually an internal feature of View, the screen's pane offset is increased when a new event loop is run, protecting the windows opened before from `unview/all` (cheap, but very useful trick) ;-)

SteeveGit

[15:51](#msg56ffea88d9b73e635f68960f)yeah very clever ;-)

dockimbel

[15:54](#msg56ffeb241720648112da48c1)Building the GUI console in View itself brought its own set of issues to solve (that explains the extra delays we had with 0.6.0), but it also enables a lot of very cool things, like being able to extend the console from View itself in many ways (unlike the Rebol2 GUI console). ;-)

SteeveGit

[15:55](#msg56ffeb77d39de41b495ff4a0)yep, working on a cheap coloring area with a draw overlayer

dockimbel

[16:27](#msg56fff2fc54b9c4023d23eb97)@SteeveGit FYI, we should add support for colors in console (and in PRINTing in general) at some point, just not sure when (maybe once we have the console:// port).

gour

[16:49](#msg56fff8201720648112da48f2)anyone in 'red/red' room? the last msg i see is mine at 2pm and nothing after that...a bit strange?

SteeveGit

[16:51](#msg56fff8a876b6f9de194d7f2c)nothing strange, some have family business I suppose.

gour

[16:52](#msg56fff8c71720648112da48f5)@SteeveGit so, there was not any msg after mine?

[16:54](#msg56fff9351720648112da48f9)i was also suspicious since 'Edit' is greyed out there?

fergus4

[21:09](#msg5700350811ea211749c430d1)How can I append to the draw block. In r2 I would do this:

[21:10](#msg5700354fd9b73e635f68a330)

```
append/only face/effect/draw compose/deep reduce ['fill-pen red   'circle 50x50 50]
```

SteeveGit

[22:24](#msg570046aa8d2a72471b7c7aec)The block can be attached to face/draw

fergus4

[23:02](#msg57004f95d478c81e2cbc8316)i tried append face/draw i get an error: append does not allow none!

SteeveGit

[23:06](#msg5700508b76b6f9de194d8f43)Initialize it with an empty block.

```
face/draw: []
```

Or in view:

```
view [base 100x100 draw [ ] ]
```

fergus4

[23:09](#msg5700511111ea211749c435d8)Got it...

```
face/draw:  reduce ['fill-pen red   'circle 50x50 50]
```

SteeveGit

[23:11](#msg570051b176b6f9de194d8f61)

```
face/draw:  [fill-pen red   circle 50x50 50]
```

should be enough

fergus4

[23:13](#msg5700522b11ea211749c435fb)and to append to the face:

SteeveGit

[23:14](#msg57005244bbffcc665fab9661)???

[23:15](#msg570052858d2a72471b7c7cc9)post a bit of your code on gist

fergus4

[23:15](#msg5700529c8d2a72471b7c7ccc)

```
face/draw:  append face/draw reduce ['fill-pen red   'circle 25x25 20]
```

SteeveGit

[23:16](#msg570052d5bbffcc665fab9672)so what?

fergus4

[23:16](#msg570052d9bbffcc665fab9673)no need to reduce....

SteeveGit

[23:17](#msg5700531dbbffcc665fab967b)just test it yourself man ;-)

fergus4

[23:18](#msg57005333e4a8384a1bbe4d16)What? I wanted to append to the existing block. If you just face/draw: \[new draw block] it deletes the previous draw stuff....its just different from r2 thats all...

[23:18](#msg5700536011ea211749c43625)What are you talking about? I was testing it and I asked for help with the syntax....just don't respond then man!!!!

SteeveGit

[23:23](#msg5700548ad478c81e2cbc83b6)Well, it has nothing to do with RED or REBOL gui specifics. It's more related to how you understand the basics related to blocks manipulations. You need more practice in that field. Sorry if I hurt your feelings, ,not my intention ;-)

## Sunday 3th April, 2016

dockimbel

[04:35](#msg57009d9154b9c4023d23edcc)@fergus4 Alan, Draw works the same way as in R2, it's just not connected to the face in the same way. In R2, the draw block is to be put in face/effect block `face/effect: [draw [...]]`, in Red, there's a `draw` facet where you reference the draw block directly: `face/draw: [...]`.

iArnold

[08:09](#msg5700cfb654b9c4023d23ee03) I always use face/draw: copy \[] to initialize a block!

## Monday 4th April, 2016

iArnold

[07:55](#msg57021de48d2a72471b7cb97b)Question: Is writing files only supported for interpreted?

[08:14](#msg5702227b8d2a72471b7cbab8)Answer, no. But there is definitely some other difference between compiled and interpreted that hindered me here.

[08:35](#msg5702276bd39de41b4960481c)I had a function with an foreach loop create a string using the rejoin mezzanine for constructing my data to write to a file. And because the last action of the loop was update of the return string I left it at that. Interpreted was no problem but compiled it complained my data was a block! type. Now I added the name of the resulting string after the foreach loop, specifying the return value. After that, the compiled program agreed the data now was of type string! and the write completed successfully.

[08:39](#msg5702283dd9b73e635f68eb25)(It is too little of a problem for now to turn this into a proper issue, until proper I/O will be implemented. But I thought you might want to know about it.)

[09:09](#msg57022f548d2a72471b7cbe91)Question: Is there an 'alert window in VID and how do I use it

[09:10](#msg57022f9bd39de41b49604a94)Question: Is there a way to deactivate a button? (Make it grey and not react to clicking until it is activated again)

[09:29](#msg570233fbe4a8384a1bbe903a)Answering my first question myself: define another window and view that, to close it use unview.

[09:32](#msg570234c18d2a72471b7cc00d)About the second question I propose a facet name 'idle (default value no).

[10:26](#msg57024154e4a8384a1bbe93c7)(The rejoin mezz can return a block! so ignore those posts please)

[11:26](#msg57024f5776b6f9de194ddcf2)Question: How do I make this alert window truly modal?

WiseGenius

[11:35](#msg5702518bd087756f7c04388c) &gt; Question: Is there a way to deactivate a button? (Make it grey and not react to clicking until it is activated again)

@iArnold

```
view [
	b: button "print" [print "Hello, World!"] disabled
	check "enabled" [b/enable?: face/data]
]
```

[11:54](#msg570255ea54b9c4023d23f3ba)&gt; Question: How do I make this alert window truly modal?

@iArnold Start from \[tests/modal.red](https://github.com/red/red/blob/master/tests/modal.red) as an example.

iArnold

[12:31](#msg57025ea211ea211749c48431)@WiseGenius Thanks! And thanks again :-D

[12:43](#msg57026171bbffcc665fabe8e8)Do you happen to know a smart way to know if

```
ok
```

or

```
cancel
```

on the modal window was pushed?

PeterWAWood

[23:59](#msg5702ffd7d39de41b49608d74)@dockimbel @qtxie

```
halt
```

doesn't seem to be properly handled in event handlers.

```
red>> view [button "halt" [halt]]
*** Throw error: no catch for throw: halt-request
*** Where: throw
```

## Tuesday 5th April, 2016

dockimbel

[02:38](#msg5703253f54b9c4023d23f8fc)@PeterWAWood Exceptions cannot currently pass through callbacks from OS calls (like for event handlers), so we have a "catch-all" barrier on the callback's exit to stop any exception and display it if unhandled.

iArnold

[09:38](#msg5703878d76b6f9de194e35ca)

[09:47](#msg570389c9e4a8384a1bbeee5e)How to use the para or align for the position left or right of the textlabel of a checkbox?

[09:53](#msg57038b10d478c81e2cbd2a7d)I just crashed Red GUI-console:  
view [  
chk1: check 200 "You want more?"  
return  
button "probe" \[probe chk1 ]  
button "align" \[chk1/para: \['left] ]  
button "stop" \[unview]  
]  
Don't press align now ;-)

Zamlox

[09:59](#msg57038c868e22137808cc1687)@iArnold try this:

```
view [
chk1: check 200 "You want more?"
return
button "probe" [probe chk1 ]
button "align" [chk1/para: make para! [] chk1/para/align: 'right ]
button "stop" [unview]
]
```

[10:10](#msg57038f00f504b375561b44cf)you can replace block of "align" button with

```
chk1/para: make para! [align: 'right]
```

iArnold

[10:10](#msg57038f3215b4d27b083ec7f0)@Zamlox this aligns the text to the right, but the label still is on the right hand side of the checkbox.

Zamlox

[10:11](#msg57038f5ff504b375561b44e5)oh, now I got it. you want to align the text relative to checkbox

[10:11](#msg57038f6f5386a91525336ef7)I don't know if it's possible.

iArnold

[10:12](#msg57038f8415b4d27b083ec804)yes! Instead of BOX-TEXT I want TEXT-BOX

[10:12](#msg57038f998e22137808cc177c)That is what I make of https://github.com/red/red/wiki/Red-View-Graphic-System#check

Zamlox

[10:15](#msg5703902b5386a91525336f26)the 'para' facet applies to align text of the face object as it would be in a paragraph

[10:15](#msg5703904115b4d27b083ec82e)that document is not explicit if it's relative to the check box.

iArnold

[10:16](#msg57039076dc7a737756975c4a)Yes it is: "This type represents a check box, with an optional label text, displayed on left or right side."

And when I probe chk1 I see a para that is none, so then I do not get why I should use make para!

Zamlox

[10:17](#msg570390b8dc7a737756975c5a)well, a para facet should be of type https://github.com/red/red/wiki/Red-View-Graphic-System#para-object

[10:18](#msg570391068eec5313252e2cbe)and because is none by default, you must create it.

[10:20](#msg5703917d5386a91525336f79)the console crashed because you tried to give 'para' a block instead of an object of that type.

iArnold

[10:20](#msg57039184f7d63d897f23601b)OK. It looks like this is intended but not yet supported. Workaround is using a text and a checkbox

[10:21](#msg570391a65386a91525336f83)The para! type could use some more explaining ;-)

Zamlox

[10:21](#msg570391adf504b375561b4574)yes, true.

## Wednesday 6th April, 2016

KenSingleton

[09:48](#msg5704db7215b4d27b083f2154)Middle and Bottom not aligning text or text in field - text always remains at top.

iArnold

[10:41](#msg5704e7d28eec5313252e898a)The aligning of a text before a field, then the text is shown and it looks to be on the high side.  
@KenSingleton You are using v-align to do that right?

KenSingleton

[10:44](#msg5704e87515b4d27b083f24dc)No I am trying Vid snippets like this: view \[text 300x100 "Hello" center middle] - I would expect middle to align the text in the middle vertical of its face as center does the horizontal.

PeterWAWood

[11:22](#msg5704f18ef7d63d897f23c0ae)@KenSingleton Middle seems to work with "rectangle" faces such as base, panel and button where the text is placed in the rectangle. It doesn't work with text-based faces (text, field). I think this due to the sizing of the text being driven from the font-size rather than the depth of the container.

KenSingleton

[11:30](#msg5704f339f504b375561ba523)@PeterWAWood, @iArnold - Ok, thanks for the replies. So it is not a bug but needs clarification on the docs at some point.

## Thursday 7th April, 2016

iArnold

[06:44](#msg570601d3f5db499c02185afb)Question about react:

lock-fld: check "Lock field"  
fld: field disabled "Content" react \[fld/enable?: not lock-fld/data]

fld: field disabled "Content" react \[fld/enable?: not lock-fld/data]  
lock-fld: check "Lock field"

First example works second does not. Is it a bug?

[07:26](#msg57060bb382aae5fc279a2373)Question: Area can have a vertical scrollbar appear if the text does not fit, but I doubt if it is implemented.

dockimbel

[09:14](#msg570625049ef9b99902aec4d0)The vertical scrollbar should appear automatically in `area` when necessary. If it's not the case, a ticket should be opened.

justjenny

[13:01](#msg57065a43d6cbe1fd27fe26c9)hi, could someone show me how to trap/detect the close event (X) when closing a Red gui from the title bar - also I notice that the 'Alt+F4' keys do not close a window.

Phryxe

[13:27](#msg57066034d62e7a1918de8b74)\[Tab example](http://redprogramming.com/Short%20Red%20Code%20Examples.html) on \*\*Short Red Code Examples\** doesn't work unless `s: slider 100x20 data 20%` is moved above `progress 100x20 data 20% react [face/data: s/data]` ...

PeterWAWood

[14:21](#msg57066ccfd6cbe1fd27fe2d9c)@nickantonaccio ^^^^^^^  
I think this is related to a reported bug though perhaps you could change the example for now.

meijeru

[18:32](#msg5706a7d774d45a71586e5158)^^^^^The bug has been discussed on Gitter but as far as I know it has not been formalized as an issue. It might not even be a bug but rather a feature ;-).

## Friday 8th April, 2016

dockimbel

[01:54](#msg57070f3e7b0bca5e3ed20a8c)Yes, it looks like the reactor fires too early, so it qualifies as a bug. I thought we had a ticket for it already?

gour

[09:26](#msg5707794f7b0bca5e3ed20bd3)\[this](https://twitter.com/red\_lang/status/718009767088631808/photo/1) is great news!

meijeru

[09:51](#msg57077f0bf55f5c717feb44f6)@dockimbel The early firing bug did not have a ticket, I will make one.

dockimbel

[09:51](#msg57077f1ec65c9a6f7f27d779)@meijeru Thanks!

## Wednesday 13th April, 2016

PeterWAWood

[11:03](#msg570e2767af46361038641616)@dockimbel @qtxie In VID is it possible for the default height of a

```
text
```

face to be calculated from a supplied

```
font-size
```

facet if the size is not specifically supplied?

You'll understand why I'm asking if you try this:

```
view [ field font-size 20 600]
```

dockimbel

[12:08](#msg570e36b96cb2de8b308450e5)@PeterWAWood It's a bug.

PeterWAWood

[13:22](#msg570e48193ddb73ba105ba73f)@dockimbel Would you like me to open an issue?

dockimbel

[14:32](#msg570e587bf8160b9c07c16721)@PeterWAWood Yes, you can

## Saturday 16th April, 2016

PeterWAWood

[03:51](#msg5711b6b43ddb73ba105c9922)I've changed the VID reference doc for

```
panel
```

as the &lt;options&gt; have to be supplied in a block. (I'm noting here in case that is not intended).

[04:18](#msg5711bd114c2125fc3f02e3f3)@dockimbel @qtxie I tried (unsuccessfully to set the title and backdrop of a tab-panel in VID. I got these errors:

```
red>>view [tab-panel [title "" backdrop pink] ["one" [text "one"] "two" [text "two"]]]
*** Script error: copy does not allow word! for its value argument
*** Where: copy
red>> view [tab-panel title "" backdrop pink ["one" [text "one"] "two" [text "two"]]]
*** Script error: path none is not valid for none! type
*** Where: max
```

Is it a bug or am I doing something wrong?

[04:22](#msg5711bdf54c2125fc3f02e415)@dockimbel @qtxie Setting the backdrop of a panel only seems to work if there is also a title. Is this correct?

The following example should demonstrate the behaviour:

```
view [
		panel 2 [title "" backdrop blue] [below text "one" text "two" text "three"]
		panel 2 [ backdrop purple] [below text "four" text "five" text "six"]
]
```

[09:21](#msg5712040a2c97111664327510)Is there a simple way to have some padding inserted at the front of a text face in VID?

## Sunday 17th April, 2016

PeterWAWood

[00:54](#msg5712dedbb30cfa0f384c158d)@dockimbel @qtxie

When I add a return into the "contents" block of a panel, it seems that a "blank" entry is displayed. This code:

```
view [
		panel 2 [title "" backdrop pink] [
			below 
			text "one"
			text "two"
			text "three"
			return
			text "four"
			text "five"
			text "six"
		]

]
```

generates this:

[00:57](#msg5712df633ddb73ba105cc266)\[!\[Screen Shot 2016-04-17 at 08.56.36.png](https://files.gitter.im/red/red/gui-branch/acT5/thumb/Screen-Shot-2016-04-17-at-08.56.36.png)](https://files.gitter.im/red/red/gui-branch/acT5/Screen-Shot-2016-04-17-at-08.56.36.png)

[00:57](#msg5712df794c2125fc3f030ba5)Is that the expected behavious

qtxie

[01:57](#msg5712ed9d5ed5a4fd3fe3ad34)The `panel`'s backdrop should be set without title, it's a bug.

PeterWAWood

[03:39](#msg5713057c3ddb73ba105cc607)@qtxie Would you like me to open an issue in Github?

[10:38](#msg571367b12c9711166432a1ba)@dockimbel @qtxie When I try to specify options for a panel, I get a script error. Am I specifying them incorrectly?

```
red>>  view [panel 3 backdrop red [text "one" text "two" text "three"]]
*** Script error: VID - invalid syntax at: {[backdrop red [text "one" text "two" text "three"]]}
*** Where: do
```

dockimbel

[11:29](#msg571373923066f78f385debf2)@PeterWAWood `backdrop`, like `title`, are VID standalone commands and not options, so they should go in the content block.

PeterWAWood

[11:38](#msg571375b63ddb73ba105cd0b9)@dockimbel Thanks.

## Monday 18th April, 2016

PeterWAWood

[00:22](#msg571428aa5ed5a4fd3fe3d58c)@dockimbel The VID

```
font-color
```

command seems to take an optional second colour value that sets the text background colour:

```
view [text "hello" font-color white blue]
```

[00:22](#msg571428c2b30cfa0f384c4062)If this is intended, should I add it to the VID docs?

dockimbel

[00:44](#msg57142df6507f6ddc703cccf5)@PeterWAWood It is not related to `font-color`, a face can take a color argument which is used to paint its background (for faces which support it). See `tuple!` entry in this \[table](https://github.com/red/red/wiki/VID-Reference-Documentation#datatypes).

PeterWAWood

[01:50](#msg57143d512c9711166432c097)@dockimbel Thanks.

[02:24](#msg57144562548df1be102dc280)Are the top, middle, bottom keywords valid for

```
text
```

faces?

The text is displayed at the top of the text face in this example:

```
view [250x600 blue "Text Bottom" center bottom font-color white font-size 40]
```

qtxie

[03:12](#msg5714508a5ed5a4fd3fe3da0c)@PeterWAWood `Panel`'s backdrop will be drawed correctly now.

PeterWAWood

[03:16](#msg571451a95ed5a4fd3fe3da28)@qtxie Thanks!! I can confirm that it does.

[03:21](#msg571452d55ed5a4fd3fe3da47)Is there a way to avoid repeating keywords in VID? For example, can I avoid repeating

```
font-color white purple
```

in the following example?

[03:22](#msg571452f2b30cfa0f384c454f)

```
text
view [
		panel 2 [ backdrop pink] [
			below 
			text "one" font-color white purple
			text "two" font-color white purple
			text "three" font-color white purple
			return
			text "four" font-color white purple
			text "five" font-color white purple
			text "six" font-color white purple
		]

]
```

qtxie

[03:27](#msg571454073ddb73ba105cf19e)Use style?

PeterWAWood

[03:30](#msg571454be548df1be102dc454)Isn't style View only at the moment?

[03:31](#msg571455095ed5a4fd3fe3da7f)Oops no it isn't ... thanks

## Wednesday 20th April, 2016

Zamlox

[10:07](#msg571754cd5b5164bf56ee3528)how can I make transparent the background color of a face ?

dockimbel

[10:11](#msg571755ecac0da13a330967a3)@Zamlox Set a background color with a transparency component (tuple with a fourth byte). Works only on base faces.

Zamlox

[10:13](#msg57175639599a529856d973b5)@dockimbel works like a charm :) thanks.

SteeveGit

[19:48](#msg5717dcf2a3833fbc5669e969)Trying to use on-key on a simple empty face, but doesn't seem to work.  
Tried on field and area faces, and it works. Am I missing something?

[19:49](#msg5717dd4125b488663625b277)The key events are detected with debug?: yes but not sent to my face

[19:49](#msg5717dd4e98c544f1396d00a8)I missed something surely.

[19:50](#msg5717dd96a3833fbc5669e999)Pokus...focus... something...

fergus4

[22:00](#msg5717fbeb98c544f1396d0a53)How do you use camera widget with vid? It seems to see the camera when I check with cam/data but image is not displayed on face.

[23:33](#msg571811c13307b26736e34181)Used cam/selected: 1 and I see the camera indicator light comes on but the face does not show feed.

## Thursday 21st April, 2016

fergus4

[00:07](#msg571819cea3833fbc5669f9a4)Just tried with view-test.red and same thing camera feed not showing. It was working before I know that. My camera works with skype so its not the hardware.

PeterWAWood

[01:22](#msg57182b405b5164bf56ee7ae8)@dockimbel @qtxie I tried to

```
do
```

view-test.red using a relative dir from the gui console and got an amusing side effect:

[01:23](#msg57182b86a3833fbc5669fc90)\[!\[Relative Path View Test.png](https://files.gitter.im/red/red/gui-branch/L9Yx/thumb/Relative-Path-View-Test.png)](https://files.gitter.im/red/red/gui-branch/L9Yx/Relative-Path-View-Test.png)

Zamlox

[04:32](#msg571857e327c0fbf239b00c90)How do I set background color for a panel face ? I tried:

```
view [panel 150x150 red [base 100x100 blue [print "clicked"]]]
```

but it will not make it red.

dockimbel

[05:06](#msg57185fe29b6268b672712b52)@Zamlox You currently cannot. Try replacing `panel` with `base` rather. Panels in the future should be implemented using a base face.

Zamlox

[05:07](#msg57186006599a529856d9bf26)@dockimbel ok, thanks.

dockimbel

[05:08](#msg571860550b408fb865dc4666)@PeterWAWood The error accessing that image is to be expected as it is a relative path too.

[05:09](#msg5718608db920909d77d2bff6)@fergus4 Try with an older version of Red, maybe there's a regression on that. Though, our current camera implementation doesn't support 100% of existing camera drivers yet.

[05:12](#msg5718613a0b408fb865dc4668)@SteeveGit You need to give the focus to the face using `selected` facet of the window face (see View documentation). Here's an example:

```
view win: layout [b: base on-key [print "key"] button "focus" [win/selected: b]]
```

SteeveGit

[05:13](#msg57186174599a529856d9bf48)Thanks Doc, will try it

dockimbel

[05:13](#msg57186182a18b5c1536e6b564)We should be adding a VID keyword to handle that more easily. Also, I would like to have `event/window` implemented to avoid having to acquire a reference manually using `win: layout` pattern.

SteeveGit

[05:14](#msg571861a1b129b59c56da15b6)I used my own event handler as a work-around until now

[05:14](#msg571861bb3307b26736e34d34)with a do-actor to my face ;-)

qtxie

[10:04](#msg5718a591a3833fbc566a150c)@Zamlox You should be able to set the background color for a panel, but you cann't draw on it.

Zamlox

[10:05](#msg5718a5f125b488663625dd00)well, when I tried to execute the above code the panel background didn't have red color.

[10:06](#msg5718a61b98c544f1396d2bc5)ok, now I got it.

[10:07](#msg5718a64e5b5164bf56ee9452)my intention was to use the panel as a container and to change its background color.

nodrygo

[10:44](#msg5718aef95b5164bf56ee96af)you should use a `base` I do that on my ongoing \[simpleCAD](https://github.com/nodrygo/DemosRed/blob/master/simpleCAD/images/redbicycle.png) demo ;-)  
the code is probably bad written or not idiomatic because I am learning Red/Rebol

Zamlox

[10:48](#msg5718b00d25b488663625df8e)great demo ;) Yes, I can use a base but then I should use 'at' when I want to place other face 'inside' that base. Using a panel would not require that tweak.

[10:53](#msg5718b13cb129b59c56da2946)\[!\[blob](https://files.gitter.im/red/red/gui-branch/9lkR/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/9lkR/blob)

[10:54](#msg5718b158a3833fbc566a1812)I don't know what happened but when I'm trying now again my example, it's working

[10:55](#msg5718b1bf27c0fbf239b021d7)I remember I executed command:

```
view [panel red]
```

and after that it worked. But even if I close/open again console, it works.

[11:50](#msg5718be9d25b488663625e3cf)mystery solved: I might have used an older version of red console when it didn't work (I tried now with 'red-31mar16-00362c3.exe' and does not work). But it works with versions starting from 'red-19apr16-b4b71d5.exe' (maybe also some other previous versions)

JenniferLee520

[15:13](#msg5718ee1398c544f1396d4612)

nodrygo

[17:47](#msg57191247599a529856d9f7bb)is this a bug ?

```
*** Script error: invalid Draw dialect input at: [closed]
*** Where: ???
red>>
```

## Friday 22nd April, 2016

dockimbel

[03:42](#msg57199dc11766a41665b05f9d)@nodrygo Works here with latest version.

ghost~5680c5f416b6c7089cc058a5

[03:44](#msg57199e2125b4886636262637)@dockimbel Works but leaves behind that error in the console as well...

[03:46](#msg57199e7c98c544f1396d78e0)\[!\[Untitled.png](https://files.gitter.im/red/red/gui-branch/kLYi/thumb/Untitled.png)](https://files.gitter.im/red/red/gui-branch/kLYi/Untitled.png)

dockimbel

[03:57](#msg5719a11efe9f076746b5deed)@nc-x @nodrygo Missed it, that's a bug, deserves a ticket.

ghost~5680c5f416b6c7089cc058a5

[05:26](#msg5719b6093307b26736e3ab61)@dockimbel done

dockimbel

[06:10](#msg5719c0671e0767ea5c0f4950)@nc-x Thanks!

nodrygo

[08:23](#msg5719df703307b26736e3b3e5)@dockimbel work fine now thanks

## Tuesday 26th April, 2016

SteeveGit

[18:06](#msg571fae330f156f102b40f6c1)/rage mode on :rage1:  
There's really something irritating with the current window's controls (base, field, panel, etc...). they are all filtering events in their own way. I looked at the source of the Windows' backend. And for a non windows programmer, it's a mess. I can't really grasp why they are all filtering windows events at such a low level. To me, Red users should be able to specify what event are allowed by the control to be sent (received from the perspective of a Red's face) or not. I will take an example. I want to build my own field with draw effects and I don't want to use 'field because of its look and feel. So, I will choose 'base face type as a starter. But then, 'base receive no focus events and can't be activated without patching the user code. And he can't receive 'key events if he is placed inside a 'Panel, because the parent (Panel) is activated in place of its child, even if I activated the child programmaticaly (window/selected: child). Don't ask me why. Sure, you can patch the user code to redirect and simulate the correct flow of events, but it's dirty. And all that, comes from some Red/system hardcoding in the Window's backend source code.

To stop my rant here, Since I don't know how to do it myself, I'll just ask for a type of face which is able to receive all the window events, and can be activated automaticly (call it 'Edit) since 'base does not fulfill the contract.

pekr

[19:21](#msg571fbfcd2cd01bf9764af227)So you want more transparent even flow? I thought that all events flow in the tree of widgets and that we will be able to put various filters there, etc.

SteeveGit

[19:26](#msg571fc0e59b4160fa760a117c)Actually no, events are filters in the red/system windows backend. So say, if you use a TEXT face, some events will never be emitted and the event handler (coded in red) will have nothing to do.

pekr

[19:30](#msg571fc1eb8a90ed791312e0d2)I never studied the backend code, so my comments might not be accurate. It also might be more tough to do it in an OS linked fashion, rather than having All in Rebol done R2/View like engine ...

SteeveGit

[19:31](#msg571fc21439700a780927662a)We would think that events are filtered by the presence (or absence ) of actors like (on-down, on-focus, on-key, on-click, etc...), but no. It's filtered way before that.

pekr

[19:33](#msg571fc2894ba1347709b54439)Some 15 years ago, when coding for Win95, I do remember, that you were not able to get all event types for particular UI elements. In might be hardwired in Windows itself. Difficult to say ....

SteeveGit

[19:36](#msg571fc3432cd01bf9764af369)@pekr, it's not tough at all. In fact I'm pretty sure the backend would have way less code if only a window-process function was written to rule them all without filtering by type of control. I suppose the real motivation behind, is to give a boost of performance.

pekr

[19:37](#msg571fc38c4da16e7d13d904c3)We will see, what Doc says to the topic. IIRC, they plan to introduce some more general event loop, but not sure it is going to be relevant to GUI?

SteeveGit

[19:40](#msg571fc4214da16e7d13d90501)About the limitation of each UI element, I don't know. You are probably right. But even so, I see hard coded filtering and fixed flags in Red/system backend. So nothing to do with UI elements themself.

## Wednesday 27th April, 2016

SteeveGit

[02:15](#msg572020a44da16e7d13d91bb5)Well well well. It's not as simple as I thought first. system UI elements are really restraining the fun. I don't know if it's simple to get a base style with a maximum of system events.

dockimbel

[04:55](#msg5720464649d5aaf16db7eb2d)I agree that the base face should receive all the possible events, as it will be used to build custom widgets. Though, the full support for custom widgets is not complete yet.

[09:53](#msg57208c3239700a7809279423)@SteeveGit Key events are properly passed to base faces, and it is possible to give focus to them:

```
view win: layout [
	panel [
		field
		b: base on-key [print event/key]
		button "focus" [win/selected: b]
	]
]
```

[09:55](#msg57208c910f156f102b412b6a)Some other events would need to be added specifically for the base face, like: focus, unfocus and click.

[09:57](#msg57208d270f156f102b412ba0)

[12:21](#msg5720aeb839700a7809279e85)With the latest commits, now this alternative form for pre-setting the focused face also works:

```
view [
	panel [
		field
		b: base on-key [print event/key]
	]
	do [self/selected: b]
]
```

SteeveGit

[14:32](#msg5720cd958a90ed79131323fa)@dockimbel , After new tests, it seems the prob comes from fields in my window, not directly from the panel as I thought first. In my example, If you click in the field first, then you need to click several times on the base face to regain the focus (btw, the focus function is a go go).

```
focus: function [face [object!]][
	parent: face/parent
	while [parent/type <> 'window][parent: parent/parent]
	parent/selected: face
]
view [
    base "base"
     	on-key [prin mold event/key dump-face face]
       	on-down [prin 'focus dump-face face focus face]	
    field 
]
```

[14:40](#msg5720cf782cd01bf9764b3809)This problem does not pop up in your example, because you pass through a button to regain the focus first.

[14:43](#msg5720cffc9b4160fa760a55eb)So it works when the focus go through: field --&gt; button --&gt; base  
but not when: field --&gt; base

[14:54](#msg5720d2c00f156f102b414377)How I picture, Doc looking at the focus function:  
http://replygif.net/i/586.gif

dockimbel

[15:28](#msg5720daa98d3a974522a507c5)@SteeveGit :+1: Captain Picard is one of my all-time favorite movie character. ;-)

[15:29](#msg5720dad749d5aaf16db7eeb8)You have `event/window` since the last commit, so you can directly set the focus now from an event using `event/window/selected:`. ;-)

SteeveGit

[15:30](#msg5720db084ba1347709b58e8f)ok cool

dockimbel

[15:32](#msg5720db868d3a974522a507cc)I reproduced your issue above with the focusing of the base failing. I'm investigating it now.

## Friday 29th April, 2016

planetsizecpu

[17:07](#msg572394e760e2f3e873661081)@dockimbel Hi, today had some time for test view!

[17:17](#msg57239742d407319f67312b60)@dockimbel I want to use relative size of widgets using a Pair! word, such as "panel Size blue" but I dont know how to join h-size and v-size to construct the pair value, more over, I would like to use a relative value taken from the view window size to adapt to the OS screen resolution, I wonder we have some red/system value storing it.

pekr

[17:21](#msg57239818e10a59c0610732bc)red&gt;&gt; as-pair 10 20  
\== 10x20

planetsizecpu

[17:22](#msg572398479afbb99c67e6e18f)Thx pekr!

[17:23](#msg5723987cd407319f67312bc7)@pekr do you know about system value where to take main screen size?

pekr

[17:23](#msg572398ab60e2f3e8736611e9)help system/view

dockimbel

[17:24](#msg572398c8de9040f458f2cb00)@planetsizecpu `system/view/screens/1/size` will give you that. But it will be filled only after the first window will be displayed.

pekr

[17:25](#msg572398f360e2f3e87366120a)what is system/view/metrics/screen-size?

planetsizecpu

[17:25](#msg5723990ce472a3e473bfa7ea)@dockimbel thx! I will made some testing today

dockimbel

[17:25](#msg5723991cde9040f458f2cb05)@pekr A left-over from early implementation. Not used.

planetsizecpu

[17:44](#msg57239d799afbb99c67e6e34f)!got it: `code` Red [  
Title: "Test"  
Needs: 'View  
]

; Screen defaults  
ScreenArea: system/view/screens/1/size  
Pan1: ((ScreenArea/1) / 2) - 60  
Pan2: (ScreenArea/2) - 60  
PanelArea: as-pair Pan1 Pan2

; Screen layout  
TestScreen: [  
panel PanelArea gray "LEFT PANEL"  
panel PanelArea brick "RIGHT PANEL"  
]

; Show screen  
view TestScreen

halt

## Sunday 1st May, 2016

SteeveGit

[16:50](#msg572633e3de9040f458f2d3b5)@dockimbel To be sure, are the VIEW,VID based functions (layout, view, etc...) also compiled (as routine!) Because, I see differences in execution when I re-define and run %VID.red functions fully in interpreted mode.

[16:52](#msg57263467de9040f458f2d3b8)I probably have a correction in VID even if it's not occuring in the compiled version.

dockimbel

[18:01](#msg5726448bde9040f458f2d3da)@SteeveGit Yes, there are compiled (not as routines, but as Red/System functions).

[18:03](#msg5726450e495494d45eac41d7)I'm not sure what you mean by "re-define". You changed them in the source code or at run-time? Changing compiled Red function at run-time is not properly tested yet (and I'm not sure it is fully supported yet).

SteeveGit

[18:04](#msg57264527cf0d61086bd264b6)I see, then look at that VID function:

```
pre-load: func [value][
		if word? value [attempt [value: get value]]
		if find [file! url!] type?/word value [value: load value]
		value
	]
```

[18:05](#msg57264577cf0d61086bd264b8)And imagine the issue if value is word! pointing to a function!

[18:06](#msg572645bf2624e2150740ca47)No problem when compiled, but unexpected result when interpreted.

dockimbel

[18:06](#msg572645c1de9040f458f2d3e0)I get it now. Yes, the compiled code will not call the function in that case (but that will change once we have the new dynamic stack), while the interpreter will call it.

[18:07](#msg572645e52624e2150740ca48)It should be easily fixed by using `:value` where required.

SteeveGit

[18:08](#msg5726460e495494d45eac41dc)totally, and it's also related to the get-word! issue some days ago

[18:10](#msg5726467f495494d45eac41dd)So the fix :value would not fix anything. It was a nice week :smile:

dockimbel

[18:10](#msg57264694cf0d61086bd264be)@SteeveGit The get-word! issue should be fixed now, no?

SteeveGit

[18:10](#msg5726469f2624e2150740ca4c)yes I know Thanks

PeterWAWood

[23:33](#msg572692589344bbcb0f8ba69f)I'm trying to align some label - field combinations in columns with VID using a group box. The width of the two "columns" in the grid appear to be calculated from the first row. Subsequent longer elements are not fully displayed.

For example, this code:

```
group-box 2 [
		text "Field 1" right
		field 200 
		text "Much Longer Field Name" right
		field 200
	]
```

Produces this:

[23:38](#msg572693699afbb99c67e75390)\[!\[GroupBox.png](https://files.gitter.im/red/red/gui-branch/ivuB/thumb/GroupBox.png)](https://files.gitter.im/red/red/gui-branch/ivuB/GroupBox.png)

## Monday 2nd May, 2016

PeterWAWood

[01:07](#msg5726a860e472a3e473c01d56)@dockimbel Is it possible to change the font and size of a title in VID? It's not for the Window title but for titles for Panels, Group-Boxes and also the name of a Tab in a Tab-Panel. (So that the user can use one font throughout the Window.)

[01:28](#msg5726ad4ce10a59c06107abb8)When you use

```
return
```

in

```
group-box
```

, it seems to be treated as an empty face rather than be recognised as the end of a "row" (using

```
across
```

). I find this counter intuitive.

This code demonstrates the behaviour:

```
view [
	title "My Layout" 
	group-box 4 [
		text "Using return"
		return
		text "Field 1"
		field 200 
		text "Much Longer Field Name"
		field 200
	]
	
]
```

[02:14](#msg5726b819e472a3e473c01f22)@dockimbel @qtxie If you include #"&amp;" in the string to be displayed by a

```
text
```

face in VID, the &amp; gets converted to an underscore prefix of the following word.

This code demonstrates the behaviour:

```
view [text "This is a long title & short content"]
```

[02:20](#msg5726b9669afbb99c67e75801)@dockimbel @qtxie I used this small layout to look into on-key behaviour. I noticed that when displaying the number of the pressed key in a second field the char of the key is displayed as a prefix to the number. When printing , only the number is printed.

```
view [
	title "Key Presses"
	text "Fields 1 and 2"
	field 200 
		on-key [
			key-pressed: mold to integer! event/key
			print key-pressed
			f2/text: key-pressed
		]
	f2: field 200 
]
```

qtxie

[02:47](#msg5726bfade472a3e473c01ff3)@PeterWAWood Fixed it.

PeterWAWood

[03:01](#msg5726c2fae472a3e473c0203a)@qtxie Thanks for fixing the added key prefix.

[03:35](#msg5726cb0be472a3e473c0210a)@dockimbel Following your example to @Steeve to give the focus to a field, I got an entry printed in the GUI-console when giving focus to the field for the first time:

Code:

```
view win: layout [
	title "Focus"
	button  "Set Focus on Field" [win/selected: f]
	f: field 50 
]
```

Console output:

```
red>> do %focus.red
opts: context [type offset size text color enable?...
```

[04:04](#msg5726d1c09afbb99c67e75aa4)@dockimbel I've checked again and the message is printed in the console when the window opens not when the field gets focus.

[06:35](#msg5726f5439afbb99c67e75f12)@dockimbel Sorry, I just remembered that I compiled the gui-console with the debug option.

## Wednesday 4th May, 2016

Oldes

[11:50](#msg5729e1e90149d6bb04b8984f)How to have a field, which is enabled, but not writable (only select and copy would be possible)?

pekr

[11:58](#msg5729e3e00149d6bb04b898d4)Sounds like label. We don't have a style for that IIRC. Not sure you can inherit from field to your own style and modify your behaviour, so that key presses would get ignored, except for ctrl + c?

meijeru

[20:03](#msg572a55760149d6bb04b8c433)I have formulated an issue about scrolling not being implemented. Is his a known error perhaps? Should I wait?

[20:25](#msg572a5ab0944fc7ba04cd1c91)his -&gt; this

## Thursday 5th May, 2016

meijeru

[08:13](#msg572b00ab72798bd77bea335a)I know now it is indeed a known issue.

rebolek

[11:32](#msg572b2f50b16b91060f79a3d2)@dockimbel I’m confused, I though this should be working. Is it a bug or am I doing something wrong?

```
view [l: text-list data [] button "populate" [l/data: ["a" "b" "c"] show l]]
```

SteeveGit

[11:50](#msg572b337cb16b91060f79a3ec)

```
view [l: text-list data [] button "populate" [append l/data ["a" "b" "c"]]]
```

rebolek

[11:51](#msg572b33cd682b8fdf3c8c9b2b)Yes, I found that `append` works, but shouldn’t direct assignment work too?

SteeveGit

[11:53](#msg572b3442b16b91060f79a3f0)It should, it depends of what is coded inside on-change and on-deep-change and they are probably different in that case.

rebolek

[11:54](#msg572b3475682b8fdf3c8c9b2e)But if force `show` on it, on-change shouldn’t be a problem?

SteeveGit

[11:56](#msg572b3509c2a86dcf79195a77)show doesnt reconstruct the face content, it only informs the OS to refresh the screen part.

[11:57](#msg572b3530c2a86dcf79195a78)I may be wrong...

[11:58](#msg572b3561682b8fdf3c8c9b35)I assume the face needs reconstruction with legit red code

dockimbel

[12:29](#msg572b3c93682b8fdf3c8c9b62)@rebolek Looks like a bug/regression. Looking into it right now.

rebolek

[12:46](#msg572b40abc2a86dcf79195ab5)@dockimbel Thanks. Looks like a regression to me, because I think I’ve been using it before.

dockimbel

[14:26](#msg572b580d682b8fdf3c8c9c1b)@rebolek Issue fixed.

rebolek

[14:26](#msg572b581eb16b91060f79a4f1)Thanks, I will try it.

[14:39](#msg572b5b06b16b91060f79a508)Works great, thanks!

## Monday 9th May, 2016

PeterWAWood

[03:20](#msg57300217a351d83109521520)The

```
/no-wait
```

refinement of

```
view
```

seems to affect the updating of the display when a

```
wait
```

it issued after the the

```
view/no-wait
```

call.

In this simple example, the updates to the display are not seen when

```
unview
```

is delayed using

```
wait 3
```

but are seen when using

```
ask
```

:

```
do [
     view/no-wait [t1: text "1" t2: text "2"]
     t1/text: "one"
     t2/text: "two"
     wait 3
     unview
]
```

```
do [
     view/no-wait [t1: text "1" t2: text "2"]
     t1/text: "one"
     t2/text: "two"
     ask "hit any key"
     unview
]
```

dockimbel

[05:37](#msg57302209c2a86dcf7919759a)@PeterWAWood Works fine here, I can see "one" and "two" displayed using your code.

endo64

[19:43](#msg5730e844f9a53a60793d251b)Works fine with latest build.

## Tuesday 10th May, 2016

nodrygo

[09:46](#msg5731addb12fa465406eb7a76)Hello I am playing with little \[demo editor](https://github.com/nodrygo/DemosRed/blob/master/demosBasic/basicEdit.red) and I have 2 questions  
1: is it possible to have different text color in `area` ?  
2: how (and is it possible) to pass parameter on menu ?

```
"Font" [
                    "Size"     
                         [
                         "8" setfont8
....
                on-menu: func [face [object!] event [event!]][
                        switch event/picked [
                           'setfont8 [codesrc/font/size: 8 ]
```

dockimbel

[09:52](#msg5731af7a3170252648f59196)1. No, that's the purpose of a future rich-text widget  
2\. Not currently, you can just use a word IIRC, though we might relax it so you could get any value you set for a given menu (like a block, where you can pass all the parameters you want).

nodrygo

[09:56](#msg5731b046f36daf63798e2cd7)@dockimbel ok thanks for answer

## Wednesday 11st May, 2016

justjenny

[09:44](#msg5732ff02ed393f3409b1c4f8)Hi, can someone please show me 'how can I make sure only one instance of a Red application is running at a time' - also in Rebol I use: 'system/view/screen-face/size' to get screen size, how can I do that in Red ? ....

pekr

[09:45](#msg5732ff35b51b0e2948512c84)For the first question, I don't know answer. For the latter, it is stored in system/view/screens/

[09:48](#msg5732ffd512fa465406ebe90b)Here's the short example I did for one user yesterday:

```
view v: layout [
    below

    text "test of the window resizing"

    button "get screen info" [
        screens: system/view/screens
        print ["Screen:" newline "Offset: " screens/1/offset newline "Size: " screens/1/size newline]
        print ["Window:" newline "Offset: " screens/1/pane/1/offset newline "Size: " screens/1/pane/1/size]
    ]

    button "resize" [
        v/offset: screens/1/offset
        v/size: screens/1/size   
    ]
]
```

[09:48](#msg5732ffeaa351d8310952f686)Please beware - I am not the smartest coder, so :-)

dockimbel

[09:53](#msg57330127ed393f3409b1c5a0)@pekr Thanks for answering those questions.

pekr

[09:54](#msg57330168b51b0e2948512d1a)Ah, that's ok. I just noticed, how many "rebol" things I forgot in the meantime when no time for "rebolling". Anyway - was surprised how easy it was to get done ...

[09:55](#msg573301a2f16c08510662bbd6)The user on the ML asked about the maximize - my answer was just a guess, but it would need some API wrapping to support that? My above window enlargement is not truly a maximize operation ...

justjenny

[20:08](#msg573391431254a7206adb12e2)@pekr thanks for your help ....

## Friday 13th May, 2016

Zamlox

[10:41](#msg5735af5d831fd2d97d9e1a66)@pekr to enable maximizing a window, it would be necessary to add

```
'resize
```

to

```
flags
```

facet of the main window. For your example would be:

```
v/flags: 'resize
```

. This will not automatically maximize the window but it will enable the maximize button.

pekr

[11:29](#msg5735ba7f64dbdadc7debb83a)I know, and I even mentioned it in terms of my google groups answer, but - that's just resize, not maximize ...

Zamlox

[11:49](#msg5735bf66ae26c1967f9e2233)You can still do it by calling directly Windows API responsible for maximizing windows. For this you need to use also Red/System. Something like:  
libs.reds:

```
Red/System []

#import [
    "User32.dll" stdcall [
        FindWindow: "FindWindowA" [
            lpClassName  [c-string!]
            lpWindowName [c-string!]
            return:      [handle!]
        ]
    ]
    "User32.dll" stdcall [
        ShowWindow: "ShowWindow" [
            hWnd        [handle!]
            nCmdShow    [integer!]
            return:     [logic!]
        ]
    ]
]
```

test-maximize.red:

```
Red [
    Needs: 'view
]

#system [
    #include %libs.reds
]

maximize-window: routine [] [
    ShowWindow FindWindow "RedWindow" "Red: untitled" 3
]

v: layout [
    below

    text "test of the window resizing"

    button "get screen info" [
        screens: system/view/screens
        print ["Screen:" newline "Offset: " screens/1/offset newline "Size: " screens/1/size newline]
        print ["Window:" newline "Offset: " screens/1/pane/1/offset newline "Size: " screens/1/pane/1/size]
    ]

    button "resize" [
    	maximize-window
    ]
]

v/flags: 'resize
view v
```

The catch is to setup the right title name when calling

```
FindWidnow
```

API.  
You must compile test-maximize.red

pekr

[11:58](#msg5735c151c61823687d3b8865)cool. You could post it in the Google group related thread?

Zamlox

[11:58](#msg5735c169eea93e5742d19001)if you give me the link.

pekr

[12:00](#msg5735c1c664dbdadc7debba95)Sure - https://groups.google.com/forum/#!topic/red-lang/q8w8MPIft9g

[12:01](#msg5735c203ae26c1967f9e2319)Where does the included libs.reds come from?

Zamlox

[12:02](#msg5735c239ae26c1967f9e2328)libs.reds contains the first code section and test-maximize.red contains the second code section. They must be in same folder to work. It can be any name, but I chose libs.reds

pekr

[12:03](#msg5735c2afc61823687d3b88c9)Ah, sorry, it is written above the source code. The source code section is so dominant, that I haven't bothered to read the rest of the message :-)

fergus4

[22:05](#msg57364fc3e2996a5a42c83b6b)@Zamlox That is a great little example of how to use red/system to access os libs.

## Tuesday 17th May, 2016

justjenny

[12:43](#msg573b11f0c61823687d3c9f3e)Hi, I did ask this question a while ago, 'how can I make sure only one instance of a Red application is running at a time' - I've also been looking at file handling in Red, 'how do I delete a file ?' - in Rebol its simply 'delete %myfile.txt'

pekr

[12:45](#msg573b125ae2996a5a42c91a81)I think you can't easily (out of the box) do such operations yet. File handling is just basic read/write combo, so no 'delete right now. As for finding out another instance of the app is running, you can't do it either imo.

[12:47](#msg573b12fc831fd2d97d9f3375)For both, you would have to utilise R/S imo and wrap some functions. For the latter case, mapping to the list of running apps. Maybe there is some command line command to get a list (kind of PSU under linux). That would be usefull once the CALL is available (you can have it now), then you would be able to parse/filter such output ....

[12:49](#msg573b13531794136a7d096942)Hmm, under Windows, the command is called 'tasklist

## Wednesday 18th May, 2016

justjenny

[20:51](#msg573cd5d5e2996a5a42c9a74f)Thanks again @pekr - Yes, I managed to delete a file, by calling the shell after '#include %system/library/call/call.red' is used, bit messy, but works (only on compiled script) - also managed to use a file in the working folder as a flag to check if the app is running already, again messy and not ideal, but its working.

endo64

[22:59](#msg573cf3cfae26c1967f9fcf0d)@justjenny You can use Red/System to check the instance of your application by using Win32 API (or similar APIs on other platforms), have a look here: http://blackhorus.bizhat.com/articles/MultipleIns.htm

Or the simplest alternative as advised in MSDN: `Alternatively, you can use a file for this purpose. To limit your application to one instance per user, create a locked file in the user's profile directory.` (https://msdn.microsoft.com/en-us/library/windows/desktop/ms682411.aspx)

## Thursday 19th May, 2016

rebolek

[08:56](#msg573d7faad487435d79284422)Why is the first text invisible?

```
red>> f1: make font! [size: 12 name: "Arial"]
red>> f2: make font! [size: 12 name: "Arial" style: 'bold]
red>> view [image 100x100 draw [pen black font f1 text 0x0 "One" font f2 text 0x20 "Two"]]
```

qtxie

[09:00](#msg573d80bf1effc6fe3f3fbc8d)Change `f1` to `f2` in the draw block, then it works. Seem there is a bug in font creation.

rebolek

[09:02](#msg573d813540f0f34870b3881c)@qtxie but I want non-bold font there ;)

[09:04](#msg573d818ed487435d7928442d)Or Verdana, this doesn’t show either (both non-bold and bold):

```
f1: make font! [size: 12 name: "Verdana"] view [image 100x100 draw [pen black font f1 text 0x0 "One"]]
```

qtxie

[09:05](#msg573d81dfd487435d79284432)Please open a ticket for it. :bug:

rebolek

[09:05](#msg573d81ecba3114e37335bda0)Will do right now.

[09:11](#msg573d835b1effc6fe3f3fbca0)@qtxie \[Done](https://github.com/red/red/issues/1916)

## Friday 20th May, 2016

rebolek

[05:04](#msg573e9aea93b62f482a79870f)Is there any plan for supporting local words in actors?

```
image 100x100 on-up [
    warning: "I will leak!"
]
```

dockimbel

[09:12](#msg573ed4fededd334a28d6f2c7)@rebolek Yes, we could, please open a wish for it.

## Sunday 22nd May, 2016

justjenny

[19:36](#msg57420a4dd3f431720bb2af0d)@endo64 thanks, will look a that.

## Tuesday 24th May, 2016

justjenny

[14:30](#msg57446590eed2f3f916a456ea)i found this site last night, lots of Red info. and apps .... www.mycode4fun.co.uk

## Wednesday 25th May, 2016

rebolek

[07:48](#msg574558c8c672a25a022eb7f9)Does anti-alias in DRAW work on fonts? I can’t see a difference.

dockimbel

[07:50](#msg5745595afce033da4befc8cc)No, `font/anti-alias?` controls it.

rebolek

[07:53](#msg574559df8d7585847f6d51fe)Hm, does it?

dockimbel

[07:54](#msg57455a4456ccfef516a0a0f1)Modulo Windows API bugs/issues, yes. ;-) Also, user settings might be involved there, I'm not sure if they would take precedence or not.

rebolek

[07:56](#msg57455aabfb784235548eebfa)Ok, I see :-)

[07:57](#msg57455aeef8b3bf5e1560ec08)But it’s not the same anti-aliasing as ClearType used in Win UI, is it?

dockimbel

[07:58](#msg57455b35fce033da4befc94e)It is.

rebolek

[08:01](#msg57455bf08d7585847f6d5218)\[!\[font.png](https://files.gitter.im/red/red/gui-branch/7Nhp/thumb/font.png)](https://files.gitter.im/red/red/gui-branch/7Nhp/font.png)

[08:02](#msg57455c14fb784235548eec0a)Both fonts should be "Segoe UI", 9pt, but Red’s version looks more bold.

dockimbel

[08:16](#msg57455f7256ccfef516a0a257)"Both"? You mean title font and filenames font?

rebolek

[08:16](#msg57455f798d7585847f6d522a)yes

dockimbel

[08:18](#msg57455fd8fce033da4befcad3)\[!\[blob](https://files.gitter.im/red/red/gui-branch/XskV/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/XskV/blob)

rebolek

[08:18](#msg57455feef8b3bf5e1560ec25)@dockimbel That is using DRAW?

dockimbel

[08:19](#msg57455ff4eed2f3f916a49adb)Looks fine here (Aero activated). Not Draw, let me try with it...

SoleSoul

[08:20](#msg57456052719c119b575bfbfe)@justjenny Thanks for the link. It lists two simple Red editors which are fun to play with.

dockimbel

[08:24](#msg57456132cd96cbcf4f707d82)@rebolek I can reproduce the excessive boldness using this code:

```
view [size 200x40 base 0.0.0.255 draw [font f text 5x5 "gui-console.exe"]]
```

rebolek

[08:24](#msg5745614a8d7585847f6d5239)@dockimbel should I open ticket for it?

dockimbel

[08:27](#msg574561e6eed2f3f916a49b78)Yes, though, it's really a GDI+ \[issue](http://stackoverflow.com/questions/5647322/gdi-font-rendering-especially-in-layered-windows), not sure we can workaround it when you use transparency (works fine with a background color though).

rebolek

[08:30](#msg57456293f8b3bf5e1560ec38)Ok, I'll open the ticket so it's tracked. I don't care about transparency much with this thing, if I can get default system color values.

dockimbel

[08:30](#msg574562b263e41bd84bf047d9)Without a transparent background color, it renders fine here.

pekr

[08:33](#msg5745636ecd96cbcf4f707e5e)Reading above link me thinks that MS engineers got it "a little bit" overengineered .... Not surprised, that seeind R2 AGG draw text effect for the first time caused a big wow effect ...

dockimbel

[08:34](#msg574563aa719c119b575bfd4d)@pekr I had many issues with text rendered by R2 AGG in the past, it's really far from perfection.

rebolek

[08:40](#msg5745650d8d7585847f6d5250)true

## Friday 27th May, 2016

bitbegin

[07:16](#msg5747f44610f0fed86f48a87c) var: 0 view \[button "b1" \[var: 1] button "b2" \[print var]]

[07:17](#msg5747f46eec10ddbb09db2e1f)first click b1, then click b2, it print "0". is this a bug?

qtxie

[07:37](#msg5747f9234a49504d6099e540)Nope. All set-word! in VID is local by default. Use this code to access the global various.

[07:37](#msg5747f932548104867b6820d4)

```
var: 0 view [button "b1" [var: 1][var] button "b2" [print var]]
```

dockimbel

[07:50](#msg5747fc54454cb2be094f6d04)@rebolek As you can see above, \*local by default* in actors can be very tricky too for newcomers... I'm not sure I did well by making that change... If the above code was wrapped in a context, the new actors construction rule would make them painful and unintuitive to work with... Others opinions are welcome.

bitbegin

[08:52](#msg57480ae7454cb2be094f70de)@qtxie ok, 3ks

xqlab

[08:54](#msg57480b4c80352f204df2a211)I would prefer, that set-words are not local by default.

Zamlox

[09:48](#msg574817d310f0fed86f48b316)I would prefer also not local by default. Would it be possible to make it configurable at runtime ? Perhaps a flag in 'system' object (with default value, of course... not local :) )

PeterWAWood

[10:39](#msg574823c910f0fed86f48b63e)@dockimbel I think the \*local by default* actors will confuse newcomers. It isn't difficult for those who want local by default to do it themselves:

[10:39](#msg574823e380352f204df2a909)

```
view
 [button "click" [do func[/local a b c][a: 1 b: 2 c: 3 print a + b + c]]]
```

[10:41](#msg57482461ec10ddbb09db3ba1)or even

```
view [button "click" [do function [][a: 1 b: 2 c: 3 print a + b + c]]]
```

[10:42](#msg5748249dda3f93da6f20d159)Perhaps you could provide some syntactic sugar to replace

```
do function []
```

?

dockimbel

[10:55](#msg574827a410f0fed86f48b750)@pekr Creating a new function on each click event is expensive, users shouldn't do that.

PeterWAWood

[10:56](#msg574827eff44fde236e50e516)@dockimbel Personally, I wouldn't do it. I'd simply call a function from the actor but some people seem to want to have their code directly visible in the actor.

## Saturday 28th May, 2016

pekr

[07:27](#msg574948456bbc2d1d4deef796)What about our old `use` function, to create a local context?

[07:28](#msg574948bb10f0fed86f48fe20)I don't like extra block to expose the var, if I understand what it is doing at all (late to the discussion) .... maybe unless such practice becomes common when e.g. modules are introduced

LambdaRispoli\_twitter

[11:33](#msg574981f280352f204df2f78b)What about the old but gold solution? An object supporting an event should have a "var" with a proper catchy name which points to a function or lambda expression

## Monday 30th May, 2016

iArnold

[09:25](#msg574c06ec10f0fed86f496a5a)

```
Red 
Red [needs: 'view]
i-am-clicked: function [face][print face/text]
View [btn1: button "Click me!" on-down [i-am-clicked face]]
```

But how can I get to the name "btn1"? Or how can I assign an ID to a face, I have many similar faces I want to know which one was clicked.

rebolek

[09:38](#msg574c0a06a0fc3091611b2057)@iArnold you know what face was clicked, it was `face`.

iArnold

[09:41](#msg574c0ab0ec10ddbb09dbed39)Yes but I have 32 different ones I want to know its number because I need that to pass on to a function.

[09:42](#msg574c0aef6bbc2d1d4def6184)The only thing that I now have is the offset of the button but that is ugly workaround.

Zamlox

[09:43](#msg574c0b45a78d5a256e39131d)@iArnold use

```
face!/data
```

for your purpose. Put an id inside which you will check it in your function, something like:

```
View [btn1: button "Click me!" data [1] on-down [i-am-clicked face]]
```

meijeru

[09:45](#msg574c0bceec10ddbb09dbed86)I agree with @Zamlox. "The" name does not exist, actually. In your example `btn1` is \*bound* to the face when view has been called, but (1) `btn1` may be bound to another value later, and (2) another word may be bound to the face at any time.

rebolek

[09:47](#msg574c0c49a0fc3091611b206a)@iArnold but you can pass the face object directly

meijeru

[09:48](#msg574c0c86f44fde236e519878)Another possibility, if they are all similar and only distinguished by number, use the index of the face in the pane. For that, you have to do a `find face/parent/pane face` though.

iArnold

[09:59](#msg574c0eeaec10ddbb09dbee70)Thnx for the options. Using /data like this is a nice one, I don't recall having seen this done before.

dockimbel

[10:05](#msg574c10616bbc2d1d4def6326)@iArnold See the `extra` field in \[face!](https://dockimbel.gitbooks.io/red/content/gui/View.html#face-object) object.

pekr

[10:44](#msg574c198d10f0fed86f496f88)Couldn't a referenced value be stored in some field, e.g. `name`? Well, but as it was already stated, there might be multiple vars referring to the same face?

dockimbel

[10:50](#msg574c1ae1454cb2be09502dcd)Keep in mind that all values are \*anonymous* in Redbol. We talk about the "name of a function" or "name of an object" as convenient shortcuts to "word which refers to a function/object". Strictly speaking, they don't have any name.

pekr

[10:54](#msg574c1bcaec10ddbb09dbf1b5)I do understand the distinction, so rephrasing - some users would find useful having a dialect word referring to the face stored with the face :-) `data`field might be sufficient, although some users might find it usel to be done automatically. Not sure how useful would it be, to have it "auto collected" ....

dockimbel

[10:57](#msg574c1cb1a78d5a256e3917e3)Please read the View documentation linked above, `data` facet is not a "free" field to be used in all face types, `extra` is (similar to `user-data` in R2/View). The thing to understand is that you \*don't* need that VID name, when you have the face object itself, which is always available in all events handlers.

pekr

[12:07](#msg574c2ce8a78d5a256e391cab)OK then. I do remember one sitation maybe, but only vaguely. It was something like form and gather/scatter methods and iterating over a referenced fields, which used some naming conventions in groups, dynamically generating fields, or something like that. That's why, if possible (and against nothing), it might be usefull to gather VID level widget references and put them into some `name`or other field. Not sure, how useful it is in general though and as you said - you might have several words referencing the same face in the end. Our usage scenarios might simply vary ...

[12:08](#msg574c2d3c6bbc2d1d4def6b10)Not sure if it is similar or not, but there might be some reason why functions like `collect`were found being useful as a concept :-)

rebolek

[12:09](#msg574c2d748fba4a053f1b04e7)@pekr I know what you mean with this dynamically generated forms, but you can store faces directly, you don’t need `name` for this, especially when it’s dynamically generated.

## Tuesday 31st May, 2016

rebolek

[04:14](#msg574d0fb7a0fc3091611b2683)@dockimbel There is no `scroller` AFAIK, is it planned?

dockimbel

[04:40](#msg574d15b98fba4a053f1b0a7d)@rebolek Of course, we might add it in the next release, along with a few other widgets.

rebolek

[06:42](#msg574d325c8fba4a053f1b0abd)great, thanks

## Wednesday 1st June, 2016

iArnold

[08:24](#msg574e9bcc6bbc2d1d4df01441)Noticed that when 'do of a script from gui-console the script does not fetch the icon from the header like it does in compiled version. Is it a bug? Just not supported?

qtxie

[08:32](#msg574e9da0a0fc3091611b2ef0)It is not supported yet.

endo64

[08:33](#msg574e9dbc80352f204df40bd3)Probably not supported, because icon file from the header is used during the compilation. It would be unnecessary to read the icon file (IO is not ready yet too) to use on window, and would be too much work to make it cross-platform I guess.  
But probably it wouldn't be difficult to write a R/S function like SetIcon using WinAPI.

iArnold

[08:38](#msg574e9f1680352f204df40c52)ok in Red 2.0 or 3.0 is good enough for me.

pekr

[08:40](#msg574e9f62454cb2be0950dc49)meh for icon in 2.0, yay for 0.7.0 :-)

iArnold

[08:44](#msg574ea063f44fde236e524ea5)I now see this issue as the GUI-Console has the Red icon. Any script started from the console gets a child window and uses the icon of the parent. Most of the time use interpreted for first testing stage, and later compile for definitive version.

rebolek

[09:33](#msg574eabdb548104867b683f37)@dockimbel can I have my custom dragging, or does on-drag always change face's offset?

dockimbel

[09:42](#msg574eadfbec10ddbb09dca4fc)@rebolek Which custom dragging? I plan to redesign the dragging system to solve some issues/limitations, though not sure when I'll be able to work on that.

rebolek

[09:43](#msg574eae4d4a49504d609a0569)@dockimbel let’s say I want to make a custom scroller, I can do it with on-down, on-up and on-over actors plus all-over flag, but using on-drag for this seems like a good fit to me. I want to drag just an inner area of my custom style.

[09:48](#msg574eaf574a49504d609a056e)I am influenced by R3-GUI here that used on-drag for exactly this.

dockimbel

[10:55](#msg574ebf116bbc2d1d4df01fbc)Some people have posted code in github tickets and on Gitter for doing that using the existing `on-drag` event. What you want is \*constrained dragging\*, which I plan to support in the next iteration of the dragging system.

iArnold

[10:55](#msg574ebf38f44fde236e5258bf)How would I go about getting the window size on a resize of the window?

```
w1: [
	t1: text "No size here!" react [t1/text: append copy "" w1/size]
	button "quit" [unview]
]

view/flags w1 [resize]
```

And there is no 'self either.

dockimbel

[10:59](#msg574ebffaa78d5a256e39d3bb)@iArnold `t1/text: append copy "" w1/size`... please no ... =&gt; `t1/text: form w1/size`

iArnold

[11:00](#msg574ec050ec10ddbb09dcaa84)Sorry, it is hard to `form` my head around `form`. Thanks for the tip.

dockimbel

[11:11](#msg574ec2e410f0fed86f4a2f39)I guess you just ignored my last advice about re-reading the Rebol/Core manual...

[11:12](#msg574ec30d80352f204df41791)Here's how to implement a handler for window's resizing events:

```
w1: [
    t1: text "No size here!"
]
win-actors: object [
	on-resizing: func [face event][
		t1/text: form face/size
	]
]
view/options/flags w1 [actors: win-actors] [resize]
```

iArnold

[11:13](#msg574ec34cda3f93da6f2248da)&gt; I guess you just ignored my last advice about re-reading the Rebol/Core manual...

I am at "D" now!

dockimbel

[11:14](#msg574ec387ec10ddbb09dcab6d)Good!

meijeru

[18:34](#msg574f2ac3da3f93da6f227381)

## Thursday 2nd June, 2016

rebolek

[05:05](#msg574fbe813b842359659b498a)`none` is invalid pen? It can be used in Rebol as no pen:

```
red>> view [image 100x100 draw [pen red fill-pen none box 10x10 90x90]]
*** Script error: invalid Draw dialect input at: [none box 10x10 90x90]
*** Where: ?
```

dockimbel

[05:10](#msg574fbfe03903ce83717afed0)@rebolek We used `off` instead of `none`, to be more consistent with other commands, though looking at it now, I'm not sure if that was the best option.

rebolek

[05:11](#msg574fc00170ab94ff27a96d0b)Hm, what about both?

[05:13](#msg574fc073286eebef035ae25f)Oh, that `off` is keyword, not a logic value.

dockimbel

[05:15](#msg574fc0ea286eebef035ae262)I don't think it is worth supporting both.

rebolek

[05:16](#msg574fc1443903ce83717afed9)Ok, I’m fine with `off` but it implies logic! value, so one can expect to be able to do things like:

```
red>> view compose/deep [image 100x100 draw [pen red fill-pen (off) box 10x10 90x90]]
*** Script error: invalid Draw dialect input at: [false box 10x10 90x90]
*** Where: ?
```

dockimbel

[05:19](#msg574fc1dd70ab94ff27a96d16)\*I’m fine with off but it implies logic! value* No it doesn't, we are in a Draw dialect context here, there are no such thing as logic! values or evaluation of words to logic! values, those are part of the main language, not Draw. Remember, words meaning and semantic rules are relative to their context in Redbol. So, the error you get there is perfectly valid. `off` and `none` are just words in Draw context, nothing else.

rebolek

[05:20](#msg574fc233286eebef035ae26b)I understand this, I just need to get used to it :) AFAIR, in R3 this was possible.

[05:22](#msg574fc28f70ab94ff27a96d1a)Actually you can do `pen red` which gets `red`’s value, so `red` is not just a word here.

dockimbel

[05:22](#msg574fc2aa3903ce83717afee0)I can understand why it was allowed in R3, as parametrizing `pen` or `fill-pen` argument is pretty common, so that evaluating an expression to a `tuple!`, `none!` or `false` would all be directly accepted.

rebolek

[05:23](#msg574fc2ba3903ce83717afee1)Exactly.

dockimbel

[05:24](#msg574fc2f93903ce83717afee2)Right, some Draw commands evaluate their word argument for convenience, but those are adhoc rules, not general rules of Draw dialect. I'm not against adopting the R3 way, as long as the impact on performances is not too high (evaluation is costly in an optimized interpreter like Draw).

rebolek

[05:28](#msg574fc4023b842359659b499b)But pen does evaluate tuple!s already, so adding logic! probably wouldn’t be so costy.

dockimbel

[05:29](#msg574fc42a70ab94ff27a96d1f)Right, in that case, it should be fine.

rebolek

[05:37](#msg574fc625a66904962ebbd19f)https://github.com/red/red/issues/1955

[06:31](#msg574fd2a751d28b6243b677eb)When making custom style, how do I define what data can be passed to it and what is the default actor?

dockimbel

[06:32](#msg574fd2f62482004e29f65bb0)You mean using `style`?

rebolek

[06:32](#msg574fd307a66904962ebbd1d4)Well `stylize` is not here yet, so yes ;)

dockimbel

[06:35](#msg574fd3cf67d168bb68609974)It doesn't provide a way to set a new VID behavior, though, I never gave it a try so far. It just clones the features of the prototype style you've used for it. Bear in mind that we haven't yet provided a way to create explicitly "custom widgets", `style`'s purpose is for now just limited to changing basic style options.

rebolek

[06:40](#msg574fd4eca66904962ebbd1e0)I want too much too fast ;)

pekr

[07:10](#msg574fdbf6da3f93da6f229d3b)@rebolek - I just observe your progress and soon enough expect a question asking for a sound support :-)

rebolek

[07:14](#msg574fdcd0a66904962ebbd203)@pekr not yet, I don’t need sound support for what I am working on. OTOH timer device... :D

pekr

[07:19](#msg574fddf8f44fde236e52ae7e)Timer device?

rebolek

[07:19](#msg574fde1567d168bb686099ad)you know, time event, animations, 1000 cows...

pekr

[07:23](#msg574fdf0ef44fde236e52aed5)ah, I thought so, it is just that the official time (timer) support should arrive 0.6.2?

[07:24](#msg574fdf1fec10ddbb09dcffd8)So you are making your own implementation in R/S?

rebolek

[07:25](#msg574fdf5551d28b6243b67829)No, I am not working on anything like this, I am happy to wait for 0.7.0. It’s just something I would like to see before sound support.

[07:33](#msg574fe16367d168bb686099c8)@dockimbel is there something like `on-show` event? I couldn’t find anything like it.

dockimbel

[07:34](#msg574fe19751d28b6243b6783f)Not yet. Though if you disable the auto-refreshing mode, you don't need it. ;-)

rebolek

[07:35](#msg574fe1c42482004e29f65c0b)@dockimbel well, I need it for custom style. How else should it know it’s time to redraw itself?

iArnold

[08:01](#msg574fe7e0f44fde236e52b178)@rebolek  
&gt; @pekr not yet, I don’t need sound support for what I am working on. OTOH timer device... :D

Together with a ticking sound and android support I can have my kid create a metronome app in Red for on the tablet.

[08:02](#msg574fe83180352f204df46d39)And time is 'perfect' for randomisation in games and small apps.

[08:32](#msg574fef02f44fde236e52b3d8)Select all (Ctrl+A) does not select all text in an area (that has focus). Make a new issue?

rebolek

[12:22](#msg575024f9a66904962ebbd39d)Custom widgets in Draw? Total fun!

[12:22](#msg575024faa66904962ebbd39e)http://i.imgur.com/O5RXMP8.gif

pekr

[12:22](#msg57502517454cb2be09515295)Looks impressive!

dockimbel

[12:22](#msg5750251bf44fde236e52c58a):clap:

rebolek

[12:23](#msg57502527a66904962ebbd3a0)Thanks, it’s just WIP :-)

qtxie

[22:31](#msg5750b3d410f0fed86f4ad2a5)Nice! :+1:

## Friday 3th June, 2016

iArnold

[09:29](#msg57514df3f44fde236e531a19)@dockimbel  
&gt; Let me ask a question to you guys: is the newly proposed reactive framework, which is a total novelty in Rebol world, giving you a modern and I think, very neat way to enjoy reactive programming in Red, so \*uninteresting* that the only topic about it is the naming of the wrapper object for this framework's code?

I have seen a lot of work in the branch but I don't know exactly what to expect of it. Like @pekr suggests it is obviously material for a blogpost.

[09:30](#msg57514e3e6bbc2d1d4df0de4b)Still too busy finding out about how things work in the master branch.

WiseGenius

[11:48](#msg57516e9151d28b6243b68165)@rebolek :+1:

iArnold

[20:09](#msg5751e3e4824488852c4eb6f4)@rebolek Super dude!!

[20:10](#msg5751e43a824488852c4eb710)By the way, we need sound support in Red! Need an awesome track while playing my Red sourced games on my Android tablet https://www.youtube.com/watch?v=fpWNimba344

justjenny

[23:04](#msg57520d003bdac7ae37b47a28)Been talking (by email) to Alan on www.mycode4fun.co.uk - A nice guy - he's really interested in Red gui level - I tried out his apps, all worked fine, quite impressed with his knowledge and what can be done with Red 6 gui - though his sound and music was a workaround, still very interesting.

## Saturday 4th June, 2016

iArnold

[06:04](#msg57526f6ee96484d0692f7e96)When I looked at his site only the .exe file were there, he obviously has chosen to keep source closed. His good right, yet a pity for missing out on the "how did he do that's".

## Tuesday 7th June, 2016

iArnold

[13:10](#msg5756c7cb45cf128e5f1d2c2f)Somehow this code does no longer work for me:

```
alert-message-text: make string! 200
alert-window: [
	title "Alert Box"
	alert-message: text alert-message-text
	return
	button "OK" [unview]
]
view [
	button "Open Alert Window" [
		alert-message-text: "Why am I not visible?"
		view/flags alert-window ['modal 'popup]
	]
]
```

What am I doing wrong here?

[13:22](#msg5756caa2b5122bc217783e55)Strange,

```
clear alert-message-text
append alert-message-text "Blablabla"
```

now does the "trick".

rebolek

[13:23](#msg5756cadd07e77197794ff7a1)@iArnold words in actors are now local, therefore `alert-message-text` can’t be accessed from outside, unless you declare it as global in separate block!.

Zamlox

[13:23](#msg5756cae1662b042b7e59271e)@iArnold there was a change related to define automatically words as local inside actors, thus

```
alert-message-text
```

inside button actor is local not global. If you want to refer to your global word, try this:

```
alert-message-text: make string! 200
alert-window: [
    title "Alert Box"
    alert-message: text alert-message-text
    return
    button "OK" [unview]
]
view [
    button "Open Alert Window" [
        system/words/alert-message-text: "Why am I not visible?"
        view/flags alert-window ['modal 'popup]
    ]
]
```

iArnold

[13:40](#msg5756ced1c2a6e42f7e991d8a)@Zamlox @rebolek thank you. I had seen some discussion about this somewhere, but this is where it bytes me ;-)

[13:41](#msg5756cf17970521a45839ae86)That is why I created a function fill-alert-message that I call now solving the problem.

## Wednesday 8th June, 2016

xqlab

[09:37](#msg5757e75a970521a45839ff34)Was there not a discussion about a keyword extern?

dockimbel

[09:49](#msg5757ea12c2a6e42f7e9971f2)@xqlab Not about `extern` as keyword, but handling external words in a second block, see :point\_up: \[May 27, 2016 3:37 PM](https://gitter.im/red/red/gui-branch?at=5747f9234a49504d6099e540)

xqlab

[10:32](#msg5757f42f92fc7c915f57dc05)Ah, yes

## Sunday 12nd June, 2016

dockimbel

[07:52](#msg575d14d96092456f66335391)So, about "local by default" for VID event handlers, I am thinking of reverting it to previous behavior as it's really painful for beginners to write simple script and even for old timers, having to specify the externals in a second block does not look good. It is always possible to bind statically or dynamically your VID words to a context when needed.

[07:53](#msg575d14fa064b9e7266f1b9d2)Anyone have arguments against that change?

iArnold

[08:32](#msg575d1e38814a568071424165)Not me. I will be very happy again. For relative small programs it is overkill to write functions to change variables that are to be handled by more than one control. If someone wants to make a larger and "more robust" application it may make more sense to handle those things within contexts and functions. In such case that approach will keep VID blocks more clean. Perhaps it is possible to get a compilerdirective to switch between behaviours with "global" as default. (It might be a totally other question if VID is the right choice for larger applications, but afaict it can stretch a long way before that point will be reached).

pekr

[09:41](#msg575d2e3297e1b2d245e204c8)I agree with the reversion too ...

iArnold

[09:47](#msg575d2fa11cf76dd645365e4e)It was worth trying out imo because there were things to say in favor of the change. Now it has become clear where that choice lies the burden. (not sure how to put that in English).

## Monday 13th June, 2016

endo64

[08:24](#msg575e6dd66092456f663390fa)I wasn't happy for "local by default".  
What do you think about adding a VID word something similar to `funct` in Rebol to make all the set words local:

```
view [
    button "Test" localize [
		every: set word: is local: now
    ]
]
```

dockimbel

[08:26](#msg575e6e331cf76dd64536996a)I don't think it's necessary as you can easily wrap your VID code in a context or bind it at runtime to a local context:

```
context [
    every: word: local: none

    view [
        button "Test" [every: 'set word: 'is local: 'now]
    ]
]
```

pekr

[08:27](#msg575e6e576092456f66339131)Do you want them all local?

[08:28](#msg575e6ec92eaa837d71e8f097)What about the equivalent to `use`?

```
view [
    button "Test" use [local][
        global: 5
        local: 10
    ]
]
```

endo64

[08:33](#msg575e6fc0064b9e7266f1f87a)This is same as:

```
view [
    button "Test" [
		use [local] [
			global: 5
			local: 10
		]
    ]
]
```

dockimbel

[08:33](#msg575e6fcd6092456f663391c3)The point of VID is also to make the event handlers definition shorter/simpler, putting back function concept and verbose construction is defeating that purpose. If you want explicit control over the function construction, construct it manually:

```
view [
   b: button "Test"
   do [b/actors: context [on-click: func [face event /local loc][global: 5 loc: 10]]
]
```

endo64

[08:34](#msg575e701aa1be01c01a7961c9)I think you are right. Just reverting "local as default" is enough. We have a bunch of other options for local/global words.

rebolek

[13:55](#msg575ebb5776109d1f0af53554)&gt; I don't think it's necessary as you can easily wrap your VID code in a context or bind it at runtime to a local context:

I don’t think it can be described as "easy", because you need to list all local words.

## Wednesday 15th June, 2016

Phryxe

[07:29](#msg576103dbda1c26b045362d26)Can I set which parent a child face belongs to from the child?

pekr

[07:30](#msg57610421f191398330a09c6f)hmm, what about trying to change face/parent reference?

SteeveGit

[07:31](#msg5761044d91cdd6673163f1d4)The parent is automaticly set when you insert/remove a face in another face/pane

[07:31](#msg5761046809a91a8d73d6d884)You should not touch it yoursself

Phryxe

[07:32](#msg5761049c63ea0987306af718)OK, so the answer is no. Thnx.

pekr

[07:33](#msg576104d2f191398330a09cac)What would happen, if you would manually modified the `parent`field?

SteeveGit

[07:33](#msg576104d6ea84f717479b8ddc)I don't see the point, anyway.

[07:34](#msg576104f991cdd6673163f1d6)you can test it, but the GUI may not like it

[07:37](#msg576105bdea84f717479b8de3)if you need to reference another face for special computations, just use another facet

rebolek

[12:45](#msg57614dd591cdd6673163f3cc)&gt; I don't see the point, anyway.

Drag and drop?

SteeveGit

[13:17](#msg5761554c91cdd6673163f449)&gt; Drag and drop?

We can already do it the regular way. When I said "I don't get it", I meant: I don't get the need to introduce another method to code it.

dockimbel

[14:12](#msg5761623091cdd6673163f4f5)@Phryxe  
&gt; Can I set which parent a child face belongs to from the child?

Yes, you just need to move the child face from the parent's pane list to another pane list using the `move` action. Here's an example:

```
view [
	group-box [
		button "Move" [move find face/parent/pane face b/pane]
	]
	b: group-box 100x100 []
]
```

Phryxe

[14:17](#msg5761637af191398330a0c2ea)@dockimbel Thank you!

dockimbel

[14:26](#msg576165966111a28c047b7915)Setting the parent directly could be allowed in the future, though, it does not work right now.

## Monday 20th June, 2016

iArnold

[08:15](#msg5767a61cfeaf6cd222ad2fc0)Can the code at https://github.com/red/red/wiki/Draw-dialect#graphics-source-code be modified in such a way that it is possible to make a drawing on a transparent background?

Phryxe

[14:13](#msg5767fa18bd67400679db4441)I tried to run draw-graphics.red from GitBook, but Red crashes.

dockimbel

[14:18](#msg5767fb312309a7ec164c28ed)@Phryxe Which version of Red do you use? Let me try with latest build...

Phryxe

[14:18](#msg5767fb4bfeaf6cd222ad5046)red-20jun16-250e598.exe

dockimbel

[14:20](#msg5767fba08d8d1cd959da5fac)I just copy/pasted the source code in the console, and it runs fine. Did you compile it? Wait...I used the wrong version of the source code...

Phryxe

[14:21](#msg5767fbf36577f032450cdb67)@dockimbel Pasted it in console and also tried saving and running as a file.

[14:24](#msg5767fc8e3881bc405b6f1a62)@dockimbel I didn't compile it ...

dockimbel

[14:32](#msg5767fe7eebb74a972351ba8b)I just downloaded the same version, launched it, and in the console pasted \[this code](https://dockimbel.gitbooks.io/red/content/gui/Draw.html) and it ran fine. Which Windows version do you have?

Phryxe

[14:36](#msg5767ff5cfeaf6cd222ad528a)@dockimbel Win 7 x64

dockimbel

[14:36](#msg5767ff818d8d1cd959da5fe5)Same here...

[14:37](#msg5767ffb2233bc24f5cb1c27c)We really need to add crashing traps for Red GUI apps...

[14:38](#msg5767fff12309a7ec164c2927)@Phryxe Just in case, try to delete all the files from C:\\ProgramData\\Red\\ folder and launch Red again.

Phryxe

[14:54](#msg576803a6a82a6b0079a75aa2)@dockimbel I found the reason. One needs to run Red as an administrator. Should have thought of that ...

dockimbel

[14:57](#msg576804708d8d1cd959da6011)It shouldn't require admin rights, though I don't think we ever tested it with a restricted account... @PeterWAWood Could you give it a try when you'll have some spare time?

Phryxe

[15:05](#msg576806563881bc405b6f1f6d)@dockimbel Maybe it matters what directory you put Red executable ... My is in C:\\Program Files (x86)\\Red

[15:06](#msg5768067afeaf6cd222ad560f)As this code saves the images to that directory.

dockimbel

[15:41](#msg57680eb7ebb74a972351bb38)@Phryxe C:\\Program Files (x86)\\ is a read-only folder by default (unless you have admin rights).

Phryxe

[16:20](#msg576817e8bd67400679db536c)@dockimbel Not sure exactly how this works. I use an admin account, but one still needs to explicably tell Windows that you are using admin rights when putting files in that dir. I'll move Red executable. That is easier.

## Friday 24th June, 2016

Phryxe

[10:04](#msg576d05ba5ba3ccaa25b7d9a0)Regarding animation. Is there a minimal example? I have tried some draw commands and it works fine, but I don't get how animation works. I see the bubbles example, but that doesn't even use the view word. Can I put other code than draw commands inside a draw block!? About the algorithm I would think you draw on a "canvas", clear it, wait a bit, draw again etc. How do you define waiting time? I don't think there are any wait word. I hope someone other than Doc can answer. He has better things to do than answer my silly questions ;^p

iArnold

[10:08](#msg576d06896c39b9656960b4bb)https://gist.github.com/iArnold/9189f6d7f9614d35ec526b4b5d9df25a and Doc's bouncing ball example:  
;needs Red 0.6.1  
view [  
size 250x200  
ball: base 20x20 draw \[pen blue fill-pen blue circle 10x10 9] rate 50 on-time [  
face/offset: face/offset + (face/extra * 3x3)  
if face/offset/x + face/size/x &gt; face/parent/size/x \[face/extra/x: -1]  
if face/offset/y + face/size/y &gt; face/parent/size/y \[face/extra/y: -1]  
if face/offset/x &lt; 0 \[face/extra/x: 1]  
if face/offset/y &lt; 0 \[face/extra/y: 1]  
]  
do \[ball/extra: 1x-1 ball/color: none]  
]

Phryxe

[10:17](#msg576d08ac5ba3ccaa25b7daba)@iArnold Thanks. I'll examine these.

## Saturday 25th June, 2016

Phryxe

[11:31](#msg576e6b968c9263ba30e4162f)What is a face's extra? Has it something to do with child facets?

dockimbel

[11:32](#msg576e6bdaa0c12d110f77e6a5)@Phryxe Did you look into the Red/View doc?

Phryxe

[11:42](#msg576e6e2b265214c130572c1a)@dockimbel Ehh, no I just saw extra in VID docs. Sorry ...

dockimbel

[11:50](#msg576e6ff4bb1de91c545f0555)@Phryxe No problem. VID is just exposing features which are usually available in View already.

## Tuesday 28th June, 2016

Phryxe

[13:10](#msg577277528441a8124d7325fb)Is it OK to set and get draw `text` and `line` coordinates etc with path like `line/2` or `line/3/y`?

[13:10](#msg5772775fbb1de91c5491dc9b)http://images.crex.se/red/x9.gif

dockimbel

[14:41](#msg57728c822fd8c5da2853295e)@Phryxe Not sure what you mean...could you show me a code example? Your connected boxes look cool! ;-)

[14:56](#msg57729027959100c762f1068d)@Phryxe I'm curious about the code you used for your connected boxes, don't you mind sharing the code (on a gist for example)?

Phryxe

[16:49](#msg5772aab4bb1de91c5495673d)@dockimbel Don't have the code here. I'll check tomorrow. The connection is just a line drawn between the boxes.

## Wednesday 29th June, 2016

Phryxe

[06:44](#msg57736e648c9263ba30257b88)https://gist.github.com/Phryxe/573771ce69ccea553b859e692761a718

dockimbel

[06:47](#msg57736f020898e10d2395780f)@Phryxe Thanks!

rebolek

[08:19](#msg5773847f0898e10d23957d96)@pekr http://i.imgur.com/YB3g0yy.gif

Phryxe

[08:21](#msg577384f9971717155482f38f)@rebolek Wow. Cool :smile:

rebolek

[08:22](#msg57738554bff9f48f6a75c6cd)@Phryxe thanks :) It’s an old demo for R2/AGG that I rewrote for Red/View to test animations :)

dockimbel

[08:25](#msg57738606f52768dc0cae4936)@rebolek Very cool! :)

rebolek

[08:27](#msg5773865f0898e10d23957dc1)@dockimbel Thanks :)

Zamlox

[09:39](#msg57739768265214c1309a8540)@rebolek nice animation demo.

rebolek

[10:55](#msg5773a907bff9f48f6a75d899)@Zamlox Thanks! BTW, if you wonder why the cows are blue, it’s not because I’m colorblind, but IIRC there was some bug in some old version of Rebol that messed up colors and I’ve lost original PNGs since and have only this version now :)

pekr

[11:04](#msg5773ab2b1ac8bd1a4d8f04b2)@rebolek - oh, so old good 1000cows demo, thanks for that! :-)

Zamlox

[11:05](#msg5773ab71971717155484ce51)@rebolek :)

pekr

[11:05](#msg5773ab971ac8bd1a4d8f07c1)was there any fps measurement with Rebol versions? Maybe I confused it with some other old demos. Just curious

rebolek

[11:16](#msg5773ae14fd8a28fd3d380cac)@pekr yes, there was. It’s not implemented in Red version yet. Also it uses one face per cow and has serious problems to render all 1000 of them. I have to try to write it using draw to see the difference.

pekr

[11:18](#msg5773ae828c9263ba3028e3e4)was it using gobs for R3 version?

rebolek

[11:18](#msg5773ae940898e10d23958ae4)Yes.

[11:18](#msg5773aea00898e10d23958ae6)It was really fast with gobs.

pekr

[11:27](#msg5773b08d1ac8bd1a4d8f408d)Can't find old R3 version it runs with ...

rebolek

[11:27](#msg5773b0b3f52768dc0cae58c1)Hm, I’m not sure which one was it...

## Thursday 30th June, 2016

Zamlox

[21:34](#msg5775907f8c9263ba304492f7)can transparency be improved ? Following code executes in about 660ms:

```
view-block: copy []
i: 0 j: 0 max-count: 15
repeat i max-count [ 
	repeat j max-count [
		append view-block [ base 40x40 0.0.0.255 draw [circle 20x20 19] ]
	]
	append view-block 'return
]
view layout/tight append [ across ] view-block
```

Without transparency executes in about 30ms.

## Friday 1st July, 2016

dockimbel

[04:40](#msg5775f442f58c9dea732b5bed)@Zamlox Transparency is an expensive feature, in order to speed it up, we could ask the GPU for help by having an additional DirectX/OpenGL backend (which we plan to have before 1.0). In the meantime, if you have a very high number of shapes to draw, you should rather use a single face, and manage events manually (calculating the shape which gets the mouse event from the face's event information).

[04:43](#msg5775f4de186ccb5345031b26)If that's an option, you could also try drawing on the window face directly (not using any `base` face), by setting the `face/draw` manually for the window (not using VID).

[04:46](#msg5775f5933da1a2ce671d047c)@Zamlox BTW, which Windows version do you use? It is expected that the performances for pre-8.0 and post-8.0 versions to differ significantly as they rely on different engines for handling transparency between faces.

Zamlox

[06:03](#msg577607a6265214c130bba354)@dockimbel thanks for explanation. Actually I don't necessarily need to draw so many faces, but I wanted to know the limitation of displaying many faces using transparency. I try to develop a DSL to create custom widgets using draw dialect, and after finishing first phase I thought to give a try by doing a performance test.

[06:03](#msg577607b39717171554a58f71)I'm using Windows 7.

dockimbel

[07:07](#msg57761698186ccb5345032497)@Zamlox You should get much better performances on Windows 8+ when face transparency is used.

greggirwin

[14:03](#msg577678452abfd64a13b38465)And if you look at the vector-balls demo, it's all done with `draw`. I was going to use faces, like the original, but this was easier and performs very well. I'm excited to see what people do as they push it. Drawing directly on base faces to make new widgets is a great test though.

Zamlox

[15:16](#msg5776896215b5519062d35935)vector-balls demo is great but transparency of balls are achieved by image itself (transparency related data included in 'ball-img'). Using one face to draw everything in it is the best way to achieve good performance but it requires extra effort for implementation.

dockimbel

[15:19](#msg577689eae973744150b41b6f)Agreed, we can improve it greatly. We also need to improve the image for vector balls, as they look a bit ugly now. ;-) I wonder if we could make nice ones using just Draw and color gradients?

Zamlox

[15:24](#msg57768b391dceb237315333d5)I think the best way to do it would be to create images in a graphic tool which supports exporting to SVG and having a Red library to import into draw dialect.

dockimbel

[15:25](#msg57768b625c313d7521cc4121)We are aiming at SVG feature-compatibility with Draw, though, we are still missing some parts, like paths support.

Zamlox

[15:30](#msg57768cb22abfd64a13b4a867)I was thinking to look into SVG specification and start doing something in this direction, but if it is planned to be done maybe I can wait (or maybe not :) )

dockimbel

[15:31](#msg57768cd5e973744150b41d17)If you want to start a SVG to Draw compiler, please be my guest. ;-) Though, without "path" support, I'm not sure you can go very far... but it might be a good way to measure the gap we need to fill for a good compatibility.

Zamlox

[15:32](#msg57768d0f6f0bccf22fb3b945)at least reading the SVG file and exposing needed data for draw dialect. I will try to look into specification.

[15:34](#msg57768d72ae36df8862f0dfb0)I don't have much knowledge about SVG structure, so I guess it will take some time to understand it.

dockimbel

[15:35](#msg57768dab07988cdb6d3579b5)It's pretty straightfoward, it uses a simple XML schema. So, first task would be to write a simple XML parser. ;-)

Zamlox

[15:36](#msg57768e02ae36df8862f0ee8c)right ;)

[15:37](#msg57768e2b2abfd64a13b4b88b)actually I have been using some rebol XML parser for a previous project, maybe I can reuse it by rewriting it in Red.

dockimbel

[15:37](#msg57768e505c313d7521cc41ac)You probably can improve it by using the extra Parse features in Red, like COLLECT/KEEP couple.

Zamlox

[15:38](#msg57768e5b2abfd64a13b4be22)yes, indeed.

SteeveGit

[15:38](#msg57768e8c5c313d7521cc41b1)I have a script somewhere, in R2. It worked at a time. Not sure now. And I wouldn't code it like that anymore. If someone is interesetd to look at it...

[15:39](#msg57768e95e973744150b41d68)anout SVG

Zamlox

[15:39](#msg57768eb6739e06eb2f419c9d)well, I would like to have a look on it.

SteeveGit

[15:39](#msg57768ec8e973744150b41d6c)Ok, wait a minute...

[15:45](#msg57768ffc5c313d7521cc4216)https://gist.github.com/SteeveGit/67186225b5f69dbd08b1dcaa756680d4#file-svg-r

[15:45](#msg577690175c313d7521cc4221)Enjoy

Zamlox

[15:45](#msg577690212abfd64a13b4dda6)thanks ;)

dockimbel

[15:45](#msg5776902707988cdb6d357c5c)@SteeveGit Great!

Zamlox

[15:49](#msg577691057b0ff7223148155f)@SteeveGit can you share also 'lizard.svg' file ?

dockimbel

[15:50](#msg5776913807988cdb6d357c79)I guess it's https://upload.wikimedia.org/wikipedia/commons/e/e4/Lizards.svg

SteeveGit

[15:53](#msg577691f1dee873b26e6c0890)No it's a colored one

dockimbel

[15:54](#msg57769226dee873b26e6c08a0)http://clipartist.net/openclipart.org/2013/May/May2013/Lizard.svg ?

SteeveGit

[15:54](#msg5776924a07988cdb6d357c9f)And seeing thru my code, it's I mixed up with R3 code. There's event a Red related comment because I touched this code in december. I should ftch the original one instead.

dockimbel

[15:54](#msg5776924ddee873b26e6c08a6)There are actually many on google images ;)

SteeveGit

[15:55](#msg57769278dee873b26e6c08aa)The original picture was the right one, with colors

[15:55](#msg5776927ddee873b26e6c08ac)wait a minute

Zamlox

[15:55](#msg5776927f6ba19c46139cf75d)I tried both images in R2 and I keep receiving some errors.

SteeveGit

[15:56](#msg577692ba07988cdb6d357cca)Zamlox,, I probably posted a corrupted (modified) version wait a minute or 2 ...

Zamlox

[15:56](#msg577692c415b5519062d40eef)all right

SteeveGit

[15:59](#msg57769347dee873b26e6c0965)\[!\[lizard.svg](https://files.gitter.im/red/red/gui-branch/eWKw/thumb/lizard.jpg)](https://files.gitter.im/red/red/gui-branch/eWKw/lizard.svg)

Zamlox

[16:00](#msg577693a37b0ff7223148419b)I will try to use latest version of SVG specification: https://svgwg.org/svg2-draft/

SteeveGit

[16:05](#msg577694dedee873b26e6c099c)This version should work better. But Remember I didn't test it since eons.  
\[svg2](https://gist.github.com/SteeveGit/2261be3a433d7ea121524d14dcb55b00#file-svg2-r)

Zamlox

[16:06](#msg577694eeae36df8862f18437)ok, thanks.

dockimbel

[16:07](#msg577695505c313d7521cc481e)@DideC I've improved the reactive engine to not rely on deep recursion anymore, so you can now enjoy \[longer worms](https://gist.github.com/dockimbel/7d12a580c23d2616eca52d4c5751ee67). ;-)

SteeveGit

[16:07](#msg57769555e973744150b42286)Note that it's an R3 version

[16:09](#msg5776959c07988cdb6d35807c)@Zamlox It used an old R3 version. It should not work anymore with draw since it's evolved.

dockimbel

[16:09](#msg577695ac5c313d7521cc4825)Though, we found some refreshing issues when moving dozens of faces with no-transparency on Windows XP/7. It is showing up in the Towers of Hanoi demo too. We'll work on solving that in the next days.

Zamlox

[16:09](#msg577695d52abfd64a13b5504f)@SteeveGit ok.

[16:10](#msg577695f1ae36df8862f19ec3)@dockimbel I have noticed also some glitches in the animation when I tried on Win7

dockimbel

[16:11](#msg57769621dee873b26e6c09ea)@Zamlox You mean in the Tower of Hanoi demo?

Zamlox

[16:11](#msg5776962d6ba19c46139d3b7d)@dockimbel yes

greggirwin

[16:31](#msg57769af66f0bccf22fb4c864)Big worm doesn't crash, but doesn't move all faces for me. 8.5 rows sit unmoving.

[16:33](#msg57769b64739e06eb2f42677d)Same when compiled, but the faces move much faster. Fantastic stuff.

dockimbel

[16:35](#msg57769bcedee873b26e6c0b0f)@greggirwin You need the latest commit for running it properly.

greggirwin

[16:36](#msg57769c0c1dceb237315473b2)Darn, thought I had. Will try again.

[16:42](#msg57769d912abfd64a13b5bd89)OK, it does work now, though too many balls for my system I guess. They all end up clustered in the center, and I had to move the mouse continuously for about a minute before the last one finally moved from its original position.

[16:43](#msg57769dba2abfd64a13b5c031)I have a low power workstation card. Good for multiple monitors, but not high performance.

## Saturday 2nd July, 2016

planetsizecpu

[10:37](#msg5777997601d3c8d879137d88)@dockimbel Good job, you still on the way, so, much encouragement!

dockimbel

[10:50](#msg57779c61bdf63af92ddb4a2d)@planetsizecpu Thank you! ;-)

SteeveGit

[11:06](#msg5777a02f725023b5032b5f99)@dockimbel : I saw your twit about #appveyor. Genuine question: What are the expected benefits ?

dockimbel

[11:19](#msg5777a350cdab7a1f4fc937f6)@SteeveGit Inform Red users that the latest automated build is broken.

SteeveGit

[11:21](#msg5777a3b1507e526a571289ff)The badge thing in the readme file ?

dockimbel

[11:21](#msg5777a3c5bdf63af92ddb8dca)Yes, and we are adding it to the download page also.

SteeveGit

[11:26](#msg5777a4fc5522bb3636d61e3f)Would be good to have a 'howto' about installing tests suites and auto compilation ? For Red related repositories in Github.

dockimbel

[11:28](#msg5777a5456a8f789e4a0440fe)Auto-compilation? You mean our batch scripts on our server?

SteeveGit

[11:29](#msg5777a58574aad35853834c73)Yes but applied to any kind of Red's user project. I mean, we also need to pass the red compilation process.

dockimbel

[11:29](#msg5777a5a601d3c8d87913fa5a)If you want to use TravicCI and Appveyor, you need to have a server online. I don't see what advantages you would get from that, instead of running it locally?

SteeveGit

[11:30](#msg5777a5e35522bb3636d61e62)It seems Appveyor can rebuild any Github project following their guidelines, or Am I wrong?

dockimbel

[11:31](#msg5777a61ecdab7a1f4fc95a6a)Oh, sorry, you're right, you don't need a server for that.

[11:33](#msg5777a67935bfead3795f3d0d)You can just adapt the \[travis](https://github.com/red/red/blob/master/.travis.yml) config file we use. For Appveyor, it has its own admin UI online.

SteeveGit

[11:34](#msg5777a6ac725023b5032b6063)Ok, I will look at it when it's time to publish some work on Github.

## Tuesday 5th July, 2016

Phryxe

[13:01](#msg577bafb164638562097ffd58)Tried `style`(template) to make several `circle`s, but it doesn't seem to work with `rate` or maybe I have to initialize `extra` in some other way!? I get error `Script Error: * does not allow none! for its value1 argument`. I used Doc's bouncing ball code.

SteeveGit

[13:25](#msg577bb547f7be913a1499d038)@Phryxe It's hard to see your code from here :-) You can use Gist to store samples and let us inspect your code.

Phryxe

[13:32](#msg577bb6d2f06cda5d098f41e9)https://gist.github.com/Phryxe/3e0c6862f975f7d028401e4ec49d662f

SteeveGit

[13:44](#msg577bb9a8f7be913a1499d391)&gt;view [  
title "Style Test"  
size 400x400  
style ball: base 30x30 ~~transparent~~ \*\*extra 1x-1\** draw \[fill-pen blue circle 15x15 14] rate 50 on-time [  
probe face/offset: face/offset + (face/extra * 5x5)  
if face/offset/x + face/size/x &gt; face/parent/size/x \[face/extra/x: -1]  
if face/offset/y + face/size/y &gt; face/parent/size/y \[face/extra/y: -1]  
if face/offset/x &lt; 0 \[face/extra/x: 1]  
if face/offset/y &lt; 0 \[face/extra/y: 1]  
]  
~~do \[ball/extra: 1x-1]~~  
ball ball ball ball ball  
]

[13:52](#msg577bbb8cd7b231c9740ee4a0)As a side note, We miss a `sandbox` thread where people can post code experimentations and ask for help from fellow red users.

dockimbel

[13:55](#msg577bbc664bee5c57092ef84d)@SteeveGit Maybe a good option, yes. @greggirwin @PeterWAWood What do you think?

Phryxe

[13:58](#msg577bbd004fd3816109a2064e)@SteeveGit Ahh, thanks, there it was :smile:

[14:27](#msg577bc3eeef3990705bb61fe0)Should I be able to initilize `offset` the same way as `extra`?

SteeveGit

[14:28](#msg577bc426f7be913a1499dd34)Try it ;-)

Phryxe

[14:29](#msg577bc44069ed53d814376055)I did and it didn't work :worried:

[14:32](#msg577bc4f04fd3816109a297b7)I also tried `at`and `origin`...

SteeveGit

[14:35](#msg577bc5a155f03c8220f5b7c6)

[14:38](#msg577bc656f46e87ec4b49f4e6)`at`should work

Phryxe

[16:14](#msg577bdcf5ddcdcee623efcdd0)I couldn't get it to work, but never mind. It's not important, I'm just trying things out.

greggirwin

[16:39](#msg577be2c74e50bf894a1ad4d6)Sandbox is probably a good idea. I don't know how it will be managing more groups in gitter as it grows. I have trouble tracking chat already sometimes.

PeterWAWood

[22:12](#msg577c30b151724d8078bd439f)@dockimbel I think that having a sandbox thread is a good idea.

## Wednesday 6th July, 2016

Zamlox

[22:57](#msg577d8cce064f828707c9d494)\[!\[blob](https://files.gitter.im/red/red/gui-branch/a1G8/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/a1G8/blob)

[22:57](#msg577d8cd4b79455146f4fbb32)SVG using Red ? Doable:

## Thursday 7th July, 2016

greggirwin

[00:39](#msg577da4b3064f828707caf220)Nice!

SteeveGit

[05:34](#msg577de9e35d23d99214e8cde5)Good work @Zamlox

Phryxe

[05:55](#msg577deebc3eaf66535e358df7)Did you trace a bitmap image to create vector image?

SteeveGit

[06:09](#msg577df2115d23d99214e8ce53)@Phryxe No, the lizard is an already vectorized SVG image

[06:10](#msg577df26882c4eef4025a9804)What Zamlox is doing, is converting SVG xml format to draw commands

Zamlox

[06:11](#msg577df27ee84c8f002785d0ea)@greggirwin @SteeveGit thanks.

[06:11](#msg577df2a8c9b49c1d6fc34f66)yes, that's correct. I take an SVG formatted file and I try to translate it into draw dialect commands.

[06:13](#msg577df31a59cfbd4c5e36d9dd)I took only one path from that file and I translated to lines and curves and it worked. More work is required to fully support SVG format.

pekr

[06:15](#msg577df396064f828707cec843)I expect some Shape Draw subdialect to appear, as with R2/R3. Would allow to cover e.g. a Tiger demo.

## Sunday 10th July, 2016

iceflow19

[04:33](#msg5781d022bdafd19107500b6a)\[!\[blob](https://files.gitter.im/red/red/gui-branch/879l/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/879l/blob)

[04:33](#msg5781d02a59cfbd4c5e649d95)I've been working on a small snippet of view code, but I've ran into a bit of a snag with it. Any suggestions on how to fix this issue?

[04:34](#msg5781d0391ca34a944edade4a)Here's the gist: https://gist.github.com/iceflow19/10c428ef10350e08f82516f3a432cefc

dockimbel

[05:09](#msg5781d890c9b49c1d6ff0ad01)@Zamlox Congrats, very exciting to see the beginning of a SVG loader! ;-) BTW, do still have a compiler issue with \[this code](https://github.com/Zamlox/red-tools/tree/master/xml)?

Zamlox

[05:12](#msg5781d952064f828707fcbf82)@dockimbel thanks. I have refactored XML parser (smaler, faster) and I don't have compiler issues anymore. I haven't tested the original version of XML parser with latest automated build. I will try to do it sometime. For now, I'm happy that current version works ok.

qtxie

[05:14](#msg5781d99a1ca34a944edb3418)@iceflow19 You need to change the xarea's size too.

dockimbel

[05:14](#msg5781d9c8c9b49c1d6ff0b60d)@qtxie I think he does it with `p/pane/1/size: ...`.

iceflow19

[05:17](#msg5781da597aeb08052795be9c)

dockimbel

[05:18](#msg5781da933eaf66535e631155)@iceflow19 Right! I need more caffeine.

iceflow19

[05:18](#msg5781da957aeb08052795bedb)This line to be precise: p/size: p/pane/1/size + 15x15

[05:19](#msg5781dac93eaf66535e6311cc)@dockimbel We all need more caffeine! It's 1:18AM where I'm at ;)

dockimbel

[05:19](#msg5781dad37aeb08052795bf25)@iceflow19 If you comment the second `xarea 100x100` instance, it seems to work fine.

[05:21](#msg5781db513eaf66535e631273)Also you can reduce the `on-over` handler to just:

```
on-over [face/pane/2/visible?: not event/away?]
```

iceflow19

[05:21](#msg5781db75bdafd19107506c43)@dockimbel What I was trying to do was make a reusable component via style, so the intent is to have two xarea's

dockimbel

[05:22](#msg5781db93064f828707fcd26d)I think that `style` is not powerful enough yet to handle a panel template...It is missing a way to properly instanciate nested faces. Does anyone remember if Rebol's `style` could handle that?

iceflow19

[05:32](#msg5781dddd1ca34a944edb56fc)Another question I have is... How are actors handled with styles? My suspicion is that all new instances share the originals \*actual* actors?? Hence when over the malformed xarea, the on-over is being fired on the first.

dockimbel

[05:38](#msg5781df6b7aeb08052795de3d)@iceflow19 Yes, they are shared by default, that's why `style` needs to be improved.

iceflow19

[05:48](#msg5781e1c9064f828707fd0b23)@dockimbel Thanks for the help!

SteeveGit

[07:04](#msg5781f38ded6e99892402c459)@dockimbel I think when panel is used inside a style it could be stored as a whole block inside a special facet (constructor, maybe ?). Then it would be instanciated by calling `layout`on the `on-create` event. I don't know if we can avoid to have a new facet for this sole purpose.

[07:06](#msg5781f406ed6e99892402c45d)Maybe it's better to have a new special VID command `construct` to deffer the construction of a sub-layout.

dockimbel

[10:42](#msg5782267a064f828707ff76e8)There are two options: 1) capture the VID source and instanciate it, as you said, 2) clone sub-faces when using that style. I'm not sure which one is the best for now. We probably need a more global model of how to build custom GUI components (including complex ones, like your rich-text or the spreadsheet from my demo), then decide on how to best support such feature.

SteeveGit

[10:44](#msg578227142886c03031641a8e)For the rich-text style, currently I use on-create to build sub faces.

dockimbel

[10:47](#msg578227dc7aeb080527988bf6)@SteeveGit So you can have several instances at the same time already?

SteeveGit

[10:48](#msg578227faf9cb022a33f00bb6)yes

dockimbel

[10:49](#msg578228271ca34a944eddac02)Very cool.

SteeveGit

[10:50](#msg578228642886c03031641a98)But since since the inner code is already large +800 LOC, actors object is shared

dockimbel

[10:50](#msg57822890b79455146f829e8a)That's the right thing to do. Sharing actors is the right default.

SteeveGit

[10:58](#msg57822a502886c03031641a9d)In fact, my functions in actors are just wrappers, so that would not be dramatic to clone it (that's what is done when new actors are added using VID anyway and I can't guard against it).

## Sunday 17th July, 2016

jouborg\_twitter

[23:42](#msg578c17f8d11cd2881240a947)hi, I'm new to Red and see that a binary with Red/View support for OS X was tweeted (https://twitter.com/red\_lang/status/751735005093605376). But I don't see an obvious entry point into building Red/View for OS X. Pointers?

## Monday 18th July, 2016

qtxie

[00:11](#msg578c1ecf914c51592b37e0cb)@jouborg\_twitter Hi, Welcome! The OSX backend is being developed in this branch: \[GUI](https://github.com/qtxie/red/tree/GUI), it's in very early stage, just for testing.

greggirwin

[00:33](#msg578c23efd11cd28812411bbe)Congratulations @qtxie! Very exciting.

jouborg\_twitter

[02:59](#msg578c45ffd11cd28812423742)@qtxie brilliant. Thanks!

[03:14](#msg578c498f196179690efdb893)got it building from source. Gonna see where I can contribute

pekr

[05:40](#msg578c6beb914c51592b3aa8f7)@qtxie - while work in progress, I report a compilation bug in your Direct2D branch:

```
Compiling to native code...
*** Syntax Error: Missing matching [
*** line: 78
*** at: "]^/ #L 79 ^/ #L 80 DrawLine*: alias functi"
```

qtxie

[07:03](#msg578c7f47196179690eff92e1)@pekr Thanks. I'll fix it today. ;-)

pekr

[07:07](#msg578c802f8423d084245789fb)Cool :-) Will DirectX 2D backend replace the default one (e.g. working down to WinXP), or will it be a parallel/selectable backend?

qtxie

[07:47](#msg578c8993c732138e6b0fe635)We'll make it as a selectable backend. WinXP doesn't support Direct2D, so the user need at least Window Vista.

pekr

[07:48](#msg578c89e6d11cd2881244c817)Ah, pity ... don't like those selectable things ... confuses users ... but there's no way around ...

greggirwin

[15:43](#msg578cf911841e619d16fc4560)But if Direct2D is the default choice, the only time you need to worry about it is for legacy systems on XP, which should become rarer over time.

pekr

[16:14](#msg578d006a841e619d16fcdcc7)Well, my guess is Doc is not going to agree. But maybe more than Doc I can see my brother and his PC repair shop in the basement, where old XP PCs live and do the service. You would not want to see the conditions there :-)

greggirwin

[16:27](#msg578d03850720fd587a8d2617)Gitter seems to be inserting strange smileys.

pekr

[16:28](#msg578d03a92d04e0585179f586)They miss the simple one, with just the mild smile

greggirwin

[16:29](#msg578d03d575045f8767eea1f6)I didn't mean to put one in my message at all.

pekr

[16:36](#msg578d057c75045f8767eeb32e)I reported some flicker/jitter when moving box based upon `base`style. I thought there might be some cheap-to get trickery to get it fixed, like defining double-buffering, custom blit routine, or something like that. Now what I can see is Qtxie mostly redoing backend in Direct2D? Or? I did not want to cause any slowdown, if the Direct-X stuff is not supposed to be a priority ....

greggirwin

[16:59](#msg578d0afb9f35137e67cadb2c)I think we're helping by pointing out issues we find Petr. Doc and Qtxie won't do stuff just for us. ;^)

pekr

[17:01](#msg578d0b6e75045f8767ef2bc6)Ah, I thought they would :-)

[17:02](#msg578d0b999f35137e67cae13e)Well, Red development must be tricky, I believe Doc likes to play at times too, the livecode demo is a nice example. He's an Amiga guy after all too ;-)

greggirwin

[17:02](#msg578d0b9dac85f2507abd7bd2)LOL! :^)

[17:03](#msg578d0bdb0720fd587a8db41e)I'm glad to see him coding Red for fun. They're doing all the heavy lifting and should get to enjoy the fruits of their labor like we do.

pekr

[17:05](#msg578d0c4c3d74e5a016548993)The good thing is, Red does not have any music support yet, or @rebolek would punish them with some demos of his crazy music he listens to :-)

## Tuesday 19th July, 2016

rebolek

[09:54](#msg578df8cb179b42515e222697):)

## Wednesday 20th July, 2016

justjenny

[23:24](#msg579008300720fd587ab2697d)sorry pasted it to the wrong branch - @pekr music is easy to play in Red - I been using this and it works without problems - not perfect, but until we get the real thing then its ok by me - if it dont work then make it work ! http://www.mycode4fun.co.uk/red-sound-engine

## Thursday 21st July, 2016

justjenny

[00:03](#msg5790115a9f35137e67efdf31)I talked to this guy a lot, and put simply you work with what you have, So at application level if there's no sound or whatever you need, you adapt and make it work. He says there's always a way, it could be crude and/or simple or a total lash-up, but there's always a way. Once committed to your programming language you have to make it do what you need it to - We are app builders. and that's how it works . apologies for the sermon, i just like what this guy is saying.

greggirwin

[05:39](#msg5790601eac85f2507ae5b776)+1

pekr

[05:45](#msg5790618b2d04e05851a23fe8)@justjenny I know all of that, I was just pulling Rebolek's leg to wake him up from limbo :-)

rebolek

[05:46](#msg5790619c69e7f1b17e4e26ae):)

pekr

[05:49](#msg57906277ac85f2507ae5c855)I just run his R2 pitch.green demo. Needs to be ported to Red - that way Red would officially enter a demoscene :-)

[05:50](#msg5790629fac85f2507ae5c8a6)@rebolek Wasn't there even some Sinthesar or similarly called demo?

rebolek

[05:51](#msg579062c7f05182092e3e43d8)@pekr Sintezar is standalone synthesizer written in Rebol.

[05:51](#msg579062e64feb3a7668941564)I plan to port it Red. In fact I ported some parts of it already.

pekr

[05:52](#msg579063012d04e05851a24cda)Cool. Even Google can't find it, which might mean, that it is on the dark side of the Moon :-)

[05:52](#msg57906324ac85f2507ae5c9ba)btw - was the 1000cows.red demo source code released?

rebolek

[05:53](#msg57906349f05182092e3e43db)No, it’s not on the Dark side of the Moon, it’s available on rebol.org, \[here](http://www.rebol.org/view-script.r?script=pm-101.r)

[05:54](#msg5790638cf05182092e3e43e1)1000cows were not released yet, because there’s not 1000 of them ;) I will rewrite it using draw (every cow is now separate face) to see if the speed will improve.

pekr

[05:54](#msg5790639575045f8767172260)ah, Rebol.org, forgot it existed. Was just looking into R2 desktop plus google ... thanks for the pointer ....

[05:55](#msg579063b8841e619d1627116e)R2 version did not use faces?

[05:55](#msg579063e02d04e05851a25413)You know the CZ economy is in a bad state, we need at least 1000 cows :-)

rebolek

[05:55](#msg579063eef05182092e3e43e9)hehe

[05:56](#msg57906417dda0cff017392282)Original version was for R3, I think and used gobs. I made R2 version with faces later to show the difference in speed.

[05:57](#msg5790642d69e7f1b17e4e26db)Red version is faster than R2, but not fast enough to handle 1000 faces.

pekr

[05:57](#msg5790645d841e619d16271c3f)Ah, I thought that R2 version generated those 1000 cows, albeit was slow. Red GUI looks being really faster than R2, even in its early state, which is cool!

greggirwin

[06:16](#msg579068da3d74e5a0167d36f5)When I ported Doc'd Vector Balls demo, I changed it to use DRAW as well Bolek.

rebolek

[06:19](#msg579069684feb3a766894158e)@greggirwin what was the speed difference?

greggirwin

[06:20](#msg579069999f35137e67f2e068)I never did a version with faces, so I don't know. I was in DRAW mode at the time. :^)

rebolek

[06:20](#msg579069a769e7f1b17e4e26fb)Ah, OK :)

## Monday 1st August, 2016

gour

[12:54](#msg579f468a07d2d2396e321fe5)hello, does work on linux gui go in parallel with GUI support fo Mac OS X (using gtk3) and it is supposed to be done in 0.6.4 (according to Trello board)?

dockimbel

[13:21](#msg579f4cd47fd9f73e16f0e79a)@gour GUI support for Mac OS X is relying on native Cocoa API, not GTK. We will resume the work on GTK support after 0.6.4. It should go pretty fast, as it is the easiest API to deal with compared to the other backends.

gour

[13:30](#msg579f4f0af1da4f376e1f0a29)@dockimbel that is what i was thinking as well - native gui support for each platforms, but got confused with updates on this \[card](https://trello.com/c/aoO1zUGr/156-gtk3-gui-backend) :-)

[13:32](#msg579f4f85f1da4f376e1f0b96)is there any rough estimation how far is 0.6.4?

dockimbel

[13:49](#msg579f534ff1da4f376e1f164e)@gour About 1.5 month for 0.6.4, so it's more likely that we'll swap 0.6.3 and 0.6.4. As soon as Mac GUI support will be release, the work on GTK will resume.

gour

[13:56](#msg579f54ff9639024416ad4307)@dockimbel that sounds pretty good...i hope you understand that without native GUI support, working with Red on Linux and using Wine is not the most attractive option...otoh, I hope that by start learning Red \*\*now\** and consulting Rebol docs does not mean one will have to unlearn much ;)

pekr

[15:59](#msg579f71db00663f5b1b41d03b)I'm in favor of switching 0.6.3 and 0.6.4. I do understand, that Android is a priority, but we could win some recent users, if OS-X and Linux GUI would be supported and there seems to be some work done on that already. OS-X and Linux could be released at once, but it depends ...

gour

[16:03](#msg579f72dfc915a0e426b34366)i also tend to believe that having GUI for 'desktop' OS-es might make Red more interesting (at this phase) for new users

## Friday 5th August, 2016

virtualAlan

[21:22](#msg57a503a56bf4dff61d3713b5)Here's the 'Red Precision Timepiece' section: http://www.mycode4fun.co.uk/red-apps

greggirwin

[22:51](#msg57a5188848422f8b4972de5d)Nice Alan.

virtualAlan

[22:57](#msg57a519e9857442dc0f572106)Thanks @greggirwin just loving what you're all doing

## Saturday 6th August, 2016

gour

[09:17](#msg57a5ab222f03cf8749cbb77a)i understand that GUIs on Linux &amp; Mac OS are not ready (yet), but wonder what is the status of GUI on WIndows, iow. roadmap says it's 100% done, so I wonder if one can already write full-fledged desktop app with it - one having menu bar with toolbars etc. ?

pekr

[09:21](#msg57a5ac1d2f03cf8749cbb92e)Windows GUI 100%? Where's that written? For particular release, maybe all features are there, but if you look into the next release, there are planned more widgets to be supported, etc. My take is, that the GUI will be continually improved ...

gour

[09:23](#msg57a5aca4483751d50f2e2a25)@pekr \[Here](http://www.red-lang.org/p/roadmap.html) - "Windows backend"

[09:39](#msg57a5b053483751d50f2e2ffb)it's a question about 'dead &amp; life'...iow. if i see that GUI is 100 done, at least for Windows, then i can abandon another potential language for my projec Py(Qt) and focus on learning Red :fire:

pekr

[09:41](#msg57a5b0ded097eb6b2cc9fb8d)For more precise roadmap please follow the Trello board: https://trello.com/b/FlQ6pzdB/red-tasks-overview

[09:42](#msg57a5b0f4483751d50f2e30f1)Backend might mean View engine and OS wrapper.

[09:43](#msg57a5b15c6bf4dff61d382b3c)From my perspective, to really start using GUI productively, you need few more widgets. For data, you will need multi-column view for e.g., which is not there. Also higher level styles are missing - window containers/splitters, etc. But - that could be done even today, with custom widgets imo. I am not even sure, if those are natively supported in Windows, or various toolkits simply create them

gour

[09:44](#msg57a5b18a2f03cf8749cbc213)I was looking at Trello board, but not seeing anything GUI-related for Windows..

pekr

[09:44](#msg57a5b190d097eb6b2cc9fc9f)Look into 0.6.2 card, GUI section - as you can see, some more features are planned - https://trello.com/c/wJRJhxBz/150-0-6-2-libred

dockimbel

[09:44](#msg57a5b1946bf4dff61d382c18)@gour 100% there means that all the base features we planned are there, not that we support \*all* possible widgets and features of every possible GUI framework. Red is at 0.6.1 and we will add more features to all GUI as we progress towards 1.0.

pekr

[09:45](#msg57a5b1b948422f8b4973c8c1)yes, nicely said in one sentence, what I tried to shape into a long story. My English skills are really troublesome :-)

dockimbel

[09:46](#msg57a5b203483751d50f2e335e)Also, there is no point in the future where the GUI will be \*finished\*, there are always possible additions and improvements. The only \*finished* software is dead software (e.g. Rebol2 is * finished\*). ;-)

gour

[09:47](#msg57a5b222483751d50f2e3395)@dockimbel ok, how those 'base features' go along with the basic GUI widgets, something lowest-common-denominator in regard to the thsoe 3 main OS platforms?

dockimbel

[09:50](#msg57a5b2fa857442dc0f580d94)The lowest-common denominator for the major 3 OS native GUI systems is already pretty high. But yes, we strive to have the same features on all platform, plus allowing to use extra OS-specific features when desired.

gour

[09:52](#msg57a5b3582f03cf8749cbc500)so, if understanding properly, the full GUI to write complete apps is not there (yet), but it's in the good shape?

dockimbel

[09:57](#msg57a5b493fb162b752ca2e40b)@gour "Complete apps" is very subjective, I write "complete apps" using Red GUI since months...

gour

[10:00](#msg57a5b52afb162b752ca2e4e5)@dockimbel as i wrote in the beginning...Menu bar, toolbars etc. like in 'standard' desktop apps

dockimbel

[10:01](#msg57a5b569483751d50f2e3897)@gour Menu: done, toolbar: not yet, though can be easily simulated using existing widgets or making custom ones.

[10:04](#msg57a5b61048422f8b4973d0d3)@gour Did you read our GUI docs?

gour

[10:18](#msg57a5b98f483751d50f2e3fc6)@dockimbel not yet...i've started with Rebol's Users Guide and am now on the verge to decide whether to go fully with Red. ;) since Red/System is, afaict, done, it means i could play with it by working on bindings for 3rd party C-lib and learning Red while waiting for GUI support (Linux) and other things (64bit support)...

dockimbel

[11:10](#msg57a5c5affb162b752ca30147)@gour Adding new bindings is a good way to learn, and good way to contribute. ;-)

gour

[11:36](#msg57a5cbc2978997001e9b33e4)@dockimbel all right...small step for Red, bug step for me ...deciding to bet on Red for my open-source project :congratulations:

dockimbel

[13:08](#msg57a5e13ed097eb6b2cca4ac7)@gour Cheers! :beers:

## Sunday 7th August, 2016

Travis-OBrien

[19:58](#msg57a792f248422f8b4977289e)anyone know how to remove GUI elements from a window? I currently have a label that I want to remove when a button is clicked.

greggirwin

[20:00](#msg57a793656bf4dff61d3b79d0)How that works will be OS specific (under the hood), but chances are you will either need to just hide the face or dynamically recreate your layout.

Travis-OBrien

[20:01](#msg57a7939b2f03cf8749cf191d)Ok, I'm using Windows btw. But how do you hide a face?

greggirwin

[20:16](#msg57a79722483751d50f3195c8)

```
view [f-lbl: text "goodbye"  button "Hide it" [f-lbl/visible?: false]]
```

Travis-OBrien

[20:17](#msg57a797672f03cf8749cf2367)Thanks! :)

## Monday 8th August, 2016

DideC

[09:13](#msg57a84d4c978997001e9fadd1)If you want to trully remove it from the window, you have to delete it from the face/pane :

```
view [f-lbl: text "goodbye" button "Remove it" [remove find f-lbl/parent/pane f-lbl]]
```

greggirwin

[16:03](#msg57a8ad4646610f173948ea6b)@DideC, do you know if that will work on all platforms?

dockimbel

[16:51](#msg57a8b88b613cc1803670feb7)@greggirwin It should work on all the GUI backends.

greggirwin

[16:52](#msg57a8b8b5f7f11a7936ac8ad1)Thanks Doc.

## Wednesday 10th August, 2016

meijeru

[13:00](#msg57ab2559613cc1803676bf7c)@dockimbel Possible typo detected in `view/backends/platform.red`

```
init: func [/local sys fonts][
		#system [gui/init]
		
		system/view/metrics/dpi: 94						;@@ Needs to be calculated
		system/view/screens: svs: make block! 6
```

I think the local `sys` should be `svs`. Probably not much danger of leaking, though...

dockimbel

[13:43](#msg57ab2f6b46610f17394ed24b)@meijeru Fixed, thanks.

meijeru

[14:03](#msg57ab344d16b0696856a98a16)@dockimbel I am continuing my investigation of unused locals, and hit on the following function in `button.reds`:

```
update-button: func [
	face  [red-object!]
	value [red-value!]
	sym   [integer!]
	index [integer!]
	part  [integer!]
	/local
		hWnd [handle!]
][
	hWnd: get-face-handle face
]
```

Since `get-face-handle` has no side effects, I wonder what this function does??

dockimbel

[15:42](#msg57ab4b5ebc688a13390c7e1e)@meijeru Looks like an unfinished work, and it doesn't seem to be called anywhere, so it's dead code. @qtxie please have a look at that one and remove it if it is really useless code.

meijeru

[15:54](#msg57ab4e2146610f17394f335b)  
flags in `update-base-text` in `base.reds` and `hWnd` in `set-defaults` in `gui.reds` and `value`in `init-window` in `gui.reds`&gt;

[15:56](#msg57ab4eb8ae838f6f569464fc)Also, `state` in `WndProc` in `event.reds`.

## Thursday 11st August, 2016

qtxie

[03:22](#msg57abef5e72b0dc244e03b533)@meijeru Thanks. I'll update the code.

## Saturday 13th August, 2016

RiVeND

[20:31](#msg57af838e46a301fa5a4ca3c4)Is such a thing as scrollable panel do-able yet? For a project I will need something on which I can place text in various sizes/fonts along with pictures and, eventually, clickable links, and have the whole thing vertically scrollable under a user's control within a smaller frame. Basically, like a web page whose content is larger than the browser window.

SteeveGit

[20:34](#msg57af845f9aba41a43d3e5cf9)There are samples of scrollable faces in the \*\*code\*\*repository

RiVeND

[20:43](#msg57af8682625cb3d845447d26)@SteeveGit Thanks, I will take a look.

[21:04](#msg57af8b6eaee33d7241eb3a75)Presume you mean https://github.com/red/code - not found anything yet...

SteeveGit

[21:13](#msg57af8d919aba41a43d3e5d5f)Not a real scroller, but it does the trick

```
view [
	at 250x10 sld: slider 20x500 100% return
	at 10x10 panel 200x500 [
		at 0x0
		panel 200x800 [
			at 10x100 text red  "bla bla"
			at 10x600 text blue "bla bla"
		]
		react [face/offset/y: negate to integer! face/size/y * (1 - sld/data)]
	]
]
```

RiVeND

[21:21](#msg57af8f4caee33d7241eb4030)@SteeveGit Excellent! Many thanks!

## Monday 15th August, 2016

Zamlox

[22:02](#msg57b23c0f6a2fa2ff3d8dbf34)cannot draw polygon with minimum set of points (3) as specified in documentation:

```
red>> view [base 100x100 draw [polygon 10x10 40x10 40x30 ]]
*** Script Error: invalid Draw dialect input at: [40x30]
*** Where: ???
```

It works with 4 points.  
Software or documentation issue ?

qtxie

[22:57](#msg57b248f58d93113d5ffebd9e)we should allow 3 points in `polygon` command.

[23:02](#msg57b24a00be8025f16944f1df)@Zamlox Fixed it.

## Tuesday 16th August, 2016

Zamlox

[04:44](#msg57b29a107ce08cec69dcfc93)@qtxie thanks.

## Saturday 20th August, 2016

Zamlox

[06:12](#msg57b7f4b8cd00bdff6e64bc4f)green color looks different (lighter) in Red then in browser.  
Red:

```
view layout/tight [base 400x200 draw [fill-pen green box 0x0 400x200]]
```

Firefox browser:

```
<?xml version="1.0" standalone="no"?>
<svg width="400px" height="300px" viewBox="0 0 400 300" version="1.1" xmlns="http://www.w3.org/2000/svg">
    <rect fill="green" x="0" y="0" width="400" height="200"/>
</svg>
```

[06:12](#msg57b7f4c36981f5f2690223eb)\[!\[blob](https://files.gitter.im/red/red/gui-branch/tIiS/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/tIiS/blob)

[06:28](#msg57b7f8a56981f5f26902310a)Same for IE and Chrome. I tried to draw green color in a test application using MSVC (color format RGB(0,255,0)) it gives same result as in Red. I opened Inkscape and checked green color value. It shows #008000 and it looks like drawn in browsers while the green drawn by Red has value #00FF00 and it's named 'Lime'.

[06:29](#msg57b7f8b15ffbca3e3cf9102d)Interesting color differences between applications.

meijeru

[08:42](#msg57b8181087f779f069117ec6)May I suggest reference to this \[Wikipedia article](https://en.wikipedia.org/wiki/Web\_colors)

PeterWAWood

[08:45](#msg57b818a387f779f069118024)Also, if you look in red/environment, there are 2 files: colors.red and css-colors.red which have different RGB values for green.

meijeru

[08:53](#msg57b81a93bb6fad403cee260a)I guess there will never be one universal standard for naming 24-bit colors, but having the same name for different RGB values is confusing, to say the least.

PeterWAWood

[09:21](#msg57b82102187885ef4f61c70a)@meijeru If I remember correctly, it is felt that both colour sets are required and the intention is for the css-colors to be moved to a module (once they have been introduced.)

[09:26](#msg57b82235bb6fad403cee3646)@Zamlox Just in case, it wasn't clear from my earlier comment. If you want to use the browser colour names in View, you can do this for the moment:

```
do %environment/css-colors.red
```

## Sunday 21st August, 2016

Zamlox

[05:45](#msg57b93fea6981f5f269057055)@meijeru thanks for link. I was expecting to find one color name for same RGB value among all applications.

[05:54](#msg57b942175ffbca3e3cfc703f)@PeterWAWood thanks for tip. Importing in Red an SVG file created by different applications might have different results regarding 'green' color. It might mean that for some of them 'css-colors.red' should be loaded first . I am not aware if all graphic designer tools represent green color as a css green color, I hope so.

PeterWAWood

[06:20](#msg57b948485ffbca3e3cfc7c84)@

[06:23](#msg57b948ce187885ef4f64afae)Perhaps there will be a need for another colors.red file in an SVG module which matches this - http://www.december.com/html/spec/colorsvg.html

Zamlox

[06:33](#msg57b94b2d87f779f06914b75b)yes, that would be a solution.

## Tuesday 23th August, 2016

planetsizecpu

[07:20](#msg57bbf943b64a3a016f5ba2f6)@qtxie are font styles supported by now? I'm trying to do

sty1: check "Bold" on-down \[Area1/Font/Style: "bold" ] on-up \[Area1/Font/Style: ""]

But nothing change on text style, so I don't know if is my mistake or bad understand of style behavior.

DideC

[07:59](#msg57bc026ebb6fad403cf9c1a4)@planetsizecpu first, you have to set a `font` object for Area1 (else by default, Area1/font = none!)

[08:01](#msg57bc02c887f779f0691d8e3a)Second, `font/style` can be none!, a word or a block of words.

[08:02](#msg57bc0304187885ef4f6d6c9c)Third, using `on-down` and `on-up` might not be what you want, but i let you solve that yourself ;-)

qtxie

[08:06](#msg57bc041b6981f5f2690e6ed2)@planetsizecpu @DideC answer your question. Thanks. :-)

planetsizecpu

[08:40](#msg57bc0c0bb64a3a016f5be9ef)@DideC Thanks, for Area1 have already set a font, in fact I can change font size correctly. I wanted to have a button that acts over the text style while it is being displayed (Area1 is asynchronously updated by rate/on-time), but the fact is that no changes on style are visible if you change it while changes on size are yet visibles.

qtxie

[09:08](#msg57bc1289219328ee32a78cec)@planetsizecpu I'll have a check.

planetsizecpu

[09:47](#msg57bc1ba15ffbca3e3c05771e)@qtxie Thanks, I have sent to you the source files by email, so you may check if is my mistake or a failure.

## Sunday 28th August, 2016

Travis-OBrien

[22:20](#msg57c363b5e353af447b38e952)Hello, I'm trying to draw a 100x100 box of random pixel colors but I have no idea what I'm doing. Can someone point me in the right direction?  
Here's what I have so far... using a single color.

```
my-box: [fill-pen 10.10.255 box 0x0 100x100]
view/no-wait [
	base 100x100 0.0.0 draw my-box
]
```

[22:32](#msg57c3667442e3827921810aad)I'm assuming I should be using an Image! for this, but I can't even get started with drawing an image onto a base...  
I'm currently developing a small game and I'm trying to find a way to render images onto the screen.

geekyi

[22:32](#msg57c36699d872312a1e85db49)@Travis-OBrien `? random`

[22:33](#msg57c366afe353af447b38ee9d)`random 255.255.255`

greggirwin

[22:34](#msg57c366e0d872312a1e85dbc9)If you're just starting out, they might be too much, but some things in https://github.com/red/code/tree/master/Scripts do drawing.

Travis-OBrien

[22:34](#msg57c3670bd872312a1e85dc33)Yeah, I'm very new to this. Thanks for the link!

[22:37](#msg57c367abe353af447b38f005)@geekyI I'm not looking for a way to draw a box with a random color. I'm trying to randomize every pixel of that box. Does that make sense? lol

greggirwin

[22:37](#msg57c367b73cdeb6467b7a3265)The Draw dialect isn't meant for drawing single pixels, but you can poke data into an image.

[22:39](#msg57c36838d872312a1e85dee3)The perlin and mandelbrot examples do it, but use embedded red/system code to make it fast, which may be too deep a dive for you right now.

geekyi

[22:41](#msg57c368b68147d91e790a46c2)@Travis-OBrien \[Image noise](https://rosettacode.org/wiki/Image\_noise)? Well, almost.. I think you should add to that page if you are able to do it ;-)

[22:47](#msg57c36a1be353af447b38f4e2)also, my initial code was just a starting suggestion, would `x: copy [] loop 34 [append x random 255.255.255] x` be more to your liking?

Travis-OBrien

[22:48](#msg57c36a245b11de77215bef83)Ahhh I think understand now... I was definitely on the wrong track. So I'm guessing I should be trying to insert data from one image into another image.

greggirwin

[22:49](#msg57c36a798147d91e790a49c3)

```
img: make image! 100x100

repeat x 100 [
    repeat y 100 [
        poke img as-pair x y random 255.255.255
    ]
]

view [image img]
```

Travis-OBrien

[22:50](#msg57c36aaad872312a1e85e42b)that's pretty much what I started thinking... thanks for help!!

greggirwin

[22:51](#msg57c36b0fe353af447b38f6fd)Sorry it's not more. I'm in the middle of something else.

JacobGood1

[22:52](#msg57c36b392a7bd0e9205a0504)@greggirwin unacceptable

Travis-OBrien

[22:52](#msg57c36b4542e382792181149c)I was stuck on this for a while and you gave me the answer... very helpful

greggirwin

[22:53](#msg57c36b4ed872312a1e85e546)Pffffft! ;^) (@JacobGood1)

[22:53](#msg57c36b645b11de77215bf2b5)I'm glad it helped. :^)

JacobGood1

[22:56](#msg57c36c265b11de77215bf40f)@greggirwin I expect the next halo as bare minimum example of how to use vid... and that is already shooting really low

[22:56](#msg57c36c355b11de77215bf41c)ok, done...

greggirwin

[22:57](#msg57c36c542a7bd0e9205a06d6)Halo?

[23:00](#msg57c36d128147d91e790a4fad)Oh, wait, maybe I get it. 'Cause I used VID in my example above.

Travis-OBrien

[23:04](#msg57c36de12a7bd0e9205a091a)I don't get anything that Jacob says...

geekyi

[23:15](#msg57c370982a7bd0e9205a0ebc)@Travis-OBrien assuming Jacob was using a touch keyboard and it autocorrected, he might have meant "help"; also he was teasing Gregg :smile:

Travis-OBrien

[23:16](#msg57c370d08147d91e790a5b64)@geekyI I was just teasing as well. ;)

JacobGood1

[23:17](#msg57c370fe3cdeb6467b7a4432)It is all one grand mystery. Obviously, I was saying that this is the coolest video ever: https://www.youtube.com/watch?v=HM1Zb3xmvMc

Travis-OBrien

[23:17](#msg57c3710d8147d91e790a5bbe)Well that clears everything up!

geekyi

[23:22](#msg57c37218e353af447b390377)Hmm.. perlin example is not compiling for me, gonna download latest build and test..

Travis-OBrien

[23:57](#msg57c37a608147d91e790a736b)Here's my progress so far:

https://gyazo.com/04a454461bd3f463c3d033f91dad7227

NOTE: I'm using an image off my hard drive, but I'm sure you'll easily understand the code without needing to run it.

```
zombie-img: load %zombie.png
canvas: make image! 500x500
img-index: 1
offset: 100 ;simulate the entity walking...
img-height: 96
img-width: 104
repeat y img-height [
    repeat x img-width [
        poke canvas as-pair x + offset y + offset zombie-img/:img-index
        img-index: img-index + 1
    ]
]
view/no-wait [
	image canvas
]
```

## Monday 29th August, 2016

geekyi

[00:10](#msg57c37d782a7bd0e9205a2940)@Travis-OBrien not really no, I don't really understand without running :-p, but it looks like you may want to add a `react` to `offset`?

[00:18](#msg57c37f572a7bd0e9205a2c40)@Travis-OBrien `view [ size 500x500 image zombie-img loose ]`

[00:20](#msg57c37fc742e38279218143ea)also check out the blogpost at http://www.red-lang.org/2016/03/060-red-gui-system.html

[00:23](#msg57c380965b11de77215c1d04)I \*think* what you are looking for is `react` and maybe moving with mouse or key board? Or time the image to move? I don't think it necessary for you to actually "poke" the background with your pixels, just draw over :smile:

Travis-OBrien

[00:30](#msg57c3823a3cdeb6467b7a67d1)I can't seem to edit my old post so ill just post again. I uploaded the image so you should be able to run this.

```
zombie-img: load https://raw.githubusercontent.com/Travis-OBrien/images/master/zombie.png
canvas: make image! 500x500
img-index: 1
offset: 100 ;simulate the entity walking...
img-height: 96
img-width: 104
repeat y img-height [
    repeat x img-width [
        poke canvas as-pair x + offset y + offset zombie-img/:img-index
        img-index: img-index + 1
    ]
]
view/no-wait [
	image canvas
]
```

[00:33](#msg57c382d05b11de77215c20a9)@geekyI Yeah, I just have no idea what I'm doing. ;p

greggirwin

[00:33](#msg57c382d62a7bd0e9205a331c)Works here. You're poking each pixel from zombie into a new image.

[00:33](#msg57c382e75b11de77215c20d2)Is there more you're trying to do?

Travis-OBrien

[00:34](#msg57c3830e42e38279218149c9)@greggirwin Nope, just learning and wanted to show my progress.

greggirwin

[00:34](#msg57c3831f5b11de77215c2159)Excellent!

Travis-OBrien

[00:34](#msg57c383303cdeb6467b7a697f):)

greggirwin

[00:35](#msg57c38338f6fe00361e095275)And thanks for sharing. It's always nice to cut and paste code and have it just work.

Travis-OBrien

[00:35](#msg57c383543cdeb6467b7a69b3)Yeah, it's amazing...

greggirwin

[00:36](#msg57c3838ef6fe00361e09530e)@JacobGood1, not sure about coolest though. I like https://www.youtube.com/watch?v=tjp-joRc2y0

geekyi

[00:38](#msg57c383f5e353af447b392705)@Travis-OBrien better make a gist if you want to continue. If I'm interpreting you right, there is no need to deal with pixels, and it's easier to work with a pair for `offset` i.e. `offset 3x4`

[00:39](#msg57c3844642e3827921814c36)

```
red>> as-pair 3 4
== 3x4
```

Travis-OBrien

[00:46](#msg57c385ccf6fe00361e095706)@geekyI can you give me an example of how you would approach this? my end goal is to be able to render zombies from a list, and this list will have a variable amount of zombies.

geekyi

[00:47](#msg57c386232a7bd0e9205a3958)@Travis-OBrien well, depends on how you would want to render them.. in the simplest case, use some form of a loop and `load` the images one by one? Then offset each..

## Tuesday 30th August, 2016

Zamlox

[17:18](#msg57c5bffa89fabaea6bd72a78)where can I find an example of how to use push command for draw dialect ?

SteeveGit

[18:48](#msg57c5d504b2b30e720e74092a)I didn't test it but it's supposed to work like in Rebol3

greggirwin

[19:07](#msg57c5d9869bac5667637320ca)

```
draw-blk: [
        translate 0x0
        fill-pen red
        box 20x20 400x400
        push [
            translate 50x50
            fill-pen blue box 10x10 200x200
            push [
                translate 150x150
                fill-pen green box 0x0 100x100
            ]
        ]
        fill-pen yellow box 250x250 500x500
]

view [
    below
    base 500x500 black draw draw-blk
    slider 500x20 [
        draw-blk/2: 1x1 * 40 * to integer! 100 * face/data
    ]
]
```

## Wednesday 31st August, 2016

Zamlox

[04:07](#msg57c657ee8635a5ba6c837ace)@greggirwin thanks.

## Sunday 11st September, 2016

Zamlox

[09:11](#msg57d51fcdd274dbdf35093ae5)with following code:

```
view [
    base 200x200
    draw [
        push [
            translate 20x20 line-width 1 
            push [
                translate 30x30 pen blue line-width 1 box 0x0 50x50
            ]
            push [
                pen green
                box 0x0 80x80
            ]
        ]
        push [
            pen red box 0x0 100x100
        ]
    ]
]
```

red rectangle should not be drawn translated by 20x20:

[09:11](#msg57d51fd9b37816b14faa1901)\[!\[blob](https://files.gitter.im/red/red/gui-branch/nyMu/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/nyMu/blob)

[09:12](#msg57d5200ca0e8dbb04f2aee86)

```
push
```

issue ?

dockimbel

[10:03](#msg57d52beab37816b14faa2fc2)Yes, looks like an issue, red rectangle should be drawn from 0x0.

Zamlox

[13:50](#msg57d56113ef19fa3f407781ed)ok, I opened a ticket.

## Tuesday 13th September, 2016

Zamlox

[11:15](#msg57d7dfd5cba69fe7350be8f6)can we have a clip command for draw dialect ? Nothing fancy, just clipping a rectangle area by coordinates, something like:

```
view [ base 100x100 draw [ clip 0x0 50x50 box 10x10 80x80 ] ]
```

## Saturday 17th September, 2016

dockimbel

[04:29](#msg57dcc69bdf21a75730043902)@Zamlox Yes, a `clip` command is on our todo-list.

qtxie

[06:49](#msg57dce78baabc89857fac9e39)@Zamlox I saw you push a PR for it, did you?

Zamlox

[17:43](#msg57dd80cd18291e10487cf8d2)well, I put it by mistake in same PR with the transformation, then I took it out. However, my implementation is only for GDI+ backend. @dockimbel @qtxie if you think it might be useful for you, I can push a new PR with my 'clip' implementation.

## Sunday 18th September, 2016

qtxie

[04:54](#msg57de1dee33c63ba01a0fb8d1)Yes. Draw use GDI+ by default. We can added GDI support later.

## Thursday 22nd September, 2016

DideC

[08:19](#msg57e393f5c3e7045a306d37d4)Is it possible to extend VID dialect for a specific style ?  
I mean, in R2 you can add to the style/words block! some words + functions allowing to use specific words in the VID code. I don't see this in Red VID, or did miss I something?

rebolek

[08:19](#msg57e39416d66f1a7967e2166a)It is possible to add custom styles to VID, but not fully supported yet.

[08:22](#msg57e394e1d66f1a7967e21684)@DideC custom tree style: http://i.imgur.com/O5RXMP8.gif

pekr

[08:23](#msg57e394f590ba43d217393831)nice!

DideC

[08:23](#msg57e3951927a8458f7f369bec)Actually, in a script code, the simple way is to use `style`. I suppose I can also add to `system/view/vid/styles` map, but I didn't try to not bother with binding issues.  
My question is just regarding extending the VID dialect for a style!

[08:25](#msg57e3955e27a8458f7f369cc0)I'm working on a splitter style. Works well, but I miss a simpler way to specify what it need to do. So the question.

rebolek

[08:25](#msg57e39568a3c0cb1b6a21f293)If you mean something like `stylize` it’s not there yet.

DideC

[08:25](#msg57e3957f27a8458f7f369d6d)Yes I know. So I use `style` actually.

rebolek

[08:26](#msg57e395a6a3c0cb1b6a21f29e)I guess I know what you mean, but the answer is no, there is no simpler way yet.

DideC

[08:28](#msg57e3961aaabc89857fc260aa)eg: in this R2 style, \[area-scroll](http://www.rebol.org/view-script.r?script=area-scroll-style.r) has specific words recognized to tell what scroller to show and other options (see Usage in the header).

rebolek

[08:29](#msg57e3964dc2287b924ff76a6c)Red's VID doesn’t allow that yet, AFAIK.

DideC

[08:30](#msg57e396acfa660dd95fffef71)OK, it's what I though.

SteeveGit

[08:33](#msg57e3976cc2287b924ff76a8a)How I add my own style:

```
;-- register rich-area style for VID
extend system/view/vid/styles [
    rich-area: [
        default-actor: on-down 
        template: [
			type: 'panel size: 80x80 color: snow
			rows: range: theme: none
			actors: [
				on-create: :init
			]
		]
    ]
]
```

DideC

[09:00](#msg57e39dc8c3e7045a306d5a28)Good to know. Thanks.

dockimbel

[09:02](#msg57e39e1c27a8458f7f36bd76)@DideC Exposing the list of VID keywords so it can be modified, should not be a big work.

DideC

[09:06](#msg57e39f25c3e7045a306d5f94)@dockimbel Looking at the source, style words are parsed by `fetch-options` that use a fixed parse rule. I guess you have something in minds to workaround this. I don't have the big pictures enough in mind to do it myself, nor the time "hélas".

dockimbel

[09:16](#msg57e3a16caabc89857fc28b14)We need to replace that rule by an external list of keyword/function pairs.

DideC

[09:19](#msg57e3a224fa660dd95f001e0c)Yeah. So it could be extended, globally (for all styles). But it must also check for a per style list for specific style keywords.

## Friday 23th September, 2016

DideC

[13:19](#msg57e52bceaf81f7ad45c7271f)I publish a new version of \[livecode.red](https://gist.github.com/DideC/85d60c99f97f2e4972a6f7b09a1fe630). It adds plitter to rearange space inside the window. It was a fun exercise without hacking VID or view. I have better solutions in minds, but Red GUI is not ready for that.

[13:26](#msg57e52d8aea8c654c3c06a6b1)@dockimbel There is a strange bug in it: the vertical spliter is sized to the right window border except origin value, not the width specified (6px).  
It happens after it is created as `output` is right placed (at 6x0 from the splitter offset), but if you put a `probe face/size` in the `on-create` it's already 406 wide.

greggirwin

[17:54](#msg57e56c6f23e89a2736130950)Nice Didier!

## Tuesday 27th September, 2016

qtxie

[01:42](#msg57e9ce8cea1b6b1a6c6e4529)@DideC Your livecode demo is working on Mac now.

[01:43](#msg57e9cec435e0f31c6c46376b)\[!\[mac-gui.gif](https://files.gitter.im/red/red/gui-branch/ZACO/thumb/mac-gui.gif)](https://files.gitter.im/red/red/gui-branch/ZACO/mac-gui.gif)

JacobGood1

[02:55](#msg57e9dfa8857ab70f7d443d01)@qtxie excellent job =)

greggirwin

[04:50](#msg57e9fa9c76d85b087dad3ca2)Go Qtxie, Go! :^)

DideC

[09:10](#msg57ea378876d85b087dae0aa4)@qtxie Nice to see it there ;-) My first apps running on a Mac that I know of !

rebolek

[09:10](#msg57ea3793a96e034d3d9a3193)hehe

ifgem

[12:36](#msg57ea67ce35e0f31c6c480325)Will something like rebol3 stylize be added to Red soon?:)

rebolek

[12:37](#msg57ea67fcf71de5634c619beb)It will definitely be added, but the answer depends on your definition of \*soon* ;)

[12:38](#msg57ea6833cca6236974b5c989)With libRed and macOS GUI almost ready, I think it’s not high priority right now.

ifgem

[12:42](#msg57ea692100961416551df920)@rebolek sorry for silly question.  
Is there any way to "override" action!, op! for my pseudo-type?  
(Just wrote a simple wav parser(?), want to make it beautiful(came from Ruby land:) )

rebolek

[12:42](#msg57ea6952808246a0620ab06a)@ifgem not a silly question at all.

[12:43](#msg57ea695e808246a0620ab06d)There IS a way, but there is no simple way.

[12:43](#msg57ea697ecca6236974b5c991)You could change the R/S code.

[12:43](#msg57ea6988808246a0620ab070)What exactly are you trying to do?

ifgem

[12:44](#msg57ea69c754302caa6f22823b)I want to add sound! without changing the core:))

rebolek

[12:46](#msg57ea6a28808246a0620ab079)Ah, so basically adding your own datatype :) I guess this won’t definitely come before Red 1.x

[12:47](#msg57ea6a50f71de5634c619c00)But you can use `object!` as a kind of pseudotype (you can even call it `sound!` if you want).

[12:47](#msg57ea6a68f71de5634c619c02)How do you store raw sound data? Are you using `vector!` for it?

ifgem

[12:48](#msg57ea6a81857ab70f7d45fc0c)binary!.

rebolek

[12:48](#msg57ea6a9c808246a0620ab07c)You should take a look at vector!, IMO it’s better for this purpose.

fergus4

[16:01](#msg57ea97c135e0f31c6c48e201)@qtxie @DideC where is DideC's version of livecode?

[16:02](#msg57ea980f783fe9b9459f90bb)We need a better repository for code samples. I know Doc set up red/code but not too much being dropped there.

rebolek

[16:16](#msg57ea9b43e5887b81555d18fe)@fergus4 https://gist.github.com/DideC/85d60c99f97f2e4972a6f7b09a1fe630

fergus4

[19:55](#msg57eacec7ca69aeb745b66603)Thanks

[20:46](#msg57eada8d54302caa6f248d2b)What a great little tool to experiment with!

geekyi

[22:09](#msg57eaee11783fe9b945a0fc49)@fergus4 :point\_up: \[September 27, 2016 9:01 PM](https://gitter.im/red/red/gui-branch?at=57ea97c135e0f31c6c48e201) not a repository, but a better way to search for code, a package manager I was thinkng.. \*but something light weight and simple like red* I have something in my mind, but not yet fully formed:

```
package/search "test"
package/search date!
package/add gist://<hash>
package/add github://fergus4/tool1
```

## Wednesday 28th September, 2016

ifgem

[03:21](#msg57eb373fab9ba81255ec9dd8)@geekyi awesome idea:)

Zamlox

[06:00](#msg57eb5c72ca69aeb745b80b7f)@qtxie any idea what GDI+/GDI API should I use for

```
arc
```

command of

```
shape
```

dialect and how to map

```
sweep
```

and

```
large
```

parameters ?

qtxie

[08:16](#msg57eb7c6ee045d19955069a6c)@Zamlox We can use `GdipDrawArcI`in GDI+. The `arc` in `shape` sub-dialect use two points(start point and end point), so we need to caculate the parameters for `GdipDrawArcI`.  
See: http://stackoverflow.com/questions/9437041/how-to-draw-an-arc-using-just-2-known-points-without-drawpie-or-drawarc

[08:17](#msg57eb7c95e045d19955069a70)For GDI, we can just use `Arc`.

Zamlox

[13:40](#msg57ebc834e4e41c6a4afed077)@qtxie thanks for the tip.  
I have done some comparisons how an elliptical arc is drawn in R2, browser (using SVG) and GDI+. For R2 and browser I got:

[13:40](#msg57ebc83d54302caa6f278d8e)\[!\[blob](https://files.gitter.im/red/red/gui-branch/tHRp/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/tHRp/blob)

[13:40](#msg57ebc85b54302caa6f278e25)(left side browser, right side R2).

[13:41](#msg57ebc87200961416552311ef)then same test for GDI+, using

```
GraphicsPath.AddArc
```

:

[13:41](#msg57ebc87b0096141655231224)\[!\[blob](https://files.gitter.im/red/red/gui-branch/ulHz/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/ulHz/blob)

[13:42](#msg57ebc8b9783fe9b945a3ca99)It looks like GDI+ doesn't draw a perfect elliptical arc.

[13:43](#msg57ebc8f700961416552313fb)should I look into agg how it is done and try to do it in same way ?

pekr

[13:58](#msg57ebcc77ca69aeb745b9b9de)I am not sure guys want to reimplement native OS functionalities. OTOH we've got OpenCV partially reimplemented using R/S, so it depends ....

Zamlox

[14:06](#msg57ebce7f0096141655232d91)It's only about

```
arc
```

command of

```
shape
```

sub-dialect. The other commands I have implemented are drawn correctly.

## Thursday 29th September, 2016

qtxie

[01:24](#msg57ec6d52e4e41c6a4a015fed)Not sure what `GraphicsPath.AddArc` does, I think it should use the same algorithm as the `GdipDrawArcI` function.  
Here is the test in Red:

```
view [
    base 300x300 draw [
        line-width 4
        pen blue circle 150x150 120 50
        pen red arc 150x150 120x50 -150 120
    ]
]
```

[01:25](#msg57ec6da654302caa6f2a5d14)\[!\[arc20160929092522.png](https://files.gitter.im/red/red/gui-branch/ZlNG/thumb/arc20160929092522.png)](https://files.gitter.im/red/red/gui-branch/ZlNG/arc20160929092522.png)

Zamlox

[01:30](#msg57ec6e9c54302caa6f2a5f49)yes, it should use same algorithm as

```
GdipDrawArcI
```

but it's for path. Your test looks good, which means I have to revise the way how I used that API function.

[01:30](#msg57ec6eaeab9ba81255f14685)Thanks for help.

## Friday 30th September, 2016

7hi4g0

[17:58](#msg57eea7d96f39416b1cda649a)@qtxie I'm messing around with the GTK+ backend implementation. Can I make a pull request to your branch in GitHub?

qtxie

[22:42](#msg57eeea60be5dec75500d4701)Yes. please. ^\_^

## Saturday 1st October, 2016

7hi4g0

[01:51](#msg57ef16950ff4ef7a50f5959f)@qtxie Great! :smile: I'm gonna keep messing with it and making pull requests then :+1:

qtxie

[07:42](#msg57ef68dbc512d9653a5a1f4d)Looking forward to merge them ;-)

KenSingleton

[13:45](#msg57efbde06f39416b1cdd3dc1)There seems to be an issue with the reactive color box demo on: http://www.red-lang.org/ -- the 'value' styles aren't displaying when they are as shown as in the example. They work fine if they are on a line of their own after the sliders. I am running the demo from the downloaded version of Red on red-lang site.

geekyi

[15:16](#msg57efd3516f39416b1cdd7e2b)@KenSingleton er which one?

KenSingleton

[15:19](#msg57efd3e8d38f186520b7b487)The one in the section marked Reactive GUI Programming, about 3/4 of the way down the blog page just below the circle demo.

geekyi

[15:22](#msg57efd4bd6f39416b1cdd816e)@KenSingleton Do you mean this blog post: http://www.red-lang.org/2016/03/060-red-gui-system.html ?

[15:23](#msg57efd50d6f39416b1cdd8201)Ok I think I found the "color box". It is working for me, what version are you using?

[15:25](#msg57efd558b0ff456d3ad7bd14)@KenSingleton You mean !\[this](https://4.bp.blogspot.com/-VtfQAdGC6oA/VvW3CHVGMxI/AAAAAAAAAMI/sfUnV1tTJloXvuIvnTCgeBHACKDRBzlaA/s1600/react2.gif) right?

KenSingleton

[15:26](#msg57efd58e16c37362201ae1a8)Yep, that's the one - the values at the end of the slider are not showing up for some reason. I am using the red version downloaded from the red-lang site - Big Red Button

[15:26](#msg57efd5bb6f39416b1cdd83c9)Version 0.6.1

geekyi

[15:27](#msg57efd5d334a8d5681cd2d8d1)From http://www.red-lang.org/p/download.html right? Let me check..

[15:28](#msg57efd6130ff4ef7a50f76868)(btw, you can get from that same page the one that works for me from \*Automated builds, master branch\*)

KenSingleton

[15:28](#msg57efd62b16c37362201ae32f)Ok, I will try that

geekyi

[15:29](#msg57efd66f0ff4ef7a50f769b3)Strange, works for me.. with the one I have..

KenSingleton

[15:30](#msg57efd69234a8d5681cd2dab5)Well that's strange, it works for me now in that download - thanks for the help

geekyi

[15:30](#msg57efd6960ff4ef7a50f76a08)@KenSingleton What is your platform? Windows ? detailed version?

[15:30](#msg57efd6b0c512d9653a5b3b6d)Maybe the download was corrupted :smile:

KenSingleton

[15:31](#msg57efd6d1c512d9653a5b3ba5)I am using the latest version of Windows 10 - just updated the anniversary edition

geekyi

[15:31](#msg57efd6e9be5dec75500f9483)I'm almost same, not updated

KenSingleton

[15:31](#msg57efd6ea0ff4ef7a50f76ad4)Yes maybe it got corrupted somehow. Thanks for helping out

geekyi

[15:32](#msg57efd6f8d38f186520b7bd8b)Sure :+1:

KenSingleton

[15:35](#msg57efd7a934a8d5681cd2dd71)I think it may be this editor I am using that is causing the problem - I run it directly in the console and it works fine - but running it from the editor it does not display the value styles - strange - time to change my editor I think.

geekyi

[16:09](#msg57efdf9fd38f186520b7d4af)@KenSingleton which are you using?

greggirwin

[19:09](#msg57f009e70ff4ef7a50f8067e)Could it be launching an old build?

## Tuesday 4th October, 2016

DideC

[13:55](#msg57f3b4ba8b26e33e7d278362)@dockimbel @qtxie Is there actually a way to access informations of the editing of a field ?  
I mean something like cursor-start, cursor-end to know where is the current editing, so things can be done in the actors ?

dockimbel

[16:20](#msg57f3d6d7d45d7f0f5260fee3)@DideC Not yet. We need to add supporting code for handling the caret. We also need to define the accessing interface.

## Wednesday 5th October, 2016

DideC

[10:05](#msg57f4d0628b26e33e7d2b616e)Ok, thanks... will wait a bit then.

## Thursday 6th October, 2016

rebolek

[15:43](#msg57f67114a9a0a333752fdd45)How can I set scroller values for `text-list` ?

## Friday 7th October, 2016

qtxie

[04:16](#msg57f721a8a7c618cd26ee58e0)@rebolek Not sure exactly what is the `scroller value`, when you select an item in text-list, it will be scrolled automatically.

[04:17](#msg57f721ce68f560d80ce46ed0)

```
view [
    t: text-list data ["1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12"]
    button "select" [t/selected: 10]
]
```

rebolek

[05:02](#msg57f72c53470c6bb20f5dad60)Nice, thanks!

[10:27](#msg57f77892470c6bb20f5db260)Can I wrap text in Draw?

qtxie

[10:41](#msg57f77be6a9a0a333752ff4d3)Nope.

rebolek

[10:42](#msg57f77c30bb20dfad43c40928)I thought so :)

## Saturday 8th October, 2016

Zamlox

[07:20](#msg57f89e3970fcb5db0c3c160d)@dockimbel @qtxie I have created a PR for shape dialect implementation. Implementation covers GDI and GDI+.

dockimbel

[07:24](#msg57f89f2170fcb5db0c3c17be)@Zamlox That's fantastic! We'll give it a review today.

Zamlox

[07:26](#msg57f89f92d6251fd126a00742)all right.

[07:26](#msg57f89fb784f1db0614918f52)how can I add an animated gif to gitter ? I have ported tiger demo and I would like to post it here.

dockimbel

[07:27](#msg57f89fde84f1db0614918f78)@Zamlox Same as any other image, just drag'n drop it here. Very excited to see the SVG Tiger finally rendered using Red. ;-)

Zamlox

[07:27](#msg57f89fe44fde7203141c5ec4)ok

[07:29](#msg57f8a06dd6251fd126a0089d)\[!\[tiger.gif](https://files.gitter.im/red/red/gui-branch/1a6y/thumb/tiger.gif)](https://files.gitter.im/red/red/gui-branch/1a6y/tiger.gif)

[07:32](#msg57f8a0f2dfe82a365b0982d6)I saved images using red by drawing it into images. I will add source code to code repository. For those who wants to try it, use my fork, with master branch.

dockimbel

[07:33](#msg57f8a140d6251fd126a00a7e)@Zamlox Wow, looks great! Thank you so much for the hard work!

Zamlox

[07:34](#msg57f8a16aa7c618cd26f34624);)

dockimbel

[07:34](#msg57f8a18e4fde7203141c6186)@Zamlox Is it a capture glitch on the left eye?

Zamlox

[07:35](#msg57f8a1bc84f1db06149192d6)yes, it is. Looks better when running from script.

[07:47](#msg57f8a48f70fcb5db0c3c22e9)I created a PR for tiger script on code repo: https://github.com/red/code

qtxie

[08:13](#msg57f8aa9e84f1db061491a63c)Wow ～(￣▽￣～)~

pekr

[08:51](#msg57f8b37f68f560d80ce9a44b)wow!

[08:51](#msg57f8b38edfe82a365b09ae81)How fast is that compared to R2/AGG version?

[08:51](#msg57f8b3a784f1db061491bc19)I will publish to FB group, if you don't mind, of course giving full credits

Zamlox

[11:07](#msg57f8d36e70fcb5db0c3c9d49)I haven't done any measurements regarding speed, but for me it seems a bit faster then R2/AGG.

[11:07](#msg57f8d37568f560d80ce9fa9f)yes,you can publish it on FB

[11:07](#msg57f8d37e84f1db06149208d0)Thank you for publishing ;)

dockimbel

[11:12](#msg57f8d4ab84f1db0614920ac6)Definitely faster, I'd say between 1.5 and 1.8 times faster than R2/AGG.

[11:18](#msg57f8d5fe70fcb5db0c3ca386)@Zamlox Do you have a Twitter account?

[11:21](#msg57f8d6b0dfe82a365b0a0823)\[!\[tigers.gif](https://files.gitter.im/red/red/gui-branch/PYie/thumb/tigers.gif)](https://files.gitter.im/red/red/gui-branch/PYie/tigers.gif)

pekr

[12:06](#msg57f8e15cdfe82a365b0a22cf)Interpreted (gui-console), or compiled?

dockimbel

[12:08](#msg57f8e1b1dfe82a365b0a23b0)Interpreted, but that doesn't matter in this case, as it's bound by the graphic engine speed and Draw dialect processing loop mostly.

Zamlox

[13:39](#msg57f8f71284f1db061492605b)@dockimbel No,I don't have Twitter account. Excellent capturing ! What tool did you used ?

[13:43](#msg57f8f7e9dfe82a365b0a6698)@pekr maybe would be better to use @dockimbel capturing to advertise it on FB and other media. It looks better.

pekr

[13:43](#msg57f8f81284f1db0614926351)Well, it is already posted. I can't change the image .... but I could add it in a comment

Zamlox

[13:43](#msg57f8f81a0aa72e3c5be54d6e)ok.

dockimbel

[13:46](#msg57f8f8bfdfe82a365b0a6920)@Zamlox \[Licecap](http://www.cockos.com/licecap/), setting 30fps for the capture speed.

Zamlox

[14:15](#msg57f8ff780aa72e3c5be5622e)@dockimbel thanks.

greggirwin

[15:49](#msg57f9156d70fcb5db0c3d6a2f)Great work @Zamlox !

Zamlox

[16:27](#msg57f91e6ba7c618cd26f4b0f9)@greggirwin thanks ;)

## Monday 10th October, 2016

qtxie

[04:34](#msg57fb1a6968f560d80cf03125)I pushed a new \[GUI branch](https://github.com/red/red/tree/GUI) in the official red repo. So you guys can play with the Mac and Linux GUI backends. ;-)

Zamlox

[04:48](#msg57fb1d9170fcb5db0c42e6b8)excellent !

7hi4g0

[12:25](#msg57fb88aedfe82a365b11cf1d)@qtxie I'm gonna make a new PR. Should I make it on your repo or on the official repo?

qtxie

[12:31](#msg57fb8a04bb20dfad43c43bc2)@7hi4g0 We'll seperate the GTK branch from the Mac branch. I'll create a GTK branch later, so you can make the new PR for it.

7hi4g0

[12:32](#msg57fb8a4070fcb5db0c445b9a)@qtxie Ok, I'll wait

[12:33](#msg57fb8aa4d6251fd126a7fbef)Also, I created a new file and put my name on the header, not sure if this is gonna be a problem.

qtxie

[12:34](#msg57fb8ae5a9a0a33375302848)That's Ok. :smile:

[13:23](#msg57fb964768f560d80cf1dcc6)@7hi4g0 I created a GTK branch on red repo. You can use it now.

7hi4g0

[13:46](#msg57fb9ba54fde72031424e116)@qtxie Great. :+1:

## Tuesday 11st October, 2016

planetsizecpu

[10:21](#msg57fcbd45dfe82a365b1657ec)\[!\[blob](https://files.gitter.im/red/red/gui-branch/RxFF/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/RxFF/blob)

[10:22](#msg57fcbd5ea7c618cd26ffbb22)@dockimbel is this a fault?

[10:24](#msg57fcbde884f1db06149de723)may be I downloaded exe while building is failing.

dockimbel

[10:42](#msg57fcc22dd6251fd126ac4218)@planetsizecpu It's a regression caused by recent changes in `system/build`. I've pushed a fix.

## Wednesday 12nd October, 2016

meijeru

[18:08](#msg57fe7c1978bd0d0363b99371)@dockimbel I am confused about the `draw` command `arc`. The docs say that the second argument, `radius` is a `pair!` value, and this is also what is accepted by `View`. However, it is not clear what the precise meaning of the two components (`x`and `y`) is. In my mind, what should be needed is a single integer for the radius. I got by with creating an artificial pair with two identical components.

[18:11](#msg57fe7cd478bd0d0363b99661)@dockimbel BTW, in `parse-shape`, the radius is an `integer!`.

Zamlox

[18:16](#msg57fe7dfd78bd0d0363b99a7f)@meijeru

```
arc
```

command of

```
draw
```

dialect is an elliptical arc,which means it has two radius: a longer and a shorter one. For

```
shape
```

dialect,

```
arc
```

command follows SVG standard (https://www.w3.org/TR/SVG/paths.html#PathDataEllipticalArcCommands), like R2 and R3. It is also an elliptical arc.

[18:29](#msg57fe80fb457ae29b71d36ce3)perhaps the type of radius in

```
shape
```

command could be made

```
float!
```

to be consistent with R2/R3.

7hi4g0

[20:00](#msg57fe964478bd0d0363ba05ad)@dockimbel @qtxie I'm read to make a new PR for GTK. Should I merge with master?

## Thursday 13th October, 2016

qtxie

[00:58](#msg57fedc1b614116a2567b3a44)If you need some fixes or features form master, you can merge it. Or just cherry-pick the commits if you only need a few commits.

7hi4g0

[05:46](#msg57ff1f9ab68c1ca566af6628)@qtxie I think I don't need anything from master right now.  
Already opened the PR.

## Sunday 16th October, 2016

7hi4g0

[00:33](#msg5802cad478bd0d0363c88904)@qtxie Giving a quick look over the SWT code you pointed me to in the main room, I noticed one of the advantages of using CSS that I don't think I mentioned already.

[00:34](#msg5802cb19891a53016312e7eb)When styling the text for the button we need to first get a handle for the `GtkLabel` widget inside the button.

[00:36](#msg5802cb9a614116a25688fff5)Another advantage is that if I set the style on a `panel`, `tab-panel` or other container widget, the style will automatically cascade. Not sure if this is the correct and desired behaviour.

[00:36](#msg5802cbaa30abd799718a0f78)I'll keep reading the code :wink:

qtxie

[00:42](#msg5802cce1891a53016312eadb)Does the style of the text influence by font ? If so, we can just \[set the font](https://git.eclipse.org/c/platform/eclipse.platform.swt.git/tree/bundles/org.eclipse.swt/Eclipse%20SWT/gtk/org/eclipse/swt/widgets/Widget.java#n1691) of the widget.

[00:43](#msg5802cd3f614116a2568903e0)For cascade, I think we'll handle it in VID.

7hi4g0

[00:47](#msg5802ce18614116a2568905a8)@qtxie Most of the style is influenced by font.  
The only thing that's not influenced is the alignment on `GtkLabel` or `text` widgets.  
AFAIK the correct, non-deprecated, way to set the font is through CSS or `GtkStyleProvider`.

[00:48](#msg5802ce50614116a25689060c)Of course we can still use the deprecated functions to set the font directly.

[00:48](#msg5802ce6e457ae29b71e27dd8)But alignment still would have to be handled separetly.

qtxie

[00:52](#msg5802cf571cc4cda4565485d7)Yes. It's the same in other platforms. Alignment is not a property of the font. It need to handle separetly.

7hi4g0

[00:54](#msg5802cfac1cc4cda45654865c)If in not mistaken, we can handle alignment in Pango for `area` and `field`, but `text` is a separate case.

[00:54](#msg5802cfce891a53016312f296)the alignment in `text` needs to be handled with GTK alignment.

qtxie

[00:55](#msg5802d00e8eaaaea3669ca945)If I understand correctly, actually the old deprecated functions is an implementation of the `GTKStyleProvider` interface. If we implement the interface in Red/System, we just \_\*re-implement\*_ it in function form.

7hi4g0

[00:57](#msg5802d0731cc4cda4565487ae)I'm not sure about that. You are probably right.  
But it's the safest bet. At least IMO.

qtxie

[01:10](#msg5802d383891a53016312fcc1)The GTKCssProvider provide a CSS interface to the user, while the deprecated functions provide a function interface.

And GTK get fully CSS support since 3.16, we can say that the deprecated functions have been used a very long time and also widly used.

They labled as deprecated means no new features will be added into it in the future. So we can use them for now, and implement the new features which not exsit in those old functions in`GTKStyleProvider` in the future.

[01:11](#msg5802d3d71cc4cda456548efd)Or just use CSS if it's desirable.

7hi4g0

[01:27](#msg5802d776457ae29b71e29189)I would vote for using CSS while at the same time implementing `GtkStyleProvider` and replace CSS once complete.

[01:27](#msg5802d793614116a256891ffd)I would use the deprecated functions without a problem, but it's not my first option.

[01:28](#msg5802d7c0457ae29b71e29230)It would definitely be easier to use the deprecated functions :pensive:

[01:29](#msg5802d7f7b68c1ca566bc91b8)And I have to agree with you that they'll probably still work for some time

[01:32](#msg5802d8a41cc4cda456549977)I hope I'm not being to annoying by not wanting to use the deprecated functions. :worried: I'm here to help. And whatever you believe is better I'll do it :smile:

qtxie

[01:34](#msg5802d92c1cc4cda456549a76)I know it's attractive to implement the `GtkStyleProvider` interface. ;-) I also want to write code myself intead of just using functions. But we should avoid implementing which already exist, and focus on which is missing.

[01:40](#msg5802da8330abd799718a30c1)We appreciate a lot your excellent work here. We're happy to be \_annoyed_ by you. ;-)

meijeru

[09:48](#msg58034ce8614116a2568a41f6)@Zamlox @dockimbel Thanks for the explanation (Oct 12)! It is something I would have expected to figure in the Gitbook, though.

## Monday 17th October, 2016

Rebol2Red

[19:05](#msg5805210cb827179842ce030a)How can i set a focus on a face? How can i read the mouseposition on a window or a face?

rebolek

[19:19](#msg58052440e897cd3a71dfd163)@Rebol2Red \*How can i set a focus on a face? * - theoretically, `window/selected: face` should do it.

[19:19](#msg5805245ce897cd3a71dfd166)\*How can i read the mouseposition on a window or a face?* - `event/offset` in actor.

[19:25](#msg58052593714642af22cc18e6)see https://github.com/red/red/issues/1652

Rebol2Red

[20:27](#msg58053421759f6d2436bf5317)@rebolek Thanks, so much places to look for information.

[21:03](#msg58053c9a4829257761314b42)@rebolek How to do this, when i have 2 fields:  
At the start set focus on field 1 then after pressing the enter key set the focus on field 2? (Not clear how to do this from the example)

[21:41](#msg580545912189c68f42f61c24)@rebolek Never mind i figured it out

greggirwin

[21:44](#msg580546594829257761316e27)Would you post your solution for others?

Rebol2Red

[21:45](#msg58054695759f6d2436bf9f2a)

```
l: layout [
    f1: field on-enter [l/selected: f2]
    f2: field on-enter [l/selected: f3]
    f3: field
]
l/selected: f1
view l
```

[21:52](#msg58054814b17b667961cde555)A question though: Why does this only works when using layout? Is there another way without using layout, just view?  
(I never use layout in Red, i thought it was'nt needed anymore, mostly programs will not work when using layout)

greggirwin

[21:57](#msg5805494c759f6d2436bfa8d5)Thanks!

[21:57](#msg58054956759f6d2436bfa917)

```
l: view/no-wait [
    f1: field on-enter [l/selected: f2]
    f2: field on-enter [l/selected: f3]
    f3: field
]
l/selected: f1
do-events
```

works fine.

[21:58](#msg5805497d4829257761317b47)If you just use `view`, it starts the event loop, so your layout reference isn't set yet as `view` hasn't returned.

Rebol2Red

[22:01](#msg58054a1cb827179842ceb3fe)Now i have another question. When do you have to use view/no-wait and do-events?

greggirwin

[22:02](#msg58054a9148292577613180d6)It starts the View event loop, so you normally only need to use it once, or never if you just use `view`. If you're doing updates to a draw block at a high rate, you may need to call it (with `/no-wait`) to let the system breathe a bit and redraw.

Rebol2Red

[22:04](#msg58054ae1b827179842ceb6de)Aha, thanks for explaining.

## Tuesday 18th October, 2016

DideC

[09:56](#msg5805f1d4482925776133ac0f)@Rebol2Red ...and, like Gregg does, when you need to make some computation/initialisation on the window you create before entering the event loop.  
Or if you need to open more than one window at startup: first windows will be opened with `view/no-wait` (was `view/new` in Rebol) and the last with `view` or `view/no-wait` + `do-events`.

rebolek

[12:15](#msg5806124c5636a5602eef0911)@Rebol2Red Sorry, I was sleeping :) Great to know you’ve figured it out, that’s always the best case ;)

7hi4g0

[15:40](#msg5806428736d642263681fd23)@Rebol2Red @greggirwin Both solutions are really great. :smile: But it feels to me that it should be a better way to reference the current window from inside the view dialect.

[15:41](#msg5806429c80020cc608f006ce)If it doesn't exist then I believe this is a good opportunity for improvement

greggirwin

[16:08](#msg580648f44829257761355a79)@7hi4g0, how would you do that? It would have to be some implicit word, yes? While that might seem nice, it's a deep change for something that isn't terribly painful. I do agree that there are times that kind of thing is good, and maybe this is one of them. I think, though, that we'll get a `focus` func in VID that will hide the detail for us, and which will be nicer.

[16:09](#msg5806493ab17b667961d1bb58)One place I think implicit words help is something like an `awk` dialect, where the current file and line are available via implicit shortcut words.

dockimbel

[16:13](#msg58064a11b17b667961d1c069)@greggirwin @7hi4g0 @Rebol2Red `self` references the current face container from `do` blocks:

```
view [
    f1: field on-enter [face/parent/selected: f2]
    f2: field on-enter [face/parent/selected: f3]
    f3: field
    do [self/selected: f1]
]
```

[16:14](#msg58064a56b17b667961d1c161)Alternatively, you can also set a word to that `self` reference for later use:

```
view [
    f1: field on-enter [win/selected: f2]
    f2: field on-enter [win/selected: f3]
    f3: field
    do [win: self win/selected: f1]
]
```

greggirwin

[16:15](#msg58064ab636d642263682263d)Thanks @dockimbel .

dockimbel

[16:20](#msg58064be8b827179842d2bafc)Moreover, `event/window` gives you a reference to the current window face in all event handlers.

7hi4g0

[16:32](#msg58064e8bb827179842d2c72f)Thanks @dockimbel

[16:34](#msg58064f0eb17b667961d1d6a2)@greggirwin I come from a HTML and JavaScript background and it seems natural to me to have a global `window` variable. Red already has a `system` global handler.

[16:34](#msg58064f2f8d2babbd0883f37e)It seems to be possible to implement an implicit word to reference the current window.

[16:35](#msg58064f438d2babbd0883f3d7)But I do aggre that it may not be necessary.

qtxie

[22:43](#msg5806a59d759f6d2436c545d4)On desktop, an APP may contains many `windows`, a global `window` variable doesn't work.

Maybe we would have a global `application` variable. So we can get current active window, hide or show the whole application (no need to hide all windows one by one), etc.

[22:46](#msg5806a65236d642263683c6a8)Ah, we already have something similar. It's `screen` face. :smile:

[22:58](#msg5806a8fab827179842d45f8c)For setting focus to a face, I find current method has a drawback. For example, we write an editor with tab support. When we change tab, it's obvious to set the focus to the tab in tab-panel's `change` event.

```
on-change: func [face [object!] event [event!] /local n editor][
	n: event/picked
	editor: face/pane/:n/pane/1     ;-- current selected editor. 
	win/selected: ed
	show win
]
```

Looks no problem, but it won't work and we'll get `stack overflow` error. Why?

[23:21](#msg5806ae608d2babbd08859896)Because we call `show win` inside an event handler.

`show obj` will check the `obj` and its children recursively, if any of them has been marked, it will be updated and call the corresponding event handler, then clear the mark.

In this case, we call `show win`, it will update the main window, set the focus to our editor, that's no problem. Then it will check `win`'s children and find the `tab-panel` is marked, and call `on-change` again. (Becuase we still in tab-panel's `on-change` event handler, \_it doesn't be unmarked!\_).

[23:25](#msg5806af6c8d2babbd08859c0b)I think a `set-focus` function is better, easier to use and no this problem.

## Wednesday 19th October, 2016

DideC

[08:16](#msg58072bd180020cc608f39a5d)@qtxie I see there is a `system/view/VID/focal-face`. What is its use ?

[08:19](#msg58072c9b36d642263685b9f1)In Rebol, there is a `find-window` func to give the window face object of a face.

[08:21](#msg58072d0bb17b667961d52a33)It could be a trivial `set-focus` func to set the `window/selected` to the argument face using an adapted Red `find-window`.

[08:37](#msg580730c3482925776138ed74)Like this: https://gist.github.com/DideC/fb8143eaca5f5bfe03e7722ec23e336c

7hi4g0

[12:09](#msg5807627c482925776139f810)@DideC Pretty interesting.

qtxie

[12:20](#msg58076511b17b667961d65217)@DideC Interesting, though using `win/selected` will trigger stack overflow in some cases.

dockimbel

[12:53](#msg58076cd436d642263686ee45)@qtxie You should log that stack overflow case in a ticket, so we can improve the View engine to avoid it.

7hi4g0

[13:41](#msg580777ec80020cc608f4fe5d)I was thinking about that `window` implicit I suggested and remembered of the `face` implicit that exists inside `view`.

[13:41](#msg58077808b17b667961d6ab65)How is that `face` inserted into the context?

[13:42](#msg580778388d2babbd0888bd52)We could use the same technique to include a reference to the window the face belongs to.

[13:42](#msg580778582189c68f42ff4927)Or we could insert a reference to the window in the `face` object itself.

DideC

[14:25](#msg5807826db827179842d7e4fd)Its the purpose of this `find-window`function. No need to store the reference: as you see its pretty easy to compute.

[14:28](#msg58078314759f6d2436c8f680)And face can be moved from one window to another very easily. But if you have to take care of indirect references, it become harder.

7hi4g0

[15:44](#msg580794d836d642263687c158)That was a doubt I had after I wrote that :point\_up: , if the faces could be moved from one window to another.

greggirwin

[18:56](#msg5807c1e7b17b667961d83398)Really nice Didier! The doc string for `find-window` is a tiny bit confusing to me. For those used to working at a lower level with windowing systems, the term "window" may not strictly mean the top level parent/container. Instead of

&gt; Find a face's window face.

What about

&gt; Find a face's top-level parent/window.

?

[18:59](#msg5807c2af2189c68f4200cfe8)I'll have to think on the name a bit. Historically, I have `find-window` funcs that map to the Win API for finding top level windows in the system by title text, etc.

DideC

[21:32](#msg5807e68bb827179842d9faf0)@greggirwin I just pick the same name (and code) than the Rebol one!

## Friday 21st October, 2016

Rebol2Red

[04:47](#msg58099dc88d2babbd08913d84)

```
; use end key when in area to goto field f1
view [
    f1: field on-enter [win/selected: f2]
    f2: field on-enter [win/selected: f3]
    f3: field on-enter [win/selected: a1]
    a1: area on-key [if event/key = 'end  [
			; do something with the data like saving it
			clear a1/text clear f1/text clear f2/text clear f3/text
			win/selected: f1
		]
	]
    do [win: self win/selected: f1]
]
```

Some questions:  
1\)  
Is using the end key a good choice for 'leaving' an area? ( enter certainly not because then it's better to use a field in the first place )  
2\)  
How to clear all faces at once?  
3\)  
There is one empty line at the start of the area. Is this an issue?  
Maybe it's just the behavoir when not directly clicking at the area. If so, how to solve this?

planetsizecpu

[07:58](#msg5809ca9c4829257761439c46)Those people that have entered data for many years also expect tab key to cycle between all defined fields, as shift-tab do the same at inverse, so I think will be a good idea the tab key to do this behavior by default by view.

[08:06](#msg5809cc8d759f6d2436d21600)That is, not to be induced by program.

meijeru

[09:00](#msg5809d92c36d642263690c999)Question: does a base face accept keypresses? If not, how do I capture keys (e.g. delete key) on a drawing that is rendered in a base face?

dockimbel

[09:11](#msg5809dbb4b17b667961e05760)Answer: set the focus on the face you want to capture key events (the focus is on the window by default).

Rebol2Red

[09:17](#msg5809dd3a36d642263690da47)

[09:29](#msg5809dfe780020cc608fe7628)@planetsizecpu  
I was aware of it, but it was not working when i use a literal 'tab  
It works when using event/key = tab

```
; use tab key when in area to goto field f1
view [
    f1: field on-key [if event/key = tab [win/selected: f2]]
    f2: field on-key [if event/key = tab [win/selected: f3]]
    f3: field on-key [if event/key = tab [win/selected: a1]]
    a1: area "" on-key [if event/key = 'end  [
            ; do something with the data like saving it
            clear a1/text clear f1/text clear f2/text clear f3/text
            win/selected: f1
        ]
    ]
    do [win: self win/selected: f1]
]
```

Why must you use a literal when using end and not while using tab?

dockimbel

[09:32](#msg5809e0b5482925776143f6c9)@Rebol2Red Basic evaluation rules:

```
red>> 'end
== end
red>> tab
== #"^-"
```

Rebol2Red

[09:57](#msg5809e685b17b667961e087d0)

7hi4g0

[14:31](#msg580a26b3a27d2220790db06e)@planetsizecpu I agree that `view` should have tab selection support by default.

## Sunday 23th October, 2016

thirdy

[04:31](#msg580c3d3f56121b9c7eaf4bde)Hi, is there support for Tooltip?

rebolek

[06:09](#msg580c542f714642af22cca4df)@thirdy not yet

planetsizecpu

[09:06](#msg580c7d7b577f2c22790bd50b)@Rebol2Red Your example depicts exactly what I meant: if you want to set focus on next field it must be induced by your script, and what would expect is that fields could be focused by tab key in a cycle, like some DBs does. All together comes from the need of not to force the operator to use mouse to navigate, imagine some complex data entry form for a pile of documents, could be a hard work if you have to use mouse.

RiVeND

[12:53](#msg580cb2dcb6fc192f56314f7f)@Rebol2Red I've been playing around with that field/tab handling code - tab cycles forwards, shift-tab cycles backwards, home goes back to the first field, end goes to the last field. It still doesn't solve the tab characters that keep appearing in the area, though.

```
; handle-key deals with tab, shift-tab, home and end keys
handle-key: function [e prev-fld next-fld][
	k: e/key
	if k = tab [
		either e/shift? [win/selected: prev-fld][win/selected: next-fld]
	]
	if k = 'home [win/selected: f1]
	if k = 'end [win/selected: a1]
]

view [
	f1: field on-key [handle-key event a1 f2]
	f2: field on-key [handle-key event f1 f3]
	f3: field on-key [handle-key event f2 a1]
	a1: area "" 140x100 on-key [handle-key event f3 f1]
	return
	button "Clear" [
		; do something with the data like saving it
		clear a1/text clear f1/text clear f2/text clear f3/text
		win/selected: f1
	]
	do [win: self win/selected: f1]
]
```

[12:57](#msg580cb3c0015db84e6fbb74ac)For those who prefer HOME and END to remain in the same field use the following instead in the handle-key function:

```
if e/shift? [
		if k = 'home [win/selected: f1]
		if k = 'end [win/selected: a1]
	]
```

[13:09](#msg580cb6a7fb138dce65ef01e9)Then shift-HOME and shift-END go to the first and last fields.

pekr

[13:28](#msg580cbb01015db84e6fbb8a45)Shift home/end should not do so, at least under Windows imo

[13:29](#msg580cbb43577f2c22790c7ad4)it should hilite the text from the cursor position towards the home/end reapectively. Let's keep it to the OS standards ;-)

RiVeND

[13:43](#msg580cbe905af5969e7ef1d31f)Indeed, just showing what could be done if someone wanted to do it that way.

planetsizecpu

[15:39](#msg580cd998015db84e6fbbf90c)@RiVeND That's what I want to say, in your code you need a function plus a few lines of code just to manage tab key behavior. What I meant is that view must done that by default, fields must be indexed in an order and view must take care of focus the cursor when tab key is pressed, because if we have to do by code we get bloat.

RiVeND

[15:55](#msg580cdd57015db84e6fbc03ab)@planetsizecpu Agreed, maybe the Red team will expand fields with something that's similar to HTML 'tabindex'.

greggirwin

[19:36](#msg580d114e5af5969e7ef30130)It shouldn't be difficult, though the cross platform aspect makes everything harder. I agree, though, that doing it declaratively is better than writing code. And if it's a new `tab-index` facet with a small amount of supporting code, great. I recall my VB days where it was easy to set them, but they could also get messed up and you would have to fix them all manually.

The issue, as I recall, was that (as we can in Red) the tab index got a default value, but if you then changed one which conflicted with an existing tab index, things could change in unexpected ways.

[19:37](#msg580d1185015db84e6fbcc100)Another old feature was that accelerator keys for faces that couldn't get focus would then send focus to the next one that could, so a label hot key could take you to a text field.

7hi4g0

[20:05](#msg580d1824fb138dce65f072b2)I believe it's possible to implement tab selection and `tab-index` without too much code. Would only know for sure if I try to make a sample implementation of it, but on the top of my head it's a simple thing to implement.

[20:06](#msg580d18595af5969e7ef31b0e)Since @greggirwin touched it, does Red have accelerator keys support?

greggirwin

[22:30](#msg580d39fb278cc54c6f612a3f)Not yet. My guess is that some decisions need to be made WRT native accelerator key bindings. We have all the actor events+data needed to do it today, as was done in R2, but Team Red may have a plan for them so it's more consistent for interacting with menus as well.

[22:31](#msg580d3a40577f2c22790e473f)In R2, a `char!` value for most styles would become a hot key for it, so it was just a type to facet assignment, and key handling that checked for that.

PeterWAWood

[23:01](#msg580d4142305a10335db4971f)@dockimbel There's a question on the ML about a Grid Face:  
"I just had an initial look at the docs for the View engine and noticed that there is no grid face....

Will there be one in the future or does one have to manually create one from a bunch of fields?"

It's from Kai Peters, a long time Rebol user.

## Monday 24th October, 2016

meijeru

[06:58](#msg580db1265af5969e7ef50571)If a Grid Face is more or less the same as the `table` face of RebGUI, then I am also keen on having it.

7hi4g0

[07:32](#msg580db907015db84e6fbed43d)What would be that Grid face? A Grid for other faces or a Grid of `field`s?

pekr

[07:37](#msg580dba295af5969e7ef53342)most probably a data grid ....

[07:42](#msg580dbb5856121b9c7eb41a57)e.g. https://msdn.microsoft.com/en-us/library/system.windows.controls.grid(v=vs.110).aspx ?

[07:44](#msg580dbbd956121b9c7eb41ca0)or some text-list type: https://msdn.microsoft.com/en-us/library/windows/desktop/ee671634(v=vs.85).aspx

[07:44](#msg580dbbeeb6fc192f5634d876)simply - an ability to display multi-column/row data

7hi4g0

[07:46](#msg580dbc395af5969e7ef53b10)@pekr This first one from msdn looks more like a face grid, as in youcan put whatever face or widget inside the elements of the grid.

[07:46](#msg580dbc6b278cc54c6f62c618)That's what I imagine a grid would be: A way to organize your faces in columns and rows.

pekr

[08:11](#msg580dc24a56121b9c7eb43fd7)Most ppl would be just ok with the ability to display multi-column text data from db, without fancy flags, checkboxes, etc. But of course, if anyone wraps the more advanced one, even better :-)

DideC

[09:57](#msg580ddb05b6fc192f563566e7)@7hi4g0 with Rebol, VID provide the `list` style where you can basically put any styles you want in each row. I used it a lot, but it was pretty hard to use, mostly due to the lack of good and complete documentation. I never used the "function provider" (if I can call it like this) due to my lack of understanding.

planetsizecpu

[10:08](#msg580ddda4577f2c22791066da)@pekr As we have discussed a few months away :smile:

## Wednesday 26th October, 2016

7hi4g0

[17:22](#msg5810e650c3569a036e2033c1) In GTK radio buttons are added manually to groups. Each new radio button creates a new radio group or is added to an existing group passed to it.

[17:22](#msg5810e66f806316005dc258a7)According to the view dialect docs, radio buttons are grouped by pane.

[17:24](#msg5810e6bc8ed1c0ff5c300606)I was thinking how to relate the pane to a radio group object.

[17:24](#msg5810e6ca8ed1c0ff5c300645)Anyone has any suggestion?

[17:26](#msg5810e738482c168b22bb2d56)I could save the handle to the group inside the pane some place or I could use `g_object_set_qdata`

[17:26](#msg5810e75b482c168b22bb2e2d)@qtxie What would you suggest?

[19:25](#msg58110337482c168b22bbb4b7)Should the radio buttons start with all unselected?

[19:26](#msg58110366482c168b22bbb570)According to the view dialect :point\_up\_2:

[19:27](#msg5811038683a2008d22d7a321)GTK seems to always start with one selected

rebolek

[19:28](#msg581103cd00847298798017be)@7hi4g0 I don’t think it’s mentioned anywhere in the docs, but that’s the current behaviour (all unselected).

7hi4g0

[19:29](#msg581104010a2d07ff1192d2dd)Then I guess we need to make a hack in the GTK backend :worried:

[19:29](#msg58110425c3569a036e20cc9a)Apparently the only way to mimic this behaviour is to have a hidden radio button start selected

greggirwin

[19:30](#msg581104455a1cfa016e4d4d9b)Or note it in the docs. Complete consistency is great, but noting that you \*should* set a default if you want consistency on GTK will go a long way.

rebolek

[19:30](#msg58110460010b919c1b66c35f)@7hi4g0 As I said, it’s not mentioned anywhere in the docs, so if GTK does it differently, you are technically not breaking some rules.

7hi4g0

[19:32](#msg581104b2482c168b22bbcb0e)I guess I'll leave it like this for now then.

rebolek

[19:32](#msg581104c5d61a904a084b6b48):+1: makes sense to me.

[19:53](#msg581109c00084729879801812)What is `font!/parent`, how does it work and why it can get full of something that looks like total garbage? (block of empty faces)

## Thursday 27th October, 2016

qtxie

[02:31](#msg5811670a0e25dbfa1166c2df)@7hi4g0 IIRC, we don't have `radio group` in view yet. We'll have a look at it soon to see how to implement it.

For the default selected radion button, I think we should start with on selected, that's more logical.

[02:39](#msg581168f60e25dbfa1166c7e2)@rebolek `font!/parent` is a block which contains all the `face!`s reference to this font. Maybe there is bug if all the faces are empty.

rebolek

[02:45](#msg58116a43c3569a036e226345)Thanks. When thinking about this, I though this is the best explanation, but the empty faces were Very confusing to mě. So yes, I think there is a bug

7hi4g0

[05:01](#msg58118a21c3569a036e22bc56)I don't know if that's correct, but I take that they appear empty because they were already printed.

[05:02](#msg58118a58806316005dc4f827)Don't know if `probe` is that smart, but that would make sense in order to prevent infinite looping in print.

[05:07](#msg58118bae5a1cfa016e4f2e47)@rebolek @qtxie

```
a: make object! [b: make object! [a: none]]
a/b/a: a
probe a
```

[05:09](#msg58118c0c7b15d16e55b2a340)@qtxie GTK already has `radio group`s so I'll need to use it.

[06:35](#msg5811a03f5a1cfa016e4f78b7)@qtxie Implementing those changes you suggested should be `FEAT: GTK3:` or `FIX: GTK3:`?

qtxie

[06:57](#msg5811a576d61a904a084b74c4)I think `FEAT: GTK3:` is OK.

RiVeND

[10:32](#msg5811d7b483a2008d22daee82)@qtxie Regarding radio groups and a default selected button - can we have a choice as to whether or not one is selected by default? Having built lots of web sites over the years I've found that, under certain cirumstances, having one pre-selected oftens means that people will leave it as it is, which means they may not have selected what was most appropriate. Having no button selected will force them to think about which one they really need to select.

DideC

[10:36](#msg5811d8c38ed1c0ff5c33a7b8)Agreed.

qtxie

[11:08](#msg5811e03c0df4825a722dac9e)@RiVeND Agreed too. So now we need to make GTK3 backend the same as the other backends.

7hi4g0

[14:14](#msg58120be25a1cfa016e518d0d)@RiVeND That's what I thought. But it appears that the only way to make it on GTK is through a little hack: a hidden radio button selected by default.

dockimbel

[14:23](#msg58120ddc5a1cfa016e51972a)@7hi4g0 Can't we have just a single radio button, instead of a group? That's all we need for the View backend.

fergus4

[16:29](#msg58122b5b8ed1c0ff5c354e8e)I notice when dragging a 'loose' panel by the edges (approx the padded regions) it does not move smoothly and is erratic...dragging from center has no issues. (on windows 10)

dockimbel

[16:35](#msg58122ce9482c168b22c0a63d)@fergus4 Can you post simple code here to reproduce it?

greggirwin

[16:37](#msg58122d3e806316005dc7e917)`view [size 500x500 panel red loose]`

[16:37](#msg58122d4dc3569a036e25bfbf)I was going to ask the same thing Nenad. :^)

[16:38](#msg58122d9f8ed1c0ff5c355b4b)Duped here. If you move the mouse \*very* slowly, it keeps up, but if the mouse moves away from it, the drag state seems to get stuck, so it moves when you try to get the mouse back over it, even with the mouse button up.

[16:39](#msg58122dc4c3569a036e25c1b4)If you're careful, you can grab it by the outer edge again.

dockimbel

[16:39](#msg58122ddc5a1cfa016e524b3d)It's a known issue with the drag handling, we have it on our Todo list for improvement. We'll give it a look before the new release.

7hi4g0

[16:55](#msg581231805a1cfa016e5261da)@dockimbel GTK uses a logical group for radio buttons. It's a single linked list and GTK ensures that one and only one is always set.

[16:56](#msg581231be482c168b22c0bdaa)If I create four radio buttons without setting the group for them, GTK will automatically create a new group for each one and they will be always set.

greggirwin

[17:23](#msg581238098ed1c0ff5c35936b)From View, then, there could be a `'default` group, and each pane (some facet of the pane) would be the group value for any contained radio buttons. R2 VID had a default group value, but then you could set the group value as a facet for each radio button.

7hi4g0

[17:54](#msg58123f5b83a2008d22dd0fac)@greggirwin I'm not sure I understood it all, but I think it can be done.

pekr

[18:46](#msg58124b9c806316005dc88096)I am also not fond of the following flicker issue (if the bg is not set, it looks smooth): http://2zone.cz/pekr/red-news-scroller-flicker.mp4

greggirwin

[18:54](#msg58124d6d806316005dc88827)@7hi4g0, there would be a facet/property for radio buttons that defines their group. By default they would all belong to the same group, but you could set that property to group them how you want. R2 did this without the panel requirement, but Red's model may choose to use panels as the grouping mechanism for all time. If so, a value in the panel could be used as the group key for radio buttons in that panel. The radio style would just look at `parent/radio-group-id` and use that for systems like GTK that need it.

DideC

[19:10](#msg5812510b8ed1c0ff5c360b30)Q: how can I redefine a VID function to patch it without having to re compile ?  
Ie : I want to test in Red code some new features, without compiling Red.  
An example : https://gist.github.com/DideC/657ce1e7add32872c3b363c47fe270cb#file-test-patch-vid-red

## Friday 28th October, 2016

dockimbel

[04:36](#msg5812d5d9c3569a036e288b29)@DideC You can't patch compiled code to call a different `fetch-options` function, because the calls are compiled, so they will always call the same code regardless of the words you redefine. We could change that to fetch the word's value on each call and invoke the function, though this would result in a performance drop and runtime errors if the word is not referring to a function anymore. In order to compile code, the compiler has to make some assumptions about the code, and ensures that those assumptions are enforced at run-time (like arguments passing, which is different for each function type: function!, routine!, action!, native!). The best option for extending VID keywords is to change the original VID code, to make it easy to achieve at run-time.

[04:36](#msg5812d5e50e25dbfa116cec4c)@pekr You are welcome to open a ticket about it.

[04:44](#msg5812d7be482c168b22c38e62)@7hi4g0 The View backend requires the binding of a single radio button in the backend, so that the View engine can control radio buttons state, including when/how they are grouped. I did a quick search and it seems the solution you propose is the only way out, unfortunately (though, that hack seems to work well according to other people experience with it).

7hi4g0

[04:51](#msg5812d93d8ed1c0ff5c382f8d)@dockimbel The only limitation there is on the radio buttons is that there always need to have one selected per group. Other than that we can move radio buttons between groups or toggle their state by code. Basically, we need to keep the groups synched between the View engine and GTK.

[04:51](#msg5812d9610e25dbfa116cfa52)This does seem simple to do though.

[04:53](#msg5812d9ae8ed1c0ff5c3831a7)It's already working according the view docs with the exception of the initial all unselected state.

[04:57](#msg5812dad05a1cfa016e552ffe)Will make a PR with radio button support probably on Saturday. Then you can check to see if I'll need to adapt something to work as expected or to conform to the Windows implementation. :wink:

DideC

[06:56](#msg5812f68a7b15d16e55b8c5e8)@dockimbel I'm still not confortable with the how to change original Red code.  
So if I change, ie. `fetch-options`code in `%VID.red`, did I have to rebuilt my own Red interpreter to use it (means I must have Rebol SDK licence) ?

pekr

[06:59](#msg5812f743c3569a036e290e09)You don't need Rebol SDK licence ...

[07:00](#msg5812f773806316005dcb266a)Not sure about red.exe, for that, you might need it. But you don't need to build red.exe in order to use Red. You can build gui-console.exe, or DOS console, from the sources.

[07:00](#msg5812f7a6806316005dcb26f4)If I understand it well, red.exe = r2 inside, plus the red and its compiler stack inside. So - you can use red.exe to compile ....

[07:04](#msg5812f88e5a1cfa016e55a381)What I normally do is: hit enter on red.r, it launches my R2/View. Then I type: rc "-t Windows %environment/console/gui-console.red" and I have latest red gui console from sources. Ditto for any other app .... So basically all you need is just free R2/View ....

dockimbel

[07:58](#msg581305315a1cfa016e55df56)@7hi4g0 Thank you very much for your good work! :+1: We need the unselected state, we should allow all radio buttons in a group to be unselected if needed (there are some cases where this is useful).

greggirwin

[13:59](#msg581359c3c3569a036e2ae9c5)@7hi4g0 +1 on your good work!

Zamlox

[20:47](#msg5813b96583a2008d22e3f62a)@dockimbel @qtxie I have done some improvements on shape commands. Have a look on PR I have created when you have time.

## Saturday 29th October, 2016

geekyi

[00:44](#msg5813f103806316005dcfbf68)@DideC from what I've seen, rebol/sdk basically packages (encrypt, compress, etc) the red gui-console so, what @pekr :point\_up: \[said](https://gitter.im/red/red/gui-branch?at=5812f88e5a1cfa016e55a381). You can also compile just your own `Red[]` file.red, or run without compiling..

dockimbel

[04:00](#msg58141efb83a2008d22e5787f)@Zamlox Great. @qtxie will review the code. About the `clip` command using shapes, can our other Draw backends (Quartz, Cairo, Skia) support that feature too?

[04:02](#msg58141f595a1cfa016e5b1b3a)@geekyi The `red.exe` only contains the source code for the gui-console, which gets compiled on first invocation of the REPL.

qtxie

[11:03](#msg5814821ddb8269c548174d69)We can support the `clip` in `Quartz`.

Zamlox

[21:25](#msg581513af0e25dbfa1176633b)@dockimbel I haven't done real tests in those graphic engines, but I think:

```
Skia
```

can do it: you can run test code at https://gist.github.com/Zamlox/640a9cbc7a0bd074e45d6808edae3b04 in https://fiddle.skia.org/c/39987cc4b12a68dd554d897bd2177a41

```
Cairo
```

can do it: according to documentation https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-clip

[21:26](#msg581513f55a1cfa016e5eb449)and @qtxie can do it in

```
Quartz
```

:)

## Sunday 30th October, 2016

dockimbel

[04:38](#msg5815794ac3569a036e3354e1)@Zamlox Good news! Thanks for doing the extensive research on it.

pekr

[09:03](#msg5815b77a7b15d16e55c3a07d)Sorry for stupid question, but what is going new clipping method to allow? A faster clipping? A more precise one, in a sense allowing some special effects?

dockimbel

[10:41](#msg5815ce3d0e25dbfa1178b1c3)@pekr Custom-shaped clipping areas.

rebolek

[17:05](#msg58162854916993502e406224)Did you miss `stylize`? Well, I did, so I wrote one myself.

[17:05](#msg58162859e42192cd27e1a807)http://i.imgur.com/kZMwG5Z.png

greggirwin

[18:51](#msg5816413a806316005dd7cba9)I've thought about it too Bolek. Is it posted somewhere?

rebolek

[18:52](#msg581641596fcca9375dc76594)@greggirwin \[Here](https://gist.github.com/rebolek/fdf4cd77e5db1a992d59829358c2b6ad)

greggirwin

[18:54](#msg581641db83a2008d22ed1973)Thanks! Is there a reason you use both `function` and `/local`?

rebolek

[18:55](#msg58164210e42192cd27e1b525)I think that I just want to be safe ;)

greggirwin

[18:56](#msg58164265c3569a036e362941)So you're a "belt and suspenders" kinda' guy. ;^)

rebolek

[18:57](#msg58164288e42192cd27e1b530):smile:

JacobGood1

[21:33](#msg5816673c83a2008d22edcb3a)lol, belt and suspenders...

## Thursday 3th November, 2016

rebolek

[07:52](#msg581aecbfaa8f8c4b328e5939)Anyone can help me making a pull request for the STYLIZE branch? I’m bit lost...

Zamlox

[07:54](#msg581aed382d4796175f3a08e7)How I usually do it is: I upload changes into master branch of my red fork and then I press 'New pull request' button (near combo where you can select branches)

rebolek

[07:55](#msg581aed684aeee0634dc0d705)@Zamlox I have some other changes in my master branch, so I can’t do it from there and want to do it from my other branch.

[07:55](#msg581aed83aa8f8c4b328e59ca)But GitHub web GUI doesn’t seem to support that.

Zamlox

[07:56](#msg581aedc831c5cbef43ad706e)I'm doing it via GitHub web page

rebolek

[07:57](#msg581aede2aa8f8c4b328e59d2)Yep, me too.

Zamlox

[07:57](#msg581aede22d4796175f3a0c48)select the branch which you want to use for PR, then press that 'New pull request' button

rebolek

[07:59](#msg581aee494aeee0634dc0d723)Hm, now I see that my \*stylize* branch is based on my \*master\*, not on \*red/master\*, so I have to fix it anyway and remove the other changes.

Zamlox

[07:59](#msg581aee652d4796175f3a0e78)all right.

[08:00](#msg581aee81eed0c3125f2e1357)you can move them to another branch, if you don't want to loose them

rebolek

[08:00](#msg581aeea7b4046d90642b5474)I can, but how then I reset my \*master* to be same as \*red/master\*?

Zamlox

[08:03](#msg581aef5945c9e3eb43f0bce8)One way to do it is:

```
git fetch origin
git reset --hard origin/master
```

with these instructions you will loose your local master changes. So save them to another branch before executing.

rebolek

[08:03](#msg581aef6eb4046d90642b5492)@Zamlox thanks, going to try it.

[08:05](#msg581aefe3aa8f8c4b328e5a1d)@Zamlox this expects that \*origin* is \*red/red\*, not my origin, right?

Zamlox

[08:07](#msg581af0322d4796175f3a1cd7)well, it is your origin (your forked red), I thought you want synchronize with your forked red.

rebolek

[08:07](#msg581af03a4aeee0634dc0d7b0)Yes

[08:07](#msg581af046b4046d90642b54b5)Ok then, let me try it...

Zamlox

[08:09](#msg581af0cd2d4796175f3a205f)if you want to synchronize your forked red with upstream red (red/red) then here is a link how to do it: http://stackoverflow.com/questions/7244321/how-do-i-update-a-github-forked-repository

rebolek

[08:17](#msg581af2a1aa8f8c4b328e5ad4)Hm, I guess that the simplest way would be to delete everything and start again.

Zamlox

[08:18](#msg581af2c7c2f2cf7275c3efb9)well, that's also a solution.

rebolek

[08:27](#msg581af4e50d42ea911cbda046)Delete was faster ;) Pull request done.

pekr

[08:47](#msg581af987e097df7575647dae)@rebolek so you're still playing with GUI? :-)

rebolek

[08:54](#msg581afb53c2f2cf7275c41dca)@pekr I am playing with lot of things ;) I just think that others may find `stylize` useful.

DideC

[09:57](#msg581b0a0745c9e3eb43f141b5)Yes I do ;-)

WiseGenius

[13:49](#msg581b405945c9e3eb43f2738a)Say I have the following function:

```
f: function [][
	view [text "a"]
	view [text "b"]
]
```

If I click the button in the following code, window “b” doesn't open until window “a” is closed:

```
view [button [f]]
```

But if I want the button to close the original window, using this code:

```
view [button [unview f]]
```

Now windows “a” and “b” are both opened at the same time instead of consecutively. Should I be expecting this? If so, why?

Rebol2Red

[14:12](#msg581b45d62d4796175f3c1153)Am i doing something wrong here? (Not according to the draw reference: https://dockimbel.gitbooks.io/red/content/v/v0.6.0/gui/Draw.html#image)

```
picture: make image! 100x100
repeat i 500 [picture/(i + 5000): hex-to-rgb #00ff00]
view [base 400x400 transparent draw [image picture 255.255.255]]
```

\*\** Script Error: invalid Draw dialect input at: \[255.255.255]

\*\** Where: ???

```
picture: make image! 100x100
repeat i 500 [picture/(i + 5000): hex-to-rgb #00ff00]
view [base 400x400 transparent draw [image picture 255.255.255]]
view [base 400x400 transparent draw [image picture 0x0 100x0 0x100 100x100 255.255.255]]
```

\*\** Script Error: invalid Draw dialect input at: \[255.255.255]

\*\** Where: ???

I also think this is wrong in the reference:  
"If the image has positioning information provided,  
then the image is painted at 0x0 coordinates."

Must be:  
"If the image has positioning information provided,  
then the image is painted at the given coordinates."

or

"If the image has no positioning information provided,  
then the image is painted at 0x0 coordinates."

Am i right?

Note:  
If i want more images then the error prevents it  
I have the latest automated build

[15:00](#msg581b50fdeed0c3125f3061d6)The code which should make the white of the images transparent:

```
picture1: make image! 100x100
picture2: make image! 100x100
repeat i 500 [picture1/(i + 5000): hex-to-rgb #00ff00]
repeat i 500 [picture2/(i + 5000): hex-to-rgb #0000ff]
view [base 400x400 transparent draw [image picture1 0x0 255.255.255 image picture2 0x100 255.255.255]]
```

This works but obviously no transparency:

```
picture1: make image! 100x100
picture2: make image! 100x100
repeat i 500 [picture1/(i + 5000): hex-to-rgb #00ff00]
repeat i 500 [picture2/(i + 5000): hex-to-rgb #0000ff]
view [base 400x400 transparent draw [image picture1 0x0 image picture2 0x100]]
```

So the only differences are the transparency tuples which gives an error

geekyi

[15:24](#msg581b56c1aa8f8c4b328e830b)&gt;

```
view [base 400x400 transparent draw [image picture 255.255.255]]
```

looks wrong syntax  
&gt;

```
view [base 400x400 transparent draw [image picture 0x0 100x0 0x100 100x100 255.255.255]]
```

looks like a bug

Rebol2Red

[15:35](#msg581b5947c2f2cf7275c64824)You are right. I will post an issue about the bug.  
What should i do about wrong things in a reference?

geekyi

[15:44](#msg581b5b760d42ea911cbdca02)You mean documentation?

Rebol2Red

[15:45](#msg581b5b7ceed0c3125f30a270)Yes

geekyi

[15:45](#msg581b5b8daa8f8c4b328e85b1)File a bug / pull request in the docs repo

[15:45](#msg581b5bb40d42ea911cbdca19)https://github.com/red/docs/issues

dockimbel

[16:02](#msg581b5f7d31c5cbef43affe2b)@qtxie Please have a look at above questions about `image` syntax in Draw.

greggirwin

[18:01](#msg581b7b9231c5cbef43b0b8e1)@WiseGenius, not clear to me what might cause the difference.

rebolek

[18:46](#msg581b8606aa8f8c4b328e98c6)Bug in the STYLIZE pull request fixed. Now it works fine and can be merged IMO.

## Friday 4th November, 2016

planetsizecpu

[18:19](#msg581cd12be097df75756eeaf9)\[!\[blob](https://files.gitter.im/red/red/gui-branch/XyvF/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/XyvF/blob)

[18:19](#msg581cd13445c9e3eb43faf909)@dockimbel it is strange, today I downloaded latest exe version for windows:

red&gt;&gt; about  
Red 0.6.1 - 4-Nov-2016/19:06:40+1:00  
red&gt;&gt;

and got an avast false-positive looking like Win32: Evo-gen \[susp]  
on the first run. After I added red.exe to white list all goes well and  
run normal

[18:21](#msg581cd1932d4796175f44b54c)as we seen on image

rebolek

[23:54](#msg581d1fc80d42ea911cbe46fb)Trying to display image in Draw can crash Red, unfortunately the Draw block (or whole window) must be sufficiently complicated to reproduce this. I try to isolate it.

[23:58](#msg581d20ab4aeee0634dc186f7)So no images in Rich Text now :cry:

## Saturday 5th November, 2016

rebolek

[07:18](#msg581d87bd0d42ea911cbe4f88)How do I detect an away event?

dockimbel

[09:24](#msg581da56b45c9e3eb43fe6eca)`event/away?` in `over` event.

rebolek

[09:47](#msg581daac24aeee0634dc193c1)Thanks, I will try it.

dockimbel

[13:41](#msg581de18ac2f2cf7275d2c0a3)@planetsizecpu Your app looks interesting, is it reactive?

rebolek

[13:50](#msg581de38db4046d90642c154d)@dockimbel away works fine, scroller style now can fade in and out like in all cool guis ;)

[13:51](#msg581de3f40d42ea911cbe5997)btw, have you took a look at STYLIZE? I’m using it and IMO there are no problems, so it can be merged.

dockimbel

[14:16](#msg581de9bf6cb72076303c739f)I haven't yet had a time to look at it.

rebolek

[14:22](#msg581deb2caa8f8c4b328f1723)Ok.

planetsizecpu

[18:31](#msg581e257ae097df757574a411)@dockimbel yes, the blue area has rate &amp; on time, a powerful tool. Last weeks I went busy, so no time for learning red, but I still here!

[18:31](#msg581e259c6cb72076303d89ca)you cant try it as my only repo for now :), I'm looking forward for android compiler ha ha

## Monday 7th November, 2016

planetsizecpu

[06:53](#msg582024f631c5cbef43c580b2)Ah, I forgot that controls also react while text is running. I wonder that 7kb of code never had such power in past languages ;)

rebolek

[09:08](#msg58204473b4046d90642c7b53)Some fun in five lines:

[09:08](#msg582044740d42ea911cbeb8fc)http://i.imgur.com/dTUIyGn.gif

dockimbel

[09:13](#msg582045c345c9e3eb43092642)@rebolek That's great, can you share the code?

rebolek

[09:19](#msg58204719b4046d90642c7bc8)@dockimbel Thanks. You can get it \[here](https://github.com/rebolek/gritter/blob/stylize/mamator.red). It needs some files from Gritter (Markdown parser, Rich text emitter and fonts dialect), so I put it in that repo.

qtxie

[12:27](#msg58207327e097df75757e98cb)@rebolek Nice! :+1:

rebolek

[12:31](#msg5820742eaa8f8c4b328f7b75)@qtxie Thanks ;)

DideC

[12:34](#msg582074cce097df75757ea369)Is it possible to update a face from some R/S code without leaving the R/S function ?  
(Ie: in the raytracer program, to update a progress bar or whatever)

rebolek

[12:35](#msg582075194aeee0634dc20eb6)@DideC You can use `#call [Red code goes here]` from R/S

dockimbel

[13:13](#msg58207ddde097df75757ed61b)@DideC Sure, you can use the View internal API from \[here](https://github.com/red/red/blob/master/modules/view/backends/platform.red). Though, for updating the face, you need to set the `face/state/2` bit array properly.

DideC

[13:14](#msg58207e23eed0c3125f4888d2)OK, thanks. But, Compiler error out if a Red func used in the `#call`is define after he R/S routine! (I can understand that).  
It compile if I define it before the routine!, but the .exe does not run anymore.

rebolek

[13:15](#msg58207e6c4aeee0634dc2111d)@DideC that is strange. I am updating face form R/S and it works fine. Unfortunately, I do not have some simple example to show.

dockimbel

[13:15](#msg58207e866cb7207630479b85)You can try putting the code in a function in a `#system` block, then call that function from the routine (so you split the definition and calling places).

DideC

[13:18](#msg58207f1ae462097a301b6bf3)A bit of context : as an experiment, I try to add a kind of progress to the Mufferaw rayTracer program.

[13:19](#msg58207f7d6cb720763047a04b)All R/S code is defined in `#system-global`. I just add a line `#call [update-progress]` in the `Render` function.

[13:21](#msg58207fc4eed0c3125f48930b)`update-progress` is a function that update value in a face/draw block.

greggirwin

[18:06](#msg5820c2b6e462097a301d2c66)Nice @rebolek !

rebolek

[18:07](#msg5820c2e24aeee0634dc23166)@greggirwin thanks!

greggirwin

[18:10](#msg5820c39d31c5cbef43c927e6)In the past, I've wondered how it might work to have a plain text editor, with the processed text displayed separately, like this. Markdown and simple syntax highlighting are good tests, but I'm really thinking of higher level symbolic analysis and visualization.

rebolek

[18:11](#msg5820c3c84aeee0634dc2317b)What higher level do you have in mind?

greggirwin

[18:11](#msg5820c3d9c2f2cf7275e0169a)It's not that having those things inline is necessarily bad, but that it makes the editor component so much more complex.

rebolek

[18:12](#msg5820c4294aeee0634dc23185)But with plain text editor, what other options you have?

greggirwin

[18:13](#msg5820c466e462097a301d35e9)For example, you could have a mini-map of the code. As you navigate into a function, the map highlights all the places that function is used, and they are links you can click. In reverse, the map could show things the current function references.

[18:14](#msg5820c477c2f2cf7275e01a27)&gt; But with plain text editor, what other options you have?

[18:14](#msg5820c47e45c9e3eb430c0830)I don't understand the question.

[18:16](#msg5820c50978ec59ab0544344d)Another example would be test runners. You could have a panel that showed test results for various inputs, spec'd or random, as you work on a func. I was thinking about doing a `function lab` app for this too.

rebolek

[18:17](#msg5820c534b4046d90642cb42f)Oh, OK. I understood you bad, ignore my question.

greggirwin

[18:17](#msg5820c545c2f2cf7275e020c8)Ah, OK. :^)

rebolek

[18:18](#msg5820c58d0d42ea911cbeec19)Well, it’s possible, I guess. The Rich text view is certainly not limited to Markdown. It’s the same component that is used in Gritter.

greggirwin

[18:19](#msg5820c5b06cb720763049734a)If the x-ref viz can see who calls the func, it can see who calls \*those* funcs as well. So you could have your tests trickle up to see when a change to the current func breaks a caller.

rebolek

[18:20](#msg5820c5d20d42ea911cbeec35)It translates Markdown to (subset of) Lest and then Lest is translated to Rich text dialect (RTD). RTD is then transformed into Draw commands. So the source can be basically anything, not just Markdown.

greggirwin

[18:21](#msg5820c61e6cb720763049754d)Exactly. While we will surely have a rich text editor to do all this, how far can it go, and how complex does it get?

rebolek

[18:23](#msg5820c6970d42ea911cbeec8c)BTW, this Rich text viewer (sans Markdown and Lest part) is just some 150 lines.

greggirwin

[18:23](#msg5820c6bce462097a301d48b8)Separating the two may be a natural progression, because things will start with a plain text editor anyway. From there we may get an optional, structured format.

[18:24](#msg5820c6cb78ec59ab05443eb4)150 lines. Wow.

rebolek

[18:26](#msg5820c73aaa8f8c4b328f9c62)I’ve been thinking about turning it into editor, but I probably won’t do it. Without things like baseline info in font! object, it makes little sense.

[18:26](#msg5820c75fb4046d90642cb4b4)This is all, this does all the placement and wrapping: https://github.com/rebolek/gritter/blob/stylize/rich-text.red

greggirwin

[18:27](#msg5820c777e462097a301d4cda)Another approach is the spreadsheet model, where each cell has a \*source* and \*evaluated/rendered* view. Hit F2 to edit, see the raw data, then view as a graph, etc.

rebolek

[18:27](#msg5820c77a0d42ea911cbeeccf)And it can probably be optimized I think ;)

greggirwin

[18:29](#msg5820c81be097df757580b05a)Nice. Simple is good.

rebolek

[18:30](#msg5820c8530d42ea911cbeed32)Yup. And even if it’s so simple, it can support things like on-over and on-click for each text block.

[18:32](#msg5820c8b3aa8f8c4b328f9cfa)What I am going to do, is fixed-font edit area with color support. That will be ideal for code editor and that’s what I care about. I’m not going to write Word-killer ;)

greggirwin

[18:33](#msg5820c9006cb720763049863b)Cool.

rebolek

[18:34](#msg5820c91a0d42ea911cbeeeb8)Based on the Rich Text dialect, I’m quite certain, that it would be pretty easy to do.

dander

[19:33](#msg5820d70a4aeee0634dc23746)@greggirwin, @rebolek, Have you guys seen \[Jupyter](https://jupyter.org/)? I haven't played with it too much, but some of your discussion made me think of that.

rebolek

[20:16](#msg5820e12db4046d90642cbcf7)@dander No, I haven’ seen it. It looks really interesting.

[20:19](#msg5820e1d6aa8f8c4b328fa4d9)Doing something like that for Red shouldn’t be hard.

kaipeters

[20:46](#msg5820e831c2f2cf7275e0f60d)database: load %contacts.rdb ; uses 4 columns  
cdata: sort (extract database 4)

gui: [  
below  
text "Contacts:"  
names: text-list 500x100 data cdata

[20:48](#msg5820e8b9c2f2cf7275e0f89f)works well enough. How do I replace cdata for the text list with the code from outside of the GUI DSL without offending the GUI DSL? I believe I have tried everything, but that clearly must not be true...

greggirwin

[20:51](#msg5820e94ddf5ae96645298d5b)Not sure exactly what you mean @kaipeters. Can you provide a more complete example?

[20:55](#msg5820ea4ec2f2cf7275e1052a)@dander, I have some tabs open on Jupyter. Someone posted about it not long ago. The notebook idea is along the lines of some others, like Wolfram stuff, and where I see Red as being very effective. A Red notebook model wouldn't be too hard. There are some nice old R2 demos (EasyVID and EasyDraw) that were living documents. I hacked them to make a book proposal to O'Reilly many years ago. They thought it was cool, but no market for a Rebol book.

kaipeters

[21:01](#msg5820ebb9df5ae96645299b05)@greggirwin : replace cdata in the last line of my sample code with 'sort (extract database 4)'

dander

[21:10](#msg5820edcb0d42ea911cbf0114)@greggirwin it seems like Red could even be a good fit as a language inside Jupyter. Though the main reason I thought of it was how it mixes code and markup together

kaipeters

[21:28](#msg5820f1f345c9e3eb430d3844)Complete:

[21:28](#msg5820f1f56cb72076304a83b0)RED \[needs: 'gui]

database: load %contacts.rdb ; uses 4 columns  
;cdata: sort (extract database 4)

gui: [  
below  
text "Contacts:"  
names: text-list 500x100 data \[sort (extract database 4)] ; items do not show in list  
]  
view gui

greggirwin

[22:16](#msg5820fd3c31c5cbef43ca8b29)@kaipeters, `compose` it in.

```
RED [needs: 'gui]
database: ["a" "b" "c" "d" "1" "2" "3" "4"]
gui: compose/only [
	below
	text "Contacts:"
	names: text-list 500x100 data (sort extract database 4)
]
view gui
```

[22:20](#msg5820fe1245c9e3eb430d8314)It's a slight change from R2, in that parens are not automatically evaluated by VID.

[22:23](#msg5820fec545c9e3eb430d86fa)@dander, yes. An interesting question, in light of other tools using Markdown as a format, is how much structure is enough. Or how strong a spec do we need. Red gives us the ability to create something between Markdown and JSON, which is strict, structured, and easy to use.

kaipeters

[23:42](#msg5821115e45c9e3eb430df57e)@greggirwin : Thanks - that's the part that was missing

## Tuesday 8th November, 2016

WiseGenius

[05:16](#msg58215f9ddf5ae966452bf040)What is the format of `request-file`'s `list`?  
Both of these guessed lines crash Red:

```
request-file/filter [("jpeg" %.jpeg)]
request-file/filter [("jpeg" "*.jpeg")]
```

PeterWAWood

[05:54](#msg58216892c2f2cf7275e34435)Try this:

```
request-dir/filter [%.jpg %.jpeg %.png]
```

[05:55](#msg582168d0c2f2cf7275e344c1)@qtxie When I tried ^^^, the file requester opened but not in the current working directory.

[05:56](#msg582168f778ec59ab054781ae)\[!\[Screen Shot 2016-11-08 at 13.53.44.png](https://files.gitter.im/red/red/gui-branch/3VTz/thumb/Screen-Shot-2016-11-08-at-13.53.44.png)](https://files.gitter.im/red/red/gui-branch/3VTz/Screen-Shot-2016-11-08-at-13.53.44.png)

[05:56](#msg5821691c31c5cbef43cc5f91)The current working directory was E:\\Red\\red.

[05:56](#msg58216924c2f2cf7275e345d4)Is that the expected behaviour?

[05:58](#msg5821696978ec59ab0547837a)@WiseGenius I also experienced the gui-console silently crashing when the filter list was incorrect.

Phryxe

[05:58](#msg5821697545c9e3eb430f5803)`RED [needs: 'gui]`!?

PeterWAWood

[06:02](#msg58216a6031c5cbef43cc6488)@WiseGenius @qtxie Sorry I typed

```
request-dir
```

instead of

```
request-file
```

.

This works but opens the Documents dir:

```
red>> request-file/filter [%.jpg %.jpeg %.png]
```

[06:02](#msg58216a7fe097df757583f88a)\[!\[Screen Shot 2016-11-08 at 14.00.08.png](https://files.gitter.im/red/red/gui-branch/WTKI/thumb/Screen-Shot-2016-11-08-at-14.00.08.png)](https://files.gitter.im/red/red/gui-branch/WTKI/Screen-Shot-2016-11-08-at-14.00.08.png)

WiseGenius

[06:33](#msg582171c0e462097a3020a22c)@PeterWAWood Thanks. That format doesn't crash.  
@qtxie However, although that works on Windows 7, Windows XP still displays all the files without filtering them.

[06:35](#msg5821722de462097a3020a47a)How would one include multiple masks in a single filter? For example, when opening files in MS Paint, one of the filters is “All Picture Files” besides the individual type filters. Or is this still to be designed/written?

qtxie

[06:35](#msg5821723cc2f2cf7275e369b8)@WiseGenius Here is the spec of the `/filter` argument:

```
[
    description-1 file-extensions-1
    description-2 file-extensions-2
    ......
]
description: (string!) Describes the filter (for example, "Text Files")
file-extensions: (string!) Specifies the filter pattern (for example, "*.TXT"). 
To specify multiple filter patterns for a single display string, 
use a semicolon to separate the patterns (for example, "*.TXT;*.DOC;*.BAK")
```

[06:38](#msg582172fec2f2cf7275e36d49)For example:

```
request-file/filter [
    "All Pictures Files" "*.jpg;*.png;*.gif"
    "Red Source Files (red;reds)" "*.red;*.reds"
]
```

WiseGenius

[06:47](#msg58217511e097df75758423e1)@qtxie Thanks. That works well on both. Where was that spec quoted from?

qtxie

[06:48](#msg58217542c2f2cf7275e3782c)I wrote it just now. ;-)

rebolek

[06:58](#msg5821778b0d42ea911cbf1861):smile:

WiseGenius

[06:59](#msg582177c5e462097a3020b983)Haha! I was so close to getting it in the first place from `? request-file`, but I had `[("jpeg" "*.jpeg")]` instead of `["jpeg" "*.jpeg"]` because I mis-read the parenthesis in the description as needing to delimit multiple filters with `paren!`s:

```
/filter  => Block of filters (filter-name filter). 
         list   [block!]
```

I don't suppose anyone else would make that mistake, though.

qtxie

[07:09](#msg58217a1045c9e3eb430f9ee5)Anyway we should put those detail docs somewhere online. It's the same case for `write http`, I always forgot the spec. :sweat:

WiseGenius

[07:14](#msg58217b736cb72076304cf246)I think it's also because I was expecting it to be in a sort of form like:

```
request-file/filter [
	["All Pictures Files" "*.jpg;*.png;*.gif"]
	["Red Source Files (red;reds)" "*.red;*.reds"]
]
```

Since this seems neater, to me:

```
a-reusable-picture-filter: ["All Pictures Files" "*.jpg;*.png;*.gif"]
request-file/filter reduce [a-reusable-picture-filter]
```

Than this:

```
a-reusable-picture-filter: ["All Pictures Files" "*.jpg;*.png;*.gif"]
request-file/filter reduce [a-reusable-picture-filter/1 a-reusable-picture-filter/2]
```

rebolek

[07:16](#msg58217bc70d42ea911cbf18d9)@WiseGenius

```
a-reusable-picture-filter: ["All Pictures Files" "*.jpg;*.png;*.gif"]
request-file/filter reduce a-reusable-picture-filter
```

[07:17](#msg58217bf30d42ea911cbf18ec)Actually, you don’t have to reduce it.

WiseGenius

[07:19](#msg58217c84e097df7575844b04)@rebolek

```
a-reusable-picture-filter: ["All Pictures Files" "*.jpg;*.png;*.gif"]
a-reusable-red-filter: ["Red Source Files (red;reds)" "*.red;*.reds"]
request-file/filter reduce [
	a-reusable-picture-filter
	a-reusable-red-filter
]
```

rebolek

[07:20](#msg58217ccb0d42ea911cbf1919)In this case use `compose`.

[07:25](#msg58217ddf0d42ea911cbf1970)

```
a-reusable-picture-filter: ["All Pictures Files" "*.jpg;*.png;*.gif"]
a-reusable-red-filter: ["Red Source Files (red;reds)" "*.red;*.reds"]
request-file/filter compose [
    (a-reusable-picture-filter)
    (a-reusable-red-filter)
]
```

WiseGenius

[07:40](#msg5821816345c9e3eb430fbe70)@rebolek Thanks. I don't think I'd ever found a use for `compose` before. Of course, I'm still a newbie, so I'm sure I'll soon find others now that I have one.

rebolek

[07:58](#msg582185b00d42ea911cbf1b28)@WiseGenius sometimes it’s better to use `compose`, sometimes `reduce`.

endo64

[08:52](#msg58219254df5ae966452ceb14)A useful difference of `compose` over `reduce` it prevents inner blocks:

```
a: [1 2] b: [x y] c: [3 4]
reduce [a b]
; == [[1 2] [x y]]

compose [(a) (b)]
; == [1 2 x y] ;no inner blocks

;and deep refinement of course
compose/deep [(a) (b) [(c)]]
== [1 2 x y [3 4]]
```

rebolek

[08:53](#msg582192a70d42ea911cbf222b):+1:

greggirwin

[11:02](#msg5821b0b145c9e3eb4310b9fd)But `compose/only` \*maintains* inner blocks, and `compose/deep` is nice if you have nested blocks. I use `compose` and `reduce` about equally, I think.

rebolek

[11:25](#msg5821b60c0d42ea911cbf2c19)Same here. They both are useful. AFAIR, I don’t use `compose/only`.

[21:32](#msg5822448b35e6cf0547732050)@greggirwin yesterday I wrote that I’m quite certain that editor in Draw would be quite easy.

[21:33](#msg5822449535e6cf0547732053)So, here it is:

[21:33](#msg58224496c2c2b0744e335bf7)http://i.imgur.com/mF0RNy1.gif

[21:34](#msg582244e7c48663546179014c)It is fully capable of syntax highlighting, but no rules are implemented yet.

greggirwin

[22:45](#msg58225577c2f2cf7275e888a4)Go Bolek Go! (I never doubted you ;^)

qtxie

[22:59](#msg582258d1e462097a3025b0e5)@rebolek Great! That's what I want to implement. :smile:

rebolek

[23:12](#msg58225bd9d695f5db0f4d6372)@qtxie You don’t have to ;)

[23:18](#msg58225d39c4866354617907ab)@greggirwin Thanks :smile: I had the model in mind for some time, but it was the Jupyter that made me to do it.

## Wednesday 9th November, 2016

Zamlox

[04:37](#msg5822a80145c9e3eb4315e2e9)@rebolek good work ;)

planetsizecpu

[08:36](#msg5822e013e097df75758b7830)@rebolek Well done!

rebolek

[09:05](#msg5822e6e4c2c2b0744e33751b)@planetsizecpu @Zamlox Thanks guys. Actually, it’s just a prototype, but IMO it’s a good foundation for something much better.

DideC

[12:06](#msg5823114831c5cbef43d4baa1):point\_up: \[7 novembre 2016 14:18](https://gitter.im/red/red/gui-branch?at=58207f1ae462097a301b6bf3)  
@dockimbel \[Here](https://github.com/DideC/Red-Raytracer/commit/30fb1699e271897331b44e2c0cf258dea417cb47) is a commit that show what I'm unable to do reliably while calling Red view updates from R/S code.

## Thursday 10th November, 2016

Zamlox

[03:06](#msg5823e42cc2f2cf7275f06aba)@dockimbel @qtxie I would need some additions to

```
draw
```

dialect related to my

```
svg
```

work:  
1\) Currently

```
draw
```

dialect executes a sequence of transformations by appending them to world transformation matrix. I would need a way to specify how to do that (append or prepend). I was thinking that perhaps we can define a

```
matrix-order
```

command with one parameter having following values:

```
append
```

,

```
prepend
```

. For

```
svg
```

I would need to use

```
prepend
```

not

```
append
```

otherwise I cannot map correctly sequence of transformations from

```
svg
```

to

```
draw
```

2\) Currenlty

```
clip
```

command is implemented so that a new

```
clip
```

command will replace a previous

```
clip
```

command. I would need a way to control this behavior by being able to specify that a new

```
clip
```

command should interact with a previous

```
clip
```

command by intersecting it not replacing it. I was thinking to define anew

```
draw
```

command like

```
clip-type
```

with one parameter having following values:

```
replace
```

```
intersect
```

(and perhaps other values like

```
union
```

```
xor
```

```
exclude
```

```
complement
```

).  
Let me know if these are ok for you. If yes I can do the changes and prepare a PR, if not tell me how else I can do it.

DideC

[08:58](#msg582436aa31c5cbef43dac30c)`clip` is not documented, so I don't know it's current syntax, but maybe the "type" of clipping could just be a new optionnal parameter to it (?!).

dockimbel

[10:18](#msg582449676cb72076305bd3e6)@Zamlox For 1), why can't you just reverse the order of your matrix transformations when you need it to be prepended?

[10:27](#msg58244b88e097df75759307ce)For 2), an optional "mode" argument in `clip` would avoid adding a new argument. Would that fit the needs?

[10:44](#msg58244f8f65485ebc67796454)@Rebol2Red Asking for help with code should be done in `red/help` room.

Rebol2Red

[10:46](#msg58245002c2f2cf7275f27614)I will do

dockimbel

[10:51](#msg5824511d65485ebc67797709)Thanks.

Zamlox

[13:55](#msg58247c6945c9e3eb431f8111)@dockimbel @DideC yes, an extra parameter for

```
clip
```

command would suit my needs for 2)

[13:56](#msg58247c75e097df7575942d40)for 1) check my explanation at: https://gist.github.com/Zamlox/b835c4856058192827e0445f646e2e9d

[19:05](#msg5824c511df5ae966453ea087)@dockimbel I created a branch 'reversed' and I'm continuing with reversed transformations using reset-matrix.

[19:06](#msg5824c552e097df757595fedd)it might be that there will not be needed to do too many matrix operations

qtxie

[23:15](#msg5824ff976cb7207630603f0a)I think it's worth to add the `matrix-order` command if it's make our life much easier.

[23:17](#msg5824fff9e097df75759752ad)Or add an optional "order" argument in all the `matrix operation` commands.

## Friday 11st November, 2016

Zamlox

[05:12](#msg58255354e462097a30352632)@qtxie all right. I will do that.

rebolek

[05:20](#msg58255532818fbb8a63c2880a)When drawing `box`, I can specify `corner` for rounding edges. Is something like that available for `polygon` too?

Zamlox

[05:26](#msg5825567865485ebc677f18ff)I think no, but you might be able to do it using

```
shape
```

dialect.

[05:27](#msg582556b1df5ae9664541587f)by drawing the polygon and roundings using

```
shape
```

commands

rebolek

[05:28](#msg58255708f027c16d0fbcb383)Hm. Do I have to specify all rounding manually, or is there something that does it automatically? I haven’ used `shape` in very, very, very looong time... :)

Zamlox

[05:28](#msg582557186cb72076306187e1)you must do it manually :)

rebolek

[05:29](#msg5825574b818fbb8a63c28851)Ok, then I won’t bother with it right now ;)

[09:09](#msg58258ab6895979485a7ee6bf)Who needs native widgets, when we’ve got Draw. Draw is cool.

[09:09](#msg58258ab898d63ff57f22531e)http://i.imgur.com/U24nQ1s.gif

pekr

[09:13](#msg58258bd365485ebc6780072a)Ah, so we are going back the R2 route, implementing all our widgets ourselves? :-) Well, the problem is, that it never ever worked satisfactory enough (in an OS compatible way)

rebolek

[09:14](#msg58258bfc895979485a7ee6ee)Nah, not R2 way :) But does native area has syntax highlighting? It does not.

[09:15](#msg58258c3ef027c16d0fbcbb25)Also, if you look at something like Sublime editor, there’s basically just menu native.

pekr

[09:16](#msg58258c5431c5cbef43e18371)Well, but you know me - I am demanding - want all keyboard shortcuts to work too. shift-end, shift-home, ctrl-arrows, shift + page-donw/up etc. for text hiliting

rebolek

[09:17](#msg58258c99818fbb8a63c2924a)I can understand that. Otherwise it makes not much sense to have it.

pekr

[09:17](#msg58258cab65485ebc67800b42)Well, maybe I am not that much demanding, but used to at least some ...

[09:18](#msg58258cf3df5ae966454246a1)E.g. Red GUI console allows shift + home/end for hiliting (R2 concole can't do that). What I would welcome is move/hilite by word - ctrl + arrows (skip by word), eventually shift + ctrl + arrow (skip by word + hilite)

JenniferLee520

[09:32](#msg5825903d6cb7207630628336)Native Editor can work with IME, which is necessary in many countries for typing their local characters, including Chinese and Japanese. Draw cannot work with IME.

[09:34](#msg5825909365485ebc67801f40)IME = Input Method Editor.

[09:35](#msg582590e3c2f2cf7275f8fdeb)Or maybe it can? OSes do offer IME APIs.

qtxie

[09:53](#msg58259518818fbb8a63c29428)@JenniferLee520 Yes. We can work with IME in custom Red widget.

JenniferLee520

[10:45](#msg5825a147c2f2cf7275f94ced)That's Great! You guys rock!

Zamlox

[12:19](#msg5825b753e462097a3036da6c)@rebolek cool indeed ;)

## Saturday 12nd November, 2016

dander

[01:51](#msg5826759f3888720c2799ca1e)@rebolek, looks like you are having great progress! If you are looking for more inspiration, my favorite tool for experimenting in the C# world is \[LINQPad](https://www.linqpad.net/), and in particular the Dump facility, which is used to inspect any value/object

rebolek

[20:07](#msg58277687df5ae966454b1fc2)@Zamlox I tried using `shape` but I get error in macOS. I guess it isn’t implemented yet, is it?

Zamlox

[22:57](#msg58279e5c65485ebc67896697)@rebolek no, it isn't. Currently works only on Windows.

rebolek

[23:01](#msg58279f59df5ae966454be4fd)@Zamlox Thanks for confirmation.

Zamlox

[23:02](#msg58279f6bdf5ae966454be590);)

rebolek

[23:04](#msg58279ff531c5cbef43eaab55)Any plans? ;)

Zamlox

[23:05](#msg5827a036e462097a303f6155)well, I have no skills on mac land, only Windows andLinux. I can port on Linux but not soon.

rebolek

[23:07](#msg5827a0bc65485ebc67897189)Actually, there’s no official support for View on macOS and Linux yet, so wanting to have `shape` already may be bit premature ;)

[23:09](#msg5827a121c2f2cf727502610a)OTOH View on Mac is already good enough to let me work on some things directly under macOS, so I don’t have to switch to Win VM.

Zamlox

[23:10](#msg5827a17de097df7575a3077d)I don't have a Mac and I haven't worked with Quartz graphic engine. I cannot do implementation for that platform.

rebolek

[23:12](#msg5827a1d7e462097a303f70a5)No problem, I think somebody will take care of it. It’s wonderful to have `shape` support at least on one platform when Red is still in alpha.

Zamlox

[23:12](#msg5827a1e145c9e3eb432e548d)yep.

qtxie

[23:21](#msg5827a40588fa21d53c13f7a0)@rebolek I'll take care of it. :smile: BTW, Quartz and Cairo (which we used on Linux) are very similar.

Zamlox

[23:22](#msg5827a451df5ae966454c0708)@qtxie excellent ;)

[23:24](#msg5827a492c2f2cf7275026c1d)good to know Quartz and Cairo are similar.

## Tuesday 15th November, 2016

planetsizecpu

[11:36](#msg582af34be462097a30502de7)\[Rec1.mp4](https://files.gitter.im/red/red/gui-branch/GgGa/Rec1.mp4)

[11:37](#msg582af391e097df7575b3b303)Today I had time to save some frames, as people can view here how things are going while I am learning red, comments are welcome ;)

rebolek

[12:01](#msg582af91a0a085e6214cef67e)Nice!

planetsizecpu

[14:09](#msg582b16febd2f135f1a1eaec7)@rebolek Thx! I keep trying to learn when I have time

## Saturday 19th November, 2016

endo64

[20:40](#msg5830b8d8613368f619d361d6)What do you think about `after` word in RebGUI, I remember that it was useful:

```
after 2
label 20 "Name" field 50
label 20 "Address" field 50
```

It automatically adds return `after` every 2 widgets.

[22:10](#msg5830cdedb7cf637f2ac02945)rounded boxes has a glitch in `draw` if `line-width` is bigger than 1:

```
view [base 100x100 draw [line-width 6 box 30x30 70x70 3]]
```

[22:11](#msg5830ce265eb8ea792a3f8512)\[!\[blob](https://files.gitter.im/red/red/gui-branch/JUA9/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/JUA9/blob)

Zamlox

[22:12](#msg5830ce47238757566cca27a3)which platform ?

endo64

[22:12](#msg5830ce56297a180b4f157897)On Windows.

[22:13](#msg5830ce8d238757566cca288a)This happens in if `line-width` is 2 or more.

Zamlox

[22:14](#msg5830cebfb563b5516c3eda9d)looks good for me, but I have done some local fixes which are pending #2315:

[22:14](#msg5830cec6297a180b4f157a9c)\[!\[blob](https://files.gitter.im/red/red/gui-branch/EepJ/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/EepJ/blob)

endo64

[22:18](#msg5830cfcee712c9a1188a6241)Interesting, I tried with your version (just downloaded from github and compiled red.exe), I see no box at all.

[22:19](#msg5830cfd4b7cf637f2ac02fd9)\[!\[blob](https://files.gitter.im/red/red/gui-branch/Zoxe/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/Zoxe/blob)

[22:19](#msg5830cfebb563b5516c3edf73)Did you push your changes to your repo or done locally?

Zamlox

[22:19](#msg5830cffb2cf343a318c97126)they are in my repo, master branch

[22:20](#msg5830d013297a180b4f15808d)did you get any errors ?

endo64

[22:20](#msg5830d021613368f619d3c71f)No error.

Zamlox

[22:21](#msg5830d07cb7cf637f2ac0349f)try with

```
gui
```

branch

endo64

[22:22](#msg5830d08cb7cf637f2ac034dd)If I remove rounding integer! then it works:

```
view [base 100x100 draw [line-width 6 box 30x30 70x70]]
```

[22:23](#msg5830d0ea613368f619d3c9dc)Trying with gui branch...

[22:24](#msg5830d12a238757566cca343a)Same result:

```
view [base 100x100 draw [line-width 6 box 30x30 70x70 3]] ;no box
```

```
view [base 100x100 draw [line-width 6 box 30x30 70x70]] ;box
```

Zamlox

[22:25](#msg5830d171297a180b4f1587c7)interesting. For me it works also with

```
master
```

branch

endo64

[22:27](#msg5830d1e2b7cf637f2ac03ac5)Yes interesting.. I'm on Windows 10 x64. Let's wait for others to test. I can test on another pc (Win8) at work on Monday.

Zamlox

[22:28](#msg5830d1f8297a180b4f158a44)I have Win7 x64

## Sunday 20th November, 2016

endo64

[12:45](#msg58319aea297a180b4f187449)Another issue I found is event/offset value is changed to a negative value when I move mouse away from a face:

[12:45](#msg58319af6e712c9a1188d681b)\[!\[events.gif](https://files.gitter.im/red/red/gui-branch/mqGZ/thumb/events.gif)](https://files.gitter.im/red/red/gui-branch/mqGZ/events.gif)

Rebol2Red

[17:19](#msg5831db0c5eb8ea792a43e130)Has someone some better code for a progress bar?

```
view [
	button 350 font-size 20 "Start" [
		repeat n 100 [
			p/data: to percent! n
			wait 0.1 ; if this is too long as here, the program does not responds for a while
		]
                t/text: "Ready"		
	] 
	return 
	p: progress 350 data 0%
	return
	t: text 320 'center font-size 20 " "
]
```

greggirwin

[17:20](#msg5831db4a613368f619d7ec63)@endo64, the idea of `after` seems useful for a common case, but I don't care for the implicit nature of the word. e.g., `return-after` would be clearer. Other word choices, related to rows or cols, seem a little better in my head right now, but I don't know what the plan is for a canonical grid spec which might be better. Using `Rows` or `Cols` does mean having more than one keyword, but the convey a directional meaning, which would override `across/below`, which is problematic if you don't also define the end of the grid/table. Unless they use a sub-block spec. e.g. `rows 5 [...]`.

I also looked at the Cassowary system some time back, related to resizing.

[17:21](#msg5831dbaf238757566cce5c1f)@Rebol2Red, using `wait` inside event loops can be problematic, in all systems. Can you do it with a `rate` on a face?

Rebol2Red

[17:24](#msg5831dc435eb8ea792a43e907)@greggirwin I think i can. But this was the first which came up into my mind. Thought using something like view/no-wait and do-events would solve this.

greggirwin

[17:25](#msg5831dca0613368f619d7f40a)`Do-events` is the event loop. Picture that loop running, and then picture it stopping when it hits your `wait`, and \*all* events stop being processed while waiting.

[17:28](#msg5831dd2f238757566cce64f7)Internally, it will be much trickier, because `wait` isn't just sleeping and halting the system, necessarily.

Rebol2Red

[17:33](#msg5831de635eb8ea792a43fd47)What i want is this:  
I have about 159 files to read , some can take quite a long time. If the user sees nothing he can think the program is not working. I want to show it is. I don't care how to do this. But i want to use vid and not the console. Maybe the best way is a popup screen after reading?

greggirwin

[17:36](#msg5831df10b563b5516c4342eb)What about setting a rate on a face, and having a state machine, or even just a data structure, that tracks progress. In the timer event for the face, set the progress state based on that.

[17:37](#msg5831df3d5eb8ea792a440268)You don't even need the rate if you just update the progress as you work, remembering that Red is single threaded.

Rebol2Red

[17:38](#msg5831df7f613368f619d805c3) I thought i was doing that in the sample i have showed :)

greggirwin

[17:38](#msg5831dfad613368f619d806b4)Take out the `wait` and it should be fine.

Rebol2Red

[17:39](#msg5831dfe1613368f619d80780)But can i read files (which takes a while) instead of it?

greggirwin

[17:40](#msg5831dffb23ce1ae73c0592af)Yes.

Rebol2Red

[17:41](#msg5831e037b7cf637f2ac4850a)I had not tried it because i was testing the progress. I just choose wait instead of reading files.

greggirwin

[17:41](#msg5831e062b563b5516c434b37)Right, but it behaves differently.

Rebol2Red

[17:42](#msg5831e07023ce1ae73c059433)Thanks! This will saves me some time figuring out why things doesn't work as i was expecting.

greggirwin

[17:45](#msg5831e120b7cf637f2ac489cd)Happy to help.

endo64

[18:27](#msg5831eb2bb7cf637f2ac4c0a8):point\_up: \[November 20, 2016 3:45 PM](https://gitter.im/red/red/gui-branch?at=58319aea297a180b4f187449)  
Negative value in event/offset I mentioned above happens only if I write event/offset into a text field using `clear` and `insert` but not if I probe its value on console or set text value directly. Interesting.

```
mouse-move: function [face event] [
	insert clear lbl/text probe form event/offset  ; <-- lbl/text will have nagetive value -32x50
	lbl/text: form event/offset  ; no such a problem here
]

view compose/deep [
	base 300x300 all-over on-over :mouse-move
	lbl: text ""
]
```

Rebol2Red

[19:52](#msg5831fee323ce1ae73c064310)Reference View engine about progress says:  
"If a float value is used for data, it needs to be between 0.0 and 1.0"  
https://dockimbel.gitbooks.io/red/content/v/v0.6.0/gui/View.html#progress

This works:

```
view [button "start" [probe p/data p/data: p/data + 10%] p: progress data 0%]
```

This does not work:

```
view [button "start" [probe p/data p/data: p/data + 0.1] p: progress data 0.0]
```

Note: Ofcourse the data provided will be above 100% after 10 clicks but this should not be a problem

Am i doing something wrong here?

greggirwin

[20:49](#msg58320c58297a180b4f1ab02b)I imagine it's just a bug. The question I have is whether `progress` should coerce its data to percent! if given a float!.

Rebol2Red

[20:54](#msg58320d86b7cf637f2ac57c1e)Why not, range 0.0 to 1.0 is the same as 0 to 100%  
I will post an issue and use percents in the meantime.

## Monday 21st November, 2016

endo64

[06:56](#msg58329a9b238757566cd1c8a3)progress issue fixed by qtxie on latest build.

[06:57](#msg58329acde712c9a1189245bb)\[!\[blob](https://files.gitter.im/red/red/gui-branch/sSYk/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/sSYk/blob)

[06:58](#msg58329b2ab563b5516c469500)Rounded box has a glitch if line-width is bigger than 1 issue exists on both Win8 x64 and Win10 x64.

```
view [base 100x100 draw [line-width 6 box 30x30 70x70 3]]
```

[07:06](#msg58329d0e238757566cd1d421)@greggirwin about `after`, word is not important but functionality was very useful as I remember when I use RebGUI as a primary GUI system for my projects. I was grouping widgets with `panel` if necessary.

greggirwin

[07:15](#msg58329f26b563b5516c46a8bd)I think it would be particularly nice when generating UI layouts dynamically. e.g., if you want to wrap things differently, based on size.

qtxie

[07:17](#msg58329f7d23ce1ae73c0907ad)@endo64 Confirmed the line-width issue on Win10.

Rebol2Red

[09:43](#msg5832c1d6b563b5516c476c61)@qtxie Thanks for fixing progress issue!

endo64

[10:32](#msg5832cd46b7cf637f2ac8eda4)Thank you for confirmation @qtxie , I opened an issue #2345

[10:36](#msg5832ce11297a180b4f1e1bd5)@greggirwin Yes, useful for dynamically generated UI layouts. And most of the layouts have 2 columns (or 3 or 4 but fixed) like a label and a field. So it is useful for those layouts as well, instead of putting many `return`s.

## Wednesday 23th November, 2016

greggirwin

[22:38](#msg58361a7b16ee9e64047b3cdd)Different clipping due to `transparent`? Works without that.

## Thursday 24th November, 2016

ifgem

[15:48](#msg58370bbc8d65e3830e95dfbc)How can I add on-key to base?

rebolek

[20:00](#msg583746e11dec193f14e6db6f)VID killer app? Center an element both horizontally and vertically. CSS people would kill for it.

## Friday 25th November, 2016

virtualAlan

[03:04](#msg5837aa40444b377876530beb)I did this just for fun, but it could be useful .... http://www.mycode4fun.co.uk/red-apps

planetsizecpu

[07:32](#msg5837e91e444b377876540652)\[!\[blob](https://files.gitter.im/red/red/gui-branch/LwO5/thumb/blob.png)](https://files.gitter.im/red/red/gui-branch/LwO5/blob)

[07:34](#msg5837e9a38255fe6b76c7964b)@qtxie @Rebol2Red I tested your code as we see in the image, was interesting, but it is something strange in the values, I dont' know if it is related to probe.

qtxie

[08:37](#msg5837f82cc5bc35217da2f2d5)@planetsizecpu I think so. We use C's `sprintf`to convert `float!` to `c-string!`, sometimes we don't get the optimized output.

ifgem

[10:35](#msg583813e0444b37787654eb97)@qtxie sorry for repeating the question, but how to add on-key actor to base?

qtxie

[12:01](#msg583828188e29aeee601a179b)@ifgem Here the code:

```
view [b: base on-key [probe event/key] on-down [win/selected: b] do [win: self]]
```

ifgem

[12:53](#msg5838343fb9016e42149936dd)@qtxie thank you:))

qtxie

[12:57](#msg583835438e29aeee601a1af7)@ifgem You're welcome. By default the base face doesn't get the focus when click on it, we need to force it manully.

## Saturday 26th November, 2016

Zamlox

[01:41](#msg5838e8308255fe6b76cc7058)@qtxie can we add matrix transformation as parameter to gradient

```
fill-pen
```

(similar like angle and scale). It is needed for SVG.

qtxie

[07:23](#msg5839385d8e29aeee601a55d4)@Zamlox I made a proposal in \[here](https://github.com/qtxie/red/wiki/Create-Complex-Pen-in-Draw) about this topic. I prefer to add a `pen`/`fill-pen` parameter in existing transformation commands (`rotate`, `scale`, etc), it will apply the transforamtion to current pen/fill-pen.

The advantage is that if I just want to rotate the gradient pen, I don't need to create a new pen. It's more efficient.

Zamlox

[07:54](#msg58393fa0381827c24d818c41)@qtxie excellent ! I noticed you have added

```
spreadMethod
```

and focal point. Very nice. Any estimation when will be implemented ?

qtxie

[07:59](#msg583940ee38afd97d3b834073)For gradient, I think we have most of the code already. You can add it if you want. ;-)

[08:00](#msg5839412038afd97d3b834076)I remember that GDI+ doesn't support `pad` mode, I have no idea how to implement this mode.

Zamlox

[09:04](#msg5839500d1dec193f14f01630)all right, I will have a look on it later.

ifgem

[11:54](#msg583977ed444b3778765acb93)@qtxie how can I get font size in pixels?

Zamlox

[12:07](#msg58397b1216207f7b0ea948b0)try

```
size-text
```

on a face with text

ifgem

[12:49](#msg583984ca89d179bf4dc8b45c)@Zamlox thanks:)

## Sunday 27th November, 2016

justinthesmith

[04:56](#msg583a6780444b3778765ec263)Anyone know the current status of the Mac GUI?

rebolek

[05:24](#msg583a6e1a381827c24d869971)@jthsmith see the macGUI branch. It is not complete, it is not that hard to crash it, but OTOH it is usable enough to let me do some GUI dev work natively under macOS, without the need for Win VM.

qtxie

[07:31](#msg583a8bcc381827c24d86ff79)@ifgem As Zamlox said, the only way is to use `size-text` for now.

meijeru

[10:13](#msg583ab1ac8255fe6b76d36a4b)@qtxie In `modules/view/backends/windows/direct2d.reds` there is

```
#define ConvertPointSizeToDIP(size)
 (as float32! size / 72.0  * 94.0)
```

shouldn't that be `96.0`rather? See \[this link](https://msdn.microsoft.com/en-us/library/windows/desktop/ff684173.aspx)

qtxie

[10:20](#msg583ab36cb4d7ca3b7a1786a6)@meijeru Hmm, yes, it should be `96.0`, let me have a check...

asampal

[10:26](#msg583ab4da8e29aeee601a8677)@qtxie typo in `ConvertPointSizeToDIP()` -&gt;`ConvertPointSizeToDPI()`?

qtxie

[10:35](#msg583ab6e4c5bc35217da36a49)@asampal Ah, thanks. :-)

asampal

[10:37](#msg583ab7518e29aeee601a86c5)@qtxie also, could the 96 be a configurable value? Many displays have a lot higher DPI than that these days.

[10:38](#msg583ab7978e29aeee601a86d4)I'm assuming eventually you'll use an API to get a more correct value, but until then some kind of settable value would be more flexible, no?

meijeru

[10:51](#msg583aba9c8255fe6b76d38c99)The link contains some further instructions about DPI-aware applications, to improve the picture quality on better displays .

Zamlox

[11:09](#msg583abed473abd79c55a0795f)@asampal @qtxie

```
ConvertPointSizeToDIP()
```

it's not a typo. It converts point to DIP (Device Intependent Pixel) which is needed for

```
IDWriteFactory/CreateTextFormat
```

(the sixth parameter must be in DIP)

## Tuesday 29th November, 2016

qtxie

[07:16](#msg583d2b4e381827c24d940995)@meijeru When I use `96.0` in `ConvertPointSizeToDIP`, the text is a little bigger than the text drawing by GDI/GDI+. I think that's why I decrease it. But the right number should be `96.0`, need to do more tests for it.

## Sunday 11st December, 2016

endo64

[20:24](#msg584db5f3bb7d528222e63137)On VID document page it says "The window gets the event last, its on-click handler gets called." but I couldn't make it work for `on-click`:

```
view/options [
	size 600x400
] [
	actors: object [
		on-click: function [face event] [
			print "never happens"
		]
		on-down: function [face event] [
			print "this happens"
		]
	]
]
```

[20:43](#msg584dba67b4ffd59e38160568)Another issue, if a face's `offset` get changed inside `on-drag` actor, on-drag function gets called several times. Here is the simplest form:

```
view [
	base 100x100 loose on-drag [
		print random 1000
		face/offset: face/offset + 1x0 ; // many random number will be printed on console
	]
]
```

[20:52](#msg584dbc8cf666c5a138fd518c)Hmm.. I think `on-click` happens only if it triggered inside a `button`, not for other face types. So this works:

```
view/options [
    size 600x400
	button "test"
] [
    actors: object [
        on-click: function [face event] [
            print "never happens"
        ]
        on-down: function [face event] [
            print "this happens"
        ]
    ]
]
```

geekyi

[21:29](#msg584dc52c0da034021b993a14)@endo64  
&gt;on-drag function gets called several times

Isn't that the expected behaviour? If you want otherwise, I suppose you could use a flag to check if it has been called once before? Hmm..  
Unless you're manually changing the offset value without moving the mouse, and the implementation thinks it's being dragged.. and calls again!  
I'm wondering the use case for such a method.. snap object to position?

endo64

[21:46](#msg584dc922be9d43bc6349e39c)`snap object to position` definitely! :)  
Changing `offset` value from outside doesn't trigger `on-drag` which is ok for me.  
But changing the offset inside on-drag triggers on-drag event many times hence the whole process gets slower.

[21:54](#msg584dcb15aeb4900804767c33)Question III: How can I manually set focus to a face? @qtxie Any idea?  
I set it by using `system/view/vid/focal-face: my-field` but my-field doesn't get focused.

rebolek

[22:03](#msg584dcd3503554185047b2b65)`my-window/selected: my-face`

endo64

[22:10](#msg584dceb8bb7d528222e6aec1)Ah! Great thanks!

[22:12](#msg584dcf67be9d43bc634a0310)Can `base` face has focus? And get `on-key` triggered?

[22:19](#msg584dd0debe9d43bc634a0beb)Yes, it can.

## Friday 16th December, 2016

meijeru

[10:38](#msg5853c428c895451b75e26967)@dockimbel @qtxie I made an interesting discovery: in `%gui.reds` for Windows, there are two almost identical functions `face-handle?` and `get-face-handle` the difference being that one allows `null`as result on failure and the other does not tolerate failure but has `asserts`. Are both used? Or is the intolerant one a remnant of debugging?

```
face-handle?: func [
	face	[red-object!]
	return: [handle!]									;-- returns NULL is no handle
	/local
		state [red-block!]
		int	  [red-integer!]
][
	state: as red-block! get-node-facet face/ctx FACE_OBJ_STATE
	if TYPE_OF(state) = TYPE_BLOCK [
		int: as red-integer! block/rs-head state
		if TYPE_OF(int) = TYPE_INTEGER [return as handle! int/value]
	]
	null
]

get-face-handle: func [
	face	[red-object!]
	return: [handle!]
	/local
		state [red-block!]
		int	  [red-integer!]
][
	state: as red-block! get-node-facet face/ctx FACE_OBJ_STATE
	assert TYPE_OF(state) = TYPE_BLOCK
	int: as red-integer! block/rs-head state
	assert TYPE_OF(int) = TYPE_INTEGER
	as handle! int/value
]
```

dockimbel

[10:41](#msg5853c4d40730ce6937d0ffed)Both are used, though those two functions could be merged into one.

meijeru

[10:53](#msg5853c7c5589f411830f03c58)I hoped so. I discovered this when looking at the problem of getting a handle on the screen object (see latest issue). Can you explain why `face-handle?` is reported as not defined when I try to use it in Red/System?

dockimbel

[10:55](#msg5853c80baf6b364a29bd327a)@meijeru Most probably, you're not calling it with the right access path. IIRC, it is defined in `red/gui/` context.

meijeru

[10:59](#msg5853c8f60730ce6937d118da)Thanks! That works for me. :smile:

dockimbel

[10:59](#msg5853c909c895451b75e28455)Good. ;-)

## Sunday 25th December, 2016

OneArb

[00:29](#msg585f1300e7bdfe4e2995a8ef)Hi everyone,  
Perhaps is it too early to mention?  
A button with an image facet, displays the image (without resizing).  
It looks like an image rather than a button.
