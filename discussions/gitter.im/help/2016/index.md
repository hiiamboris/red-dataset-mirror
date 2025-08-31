# Archived messages from: [gitter.im/red/help](/gitter.im/red/help/) from year: 2016

## Saturday 9th July, 2016

Phryxe

[13:20](#msg5780fa103eaf66535e59a087)Is this the sandbox thread? Newbies like myself have questiob

rebolek

[13:20](#msg5780fa29f9cb022a33efd0a6)@Phryxe feel free to ask

Phryxe

[13:24](#msg5780fb07c9b49c1d6fe77869)Sorry, damned phone editing. Not easy to know if the problem you find is a bug or (most likely) lack of knowledge...

greggirwin

[14:03](#msg5781043c3eaf66535e5a0d9c)@Rebol2Red (from red/red room), I just ported Ashley's func, which was obviously very simple. If you only need to test loadability, trapping the error may be best right now. Otherwise we need a good, concise, reference for sanitizing UTF-8 (or maybe any UTF). Not sure I have for that right now.

Rebol2Red

[14:05](#msg5781049b064f828707f3daa0)Can i get the code somewhere?

greggirwin

[14:05](#msg578104b11ca34a944ed2fef4)All I have is the one you already have.

[14:06](#msg578104d3bdafd1910747e48e)Ashely's used `find`. I just showed how to do it with `parse` to get the actual position of the first invalid char.

Rebol2Red

[14:08](#msg57810572064f828707f3dc1d)Aha. But did you get my point at red/red?  
I wish i could make it clear that the function is not complete  
I just found that the mentioned file has code hex 96 in it which is invalid but not detected by the function.  
Am i right? I get very confused with the utf matter.

greggirwin

[14:10](#msg578105f21ca34a944ed30b71)Yes, the func may have too broad a name, as it may have just been enough for Ashley's needs. Making it complete could be very good, along with a sanitizer that takes rules perhaps. And since Red throws an error, it knows. We can use the source.

Rebol2Red

[14:12](#msg57810664064f828707f3e534)I programmed a lot in other languages like freebasic and had never any problems reading files.  
I think it is essential for a programming language to read files without errors  
It may sound a little bit harsh but that's not my intention

greggirwin

[14:15](#msg57810710bdafd1910747fb75)I sense your frustration. :^) UTF isn't my area either. Remember that Red is only 0.6.1 old. We can help fix it and make it work how we want.

[14:18](#msg578107b7bdafd191074808ac)%runtime/unicode.reds is where this loads, it seems. Look at `load-utf8-buffer`.

Rebol2Red

[14:20](#msg5781082659cfbd4c5e5c4cc8)Hmmm. I have seen the code. It is way above my head. Try to find a simpler solution. Thanks.

I have a table with valid utf-8 so i can detect which ones are invalid.  
Have done only a part of it which came up with the invalid utf byte so it's promising

greggirwin

[14:23](#msg578108f17aeb0805278d70a7)Keep us posted. You may get advice is you're stuck.

Rebol2Red

[14:24](#msg578109371ca34a944ed32723)I will. Back to programming now. Later...

## Sunday 10th July, 2016

ralfwenske

[04:10](#msg5781caae064f828707fc5595)Feeling much more comfortable to ask questions here :smile:

[04:14](#msg5781cb957aeb0805279540dd)I try to access parent of a panel in the on-create event:

```
l: layout [
	p1: panel "p1" 220.220.220 [
		p2: panel "p2" 180.180.180
		p3: panel "p3" 180.180.180
	] on-create [help p1/pane/1/text help p1/parent]
]
view l
```

the result is:  
`p1/pane/1/text is a string! of value: "p2" p1/parent is a none! of value: none`  
How (when) can I access the parent property?

[05:03](#msg5781d73cb79455146f800c58)After some experimenting I found a workaround:

dockimbel

[05:04](#msg5781d75b7aeb08052795ab2f)@ralfwenske `parent` property is only set when the faces are shown on screen, `on-create` is called just before that.

ralfwenske

[05:08](#msg5781d8573eaf66535e63011c)on-resize gets called twice before layout is shown.  
At the second call parent is set so I can traverse the tree up and down.

```
l: layout [title "Why no parent at 'on-create' time"
	p1: panel "p1" 220.220.220 [
		p2: panel "p2" 180.180.180
		p3: panel "p3" 180.180.180
	] on-create [help p1/pane/1/text help p1/parent]
	do [
		self/actors: make object! [
			on-resize: function [face [object!] event [event!]][
				print ["In on-resize: help p1"]
				either p1/parent [
					help p1/parent/text
				][
					print ["p1/parent is none"]
				]
			]
		]
	]
]
view/flags l [resize]
```

this code returns the following:  
`In on-resize: help p1 p1/parent is none p1/pane/1/text is a string! of value: "p2" p1/parent is a none! of value: none In on-resize: help p1 p1/parent/text is a string! of value: "Why no parent at 'on-create' time"`

[05:10](#msg5781d8ad064f828707fcb38a)How do I enforce a linefeed in the 'code' section of markup?

[05:12](#msg5781d92a7aeb08052795b7ac)@dockimbel Is there a particular reason for this? The children (pane) are set; couldn't the parent be set at that time also?

dockimbel

[05:27](#msg5781dca8bdafd191075079ce)@ralfwenske Use triple backquotes instead of single ones.

[05:31](#msg5781ddbec9b49c1d6ff0d914)@ralfwenske `on-create` is really meant to be called before the system GUI resources are allocated, and parents setting needs to happen after that. What is really missing is a `on-appear` handler which would be called just after the face is fully created and displayed for the first time.

[05:37](#msg5781df043eaf66535e632710)I'll see if we can add such feature today.

ralfwenske

[05:40](#msg5781dfd71ca34a944edb7096)@dockimbel That's great. Thank you.  
Doing it in on-resize works but it is not a very transparent solution.

[05:44](#msg5781e0cb3eaf66535e632f91)@dockimbel Will the on-appear happen before the second (initial) on-resize happens? For my purpose (resizing window and automatic panel resizing) it would be desirable.

dockimbel

[06:39](#msg5781edaab79455146f80ac67)@ralfwenske Probably not. Those early resize events are unwanted, but Windows does weird things on creating a GUI components, so those events will proably be filtered out in the future.

ralfwenske

[06:42](#msg5781ee4e1ca34a944edbcca8)@dockimbel I guess in this case I would call 'show' after manipulating offset and/or size values of faces?

[06:47](#msg5781ef6559cfbd4c5e65c2da)btw. Main purpose for me is playing with perceived gaps (eg.resizing) to learn. I guess these will probably become part of Red GUI later on anyway...  
I am aware that in a way I am interfering with the workings of the GUI. :sparkles:

dockimbel

[07:36](#msg5781faf2bdafd19107517052)@ralfwenske No need, the face will be refreshed automatically by default. Your code above is fine, not interfering. ;-)

greggirwin

[12:37](#msg5782417b064f828707009cf4)@ralfwenske, what is it you're actually trying to achieve?

ralfwenske

[23:13](#msg5782d695064f828707071045)@greggirwin Learning is much more effective for me by doing things. When coding I find myself often being sidetracked by searching for and digging through the countless resources (websites / sample codes).  
So I thought this is a good challenge to develop an IDE in Red becoming a 'one stop place with integrated help, templates and examples. Allowing myself to add and change features as I go along.  
I want the IDE to resize faces when the window is being resized. Templates will be part of the IDE and so now I am developing a simple three column face which also allows to use dragging to hide and unhide the left and right columns.  
Next step will be a similiar template with rows.

A six-pane template will contain the columns embedded in the center face of the rows which I want to use as the base for the IDE...

now how do I embed an image here?  
!https://github.com/ralfwenske/images/blob/master/RedExplorer.JPG?raw=true

## Monday 11st July, 2016

dockimbel

[07:24](#msg578349bf7aeb080527a474bd)@ralfwenske Nice work!

greggirwin

[12:43](#msg57839455064f8287070f3d8c)Very cool. Are you using a `base` face and building a splitter style on that?

## Tuesday 12nd July, 2016

yoffset

[03:39](#msg5784666f59cfbd4c5e82209d)Has there been any thought about a console command to clear memory? Interpreting more than one program from the console without restart has assignments carrying forward.

pekr

[03:47](#msg5784684d3eaf66535e7f6363)there is no GC in Red yet, but something like that might come. IIRC, even R3 planned something like that and provided some isolated boot phases, reset of the state of the interpreter, but can't remember, how far it went before it was abandoned by its author

dockimbel

[04:01](#msg57846ba1c9b49c1d6f0dc494)Here is an attempt at a function which would clean the states after running user code. It won't reclaim allocated memory though. It needs to be called once before any user code, as it can't clear past its first invocation.

```
reset: function [][
	if zero? first ref: [0][ref/1: length? words-of system/words]
	foreach w at words-of system/words ref/1 [unset w]
	system/view/debug?: system/reactivity/debug?: off
	clear-reactions
	system/view/auto-sync?: on
]
```

[04:30](#msg57847270bdafd191076ea9be)Actually, `unset` can take a block of words, so the `foreach` loop is not necessary;

yoffset

[13:46](#msg5784f4aa1ca34a944efec536)red&gt;&gt; s: "text"  
\== "text"  
red&gt;&gt; s  
\== "text"  
red&gt;&gt; unset \[s]  
red&gt;&gt; s  
\*\** Script Error: s has no value

[13:47](#msg5784f4ef59cfbd4c5e88a721)Thank you

greggirwin

[20:52](#msg57855878b79455146fa863c7)@DarioX1973\_twitter, here's a very quick hack on your word distance problem.

```
word-1: "Troia" 
word-2: "Grecia" 
max-distance: 5
sep: charset " ,."

parse s [
    any [
        to word-1 mark-1: word-1 sep
        ;(print index? mark-1)
        [copy text to word-2 word-2 mark-2: (
	        ;(print [tab index? mark-2])
            n: 0
            parse text [space (n: n + 1) | skip]
            if n < max-distance [
                print ["Close words found at offset" index? mark-1 mold copy/part mark-1 mark-2]
            ]
        )  | to end]
    ]
]
```

Just to give you an idea of one way to do it.

DarioX1973\_twitter

[22:51](#msg5785745d064f82870727e3bd)Ok, perhaps the next time i'll enter in gitter i will see the help room correctly.

[22:52](#msg578574ac7aeb080527c07795)Mmm it seems difficult to me ... i will try tomorrow at office. It's not time to sleep now in italy. Thank you very much, Greg.

## Wednesday 13th July, 2016

DarioX1973\_twitter

[13:15](#msg57863eeec9b49c1d6f24f26f)

[13:18](#msg57863fb13eaf66535e96358a)Hello Greg, i have modified your program in this way, changing the 2 words and creating a little text so it will be more clear to me to understand.  
Why i get false after executing the script? i thought to have true because "giornata" and "sole" are distant by only 2 words ...

```
word-1: "giornata" 
word-2: "sole" 
max-distance: 5
sep: charset " ,."


; this is the text where to find if it contain "giornata" close to "sole"
s: {
	Oggi è una bella giornata
	di gran sole, e me la 
	spasso fuori!
}

parse s [
    any [
        to word-1 mark-1: word-1 sep
        ;(print index? mark-1)
        [copy text to word-2 word-2 mark-2: (
            ;(print [tab index? mark-2])
            n: 0
            parse text [space (n: n + 1) | skip]
            if n < max-distance [
                print ["Close words found at offset" index? mark-1 mold copy/part mark-1 mark-2]
            ]
        )  | to end]
    ]
]
```

pekr

[13:26](#msg578641763eaf66535e964a4d)When I try to extend the `n: n + 1 print n`, you can see, it will never get there. It will fail sooner ...

[13:26](#msg578641a3c9b49c1d6f252341)Look at what `s`is: `{^/ Oggi è una bella giornata^/ ....`

[13:27](#msg578641ca1ca34a944e0ed4c6)First fix is - fix the separator by: `sep: charset " ,.^/"` ... and continue playing ....

DarioX1973\_twitter

[13:33](#msg5786431c3eaf66535e965b4c)wow, it works now ...

pekr

[13:33](#msg57864336b79455146fb290ae)great! :clap:

DarioX1973\_twitter

[13:35](#msg578643a9064f82870730a722)another thing: in the example i find 2 words, but many times i look for more words, but again the must be close to each others ... how i can modify the greg program? i still yet don't understand well ... i dont' now where put my hands ... but i would like to compare benchmarks with other staff i made in python ...

pekr

[13:40](#msg578644cb7aeb080527c9c09f)we would have to see your examples in Python. Or even better - what is in fact requested.

[13:41](#msg578644fe1ca34a944e0efe3d)searching for the distance of a variable amount of word pairs might be more complex ...

DarioX1973\_twitter

[14:02](#msg578649e23cb52e8b249bdffc)mmmmm ... i had a project ... when i was young (i am kidding) ... this one:

perhaps you understand me if you see it directly:  
http://textre.altervista.org/video.php

please, don't go in the source files ... they are unreadable .... remember that as italian I am entitled to write spaghetti code :-D

So, i want to arrive to have the same program, but in a simple way, because do it in python and freepascal and crossplatfoms has been not simple ...

[14:04](#msg57864a53e4375c9212c29c53)sorry, it's all in italian language ... but the concept of searching and display the words of own biblioteque, i think is clear

[14:08](#msg57864b673c5129720e0d8bc4)the importat key is that the words you looking for, must be distant in range of words, so you can find the points of the texts you don't remeber where are, buy searching for two or more significant words (or part of them)

pekr

[14:22](#msg57864ebc196179690ebd5fe6)This is a complex stuff and goes beyond the simple help. Would consume much of the time. We can help with some parse or GUI alghoritms, but to close such app would require a significant effort ....

DarioX1973\_twitter

[14:27](#msg57864fc89f79ee4f2b94f0ff)Of course, of course. I perfectly understand. i will return with simple examples ... now i learn Red basics. :smile:

greggirwin

[15:26](#msg57865db08423d0842415baa1)Thanks for stepping in @pekr!

DarioX1973\_twitter

[15:55](#msg5786645ce4375c9212c4ffc2)Eh eh, here is your nighmare Gregg ... if i want a series of words to find ... not only a certain numbers of them, is it too much complicated?  
How you modify your script in these case?

```
;i dont' want only 2 words, but how many words i want to find

;word-1: "giornata" 
;word-2: "sole" 

words-to-find: ["today" "beautiful" "hot"] ; a series of near each other words to find 

max-distance: 8
sep: charset " !,.^/"


; this is the text where to find into
; in this text the matches should be:
;     today is a great beautiful day, with hot
;     today, what beautiful hot

s: {
	Really ... today, i can say that today is
    a great beautiful day, with hot weather, and i go
	out to do something.
	Very hot, yes.
    Hot, this today.
	I like a beautiful day, as today.

	Really ... today, what beautiful hot day!
	out to do something.
	Very hot, yes.
    Hot, this today.
	I like a beautiful day, as today.
}



parse s [
    any [
        to word-1 mark-1: word-1 sep
        ;(print index? mark-1)
        [copy text to word-2 word-2 mark-2: (
            ;(print [tab index? mark-2])
            n: 0
            parse text [space (n: n + 1) | skip]
            if n < max-distance [
                print ["Close words found at offset" index? mark-1 mold copy/part mark-1 mark-2]
            ]
        )  | to end]
    ]
]
```

greggirwin

[15:58](#msg57866529196179690ebece7f)It is a bit much right now Dario. I have to jump off and do some paying work. But if you look at http://www.red-lang.org/2013/11/041-introducing-parse.html and maybe some Rebol parse docs, start small, and work your way up, I'm sure `parse` will make sense to you soon.

DarioX1973\_twitter

[16:06](#msg578666f9e4375c9212c527e6)Thanks, i will not abuse and will study it.

## Friday 15th July, 2016

canyonblue77

[02:40](#msg57884d0e3cb52e8b24b63643)The following words \[ join rejoin combine ] return an error of "word has no value" The guides for rebol mention some of them and there is a hostilefork that mentions them in context of Red, and even references DocKimbel pointing out that "rejoindre" is the French word for join. Were they removed or otherwise purposely excluded from Red, were they determined to be duplicative of other functions or possibly missing due to a bug in the current release? Just generally curious... my original question stemmed from attempting to combine strings without spaces... turn \[ "A" "B" "C" "D" ] into "ABCD" I finally settled on `code` trim/all form \["A" "B" "C" "D"] `code` is this a good method, is there a better way? Not sure if I did the code tag correctly... hope so!!!

[02:40](#msg57884d3b9f79ee4f2baee069)\*hostilefork blog

pekr

[02:47](#msg57884edf9f79ee4f2baef077)Hostilefork took R3 open source code and started to clean it, later on to adapt it. He introduced some underlying changes, which some old time rebollers don't agree with. His language is called Ren-C, not Rebol anymore, although those changes might be sometimes subtle. He does not like some Rebol naming, so is renaming some function. Not sure, what does he mean by "rejoindre", but he sometimes reffers to Dockimbel copying wrong design decision of R2. That's his opinion and not an universal truth :-)

PeterWAWood

[02:48](#msg57884ee79f79ee4f2baef096)@canyonblue77 @dockimbel has not yet decided on how best to implement functions such as

```
join
```

and

```
rejoin
```

so they are yet to be implemented.

Your code tags didn't really work as you wanted. For code, type 3 consecutive \` then the code and then another 3 . If you want a full code block, start a new line after the first 3.

pekr

[02:49](#msg57884f213cb52e8b24b64f3e)Apart from that, join/rejoin are not there yet, that's all. As for me, I don't like the automatic addition of spaces too, and I am glad that we did get rid of that with parse for eg. too ... it's my old time gripe with Rebol ... but others will not agree with me ....

canyonblue77

[02:50](#msg57884f5a3c5129720e27333d)Hey thanks for the replies!!!

```
attempt to write a code line
```

[02:50](#msg57884f893cb52e8b24b6573c)

```
and a code block
```

PeterWAWood

[02:51](#msg57884f96e4375c9212dca44b)code :+1:

canyonblue77

[02:53](#msg57885033196179690ed74a38)That's cool! Look forward to the built-in join function, totally realize what a huge undertaking Red is... thanks for being there to help it happen. For now a join function could be made from trim and form will work just as nice :)

pekr

[02:55](#msg578850a9e4375c9212dcb08d)you can add such function yoursel. Just look into R2 source code:

```
>> source join
join: func [
    "Concatenates values."
    value "Base value"
    rest "Value or block of values"
][
    value: either series? :value [copy value] [form :value]
    repend value :rest
]
```

[02:55](#msg578850b88423d084242ec7e9)quite short, should work with Red too, but haven't tried ....

[02:57](#msg578850fed11cd288121c1a18)In above case, you would have to add repend function too ...

greggirwin

[04:30](#msg578866f33c5129720e27f8e1)Red does have `rejoin` now, though the implementation is probably subject to change.

pekr

[04:39](#msg578869043c5129720e280f83)Was rejoin in 0.6.1, or is that just in recent sources? That could be state too, so that user is not eventually confused :-)

SteeveGit

[07:29](#msg578890d588a3ed5b58bb665e)

[07:33](#msg578891d38aff7d5472007d14)Personnaly, I prefer \*\*ajoin\** from Rebol3. Less overhead than \*\*rejoin\*\*.  
http://www.rebol.com/r3/docs/functions/ajoin.html

[07:35](#msg5788924e141a2f8a6b9a2ba2)Though, the name is quite bad.

rebolek

[07:36](#msg5788927f4db4a6900bfca1ca)@SteeveGit `ajoin` is good function, but `rejoin` can do much more:

```
>> ajoin [%a %b]
== "ab"
>> rejoin [%a %b]
== %ab
```

SteeveGit

[07:38](#msg578892f188a3ed5b58bb6955)Yes, rejoin is more versatile. But in the most use cases, coders just want an output string!.

endo64

[12:32](#msg5788d7e2196179690edd01f3)I agree with @SteeveGit , I mostly need to concat blocks into strings without putting space between values as in `FORM` and usually don't need the `REJOIN`s behaviour, so I use `ajoin` mostly.  
What could be a better name? So we can have it on Red and make `ajoin` just an alias for compatibility.

RnBrgn

[12:59](#msg5788de43196179690edd4e21)@canyonblue77 `append "" ["A" "B" "C" "D"]`

DarioX1973\_twitter

[13:53](#msg5788eaefd11cd28812228a2f)@RnBrgn Great, i never see it before .... perhaps is better add a copy (append copy "" \["A" "B" "C" "D"]) or it is not necessary?

greggirwin

[14:15](#msg5788f00a8423d0842435bcfa)@pekr, you're right, it's only in recent sources.

```
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

RnBrgn

[14:27](#msg5788f2ed196179690ede567f)@DarioX1973\_twitter I guess it depends on where and how you use the append function. If you're running the statement just once, than you wouldn't necessarily need `copy`.  
If it's part of a function or loop, than you'll most likely need to use `append copy`.

greggirwin

[14:35](#msg5788f4c33cb52e8b24bdbcb8)I never liked the name `ajoin`. My other issue is that we have a number of different functions that are similar but not identical, and all very closely named. And there is nothing in the name `ajoin` to tell you what's different about its behavior.  
This is one I haven't tackled in a unifying way, like I've done with `round`, `split`, and my `for` proposal. I have separate funcs I combine to do things. For example, I have a `delimit` func that works on any series type, so I can do that, then `rejoin`, but I also have specialized dlm str funcs for things like building CGI or other dict-style strings with field and rec separators.  
We want verbs as function names, to denote action, but we do have `object` now, which I like. What if we had `string` (string these things together), which also implies the return type? One concern is confusion by overloading the word string too much. More thought required.

endo64

[14:52](#msg5788f8c7e4375c9212e40b59)may be some refinements can be added to `FORM`, put extra space between values or not, using a delimiter, forming `none` to empty string etc.  
Not having any option/refinement for `FORM` is making it less useful, and we all write our own string functions similar to each other's.  
Better switch to red channel.

x8x

[17:26](#msg57891cae3cb52e8b24c0254d)In compiled code, somethimes I get the errors printed, sometimes not, is there a rule? Maybe if it runs interpreted vs native ? thx!

## Saturday 16th July, 2016

canyonblue77

[00:33](#msg578980d2d11cd28812295d11)so rejoin is not in 0.6.1 but is coming soon? And @pekr the append works good when the series values are actual strings... but not so much for when they're variables also the example I came up with has the same issue. I did figure out that if I add reduce to both of them that I get the desired result.

[00:33](#msg578980dad11cd28812295d1f)'''

[00:34](#msg57898109196179690ee4cd98)

```
append "" reduce [ varA varB varC ]
trim/all form reduce [ varA varB varC ]
```

[00:35](#msg5789815a196179690ee4d506)Both of those work... which I guess is why the rejoin function would be what I'm looking for??? Regardless of the name my understanding of the rejoin function is that itreduces variables before joining them together?

[00:41](#msg578982b3d11cd28812296d19)Sorry @RnBrgn, I meant to refer to you about append working good for strings but not vars

[00:48](#msg57898444914c51592b207918)@pekr, apologies for wrong reference

greggirwin

[07:09](#msg5789ddb29f79ee4f2bbfb4ca)`Rejoin`will be in 0.6.2, and the automated builds should have it. And, yes, the "re" in the name is for "reduce". Rebol also has `remold` and `reform`. The tough design work is finding better names. The old names are important for porting from Rebol.

dsgeyser

[10:42](#msg578a0f923cb52e8b24c8dd0a)Anyone knows whether there is a dialect for Excel, and is it still working? Also, download link, if possible. I need it to learn Red (to port), would be really great. Thanks

PeterWAWood

[10:49](#msg578a114fe4375c9212ee8349)@dsgeyser The most up-to-date Rebol "Excel" library is \[Ashley Trüter's Munge](http://www.dobeash.com/munge.html). Ashley is highly regarded in the Rebol community. I think that he and others use it daily including @endo64.

dockimbel

[11:22](#msg578a18ffd11cd288122e56c6)@dsgeyser Check out @greggirwin's cool \[Excel DSL](http://lambda-the-ultimate.org/node/1240) which allows you to remote control an Excel spreadsheet.

dsgeyser

[14:04](#msg578a3ee38423d0842442791d)Thank you to the both of you. This is truly a great community. Feels like family .

dockimbel

[16:04](#msg578a5afb3cb52e8b24cc0e10)You're welcome. ;-)

canyonblue77

[16:58](#msg578a67c2e4375c9212f1ed26)@greggirwin Really interested in your Excel DSL, link seems to be broken though...  
"""Warning: mysql\_connect() \[function.mysql-connect]: Lost connection to MySQL server at 'reading initial communication packet', system error: 113 in /home/ltu/www/includes/database.mysql.inc on line 31  
Lost connection to MySQL server at 'reading initial communication packet', system error: 113"""

[17:01](#msg578a68833cb52e8b24ccafdf)On a separate note, can anyone provide an example of (or let me know if it's even possible) to define your own infix operator in Red? Thanks!!

dockimbel

[17:10](#msg578a6a9b3cb52e8b24ccbbb5)@canyonblue77 For creating an infix function, you need to make a prefix function with 2 arguments first:

```
make-range: function [a [integer!] b [integer!]][
	collect [i: a - 1 until [keep i: i + 1 i = b]]
]
->: make op! :make-range

2 -> 7
== [2 3 4 5 6 7]
```

[17:11](#msg578a6ab93cb52e8b24ccbc05)I could have use any valid word instead of `->` for naming the infix function.

canyonblue77

[17:27](#msg578a6e95196179690eed0704)Thanks @dockimbel ! Red is amazing work and it's happening so fast too!! Every time I check in on Red there are major advances. I definitely concur with the sentiment posted elsewhere that your version ~0.6.1 seems so much closer to a version 1.0 than other languages that are under development.

dockimbel

[17:33](#msg578a6fe48423d0842444c15a)@canyonblue77 Thanks for the kind words. ;-) About 0.6.1, it's already pretty good, but 0.7.0 will really feel more like a 1.0 with all the I/O implemented and a (simple) GC.

greggirwin

[18:28](#msg578a7cce3cb52e8b24cd70ed)@dsgeyser @canyonblue77 , I think the lambda site just showed some dialect examples. Not sure why it's down. I'll see if I can track down the original. It used the COM interface to Excel, so was version specific.

[18:57](#msg578a8381914c51592b2a04dd)I found the original, from 2004. There is a DLL written in PowerBASIC, that wrapped the COM calls, so I could write routines in R2 to call them, with a dialect over that. Looks like there were about 25 commands mapped. Robert Muench, of Saphirion, used this to automate a bunch of spreadsheet processing, so it only included what he needed for that.

[18:59](#msg578a8427d11cd2881232893c)The dialect looked like this:

```
excel [
	start
	show
]

foreach file files [
	if %.xls = suffix? file [
		excel compose [
		    open (join path file)

		    goto worksheet 1 goto cell "A1" set value to "Company Name"
		    goto worksheet 4 goto cell "A1" set value to "Destination"

		    goto cell "B2" set value to "=A1"

		    close workbook
		]
	]
]

excel [quit]
```

[19:03](#msg578a8502914c51592b2a1915)You could DO Rebol code within it, of course, and dialect commands like: `alerts [on off], cut/copy/paste, cut/copy to , insert new books or sheets, paste [value formula format comment], remove sheets, save/save-as, select/set [cell row col range]`

[19:05](#msg578a8588e4375c9212f30b38)Writing the COM part in Red/System, so it's "deep Red", would be great. I don't have a current Excel here to experiment with, but if someone wants to do that, I'll get them the code.

[19:06](#msg578a85c53cb52e8b24cdc39c)It also used a routine dialect I wrote, to make it easier to write the FFI part in R2.

dsgeyser

[19:20](#msg578a88f4e4375c9212f32529)@greggirwin I currently have Excel 2010 and 2000 loaded. Would appreciate the opportunity to play with it. Do you think someone with limited abilities in Redbol like myself would be able to port COM to Red/System? Also, what is your take on Ashleys' 'Munch' script?

greggirwin

[19:26](#msg578a8a7e9f79ee4f2bc5f1b9)`Munge` is well-loved, and well-supported. Ashley always does outstanding work. It it strictly for manipulating tabular data. That means you have to do the work of getting it in and out of Excel, but also makes it much more general, which is great.

[19:30](#msg578a8b41d11cd2881232de2c)I'll send you the code. My guess is that a simple example or two would be enough to get you going. I'll include the original DLL source as well. I think %red/runtime/simple-io.reds uses a COM interface for HTTP reads.

pekr

[19:30](#msg578a8b438423d0842445f048)I was lately thinking, if somethimg like Munge could be done with Parse?

greggirwin

[19:30](#msg578a8b558423d0842445f079)Anything can be done with `parse`. ;^)

pekr

[19:31](#msg578a8b953c5129720e3ec8d2)I mean, wrappimg parse into parse.exe, giving it piping, grep like functionality, manual and ability to load and switch dialects as modules. Could be a killer app? :-)

greggirwin

[19:32](#msg578a8bb1196179690eee272c)A universal data translator, with parse rules as plug-ins? I like it.

pekr

[19:32](#msg578a8bdc196179690eee29bd)Parse is an underused gem imo ...

greggirwin

[19:33](#msg578a8bfdd11cd2881232e7fe)Sometimes I wonder if I \*over\*use it. :^\\

pekr

[19:33](#msg578a8c21196179690eee2a28)If we can't rulenthe world with Rebol, extracting parse could do it. You see json? Well, it coul output data in REN :-)

greggirwin

[19:35](#msg578a8c7a196179690eee2ae0)I do think that's one way to market Red though. We have LOP, and POLs, Dialects and DSLs, but none of them have been designated as a new paradigm. e.g., everything is an object in OO, everything is a function in functional. Everything is a dialect, from `do` down, is our paradigm.

[19:37](#msg578a8cf73cb52e8b24ce002e)I'm with you Petr. My guerilla plan is to use Ren as the wedge. Markdown has opened the door. Create easy-to-consume data, likely including a DLL or static LIB that does the loading.

[19:38](#msg578a8d31196179690eee2ec2)I think the spreadsheet is a great killer app. If you recall, the old Nano-Sheets project had complete I/O built in.

pekr

[19:38](#msg578a8d4f9f79ee4f2bc61e06)well, it was just a wild idea.

greggirwin

[19:38](#msg578a8d51914c51592b2a68f6)And then Cyphre hacked it to make the cells all move around dynamically in the context entry. ;^)

[19:39](#msg578a8d70196179690eee31cc)i.e. he wrote spreadsheet data you loaded which then dynamically altered the UI.

pekr

[19:41](#msg578a8ded3c5129720e3ee0f9)At work, colleagues wanted to parse one file. Told them about Red and Rebol. They dont want to learn new lang. But they agreed, that if they can call some exe with a parameter and get the result, the work is done. Hence it came to my mind, if possibly more audience would find use for targetted parse.exe doing wonders :-)

greggirwin

[19:41](#msg578a8dfd3c5129720e3ee3be)Agreed.

dsgeyser

[19:42](#msg578a8e32e4375c9212f34fdd)@greggirwin I am excited about this chance to do this. And as always I can certainly lean on my fellow community coder friends to make this happen. @pekr You really have a freat

[19:45](#msg578a8ebcd11cd28812330362)@pekr You really have a great idea there. Maybe we can steer it somewhere useful. This is the reason why I love it here, the constant innovation!

greggirwin

[19:46](#msg578a8f0c9f79ee4f2bc631d1)As much as I love the Redbol languages, I love the community more.

pekr

[19:46](#msg578a8f1ee4375c9212f35bc1)But if at least one is useful, why not mention it ...

greggirwin

[19:47](#msg578a8f60e4375c9212f360e7)Some of my best ideas were probably Petr's. :^)

pekr

[19:49](#msg578a8fba8423d08424461e03)Eh, one of my messages went pink and did not appeared here. Trying Android native client ...

[19:50](#msg578a9016d11cd28812330f07)I can hardly produce quality code myself, hence most of my suggestions might be just shallow. But I try to believe the parse.exe might get popular ... IIRC, Doc planned a dialect to build dialects ...

[19:51](#msg578a90359f79ee4f2bc64103)Now imagine ti accomoany it with the GUI rules editor ...

[19:52](#msg578a9093d11cd28812331290)Guys, it was 20 years ago, when we built new scope for our ibservatory. We got some weird Czech step motor, Mikrokon, and I asked my brother - who is goimg to code it?

[19:53](#msg578a90c8914c51592b2a86a7)And he showed me his own code, using simple code like start, stop move 100 x, etc

greggirwin

[19:54](#msg578a90ef196179690eee55dc)Sandstone Technology used to have a tool called Visual Parse ++ which was pretty cool. It was all shift-reduce style, but I think our ability to create interactive tools is unlimited once we embrace reactivity.

pekr

[19:54](#msg578a90f1196179690eee55df)That was the first dialect I have seen ... And it allowed non programmers to do a useful stuff. So much power there ...

greggirwin

[20:01](#msg578a92ac8423d08424463df0)I PM'd you here @dsgeyser .

dsgeyser

[20:21](#msg578a97418423d084244652c3)@greggirwin Thanks for the PM. I really feel priviledged to be talking to you and @pekr - both old hands

[20:24](#msg578a9819e4375c9212f3bfc1)I recently saw someone mention on a forum how great it would be for anyone to be able to convert a spreadsheet to a CRUD app - kind of like an interface to the spreadsheet. Imagine a dynamic and reative GUI. And docs' last demo thrown into the equation. It baffkes me. And perhaps pulling data from all sorts of places, being dynamically updated. I think the amount of need out there is great when it comes to data flow and business logic between mobile and Excel, for instance. They really are making it so complicated. I think it is time to show them how it should be done. This community may be small at the moment, but I think there is enough expertise and good old sense to bring about a lasting legacy to the coding world at large. Make doc proud.

greggirwin

[21:37](#msg578aa91a9f79ee4f2bc75be7)The thing about Redbol is that it's malleable, at a high level. Rebol experts scratched the surface over the years, but because we all wrote for our own needs, and the community stayed small, more general tools didn't emerge.

[21:42](#msg578aaa53e4375c9212f4627b)I'm excited to see what tools people build with Red. Things like template expansion (or Zen Coding / Emmet if you're under 30 :^), are easy.

[21:44](#msg578aaabe9f79ee4f2bc769c7)

```
process: function [
	input [string! none!]
][
	if attempt [blk: compose [(load input)]][
		res: parse blk [
			collect [
				any [
					set w word! set s string! keep (rejoin ["<" w ">" s "</" w ">"])
					| 'aref keep ({<a href="#"</a>})
				]
			]
		]
		either res [form res][input]
	]
]

view [
	below
	text yellow 300 bold {Try "h1{foo}" or "aref"}
	text "Input:"  input:  area 300x60
	text "Output:" output: area 300x180 react [face/text: process input/text]
]
```

## Sunday 17th July, 2016

PeterWAWood

[00:04](#msg578acb74d11cd2881234f5dc)I'm

## Monday 18th July, 2016

endo64

[07:52](#msg578c8ac58423d0842457fd92)&gt; @dsgeyser @canyonblue77 , I think the lambda site just showed some dialect examples. Not sure why it's down. I'll see if I can track down the original. It used the COM interface to Excel, so was version specific.

@greggirwin I have that (Excel dialect) script on my PC, if anyone need I can put somewhere on Internet.

greggirwin

[15:44](#msg578cf966ac85f2507abc38c4)Thanks Endo. I found it and sent it to him. You're now part of my "external memory" list though. ;^)

Rebol2Red

[16:52](#msg578d094375045f8767ef03a9)Why is there no word "for" as in rebol2? (There are lots of other evaluating words)  
If "for" is not acceptable then how can i use any of the other words as "for"?  
I can do "for" with an iterator inside a loop, but this is not what i want.

pekr

[16:54](#msg578d09b89f35137e67cac733)I believe, at some point, there's going to be one. Well, depends upon Red authors, but my take is - if ppl are asking for it, they might miss it, although I understand, that it might not feel natural to Red. Maybe it is going to be in the mezzanine library, who knows. I think that Doc is also waiting for the precompiled runtime to be available, and does not add much of a mezzanine code to slow the compilation further down ...

[16:54](#msg578d09e09f35137e67caca7e)@greggirwin is also proposing much stronger `for`implementation, which would be really powerful. Forgot the link to the proposal, maybe Gregg will step-in.

Rebol2Red

[16:59](#msg578d0ae275045f8767ef2141)Aha, I will wait and see.  
I had some adjusted mezzanine code but that worked only interpreted but not compiled.  
That's why i returned to using "loop and repeat" code  
Thanks for explaining

greggirwin

[17:00](#msg578d0b369f35137e67cadee0)The `for` proposal is here: https://github.com/red/red/wiki/REP-FOR-loop-function

[17:02](#msg578d0b8d0720fd587a8dac73)I hope `for` will be included in some form. Doesn't have to be mine. People will expect it, and it does provide features `loop` and `repeat` don't. You can do anything with `while`, but that's not always as clear IMO. I didn't use `for` often under R2, but when I needed it, I was glad to have it.

Rebol2Red

[17:06](#msg578d0c92ac85f2507abd927f)Can you give me a little example of how you use while as for?  
I am always interested in how other people do their coding.  
For example:

```
for a 2 10 2 [ print a ]
```

greggirwin

[17:13](#msg578d0e240720fd587a8dde5e)

```
a: 0  while [a < 10][a: a + 2 print a]
```

would do the same in that case.

Rebol2Red

[17:14](#msg578d0e6c2d04e058517a9d84)I just did almost the same:

```
a: 2
while [a <= 10]
[
	print a
	a: :a + 2
]
```

greggirwin

[17:14](#msg578d0e7775045f8767ef58a6):^)

Rebol2Red

[17:15](#msg578d0ea0841e619d16fdc03b)Not as nice as with a for but i can live with it. Thanks

greggirwin

[17:15](#msg578d0ea316487c5e51450de9)All you're doing is breaking out the `init, test, step` pieces and making them explicit.

Rebol2Red

[17:16](#msg578d0ee39f35137e67cb130d)Will the code be slower?

greggirwin

[17:16](#msg578d0ee5841e619d16fdca77)Of course, all the things you have to do manually are places to introduce bugs.

Rebol2Red

[17:17](#msg578d0f283d74e5a01654b394)I agree to that

pekr

[17:17](#msg578d0f32ac85f2507abdbc28)Now you can implement your own `for` funciton using `while`

Rebol2Red

[17:18](#msg578d0f5e841e619d16fdce58)But will the code be slower?

greggirwin

[17:18](#msg578d0f622d04e058517aaad8)Quick test here shows the `while` version under Red is about the same speed as `for` under R2.

pekr

[17:19](#msg578d0f9216487c5e51451a16)Compilation might help?

Rebol2Red

[17:20](#msg578d0fca75045f8767ef66b0)Ah, well as Gregg said about the same speed as R2. I am glad to know. I will use while for now.

pekr

[17:20](#msg578d0fe62d04e058517ab69f)Yes, the same speed, interpreted ...

greggirwin

[17:21](#msg578d100e0720fd587a8def3e)But you can make a fast version, if your tests work for it. e.g.

```
a: 0  loop 5 [a: a + 2 print a]
```

That will be screaming fast, compared to `while`.

Rebol2Red

[17:22](#msg578d103c0720fd587a8defb9)It is because of the long compiling time i do not compile very often.  
Only when the program is almost finished.

pekr

[17:23](#msg578d109d3d74e5a01654cddb)I felt in love with the Red's GUI console - very nice experience for me :-)

[17:23](#msg578d10a7ac85f2507abdd0d7)So I don't compile too ...

greggirwin

[17:43](#msg578d15489f35137e67cb6803)As far as speed, remember that these things only have an effect when you're talking loops that run millions of times. And if you're doing any significant work in the body, that will likely dwarf the loop construct overhead.

[17:45](#msg578d15cd75045f8767efd224)

```
red>> time-it [a: 0  while [a < 1000][a: a + 1]]
== 0:00:00.001
red>> time-it [a: 0  while [a < 10000][a: a + 1]]
== 0:00:00.01
red>> time-it [a: 0  while [a < 100000][a: a + 1]]
== 0:00:00.051
red>> time-it [a: 0  while [a < 1000000][a: a + 1]]
== 0:00:00.488
```

pekr

[17:50](#msg578d16fd75045f8767efdf96)Hey, where's my `time-it`? :-)

x8x

[17:51](#msg578d1716ac85f2507abe38d2)is there an easy way to convert `string!` to `binary!` end back?

pekr

[17:51](#msg578d171816487c5e5145a243)IIRC, R3 had something like delta-time, or dt? I like time-it more!

greggirwin

[17:52](#msg578d17472d04e058517b324e)

```
time-it: func [block /count ct /local t baseline][
    ct: any [ct 1]
    t: now/time/precise
    loop ct [do []]
    baseline: now/time/precise - t
    t: now/time/precise
    loop ct [do block]
    now/time/precise - t - baseline
]
```

My cheat for now.

pekr

[17:53](#msg578d17909f35137e67cb8c70)I like it, could be added to Red, I bet ppl would find it useful for basic tweking/optimisations of their code ...

greggirwin

[17:53](#msg578d179d16487c5e5145a3d3)

```
red>> s: "ABC123"
== "ABC123"
red>> to binary! s
== #{414243313233}
red>> to string! to binary! s
== "ABC123"
```

Rebol2Red

[17:53](#msg578d17ab0720fd587a8e7077)@greggirwin It is if you could read my mind. I wanted to ask if my executing timing code was wrong and if i could see your code.

greggirwin

[17:54](#msg578d17f275045f8767eff265):^) I imagine Doc has better things in mind. We will surely have real profiling in Red, all the way down. Maybe even something cool like DTrace does.

x8x

[17:55](#msg578d18259f35137e67cb976c)HAHA not sure how I could miss that.. Thanks Gregg!

Rebol2Red

[17:56](#msg578d1833841e619d16fe5511)This was my impementation:

```
execution-time: func[ blok /local start_ end_
][
	start_: 	now/time/precise
	do blok
	end_: 		now/time/precise
	end_ - start_
]

; fast
print execution-time[a: 2  loop 10000000 [a: a + 2]]

; slow ? (looks if it is faster than above)
print execution-time[a: 2 while [a <= 10000000][a: :a + 2]]
```

greggirwin

[17:56](#msg578d18573d74e5a016552bde)@x8x , I often miss things because they are too easy. :^)

x8x

[17:57](#msg578d18730720fd587a8e77d9)

```
timer: func [
	code [block!] "Block of code to execute"
	/local t r
][
	t: now/time/precise
	set/any 'r do code
	t: now/time/precise - t
	print [
		t ">>"
		copy/part t: trim/lines mold code 80
		if 80 < length? t [".."][""]
	]
	unless unset? :r [r]
]
```

[17:59](#msg578d18f33d74e5a0165537fb)Gregg I like your version with integrated loop. I also think we would benefit from having a timing function in red by default.  
My one has the benefit of printing the time taken but still return the result.

greggirwin

[18:00](#msg578d192c3d74e5a016553d2b)@pekr, we don't have a great/easy process for vetting new mezzanines. We can patch and PR, but need to not overload Doc (who has to see the big picture). In the meantime, I've started a gist dump of mezzanines: https://gist.github.com/greggirwin/d0412f0c3d8e1ce4dfe26afc643742f1

x8x

[18:01](#msg578d198f841e619d16fe6c92)Gregg that's all you had on Altme?

greggirwin

[18:01](#msg578d19909f35137e67cbb52f)@x8x, mine doesn't print because I use it to collect data in production apps as well.

Rebol2Red

[18:02](#msg578d19d2841e619d16fe6d43)Wow, Thanks Gregg. I can use your functions.

greggirwin

[18:03](#msg578d19d5ac85f2507abe67ed)What's in the gist right now are some of the more basic things, and cleaning a bit as I go. Not \*nearly* all I have. Note that there's nothing in the `series` section yet. That's my biggest group.

[18:03](#msg578d19f70720fd587a8e886e)A lot of them were on Altme from a few years ago though. So I'm also eliminating the things that are standard in Red now.

x8x

[18:03](#msg578d19fc2d04e058517b6560)Ok, I thought its use is mostly in testing, but make sense 8-)

greggirwin

[18:04](#msg578d1a350720fd587a8e8b47)I have another little set of funcs...need to get to work here, but will get them up real quick.

x8x

[18:04](#msg578d1a42841e619d16fe6f49)Very useful the ones in the series section!

greggirwin

[18:07](#msg578d1ad1ac85f2507abe7d50)Going to have to port my other little funcs. No `use` in Red yet.

[18:33](#msg578d20e12d04e058517bcec8)Here we go. Actually pretty much rewrote it quickly for Red, since we don't have `use`, but we do have `map!`, and `difference` doesn't work on `time!`. Consider it a draft.

```
time-marks: object [
	data: #()

	_key: func [key][(any [key #__DEFAULT])]
		
	_get: func [key][data/(_key key)]
	_set: func [key][data/(_key key): now/time/precise]
	_clr: func [key][data/(_key key): none]
	
	set 'get-time-mark   func [/key k] [_get k]
	set 'set-time-mark   func [/key k] [_set k]
	set 'clear-time-mark func [/key k] [_clr k]
	
	set 'time-since-mark func [/key k] [
		if none? _get k [
			print ["##ERROR time-since-mark called for unknown key:" _key k]
			return none
		]
		now/time/precise - _get k
	]
]
;print time-since-mark
;set-time-mark
;print time-since-mark
;wait 1
;set-time-mark/key 'a
;wait 2
;print [time-since-mark  time-since-mark/key 'a]
```

canyonblue77

[23:50](#msg578d6b472d04e058517fa269)This is what is so cool to me about Red... I didn't know how to delete an item in a series at a specific index so I made my own and it just worked.  
\`

[23:50](#msg578d6b56ac85f2507ac2fd2b)

```
xarr: [ 5 7 8 1 8 7 5]
del_at_index: function [ mylist [series!] i [integer!]] [
                    x: take at mylist i
                    return mylist  
]
del_at_index xarr 4
```

greggirwin

[23:53](#msg578d6bdd0720fd587a929970)`remove at xarr 4`

canyonblue77

[23:53](#msg578d6bf616487c5e514a51b7)lol, figured it was something overly simple

[23:58](#msg578d6d0a0720fd587a92aaad)So my understanding of it is that the series is passed by reference so any changes made inside of the function are permanent... which I guess would mean that "mylist" wouldn't need to be explicitly returned ???

greggirwin

[23:59](#msg578d6d7bac85f2507ac30df1)Correct. The last evaluated value is returned. You only \*need* to use return when exiting a function early. An important design aspect, though, is that you want to consider how a user may chain calls when deciding what to return.

## Tuesday 19th July, 2016

endo64

[07:59](#msg578dddc916487c5e514f03d1)I usually use `repeat` instead of `for` or `while` (of course there are times I need to use `while` as there is a nuance)

```
repeat i 5 [print i i: i + 2]
```

meijeru

[08:02](#msg578dde903d74e5a0165e3462)@endo64 Have you tried the above code? It prints 1 to 5 and results in 7. I have difficulty thinking that this is what you intended. If you wanted to print the first 5 odd numbers, the following might work:

```
i: 1 loop 5 [print i i: i + 2]
```

endo64

[08:15](#msg578de1abac85f2507ac7b89d)Sure I just wrote it as an example. Didn't check the output.

greggirwin

[13:31](#msg578e2bafac85f2507acb99ca)But it is a great example of why we need to document loop counter behavior.

Rebol2Red

[19:08](#msg578e7a9f16487c5e5157bbbd)Is it already possible to write to ftp something like write/binary ftp://xxxx %file.jpg  
If so how to provide the password and username. Maybe the same as in rebol2 or rebol3?

pekr

[19:19](#msg578e7d2f2d04e058518ce325)I think not. Red currently has just a so called "simple-io" implementation. Not a full stack protocol support. Maybe piping it via a Curl could be an interim alternative?

[19:19](#msg578e7d573d74e5a016670347)Also - ftp is said being a tricky protocol to get right, we will see, which way will we get it supported in terms of Red ....

Rebol2Red

[19:25](#msg578e7eaf0720fd587a9fb48a)I'll just have to wait for it. Thanks.

[21:04](#msg578e95f916487c5e515936ef)

```
time: now/time
print type? time/second
```

float ???  
Why not integer? Because of precision?

greggirwin

[21:28](#msg578e9b7275045f8767035865)Using float is a temporary solution.

## Wednesday 20th July, 2016

endo64

[07:45](#msg578f2c2c3d74e5a0166e4c0c)But it sometimes useful, as in SQL Server DateTime values are like HH:MM:SS.FFF so the seconds is float!

rebolek

[08:33](#msg578f3743a903740022b0589a)@greggirwin Are you sure? It’s `decimal!` in Rebol, so `float!` seems appropriate in Red.

ralfwenske

[09:38](#msg578f46ab3d74e5a0166f6680)To determine on-down / on-up event offsets relative to 'window one can calculate it by adding up parent offsets.  
Simpler would be to use the 'window event: unexpectedly it returns the offset of the face directly under the mouse.  
Doesn't seem useful as I cannot determine what face these offsets belong to.  
Is that intended behavior?

```
do-down: func [face [face!] event [event!]][
	print ["down at" face/type event/offset]
]
do-up: func [face [face!] event [event!]][
	print ["up at" face/type event/offset]
]

view [
	panel 100x100 blue on-down [do-down face event] on-up [do-up face event]
	area  100x100      on-down [do-down face event] on-up [do-up face event]
 do [
	self/actors: make object! [
		on-down: func [face [face!] event [event!]] [do-down face event]
		on-up:   func [face [face!] event [event!]] [do-up face event]
		]
	]
]
```

dragging the mouse from one panel into the other returns this:

```
down at panel 49x34
down at window 49x34
up at area 37x32
up at window 37x32
```

dockimbel

[09:43](#msg578f47b79f35137e67e5f558)@ralfwenske It's a known limitation, there's ticket about it: https://github.com/red/red/issues/1636 We need an improved event! type implementation to unlock that feature (and many others).

ralfwenske

[09:47](#msg578f48aa0720fd587aa824d1)@dockimbel Thank you - will work around until then.

SteeveGit

[10:35](#msg578f540f4feb3a76689406b6)@ralfwenske , @dockimbel Yes, The event is linked to the most inner face.  
The parent face may also receive this event, if the actor does not stop it.  
To stop it, use \*\*'done\** or \*\*'stop\** as return value.  
e.g.

```
do-down: func [face [face!] event [event!]][
    print ["down at" face/type event/offset]
	'done 
]
```

I feel that the current behavior is convenient. I don't want the event/offset being modified when cascading.  
Because it's linked to the event/face, not to the face of the actor as in your sample:

```
do-down: func [face [face!] event [event!]][
    print ["down at" face/type event/offset] ; <- face and event/face not always the same 
    print ["down at" event/face/type event/offset]
]
```

[10:40](#msg578f5518f05182092e3e3532)Also, changing that, would break my current devs ;-)

pekr

[10:40](#msg578f552b16487c5e51610529)What are you cooking? :-)

dockimbel

[10:43](#msg578f55d03d74e5a0167029b5)@SteeveGit We need to change it, the current behavior is wrong. The event, when processed by parent faces, needs to provide an offset relative to them, not to their child or grandchild.

ralfwenske

[10:45](#msg578f565bac85f2507ad9705c)@SteeveGit I now understand the logic - however - even if cascaded down: to be useful a relative offset is needed (as @dockimbel says).

[10:48](#msg578f570d16487c5e5161116c)@pekr I'm getting to know the Gui better. Attempting to create templates which allow resizing... until such time when the Gui will do it elegantly.

SteeveGit

[11:05](#msg578f5b0e69e7f1b17e4e181d)@dockimbel Well ok but could I suggest to make these modifications (events related) a top priority. More we waiting, more I'm impacted ;-)

greggirwin

[17:17](#msg578fb20dac85f2507ade8c45)@rebolek, what I mean is that I think time! will move to the new decimal! type Red gets eventually.

## Thursday 21st July, 2016

Rebol2Red

[11:12](#msg5790ae1b75045f87671a7ad1)Maybe a stupid question but if i run red \[scriptname] in a windows10 shell i get no output while using print. (There is a gui opening and showing the output though). Is output not redirected to stdout?

pekr

[11:29](#msg5790b20d16487c5e51708819)I think that the reason might be, that the red executable is in fact R2 (Rebol) interpreter with some bundled stuff. It launches real GUI console here. What you should do is to compile pure Red console, I do it the following way:

\- install R2/View  
\- hit enter on red.r, select Allow all on the security requester  
\- run: rc %environment/console/console.red .... this will output console.exe into Red root dir  
\- in shell, run: console your-script.red

dockimbel

[11:33](#msg5790b30aac85f2507ae92121)@Rebol2Red Just use `red --cli` to get the output redirected to the shell. By default, Red is using its own GUI console, not the system shell. `--cli` forces it to use the system shell.

pekr

[11:35](#msg5790b38b2d04e05851a5bc15)Good to know :-)

Rebol2Red

[11:35](#msg5790b3979f35137e67f605b9)Aha, will the compiled executable send the output to stdoud then? And is that the reason about the following error. I made a path to red. When i open a shell in a directory with no red executable in it and do red \[script] i get: PROGRAM ERROR: Invalid encapsulated data. It is not nice to put red.exe in all the directories.

pekr

[11:36](#msg5790b3c916487c5e51709d99)Not sure ... at first run, it seems to compile console in the background, then it should use it ....

Rebol2Red

[11:48](#msg5790b6a90720fd587ab92184)Thanks. It works with the --cli and also when compiled.  
Does anyone get the same error i mentioned? (maybe i did something wrong at setting the path to it in windows. When it is windows related i'll have to fix that)

dockimbel

[11:55](#msg5790b81c0720fd587ab936f0)@Rebol2Red Not your fault, it's a known issue with the Rebol encapper we are using for producing `red.exe`. See a workaround there: https://github.com/red/red/issues/543 Once we'll rewrite the toolchain in Red (after 1.0), this issue will be gone, as well as the Rebol dependency.

Rebol2Red

[11:58](#msg5790b8e73d74e5a01680f1e4)Thank you very much. I will look at the issues first before asking.

dockimbel

[12:01](#msg5790b9a3ac85f2507ae971fb)You're welcome.

dander

[20:00](#msg579129d216487c5e51770260)@Rebol2Red @dockimbel it looks like Chocolatey also manages to work around that issue with the shim exe it generates (which is in the path)  
...by the way, I haven't forgotten about automated build package generation. It shouldn't be too difficult to add. I just need to find a solid block of time to work out the details and do some tests, etc.

## Friday 22nd July, 2016

canyonblue77

[19:26](#msg57927365959ee82b3e3c1d09)ok.... i'm being dense again.... trying to pull a sub-series from a series. Basically something like `pick series index length` if there's something built-in I'm totally missing it. Worst case was going to create a function that just did a repeating "pick" of index+1 and return a new series as the sub

pekr

[19:39](#msg57927689959ee82b3e3c3c68)I dont understand what you mean, sorry. Pick returns the element. Have you tried with select, at, etc functions?

[19:40](#msg5792769fb92e27447f9adf44)Sorry, I am just on the cell phone

Cybarite

[20:46](#msg5792863e683f0a5c4dcaa0fe)@canyonblue77 Rebol series documentation applies 1.4 Extracting a Sub-series at this page http://www.rebol.com/docs/core23/rebolcore-6.html#section-1.4

[21:03](#msg57928a3d89521c0718aae2b0)

```
world-series: [a b c d e f g h i j k]
national-series: copy/part skip head world-series 2 3
```

canyonblue77

[21:07](#msg57928b2232bd01d843a4fb95)I came up with

[21:08](#msg57928b47959ee82b3e3d1b07)

```
long: [z r f v t g b y h n u j e d w e r t y]
sub: copy/part (skip long 12) 2
== [e d]
```

[21:08](#msg57928b6a1b9de56c0ecb3367)sorry, that r should be "long"

[21:10](#msg57928bc132bd01d843a5016c)Just found the edit feature :-D

[21:12](#msg57928c541d2852c843736d7d)Ahhh! I see the head ensures we are starting from the beginning of the series... is that right?

## Saturday 23th July, 2016

PeterWAWood

[01:44](#msg5792cbf3959ee82b3e3f2822)That is correct, head positions the index to the first value in the series.

canyonblue77

[02:23](#msg5792d5169d9e974a7f688cdd)Thanks!! @PeterWAWood @Cybarite @pekr

Cybarite

[02:23](#msg5792d5330d432ceb0981f395)@canyonblue77 yes sorry I checked out a bit on Friday night. The problem that I often walked in to on a series is knowing where you are in the series. I put 'head' in this clip to make sure you don't add a few lines inbetween which might change where you are in the series..

Rebol2Red

[13:29](#msg5793712f32bd01d843abe516)How can i make words dynamic?

```
set 'b4 22
probe b4 ; == 22
```

How about a loop:

```
repeat i 3 [set reduce[rejoin['b i]] i] ; thought this might work
print [b1 b2 b3] ; *** Script Error: invalid argument: "b1"
```

pekr

[14:12](#msg57937b6b1b9de56c0ed30266)try `to word! rejoin ['b i]`

Rebol2Red

[14:30](#msg57937f719d9e974a7f6e147e)

```
repeat i 3 [to word! rejoin ['b i] i]
print [b1 b2 b3]  ;*** Script Error: b1 has no value
```

I will try with the latest version

Nope

pekr

[14:51](#msg579384809d9e974a7f6e36ab)

```
red>> b1: 22
== 22
red>> i: 1
== 1
red>> get to word! rejoin ['b i]
== 22
```

Rebol2Red

[15:08](#msg579388849d9e974a7f6e683a)That works, but not with the loop? Maybe it is because of a local assignment. Because the vars outside of the loop has no value?

PeterWAWood

[15:15](#msg57938a101b9de56c0ed3abb9)@

[15:16](#msg57938a5dbc636a263ede7f62)@Rebol2Red You need to set the words that you have dynamically created.

[15:18](#msg57938ac232bd01d843acc5a9)eg set to word! rejoin \['b 1] 1

Rebol2Red

[15:20](#msg57938b3b67c448730eed671a)That was it. Thanks.

jouborg\_twitter

[20:19](#msg5793d15d1d2852c8437e86b4)@jouborg\_twitter  
hi, I'm trying to write a simple echo server for websocketd  
code: https://gist.github.com/joubertnel/43bba914a96f4b2319fec7cae8e4f18e  
the code does what I expect when running on the console.  
but when I run with websocketd (http://websocketd.com), STDOUT seems to only be triggered once the program exits. Is this because of STDIN/STDOUT buffering?  
something else?

Rebol2Red

[21:27](#msg5793e14ab92e27447fa72ed8)Try to compile with: red --cli echo.red  
I'm not sure if this will help you, but just try it.

[21:51](#msg5793e6e832bd01d843b055ea)&gt; Nenad Rakocevic about a stdout question i had:  
@Rebol2Red Just use red --cli &lt;scriptname&gt; to get the output redirected to the shell.  
By default, Red is using its own GUI console, not the system shell.  
\--cli forces it to use the system shell.

jouborg\_twitter

[22:52](#msg5793f51c67c448730ef13e2e)@Rebol2Red the --cli argument results in this error: "\*\** Error: cannot access argument file"

[22:52](#msg5793f523bc636a263ee27c3c)so not sure that that's a valid command line arg

[22:52](#msg5793f52f67c448730ef13e61)(I'm on OS X, if that matters)

[22:56](#msg5793f618959ee82b3e48c579)looking at the source for "input" I see it just calls out to "ask", which in turn manipulates the console. Ultimately, I see a function "stdin-deadline" (https://github.com/red/red/blob/23a63d20ac73bd30419791ca58bc696f3aeac7be/environment/console/input.red#L447) being called. It is not available externally, so I'm going to have to experiment to see whether it gives me the right handle on stdin.

Rebol2Red

[23:01](#msg5793f75bbc636a263ee2899e)Bump. I think it matters. I'm on windows10.  
But it looks like Red can't find the script. Maybe placing (a copy) of the executable Red in the same directory where the script is?

jouborg\_twitter

[23:03](#msg5793f7db1d2852c8437f7358)I still see the same, even after moving the script into the same directory. Does --cli work for you? Or do you also get the same error?

[23:05](#msg5793f830959ee82b3e48d990)Looking at the docs I see "Note: On Non-Windows platforms, the REPL runs by default in CLI mode. But on Windows, the default is to run as gui-mode. To run it in the command line mode, invoke the red binary with the option `--cli`"

Rebol2Red

[23:08](#msg5793f8e4959ee82b3e48dd3a)Oops, i thought you were using windows. I only have knowledge of windows and linux not OS X.  
No errors when using --cli  
(I find it strange though that the output is buffered when the default on OS X is CLI mode. I had a simular problem without using the CLI mode, but could fix it with the --cli command)

jouborg\_twitter

[23:14](#msg5793fa6067c448730ef15fd8)I'm not sure that the problem I'm experiencing is due to buffered output.

[23:14](#msg5793fa691d2852c8437f8316)it was just a guess

[23:15](#msg5793fa749d9e974a7f727d3b)I'm now digging in deeper into how input is read from STDIN

[23:15](#msg5793fa8a1b9de56c0ed75af5)it is a tower of stuff, including history management

Rebol2Red

[23:22](#msg5793fc23bc636a263ee2a7e8)I still find it strange that you get an error 'cannot access argument file' when using --cli.  
It does'nt sound logical to me. If it is default in OS X i do'nt expect you to see an error like that.  
But i have to admit that i am not a developer, but just a user of Red who is trying to help others.

jouborg\_twitter

[23:25](#msg5793fcf2b92e27447fa7fd7b):-)

## Sunday 24th July, 2016

jouborg\_twitter

[00:57](#msg579412951d2852c843801cee)I've got the simple websocketd echo server working in Rebol. Looks to me like the problem in Red is the way console I/O (and I'm guessing, specifically input) is handled in Red

greggirwin

[00:59](#msg5794130732bd01d843b186d1)@qtxie will probably be able to say, as soon as he checks in. My guess, after glancing at things, is that it's probably just buffered in the current implementation. This is a good test.

jouborg\_twitter

[01:00](#msg5794131e67c448730ef1faa5)In Red, when asking for input, e.g. data: input, there's a line printed before the input prompt. In Rebol there isn't.

qtxie

[02:49](#msg57942cad9d9e974a7f73bd30)@jouborg\_twitter Does your input string end with a linebreak(LF)? if not, the `input` function won't return, then the `print msg` will not run.

canyonblue77

[06:57](#msg579466f21d2852c843826d84)

```
multiply_big "4520345347346508738273465" "2304634563457837852066527845"
```

I created a "multiply" for extremely large numbers however the numbers have to be entered as strings... is there anyway to allow them to be entered without the quotes but not get treated like "out of bounds" integers ? Not a big deal at all, just curious!

dockimbel

[11:28](#msg5794a66d32bd01d843b5cf18)@canyonblue77 You could try modifying the console code, though, you need to do it in the sources, changing the console code at runtime won't have any effect, as it's fully compiled.

canyonblue77

[11:53](#msg5794ac201d2852c843849693)Haha, no that's ok. That 'd be overkill for a silly coding experiment. Thanks much though!!

dockimbel

[12:23](#msg5794b3291b9de56c0edc3ec1)@canyonblue77 You could also rewrite a custom console, here is a short example to play with:

```
digit: charset "0123456789"

load-bigints: function [s [string!]][
	parse s [any [p: 10 500 digit e: insert e {"} insert p {"} | skip]]	
	s
]

multiply_big: func [a [string!] b [string!]][rejoin [a b]]

my-console: function [/local res][
	forever [
		code: ask "custom>> "
		if code = "q" [exit]
		set/any 'res try/all [do load/all load-bigints code]
		case [
			error? :res [print form :res]
			not unset? :res [print ["==" :res]]
		]
	]
]
my-console
```

[12:23](#msg5794b35932bd01d843b6365c)

```
lisp
red>> my-console
custom>> 
custom>> multiply_big 123456789123456789  789456789456789456789456
== 123456789123456789789456789456789456789456
```

[12:26](#msg5794b3dfbc636a263ee7f3ee)Before attempting to `load/all` the user input, I call `load-bigints` which will wrap big ints into double quotes, so they can be processed as strings. ;-)

jouborg\_twitter

[13:55](#msg5794c8bebc636a263ee8a2e3)@qtxie yes, it does.

[13:56](#msg5794c92667c448730ef73dfe)@qtxie I'm going to dig in a little more, but I wonder whether the issue is that in Red, the "input" function results in a line being printed to console before input is read, while in Rebol there's no additional line. I tried the websocketd echo in Rebol and it works perfectly. Same code as Red. Here are the two gists:

[13:57](#msg5794c9301b9de56c0edced34)https://gist.github.com/joubertnel/43bba914a96f4b2319fec7cae8e4f18e

[13:57](#msg5794c9381b9de56c0edced4c)https://gist.github.com/joubertnel/b75e2300175a7e7cae9a5e226050fe0a

qtxie

[14:25](#msg5794cfddbc636a263ee8e014)Not sure what is wrong in Red. Need to try websocketd to debug it.

[14:27](#msg5794d054b92e27447fae562e)Maybe because the stdout is buffered. And also the `input` function expect UTF-8 encoded string.

jouborg\_twitter

[14:37](#msg5794d2c732bd01d843b739a3)My command line for starting websocketd with my script above is: `./websocketd --port=8080 --devconsole ./red echo.r`

[14:40](#msg5794d34c959ee82b3e4f25a5)could be because stdout is buffered; in some websocketd language examples, they flush stdout (e.g. for Swift - https://github.com/joewalnes/websocketd/blob/master/examples/swift/greeter.swift), while in others you don't have to (e.g. C# https://github.com/joewalnes/websocketd/blob/master/examples/c%23/Echo/Program.cs)

[14:42](#msg5794d3d567c448730ef7907c)good morning :-)

[14:48](#msg5794d52fbc636a263ee90ee9)I see print's definition is:

[14:48](#msg5794d53d959ee82b3e4f3463)`print: make native! [[ "Outputs a value followed by a newline" value [any-type!] ] #get-definition NAT_PRINT ]`

[14:49](#msg5794d58b32bd01d843b7531b)Still learning to navigate the code base, but NAT\_PRINT is opaque to me. See it "defined" in macros.reds, but nothing elsewhere in the source that seems to back it up

[14:49](#msg5794d59167c448730ef7a935)mysterious! :-)

[15:24](#msg5794ddb6959ee82b3e4f70b4)@qtxie I can try flushing output to see whether it solves the issue. Any pointers on how?

[18:31](#msg5795096467c448730ef9b18a)@qtxie @PeterWAWood figured it out!

[18:33](#msg579509f9b92e27447fb08ff7)got flushing working for print (stdout) and the websocketd echo now works. Not happy with how/where I'm exposing the `flush-file` / `fflush` from so going to experiment. Also need a way to constrain the stream to STDOUT, and not null/all.

greggirwin

[20:30](#msg57952552bc636a263eebed0b):point\_up: \[July 24, 2016 6:23 AM](https://gitter.im/red/help?at=5794b3291b9de56c0edc3ec1) A custom console in under 20 lines of code. How can you not like that? :^)

pekr

[21:11](#msg57952f181b9de56c0ee0893f):-)

qtxie

[22:50](#msg5795464232bd01d843bb1790)@jouborg\_twitter :+1:

## Monday 25th July, 2016

jouborg\_twitter

[00:16](#msg57955a78959ee82b3e539b86)how can I get a handle on STDOUT as a stream (as per stdio.h - http://linux.die.net/man/3/stdio)?

qtxie

[00:25](#msg57955c63959ee82b3e53b00d)The only way to do it is to write your own routine! for now. We'll be able to handle it in Red when we get complete I/O support in 0.7 .

jouborg\_twitter

[00:41](#msg57956035b92e27447fb3560d)OK. Is there already a branch that has \*some* of the additional I/O functionality? I'd like to conform to the style/location you're thinking for it.

[01:08](#msg579566871d2852c8438b0b80)Or perhaps I can contribute

qtxie

[01:47](#msg57956fc6683f0a5c4dcab188)Nope. We haven't started it yet. :joy:

[01:48](#msg57956fecd885c4d548dee8b5)There are some functions in simple-io.reds, maybe you can reuse it.

jouborg\_twitter

[13:23](#msg579612e893148c6b21dca4bd)OK, I'll take a look

## Tuesday 26th July, 2016

rpherman

[10:15](#msg579738483383eb622144380f)I

[10:16](#msg5797388900c8ebdd0e24b3b5)I'd like to create a livecoding program in Red. Can anyone update me on what audio and opengl libs are available? I am playing with Gibber and Mathbox (check out the fm visualizer!) for comparison.

pekr

[10:25](#msg57973a897c9324e20eff0fdc)Sound is not available officialy yet, nor is any opengl bridge. Some parts (fonts) of Windows gui are using Direct 2D. Such special features will come later imo ...

dockimbel

[10:28](#msg57973b5e93148c6b21df2527)@rpherman You can find on the \[contribution](http://www.red-lang.org/p/contributions.html) page, links to SDL, OpenGL and GFLW bindings, though they are low-level, just wrappers over the C API, so they can be used from Red/System only (means you need to write routines to interface those low-level layers with Red language itself).

jouborg\_twitter

[12:38](#msg579759b57c9324e20eff52af)Ah, that's a great page. I hadn't come across it before. And didn't know there's an OpenGL binding yet. The Trello board lists OpenGL bindings as an (outstanding) item. https://trello.com/c/jdO6Velu/31-simple-opengl-4-x-wrapper

[12:45](#msg57975b4d7c9324e20eff5753)ha, but the code is pretty old; e.g. no OS X support

[12:45](#msg57975b5b00c8ebdd0e24ff0a)but would be a good project to take and modernize

dockimbel

[13:44](#msg5797694093148c6b21df913f)@jouborg\_twitter As I said above, it's just a low-level wrapper over OpenGL. What we have in mind for Red is a higher abstraction, like we did for the Red/View engine for GUI.

greggirwin

[14:10](#msg57976f7100c8ebdd0e253555)For sound, you can find a non-native solution at http://www.mycode4fun.co.uk/red-sound-engine

## Wednesday 27th July, 2016

jouborg\_twitter

[14:19](#msg5798c2e400c8ebdd0e283007)@dockimbel sure. Then I'm wondering - how should potential contributors think about the Trello board items? For example, the OpenGL one is titled "Simple OpenGL 4.x Wrapper" and body is "OpenGL 4.X Wrapper providing same funcionatily as OpenGL header for C/C++. It should provide mappings to OpenGL API functions, types and others apadting to make it mor Red-like." I suppose the low-level bindings are still necessary as a building block / dependency for a higher-level abstraction.

[14:19](#msg5798c30837c95e2446ba2de6)Are there any thoughts written down about the shape of the higher level abstraction? That way, if someone starts tackling https://trello.com/c/jdO6Velu/31-simple-opengl-4-x-wrapper they can take that into account

[14:24](#msg5798c4093383eb622147aceb)btw, I can take a swag at organizing the trello board a little if there's interest

## Thursday 28th July, 2016

canyonblue77

[02:15](#msg57996aac37c95e2446bbf903)@dockimbel Custom console works like a charm! Thanks!! I played with the parse to make sure it only converts long numbers for my functions and added if statement to allow for "submitting" empty lines. I can't believe how easy!!  
\`

[02:15](#msg57996ab8d155b0294e100a29)

```
Red []
digit: charset "0123456789"
longnum: [8 100 digit]
myfunc: ["long_join" | "long_rev_join" | "long_flip_join"]

load-bigints: function [s [string!]][
	parse s [myfunc space insert {"} longnum insert {"} space insert {"} longnum insert {"}]
	s
]

long_join: function [s1 [string!] s2 [string!]] [ 
	trim/all form reduce [s1 s2]
]
long_rev_join: function [s1 [string!] s2 [string!]] [ 
	trim/all form reduce [( reverse s1) (reverse s2)]
]
long_flip_join: function [s1 [string!] s2 [string!]] [ 
	trim/all form reduce [s2 s1]
]

calculator: function [/local res][
    forever [
        code: ask "calculator>> "
        if code = "q" [exit]
	   if code <> "" [
            set/any 'res try/all [do load/all (load-bigints code)]
            case [
                error? :res [print form :res]
			not unset? :res [print ["==" :res]]
        	  ]
	   ]
    ]
]
calculator
```

dockimbel

[05:21](#msg579996747c9324e20e04a90a)@canyonblue77 Glad you have fun with it. ;-)

[05:57](#msg57999eded155b0294e10642a)@jouborg\_twitter That entry is part of \[Idead for contributors](https://trello.com/b/tCypaglW/ideas-for-red-contributors) which was opened a couple of years ago when we applied to Google Summer of Code. Some entries have been added by contributors since them (like the OpenGL one), but this board has been left unsupervised, as we use only now \[this one](https://trello.com/b/FlQ6pzdB/red-tasks-overview). No work so far has been done for defining an OpenGL high-level abstraction, though, using object! values for modelling a 3D world and a DSL on top of that, will probably be the way to go.

Rebol2Red

[09:25](#msg5799cf8f7c9324e20e052828)I want a window to dissapear when clicking ok or pressing enter.  
The following code is adapted from rebol2 (which works).  
What's the Red'ish way of doing this?

```
key-event: func [face event] [
	if event/type = 'key [
		if event/key = #"^M" [unview]
	]
	event
]
insert-event-func :key-event
view [
	text "Click ok or press enter"
	button "ok" [unview]
]
remove-event-func :key-event

print "After ok clicked or enter pressed"
```

dockimbel

[09:29](#msg5799d0603383eb62214a31c7)@Rebol2Red Same in Red.

Rebol2Red

[09:29](#msg5799d07b7c9324e20e052a76)

[09:31](#msg5799d0f993148c6b21e5188c)Maybe with on-key?

dockimbel

[09:38](#msg5799d27c7c9324e20e052f43)@Rebol2Red `on-key` is a face-local event, it will only work when the face has focus.

Rebol2Red

[09:39](#msg5799d2e48fb4820a466b0c6d)I get it. Thanks.

## Sunday 31st July, 2016

canyonblue77

[05:27](#msg579d8c5807d2d2396e2f2bb3)

```
;; FYI, maybe this is a bug or, cos <> cosine ??
red>> cosine 90
== 0.0
red>> cos 90
*** Script Error: cos does not allow integer! for its angle argument
*** Where: cos
red>> cos 90.0
== -0.44807361612917
red>>
```

[05:30](#msg579d8d0d9684847b373fa584)nevermind, got it.... cos N = cosine/radians N

dockimbel

[05:31](#msg579d8d4979f7597137552d75)@canyonblue77 See their respective help strings. `cos` takes radians, `cosine` takes degrees (by default).

canyonblue77

[05:34](#msg579d8dee9684847b373fa6b9)@dockimbel LOL, yeah I figured it out, my mistake I keep using the "Red by Example" site not the console help which is more up to date. (Not saying anything bad about the RBE site, just that console help is more accurate)

## Monday 1st August, 2016

SoleSoul

[21:35](#msg579fc0a01c2bf6621bb39f9e)Hi, a small question. Why does f1/text change only twice when repeatedly clicking on the button in this example? (write something in f1)

[21:35](#msg579fc0b500663f5b1b42a02a)

```
view [
	f1: field
	return
	button "Reverse!" [f2/text: reverse f1/text]
	return
	f2: field
]
```

greggirwin

[22:05](#msg579fc7961c2bf6621bb3b0fa)It works as expected here. Perhaps a recent fix?

SoleSoul

[22:06](#msg579fc7d8836d2d02115bc253)I downloaded the automatic build an hour ago. I just pasted this code snippet into Red's GUI console. f1 changes twice, f2 changes repeatedly.

greggirwin

[22:06](#msg579fc7e5836d2d02115bc267)But do keep in mind that `reverse` modifies the series, so you may want to copy.

SoleSoul

[22:06](#msg579fc8030bd017c16e3376cb)Yeah, the initial intention was to copy but I forgot to copy and saw this puzzling behavior

greggirwin

[22:07](#msg579fc80900663f5b1b42b166)Ah, I see now. I was just looking at 'f2.

[22:10](#msg579fc8c69e85d3e8267e6f30)It looks like f1/text changes each time, but f1/data does not, so the face doesn't update.

SoleSoul

[22:11](#msg579fc91900663f5b1b42b3b7)Why does it change twice then?

greggirwin

[22:12](#msg579fc93547659bfb10867ebf)If you manually force an update of f1/data it works. Someone on Team Red will have to say what the expected behavior is.

SoleSoul

[22:12](#msg579fc946c915a0e426b433bc)Also, it's updating the f2 face through its /text and this works.

greggirwin

[22:12](#msg579fc9460bd017c16e3379a2)I don't know.

SoleSoul

[22:13](#msg579fc986e2ff9ec76e4e2aeb)Thanks! I hope someone will notice the question and tell me if it's a fruit of my noobness in Red or something real.

greggirwin

[22:13](#msg579fc98e1c2bf6621bb3b4c9)The object ownership system doesn't track `reverse`?

[22:15](#msg579fc9e60bd017c16e337abb)The blog entry says it should though.

SoleSoul

[22:16](#msg579fca2300663f5b1b42b5f3)One thing is for sure, I don't suspect we'll find a doc which says that reverse should be tracked up to two times :)

greggirwin

[22:16](#msg579fca2e47659bfb108680d5):^)

SoleSoul

[22:21](#msg579fcb4e836d2d02115bc8e9)I'm going to sleep now. Thanks for checking. I'll login again in the morning.

qtxie

[23:49](#msg579fe0120bd017c16e33a372)@SoleSoul This is caused by when you assign `f1/text` to `f2/text`, the \*\*owner\** of the string `text` changed from `f1` to `f2`. When you reverse the `text` later, the ownership system will notify `f2` instead `f1`, so no update in f1.

[23:54](#msg579fe1389e85d3e8267e9aca)To work with the ownership system is a bit tricky. ;-) As for why f1 change twice (should be just once), check \[this code](https://github.com/red/red/blob/master/modules/view/view.red#L290) for detail. ;-)

## Tuesday 2nd August, 2016

greggirwin

[00:33](#msg579fea4e47659bfb1086b79f)Interesting. If multiple object words refer to a series, the last one set takes ownership? (I think that's what https://github.com/red/red/blob/master/modules/view/view.red#L293 does)

dockimbel

[04:17](#msg57a01ec4e2ff9ec76e4ebe28)@greggirwin Faces cannot share the same series for fields like `/text` and be able to auto-update, the current ownership system allows only one owner per series. There's a ticket about that already (posted by Rebolek). We'll see in next releases how to improve that.

greggirwin

[16:23](#msg57a0c8e70bd017c16e35a571)It makes sense, and we should be able to do advanced things on our own with object ownership and dynamic reaction linking.

## Wednesday 3th August, 2016

Rebol2Red

[11:05](#msg57a1d00c9e85d3e82682f32b)Can someone help me to parse this correct?

```
rule: [any ["every"|"any"|"an"|"a" skip "is" "a|an" skip] to end] 
print parse "every man is a human" rule ; must give true
print parse "every man ist a human" rule ; must give false, because of "ist" (but the result is true)
; The rule must be wrong because i get 2 times true
```

SteeveGit

[11:13](#msg57a1d1e52c10fb940877b0b1)@Rebol2Red Use \*\*parse-trace\** to debug your code.

[11:14](#msg57a1d228c2cebb0412466cf6)Among other misses. \*\*Skip\** only skip one character,not a word.

Rebol2Red

[11:16](#msg57a1d27047659bfb108acede)How to use parse-trace?

SteeveGit

[11:16](#msg57a1d2746085a4026515e894)\*\*to end\** will always validate the whole rule. Use \*\*end\** instead

[11:16](#msg57a1d2a12c10fb940877b0c3)replace \*\*parse\** by \*\*parse-trace\*\*. That's all.

Rebol2Red

[11:19](#msg57a1d3351c2bf6621bb82366)Thanks, Whow, I have to look into the results of parse-trace.  
How can i skip words?

SteeveGit

[11:21](#msg57a1d3ba2c10fb940877b0d3)Currently, You are parsing a string! not a block of word!.  
Switching to a block of words, makes writing the rules simpler in your case.

Rebol2Red

[11:26](#msg57a1d4d6c915a0e426b894ab)I am stuck. Must i make blocks of all the strings? Also in the rule? Use literal words?

```
rule: [any [[every|any|an|a] skip [is] [a|an] skip] end] 
print parse-trace [every man is a human] rule ; must give true
print parse-trace [every man ist a human] rule ; must give false because of "ist"
```

This does not work  
ps: I have looked at a lot of parse examples on the internet but doesn't find anything like what i want do.

SteeveGit

[11:34](#msg57a1d6b92c10fb940877b0e0)Ok, Instead of a block of words, I converted it to a block of strings with \*\*split\*\*.

```
rule: [
	["every" | "any" | "an" | "a"] 
	skip 
	"is" ["a" | "an"] 
	skip
 ] 
print parse-trace split "every man is a human" " " rule 
print parse-trace split "every man ist a human" " " rule
```

Rebol2Red

[11:36](#msg57a1d730c915a0e426b89a9c)Phew, Thanks a lot! I am really bad at parsing. The good thing is i have learned a few things.

SteeveGit

[11:37](#msg57a1d7602c10fb940877b0eb)\*\*ANY\** doesn't do what you think it's doing.

Rebol2Red

[11:38](#msg57a1d7bc1c2bf6621bb82e4c)What does it do ? (I thought it would give true when everything is parsed, like the case statement)

dockimbel

[11:39](#msg57a1d7f200663f5b1b4721e7)@Rebol2Red You need to put spaces between words, `|` is a word, not a delimiter:

```
red>> first [every|any|an|a]
== every|any|an|a
red>> type? first [every|any|an|a]
== word!
```

Rebol2Red

[11:40](#msg57a1d83b9e85d3e826830849)I thought the meaning of | is or.

dockimbel

[11:41](#msg57a1d881e2ff9ec76e52b6da)@Rebol2Red In Parse dialect, the word `|` indicates that an alternative rule is following. Red dialects are using Red syntax, so a word remains a word in all possible dialects.

Rebol2Red

[11:47](#msg57a1d9b90bd017c16e380e22)Thanks for making things about parsing much clearer.

[12:06](#msg57a1de410bd017c16e381a5d)Just one last thing about parsing.  
In regular expressions you can have this "(.) is (.)" (after the dot is an astrix, which doesn't shows up over here)  
How to skip multiple words up to "is" (because i don't know in advance how many to skip)?

dockimbel

[12:11](#msg57a1df819e85d3e826831a54)@Rebol2Red `to "is"`.

Rebol2Red

[12:12](#msg57a1dfb41c2bf6621bb841e2)Face palms

geekyi

[14:19](#msg57a1fd859e85d3e826836bc2)@Rebol2Red I found \[wikibooks]( https://en.wikibooks.org/wiki/REBOL\_Programming/Language\_Features/Parse/Parse\_expressions) really helpful to understand parse

[14:21](#msg57a1fdf2e2ff9ec76e5318b8)Also, checkout \[this tutorial](http://www.codeconscious.com/rebol/parse-tutorial-r3.html) there is similar page in the website for the differences between versions

Rebol2Red

[14:26](#msg57a1ff311c2bf6621bb89666)I used to look at the tutorial you mentioned. Maybe too difficult to me or the differences are too big between r3 and Red. I will look into the differences. Thanks

## Thursday 4th August, 2016

dockimbel

[09:44](#msg57a30e6347659bfb108daf95)@geekyI Good finding, that one is a good Parse doc. Just remember that in Red, splitting is handled by `split` and not by Parse. All the rest of Parse in Rebol2 should work the same in Red.

## Friday 5th August, 2016

planetsizecpu

[16:39](#msg57a4c132857442dc0f5640ca)@dockimbel In my way to learn red, I found no way to print or assign ASCII values  
to char, other from the #"^(41)" mode. For example #"^(x)" (where x is  
integer!) gives an error. What is the correct mode to do so, there will  
ve some function, like chr(x) for example?

canyonblue77

[17:21](#msg57a4cb1f978997001e9963da)@planetsizecpu would this work for you? `dehex rejoin ["%" (to string! 41)]` I'm sure there's a better way but being a noob myself this is what I thought of. YAY rejoin !

[17:27](#msg57a4cc7b483751d50f2c7e02)

```
make-chr: function [x [integer!]] [
	dehex rejoin ["%" (to string! 41)]
	;; dehex append "%" (to string! 41) ;; would work too
]
make-chr 41
```

geekyi

[17:29](#msg57a4cce56bf4dff61d368435)@planetsizecpu are you saying `#"^(41)"` doesn't work for you? Works for me in latest red

[17:29](#msg57a4cd04d097eb6b2cc84e79)

```
red>> #"^(41)" 
== #"A"
```

canyonblue77

[17:31](#msg57a4cd74978997001e9969fc)@geekyI @planetsizecpu Didn't think of trying first LOL, it works for me too. However, it returns with the # tag. Which may be what the OP was looking to avoid ???

geekyi

[17:32](#msg57a4cdbad097eb6b2cc8503b)Oh, ok, programmatically generate characters?

canyonblue77

[17:43](#msg57a4d03e857442dc0f5667fd)@planetsizecpu

```
;;Correction to previous post
make-chr: function [x [integer!]] [
    dehex rejoin ["%" (to string! x)]
    ;; dehex append "%" (to string! x) ;; would work too
]
make-chr 49
== "I"
```

greggirwin

[17:45](#msg57a4d0c5fb162b752ca14685)`to-char: func [i [integer!]][#"^(00)" + i]`

[17:46](#msg57a4d0ea978997001e997337)But it looks like you may want to use hex.

[17:47](#msg57a4d14dd097eb6b2cc8581e)To make it a string, just `form` the result.

canyonblue77

[17:50](#msg57a4d1cc48422f8b49722720)

```
red>> form to-char 41
== ")"
```

How to convert integer 41 to hex ?

greggirwin

[17:51](#msg57a4d22c6bf4dff61d3690af)

```
red>> to-char 49h
== #"I"
```

canyonblue77

[18:26](#msg57a4da4e2f03cf8749ca3822)@greggirwin LOL, thanks for knowing what I meant.... 41 to decimal

## Saturday 6th August, 2016

x8x

[01:19](#msg57a53b35fb162b752ca22db9)Best way to go from 20 to #{20} ?

[01:21](#msg57a53b9bd097eb6b2cc94c4f)I have:

```
debase/base form 20 16
;   #{20}
```

greggirwin

[03:18](#msg57a55707978997001e9a80f9)That works.

dockimbel

[05:12](#msg57a571c8d097eb6b2cc99cd3)We should provide better integer/binary converters in the future.

planetsizecpu

[09:28](#msg57a5adacfb162b752ca2d9e0)Thanks all, what I want is the easyest way to do so with an integer value.

dockimbel

[09:43](#msg57a5b13bfb162b752ca2df92)@planetsizecpu Use `make char!` for converting an integer! to char! (until we get proper `to` support):

```
red>> make char! 41
== #")"
```

planetsizecpu

[10:49](#msg57a5c0a3857442dc0f5824a9)Thats useful for me, thanks.

[10:53](#msg57a5c1c5fb162b752ca2fae4)As I understand there will be to-char(integer!) and to-integer(char!) , that's the same as old basic's functions chr$(int) and asc(char), all together userful for old timer app developers :smile:

PeterWAWood

[11:01](#msg57a5c380978997001e9b273a)Yes in principle but not at the detailed level. A Red

```
char!
```

value is a Unicode Code Point so has a value in the range 0 - 10FFFFFh.

planetsizecpu

[11:04](#msg57a5c43c2f03cf8749cbe015)So, to-char(65) would return "A" and to-integer("A") would return 65?

pekr

[11:05](#msg57a5c46a978997001e9b28af)Yes

planetsizecpu

[11:06](#msg57a5c4a0483751d50f2e500a)That's all I expected

PeterWAWood

[11:08](#msg57a5c51c6bf4dff61d384c2e)

```
to integer! #"A"
```

will return

```
65
```

.

```
to integer! "A"
```

will probably raise a script error. ;-)

dockimbel

[11:09](#msg57a5c557d097eb6b2cca1c2f)@planetsizecpu Not the same, Red is Unicode.

planetsizecpu

[11:13](#msg57a5c65d978997001e9b2ba7)Ok, I will test to make sure, thanks

## Monday 8th August, 2016

planetsizecpu

[08:02](#msg57a83c966bf4dff61d3ca9f2)Today testing I found that seems an issue:  
\--== Red 0.6.1 ==--  
Type HELP for starting information.

red&gt;&gt; about  
Red 0.6.1 - 8-Aug-2016/9:25:30+2:00  
red&gt;&gt;  
red&gt;&gt; a: string!  
\== string!  
red&gt;&gt; append a "A"  
\*\** Script Error: append does not allow datatype! for its series argument  
\*\** Where: append  
red&gt;&gt;  
red&gt;&gt;  
red&gt;&gt; b: "B"  
\== "B"  
red&gt;&gt; type? b  
\== string!  
red&gt;&gt; append b "B"  
\== "BB"  
red&gt;&gt;

[08:07](#msg57a83dd7483751d50f32cbef)As I understand, you cannot append to an empty string! or is there an issue?

dockimbel

[08:12](#msg57a83ee1857442dc0f5ca500)@planetsizecpu This is an empty string: `""`, this is a datatype: `string!`:

```
red>> type? string!
== datatype!
red>> type? "A"
== string!
```

[08:12](#msg57a83efafb162b752ca76d54)A datatype is not a series (like blocks or strings), so you cannot `append` to it.

planetsizecpu

[08:13](#msg57a83f21d097eb6b2cce926b)Thanks a lot ;)

dockimbel

[08:13](#msg57a83f25857442dc0f5ca5a3)Types are first class values in Red/Rebol. See \[Datatypes of Values](http://www.rebol.com/docs/core23/rebolcore-4.html#section-3.2).

x8x

[08:23](#msg57a8417e483751d50f32d45e)@planetsizecpu `a: string!` -&gt; `a: make string! 10`

radebrecht\_twitter

[09:09](#msg57a84c54857442dc0f5cc571)I want to access the github issue api from red. Something like this: `curl -u username:token https://api.github.com/user`. How can I specify https header infos for `read`?

dockimbel

[09:45](#msg57a854c1fb162b752ca7a382)Currently the only way to achieve it is using `write`:

```
response: write/info url [GET [header1: value1 header2: value2 ...]]
```

radebrecht\_twitter

[10:57](#msg57a865a748422f8b4978c1e4)I get a

```
*** Internal Error: reserved for future use (or not yet implemented)
*** Where: write
```

[10:58](#msg57a865b8483751d50f33284d)using red-08aug16-c48c359.exe

dockimbel

[11:01](#msg57a866772f03cf8749d0b64d)@radebrecht\_twitter Can you show the code you're using?

[11:14](#msg57a8699cfb162b752ca7d23a)I can see a regression there, so I've opened a ticket: https://github.com/red/red/issues/2162

radebrecht\_twitter

[11:17](#msg57a86a55d097eb6b2ccefa0f)@dockimbel

```
res: write/info https://api.github.com [ ]
```

[11:18](#msg57a86a86d097eb6b2ccefa66)slightly modified version

```
res: write/info https://api.github.com [ GET ]
```

crashes the red console

[11:20](#msg57a86ae448422f8b4978d0fc)ah yes:

```
res: write/info https://api.github.com [ GET [ ] ]
```

produces a response. I'm halfway there, hopefully ;)

dockimbel

[11:20](#msg57a86b0b2f03cf8749d0c3b3)@qtxie should have a look at that regression quickly.

radebrecht\_twitter

[11:21](#msg57a86b26978997001e9ff3cd)Cool cool. No hurry, I'm having fun.

[12:14](#msg57a877adfb162b752ca7f5cb)Here's a bit of example code I use t produce the crash:

```
user: "your username"
token: "your private access token"
authinfo: rejoin [ "Basic " enbase rejoin [ user ":" token ]]
res: write/info https://api.github.com/user [ GET [ Authorization: authinfo ] ]
```

qtxie

[14:46](#msg57a89b32613cc1803670a143)@radebrecht\_twitter Change last line to this:

```
res: write/info https://api.github.com/user compose/deep [ GET [ Authorization: (authinfo) ] ]
```

radebrecht\_twitter

[18:46](#msg57a8d38616b0696856a3f51c)@qtxie That seems to have worked.

## Tuesday 9th August, 2016

x8x

[01:04](#msg57a92c1d613cc18036721fce)What's the best way to self relaunch a compiled app? (on \*nix platforms)

geekyi

[05:16](#msg57a96746ae838f6f568fa096)@x8x for iterative development? :smile: do you do i somehow right now or are you trying to figure out a way?

planetsizecpu

[06:35](#msg57a979bdd7087a017fa49d20)\[!\[blob](https://files.gitter.im/red/help/jeTY/thumb/blob.png)](https://files.gitter.im/red/help/jeTY/blob)

[06:36](#msg57a979fabc688a133907f46f)Is random working fine?

SteeveGit

[06:44](#msg57a97bdc8689a3f328f1afa2)@planetsizecpu Why ?

planetsizecpu

[07:00](#msg57a97f9c46610f17394abcad)what kind of randomness is on that image?

endo64

[07:02](#msg57a97ffcae838f6f568fcd0b)@planetsizecpu Try to put `random/seed form now/time` in the beginning of your script.

SteeveGit

[07:02](#msg57a980050f016bdd6d67a8e7)Seems legit, what is the problem ?

endo64

[07:03](#msg57a9804116b0696856a55edf)That behavior is same on Rebol too. Same `seed` always generates same numbers in same order.

[07:04](#msg57a9807b613cc1803672b653)Normally `now/precise` will be more useful but it is not yet implemented.

SteeveGit

[07:04](#msg57a98086ccadff3c433f6e32)Not specific to Rebol or Red, Random generators work like this in various languages.

endo64

[07:04](#msg57a9809af7f11a7936ae433c)Sure.

planetsizecpu

[07:05](#msg57a980b7ff82b9fc7e6de105)what is strange is that I started red-console at different moments and get the same randomness

SteeveGit

[07:05](#msg57a980baccadff3c433f6e34)now/time/precise is working

[07:06](#msg57a98100ccadff3c433f6e36)@planetsizecpu Again, it's the expected result if you don't provide a new seed yourself

endo64

[07:08](#msg57a9815bae838f6f568fcfef)Ah I didn't know that! Thanks! The only difference between Red and Rebol, Red requires `form`ing the seed value.  
`random/seed now/time loop 10 [print random 100]`

[07:08](#msg57a98188ff82b9fc7e6de2f2)without `form` it doesn't raise an error but doesn't change the seed value hence generates same numbers.

planetsizecpu

[07:08](#msg57a98189ae838f6f568fd054)@SteeveGit I understand what you meant, what I say is that it appears the default seed is not been initialized at start time or is to the same value

SteeveGit

[07:11](#msg57a982110f016bdd6d67a8ef)@planetsizecpu it's important that the seed is not initialized by default. Some apps need it, especially if you perform tests.

dockimbel

[07:14](#msg57a982cff7f11a7936ae4892)@planetsizecpu The seed in Red's \[PRNG](https://en.wikipedia.org/wiki/Pseudorandom\_number\_generator) is always the same at start, as seeding can potentially take significant time (depending on the source randomness quality) and the user should be the one choosing which source he wants to use. Moreover, as Steeve pointed out, it allows reproductible behavior by default, which can be very useful for debugging purposes.

[07:14](#msg57a982f0ae838f6f568fd542)@endo64 There's a bug when seeding with time! values indeed, we are fixing it.

planetsizecpu

[07:19](#msg57a98403ff82b9fc7e6dea7c)So, for example random/secure by default gives the same result as I tested what is not you expect from secure source.  
What other sources are available to get seed?

dockimbel

[07:27](#msg57a985d6613cc1803672c42e)@planetsizecpu `random/secure` is not supported yet. For sources of randomness, you can google about that. Current time is the most used one, others can be: capturing random mouse movements or keys pressed, reading /dev/random on Unix machines for higher-quality randomness (relying on various hardware sources), querying a true random generator online, etc...

planetsizecpu

[07:47](#msg57a98a9fff82b9fc7e6df8e2)Ok, I would make some research on that, but keep in mind random/secure is returning same predictable values as seed is not provided by user

dockimbel

[07:48](#msg57a98adbf7f11a7936ae5edb)@planetsizecpu `random/secure` \*is not* implemented yet.

SteeveGit

[07:50](#msg57a98b518689a3f328f1b036)Dont worry, we will not forget since it's in the desription of the function.  
&gt; red&gt;&gt; ? random  
USAGE:  
random value /seed /secure /only  
DESCRIPTION:  
Returns a random value of the same datatype; or shuffles series.  
random is of type: action!  
ARGUMENTS:  
value =&gt; Maximum value of result (modified when series).  
REFINEMENTS:  
/seed =&gt; Restart or randomize.  
/secure =&gt; \*\*TBD:\** Returns a cryptographically secure random number.  
/only =&gt; Pick a random value from a series.

planetsizecpu

[12:38](#msg57a9ced4bc688a133908bc2d)Hi again. How can I modify font size of a given area field? I did some like "Area1/Font/Size: 12" but nothing occurs.

[12:41](#msg57a9cf71ae838f6f5690946a)There is another question related. How can I copy text from this area to clipboard?

endo64

[15:22](#msg57a9f54df7f11a7936af7404)Clipboard support is not ready yet. It will come after port implementation.

[15:23](#msg57a9f58846610f17394bea8b)Did you try `font-size` in VID?

[15:23](#msg57a9f58eae838f6f56910ba2)\[!\[blob](https://files.gitter.im/red/help/F4G8/thumb/blob.png)](https://files.gitter.im/red/help/F4G8/blob)

SteeveGit

[15:29](#msg57a9f6d7ccadff3c433f75c1)IIRC, Clipboard support is implemented (copy and paste) in the console code ,but is localized. Would be good to externalize it in global routines. Any volunteer?

planetsizecpu

[15:30](#msg57a9f70b16b0696856a68f15)Yes, I have done that: area 410x410 blue font \[ name: "Consolas" size: 12 color: white ]  
But have to change size dinamically while script is running so: siz: slider react \[Area1/Font/Size: (to integer! siz/data * 10)] does not change font size

[15:31](#msg57a9f747ae838f6f569110e7)@endo64 (sorry)

dockimbel

[15:39](#msg57a9f92816b0696856a69535)@planetsizecpu Indeed, something is wrong there, it should work fine. I guess some code is missing internally to refresh the font in the `area` widget.

planetsizecpu

[16:16](#msg57aa01dbff82b9fc7e6f37fa)Im testing, there is a shot

[16:16](#msg57aa01f6ae838f6f56912fa5)\[!\[blob](https://files.gitter.im/red/help/4qFI/thumb/blob.png)](https://files.gitter.im/red/help/4qFI/blob)

[16:24](#msg57aa03c7ae838f6f56913505)\[!\[blob](https://files.gitter.im/red/help/btr7/thumb/blob.png)](https://files.gitter.im/red/help/btr7/blob)

[16:27](#msg57aa046716b0696856a6b9a6)There is an other with data  
When you move size slider, area font size should change. Nothing is changed on screen but Area1/Font/Size really change their value to the slider value

## Wednesday 10th August, 2016

Phryxe

[08:44](#msg57aae97546610f17394e186c)Is there a minimal menu example somewhere?

dockimbel

[08:45](#msg57aae9af613cc180367624d1)@Phryxe Have a look \[here](https://github.com/red/red/blob/master/tests/view-test.red#L128).

Phryxe

[08:46](#msg57aae9f816b0696856a8c889)@dockimbel Thanks ...

planetsizecpu

[08:52](#msg57aaeb62613cc180367628dc)@dockimbel Internal font refresh also affects font name, I have tested:

radio "Terminal" on-click \[Area1/Font/Name: "Terminal"]

and it does nothing on screen, I have also noticed that radio buttons are not triggering "react"

dockimbel

[08:53](#msg57aaeb9dd7087a017fa81c19)@planetsizecpu `click` event only works on buttons, use `down` event handler for other widgets.

planetsizecpu

[08:54](#msg57aaebc4ae838f6f56934b85)thx

[09:00](#msg57aaed37613cc18036762cdb)@dockimbel that works fine:

radio "Fixedsys" on-down \[Area1/Font/Name: "Fixedsys"]

But still does not affect screen, same as size

Thx

dockimbel

[09:18](#msg57aaf15abc688a13390b7f85)@planetsizecpu I've just merged a PR which is fixing that font updating issue (among other font issues).

planetsizecpu

[10:04](#msg57aafc40ae838f6f56937a91)@dockimbel Thx! That is 1st class development, much encouragement!

[10:10](#msg57aafdb3f7f11a7936b1ecaf)@dockimbel I have downloaded it but on compile time I get: \** Press enter to quit...

[10:11](#msg57aafddc46610f17394e5093)it is red-10aug16-7970b41.exe

dockimbel

[10:12](#msg57aafdf1f7f11a7936b1ed42)@planetsizecpu Thanks for your support, @qtxie has done a good job on that one.

[10:15](#msg57aafecdf7f11a7936b1ef11)@planetsizecpu Let me check that... A commit was missing, a new build is on the way, give it a new try when it's ready.

planetsizecpu

[10:23](#msg57ab008746610f17394e5874)Ok!

dockimbel

[10:24](#msg57ab00e3f7f11a7936b1f55a)It's available now.

planetsizecpu

[11:02](#msg57ab09c816b0696856a91983)@dockimbel now that works, I would like compile to exe, but I get that function included on library file gives:

Compilation Error: undefined word otpGet

I did a try to compile library as -dlib but I get:

\*\** Compilation Error: missing #export directive for library production

And cannot compile, how I do to compile all togther?

Phryxe

[12:02](#msg57ab17dff7f11a7936b22ec4)Regarding the list of available facets in View documentation. I first thought the facets where available for all faces, but I now think that might be wrong ...

dockimbel

[13:33](#msg57ab2d1dd7087a017fa8d44a)@planetsizecpu \*how I do to compile all togther?* Define `all`, I don't get what you are trying to do.

[13:34](#msg57ab2d5eff82b9fc7e720eb5)@Phryxe Facets are "available" to all faces, it's up to each face type to use it or not.

planetsizecpu

[14:34](#msg57ab3b8bae838f6f56942704)@dockimbel in source file there is a do %otplib.red that loads code as your mysql-protocol.r did, but on compile I get undefined word otpGet

[14:35](#msg57ab3bbdae838f6f569427b9)that is in otplib.red

dockimbel

[15:45](#msg57ab4c3616b0696856a9d303)@planetsizecpu Ok, I get it now, thanks. Replace `do` by `#include` in order for the compiler to be able to process it. You can use a `either system/state/interpreted? [do %... ][ #include ... ]` pattern to make it work for both the compiler and interpreter. The work for having a simpler \[solution](https://github.com/red/red/issues/1601) is not yet finished.

[16:05](#msg57ab50c646610f17394f3c5b)\*...a simpler solution...*

planetsizecpu

[17:15](#msg57ab612fff82b9fc7e72b0ba)Thx, I'll test it tomorrow ;)

geekyi

[18:51](#msg57ab77bcbc688a13390cffc7):point\_up: \[August 9, 2016 9:16 PM](https://gitter.im/red/help?at=57aa01dbff82b9fc7e6f37fa) @planetsizecpu cool, what are you building?

## Thursday 11st August, 2016

planetsizecpu

[07:41](#msg57ac2c23ae838f6f56966cbd)@dockimbel Thx I has compiled as we wanted. Now I don't remeber a clue to hide console while runing the exe script, could you tell me?  
@geekyI I just want to learn red, as I did on java in the past, I think one easy way is to learn writing programs that do string management. The script I am building is just a One Time Pad generator to create one time pads, that is not so much useful today :smile:  
You can found the old (and some buggy) java version here: https://dl.dropboxusercontent.com/u/35032037/otp.jar

[07:43](#msg57ac2cb0ae838f6f56966dc0)(untranslated sorry)

qtxie

[07:52](#msg57ac2ec65288c40a1dcc1512)@planetsizecpu Use `-t Windows` or `-t WindowsXP` for compiling to hide the console.

planetsizecpu

[07:55](#msg57ac2f5b16b0696856abefcd)@qtxie Thx! and good job with development, much encouragement!

[08:01](#msg57ac30d1bc688a13390e8659)@geekyI These is the otp red exe script at this moment:  
https://dl.dropboxusercontent.com/u/35032037/otp.exe

[08:03](#msg57ac314d46610f17395144fe)With red I saved at least some two or three hours of development only in asynchronous running of generator! ;)

geekyi

[10:05](#msg57ac4df9ae838f6f5696bcee)@planetsizecpu cool! Next step.. https://xkpasswd.net/s/

planetsizecpu

[10:21](#msg57ac51a916b0696856ac4462)@geekyI I found it useful :clap: Are you involved in this project?

Rebol2Red

[10:36](#msg57ac552f16b0696856ac4dd4)Is wrap supposed to work in an area? If so what is the syntax?

```
view [area bold "boldtext"]  ; this works
view [area wrap "this is a very long text which does not fit into the area
 of this widget bla.. bla... bla..."]  ; seems to do nothing
```

dockimbel

[11:16](#msg57ac5e78f7f11a7936b55659)@Rebol2Red There is a known issue for that case, see the bugtracker.

planetsizecpu

[11:29](#msg57ac61a216b0696856ac6d21)@dockimbel "rate" &amp; "on-time" what a powerful tool! I used area/actors: "" to stop "on-time" code excution as I could not find other way on docs, I guess there are some planed.  
Other question is how to default to down some of radio buttons?

geekyi

[11:36](#msg57ac6351613cc1803679cb10)@planetsizecpu No,something I use sometimes

dockimbel

[11:42](#msg57ac649446610f173951c05d)@planetsizecpu `face/rate: none` will stop the timer. For the radio button, are you asking how to do it from VID or from regular Red code?

planetsizecpu

[11:56](#msg57ac67ddf7f11a7936b57093)@dockimbel twice

dockimbel

[11:58](#msg57ac684f613cc1803679d7a5)From VID, `radio off`, from regular code, `face/data: off`.

planetsizecpu

[11:58](#msg57ac686aff82b9fc7e750690)Thx!

## Friday 12nd August, 2016

jeffmaner

[19:20](#msg57ae216446a301fa5a4a31dc)I'm encountering puzzling errors trying to run Rebol scripts at the Red Console.

```
*** Access Error: invalid UTF-8 encoding: #{D7323020}
*** Where: read
```

My script files are Latin-1. I'm not sure how Red Console is finding a UTF-8 encoding.

Digging into the scripts, I finally found a different error I thought I could comprehend.

```
*** Syntax Error: invalid integer! at "1. * m * m"
*** Where: do
```

Investigating this error, I discovered that my Rebol `decimal!` type annotation needed to become `float!`. I also thought that perhaps Red was confused by mixing `integer!` and `float!`, so I appended a decimal to all the `integer!` literals in the function. But none of my efforts seem to address the error.

Here's the code \[file](https://github.com/jeffmaner/RebolProjectEuler/blob/master/prime-factors.r) that raises the latter error.

I'm running this at the Red Console:

```
red>> do load %prime-factors.r
```

Ideas?

SteeveGit

[19:36](#msg57ae253d9aba41a43d3e53a5)&gt; n \[integer! ~~decimal!~~ float!] "Natural number to factor."

decimal! does not exist as a type.  
&gt; if ~~1. \*~~ m * m &gt; n [

Use \*\*1.0\** instead of \*\*1.\** ,In fact you don't need it at all.

jeffmaner

[19:38](#msg57ae25aa46a301fa5a4a3cf7)Wow. That fixed it. Thank you!

[19:39](#msg57ae25faae0554d04c93a11f)Yeah, when you said to remove it, I realized that it's only there to coerce `m` to `float!`. So in Rebol it was `1.`--is that not the case in Red? It needs to be `1.0`?

SteeveGit

[19:40](#msg57ae26229aba41a43d3e53af)Easy to test in the console.

jeffmaner

[19:41](#msg57ae265a625cb3d845420934)Nice. Lol. Sorry. I shall carry on. Thanks again!

SteeveGit

[19:44](#msg57ae27064073ee634d25b35a)As a side note. I think you're right when you expect \*\*1.\** to be loaded as a float! You can put a Ticket.

jeffmaner

[19:44](#msg57ae273b364ad7fc5ace99c8)Interesting. I may do that.

greggirwin

[20:55](#msg57ae37d9364ad7fc5acec1f5)@jeffmaner, I did some Project Euler bits in Rebol almost 10 years ago. Fun stuff.

jeffmaner

[20:58](#msg57ae3881ae0554d04c93cdf8)@greggirwin It is really fun. And it's a great way to explore new programming languages, paradigms, etc. I need to stick with exploring one language a little longer so I can get past the first 50 or so problems. Lol. I just keep going over the same problems. But it's fun. So it's worth it. I may explore past Problem 24 using Red.

greggirwin

[21:03](#msg57ae3992ae0554d04c93d1f2)My brain started melting after about 24 I think.

jeffmaner

[21:04](#msg57ae39f446a301fa5a4a7153)Lol! I know that feeling. Luckily smarter and more clever programmers in most of the languages I have studied have forged ahead before I tried, and they left good notes to inspire the lesser mortals such as I.

greggirwin

[21:05](#msg57ae3a14a00c6adb45e1f59e)Leave me notes. ;^)

jeffmaner

[21:05](#msg57ae3a2d625cb3d845423ac0)Haha!

meijeru

[21:55](#msg57ae45d0625cb3d84542558d)

jeffmaner

[21:56](#msg57ae460ba00c6adb45e2140c)Oh, no! Lol. I did a quick search but obviously missed your ticket. Oh, well. It can just be refused again.

greggirwin

[21:56](#msg57ae462246a301fa5a4a8e3d)Can you delete the ticket?

jeffmaner

[21:57](#msg57ae4663aee33d7241e92442)There. @meijeru took care of it.

greggirwin

[21:58](#msg57ae4685a00c6adb45e214c8)Great. Thanks. Saves Nenad having to do one more thing. Every little bit helps.

jeffmaner

[21:58](#msg57ae469546a301fa5a4a8ef7)Definitely.

SteeveGit

[21:59](#msg57ae46be6cd7d05c37c2584c)@meijeru I could not find the ticket #1642 &gt; 404 File not found

meijeru

[22:01](#msg57ae4750aee33d7241e92655)Git does not always succeed in suppplying the right link url, so you would have to look for the ticket explicitly among the closed issues, instead of following the link.

greggirwin

[22:02](#msg57ae4768aee33d7241e926a0)https://github.com/red/red/issues/1642

geekyi

[22:05](#msg57ae4815418e6fc44cfa6896)@SteeveGit problem with gitter, this room is for red/help, has no associated repo

SteeveGit

[22:06](#msg57ae486e4073ee634d25b497)oki

## Monday 15th August, 2016

bergm

[08:20](#msg57b17b39a00c6adb45e76927)Hi, does anybody know if Kaj de Vos is reading/using one of these chat rooms. I'm trying to use his ZeroMQ bindings, but from the red files one can get from his website are missing at least two includes (#include %../common/common.reds and common.red), which aren't in his fossil repository, but seamingly in another one which is not accessible/seeable. Maybe somebody else has a complete set of his bindings?

Phryxe

[10:32](#msg57b19a41bc5c9ca66896cc45)\[This](http://red.esperconsultancy.nl/Red-common/dir?ci=tip) works for me ...

bergm

[10:33](#msg57b19a755d9880ce34e13b65)Thank you, that's what I was searching for. :-)

[10:33](#msg57b19a8623f0cacc34e74096)Did I miss a link somewhere?

Phryxe

[10:34](#msg57b19aaeba833d475b5d82b8)\[This](http://www.red-lang.org/p/contributions.html) maybe? :)

bergm

[10:37](#msg57b19b58f418d7a1682d41a6)Ups, maybe one of the only pages, I didn't check - even if so obvious. Thanks again. :thumbsup:

greggirwin

[21:15](#msg57b230f67ce08cec69dc355e)At some point I'll do a Red port of my Rebol 0MQ bindings. Glad you got Kaj's working in the meantime.

## Monday 22nd August, 2016

Rebol2Red

[06:41](#msg57ba9e83cd00bdff6e6b834f)Red seems to behave different from rebol in the way it cannot execute  
a script inside other files

for example:

content of test.txt:

```
<script language="RED">
[
	Red []
	print now/time
]
</script>
```

When doing:

```
do %test.txt 
== </script>
```

No time displayed

The question is:

Will embedded scripting work at a distant time or should it work already?

[06:55](#msg57baa1e4b64a3a016f569f82)I just found this "This header is used to locate the beginning of Red code when embedded in text, XML or HTML file. Starting it with a capital reduces the risks of wrongly identifying it." So i think it worked at one time, but is broken now. Can someone acknowledge this?

endo64

[08:55](#msg57babe07b64a3a016f56fda0)It worked when I remove the outer brackets:

```
<script language="RED">
    Red []
    print now/time
</script>
```

output

```
red>> do %file.txt
11:54:28
== </script>
```

Rebol2Red

[09:16](#msg57bac2f2bb6fad403cf5167b)You are right, it works without the brackets, but i want to embed it into an html file like this

```
<!DOCTYPE html>
<html lang="en"><head>
	<script language="RED">
	Red []
	print now/time
	</script>
<html>
```

To run the script the brackets are needed, but this has nothing to do with Red i suppose?

Ps:  
This is an embedded example in R3 which uses the brackets also

If a script is to be followed by other text unrelated to the script itself, the script must be  
enclosed with square brackets \[ ]:

```
Here is some text before the script.
[
    REBOL [
        Title:   "Embedded Example"
        Date:    8-Nov-1997
    ]
    print "done"
]
Here is some text after the script.
```

Only white space is permitted between the initial bracket and the word REBOL.

[09:29](#msg57bac5eced79c5ee4f273ee5)The example is from http://www.rebol.com/r3/docs/concepts/scripts-embeded.html

## Tuesday 23th August, 2016

PeterWAWood

[00:00](#msg57bb9232cd00bdff6e6f6113)Can any of Windows 7+ users answer this question on the Mailing List?  
"Is there any way to compile the gui console to the same folder as the red exe instead of ProgramData? (I am unable to run executables from that location due to administrative lockdown at work)"

greggirwin

[02:11](#msg57bbb0d8cd00bdff6e6fb970)I don't see an easy way. %gui-console.red expects it to be there, and the crush lib builds there as well. It may also be a limitation imposed by MS to be considered a well behaved Windows app. Doesn't mean it can't be done. Just not supported out of the box right now.

jeffmaner

[03:52](#msg57bbc877187885ef4f6ca4dd)Seriously? I'm just a hobbyist in Red/Rebol. I've not looked at compiling it for myself. But as contemporary as Rebol/Red is, I cannot believe this isn't simple to remedy.

PeterWAWood

[04:01](#msg57bbca9ced79c5ee4f2b14ad)@jeffmaner The gui-console can easily be compiled from source which gives full control over where the executable is saved. Though even then, I suspect that there are permissions issues in new versions of Windows.

jeffmaner

[04:11](#msg57bbcd0e87f779f0691cd2dc)@greggirwin @PeterWAWood Ack! I'm so sorry. I did not intend to send that. That was my immediate written reaction, which I left as a draft. I guess when I leave Gitter, it sends my draft message. Again, so sorry. I'm a .Net developer by day, but I profess little to no knowledge of this particular project. I seriously regret that Gitter submitted that message! Lol. Ugh.

PeterWAWood

[04:15](#msg57bbcdd487f779f0691cd4e6)@jeffmaner It seems a perfectly reasonable thing to write :-)

[04:16](#msg57bbce136981f5f2690db045)We hope that you'll soon learn more about Red.

[04:19](#msg57bbcec5b64a3a016f5b1abf)It is possible to compile the gui-console from source using the binary distribution:

```
PS C:\Users\peter\Red> ./red-061.exe -c -t Windows e:\Red\red\environment\console\gui-console.red
```

qtxie

[08:16](#msg57bc0640b64a3a016f5bd475)Maybe we should use the `AppdData` instead of `ProgramData` ?

PeterWAWood

[08:24](#msg57bc084c6981f5f2690e7ea3)@qtxie I suspect that if the users ProgramData directory is locked down, that others are too.

geekyi

[08:44](#msg57bc0cd95ffbca3e3c053ff3)@PeterWAWood `ProgramData` is per program, but `AppdData` is per user

[08:47](#msg57bc0d8fed79c5ee4f2bf6ef)\[!\[blob](https://files.gitter.im/red/help/YUK4/thumb/blob.png)](https://files.gitter.im/red/help/YUK4/blob)

[08:53](#msg57bc0f03ed79c5ee4f2bfca1)

[09:04](#msg57bc118bcd00bdff6e70ebf1)\[!\[blob](https://files.gitter.im/red/help/zJWL/thumb/blob.png)](https://files.gitter.im/red/help/zJWL/blob)

PeterWAWood

[09:39](#msg57bc19bdb64a3a016f5c1ed5)@geekyI Thanks for the explanation.

[09:42](#msg57bc1a695ffbca3e3c0572f9)@qtxie I don't think it's necessary to change the directory yet. Most Red users at this stage will be responsible for the machine that they are using. Not too many people will be installing on a locked down work-owned machine yet.

greggirwin

[17:27](#msg57bc876787f779f0691fd3ac)There are multiple issues.  
\- Red should be a good citizen as each OS defines it.  
\- It should do the best it can by default, with no config  
\- It should support a config file that lets you control things, as safely as possible

[17:30](#msg57bc883f87f779f0691fd772)End user Red apps will have slightly different rules. And there is the rise of containerization.

Most of us probably want the simplest setup possible. I know I lose track of the console builds until I go to appdata and see them all, and clean them up.

[17:30](#msg57bc884e5ffbca3e3c075108)But this is the cost of being in on the ground floor. :^)

[18:12](#msg57bc9222ed79c5ee4f2e2a10)If someone knows what other languages do, that might be a nice little matrix to put in a wiki.

geekyi

[20:57](#msg57bcb8bacd00bdff6e73e19f)@greggirwin (in retrospect, I realize I've only answered one part of your question, or rather, where the \*compilation cache* is stored)  
\*\*tl;dr\*\*: the approach currently taken by rebol for user configs is probably the best  
Most under the user folder in  
\* Appdata/Roaming,  
\* some in Appdata/Local  
\* some directly in the user folder `.using_dot_convention` (but mostly configs and volatile files in this case)

\~~~  
I think we can divide the languages into three types:  
\* interpreted  
\* compiled  
\* hybrid (includes jit and anything which generates an IR)

Compiled languages usually come with their own distribution of mingw and llvm

Hybrid ones are probably the ones we are interested in, as interpreted ones don't generate a compilation cache, and compiled ones are usually shipped with the compiled machine code.

Among the hybrid ones that I currently use in some way are java, python and julia:

Java and python, being stable languages, and despite using somewhat different compilation models, use the same approach; they install the compiled files (.dlls and .pyd respectively) into `program files`, just like the compiled languages

\*the only one that comes close to Red's compilation model, julia,* has the core dist files stored in Appdata/Local and packages with their compilation cache in the user profile folder (TODO: check more JIT languages?)

greggirwin

[21:27](#msg57bcbfbeb64a3a016f5f073e)Thanks @geekyI

PeterWAWood

[23:21](#msg57bcda8e6981f5f269121f59)@geekyI I believe this is a temporary problem until Red is self-hosted. Once Red is self-hosted, it will be possible to build a single executable that includes the gui-console and the compiler.

## Friday 26th August, 2016

dsgeyser

[19:17](#msg57c095bb3cdeb6467b73e5fe)I've read somewhere that Opa, the programming framework, with is written in Ocaml, being functional with static typing, is very secure and immune to code injections and xss scripting. Code is dynamically compiled to Javascript, and the fact that the compiler verifies the code before execution, makes it extremely safe.  
Now my question. Can Red be implimented in a similiar fashion? Would be a great selling point.

[19:21](#msg57c096b75b11de772155cc28)I mean statically compiled. But no Javascript exists beforehand. So nowhere to inject code.

geekyi

[19:29](#msg57c098b02a7bd0e92053da66)@dsgeyser I think there was discussion about sandboxes and security, but perhaps it's a bit too early. Red is still too much in alpha. Need to compile to \*webassembly* first?

[19:35](#msg57c09a0be353af447b32be91)reading about Opa on \[wikipedia](https://en.wikipedia.org/wiki/Opa\_(programming\_language)), it looks like the "strong, static typing" is the reason for preventing sql injections? Not too different from the many functional typed--compile to javascript languages out there.. or even properly doing escaping

dsgeyser

[19:35](#msg57c09a188877dae6209d3035)Based on this piece taken from source on web: "

[19:36](#msg57c09a4b8877dae6209d30b2)  
the pieces of your Web application -- the HTML files, JavaScript source, image  
files, CSS files, and so on -- that would ordinarily be placed in separate directories  
are bundled by the compiler into a single executable. This makes deployment  
simple; you only need copy one executable file to the deployment destination.  
It also improves security significantly. Your code thinks that the application's  
directories and files are actual directories and files out on a file system  
somewhere. But, from the perspective of the outside world, the files and directories  
aren't there. Someone who manages to access your Web application's home  
directory cannot manipulate the constituent HTML, CSS, or JavaScript files  
because they simply don't exist. In addition, the Opa compiler runs a security audit  
as it builds your application, minimizing the likelihood that you might have  
inadvertently introduced a client-to-client or client-to-server code injection security  
weakness. The compiler will not allow foreign code to be inserted into the  
execution flow at runtime.&gt;

[19:44](#msg57c09c2542e38279217af71f)Dockimbel mentioned Opa as a possible model for web applications. Sure hope so. Imagine blog engine, etc. with restful api build into it. Yes, proper escaping also helps.

geekyi

[19:46](#msg57c09caa3cdeb6467b73fce1)So it does verification on compile time. Looking at their web page, it does feel a bit familiar. And they've been doing it since ~2011, must have been one of the early birds

[19:47](#msg57c09ce5e353af447b32cae6)@dsgeyser are you familiar with `secure` in Rebol? It's one of the ways to do sandboxing there

dsgeyser

[19:50](#msg57c09d712a7bd0e92053e817)The compiler automatically escapes XHTML values, which  
avoids injection attacks.

[19:58](#msg57c09f7442e38279217b0a50)@geekyI Not really. The begging question . . How secure is it out there. Tested by anyone? What about injection? Or is it not possible, due to code being on the server.

geekyi

[20:02](#msg57c0a067d872312a1e7fa681)@dsgeyser do you mean `secure`? It is more relevant to executing arbitrary rebol code. AFAIK compiling to js hasn't been done yet.. but I've read about experimental emscripten builds..

[20:03](#msg57c0a0958877dae6209d4831)Still too soon for javascript at the moment I think

[20:04](#msg57c0a0e242e38279217b0e6d)But I feel Rebol and Red have an advantage here, as it has `parse` which if used properly..

[20:05](#msg57c0a11c42e38279217b0f56)Opa also seems to use the same PEG parsing concept it seems

dsgeyser

[20:14](#msg57c0a31d5b11de772155f81b)@geekyI Yes "secure". Security is a big issue. I believe you can use Red solely as a functional language with static type checking. Would be more fun to build web apps with it! Kind of a "Wordpress" alternative with better security. Incidently, Wordpress is being used on 1/4 of all websites and is becoming a viable platform for building web apps with. Now with Restful api as well. Theres a market for Red to go after, if security can be guaranteed.

geekyi

[20:16](#msg57c0a3a32a7bd0e920540131)Can't disagree with you there on Wordpress, it has one of the biggest ecosystems out there.. has become sort of a CMS of it's own

[20:17](#msg57c0a3f32a7bd0e920540281)`secure` is a native in rebol fyi

greggirwin

[20:31](#msg57c0a720f6fe00361e0326df)Can you guarantee security? If so, at what cost? These are good things to think about, but are a means, not an end. Capabilities are another way to go, right? As is minimizing surface area. And there's the Redbol idea that you can use dialects, which are tightly controlled, instead of strings that require careful escaping and are prime targets for injection attacks.

[20:33](#msg57c0a7a7f6fe00361e032863)A couple years ago I gave a talk on Red, where I showed various syntax elements and a small script being cross compiled. Not much really. A guy I know, who is a penetration tester by trade, thought Red was OK overall, but he was \*really* excited about having a minimal toolchain and code that was small enough that you could actually audit it with some hope of success.

## Wednesday 31st August, 2016

jeffmaner

[15:37](#msg57c6f99d8f4ad01672d0b989) This line of code runs in Rebol, but Red complains that the function (either `lowercase` or `uppercase`) is missing its string argument. Is there a new way to accomplish this in Red?

```
do random/only [ lowercase uppercase ] word
```

greggirwin

[15:56](#msg57c6fe23928ae0e734690178)

```
red>> word: "AbcD"
== "AbcD"
red>> do reduce [random/only [ lowercase uppercase ] word]
== "ABCD"
red>> do reduce [random/only [ lowercase uppercase ] word]
== "abcd"
```

jeffmaner

[16:03](#msg57c6ffb6ccfcf7147cab7a44)Ah! Thank you so much.

dsgeyser

[19:40](#msg57c732a5d52261ec34441cc8) If I may ask: Why was @PeterWAWood banned?

geekyi

[19:41](#msg57c732f4d52261ec34441d79)@dsgeyser he banned someone else :D

dsgeyser

[19:47](#msg57c7345bd52261ec34442158)Oh sorry. Thought that's the end of our 'test buddy'. Couldn't make out the rest. This would have been earth shuddering! Sigh...

[19:57](#msg57c73691928ae0e73469cdbc)Sorry @PeterWAWood great to know you are still here! Btw. Where to find Unit tests? Maybe it can be a great source for learning Red. Is anyone else sometimes struggling with "writers block', but in a programming kind of way? How about the old timers? ;-)

ifgem

[19:57](#msg57c736c5ff952280079fed07)@dsgeyser https://github.com/red/red/tree/master/tests.

[19:58](#msg57c736ddccfcf7147cac3bc9)if you use Windows you have to use rebol VIEW to run tests.

[19:58](#msg57c736ff861faa7f07a966bd)https://github.com/red/red/issues/2178

geekyi

[20:00](#msg57c7376bccfcf7147cac3df4)@dsgeyser "programmer's block"? :smile: I'm full of ideas, but don't understand enough of red/rebol yes to code much

[20:02](#msg57c737c0ff952280079ff43b)Mainly thinking of source to source transforms, trying to find better ways to understand what makes red 'tick'

[20:04](#msg57c7385029ee4a67058140fa)@dsgeyser What's your area of expertise? Or put it another way, which programming languages are you familiar with? The most useful "tools" to learn in Red I've found so far are `?`, `source` and `reflect`

dsgeyser

[20:04](#msg57c73862861faa7f07a96ba7)Thanks @geekyI . What is your background experience programming wise? Kind of looking around to match up with some of the people here. I find learning Red is diffucult when youre feeling isolated, and with little spare time. Looking for ways to shorten the learning experience. Any good suggestions?

ifgem

[20:06](#msg57c738bc928ae0e73469d41e)@dsgeyser  
http://rebol.org  
http://www.red-lang.org/2013/11/041-introducing-parse.html  
http://business-programming.com/business\_programming.html  
http://www.rebol.com/docs/core23/rebolcore.html

geekyi

[20:06](#msg57c738c46efec7117c99fda7)@dsgeyser Great minds think alike :tongue:

[20:07](#msg57c7391c928ae0e73469d553)all good sources there also checkout rebol.info

ifgem

[20:08](#msg57c73956861faa7f07a96e5f)@geekyI disagree

geekyi

[20:10](#msg57c7399c6bf4c26505bfc56e)@ifgem are you saying when everyone is thinking the same thing, someone is not thinking? :wink: I agree with you there :)

ifgem

[20:11](#msg57c739d5d52261ec34443853)@geekyI I'm saying that I think your recommendation is false.

geekyi

[20:11](#msg57c739fc861faa7f07a97058)@ifgem what's the problem with it?

ifgem

[20:12](#msg57c73a3a928ae0e73469d8f5)@geekyI no problem - все хорошо:)

dsgeyser

[20:19](#msg57c73be4d52261ec34443e87)@geekyI I've read - or rather tried to - halfway through some of the Factor, Lisp and Logo material out there to get a hang of what Rebol/Red is all about. What I got from all of that is the realization that Red is the culmination of really powerful concepts. I also have a wandering mind. Studied some Opa also. I knew about Rebol since 2001. Thought it was to simple to be seriousl

[20:20](#msg57c73c0d6efec7117c9a0985)Taken seriously. Damn cellphone keyboard!

geekyi

[20:21](#msg57c73c33ff95228007a0051f)@dsgeyser can't edit chats on phone? \*like this\*.. but wow, you have \*much* more experience with rebol than me!

ifgem

[20:28](#msg57c73e026bf4c26505bfd4f3)@geekyI AFAIK, it's not possible in mobile version, but if you use Android, gitteroid's pretty good

dsgeyser

[20:31](#msg57c73eb929ee4a6705815563)I'll take any recommendation. The love for programming is the driving force. And Red is really so addictive! What is tripping me up is the freeform nature. But therein lies the power. Trying to follow code and at the same time keeping intermediate steps/values in one's head. But I'll get there. Need to break chunks of code diwn into smaller pieces and use the console more to start focusing on certain code patterns.

geekyi

[20:36](#msg57c73fcd6bf4c26505bfdba2)@ifgem thanks, should try it out

dsgeyser

[20:42](#msg57c7411eccfcf7147cac5ea6)@geekyI @ifgem I am from South Africa. I see Red as my future. This is a great community, a bit small, but we will get there. It is really great to kearn from the Gurus out there in Red Paradise. @ifgem can"t use app; Android version too old - not really keen on upgrading .

geekyi

[20:44](#msg57c741a16bf4c26505bfe351)@dsgeyser agree with you on "the culmination of really powerful concepts", it seems to have a bit of everything. I think it's the philosophy that counts, there is no "rules set in stone", nothing that "you should not break", accepting all types of criticisms.  
I have used Factor too, and I'm not sure if there is anything I can add to your knowledge.. you might know more than me

[20:50](#msg57c74310928ae0e73469f6e6)What helps me is in thinking in terms of datatypes. In object oriented programming, you grok things when you understand everything is an "object", in functional, everything is a "function", then in haskell for e.g. you think in terms of types, and in Red, you think in terms of data (there is no code, only data). These are not necessarily mutually exclusive, you can mix and match..

[20:55](#msg57c74439d52261ec344459ed)I'd learned that simplifying things as much as possible has advantages when I used "J", a very terse languages, but it's hard to read as syntax there is not very clean (there being complexity due to the monad dyad dichotomy), whereas in Red much attention is paid to even designing the syntax as simple as possible

[20:59](#msg57c7452b928ae0e73469fd88)Other things on my todo list is looking at dependently typed languages like "Idris", which I think might interest you in that it does proofs and verification (like opa but more.. completely bug free code? :wink: ) but that adds complexity. But it is interesting that it can write it's own code in a way, assisted by the programmer. Give it types and it writes the code for you

dsgeyser

[21:05](#msg57c74697d52261ec344461a5)@geekyI Been reading up on Forth as well. What will really be great is to learn how to break down any Concept into its smallest parts, and build up via the console and at the same time keeping an audit history of states, values, progress etc. Will be more organized and be able to go back and learn from my mistakes. How about a programning environnent that is kind of incorporated into a realtime Federated wiki where you can share experiences on a realtime basis. All for a pleasant learning experience.

geekyi

[21:07](#msg57c74712ff95228007a02ada)@dsgeyser like the IDE in Factor? (without the history part) It's one of the best I've seen, really helped me to learn

dsgeyser

[21:18](#msg57c749aa928ae0e7346a0ae8)@geekyI Yeah the IDE in Factor is really great. Wish we had one for Red. But I think the freeform nature of Red will make developnent of an IDE for Red very difficult.

greggirwin

[21:23](#msg57c74abb6efec7117c9a3c49)I think we'll see amazing IDEas for Red in the future. If you look at how some tools build based on ASTs, you could think in those terms, but as progressive evaluations.

geekyi

[21:24](#msg57c74af5ccfcf7147cac7c96)@dsgeyser on the contrary I think it would be easier.. Factor is not much less free form, both have a common origin in Forth. If anything, I think there is mostly not that much \*need*

[21:24](#msg57c74b16ccfcf7147cac7cf7)also it is easier to build gui programs in Red

greggirwin

[21:24](#msg57c74b1c6efec7117c9a3db7)For learning, a lot of old Rebol material is applicable, including the Core guide. Start small. And trying to do too much in long expressions can make it hard to track. I know some people will say temp vars are bad (pure functionalists), but if you think along Forth lines, temp vars are just part of your vocabulary (rather than using the stack).

[21:25](#msg57c74b5bccfcf7147cac7d99)What may be trickier is an environment that intelligently tracks context for dialects, but that will be doable too.

geekyi

[21:27](#msg57c74baa861faa7f07a9ab0c)@greggirwin you should try out Factor, if only for the IDE, has one of the best UX. It is a large download tho

greggirwin

[21:28](#msg57c74be3d52261ec34447355)And we can play with a lot of ideas. I started a couple gists (math-lab and trig-lab) to push the idea of "lab" tools for specific areas, like the gradient lab.

geekyi

[21:29](#msg57c74c2a29ee4a67058180ec)For example, for the documentation, the main concept is you can include snippets of code, and each word (about the same as `word` in red) is clickable like a hyper link to get to the source

greggirwin

[21:29](#msg57c74c3fff95228007a03894)I did install Factor and fired it up (and Pharo and Racket and Io and Nim, and need to check out Spry). So much to do.

geekyi

[21:30](#msg57c74c66928ae0e7346a13d3)Hehe.. sorry for the assumption. Maybe we should have some documentation somewhere collecting the ideas from different languages :). I should do this.. meaning to note them down somewhere

[21:34](#msg57c74d5c6efec7117c9a43e9)@greggirwin Spry is javascript? (https://en.wikipedia.org/wiki/Spry\_framework)?

greggirwin

[21:36](#msg57c74dcb29ee4a6705818694)My approach is to build experimental tools, mezzanine ideas, etc. and see what clicks with people. I do think there's a lot to learn from other languages, but "collecting ideas" (the way it clicks in my head) is tricky. Rebol was designed over a very long period by one great mind. Red is following that vision. I don't think we can build Red by committee or feature matrix. Not that you meant that (text can be hard to get all meaning from), so please don't take offense.

Formal proposals for changes to Red need to be well thought out.

Experimental tools, and building things based on good ideas we've seen...yeah, let's go nuts.

dsgeyser

[21:36](#msg57c74de9d52261ec344478c1)@greggirwin a little offtopic, but I think Red is capable of producing a way better search engine library than Elasticsearch etc. Especially after 2.0.

greggirwin

[21:36](#msg57c74def6bf4c26505c009a7)http://sprylang.org/

asampal

[21:36](#msg57c74df7dc3c80b559a76667)@geekyl , here's what someone did for Ren-C, a Rebol fork, in terms of a smarter REPL with some IDE-like features (https://www.youtube.com/watch?v=scNIGsLiCgM https://www.youtube.com/watch?v=0exDvv5WEv4). I'm sure that Red will allow for similar prototypes to be created quickly.

dsgeyser

[21:38](#msg57c74e61ccfcf7147cac8784)@greggirwin started studying up on your Mezzs functions. Think it will make a great learning resource.

greggirwin

[21:38](#msg57c74e6e6bf4c26505c00b0a)Many years ago I did a simple Intellisense function for R2, and have also built a Smalltalk-like system viewer. We have very few technical limitations in Red.

geekyi

[21:39](#msg57c74e85ccfcf7147cac87f6)@greggirwin bit unfortunate it is eclipsed by an adobe product with the same name

[21:39](#msg57c74ea3ff95228007a03f17)@asampal thanks

asampal

[21:39](#msg57c74eac85a31403548c59b6)@geekyI I agree about the Factor environment - pretty sharp implementation.

greggirwin

[21:40](#msg57c74edc29ee4a67058189cc)@dsgeyser, if there are any funcs you think would be good, let me know. I have zillions of them in R2. Trying to be selective, organize, and think about them as a whole.

[21:41](#msg57c74ef76efec7117c9a4a23)I love Redbol, because they make it fun to think about things and try different approaches.

dsgeyser

[21:47](#msg57c7508229ee4a67058190ff) @greggirwin Don't be shy to put your gazillion mezzs somewhere reachable for us mere mortals, if you have the time. Also expect lots of questions. WE HUNGRY... ;-)

greggirwin

[21:50](#msg57c7513dccfcf7147cac910b)Not shy, but just dumping them won't be useful. Happy to answer "How would I..." questions though.

dsgeyser

[21:58](#msg57c752fe29ee4a67058198b0)@greggirwin Thanks. Will do. I really appreciate your active participation here. Got to get some sleep. Its midnight here, kind of hard to leave this place. ^-)

geekyi

[22:10](#msg57c755f2ff95228007a05458)@dsgeyser checkout gregg's gists

## Thursday 1st September, 2016

PeterWAWood

[05:49](#msg57c7c152ff95228007a16a83)@dsgeyser You can find the main unit tests here in \[Github](https://github.com/red/red/tree/master/tests/source/units).

## Friday 2nd September, 2016

dsgeyser

[07:57](#msg57c93101ccfcf7147cb1cdc4)@PeterWAWood Thanks. Do you think going through the Unit Tests will help me to grok Red? @greggirwin Can you please show an example using temp vars, as I am trying to get a grip on following long sequences? Perhaps also ways to inspect intermediate values. Hope this makes sense.

greggirwin

[17:42](#msg57c9ba18928ae0e73471245d)Say you're writing a minesweeper game. Your board has a block of cells, each is keyed by its position.

```
board:  #(
    size: 9x9
    cells: [1x1 [a] 2x1 [b] 1x2 [c] 2x2 [d]] ; ...
)
```

You need a random list 10% of the cells to put mines in, and to iterate over that.

```
foreach pos copy/part random extract board/cells 2 to integer! board/size/x * board/size/y * 10% [
    ; place mine
]
```

Using temp vars, it might look like this.

```
num-cells: board/size/x * board/size/y
mine-count: to integer! num-cells * 10%
cell-positions: extract board/cells 2
random-mine-cells: copy/part random cell-positions mine-count
foreach pos random-mine-cells [
    ; place mine
]
```

ifgem

[17:46](#msg57c9baf7d52261ec344b7e6b)@greggirwin Runtime crash on redefining function!, action! during its call. Is this a good title for a bug:)?

greggirwin

[17:48](#msg57c9bb6b6efec7117ca16c7b)@dsgeyser , reading unit tests can show you edge cases and such, along with expected results, but it will be \*very* dry way to learn the language. I suggest picking small programs you want to write, or that you've done before. Use the console and `help`. Play and have fun experimenting.

What is your background? We might make other suggestions if we know where you're coming from.

[17:49](#msg57c9bbc26bf4c26505c7445c)@ifgem, it's a little hard to parse. :^) "Redefined `function!|action!` crashes" ?

ifgem

[17:50](#msg57c9bbf4861faa7f07b0c5d7)@greggirwin https://github.com/red/red/issues/2199. I'm not a native speaker, you know:))

[17:52](#msg57c9bc6b29ee4a67058899f6)@greggirwin it works in Rebol:))))

greggirwin

[17:58](#msg57c9bdb5ff95228007a7609b)Remember that not \*everything* that works in Rebol will work in Red. Compilation will change some rules, at the very least. In this case, it should at least not crash.

dsgeyser

[18:04](#msg57c9bf26ff95228007a76558)@greggirwin Thanks. You have been very helpful. Am I correct in saying you are defining new words, which work like vars in other languages?

radebrecht

[19:02](#msg57c9ccb76bf4c26505c78946)Hi. How do I load one of the contributions? I want to use the JSON codec. Do I need to clone the git repo?

greggirwin

[19:10](#msg57c9ce9b6bf4c26505c78f91)@dgeyser, yes. We sometimes refer to them as vars in Red as well. They are just words that refer to values. A distinction from other languages being that \*values* in Red are strongly typed, but \*words* can refer to any value, so as "variables" words are \*not* strongly typed.

[19:11](#msg57c9ced96efec7117ca1b284)@radebrecht, for now, yes. I have various Redbol JSON codecs here, and it's on my list to create a reference implementation that will be standard in Red.

radebrecht

[19:13](#msg57c9cf586bf4c26505c7921e)@greggirwin Thanks. So I clone the repo and #include %path/to/file.red in my own project. I'll give it a try.

greggirwin

[19:14](#msg57c9cfb2ff95228007a79dda)You can use `do` on the file if you're running in the interpreter.

radebrecht

[19:19](#msg57c9d0af928ae0e7347172b3)@greggirwin Thanks again. It worked as in I could load the file. Unfortunately now the load-JSON function throws parse errors. Sigh. I'll learn the parse dialect and extract the data I need myself. Luckily it's the weekend. Cheers

greggirwin

[20:15](#msg57c9ddd86bf4c26505c7c360)Depending on your needs, you could use R2 in the interim.

## Saturday 3th September, 2016

geekyi

[12:15](#msg57cabeee861faa7f07b31aa5)@radebrecht as a relatively recent newcomer, I second the use of R2, if you aren't using it already

radebrecht

[14:41](#msg57cae11e29ee4a67058b3cbe)@greggirwin @geekyI Yep, I thought about that. I need to deploy an executable though. Also I like the look of the native UI better. Looking forward to seeing OSX UI released. Also, I made good progress with `parse`, got my data extracted. Cheers

geekyi

[14:46](#msg57cae22b6efec7117ca42651)@radebrecht by the way, which load-JSON function? Is it the built in `load` i.e.

```
load/as {{ "e" : "e" }} 'json
```

[15:00](#msg57cae591958e6f4729e5b13c)just checked the source for `load`, it isn't implemented yet. There are options to deploy in rebol, \[like this guy got to recently](https://gitter.im/red/red/welcome?at=57bc19fcb64a3a016f5c1fcf) but if you were able to do it in red, much better..

greggirwin

[15:00](#msg57cae5a76efec7117ca42f47)Glad to hear you got it working @radebrecht !

radebrecht

[21:19](#msg57cb3e486efec7117ca5344f)@geekyI Nope, I was looking at \[this](http://red.esperconsultancy.nl/Red-JSON/tree?ci=trunk&amp;expand), as linked from \[red-lang contributions](http://www.red-lang.org/p/contributions.html). I don't think I handled it right, there are some references in the code which weren't locally available on my system. The code's quite intelligible though, helped me a lot.

greggirwin

[21:25](#msg57cb3fdd29ee4a67058c4fdf)Tinkering now. There are a few different Redbol versions out there, which I'm trying to reconcile and bring up to date with rfc7159.txt.

## Sunday 4th September, 2016

Rebol2Red

[13:04](#msg57cc1becd52261ec3450b375)I want to make a thumbgallery

```
block: copy []
files: read %./

foreach file files [
	append block 'image
	append block 100x100
	append block file
]
view block
```

\*\** Script Error: func does not allow file! for its body argument  
\*\** Where: func

Why does the following works and the previous not? (looks like the same thing to me)

```
view [
		image 100x100 %DirtbikeChampionship.jpg 
		image 100x100 %DominoDraw.jpg 
		image 100x100 %DuckHunt.jpg
]
```

Ofcourse i want to do it dynamically

geekyi

[13:08](#msg57cc1cc9928ae0e7347686f4)@Rebol2Red not sure, but maybe because view parses the block as a dialect?

Rebol2Red

[13:09](#msg57cc1cfe29ee4a67058e07bb)Maybe, But is there a way to do this dynamically?

geekyi

[13:11](#msg57cc1d73958e6f4729e8492e)@Rebol2Red just a suspicion, need to check if it requires new lines in the original block

Rebol2Red

[13:12](#msg57cc1dbe6bf4c26505cca120)Nope

geekyi

[13:51](#msg57cc26df928ae0e734769e1e)@Rebol2Red

```
block: copy []
files: read %./

foreach file files [
	if %.jpg = suffix? file [
	    append block 'image
	    append block 100x100
	    append block file
	]
]

view block
```

[13:51](#msg57cc26fb6bf4c26505ccb7ad)Works for me with that; probably it was also taking as input your .red file

Rebol2Red

[13:54](#msg57cc278a861faa7f07b6315e)Yeeees. That was the problem. Thank you very much!

geekyi

[13:58](#msg57cc286b928ae0e73476a1ad):smile: I think red needs a way to do a stack trace? Just maybe.. that code goes through a dialect which makes things harder to see..

greggirwin

[17:05](#msg57cc546a861faa7f07b6b100)If you probe the block before `view` gets it, what does it contain in the case where it fails? Examining the data sometimes make things obvious.

endo64

[17:22](#msg57cc585e928ae0e734772260)We were talking about digging gitter to pick up useful Red functions, onelines, tips&amp;tricks and put them on a wiki or similar formatted site.  
I just saw that SO has a beta Documentation section and it looks like what we plan. Take a look:  
http://stackoverflow.com/documentation

greggirwin

[17:27](#msg57cc59646efec7117ca78ed6)I saw that recently as well. Didn't excite me at a glance.

[17:30](#msg57cc5a35861faa7f07b6c5dc)It could be good for examples, linked from reference docs, but one of my first questions was whether you can export from it. I didn't see any info on that.

[17:35](#msg57cc5b7f29ee4a67058eb734)Knowing we're a small community, we need to leverage tools. But we also have a language that can self-represent its documentation and use it in different ways. My personal concern is putting effort into a system that then owns my data, which I can't get at and use any other way.

It would be great to have someone R&amp;D on it though. My concerns may be unfounded, and there may be a great API. I remember past efforts (my own and others) to do something similar with wikis, where it ended up being more pain than it was worth.

Still, it's early and my opinions are hardly set in stone. :^)

[17:43](#msg57cc5d356efec7117ca79799)Note that I'm not saying I'm \*against* it. With luck Red will get to the point where a lot of people put things out there. I'm thinking more of organized docs. I should also note that I've never been a huge fan of wikis. I \*love* that anyone can edit, but they tend not to have a cohesive design. Wikipedia works amazingly well, because you get a link to a specific thing, and then you can follow more links, but I've never been able to use it to start someplace and explore in a linear or hierarchical manner.

## Monday 5th September, 2016

endo64

[14:07](#msg57cd7c2e77c1b70d7fe92655)I totally understand @greggirwin , I'm not a fun of wikis for a documentation of a programming language although wikis are great as general.  
But I'm not offering to have a Red Wiki, which we already have actually.  
But did you check the link I sent? Stackoverflow is providing a documentation tool, which looks useful because we all familiar with using of SO.

[14:08](#msg57cd7c61fe284f6c30281e81)For example check this out: http://stackoverflow.com/documentation/r/1157/date-and-time#t=201609051401041082496

[14:12](#msg57cd7d47cdbf820f7f9c2ae5)It shows usage examples for DataTime functions of R language. It limits the number of examples so it doesn't get too long.  
I thought that it might be useful especially for beginners (not people who have Rebol background, people who start with Red).  
Because the most useful documents when I start learning Rebol were Cookbook and Oneliners. They directly show what I need AND how to do it in Rebol (and how to think in Rebol way)

geekyi

[14:16](#msg57cd7e2b1baa312a6bd6efa9)@endo64 I mentioned this before on /docs \[August 19, 2016 12:38 AM](https://gitter.im/red/docs?at=57b60ec7cd00bdff6e5e6b51), while my experience with stackoverflow isn't that great, I do think someone should try and see how that works (maybe that someone should be me and you :wink: )

endo64

[14:22](#msg57cd7f92cdbf820f7f9c3383)There are many useful functions and idioms flowing here, many functions in our rebol.r/user.r files which one can learn very fast and easy, but no one see.

[14:25](#msg57cd806b8965597230415bca)@geekyI I'll try to play on SO, but I don't want to affect negatively on Red, as I'm not a guru and my English isn't that good.

greggirwin

[18:07](#msg57cdb457f5a156f564848dd3)@endo, yes, I did look at it and read the Tour info when @geekyI posted about it before. Don't let me discourage you. We need to try things and see what sticks.

## Wednesday 7th September, 2016

WaBerlin\_twitter

[15:22](#msg57d0309efe284f6c30308ce1)I have a question on usage of elements in Red/View. The documentation:  
(https://dockimbel.gitbooks.io/red/content/v/v0.6.0/gui/View.html#check)  
provides information on usage of a check box.  
There is a "data" documented which can be true : checked or false : unchecked. How can I set this value?  
The following line : `view layout [radio "test" right true]` results in a Script Error.

jeffmaner

[15:24](#msg57d0311098f8df994d443e9d)@WaBerlin\_twitter Include `data` before `true`.

[15:25](#msg57d0315268f483b41cac8060)

```
view layout [radio "test" right data true]
```

WaBerlin\_twitter

[15:29](#msg57d0324577c1b70d7ff1c34f)Thank you for the hint. Eventually I do not understand the logic of the documentation. I tried to put `align` in front of `right` or `text` in front of `"my_text"`. However both result in a Script Error. What is different with `data`?

jeffmaner

[15:34](#msg57d0336b77c1b70d7ff1c736)@WaBerlin\_twitter I don't know the answer to why `data` is required where `align` and `text` are not. I've had a very tough time finding what I need in the documentation, and have just had to rely on the good folk here and lots of trial and error to get my GUI mostly functional. The community here is patient and very helpful.

greggirwin

[15:36](#msg57d0340cfe284f6c303098f4)VID is a dialect, so there is not a strict `property value` syntax. If you look at the Keywords and Datatypes sections in the doc, that should clear things up. Some keywords are independent, while others take args (e.g. draw, data), and some datatypes can be automatically applied to a face based on their type.

[15:39](#msg57d0349d68f483b41cac8e31)'Align isn't a keyword, it's part of the `para` facet, which you can apply like so:

```
red>> view layout [radio "test" para [align: 'right] data on]
```

The alignment keywords are just handy shortcuts.

[15:40](#msg57d034f5896559723049f8b8)Under Datatypes, in the VID doc, you'll see that there is no handling of `logic!` values, which is why `true` or `on` isn't automatically applied to the `data` facet.

jeffmaner

[15:43](#msg57d035a468f483b41cac925d)Thanks, @greggirwin ! As usual, it makes perfect sense once you chime in.

greggirwin

[15:46](#msg57d036551baa312a6bdf85c8):^) An advantage to this approach is that it greatly reduces redundancy and noise, where things aren't readily ambiguous.

jeffmaner

[15:48](#msg57d036e3cdbf820f7fa50be9)Once I got moving at a decent pace on the GUI, it was so much simpler and easier than other GUI technologies. I really like it.

geekyi

[19:01](#msg57d0642098f8df994d44f82e):point\_up: \[this](https://gitter.im/red/help?at=57d0309efe284f6c30308ce1) and \[this](https://gitter.im/red/help?at=57d0340cfe284f6c303098f4) should probably be on stackoverflow as a question

[19:04](#msg57d064a477c1b70d7ff27cb0)@WaBerlin\_twitter would you care to write there? :smile: In general, I feel we should add questions to stack overflow which don't turn out to be bugs in red

greggirwin

[21:35](#msg57d0881989655972304b25a0)That's a good idea @geekyI

## Thursday 8th September, 2016

WaBerlin\_twitter

[10:52](#msg57d142eaf33967fc643b3645)If gitter/red/help is not the right forum, I am willing to change to stack overflow.

Which is the correct location there :  
(http://stackoverflow.com/questions/tagged/red) or  
(http://chat.stackoverflow.com/rooms/291/rebol-and-red) or ???

PeterWAWood

[11:01](#msg57d14519f33967fc643b3c6a)@WaBerlin\_twitter This is a good place to ask your questions. Another good place would be the \[Red Mailing List/Forum](https://groups.google.com/forum/#!forum/red-lang).

Questions and answers in this forum tend to get lost over time, though not those on the Mailing List which is searchable.  
I suspect @geekyI is suggesting adding good questions to stack overflow as then they will be easily available to others. The downside of asking on Stack Overflow is that the people who would answer your questions posted here probably wouldn't see them if they were posted on Stack Overflow.

geekyi

[11:06](#msg57d1462af33967fc643b3f4e)@WaBerlin\_twitter oh I'm not saying \*not* to ask here, but  
&gt; add questions to stack overflow which don't turn out to be bugs in red

so, ask here, and if it isn't a bug, and is useful info in the long term add there, (http://stackoverflow.com/questions/tagged/red)  
@PeterWAWood yes exactly

[11:09](#msg57d146ee1baa312a6be2a5b7)@PeterWAWood I think SO questions can be integrated to the side bar here? I've not looked into how you can do that tho..

[11:11](#msg57d1474898f8df994d477374)I think red/help \*is* the appropriate channel to do so, possibly also from the red mailing list/ forums

## Friday 9th September, 2016

WaBerlin\_twitter

[05:16](#msg57d24590cdbf820f7fab6a0a)I try to understand aspects of Red `VIEW` and want to ask about a pointer to any documentation. When looking at various examples I collected the following possible element properties for the GUI element `TEXT`.

```
center / right / left
size
bold / italic / underline
font size <xx>
background color <xxx.yyy.zzz>
font-color
hidden
```

Some of them need the property name, some not.  
`help text` does not work here.  
QUESTION: is there a document which describes those details of GUI elements of Red VIEW? Thank you in advance.

rebolek

[05:40](#msg57d24b34aa8223bd16cf9e25)@WaBerlin\_twitter Take a look at \[Rebol's VID](http://rebol.com/docs/easy-vid.html). It’s basically the same (Red's VID is more advanced and things like reactors are not covered there, but \[Red’s homepage](http://www.red-lang.org/) is full of usefull info).

WaBerlin\_twitter

[13:04](#msg57d2b363c475164703c150bb)@rebolek : thank you. However the examples in Rebol's VID are not allways compatible with RED view. E.g. the section "Document Text Style" says:

```
backcolor white                   ; not compatible to RED
text "Normal"
text "Bold" bold
text "Italic" italic
text "Underline" underline
text "Bold italic underline" bold italic underline
text "Big" font-size 32
text "Serif style text" font-name font-serif ; not compatible to RED
text "Spaced text" font [space: 5x0] ; not compatible to RED
```

I was looking for a more precise description of the possible properties for GUI elements in RED (without trial and error).  
If that does not exist at the moment, than this is OK but clarified.

DideC

[13:10](#msg57d2b4b6f4360c6818209083)@WaBerlin\_twitter Did you have a look at \[Red VID documentation](https://doc.red-lang.org/gui/VID.html) ?

[13:12](#msg57d2b53daf75d5187be4f4ca)Don't forget that some keywords are irelevant for some styles!

WaBerlin\_twitter

[13:12](#msg57d2b551f4360c68182092f8)The RED VID documentation is very generic and does not cover the details of element properties.  
I also looked at (http://www.red-by-example.org/index.html) which states "To do by red-by-example team ...".

DideC

[13:14](#msg57d2b5c01e2af977189290b3)Did you play with Nenad's realtime VID script ? It help test any VID combination.

WaBerlin\_twitter

[13:18](#msg57d2b6be1aacfaf84b040607)No, where can I download this?

DideC

[13:24](#msg57d2b8293f7260fe4bdf9af0)Not sure you need a download for just that :

```
Red [
	Title:   "Simple GUI livecoding demo"
	Author:  "Nenad Rakocevic"
	File: 	 %livecode.red
	Needs:	 'View
	Usage:  {
		Type VID code in the right area, you will see the resulting GUI components
		rendered live on the left side and fully functional (events/actors/reactors working live).
	}
]

view [
	title "Red Livecoding"
	output: panel 400x600
	source: area 500x600 wrap font-name "Fixedsys" on-key-up [
		attempt [output/pane: layout/only load source/text]
	]
]
```

[13:33](#msg57d2ba0e3f7260fe4bdfa446)I play with it a lot and found that there was just a limitation to use it : you can't define Red's values to used in the VID code.  
So I made my own version to solve that, to be found \[here](https://gist.github.com/DideC/85d60c99f97f2e4972a6f7b09a1fe630).

ifgem

[18:02](#msg57d2f91e8cd0681e7bfbfda3).

greggirwin

[19:07](#msg57d30883473d7d833a8a586e)The current reference docs are:  
\- http://doc.red-lang.org/gui/View.html  
\- http://doc.red-lang.org/gui/VID.html  
\- http://doc.red-lang.org/gui/Draw.html

There is not yet a per-style reference of supported facets (properties).

geekyi

[19:13](#msg57d309d41e2af97718940fa5)@WaBerlin\_twitter for new features in Red, I found the blogposts on http://red-lang.org most useful. But you are right about the docs being sparse right now..

## Saturday 10th September, 2016

dockimbel

[06:07](#msg57d3a33983c1556511b5ce2c)@DideC Great work on enhancing the livecoding demo. :+1:

Dimonax

[21:02](#msg57d474ffb37816b14fa8b1f7)How do we go about rebuilding Red since the Rebol SDK isn't available?

geekyi

[21:42](#msg57d47e4083c1556511b7f2bd)@Dimonax posting in red/welcome is usually enough for starters, :tongue: problem usually is most people are away :smile:

## Monday 12nd September, 2016

DideC

[11:31](#msg57d6921ab8d4c13840882c34)@dockimbel thanks. It stays simple but a little bit more usable IMO.

## Wednesday 14th September, 2016

BrianOtto

[06:54](#msg57d8f417a0e8dbb04f36fb44)Is it possible to load a font from a local directory, instead of having to install it first and then reference it by name? I found an old REBOL example here: http://rebol2.blogspot.com/2011/12/using-bitmap-font.html  
But doing something similar in Red doesn't appear to work:

displayFont: layout [  
txtLine: text 1000x100 "Lorem ipsum dolor sit amet, consectetur" font \[ name: "Cabin-Bold.ttf" color: red]  
]

It just uses a default font when I do that. I have tried specifying the full path to the file too.  
I am running it in Windows if that makes a difference.

rebolek

[08:54](#msg57d9102f7b9f81671148a593)@BrianOtto AFAIK it is not possible (yet?).

[08:54](#msg57d91057ef19fa3f40834e86)Red uses standard OS libraries to load fonts, so there is no mechanism to load custom ones.

BrianOtto

[14:49](#msg57d9636f27a8458f7f151c4e)@rebolek Ahh I see, good to know, thanks!

## Thursday 15th September, 2016

WaBerlin\_twitter

[08:43](#msg57da5f27aabc89857fa43367)I explore certain features of RED. The following script causes an error.  
I wonder why:

```
red[]
	trigger: ["<title>" "</title>"]
	trigger-start: trigger/1
	
	page: read http://www.rebol.com/
	parse page [thru trigger-start copy text to "</title>"]	; -- works
	parse page [thru trigger/1 copy text to "</title>"]		; -- fails
	; *** Script Error: PARSE - invalid rule or usage of rule: trigger/1
	print text
```

rebolek

[08:46](#msg57da5fd9aabc89857fa4366d)IMO it is a bug.

[08:46](#msg57da5fe9aabc89857fa436c7)Parse should allow path! as rule.

PeterWAWood

[09:54](#msg57da6fe0df21a75730fc4749)An easy workaround is to compose the parse rule:

```
parse page compose [thru (:trigger/1) copy text to "</title>"]
```

## Saturday 17th September, 2016

dsgeyser

[08:14](#msg57dcfb72c8af41d45f219e99)Is it possible to encrypt/decrypt email or any message in Red, before sending/receiving? A custom solution will be nice.

PeterWAWood

[08:52](#msg57dd046ac8af41d45f21b565)@dsgeyser No. Red is still incomplete and does not yet have any encryption

[08:56](#msg57dd0557c8af41d45f21b7dd)The current alpha release of Red does not support sending and receiving emails.

[08:57](#msg57dd057e33c63ba01a0ce61b)Future versions will contain such features.

dsgeyser

[10:35](#msg57dd1c7227a8458f7f21570f)can I remotely host the red exe and via a remote process allow scripts to be compiled or interpreted locally, without red being present on the local host?

[10:36](#msg57dd1c9ddf21a7573004e9e0)Initially.

[10:37](#msg57dd1cccaabc89857fad100f)What is initially needed on local host?

[10:37](#msg57dd1cefaabc89857fad1057)I know Red still lacks IO.

pekr

[11:10](#msg57dd24a4c3e7045a30585a69)Red has some basic IO, called simple-io, not sure if it could be ready for your needs though ...

greggirwin

[15:50](#msg57dd6631c8af41d45f22b479)@dsgeyser, without networking support, the best you can probably do right now is using the file system as an IPC mechanism. If you're talking batch scripts, that should be fine.

dsgeyser

[18:37](#msg57dd8d7dc8af41d45f232786)@greggirwin What will be the absolute minimum requirement on the local system, as a starting point? Want to implement remote services without the user having to download and run the red exe to start with. Is this possible? Can I isolate the interpreter and run it remotely, but have the resulting GUI displayed locally.

greggirwin

[18:40](#msg57dd8e33c8af41d45f2328f9)Red doesn't run in the browser, so I'm not sure how you could do anything like that with \*any* tool. i.e. you need \*something* on their system to run things from.

[18:41](#msg57dd8e56aabc89857fae5213)i.e. where would the GUI display?

[18:42](#msg57dd8e7b27a8458f7f22949f)Unless you have them remote into the machine where Red is, or something like that.

dsgeyser

[18:43](#msg57dd8ec218291e10487d1f17)Like RPC?

greggirwin

[18:44](#msg57dd8f12df21a75730061cb5)No. For that you still need a client making the remote calls, right? I mean like RDP/SSH.

dsgeyser

[18:45](#msg57dd8f5827a8458f7f2296fd)Can the interpreter be isolated without the compiler? No need for compiled scripts at the moment.

greggirwin

[18:46](#msg57dd8f9518291e10487d2115)No. You can't separate them today. But what is the benefit of removing the compiler?

dsgeyser

[18:48](#msg57dd8fe8c3e7045a30597615)Sorry. You are correct. RDP

[18:57](#msg57dd9234df21a757300625eb)People are sometimes reluctant to download an unknown exe. I want to incorporate Red into a messaging system (webapp with encrypted Red scripts), as a collaborative workflow system. This is just an intermediate solution while we are waiting for networking and encryption.

[19:41](#msg57dd9c6427a8458f7f22bc7f)Is it possible to interpret a script without having the interpreter open. (console mode? command line?)

[20:13](#msg57dda3ecfa660dd95feb5f51)To evaluate a remote script in Rebol: REBOL --do "do http://www.rebol.com/speed.r".  
And in Red with GUI output?

## Sunday 18th September, 2016

PeterWAWood

[00:41](#msg57dde2d4df21a75730070389)@dsgeyser Yes. The interpreter can be "isolated" from the compiler. The Red consoles do just that. If you first console, you can then run scripts with it like this:

```
PS E:\Red\red> ./gui-console tests/hello.red
```

dsgeyser

[06:46](#msg57de382cc8af41d45f24d21e)@greggirwin @PeterWAWood Thanks. Your help is appreciated.

## Wednesday 21st September, 2016

TimeSeriesLord

[00:23](#msg57e1d31633c63ba01a1c53fb)Does the Red exec look for user.r like REBOL 2.7.8 or is it something that can be fed at launch time as a command line argument?

[01:24](#msg57e1e13633c63ba01a1c7be2)I have my answer for Win 10. Thanks though.

[06:58](#msg57e22fadc3e7045a306828be)At the console, i can do this:

````
red>>  dash: charset {-—}
== make bitset! #{0000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000```

But when Red tries to evaluate that from a start up script, it chokes. Also, that looks like a bizarro  bitset. 

The error:
````

\*\** Access Error: invalid UTF-8 encoding: #{977D0D0A}  
\*\** Where: read  
\`

Anyone?

rebolek

[07:00](#msg57e23014a3c0cb1b6a21d286)@TimeSeriesLord what do you mean by startup script?

[07:03](#msg57e230aaa3c0cb1b6a21d28a)@TimeSeriesLord check the encoding of your file, if it is really UTF-8.

[07:03](#msg57e230ddc2287b924ff74d56)When I save your example, I can’t find #{977D...} in it.

[07:04](#msg57e23110a3c0cb1b6a21d292)

```
red>> to binary! {-—}
== #{2DE28094}
```

TimeSeriesLord

[07:04](#msg57e23116df21a7573014f453)Start up script = a script loaded at start up (boot up, fire up, launch — whatever word or phrase that you prefer).

Running on Win 10, I have set up a shortcut that runs

```
C:\Users\redacted\PortableApps\Red\red-061.exe start.red
```

That %start.red works like a %user.r in REBOL 2.7.8. That is my master file that loads my dictionary of words (functions, aliases and the like) to create my virtual computer environment.

rebolek

[07:05](#msg57e2314106bdca3327081b5d)I see.

TimeSeriesLord

[07:05](#msg57e2314a27a8458f7f31ac9d)@rebolek I'll check it out. It's possible that the file has old DOS encoding.

rebolek

[07:06](#msg57e23166d66f1a7967e1f9c0)@TimeSeriesLord that is my guess, it‘s probably not saved as UTF-8, as I can’t reproduce it.

TimeSeriesLord

[07:18](#msg57e2346027a8458f7f31b7e3)@rebolek Yeah, thanks. It looks like a joy to fix. I saved it in UTF-8 w/BOM in Metapad and then opened it in Scite. Scite shows all of the funky chars that must not have translated. After I clean this up, I will let you know if that was the problem.

For my parsesets, I use prefixes, e.g., ¿symbols for \[some symbol] rules and ¡symbols for \[any symbol] to remind me of either some or any. It looks like Red spit on the ASCII encoding of those.

rebolek

[07:20](#msg57e234b006bdca3327081b9f)That’s because they are not ASCII symbols.

TimeSeriesLord

[07:20](#msg57e234c533c63ba01a1d6a9b)&gt; That’s because they are not ASCII symbols.

And not Extended ASCII?

rebolek

[07:21](#msg57e234e2c2287b924ff74d7d)Not sure what do you mean by extended ASCII. ASCII is 0-127.

[07:21](#msg57e23506d66f1a7967e1f9eb)If you mean some codepage like Latin-I or Windows-1250, Red does not support them.

[07:22](#msg57e2354fa3c0cb1b6a21d2ef)It is possible to write convertor however, but having this in basic Red wouldn’t be practical.

TimeSeriesLord

[07:23](#msg57e23582c8af41d45f32b021)&gt; Not sure what do you mean by extended ASCII. ASCII is 0-127.

You have never heard of Extended ASCII? You must be new at computing (circa 21st century). ;-)

https://encrypted.google.com/webhp?hl=en#hl=en&amp;q=extended+ascii&amp;tbs=whnv:1

I'll hand clean it. It's only about 50 parsesets. But I can't do my load into blocks any CSV file from anywhere on the Internet magic without them.

rebolek

[07:25](#msg57e235d2d66f1a7967e1f9f7)Oh, this. So different codepages, basically :)

[07:27](#msg57e2366d06bdca3327081bc1)@TimeSeriesLord Take a look at something like http://www.rebol.org/view-script.r?script=utf-8.r&amp;sid=wtldf3tk

TimeSeriesLord

[07:28](#msg57e2368033c63ba01a1d70e2)Cool. Will do.

rebolek

[07:28](#msg57e2368f06bdca3327081bd3)That is Rebol script for conversion from different codepages to UTF8. I guess it could be adapted for Red easily.

[07:30](#msg57e236fda3c0cb1b6a21d324)I was using it for automated conversion of the mess that was Windows Vista localization some 10 years ago.

TimeSeriesLord

[07:30](#msg57e2371633c63ba01a1d72d5)Hey I can totally understand your need with that mess.

rebolek

[07:31](#msg57e2374706bdca3327081be4)I was hero back then ;) The team was doing it manually before I started using Rebol for this :D

TimeSeriesLord

[07:34](#msg57e237f218291e10488c6950)Yeah, your team must have worshiped you.

rebolek

[07:39](#msg57e2394fd66f1a7967e1fa42)If they gave me raise, it would be better ;)

TimeSeriesLord

[07:41](#msg57e2399eaabc89857fbd6bbb)Of course. Well, anyone is only worth their opportunity cost (i.e., what another employer is willing pay to snatch one away).

Did you move to greener fields?

rebolek

[07:42](#msg57e239cfd66f1a7967e1fa49)Yes, but I think we are getting really off-topic here ;)

TimeSeriesLord

[07:42](#msg57e239f3fa660dd95ffacb74)That's too bad. The Red folks need a red/lounge gitter

[07:43](#msg57e23a1b18291e10488c7055)Many good ideas can come from free form chat. Few can come from heavy-handed censorship.

rebolek

[07:43](#msg57e23a2e06bdca3327081c1b)True.

TimeSeriesLord

[07:48](#msg57e23b3fc3e7045a30685dae)Well, everytime Red fires up, I am wowed over the start up speed.

greggirwin

[16:53](#msg57e2bb0dc3e7045a306a7352)@TimeSeriesLord, I add sigils and use naming conventions myself. For parse rules, I often append a char that mimics Kleene notation. i.e. ? for opt, * for any, + for some. Sometimes I'll pluralize the name though, depending on what makes other rules more readable. I've also appended = to names, to mimic ::= in BNF and make rule vars stand out.

TimeSeriesLord

[23:13](#msg57e31404fa660dd95ffe6ec0)@greggirwin Yeah, I follow you why you do it right down to some words being plural. As you can see (some missing), this is kind of how I do it.

More than one individual thing gets (s) at end. A group as a unit does not.

I put this up here only if it helps a novice.

```
¿word: [some letter]

¿spaces: [some whitespace]
¿words: [some ¿word] 

¿phrase:  [some [ ¿words | ¿spaces] ]
¿sentence: [some ¿phrase opt endmark]

red>> s: "This is a silly Sentence?"
== "This is a silly Sentence?"

red>> parse s [ ¿sentence]
== true

red>> s: "This is a sillier **$*$*$23 sentence!"
== "This is a sillier **$*$*$23 sentence!"

red>> parse s [ ¿sentence]
== false
```

Of course, in true parsing, one would need to account for numbers of all kinds, e.g., 1st, 2nd, 3rd, 4th, 33.6, 2\*\*6, 2x10^6, and so on.

Parse was a bit of more of a struggle than it should have been at times until I started doing it this way.

Many of the sparse examples of `Parse` mixed all kinds of naming, which only added to the poor explanations offered. Too many struggle to explain what they claim to know. Their struggling calls into question always how much do they know, in truth.

[23:28](#msg57e317b6aabc89857fc0fa5a)It seems though that one can not type Unicode at the Red console under Windows 10, which is a huge bummer. Does anyone know why?

Red 0.6.1 - 8-Aug-2016/9:32:11-7:00  
Windows 10 1607

## Thursday 22nd September, 2016

greggirwin

[01:39](#msg57e33640aabc89857fc15bec)We don't yet have a \*parse style guide\*. :^) @qtxie or @PeterWAWood can probably give details on the Unicode issue.

qtxie

[02:23](#msg57e34095a3c0cb1b6a21eeb6)@TimeSeriesLord I can type Chinese in the Red gui console under Windows 10. Would you please provide more information about it? Like how to reproduce the issue?

TimeSeriesLord

[02:39](#msg57e3447ac3e7045a306c6320)@qtxie Sure. Do you know Win 10 Alt+ with the right registry key set?

If so, try typing ALT+00A1. It should produce this: `¡`

qtxie

[02:48](#msg57e3468ec2287b924ff766eb)Ok. I see the problem now. Try to fix it...

[04:04](#msg57e35857d66f1a7967e2131c)@TimeSeriesLord Should be fixed now in master branch.

TimeSeriesLord

[06:15](#msg57e376f1c8af41d45f377fb2)@qtxie Thank you! Thank you! Xièxiè dàjiā!

## Friday 23th September, 2016

dsgeyser

[10:50](#msg57e5090890ba43d2173e6510)Whats the minimum Red version for Android (phone)? Want to play with 'Core' while on the move?

rebolek

[10:51](#msg57e509444d3ec93522727ef8)@dsgeyser there’s no minimum version, you can use the latest. GUI is not finished though.

[10:53](#msg57e509974d3ec93522727eff)If it does compile for your CPU, there are no limitations, AFAIK.

dsgeyser

[10:54](#msg57e509ccdf21a757301f2b49)@rebolek Android phone?

rebolek

[10:56](#msg57e50a55a8fff5ac2d919304)@dsgeyser Compile console with `-t Android` and it should work (I haven’ tried it in a while but it worked last time I checked it)

dsgeyser

[11:05](#msg57e50c7bef85590051f06182)@rebolek Thanks

## Sunday 25th September, 2016

Rebol2Red

[15:28](#msg57e7ed2b7270539a6d86544a)Is it possible to clear the console inside your script like cls or clearscreen in other programming languages?  
( maybe with some ansi code )

rebolek

[16:00](#msg57e7f490c374062751ba0ff2)@Rebol2Red Do you mean GUI console, or standard console?

Rebol2Red

[16:02](#msg57e7f51b93ce88be4b511840)Maybe stupid, but i think i don't know the difference

rebolek

[16:03](#msg57e7f54cc374062751ba1006)Ah, GUI console is written in Red/View, standard is using standard system terminal.

Rebol2Red

[16:03](#msg57e7f55d00df3cc4224556a1)Then it is standard

rebolek

[16:05](#msg57e7f5cdef21946f5ecf1c9f)Ten you should be able to use ANSI codes. Let me try...

[16:12](#msg57e7f773f0dfe1cf5a3d9e3f)@Rebol2Red Tried this under OSX and it works:

```
print "^(1B)[2J"
```

[16:14](#msg57e7f7e4c374062751ba1061)Not under Windows.

[16:16](#msg57e7f84eef21946f5ecf1ce4)It Windows, it apparently needs to be enabled first: https://support.microsoft.com/en-us/kb/101875

Rebol2Red

[17:23](#msg57e80812b39f35d16d9a07bf)I am using windows 10 and there is no config.nt to enable ansi.sys. I do'nt know another way.

rebolek

[18:03](#msg57e81186c374062751ba12e6)Hm, please check https://www.wikiwand.com/en/ANSI\_escape\_code#/Windows\_and\_DOS for more info, there should be some support in W10 (I have only W7 in Virtual Box, so I can’ t test it). Anyway, for Windows I guess it would be good idea to add (at least partial) support for ANSI sequences to GUI console. It should be doable I guess.

greggirwin

[18:11](#msg57e8134166e78880221368e6)`Ctrl+L` clears the Red GUI console, just FYI.

Rebol2Red

[18:13](#msg57e813cc00df3cc42245b044)

[18:14](#msg57e813f1b39f35d16d9a32cd)But how to do it within a script? Just send keystrokes? Which ones?

greggirwin

[18:15](#msg57e81444b39f35d16d9a342c)I don't think that's possible yet.

Rebol2Red

[18:19](#msg57e8151bb39f35d16d9a366c)Should i post an wish issue for it?

greggirwin

[18:19](#msg57e8154e240a335f12ecf95a)Maybe someone from Team Red can say what their plan is. If `system/console` can be modded, or if we need to do it at the lower levels.

[18:20](#msg57e81561e7e28b6c76191fd0)Wish: Sure.

Rebol2Red

[18:23](#msg57e8162000df3cc42245b781)Done, Thanks.

greggirwin

[19:08](#msg57e820bb4ae02c250fc6372f)If you have source installed, %red/environment/console/terminal.reds has the key handling. Basics are obvious, but also shows that Ctrl+&lt;key&gt; options for nav are supported, and Ctrl+K to delete to end of line. Ctrl+L should work in both consoles it seems, so there's likely a bit of lower level work to do.

## Monday 26th September, 2016

Mufferaw

[14:48](#msg57e9352176d85b087daa8539)Hi everyone, I'm new to Red and trying to get my bearings. I'm trying to make a 2d 'array' and fill it with random bools but I'm not having much luck. Is there a way to iterate through all the elements in my array ( which is basically a block of blocks) ?

rebolek

[14:54](#msg57e936a4cca6236974b5ab4f)Welcome @Mufferaw

[14:56](#msg57e93737cca6236974b5ab6f)Here's one way how to do it:

```
collect [repeat i 10 [keep/only collect [repeat j 10 [keep random true]]]]
```

Mufferaw

[15:08](#msg57e939f5009614165519ec5c)@rebolek Thank you very much! I didn't even see/notice the collect function when I was reading through all the docs. I have a long way to go!

rebolek

[15:10](#msg57e93a6c808246a0620a95e4)@Mufferaw You’re welcome. If you have other questions, feel free to ask, I'll be happy to help.

Mufferaw

[15:13](#msg57e93b16ab9ba81255e57c24)@rebolek Much appreciated, I have a feeling I'll have a lot of questions.

rebolek

[15:20](#msg57e93cd1f71de5634c6182be)That’s the best way how to learn something ;)

geekyi

[15:35](#msg57e9404aab9ba81255e59913)@Mufferaw collect is new in Red (if you are used to Rebol), so it is mainly documented in the blogposts of http://redlang.org website

greggirwin

[15:38](#msg57e940e1783fe9b9459ac6bc)@Mufferaw, if you need to do this kind of thing a lot, here's Red version of Rebol's `array` function:

```
array: function [
	"Makes and initializes a block of of values (NONE by default)"
	size [integer! block!] "Size or block of sizes for each dimension"
	/initial "Specify an initial value for elements"
		value "For each item: called if a func, deep copied if a series"
][
	if block? size [
		if tail? more-sizes: next size [more-sizes: none]
		size: first size
		if not integer? size [
			cause-error 'script 'expect-arg reduce ['array 'size type? get/any 'size]
		]
	]
	result: make block! size
	case [
		block? more-sizes [
			loop size [append/only result array/initial more-sizes :value]
		]
		series? :value [
			loop size [append/only result copy/deep value]
		]
		any-function? :value [
			loop size [append/only result value]
		]
		'else [
			append/dup result value size
		]
	]
	result
]

a: array/initial [10 10] does [random true]
```

Mufferaw

[15:50](#msg57e943b800961416551a1b85)@geekyi I've never used Rebol but I did find some info about collect in the Rebol R3 docs. @greggirwin Thanks. That's super useful. 10 minutes on gitter feels like more progress than a week of reading docs and tinkering on my own!

geekyi

[15:52](#msg57e9444335e0f31c6c441026)@Mufferaw Which docs, can you post me a link? I thought it was only in Red

[15:53](#msg57e9448100961416551a2064)Whoa, it is in Rebol2!! (2.7.8.3.1) How did I miss that? I suppose collect is unique in Red's `parse`

rebolek

[15:58](#msg57e94590cca6236974b5ae28)True, it’s not in Rebol’s `parse`.

Mufferaw

[16:04](#msg57e94717ab9ba81255e5bb48)http://www.rebol.com/r3/docs/functions/collect.html

geekyi

[16:26](#msg57e94c4335e0f31c6c4433ec)From that page:  
&gt;Can also be used with the parse function:

```
collect [
    parse [a b c d e] [
        any ['c | 'e | set w word! (keep w)]
    ]
]
[a b d]
```

I wonder what's the advantage of having a `collect` for `parse` in red? Simpler syntax? I'd thought there was a technical reason..

rebolek

[16:27](#msg57e94c8cf71de5634c6185a0)It’s syntax IMO. You can use both variants in Red.

geekyi

[17:06](#msg57e9558bab9ba81255e5fb90):point\_up: \[September 23, 2016 3:56 PM](https://gitter.im/red/help?at=57e50a55a8fff5ac2d919304) so I'm trying this out

```
red-26sep16-5ec74dc.exe -c -t Android-x86 environment/console/console.red
```

got the binary into my phone.. I wonder what next..

[17:11](#msg57e956aeea1b6b1a6c6c7643)@dsgeyser had success with running on phone?

dockimbel

[17:16](#msg57e957f135e0f31c6c446d6e)@geekyi `collect/keep` in Parse is faster, more flexible (`keep` can be applied to matched input by rules) and it supports recursion.

geekyi

[17:18](#msg57e9586576d85b087dab2e11)@dockimbel thanks

[17:19](#msg57e958a1ca69aeb745b10613)So can't run on android-x86 because Red has a dependency on libcurl

[17:23](#msg57e95999ca69aeb745b10a39)

```
u0_a264@ASUS_T00F:/ $ ./Removable/MicroSD/console
CANNOT LINK EXECUTABLE: could not load library "libcurl.so.4" needed by "./Removable/MicroSD/console"; caused by library "libcurl.so.4" not found
1|u0_a264@ASUS_T00F:/ $
```

for anyone curious

[17:25](#msg57e95a04857ab70f7d425d25)Info: Android: 4.4.2  
Model: ASUS\_T00F  
Manufacturer: asus

greggirwin

[18:38](#msg57e96b1635e0f31c6c44cc17)@Mufferaw, it can take a little while to ramp up on Red, and a little longer before things click about how different it really is, but it's worth it. As Bolek said, fell free to ask questions here.

Mufferaw

[19:33](#msg57e97814ab9ba81255e69847)@greggirwin Thanks for the encouragement, the comments here have been very helpful. I'll definitely have more questions.

## Tuesday 27th September, 2016

dockimbel

[04:56](#msg57e9fc0fca69aeb745b3254b)@geekyi Libcurl is not part of Android, you would need to compile it in order to use Red from command-line. Once we have full I/O, we'll drop the libcurl dependency.

TimeSeriesLord

[18:36](#msg57eabc3b00961416551f6490)@greggirwin Hey Gregg. You are invited to read the latest revision of \[The RVC, Red and REBOL](https://timeserieslord.github.io/red/). You know, awhile back, I read an article you wrote long ago for O'Reilly's Onlamp. In their bio of you, they called you "eccentric!"

Well, I much like the learning flow of The RVC, Red and REBOL. I wrote it for everyday 21st century people who need to leverage Internet computing to do stuff. It's not really meant for pedantic comp sci majors, though I bet many would be schooled on matters.

I still have a few "articles" to flesh out. Certainly, an eccentric fellow like you might have something to add to it. You seem always to bang out good quicky code examples.

The brilliant Nenad is simply too busy for us to bother him about teaching tools. We need him to keep focused to get to 1.0.

greggirwin

[20:02](#msg57ead06cca69aeb745b66d5d)Thanks for posting. Lots of material there. It's good to have different explanations for things, since we don't all think the same. Some terms will vary as well. For example, I have never viewed Redbol as a virtual computer, though it can be argued that any language describes a set of virtual machine instructions in some way.  
I'm sure it will find an audience, and you'll refine things over time. Keep up the good work!

TimeSeriesLord

[21:19](#msg57eae24a54302caa6f24a988)True enough, everyone sees differently. That said, no interpreter ever made in the history of mankind is a language. Interpreters are compiled executables that support the interpreting of a language.

And what makes REBOL and now Nenad's Red a VC is simply that both abstracted layers of an OS — from the graphics to Internet protocols (TCP/IP stack).

It's laughable to call Red a language in the same way that is laughable for anyone to say that REBOL or Red have variables. The languages of those VMs do not variables and never have.

The underlying C code likely uses C variables to let the VCs of REBOL or Red support indirection in the langs that control those VCs, but those langs don't have variables.

I could go on and on. One of the main reasons why REBOL didn't fly in the larger world Carl's own confusion of what he had. Even he foolishly and wrongly talked about variables. Carl simply couldn't properly explain that he created a layer between data and a worker.

I intend to root out all of the stupidity I have seen over the years about REBOL and likely will see with Red. Even Nenad thinks he's writing a language. He isn't. He is writing a VM that supports a language in the same way a good Game Engine can support a scripting language.

Cheers, you eccentric nerd!

rebolek

[21:22](#msg57eae31de5887b81555d2296)As one great mind mentioned once: "Yeah, well, that's just, like, your opinion, man."

TimeSeriesLord

[21:23](#msg57eae34aab9ba81255ebc295)... as you express your mere opinion. What I've written is fact, end of story.

rebolek

[21:23](#msg57eae363c90661384a6e294b)By your interpretation, every interpreter is VM.

TimeSeriesLord

[21:24](#msg57eae3a1ab9ba81255ebc3f7)By your deficient reading comprehension, you have misled yourself. Good luck!

rebolek

[21:25](#msg57eae3e0c90661384a6e2957)I am just trying to understand you. I am not native speaker, so my comprehension is of course deficient.

[21:26](#msg57eae3f7d02791686c3f95a6)I want to understand your concept of VM.

[21:26](#msg57eae403e5887b81555d22af)To me, it sounds like an interpreter.

[21:26](#msg57eae41ad02791686c3f95ac)But as I said, I may have understand you wrong.

TimeSeriesLord

[21:26](#msg57eae41cca69aeb745b6b9a7)I've seen the foreigner lot of the REBOL pull the same b.s. in argument. Perhaps you should refrain from using the Internet to discuss matters until you improve your English comprehension skills.

Good luck

[21:28](#msg57eae4910096141655201cd7)Clearly, interpreters are not languages for someone with suitable time and effort could write an interpreter to interpret more than one language at the same time.

rebolek

[21:29](#msg57eae4cfe045d19955069094)Ok, thanks for your wisdom, master. I will refrain me from using the web, that was invited in Switzerland, until I improve my English. That makes sense.

TimeSeriesLord

[21:30](#msg57eae4e554302caa6f24b400)The Internet was invented by Americans in the USA. The WWW is one bit of it.

rebolek

[21:31](#msg57eae533c90661384a6e2965)I do not have time for this, Redbol was always friendly place. Hodně štěstí, lásko!

TimeSeriesLord

[21:31](#msg57eae53454302caa6f24b4dc)You never see such stupidity in the Ruby or Python world. Only in the REBOL /Red world are guys a-holes. The common thread is that most of them in the REBOL/Red world are Europeans.

[21:32](#msg57eae55835e0f31c6c4a2dfc)I don't have time for it as well. The REBOL/Red Europeans always make this "place" and places like it "Rebol.org" unfriendly.

rebolek

[21:33](#msg57eae5b9e045d199550690bf)It’s possible, I don’t know. I never bothered where everyone is from.

TimeSeriesLord

[21:34](#msg57eae5e354302caa6f24b75c)Reality isn't possibility.

[21:34](#msg57eae5f7ca69aeb745b6c0e7)Just drop it already or do you have Asperger's or something?

[21:36](#msg57eae64a35e0f31c6c4a3180)Oh and you were quick to play the foreigner card — "I am not native speaker".

rebolek

[21:36](#msg57eae657c90661384a6e2978)@TimeSeriesLord This is red/help. Do you need some help with Red? For other questions, you can PM me.

TimeSeriesLord

[21:40](#msg57eae743ab9ba81255ebd12b)@rebolek So why don't you be quiet. You stepped into something you have not done so. You're the problem here dude. I'm not.

rebolek

[21:41](#msg57eae78ee045d199550690fc)As you say. Please, move other discussion to private channel. Thanks.

TimeSeriesLord

[21:43](#msg57eae7f3e4e41c6a4afc1cb5)Let it go

greggirwin

[22:12](#msg57eaeee854302caa6f24d5e4)@TimeSeriesLord, please refrain from:  
\- Telling people to get off the internet  
\- Calling people stupid or a-holes  
\- Insulting their mental state, nationality, or foreign language skills  
\- Looking for loopholes in what is considered civil behavior

If you can't do that, please leave.

TimeSeriesLord

[22:14](#msg57eaef2e35e0f31c6c4a4ec7)Why don't you worry about yourself? Had you not piped up with your comment and then that other guy piling on, this wouldn't happen.

After the fact, you look like girls who are whining about phony injustice, which never happened.

I here to help and be helped. Stick to language talk. I have been.

[22:15](#msg57eaef75ab9ba81255ebed70)You REBOL cum Reddies are exactly why the REBOL never took off. If one is not part of the clique but shows up those of the clique with superior thought, the clique goes apeshit like you have and that other one.

[22:16](#msg57eaefa2783fe9b945a1005a)So you need to let it go now, Greggie.

I will be back, even if under yet another GMAIL. LOL.

greggirwin

[22:17](#msg57eaeff435e0f31c6c4a5179)On a personal note, I've been part of the Redbol community for 15+ years, and it is a wonderful place, filled with generous, knowledgeable people from all over the world. I'm proud to be a part of it.

TimeSeriesLord

[22:17](#msg57eaeffc783fe9b945a10140)Who cares braggart.

[22:18](#msg57eaf02bca69aeb745b6dfb6)I've been part of it too on and off since 1999 or so. REBOL dorks are such nerds. They scare people from the lang. That is likely the biggest block to adoption of it.

dahu

[22:18](#msg57eaf04eab9ba81255ebef99)No, @TimeSeriesLord , you haven't been "just sticking to language talk". You have been childishly attacking people and their traits. Every time you join the discussions here it quickly degenerates to name-calling and arrogant dismissals. Your behaviour and attitude ruins whatever positive contribution you seem to want to make to the Redbol language and community. Check yourself.

## Wednesday 28th September, 2016

ifgem

[03:14](#msg57eb3596ab9ba81255ec9a7a)The best troll I've ever seen:))))

jeffmaner

[03:42](#msg57eb3c41857ab70f7d48f99d)I, for one, value what @TimeSeriesLord has to say--some of it, anyway. S/he has valuable insight to offer to many who need it, including myself. H\[is|er] delivery method wonts... Tact, perhaps? @TimeSeriesLord, I am sorry, but you're stuck with mere mortals, such as I. Please, tone down your a-hole attitude. Offer us your hard-earned wisdom and perspective, and let us mere mortals do what we will with it--for better, or for worse. And, truth be told, your posts can't boast a mastery of English language or grammar, either. Yes, most of us aren't as blessed as you with your intelligence and acumen. News flash: you're not an island. Help us who aren't as divine as thee to row this ship forward against the tide. We can do without the name-calling. We can do without the prickly provocation. What we cannot do without, however, is insight. Positive or negative, that insight counts. Your insight matters. Your arrogance, not so much. And to everyone else: stop provoking @TimeSeriesLord. S/he's obviously sensitive. Take the insight offered, and ignore the bully attitude.

DideC

[11:22](#msg57eba7e7ca69aeb745b923a0)@TimeSeriesLord Back to the point. When you consider Red or Rebol interpreter as a VM, do you mean to compare it to the \[JVM](https://en.wikipedia.org/wiki/Java\_virtual\_machine)? I think the misunderstanding is that nowodays, VM is used by most people in the sense of \[Virtual Machine](https://en.wikipedia.org/wiki/Virtual\_machine), that abstract full computer hardware. But different products tends to make the frontier not so clear between the two kinds (Interpreter and virtual machine).

Rebol2Red

[13:04](#msg57ebbfe2009614165522edc9)

## Thursday 29th September, 2016

Mufferaw

[11:49](#msg57ecffd5783fe9b945a8406a)Hi everyone, I'm trying to draw some things but I don't know how to convert a block of strings into a block.

[11:49](#msg57ecffe0ab9ba81255f32cfc)'''

rebolek

[11:51](#msg57ed0030d56b91170dfc5d1c)Do you have some example of your input and expected output?

Mufferaw

[11:51](#msg57ed003554302caa6f2c2f5d)'''  
keep rejoin\['circle " " coord " " 5 " "]]]  
'''  
which gives me the block of strings but how can I change that so it can be used with VID

'''  
view [  
size 800x600  
base 780x580  
draw drawblock  
]  
'''

rebolek

[11:52](#msg57ed0088d56b91170dfc5d2b)@Mufferaw

```
red>> coord: 0x0
== 0x0
red>> reduce ['circle coord 5]
== [circle 0x0 5]
```

[11:53](#msg57ed00abfdfac4436c12f425)Or

```
red>> compose [circle (coord) 5]
== [circle 0x0 5]
```

Mufferaw

[11:54](#msg57ed00f6009614165527865e)Thanks, that's so simple

rebolek

[11:54](#msg57ed0108aa1f6dce24627e5f)Yes :) You do not need to use strings at all.

[11:55](#msg57ed0125d6c90e8a6e65d766)Remember, code is data.

geekyi

[12:19](#msg57ed06e80ff4ef7a50edf225)@Mufferaw why not also post your question on stack overflow? So others will also learn. "how to convert a block of strings into a block" :wink:

Mufferaw

[12:36](#msg57ed0acb0ff4ef7a50ee08ae)@geekyi I have posted the question  
http://stackoverflow.com/questions/39770518/convert-a-block-of-strings-to-a-block-in-red

geekyi

[12:38](#msg57ed0b3a16c373622011e9b4)@rebolek you going to answer that, or should I? :tongue:

rebolek

[12:38](#msg57ed0b4aaa1f6dce24627fb5)It’s bit different question though, but yes :)

geekyi

[12:40](#msg57ed0bbabe5dec7550062d72)It is..

rebolek

[12:41](#msg57ed0be4fdfac4436c12f5b6)Done.

Mufferaw

[12:41](#msg57ed0beac512d9653a521db7)I will change it!

[15:06](#msg57ed2df80ff4ef7a50eec0f5)Now I've got my circles drawn but I want update them, I tried

```
view [
        size 800x600
        canvas: base 780x580 draw drawblock rate 30 
        on-time [
           do iterate
           do refresh
           do sync-grids  
           show canvas   
        ]     
    ]
```

the 'do refresh' function changes the drawblock but sadly it doesn't redraw it. How can I updat the view?

geekyi

[15:10](#msg57ed2effbe5dec755006f6bd)Are you looking at https://github.com/red/code/blob/master/Scripts/bubbles.red ?

Mufferaw

[15:11](#msg57ed2f12b0ff456d3acf606d)@geekyi yes

[15:13](#msg57ed2f7f0ff4ef7a50eec8b8)should I just draw a box over everything?

geekyi

[15:13](#msg57ed2f8b0ff4ef7a50eec933)@Mufferaw would be helpful if you can post all your code as a \[gist](https://gist.github.c)

[15:14](#msg57ed2fd76f39416b1cd521ea)I'm not exactly sure what you are trying out now

Mufferaw

[15:15](#msg57ed3003d38f186520af50ae)@geekyi https://gist.github.com/Mufferaw/cbb9862a8b0df3021125042e64c61678

geekyi

[15:20](#msg57ed313c34a8d5681cca76dc)@Mufferaw ah, game of life :smile: you can also use an image and manipulate the pixels if you want.. right now, what I'd do is put a `probe` to see if it updates properly

Mufferaw

[15:21](#msg57ed31836f39416b1cd52aca)It seemed like a good exercise to learn about Red :smile:

[15:23](#msg57ed320db0ff456d3acf702c)I put probe in the on-time block and all the circles are white

[15:24](#msg57ed3226be5dec7550070399)all the circles in the drawblock block are white

geekyi

[15:30](#msg57ed33a0b0ff456d3acf7788)I wonder if you are actually changing anything in the drawblock @Mufferaw

[15:31](#msg57ed33cdb0ff456d3acf784b)The code inside drawblock gets executed alright

Mufferaw

[15:32](#msg57ed34166f39416b1cd539d3)Hmm! You're right, it's not changing.

geekyi

[15:40](#msg57ed35da6f39416b1cd54368)@geekyi is multitasking

Mufferaw

[15:40](#msg57ed35f0d38f186520af69c8)no, it seems it is changing

geekyi

[15:44](#msg57ed36ce0ff4ef7a50eee9ac)@Mufferaw

```
scratchgrid is a block! of value: [[false .. ]]
```

All false there, is that's what is supposed to be?

[15:46](#msg57ed375bbe5dec7550071c25)Better define `scratchgrid:` on the outside (oh wait, you have! hmm..)

[15:47](#msg57ed377cb0ff456d3acf86fa)Btw, is this based on some rebol code?

Mufferaw

[15:52](#msg57ed38a216c373622012cc7b)scratchgrid is the temporary block for the updated values, after I check the neighboring cells.  
This is one is not based on rebol code, I was trying to go through the documentation and get it working myself as way to learn Red.

[15:53](#msg57ed390a6f39416b1cd54fa7):smile: I think I got a bit too excited and didn't really dig through the VID documentation enough

geekyi

[15:56](#msg57ed39a234a8d5681cca9f7e)@Mufferaw I don't think it's a problem with your view code, unless I'm reading it wrong

[15:56](#msg57ed39bbbe5dec75500726ac)Your code can be simplified tho..

Mufferaw

[15:59](#msg57ed3a45d38f186520af7bf9)yeah, it looks a lot like C code, I don't really understand Red yet.

dockimbel

[16:00](#msg57ed3a83be5dec7550072984)@Mufferaw It seems you are creating a new Draw block for displaying each time, but that block is not the one you passed to `draw` command (that one does not seem to be modified), so your display will not change. What you need to do is re-use the block of Draw commands (by clearing it, and filling it again), and not create new ones each time.

Mufferaw

[16:21](#msg57ed3f98c512d9653a532d6f)Thanks for the help! It's past my bedtime, I'll have to try again tomorrow.

geekyi

[16:24](#msg57ed40306f39416b1cd572d9)@Mufferaw :smile: it was good.. :smile: next time use an `image!` ya?

dockimbel

[16:32](#msg57ed421416c373622012f3b1)@Mufferaw \[This version](https://gist.github.com/dockimbel/422ad7631661abbc1afa511b6e981761) has a working display, though, not sure why it stops after a few seconds.

geekyi

[16:33](#msg57ed4275d38f186520afa12c)@dockimbel it looks like everything "dies", doesn't seem to be designed to wrap. I think it works as intended

greggirwin

[16:40](#msg57ed43fac512d9653a53411c)It may just hit a static state. There are patterns that will never change once they exist.

geekyi

[16:43](#msg57ed44b76f39416b1cd58674)@greggirwin yeah, that is what's happening

TimeSlip

[16:46](#msg57ed454b6f39416b1cd588af)Can anyone tell me what the Red equivalent is to #"^a" ? I'm trying to add a keypress to a button and Red doesn't seem to like the Rebol notation. Thank you!

dockimbel

[16:48](#msg57ed45d9c512d9653a5348ca)@TimeSlip Use `#"^A"`. I wonder if we should support ^ escaping with lowercase letters.

TimeSlip

[16:48](#msg57ed45f8b0ff456d3acfc18a)oh, thanks Doc.

[16:49](#msg57ed45ffbe5dec755007612f)That was easy.

[16:50](#msg57ed46410ff4ef7a50ef3407)Personally I like the choice but I'm sure there are things I am not considering.

[17:23](#msg57ed4df6d38f186520afd253)view \[button #"^A" "DO" \[print "hello"] ]

[17:24](#msg57ed4e570ff4ef7a50ef5623)No errors but pressing "A" does nothing.

geekyi

[17:46](#msg57ed535d34a8d5681ccb0e7d)@TimeSlip works for me. Windows, red build `red-26sep16-5ec74dc`

[17:48](#msg57ed53e40ff4ef7a50ef6d0f)\[!\[blob](https://files.gitter.im/red/help/GvHO/thumb/blob.png)](https://files.gitter.im/red/help/GvHO/blob)

TimeSlip

[18:33](#msg57ed5e95be5dec755007c907)I'm using 28sep16 build.

[18:34](#msg57ed5ea16f39416b1cd5eef9)Windows as well.

geekyi

[19:30](#msg57ed6bc1be5dec755007fe9b)@TimeSlip sorry, I don't know what could be the problem, both the builds seem to be based on latest git master

[19:30](#msg57ed6bce16c3736220139f65)prints "hello" for me

[19:30](#msg57ed6bec16c3736220139ffa)

```
view [button #"^A" "DO" [print "hello"] ]
```

TimeSlip

[19:34](#msg57ed6cbcc512d9653a53f1ff)When you press the "A" key, it prints "hello"?

geekyi

[19:35](#msg57ed6cecbe5dec7550080762)@TimeSlip Ah ok, I think I misunderstood, no it doesn't

[19:36](#msg57ed6d23d38f186520b04e30)Sorry

[19:36](#msg57ed6d420ff4ef7a50efd7f2)I should probably get to sleep. Goodnight

TimeSlip

[19:36](#msg57ed6d51d38f186520b04ec7)@geekyi Thank you. At least it doesn't produce an error. Good night.

greggirwin

[20:02](#msg57ed736934a8d5681ccb8da2)Red VID doesn't handle shortcut keys like REBOL VID at this time. You can add an `on-key` actor to do it though. e.g.

[20:03](#msg57ed73a534a8d5681ccb8e77)

```
cmd-do: does [print "hello"]
handle-key: func [face event][
    if event/ctrl? [
        switch event/key [
            #"A" [cmd-do]
        ]
    ]
]
view [
    button "DO" [cmd-do] on-key [handle-key face event]
]
```

[20:06](#msg57ed743c6f39416b1cd64ad9)You could also do it more inline:

```
cmd-do: does [print "hello"]
view [
    button "DO" [cmd-do] on-key [if all [event/ctrl? #"A" = event/key][cmd-do]]
]
```

[20:08](#msg57ed74af34a8d5681ccb9285)I don't know what the plan is for something like `do-face` yet, to trigger its default actor.

[20:09](#msg57ed75140ff4ef7a50eff67f)http://doc.red-lang.org/gui/View.html contains details on face and event elements.

## Friday 30th September, 2016

dockimbel

[03:56](#msg57ede25dd38f186520b1c57a)@greggirwin See `help do-actor`.

[03:56](#msg57ede2826f39416b1cd79748)@TimeSlip Keyboard shortcuts using char! values are not yet implemented in VID.

greggirwin

[04:27](#msg57ede9cc6f39416b1cd7a953)Thanks Doc!

Mufferaw

[04:42](#msg57eded20c512d9653a5577e5)@dockimbel I also want to thank you for taking the time to fix my 'game of life'

[04:44](#msg57eded9034a8d5681cccfe3b)https://gist.github.com/Mufferaw/b418dfb71c0f4c82053551e57dbdf3b5

[04:44](#msg57ededb30ff4ef7a50f16361)I cleaned up the window size and increased the grid size, so it is a bit more 'exciting' now

TimeSlip

[05:05](#msg57edf2830ff4ef7a50f16eac)@dockimbel No problem! Thank you.

greggirwin

[05:51](#msg57edfd6dc512d9653a55a0ee)@Mufferaw, nice!

Mufferaw

[05:59](#msg57edff34be5dec755009c030)@greggirwin It turned out ok and I learned a lot in the process, thanks to all the help I received here!

qtxie

[07:42](#msg57ee1755d56b91170dfc7949)@Mufferaw There is an issue in the code.  
When insert this line of code (`fill-pen circle 5`) into the draw block, the `canvas` face! will be refreshed immediately (Realtime updating mode). But the draw block is not completely constructed, it will case the following draw error:

```
*** Script Error: invalid Draw dialect input at: [<color> circle <coord> 5]
*** Where: ???
```

[07:43](#msg57ee17acd6c90e8a6e65f4a0)The solution is use `Deferred updating` mode, I updated the here:  
https://gist.github.com/qtxie/5318c5dc61f9584846d7f230fb7a07b9

Mufferaw

[07:59](#msg57ee1b536f39416b1cd837d1)ohhh, I was wondering about that, when the canvas would update. So if system/view/auto-sync? is 'no' then 'show canvas is needed?

DideC

[08:00](#msg57ee1b9ec512d9653a5600b5)Exactly

[08:04](#msg57ee1cab6f39416b1cd83d0b)In my \[livecode](https://gist.github.com/DideC/85d60c99f97f2e4972a6f7b09a1fe630) version with splitters, I had to disable auto-refresh when the splitter is dragged and do the `show` manually after all faces coords are changed. Else, refresh is done for each `XX/size` or `XX/offset` changes and its too heavy to be responsive. You can test it by changing the `on-drag-start` last value from `no` to `yes`.

Mufferaw

[08:15](#msg57ee1f3f0ff4ef7a50f1fa7a)@DideC I didn't notice any difference

DideC

[08:24](#msg57ee2123d38f186520b27be5)Arf, you are right. In a previous version there was a big one, but many things have changed since, and it seems to not be as relevant as before.

dockimbel

[09:29](#msg57ee309416c373622015eace)@Mufferaw You're welcome. @qtxie My mistake, I forgot to turn off the auto-refreshing mode.

TimeSlip

[17:39](#msg57eea367b0ff456d3ad48f4a)@greggirwin Thanks Gregg for the tip.

## Saturday 1st October, 2016

this-gavagai

[02:32](#msg57ef20420ff4ef7a50f5a63d)Hello, I'm having a lot of fun learning Red. Is there as yet a way to mark object fields as private? (Or, alternately, is there another way that I should be thinking about object interfaces more in line with Red/Rebol's design principles?)

PeterWAWood

[06:44](#msg57ef5b3734a8d5681cd1938c)@this-gavagai There is a technique using

```
use
```

to create "private" words in a context (object). It is explained in this Rebol mailing list \[thread](http://www.rebol.org/ml-display-thread.r?m=rmlRJCC).

```
use
```

is not yet implemented in the current alpha release of Red.

[06:46](#msg57ef5bad0ff4ef7a50f62d93)There are other techniques that can be used and @dockimbel may have something better planned.

[06:58](#msg57ef5e990ff4ef7a50f634c5)This may be a \[better thread](http://www.rebol.org/ml-display-thread.r?m=rmlRYTS) to read.

greggirwin

[19:07](#msg57f0097e6f39416b1cde2055)Welcome @this-gavagai! This question comes up from time to time (in Rebol's history), and it's a good one. Technically, we can do it a number of ways (I can post a simple `use` mezzanine if you want to play with that). I haven't seen anyone pursue it and doc their experiences though. I did the same thing when I found Rebol. I implemented a few things, ended up using a naming convention after that, but often don't even do that. I would hazard a guess that most long time Redbol users are the same, based on code I've seen.

That said, Red goes beyond Rebol. As it adds features to aid PitL, Reducers (Red Users :^) may revisit this technique. Until we have a module system, and object design (for things like accessors or schemas) is fleshed out, we don't know what Red will provide, and where the line is that says "tooling starts here."

I'm glad you asked if there's another way you should think about it, to align with Red's principles. With that mindset, you'll make a great Reducer. And, yes, there are principles. Briefly (I know this is getting long already), Red gives you enormous freedom, and safety comes in different forms than other languages. e.g. values are strongly typed but "variables" are not. For now, think of objects more like structs or dicts. Red also has a map! type. A little doc on the structured types and their strengths/weaknesses is a great idea.

Think in terms of composition, prototype-based, rather than inheritance and classes. Though people have built entire class systems as well.

I'll stop now.

## Sunday 2nd October, 2016

this-gavagai

[03:56](#msg57f0856cd38f186520b968e7)@PeterWAWood Thank you for finding these threads! It's very helpful to see some of the history here. I also came across the Rebol 3 function protect/hide, which seems conceptually similar in at least some respects. In any case, I'm glad to hear that wasn't just missing something obvious, and I look forward to seeing how Red moves forward with these questions.

[03:56](#msg57f085750ff4ef7a50f92469)@greggirwin Thank you, this was very orienting. The problem I'm trying to solve is not so much safety as just plain old conceptual complexity. I work in the social sciences, and there's real interest right now in better approaches to modeling and simulation. I'm still new to the spirit of Red, but from what I've gathered so far it seems to be \*exactly* what everyone's looking for. The problem is that a lot of these projects are maintained over long periods of time by loose networks of sloppy programmers, people like me who are able enough to slap some code together but who generally possess very little sense of best practices. For example, in a simulation of the agricultural sector, you might have one researcher modeling weather, another modeling consumer demand, and someone else doing finance markets. Each component would generally evolve independently over time, so the less we all have to know about the inner workings of each others code, the better.

I'm fully on board with a compositional approach to objects, but it would still be very useful to be able to define the public interface of objects clearly and explicitly somehow. I really like, for example, the way that `function` uses optional strings to self-document in a way that's accessible at runtime. Maybe something like that is the most elegant solution here? I assume I could accomplish something similar by using a mezzanine function to create my objects rather than invoking `make object!` directly. That wouldn't stop people from altering internal values directly from the console, of course, but it could perhaps allow a higher level interface of some sort to maintain control over access. Is this totally the wrong way to be thinking about it? I appreciate your time here. It is tremendously valuable to have so much access to people with so much experience.

greggirwin

[04:26](#msg57f08c8cd38f186520b9766d)It's late here, so I'll sleep on it and write more tomorrow. A couple quick thoughts though. Red is data. Sometimes that data is evaluated as code, but think about everything being data which you can process in different ways (and where `parse` comes in). In that light, don't think about sharing code and making the code last. Think about structuring and sharing data so \*it* can last and is amenable to processing and understanding.

Thought #2, it has been said that reuse in the small is a solved problem, but reuse in the large is still an unsolved problem.

dockimbel

[09:35](#msg57f0d4e2c512d9653a5d8668)@greggirwin "Reducers " :+1: We strive to be \*complexity reducers\*! ;-)

[09:38](#msg57f0d594b0ff456d3ada1ff4)@this-gavagai You should consider creating dialects (DSL) as the high-level interface for each of your domains, instead of using classic OOP approach, which is not the best use of Red/Rebol features. They will provide much better domain-oriented abstractions, while hiding away the implementation details.

geekyi

[11:43](#msg57f0f2c7be5dec7550123b95)@this-gavagai what is your goal? Is to design andwrite simple interfaces? Or write modules? If so writing functions and using `spec-of` have been helpful for me.

[11:46](#msg57f0f382b0ff456d3ada6cbe)&gt;`function` uses optional strings to self-document in a way that's accessible at runtime. Maybe something like that is the most elegant solution here?

I believe so. Advantage of self documenting :smile:  
If you want even simpler api/interface you can go with dialecting as Doc says. (then you don't have the self documenting advantage tho) In all these cases, `parse` is useful

[11:58](#msg57f0f67e34a8d5681cd585dd)Does anyone have an implementation of the github or gitter apis?

[12:00](#msg57f0f6e4b0ff456d3ada75fd)I need to learn more about the redbol network stack and how to design http apis in red

[12:01](#msg57f0f6fcbe5dec7550124637)New goal: post a stackoverflow question daily

this-gavagai

[15:20](#msg57f125bc6f39416b1ce0bf73)@greggirwin I think I follow where you're going, but I'm not really looking to share or reuse code, I don't think. The question I'm trying to ask is how to best conceptualize the structure of data (some of which is evaluated as code) in order to make it clear which parts are "outward facing" and which parts aren't.

[15:20](#msg57f125c934a8d5681cd601e0)@dockimbel Very interesting. So the idea here would be to make objects, variables, and functions as usual and then define a grammar to poll and prod those things in a specifically constrained way?

For example, rather than access `weather_module/temperature` directly, I might define a function called `request` that (in tandem with `parse`, presumably) can return the appropriate value to `request temperature from weather_component` but also reject `request private_variable from weather_component`?

I've read about dialecting a bit, but I've always felt like I was missing something fundamental. Now that you've explained it as a way of abstracting away from an underlying implementation, the power of it all seems so obvious. I can't believe I didn't think of it in those terms before. I'm a linguist by training, and this is actually far more intuitive to me than all those headers and modifiers used in OOP. Very cool :)

[15:20](#msg57f125d7be5dec755012c377)@geekyi Most immediately, my goal is to allow those I work with to rewrite their components without having to worry about whether doing so will break other people's code. More abstractly, I'm trying to think about how components in a simulation might communicate and interact with each other in an elegant, semantically-oriented way. This is what I find so intriguing about the work you guys are doing. Red's highly reflective nature has certainly been handy to me as I try to learn it, but it's also potentially very interesting to the extent that it allows objects in a context to ask questions about each other.

[15:21](#msg57f1260d0ff4ef7a50faa96b)Also, thanks everyone. This has been a very warm welcome to a new community.

greggirwin

[17:23](#msg57f142a516c37362201e6326)@this-gavagai my comment about reuse was based on  
&gt; The problem is that a lot of these projects are maintained over long periods of time by loose networks of sloppy programmers

I think Doc, and your further posts, have cleared up my confusion.

[17:29](#msg57f143ef16c37362201e6776)As to your parse example, yes, that's exactly the idea. It puts a new onus and emphasis on the designer, because now you're a language designer. That doesn't necessarily mean more work, but different work. What it does, very clearly, is force you to explicitly design and declare the public interface to your data. And if your data is all Red as well, it's easy to parse at the block level, which means you can write different dialects for different purposes (e.g. data gathering and admin, reporting, statistics).

## Monday 3th October, 2016

dockimbel

[07:18](#msg57f2064434a8d5681cd8719a)@this-gavagai That's one way to approach it, yes. Think about the usage patterns of the public API(s) you want to expose and capture them into an appropriate grammar. The larger the API and the usage patterns, the more gains you'll get from a wrapping DSL.

wolframkriesing\_twitter

[15:33](#msg57f27a668b26e33e7d234312)a rather simple question, playing with the date type, I was wondering, why a subtraction always returns days, how can I make it return minutes, which could be possible in the second example

```
>> 24-dec-2016 - now
== 82
>> 24-dec-2016/0:00 - now
== 82
```

is that just arbitrary or can I influence it? I tried around a bit with refinements, but would appreciate a push in a direction, the rebol/red way. thx

geekyi

[15:52](#msg57f27eaa29403a416fc1b3cd)@wolframkriesing\_twitter why not ask on stackoverflow.com?

wolframkriesing\_twitter

[15:52](#msg57f27ebd43b5aeb0099322cd)good point, will do

[15:52](#msg57f27ec98b26e33e7d2355b6)so its re-readable for others, thx

[15:53](#msg57f27ef50ec6f9457d9ac77f)now I have to find my credentials again :) I knew the day would come

geekyi

[15:54](#msg57f27f4e3c59573f6f05355f)@wolframkriesing\_twitter `difference` seems to get you half-way there:

```
difference 24-dec-2016 now
== 1952:06:01
```

wolframkriesing\_twitter

[15:56](#msg57f27fb93c59573f6f053665)i see, the other meaning of `difference`, hadn't even thought it would do that

DideC

[16:07](#msg57f2822629403a416fc1c249)Hour result is bound to the internal representation. So with two spaced dates, result will be truncated, ence false.

geekyi

[16:08](#msg57f28296f69c94ad09867264)@wolframkriesing\_twitter I just realized something else (about how that will literally look like) let me know when you have posted the question :wink:

wolframkriesing\_twitter

[16:09](#msg57f282b129403a416fc1c480)@geekyi done

DideC

[16:09](#msg57f282b929403a416fc1c4ac)link ?

wolframkriesing\_twitter

[16:09](#msg57f282bcd45d7f0f525c3b76)@geekyi http://stackoverflow.com/questions/39835881/red-rebol-subtracting-dates-returns-days-how-can-i-change-that

geekyi

[16:10](#msg57f282d929403a416fc1c524)The thing is, how do you expect your result to be?

[16:10](#msg57f282e591d6af1152268a70)The literal representation

wolframkriesing\_twitter

[16:10](#msg57f2830891d6af1152268abc)@geekyi i had no expectation, was just playing around and then I had the idea to get minutes, instead of days ... without doing the ugly math :)

geekyi

[16:11](#msg57f28325d45d7f0f525c41e4)Or maybe you don't want that.. that is enough :point\_up: \[October 3, 2016 8:54 PM](https://gitter.im/red/help?at=57f27f4e3c59573f6f05355f)

DideC

[16:11](#msg57f2834a29403a416fc1c77d)The uggly math :

```
in-minutes: func [d1 [date!] d2 [date!] /local d t] [d: d2 - d1 d1/date: d2/date t: difference d2 d1 d * 1440 + t/hour * 60 + t/minute]
```

wolframkriesing\_twitter

[16:12](#msg57f2835c3c59573f6f054a44)yep :)

[16:13](#msg57f283b00ec6f9457d9adff4)I actually thought there was something like (not-working syntax ahead): `(24-dec-2016 - now)/minutes` ... but since the subtraction returns an integer the refinement I tried can not even work (besides being invalid syntax, right?)

geekyi

[16:16](#msg57f2845029403a416fc1cc1b)@wolframkriesing\_twitter yeah,

```
>> time-diff: difference 24-dec-2016 now
== 1951:42:11
>> time-diff/2
== 42
```

greggirwin

[16:18](#msg57f284d629403a416fc1ce20)You can certainly make a wish request, but it needs to be well thought out. Red doesn't have date! yet, so we have a better chance of changing it now. It will break rebol compatibility though.

wolframkriesing\_twitter

[16:19](#msg57f2851391d6af1152269378)tbh I didn't think that far either, I just thought: the people behind red/rebol are smarter than me, so let's see what they did to date-math :)

greggirwin

[16:21](#msg57f285a0d45d7f0f525c4c2b)If we had a relative-date! type, it could return full info. A `date-diff` would be easy to write, and let you control your result. The rebol behavior makes some things easy, and others a bit more work. Another one of those darn subjective design decisions. :^)

geekyi

[16:24](#msg57f286308b26e33e7d237bc4)@greggirwin :+1: or something in general in the language that dealt with relative vs absoulte values

wolframkriesing\_twitter

[16:25](#msg57f2865dd45d7f0f525c4fed)definitely interesting

greggirwin

[16:25](#msg57f286623c59573f6f055e07)I have a lot of date! mezzanines, but no `date-diff`. I suppose rel-date! would be like timespan in some other langs.

wolframkriesing\_twitter

[16:26](#msg57f28699d45d7f0f525c50f7)would be heck awesome if something like that comes out of the box, now the question might be where would the line to be drawn then. because there are lots of things that would be awesome ... that's something I guess you, core guys, have already made up your mind about

greggirwin

[16:27](#msg57f286fc3c59573f6f0560de)Just had a quick look, and the date! subtraction behavior may have been aligned with `DATEDIFF` in SQL.

geekyi

[16:28](#msg57f2871943b5aeb009935370)@DideC why not add that to the answer :point\_up: \[October 3, 2016 9:11 PM](https://gitter.im/red/help?at=57f2834a29403a416fc1c77d) (If you think it is a good idea)

[16:28](#msg57f287398b26e33e7d237f9a)@geekyi hadn't realized before that you could look at the rebol source! :O

wolframkriesing\_twitter

[16:29](#msg57f287710ec6f9457d9af5c5)@greggirwin in sql you also have `select timediff("2016-12-24 10:00", Now())`

[16:29](#msg57f287868b26e33e7d2380fa)which is the result of `difference`, it seems

greggirwin

[16:32](#msg57f2882f43b5aeb00993579b)Right. `Date-diff` will take some thought, as would a supporting relative date data model. I've seen it as \[months days time] and \[days time].

[16:33](#msg57f2886b43b5aeb0099358c9)Need to explore how you get useful results which allow you to go from abs to rel and back to a correct abs.

geekyi

[16:33](#msg57f28876f69c94ad098693d4)@greggirwin I particularly like the way it is dealt with in \[Frink](https://frinklang.org/#DateTimeHandling)

[16:36](#msg57f2890a3c59573f6f0569a1)The representation is not that nice, but the actual handling is pretty awesome

[16:36](#msg57f28928d45d7f0f525c5c79)In general, the way quantities are handled is awesome

greggirwin

[16:39](#msg57f289b629403a416fc1e5ae)I'll check out Frink again. I do recall that I liked it being like Wolfram, with unit support.

wolframkriesing\_twitter

[16:40](#msg57f289e729403a416fc1e6c1)nice, https://frinklang.org/#DateTimeArithmetic easy solution would be to return correct amount of days, including fractions

```
>> 2016-12-24/10:00 - 2016-10-01/11:00  
== 84.976
```

(the `.976` is random)  
instead of just `84` as rebol does

geekyi

[16:45](#msg57f28b3ef69c94ad0986a246)@wolframkriesing\_twitter Maybe that is the right way :smile:

[16:46](#msg57f28b7e8b26e33e7d239467)Note tho, Frink may have different design goals: https://frinklang.org/LL4.html#slide7  
&gt;When in doubt, be pedantic

wolframkriesing\_twitter

[16:47](#msg57f28b983c59573f6f05779a)applying occam's razor that would be the thing to do :)

[16:48](#msg57f28bc70ec6f9457d9b0bc1)@geekyi how does the pedantic part collide with red goals?

geekyi

[16:48](#msg57f28bcef69c94ad0986a3fc)It works really well for Frink IMHO, but I don't know if .. maybe it would be the best thing for Red

greggirwin

[16:49](#msg57f28c0091d6af115226b63e)@wolframkriesing\_twitter, sounds easy, but is it a good long term choice. Using a decimal to represent days+time in whole/frac part seems very un-Red. Now it's just a number with no type information.

wolframkriesing\_twitter

[16:49](#msg57f28c19f69c94ad0986a660)@greggirwin +1, absolutely true. if the red-way is to do it right, which is more complex, I think it makes sense. I am just the messenger, watching where this is heading :)

geekyi

[16:51](#msg57f28c7fd45d7f0f525c6b8b)@wolframkriesing\_twitter It may or may not.. Red strives to be simple at everything, so you have to balance convenience, performance, etc..

[16:51](#msg57f28c9291d6af115226b8c1)The "right" way is not always obvious

[16:52](#msg57f28cb3d45d7f0f525c6cf0)&gt; "Simple Made Easy"

-Rich Hickey

[16:55](#msg57f28d8a43b5aeb009936f29)wrong quote :p

[16:56](#msg57f28dc591d6af115226bd2d)Definition of Simple by carl http://www.rebol.com/article/0509.html

## Tuesday 4th October, 2016

Rebol2Red

[11:44](#msg57f3962329403a416fc58af9)Will someone test this? (Will not work while copying and pasting in the console)

```
Red []
;-----------------------------------------------------------------------
; Fetch date and time from internet 
; (hack until date functions are implemented)
;-----------------------------------------------------------------------
datetime: context [
	mid:   		func [s start len][copy/part at s start len] ; as in Basic
	format2:	func[num[integer!]]
	[
		num: form num
		if tail? next num [insert num "0"]
		return num	
	]
	page: read http://time.is/

	; maybe this have to be adjusted for other countries!
	; investigate the source of the page in a browser
	parse page [
					thru {<div id="twd">} copy time to {</div>}
					thru {title="Click for calendar">} copy date to { (}
	]
	
	hour: mid time 1 2 	minute: mid time 4 2 	second: mid time 7 2

	months: [
		"january" "february" "march" "april" "may" "june" 
		"july" "august" "september" "october" "november" "december"
	]

	date: 			split date " "
	dayname: 		date/1
	day: 			date/2 2
	;day:			format2 to integer! date/2 2 ; 2 digits
	month:      	date/3
	year:			date/4
	month:			index? find months date/3
	;month:         format2 to integer! index? find months date/3 2 ; 2 digits
]

; usage:
print [datetime/hour datetime/minute datetime/second]
print [datetime/dayname datetime/day datetime/month datetime/year]
```

dockimbel

[11:52](#msg57f3981943b5aeb00996fc01)@Rebol2Red Please do not put line breaks between function spec and body blocks, it makes your code not paste-able in console.

Rebol2Red

[11:56](#msg57f398d8f69c94ad098a34a3)Thanks i will pay attention to that, but the program will not run over here.  
I have a working version of it, but this is in dutch. I get the page loaded in dutch.  
Now i ca'nt edit the posted code?!  
Because i can't run this code it has no point of posting again with possible other errors.  
Wright/Wrong?

[12:13](#msg57f39cd143b5aeb009970db5)Maybe someone can paste the right code so i can delete mine (the only thing i can do)?

rebolek

[12:46](#msg57f3a4c12e485b053d1f305b)@Rebol2Red Hm, doesn’t work here, because I get the result page in Czech.

[12:50](#msg57f3a59664f5e2a706b168ef)@Rebol2Red you should use this: `page: read http://time.is/?lang=en`

Rebol2Red

[12:58](#msg57f3a7710ec6f9457d9ebcf5)@rebolek Thanks, so nothing wrong with the code?

rebolek

[12:58](#msg57f3a78c64f5e2a706b1695f)@Rebol2Red here’s working version:

```
Red []
;-----------------------------------------------------------------------
; Fetch date and time from internet 
; (hack until date functions are implemented)
;-----------------------------------------------------------------------
datetime: context [
	mid: func [s start len][copy/part at s start len] ; as in Basic
	format2: func [
		num[integer!]
		] [
		num: form num
		if tail? next num [insert num "0"]
		return num    
	]
	page: read http://time.is/?lang=en

	; maybe this have to be adjusted for other countries!
	; investigate the source of the page in a browser
	parse page [
		thru <div id="twd"> copy time to </div>
		thru {title="Click for calendar">} copy date to </div>
	]

	hour: mid time 1 2     
	minute: mid time 4 2     
	second: mid time 7 2

	months: [
	    "january" "february" "march" "april" "may" "june" 
	    "july" "august" "september" "october" "november" "december"
	]

	date: split date " "
	dayname: head remove back tail date/1
	day: head remove back tail date/3

	month: date/2
	year: head remove back tail date/4
	month: index? find months date/2
]

; usage:
print [datetime/hour datetime/minute datetime/second]
print [datetime/dayname datetime/day datetime/month datetime/year]
```

[12:59](#msg57f3a7b52e485b053d1f30f8)Actually, let me improve it a bit...

Rebol2Red

[12:59](#msg57f3a7c743b5aeb009973bed)Thanks

rebolek

[13:05](#msg57f3a90c64f5e2a706b169a1)So, it’s not ideal:

```
datetime: context [
	page: read http://time.is/?lang=en

	months: [
		"january" "february" "march" "april" "may" "june" 
		"july" "august" "september" "october" "november" "december"
	]

	hour: minute: second:
	dayname: day: month: year: none

	parse page [
		thru <div id="twd"> 
		copy time 
		to </div>
		thru {title="Click for calendar">} 
		copy dayname 
		to #","
		2 skip
		copy month
		to #" "
		skip
		copy day
		to #","
		2 skip
		copy year
		to #","
	]

	set [hour minute second] split time #":"

	month: index? find months month
]

; usage:
print [datetime/hour datetime/minute datetime/second]
print [datetime/dayname datetime/day datetime/month datetime/year]
```

[13:05](#msg57f3a92364f5e2a706b169a8)The thing is that you are defining an object.

[13:05](#msg57f3a92c65fcd8d94c30d395)So `page` is read once.

[13:06](#msg57f3a94165fcd8d94c30d39b)Try `datetime/second`, it does not change.

[13:06](#msg57f3a96d65fcd8d94c30d3a6)It should be rewritten as function where `/hour` etc. are refinements.

[13:12](#msg57f3aab82e485b053d1f318f)Something like this:

```
datetime: function [
	/hour
	/minute
	/second
	/dayname
	/month
	/day
	/year
] [
	export: none
	foreach word [hour minute second dayname month day year] [
		if get word [export: word break]
	]

	page: read http://time.is/?lang=en

	months: [
		"january" "february" "march" "april" "may" "june" 
		"july" "august" "september" "october" "november" "december"
	]

	hour: minute: second:
	dayname: day: month: year: none

	parse page [
		thru <div id="twd"> 
		copy time 
		to </div>
		thru {title="Click for calendar">} 
		copy dayname 
		to #","
		2 skip
		copy month
		to #" "
		skip
		copy day
		to #","
		2 skip
		copy year
		to #","
	]

	set [hour minute second] split time #":"
	month: index? find months month

	get word
]

; usage:
print [datetime/hour datetime/minute datetime/second]
print [datetime/dayname datetime/day datetime/month datetime/year]
```

[13:16](#msg57f3abafc04ccb02114ffc32)Of course, it can be improved further :)

Rebol2Red

[13:19](#msg57f3ac488b26e33e7d275f58)I get the most of it, but export???

rebolek

[13:21](#msg57f3acc6c04ccb02114ffc50)`export` checks which refinement you want, otherwise the code would be more complicated

[13:22](#msg57f3ad0dc04ccb02114ffc60)When you specify refinement, it’s value is `true`. So `export` stores name of first refinement that is `true`.

[13:22](#msg57f3ad2035724307023dd657)All refinements are then rewritten with values parsed from the page.

[13:23](#msg57f3ad3559638aa568bef5dd)And at the end, it gets value of word stored in `export` and returns it.

[13:23](#msg57f3ad5c59638aa568bef5df)So you can reuse refinements (which are normal values inside function) to store parsed values.

[13:32](#msg57f3af5235724307023dd6c7)Of course, it can be called something else, `export` was just first word that came to my mind :)

Rebol2Red

[13:47](#msg57f3b2e691d6af11522aa526)@rebolek I get it. Learned a lot, Thanks.  
The purpose of my program was to 'think out of the box' and hoping to get a reaction from which i could learn.

rebolek

[13:48](#msg57f3b31b59638aa568bef6e6)@Rebol2Red You’re welcome. I’m glad I helped you a bit.

DideC

[13:52](#msg57f3b42c29403a416fc5fdbf)@rebolek last line of your func is `get word`, I would expect `get export` as you explain ?!

rebolek

[13:54](#msg57f3b47935724307023dd7ab)@DideC You're right :) It’s a bug.

[13:54](#msg57f3b4a1a848f2d24605f40c)But because in Red, word in foreach is not local to foreach, it works.

[13:55](#msg57f3b4ccc04ccb02114ffde9)So theoretically, the loop could be just `if get word [break]`

DideC

[13:57](#msg57f3b52e43b5aeb009977372)I will not rely on this trick for futureproof code :smirk:

rebolek

[13:58](#msg57f3b57fa848f2d24605f426)That makes sense ;) I'll fix the code.

[13:58](#msg57f3b58fa848f2d24605f428)Hm, I won’t. Too late :/

DideC

[14:08](#msg57f3b7e629403a416fc60dbc)Next time: use a Gist !

[14:09](#msg57f3b817f69c94ad098ab863)Anyway: nice clean code.

rebolek

[14:11](#msg57f3b8a735724307023dd8bf)Nice clean and buggy ;) But yes, I should used Gist.

this-gavagai

[15:47](#msg57f3cf233c59573f6f09f89a)I appreciate all the insights to my last question. This one should be much simpler: is it possible to use one object as a prototype for another while ensuring that `map!` or `object!` type fields get cloned (rather than just passed as reference)? I've tried using copy/deep, but the prototype and subsequent objects still both end up referencing the same thing.

rebolek

[15:53](#msg57f3d084c04ccb021150038e)Not directly, AFAIK.

[15:59](#msg57f3d1cec04ccb02115003bd)IMO `copy/deep` should do exactly this.

meijeru

[15:59](#msg57f3d1de29403a416fc68d1a)Anyway, if you look up the docstring for copy, there is a refinement called `types`which ensures only certain types of (non-scalar) fields are copied but the argument to that is `[datatype!]` whereas I would have thought it should be `[typeset!]` given the plural \*types\*. I will make that a wish.

[16:03](#msg57f3d2d243b5aeb00997fc4e)This is of course additional to the issue @this-gavagai signalled.

greggirwin

[17:17](#msg57f3e42f8b26e33e7d2865fb)@this-gavagai, @SteeveGit and I have slightly different versions of a `clone` func, and others may as well.

```
clone: function [
	"Deep make an object"
	object [object!]
	/with
		spec [block!] "Extra spec to apply"
][
	cloners!: union series! make typeset! [object! map! bitset!]
	new: make object any [spec clear []]
	foreach word words-of new [
		val: get in new word
		if find cloners! type? :val [
			new/:word: either object? val [ clone val ][ copy/deep val ]
		]
	]
	new
]
```

## Wednesday 5th October, 2016

this-gavagai

[04:53](#msg57f4874343b5aeb0099a610d)Thanks everyone. Out of curiosity, is this the intended behavior or just something that hasn't been fully clarified yet in the current alpha? Is it only `object!`, `map!`, and `bitset!`datatypes that pass through prototyping as references in this way?

wolframkriesing\_twitter

[07:28](#msg57f4ab9943b5aeb0099ac35c)seeing the clone function (triggered by the earlier datetime example) I am curious what is the opinion/state in regards to immutability in Red-world? Or is that just not a low-level concern?

dockimbel

[08:50](#msg57f4beb98b26e33e7d2b25eb)@wolframkriesing\_twitter Red, like Rebol allows side-effects on purpose, in order to keep both implementation and usage simple. `copy` function is there to allow you to avoid mutation when you need it. See a longer explanation here: http://www.rebol.com/article/0206.html

wolframkriesing\_twitter

[08:50](#msg57f4beedf69c94ad098e42eb)thanks for helping me to get into the Red/rebol mindset of things

dockimbel

[08:51](#msg57f4bf2d43b5aeb0099b07b2)@wolframkriesing\_twitter My pleasure. ;-)

greggirwin

[15:12](#msg57f5185d3c59573f6f0e84f7)@this-gavagai, Rebol didn't document detailed datatype behavior, but because we have access to the source, we can do that for Red. How each type behaves, and whether that changes over time, is up to the design team.

this-gavagai

[16:12](#msg57f5265f8b26e33e7d2cd3fa)@greggirwin Indeed. I don't have the knowledge to understand the big-picture implications behind these kinds of choices (especially wrt practical considerations like performance). My question was motivated purely by a desire to understand the design principles at play.

wolframkriesing\_twitter

[16:25](#msg57f5297bf69c94ad09901253)@greggirwin speaking of design decision for types, what intrigued me first about rebol was types like time, tuple or pair ... those are amazing. Now that I am using it a bit more I could come up with many more types, where does Red draw the line here? Is there an active discussion about types, which to add and if to add any at all? or is this described somewhere what the process/thoughts behind it are?

greggirwin

[16:32](#msg57f52b108b26e33e7d2cec56)The link Doc posted above says things well. Red doesn't copy by default. The only thing we need to know is what types \*can* be copied, or need to be constructed (e.g. object).

[16:38](#msg57f52c9329403a416fcb75f0)@wolframkriesing\_twitter, the main thing to consider is what we can represent lexically, without creating ambiguities (or ugliness :^). Then look at what is useful. Reduce the lexicon to the base elements that we use to construct bigger pieces. Ren (see ren-data.org) is intended to be the JSON equivalent for Redbol languages. There aren't too many extensions in there, and even those that are there, or TBD, generated a lot of discussion.

wolframkriesing\_twitter

[16:40](#msg57f52cf6f69c94ad09901f25)i see

greggirwin

[16:40](#msg57f52d193c59573f6f0ed9ac)One new type that has come up is `ref!` which would be an `@name` value.

dockimbel

[16:42](#msg57f52d718b26e33e7d2cf678)@wolframkriesing\_twitter More types are welcome, but finding new good (and possibly natural) syntaxes is hard, as the available symbols on common keyboards are limited, and most of them already used. Though, if you have ideas for new datatypes, please propose them by all means in red/red channel. We have already a few more in mind, like ipv6!, matrix! or unit! (quantities with units).

greggirwin

[16:42](#msg57f52d8f91d6af1152301b90)When we can create user defined types more easily, I imagine we'll see an explosion of non-lexed types. That is, types that require `make` to construct them. That may or may not be a good thing.

wolframkriesing\_twitter

[16:43](#msg57f52daf8b26e33e7d2cf6f5)i was asking, because `issue!` seems quite exotic too, doesnt it?

[16:43](#msg57f52dcc3c59573f6f0edc61)i like unit!

dockimbel

[16:44](#msg57f52de18b26e33e7d2cf776)@wolframkriesing\_twitter What if we renamed `issue!` to `hashtag!`? ;-)

wolframkriesing\_twitter

[16:44](#msg57f52df70ec6f9457da46c11)@dockimbel +1 i was confused and thought exactly that

greggirwin

[16:45](#msg57f52e0cf69c94ad0990243f)Not at all. Phone numbers, serial numbers, record IDs, even before hashtags became a thing.

dockimbel

[16:45](#msg57f52e3743b5aeb0099cd12a)@greggirwin I think it's a US-centric syntax, I was confused by it too at the beginning. "Hashtag" might be more meaningful world-wide.

wolframkriesing\_twitter

[16:46](#msg57f52e4dd45d7f0f5265da6c)creating types is of course the way to go, so any topic-specific type can be created ... what is the state of that, you @greggirwin are saying "When we can create user defined types more easily" what is missing?

greggirwin

[16:46](#msg57f52e7ff69c94ad099025ef)Could be. # denoting a numeric string is common here (order #, confirmation #, etc.).

wolframkriesing\_twitter

[16:47](#msg57f52e8a3c59573f6f0edfd1)re `issue!` I first thought for a second "how cool, i can directly create github-issues in the language"

dockimbel

[16:47](#msg57f52e9bd45d7f0f5265db52)@greggirwin Remember we still have the issue-as-string vs issue-as-word duality to solve, so we'll need to reconsider how we define `issue!` type.

greggirwin

[16:47](#msg57f52eb2f69c94ad09902692)Right. :^\\

dockimbel

[16:48](#msg57f52ee729403a416fcb7f5f)@greggirwin Never seen that syntax used in France (we use `n°` for that, as abbreviation for `numero` (== `number`), don't know for other EU countries.

greggirwin

[16:48](#msg57f52efaf69c94ad09902820)@wolframkriesing\_twitter , you can create objects today, but defining a new type has to be done in Red/System, and datatypes are not like complex UDT/ADT/struct types.

[16:49](#msg57f52f3191d6af11523021bb)`No.` can be used here, but the octothorp is the most common symbol.

[16:52](#msg57f52fc1d45d7f0f5265e0d4)Should change rooms to continue this chat.

dockimbel

[16:52](#msg57f52fd843b5aeb0099cd717)Let's move this discussion to red/red.

this-gavagai

[17:32](#msg57f5391a29403a416fcbab56)&gt; The link Doc posted above says things well. Red doesn't copy by default.

Unless I'm completely misunderstanding, in the case of `make`, Red does copy `string!` and other `series!`by default, though, doesn't it? (Not to mention `integer!` and `float!`, but perhaps that's a different question)

dockimbel

[17:34](#msg57f5399ad45d7f0f526607c5)@this-gavagai The purpose of `make` is precisely to create a new instance of a given datatype. ;-)

this-gavagai

[17:50](#msg57f53d80f69c94ad099062d3)@dockimbel Indeed. That's why I was surprised that `make` doesn't clone `object!` or `map!` fields, as well. I'm sure there's a good reason for treating `block!` and `map!` differently in this regard; my reason for asking is just to try to understand Red's design.

greggirwin

[18:12](#msg57f542973c59573f6f0f3543)Look at `copy`. It has a `/deep` refinement, so you can control whether you want it to copy nested non-scalars. `Make` with objects works similarly, except there's no `/deep` option and we just have to write a `clone` func to do it.

dockimbel

[18:32](#msg57f54748d45d7f0f52663de5)@this-gavagai `make` does clone referenced series (`block!` is a series) in an object, because this behavior covers the best the common use-cases. Objects or maps are heavy datatypes, in the common cases, you want to keep a reference to the same ones, not clone them (though, you can clone them manually using `copy` when you really need it). Trees of objects or maps that you need to clone deeply is not a case I remember seeing often in Rebol (except in code from OOP guys, trying to bend the language to work in a purely OOP way), usually you would rather model such tree using blocks.

wolframkriesing\_twitter

[22:18](#msg57f57c480ec6f9457da5a54c)I am trying to figure out how to get the cookies out of an HTTP response, which means reading the headers, all I found (e.g. http://rebol.net/cookbook/recipes/0059.html) doesn't look straight-forward, is it like that in Red too?

geekyi

[22:40](#msg57f58164f69c94ad0991700a)@wolframkriesing\_twitter cookies actually are simple http headers afterall😛 you can write an abstraction, or maybe there is something already

[22:41](#msg57f581a529403a416fccbf63)@wolframkriesing\_twitter I think there was a stackoverflow question on that, can you check? I'm on mobile, so a bit hard right now..

greggirwin

[23:24](#msg57f58b9a0ec6f9457da5d4ca)Red, even with only simple-IO in place, makes it easy to get at the headers:

```
red>> res: read/info http://red-lang.org
== [200 #(
    Cache-Control: "private, max-age=0"
    Date: "Wed, 05 Oct 2016 23:20:41 GMT"
    Transfer-Encoding: "chunked"
    Content-Type: "text/html; char...
```

`/info` isn't documented yet, so may change in the future, but it very nicely returns you 3 values: \[result-code \[integer!] headers \[map!] content \[string! binary!]]

## Thursday 6th October, 2016

TimeSlip

[00:10](#msg57f5967d91d6af11523198f7)Where are the various colors stored at?

qtxie

[00:14](#msg57f5974ff69c94ad0991a3d5)This one? https://github.com/red/red/blob/master/environment/colors.red

TimeSlip

[00:16](#msg57f597c2f69c94ad0991a4a8)Thank you.

this-gavagai

[03:22](#msg57f5c36991d6af115231fe9d)@dockimbel Great, so I think that's the answer to my original question: "Red chooses to pass `object!` and `map!` by reference but copy `series!` because, most of the time, nested objects and instance-specific maps are out of step with Red's approach to prototyping. Deep structure is usually better accomplished through blocks." If that's accurate, it makes sense, and it helps me see the differences from mainstream OOP a bit more clearly. Thanks!

dockimbel

[05:21](#msg57f5df4bd45d7f0f52680e3c)@this-gavagai \*nested objects and instance-specific maps are out of step with Red's approach to prototyping* They are fine. What I meant is the need to clone them when you clone the outer object or map referencing them, is a rare need. Sharing them is most of the time, the best option. BTW, "nesting" is a relative concept in Red/Rebol, you only have a "reference" to other series/objects/maps, they are not really "nested" (there is no scoping in Red/Rebol, only an apparence of scoping, called \[definitional scoping](http://stackoverflow.com/questions/21964110/is-there-a-overall-explanation-about-definitional-scoping-in-rebol-and-red#)).

wolframkriesing\_twitter

[05:33](#msg57f5e21b0ec6f9457da6a88e)@greggirwin thx a lot for answering so quickly, actually I was looking into https://github.com/red/red/blob/3058bfe311e0dbdfd102509119388d06a86946af/runtime/simple-io.reds#L1844 but couldn't find `/info`, did I look in the wrong place?

DideC

[09:00](#msg57f612bc43b5aeb0099f83e6)This is the Red/System low level func. As you see, there is an `info?` parameter that must be map to the `/info` refinment of the read handler.  
Port! are not implemented, so the maping between `read` and HTTP might be elsewhere.

dockimbel

[09:35](#msg57f61ac63c59573f6f11b98f)That mapping is done in the `url!` \[datatype](https://github.com/red/red/blob/master/runtime/datatypes/url.reds#L168).

dahu

[10:49](#msg57f62c3b70fcb5db0c3372a8)Brodie's "Thinking Forth" was recommended on a Rebol forum somewhere so I decided to read it; very enjoyable.  
One of the examples in the book was about Roman numerals. Out of curiosity, I decided to emulate the Forth approach in Rebol. It isn't as "clean" as the original Forth due to the need to explicitly pass function parameters. Still... it's pretty ugly, imho. I am sure the idiomatic Rebol (Red) version would be much better. As a comparison, I also converted the version from one of my old Vim plugins (Nexus); I can't remember from where I stole that version of the solution. The two solutions are here:  
https://gist.github.com/dahu/e69aa11ee46c24e140ca201ac8669b7e

dockimbel

[11:00](#msg57f62eb7a7c618cd26eaa4e4)@dahu Any link to the original Forth version?

dahu

[11:12](#msg57f63199a7c618cd26eab139)The original forth version:

```
\ Roman numerals

Create romans      ( ones) char I c, char V c,
                   ( tens) char X c, char L c,
               ( hundreds) char C c, char D c,
              ( thousands) char M c,
Variable column# ( current_offset)
: ones      0 column# ! ;
: tens      2 column# ! ;
: hundreds  4 column# ! ;
: thousands 6 column# ! ;

: column ( -- address-of-column ) romans column# @ + ;

: .symbol ( offset -- ) column + c@ emit ;
: oner  0 .symbol ;
: fiver 1 .symbol ;
: tener 2 .symbol ;

: oners ( #-of-oners -- )
   ?dup IF 0 DO oner LOOP THEN ;
: almost ( quotient-of-5/ -- )
   oner IF tener ELSE fiver THEN ;
: digit ( digit -- )
   5 /mod over 4 = IF almost drop ELSE IF fiver THEN
   oners THEN ;

: roman ( number -- ) 1000 /mod thousands digit
                       100 /mod  hundreds digit
                        10 /mod      tens digit
                                     ones digit ;
```

DideC

[12:00](#msg57f63cd9a7c618cd26eadeb7)VIM solution is simpler and shorter !

dahu

[12:08](#msg57f63eaaa7c618cd26eae656)I guess Brodie's point is that the Forth way is to build a "lexicon" of commands, each doing one thing and intuitively (or deducibly) so from its name. He stresses that approach to better handle spec changes. The Vim solution is all balled up in one function, which \_might_ be harder to modify for certain types of spec changes. This design concern is pretty much lost in this example, given how small the Vim solution is though.

dockimbel

[12:25](#msg57f6429c84f1db0614891cdb)@dahu Forth is best written in Forth. I have in my plans to add a stack-oriented small dialect in Red at some point in time, some algorithms can be implemented more easily and efficiently using such language (I have extensive experience in \[RPL](https://en.wikipedia.org/wiki/RPL\_(programming\_language) and some with PostScript). For the converter itself, here is my take to implement it in Red, using what Red is best at (metaprogramming). ;-)  
https://gist.github.com/dockimbel/1abde8f2dfaf75816384609edf59098f

dahu

[12:33](#msg57f6449b70fcb5db0c33dba6)mind hurting...  
programatically generated table with recursive calls back into a2r, starting from the first match in `case`...

dockimbel

[12:42](#msg57f646c6d6251fd12698093e)Also I think it should be possible to come up with an elegant Parse-based solution (see the ANTLR entry \[here](https://www.rosettacode.org/wiki/Roman\_numerals/Decode#ANTLR)).

meijeru

[13:47](#msg57f6560170fcb5db0c342d99)The above solution breaks down for 9 =&gt; VIV instead of IX owing to the missing case. But that is easily repaired.

dockimbel

[15:14](#msg57f66a564fde72031414c886)@meijeru Indeed, let me fix it. Done.

[15:33](#msg57f66ec8dfe82a365b01d882)I updated the code for a more "integrated", and maybe more readable approach.

DideC

[16:56](#msg57f6824f4fde72031415488d)@dockimbel I pick yous last solution and add \[Roman-to-arabic with parse](https://gist.github.com/DideC/0ca3da92927c42b069454dc2994873b2#file-roman-to-from-arabic-red). For fun.

greggirwin

[18:29](#msg57f697eda7c618cd26eca829):point\_up: \[October 5, 2016 11:33 PM](https://gitter.im/red/help?at=57f5e21b0ec6f9457da6a88e) @wolframkriesing\_twitter, I just did `help read` in the console.

## Friday 7th October, 2016

7hi4g0

[02:03](#msg57f7027770fcb5db0c36f136)What is the best way to format strings? `form`?  
I noticed that `form` doesn't allow me to strip the spaces between different values nor does it allow me to prepend zeros.

dahu

[03:24](#msg57f7156c4fde7203141744fa)@dockimbel ANTLR version in Rebol (my Red-fu sucks too much to do a Red version :-( )  
https://gist.github.com/dahu/8a49ccde20acd53ff4a0631f66a7baf1

[03:26](#msg57f715dd84f1db06148c5ea2)I'm sure the idiomatic Redbol way to do this would be cleaner -- I was aiming to stay as close to the ANTLR version as possible, both for comparison and more importantly because I don't know the Redbolly better way to express this yet.

this-gavagai

[04:56](#msg57f72b124fde720314177cda)&gt;&gt; most of the time, nested objects and instance-specific maps are out of step with Red's approach to prototyping

&gt;They are fine. What I meant is the need to clone them when you clone the outer object or map referencing them, is a rare need.

It's exactly that rareness that I'm trying to understand.

Coming from OOP, my first instinct with complex modeling is to define a hierarchical pile of objects, all of which get instantiated anew when a root object gets instantiated. The very fact that this is a rare use case in Rebol/Red makes me think that that whole approach must be bending the language in an unnatural way. What first caught my attention about Red is the fact that it doesn't make a hard distinction between data and code, but to exactly that end I'm still struggling to wrap my head around a more native design pattern for describing the state and behaviors of relatively complex and heavily instanced "things". I'm wondering if there's a more Red-like way of achieving these ends (parallel perhaps to the previous discussion about dialecting as a better alternative to public/private fields). But, maybe there's not a simple answer here.

Thanks for link on how scope works. It's very orienting of some of the underlying mechanics at play.

greggirwin

[06:11](#msg57f73caca7c618cd26ee9dd9)@7hi4g0, we'll have a full-blown `format` function in the future (lots of design ideas in the works). For now, if you specific needs, we can provide examples of little helpers that give you more control than `form`.

[06:45](#msg57f744a2dfe82a365b04c1d4)@this-gavagai, I don't know that there's a universal "Red way", and my common cases won't be yours, but if you have concrete examples some folks here might offer ideas of how they would model them in Red.

DideC

[09:04](#msg57f7651584f1db06148d46c5)@dahu Interesting solution... but a verbose one. Nice exercise anyway.  
I updated my gist with the more optimized an shorter one I can make.  
https://gist.github.com/DideC/0ca3da92927c42b069454dc2994873b2#file-roman-to-from-arabic-red

this-gavagai

[09:17](#msg57f7682fdfe82a365b054330)

Thanks, @greggirwin. I appreciate the suggestion. Here's an example:

Imagine you wanted to simulate economic dynamics in a third world village. You might begin with 30-50 households, each with 2-12 people. Most of these people would own a couple of different kinds of fields, and some of them might also own cows. Cows produce milk, which is a good source of cash, but this production is dependent on a number of factors including an animal's general health and well being. Any model of animal health would almost certainly be influenced by (among other things) what its owners choose to feed it, which in turn is going to be influenced by both the costs of fodder in the village generally and specific agricultural outputs of the household that owns it.

In other words, what I need to describe are templates for entities that can be instantiated in relatively large numbers to behave quasi-autonomously in a time-series simulation. The goal would be able to "experiment", testing for example how the arrival of a veterinary clinic in town (or a new breed of cow with different health functions, or a drop in fertilizer prices, or a sudden decrease in rain) would influence the system's overall dynamics.

In an OOP paradigm, I would start by defining classes and their public interfaces, and then I would arrange them into hierarchical graphs. Some of these classes would be relatively self-contained (i.e., weather), some would depend on a parent many-to-one (i.e., people in a household), and still others would exist one-to-one as an extension of a parent (i.e., a particular cow's health, which might be complex enough to benefit from encapsulation as an object in its own right). That all works fine enough, but I'm not sure classic OOP is actually the right model for any of it. The hard distinction most languages expect between code and data, for example, is very limiting, and Rebol/Red's approach seems to promise a much more elegant way of thinking about entities in a simulation. The possibility that a vet might show up and re-write a particular cow's food consumption behaviors at runtime, for example, is just way too cool to ignore. It opens the door for unprecedented new kinds of elegance and expressiveness in this kind of scientific modeling.

Right now, what I'm trying to figure out as I get more familiar with Red is just general principles. For example, as in my past few posts, how should I think about the choice between hierarchies of objects and complex blocks? I get how both syntaxes work, but without a deeper intuition of why red programmers do things the way they do I know I'm just going to fall back on whatever I do in python.&gt;

[09:17](#msg57f76846dfe82a365b054377)(And apologies for the length!)

dahu

[09:32](#msg57f76b9d0aa72e3c5be03c75)Cool, @DideC . I'll have to have a look at that tomorrow.

DideC

[09:54](#msg57f770ed84f1db06148d6fc9)@this-gavagai Hard to tell. It will completely depends of how you code it. One way to do will have pros and cons, and another solution will have different ones.  
View is an example of complex object! hierarchy conception and behaviour in Red (screen is your village, windows are houses, faces are people ;-) ). + VID is a dialect to define the initial state.  
I see no better and functionnal example to give at this time !

dockimbel

[10:09](#msg57f7747370fcb5db0c3838dd)@DideC @dahu I've added a Red entry for the Roman encoding task on Rosettacode.org: https://www.rosettacode.org/wiki/Roman\_numerals/Encode#Red

dahu

[10:14](#msg57f77576d6251fd1269c4703)Cool. Should probably add Decode solutions too if they don't already exist on Rosetta.

rebolek

[10:15](#msg57f775afa9a0a333752ff477)@dockimbel @qtxie Should I expect that Red would be able to load ~22MB file without Memory allocation error, or is it something that must wait for GC?

dockimbel

[10:17](#msg57f7764fa7c618cd26ef5d73)@dahu I have a few candidates for the Decoding too, but no more time to play with it, so be my guest. Also, they are tons of other tasks on RosettaCode to fulfill, so feel free to contribute (you can use the community wisdom here to improve some code submissions if required).

dahu

[10:20](#msg57f776efa7c618cd26ef601c)@dockimbel That sounds like a good plan because I definitely need to sharpen my Redbol skills. @all Expect harassment :-D

dockimbel

[10:21](#msg57f77745dfe82a365b057d06)@dahu Puzzle solving and code optimization is the favorite hobby of Rebolers (and now Reducers) for years. ;-)

dahu

[10:23](#msg57f7778a68f560d80ce57a22)For too long I used Vim and Tcl for my puzzle playground... It's good to have a hobby. :-p

qtxie

[10:39](#msg57f77b4f470c6bb20f5db275)@rebolek Cannot load 22MB file? Sounds like a bug...

rebolek

[10:39](#msg57f77b7aa9a0a333752ff4cc)@qtxie I just checked it again and it happens only under OSX, under W7 it works.

[10:40](#msg57f77b89bb20dfad43c40922)I put the file somewhere and make an issue.

dockimbel

[10:41](#msg57f77bbc70fcb5db0c385491)@rebolek "Out of memory" error? It shouldn't happen, unless you have a huge number of small series and not much GB of RAM? If it's only on one platform, then it is worth adding to the bugtracker.

rebolek

[10:41](#msg57f77bd3bb20dfad43c40924)16GB should be enough for everyone I guess ;)

[10:41](#msg57f77bf514e9dbfd78573b6a)Actually it’s Runtime error: Access violation.

[10:42](#msg57f77c13bb20dfad43c40926)Thanks guys, I am going to open an issue.

[10:50](#msg57f77deda9a0a333752ff4f1)https://github.com/red/red/issues/2260

dahu

[12:45](#msg57f79903d6251fd1269ccc66)https://rosettacode.org/wiki/100\_doors#Red

[12:46](#msg57f7992d4fde72031418f938)And I pushed @DideC 's https://rosettacode.org/wiki/Roman\_numerals/Decode#Red

[13:06](#msg57f79dedd6251fd1269cdf47)I had two off-by-one mistakes in the 100 doors code; fixed. And it's pretty ugly, certainly compared to the Rebol version.

7hi4g0

[13:12](#msg57f79f2384f1db06148e2da2)@greggirwin I would like see to some examples of how I can format strings :+1:

[13:13](#msg57f79f69a7c618cd26f01348)I'll also need to format strings in Red/System, but I don't think there's an easy way to do that, or is there?

qtxie

[14:33](#msg57f7b24f4fde720314196977)@7hi4g0 You can use `sprintf` to format strings in Red/System if it's a c-string!.

7hi4g0

[14:39](#msg57f7b3b3a7c618cd26f0693c)I didn't know Red/System had `sprintf`. Thanks @qtxie  
I will need to allocate the space for the `c-string!`, won't I? How should I do this?

[14:41](#msg57f7b402d6251fd1269d3f22)I saw allocation in some file on the sources, but can't remember where.

qtxie

[14:45](#msg57f7b508dfe82a365b06953b)Yes. Something like this:

```
#define BUF_SIZE 1024
buf: allocate BUF_SIZE
sprintf [buf "number %d" 123]
```

7hi4g0

[14:47](#msg57f7b5710aa72e3c5be17f9d)@qtxie Great. Thanks again.  
I had just found the `allocate` function :smile:

greggirwin

[17:40](#msg57f7de0270fcb5db0c3a0187)@this-gavagai, \*FANtastic* example! Thanks for taking the time to do that. As Nenad said, puzzles are beloved by Reducers. For me, they're more of a curse. How am I supposed to get any real work done when there are puzzles to be solved! ;^) Let me think on your example a bit, while I try to get some real work done.

[18:00](#msg57f7e2c9dfe82a365b0765fb)An initial thought, which ties to Red's approach of using references, relates to hierarchies and "free agency". In your example, you say people own fields, but the field is a separate entity. If you have a `person` object, should it \*contain* field? If so, is there also a global list of fields that has a separate copy of that field's data? Or is it better to think in terms of relationships between objects? Not the `is-a/has-a` inheritance/composition choice but as data relations. Object containership defines implicit, fixed relationships. But cows are not a property (in OO terms) of a person object. Except in this case: http://i.ebayimg.com/images/i/401128929397-0-1/s-l1000.jpg

When I think of simulations, I often come back to NetLogo as a model. There is a "world" that has `patches` and `turtles`, each with localized behaviors and knowledge. The `observer` is the all-seeing eye.

[18:04](#msg57f7e39d68f560d80ce75c4b)In your simulation, how does the observer see all the cows if they're inside people? And if you want to have groups of cows, with different health, feed, etc. grouped differently, how do you do that? e.g., can cows owned by different people share a trough or bale? Does a veterinarian have to go to each person to see their cows, or can he inspect all the cows in one place?

[18:15](#msg57f7e639a7c618cd26f14867)Another way to look at it (see how I'm getting real work done now) is \*how you want to describe* things. How do you say

```
[
    [Bob buys 2 cows [bessie and flossie]  from Carol]
    [Alice moves to house #5]
    [Dan buys field #37N...] ; (It's a UTM coordinate system, right? ;^)
]
```

and how those operations are performed.

rebolek

[18:16](#msg57f7e68914e9dbfd785746bf)@greggirwin ho ho ho, please stop here. Everyone knows that comma is forbidden in Redbol ;)

greggirwin

[18:17](#msg57f7e6a884f1db06148f7c55)Ack!

[18:18](#msg57f7e70ea7c618cd26f14c64) Better?

[18:19](#msg57f7e73270fcb5db0c3a26a6)I could lose the inner blocks as well, but...

rebolek

[18:20](#msg57f7e764470c6bb20f5dbeff)@greggirwin It is better, but I think that parse does not need brackets to distinguish sequences ;)

greggirwin

[18:22](#msg57f7e7cca7c618cd26f14f3a)But then do we want statement terminators? ;^)

```
[
    Bob buys 2 cows [bessie and flossie]  from Carol .
    Alice moves to house #5 .
    Dan buys field #37N... .
]
```

rebolek

[18:22](#msg57f7e7dd14e9dbfd7857471b)Do we?

greggirwin

[18:22](#msg57f7e7e34fde7203141a5c8f)Not for `parse`, but for humans.

rebolek

[18:22](#msg57f7e7f7bb20dfad43c41442)But for humans, newlines are enough, IMO.

greggirwin

[18:22](#msg57f7e7fe0aa72e3c5be2706e)They can ease some things in dialects, but aren't strictly needed of course.

[18:23](#msg57f7e81c4fde7203141a5d71)Agreed, but then do we enforce newlines as the statement terminator? Maybe a bit OT for the question at hand.

rebolek

[18:23](#msg57f7e82814e9dbfd78574730)I still think that comma should be added as whitespace, unless it’s not.

[18:24](#msg57f7e853bb20dfad43c41452)@greggirwin not enforce. It’s just for humans.

greggirwin

[18:24](#msg57f7e869d6251fd1269e2120)Ah, I see what you mean.

[18:25](#msg57f7e896dfe82a365b077d4b)A good reason, too, for keeping dialects simple.

rebolek

[18:26](#msg57f7e8c414e9dbfd78574748)Anyway, my comma idea is that `3,14` is `3.14` but `3, 14` or `3 ,14` is `[3 14]`.

greggirwin

[18:28](#msg57f7e939d6251fd1269e23f4)It's a big topic. Worth writing up a REP, though, to discuss it.

rebolek

[18:29](#msg57f7e973bb20dfad43c41472)Yep, I don’t want to pollute this channel with it. It’s something that was heavily discussed in Rebol but never resolved.

[18:30](#msg57f7e9bc14e9dbfd7857474f)Punctuation is very interesting topic, indeed. ;)

greggirwin

[18:33](#msg57f7ea7f4fde7203141a66d7)My current feeling (having leaned both ways at times) is that if you need to support it, we now have the ability to pre-process data when loading and it can be handled there. I often come back to the idea of "if you aren't sure whether you need it or not, you don't."

[18:34](#msg57f7eaafd6251fd1269e29cd)And all the past discussion on it hasn't yielded a strong "we need it" conclusion.

rebolek

[18:35](#msg57f7ead7bb20dfad43c41490)Agreed. I really do not wanted to start discussion about comma. I just wanted to make you to clean up that dialect ;)

greggirwin

[18:35](#msg57f7eaf4dfe82a365b0787b1)LOL! And I did. :^)

[18:36](#msg57f7eb3984f1db06148f90c5)Though the commas were \*between* marked up dialect text, that wasn't clear in gitter.

rebolek

[18:36](#msg57f7eb41bb20dfad43c4149d)Almost ;)

[18:37](#msg57f7eb59a9a0a333753000b5)

```
[
    Bob buys 2 cows [bessie and flossie] from Carol
    Alice moves to house #5 
    Dan buys field #37N...
]
```

greggirwin

[18:37](#msg57f7eb82dfe82a365b0789b6)Iterative dialect design we do here.

rebolek

[18:38](#msg57f7ebaf14e9dbfd7857478a)Also, why are cows in block?

[18:38](#msg57f7ebbe14e9dbfd7857478c)

```
Bob buys 2 cows bessie and flossie from Carol
```

[18:39](#msg57f7ebe5470c6bb20f5dbf7a)And if we want to be really hard to parse:

```
Bob buys bessie and flossie from Carol
```

greggirwin

[18:39](#msg57f7ebf34fde7203141a6bec)Even `2 cows` is not needed, but I thought of the sub-block more like a parenthetical comment.

rebolek

[18:40](#msg57f7ec04470c6bb20f5dbf81)Yes.

[18:40](#msg57f7ec2fbb20dfad43c414c8)Parse is so powerful that we sometimes need to be careful and not use all that power.

greggirwin

[18:40](#msg57f7ec3170fcb5db0c3a3bf7)And whether we require unique names in the world or by type. e.g. could you have a field called flossie?

[18:41](#msg57f7ec41a7c618cd26f160c2)With great power... Yup.

rebolek

[18:41](#msg57f7ec5abb20dfad43c414ca)You have `and`. You do not care about `flossie`.

greggirwin

[18:42](#msg57f7ec7870fcb5db0c3a3d38)Huh?

rebolek

[18:42](#msg57f7ec9fbb20dfad43c414d4)`word! ahead 'and` for infix rules

greggirwin

[18:44](#msg57f7ed0c84f1db06148f9759)Still not getting you. How do you disambiguate what you're buying, if your world looks like this?

```
world [
    cows [
        bessie []
        flossie []
    ]
    fields [
        flanders []
        flossie []
    ]
]
```

i.e. how do you know `bessie and flossie` (without a sub block), means two cows, rather than a cow and a field?

[18:45](#msg57f7ed660aa72e3c5be28604)Given that Carol might own Bessie the cow, but \*not* Flossie the cow, but she \*does* own Flossie Field.

rebolek

[18:46](#msg57f7ed6ebb20dfad43c414f9)I see.

[18:46](#msg57f7eda1470c6bb20f5dbfa4)I guess that requires generator for the rules.

[18:47](#msg57f7edbb470c6bb20f5dbfa8)Dialect, that creates a dialect.

greggirwin

[18:47](#msg57f7edbddfe82a365b079146)Or just keep the dialect simple and limited.

[18:48](#msg57f7ede184f1db06148f9af7)We're talking cows here. I don't know if they're ready for meta DSLs. ;^)

rebolek

[18:48](#msg57f7ede6a9a0a333753000f7)That depends on the user case, I guess.

[18:48](#msg57f7edf114e9dbfd785747d4)Yeah :D

greggirwin

[18:48](#msg57f7ee0268f560d80ce7939b)I mean, they don't even have thumbs to type with.

[18:48](#msg57f7ee0f70fcb5db0c3a426d)So we have to keep things \*really* simple. ;^)

rebolek

[18:49](#msg57f7ee3ca9a0a333753000fc)OTOH, if you are in the cow business, you want things really simple and then, meta DSL may be useful for you, as the user ;)

greggirwin

[18:53](#msg57f7ef140aa72e3c5be28d30)But, per the current question (which we've strayed from, into cow dialects), maybe we start with a meta DSL for creating simulations.

rebolek

[18:55](#msg57f7ef8c470c6bb20f5dbfce)Yes.

dander

[19:10](#msg57f7f33070fcb5db0c3a54a0)I thought the original question was about how to model the data, and create relationships between different parts. Do you guys think it's a better approach to define the dialect for interacting with the model first, and then derive a data model from that?

greggirwin

[19:29](#msg57f7f77f68f560d80ce7b68a)I go both ways. A mix of top-down and bottom-up. I think what happened here is that we started with a problem and just got into a little flow discussing it. Now we know a little more about how to think about it, and that will drive the modeling. If you look at the above `world` block, just add `people` and `houses` and you have the basics. Then we have to define relationships between those things. What might that look like?

dander

[19:46](#msg57f7fb994fde7203141aa9fa)I'm curious how you pick between using blocks vs object!s. Would you start with blocks for simplicity and maybe move certain parts to objects if the need arises? I guess a block looks a lot like an object from the outside if you structure it like that `world` example.

greggirwin

[19:48](#msg57f7fc17dfe82a365b07c674)I think it's good to focus on data first, when designing systems. What are you talking about, and how do those things relate to one another. That may not always be records in a database, so it's maybe more data \*discovery* than modeling. And it's part of the Forth approach to defining a vocabulary. If you think in terms of "write the language you want to write your program in", data is a big part of that. The language you create is not just verbs, but also nouns. And it's not just action verbs that are important, but the "little" verbs, sometimes called \*linking* or \*helping* verbs in the U.S., e.g. \[is am are was were be being been has have had do does did shall will should would may might must can could].

Think about where you've see those words used in programming. Ever see MUST or SHOULD in RFCs? We talk about is-a and has-a relationships. If you created a log, or undo stack, could you use those to replay history or determine temporal state change clearly? Capabilities? Design by Contract? How do we express things, and how do our tools help us?

[19:53](#msg57f7fd57d6251fd1269e6d9c)For me there's no hard line. Red makes it almost transparent if you need to change. Not completely of course, but the universal path notation goes a long way. Sometimes it's pure convenience. I want to give users files that are basically spec-block formats for objects \[name: value], and those are easy to `construct` into objects. Red solves a lot of the pain in Rebol that came from using set-words as keys in blocks, and we have maps too. It's a very fluid mix for me.

rebolek

[19:54](#msg57f7fd59470c6bb20f5dc14a)@dander If you have anonymous data, use `block!`, for named data use `object!`. Or `map!`. That is the real question. Or `hash!` instead of `block!`? Damned, so many datatypes ;)

greggirwin

[19:57](#msg57f7fe25dfe82a365b07d193)Blocks are more flexible as well, if you have sparse data, or want to extend them.

dander

[20:08](#msg57f800a24fde7203141abed4)So the way I am understanding this is that the process of designing the dialect forces you to think about both the data you are working with and also the way you will interface with it (including how you link different parts together). This seems like a really natural way of leading you to building the "thin vertical slices" of a project.

[20:10](#msg57f801344fde7203141ac0e4)I'll be interested to see how @this-gavagai responds to this discussion. I really appreciate how well he articulates his questions, and I've been learning a lot from this.

[20:30](#msg57f805d884f1db06148ffd9c)Would it be feasible to use reactor! relationships between things? For example, each cow's health is a function of rainfall + a number of other conditions, so if you update the weather object, that change propagates throughout the entire data model (including things that depend on the cows).  
I don't think I understand reactor!s well enough to know if that would be a good fit for their use... perhaps it depends on whether the use is read-heavy or write-heavy - in which case maybe lazy evaluation would be more appropriate?

## Saturday 8th October, 2016

greggirwin

[01:27](#msg57f84b6f68f560d80ce8aeac)@dander, on dialect design, I think that's a good analysis. On reactive programming, yes. Reactivity in Red is really more like dataflow programming than the ReactiveX stuff that's popular today. Regarding lazy evaluation, that's also possible. I believe Maxim Adloch's old liquid system for Rebol could be either push or pull, and is also a dataflow model. I haven't built anything where I needed lazy evaluation, aside from the nice notion of infinite series.

TimeSlip

[02:05](#msg57f854694fde7203141bbaad)Hello, is "focus" event (in Vid) supported? If not, is there any way to distinguish and entering/exiting with "over" ? Thanks.

qtxie

[04:14](#msg57f8728ba7c618cd26f2e4f7)Yes. We have `focus` and `unfocus` event.

TimeSlip

[05:05](#msg57f87eb6a7c618cd26f30043)@qtxie Thank you. Is there a hover off ? I need to distinguish when my mouse is going over a base and when it is leaving. I thought that focus and unfocus would work but I think it is not sending those events with the base objects I am using.

qtxie

[06:34](#msg57f89359a7c618cd26f329ec)In `over` event, you can check event/flag.

TimeSlip

[06:34](#msg57f89375dfe82a365b09678e)@qtxie Never mind. I see that there is an 'away flag which works fine. What was happening was I created some "bases" that I needed to behave like toggle buttons. When the mouse moved over them, they change colors to visually show hovering. The problem was that when the app first started and the mouse was over a "base" it would set the color based on the initial "over" event which was actually an "away". Now that I can see the 'away events I can check for that.

[06:47](#msg57f896794fde7203141c4b18)One thing, however, is puzzling for me. When I add an actor, I use (in this case) on-over :myfunction. How does Red know what parameters to send? In myfunction I have "face" and "evt" . Is there some common list of parameters Red sends? In other words, I am telling red to use myfunction but I don't have to include any parameters defined in the function. It simply sends the face and event. I'm curious about that and if there are other parameters I could include. I hope my question makes sense.

rebolek

[06:48](#msg57f896ca14e9dbfd78575047)@TimeSlip Red "doesn’t know" what parameters to send. It simply sends the same parameters again and again and your function must respect it.

TimeSlip

[06:49](#msg57f89714d6251fd1269ff346)Bo, I mean does it send face and event automatically?

rebolek

[06:50](#msg57f89721a9a0a33375300a86)@TimeSlip Exactly.

[06:50](#msg57f89743470c6bb20f5dc8c2)It doesn’t matter if you are calling them `face` and `event` in your function, or `foo` and `bar`. It’s just first and second argument.

TimeSlip

[06:51](#msg57f8977ddfe82a365b096f30)OK, so it always sends face and event , in that order, and there are no other parameters sent?

[06:52](#msg57f897aba7c618cd26f33253)That's just the way it works then.

rebolek

[06:52](#msg57f897b5470c6bb20f5dc8c5)Yes.

TimeSlip

[06:53](#msg57f897d14fde7203141c4e0e)Cool. Lucky guess for me then :smile:

[06:55](#msg57f8985070fcb5db0c3c0836)I just looked at the docs again and see that it has that notation. It just never dawned on me that it worked that way. Now it makes sense.

rebolek

[06:56](#msg57f8988c14e9dbfd7857505e):)

TimeSlip

[06:56](#msg57f8988c70fcb5db0c3c08e3)Thanks brother.

rebolek

[06:56](#msg57f898a5470c6bb20f5dc8d2)You’re welcome.

TimeSlip

[06:58](#msg57f89911a7c618cd26f33515)That's my problem. Unless it is so blatantly explained I miss it. Fortunately, I'm just that close to finishing my first R2 to Red project. So far I am loving Red despite these little troubles.

[06:58](#msg57f89933dfe82a365b0972bc)Goodnight

rebolek

[06:59](#msg57f89947470c6bb20f5dc8e5)It’s great you have these questions. They can be answered and added to documentation for other people to help them.

TimeSlip

[07:00](#msg57f89990dfe82a365b097390)Yes, I am taking notes so that I can create some docs.

[07:03](#msg57f89a2968f560d80ce9632b)Bo, I just thought of something. I'll send you an email tomorrow.

rebolek

[07:03](#msg57f89a44a9a0a33375300aa5)OK.

RiVeND

[13:09](#msg57f8f013d6251fd126a0c99d)Like @dander I am finding the whole Cows/Fields/People discussion fascinating. I'd love to see how this translates into fully working Red code/data as I still have to get my thinking fully into Red mode (my "normal" work is OOP).

## Sunday 9th October, 2016

greggirwin

[21:17](#msg57fab3ff68f560d80cef4d68)@this-gavagai, be careful what you wish for: https://gist.github.com/greggirwin/e8b2b3c9310df477d31529297292c2de

geekyi

[23:09](#msg57face4314e9dbfd785765de)@geekyi realizes he has missed an interesting discussion

greggirwin

[23:43](#msg57fad60d0aa72e3c5bea92bd):^)

## Monday 10th October, 2016

dander

[17:17](#msg57fbcd1668f560d80cf2e36f)cool, @greggirwin ! This will keep me occupied for a couple of my evenings :wink:

TimeSlip

[18:12](#msg57fbd9f6dfe82a365b135688)I have this png file that is saved in a text format (forgive me if I don't recall the specific name for it) but to use it I "load" it. It looks like "load 64#{iVBORw0KGg..." The problem is that when I try to "do" it in Red I get a "\*\** Access Error: invalid UTF-8 encoding: #{89504E47}"

[18:12](#msg57fbda07dfe82a365b1356c6)What can I do to load it?

[18:20](#msg57fbdbd0dfe82a365b135e07)OK, I went back to R2, loaded it, saved the molded results and use that instead. Probably not as elegant but it works.

[19:19](#msg57fbe9c368f560d80cf354fc)New question. How can I center faces in a panel?

greggirwin

[20:15](#msg57fbf6f54fde720314268f31)

```
view/no-wait [p: panel 400x400 [btn: button "OK" [unview]]] 
center-face/with btn p  
do-events
```

TimeSlip

[22:42](#msg57fc195f68f560d80cf414d9)@greggirwin Thank you. I ended up using a panel within a panel and it worked perfectly.

## Tuesday 11st October, 2016

dockimbel

[02:14](#msg57fc4b0cd6251fd126aace2e)@TimeSlip `load/as 64#{...} 'png` should work. We need to improve the image codec automatic detection, so it will work as in Rebol.

TimeSlip

[02:43](#msg57fc51b984f1db06149c8d1c)Ah, I wondered about that /as . I'll try it.

[03:10](#msg57fc583cd6251fd126aaee22)Works great Doc!

[03:10](#msg57fc5840dfe82a365b14edd4)Thank you.

[04:01](#msg57fc6424dfe82a365b15066a)OK, another question. I'd like to create a loop that presents a series of strings one right after another with a pause in between. There seems to be a problem doing a view/no-wait and a do-events and then changing the /text and showing the face. I also tried placing the code inside the layout and using a "do \[ ]" but I don't know, it's not working as I would expect.

[05:21](#msg57fc76cbd6251fd126ab3d05)I ended up just creating a button that manually cycles through the strings. Cheesy but it works and has the advantage to user control.

[05:30](#msg57fc78e90aa72e3c5bf017d6)I also implemented my on-key "hot keys". One thing I noticed is that I have to manually use a button the first time then the on-key starts to work.

rebolek

[05:46](#msg57fc7cba84f1db06149cfdd4)@TimeSlip You can use `rate` in VID. See the eve clock demo.

TimeSlip

[05:47](#msg57fc7d07dfe82a365b15509a)@rebolek Thanks Bo. I will check it out

[05:50](#msg57fc7db4dfe82a365b155776)@rebolek how does rate work?

[05:52](#msg57fc7e0468f560d80cf51050)Well, let me experience. I think I see what it's doing.

rebolek

[05:53](#msg57fc7e4bdfe82a365b155961)@TimeSlip see this line:

```
base 200x200 transparent rate 1 now
```

You specify `rate 1` - that means 1 fps.

[05:53](#msg57fc7e5d68f560d80cf511a6)Then you use `on-time` actor that is run every second.

TimeSlip

[05:57](#msg57fc7f2c0aa72e3c5bf02d73)Bo, works like a charm. Thanks. That's yet another thing I wouldn't have figured out.

rebolek

[05:59](#msg57fc7fc968f560d80cf515d3)You’re welcome.

## Wednesday 12nd October, 2016

TimeSlip

[02:08](#msg57fd9b2cdfe82a365b19d527)Here's a good one. I was all happy testing my app but now it's time to compile it and I'm getting some errors that don't show up when I use the interpreter. Right now I'm stuck because I'm getting "compiler internal error" as opposed to a compilation error. Well, here's to finding what's causing it.

[02:12](#msg57fd9bf0a7c618cd26030fcf)It's in something called comp-call

[03:01](#msg57fda796a7c618cd26032d26)I narrowed it down to using chars ( ex. #"1") in a switch.

[03:02](#msg57fda7b884f1db0614a1577b)Ah, perhaps the # has to be escaped?

[04:27](#msg57fdbba6dfe82a365b1a1f2a)I'm able to compile a test app with code using #"1" with the latest version. Must be something in the larger app.

[04:27](#msg57fdbbbb4fde7203142cc16b)Getting farther... Now this show up: Compiling to native code...  
\*\** Red/System Compiler Internal Error: Script Error : decorate-fun expected name argument of type: word  
\*\** Where: comp-expression  
\*\** Near: \[decorate-fun expr/1]

rebolek

[05:12](#msg57fdc63ea7c618cd26037739)@TimeSlip Compiler InternalError is bug. You should report it.

TimeSlip

[05:13](#msg57fdc68fa7c618cd260377fd)The killer thing is I managed to get one version to compile but now I can't figure out what I did to make that happen. Me thinks it's in my code though.

rebolek

[05:15](#msg57fdc6e3d6251fd126afdb13)Compiler Internal Error is not problem with your code. If it is in your code, compiler should throw specific error.

TimeSlip

[05:15](#msg57fdc7054fde7203142cdcc6)OK, the next question is how to report it.

greggirwin

[05:16](#msg57fdc71d4fde7203142cdcef)The compiler may not yet handle dialects. If you're writing VID code, try setting any words you set \*inside* the layout spec \*outside* of it first.

rebolek

[05:16](#msg57fdc733d6251fd126afdbbb)go to https://github.com/red/red/issues and press "New Issue"

greggirwin

[05:17](#msg57fdc780a7c618cd26037a0b)Though the error you're seeing is likely not what I said, so nevermind. It would report an error correctly in that case.

TimeSlip

[05:18](#msg57fdc793d6251fd126afdc83) @greggirwin Yes, I noticed that I had to do that for several words. @rebolek Thanks for the instructions.

rebolek

[05:19](#msg57fdc7e868f560d80cf9fa13)@TimeSlip Do not forget to add some example code how to reproduce the error.

TimeSlip

[05:20](#msg57fdc826dfe82a365b1a3db5)This particular app creates Vid code on the fly so it's a bit funky. And if I knew what was causing it that would sure help. I got thrown off because the program was working flawlessly in the interpreter.

this-gavagai

[08:52](#msg57fdf9e6dfe82a365b1adcad)@greggirwin Wow! This is incredible. My apologies for the slow response. I live in a remote area and the internet sometimes goes out unexpectedly for up to a week at a time. I'm going to read through this all this evening and get back here.

greggirwin

[15:49](#msg57fe5b6eb68c1ca566acbd01)@this-gavagai, I live in a rural area with the occasional blip, and slow access at times. I was on dial-up longer than any of my modern peers. People would sometimes mention how efficient my code was, and light on the wire. I would tell them that it had to be. My net connection was the slow test case. :^)

TimeSlip

[19:01](#msg57fe887f78bd0d0363b9ca03)Where can I find more info on the Red command line switches

dander

[20:11](#msg57fe98de8eaaaea3668e235c)@TimeSlip do you mean beyond the output of `red --help`? Or is that what you are looking for?

greggirwin

[20:52](#msg57fea28630abd799717baef1)%red.r contains the handler. I thought there was a doc page listing them, but can't find it right now. In the meantime:

```
any [
		  ["-c"	| "--compile"]		(type: 'exe)
		| ["-r" | "--release"]		(opts/dev-mode?: no)
		| ["-d" | "--debug" | "--debug-stabs"]	(opts/debug?: yes)
		| ["-o" | "--output"]  		set output skip
		| ["-t" | "--target"]  		set target skip (target?: yes)
		| ["-v" | "--verbose"] 		set verbose skip	;-- 1-3: Red, >3: Red/System
		| ["-h" | "--help"]			(mode: 'help)
		| ["-V" | "--version"]		(mode: 'version)
		| ["-u"	| "--update-libRedRT"] (opts/libRedRT-update?: yes)
		| "--red-only"				(opts/red-only?: yes)
		| "--dev"					(opts/dev-mode?: yes)
		| "--no-runtime"			(opts/runtime?: no)		;@@ overridable by config!
		| "--cli"					(gui?: no)
		| "--catch"								;-- just pass-thru
		| ["-dlib" | "--dynamic-lib"] (type: 'dll)
		;| ["-slib" | "--static-lib"] (type 'lib)
	]
```

[20:53](#msg57fea2b678bd0d0363ba3bd8)Doh! https://github.com/red/red

## Thursday 13th October, 2016

TimeSlip

[00:51](#msg57fedaa6891a53016305698d)@dander @greggirwin Thank you. That's what I was looking for.

dockimbel

[05:16](#msg57ff18c0457ae29b71d555c3)@TimeSlip https://github.com/red/red/blob/master/usage.txt

TimeSlip

[05:25](#msg57ff1aba614116a2567bec25)Thanks doc. I'm still stuck with the compiler error. It seems when I add my mp3 system code red doesn't like it. I was wondering if there is a way to "CALL" a program with red. I was thinking I could create a player and have it launched.

dander

[23:54](#msg58001ec21cc4cda4564b6e75)@TimeSlip , I haven't tried it yet, but I've heard it can be done. I don't know if it's built into the red exe yet though. I think these are good places to start:  
https://github.com/red/red/blob/master/tests/source/library/call-test.red  
or maybe  
https://github.com/red/red/blob/master/tests/console-call.red

## Friday 14th October, 2016

TimeSlip

[00:36](#msg58002881891a5301630a45d7)@dander Thank you so much. Bo also posted some information a few days back that I managed to find.

geekyi

[05:45](#msg580070de20390f67704e451f)@wolframkriesing sorry, I can't test anything right now as my antivirus (avira) has become overzealous and keeps quarantining crush.dll :worried:  
I've tried disabling everything from disabling the antivirus but cannot even manually create a %crush.dll in the respective folders (`Program data\red` and `red` git source) :(

wolframkriesing

[06:16](#msg5800783d30abd79971823579)@geekyi just to do a read/info?

[06:16](#msg5800784278bd0d0363c09fbf)Wow

geekyi

[06:19](#msg580078d740e7960d7b466fca)@wolframkriesing can only use the current version as I had it running before. It has deleted all the other versions of red, can't use the builds or compile from source. Will check other ways later

wolframkriesing

[06:19](#msg5800790e457ae29b71da81c1)No worries, any hints how I can investigate more?

geekyi

[06:21](#msg58007954eab966c85fbbe130)@wolframkriesing I'm not sure, as you seem to be on MAC

[06:21](#msg5800796f20390f67704e4591)do you have wireshark?

[06:25](#msg58007a613ad9b17f6cc57a7e)For anyone curious, when I try to compile from source; pretty sure it's caused by the antivirus:

```
-=== Red Compiler 0.6.1 ===-

Compiling C:\Users\XXX\Documents\GitHub\red\red\tests\hello.red ...
Compiling compression library...
Script: "Red/System PE/COFF format emitter" (none)
*** Linker Error: locked or unreachable file: .\..\crush.dll
```

dockimbel

[06:37](#msg58007d3cb68c1ca566b4907c)@geekyi If you have an opened Rebol console where you did a Red compilation before, it can lock the crush DLL file.

## Saturday 15th October, 2016

geekyi

[14:33](#msg58023e54671ea7ae6c465dab)@rcqls can you post some code that can't avoid parentheses? I want to understand what you are saying

rcqls

[14:39](#msg58023f93614116a256872b9b)@geekyi I think you do not understand me. Just check the red development. `tests/quick-test.r` and this line in particular `to char! ((shift code 6) and #"^(1F)" or #"^(C0) »)`. It is like mathematics, at some point it is just impossible to avoid parentheses to change priority rules in evaluation. The good point in Redbol is to try to avoid it when not necessary as a literal language. Sorry! You posted the same message or I receive an old message...

geekyi

[14:47](#msg5802417dfa6b78846e25edef)@rcqls https://github.com/red/red/blob/master/quick-test/quick-test.r#L716 right

[14:49](#msg580241ee671ea7ae6c465dfb)@rcqls You are right, I didn't know of words! that behaved like ops! like `and`, I'd thought it was more uniform. I'm a redbol newbie too :wink:

rcqls

[14:52](#msg5802429a30abd799718858b3)@geekyi I am really loving red (more than rebol) because of the foundation expressed by @dockimbel. One day, I am pretty sure that Red would be my master language.

## Monday 17th October, 2016

TimeSlip

[00:36](#msg58041d2078bd0d0363cc58df)Hello. Is there a way to elegantly destroy a view? I have this layout face that uses the "rate...on-timer" function to update the text. After is runs its course, I'd like to get rid of it since after an unview, it keeps running in the background (which could be a useful thing but not in this instance because I am done with the face.)

greggirwin

[01:38](#msg58042bb37972c57342108e59)Are you holding a reference to the view elsewhere? Have you tried setting the rate to none before unviewing?

TimeSlip

[02:25](#msg58043684891a53016316df86)@greggirwin I set the rate to none as suggested. Thank you! I was dreading removing that feature from my app.

geekyi

[10:49](#msg5804acb294b459a576dcf4c5)@maximvl `thru` or `to` might help in your case I think

[10:58](#msg5804aeedfa6b78846e260b75)I don't know if there is a way to not make `parse` greedy, I changed my code to not work against it

maximvl

[12:14](#msg5804c09d7972c57342127093)is it possible to get last matched value in parse?

[12:14](#msg5804c0a9891a53016318a713)or what is the general way to collect data?

dockimbel

[12:17](#msg5804c1487972c573421273a5)@maximvl `collect/keep` combo, or just `copy` or `set`, depends on your needs.

```
parse [1 2 a 3] [any [integer! | copy w word! (?? w)]]

list: []
parse [1 2 a 3 b 4] [any [integer! | set w word! (append list w)]]

parse [1 2 a 3 b 4] [collect any [integer! | keep word!]]
```

TimeSlip

[12:40](#msg5804c6cf8eaaaea366a2b9d8)Getting so close now. I have a handler used with a button that responds to key events. The trouble is that it only works after I press the button once. After that it is fine.

maximvl

[12:51](#msg5804c969b68c1ca566c2a61b)@dockimbel collect works, it reverses the order in the end, but this is fine

[13:04](#msg5804cc73b68c1ca566c2b274)wait, should it revert result or not?

dockimbel

[13:09](#msg5804cda41cc4cda4565a9a96)No, it should not.

maximvl

[13:13](#msg5804ce70614116a2568f4eca)let me make a small reproducible example

[13:16](#msg5804cf2078bd0d0363ceb0ae)@dockimbel ok, it's only for `collect into`

[13:16](#msg5804cf477972c5734212afc1)

```
z: copy []
print mold parse [a b c] [any [collect into z [keep word!]]]
print mold z ; => [c b a]
```

geekyi

[13:48](#msg5804d6ca5636a5602eeeec4a)@maximvl (also) check the red blogpost for parse

maximvl

[13:50](#msg5804d7197972c5734212d82f)@geekyi this one? http://www.red-lang.org/2013/11/041-introducing-parse.html

geekyi

[13:50](#msg5804d720e897cd3a71dfc74d)Yep

[13:51](#msg5804d746e897cd3a71dfc74f)`collect` is a red feature, with `rebol` you use `set`

maximvl

[13:51](#msg5804d74f891a530163190e99)it says  
&gt;keep (expr) : append the last value from the Red expression to the collecting block

[13:51](#msg5804d76978bd0d0363ced7e7)but with `into` it prepends, not appends :)

geekyi

[13:53](#msg5804d7c15636a5602eeeec88)@maximvl `/into` has insert semantics, there was a conversation about it..

[13:53](#msg5804d7e0e897cd3a71dfc765)I was wondering if it shouldn't be `parse/collect`, it's the only case where parse returns a block! instead of logic! @dockimbel

maximvl

[13:54](#msg5804d82b1cc4cda4565ac9e9)makes sense, especially when you are not in control of which rules will come to parse

[13:55](#msg5804d83e1cc4cda4565aca37)you dont know if it will return logic! or block!

rebolek

[13:57](#msg5804d8e51cc4cda4565acd08)IMO you know, because you set the rules

[13:59](#msg5804d95e1cc4cda4565aceec)PARSE in Rebol could also return block! when used as Split function

maximvl

[14:01](#msg5804d9a8614116a2568f85aa)@rebolek what do you mean `you set the rules`

[14:01](#msg5804d9c81cc4cda4565ad117)rules can be easily passed though the system from one place to another

[14:02](#msg5804d9dcb68c1ca566c2f9dd)writing something general becomes more complex

dockimbel

[14:05](#msg5804dab8891a530163191ed9)@maximvl It should not reverse the order, there might be a ticket for that already, if not, please open one.

[14:06](#msg5804dad578bd0d0363cee84c)@maximvl BTW, `print mold` == `probe`. ;-)

Rebol2Red

[14:06](#msg5804dafa30abd79971906933)How can i set a focus on a face? How can i read the mouseposition on a window or a face?

maximvl

[14:08](#msg5804db4630abd79971906ae5)@dockimbel there is, indeed, I forgot about `probe`, thanks)

geekyi

[14:15](#msg5804dceeb813566a4c6e0713):point\_up: \[October 17, 2016 6:57 PM](https://gitter.im/red/help?at=5804d8e51cc4cda4565acd08) @rebolek and the functionality was split out into `split` :smile: in rebol3 and red

maximvl

[14:19](#msg5804ddf72189c68f42f41670)ok, here is the question about `parse`

[14:19](#msg5804de058d2babbd087de83f)I want to parse a block and extract data

[14:21](#msg5804de5f2189c68f42f41827)to store the data I'm hard coding names of variables into rules

[14:22](#msg5804de9948292577612f6441)the question is how can I make this reusable?

[14:32](#msg5804e0e548292577612f7029)oh

[14:32](#msg5804e0e9b827179842cc94d2)

```
red
*** Driver Internal Error: Script Error : Out of range or past end 
*** Where: parse-options 
*** Near:  [if cmd: select [
"clear" do-clear
] first]
```

[14:32](#msg5804e1192189c68f42f425ba)and

[14:33](#msg5804e11c2189c68f42f425c0)

```
red --cli 
--== Red 0.6.1 ==-- 
Type HELP for starting information. 

red>> x: 5
== 5
red>> b: context [
[    x: x
[    ]
*** Script Error: x has no value
*** Where: x
```

[14:33](#msg5804e140b827179842cc96b9)so, basically one can't use a variable as initial value if field with same name exists in context

Mufferaw

[14:34](#msg5804e16180020cc608ea87d3)I've run into a strange issue, using Red/System. Inside a nested loop, I call a function which calls another function (ex: myfunc arg1 arg2) The problem is that the 2nd argument has somehow replaced the 1st argument, so the function executes like myfunc arg2 arg2. Here's the code  
https://gist.github.com/Mufferaw/523a91d7c979a79bd6ce7509db283c21  
From the Color function I call the vec3-add function with arguments v3 and v4 but in the vec3-add function they are the same. Also, when I 'probe' v3 and v4 I get the same result

rebolek

[14:57](#msg5804e6ddb17b667961cc167c)@geekyi `parse/collect` (or `parse/into`) may be a good idea, I was just playing devil's advocate ;) it's not that unusual that function returns different types

[14:59](#msg5804e741759f6d2436bdd388)@maximvl in Rebol 3, I had function that let you make PARSE rules with local variables

maximvl

[15:06](#msg5804e90e48292577612fa5f2)@rebolek I suppose this can be done with `bind` technique, but I'm not sure if it is ported to Red

rebolek

[15:13](#msg5804ea942189c68f42f462f9)I tried it yesterday, but it crashes Red. I have to look at it and write an issue (I'm on phone now).

[15:14](#msg5804eae148292577612fb079)Anyway, for your `x: x` example: try using `compose` and `x: (x)`

maximvl

[15:46](#msg5804f26c2189c68f42f490ce)@rebolek indeed, thanks!

dockimbel

[15:50](#msg5804f362759f6d2436be1c58)@maximvl Another way to achieve it:

```
red>> x: 5
== 5
red>> b: context [x: system/words/x]
== make object! [
    x: 5
]
```

maximvl

[15:52](#msg5804f3abb827179842cd0d42)@dockimbel does `system/words/x` return value binded to `x` in current scope?

dockimbel

[15:53](#msg5804f3f336d64226367cbf5a)It just ensures that `x` value is fetched from global context and not local one.

[15:55](#msg5804f45bb827179842cd11b3)@Mufferaw Could you pinpoint in your code where is that issue happening precisely? Remember that `declare` is a static allocation, not a dynamic one (use `allocate` and `free` for that).

maximvl

[15:58](#msg5804f51db827179842cd1abb)@dockimbel ok, then this is not what I want, I'm returning object from function

dockimbel

[16:03](#msg5804f64f759f6d2436be3599)@maximvl Then `compose` is the right option.

maximvl

[16:08](#msg5804f7982189c68f42f4ac50)yep

Mufferaw

[16:26](#msg5804fba44829257761300f81)@dockimbel on line 88, vec3-add v3 v4, the two arguments have different values but when they 'arrive' at the vec3-add function, they are the same.

[16:27](#msg5804fc0cb827179842cd4064)

```
Color - v3/x: 0.1479379273840342 y 0.2071130983376479 z 0.2958758547680684
Color - v4/x: 0.7041241452319316 y 0.7041241452319316 z 0.7041241452319316
ADD-A x 0.7041241452319316 y 0.7041241452319316 z 0.7041241452319316
ADD-B x 0.7041241452319316 y 0.7041241452319316 z 0.7041241452319316
```

dsgeyser

[17:16](#msg5805078836d64226367d28fe)@greggirwin

wolframkriesing

[20:38](#msg580536d536d64226367e03c9)noob question ahead :)  
what’s the difference between

```
a: [ b 1 ]
; and
a: [ b: 1 ]
```

on both I can do `a/1` and `a/b`, the second is a set, what is the first?

geekyi

[20:43](#msg580537ef5636a5602eeef8dd)@wolframkriesing

```
collect [foreach thing a [keep type? thing]]
```

first case `a: [ b 1 ]`:

```
[word! integer!]
```

2nd case `a: [ b: 1 ]`:

```
[set-word! integer!]
```

wolframkriesing

[20:45](#msg5805386836d64226367e0a1d)@geekyi is the `collect` line pseudo code? I understand nothing of that line :)

geekyi

[20:46](#msg58053892e897cd3a71dfd32a)@wolframkriesing nope, you should try it out, useful for series

[20:46](#msg580538b3b813566a4c6e1246)I actually didn't know rebol2 had it, thought it was a red, rebol3 feature

wolframkriesing

[20:47](#msg580538d080020cc608ec42b1)ah, the generic version of

```
red>> type? a/1
== word!
```

thx

[20:47](#msg580538f94829257761313b79)what is the block `[b 1]`? its not a set, right? an object neither

geekyi

[20:51](#msg580539e95636a5602eeef902)@wolframkriesing a block? :P I think what you are trying to say, when would you use one, and when the other?

wolframkriesing

[20:52](#msg580539ffb827179842ce77cd)probably :)

geekyi

[20:52](#msg58053a285636a5602eeef913)Just a usecase that came into my mind.. if you use `reduce a`, they would work different

[20:55](#msg58053aad714642af22cc1aa1)@wolframkriesing maybe also ask on stackoverflow? "difference between set-word! and word! in a block"

wolframkriesing

[20:55](#msg58053ab548292577613142c9)makes sense. just wondering why does `a/b` return `1` for `a: [b 1]`, for `a: [b: 1]` I would understand it

geekyi

[20:56](#msg58053affe897cd3a71dfd355)overloaded conventions I think

wolframkriesing

[20:56](#msg58053aff36d64226367e14db)interesting

```
red>> a: [b: 1]
== [b: 1]
red>> a/1
== b:
```

geekyi

[20:57](#msg58053b4db813566a4c6e1266)basically working like `select`

wolframkriesing

[20:58](#msg58053b6236d64226367e1698)thx @geekyi

geekyi

[20:58](#msg58053b69714642af22cc1aa7)

```
>> d: [e f g h i]
== [e f g h i]
>> d/e
== f
>> d/h
== i
```

wolframkriesing

[20:58](#msg58053b8980020cc608ec4c37)i throw it out on stackoverflow #survives\_longer :)

geekyi

[20:59](#msg58053badb813566a4c6e126b)SO #needs\_questions

greggirwin

[21:48](#msg5805471fb827179842cea9a6)One difference is how they are evaluated.

```
red>> a: reduce [ b 1 ]
*** Script Error: b has no value
*** Where: reduce
red>> a: reduce [ b: 1 ]
== [1]
```

maximvl

[21:50](#msg580547b0b827179842ceab5e)@wolframkriesing `b:` is a `set-word`, while `b` is just a `word`

[21:52](#msg5805483936d64226367e4927)it is a different datatype, others are `get-word` (as `:a`), `lit-word` - `'a`

greggirwin

[21:53](#msg5805484636d64226367e4945)The change from Rebol allows set-words to be used as selectors, as was said. This is \*very* nice, because the way you had to do it under R2 was a pain, forcing you to choose your block format much more carefully, if you wanted to use spec-block format.

[21:53](#msg58054875b827179842ceadee)

```
>> a: [ b: 1 ]
== [b: 1]
>> a/b
** Script Error: Invalid path value: b
** Near: a/b
>> select a to set-word! 'b
== 1
```

## Tuesday 18th October, 2016

Mufferaw

[05:54](#msg5805b8ffb827179842d008be)@dockimbel I've made another gist that demonstrates the problem I'm having.  
Is my ignorance causing this problem? Am I doing something wrong?  
https://gist.github.com/Mufferaw/84ada8d399b70ae4dcc5f16d7e70e475

wolframkriesing

[06:17](#msg5805be6980020cc608edce8e)Thanks @greggirwin and @maximvl ... looks like it's time to dive deeper into the types set-word and get-* and lit-*

[06:23](#msg5805bfe336d64226367fbb4b)Though one question remains, using `a: [b 1]` I can still access `a/b`, so what is in that block? It's not a set, right?

dockimbel

[06:39](#msg5805c3b5b827179842d02ba3)`a/b` is just syntactic sugar for `select a 'b`. Similarly, `a/:b` is sugar for `pick a b`.

wolframkriesing

[06:48](#msg5805c5a6b17b667961cf6159)ok, I need to let that sink in

DideC

[08:59](#msg5805e480759f6d2436c1b970)@Mufferaw I don't program in R/S so it's far from my knowledge.  
But playing with your code, it behave like if `a` local variable is statically create for the function : its adress is the same at each call. So `testu` and `testv` point to the same address after calling the function: they are the same.  
Of course, it's not the behaviour that you want (I suppose it's the correct R/S one), but don't know how to change it.

PeterWAWood

[11:12](#msg580603b636d642263680dff3)@Mufferaw When you pass a structure as an argument to or return a structure from a function, the structure is not physically passed but a pointer to it. You will notice that the second set of probes in your gist always return an identical value (which is the address of

```
a
```

).

[11:14](#msg5806041eb827179842d1521f)The normal way around this is to pass the address of the structure you wish to update as an argument to the function rather than returning a new structure. (The alternative is to copy the values from the returned structure before calling the function again).

[11:17](#msg580604c480020cc608eee5b6)Here is an outline for a revised version of your vec3-Mfloat function:

```
vec3-Mfloat: func [
    vec [vector3!]
    f [float!]
    new-vec [vector3!]
    ][  
        new-vec/x: vec/x * f
        new-vec/y: vec/y * f
        new-vec/z: vec/z * f
]
```

Here are the revised calls of the function:

```
vec3-Mfloat direction testf testu
vec3-Mfloat origin testf testv
```

Mufferaw

[11:37](#msg5806096d80020cc608eef799)@PeterWAWood Thank you

DideC

[13:03](#msg58061dac759f6d2436c2bd27)@PeterWAWood So it means that it's not possible to "create" a new structure inside a function and return it to the caller ?

maximvl

[13:33](#msg580624ae8d2babbd08830d7a)I just realized one can't use loops over object's fields

[13:34](#msg580624d82189c68f42f96bf4)

```
red>> forall x/z [print first x/z]
*** Script Error: forall does not allow path! for its 'word argument
*** Where: forall
```

rebolek

[13:40](#msg5806263a714642af22cc2b13)You can, but not directly:

```
red>> o: object [a: 1 b: 2]
== make object! [
    a: 1
    b: 2
]
red>> foreach w words-of o [print [w get w]]
a 1
b 2
```

maximvl

[13:51](#msg580628e1b827179842d1f999)@rebolek ah, I meant another thing - to iterate over the block which is object's field

[13:51](#msg580628fb2189c68f42f981fa)like `o: object [a: [1 2 3]]`

rebolek

[13:54](#msg58062985b813566a4c6e23c9)@maximvl I see. That is `forall` limitation, see the help: \*'word \[word!] =&gt; Word referring to series to iterate over.* - it does not accept `path!`

TimeSlip

[13:59](#msg58062ad3482925776134a449)I thought I would recompile my app this morning and I am getting "\*\** Runtime Error 1: access violation  
\*\** at: 730E2182h"

[14:01](#msg58062b34b17b667961d11b4e)I have made any changes and it was compiling just fine yesterday. This is happening on two computers (@home, @work)

maximvl

[14:04](#msg58062bfe36d6422636818f79)how do I convert get-word to just word?

TimeSlip

[14:05](#msg58062c17482925776134aabf)Also, I noticed that on windows 10, when I have a backdrop image and then a base set to some level of transparency (alpha value), the transparency affects the backdrop image as well and makes a see-thru window. What I thought it would do is keep the backdrop at full opacity and just alter the base.

maximvl

[14:06](#msg58062c83b17b667961d12201)

```
red>> to get-word! "foo"
*** Script Error: TO cannot convert get-word! from: foo
*** Where: to
red>> to set-word! "foo"
== foo:
red>> to word! "foo"
== foo
```

TimeSlip

[14:14](#msg58062e378d2babbd08833bfd)@maximvl Yes, it doesn't seem to work. I know this is not elegant but  
type? load ":foo"  
\== get-word!

[14:15](#msg58062e64482925776134b6d4)...until it's fixed.

maximvl

[14:16](#msg58062eb3482925776134b8ab)@TimeSlip I have word and a get-word, I need to convert one to another

TimeSlip

[14:16](#msg58062ec68d2babbd08833ef7)Ahhh

maximvl

[14:19](#msg58062f7d36d642263681a081)this is weird, I don't see any workaround here

TimeSlip

[14:21](#msg58062fd2b827179842d2225d)@maximvl Can you post it as a bug?

maximvl

[14:21](#msg58062fdb8d2babbd08834619)sure

[14:44](#msg58063545759f6d2436c33a13)https://github.com/red/red/issues/2275

geekyi

[15:24](#msg58063ec148292577613509c9)@TimeSlip :point\_up: \[October 18, 2016 6:59 PM](https://gitter.im/red/help?at=58062ad3482925776134a449) does your code use view and is on windows 10?

[15:27](#msg58063f5536d642263681ed4f)\[October 17, 2016 5:21 AM](https://gitter.im/red/red?at=5804198c671ea7ae6c4673cf) same issue? (try to see if you can compile tests/vid.red), red was recently refactored to prepare for mac

greggirwin

[16:15](#msg58064a8436d6422636822552)@maximvl `load append copy ":" 'a` (until it's fixed).

meijeru

[16:22](#msg58064c46b17b667961d1ca06)@maximvl Re #2275: If I remember well, several issues related to `to` have been dismissed by Doc because the implementation of `to` is not finalized.

maximvl

[16:23](#msg58064c8a36d6422636823077)@meijeru okey, but it makes little sense that `to` can convert to `lit-word!` and can't to `get-word!`

[16:24](#msg58064cb1b827179842d2be14)@greggirwin thanks!

[16:26](#msg58064d4a80020cc608f03fe1)does Red support closures?

[16:27](#msg58064d5880020cc608f04053)

```
red>> afun: func [x] [ func [y] [x]]
== func [x][func [y] [x]]
red>> a: afun 1
== func [y][x]
red>> a 3
*** Script Error: x is not in the specified context
*** Where: a
```

[16:27](#msg58064d7c36d6422636823509)and if not - what is the replacement?

dockimbel

[16:28](#msg58064daa759f6d2436c3b23e)@maximvl `to` is only partially implemented for now, we need to rework and complete it. Closures are not yet available in Red.

greggirwin

[16:35](#msg58064f4d482925776135781b)@maximvl , `to` is an action in each datatype so there is a logical reason why it might work for one but not another.

maximvl

[16:48](#msg58065257b17b667961d1e523)@dockimbel my little experiment with lambda lists / keyword arguments: https://gist.github.com/maximvl/e2c0c2b7695164bef30582ffc7eba931

greggirwin

[17:33](#msg58065d07b827179842d30f36)Nice Maxim! Fun stuff.

TimeSlip

[18:14](#msg5806669d759f6d2436c42f92)@geekyi Yes, it uses view but I am using a previous version of Red that compiled the same code before. 0.6.1 - 28-Sep-2016/11:09:27-7:00

PeterWAWood

[23:56](#msg5806b6a536d642263683f9ba)@DideC Whilst you can return a new structure from a function in Red/System, you can create a new structure and return a pointer to it. You would need to use

```
allocate
```

to reserve memory for the new structure and then assign the address of that memory to the structure. You can then return the pointer from the function. One issue with that approach is knowing when to release the memory allocated to the structure.

I think it is better practice to supply the address of the structure for the return values as an argument to the function.

## Wednesday 19th October, 2016

TimeSlip

[00:26](#msg5806bdba2189c68f42fc1fe0)OK, the following was being caused by not using the "stable" version (on both my computers). Whew! Thought I was going crazy.  
\*\** Runtime Error 1: access violation  
\*\** at: 10002182h

PeterWAWood

[03:13](#msg5806e4cb8d2babbd08865198)@DideC I meant to write "Whilst you can't return a new structure ..."

Mufferaw

[05:01](#msg5806fe222189c68f42fcf08a)Another Red/System question, I'm trying to make a 'list' with a struct and I wonder if there is a way to iterate through the members of the struct

```
list: declare struct![
	item1 [sphere!]	
	item2 [sphere!]
	item3 [sphere!]
]
```

and I want to do something like -  
`list/1 or list/x`

PeterWAWood

[06:20](#msg580710c22189c68f42fd363d)@Mufferaw It is possible to iterate over such a structure but you have to take care of all the details yourself so it is a bit tricky. Here is your example with a very simple sphere! structure:

```
Red/System []

sphere!: alias struct! [
    radius [integer!]
]

list: declare struct![
    item1 [sphere!]    
    item2 [sphere!]
    item3 [sphere!]
]

list/item1: declare sphere!
list/item2: declare sphere!
list/item3: declare sphere!
list/item1/radius: 1
list/item2/radius: 2
list/item3/radius: 3

print [as integer! list/item1/radius " " list/item2/radius " " list/item3/radius lf]

sphere-len: 4
item: declare sphere!
list-as-array: as byte-ptr! list/item1
i: 1
until [
    item: as sphere! list-as-array 
    print [i " " item/radius lf]
    list-as-array: list-as-array + sphere-len
    i: i + 1
    i > 3
]
```

[06:28](#msg580712a436d642263685409a)The "arithmetic" will get tricky if the length of the structure is not a multiple of four bytes. (The compiler probably will pad the structure so that the fields are aligned in memory. I'm not sure of the details.)

Mufferaw

[06:40](#msg580715712189c68f42fd4635)@PeterWAWood Wow, thanks!

PeterWAWood

[07:09](#msg58071c198d2babbd08871027)I'm not sure that is the best way to do what you want.It may be better to have an array of sphere!s could be a better choice ... but then you 'll need to manage memory allocation yourself.

dockimbel

[07:45](#msg58072489b827179842d612ee)@Mufferaw This is how:

```
spheres: declare struct![
    item1 [sphere!]    
    item2 [sphere!]
    item3 [sphere!]
]
list: as sphere! spheres
```

then you can use `list/1` or `list/x`.

[07:46](#msg580724ba759f6d2436c70a6a)Though, it would be probably better to allocate the spheres array dynamically:

```
spheres: as sphere! allocate 3 * size sphere!
```

Mufferaw

[08:47](#msg58073336759f6d2436c74a93)@dockimbel I can't get that to work

```
Red/System []

sphere!: alias struct! [
    radius [integer!]
]

spheres: declare struct![
    item1 [sphere!]    
    item2 [sphere!]
    item3 [sphere!]
]

s1: declare sphere!
s1/radius: 45
spheres/item1: s1

list: as sphere! spheres
print [list/1/radius]
```

gives me invalid path

dockimbel

[09:06](#msg5807378db17b667961d5635e)Deep paths are not supported in Red/System for now, you need to decompose it into two instructions.

PeterWAWood

[09:32](#msg58073da836d64226368614f9)@dockimbel I found that the

```
item1
```

in the above structure is offset from the start of the structure:

```
address of spheres        00003060
address of spheres/item1  0000307C
```

I needed to set

```
list
```

to the address of \`spheres/item1 to get the code to work.

[09:34](#msg58073e3fb827179842d694f2)Also I got a compile error when I tried to access

```
list/1
```

:

```
*** Compilation Error: invalid struct member 1 
*** in file: %/Users/peter/VMShare/Code/Red-System/test.reds 
*** at line: 25 
*** near: [list/1 lf]
```

DideC

[12:14](#msg580763c1b827179842d74faf)Seems logical : `spheres` is a set of 3 pointers of 4 bytes each, so 12 bytes. So `spheres/item1` is the address of `s1` struct in memory: its a pointer.

dockimbel

[12:49](#msg58076bf448292577613a289d)@PeterWAWood @Mufferaw My bad, I forgot that we didn't implement indexed path notation support for arrays of structs yet, so you have to do an extra step. Here is a working example, setting up a dynamic array of 3 `sphere!` structs, initializing the `radius` with values from a literal array of integers:

```
sphere!: alias struct! [
    radius [integer!]
]

spheres: as sphere! allocate 3 * size? sphere!

list: [45 30 60]
s: spheres
i: 0

while [i < 3][
	s/radius: list/value
	print ["Sphere " i " radius: " s/radius lf]
	list: list + 1
	s: s + 1
	i: i + 1
]
```

dander

[20:09](#msg5807d2f22189c68f42011df7)@maximvl It looks like it is possible to make a closure with something like this

```
red>> afun: func [x] [c: context compose [x: (x) f: func[y][x]] :c/f]
== func [x][c: context compose [x: (x) f: func [y] [x]] :c/f]
red>> a: afun 1
== func [y][x]
red>> a 3
== 1
```

I only learned about the `compose` trick for using the same argument name today, but it makes me think this could evolve into a generalized `closure` function generator

## Thursday 20th October, 2016

Mufferaw

[04:25](#msg5808474080020cc608f85c6f)Using Red/System, how can I generate some random numbers? Do I need to #include something?

dockimbel

[05:42](#msg58085930b17b667961da5bcd)@Mufferaw You should be able to include the %random.reds file from the Red runtime:

```
#include %runtime/random.reds

_random/init
_random/srand 123      ;-- set the seed
probe _random/rand     ;-- get a random 32-bit integer
```

Mufferaw

[05:46](#msg58085a1d2189c68f4202f35b)@dockimbel thanks!

dockimbel

[06:08](#msg58085f6248292577613e0d8e)@Mufferaw If you are embedding your R/S code in a Red script (using `#system` directive or `routine`), then the include and init are not required, they are already done for you by the Red runtime library.

maximvl

[12:06](#msg5808b34236d64226368c455e)@dander hm, can you explain what happens in your code?

[12:06](#msg5808b3602189c68f42045845)why does `x` inside `f` works for the context?

rebolek

[12:09](#msg5808b3e6714642af22cc64fd)@maximvl `f` is defined in context where `x` is also defined.

[12:10](#msg5808b41f714642af22cc6501)Even if `afun` returns `f` only, it does not mean that the `c` context is gone.

maximvl

[12:26](#msg5808b80cb17b667961dbdb89)@rebolek I see, but how is that different from function version?

[12:27](#msg5808b82148292577613f747f)I mean, function definition should create context, shouldn't it?

rebolek

[12:28](#msg5808b858e897cd3a71e01bc4)@maximvl this creates persistent context.

[12:29](#msg5808b88ce897cd3a71e01bc7)You can’t (basically) do it with `function`.

maximvl

[12:44](#msg5808bc3d759f6d2436cdfe9b)@rebolek why?

rebolek

[12:45](#msg5808bc83b813566a4c6e5c66)@maximvl why what? When you have `function` all local values are initialized on each call (usually to `none`).

maximvl

[12:53](#msg5808be5648292577613f8fb6)@rebolek local variables are not initialized in global scope, so there must be a local scope

rebolek

[12:53](#msg5808be64b813566a4c6e5c92)@maximvl of course, there is

maximvl

[12:54](#msg5808be91759f6d2436ce08df)so why when I return function from another function it isn't bound to this local scope?

rebolek

[12:54](#msg5808be94b813566a4c6e5ca1)but what if you want to make i.e.: `counter` function, that will increase some local variable by one each time it’s called?

maximvl

[12:55](#msg5808beae36d64226368c7c3f)well, it should increase every time

rebolek

[12:55](#msg5808bebb5636a5602eef454e)try it

maximvl

[12:55](#msg5808bebb48292577613f9155)eg:

[12:55](#msg5808bed380020cc608fa333b)`func [] [counter: 0 func [] [ counter: counter + 1 ]]`

[12:56](#msg5808bef480020cc608fa33c9)@rebolek it works...

[12:56](#msg5808beff48292577613f9241)I don't get it

[12:56](#msg5808bf0a36d64226368c7da3)how does this one work without closures support?

rebolek

[12:56](#msg5808bf16e897cd3a71e01c33)because `counter` is global

[12:56](#msg5808bf1bb813566a4c6e5cb4)in your example

maximvl

[12:57](#msg5808bf2936d64226368c7e21)wat

rebolek

[12:58](#msg5808bf5cb813566a4c6e5cb6)`func` does not gather local words, so `counter` is defined in global context in you example

[12:58](#msg5808bf8d714642af22cc660d)IMO it does not work anyway.

maximvl

[12:59](#msg5808bfb3759f6d2436ce0e62)`func does not gather local words`

[12:59](#msg5808bfb6b827179842dd0663)why is that?

rebolek

[13:00](#msg5808bff4e897cd3a71e01c48)It’s mostly for historical reasons, `func` does not gather them, `function` does.

maximvl

[13:01](#msg5808c01d80020cc608fa3816)historical reasons? Red is not 30 years old to be affected by historical reasons

[13:01](#msg5808c0472189c68f420491ec)are there any other differences between `func` and `function` ?

DideC

[13:04](#msg5808c0da48292577613f9b4a)Rebol historical reasons (understand: compatibility).

[13:08](#msg5808c1c7759f6d2436ce16a3)&gt; are there any other differences between `func` and `function` ?

Use `help`.

maximvl

[13:11](#msg5808c288b827179842dd1191)do we really want compatibility with Rebol?

[13:12](#msg5808c2c948292577613fa4e5)I can see a problem here - people will use `func` because it is simply shorter, and all variables will leak into global context

[13:15](#msg5808c381759f6d2436ce1efb)so the question actually is do we have any \_good_ reason to not replace `func` with `function`?

dockimbel

[13:47](#msg5808caf52189c68f4204c3ea)@maximvl `func` is the lowest level constructor for functions, it requires you to declare local words yourself. `function` is a higher-level constructor (it has a different behavior in Rebol), which gather the local words for you using an heuristic (gathering set-words from the function's body), which can sometimes have unwanted effects (so to be used carefully). `function` is just a wrapper over `func`.

maximvl

[15:28](#msg5808e2b74829257761404901)@dockimbel I see, so `set` will also create a global binding inside `function`

rebolek

[15:29](#msg5808e2d8e897cd3a71e021f0)Yes. Or you can use `/extern`

[15:35](#msg5808e4245636a5602eef4ac4)But remember that it will create global binding only if that word isn’t local:

```
red>> bla
*** Script Error: bla has no value
*** Where: catch
red>> f: function [][bla: none set 'bla 1]
== func [/local bla][bla: none set 'bla 1]
red>> f
== 1
red>> bla
*** Script Error: bla has no value
*** Where: catch
```

maximvl

[15:39](#msg5808e5332189c68f42054c9d)so, if I'm explicitly writing `/local x`, when `x` will be local in any case?

rebolek

[15:42](#msg5808e5dde897cd3a71e02261)Yes. But you can access global `x` with `system/words/x`

dander

[16:38](#msg5808f2f4b17b667961dcf6fc)@maximvl , @rebolek It still seems to work when changing `func` to `function` (and actually seems better this way because it doesn't leak into the global namespace), presumably because it creates a new context object each time afun is called? I don't know if this is a good way of doing something like this. To be honest, I don't really know what I am doing. Just experimenting :smile:

rebolek

[17:04](#msg5808f928e897cd3a71e02538)@dander of course it works, `context` always creates new context and old one is not destroyed. But with `func` version, `c` leaks and holds last context.

dockimbel

[17:04](#msg5808f93036d64226368da6be)@maximvl Correct, except for already locally defined words.

[17:08](#msg5808f9f98d2babbd088eef4d)@dander You're doing it correctly, with what the language currently provides. Though, a `closure!` type or a `[closure]` attribut to functions would probably allow a more efficient internal implementation.

geekyi

[22:02](#msg58093edab827179842df63aa)@maximvl :point\_up: \[October 20, 2016 6:11 PM](https://gitter.im/red/help?at=5808c288b827179842dd1191) in Rebol3 (and maybe 2) the situation was worse :smile: see the wiki

[22:05](#msg58093fb0b827179842df668b)\[this section](https://github.com/red/red/wiki/Differences-between-Red-and-Rebol#function-vs-funct) and other pages on wiki

## Friday 21st October, 2016

meijeru

[09:00](#msg5809d9378d2babbd08920e00)Urgent question: does a base face accept keypresses? If not, how do I capture keys (e.g. delete key) on a drawing that is rendered in a base face?

dockimbel

[09:02](#msg5809d9c1759f6d2436d24c35)@meijeru You need to put the focus on the face to get key events, otherwise, key events are sent to the window:

```
view [b: base on-key [print event/key] do [self/selected: b]]
```

meijeru

[11:30](#msg5809fc63b827179842e1d56f)Thanks, but I also need the mouse position (event/offset) and View tells me this is `none`. How come?

dockimbel

[11:35](#msg5809fd90759f6d2436d2de4a)@meijeru Feature not implemented. You can open a ticket for it, it's just a few lines to add. You'll get the mouse position relative to the focal face.

meijeru

[11:50](#msg580a00fcb17b667961e0f544)I have opened the ticket. Other question: is focus only relevant for key events? And how do you change the focus other than through setting win/selected?

pekr

[12:18](#msg580a07928d2babbd0892b865)Focus system and/or tabing can get quite complicated. Some systems in Rebol had something like `tabbable?`property, to distinguish, if the item can actually get focus, or something like that. Some systems allow even the focus nesting, so that you have to press ESC to get out of that ... might be related to also how you wish arrow keys to works, etc.

dockimbel

[12:20](#msg580a07f3b827179842e1f30e)@meijeru Yes, relevant for key events only. You change it by setting `/selected` property or by clicking/tabbing to another focus-enabled face on screen. Tabbing support is not ready yet.

meijeru

[13:22](#msg580a169736d642263691bbce)I see. Which types of faces are focus-enabled?

maximvl

[13:40](#msg580a1ae58d2babbd08931209)@geekyi ok, do `x:` and `set 'x` use same logic somewhere in low level code?

[13:51](#msg580a1d5036d642263691e178)I'm confused with functions calling order/rules here: https://github.com/red/red/wiki/Guru-Meditations#compiled-versus-interpreted-behaviors

[13:51](#msg580a1d7436d642263691e29a)`replace` changes elements inside block

[13:52](#msg580a1d88b17b667961e16aef)why does it start evaluate functions after moving to `interpreter` mode?

DideC

[14:04](#msg580a2062b17b667961e17a4f)I don't have the technical explanation.  
But, Carl Sassenrath claim that a Rebol script can't be compiled, due to it's dynamic nature. Dockimbel show that it's not completly true, but compiled programs "lost" some of their dynamic behaviour.  
I guess JIT will handle this kind of problem one day.  
But we have to leave with them for now.

greggirwin

[15:24](#msg580a3343278cc54c6f57b235)It would be good to document the details of why it works that way, since it isn't clear.

maximvl

[15:31](#msg580a34c2015db84e6fb416b9)@greggirwin I just checked `replace` source

[15:31](#msg580a34d3b6fc192f562a4506)the line `insert pos value`

[15:31](#msg580a34df577f2c2279050db6)if the value is a `function!`, will it be evaluated?

[15:32](#msg580a3513015db84e6fb417de)oh

[15:32](#msg580a3523a3bbf12d5624b5b2)

```
red>> f: func [x y] [append x y]
== func [x y][append x y]
red>> f [] does [print "yo yo"]
yo yo
== [unset]
```

[15:33](#msg580a35425af5969e7eea1aca)this is something completely different from what I used to

[15:33](#msg580a355ca3bbf12d5624b691)changing `f` to `append x :y` works though

rebolek

[15:34](#msg580a35725636a5602eef68a7)@maximvl yes, it will be evaluated

[15:34](#msg580a3586e897cd3a71e03e99)

```
red>> add add 1 2 3
== 6
```

maximvl

[15:34](#msg580a359c577f2c2279051165)so

[15:35](#msg580a35b6b6fc192f562a4a25)@rebolek does it mean that `add` is exactly the same thing as `y` in my example above?

[15:35](#msg580a35db015db84e6fb41bc3)ok, this starting to blow my head, I know this feeling

[15:37](#msg580a3638b6fc192f562a4c39)usually in a language there is a syntax distinction between a value and function call

rebolek

[15:37](#msg580a3639e897cd3a71e03eb0)@maximvl yes, it’s the same

maximvl

[15:37](#msg580a364a278cc54c6f57c07b)so `a` is a value, while `a()` or `(a)` is a call

rebolek

[15:37](#msg580a364fb813566a4c6e7f54)Do not look at it as value and function call

[15:38](#msg580a365c714642af22cc884e)everything is value

[15:38](#msg580a3664b813566a4c6e7f56)and that value gets evaluated

[15:38](#msg580a3672e897cd3a71e03ec5)sometimes it evaluates to function

greggirwin

[15:38](#msg580a367f56121b9c7ea92303)In Red, it's all about evaluation in a given context. You can control evaluation (e.g. passing a func as a get-word! to prevent evaluation).

maximvl

[15:39](#msg580a36af5af5969e7eea20da)@rebolek and when it evaluates to a function - function is called

[15:39](#msg580a36b95af5969e7eea2119)right?

greggirwin

[15:39](#msg580a36bb278cc54c6f57c261)Correct.

maximvl

[15:40](#msg580a36dea3bbf12d5624bc52)and I guess errors in rebol work in the same way

rebolek

[15:40](#msg580a36dfb813566a4c6e7f81)@maximvl yes

[15:40](#msg580a36eee897cd3a71e03edc)`error!` is just another datatype

maximvl

[15:40](#msg580a36f356121b9c7ea925ec)if value evaluated to error, error happens

rebolek

[15:40](#msg580a36fa714642af22cc885c)yes

dockimbel

[15:43](#msg580a378c015db84e6fb42402)@maximvl As Gregg mentioned, you need to prevent unwanted intermediate evaluation of the passed function:

```
red>> f: func [x :y] [append x :y]
== func [x :y][append x :y]
red>> f [] does [print "yo yo"]
== [print "yo yo"]
```

[15:43](#msg580a37a25af5969e7eea24a0)@maximvl Error: correct.

maximvl

[15:45](#msg580a381aa27d2220790e0956)@dockimbel you work with Rebol for a long time, do you realize that there are nearly no languages doing same thing?

[15:45](#msg580a3835b6fc192f562a5418)I don't mean it's bad or something

[15:47](#msg580a387f56121b9c7ea92be3)this is something that should be explained in detail to newcomers

greggirwin

[15:50](#msg580a394b56121b9c7ea92fc1)@maximvl, it's a bit of an advanced concept, so many newcomers won't encounter it for a long time. Functional programmers will, of course, but they should be able to grasp it with a little explanation, as we just did here. Someone want to put it in a blog post on the new Red blog Arie, et al are doing?

[15:51](#msg580a3968278cc54c6f57cc81)We will also work on primer docs for people coming from various backgrounds.

maximvl

[15:55](#msg580a3a78a27d2220790e14bc)good, because until this point I wasn't realizing Redbol is so different

[15:56](#msg580a3a98015db84e6fb43161)@greggirwin new red blog?

greggirwin

[15:56](#msg580a3abd015db84e6fb431fc)http://redlanguageblog.blogspot.nl/

[15:57](#msg580a3af7015db84e6fb4330d)That's what makes Redbol so amazing. It \*looks* like something you know, but is very different under the hood. You can use is effectively without ever understanding that though. It scales with your understanding and needs.

maximvl

[16:04](#msg580a3c9b278cc54c6f57dccd)@greggirwin thanks, now it's friday beer time :)

greggirwin

[16:13](#msg580a3eb256121b9c7ea94918)http://www.rebol.com/article/0103.html

dockimbel

[17:09](#msg580a4bd3278cc54c6f581394)@maximvl Indeed, evaluation rules need to be fully covered in the Red documentation. Happy beer time! ;-)

[17:26](#msg580a4fd3a27d2220790e63e4)@maximvl See \[Get Arguments](http://www.rebol.com/docs/core23/rebolcore-9.html#section-3.3) section from Rebol manual.

## Saturday 22nd October, 2016

this-gavagai

[01:33](#msg580ac1eb278cc54c6f59c59e)@greggirwin and everyone else who has kindly responded to my earlier question about how to best represent entities in a simulation: Apologies for being so slow in getting back to you all. I've been playing extensively with the concepts you offered me, and it has been both exciting and fun. There's a lot to digest, and I am still processing a lot of it. I will be back at some point soon with thoughts and undoubtedly more questions! Thanks again.

[01:38](#msg580ac311577f2c227906fe9b)Also, I've been jotting down my thoughts as I go. If it would be useful to other beginners, I will do my best to consolidate them into a "Design principles of Red, from the outside" document of some sort.

dockimbel

[05:02](#msg580af2d0015db84e6fb67729)@this-gavagai Such document would be most helpful to help other developers.

greggirwin

[06:38](#msg580b0967a3bbf12d562726f3)@this-gavagai +1 on notes. Those of us who have forgotten what we didn't know sometimes find it hard to explain things clearly. Very glad if this is all helpful.

## Sunday 23th October, 2016

maximvl

[10:34](#msg580c9243b6fc192f5630f57a)@dockimbel thanks for the link, however I used to use `'a` in arguments list to prevent evaluation, is it different from `:a` or are they the same?

PeterWAWood

[10:53](#msg580c96c7278cc54c6f5eee03)@maximvl

```
'a
```

, a lit-word!, evaluates to a word.

```
:a
```

, a get-word, evaluates to the contents of the value bound to

```
a
```

.

```
red>> a: 1
== 1
red>> do first ['a]
== a
red>> do first [:a]
== 1
```

[11:04](#msg580c992b5af5969e7ef15b0b)For many values, there is no difference when they are evaluated via a word or a get-word. e.g.

```
red>> a
== 1
red>> :a
== 1
```

[11:06](#msg580c99b1015db84e6fbb2bca)The difference with function! values is that when evaluated via a word, the function is executed where the function! value is returned when evaluated via a get-word.

```
red>> f: func [] [print "executed"]
== func [][print "executed"]
red>> f
executed
red>> :f
== func [][print "executed"]
```

(You probably knew this anyway.)

maximvl

[11:08](#msg580c9a3f015db84e6fbb2d57)@PeterWAWood yep, I'm asking about difference in arguments specs: `func ['a]` vs `func [:a]`

[11:13](#msg580c9b685af5969e7ef161ab)

```
red>> f1: func ['a] [probe a]
== func ['a][probe a]
red>> a: 5
== 5
red>> f1 a
a
== a
red>> f2: func [:a] [probe a]
== func [:a][probe a]
red>> f2 a
a
== a
```

[11:13](#msg580c9b6e015db84e6fbb308e)I don't see any difference here

PeterWAWood

[11:50](#msg580ca3f0305a10335db278c6)Which a are you evaluating in probe a?

[11:51](#msg580ca42b5af5969e7ef18302)What happens if your function argument is :b:

[11:51](#msg580ca4455af5969e7ef1831f)":b"

[11:54](#msg580ca506fb138dce65eecee8)Sorry, that's not relevant. (I shouldn't try to answer from my phone 🙁)

dockimbel

[12:00](#msg580ca674015db84e6fbb4f64)@maximvl No difference in Red, like in Rebol3, though, the Rebol2 behavior looks more useful, so we may switch back to it.

maximvl

[20:33](#msg580d1e8eb6fc192f5632cd5b)@dockimbel what was behavior in Rebol2?

greggirwin

[22:27](#msg580d3970fb138dce65f0e382)

```
>> f1: func ['a] [probe a]
>> a: 5
== 5
>> f1 a
a
== a
>>  f2: func [:a] [probe a]
>> f2 a
5
== 5
```

PeterWAWood

[23:20](#msg580d45d1fb138dce65f108c0)@dockimbel There is also a difference in how type checking is applied between Rebol 2 and Red:

Red

```
red>> f: func [:fun [function!]] [fun]
== func [:fun [function!]][fun]
red>> f1: func [] [print "running"]
== func [][print "running"]
red>> f f1
*** Script Error: f does not allow word! for its :fun argument
*** Where: f
```

Rebol2

```
>> f: func [:fun [function!]] [fun]
>> f1: func [] [print "running"]   
>> f f1                            
running
```

## Monday 24th October, 2016

dockimbel

[05:35](#msg580d9d8ffb138dce65f1fc35)@PeterWAWood That behavior difference is only because get-arguments in Red do not retrieve the word's value like in Rebol2.

## Wednesday 26th October, 2016

maximvl

[11:42](#msg581096bf5a1cfa016e4ad23c)how do I get keys from the object?

DideC

[12:13](#msg58109df20e25dbfa1163018d)What do you mean by "keys" and by "object" ?

rebolek

[12:38](#msg5810a3e30084729879800ae0)@maximvl I think you are looking for `words-of my-object`

maximvl

[12:42](#msg5810a4c05a1cfa016e4b12bf)@rebolek exactly, thanks!

[12:42](#msg5810a4d00e25dbfa1163202b)@maximvl thinks `words-of` name is a bit misleading

[12:43](#msg5810a4dd482c168b22b9b416)I was looking for `keys` or `fields`

rebolek

[12:43](#msg5810a50b0084729879800b0a)It’s not misleading actually. They really are words that hold values.

[12:44](#msg5810a517997ba838692ea948)And you can get that values with `values-of`.

[12:45](#msg5810a5630084729879800b14)You just have to get used to the redbol terminology.

maximvl

[12:46](#msg5810a5ac806316005dc0dc3b)yep, I see

## Saturday 29th October, 2016

redredwine

[04:12](#msg581421bf5a1cfa016e5b24c3)Hello, I am new to red. I downloaded the red-061.exe on my windows 10 machine. and ran windows-061 -- cli , it gave me access denied (although i ran it as an administrator). when I tried running just windows-061.exe it does nothing, I don't get any red console.  
was wondering if anyone has come across same problem before, and could help me get started.

[04:16](#msg581422a47b15d16e55be1726)Directory of F:\\red

10/27/2016 10:38 PM &lt;DIR&gt; .  
10/27/2016 10:38 PM &lt;DIR&gt; ..  
10/25/2016 09:29 AM 968,539 red-061.exe  
1 File(s) 968,539 bytes  
2 Dir(s) 100,930,060,288 bytes free

F:\\red&gt;red-061.exe --cli  
Access is denied.

F:\\red&gt;

[04:17](#msg581422f18ed1c0ff5c3ded16)F:\\red&gt;red-061.exe

F:\\red&gt;

qtxie

[04:30](#msg581425d2c3569a036e2e78ac)@redredwine Maybe your anti-virus program delete it.

[04:30](#msg581425e9806316005dd079ed)See here: https://github.com/red/red#anti-virus-false-positive

redredwine

[04:36](#msg5814274a8ed1c0ff5c3df9e8)my antivirus (avast + malwarebytes) did not raise any alert while i was running the commands above. also, when you say "maybe your anti virus delete it" , what is it deleting exactly ? the red-061.exe is still in F:/red/ folder.

Mufferaw

[04:38](#msg581427c7482c168b22c96724)@redredwine I had a problem with the Windows Defender before, it identified red.exe as some kids of virus

[04:39](#msg58142811806316005dd0801f)No, I'm wrong, it identified one of my compiled red programs as a virus

## Monday 31st October, 2016

Mufferaw

[09:42](#msg58171217806316005ddb0524)I'm trying to use parse for the first time, I want to parse a block that could have things in a different order.

```
[RedBall sphere radius 10 position 0 0 5]
[RedBall sphere position 0 0 5 radius 10]
```

and my parse rule looks like this so far

```
rule: [
  word!
  'sphere
  any [set ver 'radius (print ver) | set ver 'position (print ver)]
  any [set int integer! (print ["Integer" int]) | float! (print ["float" ver])]
  any [set ver 'radius (print ver) | set ver 'position (print ver)]
]
```

After radius there should be one number (int or float) but after position there should be 3 numbers. Should it be something like  
`if radius [more rules]`  
or am I going about this completely the wrong way?

geekyi

[09:49](#msg58171392c3569a036e397f29)@Mufferaw unordered data... tricky. I was thinking a recursive sub rule after `'sphere`, but then, what would you do about duplicates?

[09:50](#msg581713de806316005ddb0e91)

```
radius-or-position: [ radius | position | radius-or-position ]
```

Mufferaw

[09:58](#msg581715cc482c168b22d46389)@geekyi Maybe I should just keep it simple and not try anything too fancy until I understand a bit more about parse

dockimbel

[10:00](#msg5817162a8ed1c0ff5c48b086)@Mufferaw Something like this should work (untested):

```
radius: pos: none

rule: [
	word!
	'sphere 2 [
		if (not radius) 'radius set radius integer! (?? radius)
		| if (not pos)  'position pos: 3 integer! (print ["position:" copy/part pos 3])
	]
]
```

[10:01](#msg5817166c806316005ddb1b74)Out-of-order tokens are difficult to parse, we should provide something in Parse to help with that use-case.

geekyi

[10:07](#msg581717ce0e25dbfa117db242)@dockimbel doesn't work with the 2nd example.. I'll see if I can try my hand

[10:07](#msg581717e30e25dbfa117db275)@Mufferaw maybe, maybe not :wink:

[10:08](#msg5817181c482c168b22d4717b)@Mufferaw There is a wikibook about rebol3 which \*massively* helped me to understand parse

PeterWAWood

[10:10](#msg5817188583a2008d22f07c3c)

```
radius: ['radius set ver number! (print [name "radius" ver]) ]
position: ['position set v1 number! set v2 number! set v3 number! 
			(print [name "position" v1 v2 v3 ])]

rule: [
	set name word! 'sphere
	any [radius | position ]
]

parse [RedBall sphere radius 10 position 0 0 5] rule
parse [RedBall sphere position 0 0 15 radius 20] rule
```

&gt;

[10:19](#msg58171aab7b15d16e55c927b5)Perhaps this is a little better:

```
radius: ['radius set ver number! ]
position: ['position set v1 number! set v2 number! set v3 number! ]

rule: [
	set name word! 'sphere
	any [radius | position ]
	to end (print [name "sphere of radius" ver "at position" v1 v2 v3])
]

parse [RedBall sphere radius 10 position 0 0 5] rule
parse [RedBall sphere position 0 0 15 radius 20] rule
```

[10:20](#msg58171ad18ed1c0ff5c48c9b0)It gives this result:

```
RedBall sphere of radius 10 at position 0 0 5
RedBall sphere of radius 20 at position 0 0 15
```

Mufferaw

[10:21](#msg58171b2d482c168b22d48130)@PeterWAWood That certainly does help! @dockimbel @geekyi I think I should definitely read that wikibook, is this the one you mean https://en.wikibooks.org/wiki/REBOL\_Programming/Language\_Features/Parse ?

geekyi

[11:06](#msg581725a7806316005ddb655e)@Mufferaw yeah, it's the end of the month, so my internet is very slow.. \*crawling*

[11:06](#msg581725cfc3569a036e39d8e0)even loading a page takes a really long time

## Tuesday 1st November, 2016

Mufferaw

[03:59](#msg5818133c27c3e02625e7b9cb)

```
[Suppose we have a block and
it has two lines of text, each having a different number of words]
```

Is there a way to break that into two blocks? The newline character doesn't seem to work with blocks and if I convert the whole thing to a string and split it I can't change it back to a block.

greggirwin

[06:16](#msg58183323c3569a036e40a7a0)

```
red>> blk
== [Suppose we have a block and 
    it has two lines of text each having a different number of words
]
red>> find-new-line: func [block] [
[        forall block [if new-line? block [return block]]
[        none
[    ]
== func [block][forall block [if new-line? block [return block]] none]
red>> pos: find-new-line blk
== [
    it has two lines of text each having a different number of words
]
red>> pt-1: copy/part blk pos
== [Suppose we have a block and]
red>> pt-2: copy pos
== [
    it has two lines of text each having a different number of words
]
```

I have a few other line marker related funcs, though they haven't seen much use.

[06:16](#msg5818334a83a2008d22f792cf)

```
find-new-line: func [block] [
    forall block [if new-line? block [return block]]
    none
]
```

[06:17](#msg5818337c83a2008d22f793df)Another possible case for `split` to handle.

Mufferaw

[06:27](#msg581835bc806316005de2ad43)@greggirwin Thanks!

dsgeyser

[08:02](#msg58184c1b0e25dbfa118511b1)Interesting ideas at worrydream.com/LearnableProgramming/

dockimbel

[08:47](#msg5818568b0e25dbfa11854319)@dsgeyser Bret Victor's work is well-known, you should watch its famous \[Inventing on Principles](https://www.youtube.com/watch?v=PUv66718DII) video.

dsgeyser

[09:21](#msg58185eae27c3e02625ea44bb)@dockimbel Do you think it is possible to enable visualization of data in Redbol, it being a messaging/data language?

dockimbel

[10:01](#msg581868049411972d60ae4a55)@dsgeyser Could you elaborate on "enable visualization of data"?

greggirwin

[15:42](#msg5818b7e00e25dbfa11878309)@dsgeyser, visualizing with Red should be easier than almost any other heterogeneous type of data, whether as pure data (e.g. graphs and charts) or in the context of programming.

dsgeyser

[16:27](#msg5818c2570e25dbfa1187c271)@greggirwin I am finding it hard to express to Doc the intention, but I see you have understood it. Is it possible to make a visual representation of the data and see it change over time with typical feedback of what is actually being computed at that instance. Maybe create an object of the data to serve that purpose. I can't imagine a better subject than Red to make this possible.

greggirwin

[16:35](#msg5818c4389411972d60b08cb5)There are all kinds of data. In this case, I assumed you meant "application state" based on the Bret Victor link. Since Red is data, it's easy to do this kind of thing. Doc's live-coding example, extended by Didier, shows how easy this is. And it was short work to add "time travel" to my port of the micro-Paint app from R2. Even the little \*-lab apps that have been done are steps in this direction.

dsgeyser

[16:36](#msg5818c49b49891fe74228ae6a)They say that GUI design is the hardest part of software development. Still unchanged since the Mac introduced the concepts. Teaching Red to the next generation in the best possible way will probably ensure widespread use.

greggirwin

[16:38](#msg5818c50ac3569a036e44fa29)My current feeling is that the hardest part of software development is balancing change and patience.

dsgeyser

[16:39](#msg5818c55927c3e02625ecb8e5)@greggirwin What about program flow as well?

greggirwin

[16:48](#msg5818c745c3569a036e450c4c)Well, we make some things--most things--harder than they need to be. Some problems \*are* hard, and some programs \*will be* complex, but the vast majority of things we write shouldn't be. This is where languages targeted at application domains (DSLs) can help. But they are not required to be very, very specific. DSLs with a wider scope are not "wrong" in any way, and mapping languages would make an interesting visualization. What were they designed for? What are they really used for? If we zoom out to view languages by primary paradigm, are there some that aid program flow, if program flow is the hard part? Do others make GUIs easy if that's your main hurdle?

dsgeyser

[16:48](#msg5818c750806316005de5f373)Wouldn't Red's freeform nature hinder most of the things Bret demonstated in the videos, or make difficult/impossible? Abstraction?

greggirwin

[16:48](#msg5818c777806316005de5f4e1)I haven't re-read the article yet. Can you give me an example?

[16:51](#msg5818c8110e25dbfa1187ea1f)These are great things to think about. As Mr. Victor points out, we often solve the wrong problem, or create something that doesn't address the problem at all, but sounds like it does.

[16:56](#msg5818c955cde075e6560ac9b6)Considering program flow, is there a "best way" to do that? Is it the same for functional, OO, or imperative, or dataflow models? Is immutable data the answer? Should we all be starting with FSMs and STTs? Formal methods? It's a spectrum, and every combination of program, team, environment, and requirements has a different answer. I guess that's the other "hardest part" of software development. :^)

dsgeyser

[17:00](#msg5818ca1f806316005de60478)Isn't doc mostly leaning towards dataflow model, seeing that it simplifies design and changes?

[17:06](#msg5818cbb3c3569a036e4529ea)I found the Livecode environment to be very helpful and easy to manage code. But its OO based. Whats your view on OOP?

greggirwin

[17:07](#msg5818cbcc0e25dbfa1188020a)Only he can say. My view is that Red has a core strength in language construction, but is otherwise paradigm agnostic. And when I say "language construction", I don't mean just at the level of DSLs, or even GPLs, but in building the language you use to implement your program. This manifests itself very clearly sometimes, where `parse` is leveraged for all kinds of processing you might not initially consider it for.

[17:12](#msg5818cd159411972d60b0c6fe)I did OOP for quite a number of years. I'm older, and perhaps jaded or cynical now, but let's call me pragmatic instead. Tools are tools are tools. Some are perfectly suited for one task, but totally inappropriate for others. There is no silver bullet.

Let me ask this: If you could have only one tool, and it was designed to do one thing really well, what would you want that one thing to be?

dsgeyser

[17:26](#msg5818d03727c3e02625ecffbf)Red being so flexible and with nearly endless capabilities, I think a tool that provides me with introspection into the code and allows me to decompose/recompose code to effectively explore all the possibilities. And allow me to go back and forth, kind of like a learning tool. The console provides some of that, but it is limiting. Somewhat like when a writer faces a blank piece of paper.

greggirwin

[17:29](#msg5818d10727c3e02625ed0510)Do you think you (or someone) can build the tool you want with Red?

[17:30](#msg5818d12f49891fe74228fef6)And the console is, very much, a blank piece of paper. :^)

dsgeyser

[17:45](#msg5818d49c83a2008d22fb2de1)I believe it is possible. I wouldn't mind if its loose standing code providing essential ways to streamline code development.

[17:48](#msg5818d56a9411972d60b0fd35)but I get sidetracked because of limitations in inspecting for instance the state and flow. I guess no real meaningful conversation in the console.

[17:54](#msg5818d6bc83a2008d22fb3ca3)Hence the visual representation of data, which would a good indication of where you are and possible ways to continue. I don't mind playing, but that could also be disruptive.

greggirwin

[17:54](#msg5818d6c327c3e02625ed2a4e)Red is a tool for building tools. Remember that it's just the raw language right now. There is little shiny tooling yet as the priority is to make Red self-hosting (and also what investors require).

[18:06](#msg5818d9b89411972d60b11936)Coming back to change and patience, a lot of these things sound good, and demo well, but all the modern things I've seen have been toys and experiments, largely based on Bret Victor's inspiration. What we don't know (I'd love to see things) is how they work in practice. Like Mr. Victor, I'm a huge fan of Logo and Papert's work. Specialized languages (e.g. Processing, Mathematica) and frameworks (e.g. for audio software development and plug-ins) are proven. This comes back to domain specificity. That we can do easily. To emulate his active drawing/livecode is just treating your script as data and using `do/next` (basically). Generalizing this is much harder, and where the Eve/spreadsheet/dataflow model comes in.

dsgeyser

[18:37](#msg5818e0f327c3e02625ed69c9)Is there a difference between Red and Smalltalk objects, seeing that both are messaging languages?

greggirwin

[20:43](#msg5818fe6683a2008d22fc40c5)Yes, quite different. In Smalltalk you send messages to objects. Red objects are basically a way to group words in a shared context. "Messaging" means something very different in Red. It relates to the exchange of information between people and machines.

## Wednesday 2nd November, 2016

TimeSlip

[03:43](#msg581960d327c3e02625eff68c)Is there a keyword in the red header that I can set to name the compiled output file? I like to use "." in the actual filename but then the compiler just uses the first part of the name.

dockimbel

[03:59](#msg581964b5cde075e6560decec)@TimeSlip Have you tried using the `-o` command-line option?

TimeSlip

[04:00](#msg581964c99411972d60b3fd06)ah, of course not Doc. :-) Thanks

[04:20](#msg5819697949891fe7422c1884)@dander Thanks. As Doc suggested: Red -o nameofprogram.exe -c sourcedoc.red  
Works like a charm!

Rebol2Red

[13:29](#msg5819ea2883a2008d2200ec5b)I don't understand what collect/keep does.

```
parse "first second third" [thru "first " copy second to " third"]
print second
second: parse "first second third" [collect ["first " keep to " third"]]
print second
```

Why/when use collect/keep?

pekr

[13:39](#msg5819ec980e25dbfa118dee1e)Anything you mark for a keep, gets added to the end result

Rebol2Red

[13:44](#msg5819eda5cde075e65610b2f9)Thanks, is there some documentation on it?

pekr

[13:44](#msg5819edd6c3569a036e4b4844)http://www.red-lang.org/2013/11/041-introducing-parse.html

[13:46](#msg5819ee18c3569a036e4b49ac)If you would run in a loop and would like to get a result, you could as well use some code like (append result parse-var), or you just use keep marker and it adds to the resulting block ...

[13:46](#msg5819ee2fcde075e65610b65e)It is mostly a helper, you don't need to use it necessarily ...

Rebol2Red

[13:50](#msg5819ef1783a2008d220110af)I understand your explanation better than the documentation which i red a while ago. Thanks again.

## Thursday 3th November, 2016

TimeSlip

[00:55](#msg581a8aff2d4796175f386799)Is there a way to set panels so that they don't have a space/y pad and butt up against each other?

```
view/no-wait layout [  
	space 0x-2 
	panel  [ 
		space 0x-2 
 		p1: panel aqua [
 			p1a: panel white [ 
 				space 0x-2 
 				t1: text "hello" 
 				button "hi" [] 
 			] 
 		return 
 		p2: panel red  [
 			pi2: panel blue [ 
 				space 10x-2 
 				text "here is"  
 				return 
 				button "world" [] 
 			] 
 		]
 	] 
 	]	 
] 
center-face pi2 p2  
do-events
```

greggirwin

[05:43](#msg581ace6445c9e3eb43f0260b)`Origin`

```
view/no-wait layout [  
	space 0x0
	panel  [ 
		space 0x0
		origin 0x0
		p1: panel aqua [
			origin 0x0
			p1a: panel white [ 
				origin 0x0
				space 0x0
				t1: text "hello" 
				button "hi" [] 
			]
			return 
			p2: panel red  [
				origin 0x0
				pi2: panel blue [ 
					origin 0x0
					space 0x0
					text "here is"  
					return 
					button "world" [] 
				]
			]
		]
	]     
] 
center-face pi2 p2  
do-events
```

DideC

[09:59](#msg581b0a8545c9e3eb43f1442b)I miss the `tight` R2 VID keyword. Having to set `origin 0x0` in all subpanels is boring.

dockimbel

[11:07](#msg581b1a7a2d4796175f3b0bc3)@DideC Agreed, it would be a useful addition. You are welcome to push a PR for it, or open a wish ticket.

DideC

[11:15](#msg581b1c472d4796175f3b1618)Yes, but it belongs in general to the "words for a specific style" thing, not just `tight`. So extending per style VID dialect (in `fetch-options`).  
I would also like a way to extend default VID dialect without having to patch it (in `layout`).

TimeSlip

[14:20](#msg581b4793eed0c3125f3019eb)@greggirwin Ah, thanks. But of course, right?

geekyi

[15:56](#msg581b5e41aa8f8c4b328e86de)@DideC so `view/tight` is only for top level container..

Mufferaw

[16:28](#msg581b65c3e462097a3003eff9)I have a block with a bunch of floats! that I want to pass to a routine, but in the routine, how can I access the values in that block?

Rebol2Red

[16:45](#msg581b69b1c2f2cf7275c6b8df)@Mufferaw You mean something like this?

```
test: func [
	block [series!]
][
	foreach item block [
		print item * 2 ; do something with each item
	]
]
block: [2.3 4.6 7.8 3.1 8.7 12.3 10.2]
test block
```

Mufferaw

[16:51](#msg581b6af8e462097a300414dc)@Rebol2Red No, I am trying to pass the red block to a red/system routine and I don't know how to access the things in the block. I searched github but couldn't find anything, I'm not even sure it's possible

Rebol2Red

[16:55](#msg581b6be7c2f2cf7275c6c629)Sorry, i thought you asked about a function (in some basic language routines are called functions, that's why)

Mufferaw

[16:56](#msg581b6c47e097df7575673132)@Rebol2Red I appreciate the reply, I should've worded my question a little better.

geekyi

[16:57](#msg581b6c700d42ea911cbdd224)@Mufferaw some code might have helped?

[16:58](#msg581b6ca1b4046d90642b8984)I also want to get started with red/system, and build some getting started tutorials, etc

[16:59](#msg581b6cd40d42ea911cbdd244)For those cases where the official reference is not enough

Mufferaw

[17:09](#msg581b6f3e2d4796175f3d2dfe)Here is what I'm trying to do

```
convert: routine[
	ob [block!]
	ob-len[integer!]
	/local len i s
][
       ob ; ????
]

Sblock: [10.0 0.0 0.0 -1.0 2.0 1.0 0.2 0.2 0.0 10.0 0.0 0.0 -1.0 1.0 1.0 0.2 0.2 0.0]
convert Sblock length? Sblock
```

rebolek

[18:15](#msg581b7ea50d42ea911cbddbae)@Mufferaw it’s possible, but not trivial. You have to pass red values with `red-` prefix (so as `red-block!`) and then use R/S functions defined in `%red/runtime/datatypes/block.reds` to work with that block.

Mufferaw

[18:20](#msg581b7fe545c9e3eb43f41e83)@rebolek thanks, I'm taking a look at that now

greggirwin

[18:20](#msg581b7fece097df757567b7e2)`Routine` handles that automatically, but I had the same thought Bolek.

rebolek

[18:24](#msg581b80fbb4046d90642b9381)Yeah, routine may handle passing red values without prefix automatically, I may be wrong here, I haven’t worked with R/S recently.

greggirwin

[18:25](#msg581b81222d4796175f3da08c)I haven't done much with routines either, but this works.

```
convert: routine [
	ob [block!]
	ob-len [integer!]
	return: [integer!]
	/local len i size
][
	size: block/rs-length? ob
	return size
]

Sblock: [10.0 0.0 0.0 -1.0 2.0 1.0 0.2 0.2 0.0 10.0 0.0 0.0 -1.0 1.0 1.0 0.2 0.2 0.0]
print convert Sblock length? Sblock
```

Mufferaw

[18:31](#msg581b826ae097df757567ca74)@greggirwin @rebolek I don't need to do anything too fancy with the block, my main goal is just to send the floats to my routine but the number of floats may change, so I thought I could use block!

greggirwin

[19:55](#msg581b963445c9e3eb43f4a623)You can, of course. Check out how natives are implemented that work against blocks. It's just a bit of effort. What is the reason for using a routine, as opposed to straight Red? Or is it just to learn how?

## Friday 4th November, 2016

dockimbel

[03:21](#msg581bfebb45c9e3eb43f6add1)@Mufferaw Here is something to help you get started:

```
convert: routine[
    ob [block!]
    ob-len[integer!]
    /local len i s value tail fl
][
	value: block/rs-head ob
	tail:  block/rs-tail ob
	
	while [value < tail][
		fl: as red-float! value
		probe fl/value
		value: value + 1
	]
]
```

Mufferaw

[04:30](#msg581c0ee9e462097a30078150)@dockimbel Thanks, that's got me pointed in the right direction

[04:35](#msg581c10032d4796175f407f97)@greggirwin for my 'learning exercise' I wrote a raytracer program in red/system, now I've made a GUI for it which has a 'scene' input area (that's why I had all those questions about parse earlier). The next step is to send the data from the gui to the red/system routines .

[04:54](#msg581c148231c5cbef43b3d341)@dockimbel It works now, thanks again, here is the updated function

```
convert: routine[
    ob [block!]
    ob-len[integer!]
    /local len i s value tail fl head
][
	
		s: GET_BUFFER (ob)
		
		head:  s/offset
		value: head
		tail:  s/tail

    while [value < tail][
        fl: as red-float! value
        probe fl/value
        value: value + 1
    ]
]
```

dockimbel

[04:56](#msg581c14f22d4796175f4094e9)@Mufferaw You're welcome. Right, that's the optimized way to extract the beginning and end of the block. ;-)

## Monday 7th November, 2016

WiseGenius

[03:33](#msg581ff5eec2f2cf7275db9b0f)When using `call`, how does one specify the working directory? `change-dir` doesn't seem to affect it.

qtxie

[03:43](#msg581ff84c31c5cbef43c4ba57)@WiseGenius It should be affected by `change-dir`, Which OS are you using?

WiseGenius

[03:44](#msg581ff8a3eed0c3125f45d32e)XP. Let me try again, in case I made a mistake.

[03:56](#msg581ffb7ac2f2cf7275dbae71)@qtxie Don't worry. It was a stupid bug in my code. In one of the places, I had `change-dir:` instead of `change-dir`, haha!

dsgeyser

[15:14](#msg58209a4e6cb7207630484fa5)What is "operator overloading " in Red terms? An example is most welcome.

greggirwin

[18:03](#msg5820c1dbc2f2cf7275e009aa)Answered in red/welcome.

## Tuesday 8th November, 2016

maximvl

[14:50](#msg5821e61b45c9e3eb4311e832)fyi: Elm's type system doesn't allow one to make a select: https://medium.com/@boxed/a-small-dive-into-and-rejection-of-elm-8217fd5da235#.tj6koq1cs

dockimbel

[15:09](#msg5821ea9ae462097a30232e56)@maximvl I read it this morning. Seems like it was Elm's bashing day, there was another article on /r/programming also against Elm.

maximvl

[15:19](#msg5821ece4e462097a30233ce4)@dockimbel heh, it's interesting how people start using type systems to get some help from computer, but end up limiting themselves

geekyi

[20:35](#msg58223721df5ae9664530da11)http://softwareengineering.stackexchange.com/questions/335504/why-do-languages-require-parenthesis-around-expressions-when-used-with-if-and

[20:37](#msg5822379031c5cbef43d0c949)Can't help but notice the rebol family is a good answer for that..

greggirwin

[22:44](#msg582255376cb720763051e563)Others are similar, requiring a block for the condition handler.

TomGrey303

[22:50](#msg582256be31c5cbef43d171ad)Hi, just started with Red - Can someone tell me how to call an exe from Red script. I'm using windows 10 - I did try an example from here: https://github.com/red/red/wiki/Reference-Call - but with no luck.

qtxie

[22:54](#msg5822579be097df757589254b)@TomGrey303 What error message you got?

TomGrey303

[23:01](#msg58225963df5ae96645319f42)Compilation Error: undefined symbol: red/binary/rs-insert \*\** in function: exec/system-call/inset-string \*\** at line 121 \*\** near: [binary/rs-insert as red-binary! str 0 data/buffer data/count - I used the #include %system/library/call/call.red before compilling

qtxie

[23:04](#msg582259f5e097df75758932c0)@TomGrey303 Try release mode (add `-r`):

```
C:\Red>red.exe -r -c tests\console-call.red
```

TomGrey303

[23:05](#msg58225a3331c5cbef43d18348)@qtxie thanks will try now

[23:23](#msg58225e856cb7207630521507)@qtxie Many thanks - looks like that was it.

## Wednesday 9th November, 2016

meijeru

[21:16](#msg582392476cb7207630587976)How do you test if a bitset value contains at least one bit that is set? I tried `not empty?` but that is forbidden.

geekyi

[22:11](#msg58239f00df5ae966453877e1)@meijeru somewhat convoluted:

```
test1: make bitset! {test}
test2: make bitset! length? test1
not test2 = test1
```

## Thursday 10th November, 2016

Rebol2Red

[10:45](#msg58244fc045c9e3eb431e8b84)While creating dynamic buttons, i need to know which button is clicked

```
block: 				copy []
number-of-buttons: 	10
fontsize: 			50
buttonsize: 		100x70
repeat i number-of-buttons [
	s: to string! i
	append block [button buttonsize font-size fontsize]
	append block s
	append block [[print "clicked"]] ; need to know which one is clicked
]
probe block
view layout block ; post-processing with layout
```

rebolek

[11:04](#msg58245439c2c2b0744e33c750)@Rebol2Red You have `face` object available. That should be enough IMO. But if it’s not, set something in `extra`.

[11:04](#msg5824543e35e6cf0547738bb3)Something like: `view layout [button extra 'my-button [probe face/extra]]`

Rebol2Red

[11:46](#msg58245e30c2f2cf7275f2c8b5)@rebolek I don't get it. Where does extra fit in?

rebolek

[11:49](#msg58245edcc486635461796dc4)@Rebol2Red let me rewrite your example...

Rebol2Red

[11:50](#msg58245ef2e462097a3030011d)Please do!

rebolek

[11:52](#msg58245f92c486635461796dd7)For example:

```
block:                 copy []
number-of-buttons:     10
fontsize:             50
buttonsize:         100x70
repeat i number-of-buttons [
    append block compose [
    	button buttonsize font-size fontsize extra (i) (form i) [print ["clicked" face/extra]]
    ]
]
probe block
view layout block ; post-processing with layout
```

Rebol2Red

[12:08](#msg58246332e462097a30301b0c)Maybe i should refrase myself: Is extra a keyword or something you can add to an object or ...?

rebolek

[12:09](#msg5824637735e6cf0547738ed1)@Rebol2Red `extra` is part of `face!` definition (try `red>> ? face!`) that can be used for storing user data.

[12:09](#msg58246395d695f5db0f4dc92d)To use `extra` in VID, you write `extra` keyword, followed by some value.

Rebol2Red

[12:11](#msg582463ed65485ebc6779e2f8)Now i get it, thanks for explaining!

wolframkriesing

[13:00](#msg58246f5fdf5ae966453c7c6d)@rebolek cool articles! keep it up, fun to read and learning red by applying them. My daily dose of Red :)

rebolek

[13:11](#msg58247211c2c2b0744e33ce27)@wolframkriesing Thanks! I am glad you find it helpful!

[13:12](#msg58247223c2c2b0744e33ce30)But daily dose...I don’t think I can write one every day ;)

wolframkriesing

[13:12](#msg5824723fe462097a303068f7)LOL there is enough to learn and to play with, already in those two articles

[13:13](#msg5824725fdf5ae966453c8e79)I found the rebol articles always a bit hard to read, I prefer your style :)

maximvl

[13:13](#msg5824726ac2f2cf7275f338d4)are you talking about this one http://redlanguageblog.blogspot.co.uk/ ?

rebolek

[13:13](#msg58247283c48663546179732c)@maximvl http://red.qyz.cz/code-is-data.html

maximvl

[13:13](#msg582472936cb72076305cb970)oh nice, I missed this one

wolframkriesing

[13:13](#msg5824729445c9e3eb431f4753)and http://rebol.qyz.cz/subdom/red/safe-and-persistent-locals.html

maximvl

[13:13](#msg58247294e462097a30306ab6)thanks

rebolek

[13:14](#msg582472a4c2c2b0744e33ce83)Here is list of them http://red.qyz.cz/

[13:14](#msg582472bed695f5db0f4dcd3e)Hm, I probably should make it bit nicer ;)

maximvl

[13:15](#msg582472dae097df757593e611)@rebolek do you run it on redbol backend?

rebolek

[13:16](#msg58247319c2c2b0744e33ceac)@maximvl No, not yet. It runs on Apache server that has R3 CGI support, but these are static pages, so no Redbol is used.

maximvl

[13:21](#msg5824746265485ebc677a5521)since we have stdin/out I think it is possible to use CGI

rebolek

[13:25](#msg58247541d695f5db0f4dce14)That’s possible. I haven’t tried it, I do not want to spent much time messing with web right now.

Rebol2Red

[14:08](#msg58247f5165485ebc677a9bd3)Warning: Maybe a silly question ahead :)

I want seven images on a row with a text below it (3 times)  
like this :

i01 i02 i03 i04 i05 i06 i07  
t01 t02 t03 t04 t05 t06 t07

i08 i09 i10 i11 i12 i13 i14  
t08 t09 t10 t11 t12 t13 t14

i15 i16 i17 i18 i19 i20 i21  
t15 t16 t17 t18 t19 t20 t21

i stands for image, t stands for text (formatting is lost during posting)

I have this code:

```
block: copy []
append block [size 800x600]
repeat i 21 [
	t: rejoin["t" i]
	append block compose [
		image 50x50 text (t)
	]
] 
probe block
view block
```

What can be done? (I prefer the 'easy' way)

I thought about:

Use a group-box:  
But then i can't use return in it to put the text below the picture  
Return is not allowed in a group-box block  
Is there any way to put the text below the image inside a group-box?

Use 2 loops:  
I could place the images and text at a fixed place but the code would  
be 'ugly' and not 'dynamic'

Let an expert show me how (Think it comes down to this :) )

DideC

[14:58](#msg58248b20df5ae966453d2978)Use `panel` maybe :

```
block: copy []
append block [size 800x600 below]
repeat j 3 [
    append block reduce ['panel sub: copy [origin 0x0 below]]
    repeat i 7 [
        t: rejoin["t" i]
        append sub compose [
            image 50x50 text (t) return
        ]
    ]
]
probe block
view block
```

Rebol2Red

[15:09](#msg58248da26cb72076305d6654)Yep that's it, thanks again  
Maybe someone knows a version (maybe using group-box) without the 2 loops?

[15:31](#msg582492d745c9e3eb432020aa)If someone is interested  
Here is a version of the code from DideC with the addition of returning the clicked image as a pair

```
block: copy []
append block [size 800x600 below]
repeat j 3 [
    append block reduce ['panel sub: copy [origin 0x0 below]]
    repeat i 7 [
        t: rejoin["t" j "," i]
        append sub compose [
            image 50x50 extra (as-pair j i) [print ["clicked" face/extra]] text (t)  return
        ]
    ]
]
;probe block
view block
```

maximvl

[16:13](#msg58249cbddf5ae966453da14a)@Rebol2Red could you show screenshot of the result? I don't have windows to test right now :)

Rebol2Red

[19:14](#msg5824c722df5ae966453ea938)Is there a simple way to share a link or an image directly?

Because of murphy's law i can't:  
Drag the screenshot onto this, gives an upload error  
Can't share it with google drive despite the tutorial to do this  
Uploaded to my ftp server but can't access it

It was too big to drag onto here, hope it isn't too small now :)

[19:18](#msg5824c81865485ebc677c5c4f)\[!\[screenshot.jpg](https://files.gitter.im/red/help/xJUg/thumb/screenshot.jpg)](https://files.gitter.im/red/help/xJUg/screenshot.jpg)

rebolek

[19:23](#msg5824c92398d63ff57f222f5a)@Rebol2Red I use http://imgur.com for sharing images

Rebol2Red

[19:25](#msg5824c99445c9e3eb432162b0)\[!\[Knipsel.jpg](https://files.gitter.im/red/help/Cx4g/thumb/Knipsel.jpg)](https://files.gitter.im/red/help/Cx4g/Knipsel.jpg)

fergus4

[23:46](#msg582506eee097df75759770b7)I did not know this room existed. Gitter not good at making available rooms visible.

## Friday 11st November, 2016

dockimbel

[04:41](#msg58254c04e462097a30350c06)@fergus4 See https://github.com/red/red/wiki/Gitter-Room-Index

RiVeND

[11:44](#msg5825af0fe097df75759a44f6)@dockimbel One room listed in there no longer appears to exist: red/red/char-datatype

matrixbot

[16:07](#msg5825ecbe6cb7207630647574)`irx` @fergus4 and there is https://gitter.im/red which will send you to the listing of all red rooms.

PeterWAWood

[23:50](#msg58265947df5ae9664546804c)@RiVeND Thanks. I removed the link.

## Saturday 12nd November, 2016

geekyi

[10:23](#msg5826edace462097a303c33ec)irx which client are you using?

matrixbot

[13:55](#msg58271f67e097df7575a086c0)`irx` @geekyi, I'm using gitter bridged into matrix and then the matrix client. Mostly riot android, sometimes riot.im/develop web-client.

[13:57](#msg58271fdd65485ebc678713f9)`irx` It's great for reading (except edited posts are hard to read this way). It's not so great to post.

## Sunday 13th November, 2016

geekyi

[10:00](#msg582839a788fa21d53c1628d4)irx thanks! Will try it out, I need an alternative when gitter.im is down for me. ISP still recovering from the recent dns attacks

[10:00](#msg582839b145c9e3eb433058a2)It's much better today tho

[10:04](#msg58283ac745c9e3eb43305cc0)@Rebol2Red so the error was due to your  
&gt; i can't:  
Drag the screenshot onto this, gives an upload error  
It was too big to drag onto here, hope it isn't too small now :)

[10:05](#msg58283adf88fa21d53c162fe2)image being too big?

[10:06](#msg58283b22e097df7575a54da9)I found http://getgreenshot.org/ , pretty lightweight and featureful

## Monday 14th November, 2016

Rebol2Red

[19:55](#msg582a16ad31c5cbef43f68586)@geekyi The image was my desktop size 1640x1050 , after resizing it , i was able to drag&amp;drop it here.  
I just don't know right away after which size it works (Think it was 800x600, but i am not sure).  
Just do a little trial and error if you have to upload an image here.

## Wednesday 16th November, 2016

TomGrey303

[01:39](#msg582bb8ce65485ebc679f50c7)Hi, im pretty new to red - Is there any info on the Red compile switches, not sure if thats the correct term - I mean, i understand -c and -t but there's more -r - are there any docs on this ?

rebolek

[01:39](#msg582bb8ef715933bd55738dde)@TomGrey303 see https://github.com/red/red/

[01:40](#msg582bb8f937fbab5354b91aeb)search for `options`

TomGrey303

[01:50](#msg582bbb79c2f2cf727517a459)I looked there but nothing explains it to me - '-c' means compile. Then '-c -t windows' means compile to windows, but whats the rest for ? - just struggling here a bit.

rebolek

[01:52](#msg582bbbde4c9177c45e314ecb)@TomGrey303 I don’t understand, all the options are explained there. For example:

```
-r, --no-runtime               : Do not include runtime during Red/System
                                 source compilation.
```

TomGrey303

[01:53](#msg582bbbffc2f2cf727517a609)sorry will look again

rebolek

[01:53](#msg582bbc2a4c9177c45e314ee8)It’s about in the half of the page.

TomGrey303

[02:00](#msg582bbdace097df7575b8930e)@rebolek Ah, got it. many thanks for your help

rebolek

[02:00](#msg582bbdcf37fbab5354b91b9f)You’re welcome.

## Friday 18th November, 2016

gearss

[12:14](#msg582ef09c004785313cbf591e)how can I install Red on my android phone?

WiseGenius

[14:40](#msg582f12f25eb8ea792a36f4ad)@gearss Someone correct me if I'm wrong, but if you know how to compile Red from source, you could theoretically cross-compile the Red interpreter as I compiled `hello.red` in my similar question \[here](http://stackoverflow.com/questions/24360991/how-do-i-run-an-android-app-ive-written-in-red), and then follow the answers there, especially the top 2, to get it working on Android.  
I haven't tried it for the Red interpreter, but it worked for `hello.red`. I haven't done it in a long time, and Red has been worked on a lot since then, so there's a small chance that the Android part might not work anymore. Someone else might know, or you could just try it. It won't take long.  
Have you compiled Red from source before? It isn't hard.

geekyi

[19:24](#msg582f5568df9f0f6e7f5734a5)@donaldtsang can you post a concrete example. Here or SO

DonaldTsang

[19:25](#msg582f55c0238757566cc35cd6)@geekyi So basically in Python, there are different byte encodings (`bytes`, also used for binary data and file blobs) and one singular universal character set/string (`str`)

[19:26](#msg582f55dce712c9a118838f83)@geekyi the Most common Unicode encoding scheme is UTF8 and UTF16

geekyi

[19:28](#msg582f5642a5bc784f5657ae54)@DonaldTsang yes, in Python3 (to be specific) I recall you have fixed length `bytes` and the `string` type is unicode, utf-8

[19:28](#msg582f5679df9f0f6e7f57353a)(I've not really had a \*need* for unicode encoding other than utf-8)

DonaldTsang

[19:31](#msg582f571cb7cf637f2ab9699d)@geekyi No, in Python3 `string` is universal and count by the character (and other diacritics etc.) while `bytes` can represent UTF8, UTF16, file data or other "byte-like" things

[19:32](#msg582f573f297a180b4f0edfdb)@geekyi there is a function that convert `string` into `bytes` by encoding systems

geekyi

[19:33](#msg582f5778a5bc784f5657ae95)@DonaldTsang Er.. I thought that was what I said :D SO you want to convert from one code point into another?

[19:34](#msg582f57b4c6c4993013c1ebf8)More specifically, you want to work with text encodings, rather than binary data?

DonaldTsang

[19:36](#msg582f5850238757566cc36a75)@geekyi No, `string` uses code points or "characters" (which transcends binary data) while `bytes` represents binary data. I use `bytes` for texts sometimes and read/write files other times...

[19:37](#msg582f5876613368f619cd142f)But lets focus on the text part of the equation

geekyi

[19:37](#msg582f5884297a180b4f0ee5a5)IMHO, for text, there's little reason to not use anything other than UTF-8 these days

DonaldTsang

[19:38](#msg582f58c1b563b5516c381a42)@geekyi but compatibility with HTML+CSS+JS is important (they use UTF16)

geekyi

[19:38](#msg582f58c5613368f619cd1673)But if you want to work with other encodings, I don't know. Might have to write that part yourself

[19:39](#msg582f58e1e712c9a11883a13d)@DonaldTsang Don't they ~~all~~ mostly use UTF-8

[19:39](#msg582f58ef2cf343a318c28cda)I think I get what you are trying to say..

[19:41](#msg582f5977297a180b4f0eec21)&gt; @geekyi No, `string` uses code points or "characters" (which transcends binary data) while `bytes` represents binary data. I use `bytes` for texts sometimes and read/write files other times...  
FYI, never disagreed with `string` being a text type with virtual encodings

DonaldTsang

[19:42](#msg582f599d5eb8ea792a38d292)@geekyi when you convert from UTF8 to UTF16, or other common encodings like Big5/GB/JIS, you need to convert `bytes` to `strings` and then back to `bytes`

geekyi

[19:47](#msg582f5ab8b563b5516c382be2)  
HTML+CSS+JS is important (they use UTF16)

UTF16 is used internally for performance right?&gt;

[19:51](#msg582f5ba4e712c9a11883b568)@DonaldTsang are you talking about \[this](https://news.ycombinator.com/item?id=3906590)

[19:52](#msg582f5be9e712c9a11883b707)&gt;pervasiveness of JavaScript means that UTF-16 interoperability will be needed as least as long as the Web is alive. JavaScript strings are fundamentally UTF-16. This is why we've tentatively decided to go with UTF-16 in Servo (the experimental browser engine) -- converting to UTF-8 every time text needed to go through the layout engine would kill us in benchmarks.  
For new APIs in which legacy interoperability isn't needed, I completely approve of this document.

DonaldTsang

[19:58](#msg582f5d53613368f619cd41d8)@geekyi I think so

geekyi

[20:15](#msg582f614ab7cf637f2ab9ac42)@gearss btw, I've also tried what @WiseGenius has done, but the whole console instead.. didn't work because red requires libcurl on linux then. SHould try again sometime

DonaldTsang

[20:17](#msg582f61c2b7cf637f2ab9ae2a)@geekyi So basically code point count vs byte count

geekyi

[20:21](#msg582f62b7e712c9a11883dd63)@DonaldTsang basically, if you are just trying to count code points vs bytes `length?` works on `binary!` and `string!`. I think then you might need a custom UTF-16 type

[20:21](#msg582f62c3b563b5516c385914)Gonna retire now

## Saturday 19th November, 2016

iceflow19

[06:57](#msg582ff7c3238757566cc62920)@DonaldTsang Are you looking for something along these lines: https://gist.github.com/iceflow19/f7d31ef5890f9d16e737e89086294bee

## Sunday 20th November, 2016

Rebol2Red

[20:06](#msg583202595eb8ea792a44c56b)Can i get the name of the script while executing it?  
Rebol2: print system/options/script  
Red returns none

[20:45](#msg58320b6ab563b5516c4436b8)Can someone explains this?  
I read 159 times a plain text file which is 4,66MB  
After 41 percent of reading i get an out of memory error?  
Looks like reading takes many more memory than expected, about 3 to 4 times

\[!\[memory.jpg](https://files.gitter.im/red/help/n4ry/thumb/memory.jpg)](https://files.gitter.im/red/help/n4ry/memory.jpg)

[21:04](#msg58320fd123ce1ae73c069b2a)Memory = Geheugen  
Available = Beschikbaar  
In use = In gebruik

[21:15](#msg58321287238757566ccf7e3f)Correction:  
It is not at 41 percent when i get the error but at 25.78 percent  
After reading 41 times 4,66 MB (after reading 191MB) so the used memory is a lot more than 3 to 4 times. See the gigantic spike.

[21:32](#msg58321689297a180b4f1ade73)I wonder if there is a way to clear the memory after reading and processing a file?

rebolek

[21:33](#msg583216a83418b2e57f2bb174)@Rebol2Red not yet, you have to wait for garbage collector.

Rebol2Red

[21:36](#msg58321751b7cf637f2ac5ab25)@rebolek Do you have any idea how long this would take, because i now get the idea i have more problems which might be related to this problem.

geekyi

[21:38](#msg583217c423ce1ae73c06c2c5)@Rebol2Red is it `read`ing that causes the spike?

[21:39](#msg5832180d23ce1ae73c06c37e):point\_up: \[November 21, 2016 1:45 AM](https://gitter.im/red/help?at=58320b6ab563b5516c4436b8) can you paste a gist?

rebolek

[21:39](#msg58321814a5bc784f5658181b)@Rebol2Red simple GC should be there in 0.6.4. See https://trello.com/b/FlQ6pzdB/red-tasks-overview

Rebol2Red

[21:49](#msg58321a65b563b5516c4481f4)@geekyi What else can it be? The code is on the left side of the screenshot.  
You mean paste the code over here?

```
view [
	button "start" [
		repeat i 159 [
			p/data: (i / 159.0)
			p/data: to percent! p/data
			read %bookmarks.txt ; size is 4,66MB
		]
		t/text: "Ready"
	]
	t: text font-size 20 " "
	p: progress data 0.0
]
```

The bookmarks.txt is just a long plain txt file with links and descriptions in it.

geekyi

[21:49](#msg58321a8423ce1ae73c06cefe)@Rebol2Red Yeah thanks

Rebol2Red

[21:52](#msg58321b19e712c9a118900e8c)Just a small sample of the bookmarks.txt

```
Acer Store Europe
http://go.acer.com/?id=14428
Acer Store US
http://us-store.acer.com/
Amazon
http://www.amazon.com/?force-full-site=1
Artificial Intelligence - Chapter 2 Notes - Computer Science Now
http://www.comsci.us/ai/notes/chap02.html
Back2BASIC - B2B Code Show
http://back2basic.phatcode.net/?Issue_%235:B2B_Code_Show
Back2BASIC - B2B Code Show: Polyplotter
http://back2basic.phatcode.net/?Issue_%237:B2B_Code_Show%3A_Polyplotter
BBC
http://www.bbc.co.uk
Beyond The Cosmos Quantum Mechanics - YouTube
```

Ofcourse i would'nt read this file 159 times, but is was just a test to see if i could read  
long files 159 times, which i have to do for my bookmarksextractor program.

geekyi

[22:01](#msg58321d30b7cf637f2ac5c6c2)\[!\[image.png](https://files.gitter.im/red/help/bPga/thumb/image.png)](https://files.gitter.im/red/help/bPga/image.png)

[22:02](#msg58321d8b613368f619d9580c)@Rebol2Red I changed the `read` line to

```
read/binary %red-061.exe ; size is <1MB ;P
```

Rebol2Red

[22:03](#msg58321dc623ce1ae73c06e494)Is this a workaround or my bad or...?

geekyi

[22:04](#msg58321de1238757566ccfb6bb)I don't see that much of an increase there, ~164MB as you can see, which is expected.. haven't tried plain text file yet

[22:04](#msg58321df3b563b5516c4491be)@Rebol2Red At least a workaround I hope ;-)

Rebol2Red

[22:16](#msg583220d423ce1ae73c06f04e)@geekyi Yep, this works, but now i have the problem that i can't directly use the parse command on the binary data.  
I'll first have to make strings from the binary data and then do the parsing on it, which takes ... time.  
I do'nt read plain txt files but html files which must be parsed.

geekyi

[22:20](#msg5832219db7cf637f2ac5d880)\[!\[image.png](https://files.gitter.im/red/help/qDX9/thumb/image.png)](https://files.gitter.im/red/help/qDX9/image.png)

[22:21](#msg58322203e712c9a11890383a)Yeah, with plain text.. 3x as much memory.. with your sample text copied as many times to make size ~3.94MB

[22:23](#msg58322244b563b5516c44a5c9):point\_up: \[November 21, 2016 1:45 AM](https://gitter.im/red/help?at=58320b6ab563b5516c4436b8) from this it appears much larger tho.. ?

Rebol2Red

[22:25](#msg583222c8238757566ccfca69)@geekyi I suppose you have much more memory than this "old" pc which has 4G  
I use windows 10. Which version are you using?

geekyi

[22:25](#msg583222df23ce1ae73c06f9ae)Ok.. `read/lines` crashes it for me

[22:25](#msg583222eb238757566ccfcb0d)Win 10 64bit

[22:26](#msg583223285eb8ea792a4571a9)With `read/lines`, there's a huge 771mb spike like your graph

[22:27](#msg58322344238757566ccfccb2)\[!\[image.png](https://files.gitter.im/red/help/sj7u/thumb/image.png)](https://files.gitter.im/red/help/sj7u/image.png)

Rebol2Red

[22:28](#msg58322386297a180b4f1b1a9c)@geekyi Strange, i can't explain why my computer behaves different. Maybe because you have more memory free?

geekyi

[22:29](#msg583223c5e712c9a118903ef1)Maybe.. but it shouldn't?

[22:30](#msg58322407238757566ccfcfa0)Do you have any other code in that file?

Rebol2Red

[22:32](#msg5832247023ce1ae73c0701c0)@geekyi I think i have a reason why.  
I only have 112 MB free on my harddrive. Maybe Red writes to the drive while reading?  
And yes i have other code i shall test it in another file. I'll be back soon.

geekyi

[22:33](#msg583224ccb7cf637f2ac5e6d6)Yeah, maybe swap:

[22:34](#msg583224d85eb8ea792a457967)\[!\[image.png](https://files.gitter.im/red/help/tjI1/thumb/image.png)](https://files.gitter.im/red/help/tjI1/image.png)

[22:40](#msg5832265fe712c9a118904ce6)`read/lines/part/seek %file.txt chunk offset` might help

[22:40](#msg5832266eb7cf637f2ac5f0cc)Maybe without the `/lines`

[22:41](#msg5832269c297a180b4f1b2875)@Rebol2Red gonna go now, hope it helps!

Rebol2Red

[22:42](#msg583226e8b7cf637f2ac5f2ce)@geekyi Alright, thanks. I'll hope to find the solution and will post it here when i find one.

geekyi

[22:44](#msg5832276a297a180b4f1b2c55):point\_up: \[November 21, 2016 3:32 AM](https://gitter.im/red/help?at=5832247023ce1ae73c0701c0) @Rebol2Red red itself doesn't write, maybe your OS writes swap.. still a bit strange.. I'm using `red-20nov16-88de5e0`

[22:46](#msg583227c8297a180b4f1b2e8b)Also \[process hacker](http://processhacker.sourceforge.net/downloads.php) is real nice for debugging on windows

Rebol2Red

[22:46](#msg583227e2238757566ccfe182)@geekyi I use the same version 20-11-2016. I'll look into process hacker.

## Monday 21st November, 2016

Rebol2Red

[00:10](#msg58323b63238757566cd039c3)@geekyi Can it be Red is handling some bytes in the file not right so it keeps on reading?  
Maybe some invalid utf-8?  
That could be the reason why read/binary works well.  
But then again, you mentioned a spike too with read/lines  
I'll give up on this. Never ever had problems reading files with Freebasic.  
I have tested it with a simular program in Freebasic and the memory it used is steady at 0.5 MB even while displaying every line in the file.  
I could ofcourse read the files with Freebasic and process it with Red but i like to do all things in one program.

qtxie

[02:13](#msg58325850238757566cd0aff1)@Rebol2Red If the text contains non-ascii characters, reading as string will take memory 2 ~ 5 times larger than the original file size.

[02:19](#msg583259ac5eb8ea792a4658d0)Here explains how does red string handle unicode: http://www.red-lang.org/2012/09/plan-for-unicode-support.html

Rebol2Red

[09:17](#msg5832bba8b7cf637f2ac888e7)@qtxie @geekyi  
Now i get it.  
Why didn't i thought of that before!  
I thought there was something wrong with my computer.  
So the solution is to write the file as latin-1 (ISO-8859) instead of utf-16?  
Or maybe better to read the file directly in latin-1. (not implemented yet?)  
Maybe a hint howto read directly? (I could use a online convertor for writing)

```
read/lines/as %bookmarks.txt 'latin-1 
*** Internal Error: reserved for future use (or not yet implemented)
*** Where: read
```

[10:04](#msg5832c6ace712c9a118934352)

```
view [
	button "start" [
		repeat i 159 [
			p/data: (i / 159.0)
			w: read/lines %testing.red ; change to an existing (small) file!
		]
		t/text: "Ready"
	]
	t: text font-size 20 " "
	p: progress data 0.0
]
```

If i use this script i get the text "Ready" way before reaching 100%.  
Am i doing things wrong (or how can i "synchronise" this)?

endo64

[10:30](#msg5832ccb0b7cf637f2ac8e9e0)Just set `p/data: 1.0` before `t/text: "Ready"`

Rebol2Red

[10:39](#msg5832cece297a180b4f1e213f)@endo64 That does'nt work (at least not over here).  
I was using a small file and a "small" loop, but even when using a large loop and p/data: 1.0 the text shows up way earlier.

[10:59](#msg5832d3a7613368f619dc9287)

```
view [
	button "start" [
		repeat i 2259 [
			p/data: (i / 2259.0)
			w: read/lines %testing.red 
 ; change to an existing (small) file!
		]
		p/data: 1.0 
		t/text: "Ready"
	]
	t: text font-size 20 " "
	p: progress data 0.0
]
```

At about 30 percent the text shows up

note:  
In fact i am using the above script as the test file.

Is there a way to get the name of a running script?  
so i do'nt have to ask someone who test it to change the name of the file.  
That way people are more willing to test them.

Rebol2: print system/options/script  
Red: print system/options/script returns none

qtxie

[13:01](#msg5832f00fc6c4993013c28093)@Rebol2Red

[13:01](#msg5832f0283418b2e57f2be1c9)&gt; If i use this script i get the text "Ready" way before reaching 100%.

[13:02](#msg5832f05d3418b2e57f2be241)It's caused by the animation of the progressbar on Windows.

[13:02](#msg5832f080a5bc784f56584e60)There is a hack to turn off it, maybe we should turn it off?

[13:07](#msg5832f1a13418b2e57f2be41b)@Rebol2Red Another issue is the window is frozen after pressing the `start` button. It can be improved as below:

```
view [
    button "start" [
        repeat i 159 [
            p/data: (i / 159.0)
            wait 0.1
            loop 5 [do-events/no-wait]       ;-- let the View engine to process some events
        ]
        t/text: "Ready"
    ]
    t: text font-size 20 " "
    p: progress data 0.0
]
```

Rebol2Red

[17:33](#msg58332fe9c790e0ec56139323)@qtxie Thanks. Just a little bit earlier before reaching 100% which is fine by me.  
I did not have an issue of a frozen window after pressing the start button.  
Maybe because of the windows version? I am using windows 10

[18:02](#msg5833369bb07a1fd34823ad5c)@qtxie  
This will show at exactly the right time but then the progress is going from 30 directly to 100%  
Now i would like to ask if wait depends on the speed of the computer?

```
view [
	button "start" [
		repeat i 2259 [
			p/data: (i / 2259.0)
			w: read/lines %testing.red ; change to an existing (small) file!
		]
		wait 0.1
        loop 5 [do-events/no-wait]       ;-- let the View engine to process some events
		t/text: "Ready"
	]
	t: text font-size 20 " "
	p: progress data 0.0
]
```

rebolek

[18:04](#msg583337299fd0a9bb470926a0)Is it possible to use `wait` in event code? I haven’t experimented with it yet, it was big no-no in Rebol, AFAIR.

greggirwin

[18:05](#msg583337749a5479d0484383e8)I think it's still a no-no.

rebolek

[18:05](#msg5833377ec0a2732923ffd533):)

[18:07](#msg583337d623157bcb1cc1297b)@Rebol2Red I would move your code to `on-time` event.

greggirwin

[18:07](#msg583337f37f83e6c97716080c)No fault of Red. Just a side effect of being in an event loop and being single threaded. And I don't think we want to head down the path of multithreading for event handlers.

Bolek +1. I suggested that earlier as well.

rebolek

[18:08](#msg583338139fd0a9bb470926cd)@greggirwin Oh, good. I haven’t watched the discussion closely, sorry.

greggirwin

[18:08](#msg583338242db952670462935f)NP, I feel validated now. :^)

Rebol2Red

[18:09](#msg58333868b07a1fd34823bd69)@rebolek How does on-time works, i mean when does the on-time event occurs?  
Can i have multiple on-time events?

rebolek

[18:10](#msg58333891c0a2732923ffd57a)@Rebol2Red if by multiple you mean multiple faces, each with its own on-time, then yes

Rebol2Red

[18:11](#msg583338b416ee9e64046ab42d)You mean i can use hidden faces?

rebolek

[18:11](#msg583338b652af72f05432f131)You have to set `rate` for face and then it starts to processs `on-time` events.

greggirwin

[18:11](#msg583338d22db9526704629836)

```
view [
    button rate 1 on-time [print ["Not a click!" now/time]]
]
```

rebolek

[18:11](#msg583338d452af72f05432f133)@Rebol2Red Every face can have it’s on `rate`, so also 0x0 sized faces, why not.

[18:12](#msg5833390a9fd0a9bb47092846)@greggirwin Thanks for nice example. @Rebol2Red for something more complicated, see http://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html

greggirwin

[18:12](#msg583339232db9526704629a5d)@Rebol2Red, if you want different intervals on a single face's timer, you need to manage that yourself. Just set a higher rate, check modulos, etc.

Rebol2Red

[18:13](#msg583339617f83e6c977160eee)Nice, multple timers!

greggirwin

[18:17](#msg58333a49bc17b2e756fa2304)I imagine we'll see higher level timer functionality, as Nenad and Gabriele built a nice timer system for R2.

rebolek

[18:18](#msg58333a6cc0a2732923ffd5f3)Yes, it’s nice to have. I think that for GUI animations it’s better to have just one dispatcher that takes care of all animations, but that’s fairly easy to write.

greggirwin

[18:20](#msg58333af3b07a1fd34823cdf6)Yes, different purposes benefit from different models. Gabriele's timers and Nenad's scheduler are really nice for cron type work.

[18:40](#msg58333f9dbc17b2e756fa492f)@dockimbel, I don't see info in the macro execution context currently, but is there a plan for including current file and line info? Just curious.

Rebol2Red

[18:50](#msg5833420e7f83e6c977164dd4)@rebolek "I would move your code to on-time event"  
Problems:  
Rate can't be set to zero so how to start the on-time event with a button?  
Reading of files would be done in the on-time event so there will be some waisted time.

rebolek

[18:52](#msg5833425923157bcb1cc12e49)@Rebol2Red  
&gt; how to start the on-time event with a button

```
x: base on-time [...]; anim here
button "start" [x/rate: 10]
button "stop" [x/rate: none]
```

Rebol2Red

[18:56](#msg583343689a5479d04843cf0b)@rebolek Great, What about the waisted time? Will there even be waisted time i wonder?

rebolek

[18:59](#msg5833442dc0a2732923ffda22)@Rebol2Red what do you mean by wasted time?

Rebol2Red

[19:01](#msg5833447b16ee9e64046b111b)If on-time events go at a specified rate then the reading of files will also be at that rate?

```
i: 1
view [
    at 0x0
	x: base hidden on-time [
		either i <= 15 [
			w: read/lines %testing.red 
; change to an existing (small) file!
			prin i print { }  ; show it is working
			i: i + 1
			p/data: (i / 15.0)
		][
			t/text: "Ready"
		]
	]; anim here
	button "start" [x/rate: 10]
	button "stop" [x/rate: none]

    t: text font-size 20 " "
    p: progress data 0.0
]
```

It looks like the reading will finish between the events but i want to be sure

greggirwin

[20:47](#msg58335d68cc0ea2cf777b4b6a)Reading a file is synchronus, so timer events will be blocked while you read.

## Tuesday 22nd November, 2016

qtxie

[00:06](#msg58338c1616ee9e64046cc67d)@Rebol2Red I use `wait 0.1` to simulate `read ...` in your code, you don't need to use `wait`. Also you should put `do-event ...` inside your `repeat` loop.

dockimbel

[09:42](#msg5834131a7f83e6c9771a84a2)@greggirwin  
&gt; @dockimbel, I don't see info in the macro execution context currently, but is there a plan for including current file and line info? Just curious.

If you think about reflection, we could add the current filename in the execution context. For the line info, that is not possible as the macros are evaluated \*after* LOAD.

Rebol2Red

[11:16](#msg5834292416ee9e64046fc6e5)"Is there a way to get the name of a running script?" was not a good question  
I could have found the answer when i looked at the documentation on red-lang.org  
Anyway, in case someone wants to know:

```
scriptname-as-file: 	to file! system/options/args
scriptname-as-string: 	to string! system/options/args
probe scriptname-as-file
probe scriptname-as-string
```

Note: I do'nt know how to get this compiled

rebolek

[12:09](#msg5834359423157bcb1cc15f3c)@fergus4 hello

fergus4

[12:25](#msg583439322db952670467fe75)Typo on my phone...could not delete

meijeru

[12:43](#msg58343d887f83e6c9771b71b9)@Rebol2Red `system/options/args` is of type `string!`, so `to string!` is not needed in your example. Moreover, `to file!` can be replaced by `as file!`.

[12:55](#msg5834405c2db9526704682ac1)One should also add `to-rebol-file` in order to change the `\`into `/` (at least on Windows).

maximvl

[12:56](#msg58344087b07a1fd348290522)@meijeru name is very misleading =)

[12:57](#msg583440c17f83e6c9771b8152)`to-unix-path` is how I would name it

meijeru

[13:11](#msg58344405b07a1fd348291974)Correction: I should of course have written `to-red-file`. Furthermore, Red uses `/`as separator for path elements, just like Unix, so `to-red-file` is correct and OS-independent. The converse is called `to-local-file`, which generates the OS-dependent form.

greggirwin

[16:39](#msg583474c1b07a1fd3482a5f24)&gt; If you think about reflection, we could add the current filename in the execution context. For the line info, that is not possible as the macros are evaluated after LOAD.

Thanks @dockimbel. We could probably do something like "near" in errors. Tooling could do more from there.

## Wednesday 23th November, 2016

justinthesmith

[08:08](#msg58354e7bcc0ea2cf7785c006)How do I convert binary numbers to integers? In Rebol it's as simple as

```
to-integer #{B79CE5D3}
== 3080512979
```

rebolek

[08:11](#msg58354f359fd0a9bb4709c32a)@jthsmith If you look at https://github.com/red/red/blob/master/docs/conversion-matrix.xlsx for binary!-&gt;integer!, it says \*base 16 binary as integer\*. So expect it in next release.

Rebol2Red

[08:12](#msg58354f5d9a5479d0484ee940)@meijeru @maximvl  
If i post code over here i don't do optimization, documentation and error checking (just the bare minimal code, no "fancy" stuff to distract or confuse the reader). I will leave all other things to the reader. He/she will stumbles upon the errors and in the process will learn how to avoid them. In a real program it's a different story. I think this is not the place for real programs (gists would be better). Only if code is plain wrong i would mention this, otherwise it might scare people off to show their code. I hope this is not the way this community will go. Do'nt get me wrong, i appreciate any comments on my code!

rebolek

[08:12](#msg58354f6d52af72f054338930)There has been a lot of work on make/to conversions in recent days, so latest version may have it already.

justinthesmith

[08:19](#msg583551242db95267046e2bc5)Wow thanks for the quick and helpful reply. Just tried the latest build and sure 'nough it works:

```
red>> to-integer #{B79CE5D3}
== -1214454317
```

In fact it works better than Rebol 3 in correctly handling the negative (R2 works correctly as well). Thanks!

rebolek

[08:20](#msg58355157c0a27329230066cd)@jthsmith You’re welcome. If you have any other questions, feel free to ask!

Rebol2Red

[08:30](#msg583553c1b07a1fd3482f15be)@rebolek +1 That's my point. Feel free to ask!

justinthesmith

[08:35](#msg583554eac790e0ec561f5b62)Suppose I want to copy the first 4 bits of a binary string to convert to integer. This works:

```
red>> to integer! to binary! parse #{B79CE5D3ABCD} [collect [4 [keep skip]] to end]
== -1214454317
```

But it's not exactly elegant, 2 manual type conversions--collect returns a block of integers. Any suggestions for just copying out the 4-part sequence directly as a binary? Something like:

```
parse #{B79CE5D3ABCD} [copy number 4 bits to end]
```

rebolek

[08:45](#msg5835571652af72f054338abe)4 bits or bytes?

[08:48](#msg583557edc0a273292300698b)If you mean bytes, it’s easy. `collect` collects to block by default, but you can provide you own word to change behavior:

```
red>> number: #{}
== #{}
red>> parse #{B79CE5D3ABCD} [collect into number [4 [keep skip]] to end]
== true
red>> number
== #{B79CE5D3}
```

or you can grab it directly:

```
red>> parse #{B79CE5D3ABCD} [copy number 4 skip to end]
== true
red>> number
== #{B79CE5D3}
```

justinthesmith

[09:01](#msg58355aee2db95267046e5d97)Ah that does it, thanks again!

Rebol2Red

[09:07](#msg58355c65b07a1fd3482f4421)Maybe something more general?

```
mid: func [s start len][copy/part at s start len] ; like basic's midstring
print to integer! mid #{B79CE5D3ABCD} 1 4 ; mid string start length
```

justinthesmith

[09:11](#msg58355d5c9a5479d0484f343b)That's cool. But in my case I need to copy the bytes after a specific sequence instead of starting at a set position:

```
parse contents [thru #{030623E593} copy number 4 skip to end]
```

Probably not worth generalizing.

Rebol2Red

[09:13](#msg58355d9db07a1fd3482f4af6)@jthsmith Fine by me. Maybe you have some use for it.

[09:29](#msg58356186cc0ea2cf7786277f)@jthsmith I do not know if "Fine by me" sounds harsh (it might be)? If so, it was not my intention, English is not my native language.

justinthesmith

[09:35](#msg583562dd2db95267046e8c5e)No worries, appreciate the help!

Rebol2Red

[10:58](#msg58357642c790e0ec562015a9)@rebolek I wanted to have a look at your gitter script. Can you tell me how to get a token?  
I don't know what to do on https://developer.gitter.im/apps  
In your program i tried rebol2red as token but that's not right.

rebolek

[11:01](#msg583576f3c0a27329230074b3)@Rebol2Red press \[Sign in] button in top-right corner.

[11:01](#msg58357715c0a27329230074b8)You will see "token" followed by long hexadecimal value.

[11:03](#msg5835777152af72f054339221)The master branch is pretty old now, I do the development in `stylize` branch. Once @dockimbel accepts my `stylize` PR, I will merge the changes back to master.

Rebol2Red

[11:04](#msg583577bfc790e0ec56201d1e)@rebolek Copying and pasting the code is'nt working \*\** Syntax Error: invalid integer! at "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

rebolek

[11:05](#msg583577f152af72f054339229)Hm, let me try it...

[11:08](#msg583578a023157bcb1cc1c214)@Rebol2Red let’s move to https://gitter.im/red-gitter/Lobby please.

## Tuesday 29th November, 2016

dander

[05:40](#msg583d14e08e29aeee601ae75d)I was playing around with the macros from the \[documentation examples](https://github.com/red/docs/blob/master/preprocessor.md#expand-directives) and had a couple questions. When inside expand-directives, if there is an error, the red console exits. Is that expected behavior, bug, or just not implemented yet?

This is from the documentation:

```
λ red --cli
--== Red 0.6.1 ==--
Type HELP for starting information.

red>> about
Red 0.6.1 - 28-Nov-2016/16:46:05-8:00
red>> expand-directives [print #either config/OS = 'Windows ["Windows"]["Unix"]]
*** Preprocessor Error in #either
*** Script Error: path config/OS is not valid for none! type
*** Where: ???
λ $LASTEXITCODE
0
```

I think it was meant to be this:

```
red>> expand-directives [print #either system/platform = 'Windows ["Windows"]["Unix"]]
== [print "Windows"]
```

RiVeND

[12:01](#msg583d6e0d8d65e3830eb42a21)@dander @dockimbel Looks like a regression.

[12:04](#msg583d6ede16207f7b0ebc9822)

```
red>> about
Red 0.6.1 - 22-Nov-2016/14:35:39
red>> expand-directives [print #either config/OS = 'Windows ["Windows"]["Unix"]]
== [print "Windows"]
red>> about
Red 0.6.1 - 29-Nov-2016/11:59:47
red>> expand-directives [print #either config/OS = 'Windows ["Windows"]["Unix"]]
*** Preprocessor Error in #either 
*** Script Error: path config/OS is not valid for none! type
*** Where: ???
(halted)
```

## Sunday 4th December, 2016

geekyi

[15:33](#msg5844374a90f847041bf85291)Halfway writing this, I realized you were talking about something else and @RiVeND misunderstood the original problem, like me  
(you can see in @RiVeND version that console doesn't exit but prints (halted))  
&gt;@RiVeND @dander the red console exiting feels like the saner behavior for me. At least in that particular case. Wouldn't doing otherwise lead to hard to find bugs?  
In your particular example, I can't understand why it does that

## Monday 5th December, 2016

RiVeND

[11:34](#msg584550cdbc32453c28915f3d)@geekyi Hah, yes! Note to self, read things properly before commenting!

dockimbel

[16:00](#msg58458f100da034021b6fbf5e)@dander @RiVeND Thanks for the report (noticed only today). I've pushed a fix for it.

geekyi

[16:03](#msg58458fe91eb3d648695c1841)@dockimbel Eh.. https://github.com/red/red/commit/49c6bb26bf306035a2859a1c142d6c3b98971acd was the actual fix for this problem. You fixed something else! :smile:

dockimbel

[16:36](#msg584597a0f666c5a138d2be65)@geekyi There were two different issues in the same error case.

## Tuesday 6th December, 2016

TimeSlip

[00:37](#msg58460845b4ffd59e38ee3f29)Hello, I was just wondering about the Android state of affairs. Is there a general, "this will work" and "this won't" ? My guess is the VID doesn't at this point but I'd love to be wrong about that.

geekyi

[07:49](#msg58466d7e44f3e83528e44a20)@TimeSlip I've not been able to run the red binary on Android because it requires libcurl. Haven't found an easy way to install it. You might be able to hack around by commenting out the include in simple.io L1670 ? Also haven't tried out the android branch yet, which produces an apk I think

## Friday 16th December, 2016

meijeru

[11:12](#msg5853cc01589f411830f05020)How does one compare c-strings in Red/System? The following does NOT work (see issue #2369):

```
s: "abc"
if s = "def" [print "hoopla"]
```

rebolek

[11:12](#msg5853cc1ae7bdfe4e295fbd64)@meijeru char by char IMO

[11:13](#msg5853cc57589f411830f051c0)@meijeru https://github.com/rebolek/user.reds/blob/master/user.reds#L238

dockimbel

[11:14](#msg5853cc89af6b364a29bd47bd)I think we don't have any function for that in the Red or R/S runtimes (not needed internally). You can write your own function or import one of the C lib functions (like `strcmp()` or the safer `strncmp()`).

meijeru

[11:16](#msg5853ccf9e7bdfe4e295fc264)OK if that is what it takes. But instead of the compiler internal error on naive comparison one should have a warning...

dockimbel

[11:16](#msg5853cd22af6b364a29bd4a72)You can open a ticket for signaling that internal error, that should not happen.

rebolek

[11:17](#msg5853cd4f058ca9673753bf4c)@meijeru see above link, I already wrote such function

meijeru

[13:09](#msg5853e7a70730ce6937d1b6fd)Thanks both @rebolek @dockimbel I did the ticket.

geekyi

[22:33](#msg58546bbf0730ce6937d4e366)@rebolek that looks like a useful set of functions! Wished I'd seen them sooner. There is a problem of discoverability right now. Been thinking of making something like a package manager / searcher

rebolek

[22:55](#msg585470e7c5a4e0233b94b48d)@geekyi Thanks! I believe these functions are very useful, but I use Red now, so I haven’t updated my Red/System stuff in a while.  
Anyway, I understand your desire for some package manager but I would definitely wait for modules in Red. If you want improve discoverability, do some simple web page/db with links. The data are always more important, code can be always build on top of them later.

geekyi

[23:29](#msg585478edaf6b364a29c11adb)@rebolek it's automating the collection of data I'm thinking of. I think it is orthogonal to having modules in red.  
Right now, code is in various places; in gists and github repos.  
Most of the useful info is (or should be) stored in the Red headers. But I don't know of any conventions or standards on this. I guess you can say I'm still a bit new.

[23:31](#msg58547944c02c1a3959788e6b)What I'm thinking is http://www.rebol.org/ for red, but decentralized (with a local cache)  
\[METADATA.jl](https://github.com/JuliaLang/METADATA.jl) for the Julia programming is a good example I think  
Basically, it's like a dump of RED\[] header data. But I guess much simpler in this case

[23:34](#msg58547a04058ca9673757cfe7)The basic structure is a folder with package name, url for updates and a folder for each version. Data in each version folder is just a list of dependencies and sha1. Such a file for red can include even more info

[23:42](#msg58547bfcc895451b75e68f5f)\*tl;dr* As an example, for the \[`Plots`](https://github.com/JuliaLang/METADATA.jl/tree/metadata-v2/Plots) package, the structure is:

```
Plots: [
  versions: [
    0.0.1: [
      requires: [dependencies list of packages]
      sha1
    ]
  ...
  ]
  url : git://github.com/tbreloff/Plots.jl.git
]
```

[23:49](#msg58547da2af6b364a29c12f39)Actually, I've only rarely used rebol.org; sometimes for searching. If it had a better interface like a package manager, I might use it more

rebolek

[23:52](#msg58547e36c02c1a395978a4ee)@geekyi header is probably the most underestimated thing

[23:53](#msg58547e6f058ca9673757e55a)it could be so powerful, when used correctly

geekyi

[23:54](#msg58547ebf058ca9673757e666)Indeed. If anyone has a workflow/standard for searching/building packages (especially on rebol.org) that would be very helpful for me

[23:55](#msg58547f07c895451b75e69c56)Rebol.org and github are the sites where I've found most of the code. So if I can search those 2, I guess that would give the majority of what I want

[23:56](#msg58547f47589f411830f4814b)If I have that, then I can build on that layer some other ideas I have

[23:58](#msg58547f9dc02c1a395978aa17)@rebolek can I put gritter as a the first test package? ;)

## Saturday 17th December, 2016

rebolek

[00:01](#msg5854806ee7bdfe4e2963b4cb)@geekyi of course! gritter is free to use, it would be public domain,if public domain was not banned in certain countries like germany

[00:07](#msg585481b8589f411830f48b49)but i recommend using the \*stylize* branch, that’s where the development is going on. let’s hope @dockimbel will accept `stylize` pull request soon, so i can merge the improvements into master

greggirwin

[17:30](#msg58557621c5a4e0233b98d5d4)@geekyi , the devil is in the details and the design. We probably all agree that it will be useful, and important, but someone either needs to make a well-thought-out proposal or wait for one. A long time ago, I did extensive research on various meta info and formats for projects, and still have my notes somewhere.

## Sunday 18th December, 2016

DideC

[14:13](#msg585699897a3f79ef5d6f7455)@geekyi for Rebol.org, \[the Librarian](http://www.rebol.org/download-librarian.r) is not far to be a package manager ;-)

## Monday 19th December, 2016

geekyi

[01:43](#msg58573b54c5a4e0233ba0519a)Thanks. That is awesome! I wish it cached the index instead of doing it every time I started it tho

[01:50](#msg58573ccbc895451b75f23b7b)Oh ok, I spoke too soon. It's a binary pack of all the scripts. Should have read the instructions properly too

## Tuesday 20th December, 2016

DideC

[09:33](#msg5858fad1c895451b75fb4af8)@geekyi Rebol scripts are so small, than it's more usefull to fully include them, than just an index. Bonus : work offline. And the full download is smaller than most of othe language package manager alone :-)

OneArb

[18:36](#msg58597a2ee7bdfe4e297ae9c2)Hi,

I am trying to get my first Red GUI script working.

I picked up simple-clock.red trying to do live coding with fields.

How to set facets to execute?  
`[(panel-background)]`

How to set fields to execute?  
I'd have expected `[ok]` to do something.

Is using `origin` optimal?

Can I define `ok:` and `panel-background:` within the react facet?

Thanks

```
Red [
]

ok: [ button 100x33 "Ok"]

field-demo: {
    
 text bold font-size 10 55x20 [(panel-background)]
	 center "Name"
 field 80x20 "Enter Name"

 origin 0x50
 Button 100x33 "Ok"

 origin 0x100
 text font-size 10 bold "Keep me"
 radio "Public"
 radio "Private"
}

system/view/silent?: yes

panel-background: maroon

view [
	title "Text entry"
	backdrop panel-background
	across
	
	source: area #13181E 410x300 no-border field-demo font [
		name: "Consolas"
		size: 9
		color: hex-to-rgb #9EBACB
	]
	
	panel 400x300 panel-background react [
		attempt/safer [face/pane: layout/tight/only load source/text]
	]
]
```

geekyi

[19:08](#msg585981bbc02c1a395990af5e)@OneArb so many questions! :p I think asking each on stackoverflow and linking here is better

greggirwin

[19:09](#msg585981cfe7bdfe4e297b1c28)@OneArb, I suggest building some simple GUIs that don't involve live coding if you're new to Red and it's GUI system. Can you build the GUI you want directly? I'm not sure what you mean by "set field/facet to execute", and `[ok]` isn't used anywhere that I see, so I'm not sure what you tried with it. Also not sure how `origin` can be optimal or not.

OneArb

[19:45](#msg58598a58c895451b75fea35f)Hi and thanks!

Live adding fields or screen composition is the specific feature I need and the reason I am considering Red.

`[ok]` won't display when added to `field-demo`

Is there a way to refresh the panel? When reducing the size of a button part of the resized button drawing remains on the screen.

In the same spirit I wrote the following code in Rebol which still runs in Red

```
Red[]

Result: "Test"

field1.Process: [
			alert join  "You typed: " 
			Result: field1/text
			]

field1.Initialize: [do [field1/text: Result]]

field1.Declare: compose/deep [
		field1: field
		[(field1.Process)]
		(field1.Initialize)
	]

block: 	compose [ 
			(field1.Declare)
			field
			field
		]

view layout (block)
```

Any solution?

Thanks

[19:55](#msg58598c9fe7bdfe4e297b576a)@geekyi I'll try that

geekyi

[19:56](#msg58598cfbc5a4e0233bacde59)@OneArb btw, I feel you are diving too fast into this. It's better to spend some time learning and reading a bit of rebol

OneArb

[20:10](#msg585990427a3f79ef5d7ee3fd) @greggirwin I like Red/Rebol ability to scafold code at run time.

When I include or type `[ok]` in `field-demo:` I expect the code `[ button 100x33 "Ok"]`to run and a new button with these facets to be displayed in `panel` due to the `react` function.

I ran into the same issue in Rebol. In

```
field1.Declare: compose/deep [
        field1: field
        [(field1.Process)]
        (field1.Initialize)
    ]
```

`[(field1.Process)]` works with brackets and parenthesis, `(field1.Initialize)`works fine with parenthesis only. I am trying to figure out the consistency of "code composition".

[21:08](#msg58599dbc0730ce6937eda157)Refresh fails with `panel-background: "#2C3339"` works with  
`panel-background:black`.

Opened a ticket.

greggirwin

[21:39](#msg5859a521058ca96737705505)Start by taking out the live-coding aspect, even if you want that eventually. Also take out reactivity. If you create a static layout using your definition for `ok` and making `field-demo` a block instead of a string you load, does it work how you expect?

`Origin` is not for positioning individual items. Use `at` for that. And you shouldn't need to set a precise offset for everything. Use `across` and `below`, `space` and let VID align things for you as much as possible.

OneArb

[22:06](#msg5859ab52e7bdfe4e297c24d9)@geekyi @greggirwin FYI The preceding code attempts to use Red/Rebol as a template language and manage code using code inserts, in particular segregate all data from the code.

HostileFork made extensive comments on it on Stackoverflow code review.

https://codereview.stackexchange.com/questions/53794/rebol-view-layout-compose-seek-minima-notation

I'll read it in more details. Boils down to writing my own compose function, if I get it right.

geekyi

[22:12](#msg5859acd7c02c1a395991d3d0)@OneArb wait, asked 2 years ago??

OneArb

[22:14](#msg5859ad59af6b364a29d94737)@geekyi what is your question?

geekyi

[22:16](#msg5859adc97a3f79ef5d7fb5c0)Oh, just didn't know you had asked the question a long time ago. The first thing I notice is your use of `.` , it probably doesn't work like you think. You may want `/` instead

greggirwin

[22:19](#msg5859ae5dc02c1a395991dc66)I think that's just @OneArb 's naming convention. Not path access.

OneArb

[22:19](#msg5859ae72e7bdfe4e297c41b6)@greggirwin correct

[22:20](#msg5859aea8e7bdfe4e297c4332)Good point `below`, now it comes back :)

geekyi

[22:23](#msg5859af530730ce6937ee2a8b)Yeah, looking at the code, I'm not exactly certain what you were trying to do there.. unusual naming convention kinda tripped me up :p

greggirwin

[22:23](#msg5859af64c02c1a395991e307)Me too.

geekyi

[22:25](#msg5859afce7a3f79ef5d7fc3cf)Possibly.. you want to compose Rebol code into the view dialect @OneArb ?

OneArb

[22:27](#msg5859b04baf6b364a29d95812)The GUI is still in Beta? below does not place the fields below

geekyi

[22:28](#msg5859b099e7bdfe4e297c4ed9)@OneArb I'm going to try to answer that question

greggirwin

[22:28](#msg5859b09fe7bdfe4e297c4ef1)It does: `view [below text "A" field text "B" field]`

OneArb

[22:30](#msg5859b0eac02c1a395991ec32)By the way the origin is simple-clock.red from http://www.red-lang.org/2016/07/eve-style-clock-demo-in-red-livecoded.html

[22:32](#msg5859b171c02c1a395991ef43)I'll try with a structure, good point.

[22:41](#msg5859b3a27a3f79ef5d7fda63) @greggirwin Thanks for the tips. I know where to look now.

I am trying to make a tiny editor wherein I can add fields live within the text.

The simple way is probably to update the structure then show rather than use react?

geekyi

[22:50](#msg5859b5ccaf6b364a29d973d8)@OneArb can you post :point\_up: \[this](https://gitter.im/red/help?at=58597a2ee7bdfe4e297ae9c2) also as a review question and link here?

OneArb

[22:53](#msg5859b6867a3f79ef5d7fe9b3)Sure. Since field-demo is a string it makes total sense that \[ok] the structure would not display?

[22:54](#msg5859b6b67a3f79ef5d7fea74)Ask a review question where?

geekyi

[23:03](#msg5859b8b2c895451b75ffb8f9)@OneArb same site as your other question

PeterWAWood

[23:19](#msg5859bc89e7bdfe4e297c8ce6)&gt; The GUI is still in Beta? below does not place the fields below

Red is still in Alpha? A Beta release is some way off.

## Wednesday 21st December, 2016

DideC

[16:56](#msg585ab42aaf6b364a29de774a)@OneArb Don't confused "livecoding" and "code generation". Especially in GUI domain.  
1\) "Livecoding" is for a quick and realtime prototyping of a GUI.  
2\) "Code generation" can be used for giving some dynamic behaviours to your GUI in the final program.

[17:01](#msg585ab556058ca967377623e4)1) "Livecoding" implies rebuilding all graphics objects from scratch at each modification of the VID code. So in an application, it can be problematic if your code refers to graphics objects (ie `my-field/text` or `my-list/data`) as contexts will be lost between each GUI rebuilt. You will need to always `reduce` or `compose` the code that acces these objects.  
It is good for prototyping the VID or Draw code that you will copy to your application script as a base for your application.

maximvl

[17:02](#msg585ab5a6058ca96737762627)but if you separate your data from gui it should be fine

greggirwin

[20:00](#msg585adf727a3f79ef5d862997)&gt; I am trying to make a tiny editor wherein I can add fields live within the text.

@OneArb, being able to generate a GUI from a fixed spec is easy with Red, as the live-coding demos show but, as Didier points out, there are a lot of details that may not work as expected. It makes perfect sense that `[ok]` will not work as expected inside a string in your live-coding example. \*Why* it doesn't work is the reason we suggest building simpler things first, and getting more familiar with when/where/how things are evaluated.

OneArb

[23:43](#msg585b1387e7bdfe4e2983871c)@DideC Two livecoding / dynamic screen use-case:

IDE:

I develop using code generation aka template programming since the early 90's.

Positioning fields and other faces by hand (mouse) took me a great amount of time. Once RAD scaffold code, screen design became for certain projects the next bottleneck.

Run time field generation was an option but annoying to manage.

Placing faces on the screen in a livecode setting, I look forward.  
I find it intuitive fast and fun, especially when I can develop my own  
set of face / facets structure.

Runtime screen customize:

Stakeholders would love reorder field position, sequence order  
to match their own workflow/taste? Can Red offer a dynamic experience?

What stands in the way of a persistent context?

## Thursday 22nd December, 2016

OneArb

[00:01](#msg585b17d8c02c1a395999a3df)@maximvl Segregate data is the explore aim of the posted code.

I prefer data, including field description face/facet to be stored managed in a dictionary. A feature that buys WinDev and Clarion data engine independence.

Clarion, last I know, uses a two step generation process:  
template language process application description, turns it into code to compile.

Red/Rebol can use a single language.

[00:04](#msg585b18aae7bdfe4e2983a2f3)@greggirwin I did backtrack to get the dynamic face to work. Follows the fixed code. Add `compose/deep` before `load` and use `(ok)`

```
Red []

ok: [ Button 100x33 "Ok"]

field-demo: {
    
 text maroon yellow bold font-size 10 55x20
    center "Name"

 field 80x20

 origin 0x50
 (ok)
}
 
system/view/silent?: yes

panel-background: black

view [
	title "my text entry"
	backdrop black
	across
  
	source: area #13181E 410x300 no-border field-demo font [
		name: "Consolas"
		size: 9
		color: hex-to-rgb #9EBACB
	]
	
	panel 400x300 panel-background react [
		attempt/safer [face/pane: layout/tight/only compose/deep load source/text]
	]
]
```

[00:15](#msg585b1b397a3f79ef5d878554)@maximvl Segregate data is the explore aim of the posted code.

```
field1: field
        [(field1.Process)]
        (field1.Initialize)
```

field description face/facet feeds from a data dictionary. That feature buys WinDev and Clarion data engine independence.

Clarion, last I know, uses a two step generation process:  
template language processes application description (data dictionary, screen design, business code), churns it into code to compile.

geekyi

[01:26](#msg585b2bc0c5a4e0233bb5e533)@OneArb "Talk in forth, you are" -yoda ;P

[01:26](#msg585b2be2058ca96737789d42)Did you see my answer to your previous \[question](https://codereview.stackexchange.com/questions/53794/rebol-view-layout-compose-seek-minima-notation)?

[01:27](#msg585b2c0de7bdfe4e2983f071)I'm wondering if it helped

OneArb

[17:07](#msg585c086bc895451b750c2970)@geekyi Forth can seep-into natural language, at times, clarify!

Thanks for \[in-depth code review] (https://codereview.stackexchange.com/questions/53794/rebol-view-layout-compose-seek-minima-notation)

The lines between self-documenting code, documentation and screen description remain to be explored.

IDE can feed screen design data and code into your final version code generator example.

Red/Rebol would make a great template language.

I like debug looking at generated code. Editor can feedback code modify into IDE.

I need some time to look into the use case.

greggirwin

[17:25](#msg585c0c77058ca967377d47b7)Good progress. I believe Red will let you do everything you want. It's just a matter of design now. :^)

## Saturday 24th December, 2016

GianlucaM95\_twitter

[10:05](#msg585e4852c895451b7516c1e1)Hi everyone! I'm new to Red, I started writing some code on Fedora 23 and everything worked fine, but on Void Linux 64 bit I get this error when I run ./red-061 : symbol lookup error: ~/.red/console-2016-6-30-23134: undefined symbol: dlopen. Am I missing some dependency? glibc-devel-32bit is installed. In my filesystem I have both /usr/include/bits/dlfcn.h and /usr/include/dlfcn.h

rebolek

[10:19](#msg585e4ba9d99b1dd03d2df0a0)Ho @GianlucaM95\_twitter ! check if you have all the required 32bit libs, the list is here: http://www.red-lang.org/p/download.html

## Sunday 25th December, 2016

OneArb

[00:22](#msg585f115fe7bdfe4e2995a4c1)Where would I find a VID handler example?

I couldn't find any within VID doc and Github Scripts / showcase.

dander

[07:48](#msg585f79b1058ca967378bfdb9)@OneArb have you seen https://github.com/red/red/blob/master/tests/view-test.red ? It might have some examples that you are looking for.

geekyi

[07:48](#msg585f79dbc895451b751b2c84)@OneArb not sure what you mean by VID \*handler*

OneArb

[15:44](#msg585fe95d7a3f79ef5d9d3f62)@geekyi I picked that speak from the doc:

\*Event type* click  
\*Handler* `on-click`  
\*Description* Triggered when the user clicks on the button

VID facet handler works for you?

[16:53](#msg585ff9807a3f79ef5d9d7fda)@dander Somewhat

I got as far as `field field-data on-enter [field-data: face/text]`

What about moving the focus to the next field or face on hitting Enter?

Since I want my default behavior to be `on-enter [field-data: face/text]` how can I avoid repeat that code for each field?

[17:11](#msg585ffdb6af6b364a29f5c581)I'd love to see a basic data processing example showing how all the pieces tie in together.

Within VID Field documentation how would Red describe `field-data` role within `field field-data on-enter [field-data: face/text]`?

face/text?

9214

[17:14](#msg585ffe89af6b364a29f5c8ee)@OneArb I think `field-data` is text which will be displayed in text field by default, and after you've entered something in that text field and clicked enter, this text will be saved in `field-data`, though I may be wrong since I haven't test it

OneArb

[17:21](#msg58600005058ca967378dcd51)@9214 Reading the VID documentation, I'd conclude `field` in VID DSL expects a word! as `face/text` from reading `face/text` description "Input text, read/write value."?

9214

[17:22](#msg5860003fc895451b751d1747)@OneArb that what I think too

OneArb

[17:27](#msg5860017cc02c1a3959afc899)@9214 Would string! symbol be an accurate `face/text` description?

## Monday 26th December, 2016

endo64

[07:43](#msg5860ca1e7a3f79ef5da0657c)&gt; Since I want my default behavior to be on-enter \[field-data: face/text] how can I avoid repeat that code for each field?

You can use `style` for that:

```
view [
  style my-field: field red on-enter [probe face/text]
  my-field
  my-field
  my-field
]
```

theopen-institute

[10:49](#msg5860f5b1af6b364a29f93d3a)Hello, I'm getting unexpected (to me) results with `random`.

```
test_random: function [iterations][
	count: 0
	loop iterations [
		if random 1.0 < .20 [count: count + 1]
	]
	print to percent! (to float! count / to float! iterations) 
]
```

I would expect outputs to cluster around 20%, but no matter what value I use for `iterations` I get what looks like a normal distribution centered on 50%. What am I doing wrong?

maximvl

[11:02](#msg5860f8bcc02c1a3959b350af)@theopen-institute Hi and welcome, the problem in your code is that you calculate random boolean =)

[11:02](#msg5860f8c2058ca967379142ce)

```
red>> random 1.0 < .2
== false
red>> random 1.0 < .2
== false
red>> random 1.0 < .2
== true
```

[11:03](#msg5860f8ed7a3f79ef5da10caa)so Red first calculates `<` and then random

[11:03](#msg5860f8fe058ca967379143a7)that's why you get exactly 50%

theopen-institute

[11:03](#msg5860f90bc895451b7520947d)oh wow. silly mistake. Thanks!

maximvl

[11:04](#msg5860f923c02c1a3959b35769)the fix coud be `if (random 1.0) < .20 [count: count + 1]`

[11:04](#msg5860f930c5a4e0233bcefa37)which gives exactly 20% =)

theopen-institute

[11:04](#msg5860f957c895451b752095ee)indeed it does! thanks Maxim

maximvl

[11:05](#msg5860f9690730ce69370ebf21)general rule as with other languages - use parens if you are not sure about execution order

[11:05](#msg5860f97f0730ce69370ebfdd)or try in repl to find out what happens

[16:29](#msg58614582c895451b7521e302)btw for me this is counter intuitive:

```
red>> random true
== true
red>> random true
== false
```

[16:30](#msg586145afc5a4e0233bd038fe)don't you think it would be better to allow datatypes for random? like

```
red>> random logic!
*** Script Error: random does not allow datatype! for its value argument
*** Where: random
```

rebolek

[16:34](#msg5861469261e516c1578f0a73)It makes sense for `logic!` that has two values, but what would i.e. `random email!` do?

maximvl

[16:35](#msg586146d9058ca9673792a067)well, it may make random email address, why not

[16:36](#msg586146f1e7bdfe4e299d6dab)it makes sense for test purposes

[16:36](#msg586146f4058ca9673792a0b0)at least

[16:37](#msg5861472f7a3f79ef5da2646b)as well as other datatypes: percent, issues, dates etc

[16:38](#msg58614768058ca9673792a36f)in Julia language random method has type `Datatype! => A (Datatype!)`

[16:38](#msg58614792af6b364a29fa8f14)so if you want random number you do `random(Int64)`, random date - `random(Date)`

[16:39](#msg586147b0c02c1a3959b4b89e)and you can add your own of course

greggirwin

[17:34](#msg586154a3e7bdfe4e299da5a6)The help string makes it sound like it could be extended. Each type just needs to be updated. I've always written my own random data generators, and think a dialect for doing so would be the way to go there, so you can specify constraints and such.

OneArb

[17:44](#msg58615715e7bdfe4e299db109)@endo64 Great got that!

[17:50](#msg586158707a3f79ef5da2b38b)How can I get text-list to refresh once its underlying block as been changed?

I tried `show`. For now updating the block causes text-list to remove the changed line from text-list facet.

```
lines: 10
i: 0
block: []

repeat i lines [
  append block append copy "line" i
  ]

text-list-selected: 2

view [  
  below
  field on-enter [ 
    poke block text-list-selected face/data
    probe block
    show tl
  ]
  
  tl: text-list data block
    on-create 
      [ face/selected: text-list-selected ]
    on-change
      [ text-list-selected: face/selected 
        print text-list-selected
      ]
            
  button "Quit" on-click [quit]
]
```

maximvl

[19:24](#msg58616e53e7bdfe4e299e1da1)@greggirwin  
&gt;think a dialect for doing so would be the way to go there

I think `random` can become that dialect =)

greggirwin

[19:25](#msg58616ec67a3f79ef5da3268b)Except that `random` on a block! would require a refinement or something, to distinguish it from returning a randomized block.

geekyi

[22:06](#msg58619477c02c1a3959b620ad)@maximvl @greggirwin I'd always thought a `generate` function which operates only on `datatype!`s would be useful as an inverse to `parse`

[22:08](#msg586194d40730ce6937117fc4)Then you would have `generate: func [ /random /limits /others] [...]`

[22:08](#msg586194dec895451b752379db)Would be useful for testing

[22:09](#msg5861950bc895451b75237a90)It would work somewhat like the quickcheck family of testing (smallcheck, parsecheck)

[22:09](#msg58619528c5a4e0233bd1da74)It was an idea I had as part of a versatile `test` function

greggirwin

[23:33](#msg5861a8d2c02c1a3959b6716c)`Generate`. Good name @geekyi.

## Thursday 29th December, 2016

maximvl

[20:33](#msg5865732bc02c1a3959c7c2ce)@dockimbel ok, I simplified it a lot, I replaced panel with `image`, I removed generation of code and blocks allocation, now it just assigns to image directly, I turned off auto-sync

[20:33](#msg586573319d4cc4fc5355a2b0)https://gist.github.com/maximvl/81f31f26b49a7a3a5891b9a63f47171a

[20:34](#msg586573560730ce6937236a4f)typing is still quite slow, though image doesn't blink anymore :)

[20:37](#msg586573f49e6f00e74ad6d271)@dockimbel is there anything else I can do before trying R/S? how can I move only the generation part to R/S?

## Friday 30th December, 2016

9214

[15:20](#msg58667b44058ca96737aa79a7)@maximvl :clap:

geekyi

[16:07](#msg586686467a3f79ef5dba35e1)@maximvl wip?

maximvl

[16:10](#msg586686e3c895451b753940c3)@geekyi ?

geekyi

[16:10](#msg586686fcc02c1a3959cc44eb)I'm not sure if it works for me

[16:10](#msg58668711058ca96737aab75b)wip aka.. "work in progress?"

[16:11](#msg586687277a3f79ef5dba3a0b)may need to update red.. running it in the interpreter btw

maximvl

[16:11](#msg5866874e9d4cc4fc535a4ee5)yes, this is the gui part, I still need to add Forth interpreter there

[16:12](#msg58668763058ca96737aab95b)for now I'm trying to make it less laggy

geekyi

[16:13](#msg5866879faf6b364a2911a3a7)\[!\[image.png](https://files.gitter.im/red/help/mRnF/thumb/image.png)](https://files.gitter.im/red/help/mRnF/image.png)

maximvl

[16:13](#msg586687a70730ce69372821bb)yep, this is it :)

[16:15](#msg586688060730ce693728239e)@geekyi if you go here:  
http://forthsalon.appspot.com/haiku-editor  
enter `0.5` and press two arrows button you will see

geekyi

[16:15](#msg5866883fc02c1a3959cc507b)@maximvl Yeah, I was checking it out and trying to figure out how it works

[16:16](#msg5866885baf6b364a2911a5fe)Wasn't sure if your version was supposed to run red or forth

maximvl

[16:16](#msg5866886aaf6b364a2911a655)basically it runs your Forth code for each pixel and the output is 4 numbers which result color code for this pixel

[16:17](#msg586688a00730ce69372826a5)so you can get coordinates and use conditionals to draw something

[16:17](#msg586688a7af6b364a2911a74a)try just `x y`

[16:18](#msg586688c47a3f79ef5dba41a3)@geekyi I want to make version with Forth to explore and practice `parse`

[16:18](#msg586688d0c895451b753948fc)I want exact same copy

geekyi

[16:18](#msg586688e5c895451b75394939)Ah, like \[shader toy](https://www.shadertoy.com/) but simpler

maximvl

[16:19](#msg586689090730ce6937282b65)@geekyi here are couple examples of it: http://forthsalon.appspot.com/haiku-list?order=rank

[16:20](#msg586689369e6f00e74adb54a1)you can also do animations and different stuff

geekyi

[16:20](#msg58668959c895451b75394b86)and audio too?

[16:22](#msg586689bbaf6b364a2911ac6f)wasn't immediately apparent to me how it worked until :point\_up: \[December 30, 2016 9:16 PM](https://gitter.im/red/help?at=5866886aaf6b364a2911a655)

maximvl

[16:23](#msg58668a0b9e6f00e74adb5915)@geekyi there is `audio` word, so probably yes :)  
http://forthsalon.appspot.com/word-view/617564696F

[16:29](#msg58668b5ec02c1a3959cc614e)@geekyi shader toy hangs my browser =\\

geekyi

[16:29](#msg58668b7e9e6f00e74adb5f99):point\_left: \[December 28, 2016 10:08 PM](https://gitter.im/red/red?at=5863f17fc02c1a3959c0b4cd) so this is where it started

maximvl

[16:31](#msg58668be09e6f00e74adb6138)oh, yes, I decided to move discussion here, I think this channel is more appropriate

geekyi

[16:32](#msg58668c1daf6b364a2911b67d)yep, it is the best place for it, I'm just concerned the flow of the conversation getting lost, so just documenting it ;p

[16:38](#msg58668d740730ce69372844f9)&gt; @geekyi shader toy hangs my browser =\\

yeah, it's pretty processor intensive, the idea is basically the same, but using gpu shaders

[16:48](#msg58668fd09d4cc4fc535a7ab5)\[hacker news haiku thread](https://news.ycombinator.com/item?id=8307717)

[16:51](#msg58669088058ca96737aae824)\[audio](http://forthsalon.appspot.com/haiku-view/ahBzfmZvcnRoc2Fsb24taHJkchILEgVIYWlrdRiAgIDA2aiACgw):

```
: hz pi * 2 * t * sin ;
440 hz
audio
```

maximvl

[16:53](#msg586690f09e6f00e74adb7bba)cool, maybe we should also go to HN once Red version is complete ;)

geekyi

[16:59](#msg586692557a3f79ef5dba76c6):+1:

[16:59](#msg58669276af6b364a2911db51)\[mouse test](http://forthsalon.appspot.com/haiku-view/ahBzfmZvcnRoc2Fsb24taHJkchILEgVIYWlrdRiAgIDAq5yeCgw) even works as a thumbnail on the home page!

[17:32](#msg58669a390730ce6937288a9b)(btw, audio doesn't seem to be supported on firefox)

[17:34](#msg58669aa27a3f79ef5dbaa545)and this is where I miss factor's functions for collections and high-level programming

greggirwin

[21:36](#msg5866d3757a3f79ef5dbbbbcf)Any examples of things you miss @geekyi ?

geekyi

[21:38](#msg5866d3cbaf6b364a29130e36)@greggirwin do you remember `fry`?

[21:38](#msg5866d3e40730ce693729a82a)Things in `factor` missing in `forth` actually

## Saturday 31st December, 2016

maximvl

[14:53](#msg5867c666c895451b753e2141)there is something strange in `bind` + `reduce` combination:

```
red>> f1: func [x y block /local z] [bind block 'z]
== func [x y block /local z][bind block 'z]
red>> f1 1 2 [x y h]
== [x y h]
red>> reduce f1 1 2 [x y h]
*** Script Error: y is not in the specified context
*** Where: reduce
```

[14:54](#msg5867c6a5c02c1a3959d12270)why does it say `y` is not in the context?

[14:55](#msg5867c6d4c895451b753e2311)oh, context got destroyed after `func` finishes

[17:01](#msg5867e45e9e6f00e74ae09c50)I started with few simple things in mind, but now I'm already finishing 3rd DSL

[17:01](#msg5867e4629e6f00e74ae09c58)Red is something

[18:47](#msg5867fd269e6f00e74ae10024)Added forth interpreter and testing framework:  
https://gist.github.com/maximvl/81f31f26b49a7a3a5891b9a63f47171a

[18:51](#msg5867fe15c895451b753f0a80)Interesting thing is that I can run this script, but can't compile it

[18:51](#msg5867fe2faf6b364a29176aec)

```
-=== Red Compiler 0.6.1 ===- 

Compiling Z:\home\maxvel\rebol\gui\test.red ...
Compiling libRedRT...
...compilation time : 1877 ms

Compiling to native code...
...compilation time : 52844 ms
...linking time     : 898 ms
...output file size : 792576 bytes
...output file      : Z:\home\maxvel\rebol\libRedRT.dll 

*** Syntax Error: Missing matching ]
*** line: 348
*** at: {[
   stack: copy []
   words: [
      ; }
```

[19:08](#msg5868023a058ca96737b0c77b)@greggirwin now it's much more than 100 lines :)
